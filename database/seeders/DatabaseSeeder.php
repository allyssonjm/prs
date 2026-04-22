<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {

        $this->call([
            CategoriesSeeder::class,
            CustomersSeeder::class,
            SalespeopleSeeder::class,
            ColorsSeeder::class,
            SizesSeeder::class,
            FeaturesSeeder::class,
            BrandsSeeder::class,
            ProductsSeeder::class,
            PurcheasesSeeder::class,
        ]);
    }
}
