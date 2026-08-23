"use client";

import { Suspense } from "react";
import ForgotPasswordComponent from "./ForgotPasswordComponent";

export default function ForgotPasswordPage() {
  return (
    <Suspense fallback={<div>Loading…</div>}>
      <ForgotPasswordComponent/>
    </Suspense>
  );
}
