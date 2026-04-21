<?php

namespace App\Http\Controllers\Settings;

use App\Http\Controllers\Controller;
use App\Http\Requests\Settings\TwoFactorAuthenticationRequest;
use App\Models\SalesPerson;
use Inertia\Inertia;
use Inertia\Response;

class SalesPeopleController extends Controller
{

    /**
     * Show the user's salespeople settings page.
     */
    public function show(TwoFactorAuthenticationRequest $request)
    {
        $request->ensureStateIsValid();

        $salespeople = SalesPerson::select([
            'salespeople.name',
            'salespeople.nickname',
            'users.email',
            'users.avatar'
        ])->join ('users','salespeople.user_id','=','users.id')
        ->orderBy('name')->get();
    

        return response()->json($salespeople->toArray());
    }
}
