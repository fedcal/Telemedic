---
title: "Protocolli - indice dell'area"
sidebar_position: 0
description: "Come Telemedic parla ciascun protocollo: versioni adottate, profili, garanzie verso chi integra, prove di conformità."
---

# Area protocolli

Questa area descrive **come Telemedic usa i protocolli**, non che cosa sono. La spiegazione
dei protocolli, dei loro concetti e della loro storia sta nella guida dei fondamenti e non
viene ripetuta qui: chi arriva da fuori legga prima
[«Gli standard di interoperabilità»](../10_fondamenti/05-standard-di-interoperabilita.md),
[«FHIR da zero»](../10_fondamenti/06-fhir-da-zero.md),
[«I protocolli, uno per uno»](../10_fondamenti/13-protocolli.md) e, per il tempo reale,
[«WebRTC da zero»](../10_fondamenti/08-webrtc-da-zero.md).

Qui si trovano invece le cose che un integratore, un revisore o un contributore deve poter
leggere senza dedurle dal codice: **quale versione di quale specifica è adottata**, **con
quale motivazione**, **che cosa viene garantito e per quanto tempo**, **che cosa non viene
garantito**, **come si dimostra che un'implementazione è conforme**.

## Che cosa contiene, capitolo per capitolo

| # | Capitolo | Risponde a |
|---|---|---|
| 01 | [Principi di interoperabilità](./01-principi-di-interoperabilita.md) | Perché queste specifiche e non altre; quali versioni sono fissate; che cosa succede quando cambiano; che cosa è promesso a chi integra |
| 02 | [FHIR](./02-fhir.md) | Profili adottati, guide italiane con versione fissata, risorse esposte, ricerche supportate, operazioni, documento di capacità, validazione, errori, concorrenza |
| 03 | [Documenti clinici](./03-documenti-clinici.md) | Il dataset canonico del referto, le serializzazioni sostituibili, le tipologie documentali del fascicolo, i metadati, la firma, il versionamento e la rettifica |
| 04 | [HL7 v2](./04-hl7-v2.md) | Messaggi supportati, trasporto protetto, riconoscimenti, errori, mappatura verso il modello canonico |
| 05 | [IHE](./05-ihe.md) | Profili adottati, attori implementati, transazioni, schema d'insieme |
| 06 | [API di progetto](./06-api-di-progetto.md) | Risorse REST, codici di stato, idempotenza, concorrenza ottimistica, limitazione del traffico, paginazione, errori, versionamento e deprecazione |
| 07 | [Eventi e webhook](./07-eventi-e-webhook.md) | Buste, catalogo degli eventi pubblici, firma, ritentativi, ordine, deduplicazione, contratto verso l'integratore |
| 08 | [Identità e autorizzazione](./08-identita-e-autorizzazione.md) | Profili di autorizzazione, delega fra organizzazioni, propagazione del livello di garanzia, avvio applicativo in contesto clinico |
| 09 | [Tempo reale](./09-tempo-reale.md) | Segnalazione di progetto, negoziazione, credenziali temporanee del relay, verifica della sessione |
| 10 | [Conformità e prove](./10-conformita-e-prove.md) | Strumenti, suite, criteri di accettazione, che cosa si può e non si può dichiarare |

## Le tre affermazioni che reggono tutta l'area

**Prima.** Una versione non dichiarata è una versione non adottata. Ogni specifica citata in
quest'area porta un numero di versione, uno stato di maturità e una data. Dire «FHIR R4»
senza dire «4.0.1» è, in un progetto soggetto a controllo della configurazione, un difetto:
4.0.0 e 4.0.1 differiscono negli invarianti e nelle risorse di conformità generate, e i
validatori si comportano di conseguenza.

**Seconda.** Uno standard citato non è uno standard rispettato. Quest'area distingue in modo
sistematico tre condizioni: ciò che una specifica **impone** (`SHALL`/`MUST`), ciò che
**raccomanda** (`SHOULD`), ciò che è **scelta di progetto** perché la specifica tace o
lascia aperto. Le scelte di progetto sono marcate come tali e non vengono presentate come
conformità.

**Terza.** Una specifica in bozza è una dipendenza con una data di scadenza. Buona parte
delle specifiche che servono a un sistema di telemedicina italiano nel 2026 è in stato di
*trial implementation*, *draft* o *Internet-Draft attivo*: le guide di HL7 Italia sono alla
0.2.0, i profili IHE che servono sono Trial Implementation, gli header per la limitazione
del traffico e per l'idempotenza non sono RFC. Ciò non impedisce di adottarli; impone di
fissarne la versione, di dichiararne lo stato e di programmarne il ricontrollo.

## Convenzioni di lettura

**Marcatori.** `[NV]` segnala un'informazione **non verificata su fonte primaria**. Ogni
occorrenza dichiara a chi va chiesta la verifica. Non esistono in quest'area numeri di RFC,
identificativi di transazione, nomi di campo o valori di codice inventati per completare una
tabella: dove manca il dato, c'è il marcatore.

**Livelli di obbligatorietà.** Quando si riportano parole chiave di una specifica
(`SHALL`, `SHOULD`, `MAY`, `MUST NOT`) sono citate nella lingua originale, perché la
traduzione italiana ne perde la forza normativa.

**Dati.** Tutti gli esempi usano **dati sintetici**. Nomi, codici fiscali, identificativi,
indirizzi e domini negli esempi non corrispondono a persone, strutture o sistemi reali. I
domini `telemedic.example`, `gestionale.integratore.example`, `ehr.example` sono segnaposto
riservati a scopo documentale.

**Riservatezza.** Nessun capitolo nomina aziende, marchi, prodotti commerciali o domini di
potenziali partner. Dove una specifica internazionale contiene identificativi di codice che
coincidono con marchi commerciali di piattaforme di videoconferenza, il fatto è riportato ma
gli identificativi non sono trascritti.

## Rapporto con le altre aree

Quest'area descrive **i contratti sul filo**: che cosa passa fra Telemedic e un sistema
terzo, in quale forma e con quali garanzie. Non descrive come è fatto il sistema dentro -
quello è compito dell'area di architettura - né che cosa il sistema fa dal punto di vista
clinico e organizzativo, che è compito dell'area funzionale e di quella di dominio. Dove un
protocollo impone un vincolo architetturale, il vincolo è dichiarato qui e ripreso lì; dove
un'esigenza architetturale non è ancora decisa, quest'area **non decide al posto di chi
compete** e apre una questione.

Le questioni aperte da quest'area verso le altre sono elencate nel capitolo
[10 - Conformità e prove](./10-conformita-e-prove.md) e riportate nella bacheca fra agenti.
