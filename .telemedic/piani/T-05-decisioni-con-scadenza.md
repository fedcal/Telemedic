# Piano di esecuzione - `T-05`, decisioni con scadenza anteriore al primo codice

> **Che cos'è questo documento.** È **pianificazione interna del progetto** (`D57`) per il solo
> traguardo `T-05`, come è enunciato in `docs/09_roadmap/02-traguardi.md` §3. Non decide nulla: le
> decisioni sono del committente. Ciò che questo piano fa è **porre le domande nella forma in cui
> sono decidibili**, ordinarle per la data oltre la quale non sono più recuperabili, e dichiarare
> per ciascuna **che cosa nel codice la presuppone** e **che cosa accade se non arriva in tempo**.
>
> **Nessuna data di marcatura compare in questo documento, in nessuna forma** (`V-171`, `V-280`).

---

## 1. Il traguardo alla lettera

| Voce | Valore, dalla fonte |
|---|---|
| Identificativo e titolo | `T-05` - *Decisioni con scadenza anteriore al primo codice, chiuse* |
| Classe di attività | **`C`** - sul percorso critico altrui |
| Classe di enunciato | **`[INTENZIONE]`** |
| Data | **3 ottobre 2026** |
| Innesco | Immediato: sono decisioni che si pongono, non attività che si eseguono |
| Titolare | **Committente** per le decisioni; **contributore unico** per la *posizione* della domanda e per la registrazione dell'esito |
| Rischi dichiarati | `R-17`, `R-18`, `R-30` |

**Perché è `[INTENZIONE]` e non `[IMPEGNO]`, e va detto subito.** La data è quella entro cui il
progetto **le pone**, non quella entro cui vengono prese. Il progetto non ha l'autorità di chiudere
le voci di questo elenco; ha l'autorità di renderle impossibili da ignorare. Presentare `T-05` come
impegno sarebbe una violazione di `V-184`.

**Obiettivo, alla lettera.** *«Nessuna decisione dichiarata rinviata viene presa d'ufficio in una
proposta di modifica.»* È la formulazione operativa di `R-18`, e la regola che la sorregge sta in
`docs/02_architecture/09-decisioni-rinviate.md` §1: *«una decisione elencata qui non può essere presa
d'ufficio in una pull request. Chi si imbatte in una di queste questioni durante la realizzazione
apre una voce in bacheca; non sceglie l'opzione più comoda per proseguire.»*

---

## 2. Che cosa significa «scadenza anteriore al primo codice»

Va definito con precisione, perché è il criterio che ordina tutto il resto.

**Il primo codice non esiste prima del 26 settembre 2026.** `V-182` vieta ogni riga di codice
applicativo prima di `T-03`, con la sola eccezione del codice usa-e-getta delle verifiche di `T-04`,
dichiarato tale e residente in area separata. Il diagramma di `02-traguardi.md` §7 colloca `T-08` -
lo scheletro eseguibile e il percorso verticale - fra il **3 ottobre** e il **14 novembre 2026**.

Ne discendono **tre soglie distinte**, e confonderle è l'errore che questo piano esiste per evitare.

| Soglia | Data | Che cosa si cristallizza |
|---|---|---|
| **Catena di costruzione** | 26 settembre 2026 (`T-03`) | Ciò che la pipeline fissa con il primo uso: nomi dei comandi, formati dei registri generati, liste di ammissione, controlli bloccanti |
| **Primo codice applicativo** | 3 ottobre 2026 (avvio di `T-08`) | Ciò che il dominio e la persistenza incorporano: forma del registro immutabile, esclusioni con prove negative, superficie delle interfacce pubbliche |
| **Primo rilascio** | 30 novembre 2026 (`T-10`) | Ciò che il fascicolo dichiara: periodo di supporto, lacune datate, differenza fra materiale pubblico e artefatto |

**La regola che ordina l'elenco del §3.** Una decisione la cui data cade **dopo** il codice che la
presuppone non è più una decisione: è una **riscrittura**. Ne discende che l'ordine di questo elenco
non è quello dell'importanza percepita né quello dei punti di decisione dichiarati, ma quello della
**data oltre la quale la decisione non è più recuperabile** - che in tre casi è **già passata**.

---

## 3. Le decisioni, ordinate per data oltre la quale non sono più recuperabili

### 3.0 Quadro d'insieme

