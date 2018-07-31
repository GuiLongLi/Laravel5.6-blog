<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class CommentsArticleCreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'body' => 'required',
        ];
    }

    /**
      * @description return the fields and values to create a new post form
      *
      * @param $param
      * @return $return
      * @author guilong
      * @date $date 2018-07-25
    */
    public function postFillData(){
        $published_at = new Carbon();
        return [
            'user_id' => Auth::id(),
            'post_id' => $this->post_id,
            'parent_id' => $this->parent_id,
            'body' => $this->body,
            'created_at' => $published_at,
        ];
    }
}
