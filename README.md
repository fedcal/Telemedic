<div align="center">

# Telemedic

**Piattaforma di telemedicina open source per televisita, teleconsulto, teleassistenza e telemonitoraggio.**

[![Licenza: Apache 2.0](https://img.shields.io/badge/Licenza-Apache%202.0-blue.svg)](LICENSE)
[![Documentazione](https://img.shields.io/badge/Documentazione-IT%20%7C%20EN-brightgreen.svg)](https://fedcal.github.io/Telemedic/)
[![Stato](https://img.shields.io/badge/Stato-in%20progettazione-orange.svg)](#stato-del-progetto)
[![FHIR](https://img.shields.io/badge/FHIR-R4%204.0.1-red.svg)](https://hl7.org/fhir/R4/)

**📖 [Documentazione online — fedcal.github.io/Telemedic](https://fedcal.github.io/Telemedic/)**

*[English version below](#telemedic-1)*

</div>

---

> [!IMPORTANT]
> **Questo repository non è un dispositivo medico.** Non reca marcatura CE e non è coperto da
> alcuna dichiarazione di conformità. Chi lo installa, integra o mette in servizio in un
> contesto sanitario **deve verificarne il codice** e assume il ruolo di fabbricante ai sensi
> del Regolamento (UE) 2017/745.
>
> Il progetto **intende** costituire il soggetto fabbricante e intraprendere il percorso di
> certificazione. Quel soggetto **oggi non esiste**, nessuna data è dichiarata, e
> **l'intenzione non trasferisce nulla** a chi installa oggi una versione non certificata:
> gli obblighi restano interi in capo a chi la mette in servizio. Ciò che un giorno potrà
> essere certificato è una **distribuzione identificata**, non questo repository — vedi
> **[la politica di distribuzione](DISTRIBUTION-POLICY.md)**.
>
> Leggi **[la dichiarazione di destinazione d'uso e dei limiti d'uso](NOT-A-MEDICAL-DEVICE.md)**
> prima di procedere.

## Cos'è

Telemedic è una piattaforma di telemedicina progettata per essere **installata, integrata e
resa propria**, non solo utilizzata. Nasce da una constatazione: le prestazioni di
telemedicina in Italia hanno definizioni normative precise, un'infrastruttura nazionale a cui
rispondere e obblighi documentali specifici — e quasi nessuna soluzione open source li tratta
sul serio.

Il progetto copre le quattro prestazioni definite dall'Accordo Stato-Regioni 215/CSR del 2020
e dai decreti successivi:

| Prestazione | In sintesi |
|---|---|
| **Televisita** | Atto sanitario a distanza fra professionista e assistito, con referto |
| **Teleconsulto** | Confronto a distanza fra professionisti su un caso clinico |
| **Teleassistenza** | Assistenza a distanza da parte di professioni sanitarie non mediche |
| **Telemonitoraggio** | Raccolta di parametri per la revisione differita del professionista |

## Perché esiste

Tre ragioni, in ordine di importanza.

**Perché la telemedicina italiana ha regole proprie.** Il DM 19 novembre 2025 ha creato dieci
tipologie documentali dedicate per il Fascicolo Sanitario Elettronico. L'art. 3, comma 4,
consente alle Regioni di erogare telemedicina con applicativi diversi da quelli delle gare
nazionali, purché rispettino standard certificati e alimentino il fascicolo. Serve software
che sappia farlo.

**Perché l'integrazione viene prima delle funzionalità.** Un sistema di telemedicina che non
dialoga con il gestionale già in uso non viene adottato. Telemedic è progettato per essere
integrato in quattro modi — servizio autonomo, interfacce applicative, componente
incorporabile, moduli sostituibili — e la documentazione dell'integrazione è un deliverable
di pari rango rispetto al codice.

**Perché la documentazione è parte del prodotto.** In sanità un software non documentato non è
installabile: la conformità richiede tracciabilità, gestione del rischio e prove. Il progetto
tratta questa documentazione come codice, non come corredo.

## Stack

**Backend** Spring Boot 3.4 · Java 21 · PostgreSQL con TimescaleDB · Apache Kafka con outbox
transazionale · Keycloak
**Frontend** Angular 21 con componenti standalone · progettazione mobile first · WCAG 2.1 AA
**Comunicazione** WebRTC · coturn per STUN e TURN · DTLS-SRTP con verifica a stringa breve
**Interoperabilità** FHIR R4 (4.0.1) con le guide italiane · HL7 v2 su MLLP protetto · profili IHE
**Distribuzione** Docker Compose per l'installazione presso il cliente · servizio gestito multi-tenant

Nessun componente obbligatorio del percorso principale dipende da servizi non sostituibili o
con sede fuori dall'Unione europea.

## Documentazione

La documentazione è **bilingue e integrale** in italiano e inglese.

> **[Guida dei fondamenti](docs/10_fondamenti/00-come-usare-questa-guida.md)** — ventuno moduli
> che partono da zero. Contesto sanitario, standard, protocolli, teoria clinica e informatica,
> quadro regolatorio, glossario. È il **prerequisito per contribuire**, ed è pensata sia per
> chi arriva dall'informatica senza background sanitario sia per il contrario.

| Area | Contenuto |
|---|---|
| [Panoramica](docs/00_overview/) | Visione, glossario, sintesi |
| [Tecnica](docs/01_technical/) | Componenti, scelte implementative, prestazioni |
| [Architettura](docs/02_architecture/) | Contesti, modello dati, eventi, multi-tenancy |
| [Funzionale](docs/03_functional/) | Requisiti, flussi, casi d'uso |
| [Protocolli](docs/04_protocols/) | Ogni protocollo, come il progetto lo usa |
| [Dominio](docs/05_domain/) | Il dominio sanitario e la sua modellazione |
| [Sicurezza](docs/06_security/) | Minacce, misure, identità, tracciamento |
| [Integrazione](docs/07_integration/) | Come collegare Telemedic a un sistema esistente |
| [Conformità](docs/08_compliance/) | MDR, GDPR, NIS2, CRA, certificazioni |
| [Roadmap](docs/09_roadmap/) | Piano di lavoro, modificabile durante lo sviluppo |
| [ADR](docs/adr/) | Le decisioni architetturali e il loro perché |

## Stato del progetto

**In progettazione.** La fase di ricerca e documentazione è in corso; il codice applicativo
non è ancora pubblicato. La cronologia del repository riflette il lavoro reale, senza
retrodatazioni.

Nessuna delle funzionalità descritte è da considerarsi disponibile finché non compare in una
release. Le affermazioni su prestazioni, sicurezza e conformità presenti nella documentazione
sono **obiettivi di progetto e specifiche verificabili**, non attestazioni di conformità.

## Licenza

**Apache License 2.0** — vedi [`LICENSE`](LICENSE) e [`NOTICE`](NOTICE).

La licenza consente l'uso commerciale, la modifica e la distribuzione, anche in prodotti
proprietari. È una scelta deliberata: il progetto esiste per essere integrato.

Le terminologie cliniche hanno licenze proprie e **non tutte sono ridistribuibili**: leggi
[`THIRD-PARTY-TERMINOLOGY.md`](THIRD-PARTY-TERMINOLOGY.md) prima di aggiungere contenuto
terminologico.

## Contribuire

Leggi [`CONTRIBUTING.md`](CONTRIBUTING.md). In sintesi: **nessun dato reale, mai**; nessun
contenuto terminologico a licenza incompatibile; nessun segreto nel codice; tracciabilità per
le modifiche a rischio clinico; accessibilità come requisito, non come rifinitura.

Vedi anche [`GOVERNANCE.md`](GOVERNANCE.md), [`SECURITY.md`](SECURITY.md) e il
[Codice di Condotta](CODE_OF_CONDUCT.md).

---

<div align="center">

# Telemedic

**Open source telemedicine platform for remote consultation, professional teleconsultation, tele-assistance and remote monitoring.**

</div>

---

> [!IMPORTANT]
> **This repository is not a medical device.** It bears no CE marking and is covered by no
> declaration of conformity. Anyone deploying, integrating or putting it into service in a
> healthcare setting **must review the code** and assumes the manufacturer role under
> Regulation (EU) 2017/745.
>
> The project **intends** to constitute the manufacturer entity and to undertake the
> certification path. That entity **does not exist today**, no date is stated, and **the
> intention transfers nothing** to anyone deploying an uncertified version today: the
> obligations rest in full on whoever puts it into service. What may one day be certified is
> an **identified distribution**, not this repository — see
> **[the distribution policy](DISTRIBUTION-POLICY.md)**.
>
> Read **[the intended use and use limitations declaration](NOT-A-MEDICAL-DEVICE.md)** first.

## What it is

Telemedic is a telemedicine platform designed to be **deployed, integrated and made your
own**, not merely used. It starts from an observation: telemedicine services in Italy have
precise legal definitions, a national infrastructure to answer to and specific documentary
obligations — and almost no open source solution takes them seriously.

The project covers the four services defined by the 2020 State-Regions Agreement 215/CSR and
subsequent decrees: remote consultation with a patient, professional-to-professional
teleconsultation, tele-assistance by non-medical health professions, and remote monitoring
for deferred professional review.

## Why it exists

**Because Italian telemedicine has rules of its own.** The Ministerial Decree of 19 November
2025 created ten dedicated document types for the national health record. Article 3(4) allows
regions to deliver telemedicine using applications other than those procured nationally,
provided they meet certified standards and feed the national health record. That requires
software built for it.

**Because integration comes before features.** A telemedicine system that does not talk to
the practice management software already in use does not get adopted. Telemedic is designed
for four integration modes — standalone service, application interfaces, embeddable
component, replaceable modules — and integration documentation ranks equally with code.

**Because documentation is part of the product.** In healthcare, undocumented software is not
deployable: compliance requires traceability, risk management and evidence. The project treats
that documentation as code, not as an accessory.

## Stack

**Backend** Spring Boot 3.4 · Java 21 · PostgreSQL with TimescaleDB · Apache Kafka with
transactional outbox · Keycloak
**Frontend** Angular 21 standalone components · mobile first · WCAG 2.1 AA
**Real-time** WebRTC · coturn for STUN and TURN · DTLS-SRTP with short authentication string
**Interoperability** FHIR R4 (4.0.1) with Italian implementation guides · HL7 v2 over secured
MLLP · IHE profiles
**Deployment** Docker Compose for on-premise · multi-tenant managed service

No mandatory component on the main path depends on non-substitutable services or services
established outside the European Union.

## Documentation

Documentation is **complete and bilingual**, Italian and English.

> **[Foundations guide](docs/10_fondamenti/00-come-usare-questa-guida.md)** — twenty-one
> modules starting from zero: healthcare context, standards, protocols, clinical and computing
> theory, regulatory framework, glossary. It is the **prerequisite for contributing**, written
> both for people arriving from software without healthcare background and for the reverse.

See the area index in the Italian section above; the same structure applies to the English
documentation.

## Project status

**In design.** Research and documentation are under way; application code is not yet
published. The repository history reflects real work, without backdating.

No described feature should be considered available until it appears in a release. Statements
about performance, security and compliance in the documentation are **project objectives and
verifiable specifications**, not attestations of conformity.

## Licence

**Apache License 2.0** — see [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE).

The licence permits commercial use, modification and distribution, including in proprietary
products. This is deliberate: the project exists to be integrated.

Clinical terminologies carry their own licences and **not all are redistributable**: read
[`THIRD-PARTY-TERMINOLOGY.md`](THIRD-PARTY-TERMINOLOGY.md) before adding terminology content.

## Contributing

Read [`CONTRIBUTING.md`](CONTRIBUTING.md). In short: **no real data, ever**; no terminology
content under an incompatible licence; no secrets in code; traceability for clinically
sensitive changes; accessibility as a requirement, not as polish.

See also [`GOVERNANCE.md`](GOVERNANCE.md), [`SECURITY.md`](SECURITY.md) and the
[Code of Conduct](CODE_OF_CONDUCT.md).
