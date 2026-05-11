import dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import pkg from 'pg';

const { Pool } = pkg;

// Configurar dotenv para carregar o .env do backend
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
dotenv.config({ path: join(__dirname, '..', '..', '.env') });

async function checkPgVector() {
  const pool = new Pool({
    host: process.env.DB_HOST || 'localhost',
    port: parseInt(process.env.DB_PORT) || 5432,
    database: process.env.DB_NAME || 'postgres',
    user: process.env.DB_USER || 'postgres',
    password: process.env.DB_PASSWORD || '',
  });

  try {
    // Verificar se a extensão vector está instalada
    const result = await pool.query(`
      SELECT 
        extname, 
        extversion,
        extrelocatable
      FROM pg_extension 
      WHERE extname = 'vector'
    `);
    
    if (result.rows.length > 0) {
      console.log('✅ pgvector extension is installed!');
      console.log(`   Version: ${result.rows[0].extversion}`);
    } else {
      console.log('❌ pgvector extension is NOT installed!');
      console.log('\n📖 To install pgvector:');
      console.log('   - Ubuntu/Debian: sudo apt-get install postgresql-16-pgvector');
      console.log('   - macOS: brew install pgvector');
      console.log('   - Docker: docker run -d --name pgvector -p 5432:5432 pgvector/pgvector:pg16');
    }
  } catch (error) {
    console.error('❌ Error checking pgvector:', error.message);
  } finally {
    await pool.end();
  }
}

checkPgVector();