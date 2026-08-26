---
title: Sicurezza - indice e orientamento
sidebar_position: 1
description: Come è organizzata l'area di sicurezza di Telemedic, che cosa contiene e che cosa rinvia altrove, quali sono i suoi presupposti vincolanti e come si legge a seconda del ruolo di chi la consulta.
---

# Sicurezza - indice e orientamento

> **Questa area non è un elenco di misure.** Un elenco di misure è utile a chi ha già in testa
> il modello che le giustifica ed è dannoso a chi non ce l'ha, perché induce a credere che
> applicare la misura equivalga a ottenere la proprietà. Qui ogni misura arriva dopo il bene
> che protegge, l'avversario da cui lo protegge e la conseguenza - **clinica**, non solo
> informatica - del suo fallimento. Ogni misura porta con sé la fonte che la richiede.

## 1. Il presupposto: che cos'è questo sistema dal punto di vista della sicurezza

Telemedic è un componente software che media un **atto sanitario** fra due persone che non
sono nello stesso luogo. Da questo discendono tre fatti che governano l'intera area e che non
sono negoziabili.

**Il primo.** Non esistono, in questo sistema, dati «non sensibili» accanto a dati sensibili.
Il fatto stesso che una persona abbia una sessione con uno specialista è **dato relativo alla
salute** ai sensi dell'art. 4, punto 15, del Regolamento (UE) 2016/679, prima ancora e
indipendentemente dal contenuto della sessione. Un registro che dica «l'assistito X ha avuto
una sessione con il professionista Y il giorno Z» rivela informazioni sullo stato di salute
di X anche se non contiene una sola parola di anamnesi. I metadati di sessione sono quindi
un bene protetto di prima classe, non un sottoprodotto tecnico. Il capitolo
[01 - Modello di minaccia](./01-modello-di-minaccia.md) parte da qui.

**Il secondo.** L'avversario primario non è il criminale esterno: è **l'insider**.
L'abuso dei privilegi legittimamente concessi - l'utente che dispone dell'autorizzazione
tecnica per accedere a un dato e la usa per uno scopo estraneo alle necessità funzionali - è
una fattispecie **espressamente prevista dall'autorità nazionale per la cybersicurezza** come
tipologia autonoma di incidente significativo per i soggetti essenziali, ed è la fattispecie
dei provvedimenti sanzionatori dell'autorità di protezione dei dati in ambito sanitario.
Un'architettura di sicurezza costruita sul perimetro non intercetta questo avversario, perché
questo avversario è già dentro il perimetro e ha le credenziali giuste.

**Il terzo.** Il fallimento di una misura di sicurezza in questo sistema produce **conseguenze
cliniche**, non solo perdita di riservatezza. Una sessione degradata è una visita non conclusa.
Un registro alterato è l'impossibilità di accertare un accesso indebito. Una copertura oraria
dichiarata male è una falsa rassicurazione, che è più pericolosa dell'assenza dichiarata di
servizio. Il modello di minaccia di quest'area valuta le conseguenze su questa scala, non
sulla scala della sola perdita di dati.

## 2. Che cosa quest'area non contiene

Quest'area **non ripete i fondamenti**. Chi non ha familiarità con i concetti sottostanti
trova la trattazione completa nella guida dei fondamenti, e quest'area vi rinvia invece di
riscriverla:

