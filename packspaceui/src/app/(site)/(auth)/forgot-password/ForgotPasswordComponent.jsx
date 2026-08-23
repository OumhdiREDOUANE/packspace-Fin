"use client";
import { useState } from "react";

export default function ForgotPasswordComponent() {
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");

  const API_URL = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000";
  const handleSubmit = async (e) => {
    e.preventDefault();

    setError("");
    setMessage("");
    try{
        const res = await fetch(`${API_URL}/api/forgot-password`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email }),
    });

    const data = await res.json();

    if (!res.ok) {
      setError(data.message);
      setTimeout(() =>setError("") , 5000);

      return;
    }
    
    setMessage(data.message);
    setTimeout(() =>setMessage("") , 5000);
}catch(error){
        
    }

    
  };

  return (
    <div className="p-4 max-w-md mx-auto">
      <h2 className="text-xl font-bold mb-4">Mot de passe oublié</h2>

      {error && <p className="text-red-500 mb-3">{error}</p>}
      {message && <p className="text-green-500 mb-3">{message}</p>}

      <form onSubmit={handleSubmit} className="space-y-4">
        <input
          type="email"
          placeholder="Votre email"
          className="border p-2 w-full rounded"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />

        <button 
                        className="w-full py-3 rounded-2xl bg-[#006294] hover:bg-[#C09200] text-white font-semibold text-lg sm:text-xl transition flex items-center justify-center disabled:opacity-50"

      >
          Envoyer le lien
        </button>
      </form>
    </div>
  );
}
