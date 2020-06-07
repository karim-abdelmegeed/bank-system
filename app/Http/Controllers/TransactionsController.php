<?php

namespace App\Http\Controllers;

use App\Repositories\TransactionRepository;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Transaction;
use Illuminate\Support\Facades\Validator;

class TransactionsController extends Controller
{
    private $repository;

    public function __construct(Transaction $transaction)
    {
        $this->repository = new TransactionRepository($transaction);
    }

    public function index(Request $request)
    {
        return $this->repository->get($request);
    }

    public function doWithdraw(Request $request)
    {
        $this->validateWithdraw($request);
        return $this->repository->doWithdraw($request->data);
    }

    public function doDeposit(Request $request)
    {
        $this->validateDeposit($request);
        return $this->repository->doDeposit($request->data);
    }

    public function doTransfer(Request $request)
    {
        $validator=$this->validateTransfer($request);
        if($validator->fails()){
            return  response()->json($validator->errors(),422);
        }
        return $this->repository->doTransfer($request->data);
    }

    public function transferRollback(Request $request)
    {
        return $this->repository->transferRollback($request->id);
    }
    public function validateTransfer($request){
        $validator=Validator::make($request->all(),[
           'id'=>'required|exits,transactions'
        ]);
        return $validator;
    }
    public function validateDeposit($request){
        //todo
    }
    public function validateWithdraw($request){
        //todo
    }
}
