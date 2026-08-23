@component('mail::message')
![Logo]({{ config('app.frontend_url') }}/LOGO%20BLUE.png)


# Confirmez votre adresse e-mail

Bonjour!

Cliquez sur le bouton ci-dessous pour confirmer votre adresse e-mail.

@component('mail::button', ['url' => $url])
Confirmer l'adresse e-mail
@endcomponent

Si vous n'avez pas créé de compte, aucune action n'est requise.

---

Cordialement,  
L'équipe de votre application

@endcomponent

