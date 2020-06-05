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
           'name'=>'client',
           'email'=>'client@gmail.com',
           'password'=>bcrypt('123456'),
           'role_id'=>1
        ]);
        \App\User::insert([
           'name'=>'super',
           'email'=>'super@gmail.com',
           'password'=>bcrypt('123456'),
           'role_id'=>2
        ]);
        factory(\App\User::class,20)->create();
    }
}
