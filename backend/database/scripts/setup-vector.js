import dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import pkg from 'pg';
import fs from 'fs';

const { Pool } = pkg;

// Configurar dotenv para carregar o .env do backend
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
dotenv.config({ path: join(__dirname, '..', '..', '.env') });

async function setupVector() {
  console.log('🚀 Setting up pgvector extension and embeddings tables...');
  
  const pool = new Pool({
    host: process.env.DB_HOST || 'localhost',
    port: parseInt(process.env.DB_PORT) || 5432,
    database: process.env.DB_NAME || 'postgres',
    user: process.env.DB_USER || 'postgres',
    password: process.env.DB_PASSWORD || '',
  });

  try {
    // Ler o arquivo SQL
    const sqlPath = join(__dirname, '..', 'migrations', 'add_pgvector.sql');
    const sql = fs.readFileSync(sqlPath, 'utf-8');
    
    // Dividir o SQL em comandos individuais (separados por ponto e vírgula)
    const commands = sql
      .split(';')
      .filter(cmd => cmd.trim().length > 0)
      .map(cmd => cmd.trim() + ';');
    
    console.log(`📝 Executando ${commands.length} comandos SQL...`);
    
    // Executar cada comando
    for (let i = 0; i < commands.length; i++) {
      const command = commands[i];
      // Pular comentários
      if (command.startsWith('--') || command.startsWith('\\')) {
        continue;
      }
      
      try {
        await pool.query(command);
        console.log(`✅ Comando ${i + 1}/${commands.length} executado com sucesso`);
      } catch (err) {
        // Ignorar erros de "already exists" para extensões e tabelas
        if (!err.message.includes('already exists') && 
            !err.message.includes('already defined') &&
            !err.message.includes('already a trigger')) {
          console.warn(`⚠️  Aviso no comando ${i + 1}: ${err.message}`);
        } else {
          console.log(`ℹ️  Comando ${i + 1} já existia, ignorando...`);
        }
      }
    }
    
    console.log('✅ Vector setup completed successfully!');
  } catch (error) {
    console.error('❌ Vector setup failed:', error.message);
    process.exit(1);
  } finally {
    await pool.end();
  }
}

// Executar setup
setupVector().catch(console.error);