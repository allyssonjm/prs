// frontend/src/view/ProductView.js (modificado)
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

        const html = sortedProducts.map(product => {
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
                        <strong>Recommended for you!</strong> Based on your purchase history
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
            // Remove existing listeners to avoid duplicates
            const newButton = button.cloneNode(true)
            button.parentNode.replaceChild(newButton, button)

            newButton.addEventListener('click', (event) => {
                const product = JSON.parse(newButton.dataset.product)
                const originalText = newButton.innerHTML

                newButton.innerHTML = '<i class="bi bi-check-circle-fill"></i> Added'
                newButton.classList.remove('btn-primary')
                newButton.classList.add('btn-success')

                setTimeout(() => {
                    newButton.innerHTML = originalText
                    newButton.classList.remove('btn-success')
                    newButton.classList.add('btn-primary')
                }, 500)

                this.#onBuyProduct(product, newButton)
            })
        })
        this.#buttons = document.querySelectorAll('.buy-now-btn')
    }
}