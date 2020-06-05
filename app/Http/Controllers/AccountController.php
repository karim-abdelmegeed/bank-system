<?php

namespace App\Http\Controllers;

use App\Account;
use App\Repositories\AccountRepository;
use App\Repositories\Repository;
use App\Rules\Positive;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AccountController extends Controller
{

    private $repository;

    public function __construct(Account $account)
    {
        $this->repository = new AccountRepository($account);
    }

    public function index()
    {
        return $this->repository->get();
    }

    public function store(Request $request)
    {
        $validator=$this->validateData($request->data);
        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }
        $this->repository->create($request->data);
    }

    public function update(Request $request,Account $account)
    {
        $validator=$this->validateData($request->data);
        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }
        $this->repository->update($request->data,$account);
    }

    public function validateData($data)
    {
        $validator = Validator::make($data, [
            "account_type_id" => "required|exists:account_types,id",
            "bank_id" => "required|exists:banks,id",
            "currency_id" => "required|exists:currencies,id",
            "branch" => "required|min:6",
            "account_number" => "required|numeric|min:15",
            "balance" => [new Positive],
        ]);
       return $validator;
    }

    public function deactivateAccount(Account $account)
    {
        $account->activated=0;
        $account->save();
        return response()->json("account deactivated successfully",200);
    }
}