| Ordine | Voce | Data di non recuperabilità | In `T-05`? | Stato reale |
|:-:|---|---|:-:|---|
| 1 | `Q-185` - materiale pubblico non allineato a `D19` e `D29` | **Già in corso**, ogni giorno | Sì (criterio 7) | Aperta |
| 2 | `Q-146` - allineamento al glossario nazionale | **Già superata**: doveva precedere la traduzione inglese | No | Aperta |
| 3 | `Q-284` - firma crittografica obbligatoria dei commit | **Già in corso**, ogni commit | No | Adottata in locale, passo finale aperto |
| 4 | `Q-280` - forma giuridica del soggetto e profilo della persona responsabile | **19 settembre 2026** | Sì (criterio 5) | Aperta |
| 5 | `Q-112` - regime di licenza dell'estensione per serie temporali | **26 settembre 2026** (`T-03`) | No | Aperta, `[NV]` |
| 6 | `Q-191` - profilo minimo praticabile dell'ambiente locale | **26 settembre 2026** (`T-03`) | No | Aperta |
| 7 | `Q-192` - registro unico dei parametri di configurazione | **26 settembre 2026** (`T-03`) | No | Aperta |
| 8 | `Q-190` - nomi e forma dei comandi dell'ambiente locale | **26 settembre 2026** (`T-03`) | No | Aperta |
| 9 | `Q-189` - ripartizione delle registrazioni a ruoli distinti | **30 settembre 2026** | Sì (criterio 6) | Aperta |
| 10 | `B-2` e residuo di `B-1` - motore, archivio e parametri del registro immutabile | **3 ottobre 2026** (avvio di `T-08`) | No | Aperte |
| 11 | `Q-145` - conferma delle sei rinunce deliberate | **3 ottobre 2026** | Sì (criterio 4) | Aperta |
| 12 | `Q-115` - dispositivo e rete di riferimento | **3 ottobre 2026** | No | Aperta, `[NV]` |
| 13 | `Q-111` - limite dichiarato di partecipanti | **3 ottobre 2026** per la dichiarazione | Sì (criterio 3) | **Parzialmente risolta** (`ADR 0028`); resta il numero, `[NV]` |
| 14 | `C-4` / `Q-186` - periodo di supporto dichiarato | **15 ottobre 2026** dichiarata; il codice la presuppone prima | Sì (criterio 1) | Aperta |
| 15 | `Q-281` - differenza fra materiale pubblico e ciò che `RU-1` consegna | **31 ottobre 2026** | No | Aperta |
| - | `Q-110` - topologia del segnale su più istanze | - | Sì (criterio 2) | **Risolta** (`ADR 0012`) |

Le voci senza data, il cui innesco è un evento e non un giorno, sono al §3.3.

### 3.1 Le tre voci la cui scadenza è già passata o è continua

**1. `Q-185` - La pagina pubblica non è allineata alle riformulazioni approvate con `D19` e `D29`.**
*Perché scade prima del codice.* Non è il codice a presupporla: è il fatto che **la destinazione
d'uso di un dispositivo si ricava anche dal materiale promozionale**, e un'affermazione non allineata
alla dichiarazione formale **modifica la destinazione d'uso**. Poiché il perimetro del dominio, la
classificazione in Classe IIa e l'intero corpus della valutazione clinica sono scritti sulla
destinazione d'uso congelata da `D55`, un materiale pubblico che ne dichiari un'altra rende
ambigua la formulazione su cui il codice sarà scritto.
*Perché è la prima.* Il punto di decisione dichiarato è il 31 ottobre 2026, ma quella non è la data
di non recuperabilità: **un periodo di pubblicazione non si annulla**. `R-19` è *Accertato* con
impatto `I5` e il suo indicatore è **la durata**. Ogni giorno in cui la decisione non è presa
aggiunge una riga a un danno che non si toglie decidendo dopo.
*Se non arriva in tempo.* Il danno prosegue e cresce, e alla pubblicazione di `RU-1` si somma a
`Q-281`: la distanza fra ciò che il materiale dichiara e ciò che il rilascio consegna diventa
verificabile da chiunque.

**2. `Q-146` - Allineamento al Glossario nazionale di Telemedicina e al glossario dell'infrastruttura
nazionale.**
*Perché scade prima del codice.* Il glossario di dominio fissa il **linguaggio ubiquo**, e il
linguaggio ubiquo è ciò che diventa nome di aggregato, di entità, di campo e di evento nel momento in
cui `T-08` scrive il modello. Rinominare dopo non è una modifica testuale: è una migrazione che
tocca dominio, eventi, contratti pubblici e matrice di tracciabilità.
*Perché la sua scadenza è già superata.* `Q-146` prescrive che l'allineamento sia compiuto **prima
del congelamento del capitolo di glossario di dominio e prima della traduzione inglese**, perché *«una
divergenza scoperta dopo si propaga su due lingue»*. La revisione del 26 agosto 2026 registra che la
traduzione ha chiuso **la guida dei fondamenti per intero** e **l'area di conformità**: la condizione
temporale posta dalla questione è quindi superata, e l'allineamento non risulta eseguito.
*Se non arriva in tempo.* La divergenza, se esiste, è già su due lingue, e `R-16` la qualifica `I5`
sul piano regolatorio: *«un contenuto normativo che dice due cose diverse in due lingue non è un
problema di traduzione: è un difetto documentale in un dispositivo medico»*, e non si «corregge» -
obbliga a riemettere e a dimostrare da quando esisteva.

