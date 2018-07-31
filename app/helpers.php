<?php
/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 2018-07-24
 * Time: 上午 11:04
 */

/**
  * @description 返回可读性更好的文件尺寸
  *
  * @param $param
  * @return $return  函数返回一个易读的文件尺寸
  * @author guilong
  * @date $date 2018-07-24
*/
function human_filesize($byt,$decimals = 2){
    $size = ['B','KB','MB','GB','TB','PB'];
    $factor = floor((strlen($byt)-1)/3);

    return sprintf("%.{$decimals}f",$byt/pow(1024,$factor)).@$size[$factor];
}

/**
  * @description 判断文件的mime类型是否图片
  *
  * @param $param
  * @return $return 函数在文件类型为图片的时候返回 true。
  * @author guilong
  * @date $date 2018-07-24
*/
function is_image($mimeType){
    return starts_with($mimeType,'image/');
}

/**
  * @description return 'checked' if true
  *
  * @param $param
  * @return $return
  * @author guilong
  * @date $date 2018-07-25
*/
function checked($value){
    return $value ? 'checked' : '';
}

/**
  * @description return img url for headers
  *
  * @param $param
  * @return $return
  * @author guilong
  * @date $date 2018-07-25
*/
function page_image($value = null){
    if(empty($value)){
        $value = config('blog.page_image');
    }
    if(!starts_with($value,'http') && $value[0] !== '/'){
        $value = config('blog.uploads.webpath').'/'.$value;
    }

    return $value;
}