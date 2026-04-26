// backend/services/VectorService.js
import * as tf from '@tensorflow/tfjs-node'

export class VectorService {
    constructor (config) {
        this.config = config
        this.categoriesIndex = {}
        this.colorsIndex = {}
        this.numCategories = 0
        this.numColors = 0
        this.dimensions = 128 // Dimensão do embedding final
    }

    buildIndexes (categories, colors) {
        this.categoriesIndex = Object.fromEntries(
            categories.map((cat, index) => [cat, index])
        )
        this.colorsIndex = Object.fromEntries(
            colors.map((color, index) => [color, index])
        )
        this.numCategories = categories.length
        this.numColors = colors.length

        // Dimensões: preço(1) + idade(1) + one-hot categoria(N) + one-hot cor(M)
        // Mas vamos criar um embedding de tamanho fixo via camada densa
        this.featureDimensions = 2 + this.numCategories + this.numColors
    }

    normalize (value, min, max) {
        if (min === max) return 0.5
        return (value - min) / (max - min)
    }

    oneHot (index, length) {
        const arr = new Array(length).fill(0)
        arr[index] = 1
        return arr
    }

    oneHotWeighted (index, length, weight) {
        const arr = new Array(length).fill(0)
        arr[index] = weight
        return arr
    }

    encodeProduct (product, context) {
        const normalizedPrice = this.normalize(
            product.price,
            context.minPrice,
            context.maxPrice
        ) * context.weights.price

        const normalizedAge = (context.productAvgAge[product.name] ?? 0.5) * context.weights.age

        const categoryEncoding = this.oneHotWeighted(
            this.categoriesIndex[product.category],
            this.numCategories,
            context.weights.category
        )

        const colorEncoding = this.oneHotWeighted(
            this.colorsIndex[product.color],
            this.numColors,
            context.weights.color
        )

        // Vector completo para o modelo (usado no treinamento)
        const fullVector = [normalizedPrice, normalizedAge, ...categoryEncoding, ...colorEncoding]

        // Embedding para pgvector (pode ser uma versão reduzida ou transformada)
        // Aqui vamos usar um embedding de dimensão fixa
        return this.reduceToDimension(fullVector, this.dimensions)
    }

    reduceToDimension (vector, targetDim) {
        if (vector.length === targetDim) return vector

        // Pooling simples para reduzir dimensão
        const ratio = vector.length / targetDim
        const result = []
        for (let i = 0; i < targetDim; i++) {
            const start = Math.floor(i * ratio)
            const end = Math.floor((i + 1) * ratio)
            let sum = 0
            for (let j = start; j < end && j < vector.length; j++) {
                sum += vector[j]
            }
            result.push(sum / (end - start))
        }
        return result
    }

    encodeUser (user, context) {
        if (user.purchases && user.purchases.length > 0) {
            const purchaseVectors = user.purchases.map(product =>
                this.encodeProduct(product, context)
            )

            // Média dos embeddings das compras
            const avgEmbedding = new Array(this.dimensions).fill(0)
            purchaseVectors.forEach(vec => {
                for (let i = 0; i < this.dimensions; i++) {
                    avgEmbedding[i] += vec[i]
                }
            })
            for (let i = 0; i < this.dimensions; i++) {
                avgEmbedding[i] /= purchaseVectors.length
            }
            return avgEmbedding
        }

        // Usuário sem compras - baseado apenas na idade normalizada
        const normalizedAge = this.normalize(user.age, context.minAge, context.maxAge)
        const embedding = new Array(this.dimensions).fill(0)
        embedding[0] = normalizedAge
        return embedding
    }

    computeProductAvgAge (users, products) {
        const ageSums = {}
        const ageCounts = {}

        users.forEach(user => {
            user.purchases.forEach(purchase => {
                const product = products.find(p => p.id === purchase.id)
                if (product) {
                    ageSums[product.name] = (ageSums[product.name] || 0) + user.age
                    ageCounts[product.name] = (ageCounts[product.name] || 0) + 1
                }
            })
        })

        const productAvgAge = {}
        products.forEach(product => {
            productAvgAge[product.name] = ageSums[product.name]
                ? ageSums[product.name] / ageCounts[product.name]
                : (context?.minAge + context?.maxAge) / 2
        })

        return productAvgAge
    }

    createTrainingVectors (users, products, context) {
        const inputs = []
        const labels = []

        users.forEach(user => {
            if (!user.purchases || user.purchases.length === 0) return

            const userEmbedding = this.encodeUser(user, context)

            products.forEach(product => {
                const productEmbedding = this.encodeProduct(product, context)
                const combinedVector = [...userEmbedding, ...productEmbedding]

                const label = user.purchases.some(p => p.id === product.id) ? 1 : 0

                inputs.push(combinedVector)
                labels.push(label)
            })
        })

        return {
            xs: tf.tensor2d(inputs),
            ys: tf.tensor2d(labels, [labels.length, 1]),
            inputDimensions: this.dimensions * 2
        }
    }
}