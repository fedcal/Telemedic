# Log agente G8 - modulo 17 «L'ambiente di sviluppo»

**Data:** 25 agosto 2026
**Deliverable:** `docs/10_fondamenti/17-ambiente-di-sviluppo.md` (blocco E, decisione D35)
**Frontmatter:** `title: L'ambiente di sviluppo` · `sidebar_position: 18` · `description` presente
**Intervallo di numerazione usato in bacheca:** `GUIDA` 190–199 (V-190, V-191, V-192 · Q-190, Q-191, Q-193, Q-194, Q-196)

---

## 1. Conteggio

| Voce | Valore |
|---|---|
| Parole totali del file | **21.019** |
| Parole di sola prosa (esclusi blocchi di codice e righe di tabella) | **≈ 14.260** |
| Requisito minimo del mandato | 8.000 |
| Sezioni di primo livello | 12, più «Cosa devi ricordare» e «Termini introdotti in questo modulo» |
| Sottosezioni | 74 |
| Diagrammi Mermaid | 3 (percorso del primo avvio, NAT costruito a reti separate, albero decisionale della diagnosi) |
| Tabelle | 33 |
| Blocchi di codice | 22 (shell, SQL, Java illustrativo) |
| Voci di glossario | 39 |

---

## 2. Copertura del mandato

| # | Punto del mandato | Sezione del modulo |
|---|---|---|
| 1 | Prerequisiti per intero, versioni minime e ragione di ciascuna; memoria e disco; macchina modesta; differenze fra sistemi operativi | 1.1–1.6 |
| 2 | Primo avvio dal clone al sistema che risponde, con esito atteso di ogni passo; **dove ci si blocca di solito** | 2.1–2.11; **2.12** (17 voci) |
| 3 | Albero del repository: dove sta cosa e perché | 3.1–3.6, con tabella «dove cerco che cosa» in 3.5 |
| 4 | Base dati: avvio, migrazioni versionate, dati di esempio, ripartire da zero, ispezionare | 4.1–4.7 |
| 5 | Dati sintetici: regola assoluta, generazione realistica, codici fiscali non attribuibili, serie plausibili, documenti, **perché i dati troppo puliti sono un problema** | 5.1–5.9, in particolare **5.4**, **5.5**, **5.7** |
| 6 | Videochiamata in locale: perché il caso locale inganna, reti degradate, NAT, verifica del relay, trappole verificate | 6.1–6.8, trappole in **6.7** |
| 7 | Interoperabilità: validazione locale, server terminologico di sviluppo, comportamento con terminologie disattivate | 7.1–7.4, in particolare **7.3** |
| 8 | Test: unità, integrazione, contratto, da estremo a estremo, accessibilità, carico; come si scrive un test che serva | 8.1–8.8 |
| 9 | Controlli che devono passare: che cosa verificano, perché esistono, che cosa fare, **perché non si aggirano** | 9.1–9.5 |
| 10 | Diagnosi: albero decisionale e i cinque guasti frequenti richiesti dal mandato | 10.1–10.7 |
| 11 | Igiene: segreti, ambienti separati, pulizia, cosa non committare, perché la cronologia non si ripulisce | 11.1–11.5 |
| - | Chiusura con «Cosa devi ricordare» (15 punti) e tabella dei termini | Presenti |
| - | Tabella riepilogativa dei punti `[NV]` | Sezione 12 |

**Criterio redazionale applicato.** Il modulo è la versione **didattica e operativa** di
`docs/01_technical/`, non un duplicato: dove il contenuto esiste già nell'area tecnica o in un
altro modulo dei fondamenti, il modulo **rinvia e non ripete**. I rinvii sostanziali sono a
`01-stack-e-motivazioni.md` (criteri C1–C7, versioni minime), `02-backend.md` (regole di
dipendenza, struttura dei moduli), `03-persistenza.md` (schemi, migrazioni, sicurezza a livello
di riga, outbox, registro immutabile), `05-media-e-tempo-reale.md` (relay, contenitore di
registrazione, profili di rete), `08-qualita-e-test.md` (piramide, regole di scrittura, dati
sintetici, copertura, tracciabilità), `09-integrazione-continua-e-rilascio.md` (controlli
G1–G13, riproducibilità, ambienti), più i moduli `03` §10 (regola sui dati reali),
`08` §13 (prove media in locale), `09` §3 (parametri clinici), `11` (fondamenti informatici).

