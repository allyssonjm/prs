<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriesSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela categories.
     *
     * @return void
     */
    public function run()
    {
        // Lista de categorias únicas baseadas na planilha
        $categories = [
            [ 'category' => 'Bermuda' ],
            [ 'category' => 'Biquine' ],
            [ 'category' => 'Blusa' ],
            [ 'category' => 'Calçado' ],
            [ 'category' => 'Calça' ],
            [ 'category' => 'Calcinha' ],
            [ 'category' => 'Camisa' ],
            [ 'category' => 'Camiseta' ],
            [ 'category' => 'Casaco' ],
            [ 'category' => 'Cueca' ],
            [ 'category' => 'Jaqueta' ],
            [ 'category' => 'Macacão' ],
            [ 'category' => 'Maiô' ],
            [ 'category' => 'Meia' ],
            [ 'category' => 'Pijama' ],
            [ 'category' => 'Saia' ],
            [ 'category' => 'Short' ],
            [ 'category' => 'Sunga' ],
            [ 'category' => 'Sutiã' ],
            [ 'category' => 'Top' ],
            [ 'category' => 'Vestido' ],
        ];

        // Insere as categorias na tabela
        DB::table('categories')->insert($categories);
    }
}
