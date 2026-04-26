import { View } from './View.js'

export class UserView extends View {
    #userSelect = document.querySelector('#userSelect');
    #userAge = document.querySelector('#userAge');
    #pastPurchasesList = document.querySelector('#pastPurchasesList');

    #purchaseTemplate
    #onUserSelect
    #onPurchaseRemove
    #pastPurchaseElements = [];

    constructor () {
        super()
        this.init()
    }

    async init () {
        this.#purchaseTemplate = await this.loadTemplate('./src/view/templates/past-purchase.html')
        this.attachUserSelectListener()
    }

    registerUserSelectCallback (callback) {
        this.#onUserSelect = callback
    }

    registerPurchaseRemoveCallback (callback) {
        this.#onPurchaseRemove = callback
    }

    renderUserOptions (users) {
        // Limpar options existentes (manter apenas o placeholder)
        this.#userSelect.innerHTML = '<option value="">-- Select a user --</option>'

        const options = users.map(user => {
            // Verificar se o usuário tem compras
            const hasPurchases = user.purchases && user.purchases.length > 0
            const indicator = hasPurchases ? ' (has purchases)' : ' (new user)'
            const className = hasPurchases ? '' : 'fw-bold text-primary'

            return `<option value="${user.id}" class="${className}">${user.name}${indicator}</option>`
        }).join('')

        this.#userSelect.innerHTML += options

        // Adicionar estilo para o optgroup se necessário
        this.addSeparatorBetweenGroups(users)
    }

    addSeparatorBetweenGroups (users) {
        // Encontrar o primeiro usuário com compras
        const firstUserWithPurchases = users.findIndex(user => user.purchases && user.purchases.length > 0)

        if (firstUserWithPurchases > 0) {
            // Adicionar um separador visual (grupo ótico)
            const options = this.#userSelect.querySelectorAll('option')
            if (options[firstUserWithPurchases + 1]) {
                // Criar um optgroup divisor (funciona em alguns navegadores)
                // Alternativa: adicionar uma option desabilitada como separador
                const separator = document.createElement('option')
                separator.disabled = true
                separator.textContent = '────────── Users with purchases ──────────'
                separator.style.backgroundColor = '#f0f0f0'
                separator.style.fontWeight = 'bold'
                separator.style.color = '#666'

                // Inserir antes do primeiro usuário com compras
                const targetOption = options[firstUserWithPurchases + 1]
                this.#userSelect.insertBefore(separator, targetOption)
            }
        }
    }

    renderUserDetails (user) {
        this.#userAge.value = user.age
    }

    renderPastPurchases (pastPurchases) {
        if (!this.#purchaseTemplate) return

        if (!pastPurchases || pastPurchases.length === 0) {
            this.#pastPurchasesList.innerHTML = '<div class="alert alert-info">No past purchases found. This user is ready for recommendations!</div>'
            return
        }

        const html = pastPurchases.map(product => {
            return this.replaceTemplate(this.#purchaseTemplate, {
                ...product,
                product: JSON.stringify(product)
            })
        }).join('')

        this.#pastPurchasesList.innerHTML = html
        this.attachPurchaseClickHandlers()
    }

    addPastPurchase (product) {

        if (this.#pastPurchasesList.innerHTML.includes('No past purchases found')) {
            this.#pastPurchasesList.innerHTML = ''
        }

        const purchaseHtml = this.replaceTemplate(this.#purchaseTemplate, {
            ...product,
            product: JSON.stringify(product)
        })

        this.#pastPurchasesList.insertAdjacentHTML('afterbegin', purchaseHtml)

        const newPurchase = this.#pastPurchasesList.firstElementChild.querySelector('.past-purchase')
        newPurchase.classList.add('past-purchase-highlight')

        setTimeout(() => {
            newPurchase.classList.remove('past-purchase-highlight')
        }, 1000)

        this.attachPurchaseClickHandlers()

        // Atualizar o indicador no select
        this.updateUserSelectIndicator(product.userId)
    }

    updateUserSelectIndicator (userId) {
        const option = this.#userSelect.querySelector(`option[value="${userId}"]`)
        if (option && !option.text.includes('(has purchases)')) {
            option.textContent = option.textContent.replace('(new user)', '(has purchases)')
            option.classList.remove('fw-bold', 'text-primary')
        }
    }

    attachUserSelectListener () {
        this.#userSelect.addEventListener('change', (event) => {
            const userId = event.target.value ? Number(event.target.value) : null

            if (userId) {
                if (this.#onUserSelect) {
                    this.#onUserSelect(userId)
                }
            } else {
                this.#userAge.value = ''
                this.#pastPurchasesList.innerHTML = ''
            }
        })
    }

    attachPurchaseClickHandlers () {
        this.#pastPurchaseElements = []

        const purchaseElements = document.querySelectorAll('.past-purchase')

        purchaseElements.forEach(purchaseElement => {
            this.#pastPurchaseElements.push(purchaseElement)

            purchaseElement.onclick = (event) => {

                const product = JSON.parse(purchaseElement.dataset.product)
                const userId = this.getSelectedUserId()
                const element = purchaseElement.closest('.col-md-6')

                this.#onPurchaseRemove({ element, userId, product })

                element.style.transition = 'opacity 0.5s ease'
                element.style.opacity = '0'

                setTimeout(() => {
                    element.remove()

                    if (document.querySelectorAll('.past-purchase').length === 0) {
                        this.renderPastPurchases([])
                    }

                    // Atualizar o indicador no select
                    this.updateUserSelectIndicatorAfterRemove(userId)
                }, 500)
            }
        })
    }

    updateUserSelectIndicatorAfterRemove (userId) {
        const option = this.#userSelect.querySelector(`option[value="${userId}"]`)
        if (option && document.querySelectorAll('.past-purchase').length === 0) {
            option.textContent = option.textContent.replace('(has purchases)', '(new user)')
            option.classList.add('fw-bold', 'text-primary')
        }
    }

    getSelectedUserId () {
        return this.#userSelect.value ? Number(this.#userSelect.value) : null
    }
}