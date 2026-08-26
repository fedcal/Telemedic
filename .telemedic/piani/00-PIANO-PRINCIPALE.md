# Piano principale - esecuzione della roadmap fino al 30 novembre 2026

> **Documento di lavoro interno. Non è la roadmap e non la sostituisce.** La fonte resta `docs/09_roadmap/`. Questo piano **ricava** dalla roadmap la sequenza imposta dalle dipendenze, il percorso critico, ciò che è eseguibile oggi, i punti di serializzazione e la disciplina di aggiornamento. Dove piano e roadmap divergono, **prevale la roadmap**, e la divergenza è un difetto di questo piano da correggere qui, non lì.
>
> Redatto il **26 agosto 2026**. Ogni affermazione che dipende da un documento porta il rinvio puntuale; ogni affermazione che dipende dallo stato del repository porta il file o il comando con cui è stata verificata.

## 0. Come si legge questo piano

### 0.1 Tre avvertenze che vincolano la lettura

**Prima - le date non sono stime, e questo piano non ne produce.** Le date di `02-traguardi.md` sono **allocazioni del calendario residuo** a una sequenza vincolata (`01 §4.1`, `00 §11`, avvertenza in testa a `02 §0`). `D62` quantifica la capacità in dieci-venti ore settimanali e rende l'aritmetica verificabile, **ma non trasforma le allocazioni in stime**: mancano ancora la cronologia di consegna su cui calibrare e un'unità che attraversi lavori eterogenei. Dove questo piano mette dei numeri di ore, essi misurano **la capacità che il calendario mette a disposizione in una finestra**, mai lo sforzo che il lavoro richiede. Le due grandezze non sono confrontabili, e il confronto non viene fatto.

**Seconda - i criteri sono binari.** Nessun lavoro ha una percentuale di avanzamento (`V-181`, `00 §8.3`). Un lavoro è fatto o non è fatto, e il criterio di fatto è scritto accanto in forma accertabile da chiunque con la procedura indicata (`01 §12`, e in particolare `01 §12.1` sulla distinzione fra *verificabile da un terzo* e *verificato da un terzo*).

**Terza - le sigle `PP-nn` sono designazioni di lavoro interno.** Valgono quanto `T-nn`, `S-n`, `TG-nn`, `RU-1`, `OL-nn` valgono nella roadmap: un modo per riferirsi a una riga senza ricopiarla. **Non sono identificativi di requisito**, non appartengono agli intervalli congelati da `V-120`, non entrano nella matrice di tracciabilità e non possono comparire in una prova (`00 §11`, `04 §1.1`). Nessun identificativo `T-`, `S-`, `V-`, `Q-`, `R-`, `D` compare qui se non è già nella roadmap o nel brief.

### 0.2 Che cosa questo piano contiene

La sequenza reale (§2), il percorso critico (§3), l'elenco di ciò che `V-182` consente oggi (§4), il parallelismo realmente disponibile (§5), il consumo dell'ordine di sacrificio (§6), i punti di decisione irreversibili (§7), il criterio di allarme (§8), la disciplina di allineamento fra piani e roadmap (§9), il perimetro non coperto (§10). Il §11 elenca le contraddizioni trovate **fra i documenti della roadmap**, e non le corregge.

---

## 1. Lo stato di fatto assunto, e come è stato verificato

| # | Fatto assunto | Come è stato verificato | Fonte |
|---|---|---|---|
| 1 | Oggi è il **26 agosto 2026**; restano **novantasei giorni** al 30 novembre | Aritmetica di calendario. La roadmap ne dichiara novantasette al 25 agosto (`02 §1`, `02 §4.1`): la differenza è il giorno trascorso | `D53` |
| 2 | Capacità: **dieci-venti ore settimanali**, un contributore unico | `D62`, che emenda `D54` | brief §5-quater |
| 3 | **Nessuna riga di codice applicativo esiste** | Nessun albero dei sorgenti nel repository: esistono `scripts/`, `registro/`, `docs/`, `website/`, `.github/` | `00 §4`, `V-182` |
| 4 | `V-182` **vieta ogni riga di codice applicativo prima di `T-03`** (26 settembre), con la sola eccezione del codice usa-e-getta delle verifiche di `T-04`, dichiarato tale, in area separata, non incluso in alcun artefatto distribuito | `00 §9.5`, `T-03` «che cosa non comprende» | `D45` |
| 5 | `T-01` è chiuso **salvo il criterio 1**, che resta *in parte*: la procedura esiste con tutte le voci in `docs/08_compliance/10-controllo-dei-documenti.md`, ma il criterio chiede una procedura **approvata**, e sotto `D54` redattore e approvatore coincidono | Il file esiste; il suo `§9` dichiara la coincidenza come **lacuna e non come conformità** | `00 §8.4`, `Q-189` |
| 6 | I criteri 3, 4, 5, 7 di `T-01` hanno artefatti in esercizio | `registro/identificativi-requisiti.tsv` con `registro/README.md`; `scripts/verifica-identificativi-requisiti.sh`; `scripts/verifica-dichiarazione-non-marcatura.sh`; banco `scripts/prove/esegui-prove.sh`; entrambi i lavori sono in `.github/workflows/verifiche.yml` **senza `continue-on-error`** | `00 §8.4` |
| 7 | La **protezione del ramo principale è attiva dal 26 agosto 2026**, nella forma dichiarata: revisione obbligatoria per i contributori esterni, il mantenitore unisce il proprio lavoro | `docs/08_compliance/10-controllo-dei-documenti.md §5` e `§10` (`Q-283` marcata **RISOLTA il 26 agosto 2026**) | `D54`, `Q-189` |
| 8 | **`S-8` è deciso**: il percorso verticale di `RU-1` si riduce alla sola **televisita programmata a due partecipanti** | `03 §6.2` riga `S-8`; registrazione in `00 §8.4` | `01 §4.2` |
| 9 | **L'aritmetica non chiude nemmeno con `S-8`**, e la soglia è la settimana del **19 ottobre 2026** | `00 §8.4`, «Aritmetica dopo `S-8`» | `R-28` |
| 10 | Quattro aree su dodici esistono in inglese: fondamenti, protocolli, sicurezza, conformità | `website/i18n/en/.../10_fondamenti/` contiene ventuno moduli su ventuno; `.../08_compliance/` undici file su undici | `00 §4`, `00 §8.4` |

### 1.1 Le due righe della fotografia che il piano corregge, dichiarandolo

**La prima.** `00 §8.4` registra che la protezione del ramo **non è attuata** (`gh api ...` risponde `404 Branch not protected`) e apre `Q-283`. `docs/08_compliance/10-controllo-dei-documenti.md` la registra come **risolta lo stesso giorno**. Le due affermazioni sono nello stesso repository, alla stessa data, e dicono cose opposte. Questo piano assume la seconda, che è la più recente e porta il comando di configurazione; **la divergenza è al §11.4 e non è corretta qui**, perché correggerla significherebbe modificare la roadmap.

**La seconda.** Il controllo di divergenza fra le lingue è configurato con `continue-on-error: true` in `.github/workflows/verifiche.yml` (riga 74), con il commento che dichiara l'innesco esatto della sua bloccanza: «diventa bloccante nello stesso commit in cui l'ultima di quelle aree viene completata». Le aree prerequisito sono complete. **Il commit che rende bloccante il controllo non è ancora stato fatto**, ed è il lavoro `PP-20`. Finché non lo è, il criterio 3 di `T-03` - che `00 §8.4` dichiara soddisfatto - è soddisfatto quanto all'*esistenza* del comportamento differenziato e **non** quanto alla *bloccanza*.

---

## 2. La sequenza reale, non quella nominale

### 2.1 La distinzione che governa questo paragrafo

Una **dipendenza vera** è una relazione per cui il lavoro a valle non è eseguibile, o non è verificabile, finché quello a monte non è chiuso: toglierla cambia il risultato, non solo il calendario. Una **dipendenza cronologica** è una collocazione che discende dall'ordine di priorità o dall'allocazione delle ore, e che si potrebbe invertire senza che nulla si rompa. La roadmap le presenta con la stessa forma - il campo «Innesco» di `02 §0` - e la distinzione non vi è fatta. Farla è il primo compito di questo piano, perché **solo le dipendenze vere determinano il percorso critico**, e solo esse impediscono un riordino sotto pressione.

### 2.2 Il grafo delle dipendenze vere

