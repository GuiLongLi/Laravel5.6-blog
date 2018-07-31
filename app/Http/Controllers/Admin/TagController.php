<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\TagUpdateRequest;
use App\Tag;
use App\Http\Requests\TagCreateRequest;
use App\Http\Controllers\Controller;

class TagController extends Controller
{
    protected $fields = [
        'tag' => '',
        'title' => '',
        'subtitle' => '',
        'meta_description' => '',
        'page_image' => '',
        'layout' => 'blog.layouts.index',
        'reverse_direction' => 0,
    ];
    /**
      * @description
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function index(){
        $tags = Tag::all();
        return view('admin.tag.index')->withTags($tags);
    }

    /**
      * @description show form for creating new tag
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function create(){
        $data = [];
        foreach($this->fields as $field => $default){
            $data[$field] = old($field,$default);
        }

        return view('admin.tag.create',$data);
    }

    /**
      * @description store the newly created tag in the database
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function store(TagCreateRequest $request){
        $tag = new Tag();
        foreach(array_keys($this->fields) as $field){
            $tag->$field = $request->get($field);
        }
        $tag->save();

        return redirect('/admin/tag')
            ->withSuccess("The tag '$tag->tag' was created.");
    }

    /**
      * @description show the form for editiong a tag
      *
      * @param $param int $id
      * @return $return response
      * @author guilong
      * @date $date 2018-07-24
    */
    public function edit($id){
        $tag = Tag::findOrFail($id);
        $data = ['id'=>$id];
        foreach(array_keys($this->fields) as $field){
            $data[$field] = old($field,$tag->$field);
        }

        return view('admin.tag.edit',$data);
    }

    /**
      * @description update the tag in storage
      *
      * @param $param TagUpdateRequest $request
      * @param $param Int $id
      * @return $return response
      * @author guilong
      * @date $date 2018-07-24
    */
    public function update(TagUpdateRequest $request,$id){
        $tag = Tag::findOrFail($id);
        foreach(array_keys(array_except($this->fields,['tag'])) as $field){
            $tag->$field = $request->get($field);
        }
        $tag->save();

        return redirect("/admin/tag/$id/edit")
            ->withSuccess('Changes saved.');
    }

    /**
      * @description delete the tag
      *
      * @param $param int $id
      * @return $return response
      * @author guilong
      * @date $date 2018-07-24
    */
    public function destroy($id){
        $tag = Tag::findOrFail($id);
        $tag->delete();

        return redirect('/admin/tag')
            ->withSuccess("The '$tag->tag' tag has been deleted.");
    }
}