**3. `Q-284` - Firma crittografica obbligatoria dei commit sul ramo.**
*Perché scade prima del codice.* La procedura di controllo dei documenti la prescrive, e la
registrazione di approvazione in un modello «documenti come codice» poggia sulla corrispondenza fra
revisione, revisore e approvazione. Un commit non firmato **non è firmabile a posteriori** senza
riscrivere la storia, e `00 §8.3` vieta di riscrivere la storia.
*Stato reale.* La configurazione locale è adottata (chiave, formato, firma di commit e di tag); resta
aperto un solo passo, con innesco preciso e non con una data: il caricamento della chiave pubblica,
senza il quale i commit firmati risulterebbero non verificati.
*Se non arriva in tempo.* Ogni commit prodotto nel frattempo resta privo di firma verificabile, e
l'insieme dei commit del periodo di `RU-1` resta una lacuna datata come quelle di `Q-189` - con la
differenza che questa è tecnicamente evitabile.

### 3.2 Le voci con una data

**4. `Q-280` - 19 settembre 2026 - Forma giuridica del soggetto fabbricante e profilo della persona
responsabile.**
*Perché scade prima del codice.* Non è il codice a presupporla: è **tutto ciò che viene dopo il
codice**. È in questo elenco perché è di **classe `B`** - poche ore e molti mesi - e perché il ritardo
non si recupera lavorando di più. È anche il criterio 1 di `T-14`, e il piano di quel traguardo la
tratta per esteso.
*Se non arriva in tempo.* Il passo iniziale del percorso slitta e con esso, **integralmente**, tutto
ciò che vi poggia (`R-30`, *Accertato*, `I3 crescente`).

**5. `Q-112` - 26 settembre 2026 - Regime di licenza delle funzionalità avanzate dell'estensione per
serie temporali.**
*Perché scade prima del codice.* Il controllo di licenza dei componenti è **fra i controlli bloccanti
dal primo giorno** di `T-03`, e il registro dei componenti di terze parti è generato dalla distinta e
arricchito da annotazioni versionate: un componente presente nella distinta e assente dalle
annotazioni fa fallire la costruzione. Perché il controllo passi, l'annotazione deve essere **vera**,
e oggi l'affermazione sulla licenza è marcata `[NV]` in `docs/01_technical/01-stack-e-motivazioni.md`,
*«da verificare sul testo della licenza primaria, artefatto per artefatto, prima di qualunque
pubblicazione»*.
*Se non arriva in tempo.* O il componente entra con un'annotazione non verificata - e il controllo
diventa un controllo che afferma il falso con l'autorevolezza di una verifica automatica, che è
peggio di non averlo - o va escluso in via cautelativa, con la conseguenza architetturale che ne
discende. `R-08`, impatto da `I2` a `I4`.

**6. `Q-191` - 26 settembre 2026 - Profilo minimo praticabile dell'ambiente locale.**
*Perché scade prima del codice.* `05-rischi-e-dipendenze.md` §7.3 lo colloca esplicitamente: *«la
misura e la dichiarazione del profilo minimo praticabile sono un criterio della catena di costruzione
(`T-03`) e non un'attività successiva»*. Ogni componente aggiunto dopo alza la soglia d'ingresso in
silenzio.
*Se non arriva in tempo.* La dipendenza «contributori» non ha una condizione verificabile e `R-02`
resta senza indicatore anticipatore per la componente d'ingresso, in violazione di `V-189`. Sotto
`D54` un contributore esterno è **la sola via per cui due rischi si chiudono insieme**, `R-02` e
`R-29`.

**7. `Q-192` - 26 settembre 2026 - Registro unico dei parametri di configurazione, generato.**
*Perché scade prima del codice.* La questione chiede un artefatto **generato** con due proprietà: fa
fallire la costruzione se un parametro esiste nel codice e non nel registro, e alimenta le verifiche
di configurazione bloccanti all'avvio. Entrambe sono proprietà della pipeline, non del codice
applicativo. Aggiungerlo dopo significa che *«diverge alla prima aggiunta»*.
*Se non arriva in tempo.* I parametri restano dispersi fra quattro documenti, e la verifica di
configurazione all'avvio resta un elenco chiuso scritto a mano.

**8. `Q-190` - 26 settembre 2026 - Nomi e forma dei comandi dell'ambiente locale.**
*Perché scade prima del codice.* Sono i sei nomi che un contributore digita il primo giorno. Non sono
una decisione difficile: sono una decisione che **il primo uso fissa**, e cambiarli dopo è una
migrazione che tocca documentazione, pipeline e guida dei fondamenti in due lingue.
*Se non arriva in tempo.* I nomi si formano per accumulo invece che per scelta - è la forma più mite
di `R-18`, e la più frequente.

