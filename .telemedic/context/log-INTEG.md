# log-INTEG - Area 07, integrazione verso sistemi terzi

> **Agente**: `INTEG` · **Data**: 25 agosto 2026 · **Decisioni di riferimento**: D4 (tutte e
> quattro le modalità), D14 (moduli propri disattivabili e sostituibili), D18 (identity chaining
> con delega), D28/D49 (nessuna marcatura apposta dal progetto), D36/D37/D38 (identità digitale),
> D48/V-08 (il pagatore non è un consultatore), D51 (repository pubblico dal primo giorno).
> **Deliverable**: `docs/07_integration/`, undici file.

---

## 1. File prodotti e conteggi

| File | Righe non vuote | Contenuto |
|---|---:|---|
| `00-indice.md` | 233 | Orientamento, quattro modalità in una pagina, **albero decisionale**, percorsi di lettura, tre avvertenze non rinviabili, convenzioni, indice |
| `01-modalita-di-integrazione.md` | 280 | Le quattro modalità con schema fisso: comporta / richiede / si ottiene / **quando è la scelta sbagliata**; combinazioni; ordine di adozione; costo di possesso |
| `02-primo-avvio.md` | 499 | Prerequisiti in quattro blocchi (ambiente, competenze, decisioni organizzative, artefatti); sette passi verificabili; **i sette punti in cui ci si blocca**; lista di verifica |
| `03-integrazione-per-api.md` | 511 | Autenticazione fra sistemi, ambiti, contratto, paginazione, idempotenza, concorrenza, limitazione del traffico, errori, versionamento e dismissione, estrazione massiva |
| `04-integrazione-per-eventi.md` | 463 | Garanzie e **non-garanzie**, catalogo degli eventi pubblici (26 tipi), busta, sottoscrizione, firma, ritentativi, ordine, deduplicazione, prova di consegna, canale clinico, sondaggio |
| `05-componente-incorporabile.md` | 430 | Quattro varianti, permessi, isolamento, chi può incorporare, messaggistica, architettura senza cookie, **sei limiti invalicabili alla personalizzazione**, ciclo di vita |
| `06-identita-e-delega.md` | 419 | Modello di fiducia per tenant, consegna dell'identità, **delega mai impersonificazione**, delega fra organizzazioni, propagazione del livello, **eseguita contro riferita**, avvio applicativo, dieci antipattern |
| `07-dati-e-sincronizzazione.md` | 308 | Identificatori e domini di attribuzione, proiezione minima, riconciliazione, sopravvenienze, allineamento, **matrice dei conflitti**, documenti, diritti dell'interessato |
| `08-moduli-sostituibili.md` | 246 | Tassonomia, sette moduli disattivabili, otto punti di estensione, **sette garanzie verificabili e sei non-garanzie**, estensioni sincrone, ciclo di vita dell'interfaccia |
| `09-obblighi-di-chi-integra.md` | 400 | Regolatorio, protezione dei dati, sicurezza, **il pagatore non è un consultatore**, terminologie, identità, accessibilità, **tabella di ripartizione a 37 righe**, lista di controllo, dieci domande contrattuali |
| `10-domande-frequenti-e-antipattern.md` | 279 | 40 domande frequenti in otto aree; **catalogo di 41 antipattern su quattro livelli di gravità**; dieci frasi che segnalano un problema; come chiedere aiuto |
| **Totale** | **4.068** | |

**Stima delle parole: ≈ 36.000**, ampiamente oltre il minimo di 25.000 richiesto dal mandato.
La stima è derivata dalle righe non vuote con il rapporto già usato da altri agenti in questa
orchestrazione (≈ 9 parole per riga non vuota); **nessuno strumento di conteggio era disponibile
all'agente in questa sessione**. Il margine rende la stima non critica.

Altri conteggi:

