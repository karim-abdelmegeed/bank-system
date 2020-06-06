<?php

namespace App\Http\Controllers;

use App\Repositories\TransactionRepository;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Transaction;
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
}
