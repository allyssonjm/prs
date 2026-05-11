export class ProductController {
    #productView
    #currentUser = null;
    #events
    #productService
    #userService

    constructor ({
        productView,
        events,
        productService,
        userService
    }) {
        this.#productView = productView
        this.#productService = productService
        this.#userService = userService
        this.#events = events
        this.init()
    }

    static init (deps) {
        return new ProductController(deps)
    }

    async init () {
        this.setupCallbacks()
        this.setupEventListeners()

        // Carregar produtos do backend
        const products = await this.#productService.getProducts()
        this.#productView.render(products, true)
    }

    setupEventListeners () {
        this.#events.onUserSelected((user) => {
            this.#currentUser = user
            this.#productView.onUserSelected(user)
            // Disparar recomendação quando usuário for selecionado
            this.#events.dispatchRecommend(user)
        })

        this.#events.onRecommendationsReady(({ recommendations }) => {
            // Renderizar recomendações destacadas
            this.#productView.render(recommendations, false, true)
        })

        // Ouvir por atualizações de usuário (após compra/remoção)
        this.#events.onUsersUpdated(async ({ users }) => {
            if (this.#currentUser) {
                // Recarregar usuário atual
                const updatedUser = await this.#userService.getUserById(this.#currentUser.id)
                this.#currentUser = updatedUser
                // Disparar nova recomendação
                this.#events.dispatchRecommend(updatedUser)
            }
        })
    }

    setupCallbacks () {
        this.#productView.registerBuyProductCallback(this.handleBuyProduct.bind(this))
    }

    async handleBuyProduct (product) {
        const user = this.#currentUser
        if (!user || !user.id) {
            console.error('No user selected')
            return
        }

        // Mostrar loading no botão
        this.#productView.showBuyingFeedback(product.id)

        try {
            // Registrar compra no backend
            const response = await fetch('http://localhost:3001/api/purchases', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    userId: user.id,
                    productId: product.id,
                    product: product
                })
            })

            if (!response.ok) {
                throw new Error('Failed to record purchase')
            }

            const result = await response.json()

            // Atualizar usuário atual com os dados retornados
            if (result.user) {
                this.#currentUser = result.user
            }

            // Disparar evento de compra adicionada
            this.#events.dispatchPurchaseAdded({ user: this.#currentUser, product })

            setTimeout(() => {
                this.#events.dispatchRecommend(this.#currentUser)
            }, 2000)

        } catch (error) {
            console.error('Error buying product:', error)
            this.#productView.showBuyError(product.id)
        }
    }

}