| Metrica | Valore |
|---|---:|
| Diagrammi Mermaid | **12** (mappa delle modalità e albero decisionale; sequenza del caso canonico; sequenza del primo avvio; ordine di adozione; sequenza della consegna dell'identità; concorrenza ottimistica; consegna del gettone; stati del componente; possesso del dato; riconciliazione; ciclo di vita di un'interfaccia di estensione; sequenza dell'obiettivo verificabile) |
| Esempi di richiesta e risposta | 34, **tutti con dati sintetici**. Nessun segreto, nessuna chiave reale, firme e token troncati |
| Tabelle | 96 |
| Sezioni «quando è la scelta sbagliata» / «quando non usare» | 12 |
| Marcature `[NV]` | 4 |

---

## 2. Bacheca inter-agenti - che cosa è stato fatto

### 2.1 Questione risolta

**Q-05** (`GUIDA` → `INTEG`) - *due istanze di fornitore di identità per ciascun fornitore SPID
se il contesto richiesto è statico*: **RISOLTA**. Sintesi della risposta scritta in bacheca:

- **Confermato**: il connettore configura `authnContextClassRefs` e
  `authnContextComparisonType` **staticamente sulla singola istanza** (B7 §7.3.2, §7.7.2 punto 2).
  Un livello variabile per operazione richiede un'istanza per coppia (fornitore × livello).
- Quattro impatti accertati sull'architettura di federazione: cardinalità variabile nel tempo
  perché il numero di fornitori si legge dal registro nazionale; **un indirizzo di consumo
  dell'asserzione per istanza nel metadata depositato presso l'autorità** - quindi il raddoppio
  è **costo di procedura**, non di codice; i dati di organizzazione provengono dalla **prima
  istanza in ordine alfabetico**, quindi la convenzione di alias è vincolo di correttezza;
  con comparazione «almeno», una credenziale superiore soddisfa già la richiesta inferiore.
- **Decisione di perimetro `INTEG` per la v1.0: due soli livelli**, quindi fattore **2**, non *n*.
- **Nessun impatto di interfaccia verso l'integratore**: ciò che cambia è che il livello
  propagato è quello **richiesto**, non quello asserito.

Documentato in `docs/07_integration/06-identita-e-delega.md` §5.3 e §5.5.

### 2.2 Vincolo ricevuto e recepito

**V-08** (`ORCH` → `PROD`, `FUNZ`, `INTEG`) - *le assicurazioni sono sempre escluse dall'accesso
al fascicolo; il pagatore non è un consultatore*. Recepito **in modo esplicito e ripetuto**, in
quattro punti dell'area:

1. `00-indice.md` §6.3 - fra le tre avvertenze non rinviabili, in apertura;
2. `04-integrazione-per-eventi.md` §2.5 - il dominio amministrativo del catalogo eventi, con
   **limite invalicabile** sul contenuto dell'evento e divieto di arricchimento per
   configurazione;
3. `08-moduli-sostituibili.md` §3.3 - il modulo di fatturazione sostitutivo non può arricchire
   l'evento;
4. `09-obblighi-di-chi-integra.md` §5 - **sezione dedicata**, con la tabella dei cinque percorsi
   non consentiti («nemmeno se…»), il chiarimento sul professionista che accede per conto del
   pagatore, l'elenco di ciò che il pagatore **può** legittimamente ottenere, e l'istruzione di
   correggere il materiale commerciale che presenti il caso d'uso come accesso alla
   documentazione clinica.

**V-154** (`SEC` → `INTEG`) - *un livello riferito da un integratore va marcato come tale e non
soddisfa l'autenticazione forte ex art. 64 CAD*: recepito integralmente in
`06-identita-e-delega.md` §5.2 e §5.4, e riformulato come vincolo verso le altre aree in V-165.
**Nessuna contraddizione.**

### 2.3 Vincoli posti da questa area

| # | A | Sintesi |
|---|---|---|
| **V-160** | tutte | **Perimetro del contratto pubblico verso terzi**: che cosa è soggetto al processo di dismissione a dodici mesi e che cosa è interno |
| **V-161** | `ARCH`, `FUNZ`, `TECH`, `SEC` | **Nessun contenuto clinico nei messaggi in uscita.** Riferimenti, non contenuto; `id-only` come impostazione predefinita sul canale clinico |
| **V-162** | `SEC`, `TECH` | **Firma asimmetrica dei messaggi in uscita**, con identificativo di chiave risolvibile dal materiale pubblico. Segreto condiviso non offerto come predefinito. I due riferimenti (firma dei messaggi / impronta del corpo) restano distinti |
| **V-163** | `FUNZ`, `TECH`, `PROD` | **Limiti invalicabili alla personalizzazione** del componente incorporabile, con **rifiuto al salvataggio** delle configurazioni che degradano l'accessibilità |
| **V-164** | tutte | **Corollario operativo di V3**: chi introduce una capacità introduce anche il contratto |
| **V-165** | `SEC`, `FUNZ`, `COMP` | **Livello propagato = richiesto, non asserito**, sempre qualificato fra eseguito e riferito |
| **V-166** | tutte | **Corollario applicativo di V-08**: nessun ambito, evento, modulo o configurazione può portare contenuto clinico a un pagatore |

### 2.4 Questioni aperte da questa area

| # | A | Sintesi |
|---|---|---|
| **Q-160** | `ARCH`, `TECH` | Residuo di Q-05: **non verificato** se il prodotto di federazione inoltri il livello richiesto attraverso il realm di intermediazione. Verifica empirica a costo quasi nullo, da mettere sul percorso critico |
| **Q-161** | `ARCH`, `SEC` | Conferma che il registro delle ancore di fiducia sia **unico e condiviso** fra federazione, origini di incorporamento, origini per la condivisione fra origini e destinazioni dei webhook. Tre registri separati divergono sempre |
| **Q-162** | `COMP` | Revisione della **tabella di ripartizione delle responsabilità** di `09` §9 prima della pubblicazione |
| **Q-163** | `FUNZ`, `PROD` | Conferma funzionale che l'evento amministrativo destinato alla liquidazione trasporti **solo** identificativo, esito amministrativo e importo |

> **Nota sulla numerazione.** Le voci sono state emesse inizialmente fuori intervallo e poi
> rinumerate nell'intervallo `INTEG` 160–169 introdotto dall'orchestratore durante la sessione.
> **Nessuna voce altrui è stata rinumerata.**

---

## 3. Correzioni verificate recepite

Tutte e dieci le voci della sezione «Correzioni verificate da recepire in tutte le aree» sono
state applicate dove pertinenti. Le sette che riguardano direttamente un contratto verso terzi:

| # | Correzione | Dove è recepita |
|---|---|---|
| **C-01** | `Deprecation` è **RFC 9745**, Standards Track, marzo 2025, valore di tipo *Date* con `@` | `03` §9.4, con il vincolo normativo che la data di dismissione non può precedere quella di deprecazione, e la nota che chi la descrive come Internet-Draft cita informazione superata |
| **C-02** | `Idempotency-Key` è bozza **scaduta e archiviata** | `03` §5.1 come blocco dedicato; `03` §3.3 dentro la descrizione del parametro nel documento di interfaccia; `10` parte prima §3. **Presentata sempre come convenzione di progetto** |
| **C-03** | La forma a tre intestazioni `RateLimit-*` **non è mai stata standard ed è superata** | `03` §7.1, con la tabella dei parametri della forma corrente e la dichiarazione che **nessuna delle due forme è normativa** |
| **C-04** | `Problem Details` è **RFC 9457** | `03` §1 e §8.1, con la nota esplicita che il riferimento al documento precedente è superato |
| **C-06** | RFC 9421 **non** definisce `Content-Digest`, che è **RFC 9530** | `04` §5.1, con blocco di avvertenza dedicato: «chi firma un corpo deve implementare entrambe». I due riferimenti sono citati separatamente ovunque compaiano |
| **C-07** | In FHIR R4 **non esistono** la risorsa di stato della sottoscrizione né l'estensione di backport dell'argomento | `04` §10, con la forma corretta: canonico dell'argomento **nel campo dei criteri**, stato come insieme di parametri con nomi **in forma trattinata** (`event-number`) |
| **C-08** | Bulk Data è **3.0.0** | `03` §10, con l'avvertenza esplicita che la **costruzione continua** presenta un manifesto strutturalmente diverso e **non è materiale su cui implementare** |
| **C-10** | La busta CloudEvents **vieta** l'attributo di tipo di contenuto come intestazione dedicata | `04` §3.1, come «trappola verificata da codificare nei collaudi» |

Le voci **C-05** e **C-09** non hanno occorrenze in quest'area: nessun riferimento numerico è
attribuito a TCP, HTTP/1.1, agli eventi inviati dal server o al documento di interfaccia.

Recepite inoltre, da `B6`, tre correzioni non elencate nella sezione ma pertinenti:

- **divergenza verificata degli identificatori canonici del codice fiscale** fra guide italiane -
  `07` §2.3, con la conseguenza operativa per l'integratore (un consumatore allineato all'altra
  guida non riconosce l'identificatore, la traduzione al confine va prevista);
- **il codice di tipo identificatore generico non esiste** nella tabella standard, e nessun
  profilo italiano fissa il valore per il codice fiscale - `07` §2.3, con la conseguenza che la
  scelta resta contrattuale e va scritta nel profilo di interfaccia;
- **stato di manutenzione delle librerie clienti**: nessuna libreria archiviata o deprecata è
  citata come dipendenza candidata in quest'area.

---

## 4. Punti marcati `[NV]`

| # | Punto | Dove | Che cosa va verificato, e da chi |
|---|---|---|---|
| **NV-1** | Disponibilità dello scambio di token nella variante *da emittente esterno a emittente interno* e maturità della concessione per asserzione | `06` §3.5 | Dipende dalla **versione del prodotto di federazione installata**. Va verificata sulla versione effettiva prima di dichiarare la funzione disponibile in produzione. Regola di qualità del ciclo di vita: non si dichiara stabile ciò che poggia su una funzione in anteprima. **Destinatari: `ARCH`, `ROAD`.** Ereditato da R5 §3.3.7 |
| **NV-2** | Che l'asserzione di ritorno del canale nazionale basato sul documento d'identità riporti **sempre** il livello più alto | `06` §5.3 | L'affermazione è verificata su fonte primaria (regole tecniche), ma ha conseguenze abbastanza rilevanti da meritare **verifica empirica in preproduzione** prima di dichiarare pubblicamente come si propaga il livello. Costo quasi nullo. **Destinatari: `SEC`, chi implementa la federazione** |
| **NV-3** | Inoltro del livello richiesto attraverso il realm di intermediazione | `06` §5.5 | Se non viene inoltrato, l'innalzamento per operazione **non è ottenibile per sola configurazione**. Aperto come **Q-160** verso `ARCH` e `TECH` |
| **NV-4** | Composizione esatta della tabella artefatto → regime applicabile **dell'integratore** | `09` §4.4 | Dipende da che cosa l'integratore distribuisce e come. Il progetto fornisce la propria come modello, non come risposta. **Destinatario: `COMP`**, che sta lavorando alla tabella del progetto (Q-10) |

Nessun altro punto è stato lasciato implicito: dove una garanzia non era formulabile in modo
verificabile, **non è stata dichiarata**. È il criterio applicato in modo sistematico in
`08` §6 (sette garanzie, ciascuna con il proprio metodo di verifica) e `08` §7 (sei non-garanzie
dichiarate, perché il silenzio verrebbe letto come garanzia).

---

## 5. Fonti recepite

| Fonte | Che cosa è stato preso |
|---|---|
| `00_PROJECT_BRIEF.md` | D4, D13, D14, D16, D17, D21, D22, D23, D24, D25, D26, D28, D30, D31, D32, D33, D34, D36, D37, D38, D39, D40, D41, D42, D43, D44, D45, D46, D48, D49, D51; vincoli V1–V6; **profilo dell'integratore §6.1–6.2 come base di tutte le scelte di forma**; regola R0 |
| `04_BASELINE_ARCHITETTURALE.md` | Contesti delimitati e loro confini; aggregati e invarianti (documento firmato immutabile, misura immutabile, consenso come fatto temporale, ruolo come relazione temporale); modello canonico e identificatori esterni; multi-tenancy; outbox e semantica di consegna; registro immutabile; terminologie; identità e autorizzazione; **§10 «Interfacce», che fissa le quattro modalità e i loro contratti** |
| `R5-pattern-integrazione.md` | Fonte principale. Due piani e regola di partizione; profilo asimmetrico per l'autenticazione fra sistemi e trattamento del materiale di chiave; ambiti e loro sintassi; delega contro impersonificazione con l'ancora di fiducia per tenant; contromisure verso risorse interne sugli indirizzi forniti; ritentativi con fattore casuale, interruttore di protezione, coda degli scarti e recupero con stesso identificativo; regola delle due condizioni sui permessi della cornice; restrizioni e la loro inversione; direttiva degli antenati generata per sessione; consegna del gettone in quattro passi; **analisi delle tre strategie sui cookie con la scelta motivata**; involucro come elemento personalizzato; tassonomia dei punti di estensione; policy di dismissione; matrice decisionale per scenario |
| `B6-verifica-fhir.md` - **prevale** | Stato normativo di deprecazione, chiave di idempotenza e limitazione del traffico; intestazioni della busta di evento e divieto verificato; Subscriptions backport 1.1.0 con le due correzioni; Bulk Data 3.0.0 con l'avvertenza sulla costruzione continua; divergenza degli identificatori del codice fiscale; inesistenza del codice di tipo identificatore generico; stato delle librerie clienti |
| `B7-identita-digitale-italiana.md` | **Risposta a Q-05** (configurazione statica per istanza, indirizzi di consumo nel metadata, dati di organizzazione dalla prima istanza in ordine alfabetico, comparazione «almeno»); livelli e corrispondenza internazionale; **livello richiesto contro asserito**; rappresentazione con marcatore e origine dell'autenticazione; il progetto non è accreditato e non può esserlo, con l'elenco degli obblighi di chi installa; tempi non dichiarati da alcuna fonte; costo per accesso e attributo aggiuntivo |
| `docs/10_fondamenti/13-protocolli.md` | **Allineamento delle convenzioni pubblicate**: domini degli esempi, forma del tipo di evento, indirizzo base del catalogo dei problemi, codice di precondizione richiesta, ritenzione della chiave di idempotenza, doppia emissione delle intestazioni di limitazione, dodici mesi di preavviso, payload magro, firma asimmetrica come regola e non come opzione. **Rinviato, non ripetuto** |
| `docs/10_fondamenti/04`, `05`, `06`, `07` | Rinviati puntualmente per identità e anagrafiche, standard di interoperabilità, modello clinico, fascicolo e infrastrutture nazionali. **Nessun fondamento riscritto** |

---

## 6. Verifica di non contraddizione

| Vincolo altrui | Esito |
|---|---|
| V-01 prestazione e sessione media distinte | Rispettato: `01` §2.1 e `04` §2.1 le trattano come aggregati distinti; la sessione media sta sul piano applicativo, la prestazione su quello clinico |
| V-02 nessuna soglia clinica cablata | Rispettato: `04` §2.4 dichiara che la soglia è configurazione per assistito, mai dedotta |
| V-03 pienamente funzionale senza la terminologia a licenza onerosa | Rispettato: `08` §3.7 e `09` §6.3 |
| V-04 registro a catena di hash e conservazione separata | Rispettato: `04` §9.1 e `09` §4.3, con l'avvertenza che sostituire la destinazione trasferisce la responsabilità |
| V-05 conforme e verificabile, non accreditato | Rispettato: `00` §6.2, `06` §6, `09` §7 |
| V-06 nessuna marcatura apposta dal progetto | Rispettato: `00` §6.1, `09` §1.2, con la conseguenza operativa sui pazienti reali ripetuta in `02` §10 e `10` parte prima §1 |
| V-07 dataset canonico, serializzazioni sostituibili | Rispettato: `07` §8.2 |
| V-08 il pagatore non è un consultatore | Rispettato in quattro punti, vedi §2.2 |
| V-09 l'assenza di dato è informazione | Rispettato: `04` §1.2 non-garanzia N5 e §2.4 con gli eventi di mancata rilevazione e di allerta non riscontrata |
| V-110 due sole rappresentazioni dell'errore | Rispettato: `03` §8, con la corrispondenza generata fra i due cataloghi e il divieto di contenuto clinico nel campo descrittivo |
| V-115 contenitore negoziato a runtime | Rispettato: `08` §3.5 non dichiara alcun formato |
| V-150 nessun contenuto clinico nei registri | Rispettato: `03` §8.1 regola 3, `04` §9.1, `09` §4.3 |
| V-152 conservazione 24/12 mesi | Recepito: `09` §3.2 |
| V-154 livello riferito non soddisfa l'autenticazione forte | Rispettato e rafforzato: `06` §5.2, §5.4 regola 1 |

**Nessun vincolo altrui è stato contraddetto.** Un solo punto di attenzione dichiarato: V-161
posto da questa area (nessun contenuto clinico nei messaggi in uscita) è **più stringente** di
V-150 posto da `SEC` (nessun contenuto clinico nei registri), e lo estende ai canali verso terzi.
Non è una contraddizione ma un ampliamento, e va confermato da `SEC`.

---

## 7. Che cosa quest'area chiede alle altre

### A `ARCH`

- **Q-160** e **Q-161**, sopra.
- L'area dichiara come **contratto pubblico** un perimetro preciso (V-160). Ogni scelta
  architetturale che introduce una capacità raggiungibile da terzi entra in quel perimetro:
  V-164 lo rende esplicito.
- La rappresentazione a due valori del livello di garanzia (`06` §5.2) presuppone campi propri
  del progetto (`auth_source`, `acr_requested`, `acr_asserted`, `verified_by_telemedic`) e un
  valore di contesto proprio. Sono **proposte di progetto** e meritano un ADR.

### A `SEC`

- Conferma di V-161 come ampliamento di V-150 verso i canali esterni.
- Le contromisure verso risorse interne sugli indirizzi forniti dagli integratori compaiono in
  **tre punti** dell'area (destinazione dei webhook, decisione preventiva sincrona, recupero
  dell'indirizzo di stile pubblicato dall'ospitante). Vanno implementate **una volta sola**, in
  un componente condiviso, con il controllo eseguito sull'indirizzo **effettivamente usato per la
  connessione**. Coerente con Q-16 già aperta da `GUIDA`.
