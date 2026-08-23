<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Mail\ResetPasswordMail;
use Illuminate\Support\Str;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
class PasswordResetController extends Controller
{
    // 1️⃣ إرسال رابط إعادة التعيين
   





public function sendResetLink(Request $request)
{
    $request->validate([
        'email' => 'required|email|exists:users,email',
    ]);

    $user = User::where('email', $request->email)->first();

    // توليد التوكن
    $token = Password::createToken($user);

    // رابط فرونت أند لإعادة التعيين
    $url = config('app.frontend_url') . "/reset-password?token={$token}&email=" . urlencode($user->email);

    // إرسال الإيميل للمستخدم
    Mail::to($user->email)->send(new ResetPasswordMail($url,$token));

    return response()->json([
        'status' => 'success',
        'message' => 'Un lien de réinitialisation a été envoyé à votre email.'
    ]);
}


    // 2️⃣ إعادة تعيين كلمة المرور
   

public function resetPassword(Request $request)
{
    $validator = Validator::make($request->all(), [
        'token' => 'required',
        'email' => 'required|email|exists:users,email',
        'password' => 'required|confirmed|min:6',
        
    ], [
        'email.required' => "L'adresse e-mail est obligatoire.",
        'email.email' => "L'adresse e-mail doit être valide.",
        'email.exists' => "Aucun compte n'est associé à cet e-mail.",
        'password.required' => 'Le mot de passe est obligatoire.',
        'password.confirmed' => 'La confirmation du mot de passe ne correspond pas.',
        'password.min' => 'Le mot de passe doit contenir au moins 6 caractères.'
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => 'error',
            'message' => 'Validation échouée',
            'errors' => $validator->errors()
        ], 422);
    }

    $status = Password::reset(
        $request->only('email', 'password', 'password_confirmation', 'token'),
        function ($user, $password) {
            $user->forceFill([
                'password' => Hash::make($password),
                'email_verified_at'=>now()
            ])->save();
        }
    );

    if ($status === Password::PASSWORD_RESET) {
        return response()->json([
            'status' => 'success',
            'message' => 'Votre mot de passe a été réinitialisé avec succès.'
        ]);
    }

    return response()->json([
        'status' => 'error',
        'message' => "Le lien de réinitialisation est invalide ou a expiré."
    ], 400);
}

}
