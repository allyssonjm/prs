import { query } from '../database/connection.js'

export class ProductRepository {
    async getAllProducts () {
        const result = await query(`
            SELECT 
                p.id,
                p.product as name,
                c.category,
                co.color,
                p.price,
                b.brand,
                s.size,
                f.feature
            FROM products p
            JOIN categories c ON p.category_id = c.id
            JOIN colors co ON p.color_id = co.id
            JOIN brands b ON p.brand_id = b.id
            JOIN sizes s ON p.size_id = s.id
            JOIN features f ON p.feature_id = f.id
        `)
        return result.rows
    }

    async getProductById (id) {
        const result = await query(`
            SELECT 
                p.id,
                p.product as name,
                c.category,
                co.color,
                p.price,
                b.brand,
                s.size,
                f.feature
            FROM products p
            JOIN categories c ON p.category_id = c.id
            JOIN colors co ON p.color_id = co.id
            JOIN brands b ON p.brand_id = b.id
            JOIN sizes s ON p.size_id = s.id
            JOIN features f ON p.feature_id = f.id
            WHERE p.id = $1
        `, [id])
        return result.rows[0]
    }

    async getProductCategories () {
        const result = await query('SELECT DISTINCT category FROM categories ORDER BY category')
        return result.rows.map(r => r.category)
    }

    async getProductColors () {
        const result = await query('SELECT DISTINCT color FROM colors ORDER BY color')
        return result.rows.map(r => r.color)
    }

    async getPriceRange () {
        const result = await query('SELECT MIN(price) as min, MAX(price) as max FROM products')
        return { min: parseFloat(result.rows[0].min), max: parseFloat(result.rows[0].max) }
    }
}