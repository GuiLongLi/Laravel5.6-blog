<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class Reminder extends Mailable
{
    use Queueable, SerializesModels;

    protected $event;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($event)
    {
        $this->event = $event;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view($this->event['view'])
            ->to($this->event['to'],isset($this->event['toname']) ? $this->event['toname'] : '')  //发送对象
            ->subject($this->event['title'])  //标题
//            ->attach('/path/to/file', [   //附件
//                'as' => 'name.pdf',
//                'mime' => 'application/pdf',
//            ])
            ->with($this->event['data'])
            ->replyTo($this->event['replyTo']);
    }
}
