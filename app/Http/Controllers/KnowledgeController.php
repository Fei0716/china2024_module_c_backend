<?php

namespace App\Http\Controllers;

use App\Models\Image;
use App\Models\Knowledge;
use App\Models\KnowledgeTag;
use App\Models\Tag;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class KnowledgeController extends Controller
{
    public function index(){
        $knowledges = Knowledge::where([
            'deleted_at' => null,
        ])->get();
        return response()->json([
            'knowledges' => $knowledges
        ], 200);
    }
    public function store(Request $request){
        try{
            //store the knowledge
            $knowledge = new Knowledge();
            $knowledge->title = $request->title;
            $knowledge->excerpt = $request->excerpt;
            $knowledge->content = $request->input('content');
            $knowledge->author_id = $request->admin->id;
            $knowledge->save();
            $knowledge->created_at = Carbon::parse($request->date);
            $knowledge->save();

            //store new tag
            if((bool)$request->newTag && $request->newTag != 'null'){
                $newTag = new Tag();
                $newTag->name = $request->newTag;
                $newTag->save();

                //store in knowledge tag
                $knowledgeTag = new KnowledgeTag();
                $knowledgeTag->knowledge_id = $knowledge->id;
                $knowledgeTag->tag_id = $newTag->id;
                $knowledgeTag->save();
            }
            //store knowledge tag
            // Process tags if they are comma-separated
            if ($request->has('tags') && $request->tags) {
                $tags = explode(',', $request->input('tags')); // Convert string to array
                if($tags && count($tags) > 0){
                    foreach ($tags as $tag) {
                        $newKnowledgeTag = new KnowledgeTag();
                        $newKnowledgeTag->knowledge_id = $knowledge->id;
                        $newKnowledgeTag->tag_id = $tag;
                        $newKnowledgeTag->save();
                    }
                }
            }

            //store the images
            foreach($request->file('images') as  $i){
                $fileName = uniqid('', true).'_'.now().'.'.$i->getClientOriginalExtension();
                //store in server
                Storage::putFileAs('public/images' , $i, $fileName);
                //store in db
                $image = new Image();
                $image->url = 'storage/images/'.$fileName;
                $image->knowledge_id =  $knowledge->id;
                $image->save();
            }


            return response('New Knowledge Created', 201);
        }catch(\Exception $e){
            return response( $e, 500);
        }
    }

    //for deleting a knowledge
    public function destroy(Knowledge $knowledge,  Request $request){
        try{
            //soft delete the knowledge
            $knowledge->deleted_at  = now();
            $knowledge->save();

            return response('Knowledge Deleted', 200);
        }catch(\Exception $e){
            return response( $e->getMessage() , 500);
        }
    }
    public function show(Knowledge $knowledge){
        return response()->json([
            'knowledge' => $knowledge
        ], 200);
    }
}
