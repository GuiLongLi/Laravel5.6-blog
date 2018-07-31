<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Services\UploadsManager;
use App\Http\Requests\UploadFileRequest;
use App\Http\Requests\UploadNewFolderRequest;
use Illuminate\Support\Facades\File;
use App\Http\Controllers\Controller;

class UploadController extends Controller
{
    protected $manager;

    public function __construct(UploadsManager $manager)
    {
        $this->manager = $manager;
    }

    /**
      * @description show page of files / subfolders
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function index(Request $request){
        $folder = $request->get('folder');
        $data = $this->manager->folderInfo($folder);

        return view('admin.upload.index',$data);
    }

    /**
      * @description 创建新目录
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function createFolder(UploadNewFolderRequest $request){
        $new_folder = $request->get('new_folder');
        $folder = $request->get('folder').'/'.$new_folder;

        $result = $this->manager->createDirectory($folder);

        if($result === true){
            return redirect()
                ->back()
                ->withSuccess("Folder '$new_folder' created.");
        }

        $error = $result ? $result : "An error occurred creating directory.";
        return redirect()
            ->back()
            ->withErrors([$error]);
    }

    /**
      * @description 删除文件
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function deleteFile(Request $request){
        $del_file = $request->get('del_file');
        $path = $request->get('folder').'/'.$del_file;

        $result = $this->manager->deleteFile($path);
        if($result === true){
            return redirect()
                ->back()
                ->withSuccess("File '$del_file' deleted.");
        }

        $error = $result ? : "An error occurred deleteing file.";
        return redirect()
            ->back()
            ->withErrors([$error]);
    }

    /**
      * @description 删除目录
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function deleteFolder(Request $request){
        $del_folder = $request->get('del_folder');
        $folder = $request->get('folder').'/'.$del_folder;

        $result = $this->manager->deleteDirectory($folder);

        if($result === true){
            return redirect()
                ->back()
                ->withSuccess("Folder '$del_folder' deleted.");
        }

        $error = $result ? : "An error occurred deleting directory.";
        return redirect()
            ->back()
            ->withErrors([$error]);
    }

    /**
      * @description 上传文件
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-24
    */
    public function uploadFile(UploadFileRequest $request){
        $file = $_FILES['file'];
        $ext = @explode('/',$file["type"]);
        $ext = !empty($ext[1]) ? '.'.$ext[1] :  '';
        $fileName = $request->get('file_name');
        $fileName = $fileName ? $fileName : $file['name'];
        $fileName = stripos('.',$fileName) !== false ? $fileName : $fileName.$ext;
        $path = str_finish($request->get('folder'),'/').$fileName;
        $content = File::get($file['tmp_name']);

        $result = $this->manager->saveFile($path,$content);

        if($result === true){
            return redirect()
                ->back()
                ->withSuccess("File '$fileName' uploaded.");
        }

        $error = $result ?: "An error occurred uploading file.";
        return redirect()
            ->back()
            ->withErrors([$error]);
    }
}
