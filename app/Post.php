<?php

namespace App;

use Carbon\Carbon;
use App\Services\Markdowner;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Post extends Model
{
    protected $dates = ['published_at'];
    protected $fillable = [
        'title','subtitle','content_raw','page_image','meta_description','layout','is_draft','published_at',
    ];

    /**
      * @description the many-tomany relationship between posts and tags
      *
      * @param $param
      * @return $return belongstomany
      * @author guilong
      * @date $date 2018-07-25
    */
    public function tags(){
        return $this->belongsToMany('App\Tag','post_tag_pivot');
    }

    /**
      * @description set the title attribute and automatically the slug
      *
      * @param $param string value
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function setTitleAttribute($value){
        $this->attributes['title'] = $value;

        if(!$this->exists){
            $this->attributes['slug'] = str_slug($value);
        }
    }

    /**
      * @description recursive routine to set a unique slug
      *
      * @param $param title
      * @return $return extra
      * @author guilong
      * @date $date 2018-07-25
    */
    protected function setUniqueSlug($title,$extra){
        $slug = str_slug($title.'-'.$extra);

        if(static::whereSlug($slug)->exists()){
            $this->setUniqueSlug($title,$extra+1);
            return;
        }

        $this->attributes['slug'] = $slug;
    }

    /**
      * @description set the html content automatically when the raw content is set
      *
      * @param $param  string $value
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function setContentRawAttribute($value){
        $markdown = new Markdowner();

        $this->attributes['content_raw'] = $value;
        $this->attributes['content_html'] = $markdown->toHTML($value);
    }

    /**
      * @description sync tag relation adding new tags as needed
      *
      * @param $param array $tags
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function syncTags(array $tags){
        Tag::addNeededTags($tags);

        if(count($tags)){
            $this->tags()->sync(
                Tag::whereIn('tag',$tags)->pluck('id')->all()
            );
            return;
        }

        $this->tags()->detach();
    }

    /**
      * @description return the date portion of published_at
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function getPublishDateAttribute($value){
        return $this->published_at->format('Y-m-d');
    }

    /**
      * @description return the time portion of published_at
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function getPublishTimeAttribute($value){
        return $this->published_at->format('H:i:s');
    }

    /**
      * @description alias for content_raw
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function getContentAttribute($value){
        return $this->content_raw;
    }

    /**
      * @description return url to post
      *
      * @param $param tag $tag
      * @return $return string
      * @author guilong
      * @date $date 2018-07-27
    */
    public function url(Tag $tag=null){
        $url = url('blog/'.$this->slug);
        if($tag){
            $url .= "?tag=".urlencode($tag->tag);
        }

        return $url;
    }

    /**
      * @description return array of tag links
      *
      * @param $param string $base
      * @return $return array
      * @author guilong
      * @date $date 2018-07-27
    */
    public function tagLinks($base = '/blog?tag=%TAG%'){
        $tags = $this->tags()->pluck('tag');
        $return = [];
        foreach($tags as $tag){
            $url = str_replace('%TAG%',urlencode($tag),$base);
            $return[] = '<a href="'.$url.'" >'.e($tag).'</a>';
        }
        return $return;
    }

    /**
      * @description return next post after this on or null
      *
      * @param tag $tag
      * @return post
      * @author guilong
      * @date $date 2018-07-27
    */
    public function newerPost(Tag $tag=null){
        $query =
            static::where('published_at','>',$this->published_at)
            ->where('published_at','<=',Carbon::now())
            ->where('is_draft',0)
            ->orderBy('published_at','asc');
        if($tag){
            $query = $query->whereHas('tags',function($q) use ($tag){
                $q->where('tag','=',$tag->tag);
            });
        }
        return $query->first();
    }

    /**
      * @description return older post before the one or null
      *
      * @param tag $tag
      * @return post
      * @author guilong
      * @date $date 2018-07-27
    */
    public function olderPost(Tag $tag = null){
        $query =
            static::where('published_at','<',$this->published_at)
            ->where('is_draft',0)
            ->orderBy('published_at','desc');

        if($tag){
            $query = $query->whereHas('tags',function($q) use ($tag){
                $q->where('tag','=',$tag->tag);
            });
        }

        return $query->first();
    }
    
    /**
      * @description 一篇文章有多个评论
      *
      * @param 
      * @return HasMany
      * @author guilong
      * @date 2018-07-30
    */
    public function comments(){
        return $this->hasMany(CommentsArticle::class,'post_id');
    }

    /**
      * @description 获取这篇文章的评论以parent_id来分组
      *
      * @param
      * @return
      * @author guilong
      * @date 2018-07-30
    */
    public function getComments(){
        return $this->comments()->with('owner')->get()->groupBy('parent_id');
    }
}
