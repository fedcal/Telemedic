import React from 'react';
import Link from '@docusaurus/Link';
import {useDoc} from '@docusaurus/plugin-content-docs/client';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import {usePluginData} from '@docusaurus/useGlobalData';
import {useAlternatePageUtils} from '@docusaurus/theme-common/internal';

/**
 * Criterio 3 di T-07: dove la pagina inglese non esiste ancora, la pagina non deve restare in
 * silenzio sul contenuto italiano non dichiarato. Questo componente rende l'avviso - mai un
 * errore, mai la radice - e il rinvio alla pagina italiana corrispondente.
 *
 * La classe CSS "tmTranslationNotice" è il marcatore STRUTTURALE che
 * scripts/verifica-avviso-traduzione.sh cerca nell'artefatto costruito: sopravvive a una
 * riformulazione del testo, la stessa disciplina già adottata per "tmWarn"
 * (scripts/verifica-dichiarazione-non-marcatura.sh).
 *
 * La lista dei documenti non tradotti (idNonTradotti) è calcolata alla costruzione da
 * website/plugins/stato-traduzione-docs.mjs, leggendo il filesystem - non è un elenco tenuto a
 * mano qui: vedi il commento in testa a quel file sul difetto D-10 del runbook degli errori.
 */
export default function AvvisoTraduzioneInCorso() {
  const {i18n} = useDocusaurusContext();
  const {metadata} = useDoc();
  const {idNonTradotti} = usePluginData('stato-traduzione-docs');
  const {createUrl} = useAlternatePageUtils();

  const nonTradotta = i18n.currentLocale !== i18n.defaultLocale && idNonTradotti.includes(metadata.id);

  if (!nonTradotta) {
    return null;
  }

  // "pathname://" impedisce a <Link> di applicare di nuovo il baseUrl: createUrl() lo ha già
  // incluso (stessa tecnica di @docusaurus/theme-classic/theme/NavbarItem/LocaleDropdownNavbarItem,
  // che usa lo stesso hook). Senza questo prefisso il collegamento raddoppia il baseUrl
  // ("/Telemedic/en/Telemedic/docs/...") ed è esattamente il tipo di collegamento rotto che il
  // controllo bloccante sui collegamenti interni (criterio 1 di T-07) esiste per intercettare.
  const urlItaliano = `pathname://${createUrl({locale: i18n.defaultLocale, fullyQualified: false})}`;

  return (
    <div className="tmTranslationNotice">
      <strong>Translation in progress.</strong> This page has not been translated into English
      yet. You are reading the source text in Italian.{' '}
      <Link to={urlItaliano}>Go to the Italian page</Link>.
    </div>
  );
}
