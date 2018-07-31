<?php

namespace App\Jobs;

use App\Post;
use App\Tag;
use Carbon\Carbon;

class PostFormFields
{
    /**
      * @description the id (if any) of the post row
      *
      * @param $param int
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    protected $id;

    /**
      * @description list of fields and default value for each field
      *
      * @param $param array
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    protected $fieldList = [
        'title' => '',
        'subtitle' => '',
        'page_image' => '',
        'content' => '',
        'meta_description' => '',
        'is_draft' => '0',
        'publish_date' => '',
        'publish_time' => '',
        'layout' => 'blog.layouts.post',
        'tags' => [],
    ];

    /**
      * @description create a new command instance
      *
      * @param $param int $id
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function __construct($id = null)
    {
        $this->id = $id;
    }

    /**
      * @description execute the command
      *
      * @param $param array of fieldnames => values
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function handle(){
        $fields = $this->fieldList;

        if($this->id){
            $fields = $this->fieldsFromModel($this->id,$fields);
        }else{
            $when = Carbon::now()->addHour();
            $fields['publish_date'] = $when->format('Y-m-d');
            $fields['publish_time'] = $when->format('H:i A');
        }

        foreach($fields as $fieldName => $fieldValue){
            $fields[$fieldName] = old($fieldName,$fieldValue);
        }

        return array_merge(
            $fields,
            ['allTags' => Tag::pluck('tag')->all()]
        );
    }

    /**
      * @description return the field values from the model
      *
      * @param $param int $id
      * @param $param array $fields
      * @return $return  array
      * @author guilong
      * @date $date 2018-07-25
    */
    protected function fieldsFromModel($id,array $fields){
        $post = Post::findOrFail($id);

        $fieldNames = array_keys(array_except($fields,['tags']));

        $fields = ['id'=>$id];
        foreach($fieldNames as $field){
            $fields[$field] = $post->{$field};
        }

        $fields['tags'] = $post->tags()->pluck('tag')->all();

        return $fields;
    }

}
