<?php


namespace App\Repositories;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class AccountRepository extends Repository implements RepositoryInterface
{
    public function __construct(Model $model)
    {
        parent::__construct($model);
    }

    public function get()
    {
        return $this->model
            ->where('user_id', Auth::id())
            ->orderBy('created_at','desc')
            ->paginate(10);
    }
}
