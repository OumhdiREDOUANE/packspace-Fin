<?php

namespace App\Http\Controllers\Auth;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use Illuminate\Validation\Rules\Password;
use Exception;
use Illuminate\Support\Str;

class RegisterController extends Controller
{
   

    public function register(Request $request)
{
    // try {
    //     // 1. التحقق من صحة البيانات
    //     $validated = $request->validate([
    //         'nomComplet' => 'required|string|max:255',
    //         'numero_telephone' => 'required|string|max:15|unique:users',
    //         'email' => 'required|string|email|max:255|unique:users',
    //         'password' => ['required', 'confirmed', Password::defaults()],
    //     ]);

    //     // 2. إنشاء المستخدم
    //     $user = User::create([
    //         'nomComplet' => $validated['nomComplet'],
    //         'numero_telephone' => $validated['numero_telephone'],
    //         'email' => $validated['email'],
    //         'password' => Hash::make($validated['password']),
    //         'remember_token' => Str::random(60),
    //     ]);

    //     // 3. إطلاق حدث التحقق من البريد
    //     event(new Registered($user));
       

    //     // 4. إرجاع رد ناجح
    //     return response()->json([
    //         'message' => 'Inscription réussie. Vérifiez votre e-mail.',
    //         'user' => $user  // باش تشوف واش فعلا كيتسجل
    //     ], 201);

    // } catch (Exception $e) {
    //     // في حالة أي خطأ غير متوقع
    //     return response()->json([
    //         'error' => true,
    //         'message' => $e->getMessage(),
    //         'file' => $e->getFile(),
    //         'line' => $e->getLine(),
    //     ], 500);
    // }
    try {
    // 1. التحقق من البيانات
        $validated = $request->validate([
            'nomComplet' => 'required|string|max:255',
            'numero_telephone' => 'required|string|max:15|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', 'confirmed', Password::defaults()],
        ], [
        'nomComplet.required' => 'Le nom complet est obligatoire.',
        'numero_telephone.required' => 'Le numéro de téléphone est obligatoire.',
        'numero_telephone.unique' => 'Ce numéro de téléphone est déjà utilisé.',
        'email.required' => 'L\'adresse e-mail est obligatoire.',
        'email.email' => 'L\'adresse e-mail doit être valide.',
        'email.unique' => 'Cet e-mail est déjà utilisé.',
        'password.required' => 'Le mot de passe est obligatoire.',
        'password.confirmed' => 'La confirmation du mot de passe ne correspond pas.',
    ]);


    // 🔥 2. إذا كان هناك أخطاء في التحقق → أرجع رسائل واضحة
    

    // 3. إنشاء المستخدم
    $user = User::create([
        'nomComplet' => $request->nomComplet,
        'numero_telephone' => $request->numero_telephone,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'remember_token' => Str::random(60),
    ]);

    // 4. إطلاق حدث التحقق من البريد
    event(new Registered($user));
    return response()->json([
        'status' => 'success',
        'message' => 'Inscription réussie. Vérifiez votre e-mail.',
        'user' => $user,
    ], 201);

    } catch (\Illuminate\Validation\ValidationException $e) {

    // 🔥 إرجاع الأخطاء بشكل واضح
    return response()->json([
        'status' => 'error',
        'message' => "validation error",
         'errors' => $e->errors()
    ], 422);

} catch (\Exception $e) {

    return response()->json([
        'status' => 'error',
        'message' => 'Une erreur est survenue lors de la création du compte.',
        'error_detail' => $e->getMessage(),
    ], 500);
}



}
}