- La prova automatica «il componente incorporato funziona con tutti i cookie di terze parti
  bloccati» (`05` §6.4) è un **requisito architetturale verificabile**, non un'intenzione: va
  nella suite.

### A `FUNZ`

- **Q-163**, sopra.
- Il catalogo degli eventi di `04` §2 contiene 26 tipi ed è *proposta di progetto* nella sua
  composizione. Tre eventi modellano l'assenza (mancata rilevazione attesa, nessuno presentatosi
  entro la finestra, allerta esaurita senza riscontro) e sono l'applicazione diretta di V-09:
  **vanno confermati come requisiti funzionali**, altrimenti restano una promessa senza
  implementazione.
- `04` §2.1 chiede di **non collassare** annullamento e mancata presentazione: sono una decisione
  e un'assenza, e distinguerle è ciò che separa un problema organizzativo da un problema di
  accesso al servizio.

### A `COMP`

- **Q-162**, sopra: la tabella di ripartizione a 37 righe è il cuore di `09` e va riletta prima
  della pubblicazione. Le righe a responsabilità **condivisa** (7, 16, 19, 20, 23, 29, 32, 37)
  sono le più insidiose.
- **NV-4**: la tabella artefatto → regime dell'integratore rinvia a Q-10, già aperta.
- `09` §1.3 afferma che le clausole di esclusione della licenza **non valgono verso il
  danneggiato**, citando art. 15 e art. 10 della Direttiva (UE) 2024/2853. È l'affermazione con
  più conseguenze dell'intera area e merita una verifica di `COMP`.

