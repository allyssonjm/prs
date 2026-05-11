export async function seed(knex) {
  await knex('sizes').del();
  
  const sizes = [
    { size: 'P' }, { size: 'M' }, { size: 'G' }, { size: 'GG' },
    { size: 'U' }, { size: '35' }, { size: '36' }, { size: '37' },
    { size: '38' }, { size: '39' }, { size: '40' }, { size: '42' },
    { size: '44' }, { size: '48' }, { size: '50' }, { size: 'XS' },
    { size: 'XL' }, { size: 'XXL' }, { size: 'XXG' }
  ].map(sizeItem => ({
    ...sizeItem,
    created_at: knex.fn.now(),
    updated_at: knex.fn.now()
  }));

  await knex('sizes').insert(sizes);
}