| Se non hai familiarità con… | Leggi prima |
|---|---|
| Riservatezza, integrità, disponibilità, autenticità, non ripudio, tracciabilità: che cosa significano con precisione e in che cosa differiscono | [10 §12 - Crittografia e sicurezza, §1](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Che cos'è un modello di minaccia, che cosa sono STRIDE, superficie di attacco, confine di fiducia | [10 §12 - Crittografia e sicurezza, §2](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Cifratura simmetrica e asimmetrica, modalità operative, cifratura autenticata, gestione delle chiavi | [10 §12 - Crittografia e sicurezza, §§3-4](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Funzioni di hash, HMAC, catene di hash, firma digitale, infrastruttura a chiave pubblica, revoca, marca temporale | [10 §12 - Crittografia e sicurezza, §§5-6](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Autenticazione, autorizzazione, fattori, sessione, ruoli e attributi, rottura del vetro | [10 §12 - Crittografia e sicurezza, §8](../10_fondamenti/12-crittografia-e-sicurezza.md) |
| Perché una videochiamata è un problema difficile: attraversamento delle reti, segnalazione, relay, degradazione | [10 §08 - WebRTC da zero](../10_fondamenti/08-webrtc-da-zero.md) |
| Identificatori dell'assistito in Italia, identità del professionista, domini di attribuzione | [10 §04 - Identità e anagrafiche](../10_fondamenti/04-identita-e-anagrafiche.md) |
| Il quadro regolatorio nella sua interezza: dispositivi medici, qualità, ciclo di vita | [10 §15 - Regolatorio da zero](../10_fondamenti/15-regolatorio-da-zero.md) |
| I protocolli uno per uno: OAuth, PKCE, scambio di token, firma dei messaggi HTTP, impronta del corpo | [10 §13 - I protocolli](../10_fondamenti/13-protocolli.md) |

Quest'area presuppone quei moduli. Dove un concetto vi compare già, qui compare solo la sua
**forma specifica in questo sistema** e la differenza è dichiarata.

Quest'area inoltre **non contiene**:

- il percorso di certificazione e il fascicolo regolatorio, che stanno in `docs/08_compliance/`;
- il contratto delle interfacce verso terzi, che sta in `docs/07_integration/`;
- le scelte di architettura del sistema, che stanno in `docs/02_architecture/`, e verso cui
  quest'area apre questioni invece di deciderle;
- la pianificazione temporale, che sta in `docs/09_roadmap/`.

## 3. I dieci capitoli

| # | Capitolo | Che cosa risponde |
|---|---|---|
| [01](./01-modello-di-minaccia.md) | **Modello di minaccia** | Che cosa si protegge, da chi, con quale conseguenza clinica se la protezione cede |
| [02](./02-identita-e-accessi.md) | **Identità e accessi** | Chi è chi, con quale garanzia, chi può fare che cosa, e che cosa succede quando la garanzia è riferita da un terzo invece che verificata |
| [03](./03-protezione-dei-dati.md) | **Protezione dei dati** | Cifratura in transito e a riposo, chiavi e loro rotazione, i punti in cui il dato è comunque in chiaro, minimizzazione, conservazione e cancellazione |
| [04](./04-tracciamento.md) | **Tracciamento** | Il registro immutabile: che cos'è, che cosa non è, che cosa contiene, che cosa non deve contenere, per quanto si conserva, come si esporta e come si dimostra che non è stato alterato |
| [05](./05-sicurezza-del-tempo-reale.md) | **Sicurezza del tempo reale** | Il media: cifratura fino agli estremi, verifica delle chiavi, relay, la modalità con registrazione e ciò a cui obbliga |
| [06](./06-sicurezza-applicativa.md) | **Sicurezza applicativa** | Validazione ai confini, sessioni, intestazioni, caricamento file, iniezioni, autorizzazione a livello di oggetto, limitazione del traffico, mediatore unico di uscita |
| [07](./07-catena-di-fornitura.md) | **Catena di fornitura** | Distinta dei materiali, dichiarazioni di esposizione, divulgazione coordinata, firma degli artefatti, classificazione dei componenti di terze parti |
| [08](./08-quadro-normativo-e-misure.md) | **Quadro normativo e misure** | Quali norme si applicano, a chi, entro quando, e come si compongono quando confliggono |
| [09](./09-ripartizione-delle-responsabilita.md) | **Ripartizione delle responsabilità** | Misura per misura: che cosa fa il progetto, che cosa fa chi installa, che cosa è condiviso |
| [10](./10-risposta-agli-incidenti.md) | **Risposta agli incidenti** | I quattro orologi distinti, che non vanno confusi, e le capacità che il prodotto deve fornire perché chi installa possa rispettarli |

## 4. Percorsi di lettura

**Se sei un responsabile della sicurezza informatica di una struttura sanitaria** e devi
decidere se questo prodotto ti aiuta o ti complica gli adempimenti: leggi
[08](./08-quadro-normativo-e-misure.md), poi [09](./09-ripartizione-delle-responsabilita.md),
poi [10](./10-risposta-agli-incidenti.md). In quest'ordine. Il capitolo 09 esiste
specificamente per evitare che tu creda di essere coperto dove non lo sei.

**Se sei un responsabile della protezione dei dati**: [01](./01-modello-di-minaccia.md),
[03](./03-protezione-dei-dati.md), [04](./04-tracciamento.md),
[05 §5](./05-sicurezza-del-tempo-reale.md) sulla modalità con registrazione.

**Se sei uno sviluppatore che contribuisce al progetto**:
[01](./01-modello-di-minaccia.md), [06](./06-sicurezza-applicativa.md),
[02](./02-identita-e-accessi.md), [07](./07-catena-di-fornitura.md).

**Se sei un integratore** che incorpora Telemedic nel proprio prodotto:
[02](./02-identita-e-accessi.md) - in particolare la distinzione fra autenticazione eseguita e
riferita -, [06](./06-sicurezza-applicativa.md), [07](./07-catena-di-fornitura.md),
[09](./09-ripartizione-delle-responsabilita.md), e l'area di integrazione per il contratto
delle interfacce.

**Se stai valutando un'offerta in una procedura di gara**: [09](./09-ripartizione-delle-responsabilita.md)
è la tabella da mettere accanto al capitolato; [07](./07-catena-di-fornitura.md) contiene gli
artefatti che la diligenza dovuta verso il fornitore richiede.

## 5. Convenzioni di quest'area

**Marcatura `[NV]` - non verificato.** Quest'area distingue rigorosamente tre stati:
ciò che una fonte primaria **stabilisce** (con l'articolo o la sezione citata), ciò che è
**prassi accertata**, e ciò che è **proposta del progetto**. Ciò che non è stato verificato su
fonte primaria porta la marcatura `[NV]` e l'indicazione di a chi va chiesto. **Non si inventa
nulla**, e in particolare:

- **nessun parametro crittografico è inventato**. Dove servirebbe una lunghezza di chiave, un
  algoritmo, una durata di validità, quest'area rinvia alle raccomandazioni europee e nazionali
  vigenti e marca `[NV]` ciò che non ha letto sul testo. Il capitolo
  [03](./03-protezione-dei-dati.md) spiega perché questa è una scelta di merito e non di
  prudenza redazionale;
- **nessun identificativo di vulnerabilità è citato se non è stato letto sulla fonte che lo
  pubblica**. Il capitolo [05](./05-sicurezza-del-tempo-reale.md) descrive i difetti del server
  di relay per **meccanismo e versione di correzione** - che è la forma utile a chi deve decidere
  la versione minima da distribuire - e rinvia per gli identificativi puntuali alla verifica
  documentata in `.telemedic/research/B3-verifica-coturn-webrtc.md`, condotta su banca dati
  pubblica delle vulnerabilità e su avvisi del progetto a monte. Gli identificativi cambiano
  stato e valutazione nel tempo: un documento che li cablasse invecchierebbe peggio della
  descrizione del meccanismo;
- **nessun requisito puntuale delle misure di sicurezza di base dell'autorità nazionale è
  citato testualmente** prima che gli allegati di dettaglio siano stati letti riga per riga.
  Il capitolo [08](./08-quadro-normativo-e-misure.md) cita i **codici** delle misure, che sono
  pubblici e verificati, e marca `[NV]` il contenuto dei singoli requisiti. È la questione
  Q-151 della bacheca inter-agenti.

**Nessun segreto negli esempi.** Ogni esempio di configurazione, token o chiave usa
segnaposto espliciti nella forma `${NOME_DELLA_VARIABILE}` o `<descrizione>`. Nessun valore
d'esempio è un valore utilizzabile. Nessun dato personale, nemmeno inventato in forma
realistica: gli identificativi degli esempi sono opachi.

**Diagrammi in Mermaid**, blocchi di codice con linguaggio dichiarato, riferimenti incrociati
con collegamenti relativi.

## 6. I vincoli che quest'area impone alle altre

Le scelte di quest'area che vincolano altre aree sono pubblicate nella bacheca inter-agenti e
riportate qui per comodità di lettura. Un'area che le contraddica deve contestarle in bacheca,
non ignorarle.

| # | Vincolo | Dove è motivato |
|---|---|---|
| **V-150** | Il registro immutabile e i log applicativi **non contengono contenuto clinico**; i log di diagnostica non portano identificativi diretti dell'assistito | [04 §3](./04-tracciamento.md) |
| **V-151** | Il servizio esterno di terminologia **non riceve identificativi dell'assistito**; nessuna cache persistita su disco | [03 §6](./03-protezione-dei-dati.md), [07 §7](./07-catena-di-fornitura.md) |
| **V-152** | Conservazione: **24 mesi** per i log di tracciabilità, **12 mesi** per i dati di accesso e autenticazione | [04 §5](./04-tracciamento.md) |
| **V-153** | L'**accesso d'emergenza è requisito funzionale**: motivazione libera obbligatoria, finestra e perimetro limitati, notifica, riesame con esito registrato | [02 §10](./02-identita-e-accessi.md) |
| **V-154** | Un livello di autenticazione **riferito da un integratore** va marcato come tale e **non** soddisfa i requisiti di autenticazione forte ex art. 64 CAD | [02 §4](./02-identita-e-accessi.md) |
| **V-155** | Nessuna metrica infrastrutturale del relay può essere etichettata con l'identificativo di sessione | [05 §7](./05-sicurezza-del-tempo-reale.md) |
| **V-156** | Il progetto **non dichiara** versioni di protocollo né suite crittografiche negoziate: le **misura per sessione e le registra** | [03 §2](./03-protezione-dei-dati.md), [05 §2](./05-sicurezza-del-tempo-reale.md) |
| **V-157** | **Mediatore unico di uscita**: nessun componente applicativo apre connessioni verso destinazioni derivate da un dato in ingresso; l'uscita è negata a livello di rete a tutti tranne che al mediatore | [06 §8](./06-sicurezza-applicativa.md) |

E i vincoli altrui che quest'area recepisce senza discuterli: **V-04** (il registro immutabile
è a catena di impronte e conservazione separata; il versionamento delle entità non lo sostituisce),
**V-05** (il progetto è conforme e verificabile, **non accreditato**), **V-06** (il progetto non
appone marcatura CE; il ruolo di fabbricante sarà assunto dal soggetto da costituire), **V-10** (server di relay: versione minima 4.17.2 e isolamento di rete in
uscita come difesa primaria), **V-11** (contenitore di registrazione negoziato a runtime),
**V-12** (nessuna soglia tecnica è imposta dalla normativa italiana), **V-21** (nessun contenuto
clinico nei messaggi in uscita), **V-22** (firma asimmetrica dei messaggi in uscita), **V-25**
(il livello di garanzia propagato è quello richiesto, non quello asserito).
