<?php

use Illuminate\Database\Seeder;

class UserRolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=[
            ['name'=>'client'],
            ['name'=>'accountant']
        ];
        \App\UserRole::insert($data);
    }
}
