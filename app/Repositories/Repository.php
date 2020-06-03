<?php


namespace App\Repositories;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Repository implements RepositoryInterface
{

    private $model;

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function get()
    {
       return $this->model->where('user_id', Auth::id())->paginate(10);
    }

    public function create($data)
    {
        // TODO: Implement create() method.
    }

    public function update($data)
    {
        // TODO: Implement update() method.
    }

    public function delete($id)
    {
        // TODO: Implement delete() method.
    }
}
