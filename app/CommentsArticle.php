<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommentsArticle extends Model
{
    protected $fillable = [
        'user_id','post_id','body','parent_id','create_at','update_at',
    ];

    protected $table = 'comments_article';
    /**
      * @description 这个评论所属的用户
      *
      * @param
      * @return
      * @author guilong
      * @date 2018-07-30
    */
    public function owner(){
        return $this->belongsTo(User::class,'user_id');
    }

    /**
      * @description 这个评论的子评论
      *
      * @param
      * @return
      * @author guilong
      * @date 2018-07-30
    */
    public function replies(){
        return $this->hasMany(CommentsArticle::class,'parent_id');
    }
}
