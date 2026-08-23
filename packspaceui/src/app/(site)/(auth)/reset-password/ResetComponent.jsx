"use client";
import { useSearchParams } from "next/navigation";
import { useState } from "react";

export default function ResetPasswordPage() {
  const searchParams = useSearchParams();
  const token = searchParams.get("token");
  const email = searchParams.get("email");

  const [password, setPassword] = useState("");
  const [password_confirmation, setPasswordConfirmation] = useState("");
  const [message, setMessage] = useState("");
  const [error, setError] = useState("");
  const API_URL = process.env.NEXT_PUBLIC_API_URL || "http://127.0.0.1:8000";

  const handleSubmit = async (e) => {
    e.preventDefault();

    const res = await fetch(`${API_URL}/api/reset-password`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        token,
        email,
        password,
        password_confirmation
      }),
    });

    const data = await res.json();

    if (!res.ok) {
        if(res.status==422){
           const messages = Object.values(data.errors)
        .map(errArray => errArray.join("\n"))
        .join("\n");
      setError(messages);
            setTimeout(() =>setError("") , 5000);

return
        }
        
      setError(data.message);
            setTimeout(() =>setError("") , 5000);

      return;
    }

    setMessage(data.message);
            setTimeout(() =>setMessage("") , 5000);

  };

  return (
    <div className="p-4 max-w-md mx-auto">

      <h2 className="text-xl font-bold mb-4">Réinitialiser le mot de passe</h2>

      {error && <p className="text-red-500 mb-3">{error}</p>}
      {message && <p className="text-green-500 mb-3">{message}</p>}

      <form onSubmit={handleSubmit} className="space-y-4">

        <p>Email : {email}</p>

        <input
          type="password"
          placeholder="Nouveau mot de passe"
          className="border p-2 w-full rounded"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />

        <input
          type="password"
          placeholder="Confirmer le mot de passe"
          className="border p-2 w-full rounded"
          value={password_confirmation}
          onChange={(e) => setPasswordConfirmation(e.target.value)}
        />

        <button 
                        className="w-full py-3 rounded-2xl bg-[#006294] hover:bg-[#C09200] text-white font-semibold text-lg sm:text-xl transition flex items-center justify-center disabled:opacity-50"

        >
          Réinitialiser
        </button>

      </form>
    </div>
  );
}
