// backend/database/migrate.js
import { query } from './connection.js'
import fs from 'fs/promises'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

async function runMigration () {
    console.log('📀 Running database migrations...')

    const sqlPath = path.join(__dirname, 'migrations', 'add_pgvector.sql')
    const sql = await fs.readFile(sqlPath, 'utf-8')

    try {
        await query(sql)
        console.log('✅ Migrations completed successfully!')
    } catch (error) {
        console.error('❌ Migration failed:', error.message)
        process.exit(1)
    }

    process.exit(0)
}

runMigration()