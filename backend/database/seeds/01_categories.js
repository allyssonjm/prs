export async function seed(knex) {
  await knex('categories').del();
  
  const categories = [
    { category: 'Bermuda' },
    { category: 'Biquine' },
    { category: 'Blusa' },
    { category: 'Calçado' },
    { category: 'Calça' },
    { category: 'Calcinha' },
    { category: 'Camisa' },
    { category: 'Camiseta' },
    { category: 'Casaco' },
    { category: 'Cueca' },
    { category: 'Jaqueta' },
    { category: 'Macacão' },
    { category: 'Maiô' },
    { category: 'Meia' },
    { category: 'Pijama' },
    { category: 'Saia' },
    { category: 'Short' },
    { category: 'Sunga' },
    { category: 'Sutiã' },
    { category: 'Top' },
    { category: 'Vestido' },
  ].map(cat => ({
    ...cat,
    created_at: knex.fn.now(),
    updated_at: knex.fn.now()
  }));

  await knex('categories').insert(categories);
}