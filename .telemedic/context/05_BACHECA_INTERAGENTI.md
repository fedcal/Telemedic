# Bacheca inter-agenti

> **Canale di comunicazione fra agenti. Vincolante.**
> Nessun agente lavora slegato dagli altri. Questa bacheca è il modo in cui gli agenti si
> pongono domande, si rispondono e si vincolano a vicenda.

## Protocollo — obbligatorio per ogni agente

**All'inizio del lavoro:**
1. Leggi `00_PROJECT_BRIEF.md` (decisioni e regola R0) e `04_BASELINE_ARCHITETTURALE.md`.
2. Leggi **questa bacheca per intero**.
3. **Rispondi a ogni voce `APERTA` indirizzata alla tua area** che sei in grado di risolvere,
   cambiandone lo stato in `RISOLTA` e scrivendo la risposta con la fonte. Se non sei in grado,
   lascia `APERTA` e aggiungi una nota sul perché.

**Durante il lavoro:**
4. Se una tua scelta **vincola un'altra area**, scrivila qui come `VINCOLO`. Le altre aree
   sono tenute a rispettarla o a contestarla qui, non a ignorarla.
5. Se ti serve una decisione che non è tua, apri una voce `APERTA` indirizzata all'area
   competente. **Non decidere al posto di un'altra area e non inventare.**

**Alla fine del lavoro:**
6. Verifica di non aver contraddetto un `VINCOLO` altrui. Se lo hai fatto, dichiaralo.
7. Riepiloga nel tuo `log-<sigla>.md` le voci che hai aperto, risolto e i vincoli che hai posto.

**Regole di scrittura**
- Una voce per riga di tabella. Non riscrivere le voci altrui: cambia solo lo stato e aggiungi
  la risposta.
- Aree: `ARCH` architettura · `TECH` tecnica · `FUNZ` funzionale · `PROTO` protocolli ·
  `DOM` dominio · `SEC` sicurezza · `INTEG` integrazione · `COMP` conformità · `ROAD` roadmap ·
  `GUIDA` guida dei fondamenti · `PROD` prodotto e comunicazione · `ORCH` orchestratore.
- Stati: `APERTA` · `RISOLTA` · `VINCOLO` · `CONTESTATA`.
- **Se una domanda richiede una decisione del committente e non è risolvibile con le fonti,
  segnala `→ ORCH`**: viene portata alla persona, non decisa d'ufficio.

---

## Vincoli in vigore

| # | Da | A | Vincolo | Stato |
|---|---|---|---|---|
| V-01 | ORCH | tutte | `Encounter` e `MediaSession` sono aggregati distinti. Nessuna area può unirli | VINCOLO |
| V-02 | ORCH | tutte | Nessuna soglia clinica cablata: sono configurazione per assistito | VINCOLO |
| V-03 | ORCH | tutte | Il sistema è pienamente funzionale senza SNOMED CT. Nessun percorso principale può richiederlo | VINCOLO |
| V-04 | ORCH | tutte | Il registro immutabile è a catena di hash e conservazione separata. Il versionamento delle entità non lo sostituisce | VINCOLO |
| V-05 | ORCH | tutte | Il progetto è conforme e verificabile su SPID/CIE/TS-CNS, **non accreditato**: il fornitore di servizi è chi installa | VINCOLO |
| V-06 | ORCH | tutte | Il progetto non appone marcatura CE. Il materiale regolatorio è manuale per chi certifica | VINCOLO |
| V-07 | ORCH | tutte | Il contenuto dei documenti per il fascicolo si modella come dataset canonico; le serializzazioni sono sostituibili | VINCOLO |
| V-08 | ORCH | `PROD`, `FUNZ`, `INTEG` | Le assicurazioni sono **sempre** escluse dall'accesso al FSE (art. 15 c. 4, DM 7 settembre 2023). Il pagatore non è un consultatore | VINCOLO |
| V-09 | ORCH | tutte | L'assenza di dato è informazione clinica: il silenzio non è mai trattato come normalità | VINCOLO |
| V-10 | `GUIDA` | `SEC`, `TECH` | Server di relay: versione minima 4.17.2 e isolamento di rete in uscita come difesa **primaria** | VINCOLO |
| V-11 | `GUIDA` | `TECH`, `FUNZ` | Il contenitore di registrazione va negoziato a runtime, mai assunto | VINCOLO |
| V-12 | `GUIDA` | tutte | Nessuna soglia tecnica è imposta dalla normativa italiana: i valori del progetto sono specifica di prodotto, mai conformità | VINCOLO |

---

## Questioni aperte

