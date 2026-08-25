---
title: Oltre il primo rilascio
sidebar_position: 5
description: Che cosa viene dopo il primo rilascio installabile, in ordine di priorità motivata — la coda pianificata voce per voce con criteri di completamento binari, innesco e titolare, comprese le voci uscite da RU-1 per effetto di D53; ciò che è soltanto desiderabile e che cosa manca perché diventi pianificato; ciò che non torna in nessun rilascio.
---

# Oltre il primo rilascio

Il capitolo [03](./03-primo-rilascio-utilizzabile.md) ha dichiarato che cosa `RU-1` contiene, che
cosa non contiene e — al §5 — **che cosa è stato tagliato per rispettare la data del 30 novembre
2026**. Questo capitolo risponde alla domanda successiva, che è quella che un integratore pone
appena finito di leggere l'elenco dei tagli: **e poi?**

> **La risposta utile non è un elenco di cose che si faranno.** È la distinzione fra ciò che è
> **pianificato** — con una posizione in coda, un criterio di completamento e un innesco dichiarato
> — e ciò che è **soltanto desiderabile**, cioè privo di tutte e tre queste cose. Un documento che
> presenta le due categorie con la stessa grafica ha già ingannato chi lo legge, anche se ogni
> singola frase è vera.

---

## 1. Le due categorie, e la regola che le separa

Le tre classi di enunciato del progetto — `[IMPEGNO]`, `[INTENZIONE]`, `[IPOTESI]` — restano quelle
definite in [00 §2](./00-indice.md). Questo capitolo introduce una partizione **ortogonale**, che
serve a un lettore diverso: non a chi valuta l'affidabilità di una data, ma a chi deve decidere se
aspettare una funzione o procurarsela altrove.

| Categoria | Marcatore | Che cosa ha | Che cosa autorizza a dire |
|---|---|---|---|
| **Pianificato** | `OL-nn` | Una posizione in coda motivata, uno o più **criteri di completamento binari**, un **innesco** dichiarato, un **titolare** | «È in coda, in questa posizione, e si sblocca quando accade questo» |
| **Desiderabile** | `DS-nn` | Una motivazione e **nulla di più**. Nessuna posizione, nessun criterio, nessun innesco | «Ci piacerebbe, e oggi manca **questo** perché diventi pianificato» |

**La regola, posta come vincolo `V-187`**: una voce che non abbia insieme criterio di completamento
binario, innesco dichiarato e titolare **non è pianificata**, e nessun materiale del progetto può
presentarla come tale. Non è pedanteria redazionale: è ciò che impedisce a una risposta a un
capitolato di trasformare un desiderio in un impegno contrattuale per il tramite di una tabella ben
formattata.

### 1.1 Che cosa sono le sigle, e che cosa non sono

