import React, {useEffect, useState} from 'react';

const themes = ['dark', 'light', 'sunset'];
const themeLabels = {
  dark: 'Dark',
  light: 'Light',
  sunset: 'Sunset',
};
const themeIcons = {
  dark: 'dark_mode',
  light: 'light_mode',
  sunset: 'wb_twilight',
};

const normalizeTheme = (themeName) =>
  themes.includes(themeName) ? themeName : 'dark';

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
    setActiveTheme(normalizeTheme(current));
  }, []);

  const cycleTheme = () => {
    const current = normalizeTheme(
      document.documentElement.getAttribute('data-theme') || activeTheme,
    );
    const nextTheme = themes[(themes.indexOf(current) + 1) % themes.length];

    setActiveTheme(persistTheme(nextTheme));
    document.body.classList.add('theme-transitioning');
    window.setTimeout(() => {
      document.body.classList.remove('theme-transitioning');
    }, 700);
  };

  const nextTheme = themes[(themes.indexOf(activeTheme) + 1) % themes.length];

  return (
    <button
      type="button"
      className={`fiowiki-navbar-theme-btn theme-${activeTheme}`}
      onClick={cycleTheme}
      aria-label={`Current theme: ${themeLabels[activeTheme]}. Switch to ${themeLabels[nextTheme]}.`}
      title={`Switch to ${themeLabels[nextTheme]} theme`}>
      <span className="material-symbols-rounded" aria-hidden="true">
        {themeIcons[activeTheme]}
      </span>
      <span className="fiowiki-navbar-theme-label">{themeLabels[activeTheme]}</span>
    </button>
  );
}
