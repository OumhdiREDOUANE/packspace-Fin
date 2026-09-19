// app/cart/page.jsx
import CartClient from "./cartClient";
import { cookies } from "next/headers";

export default async function CartClientPage() {
  const cookieStore = await cookies();

  const sessionId =
    cookieStore.get("session_id")?.value || 0;

  const token =
    cookieStore.get("token")?.value || "";

  return (
    <CartClient
      sessionId={sessionId}
      orders={null}
      token={token}
    />
  );
}