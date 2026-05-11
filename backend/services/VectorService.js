import * as tf from '@tensorflow/tfjs-node-gpu'

export class VectorService {
    constructor () {
        this.categoriesIndex = {}
        this.colorsIndex = {}
        this.numCategories = 0
        this.numColors = 0
        this.dimensions = 128 // Voltar para 128 para consistência com o banco
        this.context = null
        this.weights = { category: 0.4, color: 0.3, price: 0.2, age: 0.1 }
    }

    buildIndexes (categories, colors) {
        this.categoriesIndex = Object.fromEntries(categories.map((cat, index) => [cat, index]))
        this.colorsIndex = Object.fromEntries(colors.map((color, index) => [color, index]))
        this.numCategories = Math.max(categories.length, 1)
        this.numColors = Math.max(colors.length, 1)
        this.featureDimensions = 2 + this.numCategories + this.numColors
    }

    normalize (value, min, max) {
        if (min === max) return 0.5
        if (isNaN(value) || value === null || value === undefined) return 0.5
        const normalized = (value - min) / (max - min)
        return Math.max(0, Math.min(1, normalized))
    }

    oneHotWeighted (index, length, weight) {
        const arr = new Array(length).fill(0)
        if (index >= 0 && index < length) {
            arr[index] = Math.max(0, Math.min(1, weight))
        }
        return arr
    }

    encodeProduct (product, context) {
        // Garantir que product tem todas as propriedades necessárias
        const price = product.price || 0
        const normalizedPrice = this.normalize(price, context.minPrice, context.maxPrice) * this.weights.price

        const avgAge = context.productAvgAge?.[product.name] ?? 0.5
        const normalizedAge = Math.max(0, Math.min(1, avgAge)) * this.weights.age

        // One-hot com verificação de índice
        const categoryIndex = this.categoriesIndex[product.category] ?? 0
        const categoryEncoding = this.oneHotWeighted(categoryIndex, this.numCategories, this.weights.category)

        const colorIndex = this.colorsIndex[product.color] ?? 0
        const colorEncoding = this.oneHotWeighted(colorIndex, this.numColors, this.weights.color)

        // Construir vetor completo
        const fullVector = [normalizedPrice, normalizedAge, ...categoryEncoding, ...colorEncoding]

        // Verificar e corrigir NaNs
        const cleanVector = fullVector.map(v => {
            if (isNaN(v) || !isFinite(v)) return 0
            return Math.max(0, Math.min(1, v))
        })

        // Reduzir ou expandir para a dimensão alvo (128)
        return this.adjustToDimension(cleanVector, this.dimensions)
    }

    adjustToDimension (vector, targetDim) {
        if (vector.length === 0) {
            // Retornar vetor zerado se entrada vazia
            return new Array(targetDim).fill(0)
        }

        if (vector.length === targetDim) return vector

        if (vector.length > targetDim) {
            // Reduzir dimensão: fazer pooling
            const ratio = vector.length / targetDim
            const result = []
            for (let i = 0; i < targetDim; i++) {
                const start = Math.floor(i * ratio)
                const end = Math.floor((i + 1) * ratio)
                let sum = 0
                let count = 0
                for (let j = start; j < end && j < vector.length; j++) {
                    const val = vector[j]
                    if (!isNaN(val) && isFinite(val)) {
                        sum += val
                        count++
                    }
                }
                const avg = count > 0 ? sum / count : 0
                result.push(Math.max(0, Math.min(1, avg)))
            }
            return result
        } else {
            // Expandir dimensão: preencher com zeros
            const result = [...vector]
            while (result.length < targetDim) {
                result.push(0)
            }
            return result
        }
    }

