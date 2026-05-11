/**
 * Migration para criar todas as tabelas do sistema de produtos
 */
export async function up(knex) {
  // Tabela categories
  await knex.schema.createTable('categories', (table) => {
    table.bigIncrements('id').primary();
    table.string('category', 255).notNullable().unique();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    table.index('category');
  });

  // Tabela colors
  await knex.schema.createTable('colors', (table) => {
    table.bigIncrements('id').primary();
    table.string('color', 100).notNullable().unique();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    table.index('color');
  });

  // Tabela sizes
  await knex.schema.createTable('sizes', (table) => {
    table.bigIncrements('id').primary();
    table.string('size', 20).notNullable().unique();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    table.index('size');
  });

  // Tabela brands
  await knex.schema.createTable('brands', (table) => {
    table.bigIncrements('id').primary();
    table.string('brand', 100).notNullable().unique();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    table.index('brand');
  });

  // Tabela features
  await knex.schema.createTable('features', (table) => {
    table.bigIncrements('id').primary();
    table.string('feature', 50).notNullable().unique();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    table.index('feature');
  });

  // Tabela customers
  await knex.schema.createTable('customers', (table) => {
    table.bigIncrements('id').primary();
    table.string('name', 50).notNullable();
    table.integer('age').notNullable();
    table.string('avatar').nullable();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    table.index('age');
  });

  // Tabela salespeople
  await knex.schema.createTable('salespeople', (table) => {
    table.bigIncrements('id').primary();
    table.string('name', 50).notNullable();
    table.string('nickname', 50).notNullable().unique();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    table.index('nickname');
  });

  // Tabela products
  await knex.schema.createTable('products', (table) => {
    table.bigIncrements('id').primary();
    table.string('product', 255).notNullable();
    table.bigInteger('feature_id').unsigned().notNullable();
    table.bigInteger('category_id').unsigned().notNullable();
    table.bigInteger('color_id').unsigned().notNullable();
    table.bigInteger('size_id').unsigned().notNullable();
    table.decimal('price', 10, 2).notNullable();
    table.bigInteger('brand_id').unsigned().notNullable();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    
    // Foreign keys
    table.foreign('feature_id').references('id').on('features').onDelete('CASCADE');
    table.foreign('category_id').references('id').on('categories').onDelete('CASCADE');
    table.foreign('color_id').references('id').on('colors').onDelete('CASCADE');
    table.foreign('size_id').references('id').on('sizes').onDelete('CASCADE');
    table.foreign('brand_id').references('id').on('brands').onDelete('CASCADE');
    
    table.index(['category_id', 'color_id', 'size_id']);
  });

  // Tabela purcheases (atenção: nome com typo do original)
  await knex.schema.createTable('purcheases', (table) => {
    table.bigIncrements('id').primary();
    table.bigInteger('product_id').unsigned().notNullable();
    table.bigInteger('customer_id').unsigned().notNullable();
    table.bigInteger('salesperson_id').unsigned().notNullable();
    table.dateTime('dt_purchease').notNullable();
    table.string('purchease_hash', 50).notNullable();
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.timestamp('updated_at').defaultTo(knex.fn.now());
    
    // Foreign keys
    table.foreign('product_id').references('id').on('products').onDelete('CASCADE');
    table.foreign('customer_id').references('id').on('customers').onDelete('CASCADE');
    table.foreign('salesperson_id').references('id').on('salespeople').onDelete('CASCADE');
    
    table.index('purchease_hash');
  });
}

export async function down(knex) {
  await knex.schema.dropTableIfExists('purcheases');
  await knex.schema.dropTableIfExists('products');
  await knex.schema.dropTableIfExists('brands');
  await knex.schema.dropTableIfExists('features');
  await knex.schema.dropTableIfExists('sizes');
  await knex.schema.dropTableIfExists('colors');
  await knex.schema.dropTableIfExists('categories');
  await knex.schema.dropTableIfExists('customers');
  await knex.schema.dropTableIfExists('salespeople');
}