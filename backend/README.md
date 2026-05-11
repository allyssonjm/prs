# Como user

1. 1nstalar dependências: 
***npm i***
2. Configurar ambiente: 
***cp .env.example .env***
(Editar .env com suas credenciais do PostgreSQL)
3. Criar banco de dados (se necessário):
***createdb ecommerce_db***
4. Rodar migrations:
***npm run migrate***
5. Rodar seeders:
***npm run seed***
6. Configurar pgvector (opcional, para embeddings):
***npm run vector:setup***

"scripts": {
    "migrate": "knex migrate:latest",
    "migrate:rollback": "knex migrate:rollback",
    "migrate:make": "knex migrate:make",
    "seed": "knex seed:run",
    "seed:make": "knex seed:make",
    "db:reset": "knex migrate:rollback && knex migrate:latest && knex seed:run",
    "vector:setup": "psql -d $DB_NAME -f schema/full_schema.sql"
  }