import { View } from './View.js'

export class ModelView extends View {
    #trainModelBtn = document.querySelector('#trainModelBtn');
    #purchasesArrow = document.querySelector('#purchasesArrow');
    #purchasesDiv = document.querySelector('#purchasesDiv');
    #allUsersPurchasesList = document.querySelector('#allUsersPurchasesList');
    #runRecommendationBtn = document.querySelector('#runRecommendationBtn');
    #trainingStatusDiv = null;
    #onTrainModel
    #onRunRecommendation

    constructor () {
        super()
        this.createStatusElement()
        this.attachEventListeners()
    }

    createStatusElement () {
        const statusDiv = document.createElement('div')
        statusDiv.id = 'trainingStatus'
        statusDiv.className = 'alert alert-info mt-3'
        statusDiv.style.display = 'none'
        statusDiv.innerHTML = '<i class="bi bi-info-circle"></i> <span id="trainingStatusText">Ready</span>'

        const modelControls = document.querySelector('.model-controls')
        if (modelControls && modelControls.parentNode) {
            modelControls.parentNode.insertBefore(statusDiv, modelControls.nextSibling)
        }

        this.#trainingStatusDiv = statusDiv
    }

    registerTrainModelCallback (callback) {
        this.#onTrainModel = callback
    }

    registerRunRecommendationCallback (callback) {
        this.#onRunRecommendation = callback
    }

    attachEventListeners () {
        this.#trainModelBtn.addEventListener('click', () => {
            if (this.#onTrainModel) {
                this.#onTrainModel()
            }
        })

        this.#runRecommendationBtn.addEventListener('click', () => {
            if (this.#onRunRecommendation) {
                this.#onRunRecommendation()
            }
        })

        this.#purchasesDiv.addEventListener('click', () => {
            const purchasesList = this.#allUsersPurchasesList
            const isHidden = window.getComputedStyle(purchasesList).display === 'none'

            if (isHidden) {
                purchasesList.style.display = 'block'
                this.#purchasesArrow.classList.remove('bi-chevron-down')
                this.#purchasesArrow.classList.add('bi-chevron-up')
            } else {
                purchasesList.style.display = 'none'
                this.#purchasesArrow.classList.remove('bi-chevron-up')
                this.#purchasesArrow.classList.add('bi-chevron-down')
            }
        })
    }

    disableTrainButton () {
        this.#trainModelBtn.disabled = true
        this.#trainModelBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Training...'
    }

    enableRecommendButton () {
        this.#runRecommendationBtn.disabled = false
    }

    resetTrainingButton () {
        this.#trainModelBtn.disabled = false
        this.#trainModelBtn.innerHTML = '<i class="bi bi-cpu"></i> Train Model'
    }

    updateTrainingProgress (progress) {
        if (progress.progress === 100) {
            this.resetTrainingButton()
        }

        // Atualizar barra de progresso se existir
        let progressBar = document.querySelector('.training-progress-bar')
        if (!progressBar && this.#trainingStatusDiv) {
            const progressContainer = document.createElement('div')
            progressContainer.className = 'progress mt-2'
            progressContainer.style.height = '5px'
            progressBar = document.createElement('div')
            progressBar.className = 'progress-bar training-progress-bar'
            progressBar.style.width = '0%'
            progressContainer.appendChild(progressBar)
            this.#trainingStatusDiv.appendChild(progressContainer)
        }

        if (progressBar) {
            progressBar.style.width = `${progress.progress}%`
            progressBar.setAttribute('aria-valuenow', progress.progress)
        }
    }

    updateTrainingStatus (status, message) {
        if (!this.#trainingStatusDiv) return

        this.#trainingStatusDiv.style.display = 'block'
        const textSpan = this.#trainingStatusDiv.querySelector('#trainingStatusText')

        switch (status) {
            case 'training':
                this.#trainingStatusDiv.className = 'alert alert-warning mt-3'
                textSpan.innerHTML = `<i class="bi bi-hourglass-split"></i> ${message || 'Training in progress...'}`
                break
            case 'complete':
                this.#trainingStatusDiv.className = 'alert alert-success mt-3'
                textSpan.innerHTML = `<i class="bi bi-check-circle"></i> ${message || 'Training completed!'}`
                break
            case 'ready':
                this.#trainingStatusDiv.className = 'alert alert-info mt-3'
                textSpan.innerHTML = `<i class="bi bi-check-circle"></i> ${message || 'Model ready'}`
                break
            case 'error':
                this.#trainingStatusDiv.className = 'alert alert-danger mt-3'
                textSpan.innerHTML = `<i class="bi bi-exclamation-triangle"></i> ${message || 'Error occurred'}`
                break
            default:
                this.#trainingStatusDiv.className = 'alert alert-info mt-3'
                textSpan.innerHTML = `<i class="bi bi-info-circle"></i> ${message || 'Ready'}`
        }

        // Esconder após 5 segundos se for mensagem de sucesso temporária
        if (status === 'complete' || status === 'ready') {
            setTimeout(() => {
                if (this.#trainingStatusDiv && status !== 'training') {
                    this.#trainingStatusDiv.style.display = 'none'
                }
            }, 5000)
        }
    }

    showError (message) {
        this.updateTrainingStatus('error', message)
        setTimeout(() => {
            if (this.#trainingStatusDiv) {
                this.#trainingStatusDiv.style.display = 'none'
            }
        }, 5000)
    }

    renderAllUsersPurchases (users) {
        const html = users.map(user => {
            const purchasesHtml = user.purchases.map(purchase => {
                return `<span class="badge bg-light text-dark me-1 mb-1">${purchase.name}</span>`
            }).join('')

            return `
                <div class="user-purchase-summary">
                    <h6>${user.name} (Age: ${user.age})</h6>
                    <div class="purchases-badges">
                        ${purchasesHtml || '<span class="text-muted">No purchases</span>'}
                    </div>
                </div>
            `
        }).join('')

        this.#allUsersPurchasesList.innerHTML = html
    }
}