<?php

namespace Database\Seeders;
use App\Helpers\AvatarHelper;
use App\Helpers\UnaccentHelper;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class SalespeopleSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela salespeople com 120 itens.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('pt_BR');

        $salespeople = [];

        for ($i = 0; $i < 10; $i++) {
            $firstname = $faker->firstName;
            $lastname = $faker->lastName;
            $name = "$firstname  $lastname";
            $nickname = Str::lower("$firstname.$lastname");
            
            $user = User::create(
                attributes: [ 
                    'name' => $name,    
                    'email' => UnaccentHelper::remove("$nickname@psr.net"),
                    'password' => Hash::make('senha1234'),
                    'avatar' => AvatarHelper::generateRandomAvatar(),
                    'email_verified_at' => now()->format('Y-m-d H:i:s.u'),
                    'uuid' => Str::uuid(),
                ]
            );
            
            $salespeople[] = [
                'name' => $name,
                'nickname' => $nickname,
                'user_id' => $user->id,
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        // Insere os vendedores na tabela em lotes para eficiência
        DB::table('salespeople')->insert($salespeople);
    }
}
