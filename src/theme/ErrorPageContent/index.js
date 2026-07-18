import React from 'react';
import Translate from '@docusaurus/Translate';
import Heading from '@theme/Heading';
import {ErrorBoundaryError} from '@docusaurus/theme-common';
import styles from './styles.module.css';

export default function ErrorPageContent({error, tryAgain}) {
  return (
    <main className={styles.root}>
      <section className={styles.card}>
        <p className={styles.kicker}>Runtime Error</p>
        <Heading as="h1" className={styles.title}>
          <Translate
            id="theme.ErrorPageContent.title"
            description="The title of the fallback page when the page crashed">
            This page crashed.
          </Translate>
        </Heading>

        <div className={styles.actions}>
          <button type="button" className={styles.primaryBtn} onClick={tryAgain}>
            <Translate
              id="theme.ErrorPageContent.tryAgain"
              description="The label of the button to try again rendering when the page crashed">
              Try again
            </Translate>
          </button>
        </div>

        <hr className={styles.divider} />

        <div className={styles.errorBox}>
          <ErrorBoundaryError error={error} />
        </div>
      </section>
    </main>
  );
}