`OL-nn`, `DS-nn` e `TG-nn` sono **designazioni di pianificazione**, non identificativi di requisito.
Non appartengono agli intervalli congelati da `V-120` (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`,
`OUT-*`), non entrano nella matrice di tracciabilità e non possono comparire in una prova. Valgono
esattamente quanto la sigla `RU-1`: un modo per riferirsi a una riga di un documento senza doverla
ricopiare.

**Il numero di una voce `OL-nn` non è la sua posizione in coda.** È l'ordine in cui la voce è stata
introdotta. La posizione è dichiarata nella tabella del §3 e cambia; il numero no, perché
rinumerare farebbe divergere ogni rinvio esistente. Le voci `OL-15`…`OL-22` sono le ultime
introdotte e stanno, alcune di esse, in testa alla coda: **è normale e va letto così.**

Quando una voce `OL-nn` entra in lavorazione, i requisiti che la realizzano ricevono identificativi
propri secondo la regola di
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7:
**identificativo nuovo, mai la modifica silenziosa di uno esistente**.

### 1.2 Che cosa non è in questo capitolo

- **Le esclusioni definitive.** Vivono in
  [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) con
  identificativo `OUT-nn` e categoria di riapribilità, e il §7 vi rinvia senza riscriverle.
- **Le date.** Nessuna voce di questo capitolo ha una data. La ragione è cambiata rispetto alla
  versione precedente di questo documento e va detta con precisione: **non è più che la capacità
  sia ignota** — `D54` la dichiara — **è che la capacità dichiarata è interamente impegnata fino al
  30 novembre 2026** dal piano del capitolo [02](./02-traguardi.md), che non ha margine. Oltre quella
  data la capacità resta quella di un contributore unico a tempo parziale, e la coda che segue
  contiene **ventidue voci**. Dichiarare qui un trimestre significherebbe inventarlo.
- **I rischi.** Ogni voce cita i rischi che la riguardano; la loro descrizione è in
  [05 — Rischi e dipendenze](./05-rischi-e-dipendenze.md).

---

## 2. Come è ordinata la coda

### 2.1 I criteri, e come si applicano dopo il primo rilascio

I criteri di priorità sono quelli di [01 §3](./01-principi-e-metodo.md), in ordine lessicografico:
sicurezza dell'assistito, irrecuperabilità, legittimità dell'uso, sblocco, valore clinico per unità
di costo, desiderabilità.

**I criteri 1 e 3 non ordinano la coda: la filtrano.** Nulla entra in questa coda se degrada la
sicurezza dell'assistito senza un controllo di rischio, o se la sua assenza rende illecito l'uso del
prodotto. Una voce che violasse uno dei due non sarebbe una voce di coda: sarebbe un difetto del
primo rilascio, e andrebbe corretta lì.

**Il criterio 2 — irrecuperabilità — dopo `D53` ordina, e prima non lo faceva.** È la novità di
questa revisione e va motivata. Fino alla terza tornata di decisioni, ciò che era irrecuperabile
era stato collocato nei traguardi di classe `A` e quindi non compariva in coda. Dopo `D53` e `D54`
esistono voci la cui **assenza produce una perdita nuova a ogni rilascio**, non una sola volta: sono
le funzioni a ruoli distinti (`OL-22`) e l'ancoraggio del registro (`OL-21`). Per esse la
distinzione fra filtro e ordinamento non regge, perché non c'è un singolo rilascio da correggere:
c'è una serie di rilasci ciascuno dei quali ripete l'omissione. **Stanno quindi in testa alla coda,
davanti a voci di maggiore valore funzionale**, ed è una scelta che questo documento dichiara invece
di lasciarla dedurre.

**Ordinano il resto della coda i criteri 4 e 5**, nell'ordine: quante altre cose una voce sblocca, e
quanto beneficio clinico produce per unità di lavoro. Il criterio 6 — desiderabilità — non ordina
niente: **è la definizione della seconda categoria**.

### 2.2 Le tre regole aggiuntive

**Prima — il debito regolatorio si estingue prima di aggiungere.** Se al momento di aprire una voce
esiste una lacuna dichiarata ai sensi di [01 §8](./01-principi-e-metodo.md), quella lacuna si
chiude prima. La ragione è aritmetica: il debito regolatorio non si rifinanzia, e ogni funzione
aggiunta sopra una lacuna ne aumenta la superficie invece di lasciarla costante. **Sotto `D54`
questa regola ha un destinatario preciso**: le lacune dichiarate del §5.3 del capitolo
[03](./03-primo-rilascio-utilizzabile.md), che è la ragione per cui `OL-22` è in prima posizione.

**Seconda — ciò che sblocca chi integra precede ciò che aggiunge una prestazione.** Una prestazione
nuova produce valore per un tenant; una capacità di integrazione mancante blocca **tutti** gli
integratori contemporaneamente e li obbliga a costruire un aggiramento che poi manterranno per anni.

**Terza — nulla si aggiunge finché il percorso verticale di `RU-1` non è stato esercitato da
qualcuno che non l'ha scritto.** È l'applicazione del criterio di composizione di
[01 §4.2](./01-principi-e-metodo.md), e sotto `D54` è **l'unica forma di verifica indipendente che
`RU-1` avrà**: la esegue chi installa, con la procedura di
[03 §10](./03-primo-rilascio-utilizzabile.md). Un secondo percorso verticale costruito su un primo
mai messo alla prova moltiplica per due un difetto invece di scoprirlo.

### 2.3 La coda è per priorità, non per sequenza obbligata

**La posizione in coda esprime la priorità, non l'ordine di consegna.** Una voce piccola e sbloccata
non attende una voce grande e bloccata da una decisione del committente. La regola che governa il
sorpasso è una sola, ed è verificabile:

> Una voce può superare quelle che la precedono **solo se il suo innesco si è verificato e quello
> delle voci precedenti no**, e il sorpasso è registrato nella revisione di
> [00 §8](./00-indice.md) con la causa. Un sorpasso non registrato è un cambio di priorità non
> deciso.

---

## 3. La coda pianificata — quadro d'insieme

| Pos. | Voce | Enunciato | Perché non è in `RU-1` | Innesco | Titolare |
|:-:|---|:-:|---|---|---|
| 1 | `OL-22` Funzioni a ruoli distinti acquisite all'esterno | `[INTENZIONE]` | **Taglio irreversibile `TG-20`, `TG-21`, `TG-22`**: richiedono soggetti distinti, non ore | Decisione su `Q-189` | Committente |
| 2 | `OL-15` Documentazione clinica e refertazione | `[INTENZIONE]` | Taglio `TG-01`, `TG-06`, `TG-07`: ampiezza | Nessuno esterno: capacità | Progetto |
| 3 | `OL-21` Ancoraggio periodico firmato del registro | `[INTENZIONE]` | **Taglio `TG-23`**, irreversibile per il periodo | Nessuno esterno: capacità | Progetto |
| 4 | `OL-02` Terzo partecipante alla sessione | `[INTENZIONE]` | Decisione sulla topologia dichiarata rinviata | Chiusura di `C-2` e misura di `Q-115` | Committente, poi progetto |
| 5 | `OL-16` Facciata di interoperabilità | `[INTENZIONE]` | Taglio `TG-02`: seconda superficie contrattuale | Nessuno esterno: capacità | Progetto |
| 6 | `OL-01` Telemonitoraggio, percorso completo | `[INTENZIONE]` | Contesto più esteso del catalogo | Chiusura di `Q-120` | Progetto |
| 7 | `OL-17` Componente incorporabile white-label | `[INTENZIONE]` | Taglio `TG-03` | Nessuno esterno: capacità | Progetto |
| 8 | `OL-03` Registrazione della sessione lato server | `[INTENZIONE]` | È una **seconda modalità di sicurezza**, non una funzione opzionale | Verifica sul contenitore e chiusura di `C-3` | Progetto |
| 9 | `OL-19` Esercizio: amministrazione, secondo profilo, migrazioni non bloccanti | `[INTENZIONE]` | Tagli `TG-08`, `TG-10`, `TG-11` | Nessuno esterno: capacità | Progetto |
| 10 | `OL-20` Estensione della verifica | `[INTENZIONE]` | Tagli `TG-05`, `TG-12`, `TG-13`, `TG-14` | Nessuno esterno: capacità | Progetto |
| 11 | `OL-04` Teleconsulto, teleconsulenza e second opinion | `[INTENZIONE]` | Ciascuna è una macchina a stati propria con attori ammessi diversi | Chiusura di `OL-15` | Progetto |
| 12 | `OL-05` Teleassistenza | `[INTENZIONE]` | Attori e artefatti diversi | Successiva a `OL-04` | Progetto |
| 13 | `OL-18` Broker di eventi e consumatori multipli | `[INTENZIONE]` | Taglio `TG-04`: un componente in più da installare e sorvegliare | Secondo consumatore richiesto da un tenant reale | Progetto |
| 14 | `OL-06` Canale asincrono e condivisione di documenti in sessione | `[INTENZIONE]` | Non attraversata dal percorso verticale scelto | Nessuno esterno: capacità | Progetto |
| 15 | `OL-07` Conferimento alle infrastrutture documentali | `[IPOTESI]` | I modelli documentali non sono pubblicamente disponibili | Disponibilità del materiale (`Q-07`, `B-7`) | Terzo; il progetto attende |
| 16 | `OL-08` Conformità verificata sull'identità digitale nazionale | `[IPOTESI]` | Richiede ambienti di pre-produzione e credenziali | Accesso agli ambienti | Chi installa fornisce l'accesso |
| 17 | `OL-09` Messaggistica ospedaliera, profili documentali, avvio applicativo | `[IPOTESI]` | Richiedono una controparte con un ambiente di prova | Disponibilità di una controparte | Integratore o ente |
| 18 | `OL-10` Kit di sviluppo in due linguaggi | `[INTENZIONE]` | L'interfaccia versionata è sufficiente alla prima integrazione | Nessuno esterno: capacità | Progetto |
| 19 | `OL-11` Moduli propri di agenda, fatturazione e rendicontazione | `[INTENZIONE]` | `RU-1` riceve l'appuntamento per riferimento | Un adottante privo di agenda propria | Progetto |
| 20 | `OL-12` Contesto autonomo della rendicontazione | `[INTENZIONE]` | Decisione dichiarata rinviata al committente | Chiusura di `C-1` | Committente, poi progetto |
| 21 | `OL-13` Punteggi di scale e questionari validati | `[IPOTESI]` | Regime di licenza non verificato | Chiusura di `B-3` e `Q-11` con esito favorevole | `COMP` |
| 22 | `OL-14` Oscuramento selettivo del contenuto audio-video | `[INTENZIONE]` | Dichiarata non presente nella prima versione | Chiusura di `Q-157` | `COMP`, poi progetto |

**Che cosa non è in questa tabella e va detto qui.** Il **periodo di supporto dichiarato** e il
**piano di dismissione delle versioni** (`C-4`, `Q-186`) non sono voci di coda: sono
**prerequisiti della prima distribuzione**, criteri del traguardo `T-05` e criterio bloccante 18 di
[03 §8](./03-primo-rilascio-utilizzabile.md). Metterli in coda significherebbe ammettere che si
possa distribuire senza dichiarare per quanto tempo si sostiene ciò che si è distribuito.

---

## 4. Le voci una per una

Ogni voce ha la stessa forma. **I criteri di completamento sono binari**: si soddisfano o non si
soddisfano, e la verifica non richiede una discussione.

### `OL-22` — Funzioni a ruoli distinti acquisite all'esterno
*`[INTENZIONE]` · prima posizione · titolare: **committente***

**Che cosa comprende.** L'acquisizione all'esterno delle funzioni che richiedono un soggetto diverso
da chi svolge l'attività: **audit interno** del sistema di gestione della qualità, **riesame del
rilascio**, **verifica di configurazione eseguita da chi non ha scritto il codice**, **revisione
esterna indipendente del codice di sicurezza critico** prescritta da `D18`.

**Perché non è in `RU-1`.** Perché `D54` dichiara un contributore unico e queste funzioni
**presuppongono soggetti distinti per definizione**. Non è un problema di ore: è il taglio
irreversibile `TG-20` — con `TG-21` per la revisione esterna — descritto in
[03 §5.3](./03-primo-rilascio-utilizzabile.md).

**Perché è in prima posizione, davanti a ogni funzione.** Per una ragione che il §2.1 enuncia e che
qui si applica alla lettera: **la perdita non è una sola, si ripete a ogni rilascio.** Un rilascio
senza riesame produce una lacuna datata a quel rilascio; il rilascio successivo, se le condizioni
non cambiano, ne produce un'altra. Ogni mese in cui la decisione non è presa **aggiunge una riga
all'elenco delle lacune** invece di lasciarlo costante, e nessuna funzione della coda ha questa
proprietà.

**Che cosa questa voce non fa, ed è la parte che va letta due volte.** **Non sana il periodo di
`RU-1`.** Un riesame acquisito nel 2027 riesamina i rilasci del 2027: quello di `RU-1` resta senza,
per sempre. La voce restituisce la proprietà **dai rilasci successivi in avanti**, e la sua
posizione in coda serve a rendere quel «successivi» il più vicino possibile.

**Criteri di completamento.**

1. Esiste un soggetto, esterno a chi svolge l'attività, **nominato e registrato**, per ciascuna
   delle funzioni per cui `Q-189` ne ha deciso l'acquisizione.
2. Per ciascuna funzione **non** acquisita all'esterno, esiste la **registrazione formale
   dell'accettazione della lacuna**, con la motivazione, il titolare della decisione e la data: la
   lacuna accettata è una decisione registrata, non un silenzio.
3. Il **primo rilascio successivo** all'acquisizione porta la registrazione corrispondente
   effettivamente prodotta, non la sola disponibilità del soggetto.
4. L'elenco delle lacune dichiarate distingue, riga per riga, quelle **chiuse dal rilascio N in
   avanti** da quelle **datate a un periodo e non chiudibili**.

**Da che cosa dipende.** Interamente da `Q-189`, che è decisione del committente con punto di
decisione al 30 settembre 2026, e da una decisione di spesa.

**Rischi.** `R-02`, `R-22` (le figure specialistiche sono una risorsa scarsa), `R-29`.

### `OL-15` — Documentazione clinica e refertazione
*`[INTENZIONE]` · seconda posizione · titolare: **progetto***

**Che cosa comprende.** Bozza, validazione, **firma**, immodificabilità del documento firmato,
rettifica come nuova versione con catena mantenuta, contenuto modellato come **dataset canonico** sul
set informativo della tipologia documentale propria della televisita, annotazione digitale in luogo
del referto dove il setting di erogazione lo prevede (`V-145`), consegna del documento al sistema di
origine in forma canonica.

**Comprende inoltre, e non per completezza ma per necessità**, i due presidi che il contenuto
clinico persistente richiede e che sono usciti da `RU-1` con esso: l'**oscuramento applicato dal
motore di autorizzazione** con i sei canali di inferenza chiusi (`TG-07`, `V-149`) e l'**accesso
d'emergenza** con motivazione obbligatoria, finestra limitata, notifica e riesame (`TG-06`,
`V-153`). **Consegnare il contenuto clinico senza i suoi presidi sarebbe un difetto, non una
consegna parziale**, ed è la ragione per cui le tre voci sono una sola voce di coda.

**Perché non è in `RU-1`.** Taglio `TG-01`, per ampiezza: è il secondo contesto del percorso, e porta
con sé firma elettronica, marca temporale, catena di rettifica e modellazione del set informativo.

**Perché è in seconda posizione.** Perché è ciò che rende il percorso verticale **completo nel senso
di [01 §4.2](./01-principi-e-metodo.md)**: il caso d'uso di riferimento del progetto è la
restituzione del contenuto clinico al sistema di origine, e finché il percorso si ferma all'esito
strutturato il beneficio per il clinico è dimezzato. È anche la voce che più cambia ciò che chi
installa può provare.

**Criteri di completamento.**

1. Il documento firmato è **immodificabile**, e la rettifica produce una nuova versione con la
   catena mantenuta: una prova tenta la modifica in ogni percorso esposto e fallisce in tutti.
2. Il contenuto è modellato come **dataset canonico**, e una prova verifica che la sostituzione della
   serializzazione **non richieda modifiche al dominio** (`V-07`, `V-136`, `V-143`).
3. **Nessuna precompilazione di contenuto clinico interpretativo**: si precompilano dati anagrafici,
   amministrativi e temporali, e la prova negativa corrispondente passa (`OUT-07`).
4. L'**attestazione della qualità del collegamento** entra nel documento in forma strutturata,
   **misurata dal sistema e confermata dal professionista**, mai generata autonomamente.
5. L'**oscuramento è applicato dal motore di autorizzazione e non dai consumatori**, con i sei canali
   di inferenza chiusi e con dati sintetici di collaudo che comprendono documenti oscurati.
6. L'**accesso d'emergenza** ha motivazione libera obbligatoria, finestra e perimetro limitati,
   notifica e riesame con esito registrato; una prova verifica che l'accesso senza motivazione
   fallisca.
7. La consegna al sistema di origine avviene **passando dal mediatore unico di uscita** (`V-157`).

**Rischi.** `R-23` (deriva verso l'interpretazione: la refertazione assistita è una delle tre
funzionalità a una singola storia utente dall'innalzamento di classe), `R-24`.

### `OL-21` — Ancoraggio periodico firmato della catena del registro
*`[INTENZIONE]` · terza posizione · titolare: **progetto***

**Che cosa comprende.** Lo strato mancante del registro immutabile: l'ancoraggio periodico firmato
della testa della catena presso un punto esterno al sistema che genera gli eventi, con la procedura
di custodia e la verifica corrispondente.

**Perché non è in `RU-1`.** Taglio `TG-23`. È lo strato che richiede un punto di fiducia esterno e
una procedura propria, in un componente già dichiarato come il singolo elemento di maggiore sforzo
dell'intero catalogo di sicurezza.

**Perché è in terza posizione.** Perché la perdita è **ricorrente**: ogni giorno di esercizio senza
ancoraggio è un giorno per cui la non alterabilità **non sarà mai dimostrabile verso un terzo che
non si fidi dell'operatore del sistema**. Attivarlo non retrodata nulla. È la stessa proprietà che
mette `OL-22` in prima posizione, applicata a un componente invece che a un ruolo.

**Criteri di completamento.**

1. La testa della catena è ancorata **con cadenza dichiarata** presso un punto esterno al sistema
   che genera gli eventi, e l'ancoraggio è firmato.
2. La verifica di integrità **usa l'ancoraggio** e distingue nel proprio esito il periodo ancorato da
   quello non ancorato: una catena verificata su un periodo precedente all'attivazione riporta
   esplicitamente **«non ancorato»** e non «verificato».
3. Il fallimento dell'ancoraggio è **un evento sorvegliato**, non un silenzio: una prova sospende il
   punto esterno e verifica che il sistema segnali.
4. La procedura di custodia del materiale di firma dell'ancoraggio è documentata e **non risiede nel
   sistema che produce le registrazioni**.

**Rischi.** `R-20`.

### `OL-02` — Terzo partecipante alla sessione
*`[INTENZIONE]` · quarta posizione · titolare: **committente**, poi progetto*

**Che cosa comprende.** La presenza in sessione di un terzo soggetto: interprete, caregiver che
assiste l'assistito, secondo professionista, operatore sanitario presso il domicilio.

**Perché non è in `RU-1`.** Perché la topologia della sessione oltre due partecipanti è una decisione
dichiarata rinviata (`C-2`, con la parte di misura registrata come `A-5` in
[`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md)), e non
è una decisione tecnica: la topologia a maglia senza componente centrale è l'unica che preserva la
cifratura fino agli estremi, e superarne il limite significa introdurre un componente che **termina
la cifratura**, cioè una terza modalità operativa con proprietà di sicurezza diverse. Il numero
massimo, inoltre, dipende dal budget di trasmissione del partecipante peggio connesso, che si misura
su un dispositivo e una rete di riferimento **non ancora dichiarati** (`Q-115`, `Q-175`).

