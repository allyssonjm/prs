<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ColorsSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela colors.
     *
     * @return void
     */
    public function run()
    {
        // Lista de cores únicas
        $colors = [
            [ 'color' => 'Azul' ],
            [ 'color' => 'Rosa' ],
            [ 'color' => 'Preto(a)' ],
            [ 'color' => 'Branco(a)' ],
            [ 'color' => 'Verde' ],
            [ 'color' => 'Vermelho(a)' ],
            [ 'color' => 'Amarelo(a)' ],
            [ 'color' => 'Cinza' ],
            [ 'color' => 'Azul Escuro(a)' ],
            [ 'color' => 'Rosa Choque' ],
            [ 'color' => 'Laranja' ],
            [ 'color' => 'Roxo(a)' ],
            [ 'color' => 'Marrom' ],
            [ 'color' => 'Bege' ],
            [ 'color' => 'Turquesa' ],
            [ 'color' => 'Lilás' ],
            [ 'color' => 'Dourado(a)' ],
            [ 'color' => 'Prata' ],
            [ 'color' => 'Vinho' ],
            [ 'color' => 'Cáqui' ],
        ];

        // Insere as cores na tabela
        DB::table('colors')->insert($colors);
    }
}
