import { getToken } from "./auth";

export const API_BASE = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000" ;


export async function requestLogin(path, { method = "GET", body, auth = false } = {}) {
  const headers = { "Content-Type": "application/json" };

  if (auth) {
    const token = getToken();
    if (token) headers["Authorization"] = `Bearer ${token}`;
  }

  const res = await fetch(`${API_BASE}${path}`, {

    method,
    headers,
    body: body ? JSON.stringify(body) : undefined,
    cache: "no-store",
  credentials: "include"
  });

  try {
    const data = await res.json();

 
  if (!res.ok) {
   if (res.status === 422) {
      // data.errors فيه جميع الأخطاء
      // مثال: { email: ["Cet e-mail est déjà utilisé."] }
      const messages = Object.values(data.errors)
        .map(errArray => errArray.join("\n"))
        .join("\n");

      throw new Error(messages)
    }
   
        throw new Error(data.message);
  }




  return data

} catch (error) {
  return error
}

//   if (!res.ok) {
//     const message = data?.message || "Request failed";
//     const error = new Error(message);
//     error.status = res.status;
//     error.responseText = text;

//     throw error;
//   }


}
export async function request(path, { method = "GET", body, auth = false } = {}) {
  const headers = { "Content-Type": "application/json" };

  if (auth) {
    const token = getToken();
    if (token) headers["Authorization"] = `Bearer ${token}`;
  }

  const res = await fetch(`${API_BASE}${path}`, {

    method,
    headers,
    body: body ? JSON.stringify(body) : undefined,
    cache: "no-store",
  credentials: "include"
  });

  try {
    const data = await res.json();

 
  
    if (res.status === 201) {
    return { 
      success: true,
      message: data.message, // "Inscription réussie. Vérifiez votre e-mail."
      errors: null 
    };
  }
   if (res.status === 422) {
    const errors = Object.values(data.errors)
      .map(errArray => errArray.join("\n"))
      .join("\n");

    return {
      success: false,
      message: null,
      errors: errors
    };
  }
   return {
    success: false,
    message: null,
    errors: data.message 
  };


  

 

} catch (error) {
  return {
    success: false,
    message: null,
    errors: "Une erreur est survenue."
  };
}
}
export async function apiRegister(payload) {
  return request("/api/register", { method: "POST", body: payload });
}

    export async function apiLogin(email, password) {
      return requestLogin("/api/login", { method: "POST", body: { email, password } });
    }

export async function resendVerificationEmail() {
  return request("/api/email/verification-notification", {
    method: "POST",
    auth: true,
  });
}

export async function getMe() {
  return request("/api/me", { method: "GET", auth: true });
}