**Perché è alto in coda, davanti a voci più richieste.** Perché l'interprete è la **misura
alternativa dichiarata** per l'unica non conformità di accessibilità che il progetto ammette, quella
sui sottotitoli in tempo reale (`D24`). Finché il terzo partecipante non esiste, la misura
alternativa non esiste, e una non conformità dichiarata con una misura alternativa inesistente è una
non conformità senza misura alternativa. **Il criterio 3 — legittimità dell'uso — vi si applica
direttamente**, e supera i criteri di sblocco e di valore.

**Criteri di completamento.**

1. Il limite di partecipanti è **dichiarato nella documentazione e applicato dal codice**, con un
   errore comprensibile al partecipante eccedente che ne spiega la ragione e indica l'alternativa; è
   configurazione con un massimo imposto, e un tenant può abbassarlo ma mai alzarlo.
2. Il numero è stato **misurato** sul dispositivo e sulla rete di riferimento dichiarati, non
   stimato, e la misura è conservata come artefatto.
3. La presenza di un terzo è un **oggetto di consenso distinto**, con ciclo di vita proprio, la cui
   revoca non tocca gli altri (`V-146`). È il quarto dei cinque oggetti del modello, e il primo che
   `RU-1` non esercitava.
4. La verifica delle chiavi resta obbligatoria per impostazione predefinita e resta uno stato
   bloccante della macchina a stati anche con tre partecipanti.
5. La presenza del terzo è riportata nell'esito e, quando `OL-15` è disponibile, nel documento
   clinico nel campo previsto dal tracciato, in forma strutturata.

**Se la misura esclude il terzo partecipante.** È l'esito che va dichiarato prima e non scoperto
dopo: in quel caso la misura alternativa per la non conformità di accessibilità **va riesaminata**,
e il riesame è a carico di chi ha dichiarato la non conformità.

**Rischi.** `R-17`, `R-19`.

### `OL-16` — Facciata di interoperabilità
*`[INTENZIONE]` · quinta posizione · titolare: **progetto***

**Che cosa comprende.** La facciata di interoperabilità con documento di capacità, profili fissati
per versione come artefatto di costruzione, e le prove a contratto corrispondenti.

**Perché non è in `RU-1`.** Taglio `TG-02`: è una **seconda superficie contrattuale pubblica** da
mantenere per tutto il periodo di supporto, con la propria cadenza di dismissione, sopra
un'interfaccia che nessun integratore ha ancora esercitato.

**Perché è quinta.** Per la seconda regola del §2.2: **ciò che sblocca chi integra precede ciò che
aggiunge una prestazione**. La sua assenza obbliga ogni integratore a mappare per conto proprio, e
la mappatura fatta ora andrà rifatta quando la facciata esiste — un costo che si moltiplica per il
numero di integratori e che nessuno di essi recupera.

**Criteri di completamento.**

1. La facciata è una **proiezione del dataset canonico**, non una seconda modellazione: una prova
   verifica che l'aggiunta di un campo canonico non richieda modifiche al dominio.
2. I profili sono **fissati per versione come artefatto di costruzione**, non scaricati al momento:
   un cambiamento a monte non può cambiare l'esito di una validazione già eseguita.
3. Il documento di capacità è **generato**, non scritto a mano, e una divergenza fra esso e il
   comportamento effettivo fa fallire la costruzione.
4. Nessuna formula di conformità vietata compare nel materiale prodotto (`V-133`).

### `OL-01` — Telemonitoraggio, percorso completo
*`[INTENZIONE]` · sesta posizione · titolare: **progetto***

