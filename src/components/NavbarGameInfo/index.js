import React, {useEffect, useState} from 'react';
import {useLocation} from '@docusaurus/router';
import styles from './styles.module.css';

function extractGameLabels() {
  const container =
    document.querySelector('.theme-doc-markdown') ||
    document.querySelector('main') ||
    document.body;

  const headings = Array.from(
    container.querySelectorAll('h1, h2, h3, h4, h5'),
  );

  const labels = [];
  for (const h of headings) {
    const text = (h.textContent || '').trim();
    if (!text) continue;
    if (!/^game\s*:/i.test(text)) continue;
    const value = text.replace(/^game\s*:\s*/i, '').trim();
    if (value) labels.push(value);
  }

  // unique while preserving order
  return Array.from(new Set(labels));
}

export default function NavbarGameInfo() {
  const location = useLocation();
  const [games, setGames] = useState([]);

  useEffect(() => {
    // Wait a tick for the new doc content to render.
    const id = window.setTimeout(() => {
      setGames(extractGameLabels());
    }, 50);
    return () => window.clearTimeout(id);
  }, [location.pathname]);

  if (!games.length) return null;

  return (
    <div className={styles.wrap} aria-label="Page games">
      {games.slice(0, 6).map((g) => (
        <span key={g} className={styles.pill}>
          <span className={styles.k}>game:</span> {g}
        </span>
      ))}
      {games.length > 6 ? (
        <span className={styles.more}>+{games.length - 6}</span>
      ) : null}
    </div>
  );
}

