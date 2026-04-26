import { query } from '../database/connection.js'

export class UserRepository {
    async getAllUsers () {
        const result = await query(`
            SELECT 
                c.id,
                c.name,
                c.age,
                COALESCE(
                    array_agg(
                        DISTINCT jsonb_build_object(
                            'id', p.id,
                            'name', pr.product,
                            'category', cat.category,
                            'price', pr.price,
                            'color', col.color,
                            'brand', b.brand,
                            'size', s.size
                        )
                    ) FILTER (WHERE p.id IS NOT NULL),
                    '{}'
                ) as purchases
            FROM customers c
            LEFT JOIN purcheases pu ON c.id = pu.customer_id
            LEFT JOIN products pr ON pu.product_id = pr.id
            LEFT JOIN categories cat ON pr.category_id = cat.id
            LEFT JOIN colors col ON pr.color_id = col.id
            LEFT JOIN brands b ON pr.brand_id = b.id
            LEFT JOIN sizes s ON pr.size_id = s.id
            GROUP BY c.id
            ORDER BY c.id
        `)

        return result.rows
    }

    async getUserById (id) {
        const result = await query(`
            SELECT 
                c.id,
                c.name,
                c.age,
                COALESCE(
                    array_agg(
                        DISTINCT jsonb_build_object(
                            'id', p.id,
                            'name', pr.product,
                            'category', cat.category,
                            'price', pr.price,
                            'color', col.color,
                            'brand', b.brand,
                            'size', s.size
                        )
                    ) FILTER (WHERE p.id IS NOT NULL),
                    '{}'
                ) as purchases
            FROM customers c
            LEFT JOIN purcheases pu ON c.id = pu.customer_id
            LEFT JOIN products pr ON pu.product_id = pr.id
            LEFT JOIN categories cat ON pr.category_id = cat.id
            LEFT JOIN colors col ON pr.color_id = col.id
            LEFT JOIN brands b ON pr.brand_id = b.id
            LEFT JOIN sizes s ON pr.size_id = s.id
            WHERE c.id = $1
            GROUP BY c.id
        `, [id])

        return result.rows[0]
    }

    async getAgeRange () {
        const result = await query('SELECT MIN(age) as min, MAX(age) as max FROM customers')
        return { min: parseInt(result.rows[0].min), max: parseInt(result.rows[0].max) }
    }
}