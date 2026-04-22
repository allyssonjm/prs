<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

class CustomersController extends Controller
{

    /**
     * Show the user's customers settings page.
     */
    public function show(Request $request)
    {

        $customers = Customer::select([
            'customers.id',
            'customers.name',
            'customers.age',
            'customers.avatar',
            DB::raw('sum(prod.price) as total_purchases'),
        ])->join(
            table: DB::raw('purcheases as pur'), 
            first: 'customers.id', 
            operator: '=', 
            second: DB::raw('pur.customer_id')
        )->join(
            table: DB::raw('products as prod'),
            first: 'pur.product_id',
            operator: '=',
            second: DB::raw('prod.id')
        )->groupBy('customers.id', 'customers.name', 'customers.age', 'customers.avatar', )
        ->orderBy('customers.name')->get();
    

        return response()->json($customers->toArray());
    }
}
