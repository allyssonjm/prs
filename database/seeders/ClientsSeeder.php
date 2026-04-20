<?php

namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class ClientsSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela clients com 5000 itens.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('pt_BR');

        $clients = [];

        for ($i = 0; $i < 120; $i++) {
            $clients[] = [
                'name' => $faker->name,
                'age' => $faker->numberBetween(16, 70),
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        // Insere os clientes na tabela em lotes para eficiência
        DB::table('clients')->insert($clients);
    }
}
