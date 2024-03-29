<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UserRolesSeeder::class);
        $this->call(UserSeeder::class);
        $this->call(BankSeeder::class);
        $this->call(AccountTypeSeeder::class);
        $this->call(CurrenciesSeeder::class);
        $this->call(CurrencyConversionSeeder::class);
        $this->call(AccountSeeder::class);
    }
}
