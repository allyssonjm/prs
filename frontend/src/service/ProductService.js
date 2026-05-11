export class ProductService {
    #apiUrl = 'http://localhost:3001/api';

    async getProducts () {
        const response = await fetch(`${this.#apiUrl}/products`)
        if (!response.ok) {
            throw new Error('Failed to fetch products')
        }
        return await response.json()
    }

    async getProductById (id) {
        const products = await this.getProducts()
        return products.find(product => product.id === id)
    }

    async getProductsByIds (ids) {
        const products = await this.getProducts()
        return products.filter(product => ids.includes(product.id))
    }
}