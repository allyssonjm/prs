<?php

namespace Database\Seeders;
use App\Helpers\AvatarHelper;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class CustomersSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela customers com 5000 itens.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('pt_BR');

        $customers = [];

        for ($i = 0; $i < 120; $i++) {
            $customers[] = [
                'name' => $faker->name,
                'age' => $faker->numberBetween(16, 70),
                'avatar' => AvatarHelper::generateRandomAvatar(),
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        // Insere os clientes na tabela em lotes para eficiência
        DB::table('customers')->insert($customers);
    }
}
