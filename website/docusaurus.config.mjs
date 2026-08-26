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
  onBrokenLinks: 'throw',
  onBrokenAnchors: 'throw',
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
    hooks: {
      onBrokenMarkdownLinks: 'throw',
    },
  },

  // Criterio 3 di T-07: calcola quali documenti non hanno una traduzione inglese, leggendo
  // docs/ e website/i18n/en/... alla costruzione (nessun elenco tenuto a mano - vedi il
  // commento in testa al file). L'esito è letto a runtime dal componente sostituito
  // src/theme/DocItem/Layout, che mostra l'avviso di traduzione in corso.
  plugins: ['./plugins/stato-traduzione-docs.mjs'],

  themes: [
    '@docusaurus/theme-mermaid',
    // Criterio 2 di T-07: ricerca locale, senza alcun servizio esterno - nessuna candidatura,
    // nessuna coda di indicizzazione, nessun invio dei contenuti a un terzo. Licenza MIT
    // verificata sul file LICENSE del repository sorgente (non sulla sola dichiarazione di
    // package.json), registrata in pipeline/annotazioni-componenti.tsv. Il plugin costruisce un
    // indice SEPARATO per ciascuna locale del sito (una per "it", una per "en"), quindi una
    // ricerca eseguita sulla locale inglese non può restituire risultati italiani e viceversa:
    // è esattamente la proprietà «nella lingua attiva» del criterio 2.
    [
      '@easyops-cn/docusaurus-search-local',
      /** @type {import('@easyops-cn/docusaurus-search-local').PluginOptions} */
      ({
        hashed: true,
        language: ['en', 'it'],
        indexDocs: true,
        indexBlog: false,
        indexPages: false,
        docsRouteBasePath: '/docs',
      }),
    ],
  ],

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
          {to: '/docs/adr', label: 'Decisioni', position: 'left'},
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
              {label: 'Guida dei fondamenti', to: '/docs/fondamenti/come-usare-questa-guida'},
              {label: 'Architettura', to: '/docs/architecture/indice'},
              {label: 'Sicurezza', to: '/docs/security/indice'},
              {label: 'Integrazione', to: '/docs/integration/indice'},
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
        // L'avvertenza di non marcatura è racchiusa in <span class="tmWarnFooter"> - non per
        // stile, ma perché il piè di pagina compare su OGNI pagina pubblicata (a differenza del
        // blocco "tmWarn", che sta solo in home page): è il marcatore strutturale che il criterio
        // 5 di T-07 esige, letto da scripts/verifica-dichiarazione-non-marcatura.sh su ogni
        // pagina HTML dell'artefatto costruito. Stessa disciplina di "tmWarn": la classe
        // sopravvive a una riformulazione del testo, non a una sua sparizione.
        copyright: `Telemedic - Licenza Apache 2.0. Documentazione rilasciata con il codice.<br/><span class="tmWarnFooter">Questo software non è un dispositivo medico marcato CE. Chi lo immette sul mercato o lo mette in servizio si assume gli obblighi che ne derivano.</span>`,
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