| Traguardo | Innesco dichiarato (`02 §3`) | Dipendenze **vere** ricavate | Dipendenze **solo cronologiche** | Dipendenze vere **non dichiarate** dalla roadmap |
|---|---|---|---|---|
| `T-01` (12 set) | Immediato | Nessuna interna. Il criterio 1 dipende da una **decisione**, non da un lavoro: `Q-189` | - | - |
| `T-14` (19 set) | Immediato (`D58`) | Nessuna. Il criterio 3 **può precedere** il criterio 1 e conviene che lo preceda (`T-14`, «Dipendenze») | La collocazione al 19 settembre | - |
| `T-03` (26 set) | `T-01` criteri 3–4 | **`T-01` c.3–4**: il controllo del criterio 5 di `T-01` si appoggia al registro. **Già soddisfatte** al 26 agosto | Il resto di `T-01`, compreso il criterio 1 aperto | **`T-02` criterio 6**: il criterio 2 di `T-03` esige che il controllo dei termini vietati (`R0`) blocchi dal primo giorno, e la lista che lo alimenta è prodotto di `T-02`, datato **10 ottobre**, cioè *dopo* `T-03`. Vedi §11.1 |
| `T-07` (26 set) | Immediato | **`T-03` c.2** per la sola bloccanza del controllo sui collegamenti (criterio 1). **`T-01` c.8** per il testo dell'avvertenza: già soddisfatto | Criteri 2, 3, 4, 5, 6: eseguibili oggi | - |
| `T-04` (3 ott) | `T-03` | **`T-03`**, in senso proprio: `V-182` ammette il codice usa-e-getta delle verifiche solo come eccezione dichiarata al traguardo che istituisce la catena, e le verifiche «girano **attraverso** la pipeline» | - | - |
| `T-05` (3 ott) | Immediato | Nessuna. Sono decisioni **poste**, non lavori eseguiti; la data è quella entro cui il progetto le pone | - | - |
| `T-02` (10 ott) | `T-01` | **`T-03` c.2** per il criterio 2 (zero collegamenti rotti «verificato dal controllo bloccante di `T-03` e non a vista») | `T-01` come innesco: la sua chiusura non è condizione tecnica di alcun criterio di `T-02` | `T-02` **non ha campo «Dipendenze»**: è l'unico traguardo del capitolo che ne è privo. Vedi §11.2 |
| `T-08` (14 nov) | `T-01`, `T-03`, `T-04` | **`T-03`**: cancello di `V-182`. **`T-04` c.1–2**: l'esito cambia il confine di autorizzazione e la modalità di avvio della sessione, cioè il percorso stesso. **`T-01` c.3–4**: la matrice del criterio 6 si genera sul registro | `T-05`: «posizione registrata», non chiusura | **`T-05` c.2** (`Q-110`, topologia del segnale su più istanze) morde sul criterio 1 di `T-08` se decisa dopo che la struttura dei moduli esiste |
| `T-06` (21 nov) | `T-02` c.5 (conteggio) | **`T-08`**, per il criterio 5: le stringhe di internazionalizzazione non esistono finché il codice non esiste. **`T-03` c.3** per il comportamento differenziato del controllo | `T-02` c.5: **già soddisfatto** al 26 agosto (`00 §8.4`), quindi l'innesco dichiarato è già scattato | **`T-08` non è dichiarato fra le dipendenze di `T-06`**, e lo è. Vedi §11.3 |
| `T-10` (30 nov) | `T-08`, `T-06` | **`T-08`**: senza percorso verticale provato non esiste artefatto. **`T-05` c.1** (`Q-186`): criterio bloccante 18 di `03 §8`. **`T-03` c.5–7**: criteri bloccanti 5, 6, 7 | **`T-06`**: nessun criterio di `T-10` e nessuno dei diciotto criteri bloccanti richiede che `T-06` sia chiuso. I criteri 1 e 3 di `T-10` chiedono avvertenze, limiti d'uso e fascicolo **in entrambe le lingue**, e sono prodotti da `T-10` stesso | - |

### 2.3 Le tre inversioni rispetto al calendario nominale

**Prima - `T-02` criterio 6 precede `T-03`, non lo segue.** La lista dei termini vietati che attua `R0` è un prodotto documentale privo di dipendenze, e il criterio 2 di `T-03` non è soddisfacibile senza di essa. Operativamente: la lista si versiona **entro il 26 settembre**, insieme al controllo che la consuma, e il criterio 6 di `T-02` si chiude in quel momento anche se il traguardo chiude il 10 ottobre. Un traguardo può avere criteri chiusi in date diverse; ciò che non può avere è un criterio dichiarato chiuso senza prova.

**Seconda - `T-06` segue `T-08`, non lo affianca.** Il diagramma di `02 §7` colloca `T-06` dal 7 al 21 novembre e `T-08` dal 3 ottobre al 14 novembre, con sette giorni di sovrapposizione. Con un contributore unico la sovrapposizione **non esiste come parallelismo**: è interfoliazione, e sottrae ore a `T-08` nella sua settimana più esposta. Inoltre il criterio 5 di `T-06` non è verificabile prima che le stringhe esistano.

**Terza - `T-06` non è un innesco di `T-10`, e trattarlo come tale costa la data.** La tabella `02 §7.1` dichiara `T-08`, `T-06` come inneschi di `T-10`; nessuno dei diciotto criteri bloccanti di `03 §8` dipende da `T-06`. Se nella settimana del 16 novembre il contributore lavorasse a `T-06` invece che ai criteri bloccanti, spenderebbe le ultime due settimane su un traguardo che non protegge la data. **Dal 15 novembre la priorità è `T-10` e nient'altro**; se `T-06` non chiude il 21 novembre lo si registra come criterio non soddisfatto senza toccare `RU-1`.

---

## 3. Il percorso critico

### 3.1 La catena che determina il 30 novembre

