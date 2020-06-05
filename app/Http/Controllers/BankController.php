<?php

namespace App\Http\Controllers;

use App\Bank;
use App\Repositories\Repository;
use Illuminate\Http\Request;

class BankController extends Controller
{
    private $repository;

    public function __construct(Bank $bank)
    {
        $this->repository = new Repository($bank);
    }

    public function index()
    {
        return $this->repository->get();
    }
}
