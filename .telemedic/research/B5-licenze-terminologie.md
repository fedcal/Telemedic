---
title: "Licenze delle terminologie cliniche e compatibilità con Apache-2.0"
sidebar_position: 5
description: "Policy terminologica di Telemedic: regime di licenza di SNOMED CT, LOINC, ICD-9-CM, ICD-10/11, ATC/DDD, nomenclatore nazionale, UCUM, CVX, HL7, IHE e IG italiane; cosa può stare nel repository e cosa no."
---

# B5 - Licenze delle terminologie cliniche e compatibilità con Apache-2.0

> **Agente**: B5 (seconda ondata di ricerca - licenze terminologiche)
> **Data della ricerca**: 25 agosto 2026
> **Ambito**: fonti primarie (snomed.org, loinc.org, icd.who.int, atcddd.fhi.no, hl7.org, terminology.hl7.org, profiles.ihe.net, hl7.it, salute.gov.it, normattiva/testi di legge)
> **Documento presupposto**: [R1 - Standard e terminologie sanitarie](./R1-standard-sanitari.md), §8 (Terminologie) e §10.3 (policy terminologica raccomandata)
> **Regola R0 applicata**: nessun nome di azienda, prodotto commerciale, marchio o dominio di potenziale partner compare in questo documento.

---

## AVVERTENZA PRELIMINARE - NATURA DI QUESTO DOCUMENTO

**Questo documento è un'analisi tecnica di termini di licenza condotta su fonti pubbliche. Non è un parere legale e non costituisce consulenza legale.** Non instaura alcun rapporto professionale, non sostituisce la valutazione di un avvocato abilitato e non può essere invocato come base di una difesa.

Le conclusioni qui riportate sono raccomandazioni di ingegneria della conformità: indicano quale comportamento **espone meno** il progetto e i suoi utilizzatori, non quale comportamento sia certamente lecito. Prima del rilascio v1.0, e prima di qualunque decisione che comporti la distribuzione di contenuto terminologico di terzi, il committente deve sottoporre questo documento a un legale specializzato in proprietà intellettuale e diritto del software.

Alcuni termini di licenza analizzati **non sono verificabili integralmente in forma pubblica** (richiedono registrazione, sottoscrizione o acquisto). Ogni caso è dichiarato esplicitamente al §13.

---

## 0. Metodo, legenda e limiti della verifica

Si adotta la stessa scala di affidabilità di R1:

| Marcatore | Significato |
|---|---|
| **[V]** | Verificato direttamente sul testo di licenza o sulla pagina del titolare dei diritti durante questa ricerca. |
| **[V-sec]** | Verificato su fonte secondaria autorevole (mirror istituzionale, riproduzione in una specifica di un SDO, indicizzazione di un ente pubblico) perché la fonte primaria non era raggiungibile con gli strumenti disponibili. |
| **[NV]** | **Non verificato.** Riportato come indicazione da confermare; da non usare come base decisionale. |

### 0.1 Fonti che non è stato possibile leggere direttamente

Questa sezione è parte integrante del risultato: dichiarare ciò che non si è potuto verificare è una condizione di affidabilità del resto.

| Fonte | Motivo del mancato accesso | Come procurarsela |
|---|---|---|
| `https://loinc.org/license/` e `https://loinc.org/kb/license` | **HTTP 403** verso lo strumento di fetch (protezione anti-bot del sito). Il testo integrale della *LOINC Copyright Notice and License* **non è stato letto direttamente**. | Aprire l'URL da un normale browser; il testo è pubblico e non richiede registrazione. Le clausole citate al §3 provengono da riproduzioni testuali indicizzate **[V-sec]**. |
| `https://www.salute.gov.it/...` (pagina della pubblicazione ICD-9-CM 2007 e note legali del portale) | Il portale risponde con una **schermata di verifica anti-DDoS** che blocca il fetch automatico. | Aprire l'URL da browser. I fatti riportati al §4 provengono da fonti secondarie e dai documenti PDF ministeriali già verificati da R1. |
| `https://orders.atcddd.fhi.no/` (portale ordini ATC/DDD) | Applicazione JavaScript: la pagina restituita è vuota. Prezzi e condizioni contrattuali dei file elettronici ATC **non sono stati letti in forma primaria**. | Registrarsi sul portale ordini; i termini contrattuali sono esposti in fase di ordine. |
| Testo integrale dell'**Affiliate License Agreement** su `snomed.org/license` | La pagina primaria rinvia a un download. **È stato però letto integralmente** il testo dell'accordo nella versione in vigore dal **31 luglio 2023**, pubblicato come mirror istituzionale dall'autorità competente tedesca (BfArM) - vedi §2. La verifica è quindi **[V-sec] sul veicolo, [V] sul contenuto**. | Scaricare la versione corrente da `https://www.snomed.org/get-snomed` o dal portale MLDS, e confrontarla con quanto qui riportato prima di firmare. |
| Termini contrattuali dell'**ICD-10** (distinti da ICD-11) | Il documento *Terms of Use* letto (§5) copre la *Digital Version* delle Classificazioni sul portale `icd.who.int`. Il regime dell'ICD-10 nelle sue distribuzioni storiche non è stato accertato separatamente. | Scrivere a `licensing@who.int`. |
| `https://packages.simplifier.net/hl7.fhir.it.core` | HTTP 404 sull'endpoint interrogato. I metadati di licenza dei pacchetti HL7 Italia sono stati letti sulle risorse `ImplementationGuide` pubblicate (§9). | Interrogare il registry dei pacchetti FHIR configurato nella toolchain. |

### 0.2 Perimetro dell'analisi

L'analisi risponde a **tre domande distinte**, che vanno tenute separate perché hanno risposte diverse per la stessa terminologia:

1. **Distribuzione di contenuto** - il repository Telemedic, rilasciato sotto Apache-2.0, può contenere i codici, le descrizioni, le gerarchie, i file di release, le espansioni di value set, i seed di database, i mapping precalcolati di quella terminologia?
2. **Riferimento per URI + codice** - il software può scrivere in una risorsa FHIR un `Coding` con `system` = URI canonico e `code` = identificativo, e trasmetterlo?
3. **Interrogazione a runtime** - il software può interrogare un servizio terminologico esterno che detiene il contenuto, e su chi ricade in quel caso l'obbligo di licenza?

Confondere queste tre domande è l'errore che genera l'esposizione. Tutto il documento è costruito su questa distinzione.

---

## 1. Il vincolo di partenza: che cosa promette Apache-2.0 e perché il problema esiste

La decisione D1 del brief fissa **Apache-2.0** come licenza del progetto, motivata dalla necessità che il codice sia integrabile in prodotti proprietari.

### 1.1 Le promesse che Apache-2.0 fa a valle

Apache-2.0 non è una semplice autorizzazione all'uso: è una **concessione di diritti** che il licenziante fa a ogni destinatario. Le clausole rilevanti:

- **§2 (Grant of Copyright License)**: ciascun contributore concede una licenza *"perpetual, worldwide, non-exclusive, no-charge, royalty-free, **irrevocable** copyright license to reproduce, prepare **Derivative Works** of, publicly display, publicly perform, **sublicense**, and distribute the Work and such Derivative Works in Source or Object form"*.
- **§3 (Grant of Patent License)**: concessione esplicita di brevetti, con clausola di ritorsione.
- **§4 (Redistribution)**: *"You may reproduce and distribute copies of the Work or Derivative Works thereof in any medium, **with or without modifications**, and in Source or Object form"*, alle quattro condizioni (a) copia della licenza, (b) marcatura dei file modificati, (c) conservazione degli avvisi di attribuzione, (d) propagazione del file `NOTICE`.
- **§7-§8**: esclusione di garanzia e limitazione di responsabilità.

Fonte: <https://www.apache.org/licenses/LICENSE-2.0> **[V]**.

### 1.2 Il conflitto strutturale

Ogni file collocato nel repository e coperto dalla dichiarazione di licenza del progetto porta con sé, agli occhi di chi lo riceve, **cinque promesse**: uso gratuito, modifica, opere derivate, sublicenza, ridistribuzione - perpetue e irrevocabili.

Il progetto può fare queste promesse **soltanto sul materiale di cui detiene i diritti**. Su contenuto terminologico di terzi non può farle, perché:

1. **Non ne ha il titolo.** Non si può concedere ciò che non si possiede (*nemo plus iuris*).
2. **Le licenze terminologiche restrittive negano proprio quei diritti**: SNOMED CT vieta la modifica del Core (cl. 4.1) e impone che il contenuto non sia scaricabile da utenti non autorizzati (cl. 2.7); ATC/DDD vieta la distribuzione commerciale e la modifica; ICD-11 è CC BY-**ND**, cioè vieta le opere derivate; UCUM vieta le opere derivate ed è **revocabile**.
3. **La discrepanza è essa stessa un danno.** Anche se nessuno agisse mai in giudizio, un integratore che faccia due diligence sul repository trova materiale la cui provenienza contraddice la licenza dichiarata, e il progetto perde credibilità proprio nel mercato per cui è stato pensato.

### 1.3 Il corollario che protegge il progetto

Ne discende il principio che governa tutte le decisioni di questo documento:

> **Il repository Telemedic contiene soltanto materiale su cui il progetto può realmente concedere i diritti di Apache-2.0. Ogni altro contenuto terminologico è (a) escluso, oppure (b) isolato in una directory con licenza propria e dichiarazione esplicita che Apache-2.0 non vi si applica, oppure (c) acquisito a runtime dal deployer sotto la propria licenza.**

Le tre opzioni non sono equivalenti: la (a) è la più sicura, la (c) è quella che preserva la funzione al costo di un passo di configurazione, la (b) è ammissibile solo per terminologie la cui licenza consenta la ridistribuzione verbatim e la cui separazione sia inequivocabile.

### 1.4 Nota su Apache-2.0 §4(d) e il file `NOTICE`

Il `NOTICE` di Apache-2.0 ha una funzione tecnica precisa: propagare gli avvisi di attribuzione **contenuti nell'Opera**. La licenza consente di aggiungervi attribuzioni proprie *"provided that such additional attribution notices cannot be construed as modifying the License"*.

**Conseguenza pratica**: non si deve trasformare il `NOTICE` in un trattato sulle licenze terminologiche, perché un testo lungo e prescrittivo rischia di essere letto come una modifica della licenza. La soluzione corretta è un `NOTICE` breve, con un rinvio a un file dedicato (`THIRD-PARTY-TERMINOLOGY.md`) che contiene la trattazione estesa. I testi pronti all'uso sono al §14.

---

## 2. SNOMED CT - il nodo principale

### 2.1 Il fatto di partenza, confermato

R1 aveva accertato che **l'Italia non è fra i Membri di SNOMED International**. La verifica è stata ripetuta ed è confermata **[V]** (<https://www.snomed.org/members>, <https://www.snomed.org/get-snomed>).

Ne discende che il territorio italiano è, ai sensi dell'Affiliate License Agreement, un **Non-Member Territory**: *"a territory that is not a Member Territory"* (Appendix A, Defined Terms) **[V]**.

Questo non è un dettaglio burocratico. Nei paesi Membri l'accesso a SNOMED CT è gratuito e mediato dal National Release Center; in Italia non esiste un NRC, non esiste una licenza nazionale gratuita, e **ogni singolo utilizzatore deve procurarsi una licenza a titolo oneroso, individualmente, e pagarla ogni anno**.

### 2.2 Che cos'è l'Affiliate License e che cosa consente esattamente

**Testo esaminato**: *SNOMED CT® Affiliate License Agreement*, versione in vigore dal **31 luglio 2023**, letto integralmente (19 pagine, 15 clausole + Appendix A "Defined Terms" + Appendix B "License Fees in Non-Member Territories"). Il documento è stato reperito su mirror istituzionale del BfArM (autorità competente tedesca) all'indirizzo <https://www.bfarm.de/SharedDocs/Downloads/DE/Kodiersysteme/SNOMED-CT/AFFILIATE_LICENSE_AGREEMENT_gueltig_20230731.pdf>. **Il contenuto è [V]; la sua attualità va riconfermata su `snomed.org/license` prima della sottoscrizione.**

#### 2.2.1 Come si diventa Licensee - e perché questo protegge il progetto

L'avviso in testa all'accordo è determinante:

> *"By **downloading, accessing or using** any part of the International Release of SNOMED CT or a Member's National Release of SNOMED CT, or exercising any rights granted under this License Agreement, the Licensee agrees to be bound by the terms of this License Agreement."* **[V]**

L'accordo si perfeziona **per fatto concludente**, nel momento in cui si scarica o si accede al contenuto. Il corollario è la linea di difesa più solida del progetto:

> **Se il progetto Telemedic non scarica mai, non accede mai e non usa mai il contenuto di SNOMED CT, non diventa mai Licensee e l'accordo non lo vincola mai.**

Questa linea è pulita ma **fragile**: basta che un manutentore scarichi i file RF2 "per fare una prova" perché il progetto diventi Licensee, con tutti gli obblighi conseguenti (dichiarazione annuale, pagamento, registro dei sub-licenziatari). Al §12.3 è proposta una misura tecnica per proteggerla.

#### 2.2.2 La concessione (clausola 2.1)

Il Licensor concede una licenza *perpetua (salvo revoca ex cl. 5), mondiale, non esclusiva, non trasferibile* per **[V]**:

| Clausola | Diritto concesso |
|---|---|
| 2.1.1 | usare l'International Release, e permetterne l'uso a dirigenti, dipendenti, agenti e contraenti del Licensee |
| 2.1.2 | creare Extensions e Derivatives dall'International Release, e usarli e modificarli |
| 2.1.3 | incorporare l'International Release nei **Licensee Products** e distribuire i Licensee Products **sotto sub-licenza** ai sensi della cl. 2.1.5 |
| 2.1.4 | modificare **il solo formato** della copia del SNOMED CT Core distribuita |
| 2.1.5 | concedere sub-licenze agli **End Users**, *"to the extent necessary for the End Users to use the Licensee Products"* |

#### 2.2.3 Gli usi permessi (clausola 2.2) - la clausola che decide tutto

La cl. 2.2 è formulata in modo **tassativo**: *"The Licensee may **only** use the International Release... for"* **[V]**:

| Clausola | Uso permesso |
|---|---|
| 2.2.1 | finalità di business interne del Licensee (creazione di Extensions, Derivatives e Licensee Products, e loro licenza e distribuzione) |
| 2.2.2 | sviluppo e gestione dei sistemi informativi del Licensee |
| 2.2.3 | finalità di ricerca del Licensee |
| 2.2.4 | sistemi del Licensee (inclusi browser e sistemi di analisi dati) resi disponibili al pubblico, **a condizione che** gli utenti *"are not able to extract any substantial portion of SNOMED CT"* **e** che *"no fee is charged for access to those systems"* |
| **2.2.5** | **trasmettere a terzi messaggi contenenti informazione del paziente codificata con SNOMED CT, «provided that the SNOMED CT Content contained within those messages consists solely of SNOMED CT Identifiers and descriptions of SNOMED CT concepts»** |

**La clausola 2.2.5 è la base giuridica esatta dell'uso "per riferimento".** Un `Coding` FHIR con `system = "http://snomed.info/sct"`, `code = "<ConceptId>"` e `display = "<descrizione>"`, inserito in una `Composition` o in un `Encounter` e trasmesso al sistema EHR di origine, è **precisamente** il caso previsto: un messaggio contenente informazione clinica del paziente in cui il contenuto SNOMED consiste unicamente in identificativi e descrizioni di concetti.

**Ma la cl. 2.2 si apre con "The Licensee may only use..."**: l'uso è permesso **a un Licensee**. Chi trasmette quei messaggi deve essere Affiliate o sub-licenziatario di un Affiliate. Non esiste una franchigia per "uso solo per riferimento" a favore di chi non ha licenza.

> **Conclusione operativa n. 1**: l'uso di SNOMED CT per riferimento URI+codice **è pienamente ammesso, ma solo a chi ha la licenza**. La licenza serve a chi *installa ed esercisce* Telemedic, non al progetto che ne scrive il codice - purché il progetto non tocchi mai il contenuto.

#### 2.2.4 La clausola 2.7 - perché un repository pubblico è escluso per definizione

> **2.7** *"The Licensee shall implement reasonable measures to ensure that the International Release (and any part of it) cannot be accessed or downloaded from the Licensee's systems **except by authorised users**, and shall comply with the security measures that the Licensor prescribes by Regulations."* **[V]**

Un repository GitHub pubblico è l'esatto contrario di un sistema ad accesso controllato. Non esiste modo di pubblicare contenuto SNOMED CT in un repository open source pubblico rispettando la cl. 2.7. **Questa clausola, da sola, chiude la questione.**

Si noti che il divieto riguarda *"any part of it"*: non c'è una soglia di minimis esplicita nel testo dell'accordo.

#### 2.2.5 Il regime dei derivative works (clausole 2.3, 3.x, 4.x e Appendix A)

Le definizioni di Appendix A **[V]**:

| Termine | Definizione (verbatim, estratto) |
|---|---|
| **SNOMED CT Content** | *"terminological content, consisting of concepts, descriptions and Relationships, each of which is identified using a SNOMED CT Identifier"* |
| **SNOMED CT Core** | *"the SNOMED CT Content that is controlled, maintained and distributed by the Licensor"* |
| **Extension** | *"a work consisting of SNOMED CT Content alone that is supplementary to the SNOMED CT Core and that depends on the SNOMED CT Core"* |
| **Derivative** | *"a work consisting of (a) SNOMED CT Content, from the SNOMED CT CORE or an Extension; together with (b) either (i) additional properties and/or information about such SNOMED CT content; and/or (ii) any set of relationships between that SNOMED CT Content and content of other nomenclature, classification or knowledge structure, and includes a **Cross-Map** and a **Sub-Set**"* |
| **Cross-Map** | *"a work consisting of (i) SNOMED CT Content and (ii) content of another nomenclature, classification or knowledge structure, together with a set of relationships between (i) and (ii)"* |
| **Sub-Set** | *"a sub-set of SNOMED CT Content that is grouped together for one or more purposes"* |
| **Data Processing System** | *"a computer system that is used to analyze or create records or other data that is encoded using SNOMED CT"* |
| **Licensee Products** | *"products distributed or licensed by the Licensee that (1) include or interoperate with the International Release (or any part of it) and/or any Extensions or Derivatives created by the Licensee under this License Agreement, or (2) **read or write records or other data that is encoded using SNOMED CT**"* |
| **End User** | *"a third party user of a Licensee Product"* |

Queste definizioni hanno **tre conseguenze non ovvie e decisive**:

**(a) Un value set espanso è un Sub-Set, cioè un Derivative.** Un file `ValueSet` FHIR con `expansion.contains[]` popolato da codici SNOMED è *"un sub-set di SNOMED CT Content raggruppato per uno o più scopi"*: è un Derivative ai sensi dell'accordo. Non è un artefatto neutro del progetto.

**(b) Una tabella di mapping SNOMED ↔ ICD-9-CM è un Cross-Map, cioè un Derivative.** Se Telemedic volesse precalcolare la corrispondenza fra codici SNOMED e codici ICD-9-CM italiani per popolare `Condition.code`, produrrebbe un Cross-Map. Solo un Licensee può crearlo (cl. 2.3), e per gli Standards-Based Extension/Derivative serve preventivamente un **Namespace Identifier** rilasciato dal Licensor (cl. 3.1) **[V]**.

**(c) Telemedic è, per definizione, un "Licensee Product" nelle mani di chi lo distribuisce.** La definizione al punto (2) - *"read or write records or other data that is encoded using SNOMED CT"* - non richiede che il prodotto **contenga** SNOMED CT: basta che **legga o scriva** dati codificati con SNOMED CT. Un software di telemedicina che persiste `Condition.code` con codici SNOMED ricade nella definizione anche se nel suo codice sorgente non c'è un solo concetto SNOMED.

> **Conclusione operativa n. 2**: l'integratore o l'azienda sanitaria che **distribuisce o commercializza** un'istanza di Telemedic capace di leggere/scrivere codici SNOMED sta distribuendo un Licensee Product e deve essere Affiliate (o sub-licenziatario di un Affiliate). Questo è un obbligo **dell'utilizzatore**, non del progetto - ma il progetto deve dirglielo, chiaramente e per iscritto.

Ulteriori vincoli rilevanti sui derivati **[V]**:

