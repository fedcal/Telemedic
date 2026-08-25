import React from 'react';
import Link from '@docusaurus/Link';
import Layout from '@theme/Layout';
import Translate, {translate} from '@docusaurus/Translate';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';

function Card({title, body, to, cta}) {
  return (
    <div className="tmCard">
      <h3>{title}</h3>
      <p>{body}</p>
      <Link className="button button--outline button--primary button--sm" to={to}>
        {cta}
      </Link>
    </div>
  );
}

export default function Home() {
  const {siteConfig} = useDocusaurusContext();

  return (
    <Layout
      title={translate({
        id: 'home.meta.title',
        message: 'Telemedicina aperta per il Servizio Sanitario Nazionale',
      })}
      description={translate({
        id: 'home.meta.description',
        message:
          'Telemedic è una piattaforma di telemedicina open source progettata sugli standard italiani: FHIR R4 con le guide HL7 Italia, FSE 2.0, identità digitale nazionale. Documentazione completa e aperta.',
      })}>
      <header className="tmHero text--center">
        <h1>{siteConfig.title}</h1>
        <p className="tmLead">
          <Translate id="home.lead">
            Televisita, teleconsulto, teleassistenza e telemonitoraggio, costruiti sugli standard
            italiani invece che adattati a posteriori. Codice aperto, documentazione aperta,
            integrabile con i sistemi che una struttura sanitaria già usa.
          </Translate>
        </p>
        <div>
          <Link
            className="button button--primary button--lg"
            to="/docs/10_fondamenti/00-come-usare-questa-guida">
            <Translate id="home.cta.primary">Comincia dai fondamenti</Translate>
          </Link>
          {'  '}
          <Link className="button button--secondary button--lg" to="/docs/01_technical/00-indice">
            <Translate id="home.cta.secondary">Vai alla documentazione</Translate>
          </Link>
        </div>
      </header>

      <main className="container margin-bottom--xl">
        <div className="tmWarn">
          <strong>
            <Translate id="home.warning.title">Questo software non è un dispositivo medico marcato CE.</Translate>
          </strong>{' '}
          <Translate id="home.warning.body">
            Il progetto non appone la marcatura CE e non si dichiara accreditato presso alcuna
            infrastruttura nazionale. Chi lo immette sul mercato o lo mette in servizio assume gli
            obblighi che ne derivano. La documentazione dice, per ogni obbligo, se ricade sul
            progetto o su chi installa: è la distinzione più importante di tutto questo sito.
          </Translate>
        </div>

        <div className="tmCards">
          <Card
            title={translate({id: 'home.card.foundations.title', message: 'Non dà nulla per scontato'})}
            body={translate({
              id: 'home.card.foundations.body',
              message:
                'Una guida che parte da zero: come funziona il sistema sanitario italiano, che cos’è un dato clinico, come si legge un parametro vitale, che cosa sono FHIR e il Fascicolo. Si legge prima di contribuire.',
            })}
            to="/docs/10_fondamenti/00-come-usare-questa-guida"
            cta={translate({id: 'home.card.foundations.cta', message: 'Guida dei fondamenti'})}
          />
          <Card
            title={translate({id: 'home.card.integration.title', message: 'Aperto a ogni integrazione'})}
            body={translate({
              id: 'home.card.integration.body',
              message:
                'Quattro modalità di integrazione documentate, ciascuna con la sezione che dice quando è la scelta sbagliata. Una guida che non lo dice è materiale di vendita, non documentazione.',
            })}
            to="/docs/07_integration/00-indice"
            cta={translate({id: 'home.card.integration.cta', message: 'Integrare Telemedic'})}
          />
          <Card
            title={translate({id: 'home.card.security.title', message: 'La sicurezza prima delle misure'})}
            body={translate({
              id: 'home.card.security.body',
              message:
                'Ogni misura arriva dopo il bene che protegge, l’avversario da cui lo protegge e la conseguenza clinica se fallisce. I punti in cui il dato è in chiaro sono dichiarati, non taciuti.',
            })}
            to="/docs/06_security/00-indice"
            cta={translate({id: 'home.card.security.cta', message: 'Modello di sicurezza'})}
          />
          <Card
            title={translate({id: 'home.card.decisions.title', message: 'Decisioni con le loro conseguenze'})}
            body={translate({
              id: 'home.card.decisions.body',
              message:
                'Ogni scelta strutturale è registrata con il contesto, le alternative scartate e il prezzo accettato. Una decisione senza le sue conseguenze è un’opinione.',
            })}
            to="/docs/adr/README"
            cta={translate({id: 'home.card.decisions.cta', message: 'Registro delle decisioni'})}
          />
        </div>
      </main>
    </Layout>
  );
}
