// Plugin Docusaurus locale - criterio 3 di T-07.
//
// Calcola, alla costruzione del sito, quali documenti di docs/ NON hanno una traduzione
// inglese, ed espone l'elenco come dato globale che il componente sostituito
// src/theme/DocItem/Layout legge a runtime per mostrare l'avviso «traduzione in corso» sulla
// locale inglese.
//
// PERCHÉ UN PLUGIN E NON UN ELENCO SCRITTO A MANO. Un elenco a mano diverge dal repository reale
// alla prima traduzione aggiunta o rimossa - è esattamente il difetto D-10 del runbook degli
// errori: «un controllo che porta dentro di sé una copia di ciò che sorveglia non sorveglia
// più». Questo plugin non tiene alcuna copia: ad ogni costruzione rilegge docs/ e
// website/i18n/en/docusaurus-plugin-content-docs/current/ dal disco.
//
// COME SI CALCOLA L'IDENTIFICATIVO. Il confronto NON usa lo slug (l'URL, che varia con
// «parse_number_prefixes» e con la traduzione dei titoli): usa l'esistenza del file GEMELLO,
// stesso percorso relativo, stesso nome, sotto la cartella della traduzione inglese - la stessa
// convenzione già usata da scripts/verifica-divergenza-traduzioni.sh. È un confronto sul
// FILESYSTEM, non sull'URL, quindi non può essere ingannato da uno slug diverso nelle due lingue.
//
// L'identificativo esposto (campo «id» del dato globale) è invece calcolato con la STESSA
// funzione che il plugin ufficiale @docusaurus/plugin-content-docs usa per calcolare l'«id» di
// ciascun documento (stripPathNumberPrefixes + DefaultNumberPrefixParser, importati dal
// pacchetto stesso e non reimplementati): è l'identificativo che il componente sostituito legge
// da useDoc().metadata.id a runtime, ed è STABILE fra le due lingue perché la traduzione
// mantiene lo stesso nome di file dell'originale.
import path from 'node:path';
import fs from 'node:fs';
import {createRequire} from 'node:module';

const require = createRequire(import.meta.url);
// Importato dal pacchetto reale, non reimplementato: vedi la nota sopra e D-10 del runbook.
const {stripPathNumberPrefixes, DefaultNumberPrefixParser} = require(
  '@docusaurus/plugin-content-docs/lib/numberPrefix.js'
);

const ESCLUSI = [/(^|\/)_[^/]*\.mdx?$/];

/** @param {string} radice */
function elencaDocumenti(radice) {
  /** @type {string[]} */
  const risultato = [];
  if (!fs.existsSync(radice)) {
    return risultato;
  }
  const visita = (dir) => {
    for (const voce of fs.readdirSync(dir, {withFileTypes: true})) {
      const percorsoAssoluto = path.join(dir, voce.name);
      if (voce.isDirectory()) {
        visita(percorsoAssoluto);
        continue;
      }
      if (!/\.mdx?$/.test(voce.name)) {
        continue;
      }
      const relativo = path.relative(radice, percorsoAssoluto).split(path.sep).join('/');
      if (ESCLUSI.some((r) => r.test(relativo))) {
        continue;
      }
      risultato.push(relativo);
    }
  };
  visita(radice);
  return risultato;
}

/** @param {string} percorsoRelativo - es. "10_fondamenti/00-come-usare-questa-guida.md" */
function calcolaId(percorsoRelativo) {
  const dirName = path.dirname(percorsoRelativo);
  const baseName = path.basename(percorsoRelativo, path.extname(percorsoRelativo));
  const {filename: baseID} = DefaultNumberPrefixParser(baseName);
  const prefissoDir = dirName === '.' ? undefined : stripPathNumberPrefixes(dirName, DefaultNumberPrefixParser);
  return [prefissoDir, baseID].filter(Boolean).join('/');
}

/** @returns {import('@docusaurus/types').Plugin} */
export default function pluginStatoTraduzioneDocs(context) {
  return {
    name: 'stato-traduzione-docs',

    async loadContent() {
      const docsDir = path.join(context.siteDir, '..', 'docs');
      const i18nEnDir = path.join(
        context.siteDir,
        'i18n',
        'en',
        'docusaurus-plugin-content-docs',
        'current'
      );

      const documenti = elencaDocumenti(docsDir);
      const nonTradotti = documenti
        .filter((relativo) => !fs.existsSync(path.join(i18nEnDir, relativo)))
        .map((relativo) => calcolaId(relativo));

      return {idNonTradotti: nonTradotti};
    },

    async contentLoaded({content, actions}) {
      actions.setGlobalData({idNonTradotti: content.idNonTradotti});
    },
  };
}
