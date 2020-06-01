<?php

use Illuminate\Database\Seeder;

class CurrenciesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $currencies=[
            ['name'=>'egp'],
            ['name'=>'euro'],
            ['name'=>'usd']
        ];
        \App\Currency::insert($currencies);
    }
}
