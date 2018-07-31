<?php
namespace App\Services;

use App\Post;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;

class SiteMap
{
    /**
      * @description return the content of the site map
      *
      * @param
      * @return
      * @author guilong
      * @date 2018-07-30
    */
    public function getSiteMap(){
        if(Cache::has('site-map')){
            return Cache::get('site-map');
        }

        $siteMap = $this->buildSiteMap();
        Cache::add('site-map',$siteMap,120);
        return $siteMap;
    }

    /**
      * @description build the site map
      *
      * @param
      * @return
      * @author guilong
      * @date 2018-07-30
    */
    protected function buildSiteMap(){
        $postsInfo = $this->getPostsInfo();
        $dates = array_values($postsInfo);
        sort($dates);
        $lastmod = last($dates);
        $url = trim(url('/'),'/').'/';

        $xml = [];
        $xml[] = '<?xml version="1.0" encoding="UTF-8"?'.'>';
        $xml[] = '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
        $xml[] = '  <url>';
        $xml[] = "    <loc>$url</loc>";
        $xml[] = "    <lastmod>$lastmod</lastmod>";
        $xml[] = '    <changefreq>daily</changefreq>';
        $xml[] = '    <priority>0.8</priority>';
        $xml[] = '  </url>';

        foreach ($postsInfo as $slug => $lastmod) {
            $xml[] = '  <url>';
            $xml[] = "    <loc>{$url}blog/$slug</loc>";
            $xml[] = "    <lastmod>$lastmod</lastmod>";
            $xml[] = "  </url>";
        }

        $xml[] = '</urlset>';

        return join("\n", $xml);
    }

    /**
      * @description return all the posts as $url => $date
      *
      * @param
      * @return
      * @author guilong
      * @date 2018-07-30
    */
    protected function getPostsInfo(){
        return Post::where('published_at','<=',Carbon::now())
            ->where('is_draft',0)
            ->orderBy('published_at','desc')
            ->pluck('updated_at','slug')
            ->all();
    }
}