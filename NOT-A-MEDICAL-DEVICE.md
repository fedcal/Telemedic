# Questo repository non è un dispositivo medico

*[English version below](#this-repository-is-not-a-medical-device)*

> **Leggi questa pagina prima di installare, integrare o distribuire Telemedic.**

## Cosa contiene questo repository

**Codice sorgente e documentazione.** Nient'altro.

Telemedic non è un prodotto immesso sul mercato, **non reca marcatura CE**, non è coperto da
alcuna dichiarazione di conformità e non è stato sottoposto alla valutazione di un Organismo
Notificato. Nessuna procedura di valutazione della conformità è stata conclusa, e il soggetto
che potrebbe sottoscrivere una dichiarazione - il fabbricante ai sensi del Regolamento (UE)
2017/745 - **non è ancora costituito**.

Questo è uno **stato di fatto**, non una posizione: vale finché non cambia, e cambia soltanto
quando i certificati esistono. Il progetto **intende** costituire il soggetto fabbricante e
intraprendere il percorso di certificazione; che cosa questo comporta, e soprattutto che cosa
**non** comporta per chi installa oggi, è detto al
[§ Il percorso di certificazione](#il-percorso-di-certificazione-chi-lo-intraprende-e-che-cosa-non-cambia).

## Destinazione d'uso - dichiarazione

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

## Limiti d'uso - dichiarazione

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
   obblighi che ne discendono - qualificazione, classificazione, valutazione della
   conformità, valutazione clinica, sorveglianza post-commercializzazione, vigilanza.
3. **Assume il ruolo di titolare del trattamento** dei dati sanitari, con la valutazione
   d'impatto, le basi giuridiche, le informative e gli obblighi di notifica.
4. **Assume gli obblighi di sicurezza** applicabili alla propria organizzazione.

Il progetto produce il materiale regolatorio - documentazione di ciclo di vita, gestione del
rischio, ingegneria dell'usabilità, distinta dei materiali software - **per il percorso di
certificazione che intende intraprendere**, e lo pubblica. Materiale pubblicato non è materiale
sottoscritto: **non è il fascicolo tecnico di un fabbricante e non solleva chi installa da
nessuno dei quattro obblighi elencati qui sopra**. Vedi
[`docs/08_compliance/`](docs/08_compliance/).

## Il percorso di certificazione: chi lo intraprende, e che cosa non cambia

**Il ruolo di fabbricante sarà assunto dal progetto.** Il soggetto giuridico corrispondente
**va ancora costituito e formalizzato**: oggi non esiste. Il materiale regolatorio è prodotto
per quel percorso, e la relativa pianificazione è **pianificazione interna del progetto**
([`docs/08_compliance/09-percorso-e-calendario.md`](docs/08_compliance/09-percorso-e-calendario.md)).

Quattro conseguenze vanno lette per intero, perché sono precisamente ciò che questa
formulazione rende possibile fraintendere.

1. **L'intenzione di certificare non trasferisce nulla a chi installa oggi.** Chi prende una
   versione non certificata e la mette in servizio assume per intero i quattro obblighi del
   paragrafo precedente, esattamente come prima. Chi legge «stanno certificando» e ne conclude
   «allora posso usarlo» trae una conclusione **sbagliata**, e le conseguenze di quella
   conclusione restano sue.
2. **Nessuna data promessa.** Questo documento non promette, e **nessun artefatto del progetto
   promette**, una data entro la quale il prodotto sarà marcato. <!-- data-e-marcatura: enunciato del divieto, §11 regola 4 - il capoverso che vieta di promettere una data e' costretto a nominare sia la marcatura sia la forma temporale --> Delle date esistono, e vanno
   dette invece che taciute: la pianificazione interna le contiene
   ([`docs/08_compliance/09-percorso-e-calendario.md`](docs/08_compliance/09-percorso-e-calendario.md),
   ripreso da [`docs/10_fondamenti/15-regolatorio-da-zero.md`](docs/10_fondamenti/15-regolatorio-da-zero.md)).
   Sono date di lavoro interno, non impegni verso chicchessia, e chi le legge come previsione di
   un esito le sta leggendo per quello che non sono: l'esito dipende da un soggetto fabbricante
   non ancora costituito e da un organismo notificato che non ha ancora ricevuto alcun fascicolo.
   L'intenzione di certificare e la promessa di un esito datato restano due cose diverse: la
   destinazione d'uso di un dispositivo si ricava anche dal materiale pubblicato (art. 2, punto
   12, del Regolamento (UE) 2017/745) e le dichiarazioni fuorvianti sono vietate anche in assenza
   di marcatura (art. 7 del medesimo regolamento). Per questo le date della pianificazione stanno
   dove devono stare - in un capitolo di pianificazione, dichiarate come tali e accompagnate dalle
   condizioni che le reggono - e non compaiono in questa pagina come promessa.
3. **Ciò che un giorno potrà essere certificato non è questo repository.** Il dispositivo, se
   e quando esisterà, sarà una **distribuzione identificata**, con un proprio nome, un proprio
   numero di versione e un proprio ciclo di vita. Chi prende il codice da qui e lo installa
   **non installa un dispositivo certificato**, e questo non cambierà nemmeno il giorno in cui
   la distribuzione lo sarà. La distinzione è trattata in
   [`DISTRIBUTION-POLICY.md`](DISTRIBUTION-POLICY.md).
4. **Finché quel percorso non è concluso, lo stato del prodotto è quello descritto in questa
   pagina**: nessuna marcatura CE, nessuna dichiarazione di conformità, nessuna valutazione di
   un Organismo Notificato, e obblighi interi in capo a chi installa.

## Sull'esclusione di responsabilità

La licenza Apache-2.0 esclude garanzie e responsabilità **fra le parti della licenza**.

Va detto con chiarezza che questo **non si estende alla persona danneggiata**: l'art. 15
della Direttiva (UE) 2024/2853 vieta l'esclusione o la limitazione contrattuale della
responsabilità nei confronti del danneggiato, e l'art. 10 prevede una presunzione di
difettosità in caso di non conformità a requisiti obbligatori di sicurezza previsti dal
diritto dell'Unione.

Chiunque metta in servizio questo software in un contesto clinico se ne assume le
conseguenze verso i pazienti. Nessuna clausola di licenza cambia questo fatto, e non lo cambia
l'intenzione del progetto di certificare: **un'intenzione non copre nessuno**, né il progetto
né chi installa.

---

# This repository is not a medical device

> **Read this page before deploying, integrating or distributing Telemedic.**

## What this repository contains

**Source code and documentation.** Nothing else.

Telemedic is not a product placed on the market, **bears no CE marking**, is covered by no
declaration of conformity, and has not undergone Notified Body assessment. No conformity
assessment procedure has been completed, and the entity that could sign a declaration - the
manufacturer within the meaning of Regulation (EU) 2017/745 - **has not yet been constituted**.

This is a **statement of fact**, not a position: it holds until it changes, and it changes only
when the certificates exist. The project **intends** to constitute the manufacturer entity and
to undertake the certification path; what that entails, and above all what it does **not**
entail for anyone deploying today, is set out under
[§ The certification path](#the-certification-path-who-undertakes-it-and-what-does-not-change).

## Intended use - declaration

Telemedic is **software supporting the delivery of healthcare services at a distance**. Its
functions are:

- to connect a healthcare professional and a patient, or two professionals, by audio and
  video in an identified, logged and encrypted session;
- to collect, store, transmit and present clinical data and parameters **without altering
  their informational content**;
- to produce and transmit clinical documents signed by the professional;
- to collect parameters for **deferred review by the professional**, and to signal breaches
  of thresholds **configured by the professional** for the individual patient.

## Use limitations - declaration

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
   obligations - qualification, classification, conformity assessment, clinical evaluation,
   post-market surveillance, vigilance.
3. **Assumes the controller role** for health data processing, with impact assessment, legal
   bases, privacy notices and notification duties.
4. **Assumes the security obligations** applicable to their organisation.

The project produces the regulatory material - lifecycle documentation, risk management,
usability engineering, software bill of materials - **for the certification path it intends to
undertake**, and publishes it. Published material is not signed material: **it is not a
manufacturer's technical file, and it relieves deployers of none of the four obligations listed
above**. See [`docs/08_compliance/`](docs/08_compliance/).

## The certification path: who undertakes it, and what does not change

**The manufacturer role will be assumed by the project.** The corresponding legal entity
**still has to be constituted and formalised**: it does not exist today. The regulatory
material is produced for that path, and the related schedule is **the project's internal
planning**
([`docs/08_compliance/09-percorso-e-calendario.md`](docs/08_compliance/09-percorso-e-calendario.md)).

Four consequences must be read in full, because they are precisely what this formulation makes
it possible to misunderstand.

1. **The intention to certify transfers nothing to anyone deploying today.** Whoever takes an
   uncertified version and puts it into service assumes the four obligations of the preceding
   paragraph in full, exactly as before. Whoever reads "they are certifying" and concludes
   "then I may use it" draws a **wrong** conclusion, and the consequences of that conclusion
   remain theirs.
2. **No date promised.** This document does not promise, and **no project artefact promises**, a
   date by which the product will be marked. <!-- data-e-marcatura: statement of the prohibition, §11 rule 4 - the paragraph forbidding a promised date must name both the marking and the temporal form --> Dates do exist, and they are to be stated rather
   than withheld: the internal planning holds them
   ([`docs/08_compliance/09-percorso-e-calendario.md`](docs/08_compliance/09-percorso-e-calendario.md),
   restated in [`docs/10_fondamenti/15-regolatorio-da-zero.md`](docs/10_fondamenti/15-regolatorio-da-zero.md)).
   They are internal working dates, not commitments to anyone, and whoever reads them as a
   forecast of an outcome is reading them for what they are not: the outcome depends on a
   manufacturer entity not yet constituted and on a notified body that has received no technical
   file. The intention to certify and the promise of a dated outcome remain two different things:
   a device's intended use is derived from published material as well (Article 2(12) of
   Regulation (EU) 2017/745), and misleading claims are prohibited even in the absence of a
   marking (Article 7 of the same regulation). This is why the planning dates stay where they
   belong - in a planning chapter, declared as such and accompanied by the conditions that hold
   them up - and do not appear on this page as a promise.
3. **What may one day be certified is not this repository.** The device, if and when it
   exists, will be an **identified distribution**, with its own name, its own version number
   and its own lifecycle. Whoever takes the code from here and deploys it **is not deploying a
   certified device**, and that will not change even on the day the distribution is certified.
   The distinction is dealt with in [`DISTRIBUTION-POLICY.md`](DISTRIBUTION-POLICY.md).
4. **Until that path is completed, the state of the product is the one described on this
   page**: no CE marking, no declaration of conformity, no Notified Body assessment, and the
   obligations resting in full on whoever deploys it.

## On the exclusion of liability

Apache-2.0 excludes warranties and liability **between the parties to the licence**.

It must be stated plainly that this **does not extend to an injured person**: Article 15 of
Directive (EU) 2024/2853 prohibits contractual exclusion or limitation of liability towards
the injured party, and Article 10 establishes a presumption of defectiveness where a product
does not comply with mandatory safety requirements laid down in Union law.

Whoever puts this software into service in a clinical setting bears the consequences towards
patients. No licence clause changes that, and neither does the project's intention to certify:
**an intention covers nobody**, neither the project nor the deployer.
