// frontend/src/workers/modelTrainingWorker.js
import { workerEvents } from '../events/constants.js'

// WebSocket connection to backend
let ws = null
let isConnected = false
let isTraining = false
let isModelReady = false

function connectWebSocket () {
    // Use localhost:3001 for backend
    const wsUrl = 'ws://localhost:3001'

    ws = new WebSocket(wsUrl)

    ws.onopen = () => {
        console.log('WebSocket connected to backend')
        isConnected = true
        sendMessage({ action: 'status' })
    }

    ws.onmessage = (event) => {
        const data = JSON.parse(event.data)
        handleBackendMessage(data)
    }

    ws.onerror = (error) => {
        console.error('WebSocket error:', error)
        isConnected = false
    }

    ws.onclose = () => {
        console.log('WebSocket disconnected, attempting to reconnect...')
        isConnected = false
        setTimeout(connectWebSocket, 3000)
    }
}

function handleBackendMessage (data) {
    switch (data.type) {
        case 'progress':
            postMessage({
                type: workerEvents.progressUpdate,
                progress: { progress: data.progress, message: data.message }
            })
            break

        case 'trainingLog':
            postMessage({
                type: workerEvents.trainingLog,
                epoch: data.epoch,
                loss: data.loss,
                accuracy: data.accuracy
            })
            break

        case 'trainingComplete':
            isTraining = false
            isModelReady = true
            postMessage({
                type: workerEvents.trainingComplete,
                accuracy: data.accuracy,
                loss: data.loss,
                modelId: data.modelId
            })
            postMessage({
                type: workerEvents.trainingLog,
                message: `Training completed! Final accuracy: ${(data.accuracy * 100).toFixed(2)}%`
            })
            break

        case 'recommendations':
            postMessage({
                type: workerEvents.recommend,
                user: { id: data.userId },
                recommendations: data.recommendations
            })
            break

        case 'status':
            isModelReady = data.trained
            break

        case 'error':
            console.error('Backend error:', data.message)
            isTraining = false
            postMessage({
                type: workerEvents.error,
                message: data.message
            })
            break

        default:
            console.log('Unknown message type:', data.type)
    }
}

function sendMessage (message) {
    if (ws && ws.readyState === WebSocket.OPEN) {
        ws.send(JSON.stringify(message))
    } else {
        console.warn('WebSocket not connected, message queued')
        // Queue message for reconnection
        setTimeout(() => sendMessage(message), 1000)
    }
}

// Handlers for different actions
const handlers = {
    [workerEvents.trainModel]: (data) => {
        if (isTraining) {
            postMessage({
                type: workerEvents.error,
                message: 'Training already in progress'
            })
            return
        }
        isTraining = true
        sendMessage({ action: 'trainModel', users: data.users })
    },

    [workerEvents.recommend]: (data) => {
        if (!isModelReady) {
            postMessage({
                type: workerEvents.error,
                message: 'Model not trained yet. Please train the model first.'
            })
            return
        }
        sendMessage({
            action: 'recommend',
            userId: data.user.id,
            limit: data.limit || 10
        })
    },

    [workerEvents.getStatus]: () => {
        sendMessage({ action: 'status' })
    }
}

// Initialize WebSocket connection
connectWebSocket()

self.onmessage = (e) => {
    const { action, ...data } = e.data
    if (handlers[action]) {
        handlers[action](data)
    } else {
        console.warn(`Unknown action: ${action}`)
    }
}