- **cl. 2.3** - il Licensee può creare Extensions solo *dall'*International Release; per creare Extension o Derivative da un'Extension di un Membro serve un accordo con quel Membro.
- **cl. 2.4** - *"The Licensee is not permitted to translate any part of the International Release into any other human language without the prior written consent of the Licensor."* **Tradurre in italiano le descrizioni SNOMED richiede consenso scritto preventivo.** In assenza di un Membro italiano, non esiste una traduzione italiana ufficiale liberamente disponibile: chi la volesse deve chiederla a SNOMED International.
- **cl. 3.4** - il Licensee possiede i diritti IP sui propri Extensions e Derivatives, ma non può cederli se non a un altro Affiliate.
- **cl. 3.5 / 3.6** - su richiesta del Licensor, il Licensee **deve trasferire** al Licensor (o a un Membro da esso designato) i diritti IP sugli Standards-Based Extensions. Chi costruisce un patrimonio terminologico derivato lo costruisce su un titolo condizionato.
- **cl. 4.1** - salvo la modifica del solo formato (cl. 2.1.4), *"the Licensee may not modify any part of the SNOMED CT Core"*.

#### 2.2.6 Sub-licenza: che cosa il licenziatario può e non può passare a valle (clausole 2.5, 5.8, 8.8)

Ogni sub-licenza concessa dal Licensee deve **[V]**:

| Clausola | Vincolo |
|---|---|
| 2.5.1 | non concedere all'End User diritti maggiori di quelli che il Licensee stesso ha |
| 2.5.2 | non permettere all'End User atti che al Licensee sono vietati |
| 2.5.3 | **non permettere all'End User di sub-licenziare o trasferire** i propri diritti (salvo che l'End User sia a sua volta Affiliate) |
| 2.5.4 | terminare automaticamente con la cessazione dell'Affiliate License |
| 2.5.5 | informare l'End User che la sub-licenza terminerà, e che il Licensor *potrà* (ma non è obbligato a) concedergli una licenza temporanea |
| 2.5.6 | permettere al Licensee di rivelare i termini della sub-licenza al Licensor |

E la cl. **8.8** impone al Licensee di **mantenere un registro completo e aggiornato di tutte le sub-licenze concesse**, ispezionabile dal Licensor con preavviso di 14 giorni, contenente nome e sede legale di ciascun sub-licenziatario, il Licensee Product oggetto della sub-licenza e la versione dell'International Release inclusa **[V]**.

**Questo è il punto in cui la catena di sub-licenza collide frontalmente con Apache-2.0.** Apache-2.0 §2 concede espressamente il diritto di *sublicense*, senza registro, senza tracciamento, senza terminazione a cascata, in modo *irrevocabile*. La cl. 2.5.3 lo nega, la cl. 2.5.4 lo rende revocabile, la cl. 8.8 lo rende tracciato. **Le due strutture sono incompatibili per costruzione, non per formulazione.**

#### 2.2.7 Obbligo di avviso (clausola 8.3)

Il Licensee deve **[V]** includere il seguente avviso *"on all media on which the Licensee Products are distributed and on the documentary form of each sub-license"*:

> *"This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. "SNOMED" and "SNOMED CT" are registered trademarks of the IHTSDO."*

e (cl. 8.3.2) specificare **versione e data dell'International Release** contenuta nel Licensee Product.

Vincoli di marchio (cl. 8.2) **[V]**: divieto di usare marchi che includano la parola "SNOMED" o confondibili; divieto di registrare marchi simili; **divieto di abbreviare i marchi "SNOMED" o "SNOMED CT"**.

> **Nota per Telemedic**: questo avviso **non va inserito nel `NOTICE` del progetto**, perché il progetto non è Licensee e non distribuisce SNOMED CT. Inserirlo sarebbe una dichiarazione falsa. Va invece **fornito al deployer come testo da inserire lui**, nella documentazione di deployment (§14.3).

#### 2.2.8 Costi effettivi in Italia (Appendix B)

Appendix B, paragrafo 2.1, tabella delle *baseline fee* annuali **[V]**:

| Soggetto | Tariffa annuale (baseline, USD) |
|---|---|
| **Hospital** in territorio Banda A | **1.954** |
| Hospital in territorio Banda B | 1.303 |
| Hospital in territorio Banda C | 652 |
| **Practice** (Banda A, B o C) | **652** |
| Hospital o Practice in Low Income Band | **0** |
| Hospital o Practice in altro territorio | secondo par. 5.2 (allocazione su richiesta) |

Definizioni rilevanti (Appendix A) **[V]**:
- **Hospital**: *"a health care body or organisation providing secondary and/or tertiary care"*.
- **Practice**: *"(a) a single department of a Hospital... or (b) any health care body or organisation that provides principally primary care, including without limitation a pharmacy, an optician's facility, a physiotherapy centre, a general medical practice or a family medical practice"*.

Regole di calcolo che incidono direttamente sul modello SaaS multi-tenant (decisione D8 del brief) **[V]**:

- **Appendix B, par. 1.5**: se un Hospital o una Practice è su **più siti fisici**, ciascun sito è trattato come Hospital/Practice separato e le fee si moltiplicano (salvo deroga discrezionale del Licensor, par. 1.6).
- **Appendix B, par. 1.7**: il deployment/distribuzione/licenza di *"any software that operates on a mobile device of any kind"* o *"any software or service that is accessed via the internet and enables users to extract or download any substantial portion of SNOMED CT"* **non ricade nel par. 2** (tariffa per Hospital/Practice) ma nel **par. 4 "Other Activities"**, cioè in un regime negoziato caso per caso, con obbligo di notifica preventiva scritta (par. 4.1) e fee determinata discrezionalmente dal Licensor (par. 4.3).
- **Appendix B, par. 1.8**: l'obbligo di pagare **non dipende dal fatto che il deployment sia in produzione**. Ambienti di sviluppo e test sono in principio soggetti a fee, salvo rinuncia discrezionale del Licensor.
- **Appendix B, par. 5.1**: l'allocazione di un territorio non-Membro in Banda A/B/C/Low Income è **determinata dal Licensor** sulla base del reddito nazionale lordo relativo.
- **Clausola 7.1 e 7.3**: le fee sono pagabili **annualmente in via posticipata**, previa presentazione di uno *statement of account* almeno una volta per anno solare, contenente l'elenco di tutti i contratti relativi ai Licensee Products in vigore nel periodo.

> **[NV] - L'allocazione dell'Italia in una banda specifica non è stata verificata su fonte SNOMED.** L'Italia è un paese ad alto reddito secondo la classificazione della Banca Mondiale, il che rende **verosimile** la Banda A, ma il par. 5.1 attribuisce la determinazione al Licensor. **Il deployer deve ottenere l'allocazione per iscritto da SNOMED International prima di preventivare.**

La pagina `https://www.snomed.org/licensing` **[V]** riporta gli stessi importi (1.954 / 1.303 / 652 USD; Practice 652 USD; low income gratuito) e conferma che *"If you are using and/or deploying SNOMED CT in a non-Member country/territory, you are required to apply for a license on an annual basis"*, tramite il **Member Licensing & Distribution Service (MLDS)**, `https://mlds.ihtsdotools.org/`.

#### 2.2.9 Licenze gratuite: ricerca e paesi a basso reddito

