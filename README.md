# Website

This website is built using [Docusaurus](https://docusaurus.io/), a modern static website generator.

## Installation

```bash
npm install
```

## Local Development

```bash
npm run start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

## Build

```bash
npm run build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

## Deployment

This repository deploys through GitHub Actions to GitHub Pages.

After pushing to `main`, the workflow in `.github/workflows/deploy.yml` builds the site and publishes it automatically.

The published site is:

```text
https://itzfabb-repo.github.io/FioWiki/
```
