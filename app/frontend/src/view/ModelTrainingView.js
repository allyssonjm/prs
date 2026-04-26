import { View } from './View.js'

export class ModelView extends View {
    #trainModelBtn = document.querySelector('#trainModelBtn');
    #purchasesArrow = document.querySelector('#purchasesArrow');
    #purchasesDiv = document.querySelector('#purchasesDiv');
    #allUsersPurchasesList = document.querySelector('#allUsersPurchasesList');
    #runRecommendationBtn = document.querySelector('#runRecommendationBtn');
    #trainingStatusDiv = null;
    #progressBar = null;
    #onTrainModel
    #onRunRecommendation
    #originalTrainButtonText = '';

    constructor () {
        super()
        this.createStatusElement()
        this.attachEventListeners()
        this.#originalTrainButtonText = this.#trainModelBtn.innerHTML
    }

    createStatusElement () {
        // Verificar se já existe
        if (document.querySelector('#trainingStatus')) return

        const statusDiv = document.createElement('div')
        statusDiv.id = 'trainingStatus'
        statusDiv.className = 'alert alert-info mt-3'
        statusDiv.style.display = 'none'
        statusDiv.innerHTML = `
            <i class="bi bi-info-circle"></i> 
            <span id="trainingStatusText">Ready</span>
            <div class="progress mt-2" style="height: 5px; display: none;">
                <div id="trainingProgressBar" class="progress-bar" style="width: 0%"></div>
            </div>
        `

        const modelControls = document.querySelector('.model-controls')
        if (modelControls && modelControls.parentNode) {
            modelControls.parentNode.insertBefore(statusDiv, modelControls.nextSibling)
        }

        this.#trainingStatusDiv = statusDiv
        this.#progressBar = statusDiv.querySelector('#trainingProgressBar')
    }

    registerTrainModelCallback (callback) {
        this.#onTrainModel = callback
    }

    registerRunRecommendationCallback (callback) {
        this.#onRunRecommendation = callback
    }

    attachEventListeners () {
        this.#trainModelBtn.addEventListener('click', () => {
            if (this.#onTrainModel && !this.#trainModelBtn.disabled) {
                this.#onTrainModel()
            }
        })

        this.#runRecommendationBtn.addEventListener('click', () => {
            if (this.#onRunRecommendation && !this.#runRecommendationBtn.disabled) {
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

    disableRecommendButton () {
        this.#runRecommendationBtn.disabled = true
    }

    resetTrainingButton () {
        this.#trainModelBtn.disabled = false
        this.#trainModelBtn.innerHTML = this.#originalTrainButtonText || '<i class="bi bi-cpu"></i> Train Model'
    }

    updateTrainingProgress (progress) {
        if (!this.#trainingStatusDiv) return

        const progressContainer = this.#trainingStatusDiv.querySelector('.progress')
        if (progressContainer) {
            progressContainer.style.display = 'block'
        }

        if (this.#progressBar) {
            const progressValue = Math.min(100, progress.progress || 0)
            this.#progressBar.style.width = `${progressValue}%`
            this.#progressBar.setAttribute('aria-valuenow', progressValue)
        }

        // Se progresso for 100%, esconder a barra após alguns segundos
        if (progress.progress === 100) {
            setTimeout(() => {
                if (this.#trainingStatusDiv && this.#progressBar) {
                    const progressContainer = this.#trainingStatusDiv.querySelector('.progress')
                    if (progressContainer && this.#trainingStatusDiv.style.display !== 'none') {
                        progressContainer.style.display = 'none'
                    }
                }
            }, 2000)
        }
    }

    updateTrainingStatus (status, message) {
        if (!this.#trainingStatusDiv) return

        this.#trainingStatusDiv.style.display = 'block'
        const textSpan = this.#trainingStatusDiv.querySelector('#trainingStatusText')
        const progressContainer = this.#trainingStatusDiv.querySelector('.progress')

        switch (status) {
            case 'training':
                this.#trainingStatusDiv.className = 'alert alert-warning mt-3'
                textSpan.innerHTML = `<i class="bi bi-hourglass-split"></i> ${message || 'Training in progress...'}`
                if (progressContainer) progressContainer.style.display = 'block'
                break

            case 'complete':
                this.#trainingStatusDiv.className = 'alert alert-success mt-3'
                textSpan.innerHTML = `<i class="bi bi-check-circle"></i> ${message || 'Training completed!'}`
                if (progressContainer) progressContainer.style.display = 'none'
                // Esconder após 5 segundos
                setTimeout(() => this.hideTrainingStatus(), 5000)
                break

            case 'ready':
                this.#trainingStatusDiv.className = 'alert alert-info mt-3'
                textSpan.innerHTML = `<i class="bi bi-check-circle"></i> ${message || 'Model ready'}`
                if (progressContainer) progressContainer.style.display = 'none'
                // Esconder após 3 segundos
                setTimeout(() => this.hideTrainingStatus(), 3000)
                break

            case 'recommending':
                this.#trainingStatusDiv.className = 'alert alert-primary mt-3'
                textSpan.innerHTML = `<i class="bi bi-stars"></i> ${message || 'Generating recommendations...'}`
                if (progressContainer) progressContainer.style.display = 'none'
                break

            case 'error':
                this.#trainingStatusDiv.className = 'alert alert-danger mt-3'
                textSpan.innerHTML = `<i class="bi bi-exclamation-triangle"></i> ${message || 'Error occurred'}`
                if (progressContainer) progressContainer.style.display = 'none'
                // Esconder após 5 segundos
                setTimeout(() => this.hideTrainingStatus(), 5000)
                break

            default:
                this.#trainingStatusDiv.className = 'alert alert-info mt-3'
                textSpan.innerHTML = `<i class="bi bi-info-circle"></i> ${message || 'Ready'}`
                if (progressContainer) progressContainer.style.display = 'none'
        }
    }

    hideTrainingStatus () {
        if (this.#trainingStatusDiv) {
            this.#trainingStatusDiv.style.display = 'none'
            // Resetar progresso para próxima vez
            if (this.#progressBar) {
                this.#progressBar.style.width = '0%'
            }
        }
    }

    showError (message) {
        this.updateTrainingStatus('error', message)
        // Reativar botões após erro
        this.resetTrainingButton()
        this.enableRecommendButton()
    }

    renderAllUsersPurchases (users) {
        if (!users || users.length === 0) {
            this.#allUsersPurchasesList.innerHTML = '<div class="text-muted">No users found</div>'
            return
        }

        const html = users.map(user => {
            const purchasesHtml = user.purchases && user.purchases.length > 0
                ? user.purchases.map(purchase => {
                    return `<span class="badge bg-light text-dark me-1 mb-1">${purchase.name}</span>`
                }).join('')
                : '<span class="text-muted">No purchases</span>'

            return `
                <div class="user-purchase-summary">
                    <h6>${user.name} (Age: ${user.age})</h6>
                    <div class="purchases-badges">
                        ${purchasesHtml}
                    </div>
                </div>
            `
        }).join('')

        this.#allUsersPurchasesList.innerHTML = html
    }
}