export async function seed(knex) {
  await knex('colors').del();
  
  const colors = [
    { color: 'Azul' },
    { color: 'Rosa' },
    { color: 'Preto(a)' },
    { color: 'Branco(a)' },
    { color: 'Verde' },
    { color: 'Vermelho(a)' },
    { color: 'Amarelo(a)' },
    { color: 'Cinza' },
    { color: 'Azul Escuro(a)' },
    { color: 'Rosa Choque' },
    { color: 'Laranja' },
    { color: 'Roxo(a)' },
    { color: 'Marrom' },
    { color: 'Bege' },
    { color: 'Turquesa' },
    { color: 'Lilás' },
    { color: 'Dourado(a)' },
    { color: 'Prata' },
    { color: 'Vinho' },
    { color: 'Cáqui' },
  ].map(colorItem => ({
    ...colorItem,
    created_at: knex.fn.now(),
    updated_at: knex.fn.now()
  }));

  await knex('colors').insert(colors);
}