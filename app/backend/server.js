// backend/server.js
import express from 'express'
import { WebSocketServer } from 'ws'
import http from 'http'
import cors from 'cors'
import dotenv from 'dotenv'
import { ModelTrainingService } from './services/ModelTrainingService.js'
import { RecommendationService } from './services/RecommendationService.js'
import { EmbeddingRepository } from './database/repositories/EmbeddingRepository.js'
import { UserRepository } from './database/repositories/UserRepository.js'
import { ProductRepository } from './database/repositories/ProductRepository.js'

dotenv.config()

const app = express()
const server = http.createServer(app)
const wss = new WebSocketServer({ server })

app.use(cors())
app.use(express.json())

// Instâncias dos serviços
const trainingService = new ModelTrainingService()
const recommendationService = new RecommendationService()
const embeddingRepo = new EmbeddingRepository()
const userRepo = new UserRepository()
const productRepo = new ProductRepository()

// Estado do modelo
let isModelTrained = false
let trainingInProgress = false

// ==================== API REST ====================

// Obter todos os usuários
app.get('/api/users', async (req, res) => {
    try {
        const users = await userRepo.getAllUsers()
        res.json(users)
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// Obter usuário por ID
app.get('/api/users/:id', async (req, res) => {
    try {
        const user = await userRepo.getUserById(parseInt(req.params.id))
        if (!user) {
            return res.status(404).json({ error: 'User not found' })
        }
        res.json(user)
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// Obter todos os produtos
app.get('/api/products', async (req, res) => {
    try {
        const products = await productRepo.getAllProducts()
        res.json(products)
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// Obter recomendações
app.get('/api/recommendations/:userId', async (req, res) => {
    try {
        const limit = parseInt(req.query.limit) || 10
        const recommendations = await recommendationService.getRecommendations(
            parseInt(req.params.userId),
            limit
        )
        res.json(recommendations)
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// Obter recomendações híbridas
app.get('/api/recommendations/hybrid/:userId', async (req, res) => {
    try {
        const limit = parseInt(req.query.limit) || 10
        const recommendations = await recommendationService.hybridRecommendation(
            parseInt(req.params.userId),
            limit
        )
        res.json(recommendations)
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// Registrar compra
app.post('/api/purchases', async (req, res) => {
    try {
        const { userId, productId } = req.body

        // Aqui você implementaria a lógica para registrar a compra
        // Por simplicidade, vamos apenas atualizar o cache

        // Após a compra, podemos atualizar o embedding do usuário
        const user = await userRepo.getUserById(userId)

        res.json({ success: true, message: 'Purchase recorded' })
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// Status do modelo
app.get('/api/model/status', async (req, res) => {
    try {
        const activeModel = await embeddingRepo.getActiveModel()
        res.json({
            trained: isModelTrained,
            inProgress: trainingInProgress,
            modelInfo: activeModel ? {
                version: activeModel.model_version,
                trainingDate: activeModel.training_date,
                accuracy: activeModel.final_accuracy,
                loss: activeModel.final_loss
            } : null
        })
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})

// ==================== WebSocket ====================

wss.on('connection', (ws) => {
    console.log('Client connected')

    ws.on('message', async (message) => {
        const data = JSON.parse(message.toString())

        switch (data.action) {
            case 'trainModel':
                if (trainingInProgress) {
                    ws.send(JSON.stringify({
                        type: 'error',
                        message: 'Training already in progress'
                    }))
                    return
                }

                trainingInProgress = true
                isModelTrained = false

                // Configurar listeners do serviço de treinamento
                trainingService.removeAllListeners()

                trainingService.on('progress', (progress) => {
                    ws.send(JSON.stringify({
                        type: 'progress',
                        progress: progress.progress,
                        message: progress.message
                    }))
                })

                trainingService.on('trainingLog', (log) => {
                    ws.send(JSON.stringify({
                        type: 'trainingLog',
                        epoch: log.epoch,
                        loss: log.loss,
                        accuracy: log.accuracy
                    }))
                })

                trainingService.on('complete', (result) => {
                    isModelTrained = true
                    trainingInProgress = false
                    ws.send(JSON.stringify({
                        type: 'trainingComplete',
                        accuracy: result.accuracy,
                        loss: result.loss,
                        modelId: result.modelId
                    }))
                })

                trainingService.on('error', (error) => {
                    trainingInProgress = false
                    ws.send(JSON.stringify({
                        type: 'error',
                        message: error.message
                    }))
                })

                // Iniciar treinamento
                try {
                    await trainingService.train()
                } catch (error) {
                    trainingInProgress = false
                    ws.send(JSON.stringify({
                        type: 'error',
                        message: error.message
                    }))
                }
                break

            case 'recommend':
                if (!isModelTrained) {
                    ws.send(JSON.stringify({
                        type: 'error',
                        message: 'Model not trained yet'
                    }))
                    return
                }

                try {
                    const recommendations = await recommendationService.getRecommendations(
                        data.userId,
                        data.limit || 10
                    )
                    ws.send(JSON.stringify({
                        type: 'recommendations',
                        userId: data.userId,
                        recommendations
                    }))
                } catch (error) {
                    ws.send(JSON.stringify({
                        type: 'error',
                        message: error.message
                    }))
                }
                break

            default:
                ws.send(JSON.stringify({
                    type: 'error',
                    message: `Unknown action: ${data.action}`
                }))
        }
    })

    ws.on('close', () => {
        console.log('Client disconnected')
    })

    // Enviar status atual
    ws.send(JSON.stringify({
        type: 'status',
        trained: isModelTrained,
        inProgress: trainingInProgress
    }))
})

// ==================== Inicialização ====================

const PORT = process.env.PORT || 3001

server.listen(PORT, async () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`)
    console.log(`🔌 WebSocket server running on ws://localhost:${PORT}`)

    // Verificar se já existe um modelo treinado
    try {
        const activeModel = await embeddingRepo.getActiveModel()
        if (activeModel) {
            isModelTrained = true
            console.log(`✅ Active model found: ${activeModel.model_version} (accuracy: ${(activeModel.final_accuracy * 100).toFixed(2)}%)`)
        } else {
            console.log('⚠️ No trained model found. Use WebSocket to train a new model.')
        }
    } catch (error) {
        console.warn('Could not check for existing model:', error.message)
    }
})