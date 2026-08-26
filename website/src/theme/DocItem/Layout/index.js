import React from 'react';
import Layout from '@theme-original/DocItem/Layout';
import AvvisoTraduzioneInCorso from '@site/src/components/AvvisoTraduzioneInCorso';

/**
 * Componente sostituito (wrapper, non eject) - criterio 3 di T-07, primo componente sostituito
 * del progetto sotto website/src/theme/. Aggiunge l'avviso di traduzione in corso sopra il
 * contenuto originale della pagina, senza reimplementare il layout del tema.
 *
 * Debito di manutenzione dichiarato (§4 del piano T-07-sito-di-documentazione.md): questo
 * componente si lega alla forma di @theme/DocItem/Layout di @docusaurus/theme-classic e va
 * riletto a ogni aggiornamento maggiore di Docusaurus, perché un wrapper non è protetto da un
 * cambio di firma del componente originale.
 */
export default function DocItemLayoutWrapper(props) {
  return (
    <>
      <AvvisoTraduzioneInCorso />
      <Layout {...props} />
    </>
  );
}
