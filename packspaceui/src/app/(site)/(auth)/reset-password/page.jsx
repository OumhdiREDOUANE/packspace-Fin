"use client";

import { Suspense } from "react";
import ResetPasswordPage from "./ResetComponent";

export default function ResetPage() {
  return (
    <Suspense fallback={<div>Loading…</div>}>
      <ResetPasswordPage/>
    </Suspense>
  );
}
