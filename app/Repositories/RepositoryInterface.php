<?php


namespace App\Repositories;


interface RepositoryInterface
{
    public function get();
    public function create($data);
    public function update($data);
    public  function delete($id);
}
