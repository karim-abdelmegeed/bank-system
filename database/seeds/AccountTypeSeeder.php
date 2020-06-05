<?php

use Illuminate\Database\Seeder;

class AccountTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=[
            [
             'name'=>'Current Account'
            ],
            [
                'name'=>'Saving Account'
            ],
            [
                'name'=>'Credit Account'
            ],
            [
                'name'=>'Joint Account'
            ]
        ];
        \App\AccountType::insert($data);
    }
}
