<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KnowledgeTag extends Model
{
    use HasFactory;
    public $appends = ['tag'];

    public function getTagAttribute(){
        return $this->tag()->first();
    }
    public function tag(){
        return $this->belongsTo(Tag::class, 'tag_id', 'id');
    }
}
