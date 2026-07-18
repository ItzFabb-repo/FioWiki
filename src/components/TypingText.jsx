import { useEffect, useState } from "react";

const words = [
  "Everything you need...",
  "Everything you wanted...",
  "Feature you needed the most...",
  "Idea that you've dreamed...",
  "Applying your Idea to Reality..."
];

export default function TypingText() {
  const [isMobile, setIsMobile] = useState(false);
  const [index, setIndex] = useState(0);
  const [subIndex, setSubIndex] = useState(0);
  const [deleting, setDeleting] = useState(false);
  const [selecting, setSelecting] = useState(false);
  const [blink, setBlink] = useState(true);

  const currentWord = words[index];

  useEffect(() => {
    const updateViewport = () => {
      setIsMobile(window.matchMedia("(max-width: 996px)").matches);
    };
    updateViewport();
    window.addEventListener("resize", updateViewport);
    return () => window.removeEventListener("resize", updateViewport);
  }, []);

  // typing / deleting logic
  useEffect(() => {
    let timeout;

    if (isMobile) {
      if (subIndex < currentWord.length) {
        timeout = setTimeout(() => {
          setSubIndex((prev) => prev + 1);
        }, 70);
        return () => clearTimeout(timeout);
      }

      timeout = setTimeout(() => {
        setIndex((prev) => (prev + 1) % words.length);
        setSubIndex(0);
      }, 1100);
      return () => clearTimeout(timeout);
    }

    // selesai ngetik → pause → select
    if (
      subIndex === currentWord.length &&
      !deleting &&
      !selecting
    ) {
      timeout = setTimeout(() => {
        setSelecting(true);
      }, 1400);

      return () => clearTimeout(timeout);
    }

    // animasi SELECT
    if (selecting) {
      timeout = setTimeout(() => {
        setSelecting(false);
        setDeleting(true);
      }, 500);

      return () => clearTimeout(timeout);
    }

    // selesai hapus → next word
    if (subIndex === 0 && deleting) {
      setDeleting(false);
      setIndex((prev) => (prev + 1) % words.length);
      return;
    }

    // SPEED HUMAN-LIKE ✨
    const typingSpeed = deleting
      ? 45
      : Math.floor(Math.random() * 80) + 90;

    timeout = setTimeout(() => {
      setSubIndex((prev) => prev + (deleting ? -1 : 1));
    }, typingSpeed);

    return () => clearTimeout(timeout);
  }, [subIndex, deleting, selecting, index, currentWord, isMobile]);

  // cursor blink
  useEffect(() => {
    if (isMobile) return;
    const blinkInterval = setInterval(() => {
      setBlink((prev) => !prev);
    }, 530);

    return () => clearInterval(blinkInterval);
  }, [isMobile]);

  const displayText = currentWord.substring(0, subIndex);

  return (
    <h1 className="typingWrapper">
      <span className={selecting ? "selectedText" : ""}>
        {displayText || "\u00A0"}
      </span>

      {!isMobile && <span className="cursor">{blink ? "|" : " "}</span>}
    </h1>
  );
}
