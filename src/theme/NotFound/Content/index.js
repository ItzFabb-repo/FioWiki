import React from 'react';
import styles from './styles.module.css';

export default function NotFoundContent() {
  return (
    <main className={styles.root}>
      <section className={styles.card}>
        <p className={styles.kicker}>Error 404</p>
        <h1 className={styles.title}>Page Not Found</h1>
        <p className={styles.subtitle}>
          The page you are looking for might have been moved, renamed, or no
          longer exists.
        </p>
        <div className={styles.actions}>
          <button
            type="button"
            className={styles.secondaryBtn}
            onClick={() => window.history.back()}>
            Go Back
          </button>
        </div>
      </section>
    </main>
  );
}
