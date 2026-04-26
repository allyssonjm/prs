export class UserController {
    #userService
    #userView
    #events
    #productService

    constructor ({
        userView,
        userService,
        events,
        productService
    }) {
        this.#userView = userView
        this.#userService = userService
        this.#events = events
        this.#productService = productService
    }

    static init (deps) {
        return new UserController(deps)
    }

    async renderUsers () {
        // Buscar usuários APENAS do backend
        const users = await this.#userService.getDefaultUsers()

        // Renderizar apenas os usuários do banco
        this.#userView.renderUserOptions(users)
        this.#events.dispatchUsersUpdated({ users })

        this.setupCallbacks()
        this.setupPurchaseObserver()
        this.setupWebSocketListeners()
    }

    setupCallbacks () {
        this.#userView.registerUserSelectCallback(this.handleUserSelect.bind(this))
        this.#userView.registerPurchaseRemoveCallback(this.handlePurchaseRemove.bind(this))
    }

    setupPurchaseObserver () {
        this.#events.onPurchaseAdded(
            async (...data) => {
                return this.handlePurchaseAdded(...data)
            }
        )
    }

    setupWebSocketListeners () {
        // Ouvir mensagens do WebSocket para atualizações em tempo real
        // Isso será tratado pelo worker, mas podemos escutar eventos
        this.#events.onTrainingComplete(async () => {
            // Quando o treinamento terminar, atualizar recomendações
            if (this.#userView.getSelectedUserId()) {
                const user = await this.#userService.getUserById(this.#userView.getSelectedUserId())
                this.#events.dispatchRecommend(user)
            }
        })
    }

    async handleUserSelect (userId) {
        const user = await this.#userService.getUserById(userId)
        this.#events.dispatchUserSelected(user)
        return this.displayUserDetails(user)
    }

    async handlePurchaseAdded ({ user, product }) {
        // Buscar usuário atualizado do backend
        const updatedUser = await this.#userService.getUserById(user.id)

        // Atualizar a view
        const lastPurchase = updatedUser.purchases[updatedUser.purchases.length - 1]
        if (lastPurchase) {
            this.#userView.addPastPurchase(lastPurchase)
        }

        // Notificar mudança
        const allUsers = await this.#userService.getUsers()
        this.#events.dispatchUsersUpdated({ users: allUsers })
    }

    async handlePurchaseRemove ({ element, userId, product }) {
        try {
            // Remover do backend
            const response = await fetch('http://localhost:3001/api/purchases', {
                method: 'DELETE',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ userId, productId: product.id })
            })

            if (!response.ok) {
                throw new Error('Failed to remove purchase')
            }

            const result = await response.json()

            // Atualizar a view
            element.style.transition = 'opacity 0.5s ease'
            element.style.opacity = '0'

            setTimeout(async () => {
                element.remove()

                if (document.querySelectorAll('.past-purchase').length === 0) {
                    this.#userView.renderPastPurchases([])
                }

                // Atualizar lista de usuários
                const updatedUsers = await this.#userService.getUsers()
                this.#events.dispatchUsersUpdated({ users: updatedUsers })

                // Disparar recomendação novamente
                const currentUser = await this.#userService.getUserById(userId)
                this.#events.dispatchRecommend(currentUser)

            }, 500)

        } catch (error) {
            console.error('Error removing purchase:', error)
            alert('Failed to remove purchase. Please try again.')
        }
    }

    async displayUserDetails (user) {
        this.#userView.renderUserDetails(user)
        this.#userView.renderPastPurchases(user.purchases || [])
    }

    getSelectedUserId () {
        return this.#userView.getSelectedUserId()
    }
}