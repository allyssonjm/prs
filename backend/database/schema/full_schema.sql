-- Schema completo combinado do original
CREATE EXTENSION IF NOT EXISTS vector;

-- Tabelas principais (já criadas pelas migrations)
-- Este arquivo serve como documentação e backup do schema completo

-- =====================================================
-- Tabelas para embeddings e vectors (pgvector)
-- =====================================================

CREATE TABLE IF NOT EXISTS user_embeddings (
    id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
    embedding vector(128),
    purchase_pattern vector(128),
    created_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(customer_id)
);

CREATE TABLE IF NOT EXISTS product_embeddings (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    embedding vector(128),
    category_encoding vector,
    color_encoding vector,
    normalized_price FLOAT,
    avg_purchaser_age FLOAT,
    created_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(product_id)
);

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

-- Índices para busca de similaridade
CREATE INDEX IF NOT EXISTS idx_user_embeddings_vector ON user_embeddings USING ivfflat (embedding vector_cosine_ops);
CREATE INDEX IF NOT EXISTS idx_product_embeddings_vector ON product_embeddings USING ivfflat (embedding vector_cosine_ops);

-- Função para calcular similaridade de cosseno
CREATE OR REPLACE FUNCTION cosine_similarity(a vector, b vector)
RETURNS FLOAT AS $$
BEGIN
    RETURN 1 - (a <=> b);
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Triggers para updated_at
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