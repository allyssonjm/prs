import { workerEvents } from "../events/constants.js"

export class WorkerController {
    #worker
    #events
    #alreadyTrained = false;

    constructor ({ worker, events }) {
        this.#worker = worker
        this.#events = events
        this.#alreadyTrained = false
        this.init()
    }

    async init () {
        this.setupCallbacks()
    }

    static init (deps) {
        return new WorkerController(deps)
    }

    setupCallbacks () {
        this.#events.onTrainModel((data) => {
            this.#alreadyTrained = false
            this.triggerTrain(data)
        })

        this.#events.onTrainingComplete(() => {
            this.#alreadyTrained = true
        })

        this.#events.onRecommend((data) => {
            // Se o modelo ainda não foi treinado, aguardar
            if (!this.#alreadyTrained) {
                console.log('Model not trained yet, waiting...')
                return
            }
            this.triggerRecommend(data)
        })

        const eventsToIgnoreLogs = [
            workerEvents.progressUpdate,
            workerEvents.trainingLog,
            workerEvents.trainingComplete,
        ]

        this.#worker.onmessage = (event) => {
            if (!eventsToIgnoreLogs.includes(event.data.type))
                console.log(event.data)

            if (event.data.type === workerEvents.progressUpdate) {
                this.#events.dispatchProgressUpdate(event.data.progress)
            }

            if (event.data.type === workerEvents.trainingComplete) {
                this.#events.dispatchTrainingComplete(event.data)
                this.#alreadyTrained = true
            }

            if (event.data.type === workerEvents.trainingLog) {
                this.#events.dispatchTFVisLogs(event.data)
            }

            if (event.data.type === workerEvents.recommend) {
                this.#events.dispatchRecommendationsReady(event.data)
            }

            if (event.data.type === workerEvents.error) {
                console.error('Worker error:', event.data.message)
            }
        }
    }

    triggerTrain (users) {
        this.#worker.postMessage({ action: workerEvents.trainModel, users })
    }

    triggerRecommend (user) {
        // Enviar apenas o ID do usuário para o worker
        this.#worker.postMessage({ action: workerEvents.recommend, user: { id: user.id } })
    }
}