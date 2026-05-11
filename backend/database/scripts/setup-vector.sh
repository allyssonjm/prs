#!/bin/bash

# scripts/setup-vector.sh

# Carregar variáveis de ambiente
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Usar valores padrão se não definidos
DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-5432}
DB_NAME=${DB_NAME:-postgres}
DB_USER=${DB_USER:-postgres}
DB_PASSWORD=${DB_PASSWORD:-}

echo "🚀 Setting up pgvector extension on $DB_NAME..."

# Executar o SQL
if [ -z "$DB_PASSWORD" ]; then
    PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f ./migrations/add_pgvector.sql
else
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f ./migrations/add_pgvector.sql
fi

if [ $? -eq 0 ]; then
    echo "✅ Vector setup completed successfully!"
else
    echo "❌ Vector setup failed!"
    exit 1
fi