<?php

namespace App\Http\Controllers;

use App\Currency;
use App\Repositories\Repository;
use Illuminate\Http\Request;

class CurrencyController extends Controller
{
    private $repository;

    public function __construct(Currency $currency)
    {
        $this->repository = new Repository($currency);
    }

    public function index()
    {
        return $this->repository->get();
    }
}
