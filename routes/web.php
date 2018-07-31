<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

//Blog page
Route::get('/', function () {
    return redirect('/blog');
});
Route::get('blog',"BlogController@index");
Route::get('blog/{slug}',"BlogController@showPost");
Route::post('blog/comments/{post_id}',"BlogController@postComments")->name('blog/comments');

Route::get('contact','ContactController@showForm');
Route::post('contact','ContactController@sendContactInfo');

Route::get('rss','BlogController@rss');
Route::get('sitemap.xml','BlogController@siteMap');

// admin area
Route::get('admin',function(){
    return redirect('/admin/post');
});
Route::group(['namespace'=>'Admin','middleware'=>'auth'],function(){
   Route::resource('admin/post','PostController',['except'=>'show'])
       ->name('index','admin.post.index')
       ->name('create','admin.post.store')
       ->name('update','admin.post.update')
       ->name('destroy','admin.post.destroy')
       ->name('store','admin.post');
   Route::post('admin/post/create','PostController@store');
   Route::resource('admin/tag','TagController',['except'=>'show']);

    //upload
    Route::get('admin/upload','UploadController@index');
    Route::post('admin/upload/file','UploadController@uploadFile');
    Route::delete('admin/upload/file','UploadController@deleteFile');
    Route::post('admin/upload/folder','UploadController@createFolder');
    Route::delete('admin/upload/folder','UploadController@deleteFolder');
});

//logging in and out
Route::get('/auth/login','Auth\AuthController@showLoginForm')->name('login');
Route::post('/auth/login','Auth\AuthController@login')->name('login');
Route::any('/auth/logout','Auth\AuthController@logout')->name('logout');




