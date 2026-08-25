// @ts-check
import {themes as prismThemes} from 'prism-react-renderer';

const ORG = 'fedcal';
const REPO = 'Telemedic';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Telemedic',
  tagline: 'Piattaforma di telemedicina aperta per il Servizio Sanitario Nazionale',
  favicon: 'img/favicon.svg',

  url: `https://${ORG}.github.io`,
  baseUrl: `/${REPO}/`,
  organizationName: ORG,
  projectName: REPO,
  trailingSlash: false,

  // La documentazione è in scrittura attiva e contiene rinvii a moduli non
  // ancora pubblicati. Un collegamento rotto va visto, non deve fermare la
  // pubblicazione: il controllo si irrigidisce quando le aree sono complete.
  onBrokenLinks: 'warn',
  onBrokenAnchors: 'warn',
  onBrokenMarkdownLinks: 'warn',
  onDuplicateRoutes: 'warn',

  i18n: {
    defaultLocale: 'it',
    locales: ['it', 'en'],
    localeConfigs: {
      it: {label: 'Italiano', direction: 'ltr', htmlLang: 'it-IT'},
      en: {label: 'English', direction: 'ltr', htmlLang: 'en-GB'},
    },
  },

  markdown: {
    mermaid: true,
  },
  themes: ['@docusaurus/theme-mermaid'],

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          path: '../docs',
          routeBasePath: 'docs',
          sidebarPath: './sidebars.mjs',
          editUrl: `https://github.com/${ORG}/${REPO}/edit/main/`,
          showLastUpdateTime: true,
          exclude: ['**/_*.md', '**/node_modules/**'],
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
        sitemap: {
          changefreq: 'weekly',
          priority: 0.5,
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: 'img/social-card.png',
      colorMode: {
        defaultMode: 'light',
        respectPrefersColorScheme: true,
      },
      docs: {
        sidebar: {hideable: true, autoCollapseCategories: true},
      },
      navbar: {
        title: 'Telemedic',
        logo: {alt: 'Telemedic', src: 'img/logo.svg'},
        items: [
          {type: 'docSidebar', sidebarId: 'guidaSidebar', position: 'left', label: 'Fondamenti'},
          {type: 'docSidebar', sidebarId: 'progettoSidebar', position: 'left', label: 'Documentazione'},
          {to: '/docs/adr/README', label: 'Decisioni', position: 'left'},
          {type: 'localeDropdown', position: 'right'},
          {href: `https://github.com/${ORG}/${REPO}`, label: 'GitHub', position: 'right'},
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Documentazione',
            items: [
              {label: 'Guida dei fondamenti', to: '/docs/10_fondamenti/00-come-usare-questa-guida'},
              {label: 'Architettura', to: '/docs/02_architecture/00-indice'},
              {label: 'Sicurezza', to: '/docs/06_security/00-indice'},
              {label: 'Integrazione', to: '/docs/07_integration/00-indice'},
            ],
          },
          {
            title: 'Progetto',
            items: [
              {label: 'Come contribuire', href: `https://github.com/${ORG}/${REPO}/blob/main/CONTRIBUTING.md`},
              {label: 'Governance', href: `https://github.com/${ORG}/${REPO}/blob/main/GOVERNANCE.md`},
              {label: 'Sicurezza e segnalazioni', href: `https://github.com/${ORG}/${REPO}/blob/main/SECURITY.md`},
              {label: 'Codice di condotta', href: `https://github.com/${ORG}/${REPO}/blob/main/CODE_OF_CONDUCT.md`},
            ],
          },
          {
            title: 'Avvertenze',
            items: [
              {label: 'Non è un dispositivo medico', href: `https://github.com/${ORG}/${REPO}/blob/main/NOT-A-MEDICAL-DEVICE.md`},
              {label: 'Terminologie di terze parti', href: `https://github.com/${ORG}/${REPO}/blob/main/THIRD-PARTY-TERMINOLOGY.md`},
              {label: 'Politica di distribuzione', href: `https://github.com/${ORG}/${REPO}/blob/main/DISTRIBUTION-POLICY.md`},
            ],
          },
        ],
        copyright: `Telemedic — Licenza Apache 2.0. Documentazione rilasciata con il codice.<br/>Questo software non è un dispositivo medico marcato CE. Chi lo immette sul mercato o lo mette in servizio si assume gli obblighi che ne derivano.`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
        additionalLanguages: ['java', 'sql', 'bash', 'json', 'yaml', 'typescript', 'nginx', 'docker'],
      },
      mermaid: {
        theme: {light: 'neutral', dark: 'dark'},
      },
    }),
};

export default config;
