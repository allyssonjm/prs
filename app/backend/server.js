import express from 'express'
import { WebSocketServer } from 'ws'
import http from 'http'
import cors from 'cors'
import dotenv from 'dotenv'
import { ModelTrainingService } from './services/ModelTrainingService.js'
import { RecommendationService } from './services/RecommendationService.js'
import { EmbeddingRepository } from './repositories/EmbeddingRepository.js'
import { UserRepository } from './repositories/UserRepository.js'
import { ProductRepository } from './repositories/ProductRepository.js'

dotenv.config()

const app = express()
const server = http.createServer(app)
const wss = new WebSocketServer({ server })

app.use(cors())
app.use(express.json())

const trainingService = new ModelTrainingService()
const recommendationService = new RecommendationService()
const embeddingRepo = new EmbeddingRepository()
const userRepo = new UserRepository()
const productRepo = new ProductRepository()

let isModelTrained = false
let trainingInProgress = false
let activeWebSockets = new Set()

// ==================== API REST ====================

app.get('/api/users', async (req, res) => {
    try {
        const users = await userRepo.getAllUsers()
        res.json(users)
    } catch (error) {
        console.error('Error fetching users:', error)
        res.status(500).json({ error: error.message })
    }
})

app.get('/api/users/:id', async (req, res) => {
    try {
        const user = await userRepo.getUserById(parseInt(req.params.id))
        if (!user) return res.status(404).json({ error: 'User not found' })
        res.json(user)
    } catch (error) {
        console.error('Error fetching user:', error)
        res.status(500).json({ error: error.message })
    }
})

app.get('/api/products', async (req, res) => {
    try {
        const products = await productRepo.getAllProducts()
        res.json(products)
    } catch (error) {
        console.error('Error fetching products:', error)
        res.status(500).json({ error: error.message })
    }
})

app.get('/api/recommendations/:userId', async (req, res) => {
    try {
        const limit = parseInt(req.query.limit) || 10
        const recommendations = await recommendationService.getRecommendations(
            parseInt(req.params.userId), limit
        )
        res.json(recommendations)
    } catch (error) {
        console.error('Error getting recommendations:', error)
        res.status(500).json({ error: error.message })
    }
})

// Endpoint para registrar compra
app.post('/api/purchases', async (req, res) => {
    try {
        const { userId, productId, product } = req.body

        console.log(`Recording purchase: user ${userId}, product ${productId || product?.id}`)

        // Registrar a compra no banco de dados
        await userRepo.addPurchase(userId, productId || product.id)

        // Buscar usuário atualizado
        const updatedUser = await userRepo.getUserById(userId)

        // Notificar todos os clients WebSocket sobre a nova compra
        const message = JSON.stringify({
            type: 'purchaseRecorded',
            userId: userId,
            user: updatedUser
        })

        activeWebSockets.forEach(ws => {
            if (ws.readyState === ws.OPEN) {
                ws.send(message)
            }
        })

        res.json({
            success: true,
            message: 'Purchase recorded',
            user: updatedUser
        })
    } catch (error) {
        console.error('Error recording purchase:', error)
        res.status(500).json({ error: error.message })
    }
})

// Endpoint para remover compra
app.delete('/api/purchases', async (req, res) => {
    try {
        const { userId, productId } = req.body

        console.log(`Removing purchase: user ${userId}, product ${productId}`)

        // Remover a compra do banco de dados
        await userRepo.removePurchase(userId, productId)

        // Buscar usuário atualizado
        const updatedUser = await userRepo.getUserById(userId)

        // Notificar todos os clients WebSocket sobre a remoção
        const message = JSON.stringify({
            type: 'purchaseRemoved',
            userId: userId,
            user: updatedUser
        })

        activeWebSockets.forEach(ws => {
            if (ws.readyState === ws.OPEN) {
                ws.send(message)
            }
        })

        res.json({
            success: true,
            message: 'Purchase removed',
            user: updatedUser
        })
    } catch (error) {
        console.error('Error removing purchase:', error)
        res.status(500).json({ error: error.message })
    }
})