> **`T-01` c.3–4 (chiuso) → `T-03` (26 set) → `T-04` (3 ott) → `T-08` (14 nov) → `T-10` (30 nov)`**, con un secondo ramo che confluisce in `T-10`: **`T-05` c.1 → `Q-186` (15 ott) → criterio bloccante 18**.

Ogni anello ha la proprietà che ne fa un anello: **il suo slittamento si trasferisce integralmente alla fine**. `T-03` perché `V-182` non ammette codice prima di esso; `T-04` perché le sue verifiche determinano la forma del confine di autorizzazione che `T-08` realizza; `T-08` perché *è* il rilascio; `T-10` perché è la data. Il ramo `T-05` c.1 non consuma ore del contributore - è una decisione del committente - ma è critico nello stesso senso: **senza il periodo di supporto dichiarato il criterio bloccante 18 non è soddisfacibile, e nessun criterio bloccante entra nell'ordine di sacrificio** (`03 §6.1` terza regola, `03 §8`). Un rilascio con diciassette criteri su diciotto non è un rilascio.

### 3.2 Il verdetto traguardo per traguardo

| # | Traguardo | Sul percorso critico di `RU-1`? | Che cosa accade se slitta |
|---|---|---|---|
| `T-01` | Artefatti irrecuperabili | **In parte.** I criteri 3–4 lo erano e sono chiusi. Il **criterio 1 non è sul percorso critico**: non impedisce alcun criterio di `T-10` | Produce una **lacuna datata**, non un ritardo. È l'esito predefinito di `Q-189` (`02 §6`), da dichiarare nel fascicolo (criterio 3 di `T-10`) |
| `T-14` | Percorso di fabbricante | **No** per il 30 novembre. **Sì** per tutto ciò che sta oltre | `RU-1` si costruisce e si pubblica senza il soggetto costituito (`03 §1.1`, `R-30`). Lo slittamento **si trasferisce integralmente in fondo alla catena 2027-2028** (`01 §5.2`, `R-06`) |
| `T-03` | Catena di costruzione | **Sì. È il cancello.** | Ogni giorno di ritardo è tolto ai quarantanove della finestra del codice. Non si può anticipare `T-08` per compensare: `V-182` lo vieta |
| `T-07` | Sito con controlli attivi | **No**, salvo il criterio 1 che condivide con `T-03` il controllo sui collegamenti | Slitta senza spostare `RU-1`: il sito è già pubblicato, questo traguardo **accerta** |
| `T-04` | Verifiche empiriche | **Sì.** | Un esito registrato tardi è una decisione presa tardi, e `T-08` costruisce comunque: è il caso che `R-15` descrive |
| `T-05` | Decisioni con scadenza | **Sì per il criterio 1** (`Q-186` → criterio bloccante 18). Laterale per gli altri sei | Il criterio 1 non chiuso entro il 15 ottobre rende `T-10` non pubblicabile. Gli altri producono decisioni prese d'ufficio (`R-18`) |
| `T-02` | Corpo documentale | **No**, salvo il criterio 6 (alimenta `T-03` c.2) e il criterio 3 per la sola parte relativa ai componenti rilasciati | Slitta senza spostare `RU-1` |
| `T-08` | Scheletro e percorso verticale | **Sì. È il traguardo su cui l'aritmetica non chiude** | Non slitta: `T-10` è fra sedici giorni. Lo scostamento si assorbe **riducendo l'ambito** (`V-282`) |
| `T-06` | Traduzione aree prerequisito | **No** per `RU-1`. **Sì** per il regime di `D56` | Purché il controllo di divergenza **blocchi** sulle aree prerequisito: quella proprietà la produce `T-03` c.3, non `T-06` |
| `T-10` | `RU-1` | **È la data.** | Se l'ordine è esaurito e un criterio bloccante manca, **la data si dichiara mancata con la causa registrata** (`V-282`) |
| `T-09` | Traduzione del corpus residuo | **No.** `[INTENZIONE]`, 2027 | - |
| `T-11` | Validazione sommativa di usabilità | **No.** Classe `B` | La lacuna **formativa** è già matura e irreversibile (`TG-22`): questo traguardo non la sana |
| `T-12` | Pacchetto regolatorio | **No.** `[INTENZIONE]`, 2027 | - |
| `T-13` | Percorso di certificazione | **No.** Poggia su `T-14` c.1 | Ogni ritardo su `T-14` si trasferisce qui integralmente |

### 3.3 L'aritmetica delle finestre

La colonna «capacità» misura **le ore che il calendario offre** sotto `D62`, non lo sforzo: quello non è producibile (`01 §4.1`). Il confronto fra le due colonne non viene fatto perché **una sola delle due è nota**.

| Finestra | Giorni | Settimane | Capacità offerta (10–20 h/sett.) | Che cosa vi è collocato |
|---|---|---|---|---|
| 26 ago → 26 set | 31 | ~4,4 | **44–88 ore** | `T-01` c.1, `T-14` per intero, `T-03` per intero, `T-07`, `T-02` c.6, avvio di `T-05` |
| 27 set → 14 nov | 49 | 7,0 | **70–140 ore** | `T-04` e **`T-08` per intero**. È la finestra che `D62` dichiara insufficiente |
| 15 nov → 30 nov | 16 | ~2,3 | **23–46 ore** | `T-10` per intero, più il residuo di `T-06` |
| **Totale residuo** | **96** | **~13,7** | **137–274 ore** | Dieci traguardi, nessuna riserva di tempo |

La capacità della tabella è **lorda**, e `01 §9` prescrive che le date si allochino sulla **netta**, al netto della capacità ricorrente - sorveglianza dei componenti (`R-12`), allineamento fra le lingue, revisione della roadmap, risposta alle segnalazioni. Quella sottrazione è `[NV]` in `01 §9` e resta `[NV]` qui: **non la si inventa**. La sua esistenza significa però che le tre righe sono un **limite superiore**, non una disponibilità.

---

## 4. Che cosa `V-182` consente oggi, e che cosa attende il cancello

`V-182` vieta «ogni riga di codice applicativo» prima di `T-03`. Non vieta nulla di ciò che segue. Ogni voce ha un **criterio di fatto binario**, i **file che tocca** e le **dipendenze**.

### 4.1 Gruppo A - Decisioni del committente (costo in ore del contributore: la sola posizione della domanda)

| # | Lavoro | Criterio di fatto binario | File toccati | Dipendenze | Termine |
|---|---|---|---|---|---|
| `PP-01` | Porre e chiudere `Q-280`: forma giuridica del soggetto fabbricante e profilo della persona responsabile del rispetto della normativa | Esiste una decisione registrata che nomina la forma giuridica **e** il profilo, oppure una dichiarazione registrata che è rinviata con la conseguenza scritta | `.telemedic/context/00_PROJECT_BRIEF.md` (tornata successiva), `.telemedic/context/05_BACHECA_INTERAGENTI.md` | Nessuna | **19 set** |
| `PP-02` | Porre e chiudere `Q-189`: ripartizione delle registrazioni a ruoli distinti | Esiste l'elenco, voce per voce, di che cosa si accetta come lacuna dichiarata e che cosa si acquisisce all'esterno. In assenza, è registrato che l'esito predefinito è la lacuna dichiarata | idem | Nessuna | **30 set** |
| `PP-03` | Porre e chiudere `Q-186`: periodo di supporto dichiarato | Esiste un documento pubblicato che dichiara la durata del supporto e il piano di dismissione delle versioni | `docs/08_compliance/`, fascicolo di `T-10` | Nessuna | **15 ott** - prerequisito del criterio bloccante 18 |
| `PP-04` | Porre e chiudere `Q-185`: correzione della pagina pubblica ai sensi di `D19` e `D29` | La pagina pubblica non contiene alcuna delle formulazioni che `D19` sostituisce, verificato testualmente | Materiale pubblico fuori repository | Nessuna | **31 ott** - impatto `I5` |
| `PP-05` | Porre e chiudere `Q-281`: formulazione della differenza fra materiale pubblico e ciò che `RU-1` consegna | Esiste il testo approvato che dichiara la differenza, con la stessa evidenza dell'elenco delle funzioni | Materiale pubblico; note di rilascio di `T-10` | `PP-04` | **31 ott** |

**Perché stanno in testa.** Costano la sola stesura della domanda, non consumano la finestra del codice, e il ritardo di `PP-01` e `PP-02` **non si recupera lavorando di più** (`01 §5.2`, `R-30`, `R-29`).

### 4.2 Gruppo B - `T-14`, classe `B`: poche ore e molti mesi

| # | Lavoro | Criterio di fatto binario | File toccati | Dipendenze |
|---|---|---|---|---|
| `PP-06` | Avvio della pratica di costituzione del soggetto | Forma giuridica scelta e registrata **e** data di avvio registrata | Registro interno | `PP-01` |
| `PP-07` | Profilo della persona responsabile e avvio della ricerca | Profilo definito per iscritto (qualifica, esperienza, regime di disponibilità permanente, ammissibilità della figura esterna nel regime delle micro e piccole imprese) **e** data della prima richiesta registrata | Registro interno | `PP-01` |
| `PP-08` | Richieste di informazioni agli organismi notificati | Per **ciascun** organismo designato per la categoria pertinente secondo l'elenco della banca dati europea esiste una data di invio registrata, e il **testo** è versionato nel repository. Chiede **il calcolo e non il prezzo**, e impegni sui tempi delle singole fasi | Nuovo documento in `docs/08_compliance/` o area interna | **Nessuna.** Precede il criterio 1 e conviene (`R-06`) |
| `PP-09` | Bozza del piano di valutazione clinica | Esiste la bozza **e** vi è dichiarato il fabbisogno di competenza clinica documentabile che il progetto non possiede internamente, con la forma con cui intende acquisirlo | `docs/08_compliance/07-valutazione-clinica.md` e allegati | Nessuna |
| `PP-10` | Verifica testuale che nessun documento di `T-14` contenga una data di marcatura | Un comando di ricerca testuale restituisce insieme vuoto, e l'esecuzione è registrata | `scripts/` (estensione del controllo esistente) | `PP-06`…`PP-09` |

> **`PP-08` è il lavoro con il rapporto valore/ore più alto del piano**, per `R-06`: il tempo di attesa prima di essere accettati da un organismo **non è misurato da alcuna indagine pubblica** ed è la variabile più pericolosa del percorso. Ogni settimana in cui la richiesta non parte è persa in fondo alla catena.

### 4.3 Gruppo C - Chiusura del residuo di `T-01`

| # | Lavoro | Criterio di fatto binario | File toccati | Dipendenze |
|---|---|---|---|---|
| `PP-11` | Portare il criterio 1 di `T-01` alla forma decisa da `Q-189` | **O** la procedura reca un'approvazione nella forma decisa da `Q-189`, **o** il documento dichiara in modo esplicito e non in nota che approvazione e redazione coincidono, che è **lacuna dichiarata e non conformità**, e la lacuna compare nell'elenco delle lacune datate con la data in cui è nata | `docs/08_compliance/10-controllo-dei-documenti.md` e la versione inglese | `PP-02` |

**La forma predefinita è la seconda**, ed è già in gran parte scritta (`§9` e `§10` del documento). Manca che il criterio 1 sia dichiarato chiuso *su quella forma* o dichiarato non soddisfatto: oggi è «in parte», e «in parte» non è un valore ammesso (`00 §8.3`).

### 4.4 Gruppo D - `T-03`, la catena di costruzione: il cancello

Interamente eseguibile oggi: **una pipeline non è codice applicativo**. Stato di partenza: `.github/workflows/verifiche.yml`, sette lavori.

| # | Lavoro | Criterio di fatto binario | File toccati | Dipendenze | Criterio |
|---|---|---|---|---|---|
| `PP-12` | Dichiarare le quattro fasce e il criterio di collocazione di ciascun controllo | Un documento versionato assegna **ogni** lavoro a una fascia; nessun lavoro è privo di fascia | `.github/workflows/verifiche.yml`, `docs/01_technical/09-integrazione-continua-e-rilascio.md` | Nessuna | 1 |
| `PP-13` | Controllo sulle licenze dei componenti, bloccante | Un caso deliberatamente non conforme fa fallire la costruzione, ed è nel banco di prova | nuovo `scripts/verifica-licenze.sh`, `scripts/prove/`, workflow | Nessuna | 2 |
| `PP-14` | Terminologie: lista di ammissione versionata e prova di fallimento registrata | La lista è versionata **e** un caso non conforme fa fallire la costruzione | `scripts/verifica-terminologie.sh`, `scripts/prove/` | Il controllo esiste già | 2 |
| `PP-15` | Controllo sulla **completezza** della distinta, bloccante | Un componente presente nella risoluzione e assente dalle annotazioni fa fallire la costruzione | workflow (oggi la distinta si genera e si carica, **non blocca**), nuovo script | Nessuna | 2, 6 |
| `PP-16` | Controllo sui collegamenti interni, bloccante | Un collegamento deliberatamente rotto fa fallire la costruzione | nuovo script, workflow, `scripts/prove/` | Nessuna | 2 |
| `PP-17` | Controllo su identificativi sintetici e assenza di dati reali, bloccante | Un dato deliberatamente non sintetico fa fallire la costruzione | nuovo script, `scripts/prove/` | Nessuna | 2 |
| `PP-18` | Controllo sui termini vietati che attua `R0`, bloccante | Un termine della lista, introdotto deliberatamente, fa fallire la costruzione | nuovo script, `scripts/prove/`, lista versionata | **`PP-38`** - inversione dichiarata al §2.3 | 2 |
| `PP-19` | Registrare la prova di fallimento dei due controlli di `T-01` già bloccanti | `scripts/prove/esegui-prove.sh` copre entrambi con casi «deve fallire», e l'esecuzione è registrata | `scripts/prove/` | Già in essere | 2 |
| `PP-20` | Rendere **bloccante** il controllo di divergenza e versionare la differenziazione | `continue-on-error` rimosso; la differenziazione è in un file versionato e **non cablata**; un degrado deliberato del testo inglese di un'area prerequisito fa fallire la costruzione | `.github/workflows/verifiche.yml` riga 74, `scripts/verifica-divergenza-traduzioni.sh`, nuovo file di configurazione | Aree prerequisito complete: **verificato** | 3 |
| `PP-21` | Dichiarare, per **ciascun** controllo in sola segnalazione, la data in cui diventa bloccante | Nessun controllo in segnalazione è privo di data dichiarata, in file versionato | nuovo file di configurazione, workflow | `PP-12` | 4 |
| `PP-22` | Distinta **per ogni artefatto**, non per il solo sito | Per ciascun artefatto prodotto esiste una distinta generata alla costruzione | `.github/workflows/verifiche.yml`, `.github/workflows/docs.yml` | Nessuna. **Vedi §11.6** | 5 |
| `PP-23` | Registro dei componenti generato dalla distinta e arricchito da annotazioni versionate | Un componente nella distinta e assente dalle annotazioni fa fallire la costruzione | nuovo file di annotazioni, script | `PP-15` | 6 |
| `PP-24` | Firma degli artefatti con materiale fuori pipeline, e attestazione di provenienza | L'artefatto porta firma verificabile e attestazione; la verifica è eseguibile con i comandi documentati | `.github/workflows/`, manuale | Custodia della chiave fuori dalla pipeline | 7 |
| `PP-25` | Procedura documentata di verifica a cura di chi installa | Esiste con i **comandi**, ed è eseguibile da chiunque | nuovo documento in `docs/01_technical/` o `docs/07_integration/` | `PP-24` | 8 |
| `PP-26` | Misurare e dichiarare il **profilo minimo praticabile** dell'ambiente locale (`Q-191`) | Esiste una misura su macchina di riferimento dichiarata e il profilo minimo è scritto | `docs/10_fondamenti/17-ambiente-di-sviluppo.md` | Nessuna | `05 §7.3` lo colloca in `T-03` |

> **Che cosa `T-03` non può fare.** I criteri 5, 6 e 7 presuppongono artefatti. Finché l'unico artefatto è il sito, si soddisfano **sul sito**: soddisfazione reale ma di perimetro degenere, come `TG-05` dichiara degenere la verifica sul funzionamento senza terminologie a licenza vincolata. La roadmap non lo dichiara per `T-03`; questo piano lo dichiara e lo riporta al §11.6.

### 4.5 Gruppo E - `T-07`, il sito: accertare, non costruire

| # | Lavoro | Criterio di fatto binario | File toccati | Dipendenze |
|---|---|---|---|---|
| `PP-27` | Navigazione: ogni voce di menu porta a una pagina esistente | Il controllo sui collegamenti è **bloccante** e non produce rilievi | `website/` | `PP-16` |
| `PP-28` | Ricerca funzionante nella lingua attiva | Una ricerca in italiano restituisce risultati italiani, in inglese risultati inglesi; l'esecuzione è registrata con la data | `website/docusaurus.config.mjs` | Nessuna |
| `PP-29` | Cambio lingua con atterraggio corrispondente | Da una pagina italiana priva di corrispondente inglese si atterra su un **avviso** che dichiara la traduzione in corso e rinvia all'italiano: **mai un errore, mai la radice in silenzio** | `website/`, `website/i18n/en/` | Nessuna |
| `PP-30` | Collegamento assoluto alla dichiarazione «questo repository non è un dispositivo medico» | Il collegamento esiste ed è assoluto verso GitHub; chiude `Q-26` | `website/` | Nessuna |
| `PP-31` | Avvertenza di non marcatura su ogni pagina, in entrambe le lingue | `scripts/verifica-dichiarazione-non-marcatura.sh` passa su `website/build` e `website/build/en` | workflow | Già in essere |
| `PP-32` | Procedura ripetibile per i criteri 1, 2 e 3 con esito registrato e datato | Il documento esiste e riporta una data di esecuzione | nuovo documento | `PP-27`…`PP-29` |

### 4.6 Gruppo F - `T-02`, corpo documentale

| # | Lavoro | Criterio di fatto binario | File toccati | Dipendenze |
|---|---|---|---|---|
| `PP-33` | Registrare che il criterio 1 (glossario bilingue con rinvii incrociati) è soddisfatto, o dichiarare che cosa manca | `docs/10_fondamenti/19-glossario.md` e la versione inglese esistono, entrambi con i rinvii incrociati, e la verifica è registrata | i due file | Entrambi **esistono** al 26 agosto |
| `PP-34` | Zero collegamenti interni rotti in tutto il corpus | Il controllo di `PP-16` non produce rilievi su `docs/` e `website/i18n/en/` | `docs/**`, `website/i18n/en/**` | `PP-16` |
| `PP-35` | Zero `[NV]` privi di destinatario, con rapporto pubblicato di quelli ammessi | Un controllo elenca ogni `[NV]` con il destinatario; l'insieme di quelli privi è vuoto | nuovo script, `docs/**` | Nessuna |
| `PP-36` | Bacheca senza voci `APERTA` prive di destinatario | Ogni voce `APERTA` ha un destinatario, e ogni voce indirizzata a un'area chiusa ha una nota che dichiara perché resta aperta | `.telemedic/context/05_BACHECA_INTERAGENTI.md` | Nessuna |
| `PP-37` | Registrare che il conteggio esatto delle parole è eseguito | Il conteggio per area e per modulo è registrato con la data | registro interno; `00 §8.4` lo dichiara eseguito il 26 agosto | **Già soddisfatto.** Rende `S-7` privo di oggetto: §6.3 |
| `PP-38` | Definire e versionare la lista dei termini vietati che alimenta `R0` | La lista è versionata **e** il controllo gira su tutto il corpus senza rilievi | nuovo file versionato | Nessuna. **Precede `PP-18`** |
| `PP-39` | Trasformare in collegamenti i rinvii testuali all'area di conformità | Nessun rinvio testuale resta privo di collegamento, verificato dal controllo | `docs/**` | `PP-16` |

**Che cosa `T-02` non comprende, e va tenuto fermo.** Il modulo delle fonti primarie è dichiarato **taglio reversibile rinviato** (`TG-16`), ma `docs/10_fondamenti/20-fonti-primarie.md` e la sua versione inglese **esistono**. Il taglio è stato disfatto senza registrazione: §11.5.

### 4.7 Gruppo G - `T-06`, traduzione delle aree prerequisito

| # | Lavoro | Criterio di fatto binario | File toccati | Dipendenze |
|---|---|---|---|---|
| `PP-40` | Accertare e registrare la completezza speculare delle quattro aree prerequisito | Per ciascuna area il numero di file inglesi è pari a quello dei file italiani, e il controllo di divergenza non produce rilievi | `website/i18n/en/**` | Verificato per fondamenti (21/21) e conformità (11/11) |
| `PP-41` | Verificare a campione la forma originale dei riferimenti normativi italiani con spiegazione in inglese | Il campione è dichiarato, eseguito e registrato | `website/i18n/en/**` | Nessuna |
| `PP-42` | Versionare la **procedura di allineamento** come documento controllato | Il documento esiste, è sotto controllo dei documenti, e dichiara: che cosa rende completa una proposta di modifica, che cosa si fa quando la traduzione ritarda, come si distingue un'area prerequisito da un'area a segnalazione | `.telemedic/context/RUNBOOK-TRADUZIONE-EN.md` → documento controllato in `docs/` | `PP-11` per la forma del controllo |
| `PP-43` | Separazione delle stringhe di internazionalizzazione dalle etichette ufficiali dei sistemi di codifica | Una prova verifica che nessuna etichetta di sistema di codifica sia servita dal meccanismo di internazionalizzazione del progetto | codice, albero dichiarato in `10_fondamenti/16 §4.2-4.3` | **`T-08`.** Non eseguibile prima del cancello |

### 4.8 Che cosa attende il cancello di `T-03`

Nessuna riorganizzazione lo anticipa: sarebbe violazione di `V-182`, posto per una proprietà irrecuperabile.

| Attesa | Perché attende | Traguardo |
|---|---|---|
| Le quattro verifiche empiriche - scambio di token con delega esplicita, token d'ingresso a uso singolo su canale posteriore, difetti noti del prodotto di federazione, isolamento di rete in uscita del relay | Girano **attraverso** la pipeline; il codice usa-e-getta è ammesso solo come eccezione dichiarata al traguardo che istituisce la catena | `T-04` c.1–4 |
| Struttura dei moduli e regole di dipendenza verificate | È codice applicativo | `T-08` c.1 |
| Contesto di tenant applicato dal motore, con prova a pool esaurito | idem | `T-08` c.2 |
| Prove di isolamento fra tenant | idem | `T-08` c.3 |
| Registro immutabile con catena di impronte e copertura **integrale** | idem. `R-20`: «il singolo elemento di maggiore sforzo del catalogo» | `T-08` c.4 |
| Outbox transazionale come unica sorgente degli eventi | idem | `T-08` c.5 |
| Percorso verticale della televisita a due partecipanti, con matrice di tracciabilità generata | idem | `T-08` c.6 |
| Accessibilità automatizzabile e una verifica manuale con tecnologia assistiva reale | Presuppone le schermate | `T-08` c.7 |
| Prove media su due profili di rete | Presuppone la sessione | `T-08` c.8 |
| Separazione delle stringhe di internazionalizzazione | Presuppone il meccanismo | `T-06` c.5 |
| Manuale, fascicolo di rilascio, e i criteri bloccanti che presuppongono l'artefatto | Presuppongono l'artefatto | `T-10` |

---

## 5. Il parallelismo realmente disponibile

### 5.1 Che cosa significa «parallelo» con un contributore unico

Due lavori procedono in parallelo solo se soddisfano **entrambe** le condizioni: non si contendono lo stesso file, e non attendono la stessa decisione. Tutto il resto è **interfoliazione**: alternanza sulla stessa capacità, che non produce guadagno di calendario e produce invece il costo di cambio di contesto, non misurato e `[NV]`. Esistono tre forme di parallelismo genuino:

1. **Attore diverso.** Le decisioni del §4.1 sono del **committente**: consumano calendario e non ore del contributore. Sono l'unica capacità aggiuntiva che il progetto possiede.
2. **Attesa di terzi.** `PP-08` costa poche ore e poi **attende**; l'attesa è parallela a tutto (`01 §5.2`).
3. **Tempo macchina.** Costruzioni, controlli e produzione assistita della traduzione girano mentre il contributore fa altro, **a condizione** che il lavoro parallelo non tocchi gli stessi file.

### 5.2 I gruppi che procedono insieme

| Gruppo | Lavori | Perché è parallelo | Condizione |
|---|---|---|---|
| **P1 - Decisioni e attese** | `PP-01`…`PP-05`, `PP-08` | Attore diverso, o attesa di terzi | Che le domande siano **poste per iscritto**: una decisione non posta non è parallela, è ferma |
| **P2 - Pipeline** | `PP-12`…`PP-26` | Tocca `scripts/`, `.github/workflows/`, `scripts/prove/` | Non tocca `docs/**` né `website/i18n/en/**` |
| **P3 - Corpo documentale italiano** | `PP-35`, `PP-36`, `PP-39` | Tocca `docs/**` | Non tocca `scripts/` |
| **P4 - Accertamento del sito** | `PP-28`, `PP-29`, `PP-30` | Tocca `website/` | Non tocca `docs/**` |
| **P5 - Percorso di fabbricante** | `PP-06`, `PP-07`, `PP-09` | Documenti nuovi, nessun file condiviso | - |

### 5.3 I punti di serializzazione obbligata

| # | Punto | Che cosa si contende | Conseguenza operativa |
|---|---|---|---|
| **S1** | `.github/workflows/verifiche.yml` | `PP-13`…`PP-22` toccano lo stesso file; vi confluiscono `PP-27` e `PP-18` | I controlli si aggiungono **uno alla volta**, ciascuno con il proprio caso «deve fallire» prima del successivo. Un controllo aggiunto senza la prova di fallimento **non è un controllo** |
| **S2** | `docs/**` ↔ `website/i18n/en/**` sulle **aree prerequisito** | Regime di `D56`: ogni modifica italiana è incompleta finché non aggiorna l'inglese, e da `PP-20` **fa fallire la costruzione** | Ogni lavoro di `P3` su fondamenti, conformità o sicurezza **raddoppia** e si serializza con la traduzione. È capacità ricorrente (`01 §9`) |
| **S3** | `registro/identificativi-requisiti.tsv` | Registro in **sola aggiunta** | Nessuna riscrittura, nessun riuso di identificativo ritirato; il controllo lo verifica |
| **S4** | `docs/09_roadmap/00-indice.md §8.4` | Ogni revisione, ogni consumo di riga, ogni chiusura di criterio | È l'unico punto di scrittura della roadmap durante l'esecuzione, e appartiene alla roadmap, non a questo piano |
| **S5** | La decisione `Q-189` | `PP-11`, criterio 3 di `T-10`, forma del fascicolo | Tre lavori attendono la **stessa** decisione: paralleli al resto, non fra loro |
| **S6** | La decisione `Q-186` | `T-05` c.1 e criterio bloccante 18 | idem |
| **S7** | `T-03` come cancello | Tutto il §4.8 | Nessuna anticipazione ammessa. È il punto più duro, ed è normativo, non organizzativo |
| **S8** | La finestra 15–30 novembre | `T-10` e il residuo di `T-06` | Con ventitré-quarantasei ore, i due **non stanno insieme**: `T-10` precede, `T-06` cede |

### 5.4 Il parallelismo che sembra esistere e non esiste

- **`T-08` e `T-06` nella settimana del 7 novembre.** Il diagramma li sovrappone; la sovrapposizione toglie ore a `T-08` nella settimana in cui il percorso verticale deve chiudere.
- **`T-07` e `T-03` alla stessa data del 26 settembre.** Il criterio 1 di `T-07` *è* il controllo del criterio 2 di `T-03`: non sono due lavori, è lo stesso lavoro contato due volte.
- **`T-02` e la traduzione.** Ogni intervento di `T-02` su un'area prerequisito è, per `S2`, un lavoro doppio: `T-02` e `T-06` non sono paralleli, sono **accoppiati dal controllo di divergenza**.

---

## 6. Il consumo dell'ordine di sacrificio

### 6.1 Le tre regole che non si toccano

Da `03 §6.1`: **l'ordine si esegue dall'alto, per intero, e ogni esecuzione è registrata** con data e causa; **vi entrano soltanto tagli reversibili**; **i criteri bloccanti di `03 §8` e l'elenco di `03 §5.4` non vi entrano mai**. Se l'ambito non è più riducibile senza toccarli, **la data si dichiara mancata**.

### 6.2 L'ordine, con il traguardo su cui morde e il segnale che lo consuma

| Riga | Su che cosa morde | Segnale binario che ne autorizza il consumo | Data oltre la quale non compra nulla |
|---|---|---|---|
| `S-1` - esportazione delle metriche | `T-08`: capacità di misura di `03 §3.1` e `§3.9` | Alla revisione settimanale, `T-08` ha almeno un criterio fra 1–5 non soddisfatto | Quando l'esportazione è già scritta: **31 ottobre** |
| `S-2` - attestazione strutturata della qualità nell'esito | `T-08` c.6 (`03 §3.6`) | Il criterio 6 non è soddisfatto **e** `S-1` è già consumata | **7 novembre** |
| `S-3` - sala d'attesa e ammissione come stati distinti | `T-08` c.6 (`03 §3.4`) | idem, con `S-2` già consumata | **7 novembre** |
| `S-4` - elenco delle prestazioni del giorno | `T-08` c.6, interfaccia del professionista | idem | **7 novembre** |
| `S-5` - ripiego telefonico come esito tipizzato | `T-08` c.6, catalogo degli esiti | idem | **14 novembre** |
| `S-6` - firma asimmetrica degli eventi in uscita | `T-08` c.5 e `03 §3.7` | idem. **Consumarla non abilita il segreto condiviso** (`V-162`, `D60`): o firma asimmetrica, o **l'evento non esce verso terzi** e resta il recupero per chiamata autenticata | **14 novembre** |
| `S-7` - conteggio esatto delle parole | `T-02` c.5 | **Nessuno: la riga è priva di oggetto.** Il conteggio è stato eseguito il 26 agosto (`00 §8.4`) | **Già scaduta**, prima di essere consumabile |
| `S-8` - teleconsulto e telemonitoraggio fuori dal percorso verticale | `T-08` c.6 | **Consumata il 26 agosto 2026**, con procedura ordinaria e prima della pressione | - |

### 6.3 Tre conseguenze, senza attenuarle

**Prima - l'ordine ha oggi cinque-sei righe utili, non otto.** `S-8` è consumata; `S-7` è priva di oggetto. Restano `S-1`…`S-6`, e di queste solo `S-1` e `S-2` tolgono superficie senza toccare la macchina a stati. **L'indicatore anticipatore di `R-28` - «righe ancora disponibili», che `05 §2.1` fissa a sette - va letto oggi come sei.** Chi conta sette conta una riga che non esiste.

**Seconda - nessuna riga residua morde sul vincolo reale.** `00 §8.4` lo dichiara: l'ordine «taglia superficie e non tocca né il criterio 4 né il criterio 6 di `T-08`», protetti per costruzione - la copertura del registro non è riducibile (`01 §7.3`) e il percorso verticale *è* il rilascio. `S-8` ha ridotto il criterio 6 da «completo» a «completo per una sola prestazione», ed è **l'unica riga che abbia mai morso lì**. Eseguire per intero ciò che resta compra superficie, non profondità: se lo scostamento è sul registro immutabile o sul percorso verticale, **l'ordine non lo assorbe**, e la conseguenza prevista da `V-282` è la dichiarazione della data mancata.

**Terza - l'ordine non si esegue più «dall'alto» in senso stretto.** `S-8` è stata decisa e consumata mentre `S-1`…`S-7` erano intatte. Nel merito è corretto - `03 §6.1` regola 2 vieta di decidere un taglio **sotto pressione**, e questo è stato deciso prima - ma la proprietà «si esegue dall'alto e per intero» non descrive più ciò che è accaduto. Lettura operativa: **le righe si consumano nell'ordine dichiarato fra quelle ancora disponibili**, e ogni consumo si registra con data e causa in `00 §8.4`.

### 6.4 La tensione fra `S-1` e i presupposti di installazione

`TG-09` taglia i cruscotti versionati e sposta su chi installa la costruzione dei propri, **appoggiandola esplicitamente all'esportazione delle metriche** (`03 §5.2` riga `TG-09`; `03 §7.1`). `S-1` taglia l'esportazione delle metriche. Consumare `S-1` dopo `TG-09` lascia chi installa **senza cruscotti e senza il dato con cui costruirli**, e rende non soddisfacibile una riga dei presupposti. Il piano non risolve la tensione, la registra: **se `S-1` viene consumata, la riga dei presupposti di `03 §7.1` va riscritta nella stessa revisione**, altrimenti il documento promette una capacità che il rilascio non ha.

---

## 7. I punti di decisione irreversibili

### 7.1 Quelli dichiarati dalla roadmap (`02 §6`), riportati senza modifiche

| Data | Decisione | Chi | Se non presa entro quella data |
|---|---|---|---|
| **19 set 2026** | Forma giuridica del soggetto fabbricante e profilo della persona responsabile (`Q-280`, `D58`) | Committente | Il passo iniziale di `02 §5` slitta, e con esso **integralmente** tutto ciò che vi poggia. Classe `B`: il ritardo non si recupera lavorando di più |
| **30 set 2026** | Ripartizione delle registrazioni a ruoli distinti (`Q-189`) | Committente | `T-10` si pubblica con la **lacuna dichiarata**. Le registrazioni del periodo di `RU-1` non sono producibili in seguito |
| **15 ott 2026** | Periodo di supporto dichiarato (`C-4`, `Q-186`) | Committente, `COMP` | Piano di dismissione non pubblicabile. **Prerequisito di `T-10`** |
| **31 ott 2026** | Correzione della pagina pubblica (`Q-185`) | Committente, `PROD` | Il rischio di affermazione non sostenibile prosegue e **non è recuperabile** |
| **31 ott 2026** | Formulazione della differenza fra materiale pubblico e `RU-1` (`Q-281`) | `PROD`, committente | `RU-1` esce mentre il materiale pubblico dichiara capacità che il rilascio non contiene |
| **Prima di ogni ulteriore riduzione** | Esecuzione dell'ordine di sacrificio | Contributore unico, con registrazione | Una riduzione non registrata è un taglio non deciso |
| **Prima della documentazione pubblica del meccanismo** | Esito della verifica sull'inoltro del livello di garanzia (`B-8`, `Q-160`) | `INTEG`, `TECH` | Rettifica di documentazione pubblica su un meccanismo di sicurezza |

### 7.2 I punti che discendono dall'esecuzione, e che la roadmap non data

| Data | Momento | Perché è irreversibile in senso operativo |
|---|---|---|
| **26 set 2026** | Il cancello di `T-03` | Ogni giorno oltre è tolto ai quarantanove della finestra del codice, e `V-182` non consente di compensarlo anticipando |
| **19 ott 2026** | La soglia di `00 §8.4` | Da qui la revisione è **settimanale** e misura il consumo dell'ordine. Chi arriva qui con `T-03` o `T-04` aperti non ha più margine di ambito da spendere su `T-08` |
| **31 ott 2026** | Ultima data utile per `S-1` | Un taglio di superficie eseguito dopo che la superficie è costruita **non compra ore**: le ha già spese |
| **7 nov 2026** | Ultima data utile per `S-2`, `S-3`, `S-4` | idem, su macchina a stati e interfaccia |
| **14 nov 2026** | Chiusura di `T-08` | Oltre, nessuna riduzione protegge il 30 novembre. La decisione non è «che cosa tagliare» ma **«si pubblica o si dichiara la data mancata»** |
| **15 nov 2026** | Abbandono dichiarato di `T-06` a favore di `T-10` | I due non stanno insieme (`S8`). Non decidere significa non chiudere né l'uno né l'altro |

---

## 8. Il criterio di allarme

### 8.1 La forma

Binario e osservabile senza interpretazione. Niente percentuali, niente «in miglioramento» (`05 §5.1`), niente giudizi. Ogni riga si accerta guardando un artefatto o eseguendo un comando.

### 8.2 Gli allarmi

| # | Osservazione, alla revisione | Che cosa significa | Che cosa impone |
|---|---|---|---|
| **A1** | Al **26 settembre**: esiste almeno un controllo fra quelli del criterio 2 di `T-03` per il quale **non** esiste un caso deliberatamente non conforme che faccia fallire la costruzione | `T-03` non è chiuso, e il cancello di `V-182` non si apre | Nessuna riga dell'ordine morde su `T-03`. Si dichiara `T-03` non chiuso con l'elenco dei controlli mancanti e la causa |
| **A2** | Al **3 ottobre**: uno dei quattro criteri di `T-04` è privo di **esito registrato** | `T-08` costruirà su un'incertezza non rimossa | Si registra quale, e la regola presidiata resta in vigore, ripetuta accanto al rinvio (`T-04` c.5) |
| **A3** | Nella **settimana del 19 ottobre**: non sono chiusi **tutti** i traguardi di classe `A`, `B`, `C` - `T-01`, `T-03`, `T-14`, `T-04`, `T-05` | Soglia dichiarata da `00 §8.4`. La data diviene intenibile senza ulteriori riduzioni reversibili | Revisione fuori cadenza; consumo della prima riga disponibile; registrazione della causa. **Vedi §11.7**: `00 §8.4` scrive «nove traguardi di classe `A`, `B` e `C`», e sono cinque |
| **A4** | Due righe dell'ordine consumate **nello stesso mese** | Indicatore anticipatore di `R-28` | Revisione fuori cadenza su `R-28`, sul traguardo colpito e sul perimetro dichiarato di `RU-1` |
| **A5** | Un traguardo non chiuso alla propria data **senza** che una riga sia stata consumata | Lo scostamento è stato assorbito in silenzio: è la condizione che precede l'esito peggiore di `R-28` | Si registra il consumo retroattivamente con la causa, oppure si dichiara che il traguardo è aperto |
| **A6** | Al **14 novembre**: il criterio 6 di `T-08` non ha un percorso verticale **provato da estremo a estremo** con matrice generata | Nessuna riga residua morde qui (§6.3) | Si dichiara la data mancata con la causa (`V-282`), oppure si porta al committente una riduzione **nuova** - sapendo che deciderla ora è deciderla sotto pressione, che `03 §6.1` regola 2 vieta |
| **A7** | Un criterio dichiarato soddisfatto **senza** prova indicata (file, comando, esito, data) | La dichiarazione non è verificabile da un terzo (`01 §12` criterio 2) | Il criterio torna a **non soddisfatto** finché la prova non è indicata |
| **A8** | Una modifica accettata su un'area **prerequisito** che non ha aggiornato l'inglese | Impossibile per costruzione dopo `PP-20`. Se accade, **il controllo è mal configurato** (`R-16`) | Si verifica il controllo prima del contenuto: un controllo tarato su una convenzione sbagliata **afferma il falso**, ed è la lezione già registrata in `00 §8.4` |

### 8.3 Che cosa non è un allarme

Non lo è il ritardo di `T-14`, `T-07`, `T-02` o `T-06` rispetto alla propria data, perché nessuno sposta `RU-1` (§3.2). Sono **fatti da registrare** con la causa, e il loro effetto è altrove: oltre il 2026 per `T-14`, sul regime linguistico per `T-06`, sulla riemissione futura per `T-02`. Confondere un ritardo laterale con un allarme di percorso critico produce l'inversione di priorità che `01 §2` descrive come principale causa di fallimento dei progetti regolati.

---

## 9. Come piani e roadmap si mantengono allineati durante l'esecuzione

### 9.1 Il principio

> **La roadmap è la fonte; i piani sono lo strumento. Un criterio non si dichiara soddisfatto senza che la prova sia indicata e il registro delle revisioni della roadmap lo registri.**

Due divieti simmetrici. **Non si aggiorna un piano dichiarando fatto ciò che la roadmap non registra**: il piano diventerebbe una seconda verità, e due verità divergono in due posti diversi. **Non si aggiorna la roadmap su un lavoro che nessun piano descrive**: la registrazione perderebbe la tracciabilità verso ciò che è stato materialmente eseguito.

### 9.2 Chi aggiorna che cosa, in quale momento

| Evento | Chi | Che cosa aggiorna, e dove | Prova richiesta |
|---|---|---|---|
| **Un criterio si chiude** | Contributore unico | Il piano del traguardo in `.telemedic/piani/` marca il lavoro `PP-nn` come fatto; **e** `docs/09_roadmap/00-indice.md §8.4` registra il criterio come soddisfatto | Il file prodotto, il comando che lo verifica, l'esito, la data. Per un controllo: il caso «deve fallire» e l'esecuzione che lo dimostra |
| **Un traguardo si chiude** | Contributore unico | `00 §8.4` con **tutti** i criteri elencati e nessuno «in parte»; il piano specifico si chiude | L'elenco completo con la prova di ciascuno (`01 §12`) |
| **Un traguardo non chiude alla sua data** | Contributore unico | `00 §8.4`: quale criterio manca e **la causa**, non solo la conseguenza (`00 §8.1`) | Il criterio mancante, nominato |
| **Si consuma una riga dell'ordine** | Contributore unico | `00 §8.4` con **data e causa**; `03 §6.2` non si modifica (è l'ordine, non il consumo); il perimetro dichiarato in `03 §3` si aggiorna nella stessa revisione | Riga, data, causa, traguardo colpito |
| **Una decisione del committente si chiude** | Committente per la decisione, contributore per la registrazione | Il brief (nuova tornata); poi **l'intera roadmap** è rivista, perché le decisioni sono la sua base (`00 §8.2`) | Il testo della decisione, con la data |
| **Un rischio si materializza** | Contributore unico | `05` per il rischio, `00 §8.4` per la revisione fuori cadenza; il traguardo colpito e i successori | L'indicatore anticipatore **osservato**, non dedotto |
| **Si supera un punto di decisione senza decisione** | Contributore unico | `00 §8.4`: lo scenario di riferimento **decade automaticamente** (`00 §8.2`) | La data superata |
| **Questo piano cambia** | Contributore unico | Solo `.telemedic/piani/00-PIANO-PRINCIPALE.md` | La ragione, e il rinvio alla riga della roadmap che lo impone |

### 9.3 La cadenza

**Fino al 18 ottobre 2026: revisione mensile**, con esito registrato anche quando è «nessuna variazione» (`00 §8.1`). **Dal 19 ottobre 2026: revisione settimanale**, ridotta a due numeri - righe residue dell'ordine e criteri bloccanti soddisfatti. È la contromisura di `R-28`: una revisione mensile su un piano senza margine osserva il fenomeno quando è finito. A queste si aggiungono le **revisioni fuori cadenza** con gli otto inneschi di `00 §8.2`, obbligatorie e non facoltative.

### 9.4 La forma della prova

Quattro campi; senza uno dei quattro non è una prova.

| Campo | Ammesso | Non ammesso |
|---|---|---|
| **Artefatto** | `scripts/verifica-identificativi-requisiti.sh` | «lo script di verifica» |
| **Comando o procedura** | `./scripts/prove/esegui-prove.sh` | «è stato provato» |
| **Esito** | «22 casi; ogni caso "deve fallire" fa fallire la prova se il controllo passa» | «funziona» |
| **Data** | 26 agosto 2026 | «di recente» |

**Due regole aggiuntive.** *Prima - la prova al contrario*: un controllo che non è stato visto fallire non è un controllo (`T-03` c.2); il banco `scripts/prove/` è stato sottoposto a prova di mutazione (da 17 casi conformi su 17 a 11 su 17 rendendo un controllo sempre-verde), ed è la forma che ogni estensione futura deve avere. *Seconda - prima di estendere un controllo a una nuova classe di documenti, si verifica sul repository la convenzione che quei documenti seguono davvero*: è la lezione di `00 §8.4`, dove un controllo tarato su una convenzione sbagliata **non ha taciuto, ha affermato il falso**, con l'autorevolezza di una verifica automatica.

### 9.5 La regola sulle due lingue

Ogni difetto, correzione e chiusura di criterio che tocchi un'area **prerequisito** si chiude **su entrambe le lingue nello stesso cambiamento**. Dal momento di `PP-20` la regola è imposta dal controllo; prima di quel momento è imposta dalla sola disciplina, ed è esattamente la condizione in cui l'errore si commette.

### 9.6 Il rapporto con i piani dei singoli traguardi

Questo documento contiene la sequenza, il percorso critico e la disciplina, non i piani dei traguardi. Ciascun piano di traguardo è tenuto a: **riferire i propri lavori ai criteri numerati** di `02 §3` senza riformularli; **dichiarare le dipendenze con la distinzione del §2.1**; **non introdurre criteri nuovi** (un criterio che non è in `02 §3` non è un criterio del traguardo); **registrare la prova nella forma del §9.4** prima di dichiarare soddisfatto. Dove un piano trovi una dipendenza che questo piano non ha visto, **la aggiunge qui**: la sequenza vive in un posto solo.

---

## 10. Che cosa questo piano non copre, e chi lo copre

| Materia | Dove vive | Perché non qui |
|---|---|---|
| Che cosa `RU-1` contiene | `03 §§3–4` | È il perimetro, non la sequenza |
| Che cosa è stato tagliato e che cosa non torna | `03 §5`, con i quattro tagli irreversibili al §5.3 | È la fonte; vi si rinvia e non si riscrive |
| I criteri di rilascio bloccanti | `03 §8`, diciotto voci | Sono criteri di `T-10`, non lavori di questo piano |
| I rischi di programma | `05`, trenta voci con indicatore e titolare | Questo piano usa gli indicatori (§8) e non li ridefinisce |
| I rischi per la sicurezza dell'assistito | `docs/08_compliance/05-gestione-del-rischio.md` | Hanno scala e disciplina proprie; mescolarli farebbe apparire negoziabile un rischio clinico |
| La coda oltre il primo rilascio | `04`, ventidue voci `OL-nn` e le `DS-nn` | Nulla della coda è sul percorso del 30 novembre |
| Le esclusioni definitive di perimetro | `docs/03_functional/07-fuori-perimetro.md` | Un'esclusione decisa non è una dipendenza: è un confine |
| Le decisioni architetturali | `docs/adr/` | Una decisione presa non si ripianifica |
| Il percorso di conformità e il suo calendario | `docs/08_compliance/09-percorso-e-calendario.md`, `02 §5` | Nessuna data di quel percorso è promessa di esito (`V-171`, `V-280`) |
| I piani dei singoli traguardi | Gli altri file di `.telemedic/piani/` | Sono di altri; questo piano ne fissa la disciplina, non il contenuto |
| La ripartizione delle responsabilità | `docs/06_security/09-ripartizione-delle-responsabilita.md`, `03 §11` | È una tabella di responsabilità, non di sequenza |

---

## 11. Le contraddizioni trovate, e non corrette

### 11.1 `T-03` esige un artefatto che `T-02` produce dopo
Il criterio 2 di `T-03` (26 settembre) esige che blocchi «il controllo sui termini vietati che attua la regola `R0`»; il criterio 6 di `T-02` (10 ottobre) dice che «è definita e versionata la lista dei termini vietati che alimenta il controllo». **Il controllo non può bloccare su una lista che non esiste.** O la lista precede `T-03`, o il criterio 2 non è soddisfacibile alla sua data.

### 11.2 `T-02` è l'unico traguardo privo del campo «Dipendenze»
`02 §0` lo prescrive per tutti. `T-02` ne è privo e ha almeno una dipendenza vera: il criterio 2 rinvia esplicitamente al «controllo bloccante di `T-03`».

### 11.3 `T-06` dipende da `T-08` e non lo dichiara
Il criterio 5 di `T-06` non è verificabile finché non esistono stringhe di internazionalizzazione, cioè finché `T-08` non esiste. Le dipendenze dichiarate sono `T-02` c.1 e c.5 e `T-03` c.3. Inoltre l'innesco dichiarato - il conteggio delle parole - **è già scattato il 26 agosto**.

### 11.4 La protezione del ramo è insieme non attuata e risolta, alla stessa data
`00 §8.4` registra `404 Branch not protected` e apre `Q-283` fra i controlli **non attuati**; `docs/08_compliance/10-controllo-dei-documenti.md §5` e `§10` la dichiarano **attuata dal 26 agosto 2026** e `Q-283` **risolta**. Lo stesso documento di conformità, al §7.1 punto 5 e al §8, continua a scrivere che il controllo «non è oggi attuato»: la contraddizione è **anche interna** a quel documento.

### 11.5 Un taglio reversibile dichiarato è stato disfatto senza registrazione
`TG-16` e la sezione «che cosa non comprende» di `T-02` dichiarano rinviato il **modulo delle fonti primarie**, con la conseguenza che «ogni rinvio normativo resta citato per esteso nel testo». I file `docs/10_fondamenti/20-fonti-primarie.md` e la versione inglese **esistono**, e `00 §4` dichiara la guida completa «fonti primarie comprese». Un taglio disfatto è una decisione quanto un taglio eseguito, e `00 §8.3` esige che le variazioni di ambito siano registrate.

### 11.6 I criteri 5, 6 e 7 di `T-03` non hanno oggetto prima del codice
`T-03` esige distinta «per ogni artefatto», registro dei componenti e firma degli artefatti. Prima del cancello l'unico artefatto è il sito. La roadmap dichiara degenere la verifica analoga in `TG-05`, e non fa la stessa dichiarazione per `T-03`: senza di essa, un criterio soddisfatto sul solo sito rischia di essere letto come soddisfatto sul prodotto.

### 11.7 Aritmetiche che non tornano fra i documenti della roadmap

| Dove | Che cosa dice | Che cosa risulta dai documenti |
|---|---|---|
| `00 §8.4` | «uno qualunque dei **nove** traguardi di classe `A`, `B` e `C` del capitolo `02 §3`» | Sono **cinque**: `T-01`, `T-03` (A), `T-14` (B), `T-04`, `T-05` (C) |
| `02 §7`, lettura del diagramma | «le barre critiche… **sono nove su dieci**» | Nel diagramma sono marcate `crit` **sette** barre su dieci: `T-01`, `T-03`, `T-14`, `T-04`, `T-06`, `T-08`, `T-10` |
| `02 §4.1` e `05 §2.1` | «**Nove** traguardi occupano l'intero periodo residuo» | I traguardi datati fino al 30 novembre in `02 §3` sono **dieci** |
| `05 §1.3` e `05 §2.1` (`R-28`) | «l'ordine ha **sette** righe»; «**Sono sette**» | Dopo `S-8` le righe sono **otto**, e le utili oggi **sei** (§6.3) |
| `05 §2.1` (`R-28`) | «`[NV]` il numero di ore settimanali **non è dichiarato**» | `D62` lo dichiara: dieci-venti ore. Il registro dei rischi non recepisce ancora `D62` |
| `00 §4` e `02 §1` | `00 §4`: guida dei fondamenti **completa**, glossario e fonti primarie compresi; inglese su quattro aree | `02 §1`: «mancano due moduli su ventuno, il glossario e le fonti primarie»; «**la versione inglese dei documenti non esiste**» |
| `00 §4`, intestazione e corpo | Intestazione: «stato di fatto al **26 agosto 2026**» | Corpo: «Il progetto ha, al **25 agosto 2026**…» |

### 11.8 Due tensioni operative, non contraddizioni
**La prima**, al §6.4: `S-1` toglie l'esportazione delle metriche su cui `TG-09` appoggia i presupposti di installazione. **La seconda**: il controllo di divergenza è dichiarato soddisfatto come criterio 3 di `T-03` in `00 §8.4`, mentre nel repository è `continue-on-error: true` (`.github/workflows/verifiche.yml`, riga 74) e le condizioni del suo innesco di bloccanza si sono verificate. **Il criterio è soddisfatto sull'esistenza del comportamento differenziato e non sulla bloccanza**: è `PP-20`.

---

## 12. Sintesi operativa in una pagina

**Fai subito, e non sono ore: `PP-01`…`PP-05` (decisioni) e `PP-08` (richieste agli organismi).** Sono le sole cose che si perdono per sempre se rinviate, e non consumano la finestra del codice.

**Entro il 26 settembre: `T-03` per intero, `PP-38` prima di `PP-18`, `T-07`.** Il cancello di `V-182` non si apre da solo e non si aggira.

**Fra il 27 settembre e il 14 novembre: `T-04`, poi `T-08` e nient'altro.** È la finestra che `D62` dichiara insufficiente. Ogni deviazione qui non ritarda: **riduce**.

**Dal 15 novembre: `T-10` e nient'altro.** `T-06` cede, e la cessione si registra.

**A ogni revisione: due numeri.** Righe residue dell'ordine - oggi **sei**, non sette - e criteri bloccanti soddisfatti. Nient'altro, nessuna percentuale.

**Alla settimana del 19 ottobre, la domanda binaria:** `T-01`, `T-03`, `T-14`, `T-04`, `T-05` sono tutti chiusi? Se anche uno solo non lo è, la data non tiene senza ridurre ancora, e la riduzione si decide con la procedura ordinaria e si registra.

> **Avvertenza permanente.** Nessun traguardo di questo piano modifica lo stato di fatto: **oggi il prodotto non reca marcatura CE**, non è coperto da alcuna dichiarazione di conformità, e **nessun artefatto distribuito è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali** (`D16`). Che il progetto intenda assumere il ruolo di fabbricante (`D58`), con il soggetto ancora da costituire, è **pianificazione interna**: non è una data di marcatura (`V-171`, `V-280`), non copre alcuna installazione presente e non toglie alcun obbligo a chi installa, integra o mette in servizio il software.

---

## 13. Registro di esecuzione del piano

Nasce vuoto e si riempie **a lavoro eseguito**, non a lavoro previsto. Una riga per modifica
sostanziale. La colonna «effetto sulla roadmap» non ammette «nessuno» senza motivazione. Una data
mancata non si riscrive: resta in tabella con la sua causa.

| Data | Che cosa | Prova | Effetto sulla roadmap |
|---|---|---|---|
| 26 ago 2026 | **Prodotti i quattordici piani** di `.telemedic/piani/`, ~94.000 parole. `T-01` non ne ha uno: è chiuso salvo il criterio 1, che dipende da `Q-189` | i file | Registrato in `00-indice.md` §8.4. Nessun criterio cambia stato: sono pianificazione interna (`D57`) |
| 26 ago 2026 | **Verificato che il sito di documentazione esiste ed è raggiungibile.** GitHub Pages attivo, `build_type: workflow`, dominio `fedcal.github.io/Telemedic/` | `gh api repos/fedcal/Telemedic/pages`; `curl -sI` su radice e su `/en/` → **200** su entrambe | Concorre al criterio 1 di `T-07`, che però resta non soddisfatto: il criterio chiede il controllo sui collegamenti **bloccante**, non la raggiungibilità |
| 26 ago 2026 | **Misurate le traduzioni.** 4 aree complete su 12 (54 file), 8 da tradurre (91 file, ~317.000 parole). Zero marcatori di continuazione residui | `verifica-divergenza-traduzioni.sh`: `Allineati 52 · Divergenti 2 · Assenti ed esigiti 0`; conteggio per area IT/EN; `grep -rn 'CONT-->' website/i18n/en/` → 0 | Conferma il criterio 1 di `T-06` soddisfatto e il perimetro di `T-09` |
| 26 ago 2026 | **Corretto un difetto del controllo di divergenza.** `git log` esce con successo restituendo vuoto su file non tracciato: `\|\| echo 0` non scattava e il confronto riceveva una stringa vuota. Il valore predefinito si impone ora dopo la sostituzione | prima: `[: : atteso intero` ripetuto; dopo: nessun errore, stessi conteggi | Nessuno sui criteri. **Resta dovuto un caso di prova negativo** in `scripts/prove/esegui-prove.sh`: un controllo corretto e non provato è un controllo che nessuno ha visto fallire |
| 26 ago 2026 | **Identificati i due file divergenti**: `04_protocols/09-tempo-reale.md` e `06_security/02-identita-e-accessi.md`. **Non coincidono** con i tre dichiarati dal registro dei difetti §19.5 | esito del controllo | Da accertare nel consolidamento. È la seconda volta che il registro dei difetti risulta fallibile |
| 26 ago 2026 | **Ampliamento di ambito deciso dal committente**: la traduzione delle otto aree residue si esegue adesso, anticipando `T-09` (`[INTENZIONE]`, 2027) | decisione registrata in `00-indice.md` §8.4 | `T-09` cessa di essere lavoro del 2027. La riserva posta e non accolta: sei aree su otto descrivono un sistema che in codice non esiste, e `T-08` ne muoverà una parte |
| 26 ago 2026 | **Registrate in `00-indice.md` §8.4 due rettifiche** di quel registro stesso: la bloccanza mancante del controllo di divergenza (`continue-on-error: true`, riga 74) e il conteggio delle righe residue dell'ordine di sacrificio, **sei e non sette** | riga 74 di `verifiche.yml`; `S-1`…`S-8` in `03 §6.2` contro «Sono sette» in `05 §1.3` e `§2.1` | Il criterio 3 di `T-03` e il criterio 2 di `T-06` tornano **non soddisfatti** quanto alla bloccanza. L'indicatore anticipatore di `R-28` sovrastima di una riga |
