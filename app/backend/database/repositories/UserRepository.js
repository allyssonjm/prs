import { query } from '../database/connection.js'

export class UserRepository {
    async getAllUsers () {
        const result = await query(`
            SELECT 
                c.id,
                c.name,
                c.age,
                COALESCE(
                    (
                        SELECT jsonb_agg(
                            DISTINCT jsonb_build_object(
                                'id', pr.id,
                                'name', pr.product,
                                'category', cat.category,
                                'price', pr.price,
                                'color', col.color,
                                'brand', b.brand,
                                'size', s.size
                            )
                            ORDER BY pr.id
                        )
                        FROM purcheases pu
                        JOIN products pr ON pu.product_id = pr.id
                        LEFT JOIN categories cat ON pr.category_id = cat.id
                        LEFT JOIN colors col ON pr.color_id = col.id
                        LEFT JOIN brands b ON pr.brand_id = b.id
                        LEFT JOIN sizes s ON pr.size_id = s.id
                        WHERE pu.customer_id = c.id
                    ),
                    '[]'::jsonb
                ) as purchases
            FROM customers c
            ORDER BY 
                CASE WHEN COALESCE(
                    (SELECT COUNT(*) FROM purcheases pu WHERE pu.customer_id = c.id),
                    0
                ) = 0 THEN 0 ELSE 1 END,
                c.name ASC
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
                    (
                        SELECT jsonb_agg(
                            DISTINCT jsonb_build_object(
                                'id', pr.id,
                                'name', pr.product,
                                'category', cat.category,
                                'price', pr.price,
                                'color', col.color,
                                'brand', b.brand,
                                'size', s.size
                            )
                            ORDER BY pr.id
                        )
                        FROM purcheases pu
                        JOIN products pr ON pu.product_id = pr.id
                        LEFT JOIN categories cat ON pr.category_id = cat.id
                        LEFT JOIN colors col ON pr.color_id = col.id
                        LEFT JOIN brands b ON pr.brand_id = b.id
                        LEFT JOIN sizes s ON pr.size_id = s.id
                        WHERE pu.customer_id = c.id
                    ),
                    '[]'::jsonb
                ) as purchases
            FROM customers c
            WHERE c.id = $1
        `, [id])

        return result.rows[0]
    }

    async addPurchase (userId, productId) {
        // Verificar se a compra já existe
        const checkResult = await query(`
            SELECT id FROM purcheases 
            WHERE customer_id = $1 AND product_id = $2
        `, [userId, productId])

        if (checkResult.rows.length === 0) {
            // Inserir nova compra
            const purchaseHash = `purchase_${userId}_${productId}_${Date.now()}`
            await query(`
                INSERT INTO purcheases (
                    customer_id, product_id, salesperson_id, 
                    dt_purchease, purchease_hash, created_at, updated_at
                ) VALUES (
                    $1, $2, 1, CURRENT_TIMESTAMP, $3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
                )
            `, [userId, productId, purchaseHash])
            console.log(`✅ Purchase added: user ${userId}, product ${productId}`)
        } else {
            console.log(`Purchase already exists: user ${userId}, product ${productId}`)
        }
    }

    async removePurchase (userId, productId) {
        await query(`
            DELETE FROM purcheases 
            WHERE customer_id = $1 AND product_id = $2
        `, [userId, productId])
        console.log(`✅ Purchase removed: user ${userId}, product ${productId}`)
    }

    async getUsersWithoutPurchases () {
        const result = await query(`
            SELECT 
                c.id,
                c.name,
                c.age,
                '[]'::jsonb as purchases
            FROM customers c
            WHERE NOT EXISTS (
                SELECT 1 FROM purcheases pu WHERE pu.customer_id = c.id
            )
            ORDER BY c.name ASC
        `)

        return result.rows
    }

    async getUsersWithPurchases () {
        const result = await query(`
            SELECT 
                c.id,
                c.name,
                c.age,
                COALESCE(
                    (
                        SELECT jsonb_agg(
                            DISTINCT jsonb_build_object(
                                'id', pr.id,
                                'name', pr.product,
                                'category', cat.category,
                                'price', pr.price,
                                'color', col.color,
                                'brand', b.brand,
                                'size', s.size
                            )
                        )
                        FROM purcheases pu
                        JOIN products pr ON pu.product_id = pr.id
                        LEFT JOIN categories cat ON pr.category_id = cat.id
                        LEFT JOIN colors col ON pr.color_id = col.id
                        LEFT JOIN brands b ON pr.brand_id = b.id
                        LEFT JOIN sizes s ON pr.size_id = s.id
                        WHERE pu.customer_id = c.id
                    ),
                    '[]'::jsonb
                ) as purchases
            FROM customers c
            WHERE EXISTS (
                SELECT 1 FROM purcheases pu WHERE pu.customer_id = c.id
            )
            ORDER BY c.name ASC
        `)

        return result.rows
    }

    async getAgeRange () {
        const result = await query('SELECT MIN(age) as min, MAX(age) as max FROM customers')
        return { min: parseInt(result.rows[0].min), max: parseInt(result.rows[0].max) }
    }
}