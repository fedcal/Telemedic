# Questo repository non è un dispositivo medico

*[English version below](#this-repository-is-not-a-medical-device)*

> **Leggi questa pagina prima di installare, integrare o distribuire Telemedic.**

## Cosa contiene questo repository

**Codice sorgente e documentazione.** Nient'altro.

Telemedic non è un prodotto immesso sul mercato, non reca marcatura CE, non è coperto da
alcuna dichiarazione di conformità e non è stato sottoposto alla valutazione di un Organismo
Notificato. Il progetto **non appone la marcatura CE e non sottoscrive dichiarazioni di
conformità**.

## Destinazione d'uso — dichiarazione

Telemedic è **software di supporto all'erogazione di prestazioni sanitarie a distanza**. Le
sue funzioni sono:

- mettere in comunicazione audio e video un professionista sanitario e un assistito, o due
  professionisti fra loro, in una sessione identificata, tracciata e cifrata;
- raccogliere, conservare, trasmettere e presentare dati clinici e parametri, **senza
  alterarne il contenuto informativo**;
- produrre e trasmettere documenti clinici firmati dal professionista;
- raccogliere parametri per la **revisione differita da parte del professionista**, e
  segnalare il superamento di soglie **configurate dal professionista** per il singolo
  assistito.

## Limiti d'uso — dichiarazione

Telemedic **non**:

- formula diagnosi, non propone diagnosi differenziali e non suggerisce terapie;
- sostituisce la valutazione clinica del professionista, che resta l'unico responsabile
  dell'atto sanitario;
- è destinato a situazioni di **emergenza o urgenza**. Non è un canale di soccorso: per
  un'emergenza si contattano i numeri di emergenza.
- garantisce sorveglianza continua dei parametri vitali, né allarme in tempo reale con
  intervento garantito. La raccolta è differita e la presa in carico dipende
  dall'organizzazione che eroga il servizio e dalla copertura oraria che essa dichiara;
- calcola punteggi clinici, indici prognostici o classificazioni di rischio in autonomia;
- decide soglie cliniche. Nessuna soglia clinica è cablata nel codice: sono configurazione
  a cura del professionista.

Il **superamento di una soglia genera una segnalazione, non una diagnosi né un intervento**.

## Cosa deve fare chi lo mette in servizio

Chi installa, integra, distribuisce o mette in servizio Telemedic in un contesto sanitario
reale:

1. **Deve verificare il codice.** Non è una formula di stile: è la condizione a cui il
   progetto rende disponibile il proprio lavoro.
2. **Assume il ruolo di fabbricante** ai sensi del Regolamento (UE) 2017/745, con tutti gli
   obblighi che ne discendono — qualificazione, classificazione, valutazione della
   conformità, valutazione clinica, sorveglianza post-commercializzazione, vigilanza.
3. **Assume il ruolo di titolare del trattamento** dei dati sanitari, con la valutazione
   d'impatto, le basi giuridiche, le informative e gli obblighi di notifica.
4. **Assume gli obblighi di sicurezza** applicabili alla propria organizzazione.

Il progetto pubblica il materiale regolatorio — documentazione di ciclo di vita, gestione
del rischio, ingegneria dell'usabilità, distinta dei materiali software — **per rendere
questo percorso praticabile, non per sostituirlo**. Vedi
[`docs/08_compliance/`](docs/08_compliance/).

## Sull'esclusione di responsabilità

La licenza Apache-2.0 esclude garanzie e responsabilità **fra le parti della licenza**.

Va detto con chiarezza che questo **non si estende alla persona danneggiata**: l'art. 15
della Direttiva (UE) 2024/2853 vieta l'esclusione o la limitazione contrattuale della
responsabilità nei confronti del danneggiato, e l'art. 10 prevede una presunzione di
difettosità in caso di non conformità a requisiti obbligatori di sicurezza previsti dal
diritto dell'Unione.

Chiunque metta in servizio questo software in un contesto clinico se ne assume le
conseguenze verso i pazienti. Nessuna clausola di licenza cambia questo fatto.

---

# This repository is not a medical device

> **Read this page before deploying, integrating or distributing Telemedic.**

## What this repository contains

**Source code and documentation.** Nothing else.

Telemedic is not a product placed on the market, bears no CE marking, is covered by no
declaration of conformity, and has not undergone Notified Body assessment. The project
**affixes no CE marking and signs no declaration of conformity**.

## Intended use — declaration

Telemedic is **software supporting the delivery of healthcare services at a distance**. Its
functions are:

- to connect a healthcare professional and a patient, or two professionals, by audio and
  video in an identified, logged and encrypted session;
- to collect, store, transmit and present clinical data and parameters **without altering
  their informational content**;
- to produce and transmit clinical documents signed by the professional;
- to collect parameters for **deferred review by the professional**, and to signal breaches
  of thresholds **configured by the professional** for the individual patient.

## Use limitations — declaration

Telemedic does **not**:

- make diagnoses, propose differential diagnoses or suggest therapies;
- replace the professional's clinical judgement, who remains solely responsible for the
  clinical act;
- serve **emergency or urgent** situations. It is not an emergency channel: in an emergency,
  call the emergency services;
- provide continuous vital sign surveillance, nor real-time alarms with guaranteed response.
  Collection is deferred and response depends on the organisation delivering the service and
  on the service hours it declares;
- compute clinical scores, prognostic indices or risk classifications on its own;
- decide clinical thresholds. No clinical threshold is hardcoded: thresholds are
  configuration set by the professional.

A **threshold breach produces a notification, not a diagnosis and not an intervention**.

## What deployers must do

Anyone deploying, integrating, distributing or putting Telemedic into service in a real
healthcare setting:

1. **Must review the code.** This is not boilerplate: it is the condition under which the
   project makes its work available.
2. **Assumes the manufacturer role** under Regulation (EU) 2017/745, with all resulting
   obligations — qualification, classification, conformity assessment, clinical evaluation,
   post-market surveillance, vigilance.
3. **Assumes the controller role** for health data processing, with impact assessment, legal
   bases, privacy notices and notification duties.
4. **Assumes the security obligations** applicable to their organisation.

The project publishes regulatory material — lifecycle documentation, risk management,
usability engineering, software bill of materials — **to make that path practicable, not to
replace it**. See [`docs/08_compliance/`](docs/08_compliance/).

## On the exclusion of liability

Apache-2.0 excludes warranties and liability **between the parties to the licence**.

It must be stated plainly that this **does not extend to an injured person**: Article 15 of
Directive (EU) 2024/2853 prohibits contractual exclusion or limitation of liability towards
the injured party, and Article 10 establishes a presumption of defectiveness where a product
does not comply with mandatory safety requirements laid down in Union law.

Whoever puts this software into service in a clinical setting bears the consequences towards
patients. No licence clause changes that.
