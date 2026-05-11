import { faker } from '@faker-js/faker/locale/pt_BR';

export async function seed(knex) {
  await knex('products').del();
  
  // Buscar todos os dados necessários
  const categories = await knex('categories').select('id', 'category');
  const colors = await knex('colors').select('id', 'color');
  const sizes = await knex('sizes').select('id', 'size');
  const brands = await knex('brands').select('id', 'brand');
  const features = await knex('features').select('id', 'feature');
  
  const products = [];
  
  for (let i = 0; i < 5000; i++) {
    const color = faker.helpers.arrayElement(colors);
    const category = faker.helpers.arrayElement(categories);
    const size = faker.helpers.arrayElement(sizes);
    const feature = faker.helpers.arrayElement(features);
    const brand = faker.helpers.arrayElement(brands);
    
    products.push({
      product: `${category.category} ${feature.feature} ${color.color} (${brand.brand})`,
      price: faker.number.float({ min: 10, max: 120, multipleOf: 0.01 }),
      category_id: category.id,
      color_id: color.id,
      size_id: size.id,
      feature_id: feature.id,
      brand_id: brand.id,
      created_at: knex.fn.now(),
      updated_at: knex.fn.now()
    });
  }
  
  // Inserir em batches de 500 para performance
  const batchSize = 500;
  for (let i = 0; i < products.length; i += batchSize) {
    const batch = products.slice(i, i + batchSize);
    await knex('products').insert(batch);
  }
}