**9. `Q-189` - 30 settembre 2026 - Ripartizione delle registrazioni a ruoli distinti.**
*Perché scade prima del codice.* Perché ciò che si decide dopo **non si applica al periodo
precedente**: un riesame di un rilascio già avvenuto non è un riesame, è una ricostruzione, e chi
verifica la riconosce come tale. Il periodo di `RU-1` comincia con il primo codice.
*Se non arriva in tempo.* L'esito predefinito è dichiarato: `T-10` si pubblica con la **lacuna
dichiarata**, che resta datata per sempre (`R-29`, *Accertato*, `I5`; taglio irreversibile `TG-20`;
rientro in coda come `OL-22`). La forma con cui la lacuna va dichiarata nel fascicolo è una questione
distinta e complementare, `Q-282`, e nessuna delle due sostituisce l'altra.

**10. `B-2`, e il residuo di `B-1` - 3 ottobre 2026 - Motore, archivio e parametri del registro
immutabile.**
*Perché scade prima del codice.* Il criterio 4 di `T-08` chiede che il registro immutabile scriva con
catena di impronte e archiviazione a privilegi disgiunti, e che la verifica dell'integrità sia
disponibile su richiesta **e programmata**. `B-2` non ha deciso se l'archivio possa essere lo stesso
motore con privilegi disgiunti o debba essere un motore diverso: è una scelta che incide sul peso
dell'installazione presso il cliente e che il codice della persistenza incorpora al primo giorno.
Di `B-1`, la parte relativa all'**ancoraggio periodico firmato** si rinvia con la funzione (`TG-23`,
irreversibile per il periodo); restano invece anteriori al codice la **cadenza delle verifiche di
integrità** - che il criterio 4 chiede «programmata» - e la **forma minima dell'origine della
richiesta compatibile con la minimizzazione**, che è una scelta di schema.
*Se non arriva in tempo.* Il codice sceglie d'ufficio l'opzione più comoda: è esattamente `R-18`, su
`R-20`, cioè sull'elemento che l'area di sicurezza dichiara **il singolo elemento di maggiore sforzo
dell'intero catalogo**. E la copertura del registro **non è riducibile** neppure sotto pressione
(`01 §7.3`).

**11. `Q-145` - 3 ottobre 2026 - Conferma delle sei rinunce deliberate a capacità tecniche
disponibili.**
*Perché scade prima del codice.* Perché la risposta a `R-23` non è una dichiarazione ma **prove
negative per ciascuna esclusione**, e le prove negative si scrivono con il codice che escludono. Con
`D55` che congela la destinazione d'uso, la conferma di queste rinunce è ciò che la rende
difendibile: sono le funzioni che sposterebbero il sistema verso il tempo reale clinico.
*Se non arriva in tempo.* La deriva verso l'innalzamento di classe resta possibile «per accumulo di
richieste ragionevoli», e con `D58` il costo di una riclassificazione **ricade sul progetto** e non
più su un fabbricante esterno.

**12. `Q-115` - 3 ottobre 2026 - Dispositivo e rete di riferimento.**
*Perché scade prima del codice.* I criteri mobile first e le soglie di peso e di tempo alla prima
interazione sono verificabili **solo** contro un dispositivo dichiarato; `RNF-106` **non è
verificabile** finché il dispositivo non è dichiarato. `T-08` criterio 7 chiede una verifica manuale
con tecnologia assistiva reale e criterio 8 chiede due profili di rete, nominale e degradato limite:
entrambi presuppongono la dichiarazione.
*Se non arriva in tempo.* `Q-175` ne dà la conseguenza che `Q-115` non registrava: *«non è un ritardo
di misura di prestazione, è una lacuna del fascicolo tecnico»*, e come tale **non si colma con un
valore scelto a posteriori**.

**13. `Q-111` - 3 ottobre 2026, per la sola dichiarazione - Limite dichiarato di partecipanti.**
*Stato reale, diverso da come `T-05` lo elenca.* La questione è **parzialmente risolta** da `ADR
0028`: è deciso che la sessione resta a maglia senza componente centrale, che il limite è dichiarato
nella documentazione e applicato dal codice, e che è **configurazione con un massimo imposto** - un
tenant può abbassarlo, mai alzarlo. È rinviato il **numero**, `[NV]`, perché dipende dal budget di
banda del partecipante peggio connesso, che si misura sul dispositivo e sulla rete di `Q-115`.
*Che cosa resta da decidere prima del codice.* Solo la formulazione: nel perimetro ridotto il limite
è **due**, e va dichiarato come **limite del rilascio** e non come proprietà del prodotto.
*Se non arriva in tempo.* Il rilascio dichiara come proprietà del prodotto ciò che è un confine del
perimetro, ed è la stessa famiglia di errore di `Q-281`.