    encodeUser (user, context) {
        // Verificar se usuário tem compras
        if (user.purchases && user.purchases.length > 0) {
            const purchaseVectors = []

            for (const product of user.purchases) {
                // Garantir que o produto tem todas as propriedades
                const enrichedProduct = {
                    id: product.id,
                    name: product.name,
                    category: product.category || 'outros',
                    price: product.price || 0,
                    color: product.color || 'outros'
                }
                const vec = this.encodeProduct(enrichedProduct, context)
                purchaseVectors.push(vec)
            }

            if (purchaseVectors.length > 0) {
                // Média dos embeddings das compras
                const avgEmbedding = new Array(this.dimensions).fill(0)
                for (const vec of purchaseVectors) {
                    for (let i = 0; i < this.dimensions; i++) {
                        avgEmbedding[i] += vec[i]
                    }
                }
                for (let i = 0; i < this.dimensions; i++) {
                    avgEmbedding[i] = avgEmbedding[i] / purchaseVectors.length
                    if (isNaN(avgEmbedding[i]) || !isFinite(avgEmbedding[i])) {
                        avgEmbedding[i] = 0
                    }
                }
                return avgEmbedding
            }
        }

        // Usuário sem compras - baseado apenas na idade normalizada
        const normalizedAge = this.normalize(user.age || 25, context.minAge, context.maxAge)
        const embedding = new Array(this.dimensions).fill(0)
        // Colocar a idade normalizada nas primeiras posições
        embedding[0] = Math.max(0, Math.min(1, normalizedAge))
        embedding[1] = 0.5 // Valor neutro para segunda posição

        return embedding
    }

    createTrainingVectors (users, products, context) {
        const inputs = []
        const labels = []

        // Filtrar apenas usuários com compras
        const usersWithPurchases = users.filter(u => u.purchases && u.purchases.length > 0)

        console.log(`Creating training vectors for ${usersWithPurchases.length} users and ${products.length} products`)

        let validPairs = 0

        for (const user of usersWithPurchases) {
            const userEmbedding = this.encodeUser(user, context)

            for (const product of products) {
                const productEmbedding = this.encodeProduct(product, context)
                const combinedVector = [...userEmbedding, ...productEmbedding]

                // Verificar se o vetor combinado não contém NaN
                const hasNaN = combinedVector.some(v => isNaN(v) || !isFinite(v))
                if (hasNaN) {
                    continue
                }

                // Verificar dimensão correta
                if (combinedVector.length !== this.dimensions * 2) {
                    console.warn(`Dimension mismatch: expected ${this.dimensions * 2}, got ${combinedVector.length}`)
                    continue
                }

                const label = user.purchases.some(p => p.id === product.id) ? 1 : 0
                inputs.push(combinedVector)
                labels.push(label)
                validPairs++
            }
        }

        console.log(`Created ${validPairs} valid training pairs`)

        if (inputs.length === 0) {
            console.warn('No valid training data found, creating synthetic data')
            return this.createSyntheticTrainingData()
        }

        // Limitar tamanho para evitar problemas de memória
        const maxSamples = 10000
        if (inputs.length > maxSamples) {
            console.log(`Limiting samples from ${inputs.length} to ${maxSamples}`)
            const indices = this.getRandomIndices(inputs.length, maxSamples)
            const filteredInputs = []
            const filteredLabels = []
            for (const idx of indices) {
                filteredInputs.push(inputs[idx])
                filteredLabels.push(labels[idx])
            }
            return {
                xs: tf.tensor2d(filteredInputs),
                ys: tf.tensor2d(filteredLabels, [filteredLabels.length, 1]),
                inputDimensions: this.dimensions * 2
            }
        }

        return {
            xs: tf.tensor2d(inputs),
            ys: tf.tensor2d(labels, [labels.length, 1]),
            inputDimensions: this.dimensions * 2
        }
    }

    createSyntheticTrainingData () {
        // Dados sintéticos para permitir treinamento mesmo sem histórico
        const syntheticInputs = []
        const syntheticLabels = []
        const inputDim = this.dimensions * 2

        for (let i = 0; i < 100; i++) {
            const vec = new Array(inputDim).fill(0).map(() => Math.random() * 0.5 + 0.25)
            syntheticInputs.push(vec)
            syntheticLabels.push(Math.random() > 0.5 ? 1 : 0)
        }

        return {
            xs: tf.tensor2d(syntheticInputs),
            ys: tf.tensor2d(syntheticLabels, [syntheticLabels.length, 1]),
            inputDimensions: inputDim
        }
    }

    getRandomIndices (max, count) {
        const indices = Array.from({ length: max }, (_, i) => i)
        for (let i = indices.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [indices[i], indices[j]] = [indices[j], indices[i]]
        }
        return indices.slice(0, count)
    }
}