-- Habilitar extensão pgvector
CREATE EXTENSION IF NOT EXISTS vector;

-- Excluindo as tabelas antigas de embeddings, se existirem
DROP TABLE IF EXISTS product_embeddings;
DROP TABLE IF EXISTS user_embeddings;
DROP TABLE IF EXISTS model_metadata;

-- =====================================================
-- Tabela para armazenar embeddings de usuários
-- =====================================================
CREATE TABLE IF NOT EXISTS user_embeddings (
    id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    embedding vector(128),
    purchase_pattern vector(128),
    created_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Adicionar unique constraint para customer_id
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'user_embeddings_customer_id_unique'
    ) THEN
        ALTER TABLE user_embeddings ADD CONSTRAINT user_embeddings_customer_id_unique UNIQUE (customer_id);
    END IF;
END $$;

-- =====================================================
-- Tabela para armazenar embeddings de produtos
-- =====================================================
CREATE TABLE IF NOT EXISTS product_embeddings (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL,
    embedding vector(128),
    category_encoding vector,
    color_encoding vector,
    normalized_price FLOAT,
    avg_purchaser_age FLOAT,
    created_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Adicionar unique constraint para product_id
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'product_embeddings_product_id_unique'
    ) THEN
        ALTER TABLE product_embeddings ADD CONSTRAINT product_embeddings_product_id_unique UNIQUE (product_id);
    END IF;
END $$;

-- =====================================================
-- Tabela para armazenar modelo treinado
-- =====================================================
CREATE TABLE IF NOT EXISTS model_metadata (
    id BIGSERIAL PRIMARY KEY,
    model_version VARCHAR(50) NOT NULL,
    model_weights BYTEA,
    model_architecture JSONB,
    training_date TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    training_epochs INTEGER,
    final_accuracy FLOAT,
    final_loss FLOAT,
    is_active BOOLEAN DEFAULT FALSE,
    metadata JSONB
);

-- =====================================================
-- Índices para busca de similaridade (opcional, requer pgvector)
-- =====================================================
DO $$ 
BEGIN
    IF EXISTS (
        SELECT 1 FROM pg_extension WHERE extname = 'vector'
    ) THEN
        CREATE INDEX IF NOT EXISTS idx_product_embeddings_vector ON product_embeddings USING ivfflat (embedding vector_cosine_ops);
    END IF;
END $$;

-- =====================================================
-- Função para calcular similaridade de cosseno
-- =====================================================
CREATE OR REPLACE FUNCTION cosine_similarity(a vector, b vector)
RETURNS FLOAT AS $$
BEGIN
    RETURN 1 - (a <=> b);
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- =====================================================
-- Trigger para atualizar updated_at
-- =====================================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_user_embeddings_updated_at ON user_embeddings;
CREATE TRIGGER update_user_embeddings_updated_at
    BEFORE UPDATE ON user_embeddings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_product_embeddings_updated_at ON product_embeddings;
CREATE TRIGGER update_product_embeddings_updated_at
    BEFORE UPDATE ON product_embeddings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();