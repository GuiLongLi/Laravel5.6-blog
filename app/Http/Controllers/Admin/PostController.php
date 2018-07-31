<?php

namespace App\Http\Controllers\Admin;

use App\Jobs\PostFormFields;
use App\Http\Requests;
use App\Http\Requests\PostCreateRequest;
use App\Http\Requests\PostUpdateRequest;
use App\Http\Controllers\Controller;
use App\Post;

class PostController extends Controller
{
    /**
      * @description  display a listing of the posts
      *
      * @param $param
      * @return $return response
      * @author guilong
      * @date $date 2018-07-23
    */
    public function index(){

        return view('admin.post.index')
            ->withPosts(Post::all());
    }

    /**
      * @description show the new post form
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function create(){
        $data = $this->dispatch(new PostFormFields());
        return view('admin.post.create',$data);
    }

    /**
      * @description store a newly created post
      *
      * @param $param postcreaterequest $request
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function store(PostCreateRequest $request){
        $post = Post::create($request->postFillData());
        $post->syncTags($request->get('tags',[]));

        return redirect()
            ->route('admin.post.index')
            ->withSuccess('new post successfully created.');
    }

    /**
      * @description show the post edit form
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function edit($id){
        $data = $this->dispatch(new PostFormFields($id));
        return view('admin.post.edit',$data);
    }

    /**
      * @description update the post
      *
      * @param $param PostUpdateRequest $request
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function update(PostUpdateRequest $request,$id){
        $post = Post::findOrFail($id);
        $post->fill($request->postFillData());
        $res = $post->save();
        $post->syncTags($request->get('tags',[]));
        if($request->action === 'continue'){
            return redirect()
                ->back()
                ->withSuccess('Post save.');
        }

        return redirect()
            ->route('admin.post.index')
            ->withSuccess('post save.');
    }

    /**
      * @description remove the specified resource from storage
      *
      * @param $param int $id
      * @return $return response
      * @author guilong
      * @date $date 2018-07-25
    */
    public function destroy($id){
        $post = Post::findOrFail($id);
        $post->tags()->detach();
        $post->delete();

        return redirect()
            ->route('admin.post.index')
            ->withSuccess('post deleted.');
    }
}
