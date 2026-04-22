<?php

use App\Http\Controllers\CustomersController;
use App\Http\Controllers\ProductsController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', fn () => Inertia::render('Welcome'))->name('home');

Route::middleware(['auth', 'verified'])->group(function (): void {
    Route::get('dashboard', fn () => Inertia::render('Dashboard'))->name('dashboard');
    Route::get('purcheases', fn () => Inertia::render('Purcheases'))->name('purcheases');
    Route::get('products', fn () => Inertia::render('Products'))->name('products');
    Route::get('products/list', [ ProductsController::class, 'show' ])->name('products.list');
    Route::get('customers', fn () => Inertia::render('Customers'))->name('customers');
    Route::get('customers/list', [ CustomersController::class, 'show' ])->name('customers.list');
});

require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
