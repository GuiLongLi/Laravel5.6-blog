<?php

namespace App\Http\Controllers;

use App\Services\RssFeed;
use App\Jobs\BlogIndexData;
use App\Http\Requests\CommentsArticleCreateRequest;
use Illuminate\Http\Request;
use App\Tag;
use App\Post;
use App\CommentsArticle;
use Illuminate\Support\Facades\DB;
use App\Services\SiteMap;

class BlogController extends Controller
{
    public function index(Request $request)
    {
        $tag = $request->get('tag');
        $data = $this->dispatch(new BlogIndexData($tag));
        $layout = $tag ? Tag::layout($tag) : 'blog.layouts.index';
        return view($layout,$data);
    }

    public function showPost($slug,Request $request){
        $post = Post::with('tags')->whereSlug($slug)->firstOrFail();
        $tag = $request->get('tag');
        if($tag){
            $tag = Tag::whereTag($tag)->firstOrFail();
        }
        //获取评论
        $postObj = Post::find($post['id']);
        $comments = $postObj->load('comments.owner')->getComments();
        $comments['root'] = isset($comments[$post['id']]) ? $comments[$post['id']] : [];
        unset($comments[$post['id']]);
        return view($post->layout,compact('post','tag','comments'));
    }

    /**
      * @description 用户进行评论
      *
      * @param
      * @return
      * @author guilong
      * @date 2018-07-30
    */
    public function postComments(CommentsArticleCreateRequest $request){
        $post = CommentsArticle::create($request->postFillData());

        return back();
    }

    public function rss(RssFeed $feed){
        $rss = $feed->getRSS();

        return response($rss)
            ->header('Content-type','application/rss+xml');
    }

    public function siteMap(SiteMap $siteMap){
        $map = $siteMap->getSiteMap();

        return response($map)
            ->header('Content-type','text/xml');
    }
}
