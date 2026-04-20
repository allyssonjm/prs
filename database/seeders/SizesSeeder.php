<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SizesSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela sizes.
     *
     * @return void
     */
    public function run()
    {

        $sizes = [
            [ 'size' => 'P' ],
            [ 'size' => 'M' ],
            [ 'size' => 'G' ],
            [ 'size' => 'GG' ],
            [ 'size' => 'U' ],
            [ 'size' => '35' ],
            [ 'size' => '36' ],
            [ 'size' => '37' ],
            [ 'size' => '38' ],
            [ 'size' => '39' ],
            [ 'size' => '40' ],
            [ 'size' => '42' ],
            [ 'size' => '44' ],
            [ 'size'=> '48'],
            [ 'size'=> '50'],
            [ 'size' => 'XS' ],
            [ 'size' => 'XL' ],
            [ 'size' => 'XXL' ],
            [ 'size'=> 'XXG'],
        ];

        // Insere os tamanhos na tabela
        DB::table('sizes')->insert($sizes);
    }
}
