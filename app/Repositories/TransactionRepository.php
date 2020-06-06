<?php


namespace App\Repositories;


use Illuminate\Database\Eloquent\Model;

class TransactionRepository extends Repository
{
    public function __construct(Model $model)
    {
        parent::__construct($model);
    }

    public function get($request)
    {
        if ($request->has('filter_by') && $request->has('filter_value')) {
            //TODO
        }
        return $this->model
            ->with(['currency','fromAccount','toAccount','fromAccount.bank','fromAccount.currency','toAccount.bank','toAccount.currency'])
            ->join('operations','operations.transaction_id','=','transactions.id')
            ->where('operations.type',$request->type)
            ->orderBy('transactions.created_at', 'desc')
            ->paginate(10);


    }

}