---

## 3. Punti marcati `[NV]` nel modulo

Sono raccolti anche nella sezione 12 del modulo, così che il lettore non debba cercarli.

| # | Oggetto | Sezione | A chi spetta |
|---|---|---|---|
| NV-1 | Nome e forma dello script di verifica dei prerequisiti | 1.2, 2.4 | `TECH` - **Q-190** |
| NV-2 | Gruppi di avvio selettivo dei servizi in composizione e loro nomi | 1.5, 2.6 | `TECH` - **Q-190** |
| NV-3 | Consumo reale di memoria e disco dell'ambiente locale: **non misurato**, nessuna cifra pubblicata | 1.4 | `TECH`, `ROAD` - **Q-191** |
| NV-4 | Versione dell'ambiente di esecuzione dell'interfaccia (dichiarata dal file di blocco, non ancora scritto) | 1.2 | `TECH` |
| NV-5 | Procedura per il certificato dell'origine locale nella prova fra due dispositivi | 1.6 | `TECH` - **Q-190** |
| NV-6 | Elenco e nomi delle variabili della configurazione locale | 2.5 | Definiti dal file di esempio, non ancora scritto |
| NV-7 | Invocazione dello strumento di migrazione e del generatore di dati sintetici | 2.7, 5.8 | `TECH` - **Q-190** |
| NV-8 | Forma definitiva dell'invocazione del costruttore e profilo attivato in locale | 2.8 | `TECH` |
| NV-9 | Porte e percorsi esatti degli endpoint di prontezza e vivacità | 2.8 | Configurazione dell'applicazione |
| NV-10 | Directory delle migrazioni e modulo del generatore, nella tabella «dove cerco che cosa» | 3.5 | `TECH` |
| NV-11 | Compatibilità fra identificativi sintatticamente validi e regola di rilevamento del controllo G10 | 5.4 | `TECH`, `SEC`, `COMP` - **Q-194** |
| NV-12 | Intervalli di indirizzi vietati per la prova di confinamento del nodo di relay | 6.6 | `SEC` - **Q-196** |
| NV-13 | Nome, versione e invocazione degli strumenti di validazione dei profili clinici | 7.1 | `PROTO`, `TECH` - **Q-193** (riprende Q-163) |
| NV-14 | Limiti da misurare: tenant per installazione, intervallo di partizionamento delle serie temporali | 8.7 | Prove di capacità, non eseguite |
| NV-15 | Comando aggregato per eseguire in locale i controlli obbligatori | 9.5 | `TECH` - **Q-190** |

**Nota di metodo.** Il mandato chiedeva comandi realistici e coerenti con l'area tecnica. Il
modulo usa nomi reali **solo** per strumenti che non dipendono da una decisione del progetto -
sistema di controllo di versione, motore di contenitori e sua orchestrazione, client della base
dati, disciplina di coda del kernel, generatore di casualità del sistema - e marca `[NV]`
**ogni** nome di script, variabile, servizio o profilo del progetto non ancora fissato. Non è
stato inventato alcun nome di comando di progetto.

---

## 4. Voci aperte in bacheca (intervallo `GUIDA` 190–199)

### 4.1 Vincoli posti

