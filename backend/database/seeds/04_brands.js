export async function seed(knex) {
  await knex('brands').del();
  
  const brands = [
    { brand: 'Adidas Kids' }, { brand: 'Akazys' }, { brand: 'Bendita Cute' },
    { brand: 'Boboi' }, { brand: 'Brandille' }, { brand: 'C&A Baby' },
    { brand: 'C&A Kids' }, { brand: 'Carters' }, { brand: 'Colcci Kids' },
    { brand: 'Conjunto Infantil' }, { brand: 'Dafiti Kids' }, { brand: 'Disney Baby' },
    { brand: 'Disney Kids' }, { brand: 'Farm Kids' }, { brand: 'Hering Kids' },
    { brand: 'Ki Carinho' }, { brand: 'Kily' }, { brand: 'Lacoste Kids' },
    { brand: 'Lilica Ripilica' }, { brand: 'Maria Filó Kids' }, { brand: 'Marisol' },
    { brand: 'Mundo Infantil' }, { brand: 'Mundo Pet' }, { brand: 'Osklen Kids' },
    { brand: 'Petit Royal' }, { brand: 'Pimpolho' }, { brand: 'Puket Kids' },
    { brand: 'Renner Kids' }, { brand: 'Riachuelo Kids' }, { brand: 'Salsa Jeans Kids' },
    { brand: 'Zoe Kids' }
  ].map(brandItem => ({
    ...brandItem,
    created_at: knex.fn.now(),
    updated_at: knex.fn.now()
  }));

  await knex('brands').insert(brands);
}