-- Habilitar extensão pgvector
CREATE EXTENSION IF NOT EXISTS vector;

-- =====================================================
-- Tabela para armazenar embeddings de usuários
-- =====================================================
CREATE TABLE IF NOT EXISTS user_embeddings (
    id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
    embedding vector(128),  -- Dimensão do embedding do usuário
    purchase_pattern vector(128), -- Padrão de compras
    created_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(customer_id)
);

-- =====================================================
-- Tabela para armazenar embeddings de produtos
-- =====================================================
CREATE TABLE IF NOT EXISTS product_embeddings (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    embedding vector(128),  -- Embedding do produto baseado em features
    category_encoding vector,  -- One-hot de categoria
    color_encoding vector,      -- One-hot de cor
    normalized_price FLOAT,     -- Preço normalizado 0-1
    avg_purchaser_age FLOAT,    -- Idade média dos compradores
    created_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(product_id)
);

-- =====================================================
-- Tabela para armazenar modelo treinado (pesos serializados)
-- =====================================================
CREATE TABLE IF NOT EXISTS model_metadata (
    id BIGSERIAL PRIMARY KEY,
    model_version VARCHAR(50) NOT NULL,
    model_weights BYTEA,  -- Pesos serializados do modelo
    model_architecture JSONB,  -- Arquitetura do modelo
    training_date TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    training_epochs INTEGER,
    final_accuracy FLOAT,
    final_loss FLOAT,
    is_active BOOLEAN DEFAULT FALSE,
    metadata JSONB
);

-- =====================================================
-- Índices para busca de similaridade
-- =====================================================
CREATE INDEX idx_user_embeddings_vector ON user_embeddings USING ivfflat (embedding vector_cosine_ops);
CREATE INDEX idx_product_embeddings_vector ON product_embeddings USING ivfflat (embedding vector_cosine_ops);

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

CREATE TRIGGER update_user_embeddings_updated_at
    BEFORE UPDATE ON user_embeddings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_product_embeddings_updated_at
    BEFORE UPDATE ON product_embeddings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();