| # | A | Vincolo, in sintesi |
|---|---|---|
| **V-190** | tutte | L'ambiente di sviluppo deve poter essere avviato **su una macchina disconnessa**: nessun account, nessuna chiave di fornitore, nessun servizio remoto obbligatorio. Corollario operativo di C7 e del divieto sui dati reali. Una procedura di avvio che richieda una registrazione presso un fornitore è un difetto |
| **V-191** | tutte | **Nessuna procedura documentata può contenere l'aggiramento di un controllo obbligatorio.** Se un controllo blocca legittimamente uno sviluppo legittimo, si corregge il controllo con la revisione prevista, non lo si disattiva per la propria proposta. Vale in particolare per la lista di ammissione del controllo terminologico |
| **V-192** | `ARCH`, `TECH`, `FUNZ` | **Marcatore di sinteticità persistito nel dato**, non soltanto noto al generatore: trasforma «questo ambiente contiene dati reali?» da indagine a interrogazione. Va recepito nel modello dati |

### 4.2 Questioni aperte

| # | A | Questione, in sintesi |
|---|---|---|
| **Q-190** | `TECH` | I **sei nomi che un contributore digita il primo giorno** - verifica prerequisiti, gruppi di avvio selettivo, migrazione, generatore, controlli obbligatori in locale, certificato dell'origine locale - non esistono e non vanno inventati |
| **Q-191** | `TECH`, `ROAD` | Consumo di memoria e disco **non misurato**: serve la misura su macchina di riferimento e la dichiarazione del profilo minimo praticabile, altrimenti l'obiettivo di D35 (contribuibilità da chi parte da zero) non è verificabile |
| **Q-193** | `PROTO`, `TECH` | Strumenti di validazione dei profili clinici **eseguibili in locale**: senza, la richiesta di `CONTRIBUTING.md` di validare prima di proporre non è eseguibile. Riprende Q-163 dal lato del contributore |
| **Q-194** | `TECH`, `SEC`, `COMP` | Regola di generazione degli identificativi sintetici e regola di rilevamento di G10 **vanno progettate insieme**: scritte separatamente, o il controllo blocca ogni fixture o non blocca nulla |
| **Q-196** | `SEC` | Intervalli di indirizzi vietati per la prova di confinamento del nodo di relay: **senza l'elenco la prova non è scrivibile** e il vincolo V-10 resta una dichiarazione |

### 4.3 Risposta data a una voce indirizzata a `GUIDA`

**Q-26** (`COMP` → `ORCH`, `GUIDA`) - collegamenti che escono da `docs/`. Aggiunta nota di
`GUIDA` senza cambiare stato, perché la decisione è di `ORCH`: il problema non riguarda un solo
collegamento, ma almeno quattro documenti di regole verso cui la guida rinvia in modo
**sostanziale** - il modulo 00 dichiara la guida prerequisito di `CONTRIBUTING.md` e il modulo
17 §2.2 impone la lettura dei tre documenti di regole come passo zero del primo avvio. La
**duplicazione dentro `docs/` va esclusa**: due copie di un documento che dichiara destinazione
d'uso e limiti d'uso sono due documenti che divergeranno, e la divergenza documentale è un
difetto regolatorio (stessa ragione del controllo G8). Raccomandazione: indirizzo assoluto verso
il repository, con verifica di raggiungibilità dentro G9.

Le altre voci `GUIDA` aperte (Q-01, Q-02, Q-03, Q-06, Q-07, Q-11, Q-12, Q-13, Q-14, Q-15)
riguardano aree diverse da questa e **non sono state toccate**.

---

## 5. Vincoli altrui recepiti, non contraddetti

| Vincolo | Dove è recepito |
|---|---|
| **V-03** - sistema pienamente funzionale senza SNOMED CT | §7.2, §7.3: la configurazione predefinita delle prove è quella senza, ed è ciò che tiene viva la modalità degradata |
| **V-09** - l'assenza di dato è informazione | §4.6, §5.5: lo stato «attesa, non pervenuta» è una riga; il generatore deve produrre aderenza incompleta |
| **V-10** - relay 4.17.2, isolamento di rete in uscita come difesa **primaria** | §6.6 |
| **V-11** e **V-115** - contenitore di registrazione negoziato a runtime | §6.7, con la conseguenza operativa: **nessuna prova può asserire un formato fisso** |
| **V-12** - nessuna soglia tecnica imposta dalla normativa | §6.8, §8.7: i limiti sono da misurare e dichiarare, non da citare |
| **V-111** (`TECH`) - espandi e contrai su ogni migrazione | §4.3 |
| **V-112** (`TECH`) - contesto di tenant con `SET LOCAL` dentro la transazione | §4.6, §4.7, §10.3, e punto 4 di «Cosa devi ricordare» |
| **R0** - riservatezza | Nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale partner. I soli nomi propri usati sono strumenti generali e sistemi operativi, coerentemente con i moduli 08 e 13 e con l'area tecnica |

