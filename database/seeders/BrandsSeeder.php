<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BrandsSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela brands.
     *
     * @return void
     */
    public function run()
    {
        
        $brands = [
            ['brand' => 'Adidas Kids'],
            ['brand' => 'Akazys'],
            ['brand' => 'Bendita Cute'],
            ['brand' => 'Boboi'],
            ['brand' => 'Brandille'],
            ['brand' => 'C&A Baby'],
            ['brand' => 'C&A Kids'],
            ['brand' => 'Carters'],
            ['brand' => 'Colcci Kids'],
            ['brand' => 'Conjunto Infantil'],
            ['brand' => 'Dafiti Kids'],
            ['brand' => 'Disney Baby'],
            ['brand' => 'Disney Kids'],
            ['brand' => 'Farm Kids'],
            ['brand' => 'Hering Kids'],
            ['brand' => 'Ki Carinho'],
            ['brand' => 'Kily'],
            ['brand' => 'Lacoste Kids'],
            ['brand' => 'Lilica Ripilica'],
            ['brand' => 'Maria Filó Kids'],
            ['brand' => 'Marisol'],
            ['brand' => 'Mundo Infantil'],
            ['brand' => 'Mundo Pet'],
            ['brand' => 'Osklen Kids'],
            ['brand' => 'Petit Royal'],
            ['brand' => 'Pimpolho'],
            ['brand' => 'Puket Kids'],
            ['brand' => 'Renner Kids'],
            ['brand' => 'Riachuelo Kids'],
            ['brand' => 'Salsa Jeans Kids'],
            ['brand' => 'Zoe Kids'],
        ];

        // Insere as marcas na tabela
        DB::table('brands')->insert($brands);
    }
}
