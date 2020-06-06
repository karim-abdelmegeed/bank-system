<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    protected $with=['accounts'];

    public function accounts()
    {
        return $this->hasMany(Account::class,'bank_id');
    }

}