**14. `C-4` / `Q-186` - 15 ottobre 2026 dichiarata, ma il codice la presuppone prima - Periodo di
supporto dichiarato.**
*Perché scade prima del codice.* La conseguenza architetturale registrata in
`09-decisioni-rinviate.md` è che *«la durata determina per quanto tempo una versione maggiore delle
interfacce pubbliche resta attiva, e quindi quante versioni devono poter coesistere»*. La disciplina
di versione delle interfacce pubbliche e il preavviso di dismissione si scrivono in `T-08`, che
comincia il 3 ottobre: **la decisione è formalmente in scadenza dopo il codice che la presuppone**.
La tensione è dichiarata qui e non risolta: risolverla è del committente.
*Se non arriva in tempo.* Il piano di dismissione non è pubblicabile e il numero di versioni maggiori
da mantenere non è determinabile; è **prerequisito della prima distribuzione**, quindi di `T-10`.

**15. `Q-281` - 31 ottobre 2026 - Formulazione della differenza fra materiale pubblico e ciò che
`RU-1` consegna.**
*Perché è in questo elenco.* Non è una decisione che il codice presuppone: è una decisione che
**l'esistenza del codice rende verificabile da chiunque**. Alla pubblicazione del rilascio la distanza
fra il materiale pubblico e l'artefatto diventa misurabile dall'esterno.
*Se non arriva in tempo.* `RU-1` esce mentre il materiale pubblico dichiara capacità che il rilascio
non contiene: stessa aggravante di `Q-185`, su un artefatto in più.

### 3.3 Le voci il cui innesco è un evento e non una data

Restano fuori dall'ordinamento perché non hanno una data, ma **hanno una soglia**, e la soglia può
essere attraversata dentro la finestra di `T-08`.

| Voce | Soglia | Regola in vigore nel frattempo |
|---|---|---|
| `B-8` / `Q-160` - propagazione del livello di garanzia | Prima della documentazione pubblica del meccanismo | Finché l'esito non è registrato, **la documentazione pubblica non descrive il meccanismo** (`T-04` criterio 5). `R-15` osserva che la regola è oggi l'unico presidio, perché la verifica è stata rinviata con la funzione |
| `A-1` - meccanismo dell'orchestrazione | Prima del secondo processo orchestrato | Il primo processo può essere scritto con la macchina a stati persistita e migrato; il secondo cristallizzerebbe la scelta |
| `A-4` - rappresentazione dell'endpoint di sessione | Alla prima richiesta di un integratore | L'indirizzo della sessione **non si espone** nel piano clinico |
| `B-4` - registro unico della fiducia | Prima del secondo integratore | Posizione già dichiarata: **uno solo**, per tenant. `ADR 0029` |
| `B-3` - licenze di scale e questionari | Prima del primo motore di calcolo, assente dal perimetro | **Il dominio non rappresenta punteggi**: misura cautelativa che resta in vigore |
| `C-1` - contesto della rendicontazione | Prima della realizzazione dell'evento di liquidazione | Il profilo del pagatore è amministrativo per costruzione, **come convenzione verificata da prova e non come confine strutturale**, e la differenza è dichiarata |
| `C-2`, `C-3` - topologia oltre due partecipanti, contenitore del materiale registrato | Con le funzioni corrispondenti | Nessun materiale dichiara un formato unico di contenitore; il contenitore è **negoziato a runtime, mai assunto** |

---

## 4. I criteri di completamento, e come si dimostrano

Il criterio di fonte è uno solo e vale per ogni voce: *«ciascuna voce ha un esito registrato -
decisa, con il registro di decisione architetturale corrispondente, oppure esplicitamente confermata
come aperta con la sua conseguenza dichiarata»*.

**Come si dimostra, in forma binaria.** Esiste un **registro delle voci di `T-05`**, versionato, con
una riga per voce e quattro colonne obbligatorie: **voce**, **esito** (`decisa` / `confermata
aperta`), **rinvio** (identificativo del registro di decisione architetturale se decisa; testo della
conseguenza dichiarata se confermata aperta), **data**. Il traguardo è chiuso quando **nessuna riga
ha una colonna vuota**.

Tre precisazioni che rendono il criterio non aggirabile:

1. **«Confermata aperta» non è un esito neutro.** È un esito solo se accompagnato dalla conseguenza
   dichiarata: senza di essa è un silenzio con una casella intorno. Per `Q-189` la conseguenza è già
   scritta nella fonte ed è la lacuna dichiarata su `RU-1`; per le altre va scritta.
2. **Una voce risolta altrove è «decisa» e va registrata come tale, con il rinvio.** Vale per `Q-110`,
   chiusa da `ADR 0012`, e per la parte decisa di `Q-111`, chiusa da `ADR 0028`.
3. **Una voce che il piano ha aggiunto non è un criterio del traguardo.** Le voci del §3 non elencate
   fra i sette criteri di `T-05` sono **proposte di ampliamento** del traguardo, e l'ampliamento è
   una modifica della roadmap che appartiene al suo titolare. Questo piano le pone; non le assume.

