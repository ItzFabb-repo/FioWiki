import { useEffect, useRef, useState } from "react";

function formatNumber(value) {
  return new Intl.NumberFormat("en-US").format(value);
}

export default function CountUpNumber({
  from = 1,
  to = 1000,
  duration = 2600,
  className
}) {
  const [value, setValue] = useState(from);
  const [started, setStarted] = useState(false);
  const hostRef = useRef(null);

  useEffect(() => {
    const node = hostRef.current;
    if (!node) return undefined;

    const observer = new IntersectionObserver(
      (entries) => {
        if (entries[0]?.isIntersecting) {
          setStarted(true);
          observer.disconnect();
        }
      },
      { threshold: 0.35 }
    );

    observer.observe(node);
    return () => observer.disconnect();
  }, []);

  useEffect(() => {
    if (!started) return undefined;

    let frameId;
    const startTime = performance.now();
    const delta = to - from;

    // Ease-out makes the counter slow down near the final value.
    const easeOutCubic = (t) => 1 - Math.pow(1 - t, 3);

    const tick = (now) => {
      const elapsed = now - startTime;
      const progress = Math.min(elapsed / duration, 1);
      const eased = easeOutCubic(progress);
      const next = Math.round(from + delta * eased);

      setValue(next);

      if (progress < 1) {
        frameId = requestAnimationFrame(tick);
      }
    };

    frameId = requestAnimationFrame(tick);
    return () => cancelAnimationFrame(frameId);
  }, [started, from, to, duration]);

  return (
    <span ref={hostRef} className={className}>
      {formatNumber(value)}
    </span>
  );
}
