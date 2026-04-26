// WebSocket connection to backend
let ws = null
let isConnected = false
let isTraining = false
let isModelReady = false
let pendingRecommendations = []

const WS_URL = 'ws://localhost:3001'

function connectWebSocket () {
    console.log('🔌 Connecting to backend WebSocket...')
    ws = new WebSocket(WS_URL)

    ws.onopen = () => {
        console.log('✅ WebSocket connected to backend')
        isConnected = true
        // Processar recomendações pendentes
        pendingRecommendations.forEach(req => sendMessage(req))
        pendingRecommendations = []
        // Verificar status
        sendMessage({ action: 'status' })
    }

    ws.onmessage = (event) => {
        const data = JSON.parse(event.data)
        handleBackendMessage(data)
    }

    ws.onerror = (error) => {
        console.error('❌ WebSocket error:', error)
        isConnected = false
        postMessage({ type: 'error', message: 'Connection to backend failed' })
    }

    ws.onclose = () => {
        console.log('🔌 WebSocket disconnected, attempting to reconnect in 3s...')
        isConnected = false
        isTraining = false
        setTimeout(connectWebSocket, 3000)
    }
}

function handleBackendMessage (data) {
    switch (data.type) {
        case 'progress':
            postMessage({
                type: 'progressUpdate',
                progress: { progress: data.progress, message: data.message }
            })
            break

        case 'trainingLog':
            postMessage({
                type: 'trainingLog',
                epoch: data.epoch,
                loss: data.loss,
                accuracy: data.accuracy
            })
            break

        case 'trainingComplete':
            isTraining = false
            isModelReady = true
            postMessage({
                type: 'trainingComplete',
                accuracy: data.accuracy,
                loss: data.loss,
                modelId: data.modelId
            })
            postMessage({
                type: 'trainingLog',
                message: `✅ Training completed! Final accuracy: ${(data.accuracy * 100).toFixed(2)}%`
            })
            break

        case 'recommendations':
            postMessage({
                type: 'recommend',
                user: { id: data.userId },
                recommendations: data.recommendations
            })
            break

        case 'status':
            isModelReady = data.trained
            console.log(`Model status: ${data.trained ? 'trained' : 'not trained'}`)
            if (data.modelInfo) {
                console.log(`Model version: ${data.modelInfo.version}, accuracy: ${(data.modelInfo.accuracy * 100).toFixed(2)}%`)
            }
            break

        case 'error':
            console.error('Backend error:', data.message)
            isTraining = false
            postMessage({ type: 'error', message: data.message })
            break

        default:
            console.log('Unknown message type:', data.type)
    }
}

function sendMessage (message) {
    if (ws && ws.readyState === WebSocket.OPEN) {
        ws.send(JSON.stringify(message))
    } else {
        console.warn('WebSocket not connected, queuing message:', message.action)
        pendingRecommendations.push(message)
        if (!ws || ws.readyState === WebSocket.CLOSED) {
            connectWebSocket()
        }
    }
}

function getStatus () {
    sendMessage({ action: 'status' })
}

const handlers = {
    trainModel: (data) => {
        if (isTraining) {
            postMessage({ type: 'error', message: 'Training already in progress' })
            return
        }
        isTraining = true
        isModelReady = false
        sendMessage({ action: 'trainModel' })
    },

    recommend: (data) => {
        if (!isModelReady) {
            postMessage({ type: 'error', message: 'Model not trained yet. Please train the model first.' })
            return
        }
        sendMessage({ action: 'recommend', userId: data.user.id, limit: 10 })
    },

    getStatus: getStatus
}

// Iniciar conexão
connectWebSocket()

self.onmessage = (e) => {
    const { action, ...data } = e.data
    if (handlers[action]) {
        handlers[action](data)
    } else {
        console.warn(`Unknown action: ${action}`)
    }
}