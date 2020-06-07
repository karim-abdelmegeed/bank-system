<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $table="transactions";

    protected $appends = ['Date'];

    public function operations()
    {
        return $this->hasMany(Operation::class);
    }

    public function fromAccount()
    {
        return $this->belongsTo(Account::class, 'from_account_id', 'id');
    }

    public function toAccount()
    {
        return $this->belongsTo(Account::class, 'to_account_id', 'id');
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }

    public function getDateAttribute()
    {
        return $this->created_at->format('y-m-d');
    }
}
