import { query } from '../database/connection.js'

export class EmbeddingRepository {
    constructor () {
        this.expectedDimension = 128
    }

    async saveProductEmbedding (productId, embedding, metadata) {
        // Validar e limpar embedding
        const cleanEmbedding = this.cleanVector(embedding, this.expectedDimension)
        const cleanCategoryEncoding = this.cleanVector(metadata.categoryEncoding, this.expectedDimension)
        const cleanColorEncoding = this.cleanVector(metadata.colorEncoding, this.expectedDimension)

        // Verificar dimensão correta
        if (cleanEmbedding.length !== this.expectedDimension) {
            throw new Error(`Invalid embedding dimension: expected ${this.expectedDimension}, got ${cleanEmbedding.length}`)
        }

        // Verificar se os vetores são válidos
        if (cleanEmbedding.some(v => isNaN(v) || !isFinite(v))) {
            console.error(`Invalid embedding for product ${productId}:`, cleanEmbedding)
            throw new Error(`Invalid embedding for product ${productId}`)
        }

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
            `[${cleanEmbedding.join(',')}]`,
            `[${cleanCategoryEncoding.join(',')}]`,
            `[${cleanColorEncoding.join(',')}]`,
            metadata.normalizedPrice || 0,
            metadata.avgPurchaserAge || 0
        ])

        console.log(`Saved product embedding for product ${productId} (dimension: ${cleanEmbedding.length})`)
    }

    async saveUserEmbedding (customerId, embedding, purchasePattern) {
        const cleanEmbedding = this.cleanVector(embedding, this.expectedDimension)
        const cleanPattern = this.cleanVector(purchasePattern, this.expectedDimension)

        if (cleanEmbedding.length !== this.expectedDimension) {
            throw new Error(`Invalid embedding dimension: expected ${this.expectedDimension}, got ${cleanEmbedding.length}`)
        }

        if (cleanEmbedding.some(v => isNaN(v) || !isFinite(v))) {
            console.error(`Invalid embedding for user ${customerId}:`, cleanEmbedding)
            throw new Error(`Invalid embedding for user ${customerId}`)
        }

        await query(`
            INSERT INTO user_embeddings (customer_id, embedding, purchase_pattern)
            VALUES ($1, $2, $3)
            ON CONFLICT (customer_id) DO UPDATE SET
                embedding = EXCLUDED.embedding,
                purchase_pattern = EXCLUDED.purchase_pattern,
                updated_at = CURRENT_TIMESTAMP
        `, [customerId, `[${cleanEmbedding.join(',')}]`, `[${cleanPattern.join(',')}]`])

        console.log(`Saved user embedding for user ${customerId} (dimension: ${cleanEmbedding.length})`)
    }

    cleanVector (vector, targetDimension = 128) {
        if (!vector || !Array.isArray(vector)) {
            return new Array(targetDimension).fill(0)
        }

        let cleanVector = vector.map(v => {
            if (isNaN(v) || !isFinite(v)) return 0
            return Math.max(-1, Math.min(1, v))
        })

        // Ajustar dimensão
        if (cleanVector.length !== targetDimension) {
            if (cleanVector.length > targetDimension) {
                // Pooling para reduzir
                const ratio = cleanVector.length / targetDimension
                const result = []
                for (let i = 0; i < targetDimension; i++) {
                    const start = Math.floor(i * ratio)
                    const end = Math.floor((i + 1) * ratio)
                    let sum = 0
                    let count = 0
                    for (let j = start; j < end && j < cleanVector.length; j++) {
                        sum += cleanVector[j]
                        count++
                    }
                    result.push(count > 0 ? sum / count : 0)
                }
                cleanVector = result
            } else {
                // Expandir com zeros
                const result = [...cleanVector]
                while (result.length < targetDimension) {
                    result.push(0)
                }
                cleanVector = result
            }
        }

        return cleanVector
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

    async getSimilarProducts (userEmbedding, limit = 20, excludeProductIds = []) {
        const cleanEmbedding = this.cleanVector(userEmbedding, this.expectedDimension)
        const embeddingStr = `[${cleanEmbedding.join(',')}]`

        const params = [embeddingStr, limit]
        let excludeCondition = ''

        if (excludeProductIds.length > 0) {
            params.push(excludeProductIds)
            excludeCondition = `AND p.id != ALL($${params.length})`
        }

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
        `, params)

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
            metrics.epochs || 50,
            metrics.accuracy || 0,
            metrics.loss || 0,
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