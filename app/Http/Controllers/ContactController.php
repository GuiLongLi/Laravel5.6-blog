<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Requests\ContactMeRequest;
use Illuminate\Support\Facades\Mail;
use App\Mail\Reminder;

class ContactController extends Controller
{
    /**
      * @description 显示表单
      *
      * @param
      * @return view
      * @author guilong
      * @date 2018-07-28
    */
    public function showForm(){
        return view('blog.contact');
    }

    /**
      * @description email the contact request
      *
      * @param contactmerequest $request
      * @return redirect
      * @author guilong
      * @date 2018-07-28
    */
    public function sendContactInfo(ContactMeRequest $request){
        $data = $request->only('name','email','phone');
        $data['messageLines'] = explode('\n',$request->get('message'));

        $event = [
            'view' => 'emails.contact',
            'data' => $data,
            'title' => 'Blog Contact Form:'.$data['name'],
            'replyTo' => $data['email'],
            'to' => config('blog.contact_email'),
        ];
        Mail::queue(new Reminder($event));
//        Mail::send(new Reminder($event));

//        Mail::queue('emails.contact',$data,function($message) use ($data){
//            $message->subject('Blog Contact Form:'.$data['name'])
//                ->to(config('blog.contact_email'))
//                ->replyTo($data['email']);
//        });

        return back()
            ->withSuccess('Thank you for your message , it has been sent.');
    }
}