Esistono e sono documentate **[V]** (<https://www.snomed.org/fee-exemptions>). Quattro categorie di esenzione:

| Categoria | Condizioni |
|---|---|
| **Low-Income Countries** | Territori in **Banda E** secondo le categorie di reddito della Banca Mondiale. **L'Italia non vi rientra.** |
| **Development Licenses** | Per paesi o organizzazioni non-Membri interessati a capacità di sviluppo commerciale. Da negoziare con `info@snomed.org`. |
| **Qualifying Research Projects** | Progetti di ricerca **non commerciale**. Appendix A definisce i criteri cumulativi **[V]**: (a) proposta formale sottoposta a peer review; (b) approvazione etica secondo la legislazione del territorio; (c) svolgimento entro un arco temporale definito; (d) risultati offerti per la pubblicazione su riviste peer-reviewed e forniti gratuitamente al Licensor prima della pubblicazione. Domanda con lettera formale firmata su carta intestata indirizzata al CEO di SNOMED International. Obbligo di rendicontazione annuale. |
| **Humanitarian or Charitable Use** | Organizzazioni non profit, uso non commerciale, a beneficio di popolazioni rurali o di paesi poveri. Obbligo di rendicontazione annuale. |

> **Valutazione per Telemedic**: **nessuna delle quattro esenzioni è applicabile al progetto.** Telemedic non è un progetto di ricerca peer-reviewed a termine (criterio (c) di Appendix A: *"conducted within a definite timeframe"*); non è un'iniziativa umanitaria; ed è **espressamente destinato all'integrazione in prodotti proprietari commerciali** (decisione D1). La strada dell'esenzione è chiusa e **non va perseguita**: tentare di ottenerla dichiarando finalità non commerciali sarebbe una rappresentazione non veritiera, e la cl. 1.9 di Appendix B prevede che il Licensor **revochi** l'esenzione in caso di mancato rispetto delle condizioni.

Per singoli deployer, invece, la strada può essere praticabile: un'azienda ospedaliera che usi Telemedic in un progetto di ricerca conforme ai criteri può chiedere l'esenzione. È informazione da mettere nella documentazione di deployment, non da usare come base della strategia del progetto.

#### 2.2.10 Utilizzatore in paese Membro vs. utilizzatore in paese non Membro

La differenza è netta e va spiegata nella documentazione, perché Telemedic è pensato anche per l'export (D3, D4).

| Aspetto | Deployer in **paese Membro** (es. Francia, Germania, Spagna, Paesi Bassi, Regno Unito…) | Deployer in **paese non Membro** (**Italia**, e la maggior parte del mondo) |
|---|---|---|
| Costo della licenza | **Nessuno.** *"No charges apply for member countries"* **[V]** (<https://www.snomed.org/get-snomed>) | **A pagamento**, tariffa annuale per Hospital/Practice (§2.2.8) |
| Come si ottiene | Registrazione presso il **National Release Center** del proprio paese, o via MLDS dove disponibile **[V]** | Domanda annuale via **MLDS**, `https://mlds.ihtsdotools.org/` **[V]** |
| Contenuto disponibile | International Release **+ National Release** (estensione nazionale, spesso con traduzione nella lingua nazionale) | Solo **International Release** (in inglese) |
| Condizioni ulteriori | Il Membro può prescrivere condizioni proprie (cl. 9.1 e 9.2): notifica preventiva, sottoscrizione di un accordo separato per la National Release **[V]** | Obbligo di **notifica preventiva scritta al Licensor** prima di esercitare i diritti in un nuovo territorio non-Membro (cl. 9.3) **[V]** |
| Traduzione nella lingua nazionale | Di norma **disponibile** nella National Release | **Non disponibile**; produrla richiede consenso scritto preventivo (cl. 2.4) **[V]** |
| Obbligo di *statement of account* | Non dovuto per l'attività nel territorio Membro | **Dovuto annualmente** (cl. 7.3) **[V]** |

> **Conseguenza per la documentazione**: la stessa installazione di Telemedic, con la stessa configurazione, ha implicazioni economiche e amministrative **radicalmente diverse** a seconda del paese del deployer. La documentazione deve dirlo esplicitamente e non deve presumere il contesto italiano.

Nota rilevante per l'archetipo dell'integratore (§6 del brief): un integratore che serva clienti in più paesi si trova ad aggregare, sotto la propria Affiliate License, sub-licenze in territori con regimi diversi, con obbligo di notifica per ciascun nuovo territorio non-Membro (cl. 9.3) e obbligo di registro (cl. 8.8).

### 2.3 Il terminology server esterno: su chi ricade l'obbligo

È la domanda più fraintesa del dossier. La risposta si ricava dalla combinazione delle definizioni e delle clausole già citate.

Si distinguono **tre soggetti**:

**(1) L'operatore del terminology server.** Detiene fisicamente l'International Release e ne espone il contenuto via API (`$expand`, `$lookup`, `$validate-code`, `$translate`, `$subsumes`). Sta **usando** e, di fatto, **rendendo accessibile** SNOMED CT. Deve avere una licenza che copra questa modalità:
- se il servizio è **pubblico e gratuito** e non consente l'estrazione di *"any substantial portion"*, può ricadere nella cl. 2.2.4 **[V]**;
- se il servizio è **accessibile via internet e consente di estrarre o scaricare una porzione sostanziale**, ricade in Appendix B par. 1.7 → par. 4 *"Other Activities"*, con notifica preventiva e fee negoziata **[V]**;
- se il servizio è **a pagamento**, la condizione *"no fee is charged for access to those systems"* della cl. 2.2.4 non è soddisfatta: serve un accordo specifico.

SNOMED International distribuisce essa stessa un terminology server open source (Snowstorm) e mantiene un'istanza dimostrativa dichiarata *"for non-production use only"* **[V]** (<https://www.implementation.snomed.org/terminology-services>). **Il fatto che il software del server sia open source non ha alcuna incidenza sulla licenza del contenuto che vi si carica**: sono due strati distinti, e la confusione fra i due è un errore ricorrente.

**(2) Il deployer di Telemedic che interroga il server.** Qui sta il punto che quasi tutti sbagliano:

> **Interrogare un terminology server esterno NON solleva il deployer dall'obbligo di licenza.**

Motivo: nel momento in cui l'installazione di Telemedic **scrive** un codice SNOMED in una risorsa `Condition`, `Encounter.reasonCode` o `Composition`, quell'installazione è un **Data Processing System** ai sensi di Appendix A - *"a computer system that is used to analyze or create records or other data that is encoded using SNOMED CT"* **[V]** - e Appendix B par. 2.1 lega la fee proprio al deployment di *"any Licensee Product that is or includes a Data Processing System"* **[V]**. Non c'è alcuna esenzione per il caso in cui il contenuto risieda altrove.

Inoltre, il deployer *usa* SNOMED CT (accede al contenuto tramite l'API), il che di per sé lo fa rientrare nel perimetro dell'avviso in testa all'accordo (*"downloading, accessing or using"*).

**(3) Il progetto Telemedic.** Scrive e pubblica codice sorgente in grado di parlare con un terminology server. Non contiene contenuto SNOMED, non lo scarica, non lo espone, non lo distribuisce. **Non è Licensee e non ha obblighi verso SNOMED International**, purché la disciplina del §2.4 sia rispettata senza eccezioni.

> **Conclusione operativa n. 3**: il terminology server esterno risolve il problema **della distribuzione del contenuto** (che è il problema del progetto), non il problema **della licenza d'uso** (che è il problema del deployer). Presentarlo come una soluzione completa nella documentazione sarebbe fuorviante e trasferirebbe al deployer un rischio che non ha compreso.

Nota di conformità incrociata: la questione **Q2** sollevata da R1 resta aperta e va risolta dall'agente MDR - un terminology server esterno è una dipendenza runtime non controllata, da classificare come **SOUP** ai sensi di IEC 62304, e la sua collocazione geografica va verificata rispetto al vincolo **V1** (nessun componente obbligatorio fuori dall'UE) del brief.

### 2.4 Conclusione operativa: cosa può contenere il repository e cosa no

#### 2.4.1 AMMESSO nel repository (rischio residuo basso)

| Artefatto | Motivazione |
|---|---|
| L'**URI canonico** `http://snomed.info/sct` come stringa costante | Un URI non è SNOMED CT Content: è un identificatore di sistema definito dalla specifica FHIR (CC0). |
| Il **pattern di URI di versione** `http://snomed.info/sct/[sctid]/version/[YYYYMMDD]` come documentazione di formato | Idem: è sintassi, non contenuto. |
| `ValueSet` FHIR che **compongono per filtro/ECL** senza espansione, es. `compose.include.filter` con `op = "is-a"` e `value = "404684003"` | Nessuna espansione, nessuna descrizione, nessuna gerarchia. L'esposizione è limitata al singolo ConceptId di ancoraggio, in numero minimo. |
| `StructureDefinition` con `binding.valueSet` che **punta** a un value set SNOMED per canonical URL | Un riferimento a un canonical URL non è contenuto. |
| Codice sorgente di client terminologici (`$expand`, `$lookup`, `$validate-code`, `$translate`, `$subsumes`) | È software del progetto. |
| Il **testo informativo** sugli obblighi di licenza (documentazione, `THIRD-PARTY-TERMINOLOGY.md`) | È opera del progetto. |
| Test che usano **codici fittizi** su un code system di progetto (`http://telemedic.example/fake-sct`) o un doppio di test | Nessun contenuto reale. |

#### 2.4.2 VIETATO nel repository (rischio alto o certo)

| Artefatto | Clausola violata |
|---|---|
| File di release RF2 (`sct2_Concept_*`, `sct2_Description_*`, `sct2_Relationship_*`, refset) | cl. 2.7 (accesso non controllato); il progetto non è Licensee |
| `ValueSet` con `expansion.contains[]` popolato di codici SNOMED | Appendix A: è un **Sub-Set** → **Derivative**; cl. 2.7 |
| CSV / JSON / SQL di lookup `codice → descrizione` | SNOMED CT Content (concepts + descriptions); cl. 2.7 |
| Seed di database, migration Flyway/Liquibase con codici e descrizioni SNOMED | Idem |
| `ConceptMap` SNOMED ↔ ICD-9-CM / LOINC / codici nazionali | Appendix A: **Cross-Map** → **Derivative**; cl. 2.3 e 3.1 (serve Namespace Identifier) |
| Gerarchie, alberi di sussunzione, indici di ricerca precalcolati | **Derivative** |
| Descrizioni SNOMED tradotte in italiano | cl. 2.4 (consenso scritto preventivo) |
| Snapshot o cache di risposte `$expand` committati nel repository | **Sub-Set** → Derivative; cl. 2.7 |
| Fixture di test con **risposte reali** del terminology server contenenti codici e display SNOMED | Idem - è il canale con cui il contenuto rientra dalla porta di servizio |
| L'avviso della cl. 8.3.1 nel `NOTICE` del progetto | Dichiarazione non veritiera: il progetto non è Licensee |

#### 2.4.3 La zona grigia: `Coding.display` negli esempi

Nel repository ci saranno esempi FHIR (istanze di `Composition`, `Encounter`, `Condition`). La domanda è se un `Coding` di esempio possa portare `display` con la descrizione SNOMED.

**Argomento a favore**: sono pochi concetti, l'esempio è documentazione, e la cl. 2.2.5 ammette esplicitamente identificativi *e descrizioni* nei messaggi.

**Argomento contro** (che prevale): (i) la cl. 2.2.5 riguarda la **trasmissione di messaggi contenenti informazione del paziente**, non la pubblicazione di documentazione; (ii) le *descriptions* sono espressamente SNOMED CT Content per Appendix A; (iii) la cl. 2.7 non prevede una soglia di minimis; (iv) soprattutto, **il progetto non è Licensee** e quindi non può invocare nessuna clausola dell'accordo a proprio favore.

> **Raccomandazione conservativa**: negli esempi committati nel repository, **non usare SNOMED CT**. Usare LOINC (§3), ICD-9-CM italiano (§4), o i code system nazionali. Dove un esempio debba illustrare specificamente l'uso di SNOMED, usare un **placeholder tipografico** (es. `"code": "<SNOMED-CT-ConceptId>"`, `"display": "<descrizione fornita dal terminology server>"`) con una nota che rinvia alla documentazione di licenza.
>
> **Costo funzionale della prudenza**: gli esempi che illustrano i binding SNOMED risultano meno leggibili e non sono direttamente eseguibili contro un validatore senza configurare un terminology server. È un costo reale ma contenuto, e si paga una volta sola: in cambio si preserva la linea di difesa "il progetto non è mai stato Licensee", che è l'unica difesa assoluta disponibile.

#### 2.4.4 Il problema ereditato dall'IG HL7 Italia

R1 ha rilevato che l'IG *Televisita* dichiara SNOMED CT fra le dipendenze **[V]**. Questa ricerca lo conferma dal lato opposto: la pagina dell'IG **It-Core** riporta in footer l'avviso *"Users must obtain proper SNOMED CT Affiliate license"* con rinvio a `https://www.snomed.org/get-snomed` e a `info@snomed.org` **[V]** (<https://www.hl7.it/fhir/core/>).

**HL7 Italia riconosce esplicitamente il problema e lo trasferisce all'implementatore.** Telemedic deve fare esattamente lo stesso, con la stessa chiarezza, e va detto pubblicamente: dichiarare conformità a un IG che dipende da SNOMED CT in un paese non-Membro è una scelta che comporta un costo per l'utilizzatore, e nasconderlo sarebbe scorretto verso di lui.

### 2.5 Formulazione del disclaimer SNOMED CT

Vedi §14 per i testi completi pronti all'uso, in italiano e in inglese. Il principio che li governa: **il progetto dichiara ciò che non fa** (non distribuisce, non include, non ha licenza) e **dice all'utilizzatore ciò che deve fare** (procurarsi la licenza, inserire l'avviso della cl. 8.3.1 nei propri materiali, tenere il registro delle sub-licenze). Mai il contrario.

---

## 3. LOINC - la terminologia su cui il progetto può appoggiarsi

### 3.1 Titolarità e reperimento

Titolare: **Regenstrief Institute, Inc.** e il **LOINC Committee**. URI canonico FHIR: `http://loinc.org` **[V]** (<https://hl7.org/fhir/R4/terminologies-systems.html>).

Il testo di licenza è la *LOINC Copyright Notice and License*, pubblicata su `https://loinc.org/license/`. **Come dichiarato al §0.1, la pagina non è stata leggibile direttamente dallo strumento di fetch (HTTP 403): le clausole che seguono sono [V-sec], verificate su riproduzioni testuali indicizzate e su fonti HL7 che le richiamano.** Il testo è pubblico e va riletto da browser prima del rilascio.

### 3.2 Termini rilevanti

**Concessione (clausola centrale)** **[V-sec]**:

> *"Permission is hereby granted in perpetuity, without payment of license fees or royalties, to use, copy, or distribute the Licensed Materials for any commercial or non-commercial purpose."*

Tre elementi decisivi, tutti favorevoli:
1. **`distribute`** è espressamente concesso - a differenza di SNOMED CT e ATC/DDD;
2. **`for any commercial or non-commercial purpose`** - compatibile con l'integrazione in prodotti proprietari (decisione D1);
3. **`in perpetuity`, `without payment of license fees or royalties`** - nessun costo ricorrente, nessuna scadenza.

Conferma incrociata dalla specifica FHIR **[V]** (<https://hl7.org/fhir/R4/license.html>): LOINC è elencato fra i contenuti di terzi ed è indicato come *"available at no cost"* sotto i termini di `loinc.org`.

**Restrizione su opere derivate** **[V-sec]**:

> *"Except for the right to translate the Licensed Materials into a language other than English pursuant to this section, no other right to create a derivative work of any of the Licensed Materials is hereby granted."*

E, per la traduzione **[V-sec]**: Regenstrief deve essere **notificato via email preventivamente**, e la traduzione risultante è un'opera derivata **i cui diritti sono assegnati a Regenstrief Institute, Inc.**

> **Trappola concreta per un progetto italiano.** Se Telemedic pubblicasse un file con i nomi italiani dei codici LOINC delle sezioni del referto (75496-0, 47045-0, 29545-1…), starebbe producendo una **traduzione**, cioè: (a) un'opera derivata che richiede notifica preventiva a Regenstrief; (b) un'opera i cui diritti si trasferiscono a Regenstrief; (c) materiale che il progetto **non può** licenziare sotto Apache-2.0, perché non ne sarebbe titolare.
>
> **Raccomandazione**: non produrre traduzioni italiane dei display LOINC nel repository. Nella UI e nei documenti generati, l'etichetta italiana visibile all'utente va trattata come **stringa di interfaccia del progetto** (file i18n Angular / Docusaurus), *concettualmente distinta* dal `Coding.display`, che resta il display LOINC ufficiale in inglese. In FHIR: `Coding.display` = display LOINC ufficiale; `CodeableConcept.text` = testo italiano redatto dal progetto o dal medico.
>
> **Costo funzionale**: la separazione fra "etichetta i18n" e "display del codice" richiede disciplina architetturale e un ADR, ma è comunque la pratica corretta in FHIR ed evita il problema per costruzione.
>
> **[NV]** Non è stato verificato se Regenstrief pubblichi già una variante linguistica italiana ufficiale di LOINC. Se esiste, è la soluzione preferibile: si usa quella, senza produrne una propria. Da verificare su `loinc.org` prima di implementare la UI.

**Divieto di vocabolario concorrente** **[V-sec]**: la licenza è costruita per impedire che LOINC sia modificato dagli utenti o usato per creare un altro vocabolario, *"so that it can fulfill its goal of being an international standard"*. Questa restrizione non tocca Telemedic: il progetto non ha alcuna intenzione di produrre un vocabolario di osservazioni.

**Documenti "Group 1/2/3"** **[V-sec]**: la licenza distingue i materiali licenziati (tabella LOINC, RELMA) da alcuni documenti (guida utente e simili) che *"may not be modified, nor may derivative works be created, without prior written permission of the Regenstrief Institute, Inc."* Rilevante solo se si volesse ripubblicare la documentazione LOINC - cosa che non serve.

### 3.3 Testo dell'attribuzione richiesta

HL7 prescrive, per qualunque `ValueSet` che includa codici LOINC (nei `compose.include.concept`, nei `filter` o in un'`expansion`), che l'elemento `copyright` contenga **[V]** (<https://build.fhir.org/ig/HL7/UTG/en/LOINC.html>):

> *"This material contains content from LOINC (http://loinc.org). Refer to terminology.hl7.org for copyright information. LOINC® is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."*

La formulazione estesa d'uso generale, per software e documentazione, è **[V-sec]**:

> *"This material contains content from LOINC (http://loinc.org). LOINC is Copyright © Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."*

**Avvertenza sui codici di terze parti** **[V]**: alcuni codici LOINC portano dichiarazioni di copyright **di terzi** (tipicamente strumenti di misura, scale e questionari clinici licenziati da editori). Quando tali codici entrano in un value set, *"they must carry their own copyright statement as well"*.

> **Conseguenza operativa**: i codici LOINC che Telemedic usa (§3.4) sono codici di **struttura del documento**, non strumenti clinici licenziati. Il rischio di copyright di terzi è quindi basso. **Ma la regola vale**: prima di aggiungere un nuovo codice LOINC a un value set del progetto - in particolare per scale, questionari o punteggi clinici - va verificato sul sito LOINC se quel codice porta un `EXTERNAL_COPYRIGHT_NOTICE`. Va inserita come voce di checklist nel processo di revisione dei value set.

### 3.4 Conferma: LOINC è ridistribuibile nel repository

**Sì, condizionatamente.** Il progetto può includere nel repository:

- i `ValueSet` con **codici LOINC enumerati** (`compose.include.concept` con `code` e `display`);
- le espansioni di quei value set;
- tabelle di lookup limitate ai codici usati.

**Condizioni da rispettare, senza eccezioni:**

1. L'elemento `copyright` di **ogni** `ValueSet` e `CodeSystem` che includa codici LOINC porta l'attribuzione del §3.3.
2. Il file `NOTICE` del progetto porta l'attribuzione estesa (§14.1).
3. **Nessuna modifica** ai codici, ai nomi ufficiali, alle parti del nome LOINC.
4. Nessuna traduzione dei display (§3.2).
5. Ogni artefatto dichiara la **versione LOINC** di riferimento (`ValueSet.compose.include.version`). R1 ha rilevato la 2.81 **[V-sec]**, con data di rilascio **[NV]**: va confermata.
6. Il download del set completo LOINC richiede **registrazione gratuita** su `loinc.org`. È un requisito procedurale, non economico, e riguarda chi scarica - cioè un manutentore del progetto quando aggiorna i value set.

> **Conferma della raccomandazione R1 §10.3 punto 1: LOINC è effettivamente ridistribuibile ed è il fondamento corretto per la struttura del referto di televisita.** I nove codici verificati da R1 (75496-0 *Telehealth Note*, 47045-0 *referto*, 29545-1 *esame obiettivo*, ecc.) possono stare nel repository con l'attribuzione dovuta.

Nota: i codici LOINC citati da R1 provengono dall'IG HL7 Italia Televisita; il fatto che siano *elencati* in quell'IG non toglie che il contenuto LOINC sia licenziato da Regenstrief. Cfr. §9.4 sul principio per cui una dichiarazione CC0 di un IG non dispone dei diritti di terzi.

---

## 4. ICD-9-CM versione italiana

### 4.1 La catena di titolarità, che ha tre anelli

Il regime giuridico della "ICD-9-CM versione italiana 2007" si comprende solo risalendo la catena. È stratificata e ciascuno strato ha un titolare diverso.

| Anello | Opera | Titolare | Regime |
|---|---|---|---|
| 1 | **ICD-9** - International Classification of Diseases, 9ª revisione | **Organizzazione Mondiale della Sanità** | L'OMS detiene i diritti sulla famiglia ICD **[V]** (v. §5) |
| 2 | **ICD-9-CM** - *Clinical Modification* statunitense | **NCHS / CMS**, agenzie federali USA | Opera di agenzia governativa federale statunitense: negli USA non soggetta a copyright ai sensi di **17 U.S.C. §105** **[V-sec]** |
| 3 | **ICD-9-CM versione italiana 2007** - traduzione e adattamento | **Ministero della salute**; pubblicata dall'**Istituto Poligrafico e Zecca dello Stato** | Resa obbligatoria dal **DM 18 dicembre 2008** (GU n. 56 del 9 marzo 2009) per la codifica delle informazioni cliniche della SDO **[V-sec]** |

### 4.2 Il regime della traduzione italiana

Il punto giuridicamente determinante è l'**art. 5 della legge 22 aprile 1941, n. 633** (legge sul diritto d'autore) **[V-sec]**:

> *"Le disposizioni di questa legge non si applicano ai testi degli atti ufficiali dello Stato e delle Amministrazioni pubbliche, sia italiane che straniere."*

L'esclusione è **oggettiva e assoluta**: non è un'eccezione né una libera utilizzazione, è un'esclusione dall'ambito di applicazione della legge. Sugli atti ufficiali dello Stato non esiste diritto d'autore da far valere.

La classificazione ICD-9-CM versione italiana 2007 è:
- adottata con **decreto ministeriale** e resa obbligatoria su tutto il territorio nazionale dal 1° gennaio 2009 per la codifica di diagnosi e procedure nella SDO **[V-sec]**;
- **pubblicata dal Ministero della salute** sul proprio portale in formato PDF, ODS e XLS (presentazione, indice alfabetico delle diagnosi, elenco sistematico delle diagnosi, indice alfabetico delle procedure, elenco sistematico delle procedure) **[V-sec]** (<https://www.salute.gov.it/portale/documentazione/p6_2_2_1.jsp?lingua=italiano&id=2251>; pagina non leggibile dallo strumento di fetch per protezione anti-bot, cfr. §0.1);
- costitutiva di uno **standard obbligatorio** per l'adempimento di un obbligo di legge da parte di soggetti pubblici e privati accreditati.

Si aggiungono due norme che rafforzano la conclusione:

- **Art. 52, comma 2, del CAD** (d.lgs. 82/2005): i dati e i documenti pubblicati dalle amministrazioni **senza l'espressa adozione di una licenza** ai sensi dell'art. 2, comma 1, lett. h) del d.lgs. 36/2006 *"si intendono rilasciati come dati di tipo aperto"* ai sensi dell'art. 68, comma 3, del Codice - il principio **"open data by default"** **[V-sec]**.
- **D.lgs. 24 gennaio 2006, n. 36** (attuazione della direttiva sul riutilizzo dell'informazione del settore pubblico, come modificato dal d.lgs. 102/2015 e dalla direttiva (UE) 2019/1024): disciplina il riutilizzo dei documenti delle pubbliche amministrazioni **[V-sec]**.
- Le **Linee guida AgID** sull'apertura dei dati indicano la **CC BY 4.0** come licenza da applicare ai nuovi open data, e la presumono automaticamente attribuita nei casi di "open data by default" ex art. 52 CAD **[V-sec]** (<https://www.agid.gov.it/sites/agid/files/2024-05/lg-open-data_v.1.0_1.pdf>).

### 4.3 Conclusione e il rischio residuo che resta

> **Conclusione**: la ridistribuzione dei codici ICD-9-CM italiani e delle relative descrizioni italiane, come pubblicati dal Ministero della salute in attuazione del DM 18 dicembre 2008, è **giuridicamente sostenibile** in base all'art. 5 L. 633/1941 e all'art. 52, c. 2, CAD. Il rischio è **basso ma non nullo**.

**Il rischio residuo, dichiarato onestamente**: l'anello 1 della catena è l'OMS, e l'anello 2 è un'agenzia statunitense. Nessuna delle due ha mai - per quanto risulta da questa ricerca - contestato la pubblicazione delle versioni nazionali dell'ICD-9-CM, che sono prassi consolidata in molti paesi. L'art. 5 L. 633/1941 non "estingue" i diritti a monte: rende non protetto *il testo dell'atto ufficiale italiano*. È una posizione difendibile, non una certezza. **[NV]** - non è stato reperito un atto dell'OMS o del NCHS che autorizzi o vieti espressamente la traduzione italiana.

**Opzione conservativa alternativa**: distribuire il dataset ICD-9-CM come **artefatto scaricato a runtime** dal portale ministeriale, anziché committarlo. **Costo funzionale**: l'installazione non ha la codifica delle diagnosi disponibile out-of-the-box; la validazione offline di `Condition.code` non funziona; il primo avvio richiede connettività verso `salute.gov.it`; e si aggiunge un punto di rottura (la URL ministeriale cambia con le riorganizzazioni del portale). **Valutazione**: il costo funzionale è alto e il rischio evitato è basso.

> **Raccomandazione**: **includere** il dataset ICD-9-CM italiano nel repository, ma **in una directory separata** (`third-party/icd9cm-it/`) con un proprio file `LICENSE`/`NOTICE` che (a) attribuisce la fonte al Ministero della salute e al DM 18 dicembre 2008, (b) dichiara che il contenuto **non è opera del progetto** e **non è coperto da Apache-2.0**, (c) richiama l'art. 5 L. 633/1941 e l'art. 52 CAD come base del riuso, (d) indica l'edizione e la data di scaricamento. Vedi §14.5 per il testo.

### 4.4 Il problema dei due URI concorrenti

R1 ha rilevato che esistono almeno due `system` in uso per ICD-9-CM nel contesto italiano **[V]**:

| URI | Origine |
|---|---|
| `http://hl7.org/fhir/sid/icd-9-cm` | Specifica FHIR internazionale (<https://hl7.org/fhir/R4/icd.html>) |
| `http://hl7.it/fhir/televisita/CodeSystem/diagnosi-icd9cm` | IG HL7 Italia Televisita 0.2.0, `content = complete` |

Questa è, oltre che una questione di interoperabilità, **una questione di licenza**: il secondo URI identifica un `CodeSystem` con `content = complete`, cioè un artefatto che **enumera i codici**. Se Telemedic vendesse (vendorizzasse) quel `CodeSystem` dal pacchetto HL7 Italia, ridistribuirebbe contenuto ICD-9-CM sotto la dichiarazione di licenza dell'IG - non sotto la propria analisi dell'art. 5 L. 633/1941. Cfr. §9.4.

> **Raccomandazione**: Telemedic dichiara **`http://hl7.org/fhir/sid/icd-9-cm`** come `system` nelle risorse che scrive, e mantiene il proprio dataset in `third-party/icd9cm-it/` sotto la propria attribuzione. Quando la conformità all'IG Televisita richieda l'URI italiano, la traduzione fra i due `system` è un'operazione di conformità, da documentare in un ADR, non un'occasione per assorbire artefatti altrui. **[NV]** - l'edizione ICD-9-CM rappresentata dal `CodeSystem` dell'IG italiano non è dichiarata: resta la questione aperta **D1** di R1, da chiarire con HL7 Italia.

---

## 5. ICD-10 e ICD-11 - regime OMS

### 5.1 Il documento di licenza

**Testo esaminato integralmente [V]**: *International Statistical Classification of Diseases and Related Health Problems (ICD), International Classification of Functioning Disability and Health (ICF), International Classification of Health Interventions (ICHI) - Digital Version - Terms of Use and License Agreement*, © WHO 2020, 5 pagine (<https://icd.who.int/en/docs/icd11-license.pdf>).

Il documento distingue rigorosamente **due oggetti**, con due licenze diverse - ed è la distinzione che conta:

| Oggetto | Definizione (§1.1 e §2.1) | Licenza |
|---|---|---|
| **Classifications** (il contenuto) | *"the alphanumeric codes, uniform resource identifiers (URIs), descriptions, nomenclature, terminology, lists and indexes, the foundation with all entities and their relationships, any linked coding scheme or linearization, instructions for postcoordination, logical definitions, the content model... and the derived hierarchies (linearizations)... including in its chapters, sections and in the extension codes, in particular INN, **ATC**, devices, histopathology of tumours..."* | **CC BY-ND 3.0 IGO** (§1.2) |
| **Classifications Software** (ICD-API, versioni installabili localmente, Embedded Classification Tool) | §2.1 | **Licenza proprietaria** WHO, §2.3; *"For the avoidance of any doubt the Classifications Software is not licensed under the Creative Commons license"* |

### 5.2 Le clausole che decidono

**§1.2 - Classifications License** **[V]**: *"The Classifications are licensed under the Creative Commons Attribution-NoDerivs 3.0 IGO license (CC BY-ND 3.0 IGO)... Under the terms of the License, you are **NOT** permitted to make 'adaptations' of the Classifications."*

Seguono cinque chiarimenti dell'OMS, tutti citati verbatim **[V]**:

- **1.2.1** - *"To prevent the dilution of the Classifications' purpose to provide a definitive standard for identifying health information, neither the Licensed Materials, nor any portion thereof, may be used for the purpose of developing or promulgating a different standard."*
- **1.2.2** - *"WHO does **not** consider incorporation of the Classifications into a software product to be an 'adaptation', provided that you do not do any of the following:*
  - *a. Reproduce or remodelling the Classifications in part or whole and distribute it under a different name or without attribution;*
  - *b. Reproduce and distribute the Classifications in part or whole **without the Classifications' codes**;*
  - *c. Reproduce the Classifications in part or a whole **without the Classifications URIs**; or*
  - *d. Reproduce and distribute Classifications, in part or whole, with any combination of a-c above."*
- **1.2.3** - *"Incorporation of Classifications into a software product, **in data transmission and storage must include Classifications code, title and URI**."*
- **1.2.4** - *"**Mapping or producing crosswalks** between other classifications and terminologies and Classifications **and producing translations** are **not covered** by the Classifications License and are subject to a **separate written agreement from WHO**."*
- **1.2.5** - *"Adding data fields to Classifications concepts is permitted if such additions are clearly identified as additions that do not originate from WHO."*

**§1.3 - citazione obbligatoria** **[V]**:

> *"ICD-11 Citation: International Classification of Diseases, Eleventh Revision (ICD-11), World Health Organization (WHO) 2019 https://icd.who.int/browse11. Licensed under the Creative Commons Attribution-NoDerivatives 3.0 IGO licence (CC BY-ND 3.0 IGO)."*

**§2.3 - Software License** **[V]**: licenza *"non-exclusive, non-transferable and non-assignable royalty-free"* per usare e incorporare il Classifications Software in applicazioni; le applicazioni risultanti *"may be licensed to users for commercial and non-commercial purposes"*; ma *"You are **not** granted the right to sell or license the Classifications Software as a standalone product."*

**§2.4 - No modifications** **[V]**: *"You shall not modify, adapt, translate, reverse-engineer, decompile, disassemble, or otherwise attempt to discover the source code of the Classifications Software."*

Altre clausole rilevanti **[V]**: §4.1 divieto di usare nome ed emblema OMS; §4.2 divieto di registrare marchi contenenti l'acronimo o il titolo delle Classificazioni; §4.5 **obbligo di manleva a favore dell'OMS** (*"You shall indemnify, hold harmless, and defend at your own expense WHO..."*); §4.7 terminazione automatica in caso di violazione; §4.10 legge svizzera e arbitrato UNCITRAL.

### 5.3 Analisi di compatibilità con Apache-2.0

**Il contenuto ICD-11 non può stare in un repository Apache-2.0.** Tre ragioni cumulative:

1. **CC BY-ND vieta le opere derivate**; Apache-2.0 §2 e §4 le concedono espressamente (*"prepare Derivative Works"*, *"with or without modifications"*). Il progetto prometterebbe un diritto che non può concedere.
2. **§4.5 impone una manleva a favore dell'OMS**. Una clausola di manleva è un obbligo che Apache-2.0 non impone ai destinatari (Apache-2.0 §9 la menziona solo come facoltà di chi ridistribuisce a titolo oneroso, e solo a proprio rischio). Trasferirla implicitamente ai destinatari attraverso un file nel repository è scorretto.
3. **§4.7 prevede la terminazione automatica**; Apache-2.0 §2 è *irrevocable*.

Il **Classifications Software** (ICD-API, versioni locali, Embedded Tool) è ancora più chiaramente escluso: licenza *non-transferable, non-assignable*, divieto di modifica e di reverse engineering (§2.4), divieto di vendita standalone (§2.3).

**Nota di dettaglio non ovvia**: la definizione di *Classifications* al §1.1 include espressamente gli **extension code, in particolare INN e ATC**. Ne segue che il contenuto ATC che compare **dentro** l'ICD-11 è soggetto anche al regime OMS, oltre a quello del WHO Collaborating Centre (§6). Doppia titolarità sullo stesso contenuto: ragione ulteriore per non toccarlo.

### 5.4 ICD-10

**[NV] - il regime dell'ICD-10 non è stato accertato in forma primaria separata.** Il documento *Terms of Use* del §5.1 si riferisce alla *Digital Version* delle Classificazioni distribuite tramite la piattaforma `icd.who.int`, che include ICD-10 nel browser `browse10`. Non è stato reperito un documento di licenza specifico e distinto per l'ICD-10 nelle sue distribuzioni storiche (volumi a stampa, file elettronici distribuiti agli Stati membri, versioni nazionali modificate).

**Come procurarsi la risposta**: scrivere a `licensing@who.int`, indicando l'uso previsto (incorporazione dei codici in un software di telemedicina open source distribuito sotto Apache-2.0, con ridistribuzione del contenuto).

**Raccomandazione conservativa nell'attesa**: trattare ICD-10 con lo stesso regime di ICD-11 - **nessun contenuto nel repository**, solo riferimento per URI+codice.

### 5.5 URI canonici corretti

R1 ha segnalato che `http://hl7.org/fhir/sid/icd-11` **è errato**. La segnalazione è confermata: l'URI canonico dell'ICD-11 MMS è quello del titolare della terminologia.

| Classificazione | URI canonico | Verifica |
|---|---|---|
| ICD-10 (base) | `http://hl7.org/fhir/sid/icd-10` | **[V]** (R1, <https://hl7.org/fhir/R4/icd.html>) |
| ICD-10-CM (USA) | `http://hl7.org/fhir/sid/icd-10-cm` | **[V]** (R1) |
| **ICD-11 MMS** | **`http://id.who.int/icd/release/11/mms`** | **[V-sec]** (R1; <https://terminology.hl7.org/5.1.0/CodeSystem-ICD11MMS.html>) |
| ~~`http://hl7.org/fhir/sid/icd-11`~~ | **NON USARE** | **[V-sec]** |

La forma dell'URI ICD-11 è coerente con quanto la licenza stessa impone: il §1.1 include gli URI fra i componenti delle Classifications e il §1.2.2(c) vieta la riproduzione senza gli URI. **Usare un URI non canonico non è solo un errore tecnico: è una deviazione da una condizione della licenza.**

### 5.6 Conclusione operativa per Telemedic

In Italia la codifica operativa delle diagnosi resta **ICD-9-CM** (R1 §8.3). ICD-10 e ICD-11 rilevano soltanto per l'interoperabilità internazionale.

> **Raccomandazione**: **nessun contenuto ICD-10 o ICD-11 nel repository.** Riferimento per URI+codice soltanto, con `system` canonico corretto. Se serve la risoluzione dei display, delegarla al terminology server configurato dal deployer o all'ICD-API dell'OMS, con avvertenza esplicita che l'uso dell'ICD-API è soggetto ai termini del §2.3–2.6 del documento OMS, che il deployer accetta in proprio.
>
> **Attenzione al vincolo V1 del brief**: l'ICD-API dell'OMS è un servizio ospitato dall'OMS. Prima di renderlo una dipendenza runtime, va verificata la sua collocazione rispetto al requisito "nessun componente obbligatorio ospitato fuori dall'UE". L'OMS distribuisce anche versioni **installabili localmente** dell'ICD-API (§2.1) - è l'opzione che concilia funzione e sovranità, e va preferita. Il container va comunque procurato dal deployer, non ridistribuito dal progetto (§2.3: divieto di vendita/licenza standalone; §4.7 terminazione).
>
> **Se un giorno servisse una mappa ICD-9-CM ↔ ICD-11**: la clausola §1.2.4 la sottopone a **accordo scritto separato con l'OMS**. Non è un'attività che si può improvvisare in uno sprint.

---

## 6. ATC / DDD - WHO Collaborating Centre

### 6.1 Titolarità e sede

R1 aveva marcato **[NV]** i termini ATC. Sono stati accertati.

Titolare: **WHO Collaborating Centre for Drug Statistics Methodology**, Oslo. **Il centro ha cambiato dominio**: `whocc.no` reindirizza con **HTTP 301** a **`atcddd.fhi.no`**, ospitato dal Norwegian Institute of Public Health (FHI) **[V]**. Il centro è *"entirely funded by the Norwegian government"* e i proventi delle vendite degli Index finanziano la manutenzione del sistema ATC/DDD **[V-sec]**.

URI canonico FHIR: `http://www.whocc.no/atc` **[V]** (R1; <https://hl7.org/fhir/R4/terminologies-systems.html>). **Nota**: l'URI canonico resta `whocc.no` anche dopo il cambio di dominio del sito - un canonical URI è un identificatore, non un indirizzo da dereferenziare. Non va "aggiornato".

### 6.2 Condizioni d'uso - testo verificato

Dalla pagina *Copyright & disclaimer* **[V]** (<https://atcddd.fhi.no/copyright_disclaimer/>), tre affermazioni, tutte determinanti:

> 1. *"Use of all or parts of the material requires reference to the WHO Collaborating Centre for Drug Statistics Methodology."*
> 2. *"**Copying and distribution for commercial purposes is not allowed.**"*
> 3. *"**Changing or manipulating the material is not allowed.**"*

### 6.3 Costo e reperimento

**[V-sec]** - Il Centro vende i file elettronici contenenti l'intero indice ATC/DDD (formato Excel o XML) tramite il portale `https://orders.atcddd.fhi.no/`. Il prezzo rilevato per il file completo è di circa **200 EUR**. **Come dichiarato al §0.1, il portale ordini è un'applicazione JavaScript non leggibile dallo strumento di fetch: prezzo e condizioni contrattuali di acquisto non sono stati verificati in forma primaria.** L'indice consultabile online è invece gratuito (<https://atcddd.fhi.no/atc_ddd_index/>).

### 6.4 Analisi di compatibilità con Apache-2.0 - incompatibilità piena

> **La condizione 2 - *"Copying and distribution for commercial purposes is not allowed"* - è direttamente e frontalmente incompatibile con Apache-2.0.**

Apache-2.0 non distingue fra uso commerciale e non commerciale: concede a chiunque, per qualsiasi finalità, il diritto di riprodurre e distribuire. Ogni destinatario del repository riceverebbe una promessa che il titolare dei diritti ATC nega espressamente. E la decisione **D1** del brief rende il punto ineludibile: Telemedic esiste **proprio** per essere integrato in prodotti commerciali proprietari.

> **La condizione 3 - *"Changing or manipulating the material is not allowed"* - è incompatibile con Apache-2.0 §4**, che consente la ridistribuzione *"with or without modifications"*.

> **Conclusione operativa n. 4**: **nessun contenuto ATC nel repository. In nessuna forma. Nessuna eccezione.** Vietati: file ATC/DDD, `CodeSystem` con `content = complete` o `fragment` popolato di codici ATC, `ValueSet` con espansioni ATC, tabelle `codice ATC → descrizione`, mapping ATC ↔ AIC, DDD precalcolate.

### 6.5 Che cosa resta possibile

- **Riferimento per URI+codice**: scrivere `Coding` con `system = "http://www.whocc.no/atc"` e `code = "<codice ATC>"` in `Medication.code` o `MedicationRequest.medicationCodeableConcept`. Un codice scritto in una cartella clinica non è "copying and distribution of the material": è uso di un identificatore per descrivere un fatto clinico. **[NV]** - il testo del WHOCC non affronta esplicitamente questo caso; l'interpretazione è ragionevole ma non è confermata dal titolare. La condizione 1 (obbligo di riferimento al WHOCC) va comunque onorata nella documentazione.
- **Risoluzione dei display a runtime** contro un terminology server o un servizio del deployer che detenga la licenza ATC.

### 6.6 La via italiana, che rende il problema quasi irrilevante

Nel contesto della ricetta dematerializzata e del Sistema TS, la codifica operativa del farmaco in Italia è il **codice AIC** (Autorizzazione all'Immissione in Commercio) rilasciato da AIFA, non l'ATC. R1 lo ha già rilevato **[V]**.

> **Raccomandazione**: per la v1.0, Telemedic usa **AIC** come codifica primaria del farmaco e **non usa affatto ATC**. L'ATC resta un campo opzionale, valorizzabile dal sistema chiamante, mai popolato autonomamente da Telemedic. Il problema di licenza si dissolve, il progetto guadagna in aderenza al mercato italiano, e non si perde nulla di funzionale.
>
> **Attenzione [V]**: il pacchetto HL7 Italia `hl7.fhir.it.terminology` **definisce un code system AIFA/ATC**. Il fatto che quel pacchetto dichiari `license: CC0-1.0` **non trasferisce** i diritti del WHO Collaborating Centre. Cfr. §9.4.

---

## 7. Nomenclatore tariffario e cataloghi nazionali delle prestazioni

### 7.1 Gli atti

R1 ha ricostruito il quadro **[V-sec]**: **DM 23 giugno 2023** ("Decreto Tariffe"), che definisce le tariffe dell'assistenza specialistica ambulatoriale e protesica, modificato dal **DM 26 novembre 2024** (in vigore dal 30 dicembre 2024), che aggiorna 1.113 tariffe su 3.171. Le regioni hanno adottato i propri **cataloghi regionali** in attuazione del nomenclatore nazionale, ai sensi del DPCM 12 gennaio 2017 **[V-sec]**.

### 7.2 Regime di riuso - favorevole e privo di ambiguità

Si applica **la stessa analisi del §4.2**, con margini ancora più ampi:

1. **Art. 5, L. 633/1941** **[V-sec]**: i codici e le descrizioni delle prestazioni sono contenuti negli **allegati a un decreto ministeriale**, pubblicati in Gazzetta Ufficiale. Gli allegati sono parte integrante dell'atto: sono testo di atto ufficiale dello Stato, escluso dall'ambito di applicazione del diritto d'autore.
2. **Art. 52, comma 2, CAD** **[V-sec]**: open data by default in assenza di licenza espressa.
3. **D.lgs. 36/2006** e **Linee guida AgID** **[V-sec]**: riutilizzo, anche commerciale, come regola; CC BY 4.0 come licenza presunta.
4. Argomento sostanziale: un nomenclatore tariffario **deve** essere riutilizzabile, perché è lo strumento con cui soggetti pubblici e privati accreditati adempiono a obblighi di rendicontazione verso il SSN. Una lettura restrittiva renderebbe impossibile l'adempimento.

> **Conclusione**: i codici del nomenclatore nazionale e dei cataloghi regionali sono **liberamente ridistribuibili** nel repository. Rischio residuo: **molto basso**.

**Cautela minima**: citare la fonte (decreto, data, Gazzetta Ufficiale, eventuale delibera regionale) e la data di estrazione, e non presentare i dati come opera del progetto. Da collocare in `third-party/nomenclatore-it/` con `NOTICE` proprio (§14.5) - non tanto per obbligo, quanto perché la separazione fra "dati normativi dello Stato" e "codice del progetto" è chiarezza che serve al deployer.

### 7.3 Il vincolo di modellazione che nessuna licenza risolve

R1 ha stabilito un punto che va ribadito qui perché condiziona quali dati servono davvero **[V-sec]**:

- le prestazioni erogabili a distanza già presenti nel nomenclatore sono di **"tipologia A"** e, se erogate a distanza, **mantengono la stessa codifica e la stessa tariffa** della corrispondente prestazione in presenza;
- la **televisita** va rendicontata con il **codice della corrispondente visita di controllo**;
- il **teleconsulto** non prevede remunerazione a prestazione né tariffa nel nomenclatore specialistico.

> **Conseguenza**: **non esiste un codice di prestazione "televisita"** da cercare e da licenziare. Ciò che serve a Telemedic è il catalogo delle prestazioni ordinarie, che è liberamente riusabile. La modalità di erogazione resta un asse separato (`Encounter.class = VR`).

### 7.4 Attenzione ai cataloghi regionali

I cataloghi regionali sono adottati con delibere di giunta e pubblicati sui BUR: stesso regime (atti ufficiali di amministrazioni pubbliche, art. 5 L. 633/1941). **Ma** sono ventuno, con cicli di aggiornamento indipendenti.

> **Raccomandazione architetturale**: Telemedic **non deve incorporare i cataloghi regionali**. Deve accettare il codice di prestazione **per riferimento**, fornito dal sistema chiamante (`ServiceRequest.code` / `Encounter.type` con `system` dichiarato dal tenant). È coerente con il vincolo **6.2.3** del brief (nessuna duplicazione di anagrafica: Telemedic lavora per riferimento e non diventa il master data) e con il vincolo **V4** (tenant-awareness). Il catalogo nazionale può essere incluso come **dato di riferimento opzionale** per validazione e sviluppo, non come master.

---

## 8. CVX, UCUM, HL7 Terminology e code system FHIR

### 8.1 Quadro sinottico

| Code system | URI canonico | Titolare | Licenza | Ridistribuibile nel repository |
|---|---|---|---|---|
| **HL7 Terminology (THO)** - v2 tables, v3 ActCode, ecc. | `http://terminology.hl7.org/CodeSystem/*` | HL7 International | **CC0** **[V]** | **Sì, senza condizioni** |
| **Code system FHIR core** | `http://hl7.org/fhir/*` | HL7 International | **CC0** **[V]** | **Sì, senza condizioni** |
| **UCUM** | `http://unitsofmeasure.org` | Regenstrief Institute + UCUM Organization | Licenza UCUM v1.0 (notice v1.1, giugno 2024) **[V]** | **Sì, condizionata** (§8.3) |
| **LOINC** | `http://loinc.org` | Regenstrief Institute | Licenza LOINC **[V-sec]** | **Sì, condizionata** (§3) |
| **CVX** | `http://hl7.org/fhir/sid/cvx` | CDC / NCIRD (USA) | **[NV]** (§8.4) | Da evitare in v1.0 |
| **DICOM controlled terminology** | `http://dicom.nema.org/resources/ontology/DCM` | NEMA | *"Implementer use of DICOM is not covered by this agreement"* **[V]** | Solo i codici usati, come riferimento |
| **ISO 3166** | `urn:iso:std:iso:3166` | ISO | Standard ISO a pagamento; i **codici alpha-2** sono pubblicati liberamente dall'ISO **[NV]** | Solo i codici alpha-2 necessari |
| **BCP-47** | `urn:ietf:bcp:47` | IETF | RFC IETF, liberamente riproducibili **[V-sec]** | Sì |
| **SNOMED CT** | `http://snomed.info/sct` | SNOMED International | Affiliate License **[V]** | **No** (§2) |
| **ATC** | `http://www.whocc.no/atc` | WHO CC Oslo | §6.2 **[V]** | **No** (§6) |
| **ICD-10 / ICD-11** | v. §5.5 | OMS | CC BY-ND 3.0 IGO **[V]** | **No** (§5) |

### 8.2 HL7 Terminology (THO) e code system FHIR - CC0, nessun problema

Dichiarazione verbatim della pagina di licenza THO **[V]** (<https://terminology.hl7.org/6.5.0/license.html>):

> *"This content is made widely and freely available for unrestricted use, and at no cost, in accordance with the Creative Commons Zero (CC0) designation."*

CC0 è una dedicazione al pubblico dominio: nessuna condizione, nessuna attribuzione obbligatoria, ridistribuzione e opere derivate libere. **Piena compatibilità con Apache-2.0.**

La stessa pagina elenca però le terminologie di terzi presenti **dentro** THO, con le rispettive avvertenze **[V]**:

- **SNOMED CT** (IHTSDO): *"Implementer use of SNOMED CT is not covered by this agreement"*;
- **DICOM** (NEMA): *"Implementer use of DICOM is not covered by this agreement"*;
- **LOINC** (Regenstrief): disponibile senza costi ai termini di `loinc.org/license`;
- **ICD codes** (OMS): rivolgersi all'OMS;
- **CPT** (American Medical Association): tutti i diritti riservati.

E la specifica FHIR conferma **[V]** (<https://hl7.org/fhir/R4/license.html>) che l'accettazione dei termini della specifica **non conferisce diritti sulla IP di terzi**, e che è il licenziatario a doversi procurare le licenze necessarie.

> **Regola pratica che ne discende**: quando si copia nel repository un `ValueSet` o un `CodeSystem` proveniente da THO, si controlla **da quale code system provengono i concetti**. THO è CC0 **come contenitore**; i concetti SNOMED, DICOM o CPT che vi transitano non lo sono. Questa verifica va nella checklist di revisione dei value set (§12.2).

Sono quindi **integralmente ridistribuibili** i code system rilevanti per Telemedic verificati da R1: `v3-ActCode` (con il codice `VR` per la televisita), `encounter-status`, `endpoint-connection-type`, `consentscope`, `audit-event-type`, `iso-21089-lifecycle`, `virtual-service-type` (R5).

### 8.3 UCUM - attenzione a due dettagli

**Testo esaminato [V]** (<https://ucum.org/license>): *Unified Code for Units of Measure (UCUM) Version 1.0 License*, con *Copyright Notice and License Version 1.1, June 2024*. Copyright © 1999–2026 Regenstrief Institute, Inc.

**Concessione** **[V]**: licenza *"worldwide, non-exclusive, no-charge, royalty-free, **revocable**"* per *"reproduce, publicly display, publicly perform, and distribute the Work"*, allo scopo di sviluppare applicazioni software che interagiscono con UCUM.

**Condizioni** **[V]**:
- distribuendo copie complete, occorre fornire: avviso di copyright, riferimento alla licenza, disclaimer di garanzia, e il testo integrale della licenza **oppure** il suo URL;
- **opere derivate espressamente vietate**: non si può *"add, delete, or modify the Work's content including field names, field contents, descriptions, and comments"*;
- divieto di sviluppare standard concorrenti di unità di misura o di diluire la funzione di UCUM come standard definitivo;
- clausola di **terminazione per contenzioso brevettuale**;
- fornito *"AS IS"*.

**Due dettagli che meritano attenzione, e che nessuno legge:**

1. **La licenza è `revocable`.** Apache-2.0 §2 è `irrevocable`. È una differenza sostanziale di natura del titolo, non una sfumatura redazionale. Il progetto non può promettere a valle una stabilità che il proprio titolo a monte non ha.
2. **Il divieto di opere derivate** confligge con Apache-2.0 §4 (*"with or without modifications"*).

> **Raccomandazione**: se serve `ucum-essence.xml` (per la validazione offline delle unità in `Observation.valueQuantity` - RTT, jitter, packet loss, cfr. R1 §2.5), collocarlo in **`third-party/ucum/`**, **immodificato**, accompagnato dal file di licenza UCUM integrale e da un `NOTICE` che dichiari che Apache-2.0 non vi si applica. Non riformattarlo, non minificarlo, non convertirlo in JSON: sarebbe una modifica.
>
> **Alternativa preferibile**: dipendere da una libreria UCUM esistente tramite il gestore di dipendenze (Maven/npm), senza committare il file. La libreria porta la propria licenza, la dipendenza è esplicita nell'SBOM CycloneDX previsto da **D10** del brief, e il repository resta pulito. **Costo funzionale: nullo.** È la strada da preferire.

### 8.4 CVX

CVX (*Vaccine Administered Code Set*) è sviluppato e mantenuto dal **CDC / NCIRD** (USA). URI: `http://hl7.org/fhir/sid/cvx` **[V]**.

**[NV] - Non è stato reperito un enunciato di licenza esplicito del CDC su CVX.** Le pagine THO che descrivono il code system non riportano condizioni e rinviano alla pagina CDC. In linea di principio, le opere di agenzie federali statunitensi non sono soggette a copyright negli Stati Uniti ai sensi di **17 U.S.C. §105**, il che renderebbe CVX liberamente riusabile - **ma questa è un'inferenza, non una verifica**, e la regola del §105 riguarda il territorio statunitense.

> **Raccomandazione**: **CVX non serve a Telemedic in v1.0.** Il perimetro del progetto è il consulto video, non la registrazione vaccinale. Escludere CVX dal repository elimina un'incertezza a costo funzionale zero. Se in futuro servisse `Immunization`, si verifichi la questione presso `iisinfo@cdc.gov` prima di includere contenuto.

### 8.5 DICOM e ISO 3166

- **DICOM**: la specifica FHIR avverte che *"Implementer use of DICOM is not covered by this agreement"* **[V]**. Lo standard DICOM è pubblicato gratuitamente da NEMA su `dicom.nema.org`, ma la sua ridistribuzione non è stata verificata **[NV]**. Telemedic usa un numero ristretto di codici DCM per `AuditEvent.type` (R1 §2.8): è uso per riferimento, non ridistribuzione di contenuto. **Nessun file DICOM nel repository.**
- **ISO 3166**: lo standard ISO è a pagamento. I **codici alpha-2 dei paesi** sono però pubblicati liberamente dall'ISO sulla propria *Online Browsing Platform* **[NV]** per quanto riguarda i termini esatti di riuso. Telemedic usa un numero limitato di codici (`IT` e poco altro) per `Address.country`: uso per riferimento. **Non includere l'elenco completo.**

---

## 9. Le Implementation Guide di HL7 Italia e i pacchetti FHIR italiani

È la domanda più pratica del mandato, perché il progetto **intende conformarsi** a quelle IG (R1 §2.10.2) e perché la risposta determina se i profili possono essere costruiti dentro il repository o vanno risolti a build time.

### 9.1 Che cosa dichiarano davvero i pacchetti

Verifica condotta sulle risorse `ImplementationGuide` pubblicate e sui footer generati dall'IG Publisher.

| Pacchetto | `publisher` | `copyright` | `license` | Note |
|---|---|---|---|---|
| `hl7.fhir.it.terminology` **0.1.2** | **HL7 Italia** **[V]** | **2022+** **[V]** | **`CC0-1.0`** **[V]** | Status `active`. Dichiarazione coerente e completa. |
| **Televisita** `televisita#0.2.0` | **`Example Publisher`** **[V]** | non valorizzato **[V]** | **`CC0-1.0`** **[V]** | Footer generato: *"IG © 2025+ Example Publisher. Package televisita#0.2.0 based on FHIR 4.0.1"*, con `contact.url = http://example.org/example-publisher` **[V]** |
| **It-Core** `hl7.fhir.it.core#0.2.0` | HL7 Italia **[V]** | Footer: *"IG © 2026+ HL7 Italia"*, generato il 30 luglio 2026, *trial-use* **[V]** | **[NV]** - il campo `license` della risorsa non è stato letto (endpoint interrogati: HTTP 404) | Il footer riporta l'avviso SNOMED CT: *"Users must obtain proper SNOMED CT Affiliate license"* **[V]** |

**Il sito istituzionale `hl7.it` riporta invece in footer: *"Copyright © 2024 by HL7 Italia. All Rights Reserved."*** **[V]**

### 9.2 La contraddizione, e come va letta

Ci sono **tre segnali che non concordano**:

1. la risorsa `ImplementationGuide` di *Televisita* dichiara `license: CC0-1.0`, che sarebbe pienamente compatibile con Apache-2.0;
2. la stessa risorsa ha `publisher = "Example Publisher"` e `contact.url = "http://example.org/example-publisher"` - cioè **i valori segnaposto del template dell'IG Publisher, mai sostituiti**;
3. il sito dell'ente riserva tutti i diritti.

Il segnale 2 svaluta il segnale 1. Un campo `license` che convive con un `publisher` segnaposto è, con ogni probabilità, **il valore di default del template**, non una determinazione consapevole dell'ente. Non c'è un atto giuridico identificabile: non si sa **chi** abbia dichiarato CC0, perché il publisher dichiarato non esiste.

Il caso di `hl7.fhir.it.terminology` è diverso e migliore: publisher HL7 Italia, copyright 2022+, licenza CC0-1.0, status `active`. Lì la dichiarazione è attribuibile.

> **Conclusione onesta**: la licenza dei pacchetti HL7 Italia è **parzialmente accertata**. Per `hl7.fhir.it.terminology` è CC0-1.0 con attribuzione chiara. Per *Televisita* la dichiarazione CC0-1.0 esiste ma **non è attribuibile a un soggetto identificato**. Per *It-Core* non è stata letta.

### 9.3 Un progetto Apache-2.0 può includerne profili, value set e pacchetti `.tgz`?

**Risposta articolata, per artefatto:**

| Artefatto | Può stare nel repository? | Motivazione |
|---|---|---|
| **Canonical URL** dei profili italiani citati in `meta.profile`, in `binding.valueSet`, nella documentazione | **Sì, senza riserve** | Un URL non è un'opera. Dichiarare conformità non è ridistribuzione. |
| **Profili scritti da Telemedic** che derivano dai profili italiani (`StructureDefinition.baseDefinition` → canonical HL7 Italia) | **Sì** | Il differenziale è opera del progetto; il riferimento al base è un URL. |
| `.tgz` di **`hl7.fhir.it.terminology`** vendorizzato | **Condizionata** | CC0-1.0 attribuibile a HL7 Italia. **Ma** il pacchetto contiene code system **AIFA/ATC** e value set **SNOMED CT** (§9.4). Vendorizzare l'intero pacchetto significherebbe ridistribuire quel contenuto. |
| `.tgz` di **Televisita** / **It-Core** vendorizzati | **No, allo stato attuale** | Licenza non attribuibile a un publisher identificato (§9.2), e dipendenza da SNOMED CT dichiarata nel footer. |
| **Copie dei file `StructureDefinition`/`ValueSet` italiani** estratti dai pacchetti e committati | **No** | È ridistribuzione degli artefatti altrui senza titolo accertato. |

> **Raccomandazione operativa**: **non vendorizzare i pacchetti HL7 Italia nel repository.** Dichiararli come **dipendenze** in `sushi-config.yaml` / `ig.ini` / `package.json` FHIR e lasciare che siano risolti dal registry dei pacchetti a build time, sulla macchina di chi compila.
>
> **Costo funzionale, dichiarato**: (a) la build richiede accesso di rete al registry dei pacchetti FHIR - il che stride con l'ideale di build ermetica; (b) è necessario un **mirror interno del registry** o una cache di CI per la riproducibilità; (c) chi compila il progetto accetta implicitamente i termini della fonte da cui scarica.
>
> **Mitigazione**: **pinnare le versioni esatte**. Il pacchetto *Televisita* dichiara la dipendenza `hl7.fhir.it.terminology: current` **[V]** - una versione flottante, che rende la build non riproducibile e che, in un progetto soggetto a IEC 62304 (decisione **D6**), è un difetto di gestione della configurazione, non solo un fastidio. Telemedic deve pinnare `0.1.2` (o la versione corrente al momento del rilascio) e documentarlo.

**Azione raccomandata verso HL7 Italia**: chiedere per iscritto (a) conferma della licenza applicabile ai pacchetti *Televisita*, *Teleconsulto*, *Teleassistenza*, *Telemonitoraggio* e *It-Core*; (b) correzione dei campi `publisher`/`contact` segnaposto; (c) chiarimento sul regime dei contenuti di terzi ricompresi (SNOMED CT, ATC, ICD-9-CM). La risposta scritta va conservata nel fascicolo tecnico MDR. **È una richiesta legittima, utile a tutta la comunità italiana, e va formulata come contributo, non come contestazione.**

### 9.4 Il principio che vale oltre questo caso: CC0 non lava i diritti di terzi

Merita di essere enunciato come regola generale, perché è l'errore più costoso che si possa fare in questa materia.

> **Una dichiarazione di licenza apposta da un ente su un proprio Implementation Guide vincola i diritti *di quell'ente sul proprio contributo editoriale*. Non dispone - perché non può - dei diritti di terzi sul contenuto terminologico ricompreso.**

Applicazioni concrete e verificate:

- `hl7.fhir.it.terminology` dichiara **CC0-1.0** e contiene un code system **AIFA/ATC** **[V]**. La dichiarazione CC0 **non** rende ridistribuibile il contenuto ATC, i cui diritti sono del WHO Collaborating Centre (§6.2), che vieta espressamente la distribuzione commerciale.
- Lo stesso pacchetto contiene value set costruiti su **SNOMED CT** (tipi di campione, contenitori, additivi) **[V]**. La dichiarazione CC0 **non** sostituisce l'Affiliate License.
- L'IG *Televisita* definisce un `CodeSystem` ICD-9-CM con `content = complete` **[V]** (R1 §8.3): il contenuto è la classificazione ministeriale, il cui regime è quello del §4, non quello dichiarato dall'IG.
- Simmetricamente, **THO è CC0** ma i concetti SNOMED/DICOM/CPT che vi transitano non lo sono (§8.2) - HL7 lo dichiara espressamente.

> **Regola per Telemedic**: prima di vendorizzare **qualunque** artefatto terminologico proveniente da terzi - anche se dichiarato CC0, anche se proveniente da un ente pubblico o da un SDO - si ispeziona **artefatto per artefatto** da quale `system` provengono i concetti enumerati. La dichiarazione di licenza del contenitore non è la risposta. La risposta è la titolarità del contenuto.
>
> Questa verifica va **automatizzata**: vedi il *terminology guard* al §12.3.

---

## 10. Le specifiche HL7 internazionali e IHE

### 10.1 FHIR - CC0

> *"This document is licensed under Creative Commons 'No Rights Reserved' (CC0)."* **[V]** (<https://hl7.org/fhir/R4/license.html>)

Conseguenze **[V]**:
- ridistribuzione consentita;
- specifiche derivate e prodotti di implementazione consentiti;
- **non** si può affermare che HL7 avalli un'opera derivata;
- le versioni alterate devono identificarsi chiaramente come derivate e non come FHIR;
- le specifiche derivate **non possono ridefinire la conformità a FHIR**.

**Marchi** **[V]**: `FHIR®`, `HL7®` e i marchi collegati sono registrati. Occorre riferirsi allo *"HL7® FHIR® standard"* e **non si possono usare i marchi in nomi di dominio o nel branding di prodotto** senza consenso scritto espresso di HL7 International.

> **Conseguenza diretta per Telemedic**: non usare "FHIR" nel nome di moduli pubblici, artefatti pubblicati, immagini container o sottodomini (`fhir.telemedic.<dominio>` è a rischio). Usare formule descrittive: *"conforme allo standard HL7® FHIR® R4 (4.0.1)"*. Da recepire nelle linee guida di naming e nella comunicazione pubblica.

Sono quindi **ridistribuibili senza condizioni** i `StructureDefinition`, `ValueSet`, `CodeSystem`, `SearchParameter` e `OperationDefinition` della specifica core FHIR, nonché il pacchetto `hl7.fhir.r4.core`.

### 10.2 HL7 v2 - libero all'uso, non alla ridistribuzione

Il regime è **diverso da FHIR** e la differenza è quella che conta.

HL7 licenzia i propri standard e IP selezionata **a costo zero**, ma tramite **registrazione con accettazione click-through** dei termini **[V-sec]** (<https://www.hl7.org/about/faqs/FreeIP.cfm>, <https://www.hl7.org/implement/standards/nocost.cfm>). Sono gratuiti gli standard già approvati ANSI, le Implementation Guide pubblicate, i profili, i Domain Analysis Model e gli STU correnti **[V-sec]**.

Il vincolo determinante **[V-sec]**:

> *"You may not, without a license from Health Level Seven, International, copy or distribute HL7's publication Product."*

I membri HL7 registrati hanno il diritto di scaricare, copiare **per finalità interne**, condividere il materiale con dipendenti e consulenti per finalità di studio, e **usarlo per sviluppare, realizzare e vendere prodotti conformi** **[V-sec]**.

> **Conclusione**: **implementare** HL7 v2 è libero; **ridistribuire i documenti dello standard v2** (PDF, capitoli, tabelle estratte dai documenti) **non lo è**.

**La via d'uscita pulita**, che risolve il problema senza costi funzionali: le **tabelle v2** (0001 Sex, 0003 Event Type, 0004 Patient Class, 0357 Message Error Condition, ecc.) sono **ripubblicate in HL7 Terminology sotto CC0** con URI `http://terminology.hl7.org/CodeSystem/v2-<nnnn>` **[V]**.

> **Raccomandazione**: Telemedic prende i valori delle tabelle v2 **da THO** (CC0), non dai documenti dello standard v2. Nel repository: nessun PDF HL7, nessun capitolo, nessuna tabella copiata dallo standard; solo riferimenti bibliografici con URL. Il codice di parsing e generazione dei messaggi v2 è opera del progetto.
>
> **Nota su MLLP**: R1 ha rilevato che il PDF della specifica MLLP non è stato letto direttamente (questione **D2**). Vale la stessa regola: **si può leggere e implementare, non si può committare nel repository.** I valori esadecimali dei caratteri di framing sono fatti tecnici, non contenuto protetto; il documento che li contiene sì.

### 10.3 IHE - la licenza c'è, ma è `non-sublicensable`

**Testo esaminato [V]**: IHE Technical Frameworks *General Introduction*, capitolo 9 *Copyright Licenses* (<https://profiles.ihe.net/GeneralIntro/ch-9.html>), richiamato da ciascun Technical Framework (ITI TF Vol. 1 §1.7 rinvia a questo capitolo **[V]**).

IHE International concede una licenza **[V]**:

> *"irrevocable, worldwide, perpetual, royalty-free, **nontransferable**, nonexclusive, **non-sublicensable** license"* per riprodurre e distribuire i documenti del Technical Framework e i profili,

con l'avvertenza espressa che la concessione **si applica soltanto ai materiali di cui IHE International è titolare o che controlla**. Per gli standard di base, il capitolo riporta le dichiarazioni dei rispettivi titolari **[V]**: DICOM® marchio NEMA; HL7®, Health Level Seven®, CCD®, CDA®, FHIR® marchi registrati, con IHE autorizzata a riprodurre le tabelle HL7 che restano *"copyrighted by Health Level Seven, Inc."*; LOINC® marchio registrato Regenstrief; SNOMED CT *"used by permission of the International Health Terminology Standards Development Organisation"*.

**Analisi di compatibilità.** La licenza IHE è generosa ma ha due qualificazioni che la rendono inadatta a un repository Apache-2.0:

| Attributo IHE | Attributo Apache-2.0 §2 | Esito |
|---|---|---|
| `non-sublicensable` | concede espressamente `sublicense` | **Conflitto** |
| `nontransferable` | licenza a chiunque riceva l'Opera | **Conflitto** |
| `irrevocable`, `perpetual`, `royalty-free` | idem | Compatibile |

> **Conclusione**: **i documenti IHE non vanno inclusi nel repository.** Implementare gli attori e le transazioni IHE è pienamente libero (è lo scopo della licenza IHE); ridistribuire i documenti sotto Apache-2.0 no, perché Apache-2.0 concederebbe la sublicenza che IHE nega.
>
> **Costo funzionale: nullo.** I Technical Framework sono pubblicati gratuitamente e in HTML stabile su `profiles.ihe.net`. Il repository li **cita per URL e per revisione** (es. "IHE ITI TF-2, transazione ITI-41, rev. 20.2 del 2025-11-11", cfr. R1 §6). La documentazione Docusaurus del progetto **descrive** i profili con parole proprie e vi si collega, senza riprodurne il testo.

**Attenzione [V]**: i profili IHE presuppongono contenuti di terzi (tabelle HL7, codici DICOM, SNOMED CT). Gli avvisi del capitolo 9 non sono decorativi: chi implementa un attore ATNA che scrive `AuditEvent` con codici DCM sta usando terminologia DICOM, e chi implementa un Document Consumer XDS con metadati codificati SNOMED sta usando SNOMED CT. Vale l'intera analisi del §2.

### 10.4 Sintesi degli standard di specifica

| Specifica | Licenza | Implementabile | Ridistribuibile nel repository |
|---|---|---|---|
| FHIR (core, R4/R4B/R5) | **CC0** **[V]** | Sì | **Sì** - con cautela sui marchi |
| HL7 Terminology (THO) | **CC0** **[V]** | Sì | **Sì** - verificando l'origine dei concetti |
| HL7 v2.x (documenti dello standard) | Gratuita con registrazione, **senza diritto di ridistribuzione** **[V-sec]** | Sì | **No** - usare THO per le tabelle |
| IHE Technical Frameworks | Royalty-free ma `non-sublicensable` **[V]** | Sì | **No** - citare per URL |
| DICOM (standard NEMA) | Pubblicazione gratuita; ridistribuzione **[NV]** | Sì | **No** - citare per URL |
| IG HL7 Italia | Parzialmente accertata (§9.1) | Sì | **No allo stato attuale** - dipendenza a build time |

---

## 11. Compatibilità con Apache-2.0: i quattro regimi e la matrice decisionale

### 11.1 I quattro regimi possibili

Ogni terminologia ricade in **uno e uno solo** di questi quattro regimi. Nessuna via di mezzo, nessuna eccezione discrezionale: è ciò che rende la policy applicabile in code review.

| Regime | Sigla | Che cosa significa | Dove va il contenuto |
|---|---|---|---|
| **Coesistenza piena** | **A** | Il contenuto può stare fra i sorgenti, coperto dalla dichiarazione Apache-2.0 del progetto, senza obblighi ulteriori | `src/main/resources/fhir/**` |
| **Directory separata con licenza propria** | **B** | Il contenuto è ridistribuibile ma a condizioni diverse da Apache-2.0. Deve stare in una directory dedicata, con `LICENSE` e `NOTICE` propri e dichiarazione esplicita che Apache-2.0 **non** vi si applica | `third-party/<terminologia>/` |
| **Acquisizione a runtime dal deployer** | **C** | Il contenuto non può essere ridistribuito dal progetto. Il software è progettato per acquisirlo (o interrogarlo) al deployment, sotto la licenza che il deployer si è procurato | Nessuna: volume/configurazione dell'installazione |
| **Esclusione totale** | **D** | Nessun contenuto, in nessuna forma; solo riferimento per URI+codice | Nessuna |

### 11.2 La matrice

| Terminologia | Regime | Uso per riferimento URI+codice | Motivazione sintetica |
|---|---|---|---|
| **LOINC** | **A** con attribuzione obbligatoria | Sì | `distribute` espressamente concesso, per qualunque scopo commerciale (§3.2) |
| **HL7 Terminology (THO)** | **A** | Sì | CC0 (§8.2) |
| **Code system FHIR core** | **A** | Sì | CC0 (§10.1) |
| **Nomenclatore / catalogo nazionale prestazioni** | **B** (`third-party/nomenclatore-it/`) | Sì | Atto ufficiale dello Stato, art. 5 L. 633/1941 + art. 52 CAD (§7.2). Separazione per chiarezza, non per obbligo |
| **ICD-9-CM versione italiana** | **B** (`third-party/icd9cm-it/`) | Sì | Idem (§4.2). Rischio residuo basso ma non nullo sulla catena a monte (§4.3) |
| **UCUM** | **B** (`third-party/ucum/`) - o meglio dipendenza esterna | Sì | Ridistribuibile verbatim, ma vieta i derivati ed è **revocabile** (§8.3) |
| **SNOMED CT** | **C** - terminology server esterno del deployer | Sì, **ma solo per chi ha la licenza** (cl. 2.2.5) | Cl. 2.7 rende impossibile la pubblicazione in un repo pubblico; sub-licenza incompatibile con Apache-2.0 §2 (§2.2.6) |
| **ICD-10 / ICD-11** | **D** (con `C` opzionale via ICD-API locale) | Sì, con `system` canonico corretto | CC BY-**ND**: vieta i derivati; §4.5 impone manleva; §4.7 terminazione (§5.3) |
| **ATC / DDD** | **D** | Sì (interpretazione ragionevole, **[NV]**) | *"Copying and distribution for commercial purposes is not allowed"* - incompatibile con D1 (§6.4) |
| **CVX** | **D** in v1.0 | n/a | Licenza non accertata; non serve al perimetro v1.0 (§8.4) |
| **DICOM controlled terminology** | **D** per il contenuto; codici usati per riferimento | Sì | Ridistribuzione non verificata (§8.5) |
| **Pacchetti IG HL7 Italia** | **C** - dipendenza risolta a build time | Sì (canonical URL) | Licenza non pienamente attribuibile + contenuti di terzi ricompresi (§9.3) |
| **Documenti IHE** | **D** - citazione per URL | n/a | `non-sublicensable` (§10.3) |
| **Documenti standard HL7 v2** | **D** - usare THO | n/a | Nessun diritto di ridistribuzione (§10.2) |

### 11.3 Il costo funzionale della prudenza, dichiarato senza attenuanti

La prudenza qui raccomandata **ha un prezzo**, e chi decide deve conoscerlo:

| Rinuncia | Costo funzionale concreto |
|---|---|
| Nessun contenuto SNOMED CT nel repository | Le espansioni dei value set con binding SNOMED (in particolare `Encounter.reasonCode`, ~4.000 codici - R1 §2.1) **non funzionano senza un terminology server configurato**. In un'installazione appena avviata, la validazione di quei binding fallisce o va disattivata. È il costo più alto dell'intera policy. |
| Nessun display SNOMED negli esempi | Gli esempi FHIR sono meno leggibili e non eseguibili contro un validatore stringente senza configurazione preliminare. |
| Nessuna traduzione italiana dei display LOINC | Serve una separazione architetturale fra stringhe i18n del progetto e `Coding.display` ufficiale, con un ADR dedicato. |
| Nessun contenuto ATC | La ricerca del farmaco per classe terapeutica non è disponibile out-of-the-box. Mitigato dall'uso di AIC come codifica primaria italiana (§6.6). |
| Nessun pacchetto HL7 Italia vendorizzato | La build richiede rete verso il registry dei pacchetti FHIR; serve un mirror interno per la riproducibilità richiesta da IEC 62304. |
| Nessun documento IHE/HL7 v2 nel repository | La documentazione deve **descrivere** i profili invece di citarli estesamente: più lavoro redazionale, e link esterni che possono rompersi. |

**Il beneficio, altrettanto concreto**: un integratore che faccia due diligence sul repository trova una catena di licenze coerente, verificabile e priva di contenuti la cui provenienza contraddica la licenza dichiarata. Per un progetto la cui ragione d'essere è l'integrazione in prodotti proprietari (**D1**), questo non è un costo di conformità: è il prodotto stesso.

---

## 12. Traduzione della policy in architettura e in processo

Una policy che vive solo in un documento viene violata al terzo sprint. Va incisa nella struttura del repository, nella CI e nel processo di contribuzione.

### 12.1 Struttura del repository

```
LICENSE                          Apache-2.0, testo integrale
NOTICE                           §4(d) Apache-2.0 - breve, con rinvio (§14.1)
THIRD-PARTY-TERMINOLOGY.md       Trattazione estesa (§14.2)
CONTRIBUTING.md                  Divieto di contributi contenenti terminologia di terzi

src/main/resources/fhir/
  codesystem/                    Code system DI PROGETTO
  valueset/                      Value set del progetto; LOINC enumerato con `copyright`;
                                 SNOMED solo per filtro/ECL, MAI espanso
  structuredefinition/           Profili del progetto
  examples/                      Esempi: LOINC / ICD-9-CM / codici nazionali.
                                 SNOMED solo come placeholder tipografico

third-party/                     REGIME B - Apache-2.0 NON si applica qui
  README.md                      Spiega la natura della directory
  icd9cm-it/   { LICENSE-NOTICE.md, data/ }
  nomenclatore-it/ { LICENSE-NOTICE.md, data/ }
  ucum/        { LICENSE, ucum-essence.xml }   (solo se non si usa la dipendenza esterna)

docs/08_compliance/terminologie/  Documentazione per il deployer (§14.3, §15)
```

**Regola di build**: `third-party/` è escluso dagli header di licenza automatici, dai formatter e dai linter, ed è marcato come tale nella generazione dell'**SBOM CycloneDX** previsto da **D10** del brief.

### 12.2 Checklist di revisione per ogni nuovo `ValueSet` o `CodeSystem`

Da inserire nel template di pull request. Ogni voce è verificabile in trenta secondi.

- [ ] Da quale `system` provengono i concetti enumerati? (elencarli tutti)
- [ ] Ciascuno di quei `system` è in regime **A** o **B** secondo §11.2?
- [ ] Se sono presenti codici LOINC: l'elemento `copyright` porta l'attribuzione del §3.3?
- [ ] Se sono presenti codici LOINC: è stato verificato che nessuno porti un `EXTERNAL_COPYRIGHT_NOTICE`? (§3.3)
- [ ] È presente un `expansion` o un `compose.include.concept` con codici **SNOMED CT**, **ATC**, **ICD-10/11**? → **la PR va respinta**
- [ ] Se il value set si compone per filtro SNOMED: il numero di ConceptId di ancoraggio è il minimo necessario?
- [ ] È dichiarata la **versione** della terminologia di riferimento?
- [ ] Se l'artefatto proviene da un pacchetto di terzi: è stata verificata la titolarità del contenuto e non solo la licenza dichiarata dal contenitore? (§9.4)

### 12.3 Il *terminology guard* in CI

Difesa tecnica contro la reintroduzione accidentale di contenuto vietato - in particolare per proteggere la linea "il progetto non è mai stato Licensee SNOMED" (§2.2.1).

Controllo che **fa fallire la build** se, fuori da `third-party/`, compare:

1. un file `ValueSet` con `expansion.contains[].system` uguale a `http://snomed.info/sct`, `http://www.whocc.no/atc`, `http://id.who.int/icd/release/11/mms` o `http://hl7.org/fhir/sid/icd-10`;
2. un `compose.include` con quei `system` e un array `concept` non vuoto;
3. un file corrispondente ai pattern di release SNOMED (`sct2_*`, `der2_*`, `*_Snapshot_*`, `*_Full_*`, `*_Delta_*`);
4. una soglia superata di occorrenze di identificativi SNOMED (regex `\b[1-9][0-9]{5,17}\b` in prossimità di `snomed.info/sct`) in file non esplicitamente in allowlist;
5. un file `.tgz` di pacchetto FHIR committato nel repository.

Il guard va accompagnato da un'**allowlist versionata e commentata**, in cui ogni eccezione è motivata e firmata. Un'eccezione senza motivazione scritta è un difetto.

> **Nota per il fascicolo tecnico MDR (D6)**: questo controllo è una misura di **gestione della configurazione** ai sensi di IEC 62304 §5.1.9 e §8, e va documentato come tale. La sua esecuzione produce evidenza oggettiva utile in audit.

### 12.4 Politica di contribuzione

In `CONTRIBUTING.md`, e nel testo del **DCO/CLA** previsto dalla decisione **D1**:

> Il contributore dichiara che il contributo non include contenuto terminologico di terzi (in particolare SNOMED CT, ATC/DDD, ICD-10, ICD-11, CPT) e che non deriva da materiale soggetto a licenza incompatibile con Apache-2.0.

Va aggiunta una regola interna, apparentemente banale e in realtà decisiva:

> **Nessun manutentore del progetto scarica i file di release di SNOMED CT, ICD-11 o ATC/DDD per finalità di sviluppo del progetto.** Il download perfeziona per fatto concludente l'accordo di licenza (§2.2.1) e trasforma il progetto in Licensee, con obblighi di dichiarazione e pagamento. Il test dell'integrazione terminologica si esegue con **doppi di test** (code system fittizi di progetto) o su un'istanza fornita da un deployer che detiene già la licenza.

---

## 13. Tabella riassuntiva

Legenda della colonna "Ridistribuibile nel repository": **Sì** = regime A; **Condizionata** = regime B; **No (runtime)** = regime C; **No** = regime D.

| Terminologia | Titolare dei diritti | Costo | Ridistribuibile nel repository | Uso per riferimento URI + codice | Obblighi di attribuzione | Rischio residuo |
|---|---|---|---|---|---|---|
| **SNOMED CT** | SNOMED International (IHTSDO), Londra | **A pagamento in Italia** (non-Membro): baseline USD 1.954/anno per Hospital in Banda A, USD 652 per Practice; gratuito nei paesi Membri **[V]** | **No (runtime)** - cl. 2.7 esclude il repository pubblico | **Sì**, cl. 2.2.5 (identificativi + descrizioni nei messaggi clinici) - **ma solo per chi ha la licenza** | A carico del **deployer**: avviso cl. 8.3.1 su tutti i media di distribuzione + versione e data della release (cl. 8.3.2) | **Alto se violato** (risoluzione della licenza, fee arretrate, danno reputazionale). **Basso se la disciplina §2.4 è rispettata** |
| **LOINC** | Regenstrief Institute, Inc. + LOINC Committee | **Gratuito**, commerciale e non commerciale, in perpetuo **[V-sec]**. Registrazione gratuita per il download | **Sì** (regime A) | Sì | **Sì**: notice §3.3 in `NOTICE` e nell'elemento `copyright` di ogni ValueSet/CodeSystem | **Basso**. Attenzione a: traduzioni (derivati assegnati a Regenstrief) e codici con copyright di terzi |
| **ICD-9-CM versione italiana 2007** | Traduzione: Ministero della salute / IPZS. A monte: NCHS-CMS (USA), OMS | **Gratuito**; download dal portale ministeriale | **Condizionata** (regime B, `third-party/icd9cm-it/`) | Sì | Citazione del DM 18 dicembre 2008 e del Ministero della salute; data di estrazione | **Basso**: art. 5 L. 633/1941 + art. 52 CAD. Non nullo sulla catena a monte (OMS/NCHS) **[NV]** |
| **ICD-10** | Organizzazione Mondiale della Sanità | Regime **[NV]** - da accertare con `licensing@who.int` | **No** | Sì, `http://hl7.org/fhir/sid/icd-10` | Citazione OMS | **Medio** finché il regime non è accertato |
| **ICD-11 MMS** | Organizzazione Mondiale della Sanità | **Gratuito** sotto CC BY-ND 3.0 IGO **[V]** | **No** - ND vieta i derivati; §4.5 impone manleva | Sì, **`http://id.who.int/icd/release/11/mms`** (mai `hl7.org/fhir/sid/icd-11`) | Citazione §1.3; in trasmissione e storage: **codice + titolo + URI** (§1.2.3) | **Medio**: mapping e traduzioni richiedono accordo scritto separato con OMS (§1.2.4) |
| **ATC / DDD** | WHO Collaborating Centre for Drug Statistics Methodology, Oslo (`atcddd.fhi.no`) | Indice online gratuito; **file elettronici a pagamento**, ~200 EUR **[V-sec]** | **No** - *"Copying and distribution for commercial purposes is not allowed"* **[V]** | Sì (**[NV]** - non confermato dal titolare) | *"Use of all or parts of the material requires reference to the WHO Collaborating Centre for Drug Statistics Methodology"* **[V]** | **Alto se ridistribuito**; **basso** se si adotta AIC come codifica primaria (§6.6) |
| **Nomenclatore / catalogo nazionale prestazioni** | Repubblica Italiana (DM 23 giugno 2023, DM 26 novembre 2024) | **Gratuito** | **Condizionata** (regime B, `third-party/nomenclatore-it/`) | Sì | Citazione del decreto, della GU e della data di estrazione | **Molto basso** |
| **Cataloghi regionali** | Regioni (delibere di giunta, BUR) | **Gratuito** | **Sconsigliata** - accettare per riferimento dal tenant | Sì | Citazione della delibera | **Molto basso** (giuridico); **alto** in manutenzione: 21 cicli indipendenti |
| **UCUM** | Regenstrief Institute + UCUM Organization | **Gratuito** **[V]** | **Condizionata** (regime B) - o dipendenza esterna, preferibile | Sì | Copyright notice + riferimento alla licenza + disclaimer + testo o URL della licenza **[V]** | **Basso**. Da notare: licenza **revocabile** e derivati vietati |
| **HL7 Terminology (THO)** | HL7 International | **Gratuito** | **Sì** (regime A) - **CC0** **[V]** | Sì | Nessuno (CC0) | **Molto basso**. Verificare l'origine dei concetti veicolati (§9.4) |
| **Code system FHIR core** | HL7 International | **Gratuito** | **Sì** (regime A) - **CC0** **[V]** | Sì | Nessuno. **Vincoli di marchio** su FHIR®/HL7® **[V]** | **Molto basso**. Rischio marchio se usato nel naming |
| **CVX** | CDC / NCIRD (USA) | Presumibilmente gratuito | **No** in v1.0 - licenza **[NV]** | n/a in v1.0 | **[NV]** | **Indeterminato**; azzerato escludendolo dal perimetro v1.0 |
| **DICOM controlled terminology** | NEMA | Standard pubblicato gratuitamente | **No** - solo i codici usati per riferimento | Sì, `http://dicom.nema.org/resources/ontology/DCM` | Marchio DICOM® di NEMA **[V]** | **Basso** con uso per riferimento |
| **Specifica FHIR (core)** | HL7 International | **Gratuito** | **Sì** - **CC0** **[V]** | n/a | Vincoli di marchio (§10.1) | **Molto basso** |
| **Standard HL7 v2.x** | HL7 International | Gratuito con registrazione | **No** - *"You may not... copy or distribute HL7's publication Product"* **[V-sec]** | n/a | - | **Basso** se si usano le tabelle v2 da THO |
| **Technical Framework IHE** | IHE International | **Gratuito** | **No** - licenza `non-sublicensable` **[V]** | n/a | Citazione per URL e revisione | **Basso** con citazione per URL |
| **IG e pacchetti HL7 Italia** | HL7 Italia (publisher segnaposto su *Televisita*) | **Gratuito** | **No (runtime)** - dipendenza risolta a build time | Sì (canonical URL) | Da definire con HL7 Italia (§9.3) | **Medio**: licenza non pienamente attribuibile + contenuti di terzi ricompresi |

---

## 14. Testi pronti all'uso

> I testi che seguono sono **bozze operative** da sottoporre a revisione legale prima della pubblicazione. I segnaposto sono indicati fra parentesi angolari. Le date e le versioni vanno aggiornate al momento del rilascio.

### 14.1 File `NOTICE` (radice del repository)

Breve per costruzione, secondo l'analisi del §1.4.

```text
Telemedic
Copyright <ANNO> <TITOLARE DEL COPYRIGHT>

Questo prodotto include software sviluppato nell'ambito del progetto Telemedic
(https://github.com/fedcal/Telemedic).
This product includes software developed as part of the Telemedic project
(https://github.com/fedcal/Telemedic).

--------------------------------------------------------------------------
LOINC

Questo materiale contiene contenuti provenienti da LOINC (http://loinc.org).
LOINC è Copyright (c) 1995-<ANNO> Regenstrief Institute, Inc. e il Logical
Observation Identifiers Names and Codes (LOINC) Committee, ed è disponibile
senza costi con la licenza pubblicata su http://loinc.org/license.
LOINC(R) è un marchio registrato negli Stati Uniti di Regenstrief Institute, Inc.

This material contains content from LOINC (http://loinc.org). LOINC is
Copyright (c) 1995-<ANNO> Regenstrief Institute, Inc. and the Logical
Observation Identifiers Names and Codes (LOINC) Committee and is available at
no cost under the license at http://loinc.org/license.
LOINC(R) is a registered United States trademark of Regenstrief Institute, Inc.

--------------------------------------------------------------------------
HL7 e FHIR

HL7(R), Health Level Seven(R) e FHIR(R) sono marchi registrati di Health Level
Seven International. La specifica HL7 FHIR e HL7 Terminology sono rilasciate
sotto Creative Commons Zero (CC0). L'uso di questi marchi in questo progetto ha
finalità puramente descrittive della conformità tecnica e non implica alcuna
approvazione o certificazione da parte di HL7 International.

HL7(R), Health Level Seven(R) and FHIR(R) are registered trademarks of Health
Level Seven International. The HL7 FHIR specification and HL7 Terminology are
released under Creative Commons Zero (CC0). Use of these marks in this project
is purely descriptive of technical conformance and does not imply any
endorsement or certification by HL7 International.

--------------------------------------------------------------------------
TERMINOLOGIE CLINICHE DI TERZI / THIRD-PARTY CLINICAL TERMINOLOGIES

Questo progetto NON distribuisce contenuti di SNOMED CT, ATC/DDD, ICD-10,
ICD-11 o CPT. Vi fa riferimento esclusivamente tramite URI di sistema e codici.
L'uso di tali terminologie in un'installazione richiede che il soggetto che
installa ed esercisce il sistema si procuri autonomamente le licenze necessarie.
Vedi THIRD-PARTY-TERMINOLOGY.md.

This project does NOT distribute any SNOMED CT, ATC/DDD, ICD-10, ICD-11 or CPT
content. It references them solely by system URI and code. Use of these
terminologies in a deployment requires the party that installs and operates the
system to obtain the necessary licences independently.
See THIRD-PARTY-TERMINOLOGY.md.

--------------------------------------------------------------------------
La directory third-party/ contiene materiale di terzi NON coperto dalla licenza
Apache-2.0 di questo progetto. Ciascuna sottodirectory riporta la propria
licenza e la propria attribuzione.

The third-party/ directory contains third-party material NOT covered by this
project's Apache-2.0 licence. Each subdirectory carries its own licence and
attribution.
```

### 14.2 File `THIRD-PARTY-TERMINOLOGY.md` - clausola principale

Versione italiana:

> ## Terminologie cliniche: che cosa questo progetto fa e che cosa non fa
>
> Telemedic è rilasciato sotto licenza **Apache-2.0**. La licenza Apache-2.0 si applica **esclusivamente** al codice sorgente, alla documentazione e agli artefatti prodotti dal progetto Telemedic.
>
> **Apache-2.0 non si applica, e non può applicarsi, ai contenuti terminologici di terzi.** Il progetto non detiene i diritti su tali contenuti e non è nella condizione di concederli.
>
> ### Che cosa il progetto NON distribuisce
>
> Il repository di Telemedic **non contiene** e **non distribuisce**, in nessuna forma:
>
> - contenuti di **SNOMED CT** (concetti, descrizioni, relazioni, reference set, file di release RF2, value set espansi, sottoinsiemi, cross-map, gerarchie precalcolate);
> - contenuti di **ATC/DDD** del WHO Collaborating Centre for Drug Statistics Methodology;
> - contenuti di **ICD-10** o **ICD-11** dell'Organizzazione Mondiale della Sanità;
> - contenuti di **CPT** dell'American Medical Association;
> - i documenti degli standard **HL7 v2.x**, i **Technical Framework IHE** o lo **standard DICOM**.
>
> ### In che modo il progetto vi fa riferimento
>
> Telemedic fa riferimento a queste terminologie **soltanto** tramite:
>
> - l'**URI canonico del sistema di codifica** (per esempio `http://snomed.info/sct`), che è un identificatore definito dalla specifica HL7 FHIR, rilasciata sotto Creative Commons Zero;
> - i **codici** che l'utilizzatore, il professionista sanitario o il sistema chiamante immettono o trasmettono;
> - **operazioni terminologiche** (`$expand`, `$lookup`, `$validate-code`, `$translate`, `$subsumes`) rivolte a un **servizio terminologico esterno**, che il soggetto che installa il sistema configura e la cui licenza è **sua responsabilità esclusiva**.
>
> ### Obblighi a carico di chi installa ed esercisce il sistema
>
> Chi installa, configura, esercisce, distribuisce o commercializza Telemedic - o un prodotto che lo incorpora - è **l'unico responsabile** dell'ottenimento e del mantenimento delle licenze necessarie per le terminologie cliniche che intende utilizzare, secondo la giurisdizione in cui opera.
>
> **In particolare, per SNOMED CT**: l'**Italia non è un paese Membro di SNOMED International**. Non esiste una licenza nazionale italiana gratuita. Ogni utilizzatore in Italia deve procurarsi autonomamente una **Affiliate License** a titolo oneroso, tramite il *Member Licensing & Distribution Service* (<https://mlds.ihtsdotools.org/>), con rinnovo e dichiarazione d'uso annuali. **Il fatto di interrogare un servizio terminologico esterno gestito da terzi non esonera dall'obbligo di licenza**, perché un sistema che crea o analizza dati codificati con SNOMED CT è un *Data Processing System* ai sensi dell'accordo di licenza.
>
> ### Nessuna garanzia di conformità
>
> Il progetto Telemedic **non rilascia alcuna garanzia** circa la sussistenza, la validità, l'estensione o la sufficienza di alcuna licenza terminologica in capo a chi utilizza il software, e **non risponde** dell'uso che ne viene fatto, coerentemente con le sezioni 7 e 8 della licenza Apache-2.0.
>
> Il presente documento è una descrizione tecnica e **non costituisce consulenza legale**.

Versione inglese:

> ## Clinical terminologies: what this project does and does not do
>
> Telemedic is released under the **Apache-2.0** licence. Apache-2.0 applies **exclusively** to the source code, documentation and artefacts produced by the Telemedic project.
>
> **Apache-2.0 does not, and cannot, apply to third-party terminology content.** The project does not hold rights in such content and is not in a position to grant them.
>
> ### What the project does NOT distribute
>
> The Telemedic repository **does not contain** and **does not distribute**, in any form:
>
> - **SNOMED CT** content (concepts, descriptions, relationships, reference sets, RF2 release files, expanded value sets, sub-sets, cross-maps, pre-computed hierarchies);
> - **ATC/DDD** content of the WHO Collaborating Centre for Drug Statistics Methodology;
> - **ICD-10** or **ICD-11** content of the World Health Organization;
> - **CPT** content of the American Medical Association;
> - the **HL7 v2.x** standard documents, the **IHE Technical Frameworks** or the **DICOM** standard.
>
> ### How the project references them
>
> Telemedic references these terminologies **only** through:
>
> - the **canonical code system URI** (for example `http://snomed.info/sct`), which is an identifier defined by the HL7 FHIR specification, released under Creative Commons Zero;
> - the **codes** entered or transmitted by the user, the healthcare professional or the calling system;
> - **terminology operations** (`$expand`, `$lookup`, `$validate-code`, `$translate`, `$subsumes`) addressed to an **external terminology service**, which the deploying party configures and for whose licence that party is **solely responsible**.
>
> ### Obligations of the party installing and operating the system
>
> Any party that installs, configures, operates, distributes or commercialises Telemedic - or a product incorporating it - is **solely responsible** for obtaining and maintaining the licences required for the clinical terminologies it intends to use, according to the jurisdiction in which it operates.
>
> **For SNOMED CT in particular**: **Italy is not a Member country of SNOMED International.** No free Italian national licence exists. Every user in Italy must independently obtain a paid **Affiliate License** through the *Member Licensing & Distribution Service* (<https://mlds.ihtsdotools.org/>), with annual renewal and usage reporting. **Querying an externally operated terminology service does not remove the licensing obligation**, because a system that creates or analyses data encoded using SNOMED CT is a *Data Processing System* within the meaning of the licence agreement.
>
> ### No warranty of compliance
>
> The Telemedic project makes **no warranty** as to the existence, validity, scope or sufficiency of any terminology licence held by any user of the software, and **accepts no liability** for the use made of it, consistently with sections 7 and 8 of the Apache-2.0 licence.
>
> This document is a technical description and **does not constitute legal advice**.

### 14.3 Clausole per la documentazione di deployment

Da collocare in `docs/08_compliance/terminologie/` e da riprodurre nel README di installazione, in posizione visibile - non in fondo.

Versione italiana:

> ### ⚠️ Prima di andare in produzione: licenze terminologiche
>
> Telemedic può essere configurato per utilizzare terminologie cliniche soggette a licenze di terzi. **Il software non le contiene e non le fornisce.** L'obbligo di procurarsele è tuo, in quanto soggetto che installa ed esercisce il sistema.
>
> **SNOMED CT - verifica obbligatoria prima dell'attivazione**
>
> Se abiliti funzioni che leggono o scrivono codici SNOMED CT (binding su `Encounter.reasonCode`, `Condition.code`, `DiagnosticReport.conclusionCode`, o conformità a Implementation Guide che ne dipendono):
>
> 1. Verifica se il paese in cui operi è **Membro di SNOMED International** (<https://www.snomed.org/members>). **L'Italia non lo è.**
> 2. Se sei in un paese Membro: registrati presso il **National Release Center** nazionale. Nessun costo.
> 3. Se sei in un paese **non Membro** (Italia inclusa): richiedi una **Affiliate License** tramite MLDS (<https://mlds.ihtsdotools.org/>). La licenza è **annuale e a pagamento**; l'importo dipende dalla banda assegnata al territorio e dal numero di *Hospital* e *Practice* serviti. **Chiedi a SNOMED International l'allocazione di banda del tuo territorio per iscritto** prima di preventivare.
> 4. Se distribuisci Telemedic ai tuoi clienti (per esempio in modalità SaaS multi-tenant), sei tu a dover **concedere le sub-licenze** e a **mantenerne il registro** previsto dalla clausola 8.8 dell'Affiliate License Agreement.
> 5. Inserisci nei tuoi materiali di distribuzione l'avviso richiesto dalla clausola 8.3.1:
>
>    > *"This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. "SNOMED" and "SNOMED CT" are registered trademarks of the IHTSDO."*
>
>    e indica **versione e data** della release SNOMED CT in uso (clausola 8.3.2).
> 6. **Interrogare un terminology server gestito da terzi non ti esonera**: se la tua installazione crea o analizza record codificati con SNOMED CT, è un *Data Processing System* soggetto a fee.
>
> **Se non hai una licenza SNOMED CT**, configura Telemedic con `terminology.snomed.enabled=false`. Il sistema resta pienamente funzionale usando **LOINC**, **ICD-9-CM (versione italiana)** e il **catalogo nazionale delle prestazioni**, che non comportano alcun costo di licenza.
>
> **ICD-11 / ICD-10** - l'uso è soggetto ai *Terms of Use and License Agreement* dell'OMS (<https://icd.who.int/en/docs/icd11-license.pdf>). Se trasmetti o memorizzi codici ICD, devi includere **codice, titolo e URI** (clausola 1.2.3). Mappature verso altre classificazioni e traduzioni richiedono un **accordo scritto separato con l'OMS** (clausola 1.2.4).
>
> **ATC/DDD** - l'uso richiede il riferimento al *WHO Collaborating Centre for Drug Statistics Methodology*. La distribuzione commerciale del contenuto ATC non è consentita. I file elettronici si acquistano su <https://orders.atcddd.fhi.no/>. In Italia, la codifica operativa del farmaco è il codice **AIC**: Telemedic la usa come codifica primaria e non richiede ATC.
>
> **LOINC** - utilizzabile senza costi, anche in ambito commerciale. Se ridistribuisci Telemedic, **mantieni intatto il file `NOTICE`** con l'attribuzione LOINC: è una condizione della licenza.

Versione inglese:

> ### ⚠️ Before going to production: terminology licences
>
> Telemedic can be configured to use clinical terminologies subject to third-party licences. **The software does not contain and does not provide them.** Obtaining them is your obligation as the party installing and operating the system.
>
> **SNOMED CT - mandatory check before enabling**
>
> If you enable features that read or write SNOMED CT codes (bindings on `Encounter.reasonCode`, `Condition.code`, `DiagnosticReport.conclusionCode`, or conformance to Implementation Guides that depend on them):
>
> 1. Check whether your country is a **Member of SNOMED International** (<https://www.snomed.org/members>). **Italy is not.**
> 2. In a Member country: register with your **National Release Center**. No charge applies.
> 3. In a **non-Member** country (including Italy): apply for an **Affiliate License** through MLDS (<https://mlds.ihtsdotools.org/>). The licence is **annual and chargeable**; the amount depends on the territory band and on the number of *Hospitals* and *Practices* served. **Obtain your territory's band allocation from SNOMED International in writing** before budgeting.
> 4. If you distribute Telemedic to your customers (for example as multi-tenant SaaS), it is you who must **grant the sub-licences** and **maintain the register** required by clause 8.8 of the Affiliate License Agreement.
> 5. Include in your distribution media the notice required by clause 8.3.1:
>
>    > *"This material includes SNOMED Clinical Terms® (SNOMED CT®) which is used by permission of the International Health Terminology Standards Development Organisation (IHTSDO). All rights reserved. SNOMED CT®, was originally created by The College of American Pathologists. "SNOMED" and "SNOMED CT" are registered trademarks of the IHTSDO."*
>
>    and state the **version and date** of the SNOMED CT release in use (clause 8.3.2).
> 6. **Querying a third-party terminology server does not exempt you**: if your deployment creates or analyses records encoded using SNOMED CT, it is a *Data Processing System* subject to fees.
>
> **If you do not hold a SNOMED CT licence**, configure Telemedic with `terminology.snomed.enabled=false`. The system remains fully functional using **LOINC**, **ICD-9-CM (Italian version)** and the **national procedure catalogue**, none of which carry licensing costs.
>
> **ICD-11 / ICD-10** - use is subject to the WHO *Terms of Use and License Agreement* (<https://icd.who.int/en/docs/icd11-license.pdf>). If you transmit or store ICD codes, you must include **code, title and URI** (clause 1.2.3). Mappings to other classifications and translations require a **separate written agreement with WHO** (clause 1.2.4).
>
> **ATC/DDD** - use requires reference to the *WHO Collaborating Centre for Drug Statistics Methodology*. Commercial distribution of ATC content is not permitted. Electronic files are purchased at <https://orders.atcddd.fhi.no/>. In Italy the operational drug coding is the **AIC** code: Telemedic uses it as the primary coding and does not require ATC.
>
> **LOINC** - free to use, including commercially. If you redistribute Telemedic, **keep the `NOTICE` file intact** with the LOINC attribution: it is a condition of the licence.

### 14.4 Elemento `copyright` per i `ValueSet` con codici LOINC

```json
{
  "resourceType": "ValueSet",
  "url": "http://telemedic.<dominio>/fhir/ValueSet/sezioni-referto-televisita",
  "version": "1.0.0",
  "copyright": "This material contains content from LOINC (http://loinc.org). Refer to terminology.hl7.org for copyright information. LOINC® is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."
}
```

### 14.5 `LICENSE-NOTICE.md` per le directory in regime B

**`third-party/icd9cm-it/LICENSE-NOTICE.md`**

```text
ICD-9-CM - Classificazione delle malattie, dei traumatismi, degli interventi
chirurgici e delle procedure diagnostiche e terapeutiche - VERSIONE ITALIANA 2007

Fonte: Ministero della salute - Direzione generale della programmazione
sanitaria. Pubblicazione a cura dell'Istituto Poligrafico e Zecca dello Stato.

Adottata con DM 18 dicembre 2008 (GU Serie Generale n. 56 del 9 marzo 2009),
che ne prescrive l'uso per la codifica delle informazioni cliniche della Scheda
di Dimissione Ospedaliera (SDO) a decorrere dal 1° gennaio 2009.

URL della fonte: <URL DI SCARICAMENTO>
Data di estrazione: <AAAA-MM-GG>

BASE DEL RIUSO
Il contenuto qui riprodotto costituisce testo di atto ufficiale dello Stato
italiano ed è pertanto escluso dall'ambito di applicazione della legge
22 aprile 1941, n. 633, ai sensi dell'art. 5 della medesima legge. Si applica
inoltre il principio di apertura di cui all'art. 52, comma 2, del d.lgs.
7 marzo 2005, n. 82 (CAD).

QUESTO CONTENUTO NON È OPERA DEL PROGETTO TELEMEDIC E NON È COPERTO DALLA
LICENZA APACHE-2.0 DEL PROGETTO. È riprodotto come dato di riferimento
normativo, senza modifiche sostanziali. Il progetto non rivendica alcun
diritto su di esso e non ne garantisce l'accuratezza, la completezza né
l'aggiornamento: la fonte autoritativa resta la pubblicazione ministeriale.

Riferimenti a monte: ICD-9-CM è una Clinical Modification statunitense
(NCHS/CMS) della ICD-9 dell'Organizzazione Mondiale della Sanità.
```

**`third-party/nomenclatore-it/LICENSE-NOTICE.md`**

```text
NOMENCLATORE DELL'ASSISTENZA SPECIALISTICA AMBULATORIALE

Fonte: DM 23 giugno 2023 (Decreto Tariffe), come modificato dal
DM 26 novembre 2024 (in vigore dal 30 dicembre 2024).
Pubblicazione in Gazzetta Ufficiale della Repubblica Italiana.

URL della fonte: <URL>
Data di estrazione: <AAAA-MM-GG>

BASE DEL RIUSO
Allegati a decreto ministeriale, testo di atto ufficiale dello Stato: esclusi
dall'ambito di applicazione della legge 22 aprile 1941, n. 633, ai sensi
dell'art. 5. Si applicano inoltre il d.lgs. 24 gennaio 2006, n. 36 e l'art. 52,
comma 2, del d.lgs. 7 marzo 2005, n. 82 (CAD).

QUESTO CONTENUTO NON È OPERA DEL PROGETTO TELEMEDIC E NON È COPERTO DALLA
LICENZA APACHE-2.0 DEL PROGETTO.

AVVERTENZA OPERATIVA
Questo dataset è materiale di riferimento per lo sviluppo e per la validazione.
Non è il catalogo autoritativo di alcuna installazione: i cataloghi regionali
sono adottati con atti regionali e hanno cicli di aggiornamento indipendenti.
In esercizio, il codice della prestazione va accettato per riferimento dal
sistema chiamante.
```

**`third-party/ucum/`** - includere il file di licenza UCUM integrale scaricato da <https://ucum.org/license>, il file `ucum-essence.xml` **immodificato**, e un `NOTICE` con copyright Regenstrief Institute, riferimento alla licenza, disclaimer di garanzia e URL della licenza, come richiesto dalle condizioni verificate al §8.3.

### 14.6 Frase per la comunicazione pubblica e il README

Da usare sul sito e nel README, per prevenire l'aspettativa sbagliata prima che si formi:

> **Italiano** - Telemedic adotta **LOINC** per la struttura del referto, **ICD-9-CM (versione italiana)** per le diagnosi e il **catalogo nazionale delle prestazioni** per la prestazione erogata: nessuna di queste comporta costi di licenza. **SNOMED CT** è supportato per riferimento, tramite un servizio terminologico esterno configurabile: poiché l'Italia non è un paese Membro di SNOMED International, la relativa licenza è a carico di chi installa il sistema. Il progetto non distribuisce contenuto SNOMED CT.

> **English** - Telemedic uses **LOINC** for report structure, **ICD-9-CM (Italian version)** for diagnoses and the **national procedure catalogue** for the delivered service: none of these carries licensing costs. **SNOMED CT** is supported by reference, through a configurable external terminology service: since Italy is not a Member country of SNOMED International, the corresponding licence is the responsibility of the deploying party. The project does not distribute SNOMED CT content.

---

## 15. Procedura operativa per il deployer

Destinatario: chi installa ed esercisce Telemedic (azienda sanitaria, integratore, studio associato). Da pubblicare in `docs/08_compliance/terminologie/` come checklist eseguibile e verificabile in audit.

### Fase 0 - Determinare il perimetro terminologico effettivo (prima di tutto il resto)

| # | Azione | Esito atteso |
|---|---|---|
| 0.1 | Elencare le risorse FHIR che l'installazione **scriverà** e i `CodeableConcept` che verranno valorizzati | Elenco di `system` effettivamente in uso |
| 0.2 | Per ciascun `system`, stabilire se il codice è **generato da Telemedic** o **ricevuto dal sistema chiamante** | Distinzione fra uso attivo e transito |
| 0.3 | Verificare se sia realmente necessario abilitare SNOMED CT, oppure se LOINC + ICD-9-CM + catalogo nazionale bastino | **Nella grande maggioranza dei casi italiani, bastano.** Questa è la decisione che fa risparmiare più denaro e più tempo |
| 0.4 | Verificare se sia richiesta la conformità a Implementation Guide che dipendono da SNOMED CT (IG HL7 Italia *Televisita*, *It-Core*) | Se sì, SNOMED CT diventa necessario e si prosegue con la Fase 1 |

> **Nota**: anche il semplice **transito** di un codice SNOMED ricevuto dal sistema chiamante e persistito nel database rende l'installazione un *Data Processing System*. Il transito non è neutro.

### Fase 1 - SNOMED CT (solo se la Fase 0 lo ha reso necessario)

| # | Azione | A chi rivolgersi | Tempi indicativi |
|---|---|---|---|
| 1.1 | Verificare lo stato di Membro del proprio paese | <https://www.snomed.org/members> | Immediato |
| 1.2a | **Paese Membro**: registrarsi presso il National Release Center; verificare le condizioni prescritte dal Membro (cl. 9.1–9.2) | NRC nazionale | Giorni |
| 1.2b | **Paese non Membro (Italia)**: aprire una pratica sul MLDS | <https://mlds.ihtsdotools.org/> | **Settimane** - non è un passaggio da fare la settimana prima del go-live |
| 1.3 | Chiedere per iscritto l'**allocazione di banda** del territorio e il **preventivo** in base al numero di *Hospital* e *Practice* serviti | `info@snomed.org` | Settimane |
| 1.4 | Verificare se la modalità di erogazione ricade in Appendix B par. 1.7 (app mobile; servizio internet che consente estrazione di porzione sostanziale) → regime negoziato *Other Activities* | `info@snomed.org` | Settimane |
| 1.5 | Se si distribuisce a clienti finali: predisporre il **modello di sub-licenza** conforme alle cl. 2.5.1–2.5.6 e il **registro** della cl. 8.8 | Legale interno + `info@snomed.org` | Settimane |
| 1.6 | Notificare al Licensor l'esercizio dei diritti in ciascun nuovo territorio non-Membro (cl. 9.3) | `info@snomed.org` | Prima dell'attivazione in quel territorio |
| 1.7 | Inserire l'avviso cl. 8.3.1 e la versione/data della release (cl. 8.3.2) nei propri materiali | Interno | Ore |
| 1.8 | Predisporre il processo per lo **statement of account annuale** (cl. 7.3) e per l'**aggiornamento entro 180 giorni** da ogni nuova release (cl. 6.2) | Interno | Processo ricorrente |
| 1.9 | Verificare l'applicabilità di un'**esenzione** (paese a basso reddito, ricerca qualificata, uso umanitario) | <https://www.snomed.org/fee-exemptions> | Settimane |

### Fase 2 - Servizio terminologico

| # | Azione | Note |
|---|---|---|
| 2.1 | Scegliere il terminology server: istanza propria, servizio nazionale, servizio di terzi | Se istanza propria, **caricarvi il contenuto richiede la licenza di cui alla Fase 1** |
| 2.2 | Verificare che l'operatore del servizio abbia una licenza che **copra la modalità di erogazione** (§2.3) | Chiedere evidenza scritta |
| 2.3 | Verificare la collocazione geografica del servizio rispetto al **vincolo V1** (nessun componente obbligatorio fuori dall'UE) e al GDPR | Rilevante anche per il fascicolo MDR |
| 2.4 | Classificare il servizio come **SOUP** ai sensi di IEC 62304 e documentarlo | Questione **Q2** aperta da R1 |
| 2.5 | Definire il comportamento del sistema in caso di **indisponibilità** del servizio | Un fallimento terminologico non deve interrompere un consulto clinico in corso |

### Fase 3 - Terminologie senza costo

| # | Azione | Note |
|---|---|---|
| 3.1 | **LOINC**: nessuna azione se si usa Telemedic così com'è. Se si ridistribuisce, **mantenere il `NOTICE` intatto** | Registrazione gratuita su `loinc.org` solo se si scarica il set completo |
| 3.2 | **ICD-9-CM italiano**: verificare che l'edizione inclusa sia quella vigente per la propria regione | Fonte: portale del Ministero della salute |
| 3.3 | **Catalogo prestazioni**: allineare al **catalogo regionale** applicabile, non solo a quello nazionale | 21 cicli di aggiornamento indipendenti |
| 3.4 | **UCUM**: nessuna azione se si usa la dipendenza esterna | Se si ridistribuisce `third-party/ucum/`, mantenerlo immodificato con il suo `NOTICE` |

### Fase 4 - Documentazione e conservazione delle evidenze

| # | Azione | Perché serve |
|---|---|---|
| 4.1 | Conservare copia di **ogni licenza, ricevuta, statement of account e corrispondenza** con i titolari | Prova di conformità in caso di audit o contestazione |
| 4.2 | Registrare **versione e data** di ogni terminologia in uso | Obbligo SNOMED cl. 8.3.2; requisito di tracciabilità IEC 62304 |
| 4.3 | Inserire le licenze terminologiche nel **registro dei fornitori/SOUP** del sistema qualità | ISO 13485 / IEC 62304 (decisione D6) |
| 4.4 | Definire un **riesame annuale** delle licenze, allineato al rinnovo SNOMED e alla release LOINC | Le licenze SNOMED scadono; le terminologie cambiano |
| 4.5 | Inserire nel contratto con i propri clienti la **ripartizione delle responsabilità terminologiche** | Evita che l'obbligo torni indietro per via contrattuale |

### Fase 5 - Configurazione

| # | Azione |
|---|---|
| 5.1 | Se **non** si ha licenza SNOMED CT: impostare `terminology.snomed.enabled=false` e verificare che nessun profilo attivo imponga un binding `required` su un value set SNOMED |
| 5.2 | Configurare l'endpoint del terminology server, le credenziali e i timeout |
| 5.3 | Eseguire la validazione di un `Bundle` di riferimento e verificare che non emergano errori di binding non risolti |
| 5.4 | Documentare la configurazione terminologica nel record di installazione |

---

## 16. Ripartizione degli obblighi: progetto e utilizzatore

**Questa è la distinzione che protegge entrambi.** Un progetto che si assumesse obblighi altrui creerebbe un'aspettativa che non può onorare; un progetto che tacesse gli obblighi dell'utilizzatore lo esporrebbe a un rischio che non ha compreso. La linea va tracciata esplicitamente, per iscritto, e in modo simmetrico.

### 16.1 Obblighi che ricadono sul PROGETTO Telemedic

| # | Obbligo | Fonte | Verifica |
|---|---|---|---|
| P1 | Non includere nel repository contenuto terminologico di terzi non ridistribuibile | §2.4, §5.3, §6.4 | *Terminology guard* in CI (§12.3) |
| P2 | Non scaricare né accedere ai file di release SNOMED CT, ICD-11, ATC per finalità di sviluppo | Avviso in testa all'Affiliate License (§2.2.1) | Regola in `CONTRIBUTING.md` (§12.4) |
| P3 | Mantenere l'attribuzione **LOINC** nel `NOTICE` e nell'elemento `copyright` di ogni artefatto che include codici LOINC | Licenza LOINC (§3.3) | Checklist di PR (§12.2) |
| P4 | Non produrre traduzioni italiane dei display LOINC senza notifica preventiva a Regenstrief | Licenza LOINC (§3.2) | Checklist di PR + ADR sulla separazione i18n / `Coding.display` |
| P5 | Isolare in `third-party/` il materiale in regime B, con licenza e attribuzione proprie, e dichiarare che Apache-2.0 non vi si applica | §11.1, §14.5 | Struttura del repository (§12.1) |
| P6 | Usare gli **URI canonici corretti** (in particolare `http://id.who.int/icd/release/11/mms`, mai `hl7.org/fhir/sid/icd-11`) | §5.5 | Costanti centralizzate + test |
| P7 | **Informare** l'utilizzatore degli obblighi che gli competono, in modo esplicito e in posizione visibile | §14.2, §14.3 | Revisione della documentazione prima del rilascio |
| P8 | Progettare il sistema in modo che sia **pienamente funzionale senza SNOMED CT** (`terminology.snomed.enabled=false`) | §14.3, §15 Fase 5 | Test di integrazione con SNOMED disabilitato |
| P9 | Rispettare i vincoli di marchio (HL7®, FHIR®, SNOMED CT®, LOINC®, DICOM®) nel naming, nei domini e nella comunicazione | §10.1, §2.2.7, §5.2 (§4.2 OMS) | Linee guida di naming |
| P10 | Pinnare le versioni dei pacchetti FHIR di terzi e non vendorizzarli | §9.3 | Configurazione di build + revisione |
| P11 | Rendere disponibile la presente analisi e mantenerla aggiornata | §17.2 | Riesame periodico |

**Il progetto NON è tenuto a**: procurarsi una licenza SNOMED CT; pagare fee per gli utilizzatori; garantire che l'utilizzatore sia in regola; fornire il contenuto delle terminologie a pagamento; rispondere dell'uso che l'utilizzatore fa del software (Apache-2.0 §7 e §8).

### 16.2 Obblighi che ricadono sull'UTILIZZATORE che installa

| # | Obbligo | Fonte | Conseguenza dell'inadempimento |
|---|---|---|---|
| U1 | Procurarsi e mantenere le licenze terminologiche necessarie nella propria giurisdizione | Affiliate License; ToU OMS; condizioni WHOCC | Uso non autorizzato; risoluzione della licenza (cl. 5.2) |
| U2 | Pagare le **fee annuali** SNOMED CT se opera in territorio non Membro | Appendix B, cl. 7.1 | Interessi di mora (cl. 7.6); risoluzione |
| U3 | Presentare lo **statement of account annuale** | cl. 7.3 | Inadempimento contrattuale |
| U4 | Se distribuisce a clienti finali: **concedere sub-licenze** conformi (cl. 2.5) e mantenerne il **registro** (cl. 8.8) | cl. 2.1.5, 2.5, 8.8 | Inadempimento; ispezione |
| U5 | Inserire l'**avviso cl. 8.3.1** e versione/data della release nei propri materiali | cl. 8.3 | Inadempimento |
| U6 | Notificare l'esercizio dei diritti in **ogni nuovo territorio non Membro** | cl. 9.3 | Inadempimento |
| U7 | **Aggiornare** entro 180 giorni da ogni nuova release SNOMED CT | cl. 6.2 | Inadempimento |
| U8 | Includere **codice, titolo e URI** nella trasmissione e memorizzazione di codici ICD | ToU OMS §1.2.3 | Violazione della licenza CC BY-ND |
| U9 | Ottenere un **accordo scritto separato con l'OMS** per mappature e traduzioni ICD | ToU OMS §1.2.4 | Violazione |
| U10 | Citare il **WHO Collaborating Centre** in caso di uso di materiale ATC/DDD; non ridistribuirlo commercialmente | Condizioni WHOCC | Violazione |
| U11 | Mantenere intatto il file **`NOTICE`** in caso di ridistribuzione di Telemedic | Apache-2.0 §4(d) | Violazione della licenza del progetto |
| U12 | Verificare che il **terminology server** utilizzato sia esercito da un soggetto licenziato per quella modalità | §2.3 | Concorso in uso non autorizzato |
| U13 | Documentare le licenze nel **sistema qualità** ai fini MDR/IEC 62304 | ISO 13485, IEC 62304 | Rilievo in audit; ostacolo alla marcatura CE |

### 16.3 La zona di responsabilità condivisa

Tre punti non sono attribuibili a un solo soggetto e vanno regolati **contrattualmente** fra progetto, integratore e utilizzatore finale:

| Questione | Perché è condivisa | Come regolarla |
|---|---|---|
| **Conformità a un IG che dipende da SNOMED CT** | Il progetto decide di dichiarare la conformità; l'utilizzatore ne subisce il costo di licenza | Il progetto rende la conformità **opzionale e configurabile**, non un presupposto dell'installazione |
| **Contenuto terminologico immesso dall'utilizzatore** | L'utilizzatore può caricare nella propria istanza value set espansi con contenuto licenziato | La documentazione avverte che il contenuto immesso è responsabilità di chi lo immette; il software non lo esporta verso terzi senza autorizzazione |
| **Fork che aggiungono contenuto vietato** | Un fork sotto Apache-2.0 può includere ciò che l'originale escludeva | Il progetto lo vieta in `CONTRIBUTING.md` per i contributi *upstream*; non può controllare i fork, e lo dichiara |

---

## 17. Rischi residui, questioni aperte e azioni

### 17.1 Rischi residui, con valutazione onesta

| # | Rischio | Probabilità | Impatto | Mitigazione |
|---|---|---|---|---|
| R1 | Un contributore reintroduce contenuto SNOMED CT in una PR | **Media** - è l'errore più naturale del mondo | **Alto**: il progetto diventerebbe Licensee e perderebbe la propria linea di difesa | *Terminology guard* in CI (§12.3) + checklist di PR + DCO |
| R2 | Le fixture di test contengono risposte reali del terminology server | **Alta** se non si interviene: è il canale di rientro più insidioso | **Alto** | Doppi di test con code system fittizi; guard esteso ai path di test |
| R3 | Un deployer italiano ignora l'obbligo di licenza SNOMED e attribuisce la responsabilità al progetto | **Media** | **Medio** (reputazionale) | Documentazione esplicita in posizione visibile (§14.3); avvertenza a runtime al primo avvio con SNOMED abilitato |
| R4 | HL7 Italia chiarisce che i propri IG **non** sono CC0 | **Bassa** | **Medio**: andrebbe rivista la strategia di dipendenza | Non vendorizzare (§9.3); richiesta scritta di chiarimento |
| R5 | La catena a monte dell'ICD-9-CM italiano (OMS/NCHS) viene contestata | **Molto bassa** | **Medio** | Attribuzione completa; regime B; possibilità di passare al regime C senza rifacimenti |
| R6 | SNOMED International modifica i termini della licenza | **Media** - la cl. 6.3 lo consente con 90 giorni di preavviso | **Basso** per il progetto (non è Licensee); **medio** per i deployer | Riesame annuale (§17.2) |
| R7 | Un fork commerciale aggiunge contenuto licenziato e il problema viene attribuito a Telemedic | **Bassa** | **Medio** (reputazionale) | Dichiarazione esplicita nel `NOTICE` e in `THIRD-PARTY-TERMINOLOGY.md` |
| R8 | Il display italiano nella UI viene confuso con una traduzione LOINC | **Media** | **Basso** | ADR sulla separazione i18n / `Coding.display` (§3.2) |
| R9 | Un `ValueSet` di THO copiato nel repository veicola concetti SNOMED enumerati | **Media** | **Alto** | Checklist §12.2 punto 8 + guard §12.3 |

### 17.2 Manutenzione della policy

Le licenze terminologiche cambiano, e alcune cambiano con preavviso breve.

| Cadenza | Attività |
|---|---|
| **Annuale** | Riverifica di tutte le fonti dell'Appendice A. Ricontrollo dello stato di Membro dell'Italia in SNOMED International. Ricontrollo delle tariffe di Appendix B (soggette ad adeguamento annuale ex par. 1.4). |
| **A ogni release del progetto** | Verifica che `NOTICE`, `THIRD-PARTY-TERMINOLOGY.md` e la documentazione di deployment siano allineati alle terminologie effettivamente in uso. |
| **A ogni aggiornamento di una terminologia** | Aggiornamento della versione dichiarata negli artefatti; verifica di eventuali modifiche ai termini. |
| **Su evento** | Se l'Italia diventasse Membro di SNOMED International, **l'intera analisi del §2 andrebbe riscritta** e gran parte del costo per gli utilizzatori italiani si azzererebbe. È un evento a bassa probabilità e ad altissimo impatto: va monitorato. |

### 17.3 Questioni aperte per gli altri agenti

| # | Destinatario | Questione |
|---|---|---|
| B5-A1 | **Architettura** | Progettare il *terminology gateway* come punto unico di accesso alle terminologie esterne, con circuit breaker, cache **non persistita su disco** (una cache persistente di risposte SNOMED è un Sub-Set: cfr. §2.4.2) e disabilitazione per `system`. Risponde anche alla questione **Q2** di R1. |
| B5-A2 | **Architettura** | ADR sulla separazione fra stringhe i18n del progetto e `Coding.display` ufficiale (§3.2). |
| B5-A3 | **Architettura** | Decidere se il catalogo delle prestazioni sia dato di riferimento incluso o esclusivamente per riferimento dal tenant (§7.4). |
| B5-C1 | **Conformità MDR** | Chiude la questione **Q3** di R1: la valutazione di compatibilità Apache-2.0 / Affiliate License è al §2 e §11; il disclaimer al §14. Da recepire nel fascicolo tecnico. |
| B5-C2 | **Conformità MDR** | Chiude la questione **Q4** di R1: i termini ATC/DDD sono accertati (§6.2) e il contenuto è escluso. |
| B5-C3 | **Conformità MDR** | Classificare il terminology server esterno come **SOUP** IEC 62304 e verificarne la compatibilità con il vincolo **V1**. |
| B5-D1 | **Documentazione** | Recepire i testi del §14 in `NOTICE`, `THIRD-PARTY-TERMINOLOGY.md`, `CONTRIBUTING.md` e in `docs/08_compliance/terminologie/`, in italiano e in inglese (decisione **D3**). |
| B5-D2 | **Documentazione** | Correggere la comunicazione pubblica con la formula del §14.6. |
| B5-S1 | **Sicurezza / DevOps** | Implementare il *terminology guard* in CI (§12.3) con allowlist versionata e motivata. |
| B5-R1 | **Roadmap** | Le pratiche di licenza SNOMED CT richiedono **settimane**. Se un deployer pilota richiede SNOMED CT, la pratica va aperta con largo anticipo rispetto al 30 novembre 2026. |
| B5-R2 | **Relazioni esterne** | Inviare a HL7 Italia la richiesta scritta di chiarimento sulla licenza dei pacchetti e sui campi `publisher` segnaposto (§9.3). |

### 17.4 Punti che restano [NV] e vanno chiusi prima del rilascio

| # | Punto | Come chiuderlo |
|---|---|---|
| NV1 | Testo integrale della licenza LOINC (§3.2) | Leggere `https://loinc.org/license/` da browser e verificare le clausole citate |
| NV2 | Esistenza di una variante linguistica italiana ufficiale di LOINC (§3.2) | Verificare su `loinc.org` |
| NV3 | Data di rilascio della versione LOINC 2.81 (R1 §8.2) | Verificare su `loinc.org` |
| NV4 | Allocazione di banda dell'Italia in Appendix B (§2.2.8) | Richiesta scritta a `info@snomed.org` |
| NV5 | Regime di licenza dell'**ICD-10** distinto da ICD-11 (§5.4) | `licensing@who.int` |
| NV6 | Prezzo e condizioni contrattuali dei file elettronici ATC/DDD (§6.3) | Registrazione su `orders.atcddd.fhi.no` |
| NV7 | Licenza dichiarata dai pacchetti *It-Core*, *Teleconsulto*, *Teleassistenza*, *Telemonitoraggio* (§9.1) | Lettura delle risorse `ImplementationGuide` + richiesta a HL7 Italia |
| NV8 | Licenza esplicita di **CVX** (§8.4) | `iisinfo@cdc.gov` - solo se CVX entrerà nel perimetro |
| NV9 | Ridistribuibilità dello **standard DICOM** e dei codici DCM (§8.5) | Termini di pubblicazione NEMA su `dicomstandard.org` |
| NV10 | Termini di riuso dei **codici ISO 3166 alpha-2** (§8.5) | ISO Online Browsing Platform |
| NV11 | Ammissibilità dell'uso ATC per solo riferimento URI+codice (§6.5) | Quesito scritto al WHO Collaborating Centre |
| NV12 | Edizione ICD-9-CM rappresentata dal `CodeSystem` dell'IG italiano (§4.4; questione **D1** di R1) | HL7 Italia |
| NV13 | Attualità dell'Affiliate License Agreement rispetto alla versione del 31 luglio 2023 letta (§2.2) | `snomed.org/license` / MLDS |

---

## Appendice A - Fonti primarie consultate

| Ambito | URL | Esito |
|---|---|---|
| Apache License 2.0 | <https://www.apache.org/licenses/LICENSE-2.0> | **[V]** |
| SNOMED - come ottenerlo | <https://www.snomed.org/get-snomed> | **[V]** |
| SNOMED - Membri | <https://www.snomed.org/members> | **[V]** (conferma di R1) |
| SNOMED - licenze e tariffe | <https://www.snomed.org/licensing> | **[V]** |
| SNOMED - esenzioni | <https://www.snomed.org/fee-exemptions> | **[V]** |
| SNOMED - MLDS | <https://mlds.ihtsdotools.org/> | citato **[V-sec]** |
| **SNOMED CT Affiliate License Agreement**, in vigore dal 31/07/2023 | <https://www.bfarm.de/SharedDocs/Downloads/DE/Kodiersysteme/SNOMED-CT/AFFILIATE_LICENSE_AGREEMENT_gueltig_20230731.pdf> | **letto integralmente [V]** (mirror istituzionale) |
| SNOMED - guida per vendor, licensing | <https://docs.snomed.org/snomed-ct-practical-guides/vendor-introduction-to-snomed-ct/7-licensing> | **[V]** |
| SNOMED - terminology server | <https://www.implementation.snomed.org/terminology-services> | **[V]** |
| LOINC - licenza | <https://loinc.org/license/>, <https://loinc.org/kb/license> | **HTTP 403** - clausole **[V-sec]** |
| LOINC - notice richiesto in FHIR | <https://build.fhir.org/ig/HL7/UTG/en/LOINC.html> | **[V]** |
| **OMS - ICD/ICF/ICHI Terms of Use and License Agreement** | <https://icd.who.int/en/docs/icd11-license.pdf> | **letto integralmente [V]** |
| OMS - pagina licenza ICD-API | <https://icd.who.int/icdapi/docs2/license/> | **[V]** |
| **ATC/DDD - copyright e disclaimer** | <https://atcddd.fhi.no/copyright_disclaimer/> (da `whocc.no`, HTTP 301) | **[V]** |
| ATC/DDD - indice e ordini | <https://atcddd.fhi.no/atc_ddd_index/>, <https://orders.atcddd.fhi.no/> | portale ordini non leggibile **[NV]** |
| UCUM - licenza | <https://ucum.org/license>, <https://ucum.org/trac> | **[V]** |
| FHIR R4 - licenza | <https://hl7.org/fhir/R4/license.html> | **[V]** |
| HL7 Terminology - licenza | <https://terminology.hl7.org/6.5.0/license.html> | **[V]** |
| HL7 - Free IP FAQ e standard gratuiti | <https://www.hl7.org/about/faqs/FreeIP.cfm>, <https://www.hl7.org/implement/standards/nocost.cfm> | **[V-sec]** |
| **IHE - General Introduction, cap. 9 Copyright Licenses** | <https://profiles.ihe.net/GeneralIntro/ch-9.html> | **[V]** |
| IHE - ITI TF Vol. 1, §1.7 | <https://profiles.ihe.net/ITI/TF/Volume1/ch-1.html> | **[V]** (rinvio al cap. 9) |
| HL7 Italia - IG Televisita e risorsa ImplementationGuide | <https://www.hl7.it/fhir/televisita/>, `ImplementationGuide-televisita.json` | **[V]** |
| HL7 Italia - IG It-Core | <https://www.hl7.it/fhir/core/> | **[V]** |
| HL7 Italia - pacchetto terminology | `ImplementationGuide-hl7.fhir.it.terminology.json` | **[V]** |
| HL7 Italia - sito | <https://www.hl7.it/> | **[V]** |
| Ministero della salute - ICD-9-CM versione italiana 2007 | <https://www.salute.gov.it/portale/documentazione/p6_2_2_1.jsp?lingua=italiano&id=2251> | protezione anti-bot - **[V-sec]** |
| Ministero della salute - classificazione ICD-9-CM (PDF) | <https://www.salute.gov.it/imgs/C_17_pubblicazioni_2251_ulterioriallegati_ulterioreallegato_0_alleg.pdf> | **[V-sec]** (via R1) |
| L. 22 aprile 1941, n. 633, art. 5 | testo di legge | **[V-sec]** |
| D.lgs. 82/2005 (CAD), art. 52, c. 2 | <https://docs.italia.it/italia/piano-triennale-ict/codice-amministrazione-digitale-docs/it/v2018-09-28/_rst/capo5_sezione1_art52.html> | **[V-sec]** |
| D.lgs. 24 gennaio 2006, n. 36 | testo di legge | **[V-sec]** |
| AgID - Linee guida open data | <https://www.agid.gov.it/sites/agid/files/2024-05/lg-open-data_v.1.0_1.pdf> | **[V-sec]** |
| CDC - code set CVX | <https://www2a.cdc.gov/vaccines/iis/iisstandards/vaccines.asp?rpt=cvx> | **[NV]** sulla licenza |

---

## Appendice B - Riga per il registro agenti

| Fase | Agente | Output | Fatti chiave / questioni aperte |
|---|---|---|---|
| Ricerca (2ª ondata) | B5 | `.telemedic/research/B5-licenze-terminologie.md` | **Fatti chiave**: (1) Letto integralmente l'**Affiliate License Agreement SNOMED CT** (vers. 31/07/2023): la cl. **2.7** (contenuto non scaricabile se non da utenti autorizzati) rende **impossibile** pubblicare contenuto SNOMED in un repo pubblico; la cl. **2.2.5** è la base giuridica dell'uso "per riferimento" ma vale **solo per i Licensee**; l'accordo si perfeziona **scaricando** il contenuto, quindi il progetto resta estraneo **solo se non lo scarica mai**. (2) Tariffe Italia (non-Membro, presumibilmente Banda A): **USD 1.954/anno per Hospital, USD 652 per Practice**; **nessuna esenzione applicabile al progetto**. (3) **Interrogare un terminology server esterno NON esonera il deployer**: chi crea/analizza record codificati SNOMED è un *Data Processing System* e paga. (4) Chi **distribuisce** Telemedic distribuisce un *Licensee Product* e deve gestire sub-licenze e registro (cl. 2.5, 8.8) - incompatibile con Apache-2.0 §2. (5) **LOINC è ridistribuibile** (*"use, copy, or distribute... for any commercial or non-commercial purpose"*): la raccomandazione di R1 §10.3 è **confermata**. Trappola: **le traduzioni sono derivati assegnati a Regenstrief**. (6) **ATC/DDD: chiusa la questione Q4 di R1** - *"Copying and distribution for commercial purposes is not allowed"*: **incompatibile con Apache-2.0, escluso**. Dominio migrato da `whocc.no` a `atcddd.fhi.no`. (7) **ICD-11 è CC BY-ND 3.0 IGO**: derivati vietati, manleva a favore dell'OMS, terminazione automatica → escluso. Confermato che `http://hl7.org/fhir/sid/icd-11` **è errato**. (8) **ICD-9-CM italiano e nomenclatore sono riusabili** (art. 5 L. 633/1941 + art. 52 CAD): regime B, directory separata. (9) **THO e FHIR core sono CC0**; **HL7 v2 e IHE non sono ridistribuibili** (IHE è `non-sublicensable`) → usare le tabelle v2 da THO. (10) L'IG **Televisita dichiara `CC0-1.0` ma con `publisher = "Example Publisher"`** (segnaposto del template): licenza **non attribuibile** → non vendorizzare i pacchetti. (11) **Principio generale**: una dichiarazione CC0 su un IG **non dispone dei diritti di terzi** sul contenuto ricompreso. **Questioni aperte**: B5-A1..A3, B5-C1..C3, B5-D1..D2, B5-S1, B5-R1..R2 (§17.3); tredici punti **[NV]** da chiudere prima del rilascio (§17.4). |

---

## Disclaimer finale

**Il presente documento è un'analisi tecnica di termini di licenza, condotta su fonti pubbliche alla data del 25 agosto 2026. Non è un parere legale, non costituisce consulenza legale e non instaura alcun rapporto professionale.**

Le conclusioni riflettono un'interpretazione conservativa di testi contrattuali redatti in lingua inglese e sottoposti a leggi straniere (l'Affiliate License Agreement di SNOMED CT è regolato dal diritto inglese con giurisdizione esclusiva delle corti inglesi, cl. 15.1–15.2; i *Terms of Use* dell'OMS sono regolati dal diritto svizzero con arbitrato UNCITRAL, §4.10). L'interpretazione di clausole contrattuali estere richiede competenze che esulano da un'analisi documentale.

Alcuni termini non sono stati verificabili in forma primaria: sono elencati al §0.1 e al §17.4. Le condizioni di licenza possono cambiare - la clausola 6.3 dell'Affiliate License Agreement consente al licenziante di variarne i termini con novanta giorni di preavviso, e il §4.8 dei *Terms of Use* dell'OMS riserva all'OMS il diritto di modificarli **senza preavviso**.

**Prima del rilascio v1.0 e prima di qualunque decisione che comporti la distribuzione di contenuto terminologico di terzi, questo documento va sottoposto a un legale abilitato specializzato in proprietà intellettuale e diritto del software.**