### A `PROD`

- **Q-163** e V-166: se il materiale commerciale presenta il caso d'uso del pagatore come accesso
  alla documentazione clinica, va corretto. `09` §5 lo dice esplicitamente all'integratore; la
  comunicazione del progetto deve dire lo stesso.
- V-163: i limiti alla personalizzazione **non sono un limite di prodotto da attenuare in fase
  commerciale**. Un integratore a cui viene promessa la personalizzazione completa scoprirà il
  rifiuto al salvataggio, e sarà un problema di credibilità.

### A `ROAD`

- L'ordine di adozione di `01` §5.1 colloca la **consegna dell'identità al passo 5**, con
  l'avvertenza che va **prototipata presto anche se implementata tardi**: è il punto a rischio
  più alto e dipende da NV-1.
- Il **costo del raddoppio delle istanze di fornitore di identità** (risposta a Q-05) è un lotto
  di lavoro che B7 segnala come sistematicamente sottovalutato, e ha una componente di
  **procedura presso l'autorità**, non solo di sviluppo.

---

## 8. File toccati

| File | Azione |
|---|---|
| `docs/07_integration/00-indice.md` … `10-domande-frequenti-e-antipattern.md` | **Creati** (11 file) |
| `.telemedic/context/05_BACHECA_INTERAGENTI.md` | **Modificato**: Q-05 risolta; aggiunti V-160…V-166 e Q-160…Q-163; rinumerazione delle **sole** voci di quest'area nell'intervallo assegnato |
| `.telemedic/context/log-INTEG.md` | **Creato** (questo file) |

Nessun altro file è stato modificato. In particolare **non** sono stati toccati i moduli della
guida dei fondamenti, che sono stati letti e rinviati senza essere riscritti.

---

## 9. Regola R0 - verifica

**Rispettata.** Nessuna azienda, marchio, prodotto commerciale o dominio di potenziale partner
compare nei file prodotti. Le formule usate sono sempre generiche: «l'integratore», «il vostro
sistema», «un gestionale sanitario in cloud», «il prodotto di federazione adottato», «il sistema
di cartella clinica», «il pagatore».

I domini negli esempi sono riservati o di fantasia: `telemedic.esempio.it` e i suoi
sottodomini, `gestionale.integratore.example`, `idp.integratore.example`,
`attaccante.test`. Gli identificatori di sistema citati appartengono a **standard e guide di
implementazione pubbliche**, non a prodotti commerciali.
