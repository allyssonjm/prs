
# Product Recomendation System - PRS

Sistema de recomendação de produtos com Machine Learning usando TensorFlow.js no backend e PostgreSQL com pgvector.

Este projeto utiliza PHP (Laravel 13 / migrações e seeders), PostgreSQL (extensão pg_vector) e Node.js (TensorFlow.js), e extende o ERS E-commerce recomendation Systema  desenvolvido para o curso **Fundamentos de IA e LLMs para Programadores** do programa de pós-graduação **Engenharia de Software em IA Aplicada** da Anhanguera.


## Pré-requisitos

- Node.js 18+
- PostgreSQL 15+ com extensão pgvector
- (Opcional) NVIDIA GPU para treinamento acelerado

## Instalação

### Backend

```bash
cd backend
npm install
cp .env.example .env  # Configure suas credenciais do banco
npm run migrate        # Executa migrations do banco
npm start              # Inicia o servidor na porta 3001

cd frontend
npm install
npm start              # Inicia o frontend na porta 3000
```


## Novas Features

1) o treinamento não deve mais ocorrer diretamente no Browser, migrando o processamento
para o backend com node.js

2) A base dos dados de treinamento não serão mais processadas dos arquivos "data/products.json"
e "data/users.json" mas através de consulta de banco de dados postgres conforme schema presente no arquivo

3) Alterar as tabelas da base de dados para armazenar os vetores de resultantes do treinamento com a extensão pg_vector

4) A predição deverá ocorrer através de consulta na base de dados

## Nova Estrutura de arquivos

product-recommendation-system/
├── app/backend/
│   ├── package.json
│   ├── server.js
│   ├── .env
│   ├── database/
│   │   ├── connection.js
│   │   ├── migrate.js
│   │   └── migrations/
│   │       └── add_pgvector.sql
│   ├── repositories/
│   │   ├── ProductRepository.js
│   │   ├── UserRepository.js
│   │   └── EmbeddingRepository.js
│   └── services/
│       ├── VectorService.js
│       ├── ModelTrainingService.js
│       └── RecommendationService.js
├── app/frontend/
│   ├── package.json
│   ├── index.html
│   ├── style.css
│   ├── data/
│   │   ├── users.json
│   │   └── products.json
│   └── src/
│       ├── index.js
│       ├── controller/
│       │   ├── UserController.js
│       │   ├── ProductController.js
│       │   ├── ModelTrainingController.js
│       │   ├── TFVisorController.js
│       │   └── WorkerController.js
│       ├── events/
│       │   ├── constants.js
│       │   └── events.js
│       ├── service/
│       │   ├── UserService.js
│       │   └── ProductService.js
│       ├── view/
│       │   ├── View.js
│       │   ├── UserView.js
│       │   ├── ProductView.js
│       │   ├── ModelTrainingView.js
│       │   ├── TFVisorView.js
│       │   └── templates/
│       │       ├── past-purchase.html
│       │       └── product-card.html
│       └── workers/
│           └── modelTrainingWorker.js
└── README.md


# Uso

1) Acesse http://localhost:3000

2) Selecione um usuário no dropdown

3) Clique em "Train Model" para treinar o modelo de recomendação

4) Após o treinamento, clique em "Run Recommendation" para ver produtos recomendados

5) Clique em "Buy Now" em qualquer produto para simular uma compra

# Arquitetura

```
Backend: Node.js + Express + WebSocket + TensorFlow.js (GPU)
Banco de Dados: PostgreSQL + pgvector (embeddings e busca por similaridade)
Frontend: HTML/CSS/JS + Bootstrap
```

# Endpoints API


| Método | Endpoint | Descrição |
| :--- | :---: | ---: |
| Left-aligned | Centered | Right-aligned |
| GET | /api/users | Lista todos os usuários |
| GET | /api/users | Lista todos os usuários |
| GET| /api/users/:id| Obtém usuário por ID
| GET| /api/products| Lista todos os produtos
| GET| /api/recommendations/:userId| Recomendações por embedding
| GET| /api/recommendations/hybrid/:userId| Recomendações híbridas
| GET| /api/model/status| Status do modelo treinado

# WebSocket

trainModel - Inicia treinamento do modelo
recommend - Solicita recomendações para um usuário
status - Obtém status atual do modelo



