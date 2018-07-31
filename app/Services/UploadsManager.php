<?php
/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 2018-07-24
 * Time: 上午 11:19
 */
namespace App\Services;

use Carbon\Carbon;
use Dflydev\ApacheMimeTypes\PhpRepository;
use Illuminate\Support\Facades\Storage;

class UploadsManager
{
    protected $disk;
    protected $mimeDetect;

    public function __construct(PhpRepository $mimeDetect)
    {
        $this->disk = Storage::disk(config('blog.uploads.storage'));
        $this->mimeDetect = $mimeDetect;
    }

    /**
      * @description return files and directories within a folder
      *
      * @param $param $folder
      * @return $return array of [
     *          'folder' => 'path to current folder',
     *          'folderName' => 'name of just current folder',
     *          'breadCrumbs' => 'breadcrumb array of [ $path => $foldername ],
     *          'folders' => array of [$path => $foldername] of each subfolder,
     *          'files' => array of file details on each file in folder
     * ]
      * @author guilong
      * @date $date 2018-07-24
    */
    public function folderInfo($folder){
        $folder = $this->cleanFolder($folder);

        $breadcrumbs = $this->breadcrumbs($folder);
        $slice = array_slice($breadcrumbs,-1);
        $folderName = current($slice);
        $breadcrumbs = array_slice($breadcrumbs,0,-1);

        $subfolders = [];
        foreach(array_unique($this->disk->directories($folder)) as $subfolder){
            $subfolders["/$subfolder"] = basename($subfolder);
        }

        $files = [];
        foreach($this->disk->files($folder) as $path){
            $files[] = $this->fileDetails($path);
        }

        return compact(
            'folder',
            'folderName',
            'breadcrumbs',
            'subfolders',
            'files'

        );
    }

    /**
      * @description sanitize the folder name
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    protected function cleanFolder($folder){
        return '/'.trim(str_replace('..','',$folder),'/');
    }

    /**
      * @description 返回当前目录路径
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    protected function breadcrumbs($folder){
        $folder = trim($folder,'/');
        $crumbs = ['/'=>'root'];

        if(empty($folder)){
            return $crumbs;
        }
        $folders = explode('/',$folder);
        $build = '';
        foreach($folders as $folder){
            $build .= '/'.$folder;
            $crumbs[$build] = $folder;
        }

        return $crumbs;
    }

    /**
      * @description 返回文件详细信息数组
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    protected function fileDetails($path){
        $path = '/'. ltrim($path,'/');

        return [
            'name' => basename($path),
            'fullPath' => $path,
            'webPath' => $this->fileWebpath($path),
            'mimeType' => $this->fileMimeType($path),
            'size' => $this->fileSize($path),
            'modified' => $this->fileModified($path),
        ];
    }

    /**
      * @description 返回文件完整 web 路径
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function fileWebpath($path){
        $path = rtrim(config('blog.uploads.webpath'),'/').'/'.ltrim($path,'/');
        return url($path);
    }

    /**
      * @description 返回文件mime类型
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function fileMimeType($path){
        return $this->mimeDetect->findType(
            pathinfo($path,PATHINFO_EXTENSION)
        );
    }

    /**
      * @description 返回文件大小
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function fileSize($path){
        return $this->disk->size($path);
    }

    /**
      * @description 返回最后修改时间
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function fileModified($path){
        return Carbon::createFromTimestamp(
            $this->disk->lastModified($path)
        );
    }

    /**
      * @description 创建新目录
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function createDirectory($folder){
        $folder = $this->cleanFolder($folder);

        if($this->disk->exists($folder)){
            return "Folder '$folder' already exists.";
        }
        return $this->disk->makeDirectory($folder);
    }

    /**
      * @description 删除目录
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function deleteDirectory($folder){
        $folder = $this->cleanFolder($folder);

        $filesFolders = array_merge(
            $this->disk->directories($folder),
            $this->disk->files($folder)
        );
        if(!empty($filesFolders)){
            return "Directory must be empty to delete it";
        }
        return $this->disk->deleteDirectory($folder);
    }

    /**
      * @description 删除文件
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function deleteFile($path){
        $path = $this->cleanFolder($path);
        if(!$this->disk->exists($path)){
            return "File does not exist";
        }
        return $this->disk->delete($path);
    }

    /**
      * @description 保存文件
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function saveFile($path,$content){
        $path = $this->cleanFolder($path);
        if($this->disk->exists($path)){
            return "File already exists.";
        }
        return $this->disk->put($path,$content);
    }
}
