# log-SEC — Area sicurezza informatica

**Agente**: SEC-2 (esecuzione). L'istruttoria era già stata condotta e validata sulle fonti da
un agente precedente privo di strumenti di scrittura; questo agente l'ha **eseguita**, non
rifatta, verificando sulle fonti soltanto ciò che ha citato testualmente.

**Data**: 25 agosto 2026 · **Percorso**: `docs/06_security/` · **Undici file**

---

## 1. Deliverable prodotti

| File | Parole | Contenuto |
|---|---:|---|
| `00-indice.md` | 1.879 | Orientamento, presupposti vincolanti, percorsi di lettura per profilo, convenzioni di marcatura `[NV]`, elenco dei vincoli imposti e recepiti |
| `01-modello-di-minaccia.md` | 4.015 | Cinque beni, sei classi di avversario con **l'insider come primario**, confini di fiducia, **quindici minacce con la conseguenza clinica** accanto a quella informatica, rischi residui dichiarati, forma della prova |
| `02-identita-e-accessi.md` | 4.616 | Livelli di garanzia e corrispondenza ISO/IEC 29115, livello in `acr` e mai in `act`, **eseguita vs riferita** con marcatore proprietario, realm broker, registro di fiducia unico, **i tre difetti del prodotto di federazione come rischi ISO 14971**, revoca a **fallimento chiuso**, autorizzazione sulla relazione di cura, accesso d'emergenza |
| `03-protezione-dei-dati.md` | 4.049 | Regola di non invenzione dei parametri crittografici, obbligo dell'Accordo Stato-Regioni sulle quattro categorie, misurazione invece di dichiarazione, gerarchia di chiavi a tre livelli, **inventario onesto dei punti in chiaro**, minimizzazione per assenza di dato, conservazione e **cancellazione differita sui backup** |
| `04-tracciamento.md` | 3.230 | Perché il versionamento **non** è un registro, catena di hash e conservazione separata con i due limiti dichiarati, **cosa non si registra**, 24/12 mesi, esportazione con impronta entro il giorno successivo, orologio e sequenza, registro come strumento di rilevazione, **accesso al registro stesso** |
| `05-sicurezza-del-tempo-reale.md` | 3.776 | **Nessuna rotazione entro la sessione** con fonte, SAS obbligatoria perché l'alternativa è monobrowser e ferma dal 2018, relay con **4.17.2 e isolamento in uscita primario** più i **quattro corollari controintuitivi**, modalità con registrazione e i suoi otto obblighi, metriche (V-155), degradazione |
| `06-sicurezza-applicativa.md` | 3.597 | Validazione a schema, sessioni e intestazioni, nove famiglie di iniezione, **autorizzazione a livello di oggetto con prova negativa fra tenant e controllo automatico di copertura**, caricamento file, limitazione, **mediatore unico di uscita** |
| `07-catena-di-fornitura.md` | 3.057 | Distinta dei materiali come **obbligo** con contenuto minimo, il lettore non tecnico della distinta, dichiarazioni di esposizione, sviluppo sicuro, divulgazione coordinata, classificazione dei componenti, **chiusura di Q-04 riportata per esteso**, firma e provenienza |
| `08-quadro-normativo-e-misure.md` | 3.993 | **Termine soggettivo** dei diciotto mesi, struttura delle misure senza citarne i requisiti, **esclusione per prodotto e non per progetto**, **conflitto riconosciuto con misure compensative a carico del fornitore**, matrice di sovrapposizione, sette controlli a massimo rendimento |
| `09-ripartizione-delle-responsabilita.md` | 3.012 | Avvertimento in testa, **tutte e 43 le misure** ripartite P/D/P+D con il contributo del progetto, riepilogo 5/20/18, sedici adempimenti interamente di chi installa, dodici artefatti consegnati |
| `10-risposta-agli-incidenti.md` | 3.224 | **I quattro orologi e il quinto**, il termine che decorre dall'**acquisizione dell'evidenza**, obblighi contrattuali verso chi installa, la tipologia che dipende da un numero scelto dal cliente, processo, riesame, dieci capacità verificabili |
| **Totale** | **38.448** | Contro un minimo richiesto di 25.000 |

