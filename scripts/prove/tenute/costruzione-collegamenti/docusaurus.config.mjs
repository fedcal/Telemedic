// @ts-check
//
// Tenuta del criterio 2 di T-02: «zero collegamenti rotti» deve fermare la costruzione. La
// riserva chiusa da questo file e' descritta in scripts/prove/esegui-prove.sh, controllo
// «costruzione del sito - collegamenti rotti» - questo commento dice solo le decisioni proprie
// del file.
//
// PERCHE' NON UNA COPIA DEI TRE VALORI onBroken*. Duplicare "throw" qui sarebbe la stessa
// menzogna gia' registrata come D-10 del runbook: una copia di cio' che si sorveglia smette di
// sorvegliare non appena l'originale cambia sotto di lei. I tre valori sono percio' LETTI dalla
// configurazione vera del sito, mai riscritti - questo file non modifica mai
// website/docusaurus.config.mjs, solo lo importa in sola lettura. Conseguenza voluta: se un
// giorno qualcuno abbassasse uno dei tre criteri da "throw" a "warn" nel sito vero, il caso
// «collegamento rotto ferma la costruzione» di questa tenuta smetterebbe da solo di superare
// l'atteso - senza che nessuno debba ricordarsi di aggiornare un duplicato qui.
//
// PERCHE' UNA TENUTA SEPARATA E NON IL SITO VERO. Il sito vero costruisce 310 documenti in due
// lingue e impiega minuti; questa tenuta ne costruisce due, con lo stesso motore
// (@docusaurus/core, stesso website/node_modules) e con gli stessi tre criteri onBroken*, in
// circa venti secondi misurati - sotto la soglia dei quaranta secondi indicata per restare in
// fascia rapida. Non prova che IL sito vero fallisca su un dato collegamento: prova che il
// MECCANISMO di Docusaurus con questi tre criteri a "throw" ferma davvero la costruzione quando
// un collegamento non risolve, e lo fa in modo ripetibile - cio' che mancava.
//
// PERCHE' node_modules E' UN COLLEGAMENTO SIMBOLICO. website/node_modules pesa circa 2,5 GB;
// installarne una copia propria per questa tenuta sarebbe lento, duplicato, e disallineato dalla
// prima versione che qualcuno aggiornasse in un solo posto. Il collegamento e' RELATIVO apposta,
// cosi' risolve dovunque il repository sia clonato: scripts/prove/tenute/costruzione-collegamenti
// -> ../../../../website/node_modules. E' un collegamento vuoto (nessun contenuto proprio) e non
// e' escluso dal .gitignore radice - la regola "node_modules/" li' non intercetta un collegamento
// simbolico, solo una directory vera, verificato con "git check-ignore" prima di versionarlo. Se
// website/node_modules non esiste (nessun "npm ci" eseguito, come nella corsia che esegue solo
// questo banco), il collegamento e' spezzato: il caso lo rileva e si dichiara SALTATO, mai
// superato - la stessa convenzione gia' in uso per gitleaks.
import configReale from '../../../../website/docusaurus.config.mjs';

const DOCS_PATH = process.env.DOCS_PATH || './docs-valido';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Tenuta - costruzione e collegamenti',
  url: 'https://esempio.invalido',
  baseUrl: '/',

  // I tre criteri che questa tenuta esiste per collaudare, letti dal sito vero e mai duplicati -
  // vedi il commento in testa al file.
  onBrokenLinks: configReale.onBrokenLinks,
  onBrokenAnchors: configReale.onBrokenAnchors,

  i18n: {
    defaultLocale: 'it',
    locales: ['it'],
  },

  markdown: {
    hooks: {
      onBrokenMarkdownLinks: configReale.markdown.hooks.onBrokenMarkdownLinks,
    },
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          path: DOCS_PATH,
          routeBasePath: '/',
          sidebarPath: false,
        },
        blog: false,
        theme: {
          customCss: './src/css/tenuta.css',
        },
        sitemap: false,
      }),
    ],
  ],
};

export default config;
