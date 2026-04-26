import { View } from './View.js'

export class ProductView extends View {
    #productList = document.querySelector('#productList');
    #buttons
    #productTemplate
    #onBuyProduct
    #isRecommendation = false;

    constructor () {
        super()
        this.init()
    }

    async init () {
        this.#productTemplate = await this.loadTemplate('./src/view/templates/product-card.html')
    }

    onUserSelected (user) {
        this.setButtonsState(user.id ? false : true)
    }

    registerBuyProductCallback (callback) {
        this.#onBuyProduct = callback
    }

    render (products, disableButtons = true, isRecommendation = false) {
        if (!this.#productTemplate) return

        this.#isRecommendation = isRecommendation

        // Ordenar produtos por score se for recomendação
        let sortedProducts = [...products]
        if (isRecommendation && products[0]?.score) {
            sortedProducts.sort((a, b) => (b.score || 0) - (a.score || 0))
        }

        // Limitar a 20 produtos exibidos
        const displayProducts = sortedProducts.slice(0, 20)

        const html = displayProducts.map(product => {
            const scoreHtml = isRecommendation && product.score
                ? `<span class="badge bg-info ms-2">${(product.score * 100).toFixed(1)}% match</span>`
                : ''

            return this.replaceTemplate(this.#productTemplate, {
                id: product.id,
                name: product.name,
                category: product.category,
                price: product.price,
                color: product.color,
                scoreHtml: scoreHtml,
                product: JSON.stringify(product)
            })
        }).join('')

        // Adicionar cabeçalho de recomendação se aplicável
        if (isRecommendation) {
            const header = `
            <div class="col-12 mb-3">
                <div class="alert alert-success">
                    <i class="bi bi-stars"></i> 
                    <strong>Top 20 Recommendations for you!</strong> Based on your purchase history
                    ${displayProducts.length < products.length ? `<span class="badge bg-secondary ms-2">Showing top ${displayProducts.length} of ${products.length}</span>` : ''}
                </div>
            </div>
        `
            this.#productList.innerHTML = header + html
        } else {
            this.#productList.innerHTML = html
        }

        this.attachBuyButtonListeners()
        this.setButtonsState(disableButtons)
    }

    showBuyingFeedback (productId) {
        const button = document.querySelector(`.buy-now-btn[data-product-id="${productId}"]`)
        if (button) {
            const originalText = button.innerHTML
            button.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Processing...'
            button.disabled = true

            // Store original text to restore later
            button.dataset.originalText = originalText
        }
    }

    showBuySuccess (productId) {
        const button = document.querySelector(`.buy-now-btn[data-product-id="${productId}"]`)
        if (button) {
            button.innerHTML = '<i class="bi bi-check-circle-fill"></i> Purchased!'
            button.classList.remove('btn-primary')
            button.classList.add('btn-success')

            setTimeout(() => {
                button.innerHTML = button.dataset.originalText || 'Buy Now'
                button.classList.remove('btn-success')
                button.classList.add('btn-primary')
                button.disabled = false
            }, 2000)
        }
    }

    showBuyError (productId) {
        const button = document.querySelector(`.buy-now-btn[data-product-id="${productId}"]`)
        if (button) {
            button.innerHTML = '<i class="bi bi-exclamation-triangle-fill"></i> Error!'
            button.classList.remove('btn-primary')
            button.classList.add('btn-danger')

            setTimeout(() => {
                button.innerHTML = button.dataset.originalText || 'Buy Now'
                button.classList.remove('btn-danger')
                button.classList.add('btn-primary')
                button.disabled = false
            }, 2000)
        }
    }

    setButtonsState (disabled) {
        if (!this.#buttons) {
            this.#buttons = document.querySelectorAll('.buy-now-btn')
        }
        this.#buttons.forEach(button => {
            button.disabled = disabled
        })
    }

    attachBuyButtonListeners () {
        this.#buttons = document.querySelectorAll('.buy-now-btn')
        this.#buttons.forEach(button => {
            // Adicionar atributo data-product-id para identificar o botão
            const productData = JSON.parse(button.dataset.product)
            button.setAttribute('data-product-id', productData.id)
            button.setAttribute('data-product', button.dataset.product)

            // Remove existing listeners to avoid duplicates
            const newButton = button.cloneNode(true)
            button.parentNode.replaceChild(newButton, button)

            newButton.addEventListener('click', (event) => {
                const product = JSON.parse(newButton.dataset.product)
                if (this.#onBuyProduct) {
                    this.#onBuyProduct(product)
                }
            })
        })
        this.#buttons = document.querySelectorAll('.buy-now-btn')
    }
}