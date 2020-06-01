<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\User::insert([
           'name'=>'super',
           'email'=>'super@gmail.com',
            'password'=>bcrypt('123456')
        ]);
    }
}
