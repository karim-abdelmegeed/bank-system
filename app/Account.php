<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
//    protected $with = ['accountType', 'bank', 'currency'];

    protected $fillable = ['user_id', 'bank_id',
        'currency_id',
        'account_type_id',
        'branch',
        'account_number',
        'balance'
    ];

    public function accountType()
    {
        return $this->belongsTo(AccountType::class);
    }

    public function bank()
    {
        return $this->belongsTo(Bank::class);
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }
}
