
@component('mail::message')
![Logo]({{ config('app.frontend_url') }}/LOGO%20BLUE.png)
# Réinitialisation de votre mot de passe

Cliquez sur le bouton ci-dessous pour réinitialiser votre mot de passe :

@component('mail::button', ['url' => $url])
Réinitialiser le mot de passe
@endcomponent

Si vous n'avez pas demandé cette réinitialisation, ignorez cet e-mail.

Merci,<br>

@endcomponent


