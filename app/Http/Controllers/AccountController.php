<?php

namespace App\Http\Controllers;

use App\Account;
use App\Repositories\Repository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AccountController extends Controller
{

    private $repository;

    public function __construct(Account $account)
    {
        $this->repository = new Repository($account);
    }

    public function index()
    {
        return $this->repository->get();
    }

    public function store(Request $request)
    {
        $this->validateData($request->all());
        $this->repository->create($request->all());
    }

    public function update(Request $request,Account $account)
    {
        $this->validateData($request->all());
        $this->repository->update($request->all());
    }

    public function validateData($data)
    {
        $validator = Validator::make($data, [
            "type" => "required"
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
    }

    public function deActivateAccount(Account $account)
    {
        $account->activated=0;
        $account->save();
        return response()->json("account deactivated successfully",200);
    }
}