---

## 5. La sequenza dei lavori

I lavori portano etichette locali di questo documento e **non sono identificativi di progetto**.

| # | Lavoro | Che cos'è | Dipende da |
|---|---|---|---|
| 1 | Registro delle voci, con le quattro colonne | Creazione dell'artefatto | Nulla |
| 2 | Riconciliazione dello stato reale delle voci già decise altrove | Lettura di `ADR 0012`, `ADR 0028`, bacheca | Lavoro 1 |
| 3 | Scheda di decisione per ciascuna voce senza esito | Una pagina per voce: domanda, opzioni con il costo, esito predefinito in assenza di risposta, data oltre la quale non è recuperabile | Lavoro 1 |
| 4 | Consegna al committente delle voci a lui riservate | `Q-185`, `Q-280`, `Q-189`, `Q-186`, `Q-145`, `Q-281`, e le voci di famiglia `C` | Lavoro 3 |
| 5 | Consegna alle aree competenti delle voci di famiglia `B` | `B-1`, `B-2`, `B-3`, `B-4`, `B-8` | Lavoro 3 |
| 6 | Registrazione degli esiti man mano che arrivano | Aggiornamento del registro | Lavori 4, 5 |
| 7 | Lista di controllo delle decisioni rinviate, da eseguire prima di ogni proposta di modifica che tocchi un'area coperta | Presidio operativo di `R-18` | Lavoro 1 |

**Che cosa è parallelizzabile.** Tutto il lavoro 3, voce per voce: le schede sono indipendenti fra
loro. Non è parallelizzabile nulla dopo la consegna: l'attesa di una decisione non è un'attività, e
trattarla come tale è il modo in cui un piano «attende in silenzio una decisione che non arriva» e
quindi **ha già scelto, senza dirlo**.

**Il lavoro 7 è il solo che produce un effetto anche se nessuna decisione arriva**, ed è la ragione
per cui non va rinviato in fondo: sotto `D54` la revisione è auto-revisione, e `R-18` osserva che
l'unico presidio che resta effettivo è **l'elenco delle decisioni rinviate come lista di controllo
esplicita** prima di ogni proposta di modifica.

---

## 6. Il costo dichiarato di ciascun lavoro

**Nessuna ora, e nessuna percentuale.** Il costo si dichiara come classe di attività e come ciò da
cui dipende.

| # | Lavoro | Classe | Dipende da | Comprimibile |
|---|---|:-:|---|---|
| 1 | Registro delle voci | `D` | Nulla | Sì |
| 2 | Riconciliazione dello stato reale | `D` | Lettura di documenti esistenti | Sì |
| 3 | Schede di decisione | `D` | La qualità dell'istruttoria già presente nei documenti di area; per `Q-112` e `Q-115` serve una **misura o una lettura di fonte primaria**, non una scelta | Parzialmente |
| 4 | Consegna al committente | **`C`** | **Disponibilità del committente.** Non è capacità del progetto | **No** |
| 5 | Consegna alle aree competenti | **`C`** | Sotto `D54` le «aree» sono la stessa persona: la consegna è un cambio di ruolo dichiarato, non un trasferimento | **No**, ed è una finzione da nominare |
| 6 | Registrazione degli esiti | `D` | L'arrivo delle decisioni | No |
| 7 | Lista di controllo delle decisioni rinviate | `D` | Nulla | Sì |

**La riga 5 merita una nota onesta.** Le famiglie `B` di `09-decisioni-rinviate.md` sono «rinviate ad
altra area», e sotto `D54` non esiste un'altra area: esiste la stessa persona con un altro cappello.
Non è un difetto del metodo - la separazione dei ruoli resta il modo corretto di formulare la
domanda - ma va detto che **la decisione che ne esce non ha la garanzia di indipendenza che la forma
suggerisce**, esattamente come per la registrazione di approvazione dei documenti.

---

## 7. Le dipendenze esterne

| Dipendenza | Chi la controlla | Che cosa ne dipende | Se non arriva |
|---|---|---|---|
| **Decisioni del committente** | Committente | Sette voci su quindici | È il rischio `R-17`, con impatto da `I2` a `I5` secondo la decisione. La risposta è già dichiarata: **il piano pone la decisione con la conseguenza accanto e dichiara l'esito predefinito in assenza di risposta** |
| **Testo della licenza primaria di un componente** | Titolare dei diritti | `Q-112`, e con essa la veridicità delle annotazioni su cui il controllo bloccante di `T-03` poggia | Il componente si esclude in via cautelativa: `V-03` impone che il sistema resti pienamente funzionale senza le parti a licenza vincolata |
| **Glossario nazionale e glossario dell'infrastruttura nazionale** | Amministrazione | `Q-146` | Nulla di tecnico si blocca; ciò che cresce è la distanza fra il linguaggio del progetto e quello di chi lo adotterà, su due lingue |
| **Dispositivo e rete di riferimento** | Decisione di prodotto, poi misura | `Q-115`, `Q-111` quanto al numero, `RNF-106` | La lacuna si dichiara nel fascicolo, e **non si colma con un valore scelto a posteriori** |
| **Mercato dei servizi professionali** | Mercato, e una decisione di spesa | `Q-189`, per la parte che si acquisisce all'esterno | È l'unica famiglia per cui **non esiste modalità degradata**: si acquisisce o si dichiara la lacuna |

