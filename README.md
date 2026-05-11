# 🧠 Product Recommendation System (PRS)

Sistema de recomendação de produtos com Machine Learning usando TensorFlow.js, PostgreSQL com pgvector, e arquitetura híbrida (backend Node.js + frontend vanilla JS).

## 📋 Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Arquitetura](#arquitetura)
- [Features](#features)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Executando o Projeto](#executando-o-projeto)
- [API Endpoints](#api-endpoints)
- [WebSocket Protocol](#websocket-protocol)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Tecnologias](#tecnologias)
- [Troubleshooting](#troubleshooting)
- [Roadmap](#roadmap)

## 🎯 Sobre o Projeto

O **Product Recommendation System (PRS)** é um fork do **ERS [E-commerce Recomendation System](https://github.com/unipds-engenharia-de-ia-aplicada/engenharia-de-software-com-ia-aplicada)** que extendo as suas features incluindo embedding vetoriais:

- **Deep Learning** com TensorFlow.js para treinar modelos preditivos
- **Embeddings vetoriais** armazenados no PostgreSQL com extensão pgvector
- **Busca por similaridade** usando distância de cosseno
- **Arquitetura em tempo real** com WebSocket para atualizações
- **Recomendações híbridas** baseadas em histórico e perfil do usuário

Desenvolvido como projeto de pós-graduação em **Engenharia de Software com IA Aplicada**.


## ✨ Features

### Backend
- ✅ **Treinamento de modelo neural** com TensorFlow.js (GPU/CPU)
- ✅ **Embeddings vetoriais** para usuários e produtos
- ✅ **Busca por similaridade** usando pgvector (distância de cosseno)
- ✅ **API REST completa** para usuários, produtos e compras
- ✅ **WebSocket real-time** para treinamento e recomendações
- ✅ **Persistência de modelos** no banco de dados
- ✅ **Recomendações híbridas** (colaborativa + baseada em conteúdo)
- ✅ **Geração automática de embeddings** pós-treinamento

### Frontend
- ✅ **Interface responsiva** com Bootstrap 5
- ✅ **Seleção de usuários** com indicador de histórico
- ✅ **Listagem de produtos** com compras simuladas
- ✅ **Recomendações destacadas** com score de similaridade
- ✅ **Dashboard de treinamento** com progresso em tempo real
- ✅ **Visualização de métricas** com TensorFlow.js Visor
- ✅ **Lista de todos usuários** com histórico de compras
- ✅ **Remoção de compras** com atualização automática

### Banco de Dados
- ✅ **Schema relacional normalizado** (categorias, cores, marcas, etc.)
- ✅ **Extensão pgvector** para operações vetoriais
- ✅ **Índices IVFFlat** para busca eficiente
- ✅ **Triggers automáticos** para updated_at
- ✅ **Seeders** com 5000+ produtos e 120+ usuários

## 📦 Pré-requisitos

### Obrigatórios
- **Node.js** 22+ (recomendado) ou 20+
- **PostgreSQL** 15+ com extensão pgvector
- **npm** 10+ ou **yarn** 1.22+

### Opcionais
- **NVIDIA GPU** com CUDA (para treinamento acelerado)
- **Docker** (para ambiente containerizado)

### Verificar instalações
```bash
# Node.js
node --version  # v22.x ou superior

# PostgreSQL
psql --version  # 15.x ou superior

# pgvector (no PostgreSQL)
psql -d postgres -c "SELECT * FROM pg_extension WHERE extname='vector';"
```

## 🚀 Instalação


git clone https://github.com/allyssonjm/prs.git
cd prs


# Criar banco e usuário
sudo -u postgres psql << EOF
CREATE USER prs WITH PASSWORD 'prs';
CREATE DATABASE prs OWNER prs;
GRANT ALL PRIVILEGES ON DATABASE prs TO prs;
EOF

# Instalar pgvector (Ubuntu/Debian)
sudo apt-get install postgresql-16-pgvector

# Ou usar Docker
docker run -d --name pgvector -p 5432:5432 \ -e POSTGRES_DB=prs \
  -e POSTGRES_USER=prs \
  -e POSTGRES_PASSWORD=prs \
  pgvector/pgvector:pg16

# Instalar dependências do backend
cd backend
npm install

# Instalar dependências do frontend
cd ../frontend
npm install

# Voltar à raiz
cd ..

# Backend
cp backend/.env.example backend/.env

# Edite backend/.env com suas credenciais
nano backend/.env

DB_HOST=localhost
DB_PORT=5432
DB_NAME=prs_databse_name
DB_USER=prs_user
DB_PASSWORD=prs_pwd
MODEL_SAVE_PATH=./models/recommendation_model
EMBEDDING_DIM=128
PORT=3001

cd backend

# Executar migrations
npm run migrate:latest

# Popular banco com dados
npm run db:seed

# Configurar pgvector (opcional, se não foi criado)
npm run vector:setup

cd ..

npm start

Este comando inicia simultaneamente o backend (porta 3001) e o frontend (porta 3000).

# Build e start em produção
cd backend
npm start

cd ../frontend
# Frontend já está em modo estático

Acessar aplicação
Frontend: http://localhost:3000

Backend API: http://localhost:3001/api

WebSocket: ws://localhost:3001

# 📖 Como Usar
***1. Selecionar usuário***
No dropdown "Select User", escolha um usuário

Usuários com compras têm indicador "(has purchases)"
Usuários novos têm destaque "new user"

***2. Treinar o modelo***
Clique no botão "Train Model"

Acompanhe o progresso na barra de status
Visualize as métricas no dashboard do TensorFlow.js
Aguarde a mensagem "Training completed!"

***3. Obter recomendações***

Após treinar, clique em "Run Recommendation"
Os produtos serão reorganizados com scores de similaridade
Produtos mais relevantes aparecem primeiro

***4. Simular compras***

Clique em "Buy Now" em qualquer produto
A compra é registrada no banco de dados
Recomendações são atualizadas automaticamente

***5. Remover compras***
Clique no "X" ao lado de uma compra no histórico
A compra é removida e recomendações são recalculadas


# 🔌 API Endpoints
``` 
1. Usuários
Método	Endpoint	Descrição
GET	/api/users	Lista todos os usuários
GET	/api/users/:id	Busca usuário por ID
2. Produtos
Método	Endpoint	Descrição
GET	/api/products	Lista todos os produtos
3. Recomendações
Método	Endpoint	Descrição
GET	/api/recommendations/:userId	Recomendações baseadas em embeddings
GET	/api/recommendations/hybrid/:userId	Recomendações híbridas
4. Compras
Método	Endpoint	Descrição
POST	/api/purchases	Registra nova compra
DELETE	/api/purchases	Remove compra
5. Modelo
Método	Endpoint	Descrição
POST	/api/retrain	Inicia retreinamento assíncrono
GET	/api/model/status	Status do modelo treinado
```

# Exemplos de uso

```
# Listar usuários
curl http://localhost:3001/api/users

# Obter recomendações para usuário 1
curl http://localhost:3001/api/recommendations/1?limit=20

# Registrar compra
curl -X POST http://localhost:3001/api/purchases \
  -H "Content-Type: application/json" \
  -d '{"userId":1,"productId":42}'

# Status do modelo
curl http://localhost:3001/api/model/status
```

# 🔌 WebSocket Protocol

const ws = new WebSocket('ws://localhost:3001');

# 💬 Mensagens

***Cliente → Servidor***
```
// Treinar modelo
ws.send(JSON.stringify({ action: 'trainModel' }));

// Solicitar recomendações
ws.send(JSON.stringify({ 
  action: 'recommend', 
  userId: 1, 
  limit: 20 
}));

// Verificar status
ws.send(JSON.stringify({ action: 'status' }));
```

***Servidor → Cliente***
```
// Progresso do treinamento
{
  type: 'progress',
  progress: 45,
  message: 'Training model...'
}

// Log de época
{
  type: 'trainingLog',
  epoch: 1,
  loss: 0.523,
  accuracy: 0.78
}

// Treinamento completo
{
  type: 'trainingComplete',
  accuracy: 0.85,
  loss: 0.32,
  modelId: 42
}

// Recomendações
{
  type: 'recommendations',
  userId: 1,
  recommendations: [...]
}
```

# 🛠️ Tecnologias

**Backend**
- Tecnologia	Versão	Uso
- Node.js	22+	Runtime
- Express	4.18+	API REST
- TensorFlow.js	4.15+	Deep Learning
- PostgreSQL	15+	Banco de dados
- pgvector	0.5+	Operações vetoriais
- Knex	3.0+	Query builder
- WebSocket	8.14+	Comunicação real-time
- pg	8.11+	Driver PostgreSQL

**Frontend**
- Tecnologia	Versão	Uso
- Vanilla JS	ES2022	Lógica da aplicação
- Bootstrap	5.3	UI Framework
- TensorFlow.js Vis	1.5+	Visualização de métricas
- Web Workers	-	Thread isolada para WebSocket

**Desenvolvimento**
- Ferramenta	Uso
- Nodemon	Hot reload backend
- Browser-sync	Live reload frontend
- ESLint	Linting (recomendado)
- Prettier	Formatação (recomendado)


# 🐛 Troubleshooting

**Erro: (0 , util_1.isNullOrUndefined)** is not a function
Solução: Atualize para Node.js 22+
nvm install 22
nvm use 22

**Erro: relation "customers"** does not exist
Solução: Execute as migrations
cd backend
npm run migrate:latest
npm run db:seed

**Erro: type vector** does not exist
Solução: Instale pgvector no PostgreSQL
- **Ubuntu/Debian**
sudo apt-get install postgresql-16-pgvector

- **Fedora/Red Hat/Rock Linux/AlmaLlinux**
dnf -y install pgvector-pg15(+)

- **macOS**
brew install pgvector

-  **Docker**
docker run -d --name pgvector -p 5432:5432 pgvector/pgvector:pg16

**Erro: Connection refused** no WebSocket
Solução: Verifique se o backend está rodando
curl http://localhost:3001/api/users

**Erro: Model not trained** yet
Solução: Clique em "Train Model" antes de solicitar recomendações

**Erro: Timeout ao conectar** o banco de dados
Solução: Verifique se PostgreSQL está ativo
sudo systemctl status postgresql ou
pg_isready -h localhost -p 5432

**Performance lenta no treinamento**
Solução: Reduza o número de epochs ou use GPU
// backend/services/ModelTrainingService.js
// Linha ~245: alterar epochs para 2
async configureAndTrain (trainData, epochs = 2)

# 🗺️ Roadmap

## Implementado ✅

- Sistema de embeddings com pgvector
- Treinamento de rede neural com TensorFlow.js
- API REST completa
- WebSocket para comunicação real-time
- Frontend com indicadores visuai
- Recomendações híbridas
- Persistência de modelos treinados

## Planejado 📅

- Sistema de cache para recomendações
- Testes unitários e integração
- Containerização com Docker
- CI/CD pipeline
- Dashboard administrativo
- Exportação de relatórios
- Suporte a múltiplos tenants
- Sistema de A/B testing
- Recomendações em tempo real baseadas em carrinho
- Análise de sentimentos de reviews

# 🎯 Comandos Rápidos de Referência

- npm run setup	(Instala todas as dependências)
- npm start	(Inicia backend + frontend simultaneamente)
- npm run db:migrate (Executa migrations)
- npm run db:seed	(Popula o banco com dados)
- npm run db:reset	(Reseta completamente o banco)
- npm run start:backend	(Apenas backend)
- npm run start:frontend	(Apenas frontend)

# 🤝 Contribuindo

1) Fork o projeto
2) Crie sua branch (git checkout -b feature/AmazingFeature)
3) Commit suas mudanças (git commit -m 'Add some AmazingFeature')
4) Push para branch (git push origin feature/AmazingFeature)
5) Abra um Pull Request

# 📧 Contato
Autor: **Allyssonjm**
Email: **allyssonjm@gmail.com**
GitHub: **@allyssonjm**
Projeto: **PRS - Product Recommendation System**

# 🙏 Agradecimentos
Pós-graduação em Engenharia de Software com IA Aplicada - Anhanguera
TensorFlow.js team
PostgreSQL pgvector contributors
https://github.com/ErickWendel

**Feito com ❤️ para o curso de Engenharia de Software com IA Aplicada**
