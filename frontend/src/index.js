import { UserController } from './controller/UserController.js'
import { ProductController } from './controller/ProductController.js'
import { ModelController } from './controller/ModelTrainingController.js'
import { TFVisorController } from './controller/TFVisorController.js'
import { TFVisorView } from './view/TFVisorView.js'
import { UserService } from './service/UserService.js'
import { ProductService } from './service/ProductService.js'
import { UserView } from './view/UserView.js'
import { ProductView } from './view/ProductView.js'
import { ModelView } from './view/ModelTrainingView.js'
import Events from './events/events.js'
import { WorkerController } from './controller/WorkerController.js'

// Create shared services
const userService = new UserService()
const productService = new ProductService()

// Create views
const userView = new UserView()
const productView = new ProductView()
const modelView = new ModelView()
const tfVisorView = new TFVisorView()

// Create worker (agora apenas comunica com backend)
const mlWorker = new Worker('/src/workers/modelTrainingWorker.js', { type: 'module' })

// Set up worker message handler
const w = WorkerController.init({
    worker: mlWorker,
    events: Events
})

// Inicializar ModelController
ModelController.init({
    modelView,
    userService,
    events: Events,
})

// Inicializar TFVisorController
TFVisorController.init({
    tfVisorView,
    events: Events,
})

// Inicializar ProductController com userService
ProductController.init({
    productView,
    userService,
    productService,
    events: Events,
})

// Inicializar UserController
const userController = UserController.init({
    userView,
    userService,
    productService,
    events: Events,
})

// Renderizar usuários (APENAS os do banco de dados, sem usuário prefixado)
userController.renderUsers()

// Verificar status do modelo ao carregar
async function checkModelStatus () {
    try {
        const response = await fetch('http://localhost:3001/api/model/status')
        const status = await response.json()
        if (status.trained) {
            console.log('Model already trained:', status.modelInfo)
            // Disparar evento de treinamento completo
            Events.dispatchTrainingComplete(status.modelInfo)
        }
    } catch (error) {
        console.log('Backend not available, waiting for WebSocket connection')
    }
}

checkModelStatus()