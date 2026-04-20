<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FeaturesSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela features.
     *
     * @return void
     */
    public function run()
    {
        
        $features = [
            ['feature' => 'Ajustável'],
            ['feature' => 'Algodão'],
            ['feature' => 'Animal Print'],
            ['feature' => 'Básico(a)'],
            ['feature' => 'Casual'],
            ['feature' => 'Clássico(a)'],
            ['feature' => 'Colorido(a)'],
            ['feature' => 'Confortável'],
            ['feature' => 'Curto(a)'],
            ['feature' => 'Durável'],
            ['feature' => 'Elástico(a)'],
            ['feature' => 'Esportivo(a)'],
            ['feature' => 'Estampado(a)'],
            ['feature' => 'Fit'],
            ['feature' => 'Floral'],
            ['feature' => 'Formal'],
            ['feature' => 'Jeans'],
            ['feature' => 'Labubu'],
            ['feature' => 'Leve'],
            ['feature' => 'Listrado'],
            ['feature' => 'Longa'],
            ['feature' => 'Loney Tunes'],
            ['feature' => 'Moleton'],
            ['feature' => 'Poliéster'],
            ['feature' => 'Respirável'],
            ['feature' => 'Saja'],
            ['feature' => 'Seda'],
            ['feature' => 'Stitch'],
            ['feature'=> 'Temático(a)'],
            ['feature'=> 'Toy Store'],
            ['feature'=> 'Turma da Mônica'],
            ['feature'=> 'Xadrez'],
        ];

        // Insere as marcas na tabela
        DB::table('features')->insert($features);
    }
}
