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

    public function get($request)
    {
        if ($request->has('filter_by') && $request->has('filter_value')) {
            return $this->model->where($request->filter_by, $request->filter_value)->get();
        }
        return $this->model->orderBy('created_at', 'desc')->paginate(10);
    }

    public function create($data)
    {
        $this->model->create($data);
    }

    public function update($data, $account)
    {
        $account->update($data);

    }

    public function delete($id)
    {
        // TODO: Implement delete() method.
    }
}
