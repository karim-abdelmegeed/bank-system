<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;
use Illuminate\Support\Str;

$factory->define(\App\Account::class, function (Faker $faker) {
    return [
        'user_id' =>1 ,
        'bank_id' => $faker->numberBetween(1,4),
        'currency_id' =>$faker->numberBetween(1,3),
        'account_type_id' =>$faker->numberBetween(1,4), // password
        'branch' => Str::random(10),
        'account_number' => $faker->randomNumber(),
        'balance'=>$faker->numberBetween(200,5000)
    ];
});