---

## 8. I rischi propri del traguardo, con la contromisura

| Rischio | Che cos'è | Indicatore | Contromisura di questo piano |
|---|---|---|---|
| `R-17` - Le decisioni del committente non vengono prese entro le date dichiarate · *Media* · da `I2` a `I5` | È l'unico rischio del registro con una data di scadenza esplicita per ciascuna componente | **Il calendario stesso** | Il §3 ordina per non recuperabilità e non per importanza, e ogni voce porta l'esito predefinito. Un piano che attende in silenzio ha già scelto |
| `R-18` - Una decisione dichiarata rinviata viene presa d'ufficio in una proposta di modifica · *Media* · `I2`, con coda `I5` | Diciannove decisioni sono dichiarate rinviate; chi realizza sceglie l'opzione più comoda, e la scelta è locale, ragionevole e invisibile | Una proposta di modifica che tocca un'area coperta **senza** citare la decisione rinviata | Il lavoro 7, che è la sola misura effettiva sotto auto-revisione |
| `R-30` - Il ruolo di fabbricante non è ancora costituito · *Accertato* · `I3 crescente` | Entra qui attraverso `Q-280`, che è la voce con il tempo di attraversamento più lungo e il costo in ore più basso | Superamento del 19 settembre 2026 | Nessuna, sul piano tecnico. Il piano di `T-14` la tratta per esteso |
| `R-08` - Regime di licenza incompatibile · *Media* · da `I2` a `I4` | Entra attraverso `Q-112` | Un componente nella distinta e non nelle annotazioni | La scheda di decisione dichiara che l'esito predefinito è l'esclusione cautelativa, non l'inclusione con annotazione non verificata |
| `R-16` - Le due versioni linguistiche divergono · *Alta* · `I5` | Entra attraverso `Q-146`, la cui condizione temporale è già superata | Crescita del rapporto di divergenza; per le aree prerequisito, una modifica accettata senza aggiornare l'inglese | Nessuna che questo traguardo possa applicare: la contromisura è il controllo differenziato di `T-03` criterio 3, già in esercizio |

---

## 9. Che cosa `T-05` non comprende

| Non compreso | Dove è coperto |
|---|---|
| Le decisioni **prese** | `T-05` le **pone**. È la ragione della classe di enunciato `[INTENZIONE]` |
| Le tre voci rinviate con le funzioni tagliate | `B-3`, `C-1`, `C-2`, `C-3`, con la regola che resta in vigore ripetuta accanto al rinvio, perché il rischio non è dimenticare la decisione: è dimenticare il divieto insieme a essa |
| Le quattro decisioni già prese dalla terza tornata | `D53`, `D54`, `D55`, `D56`. Non si riaprono |
| Le registrazioni a ruoli distinti come attività | `V-281`: si dichiarano come lacuna, non si pianificano |
| La forma della dichiarazione delle lacune datate | `Q-282`, complementare a `Q-189` e da essa distinta |
| Le verifiche empiriche da cui alcune decisioni dipendono | `T-04`, e le tre verifiche rinviate con le funzioni corrispondenti |

---

## 10. Discrepanze fra etichetta e stato reale, trovate in bacheca

Verificate sul **testo** della voce e sui documenti citati, non sull'etichetta della colonna di stato.
**Nessuna è stata corretta.**

