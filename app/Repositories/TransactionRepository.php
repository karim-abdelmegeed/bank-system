<?php


namespace App\Repositories;


use App\Account;
use App\CurrencyConversion;
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
            ->with(['currency', 'fromAccount', 'toAccount', 'fromAccount.bank', 'fromAccount.currency', 'toAccount.bank', 'toAccount.currency'])
            ->join('operations', 'operations.transaction_id', '=', 'transactions.id')
            ->where('operations.type', $request->type)
            ->orderBy('transactions.created_at', 'desc')
            ->paginate(10);


    }

    public function doWithdraw($data)
    {
        $account_id = $data['data']['from_account']['id'];
        foreach ($data['data']['amount'] as $key => $amount) {
            $this->model->from_account_id = $account_id;
            $this->model->save();
            $operation = [
                'amount' => $amount,
                'type' => 'withdraw',
                'currency_id' => $data['data']['currency_id'][$key]
            ];
            $this->model->operations()->create($operation);
            $amount_in_account_currency = $this->currencyConvert($account_id, $data['data']['amount'][$key], $data['data']['currency_id'][$key]);
            $account = Account::find($account_id);
            $account->balance -= $amount_in_account_currency;
            $account->save();
        }
    }

    public function doDeposit($data)
    {
        $account_id = $data['data']['from_account']['id'];
        foreach ($data['data']['amount'] as $key => $amount) {
            $this->model->from_account_id = $account_id;
            $this->model->save();
            $operation = [
                'amount' => $amount,
                'type' => 'deposit',
                'currency_id' => $data['data']['currency_id'][$key]
            ];
            $this->model->operations()->create($operation);
            $amount_in_account_currency = $this->currencyConvert($account_id, $data['data']['amount'][$key], $data['data']['currency_id'][$key]);
            $account = Account::find($account_id);
            $account->balance += $amount_in_account_currency;
            $account->save();
        }
    }

    public function doTransfer($data)
    {
        $account_id = $data['data']['from_account']['id'];
        $to_account_id = $data['data']['to_account']['id'];
        $this->model->from_account_id = $account_id;
        $this->model->to_account_id = $to_account_id;
        $this->model->save();
        $operation = [
            'amount' => $data['data']['amount'][0],
            'type' => 'transfer',
            'currency_id' => $data['data']['currency_id'][0]
        ];
        $this->model->operations()->create($operation);
        $amount_in_account_currency = $this->currencyConvert($account_id, $data['data']['amount'][0], $data['data']['currency_id'][0]);
        $account = Account::find($account_id);
        $account->balance -= $amount_in_account_currency;
        $account->save();
        $amount_in_account_currency = $this->currencyConvert($to_account_id, $data['data']['amount'][0], $data['data']['currency_id'][0]);
        $account = Account::find($to_account_id);
        $account->balance += $amount_in_account_currency;
        $account->save();
    }

    public function currencyConvert($account_id, $amount, $currency)
    {
        $account = Account::find($account_id);
        $currency_conversion = CurrencyConversion::where('bank_id', $account->bank_id)
            ->where(function ($query) use ($account, $currency) {
                $query->where('from_currency', $account->currency_id)
                    ->where('to_currency', $currency);
            })
            ->orwhere(function ($query) use ($account, $currency) {
                $query->where('to_currency', $account->currency_id)
                    ->where('from_currency', $currency);
            })->first();
        if ($currency_conversion) {
            return $currency_conversion->rate * $amount;
        }
        return $amount; //two similar currencies

    }


}
