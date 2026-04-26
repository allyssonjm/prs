// backend/services/ModelTrainingService.js
import * as tf from '@tensorflow/tfjs-node'
import fs from 'fs/promises'
import path from 'path'
import { VectorService } from './VectorService.js'
import { ProductRepository } from '../database/repositories/ProductRepository.js'
import { UserRepository } from '../database/repositories/UserRepository.js'
import { EmbeddingRepository } from '../database/repositories/EmbeddingRepository.js'
import { EventEmitter } from 'events'

export class ModelTrainingService extends EventEmitter {
    constructor () {
        super()
        this.model = null
        this.context = null
        this.vectorService = new VectorService()
        this.productRepo = new ProductRepository()
        this.userRepo = new UserRepository()
        this.embeddingRepo = new EmbeddingRepository()

        // Pesos dos fatores
        this.weights = {
            category: 0.4,
            color: 0.3,
            price: 0.2,
            age: 0.1
        }
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

        // Construir contexto
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

        // Calcular idade média por produto
        const productAvgAge = {}
        const ageSums = {}
        const ageCounts = {}

        users.forEach(user => {
            user.purchases.forEach(purchase => {
                ageSums[purchase.name] = (ageSums[purchase.name] || 0) + user.age
                ageCounts[purchase.name] = (ageCounts[purchase.name] || 0) + 1
            })
        })

        products.forEach(product => {
            productAvgAge[product.name] = ageSums[product.name]
                ? ageSums[product.name] / ageCounts[product.name]
                : (ageRange.min + ageRange.max) / 2
        })

        this.context.productAvgAge = productAvgAge

        // Configurar VectorService
        this.vectorService.buildIndexes(categories, colors)
        this.vectorService.context = this.context

        return { products, users }
    }

    async configureAndTrain (trainData, epochs = 100) {
        console.log('🧠 Configuring neural network...')
        this.emit('progress', { progress: 60, message: 'Configuring neural network...' })

        const model = tf.sequential()

        // Camada de entrada
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

        model.add(tf.layers.dropout({ rate: 0.2 }))

        // Camada oculta 2
        model.add(tf.layers.dense({
            units: 32,
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

        const callbacks = {
            onEpochEnd: (epoch, logs) => {
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
            }
        }

        const history = await model.fit(trainData.xs, trainData.ys, {
            epochs,
            batchSize: 32,
            validationSplit: 0.2,
            shuffle: true,
            callbacks
        })

        this.model = model

        const finalAccuracy = history.history.acc[history.history.acc.length - 1]
        const finalLoss = history.history.loss[history.history.loss.length - 1]

        console.log(`✅ Training completed! Final accuracy: ${(finalAccuracy * 100).toFixed(2)}%`)

        return { finalAccuracy, finalLoss }
    }

    async generateAndSaveEmbeddings () {
        console.log('📊 Generating embeddings for products and users...')
        this.emit('progress', { progress: 96, message: 'Generating product embeddings...' })

        // Gerar embeddings para produtos
        for (const product of this.context.products) {
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

        this.emit('progress', { progress: 98, message: 'Generating user embeddings...' })

        // Gerar embeddings para usuários
        for (const user of this.context.users) {
            const embedding = this.vectorService.encodeUser(user, this.context)
            // Padrão de compras é o embedding do usuário
            await this.embeddingRepo.saveUserEmbedding(user.id, embedding, embedding)
        }

        this.emit('progress', { progress: 99, message: 'Saving model metadata...' })
    }

    async saveModel (metrics) {
        // Salvar modelo no disco
        const modelPath = process.env.MODEL_SAVE_PATH || './models/recommendation_model'
        await this.model.save(`file://${modelPath}`)

        // Ler os pesos como buffer
        const weightsPath = path.join(modelPath, 'weights.bin')
        const weightsBuffer = await fs.readFile(weightsPath)

        // Salvar metadados no banco
        const modelVersion = `v${new Date().toISOString().replace(/[:.]/g, '-')}`
        const architecture = {
            layers: this.model.layers.map(layer => ({
                className: layer.getClassName(),
                units: layer.units,
                activation: layer.activation,
                inputShape: layer.inputShape
            }))
        }

        const modelId = await this.embeddingRepo.saveModelMetadata(
            modelVersion,
            weightsBuffer,
            architecture,
            metrics
        )

        console.log(`💾 Model saved as version: ${modelVersion}`)
        return modelId
    }

    async train () {
        try {
            console.log('🎯 Starting model training process...')
            this.emit('progress', { progress: 0, message: 'Initializing training...' })

            // 1. Carregar dados
            await this.loadData()

            // 2. Criar vetores de treinamento
            this.emit('progress', { progress: 55, message: 'Creating training vectors...' })
            const trainData = this.vectorService.createTrainingVectors(
                this.context.users,
                this.context.products,
                this.context
            )

            // 3. Treinar modelo
            const { finalAccuracy, finalLoss } = await this.configureAndTrain(trainData)

            // 4. Gerar embeddings
            await this.generateAndSaveEmbeddings()

            // 5. Salvar modelo
            const modelId = await this.saveModel({
                accuracy: finalAccuracy,
                loss: finalLoss,
                epochs: 100,
                dimensions: this.vectorService.dimensions
            })

            this.emit('progress', { progress: 100, message: 'Training completed successfully!' })
            this.emit('complete', {
                accuracy: finalAccuracy,
                loss: finalLoss,
                modelId
            })

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