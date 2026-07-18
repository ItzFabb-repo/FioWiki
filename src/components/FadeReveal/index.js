import React, {useEffect, useRef, useState} from 'react';
import styles from './styles.module.css';

export default function FadeReveal({children}) {
  const ref = useRef(null);
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const node = ref.current;
    if (!node) return;

    const observer = new IntersectionObserver(
      (entries) => {
        const entry = entries[0];
        setVisible(entry.isIntersecting && entry.intersectionRatio > 0.08);
      },
      {
        threshold: [0, 0.08, 0.15, 0.3],
        rootMargin: '0px 0px -10% 0px',
      },
    );

    observer.observe(node);
    return () => observer.disconnect();
  }, []);

  return (
    <div ref={ref} className={`${styles.fadeBlock} ${visible ? styles.visible : ''}`}>
      {children}
    </div>
  );
}
