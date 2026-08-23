<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ResetPasswordMail extends Mailable
{
    use Queueable, SerializesModels;

    public $url; // رابط إعادة التعيين
public $token;
    public function __construct( $url, $token) 
    {
        $this->url = $url;
        $this->token=$token;

    }

    public function build()
    {
        return $this->subject('Réinitialisation de votre mot de passe')
                    ->markdown('emails.reset-password') // سننشئ ملف Markdown
                    ->with([
                    'url' => $this->url,
                    'token' => $this->token,
                ]);
    }
}
