// @ts-check
import {themes as prismThemes} from 'prism-react-renderer';

const hasAlgolia =
  !!process.env.ALGOLIA_APP_ID &&
  !!process.env.ALGOLIA_API_KEY &&
  !!process.env.ALGOLIA_INDEX_NAME;

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'FioWiki',
  tagline: 'Professional documentation for Fio projects',
  favicon: 'img/FioMenu-rounded.png',

  future: {
    v4: true,
    faster: false,
  },

  url: 'https://itzfabb-repo.github.io',
  baseUrl: '/fiowiki/',

  organizationName: 'ItzFabb-repo',
  projectName: 'fiowiki',
  trailingSlash: false,

  onBrokenLinks: 'throw',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.js',
          routeBasePath: '/',
        },
        blog: {
          showReadingTime: true,
          onInlineTags: 'warn',
          onInlineAuthors: 'warn',
          onUntruncatedBlogPosts: 'warn',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      },
    ],
  ],
  plugins: [
    [
      require.resolve('@easyops-cn/docusaurus-search-local'),
      {
        indexDocs: true,
        indexBlog: true,
        docsRouteBasePath: '/',
        hashed: true,
      },
    ],
  ],
  
  stylesheets: [
  {
    href: "https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded",
    type: "text/css",
  },
],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({  
      image: 'img/docusaurus-social-card.jpg',
      metadata: [
        {
          name: 'viewport',
          content: 'width=device-width, initial-scale=1, viewport-fit=cover',
        },
        {
          name: 'keywords',
          content: 'FioTags, FioChat, FioChatGames, FioMenu, Fabb_Ex3, ItzFabb',
        },
      ],
      colorMode: {
        defaultMode: 'dark',
        disableSwitch: true,
        respectPrefersColorScheme: false,
      },
      navbar: {
        title: 'FioWiki',
        logo: {
          alt: 'FioMenu Logo',
          src: 'img/FioMenu.png',
        },
        items: [
          {
            type: 'search',
            position: 'right',
          },
        ],
      },
      ...(hasAlgolia
        ? {
            algolia: {
              appId: process.env.ALGOLIA_APP_ID,
              apiKey: process.env.ALGOLIA_API_KEY,
              indexName: process.env.ALGOLIA_INDEX_NAME,
              contextualSearch: true,
            },
          }
        : {}),
      docs: {
        sidebar: {
          hideable: false,
          autoCollapseCategories: true,
        },
      },
      footer: {
        style: 'dark',
        links: [],
        copyright: 'Copyright 2025 FioWiki',
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    }),
};

export default config;

