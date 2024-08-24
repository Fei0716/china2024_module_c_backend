<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;

class TagController extends Controller
{
    public function index(){
        $tags = Tag::all();

        return response()->json([
            'tags' => $tags
        ], 200);
    }

    public function store(Request $request){
        $tag = new Tag();
        $tag->name = $request->input('new-tag');
        $tag->save();

        return response('New Tag Created!!!');
    }
}
