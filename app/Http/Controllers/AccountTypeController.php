<?php

namespace App\Http\Controllers;

use App\AccountType;
use App\Repositories\Repository;
use Illuminate\Http\Request;

class AccountTypeController extends Controller
{
    private $repository;

    public function __construct(AccountType $accountType)
    {
        $this->repository = new Repository($accountType);
    }

    public function index()
    {
      return $this->repository->get();
    }
}
