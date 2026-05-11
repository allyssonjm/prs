import * as tf from '@tensorflow/tfjs-node-gpu'
import fs from 'fs/promises'
import path from 'path'
import { EventEmitter } from 'events'
import { VectorService } from './VectorService.js'
import { ProductRepository } from '../repositories/ProductRepository.js'
import { UserRepository } from '../repositories/UserRepository.js'
import { EmbeddingRepository } from '../repositories/EmbeddingRepository.js'

export class ModelTrainingService extends EventEmitter {
    constructor () {
        super()
        this.model = null
        this.context = null
        this.vectorService = new VectorService()
        this.productRepo = new ProductRepository()
        this.userRepo = new UserRepository()
        this.embeddingRepo = new EmbeddingRepository()
        this.weights = { category: 0.4, color: 0.3, price: 0.2, age: 0.1 }
    }

    async loadData () {
        console.log('📦 Loading data from PostgreSQL...')
        this.emit('progress', { progress: 10, message: 'Loading products from database...' })

        const products = await this.productRepo.getAllProducts()
        const categories = await this.productRepo.getProductCategories()
        const colors = await this.productRepo.getProductColors()
        const priceRange = await this.productRepo.getPriceRange()

        this.emit('progress', { progress: 30, message: 'Loading users from database...' })
        const users = await this.userRepo.getAllUsers()
        const ageRange = await this.userRepo.getAgeRange()

        this.emit('progress', { progress: 50, message: 'Building context for training...' })

        this.context = {
            products,
            users,
            minPrice: priceRange.min,
            maxPrice: priceRange.max,
            minAge: ageRange.min,
            maxAge: ageRange.max,
            weights: this.weights,
            categories,
            colors
        }

        const productAvgAge = {}
        const ageSums = {}
        const ageCounts = {}

        users.forEach(user => {
            if (user.purchases && user.purchases.length > 0) {
                user.purchases.forEach(purchase => {
                    ageSums[purchase.name] = (ageSums[purchase.name] || 0) + user.age
                    ageCounts[purchase.name] = (ageCounts[purchase.name] || 0) + 1
                })
            }
        })

        products.forEach(product => {
            productAvgAge[product.name] = ageSums[product.name]
                ? ageSums[product.name] / ageCounts[product.name]
                : (ageRange.min + ageRange.max) / 2
        })

        this.context.productAvgAge = productAvgAge
        this.vectorService.buildIndexes(categories, colors)
        this.vectorService.context = this.context

        return { products, users }
    }

