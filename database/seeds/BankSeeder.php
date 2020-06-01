<?php

use Illuminate\Database\Seeder;

class BankSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $banks = [
            ['name' => 'CIB'],
            ['name' => 'QNB'],
            ['name' => 'HSBC'],
            ['name' => 'NBD']
        ];
        \App\Bank::insert($banks);
    }
}
