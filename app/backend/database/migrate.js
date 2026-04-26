// backend/database/migrate.js
import { query } from './connection.js'
import fs from 'fs/promises'
import path from 'path'
import { fileURLToPath } from 'url'
import { exec } from 'child_process'

const __dirname = path.dirname(fileURLToPath(import.meta.url))

async function runMigration () {
    console.log('📀 Running database migrations...')

    console.log('🔄 Refresh database and running seeders...')
    await refreshDatabaseAndRunSeeders()

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

async function refreshDatabaseAndRunSeeders () {
    
    exec('project_root/artisan migrate:refresh --seed', (error, stdout, stderr) => {
        if (error) {
            console.error(`Erro: ${error.message}`)
            return
        }
        if (stderr) {
            console.error(`Stderr: ${stderr}`)
            return
        }
        console.log(`Saída: ${stdout}`)
    })
}

runMigration()