**Che cosa comprende.** Arruolamento in un percorso, piano individuale versionato, acquisizione delle
misure da un gateway di terze parti, inserimento manuale da parte dell'assistito o del caregiver,
questionari strutturati, valutazione delle misure contro le regole del piano vigente all'istante di
misura, allarmi, catena di escalation, attesa di rilevazione, aderenza e sorveglianza del volume
atteso.

**Perché non è in `RU-1`, e che cosa è cambiato.** La ragione della destinazione d'uso **è caduta**:
`D55` ha congelato la formulazione su «raccolta differita di parametri per la revisione periodica del
professionista», mantiene Classe IIa e classe di sicurezza software B, ed esclude la formulazione in
tempo reale. Il modello di dominio era già scritto così: **il lavoro non è più a rischio di
riscrittura.** Restano due ragioni. **La prima**: è il contesto più esteso del catalogo dei
requisiti, e sotto `D54` l'ampiezza è dirimente. **La seconda**: la rappresentazione delle regole è
una decisione architetturale aperta (`Q-120`), e realizzare un motore prima di aver deciso quanto
debba essere espressivo produce esattamente l'esito che quella questione vuole evitare — un
linguaggio di programmazione arbitrario eseguito in produzione, che è insieme superficie di attacco e
oggetto non validabile ai fini regolatori.

**Il divieto permanente che `D55` porta con sé.** Nessuna funzione di questa voce può essere scritta
in modo da spostare il sistema verso il **tempo reale clinico**, e **la valutazione va fatta prima di
scrivere la funzione, non dopo**. Non è una raccomandazione: è la condizione a cui la classificazione
assunta resta valida.

**Perché è comunque alta in coda.** Perché è la funzione su cui si fonda la qualificazione che il
progetto ha assunto (`D26`): la valutazione automatica delle soglie è l'elemento che costituisce
interpretazione. Un prodotto che accetta il costo della Classe IIa e non eroga la funzione che quel
costo giustifica ha pagato il prezzo e non ha comprato niente. Con `D58` l'osservazione pesa di più:
il costo della certificazione è ora **nostro**.

**Criteri di completamento.**

1. Un piano individuale versionato è attivabile **solo** se esiste una copertura oraria dichiarata
   per il tenant e per il percorso, e il tentativo di attivarlo senza copertura fallisce in ogni
   configurazione supportata (`V-122`).
2. Il campo della soglia si presenta **vuoto e obbligatorio** in ogni percorso di redazione, e una
   prova negativa verifica che nessuna precompilazione avvenga, nemmeno con i valori del percorso o
   dell'ultimo piano (`V-123`, `OUT-08`).
3. Istante di misura e istante di ricezione sono due campi distinti obbligatori, e le regole operano
   sull'istante di misura; una prova con misure recapitate fuori ordine produce lo stesso esito di
   una prova con misure in ordine (`V-124`).
4. L'assenza di misura è rappresentata come **entità**, con finestra attesa, istante di scadenza e
   causa quando nota; una prova verifica che l'assenza produca una riga e non l'assenza di una riga
   (`V-148`).
5. L'allarme è una **sequenza di eventi immutabili** e lo stato corrente è una proiezione; nessuna
   colonna di stato è aggiornata sul posto (`V-121`).
6. Un destinatario fuori copertura non è un destinatario valido nella catena di escalation: viene
   saltato con motivo registrato, e l'allarme **resta aperto** quando l'escalation fallisce.
7. La valutazione è **deterministica e riproducibile** su vettori di prova versionati, con la
   versione della regola registrata sull'allarme.
8. Il sistema **non deduce** soglie da popolazione o da storico, non interpola le serie, non calcola
   punteggi: le prove negative delle esclusioni corrispondenti passano.
9. **La valutazione di impatto sulla destinazione d'uso congelata da `D55` è eseguita e registrata
   prima della scrittura del motore**, non dopo.

**Da che cosa dipende la data.** Da `Q-120` per la rappresentazione delle regole; da `Q-122` e `B-9`
per il contratto minimo del gateway di misure, che è `[NV]` sulla disponibilità effettiva di due
segnali; da `Q-125` per la codifica dei parametri, con il vincolo che il sistema resti operativo con
il servizio terminologico esterno disattivato (`V-03`); da `Q-124` per la collocazione del registro
degli allarmi nella modalità di esercizio senza conservazione del contenuto clinico.