Nessun vincolo altrui risulta contraddetto.

---

## 6. Termini per il glossario (modulo 19)

39 voci, già presenti nella tabella «Termini introdotti in questo modulo» del modulo 17 e da
riversare nel glossario bilingue con il termine inglese corrispondente.

Ambiente effimero · Attestazione di origine del contributo · Cache non persistita · Contesto
sicuro · Contenitori effimeri · Controllo obbligatorio (di pipeline) · Copertura per mutazione ·
Costruzione riproducibile · Dati avversi (profilo) · Dato sintetico · Determinismo del
generatore · Disciplina di coda (emulazione di rete) · Distinta dei materiali · Doppio di prova ·
Espandi e contrai · Fabbrica di dati di prova · Fascia della pipeline · File di blocco delle
dipendenze · Identificativo di costruzione · Impronta della migrazione · Isolamento fra tenant
(prove di) · Lista di ammissione (del controllo terminologico) · Loopback · Marcatore di
sinteticità · Modalità degradata (del gateway terminologico) · Ordinale opaco di tenant · Outbox
transazionale · Politica di trasporto forzata al relay · Profilo di dimensione del dataset ·
Prontezza e vivacità · Prova a contratto · Prova che verifica un divieto · Rotazione del segreto ·
Seme del generatore · Sicurezza a livello di riga · Sorgente sintetica di media · Stringa breve
di verifica delle chiavi · Tracciabilità requisito → prova

**Nota per chi cura il modulo 19**: sette di queste voci hanno un corrispondente inglese
consolidato che **non va tradotto letteralmente** - *expand and contract*, *bill of materials*,
*test double*, *mutation coverage*, *row level security*, *liveness / readiness*, *contract
test*. Le altre vanno tradotte con la definizione, non con il calco.

---

## 7. Collegamenti in uscita e stato dei riferimenti

| Destinazione | Stato |
|---|---|
| `docs/01_technical/00-indice.md`, `01`, `02`, `03`, `05`, `08`, `09` | Esistono |
| `docs/10_fondamenti/03-il-dato-clinico.md`, `08-webrtc-da-zero.md`, `09-fondamenti-clinici.md` | Esistono |
| `docs/10_fondamenti/18-come-contribuire-per-area.md` | **Non ancora scritto.** Rinvio ammesso durante la stesura, **bloccante prima del primo deploy** (D52, controllo G9) |
| `CONTRIBUTING.md`, `NOT-A-MEDICAL-DEVICE.md`, `THIRD-PARTY-TERMINOLOGY.md` | Esistono, ma **escono da `docs/`**: rientrano in Q-26 |

---

## 8. Che cosa questo modulo dichiara di non fare

- **Non è il manuale di installazione** destinato a chi mette in esercizio il sistema: quello ha
  destinatari, prerequisiti e obblighi diversi e appartiene alla documentazione di distribuzione.
- **Non è il primo avvio dell'integratore** (`docs/07_integration/02-primo-avvio.md`): la
  distinzione è dichiarata esplicitamente in §3.3 perché è una confusione ricorrente.
- **Non ripete i fondamenti**: rete e media stanno nel modulo 08, il dato clinico nel 03, i
  parametri nel 09, i sistemi distribuiti nell'11.
- **Non pubblica cifre non misurate**: memoria, disco, quota di sessioni instradate dal relay,
  numero di tenant per installazione e intervallo di partizionamento restano `[NV]`.
