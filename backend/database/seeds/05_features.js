export async function seed(knex) {
  await knex('features').del();
  
  const features = [
    { feature: 'Ajustável' }, { feature: 'Algodão' }, { feature: 'Animal Print' },
    { feature: 'Básico(a)' }, { feature: 'Casual' }, { feature: 'Clássico(a)' },
    { feature: 'Colorido(a)' }, { feature: 'Confortável' }, { feature: 'Curto(a)' },
    { feature: 'Durável' }, { feature: 'Elástico(a)' }, { feature: 'Esportivo(a)' },
    { feature: 'Estampado(a)' }, { feature: 'Fit' }, { feature: 'Floral' },
    { feature: 'Formal' }, { feature: 'Jeans' }, { feature: 'Labubu' },
    { feature: 'Leve' }, { feature: 'Listrado' }, { feature: 'Longa' },
    { feature: 'Loney Tunes' }, { feature: 'Moleton' }, { feature: 'Poliéster' },
    { feature: 'Respirável' }, { feature: 'Saja' }, { feature: 'Seda' },
    { feature: 'Stitch' }, { feature: 'Temático(a)' }, { feature: 'Toy Store' },
    { feature: 'Turma da Mônica' }, { feature: 'Xadrez' }
  ].map(featureItem => ({
    ...featureItem,
    created_at: knex.fn.now(),
    updated_at: knex.fn.now()
  }));

  await knex('features').insert(features);
}