| Voce | Etichetta | Stato reale sul testo |
|---|---|---|
| `Q-110` | **RISOLTA** nella bacheca | Corretta. **Ma `T-05` criterio 2 la elenca fra le voci da chiudere**: la fonte del traguardo è disallineata rispetto alla bacheca. La decisione è presa - instradamento deterministico al nodo proprietario, `ADR 0012` - con il diffusore senza persistenza escluso e l'affinità al bilanciatore ammessa solo come debito dichiarato con strategia di uscita |
| `Q-111` | **PARZIALMENTE RISOLTA** | Corretta. `T-05` criterio 3 la tratta come intera: sono decise topologia e forma (`ADR 0028`), è rinviato il solo numero, `[NV]`, dipendente da `Q-115` |
| `Q-283` | **RISOLTA**, con verifica registrata il 26 agosto 2026 | Corretta **nella bacheca**, e contraddetta dalla roadmap: `00-indice.md` §8.4, in pari data, dichiara il ramo principale non protetto con esito `404` e registra `Q-283` fra ciò che il lavoro «ha aperto e non chiuso». Il documento più recente è la bacheca; la roadmap non è stata aggiornata |
| `Q-284` | **APERTA** | Sostanzialmente corretta, ma il titolo della voce dice «adottata» e induce a leggerla chiusa. È adottata la configurazione locale; resta un passo con innesco preciso |
| `Q-274` | **APERTA** | **Premessa falsa oggi.** La voce afferma che `Q-144` risulta ancora elencata fra le questioni aperte in `02 §12` e in `09 §10`. Verificato sul testo: `02-qualificazione-e-classificazione.md` §12 la riporta «CHIUSA da `D55`» con stato «RISOLTA», e `09-percorso-e-calendario.md` §10 la riporta «RISOLTA, con una condizione residua». La questione è sostanzialmente esaurita; resta viva solo la condizione residua, che è `Q-275` |
| `Q-201` | **APERTA** | **Premessa falsa oggi.** La voce afferma che i moduli 16, 18, 19 e 20 della guida dei fondamenti sono citati e non esistono. Verificato: `docs/10_fondamenti/` contiene ventun moduli, `00`-`20`, compresi `16-architettura-del-progetto.md`, `18-contribuire-per-area.md`, `19-glossario.md` e `20-fonti-primarie.md` |
| `Q-202` | **APERTA** | **Premessa superata, richiesta sostanziale viva.** La voce afferma che `09_roadmap/00-indice.md` §4 riporta come assenti panoramica e conformità e come ventiquattro le voci del registro delle decisioni architetturali. Verificato: §4 riporta entrambe le aree come scritte e «trenta voci più indice», e `docs/adr/` contiene trenta file numerati più l'indice. Resta aperta la domanda vera: sede unica o **fonte generata** |
| `Q-179` | **APERTA** | Corretta, ma il testo si apre con «PARZIALMENTE CHIUSA DA `D57`» e la colonna non lo riporta: chi legge la sola etichetta non sa che l'attribuzione è già decisa e che resta aperta la sola forma di pubblicazione |
| `Q-270` | Colonna con **RISOLTA** | Corretta, e la voce resta nella sezione intitolata «Questioni aperte». È la sezione a essere un contenitore misto, non l'etichetta a essere sbagliata: vale anche per `Q-144`, `Q-180`, `Q-181`, `Q-182` |

---

## 11. Contraddizioni fra documenti, incontrate e non corrette

1. **`T-05` criterio 2 chiede di chiudere `Q-110`, che è chiusa.** Il criterio è soddisfatto per
   costruzione, e questo rende il traguardo più facile di come si presenta: il rapporto lo dice invece
   di lasciarlo scoprire.
2. **`C-4` / `Q-186` ha un punto di decisione posteriore al codice che la presuppone.** Il punto è al
   15 ottobre 2026; la disciplina di versione delle interfacce pubbliche si scrive dentro `T-08`, che
   comincia il 3 ottobre.
3. **`R-28` dichiara sette righe residue dell'ordine di sacrificio; le righe sono otto e una è
   consumata.** `05 §2.1` scrive «Sono sette»; `03 §6.2` elenca `S-1`…`S-8` dopo l'aggiunta di `S-8`
   del 26 agosto 2026, e `S-7` - il conteggio esatto delle parole - non è più sacrificabile, perché il
   conteggio **è stato eseguito** lo stesso giorno. L'indicatore anticipatore del rischio dominante è
   quindi calcolato su un numero che nessuno dei due documenti riporta correttamente.
4. **La revisione del 26 agosto 2026 non riporta lo stato di `T-05`.** `00 §8.1` lo prescrive per
   ciascun traguardo aperto; la tabella di `00 §8.4` omette `T-02`, `T-04`, `T-05`, `T-07` e `T-14`.
5. **`Q-146` prescrive un allineamento «prima della traduzione inglese», e la traduzione è avvenuta.**
   Nessun documento registra la contraddizione né dichiara che cosa se ne fa.

---

## 12. Come si dichiara chiuso il traguardo

- [ ] Esiste il registro delle voci, versionato, con le quattro colonne obbligatorie.
- [ ] Ogni voce dei sette criteri di fonte ha una riga, e **nessuna colonna è vuota**.
- [ ] Ogni voce con esito `decisa` porta il rinvio al registro di decisione architetturale corrispondente.
- [ ] Ogni voce con esito `confermata aperta` porta **la conseguenza dichiarata**, non la sola parola «aperta».
- [ ] Esiste la lista di controllo delle decisioni rinviate, ed è citata dalla procedura di proposta di modifica.
- [ ] Le voci aggiunte da questo piano e non comprese nei sette criteri sono **consegnate** come proposta di ampliamento, con esito registrato della consegna.

**E la casella che non è un criterio:** lo stato di `T-05` entra nella tabella della revisione
periodica, in forma binaria, accanto agli altri traguardi aperti.
