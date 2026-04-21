<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id(); 
            $table->string('category', 255)->unique()->notNull(); 
            $table->timestamps();
            $table->index('category'); 
        });

        Schema::create('colors', function (Blueprint $table) {
            $table->id(); 
            $table->string('color', 100)->unique()->notNull(); 
            $table->timestamps();
            $table->index('color'); 
        });

        Schema::create('sizes', function (Blueprint $table) {
            $table->id(); 
            $table->string('size', 20)->unique()->notNull(); 
            $table->timestamps();
            $table->index('size'); 
        });

        Schema::create('brands', function (Blueprint $table) {
            $table->id(); 
            $table->string('brand', 100)->unique()->notNull(); 
            $table->timestamps();
            $table->index('brand'); 
        });

        Schema::create('features', function (Blueprint $table) {
            $table->id(); 
            $table->string('feature', 50)->unique()->notNull(); 
            $table->timestamps();
            $table->index('feature'); 
        });
        
        Schema::create('clients', function (Blueprint $table) {
            $table->id(); 
            $table->string('name', 50)->notNull(); 
            $table->integer('age')->notNull();
            $table->index('age');
            $table->timestamps();
        });

        Schema::create('salespeople', function (Blueprint $table) {
            $table->id(); 
            $table->string('name', 50)->notNull(); 
            $table->string('nickname', 50)->unique()->notNull();
            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->index('nickname');
            $table->timestamps();
        });

        Schema::create('products', function (Blueprint $table) {
            $table->id(); 
            $table->string('product', 255)->notNull(); 
            $table->foreignId('feature_id')->constrained('features')->cascadeOnDelete(); 
            $table->foreignId('category_id')->constrained('categories')->cascadeOnDelete(); 
            $table->foreignId('color_id')->constrained('colors')->cascadeOnDelete(); 
            $table->foreignId('size_id')->constrained('sizes')->cascadeOnDelete(); 
            $table->decimal('price', 10, 2)->notNull(); 
            $table->foreignId('brand_id')->constrained('brands')->cascadeOnDelete(); 
            $table->timestamps();
            $table->index([ 'category_id', 'color_id', 'size_id' ]); 
        });

        Schema::create('purcheases', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->cascadeOnDelete();
            $table->foreignId('client_id')->constrained('clients')->cascadeOnDelete();
            $table->foreignId('salesperson_id')->constrained('salespeople')->cascadeOnDelete();
            $table->datetime('dt_purchease')->notNull();
            $table->string('purchease_hash', 50)->notNull();
            $table->index('purchease_hash');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purcheases');
        Schema::dropIfExists('products');
        Schema::dropIfExists('brands');
        Schema::dropIfExists('features');
        Schema::dropIfExists('sizes');
        Schema::dropIfExists('colors');
        Schema::dropIfExists('categories');
        Schema::dropIfExists('clients');
        Schema::dropIfExists('salespeople');
    }
};
