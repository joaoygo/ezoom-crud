<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index(){
        return response()->json(["tasks" => Task::all()]);
    }
    
    public function store(){
        $task = Task::create(request()->validate([
            'title' => 'required',
            'done' => 'required|boolean',
        ]));

        return response()->json(["task" => $task]);
    }
    
    public function update(Task $task){

        $task->update(request()->validate([
            'title' => 'required',
            'done' => 'required|boolean',
        ]));

        return response()->json(["task" => $task]);
    }
    
    public function destroy(Task $task){
        $task->delete();
    }
}
