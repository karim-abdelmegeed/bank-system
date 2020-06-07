<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Operation extends Model
{
    protected $fillable=['amount','currency_id','type','transaction_id'];
}
