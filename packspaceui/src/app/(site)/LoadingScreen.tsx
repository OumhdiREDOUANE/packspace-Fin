"use client";

import styles from "./LoadingScreen.module.css";

export default function LoadingScreen() {
  return (
    <div className={styles.loader}>
      <div className={styles.logo}>P</div>

      <div className={styles.text}>
        Loading<span className={styles.dots}>...</span>
      </div>

      <div className={styles.line}>
        <span />
      </div>
    </div>
  );
}