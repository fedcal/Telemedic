# Politica di distribuzione

*[English version below](#distribution-policy)*

> Questo documento distingue **ciò che il progetto pubblica** da **ciò che qualcuno mette in
> servizio**. È la distinzione da cui dipendono gli obblighi regolatori, e confonderla è il
> modo più rapido per attribuirli al soggetto sbagliato.

## Che cosa il progetto pubblica

Il progetto Telemedic pubblica **codice sorgente, documentazione e materiale di supporto alla
conformità**. Nient'altro.

| Artefatto | Che cos'è | Che cosa **non** è |
|---|---|---|
| Repository dei sorgenti | Codice e documentazione sotto Apache-2.0 | Un prodotto pronto all'uso |
| Sito della documentazione | Pubblicazione leggibile degli stessi contenuti | Istruzioni per l'uso di un dispositivo medico |
| Immagini e definizioni di distribuzione | Strumenti per provare e sviluppare | Una configurazione idonea alla produzione clinica |
| Materiale regolatorio | Documentazione di ciclo di vita, gestione del rischio, usabilità, distinta dei materiali | Un fascicolo tecnico sottoscritto da un fabbricante |
| Distinta dei materiali software | Inventario dei componenti, per release | Una garanzia di assenza di vulnerabilità |

**Il progetto non appone marcatura CE e non sottoscrive dichiarazioni di conformità.** La
posizione è argomentata in [`NOT-A-MEDICAL-DEVICE.md`](NOT-A-MEDICAL-DEVICE.md) e nel modulo
[Il quadro regolatorio da zero](docs/10_fondamenti/15-regolatorio-da-zero.md).

Va detto che questa posizione è **fattuale, non perpetua**: dipende dal fatto che il progetto
non renda disponibile un prodotto pronto all'uso nel quadro di un'attività commerciale. Se
questo cambiasse, cambierebbe anche la qualificazione, e il documento andrebbe riscritto prima
del cambiamento, non dopo.

## Che cosa fa chi distribuisce o mette in servizio

Chi prende questo codice, lo compila, lo installa, lo integra in un proprio prodotto o lo
offre come servizio compie un atto di natura diversa. Da quel momento:

1. **Assume il ruolo di fabbricante** se il prodotto ha una finalità medica, con qualificazione,
   classificazione, valutazione della conformità, valutazione clinica, sorveglianza
   post-commercializzazione e vigilanza.
2. **Assume il ruolo di titolare del trattamento** dei dati sanitari.
3. **Assume gli obblighi di sicurezza** applicabili alla propria organizzazione, compresi quelli
   di segnalazione, con i loro termini.
4. **Assume la responsabilità delle licenze terminologiche** che intende usare — vedi
   [`THIRD-PARTY-TERMINOLOGY.md`](THIRD-PARTY-TERMINOLOGY.md).
5. **Deve verificare il codice.** Non è una formula di stile: è la condizione a cui il progetto
   rende disponibile il proprio lavoro.

## Come sono identificate le versioni

- **Versionamento semantico.** Una versione con numero maggiore diverso può rompere i contratti
  pubblici; una minore no.
- **Ogni release pubblica**: note di rilascio, distinta dei materiali, esito dei test, periodo di
  supporto dichiarato e — dove la modifica tocca aree qualificanti — la documentazione di
  gestione delle modifiche.
- **Le versioni prive di release non esistono.** Un ramo, un commit o una build intermedia non
  sono una versione distribuita e non ricevono supporto di sicurezza.
- **Gli artefatti sono firmati** e la loro provenienza è verificabile. Un artefatto che non
  superi la verifica di provenienza non proviene da questo progetto, qualunque nome porti.

## Cosa il progetto chiede a chi ridistribuisce

Nessuna di queste richieste limita i diritti concessi da Apache-2.0. Sono richieste di
correttezza, non condizioni di licenza.

1. **Non presentare la ridistribuzione come certificata** se non lo è, e non lasciare intendere
   che la marcatura CE derivi dal progetto.
2. **Conservare** i file `LICENSE`, `NOTICE`, `NOT-A-MEDICAL-DEVICE.md` e
   `THIRD-PARTY-TERMINOLOGY.md`, e renderli accessibili a chi riceve il prodotto.
3. **Dichiarare le modifiche sostanziali** apportate: chi valuta il rischio clinico deve poter
   sapere che cosa è cambiato rispetto all'originale.
4. **Non usare il nome del progetto** in modo che suggerisca un'approvazione, una certificazione
   o una responsabilità del progetto sul prodotto derivato.
5. **Segnalare le vulnerabilità** trovate, secondo [`SECURITY.md`](SECURITY.md). È l'unica
   richiesta il cui mancato rispetto danneggia anche i pazienti di qualcun altro.

---

# Distribution policy

> This document separates **what the project publishes** from **what someone puts into
> service**. Regulatory obligations depend on that distinction, and blurring it is the fastest
> way to attribute them to the wrong party.

## What the project publishes

The Telemedic project publishes **source code, documentation and compliance support material**.
Nothing else.

| Artefact | What it is | What it is **not** |
|---|---|---|
| Source repository | Code and documentation under Apache-2.0 | A ready-to-use product |
| Documentation site | A readable publication of the same content | Instructions for use of a medical device |
| Distribution images and definitions | Tools for evaluation and development | A configuration fit for clinical production |
| Regulatory material | Lifecycle documentation, risk management, usability, software bill of materials | A technical file signed by a manufacturer |
| Software bill of materials | Component inventory, per release | A warranty of freedom from vulnerabilities |

**The project affixes no CE marking and signs no declaration of conformity.** The position is
argued in [`NOT-A-MEDICAL-DEVICE.md`](NOT-A-MEDICAL-DEVICE.md).

This position is **factual, not perpetual**: it rests on the project not making a ready-to-use
product available in the course of a commercial activity. Were that to change, the
qualification would change too — and this document would need rewriting before the change, not
after.

## What distributors and deployers do

Anyone who takes this code, builds it, deploys it, integrates it into their own product or
offers it as a service performs an act of a different nature. From that moment they:

1. **Assume the manufacturer role** if the product has a medical purpose, with qualification,
   classification, conformity assessment, clinical evaluation, post-market surveillance and
   vigilance.
2. **Assume the controller role** for health data processing.
3. **Assume the security obligations** applicable to their organisation, including reporting
   duties and their deadlines.
4. **Assume responsibility for the terminology licences** they intend to use — see
   [`THIRD-PARTY-TERMINOLOGY.md`](THIRD-PARTY-TERMINOLOGY.md).
5. **Must review the code.** Not boilerplate: it is the condition under which the project makes
   its work available.

## How versions are identified

- **Semantic versioning.** A different major version may break public contracts; a minor one may
  not.
- **Every release publishes**: release notes, software bill of materials, test results, declared
  support period and — where the change touches qualifying areas — change management
  documentation.
- **Unreleased versions do not exist.** A branch, a commit or an intermediate build is not a
  distributed version and receives no security support.
- **Artefacts are signed** and their provenance is verifiable. An artefact failing provenance
  verification does not come from this project, whatever name it carries.

## What the project asks of redistributors

None of these requests limits the rights granted by Apache-2.0. They are requests for fair
dealing, not licence conditions.

1. **Do not present the redistribution as certified** when it is not, and do not imply that CE
   marking derives from the project.
2. **Retain** `LICENSE`, `NOTICE`, `NOT-A-MEDICAL-DEVICE.md` and `THIRD-PARTY-TERMINOLOGY.md`,
   and make them accessible to whoever receives the product.
3. **Declare substantial modifications** made: whoever assesses clinical risk must be able to
   know what changed from the original.
4. **Do not use the project name** in a way that suggests endorsement, certification or project
   responsibility for the derived product.
5. **Report vulnerabilities** you find, following [`SECURITY.md`](SECURITY.md). It is the one
   request whose breach also harms somebody else's patients.