---

## 2. Vincoli posti (intervallo riservato `SEC` 150–159)

| # | A | Sintesi |
|---|---|---|
| V-150 | tutte | Registro e log **senza contenuto clinico**; log di diagnostica senza identificativi diretti dell'assistito |
| V-151 | `TECH`, `ARCH`, `DOM` | Terminologia esterna **senza identificativi dell'assistito**; nessuna cache su disco |
| V-152 | tutte | **24 mesi** tracciabilità, **12 mesi** accesso e autenticazione |
| V-153 | `FUNZ`, `TECH` | **Accesso d'emergenza è requisito funzionale**: motivazione libera, finestra e perimetro limitati, notifica, riesame con esito registrato |
| V-154 | `INTEG` | Livello **riferito** marcato come tale e **non** sufficiente per l'autenticazione forte ex art. 64 CAD |
| V-155 | `TECH`, `ROAD` | Nessuna metrica infrastrutturale del relay etichettata con l'identificativo di sessione |
| **V-156** *(nuovo)* | `TECH`, `PROD`, `COMP` | **Non si dichiarano versioni di protocollo né suite negoziate: si misurano per sessione e si registrano** |
| **V-157** *(nuovo)* | `ARCH`, `TECH`, `INTEG` | **Mediatore unico di uscita**, con negazione di rotta a livello di rete, ordine dei quattro controlli, cinque punti di uscita, esclusione motivata del relay, **una sola** suite di prove di abuso |

I due vincoli nuovi recepiscono la comunicazione dell'orchestratore ricevuta a lavoro avviato.
Nessun vincolo altrui è stato contraddetto. Recepiti senza discussione: V-04, V-05, V-06, V-09,
V-10, V-11, V-12, V-21, V-22, V-23, V-25.

---

## 3. Questioni chiuse

| # | Esito |
|---|---|
| **Q-04** | **Chiusa.** Il terminology server è componente di terze parti **a runtime**: (a) fuori dal percorso principale; (b) se fuori UE è trasferimento nel momento in cui riceve dati riferibili — quindi **nessun identificativo dell'assistito** e sovranità **per assenza di dato, non per collocazione**; (c) fornitore rilevante di secondo livello che il cliente dichiara con il Paese della sede legale. Riportata per esteso in `07-catena-di-fornitura.md` §7.1. Resta ad `ARCH` la sola scelta del punto di risoluzione e del contratto del gateway |
| **Q-16** | **Chiusa nella parte `SEC`.** Recepita la realizzazione già indicata da `TECH` e **elevata a V-157**: non regola di codifica ma requisito architetturale con **uscita negata a livello di rete**. Definiti gli intervalli vietati e **tre regole di manutenzione**: intervalli IPv6 allineati a prefisso; **divieto d'uso della lista di indirizzi consentiti** nel profilo sanitario; riverifica a ogni aggiornamento di versione minore con esito registrato. Confermata l'avvertenza di `TECH`: il filtro applicativo è difesa in profondità, la primaria è l'isolamento di rete |

---

## 4. Questioni aperte

