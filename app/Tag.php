<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $fillable = [
        'tag','title','subtitle','page_image','meta_description','reverse_direction',
    ];

    /**
      * @description 定义文章与标签之间多对多关联关系
      *
      * @param $param
      * @return $return belongstomany
      * @author guilong
      * @date $date 2018-07-25
    */
    public function posts(){
        return $this->belongsToMany('App\Post','post_tag_pivot');
    }

    /**
      * @description add any tags needed from the list
      *
      * @param $param array $tags list of tags to check/add
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public static function addNeededTags(array $tags){
        if(count($tags) === 0){
            return;
        }

        $found = static::whereIn('tag',$tags)->pluck('tag')->all();

        foreach(array_diff($tags,$found) as $tag){
            static::create([
                'tag' => $tag,
                'title' => $tag,
                'subtitle' => 'Subtitle for '.$tag,
                'page_image' => '',
                'meta_description' => '',
                'reverse_direction' => false,
            ]);
        }
    }

    /**
      * @description return the index layout to use for a tag
      *
      * @param $param string $tag
      * @param $param string $default
      * @return $return string
      * @author guilong
      * @date $date 2018-07-27
    */
    public static function layout($tag,$default = 'blog.layouts.index'){
        $layout = static::whereTag($tag)->pluck('layout');
        return $layout[0] ?: $default;
    }
}
