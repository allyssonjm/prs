// backend/services/RecommendationService.js
import { EmbeddingRepository } from '../database/repositories/EmbeddingRepository.js'
import { UserRepository } from '../database/repositories/UserRepository.js'
import { ProductRepository } from '../database/repositories/ProductRepository.js'
import { VectorService } from './VectorService.js'

export class RecommendationService {
    constructor () {
        this.embeddingRepo = new EmbeddingRepository()
        this.userRepo = new UserRepository()
        this.productRepo = new ProductRepository()
        this.vectorService = new VectorService()
        this.context = null
    }

    async initContext () {
        if (this.context) return this.context

        const categories = await this.productRepo.getProductCategories()
        const colors = await this.productRepo.getProductColors()
        const priceRange = await this.productRepo.getPriceRange()
        const ageRange = await this.userRepo.getAgeRange()

        this.context = {
            categories,
            colors,
            minPrice: priceRange.min,
            maxPrice: priceRange.max,
            minAge: ageRange.min,
            maxAge: ageRange.max,
            weights: {
                category: 0.4,
                color: 0.3,
                price: 0.2,
                age: 0.1
            }
        }

        this.vectorService.buildIndexes(categories, colors)

        return this.context
    }

    async getRecommendations (userId, limit = 10) {
        await this.initContext()

        // Buscar usuário atualizado (com compras recentes)
        const user = await this.userRepo.getUserById(userId)
        if (!user) {
            throw new Error(`User ${userId} not found`)
        }

        // Obter IDs de produtos já comprados para excluir das recomendações
        const purchasedProductIds = user.purchases.map(p => p.id)

        if (user.purchases.length === 0) {
            // Usuário sem histórico - recomendar produtos populares
            return this.getPopularProducts(limit)
        }

        // Gerar embedding do usuário baseado no histórico de compras
        const userEmbedding = this.vectorService.encodeUser(user, this.context)

        // Buscar produtos similares via pgvector
        const similarProducts = await this.embeddingRepo.getSimilarProducts(
            userEmbedding,
            limit * 2, // Buscar mais para filtrar
            purchasedProductIds
        )

        // Filtrar e ordenar
        let recommendations = similarProducts
            .filter(p => p.similarity > 0.3) // Similaridade mínima
            .slice(0, limit)

        // Se não houver recomendações suficientes, completar com produtos populares
        if (recommendations.length < limit) {
            const popular = await this.getPopularProducts(limit - recommendations.length)
            recommendations = [...recommendations, ...popular]
        }

        return recommendations.map(rec => ({
            id: rec.id,
            name: rec.name,
            category: rec.category,
            price: parseFloat(rec.price),
            color: rec.color,
            brand: rec.brand,
            score: rec.similarity
        }))
    }

    async getPopularProducts (limit = 10) {
        const result = await this.embeddingRepo.getSimilarProducts(
            new Array(this.vectorService.dimensions).fill(0.5), // Vetor neutro
            limit
        )
        return result
    }

    async hybridRecommendation (userId, limit = 10) {
        const user = await this.userRepo.getUserById(userId)

        if (!user || user.purchases.length === 0) {
            return this.getPopularProducts(limit)
        }

        // Análise de categorias preferidas
        const categoryCount = {}
        const colorCount = {}

        user.purchases.forEach(purchase => {
            categoryCount[purchase.category] = (categoryCount[purchase.category] || 0) + 1
            colorCount[purchase.color] = (colorCount[purchase.color] || 0) + 1
        })

        // Categoria preferida
        const topCategory = Object.entries(categoryCount)
            .sort((a, b) => b[1] - a[1])[0]?.[0]

        // Buscar produtos da categoria preferida
        const allProducts = await this.productRepo.getAllProducts()
        let recommendations = []

        if (topCategory) {
            recommendations = allProducts
                .filter(p => p.category === topCategory && !user.purchases.some(up => up.id === p.id))
                .slice(0, limit)
        }

        // Se não houver suficientes, completar com base em similaridade de embedding
        if (recommendations.length < limit) {
            const userEmbedding = this.vectorService.encodeUser(user, this.context)
            const similar = await this.embeddingRepo.getSimilarProducts(
                userEmbedding,
                limit,
                user.purchases.map(p => p.id)
            )

            const existingIds = new Set(recommendations.map(r => r.id))
            for (const prod of similar) {
                if (!existingIds.has(prod.id) && recommendations.length < limit) {
                    recommendations.push({
                        id: prod.id,
                        name: prod.name,
                        category: prod.category,
                        price: parseFloat(prod.price),
                        color: prod.color,
                        brand: prod.brand,
                        score: prod.similarity
                    })
                    existingIds.add(prod.id)
                }
            }
        }

        return recommendations
    }
}