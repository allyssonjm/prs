import { faker } from '@faker-js/faker/locale/pt_BR';

export async function seed(knex) {
  await knex('salespeople').del();
  
  const salespeople = [];
  
  for (let i = 0; i < 50; i++) {
    const firstName = faker.person.firstName();
    const lastName = faker.person.lastName();
    const name = `${firstName} ${lastName}`;
    const nickname = `${firstName.toLowerCase()}.${lastName.toLowerCase()}`;
    
    salespeople.push({
      name: name,
      nickname: nickname,
      created_at: knex.fn.now(),
      updated_at: knex.fn.now()
    });
  }

  await knex('salespeople').insert(salespeople);
}