    async createTrainingData () {
        const inputs = []
        const labels = []

        // Filtrar usuários com compras
        const usersWithPurchases = this.context.users.filter(u => u.purchases && u.purchases.length > 0)

        console.log(`Creating training data for ${usersWithPurchases.length} users and ${this.context.products.length} products`)

        for (const user of usersWithPurchases) {
            const userEmbedding = this.vectorService.encodeUser(user, this.context)

            for (const product of this.context.products) {
                const productEmbedding = this.vectorService.encodeProduct(product, this.context)
                const combinedVector = [...userEmbedding, ...productEmbedding]

                const isPurchased = user.purchases.some(p => p.id === product.id)
                const label = isPurchased ? 1 : 0

                inputs.push(combinedVector)
                labels.push(label)
            }
        }

        // Limitar tamanho dos dados para evitar problemas de memória
        const maxSamples = 50000 // Limite máximo de amostras
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
                inputDimensions: this.vectorService.dimensions * 2
            }
        }

        return {
            xs: tf.tensor2d(inputs),
            ys: tf.tensor2d(labels, [labels.length, 1]),
            inputDimensions: this.vectorService.dimensions * 2
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

    async configureAndTrain (trainData, epochs = 2) { // Reduzido epochs para 2
        console.log('🧠 Configuring neural network...')
        this.emit('progress', { progress: 60, message: 'Configuring neural network...' })

        // Limpar modelos anteriores para liberar memória
        if (this.model) {
            this.model.dispose()
            this.model = null
        }

        // Forçar garbage collection
        if (global.gc) {
            global.gc()
        }

        const model = tf.sequential()

        // Camada de entrada - reduzir unidades para economizar memória
        model.add(tf.layers.dense({
            inputShape: [trainData.inputDimensions],
            units: 128,  
            activation: 'relu',
            kernelInitializer: 'glorotUniform'
        }))

        // Dropout para regularização
        model.add(tf.layers.dropout({ rate: 0.3 }))

        // Camada oculta 1
        model.add(tf.layers.dense({
            units: 64,  
            activation: 'relu'
        }))

        // Camada oculta 1
        model.add(tf.layers.dense({
            units: 32, 
            activation: 'relu'
        }))

        model.add(tf.layers.dropout({ rate: 0.2 }))

        // Camada oculta 2
        model.add(tf.layers.dense({
            units: 16,  
            activation: 'relu'
        }))

        // Camada de saída
        model.add(tf.layers.dense({
            units: 1,
            activation: 'sigmoid'
        }))

        model.compile({
            optimizer: tf.train.adam(0.001),
            loss: 'binaryCrossentropy',
            metrics: ['accuracy']
        })

        console.log('🚀 Starting model training...')
        this.emit('progress', { progress: 70, message: 'Training model (this may take a while)...' })

        let bestAccuracy = 0

        const callbacks = {
            onEpochEnd: async (epoch, logs) => {
                const progressPercent = 70 + Math.floor((epoch + 1) / epochs * 25)
                this.emit('trainingLog', {
                    epoch: epoch + 1,
                    loss: logs.loss,
                    accuracy: logs.acc
                })
                this.emit('progress', {
                    progress: Math.min(progressPercent, 95),
                    message: `Training epoch ${epoch + 1}/${epochs} - Accuracy: ${(logs.acc * 100).toFixed(2)}%`
                })
                console.log(`Epoch ${epoch + 1}/${epochs} - Loss: ${logs.loss.toFixed(4)} - Accuracy: ${(logs.acc * 100).toFixed(2)}%`)

                bestAccuracy = Math.max(bestAccuracy, logs.acc)

                // Forçar garbage collection a cada 10 epochs
                if ((epoch + 1) % 10 === 0 && global.gc) {
                    global.gc()
                }
            }
        }

        // Usar batch size menor para economizar memória
        const history = await model.fit(trainData.xs, trainData.ys, {
            epochs,
            batchSize: 16,  // Reduzido de 32 para 16
            validationSplit: 0.2,
            shuffle: true,
            callbacks
        })

        // Limpar dados de treinamento para liberar memória
        trainData.xs.dispose()
        trainData.ys.dispose()

        this.model = model

        const finalAccuracy = history.history.acc[history.history.acc.length - 1]
        const finalLoss = history.history.loss[history.history.loss.length - 1]

        console.log(`✅ Training completed! Final accuracy: ${(finalAccuracy * 100).toFixed(2)}%`)

        return { finalAccuracy, finalLoss }
    }

    async generateAndSaveEmbeddings () {
        console.log('📊 Generating embeddings...')
        this.emit('progress', { progress: 96, message: 'Generating product embeddings...' })

        const batchSize = 10

        // Processar produtos em lotes para economizar memória
        for (let i = 0; i < this.context.products.length; i += batchSize) {
            const batch = this.context.products.slice(i, i + batchSize)

            for (const product of batch) {
                const embedding = this.vectorService.encodeProduct(product, this.context)
                const categoryEncoding = this.vectorService.oneHotWeighted(
                    this.vectorService.categoriesIndex[product.category],
                    this.vectorService.numCategories,
                    this.weights.category
                )
                const colorEncoding = this.vectorService.oneHotWeighted(
                    this.vectorService.colorsIndex[product.color],
                    this.vectorService.numColors,
                    this.weights.color
                )

                await this.embeddingRepo.saveProductEmbedding(product.id, embedding, {
                    categoryEncoding,
                    colorEncoding,
                    normalizedPrice: this.vectorService.normalize(
                        product.price,
                        this.context.minPrice,
                        this.context.maxPrice
                    ),
                    avgPurchaserAge: this.context.productAvgAge[product.name]
                })
            }

            // Progresso parcial
            const progress = 96 + Math.floor((i + batch.length) / this.context.products.length * 3)
            this.emit('progress', { progress: Math.min(progress, 99), message: `Generating embeddings... ${Math.min(100, Math.floor((i + batch.length) / this.context.products.length * 100))}%` })
        }

        this.emit('progress', { progress: 98, message: 'Generating user embeddings...' })

        // Processar usuários em lotes
        for (let i = 0; i < this.context.users.length; i += batchSize) {
            const batch = this.context.users.slice(i, i + batchSize)

            for (const user of batch) {
                const embedding = this.vectorService.encodeUser(user, this.context)
                await this.embeddingRepo.saveUserEmbedding(user.id, embedding, embedding)
            }
        }

        this.emit('progress', { progress: 99, message: 'Saving model metadata...' })
    }

    async saveModel (metrics) {
        try {
            // Salvar modelo no disco
            const modelPath = process.env.MODEL_SAVE_PATH || './models/recommendation_model'

            // Garantir que o diretório existe
            await fs.mkdir(path.dirname(modelPath), { recursive: true })

            await this.model.save(`file://${modelPath}`)

            // Salvar metadados no banco (sem os pesos para economizar espaço)
            const modelVersion = `v${new Date().toISOString().replace(/[:.]/g, '-')}`
            const architecture = {
                layers: this.model.layers.map(layer => ({
                    className: layer.getClassName(),
                    units: layer.units,
                    activation: layer.activation
                }))
            }

            // Salvar sem os pesos no banco para evitar problemas de tamanho
            const modelId = await this.embeddingRepo.saveModelMetadata(
                modelVersion,
                Buffer.from('model_saved_to_disk'),
                architecture,
                metrics
            )

            console.log(`💾 Model saved as version: ${modelVersion}`)
            return modelId
        } catch (error) {
            console.error('Error saving model:', error)
            // Não falhar se não conseguir salvar o modelo
            return null
        }
    }

    async train () {
        try {
            console.log('🎯 Starting model training process...')
            this.emit('progress', { progress: 0, message: 'Initializing training...' })

            // 1. Carregar dados
            await this.loadData()

            // 2. Criar vetores de treinamento
            this.emit('progress', { progress: 55, message: 'Creating training vectors...' })
            const trainData = await this.createTrainingData()

            // 3. Treinar modelo
            const { finalAccuracy, finalLoss } = await this.configureAndTrain(trainData)

            // 4. Gerar embeddings
            await this.generateAndSaveEmbeddings()

            // 5. Salvar modelo
            const modelId = await this.saveModel({
                accuracy: finalAccuracy,
                loss: finalLoss,
                epochs: 2,
                dimensions: this.vectorService.dimensions
            })

            this.emit('progress', { progress: 100, message: 'Training completed successfully!' })
            this.emit('complete', {
                accuracy: finalAccuracy,
                loss: finalLoss,
                modelId
            })

            // Limpar memória
            if (this.model) {
                // Não dispose o modelo aqui porque ele será usado para recomendações
            }
            if (global.gc) {
                global.gc()
            }

            return { success: true, accuracy: finalAccuracy, loss: finalLoss }
        } catch (error) {
            console.error('❌ Training error:', error)
            this.emit('error', error)
            throw error
        }
    }

    getModel () {
        return this.model
    }
}