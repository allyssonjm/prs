import { faker } from '@faker-js/faker/locale/pt_BR';

// Helper para gerar avatar aleatório
function generateRandomAvatar() {
  const avatarStyles = ['adventurer', 'adventurer-neutral', 'avataaars', 'big-ears', 'bottts', 'croodles', 'fun-emoji', 'identicon', 'initials', 'lorelei', 'micah', 'miniavs', 'open-peeps', 'personas', 'pixel-art'];
  const style = avatarStyles[Math.floor(Math.random() * avatarStyles.length)];
  const seed = Math.random().toString(36).substring(7);
  return `https://api.dicebear.com/7.x/${style}/svg?seed=${seed}`;
}

export async function seed(knex) {
  await knex('customers').del();
  
  const customers = [];
  
  for (let i = 0; i < 120; i++) {
    customers.push({
      name: faker.person.fullName(),
      age: faker.number.int({ min: 16, max: 70 }),
      avatar: generateRandomAvatar(),
      created_at: knex.fn.now(),
      updated_at: knex.fn.now()
    });
  }

  // Inserir em batches para performance
  const batchSize = 50;
  for (let i = 0; i < customers.length; i += batchSize) {
    const batch = customers.slice(i, i + batchSize);
    await knex('customers').insert(batch);
  }
}