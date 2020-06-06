<?php


namespace App\Repositories;


use Illuminate\Database\Eloquent\Model;

interface RepositoryInterface
{
    public function get($request);
    public function create($data);
    public function update($data,$model);
    public  function delete($id);
}
