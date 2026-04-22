<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

class ProductsController extends Controller
{

    /**
     * Show the user's products settings page.
     */
    public function show(Request $request)
    {

        $products = Product::select([
            'products.id',
            'products.product',
            DB::raw('cat.category'),
            DB::raw('clr.color'),
            DB::raw('sz.size'),
            DB::raw('brd.brand'),
            'products.price'
        ])->join(
            table: DB::raw('categories as cat'), 
            first: 'cat.id', 
            operator: '=', 
            second: DB::raw('products.category_id')
        )->join(
            table: DB::raw('colors as clr'),
            first: 'clr.id',
            operator: '=',
            second: DB::raw('products.color_id')
        )->join(
            table: DB::raw('sizes as sz'),
            first: 'sz.id',
            operator: '=',
            second: DB::raw('products.size_id')
        )->join(
            table: DB::raw('brands as brd'),
            first: 'brd.id',
            operator: '=',
            second: DB::raw('products.brand_id')
        )->orderBy('products.product')->get();
    

        return response()->json($products->toArray());
    }
}