**Rischi.** `R-17`, `R-23` (è la voce con la maggiore pressione ad ampliarsi verso
l'interpretazione), `R-11`.

### `OL-17` — Componente incorporabile white-label
*`[INTENZIONE]` · settima posizione · titolare: **progetto***

**Che cosa comprende.** L'elemento personalizzato conforme allo standard dei componenti web, con
insieme chiuso e versionato di proprietà di tema validate lato server con verifica del contrasto, e
con gli elementi non tematizzabili né occultabili (`V-163`).

**Perché non è in `RU-1`.** Taglio `TG-03`. L'avvio della sessione avviene per rinvio con token
d'ingresso a uso singolo, che è una via di integrazione completa ma **non consente l'identità visiva
dell'integratore**.

**Criteri di completamento.**

1. L'insieme delle proprietà di tema è **chiuso e versionato**, e una configurazione che degrada il
   contrasto è **rifiutata al salvataggio**, non accettata con avviso: prova negativa.
2. Gli elementi non tematizzabili né occultabili restano tali in ogni configurazione supportata, e
   fra essi l'indicatore di registrazione: prova negativa che tenta di nasconderlo con ogni mezzo.
3. Il rispetto delle preferenze di sistema — movimento ridotto, contrasto elevato, dimensione del
   carattere — **non è disattivabile** dalla personalizzazione.
4. Il componente consuma **le stesse interfacce applicative** offerte agli integratori: nessuna
   capacità gli è riservata (`V-164`).

### `OL-03` — Registrazione della sessione lato server
*`[INTENZIONE]` · ottava posizione · titolare: **progetto***

**Che cosa comprende.** La seconda modalità di sessione prevista da `D23`: il media transita per un
componente di registrazione, la cifratura è terminata sul server, il materiale è cifrato a riposo con
chiavi per tenant e ha una scadenza sempre valorizzata.

**Perché non è in `RU-1`.** Perché **non è una funzione opzionale: è una seconda modalità di
sicurezza.** Comporta un componente distinto con un proprio perimetro, un flusso di consenso
dedicato, una gerarchia di chiavi, una politica di conservazione, una procedura di riproduzione
tracciata e — soprattutto — un'informativa che dichiara esplicitamente all'assistito che **la
sessione non è più cifrata fino agli estremi**.

**Che cosa `RU-1` ha già fatto per lei, e perché è la scelta giusta.** L'indicatore di registrazione
persistente e non occultabile **esiste già** in `RU-1`, con i suoi divieti e le sue prove negative,
benché la modalità non esista, ed è stato **deliberatamente escluso dai tagli** di
[03 §5](./03-primo-rilascio-utilizzabile.md). La ragione è dichiarata in
[03 §3.8](./03-primo-rilascio-utilizzabile.md): un presidio che arriva insieme al rischio che deve
presidiare non è mai stato messo alla prova. Quando `OL-03` arriverà, il presidio più delicato sarà
già in esercizio da un rilascio.

**Criteri di completamento.**

1. La modalità è uno **stato dell'aggregato della sessione**, non un attributo booleano del materiale
   registrato, e la transizione fra le due modalità è tracciata con ora e attribuzione.
2. Non esiste materiale registrato **senza consenso vigente e senza scadenza valorizzata**: entrambe
   le condizioni sono invarianti verificate da prova.
3. La **revoca del consenso ha effetto immediato** sulla registrazione in corso, verificato da una
   prova che revoca a sessione aperta.
4. Il contenitore è **negoziato a runtime** in funzione dei codec effettivamente negoziati, senza
   ricodifica, e contenitore e codec effettivi sono registrati nei metadati (`V-11`, `V-115`).
   **Nessun formato unico è dichiarato in alcun materiale**, e la regola resta in vigore anche ora
   che la verifica corrispondente è stata rinviata con la funzione.
5. L'indicatore di registrazione non è occultabile: la prova che tenta di nasconderlo con ogni mezzo
   previsto dalla configurazione fallisce in tutti.
6. Il materiale registrato **non è documentazione clinica** ed entra nel contesto documentale solo per
   acquisizione esplicita decisa dal professionista e registrata.
7. L'informativa di consenso dichiara esplicitamente la perdita della proprietà di cifratura fino
   agli estremi, in entrambe le lingue, con testo versionato e consenso riferito alla versione del
   testo.

**Rischi.** `R-19`, `R-25` (componente esposto in più).

### `OL-19` — Esercizio: amministrazione, secondo profilo, migrazioni non bloccanti
*`[INTENZIONE]` · nona posizione · titolare: **progetto***

**Che cosa comprende.** Le tre voci che `RU-1` ha spostato su chi installa: l'**interfaccia di
amministrazione** per tenant, registro degli identificatori e registro di fiducia (`TG-10`); il
**secondo profilo di dispiegamento**, su orchestratore (`TG-08`); le **migrazioni per tenant non
bloccanti**, con avanzamento osservabile e fallimento isolato per tenant (`TG-11`). Con esse i **tre
cruscotti versionati** (`TG-09`), che sono presentazione degli stessi dati.

**Perché non è in `RU-1`.** Perché ciascuna sposta costo dal progetto a chi installa **senza
rimuovere alcuna proprietà di sicurezza**, ed è quindi il tipo di taglio che il §5.2 del capitolo
[03](./03-primo-rilascio-utilizzabile.md) qualifica come reversibile con conseguenza operativa. La
conseguenza è però reale e va ricordata: `RU-1` **richiede competenza tecnica per l'amministrazione**
e una **finestra di manutenzione** per gli aggiornamenti.

**Criteri di completamento.**

1. L'interfaccia di amministrazione soddisfa i criteri di accessibilità **come criteri di
   accettazione**, al pari dei percorsi dell'assistito e del professionista: non è un pannello
   interno esente.
2. Nessuna capacità è raggiungibile **solo** dall'interfaccia di amministrazione (`V-164`): la
   configurazione dichiarativa versionata resta una via completa e provata.
3. Il secondo profilo di dispiegamento usa **lo stesso codice e la stessa struttura** del primo, e la
   suite funzionale completa gira su entrambi.
4. Le migrazioni non bloccanti hanno **avanzamento osservabile** e il fallimento su un tenant **non
   blocca gli altri**: una prova provoca il fallimento su un tenant e verifica che gli altri
   completino.

### `OL-20` — Estensione della verifica
*`[INTENZIONE]` · decima posizione · titolare: **progetto***

**Che cosa comprende.** Il recupero della profondità di verifica ridotta per rispettare la data:
scala completa dei profili di rete nella suite media (`TG-12`), misura automatica della latenza da
obiettivo a schermo con prova di regressione (`TG-13`), verifica di riproducibilità estesa a **tutti**
gli artefatti (`TG-14`), e **verifica non degenere** del funzionamento senza terminologie a licenza
vincolata (`TG-05`), che richiede l'esistenza di contenuto codificato e quindi segue `OL-15`.

**Perché non è in `RU-1`, e perché è una voce di coda e non un difetto.** Perché ciò che è stato
ridotto è la **profondità** della verifica, non la sua esistenza: ogni proprietà bloccante di
[03 §8](./03-primo-rilascio-utilizzabile.md) è verificata, e ciò che manca è la copertura degli stati
intermedi e degli artefatti secondari. La distinzione va tenuta ferma perché è ciò che separa una
riduzione dichiarata da una lacuna: **una verifica ridotta è una verifica**, una verifica assente non
lo è.

**Criteri di completamento.**

1. La scala dei profili di rete copre gli stati intermedi del degrado dichiarato, e ogni transizione
   dichiarata ha almeno una prova che la esercita.
2. La latenza da obiettivo a schermo è misurata in integrazione continua, e un peggioramento oltre la
   soglia dichiarata **fa fallire la costruzione**.
3. La verifica di riproducibilità è eseguita **su tutti gli artefatti distribuiti**, con esito
   conservato per ciascuno.
4. La suite funzionale completa gira con le terminologie a licenza vincolata disattivate **su un
   percorso che contiene contenuto codificato**, e passa: è la verifica che `RU-1` ha potuto
   soddisfare solo in forma degenere.

### `OL-04` — Teleconsulto, teleconsulenza e second opinion
*`[INTENZIONE]` · undicesima posizione · titolare: **progetto***

**Che cosa comprende.** Le prestazioni fra professionisti: il teleconsulto fra medici, la
teleconsulenza fra professioni sanitarie diverse, e il parere ulteriore richiesto su un caso già
documentato, che è una variante asincrona del teleconsulto e non una funzione a sé.

**Perché non è in `RU-1`.** Perché ciascuna è **una macchina a stati propria** con attori ammessi
diversi, artefatti obbligatori diversi, obbligo di presenza dell'assistito diverso e insieme di esiti
diverso (`V-140`). Non sono varianti di configurazione della televisita: la tassonomia del progetto
porta due attributi distinti — l'attività e il servizio minimo — che **non coincidono**, e il vincolo
professionale si applica all'**attività**, non al servizio (`V-147`, `Q-147`).

**Perché segue `OL-15`.** Perché il caso già documentato presuppone un documento: senza la
refertazione, il parere ulteriore non ha su che cosa esercitarsi.

**Criteri di completamento.**

1. Ogni prestazione aggiunta è **una riga di catalogo più una macchina a stati**, e nessuna condizione
   è sparsa nel codice: una prova verifica che l'aggiunta non richieda modifiche fuori dai due luoghi
   previsti.
2. L'ammissibilità del canale e degli attori è verificata **in prenotazione**, non in erogazione, e il
   tentativo di prenotare con un attore non ammesso per quell'attività fallisce.
3. L'ambito di consulto è un aggregato **con scadenza**, e la revoca automatica alla scadenza è
   provata come flusso di errore, non come comportamento accessorio.
4. Il vincolo professionale è codificato come regola di dominio **non configurabile dal tenant**, e
   una configurazione che tenti di rilassarlo è rifiutata con errore di validazione.

**Rischi.** `R-23`, `R-24`.

### `OL-05` — Teleassistenza
*`[INTENZIONE]` · dodicesima posizione · titolare: **progetto***

**Che cosa comprende.** Le prestazioni erogate dalle professioni sanitarie non mediche, con i propri
artefatti e i propri esiti.

**Perché segue `OL-04`.** Stessa ragione strutturale — è una macchina a stati propria — con in più una
considerazione di sequenza: buona parte del lavoro di `OL-04` è la generalizzazione del catalogo delle
prestazioni e della selezione della macchina a stati dal tipo. Fatta quella, `OL-05` è prevalentemente
contenuto di catalogo. Consegnarle nell'ordine inverso significherebbe fare due volte la
generalizzazione.

**Criteri di completamento.** I quattro di `OL-04`, più la verifica che il **setting di erogazione
discrimini le regole**: dove la fonte prevede l'annotazione digitale in luogo del referto, il sistema
produce l'annotazione e non pretende un referto (`V-145`).

### `OL-18` — Broker di eventi e consumatori multipli
*`[INTENZIONE]` · tredicesima posizione · titolare: **progetto***

**Che cosa comprende.** Il broker di eventi con l'assetto a nodo singolo per l'installazione presso il
cliente, dietro l'astrazione di pubblicazione già propria del progetto, e con esso i consumatori
multipli per tenant e la riproduzione della cronologia.

**Perché non è in `RU-1`.** Taglio `TG-04`. L'outbox transazionale resta la sorgente di verità e
consegna per chiamata autenticata: la capacità mancante è la **fan-out** verso più consumatori, che
con un solo integratore per tenant non è ancora necessaria.

**Perché è tredicesima e non più su.** Perché è l'unico taglio che **alleggerisce chi installa**: un
componente in meno da configurare, aggiornare e sorvegliare. Reintrodurlo prima che un tenant reale
abbia un secondo consumatore significherebbe restituire peso operativo in cambio di nulla. **L'innesco
è quindi esterno e preciso**: il primo tenant che richieda un secondo consumatore.

**Criteri di completamento.**

1. L'astrazione di pubblicazione **non cambia**: una prova verifica che il dominio non conosca il
   broker, e la sostituzione del pubblicatore non tocca il codice di dominio (`D15`).
2. L'outbox resta **l'unica sorgente** degli eventi in uscita, e la perdita del broker produce
   **ritardo nella consegna, non perdita di eventi**: una prova sospende il broker e verifica la
   ripresa.
3. Le garanzie effettivamente disponibili nell'assetto a nodo singolo sono **accertate e dichiarate**,
   e nessun requisito funzionale dipende da garanzie non disponibili in quell'assetto: è la verifica
   empirica rinviata con questa voce.
4. I consumatori restano **idempotenti per costruzione**, e nessuna busta contiene contenuto clinico.

### `OL-06` — Canale asincrono e condivisione di documenti in sessione
*`[INTENZIONE]` · quattordicesima posizione · titolare: **progetto***

**Che cosa comprende.** Il canale di messaggistica asincrona fra assistito e struttura, e la
condivisione di documenti durante la sessione.

**Perché non è in `RU-1`.** Perché il percorso verticale scelto non lo attraversa. È una delle poche
voci della coda la cui esclusione non dipende da una decisione, da un terzo o da una dipendenza:
dipende solo dal criterio di composizione.

**Criteri di completamento.**

1. Il canale dichiara in modo **persistente e non chiudibile** i tempi di risposta attesi e la propria
   non idoneità all'emergenza, con la formulazione approvata e provata con utenti rappresentativi.
2. Il documento condiviso in sessione **non diventa documentazione clinica** per il solo fatto di
   essere stato condiviso: l'acquisizione è un atto esplicito e registrato.
3. Nessun contenuto clinico è veicolato negli eventi in uscita generati dal canale: si trasmette il
   riferimento, il contenuto si rilegge con chiamata autenticata (`V-135`, `V-161`).
4. Il canale è raggiungibile da un sistema terzo tramite interfaccia documentata e versionata (`V-164`).

### `OL-07` — Conferimento alle infrastrutture documentali nazionali e regionali
*`[IPOTESI]` · quindicesima posizione, non databile dal progetto*

**Perché non è in `RU-1` e perché resta `[IPOTESI]`.** Perché **manca il contenuto, non il progetto**.
I modelli documentali, i codici di tipologia e i metadati di indicizzazione delle tipologie
documentali della telemedicina non sono pubblicamente disponibili (`Q-07`, `B-7`), e la risposta
strutturale è già in vigore: il contenuto informativo è modellato come **dataset canonico** e ogni
serializzazione è sostituibile (`V-07`, `V-136`, `V-143`).

**Che cosa il progetto ha già fatto perché l'attesa non costi niente.** Il dataset canonico è modellato
campo per campo sul set informativo della fonte cogente, non sul profilo di rappresentazione. Quando
il materiale arriverà, il lavoro sarà **la scrittura di un mappatore**, non una migrazione del modello
di dominio.

**Dipende inoltre da `OL-15`**: senza documentazione clinica non c'è nulla da conferire.

**Criteri di completamento.**

1. La verifica di copertura campo per campo fra dataset canonico e profilo di rappresentazione è
   eseguita, con l'analisi degli scostamenti documentata; dove il profilo non ha posto per un campo
   della fonte cogente esiste un'estensione dichiarata o una collocazione motivata (`Q-132`).
2. Il conferimento avviene **passando dal mediatore unico di uscita** (`V-157`).
3. Nessun template è cablato: il mappatore è configurazione versionata, e una prova verifica che la
   sostituzione del mappatore non richieda modifiche al dominio.

**Chi se ne fa carico.** L'interlocuzione per ottenere il materiale è dell'area di conformità (`Q-07`);
la realizzazione è del progetto. **La data dipende da un terzo** e il progetto non la dichiara.

### `OL-08` — Conformità verificata sull'identità digitale nazionale, su tutti i canali
*`[IPOTESI]` · sedicesima posizione, non databile dal progetto*

**Che cosa `RU-1` contiene già.** I realm distinti per contesto clinico e contesto dell'assistito, e
l'accettazione di un'identità già autenticata dal sistema dell'integratore con delega esplicita.

**Che cosa manca, e perché non dipende dal progetto.** La **conformità verificata** sull'intero insieme
dei fornitori richiede ambienti di pre-produzione, credenziali di prova e — per uno dei canali — **due
istanze di fornitore di identità per ciascun fornitore**, perché il contesto di autenticazione
richiesto è configurato staticamente sulla singola istanza (`Q-05`, `D38`). È il lotto di lavoro
sistematicamente sottovalutato, e il moltiplicatore agisce su un insieme la cui cardinalità **si legge
da un registro nazionale e non si cabla**. Ogni variazione delle istanze comporta un nuovo deposito del
documento di metadata presso l'autorità: è costo di procedura, non di codice, e non è comprimibile.

**Il limite che nessun rilascio rimuove.** Il progetto è **conforme e verificabile, non accreditato**
(`V-05`, `D36`, `OUT-22`). Il fornitore di servizi verso la federazione è chi installa. **Questo non
cambia con `D58`**: il ruolo di fabbricante e il ruolo di fornitore di servizi sono cose diverse, e
assumere il primo non avvicina il secondo. I tempi dell'accreditamento **non sono dichiarati da alcuna
fonte primaria**: non compaiono in questa roadmap perché non esistono, non perché non siano stati
cercati.

**Criteri di completamento.**

1. La suite di conformità del canale che lo prevede è superata **per intero**, comprese le prove di
   manipolazione dell'asserzione firmata, ed è eseguita in integrazione continua a ogni costruzione,
   non una volta.
2. Il livello di garanzia propagato è quello **richiesto** e non quello asserito, ed è sempre
   qualificato per distinguere l'autenticazione **eseguita** da quella **riferita** da un integratore
   (`V-154`, `V-165`). Il marcatore corrispondente esiste già in `RU-1`.
3. I tre difetti noti del prodotto di federazione sono chiusi in configurazione **e** sorvegliati da
   una prova che fallisce se la configurazione regredisce. **Già soddisfatto** in `RU-1` (`T-04`
   criterio 3).
4. L'esito della verifica sull'inoltro del contesto di autenticazione richiesto attraverso
   l'intermediazione è **registrato**, e fino a quel momento la documentazione pubblica **non descrive
   il meccanismo** (`Q-160`, `B-8`).
5. Il canale privo di dipendenze esterne è completabile e completato senza attendere gli altri due: è
   l'unico su cui il progetto non dipende da nessuno.

**Rischi.** `R-13`, `R-14`, `R-15`, `R-11`.

### `OL-09` — Messaggistica ospedaliera, profili di interoperabilità documentale e avvio applicativo in contesto clinico
*`[IPOTESI]` · diciassettesima posizione, non databile dal progetto*

**Perché non è in `RU-1`.** Perché tutte e tre richiedono una **controparte con un ambiente di prova**.
Un adattatore di messaggistica ospedaliera scritto senza un motore di integrazione reale contro cui
provarlo è un adattatore che funziona sugli esempi; un profilo di interoperabilità documentale
dichiarato senza una prova di connettività è una dichiarazione; un avvio applicativo in contesto
clinico senza un server della controparte è una simulazione di sé stesso.

**Che cosa il progetto può fare da solo, e che cosa no.** Può pubblicare il contratto, le prove a
contratto in entrambe le direzioni e i dati sintetici. **Non può** dichiarare conformità: la perdita
informativa nella traduzione fra formati **va misurata, non presunta**, e la misura richiede messaggi
reali di una controparte reale.

**Criteri di completamento.**

1. Esiste almeno una controparte con cui la connettività è stata provata da estremo a estremo, con
   esito registrato e con la perdita informativa nella traduzione **misurata e dichiarata**.
2. Nessuna formula di conformità vietata compare nel materiale prodotto (`V-133`).
3. Il codice di tipo dell'identificatore nel canale legacy è **contrattuale con l'integratore** e
   documentato come tale, non presentato come conformità a una tabella.

### `OL-10` — Kit di sviluppo in due linguaggi
*`[INTENZIONE]` · diciottesima posizione · titolare: **progetto***

**Perché non è in `RU-1`.** Perché è **comodità, non capacità**: l'interfaccia applicativa versionata e
le prove a contratto sono sufficienti a completare una prima integrazione, e un kit che precedesse la
stabilizzazione dell'interfaccia sarebbe da riscrivere.

**Perché è così in basso.** Perché un kit di sviluppo è un **terzo contratto pubblico** da mantenere
per il periodo di supporto — dopo l'interfaccia propria e la facciata di `OL-16` — con la propria
cadenza di dismissione e il proprio preavviso. Sotto `D54` ogni contratto pubblico in più è capacità
ricorrente sottratta per sempre allo sviluppo ([01 §9](./01-principi-e-metodo.md)).

**Criteri di completamento.**

1. Il kit è **generato** dal descrittore dell'interfaccia versionato, non scritto a mano: una
   divergenza fra kit e interfaccia è impossibile per costruzione, non evitata per disciplina.
2. Ogni esempio del kit è **verificato in integrazione continua**; un esempio che non si compila o non
   si esegue fa fallire la costruzione.
3. Il kit non contiene logica di dominio: se una regola vive nel kit, la stessa regola non è applicata
   dal server e il vincolo `V-164` è violato.

### `OL-11` — Moduli propri di agenda, fatturazione e rendicontazione
*`[INTENZIONE]` · diciannovesima posizione · titolare: **progetto***

**Perché non è in `RU-1`.** Perché il caso d'uso di riferimento del progetto è l'integrazione con un
sistema che **ha già** un'agenda: `RU-1` riceve l'appuntamento per riferimento e non diventa il dato di
riferimento.

**Il vincolo che governa questa voce.** `D14` è esplicita: i moduli propri esistono ma sono
**disattivabili e sostituibili per configurazione**, e quando esiste un modulo regionale o
dell'integratore il sistema **si integra invece di duplicare**. Un modulo proprio che non si possa
spegnere non è un modulo proprio: è una duplicazione imposta.

**Criteri di completamento.**

1. Ogni modulo proprio è **spegnibile per configurazione** e, da spento, il percorso funziona
   integralmente attraverso l'interfaccia del modulo sostituibile corrispondente.
2. La suite funzionale completa gira **due volte**: una con i moduli propri attivi, una con tutti
   sostituiti da attuazioni di prova. Entrambe passano.
3. Nessuna capacità è disponibile **solo** con il modulo proprio attivo: la matrice delle capacità nelle
   due configurazioni è identica, e la verifica è automatica.

### `OL-12` — Contesto autonomo della rendicontazione
*`[INTENZIONE]` · ventesima posizione · titolare: **committente**, poi progetto*

**Perché non è in `RU-1`.** Perché è una decisione dichiarata rinviata al committente (`C-1`) e **una
decisione rinviata non si prende in una proposta di modifica**.

**Perché è in coda e non fra i desiderabili.** Perché la sua assenza ha un costo dichiarato e non nullo:
finché la rendicontazione non è un contesto autonomo, il divieto per cui il profilo del pagatore è
amministrativo per costruzione (`V-166`, `OUT-18`) è una **convenzione di codice**, verificabile solo
con una prova dedicata e soggetta all'erosione, invece di essere un **confine** verificabile
automaticamente. Il rischio non è che il sistema oggi faccia la cosa sbagliata: è che in una versione
futura un evento destinato alla liquidazione acquisisca un riferimento a un documento clinico senza che
nulla lo impedisca strutturalmente.

**Criteri di completamento.**

1. Il divieto è verificato da una **regola di dipendenza** che fa fallire la costruzione, non da una
   prova che si può dimenticare di aggiornare.
2. L'evento destinato alla liquidazione trasporta identificativo della prestazione, esito
   amministrativo e importo, **e nient'altro**: una prova negativa tenta di aggiungervi un riferimento
   clinico e fallisce.

### `OL-13` — Punteggi di scale e questionari clinici validati
*`[IPOTESI]` · ventunesima posizione · titolare: **`COMP`***

**Perché non è in `RU-1`.** Per una misura cautelativa in vigore e motivata: il regime di licenza degli
strumenti non è verificato (`B-3`, `Q-11`), le scale e i questionari validati hanno licenze proprie
distinte da quelle delle terminologie, e la verifica va fatta **strumento per strumento sulla licenza
primaria**, non sulla dichiarazione del contenitore che li ricomprende.

**Perché la misura cautelativa è nella direzione giusta.** Perché è **reversibile senza migrazione**: il
sistema conserva la risposta al questionario, con riferimento a una versione immutabile dello
strumento; aggiungere in seguito il calcolo su risposte già conservate è possibile. L'ordine inverso non
lo è.

**Le due avvertenze che questa voce si porta dietro.** La prima: se il calcolo verrà introdotto, va
valutato il confine con la finalità interpretativa, perché **un punteggio calcolato dal sistema è più
vicino a quel confine di una risposta conservata** — ed è una delle tre funzionalità a una singola
storia utente dall'innalzamento di classe. La seconda: il contenuto degli strumenti non è nella
distribuzione ed è dato di configurazione per tenant, caricato da chi installa.

**Criteri di completamento.** Il primo è di conformità e precede tutti gli altri: **esiste la
determinazione di regime per ciascuno strumento ammesso**, verificata sulla licenza primaria e
registrata. Senza quella, i criteri tecnici non si esaminano.

### `OL-14` — Oscuramento selettivo del contenuto audio-video
*`[INTENZIONE]` · ventiduesima posizione · titolare: **`COMP`**, poi progetto*

**Perché non è in `RU-1`.** Perché è dichiarata non presente nella prima versione ed è registrata come
esclusione riapribile con il normale governo del prodotto (`Q-157`). **Dipende inoltre da `OL-03`**:
senza registrazione della sessione non esiste contenuto audio-video da oscurare.

**Perché il problema è strutturalmente raro.** Due elementi del progetto ne riducono la frequenza alla
radice: la registrazione è **eccezione e non regola**, disabilitata per impostazione predefinita a ogni
livello e con consenso specifico per sessione; e per i tipi di prestazione marcati non registrabili la
funzione è **assente e non disattivabile neppure da un amministratore**.

**Che cosa resta da decidere prima di realizzarla.** Se il rilascio parziale — il solo audio della parte
richiedente — soddisfi l'istanza dell'interessato, o se la valutazione caso per caso vada comunque
documentata. È una determinazione di conformità, non di prodotto.

---

## 5. Ciò che è soltanto desiderabile

Nessuna delle voci seguenti è pianificata. Nessuna ha una posizione, un criterio o un innesco. Ciascuna
dichiara **che cosa manca perché diventi pianificata**, che è l'unica informazione utile a chi legge.

### `DS-01` — Sottotitoli in tempo reale

**Perché sarebbe desiderabile.** Rimuoverebbe l'unica non conformità di accessibilità che il progetto
dichiara, e renderebbe non necessaria la misura alternativa di `OL-02`.

**Che cosa manca.** Un motore di trascrizione, che è un componente con tre implicazioni non risolte:
**sovranità** — nessuna dipendenza obbligatoria fuori dall'Unione è ammessa (`V-01`), e i motori con la
qualità richiesta sono in prevalenza servizi remoti; **licenza** — un modello va collocato nei regimi
della politica sui contenuti di terzi come qualunque altro contenuto; **qualificazione** — un
sottotitolo è veicolo di comunicazione, ma una trascrizione che riassumesse, correggesse o
normalizzasse contenuto clinico non lo sarebbe più, e `D55` rende il confine più stretto, non più
largo.

**Che cosa il progetto ha comunque fatto.** Il canale dati dei sottotitoli è **definito e versionato nel
protocollo**, come impone `D24`. Innestare un motore in futuro non richiede di riprogettare la sessione.

### `DS-02` — Lingue ulteriori oltre l'italiano e l'inglese

**Perché sarebbe desiderabile.** Il decreto sulle infrastrutture regionali richiede il multilingua, e
l'architettura di internazionalizzazione è predisposta fin dall'inizio.

**Che cosa manca.** Chi traduce e chi **mantiene l'allineamento**. Con due lingue l'obbligo di
integralità di `D50` già raddoppia il costo marginale di ogni modifica documentale; con tre lo
triplica, **per sempre**, e sotto `D54` quel costo grava su una sola persona. Prima di aggiungere una
lingua va dimostrato che il controllo di divergenza fra le due esistenti non produce rilievi in modo
stabile **su tutto il corpus e non solo sulle aree prerequisito**: è la condizione che `T-09` chiude, e
finché non è chiusa questa voce non può nemmeno essere valutata.

### `DS-03` — Applicazione nativa per dispositivi mobili

**Perché sarebbe desiderabile.** Accesso a capacità del dispositivo non disponibili al navigatore, e
notifiche più affidabili.

**Che cosa manca, e perché non è una decisione tecnica.** Un artefatto distribuito attraverso un canale
di distribuzione applicativa ha **un regime proprio**: due catene di distribuzione, due cicli di
aggiornamento, due superfici da sorvegliare, e un intermediario che decide se e quando un aggiornamento
di sicurezza raggiunge l'utilizzatore — il che è in tensione diretta con un livello di servizio di
rimedio espresso in giorni (`V-185`). Il requisito del progetto è **mobile first sul web**, non
un'applicazione nativa.

### `DS-04` — Firma grafometrica e lettura della tessera sanitaria da lettore locale

**Perché sarebbero desiderabili.** Sono capacità ricorrenti nel profilo di integratore su cui il
progetto è disegnato.

**Che cosa manca, e perché probabilmente non arriverà.** Sono precisamente le capacità che
**l'integratore ha già**, e `D14` è esplicita: dove esiste un modulo dell'integratore, il sistema si
integra invece di duplicare. Realizzarle significherebbe costruire una seconda volta qualcosa che il
sistema di destinazione possiede, con hardware, controllori di periferica e superficie di supporto
propri. Diventerebbero pianificabili solo per un adottante che non abbia un sistema di origine, cioè per
il caso d'uso su cui il progetto **non** è disegnato.

### `DS-05` — Cruscotti clinici aggregati e indicatori di popolazione

**Perché sarebbero desiderabili.** Una struttura che eroga prestazioni a distanza vuole misurare il
proprio servizio.

**Che cosa manca, e qual è il confine.** Gli indicatori **di servizio** — volumi, esiti amministrativi,
disponibilità, qualità del collegamento — sono già misurati e non sono questa voce; la loro
presentazione è `OL-19`. Ciò che manca, ed è desiderabile e insieme pericoloso, è l'aggregazione
**clinica**: sfiora l'uso secondario dei dati, che ha basi giuridiche e percorsi propri, e sfiora la
produzione di informazione clinica nuova. Perché diventi pianificabile serve prima una determinazione
sul confine, non una specifica di cruscotto.

### `DS-06` — Federazione fra installazioni distinte

**Perché sarebbe desiderabile.** Consentirebbe un teleconsulto fra due strutture che usano due
installazioni separate senza che nessuna delle due debba ospitare l'altra.

**Che cosa manca.** Un **modello di fiducia fra installazioni**, che oggi non esiste: il registro di
fiducia del progetto è per tenant, non fra installazioni, e la sua estensione porterebbe con sé una
gerarchia di attestazioni, una revoca fra domini amministrativi diversi e una ripartizione di
responsabilità che oggi non è nemmeno formulata. È la voce più distante di questo elenco.

### `DS-07` — Modalità fuori linea per il contenuto clinico

**Perché sarebbe desiderabile.** Continuità operativa in condizioni di rete assente.

**Perché non è pianificata, e la ragione è dichiarata come limite.** Il limite 17 di
[03 §9](./03-primo-rilascio-utilizzabile.md) è una **scelta**, non una mancanza: contenuto clinico su un
dispositivo che il titolare del trattamento non controlla è un rischio che il progetto non assume. La
sola variante che potrebbe diventare pianificabile è la conservazione locale temporanea di una **misura
inserita senza connettività**, che è dato prodotto dall'assistito e non contenuto clinico altrui, ed è
già un requisito del contesto di `OL-01`.

---

## 6. Perché questa coda ha questa forma, in tre osservazioni

**Prima — e la conclusione si è capovolta rispetto alla versione precedente di questo capitolo.** Prima
di `D53`, nove voci su quattordici non dipendevano dalla capacità del progetto ma da decisioni altrui,
e la conseguenza dichiarata era che **aumentare la capacità non avrebbe accorciato la coda**. Dopo i
tagli, la coda contiene **ventidue voci, e dodici dipendono soltanto dalla capacità**: sono le voci
uscite da `RU-1` per effetto di `D53` e `D54`, che per definizione non hanno altro ostacolo che il
tempo di una persona. **La conclusione è quindi opposta e va detta con la stessa chiarezza: oggi
aumentare la capacità accorcia la coda, e prima non lo faceva.** È l'effetto di programma più
significativo della riduzione di ambito, ed è un argomento che appartiene al committente, non al
pianificatore.

**Seconda — le prime tre posizioni non sono funzioni.** `OL-22`, `OL-15` e `OL-21`: la prima è
l'acquisizione di ruoli, la terza è uno strato di garanzia di un componente già presente. Stanno lì
perché la loro assenza produce una **perdita che si ripete a ogni rilascio**, e nessuna funzione ha
questa proprietà. Una coda ordinata per valore funzionale visibile le avrebbe messe in fondo, ed è
precisamente l'errore che il criterio 2 di [01 §3](./01-principi-e-metodo.md) esiste per evitare.

**Terza — nessuna voce di questa coda rimuove il limite d'uso.** Nemmeno tutte insieme. **Oggi il
prodotto non reca marcatura CE**, non è coperto da alcuna dichiarazione di conformità, e non è
utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali. Che il progetto intenda
assumere il ruolo di fabbricante (`D58`) è pianificazione interna con un proprio calendario in
[02 §5](./02-traguardi.md), **non è una data di marcatura e non va citata come tale** (`V-171`,
`V-280`). Una coda di funzioni non è un percorso di conformità, e presentarla come tale sarebbe
l'errore più costoso di tutto il documento.

---

## 7. Ciò che non torna in nessun rilascio

Non è una parte di questo capitolo: è un rinvio, e va letto come tale.

Le esclusioni definitive vivono in
[`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), ciascuna con
identificativo `OUT-nn`, categoria di riapribilità e **modo in cui è verificata**. Comprendono
l'interpretazione clinica in ogni sua forma, la deduzione delle soglie, il triage calcolato, la verifica
delle interazioni fra farmaci, il dialogo diretto con i dispositivi medici domiciliari, il canale di
emergenza, il riconoscimento biometrico, l'indice di riconciliazione delle identità, la mediazione
dell'accesso di un pagatore al fascicolo e la conservazione a norma.

Quattro precisazioni che riguardano questa coda e non quel capitolo:

1. **Un'esclusione di categoria `NORM` non è riapribile finché la fonte è in vigore.** Non entra in
   questa coda, non entra fra i desiderabili, e una richiesta in tal senso non è una proposta di
   funzione: è una richiesta di violare una fonte.
2. **Un'esclusione di categoria `QUAL` richiede una valutazione di impatto regolatorio registrata, e la
   valutazione precede la stima dello sforzo.** L'ordine è vincolante, perché stimare per primo fa
   apparire economica una modifica che comporta una rivalutazione di conformità. **Con `D58` la
   rivalutazione è a carico nostro**, e l'ordine pesa di più.
3. **Tre funzionalità sono a una singola storia utente dall'innalzamento di classe** — allerta su
   soglia, elaborazione dell'immagine, refertazione assistita — e sono sotto controllo delle modifiche.
   Una proposta che le tocchi non è una proposta di funzione: è una proposta di modifica del
   dispositivo.
4. **`D55` aggiunge un divieto permanente**: nessuna funzione può essere aggiunta se sposta il sistema
   verso il **tempo reale clinico**, e la valutazione va fatta **prima** di scrivere la funzione. Vale
   per ogni voce di questa coda, e in particolare per `OL-01`.

---

## 8. Come una voce cambia categoria

Le transizioni ammesse sono quattro, e ciascuna ha una condizione verificabile.

| Da | A | Condizione | Chi la accerta |
|---|---|---|---|
| Desiderabile | Pianificata | Esistono insieme: criterio di completamento binario, innesco dichiarato, titolare nominato (`V-187`) | Revisione di [00 §8](./00-indice.md) |
| Pianificata | Desiderabile | L'innesco è decaduto e non è sostituibile | Revisione, con la causa registrata |
| Pianificata | Fuori perimetro | Una determinazione di conformità o una decisione del committente la esclude | `COMP` o committente, con voce `OUT-nn` nuova |
| Fuori perimetro | Pianificata | La procedura di [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) §7, con il costo proporzionato alla categoria | Secondo la categoria |

A queste si aggiunge, dopo `D53`, una quinta transizione che prima non esisteva e che va dichiarata
perché è quella che ha generato sei delle ventidue voci — `OL-15`…`OL-20`:

| Da | A | Condizione | Chi la accerta |
|---|---|---|---|
| **Perimetro del primo rilascio** | **Pianificata** | Un taglio **reversibile** registrato in [03 §5.2](./03-primo-rilascio-utilizzabile.md), con la sua voce `TG-nn`, la sua conseguenza per chi installa e la sua posizione in questa coda | Il documento stesso: la transizione è compiuta e registrata, non pendente |

Le altre due voci nuove — `OL-21` e `OL-22` — **non discendono da questa transizione**, e la
differenza è quella che il §9 ripete: nascono da tagli **irreversibili**, non restituiscono il periodo
perduto, e ciò che rendono disponibile vale **dai rilasci successivi in avanti**.

**Che cosa non è ammesso, ed è la parte che conta.** Una voce non passa da desiderabile a pianificata
perché qualcuno l'ha chiesta con insistenza, perché compare in un capitolato o perché è stata citata in
una presentazione. Passa quando ha i tre elementi di `V-187`. E **un taglio irreversibile non diventa
una voce di coda**: `OL-22` e `OL-21` non restituiscono il periodo perduto, e i loro testi lo dicono
esplicitamente.

---

## 9. Che cosa questo capitolo non promette

- **Non promette che l'ordine non cambi.** Promette che ogni variazione passi dalla revisione con la
  causa registrata, e che un sorpasso senza innesco verificato sia una violazione dichiarata e non una
  riorganizzazione silenziosa.
- **Non promette una data per nessuna voce.** Nessuna. Le voci `[IPOTESI]` dipendono da terzi; le voci
  `[INTENZIONE]` dipendono da una capacità dichiarata che fino al 30 novembre 2026 è **interamente
  impegnata** dal piano del capitolo [02](./02-traguardi.md).
- **Non promette che tutte le voci arrivino.** Una coda in cui ogni voce arriva è una coda in cui
  nessuna è stata valutata. Il §8 descrive esattamente come una voce esce.
- **Non promette che ciò che è stato tagliato torni per intero.** I tagli reversibili di
  [03 §5.2](./03-primo-rilascio-utilizzabile.md) tornano come voci di questa coda; i quattro tagli
  irreversibili del §5.3 **non tornano**, e ciò che le voci `OL-22` e `OL-21` restituiscono vale dai
  rilasci successivi in avanti, mai per il periodo di `RU-1`.
- **Non promette che la somma delle voci renda il prodotto utilizzabile su pazienti reali.** Non lo
  rende, e nessuna configurazione lo rende.

---

**Prosegue in**: [05 — Rischi e dipendenze](./05-rischi-e-dipendenze.md), dove i rischi citati in questo
capitolo — e le dipendenze esterne da cui dipendono dieci voci su ventidue — sono descritti con
probabilità, impatto sul calendario, indicatore anticipatore, risposta e titolare.