// Endpoint para retreinar modelo
app.post('/api/retrain', async (req, res) => {
    try {
        if (trainingInProgress) {
            return res.status(409).json({ error: 'Training already in progress' })
        }

        // Iniciar treinamento assíncrono
        retrainModel()

        res.json({ success: true, message: 'Model retraining started' })
    } catch (error) {
        console.error('Error starting retraining:', error)
        res.status(500).json({ error: error.message })
    }
})

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
        console.error('Error getting model status:', error)
        res.status(500).json({ error: error.message })
    }
})

// Função para retreinar o modelo
async function retrainModel () {
    if (trainingInProgress) {
        console.log('Training already in progress, skipping...')
        return
    }

    trainingInProgress = true
    isModelTrained = false

    // Notificar todos os clients que o treinamento começou
    const startMessage = JSON.stringify({
        type: 'trainingStarted'
    })
    activeWebSockets.forEach(ws => {
        if (ws.readyState === ws.OPEN) ws.send(startMessage)
    });

    trainingService.removeAllListeners()

    trainingService.on('progress', (progress) => {
        const message = JSON.stringify({
            type: 'progress',
            progress: progress.progress,
            message: progress.message
        })
        activeWebSockets.forEach(ws => {
            if (ws.readyState === ws.OPEN) ws.send(message)
        })
    })

    trainingService.on('trainingLog', (log) => {
        const message = JSON.stringify({
            type: 'trainingLog',
            epoch: log.epoch,
            loss: log.loss,
            accuracy: log.accuracy
        })
        activeWebSockets.forEach(ws => {
            if (ws.readyState === ws.OPEN) ws.send(message)
        })
    })

    trainingService.on('complete', (result) => {
        isModelTrained = true
        trainingInProgress = false
        const message = JSON.stringify({
            type: 'trainingComplete',
            accuracy: result.accuracy,
            loss: result.loss,
            modelId: result.modelId
        })
        activeWebSockets.forEach(ws => {
            if (ws.readyState === ws.OPEN) ws.send(message)
        })
        console.log(`✅ Model retrained! Accuracy: ${(result.accuracy * 100).toFixed(2)}%`)
    })

    trainingService.on('error', (error) => {
        trainingInProgress = false
        const message = JSON.stringify({
            type: 'error',
            message: error.message
        })
        activeWebSockets.forEach(ws => {
            if (ws.readyState === ws.OPEN) ws.send(message)
        })
        console.error('Training error:', error)
    })

    try {
        await trainingService.train()
    } catch (error) {
        console.error('Training failed:', error)
        trainingInProgress = false
    }
}

// ==================== WebSocket ====================

wss.on('connection', (ws) => {
    console.log('Client connected')
    activeWebSockets.add(ws)

    ws.on('message', async (message) => {
        const data = JSON.parse(message.toString())

        switch (data.action) {
            case 'trainModel':
                if (trainingInProgress) {
                    ws.send(JSON.stringify({ type: 'error', message: 'Training already in progress' }))
                    return
                }
                retrainModel()
                break

            case 'recommend':
                if (!isModelTrained) {
                    ws.send(JSON.stringify({ type: 'error', message: 'Model not trained yet' }))
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
                    ws.send(JSON.stringify({ type: 'error', message: error.message }))
                }
                break

            case 'status':
                ws.send(JSON.stringify({
                    type: 'status',
                    trained: isModelTrained,
                    inProgress: trainingInProgress
                }))
                break

            default:
                ws.send(JSON.stringify({ type: 'error', message: `Unknown action: ${data.action}` }))
        }
    })

    ws.on('close', () => {
        console.log('Client disconnected')
        activeWebSockets.delete(ws)
    })

    // Enviar status atual
    ws.send(JSON.stringify({
        type: 'status',
        trained: isModelTrained,
        inProgress: trainingInProgress
    }))
})

const PORT = process.env.PORT || 3001
server.listen(PORT, async () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`)
    console.log(`🔌 WebSocket server running on ws://localhost:${PORT}`)

    try {
        const activeModel = await embeddingRepo.getActiveModel()
        if (activeModel) {
            isModelTrained = true
            console.log(`✅ Active model found: ${activeModel.model_version} (accuracy: ${(activeModel.final_accuracy * 100).toFixed(2)}%)`)
        } else {
            console.log('⚠️ No trained model found. Use "Train Model" to train a new model.')
        }
    } catch (error) {
        console.warn('Could not check for existing model:', error.message)
    }
})