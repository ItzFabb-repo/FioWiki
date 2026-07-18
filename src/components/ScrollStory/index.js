import React, {useEffect, useRef, useState} from 'react';
import styles from './styles.module.css';

const slides = [
  {
    id: 'information',
    title: 'What do i offer?',
    description:
      'The kind of service that i offer are Plugin Config, Setup Specialist, Discord Bot and Plugin Developer.',
    outsideNote: 'ItzFabb~',
  },
  {
    id: 'information-1',
    title: 'Why Choose Me?',
    description:
      'I am highly skilled in what I do, offering services at a very competitive and affordable commission rate. In addition, I have extensive experience working with multiple Minecraft server networks, which has helped me develop strong expertise in this field.',
    outsideNote: 'ItzFabb~',
  },
  {
    id: 'information-2',
    title: 'Where is ItzFabb from?',
    description:
      'Hey! glad that i also put this information on this table thingy, and yes i am from Indonesia, the country that has Red & White color.',
    outsideNote: 'ItzFabb~',
  },
  {
    id: 'information-3',
    title: 'It`s been 5 Years',
    description:
      'Me, myself has been Developing a Minecraft Server since way back i played this game on Pocket Edition or Bedrock Edition, first i started from Pocketmine and then moved on to java.',
    outsideNote: 'ItzFabb~',
  }
];

export default function ScrollStory() {
  const [activeIndex, setActiveIndex] = useState(0);
  const [activeHeight, setActiveHeight] = useState(null);
  const slideRefs = useRef([]);

  useEffect(() => {
    const currentSlide = slideRefs.current[activeIndex];
    if (!currentSlide) return;

    const updateHeight = () => {
      setActiveHeight(currentSlide.offsetHeight);
    };

    updateHeight();
    const observer = new ResizeObserver(updateHeight);
    observer.observe(currentSlide);
    window.addEventListener('resize', updateHeight);

    return () => {
      observer.disconnect();
      window.removeEventListener('resize', updateHeight);
    };
  }, [activeIndex]);

  const goPrev = () => {
    setActiveIndex((prev) => (prev === 0 ? slides.length - 1 : prev - 1));
  };

  const goNext = () => {
    setActiveIndex((prev) => (prev === slides.length - 1 ? 0 : prev + 1));
  };

  return (
    <section className={styles.wrapper}>
      <div
        className={styles.viewport}
        style={activeHeight ? {height: `${activeHeight}px`} : undefined}>
        <div
          className={styles.track}
          style={{transform: `translate3d(-${activeIndex * 100}%, 0, 0)`}}>
          {slides.map((slide, index) => (
            <article
              key={slide.id}
              className={styles.slide}
              ref={(el) => {
                slideRefs.current[index] = el;
              }}>
              <p className={styles.kicker}>{slide.title.toUpperCase()}</p>
              <h2 className={styles.title}>{slide.title}</h2>
              <p className={styles.text}>{slide.description}</p>

              <p className={styles.outsideNote}>{slide.outsideNote}</p>
            </article>
          ))}
        </div>

        <div className={styles.staticControls}>
          <button type="button" className={styles.navBtn} onClick={goPrev}>
            Prev
          </button>
          <button type="button" className={styles.navBtn} onClick={goNext}>
            Next
          </button>
        </div>
      </div>
    </section>
  );
}
