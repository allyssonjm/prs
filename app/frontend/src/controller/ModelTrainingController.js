export class ModelController {
    #modelView
    #userService
    #events
    #currentUser = null;
    #alreadyTrained = false;

    constructor ({
        modelView,
        userService,
        events,
    }) {
        this.#modelView = modelView
        this.#userService = userService
        this.#events = events
        this.init()
    }

    static init (deps) {
        return new ModelController(deps)
    }

    async init () {
        this.setupCallbacks()
        this.checkInitialStatus()
    }

    async checkInitialStatus () {
        try {
            const response = await fetch('http://localhost:3001/api/model/status')
            const status = await response.json()
            if (status.trained) {
                this.#alreadyTrained = true
                this.#modelView.enableRecommendButton()
                this.#modelView.updateTrainingStatus('ready', `Model ready (Accuracy: ${(status.modelInfo.accuracy * 100).toFixed(2)}%)`)
            }
        } catch (error) {
            console.log('Could not check model status:', error)
        }
    }

    setupCallbacks () {
        this.#modelView.registerTrainModelCallback(this.handleTrainModel.bind(this))
        this.#modelView.registerRunRecommendationCallback(this.handleRunRecommendation.bind(this))

        this.#events.onUserSelected((user) => {
            console.log('User selected in ModelController:', user?.id)
            this.#currentUser = user
            if (!this.#alreadyTrained) return
            this.#modelView.enableRecommendButton()
        })

        this.#events.onTrainingComplete((data) => {
            console.log('Training complete in ModelController')
            this.#alreadyTrained = true
            this.#modelView.enableRecommendButton()
            this.#modelView.updateTrainingStatus('complete', `Training completed! Accuracy: ${(data.accuracy * 100).toFixed(2)}%`)

            setTimeout(() => {
                this.#modelView.resetTrainingButton()
            }, 3000)

            if (this.#currentUser) {
                console.log('Dispatching recommend for user after training:', this.#currentUser.id)
                this.#events.dispatchRecommend(this.#currentUser)
            }
        })

        this.#events.onUsersUpdated(
            async (...data) => {
                return this.refreshUsersPurchaseData(...data)
            }
        )

        this.#events.onProgressUpdate(
            (progress) => {
                this.handleTrainingProgressUpdate(progress)
            }
        )

        this.#events.onTrainingStarted(() => {
            this.#modelView.updateTrainingStatus('training', 'Training started...')
            this.#modelView.disableTrainButton()
        })
    }

    async handleTrainModel () {
        console.log('handleTrainModel called - dispatching train event')
        this.#modelView.disableTrainButton()
        this.#modelView.updateTrainingStatus('training', 'Starting training...')
        this.#alreadyTrained = false

        const users = await this.#userService.getUsers()
        console.log('Dispatching train model with', users.length, 'users')
        this.#events.dispatchTrainModel(users)
    }

    handleTrainingProgressUpdate (progress) {
        this.#modelView.updateTrainingProgress(progress)
        if (progress.message) {
            this.#modelView.updateTrainingStatus('training', progress.message)
        }
    }

    async handleRunRecommendation () {
        console.log('handleRunRecommendation called')
        if (!this.#currentUser) {
            this.#modelView.showError('Please select a user first')
            return
        }

        if (!this.#alreadyTrained) {
            this.#modelView.showError('Model not trained yet. Please train the model first.')
            return
        }

        const updatedUser = await this.#userService.getUserById(this.#currentUser.id)
        console.log('Dispatching recommend for user:', updatedUser.id)
        this.#events.dispatchRecommend(updatedUser)
        this.#modelView.updateTrainingStatus('recommending', 'Generating recommendations...')

        setTimeout(() => {
            this.#modelView.updateTrainingStatus('ready', 'Recommendations generated')
        }, 2000)
    }

    async refreshUsersPurchaseData ({ users }) {
        this.#modelView.renderAllUsersPurchases(users)
    }
}