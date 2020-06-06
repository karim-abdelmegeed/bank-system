<?php


namespace App\Repositories;


use App\Bank;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class AccountRepository extends Repository implements RepositoryInterface
{
    public function __construct(Model $model)
    {
        parent::__construct($model);
    }

    public function get($request)
    {
        return $this->model
            ->with(['accountType', 'bank', 'currency'])
            ->where('user_id', Auth::id())
            ->orderBy('created_at', 'desc')
            ->paginate(10);
    }

    public function getBalance()
    {
        $accounts = $this->model->where('user_id', Auth::id())
            ->get();
        $banks = [];

        foreach ($accounts as $account) {
            if (!isset($banks[$account['bank']['name']])) {
                $banks[$account['bank']['name']] = $account['balance'];
            } else {
                $banks[$account['bank']['name']] += $account['balance'];
            }
        }
        return $banks;
    }
}
