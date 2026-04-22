<?php

namespace Database\Seeders;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class PurcheasesSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela products com 5000 itens.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('pt_BR');

        $customers = DB::table('customers')->limit(100)->get()->pluck('id')->toArray();
        $salespeople = DB::table('salespeople')->get()->pluck('id')->toArray();
        $products = DB::table('products')->get()->pluck('id')->toArray();

        $purcheases = [];

        for ($i = 0; $i < 2500; $i++) {
            $total_products = mt_rand(1, 10);
            $dt_purchease = $this->generateUniqueTimestamp();
            $customer_id = $faker->randomElement($customers);
            $salesperson_id = $faker->randomElement($salespeople);
            $hash = $faker->unique()->sha1();

            for ($j = 0; $j < $total_products; $j++) {
                $purcheases[] = [
                    'product_id' => $faker->randomElement($products),
                    'salesperson_id' => $salesperson_id,
                    'customer_id' => $customer_id,
                    'dt_purchease' => $dt_purchease,
                    'purchease_hash' => $hash,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
                if (++$i >= 2500)
                    break;
            }
        }

        // Insere os produtos na tabela em lotes para eficiência
        DB::table('purcheases')->insert($purcheases);
    }


    /**
     * Gera um timestamp único aleatório entre 1 ano atrás e agora, restrito a horário comercial (9h às 18h),
     * com minutos e segundos aleatórios. Usa um contador estático para garantir unicidade absoluta,
     * adicionando microssegundos baseados no contador para evitar colisões mesmo se o timestamp base coincidir.
     * Mudanças para garantir unicidade: Introdução de contador estático que incrementa a cada chamada,
     * e adição de microssegundos calculados a partir do contador, assegurando que cada timestamp seja único.
     */
    function generateUniqueTimestamp()
    {
        static $counter = 0;
        $counter++;

        // Data aleatória entre 1 ano atrás e agora
        $start = Carbon::now()->subYear();
        $end = Carbon::now();
        $randomDate = Carbon::createFromTimestamp(mt_rand($start->timestamp, $end->timestamp));

        // Hora aleatória entre 9h e 18h
        $randomHour = mt_rand(9, 17); // 17 para garantir até 17:59:59

        // Minutos e segundos aleatórios
        $randomMinute = mt_rand(0, 59);
        $randomSecond = mt_rand(0, 59);

        // Definir hora, minuto, segundo
        $randomDate->setHour($randomHour)->setMinute($randomMinute)->setSecond($randomSecond);

        // Adicionar microssegundos baseados no contador para unicidade
        $microseconds = ($counter % 1000000); // Ciclo a cada 1 segundo para evitar overflow
        $randomDate->setMicroseconds($microseconds);

        // Retornar como string com microssegundos para maior precisão
        return $randomDate->format('Y-m-d H:i:s.u');
    }

}
