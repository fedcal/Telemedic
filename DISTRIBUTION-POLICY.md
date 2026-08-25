# Politica di distribuzione

*[English version below](#distribution-policy)*

> Questo documento distingue **ciò che il progetto pubblica** da **ciò che qualcuno mette in
> servizio**. È la distinzione da cui dipendono gli obblighi regolatori, e confonderla è il
> modo più rapido per attribuirli al soggetto sbagliato.
>
> Ne esiste una seconda, trattata al [§ I due artefatti](#i-due-artefatti-il-repository-aperto-e-la-distribuzione-identificata):
> il **repository aperto** e la **distribuzione identificata** sono due artefatti distinti, e
> il primo **non diventa** il secondo. Chi prende il codice dal repository e lo installa non
> installa un dispositivo certificato — oggi, che nessuna distribuzione certificata esiste, né
> il giorno in cui esisterà.

## 1. Che cosa il progetto pubblica

Il progetto Telemedic pubblica **codice sorgente, documentazione e materiale di supporto alla
conformità**. Nient'altro.

| Artefatto | Che cos'è | Che cosa **non** è |
|---|---|---|
| Repository dei sorgenti | Codice e documentazione sotto Apache-2.0 | Un prodotto pronto all'uso |
| Sito della documentazione | Pubblicazione leggibile degli stessi contenuti | Istruzioni per l'uso di un dispositivo medico |
| Immagini e definizioni di distribuzione | Strumenti per provare e sviluppare | Una configurazione idonea alla produzione clinica |
| Materiale regolatorio | Documentazione di ciclo di vita, gestione del rischio, usabilità, distinta dei materiali | Un fascicolo tecnico sottoscritto da un fabbricante |
| Distinta dei materiali software | Inventario dei componenti, per release | Una garanzia di assenza di vulnerabilità |

**Oggi il progetto non appone marcatura CE e non sottoscrive dichiarazioni di conformità**,
perché il soggetto fabbricante non è ancora costituito e nessuna procedura di valutazione della
conformità è stata conclusa. Lo stato di fatto del prodotto è quello dichiarato in
[`NOT-A-MEDICAL-DEVICE.md`](NOT-A-MEDICAL-DEVICE.md) e nel modulo
[Il quadro regolatorio da zero](docs/10_fondamenti/15-regolatorio-da-zero.md), e non è cambiato.

Questa posizione è **fattuale, non perpetua**, e la direzione in cui cambierà è dichiarata: il
progetto **intende** costituire il soggetto fabbricante e intraprendere il percorso di
certificazione, e il materiale regolatorio è prodotto per quel percorso. Il cambiamento
riguarderà però **la distribuzione identificata e non il repository** (§ 3), e questo documento
va riscritto **prima** del cambiamento, non dopo. Resta inoltre vero, e indipendente dal
percorso di certificazione, che la qualificazione attuale del repository dipende dal fatto che
il progetto non renda disponibile un prodotto pronto all'uso nel quadro di un'attività
commerciale: se questo cambiasse, cambierebbe anche la qualificazione.

## 2. Che cosa fa chi distribuisce o mette in servizio

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

**Che il progetto intenda certificare in futuro non trasferisce nulla a chi installa oggi.**
Nessuno dei cinque punti si attenua, si sposta o si trasferisce al progetto per effetto di
quell'intenzione: chi mette in servizio una versione non certificata assume gli obblighi che ne
derivano, esattamente come prima.

## 3. I due artefatti: il repository aperto e la distribuzione identificata

Esistono, e continueranno a esistere, **due artefatti distinti**. Confonderli è l'errore che
questo documento esiste per impedire.

| | **Repository aperto** | **Distribuzione identificata** |
|---|---|---|
| Che cos'è | Codice sorgente e documentazione sotto Apache-2.0 | Un artefatto costruito, identificato e sottoposto a controllo qualità, con nome e numero di versione propri |
| Oggi | Esiste, ed è questo | **Non esiste** |
| Chi lo rende disponibile | Il progetto | Il soggetto fabbricante, ancora da costituire |
| Che cosa può portare | Nessuna marcatura, mai | La marcatura CE, se e quando il percorso di certificazione sarà concluso |
| Ciclo di vita | Quello dei rilasci del progetto | Proprio e distinto, sotto il sistema di gestione della qualità del fabbricante |

Ne discendono tre affermazioni, e nessuna delle tre va attenuata.

1. **Il repository resta aperto e resta ciò che è.** La certificazione di una distribuzione non
   chiude il repository, non ne cambia la licenza e non ne cambia la natura: il codice sorgente
   non è un dispositivo medico né prima né dopo.
2. **Chi prende il codice dal repository e lo installa non installa un dispositivo
   certificato.** Vale oggi, che nessuna distribuzione certificata esiste, e varrà identico il
   giorno in cui esisterà. Una marcatura copre **l'artefatto esatto che è stato valutato, nella
   versione esatta in cui è stato valutato**: non si estende al codice sorgente da cui
   quell'artefatto è costruito, né ad alcuna costruzione eseguita da altri, né a una versione
   successiva non valutata.
3. **Ricompilare i sorgenti non riproduce il dispositivo.** Anche a parità di codice, ciò che
   rende un artefatto *quel* dispositivo è la catena di costruzione controllata, il rilascio
   sotto il sistema di gestione della qualità del fabbricante e l'identificazione che ne
   consegue. Chi costruisce per proprio conto produce un artefatto proprio, del quale il
   fabbricante è lui.

Non è una restrizione che il progetto impone a chi ridistribuisce: è il modo in cui funziona la
valutazione della conformità.

## 4. Come sono identificate le versioni

- **Versionamento semantico.** Una versione con numero maggiore diverso può rompere i contratti
  pubblici; una minore no.
- **Ogni release pubblica**: note di rilascio, distinta dei materiali, esito dei test, periodo di
  supporto dichiarato e — dove la modifica tocca aree qualificanti — la documentazione di
  gestione delle modifiche.
- **Le versioni prive di release non esistono.** Un ramo, un commit o una build intermedia non
  sono una versione distribuita e non ricevono supporto di sicurezza.
- **Gli artefatti sono firmati** e la loro provenienza è verificabile. Un artefatto che non
  superi la verifica di provenienza non proviene da questo progetto, qualunque nome porti.
- **Gli identificativi dei due artefatti non si sovrappongono.** Quando la distribuzione
  identificata esisterà, porterà un proprio schema di denominazione e di versione, distinto da
  quello dei rilasci del repository: un numero di versione del repository non designa mai una
  distribuzione, e viceversa.

## 5. Cosa il progetto chiede a chi ridistribuisce

Nessuna di queste richieste limita i diritti concessi da Apache-2.0. Sono richieste di
correttezza, non condizioni di licenza.

1. **Non presentare la ridistribuzione come certificata** se non lo è, e non lasciare intendere
   che una certificazione derivi dal progetto. Oggi non esiste alcuna marcatura CE da cui
   derivare; se un giorno esisterà, coprirà **la distribuzione identificata e nient'altro**, e
   una ridistribuzione non la eredita (§ 3).
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
>
> There is a second one, dealt with under
> [§ The two artefacts](#the-two-artefacts-the-open-repository-and-the-identified-distribution):
> the **open repository** and the **identified distribution** are two distinct artefacts, and
> the first **does not become** the second. Whoever takes the code from the repository and
> deploys it is not deploying a certified device — not today, when no certified distribution
> exists, and not on the day one does.

## 1. What the project publishes

The Telemedic project publishes **source code, documentation and compliance support material**.
Nothing else.

| Artefact | What it is | What it is **not** |
|---|---|---|
| Source repository | Code and documentation under Apache-2.0 | A ready-to-use product |
| Documentation site | A readable publication of the same content | Instructions for use of a medical device |
| Distribution images and definitions | Tools for evaluation and development | A configuration fit for clinical production |
| Regulatory material | Lifecycle documentation, risk management, usability, software bill of materials | A technical file signed by a manufacturer |
| Software bill of materials | Component inventory, per release | A warranty of freedom from vulnerabilities |

**Today the project affixes no CE marking and signs no declaration of conformity**, because the
manufacturer entity has not yet been constituted and no conformity assessment procedure has
been completed. The factual state of the product is the one declared in
[`NOT-A-MEDICAL-DEVICE.md`](NOT-A-MEDICAL-DEVICE.md), and it has not changed.

This position is **factual, not perpetual**, and the direction in which it will change is
stated: the project **intends** to constitute the manufacturer entity and to undertake the
certification path, and the regulatory material is produced for that path. The change will
however concern **the identified distribution and not the repository** (§ 3), and this document
must be rewritten **before** the change, not after. It also remains true, independently of the
certification path, that the repository's current qualification rests on the project not making
a ready-to-use product available in the course of a commercial activity: were that to change,
the qualification would change too.

## 2. What distributors and deployers do

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

**The project's intention to certify in future transfers nothing to anyone deploying today.**
None of the five points is softened, shifted or transferred to the project by that intention:
whoever puts an uncertified version into service assumes the obligations that follow, exactly
as before.

## 3. The two artefacts: the open repository and the identified distribution

There are, and there will continue to be, **two distinct artefacts**. Confusing them is the
error this document exists to prevent.

| | **Open repository** | **Identified distribution** |
|---|---|---|
| What it is | Source code and documentation under Apache-2.0 | A built, identified, quality-controlled artefact with its own name and version number |
| Today | It exists, and it is this | **It does not exist** |
| Who makes it available | The project | The manufacturer entity, still to be constituted |
| What it may carry | No marking, ever | The CE marking, if and when the certification path is completed |
| Lifecycle | That of the project's releases | Its own and separate, under the manufacturer's quality management system |

Three statements follow, and none of the three is to be softened.

1. **The repository stays open and stays what it is.** Certifying a distribution does not close
   the repository, does not change its licence and does not change its nature: source code is
   not a medical device, neither before nor after.
2. **Whoever takes the code from the repository and deploys it is not deploying a certified
   device.** This holds today, when no certified distribution exists, and it will hold
   identically on the day one does. A marking covers **the exact artefact that was assessed, in
   the exact version in which it was assessed**: it does not extend to the source code from
   which that artefact is built, nor to any build performed by others, nor to a later version
   that was not assessed.
3. **Rebuilding the sources does not reproduce the device.** Even with identical code, what
   makes an artefact *that* device is the controlled build chain, the release under the
   manufacturer's quality management system and the identification that follows from it.
   Whoever builds on their own account produces their own artefact, of which they are the
   manufacturer.

This is not a restriction the project imposes on redistributors: it is how conformity
assessment works.

## 4. How versions are identified

- **Semantic versioning.** A different major version may break public contracts; a minor one may
  not.
- **Every release publishes**: release notes, software bill of materials, test results, declared
  support period and — where the change touches qualifying areas — change management
  documentation.
- **Unreleased versions do not exist.** A branch, a commit or an intermediate build is not a
  distributed version and receives no security support.
- **Artefacts are signed** and their provenance is verifiable. An artefact failing provenance
  verification does not come from this project, whatever name it carries.
- **The identifiers of the two artefacts do not overlap.** When the identified distribution
  exists, it will carry its own naming and versioning scheme, separate from that of the
  repository's releases: a repository version number never designates a distribution, and vice
  versa.

## 5. What the project asks of redistributors

None of these requests limits the rights granted by Apache-2.0. They are requests for fair
dealing, not licence conditions.

1. **Do not present the redistribution as certified** when it is not, and do not imply that a
   certification derives from the project. Today there is no CE marking to derive from; if one
   day there is, it will cover **the identified distribution and nothing else**, and a
   redistribution does not inherit it (§ 3).
2. **Retain** `LICENSE`, `NOTICE`, `NOT-A-MEDICAL-DEVICE.md` and `THIRD-PARTY-TERMINOLOGY.md`,
   and make them accessible to whoever receives the product.
3. **Declare substantial modifications** made: whoever assesses clinical risk must be able to
   know what changed from the original.
4. **Do not use the project name** in a way that suggests endorsement, certification or project
   responsibility for the derived product.
5. **Report vulnerabilities** you find, following [`SECURITY.md`](SECURITY.md). It is the one
   request whose breach also harms somebody else's patients.
