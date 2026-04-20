<?php

namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class ProductsSeeder extends Seeder
{
    /**
     * Executa o seeder para popular a tabela products com 5000 itens.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('pt_BR');

        $categories =  DB::table('categories')->select(['id','category'])->get()->toArray();
        $colors = DB::table('colors')->select(['id','color'])->get()->toArray();
        $sizes = DB::table('sizes')->select(['id','size'])->get()->toArray();
        $brands = DB::table('brands')->select(['id','brand'])->get()->toArray();
        $features = DB::table('features')->select(['id','feature'])->get()->toArray();
        


        $products = [];

        for ($i = 0; $i < 5000; $i++) {
            $color = $faker->randomElement($colors);
            $category = $faker->randomElement($categories);
            $size = $faker->randomElement($sizes);
            $feature = $faker->randomElement($features);
            $brand = $faker->randomElement($brands);
            $products[] = [
                'product' => "$category->category $feature->feature $color->color ($brand->brand)",
                'price' => $faker->randomFloat(2, 10, 120),
                'category_id' => $category->id,
                'color_id' => $color->id,
                'size_id' => $size->id,
                'feature_id' => $feature->id,
                'brand_id' => $brand->id,
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        // Insere os produtos na tabela em lotes para eficiência
        DB::table('products')->insert($products);
    }
}
