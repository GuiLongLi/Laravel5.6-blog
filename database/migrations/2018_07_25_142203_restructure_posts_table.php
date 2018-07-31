<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class RestructurePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->string('subtitle')->after('title')->commit('文章副标题');
            $table->renameColumn('content','content_raw')->commit('markdown格式文本');
            $table->text('content_html')->after('content')->commit('使用markdown编辑内容但同时保持html版本');
            $table->string('page_image')->after('content_html')->commit('文章缩略图/封面图');
            $table->string('meta_description')->after('page_image')->commit('文章备注说明');
            $table->boolean('is_draft')->after('meta_description')->commit('该文章是否是草稿');
            $table->string('layout')->after('is_draft')->default('blog.layouts.post')->commit('使用的布局');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->dropColumn('layout');
            $table->dropColumn('is_draft');
            $table->dropColumn('meta_description');
            $table->dropColumn('page_image');
            $table->dropColumn('content_html');
            $table->renameColumn('content_raw','content');
            $table->dropColumn('subtitle');
        });
    }
}
