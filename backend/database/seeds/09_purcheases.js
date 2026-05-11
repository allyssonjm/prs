import { faker } from '@faker-js/faker/locale/pt_BR';

/**
 * Gera timestamp único com horário comercial (9h-18h)
 */
function generateUniqueTimestamp(counter) {
  const start = new Date();
  start.setFullYear(start.getFullYear() - 1);
  const end = new Date();
  
  const randomTimestamp = faker.date.between({ from: start, to: end });
  const randomHour = faker.number.int({ min: 9, max: 17 });
  const randomMinute = faker.number.int({ min: 0, max: 59 });
  const randomSecond = faker.number.int({ min: 0, max: 59 });
  
  randomTimestamp.setHours(randomHour, randomMinute, randomSecond);
  
  // Adicionar microssegundos baseados no contador para unicidade
  randomTimestamp.setMilliseconds(counter % 1000);
  
  return randomTimestamp;
}

export async function seed(knex) {
  await knex('purcheases').del();
  
  const customers = await knex('customers').limit(100).pluck('id');
  const salespeople = await knex('salespeople').pluck('id');
  const products = await knex('products').pluck('id');
  
  const purcheases = [];
  let counter = 0;
  
  for (let i = 0; i < 2500; i++) {
    const totalProducts = faker.number.int({ min: 1, max: 10 });
    const dt_purchease = generateUniqueTimestamp(counter);
    const customer_id = faker.helpers.arrayElement(customers);
    const salesperson_id = faker.helpers.arrayElement(salespeople);
    const hash = faker.string.uuid();
    
    counter++;
    
    for (let j = 0; j < totalProducts; j++) {
      purcheases.push({
        product_id: faker.helpers.arrayElement(products),
        salesperson_id: salesperson_id,
        customer_id: customer_id,
        dt_purchease: dt_purchease,
        purchease_hash: hash,
        created_at: knex.fn.now(),
        updated_at: knex.fn.now()
      });
      
      if (purcheases.length >= 2500) break;
    }
    if (purcheases.length >= 2500) break;
  }
  
  // Inserir em batches
  const batchSize = 500;
  for (let i = 0; i < purcheases.length; i += batchSize) {
    const batch = purcheases.slice(i, i + batchSize);
    await knex('purcheases').insert(batch);
  }
}