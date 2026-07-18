import React, {useEffect, useState} from 'react';

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

export default function NavbarThemeSwitcher() {
  const [activeTheme, setActiveTheme] = useState('dark');

  useEffect(() => {
    const current =
      window.localStorage.getItem('theme') ||
      window.localStorage.getItem('fiowiki-theme') ||
      document.documentElement.getAttribute('data-theme') ||
      'dark';
    setActiveTheme(current);
  }, []);

  const applyTheme = (themeName) => {
    const normalized = persistTheme(themeName);
    setActiveTheme(normalized);
    document.body.classList.add('theme-transitioning');
    window.setTimeout(() => {
      document.body.classList.remove('theme-transitioning');
    }, 550);
  };

  return (
    <div className="fiowiki-navbar-theme-switcher" role="group" aria-label="Theme Switcher">
      <button
        type="button"
        className={`fiowiki-navbar-theme-btn${activeTheme === 'dark' ? ' is-active' : ''}`}
        onClick={() => applyTheme('dark')}>
        Dark
      </button>
      <button
        type="button"
        className={`fiowiki-navbar-theme-btn${activeTheme === 'light' ? ' is-active' : ''}`}
        onClick={() => applyTheme('light')}>
        Light
      </button>
      <button
        type="button"
        className={`fiowiki-navbar-theme-btn${activeTheme === 'sunset' ? ' is-active' : ''}`}
        onClick={() => applyTheme('sunset')}>
        Sunset
      </button>
    </div>
  );
}
