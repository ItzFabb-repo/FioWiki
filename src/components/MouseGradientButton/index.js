import React from 'react';
import styles from './styles.module.css';

export default function MouseGradientButton({
  href,
  children,
  gradientFrom = '#52d9d0',
  gradientTo = '#0ba5b3',
  ...props
}) {
  const handleMouseMove = (e) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    e.currentTarget.style.setProperty('--mx', `${x}px`);
    e.currentTarget.style.setProperty('--my', `${y}px`);
  };

  return (
    <a
      href={href}
      className={styles.btn}
      style={{
        '--from': gradientFrom,
        '--to': gradientTo,
      }}
      onMouseMove={handleMouseMove}
      {...props}>
      <span className={styles.label}>{children}</span>
    </a>
  );
}