| # | Da | A | Questione | Stato |
|---|---|---|---|---|
| Q-01 | `GUIDA` | `COMP` | Confini di perimetro da allineare alla dichiarazione di destinazione d'uso: nessun giudizio interpretativo negli avvisi, nessuna verifica di interazioni farmacologiche, nessuna prognosi, nessun miglioramento d'immagine | APERTA |
| Q-02 | `GUIDA` | `ARCH` | Il catalogo delle prestazioni è dato di riferimento incluso o esclusivamente riferito dal tenant? I cataloghi regionali sono 21 cicli indipendenti | APERTA |
| Q-03 | `GUIDA` | `ARCH` | Separazione fra stringhe di internazionalizzazione del progetto e `Coding.display` ufficiale: come si realizza concretamente | APERTA |
| Q-04 | `GUIDA` | `SEC`, `ARCH` | Classificare il terminology server come componente di terze parti e verificarne la compatibilità con il vincolo di sovranità | APERTA |
| Q-05 | `GUIDA` | `INTEG` | Se il contesto di autenticazione richiesto è statico per fornitore di identità, servono due istanze per ciascun fornitore SPID: confermare l'impatto sull'architettura di federazione | APERTA |
| Q-06 | `GUIDA` | `ARCH`, `TECH` | Divergenza verificata dell'URI di sistema del codice fiscale fra guide italiane: quale si adotta e come si gestisce la traduzione al confine | APERTA |
| Q-07 | `GUIDA` | `COMP` | Template CDA2, codici documentali e metadati di indicizzazione per le dieci tipologie FSE non sono pubblicamente disponibili: a chi si richiedono e con che tempi | APERTA |
| Q-08 | ORCH | `ARCH` | La modalità con registrazione lato server e la cifratura fino agli estremi sono incompatibili: confermare la soluzione a due modalità e i suoi effetti sul modello dati | APERTA |
| Q-09 | ORCH | `ROAD` | Il termine di adeguamento alle misure di sicurezza è soggettivo per ciascun cliente: la roadmap non può cablare una data unica. Come si parametrizza | APERTA |
| Q-10 | ORCH | `COMP` | Tabella artefatto → regime applicabile: quali artefatti ricadono nel regolamento sulla resilienza informatica e quali sono coperti dalla disciplina dei dispositivi medici | APERTA |
| Q-11 | `GUIDA` | `COMP`, `ARCH` | Le **scale e i questionari clinici validati hanno licenze proprie**: la policy terminologica va estesa formalmente a scale e punteggi **prima** di scrivere il primo motore di calcolo | APERTA |
| Q-12 | `GUIDA` | `FUNZ` | 58 conseguenze progettuali su cronicità, allarmi e sicurezza del paziente attendono identificativi di requisito. Almeno sei aree risultano scoperte: piano di telemonitoraggio versionato, finestra di attesa, escalation con fallimento dichiarato, sorveglianza del volume atteso, copertura oraria dichiarata, tracciabilità del calcolo | APERTA |
| Q-13 | `GUIDA` | `COMP` | Due scenari d'uso pericolosi individuati nel modulo sulla sicurezza del paziente vanno inseriti nel file di gestione del rischio con gravità da rivalutare | APERTA |
| Q-14 | `GUIDA` | `PROD`, `FUNZ` | **La copertura oraria dichiarata è un requisito di sicurezza**: un servizio mal dichiarato è più pericoloso dell'assenza di servizio, perché produce falsa rassicurazione. Va trattato come requisito, non come parametro commerciale | APERTA |
| Q-15 | `GUIDA` | `ARCH`, `PROTO` | Dieci scelte enunciate come proposta di progetto meritano un ADR: versione nel percorso, codice di precondizione richiesta sulle risorse cliniche, non trovato invece di vietato, ritenzione delle chiavi di idempotenza, doppia emissione delle intestazioni di limitazione, dodici mesi di preavviso di dismissione, payload magro nei webhook, politica di ritentativo, versionamento del tipo degli eventi, introspezione sulle operazioni ad alto impatto | APERTA |
| Q-16 | `GUIDA` | `SEC`, `TECH` | La protezione contro le richieste indirizzate a risorse interne va implementata **una volta sola** in un componente condiviso, non ripetuta per ogni punto di uscita | APERTA |
| Q-17 | `GUIDA` | `TECH`, `COMP` | La tabella riassuntiva dei protocolli è di fatto un **inventario di partenza dei componenti di terze parti**: va usata come base invece di ricostruirla | APERTA |

---

## Correzioni verificate da recepire in tutte le aree

| # | Correzione | Vale per |
|---|---|---|
| C-01 | `Deprecation` è **RFC 9745**, Standards Track, marzo 2025 | `PROTO`, `INTEG` |
| C-02 | `Idempotency-Key` è una bozza **scaduta e archiviata**: non è uno standard e non va presentata come tale | `PROTO`, `INTEG`, `TECH` |
| C-03 | La forma a tre intestazioni `RateLimit-*` **non è mai stata standard ed è superata**: oggi `RateLimit` e `RateLimit-Policy` | `PROTO`, `INTEG` |
| C-04 | `Problem Details` è **RFC 9457**, non 7807 | `PROTO`, `TECH` |
| C-05 | TCP è **RFC 9293**; HTTP/1.1 è **RFC 9112** | `PROTO`, `TECH` |
| C-06 | RFC 9421 *HTTP Message Signatures* **non** definisce `Content-Digest`, che è **RFC 9530** | `PROTO`, `SEC`, `INTEG` |
| C-07 | In FHIR R4 non esistono `SubscriptionStatus` né l'estensione di backport dell'argomento | `PROTO`, `INTEG` |
| C-08 | Bulk Data è **3.0.0**; attenzione a non citare la build continua come se fosse pubblicata | `PROTO`, `INTEG` |
| C-09 | SSE non è una RFC e OpenAPI non è una RFC: non attribuire loro un numero | `PROTO`, `TECH` |
| C-10 | La busta CloudEvents **vieta** l'attributo di tipo di contenuto in forma di intestazione dedicata | `PROTO`, `ARCH` |

