import { EmbeddingRepository } from '../repositories/EmbeddingRepository.js'
import { UserRepository } from '../repositories/UserRepository.js'
import { ProductRepository } from '../repositories/ProductRepository.js'
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
            weights: { category: 0.4, color: 0.3, price: 0.2, age: 0.1 }
        }
        this.vectorService.buildIndexes(categories, colors)

        return this.context
    }

    async getRecommendations (userId, limit = 40) {
        await this.initContext()

        const user = await this.userRepo.getUserById(userId)
        if (!user) throw new Error(`User ${userId} not found`)

        const purchasedProductIds = user.purchases.map(p => p.id)

        if (user.purchases.length === 0) {
            return this.getPopularProducts(limit)
        }

        const userEmbedding = this.vectorService.encodeUser(user, this.context)
        const similarProducts = await this.embeddingRepo.getSimilarProducts(
            userEmbedding,
            Math.min(limit * 2, 50),  // Limitar busca
            purchasedProductIds
        )

        let recommendations = similarProducts
            .filter(p => p.similarity && p.similarity > 0.2)  // Similaridade mínima mais baixa
            .slice(0, limit)

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
            score: rec.similarity || 0.5
        }))
    }

    async getPopularProducts (limit = 10) {
        // Vetor neutro para buscar produtos populares
        const neutralVector = new Array(this.vectorService.dimensions).fill(0.5)
        const result = await this.embeddingRepo.getSimilarProducts(neutralVector, limit)
        return result
    }

    async hybridRecommendation (userId, limit = 10) {
        await this.initContext()

        const user = await this.userRepo.getUserById(userId)

        if (!user || user.purchases.length === 0) {
            return this.getPopularProducts(limit)
        }

        const categoryCount = {}
        user.purchases.forEach(purchase => {
            categoryCount[purchase.category] = (categoryCount[purchase.category] || 0) + 1
        })

        const topCategory = Object.entries(categoryCount)
            .sort((a, b) => b[1] - a[1])[0]?.[0]

        const allProducts = await this.productRepo.getAllProducts()
        let recommendations = []

        if (topCategory) {
            recommendations = allProducts
                .filter(p => p.category === topCategory && !user.purchases.some(up => up.id === p.id))
                .slice(0, limit)
        }

        if (recommendations.length < limit) {
            const userEmbedding = this.vectorService.encodeUser(user, this.context)
            const similar = await this.embeddingRepo.getSimilarProducts(
                userEmbedding,
                Math.min(limit * 2, 50),
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