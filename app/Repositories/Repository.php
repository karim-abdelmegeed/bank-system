<?php


namespace App\Repositories;


use Illuminate\Database\Eloquent\Model;

class Repository implements RepositoryInterface
{

    protected $model;

    public function __construct(Model $model)
    {
        $this->model = $model;
    }

    public function get()
    {
       return $this->model->orderBy('created_at','desc')->paginate(10);
    }

    public function create($data)
    {
        $this->model->create($data);
    }

    public function update($data,$account)
    {
        $account->update($data);

    }

    public function delete($id)
    {
        // TODO: Implement delete() method.
    }
}