| # | A | Sintesi |
|---|---|---|
| Q-150 | `ARCH` | ADR sul registro immutabile: catena applicativa, archiviazione a sola aggiunta, scrittura singola su oggetto, o firma periodica con marca temporale. **È il singolo elemento di maggiore sforzo dell'intero catalogo** |
| Q-151 | `COMP` | Allegati di dettaglio non letti riga per riga: **nessun requisito puntuale citato** prima. La tabella di `09` è ripartizione tematica affidabile e citazione normativa incompleta |
| Q-152 | `ARCH`, `ROAD` | Livelli di servizio attesi per il monitoraggio continuo, distinti dagli accordi contrattuali del decreto sulle infrastrutture regionali |
| Q-153 | `INTEG` | Verifica empirica dell'inoltro del contesto di autenticazione richiesto attraverso il broker. **Bloccante prima di dichiarare pubblicamente come si propaga il livello** |
| Q-154 | → **ORCH** | Se l'operatore del servizio gestito supera le soglie della media impresa **diventa soggetto obbligato in proprio**: le diciotto righe marcate `D` della ripartizione diventerebbero sue |
| Q-155 | → **ORCH** | Monetizzazione e ruolo di fabbricante; **periodo di supporto dichiarato**, minimo cinque anni |
| **Q-156** *(nuova)* | `ARCH` | **Registro di fiducia per tenant unico**, che alimenti federazione, origini di incorporamento, condivisione fra origini, destinazioni dei webhook ed elenco consentito del mediatore. Si salda con Q-19 di `INTEG`. Forma **non decisa** da quest'area |
| **Q-157** *(nuova)* | `FUNZ`, `COMP` | Oscuramento selettivo del video per il diritto di accesso: capacità dichiarata **non presente nella v1.0** con misura intermedia proposta, da confermare o da progettare |
| **Q-158** *(nuova)* | `ARCH` | Punto e periodicità dell'**ancoraggio esterno** dell'impronta cumulativa del registro |

Voci altrui verso cui quest'area ha contribuito senza chiuderle: Q-08 (due modalità), Q-09
(parametrizzazione del termine), Q-10 e Q-24 (tabella artefatto → regime), Q-17 (inventario di
partenza dei componenti), Q-18 (residuo sul livello richiesto), Q-19 (registro di fiducia),
Q-20 (ripartizione dei ruoli).

---

## 5. Marcature `[NV]` da sciogliere

1. Estremi e revisione vigente delle **raccomandazioni crittografiche** europee e nazionali da
   citare nella matrice di conformità — nessun parametro è stato inventato.
2. **Testo dei 116 requisiti** delle misure di base (Q-151).
3. Testo della determinazione che introduce l'obbligo di **dichiarazione dei fornitori
   rilevanti**, e selezione dei codici della nomenclatura degli appalti.
4. Stato di **armonizzazione** della norma sulle attività di sicurezza nel ciclo di vita.
5. Testo dei decreti sugli **elementi essenziali di cybersicurezza nei contratti pubblici**.
6. Documento dell'agenzia che associa il **livello di garanzia** alla categoria dei servizi
   sanitari; mappatura formale fra livelli nazionali ed europei; conferma che il livello asserito
   dallo schema documentale sia sempre il massimo.
7. Stato del supporto della versione più recente del **protocollo di trasporto per il datagramma**
   sul terzo motore; **algoritmo di sintesi** delle credenziali effimere del relay, da verificare
   **empiricamente** e non documentalmente; supporto della notazione a prefisso nelle direttive
   di diniego.
8. **Termini di conservazione** della documentazione sanitaria per tipo e per disciplina
   regionale.
9. **Termine della relazione conclusiva** nel regime della resilienza informatica; acquisizione
   integrale delle linee guida nazionali sul processo di gestione degli incidenti.

---

## 6. Conformità alle regole redazionali

- **R0**: nessuna azienda, marchio, prodotto commerciale o dominio di potenziale partner è
  nominato. Le componenti open source sono designate con il ruolo che svolgono.
- **Nessun parametro crittografico inventato**: `03-protezione-dei-dati.md` §1 enuncia la regola
  e la motiva nel merito, non per prudenza.
- **Nessun identificativo di vulnerabilità non letto sulle fonti**: gli identificativi non sono
  riportati in forma numerica nei documenti pubblici; i difetti del relay sono descritti per
  **meccanismo e versione di correzione**, che è la forma utile a chi deve decidere la versione
  minima, e la fonte della verifica è citata.
- **Nessun segreto negli esempi**: solo segnaposto `${...}` e `<...>`; identificativi opachi.
- **Diagrammi Mermaid** in `01`, `02`, `03`, `05`, `06`, `10`.
- **Rinvii senza ripetizione** a `docs/10_fondamenti/12-crittografia-e-sicurezza.md`, che **non è
  stato modificato**.
