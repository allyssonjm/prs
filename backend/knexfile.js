import dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

// Configurar dotenv para carregar o .env do backend
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

dotenv.config({ path: join(__dirname, '.', '.env') });

const config = {
  development: {
    client: 'pg',
    connection: {
      host: process.env.DB_HOST || '127.0.0.1',
      port: process.env.DB_PORT || 5432,
      user: process.env.DB_USER || 'postgres',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'database_name',
    },
    migrations: {
      directory: './database/migrations',
      extension: 'js',
      tableName: 'knex_migrations',
    },
    seeds: {
      directory: './database/seeds',
    },
    pool: {
      min: 2,
      max: 10,
    },
  },
  production: {
    client: 'pg',
    connection: process.env.DATABASE_URL,
    migrations: {
      directory: './database/migrations',
      extension: 'js',
      tableName: 'knex_migrations',
    },
    seeds: {
      directory: './database/seeds',
    },
  },
};

export default config;