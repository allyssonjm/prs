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
        this.#worker.postMessage({ action: 'getStatus' })
    }

    static init (deps) {
        return new WorkerController(deps)
    }

    setupCallbacks () {
        this.#events.onTrainModel((data) => {
            console.log('onTrainModel event received, sending to worker')
            this.#alreadyTrained = false
            this.triggerTrain(data)
        })

        this.#events.onTrainingComplete(() => {
            console.log('Training complete event received')
            this.#alreadyTrained = true
        })

        this.#events.onRecommend((data) => {
            console.log('onRecommend event received for user:', data.id)
            if (!this.#alreadyTrained) {
                console.log('Model not trained yet, waiting...')
                return
            }
            this.triggerRecommend(data)
        })

        this.#worker.onmessage = (event) => {
            const data = event.data
            console.log('Worker message received:', data.type)

            switch (data.type) {
                case 'progressUpdate':
                    this.#events.dispatchProgressUpdate(data.progress)
                    break

                case 'trainingLog':
                    this.#events.dispatchTFVisLogs(data)
                    break

                case 'trainingStarted':
                    console.log('Training started from worker')
                    this.#events.dispatchTrainingStarted(data)
                    break

                case 'trainingComplete':
                    this.#alreadyTrained = true
                    this.#events.dispatchTrainingComplete(data)
                    break

                case 'recommend':
                    this.#events.dispatchRecommendationsReady(data)
                    break

                case 'error':
                    console.error('Worker error:', data.message)
                    this.#events.dispatchTrainingError({ message: data.message })
                    break

                default:
                    console.log('Unknown worker message:', data.type)
            }
        }
    }

    triggerTrain (users) {
        console.log('triggerTrain sending to worker')
        this.#worker.postMessage({ action: 'trainModel', users })
    }

    triggerRecommend (user) {
        console.log('triggerRecommend sending to worker for user:', user.id)
        this.#worker.postMessage({ action: 'recommend', user: { id: user.id }, limit: 20 })
    }
}