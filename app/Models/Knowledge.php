<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Knowledge extends Model
{
    use HasFactory;

    public $table = 'knowledges';
    public $primaryKey = 'id';
    //appends new attributes
    public $appends = ['images' ,'author' ,'knowledge_tags'];
    public function getImagesAttribute(){
        return $this->images()->get();
    }
    public function getAuthorAttribute(){
        return $this->author()->first();
    }
    public function getKnowledgeTagsAttribute(){
        return $this->knowledgeTags()->get();
    }
    //relations
    public function images(){
        return $this->hasMany(Image::class , 'knowledge_id', 'id');
    }
    public function author(){
        return $this->belongsTo(Admin::class , 'author_id', 'id');
    }
    public function knowledgeTags(){
        return $this->hasMany(KnowledgeTag::class , 'knowledge_id','id');
    }

}
