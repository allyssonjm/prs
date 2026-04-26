import { query } from '../connection.js'

export class EmbeddingRepository {
    async saveProductEmbedding (productId, embedding, metadata) {
        await query(`
            INSERT INTO product_embeddings (
                product_id, embedding, category_encoding, 
                color_encoding, normalized_price, avg_purchaser_age
            ) VALUES ($1, $2, $3, $4, $5, $6)
            ON CONFLICT (product_id) DO UPDATE SET
                embedding = EXCLUDED.embedding,
                category_encoding = EXCLUDED.category_encoding,
                color_encoding = EXCLUDED.color_encoding,
                normalized_price = EXCLUDED.normalized_price,
                avg_purchaser_age = EXCLUDED.avg_purchaser_age,
                updated_at = CURRENT_TIMESTAMP
        `, [
            productId,
            `[${embedding.join(',')}]`,
            `[${metadata.categoryEncoding.join(',')}]`,
            `[${metadata.colorEncoding.join(',')}]`,
            metadata.normalizedPrice,
            metadata.avgPurchaserAge
        ])
    }

    async saveUserEmbedding (customerId, embedding, purchasePattern) {
        await query(`
            INSERT INTO user_embeddings (customer_id, embedding, purchase_pattern)
            VALUES ($1, $2, $3)
            ON CONFLICT (customer_id) DO UPDATE SET
                embedding = EXCLUDED.embedding,
                purchase_pattern = EXCLUDED.purchase_pattern,
                updated_at = CURRENT_TIMESTAMP
        `, [customerId, `[${embedding.join(',')}]`, `[${purchasePattern.join(',')}]`])
    }

    async getProductEmbeddings () {
        const result = await query(`
            SELECT 
                pe.product_id,
                pe.embedding,
                p.product as name,
                p.price,
                c.category,
                col.color
            FROM product_embeddings pe
            JOIN products p ON pe.product_id = p.id
            JOIN categories c ON p.category_id = c.id
            JOIN colors col ON p.color_id = col.id
        `)

        return result.rows.map(row => ({
            id: row.product_id,
            name: row.name,
            embedding: row.embedding,
            metadata: { price: row.price, category: row.category, color: row.color }
        }))
    }

    async getSimilarProducts (userEmbedding, limit = 10, excludeProductIds = []) {
        const embeddingStr = `[${userEmbedding.join(',')}]`
        const excludeCondition = excludeProductIds.length > 0
            ? `AND p.id NOT IN (${excludeProductIds.join(',')})`
            : ''

        const result = await query(`
            SELECT 
                p.id,
                p.product as name,
                c.category,
                col.color,
                p.price,
                b.brand,
                1 - (pe.embedding <=> $1::vector) as similarity
            FROM product_embeddings pe
            JOIN products p ON pe.product_id = p.id
            JOIN categories c ON p.category_id = c.id
            JOIN colors col ON p.color_id = col.id
            LEFT JOIN brands b ON p.brand_id = b.id
            WHERE pe.embedding IS NOT NULL
            ${excludeCondition}
            ORDER BY pe.embedding <=> $1::vector
            LIMIT $2
        `, [embeddingStr, limit])

        return result.rows
    }

    async saveModelMetadata (modelVersion, weightsBuffer, architecture, metrics) {
        const result = await query(`
            INSERT INTO model_metadata (
                model_version, model_weights, model_architecture, 
                training_epochs, final_accuracy, final_loss, is_active, metadata
            ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
            RETURNING id
        `, [
            modelVersion,
            weightsBuffer,
            JSON.stringify(architecture),
            metrics.epochs,
            metrics.accuracy,
            metrics.loss,
            true,
            JSON.stringify(metrics)
        ])

        await query(`
            UPDATE model_metadata SET is_active = FALSE 
            WHERE id != $1 AND is_active = TRUE
        `, [result.rows[0].id])

        return result.rows[0].id
    }

    async getActiveModel () {
        const result = await query(`
            SELECT * FROM model_metadata 
            WHERE is_active = TRUE 
            ORDER BY training_date DESC 
            LIMIT 1
        `)
        return result.rows[0]
    }
}