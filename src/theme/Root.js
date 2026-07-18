import React, {useEffect, useState} from 'react';
import {useLocation} from '@docusaurus/router';

const normalizeTheme = (themeName) =>
  themeName === 'light' || themeName === 'sunset' ? themeName : 'dark';

const persistTheme = (themeName) => {
  const normalized = normalizeTheme(themeName);
  document.documentElement.setAttribute('data-theme', normalized);
  document.documentElement.setAttribute('data-theme-choice', normalized);
  window.localStorage.setItem('fiowiki-theme', normalized);
  window.localStorage.setItem('theme', normalized);
  return normalized;
};

export default function Root({children}) {
  const location = useLocation();
  const [isLoading, setIsLoading] = useState(true);
  const [showScrollDown, setShowScrollDown] = useState(false);
  const [isNearBottom, setIsNearBottom] = useState(false);
  const [activeTheme, setActiveTheme] = useState('dark');

  const closeMobileSidebar = () => {
    const closeBtn = document.querySelector('.navbar-sidebar__close');

    if (closeBtn instanceof HTMLElement) {
      closeBtn.click();
    }
  };

  useEffect(() => {
    const updateScrollState = () => {
      const scrollTop = window.scrollY || document.documentElement.scrollTop;
      const scrollable =
        document.documentElement.scrollHeight - window.innerHeight;
      const progress = scrollable > 0 ? scrollTop / scrollable : 0;

      document.documentElement.style.setProperty(
        '--scroll-progress',
        progress.toFixed(4),
      );

      if (scrollTop > 16) {
        document.body.classList.add('is-scrolled');
      } else {
        document.body.classList.remove('is-scrolled');
      }
    };

    updateScrollState();
    window.addEventListener('scroll', updateScrollState, {passive: true});
    window.addEventListener('resize', updateScrollState);

    return () => {
      window.removeEventListener('scroll', updateScrollState);
      window.removeEventListener('resize', updateScrollState);
    };
  }, []);

  useEffect(() => {
    const initialTheme =
      window.localStorage.getItem('theme') ||
      window.localStorage.getItem('fiowiki-theme') ||
      document.documentElement.getAttribute('data-theme') ||
      'dark';
    const normalized = normalizeTheme(initialTheme);
    setActiveTheme(normalized);
    persistTheme(normalized);
  }, []);

  useEffect(() => {
    // Any location change: ensure mobile sidebar state is fully reset
    closeMobileSidebar();
  }, [location.pathname, location.search, location.hash]);

  useEffect(() => {
    const onSidebarLinkClick = (event) => {
      const target = event.target;
      if (!(target instanceof Element)) return;
      if (target.closest('.navbar-sidebar a')) {
        window.setTimeout(() => {
          closeMobileSidebar();
        }, 0);
      }
    };

    document.addEventListener('click', onSidebarLinkClick);
    return () => {
      document.removeEventListener('click', onSidebarLinkClick);
    };
  }, []);

  const applyTheme = (themeName) => {
    const normalized = persistTheme(themeName);
    setActiveTheme(normalized);
    document.body.classList.add('theme-transitioning');
    window.setTimeout(() => {
      document.body.classList.remove('theme-transitioning');
    }, 550);
  };

  useEffect(() => {
    let finished = false;
    const hideLoader = () => {
      if (finished) return;
      finished = true;
      setIsLoading(false);
    };

    if (document.readyState === 'complete') {
      hideLoader();
      return undefined;
    }

    if (document.readyState === 'interactive') {
      window.setTimeout(hideLoader, 80);
    }

    window.addEventListener('load', hideLoader, {once: true});
    window.addEventListener('pageshow', hideLoader, {once: true});
    document.addEventListener('DOMContentLoaded', hideLoader, {once: true});
    const failsafeTimer = window.setTimeout(hideLoader, 2000);

    return () => {
      window.removeEventListener('load', hideLoader);
      window.removeEventListener('pageshow', hideLoader);
      document.removeEventListener('DOMContentLoaded', hideLoader);
      window.clearTimeout(failsafeTimer);
    };
  }, []);

  useEffect(() => {
    const updateScrollDownVisibility = () => {
      const scrollTop = window.scrollY || document.documentElement.scrollTop;
      const scrollHeight = document.documentElement.scrollHeight;
      const viewport = window.innerHeight;
      const nearBottom = scrollTop + viewport >= scrollHeight - 120;

      setShowScrollDown(!nearBottom);
      setIsNearBottom(nearBottom);
    };

    updateScrollDownVisibility();
    window.addEventListener('scroll', updateScrollDownVisibility, {
      passive: true,
    });
    window.addEventListener('resize', updateScrollDownVisibility);

    return () => {
      window.removeEventListener('scroll', updateScrollDownVisibility);
      window.removeEventListener('resize', updateScrollDownVisibility);
    };
  }, []);

  const scrollToBottom = () => {
    window.scrollTo({
      top: document.documentElement.scrollHeight,
      behavior: 'smooth',
    });
  };

  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    });
  };

  return (
    <>
      <div className={`fiowiki-loader-modal${isLoading ? '' : ' is-hidden'}`}>
        <div className="fiowiki-loader" aria-hidden="true" />
      </div>
      <button
        type="button"
        className={`fiowiki-scroll-down${(showScrollDown || isNearBottom) ? ' is-visible' : ''}`}
        onClick={isNearBottom ? scrollToTop : scrollToBottom}
        aria-label={isNearBottom ? 'Scroll to top' : 'Scroll to bottom'}>
        <span className="material-symbols-rounded" aria-hidden="true">
          {isNearBottom ? 'keyboard_arrow_up' : 'keyboard_arrow_down'}
        </span>
      </button>
      <div className="fiowiki-theme-switcher" role="group" aria-label="Theme Switcher">
        <button
          type="button"
          className={`fiowiki-theme-btn${activeTheme === 'dark' ? ' is-active' : ''}`}
          onClick={() => applyTheme('dark')}>
          Dark
        </button>
        <button
          type="button"
          className={`fiowiki-theme-btn${activeTheme === 'light' ? ' is-active' : ''}`}
          onClick={() => applyTheme('light')}>
          Light
        </button>
        <button
          type="button"
          className={`fiowiki-theme-btn${activeTheme === 'sunset' ? ' is-active' : ''}`}
          onClick={() => applyTheme('sunset')}>
          Sunset
        </button>
      </div>
      {children}
    </>
  );
}
