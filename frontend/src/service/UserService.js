export class UserService {
    #storageKey = 'ew-academy-users';
    #apiUrl = 'http://localhost:3001/api';

    async getDefaultUsers () {
        const response = await fetch(`${this.#apiUrl}/users`)
        const users = await response.json()

        // Salvar em cache local
        this.#setStorage(users)

        return users
    }

    async getUsers () {
        // Tentar cache primeiro
        const cached = this.#getStorage()
        if (cached && cached.length > 0) {
            return cached
        }

        // Buscar do backend
        const response = await fetch(`${this.#apiUrl}/users`)
        const users = await response.json()
        this.#setStorage(users)
        return users
    }

    async getUserById (userId) {
        // Buscar direto do backend para ter dados atualizados
        const response = await fetch(`${this.#apiUrl}/users/${userId}`)
        if (!response.ok) {
            throw new Error(`User ${userId} not found`)
        }
        return await response.json()
    }

    async updateUser (user) {
        // Atualizar cache local com os dados fornecidos
        const users = this.#getStorage()
        const userIndex = users.findIndex(u => u.id === user.id)
        if (userIndex !== -1) {
            users[userIndex] = { ...users[userIndex], ...user }
            const sortedUsers = this.#sortUsers(users)
            this.#setStorage(sortedUsers)
        }

        return user
    }

    async addUser (user) {
        const users = this.#getStorage()
        const existingUser = users.find(u => u.id === user.id)
        if (!existingUser) {
            const newUsers = [user, ...users]
            const sortedUsers = newUsers //this.#sortUsers(newUsers)
            this.#setStorage(sortedUsers)
        }
        return user
    }

    #sortUsers (users) {
        // Ordenar: primeiro sem compras, depois em ordem alfabética
        return [...users].sort((a, b) => {
            const aHasPurchases = a.purchases && a.purchases.length > 0
            const bHasPurchases = b.purchases && b.purchases.length > 0

            if (aHasPurchases === bHasPurchases) {
                return a.name.localeCompare(b.name)
            }

            return aHasPurchases ? 1 : -1
        })
    }

    #getStorage () {
        const data = sessionStorage.getItem(this.#storageKey)
        return data ? JSON.parse(data) : []
    }

    #setStorage (data) {
        sessionStorage.setItem(this.#storageKey, JSON.stringify(data))
    }
}