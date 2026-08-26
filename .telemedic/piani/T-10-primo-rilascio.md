# Piano di `T-10` - `RU-1`, primo rilascio installabile

**Traguardo.** `T-10`, classe `D`, `[IMPEGNO]`, **30 novembre 2026**.
**Innesco.** Chiusura di `T-08` e di `T-06`.
**Titolare.** Contributore unico per la produzione. **Il riesame del rilascio non ha titolare
interno**: è la lacuna di `Q-189`, dichiarata e non pianificata (`V-281`).
**Piano redatto il.** 26 agosto 2026.

---

## 0. Che cos'è questo piano, e che cosa non è

È il piano di esecuzione del traguardo terminale del primo anno. Non riapre alcuna decisione: `D53`
fissa la data, `D54` e `D62` fissano la capacità, `D55` congela la destinazione d'uso, `D56` regola
la traduzione, `D57` e `D58` regolano l'attribuzione. Il piano **espone le conseguenze** di quelle
decisioni sul rilascio, che è cosa diversa e più utile dal ridiscuterle.

Tre cose che questo piano non fa, e che vanno dette prima di ogni altra.

**Non contiene una riga di codice applicativo.** `V-182` lo vieta prima di `T-03`, e questo è
comunque un piano: la sua unità di misura è la decisione e l'artefatto, non l'istruzione.

**Non introduce identificativi nuovi.** Le famiglie in vigore - `T-nn`, `RU-n`, `TG-nn`, `S-n`,
`R-nn`, `Q-nnn`, `OL-nn`, `D-nn`, `V-nnn` - appartengono ai documenti che le hanno istituite. Dove
questo piano deve nominare un proprio passo lo numera in chiaro («passo 1», «gate del 19 ottobre»)
e non conia una sigla, perché una sigla coniata in un piano interno finisce citata come se fosse un
identificativo di requisito.

**Non contiene alcuna data di marcatura, in alcuna forma.** `V-171` e `V-280` sono verificati: il
primo è richiamato in `docs/09_roadmap/00-indice.md` §9.5 e vieta di scrivere che il prodotto sarà
marcato entro una data; il secondo dichiara che la roadmap è pianificazione interna e che una data
di pianificazione interna non è una promessa di esito. Oggi il prodotto **non reca marcatura CE**,
non è coperto da alcuna dichiarazione di conformità, e chi lo installa, integra o mette in servizio
assume comunque gli obblighi che ne derivano. Il progetto **non appone marcatura CE**: pubblica il
materiale regolatorio per il percorso che intende intraprendere, e distingue in ogni punto il
proprio obbligo da quello di chi installa.

---

## 1. Lo stato accertato, e i due fatti che determinano tutto il resto

### 1.1 Il calendario residuo, misurato

Dal 26 agosto al 30 novembre 2026 restano **novantasei giorni**. La capacità è quella di `D54`
quantificata da `D62`: **dieci-venti ore a settimana, contributore unico**. Le date che seguono
sono **allocazioni del calendario residuo**, non stime, e non portano percentuali di avanzamento
(`V-181`).

La finestra effettiva di `T-10` è più stretta di quanto la data suggerisca. L'innesco è la chiusura
di `T-08` (14 novembre) **e** di `T-06` (21 novembre): fra il 21 e il 30 novembre restano **nove
giorni**, cioè **circa tredici-ventisei ore**. Il diagramma di
`docs/09_roadmap/02-traguardi.md` §7 colloca la barra di `T-10` a partire dal 14 novembre, ma
l'innesco dichiarato nel §3 dello stesso capitolo richiede anche `T-06`: fra le due
rappresentazioni prevale l'innesco, perché è il criterio, e la barra è la sua approssimazione
grafica. La contraddizione è registrata al §11 di questo piano.

### 1.2 La regola che discende dalla finestra, ed è la regola centrale di questo piano

> **La fascia di rilascio non è il momento in cui i criteri bloccanti si soddisfano per la prima
> volta. È il momento in cui si rieseguono su una revisione congelata.** Un criterio bloccante
> soddisfatto per la prima volta dentro la finestra di rilascio è un criterio che **non** è stato
> soddisfatto: nessuno lo ha visto fallire, nessuno lo ha visto passare due volte, e il suo esito
> non distingue una proprietà del prodotto da una coincidenza.

Ne discende l'obbligo operativo che governa i §§2 e 12: **ogni criterio bloccante deve avere almeno
un'esecuzione registrata anteriore al 21 novembre 2026**, e la finestra 22–30 novembre serve alla
riesecuzione sulla revisione congelata, alla produzione degli artefatti e alla pubblicazione.

### 1.3 L'aritmetica non chiude, ed è dichiarato

Il registro delle revisioni di `docs/09_roadmap/00-indice.md` §8.4 lo scrive alla lettera, e questo
piano lo riporta senza attenuarlo: con `D62` e la finestra di quarantanove giorni fra `T-03` e
`T-08`, `T-08` porta due criteri che il progetto stesso classifica «mesi» - il criterio 4, il
registro immutabile (`R-20`, «il singolo elemento di maggiore sforzo del catalogo»), e il criterio
6, il percorso verticale. **L'aritmetica non chiude nemmeno dopo `S-8`.** La soglia dichiarata è la
settimana del **19 ottobre 2026**: se in quella settimana uno qualunque dei nove traguardi di
classe `A`, `B` e `C` non è chiuso, la data diviene intenibile senza ulteriori riduzioni
reversibili. Il §8 di questo piano descrive che cosa si fa in quel caso, e lo descrive prima che
accada perché deciderlo dopo significherebbe deciderlo sotto pressione.

### 1.4 `S-8` allinea, non riduce

Va detto perché cambia la lettura di tutto il capitolo. `S-8` restringe il percorso verticale
dimostrabile di `RU-1` alla **sola televisita programmata a due partecipanti**; teleconsulto e
telemonitoraggio restano progettati in dominio, requisiti, regole di business e scenari di prova, e
non esercitati nel codice.

Il materiale pubblico **dichiarava già** una sola prestazione nel primo rilascio: verificato in
`docs/00_overview/04-stato-e-limiti.md` §4, prima riga della tabella dei limiti - «Un solo tipo di
prestazione: **televisita programmata**» - e §7, punto 3 - «Il primo rilascio conterrà una sola
prestazione». `S-8` **allinea quindi la roadmap al materiale pubblico**, non riduce ciò che era
stato promesso. È l'unico taglio dell'ordine con questa proprietà, e va detto perché la proprietà
inversa - un taglio che riduce ciò che il materiale pubblico dichiara - è precisamente la materia
di `Q-281` e non si applica qui.

---

## 2. I criteri di rilascio bloccanti, uno per uno

`RU-1` **non si pubblica** se anche uno solo di questi criteri non è soddisfatto. Non esiste deroga,
non esiste approvazione che li superi, **nessuno entra nell'ordine di sacrificio**
(`docs/09_roadmap/03-primo-rilascio-utilizzabile.md` §8 e §6.1, terza regola). Sono diciotto, e ad
essi si aggiungono i tre criteri propri di `T-10` in `docs/09_roadmap/02-traguardi.md` §3.

La colonna **Dipende dal codice** è la colonna operativa di questo piano: i criteri che non ne
dipendono sono eseguibili prima e **non vanno lasciati alla fine**, perché sono l'unica parte del
lavoro che la finestra di nove giorni non deve assorbire.

### 2.1 I diciotto criteri di `03 §8`

| # | Criterio | Dipende dal codice | Chi lo produce | Come si dimostra soddisfatto, in forma binaria e osservabile |
|:-:|---|:-:|---|---|
| 1 | Isolamento fra tenant su ogni interfaccia | **Sì** (`T-08` cr. 2-3) | Contributore unico | La suite che tenta attivamente l'accesso illegittimo - pool esaurito, contesto non risolto, richiesta senza tenant, tenant sostituito a metà percorso - **passa**, e la variante deliberatamente permissiva **fa fallire** la costruzione. Esito nell'attestazione «esito delle prove» |
| 2 | Nessuna configurazione supportata emette un token privo del claim dell'attore (`V-132`) | **Sì** (`T-04` cr. 1) | Contributore unico | Prova negativa **enumerata su tutte le configurazioni supportate**, con l'elenco delle configurazioni versionato: una configurazione non elencata non è supportata. Esito registrato in `T-04` e rieseguito in fascia di rilascio |
| 3 | La catena del registro immutabile è verificabile e l'alterazione indotta viene rilevata | **Sì** (`T-08` cr. 4) | Contributore unico | Esecuzione della verifica su un caso alterato deliberatamente: **rileva**. Esecuzione sul caso integro: **non rileva**. Entrambi gli esiti conservati, perché un rilevatore che rileva sempre non è un rilevatore |
| 4 | Nessun contenuto clinico in registri, metriche, tracce, buste degli eventi, messaggi di errore | **Sì** (`T-08` cr. 5) | Contributore unico | Prove che tentano di far passare dati sintetici riconoscibili e **falliscono se ci riescono**, su tutte e cinque le uscite. Nessun dato reale di paziente, mai, in nessuna prova |
| 5 | I controlli dichiarati bloccanti hanno superato la prova di fallimento; i controlli in sola segnalazione hanno ciascuno la data dichiarata in cui diventano bloccanti | **In parte** | Contributore unico | Banco di prova con un caso «deve fallire» per ciascun controllo bloccante; file di configurazione versionato con la data per ciascun controllo in segnalazione. **Un controllo in segnalazione privo di data non è ammesso** |
| 6 | Riproducibilità dell'artefatto principale verificata | **Sì** | Contributore unico | Ricostruzione su esecutore diverso, **impronte identiche**, esito conservato. Perimetro ridotto dichiarato (`TG-14`): sugli altri artefatti la verifica non è disponibile, e il fascicolo lo scrive |
| 7 | Distinta dei materiali completa: nessun componente presente nella distinta e assente dalle annotazioni | **Sì** | Contributore unico | Controllo di pipeline `G5`, provato con un componente deliberatamente non annotato che deve far fallire la costruzione |
| 8 | Nessuna migrazione insieme distruttiva e funzionale: due versioni consecutive convivono (`V-111`) | **Sì** | Contributore unico | Prova di convivenza **e** prova di ritorno alla versione precedente, entrambe eseguite, entrambe con esito conservato |
| 9 | Accessibilità: nessuna violazione automatizzabile su alcuna schermata e alcuno stato significativo; almeno una verifica manuale con tecnologia assistiva reale | **Sì** (`T-08` cr. 7) | Contributore unico | Controllo di pipeline `G4` senza rilievi; lista di controllo manuale versionata con esito e data. **Non è una valutazione formativa** (`TG-22`) e il fascicolo lo dichiara |
| 10 | L'indicatore di registrazione non è occultabile | **Sì** | Contributore unico | Prova negativa che tenta di nasconderlo **con ogni mezzo previsto dalla configurazione** e fallisce in tutti. Presidia una funzione non presente in `RU-1`, ed è deliberatamente non tagliato |
| 11 | Le prove negative delle esclusioni di perimetro passano | **Sì** | Contributore unico | Una prova negativa per **ciascuna** esclusione di `docs/03_functional/07-fuori-perimetro.md` con verifica dichiarata: nessuna interfaccia accetta il calcolo di una priorità, la deduzione di una soglia, la generazione di contenuto interpretativo |
| 12 | La verifica delle chiavi è stato bloccante della macchina a stati, e la procedura di mancata corrispondenza è provata con la stessa evidenza del caso positivo | **Sì** | Contributore unico | Prova di percorso comprensiva del caso negativo. Non tagliabile (`03 §5.4`) |
| 13 | Il relay non instrada verso l'anello di richiamo locale, gli indirizzi privati, i servizi di metadati | **Sì** (`T-04` cr. 4) | Contributore unico | La prova **fa fallire la costruzione se una qualunque richiesta riesce**. È l'unico criterio la cui difesa primaria è di chi installa (`03 §7.1`), e va letto insieme a quel presupposto |
| 14 | Il rapporto di tracciabilità è prodotto e la vista «requisiti senza prove» è vuota o è una lista di lacune dichiarate con motivazione | **Sì** | Contributore unico | Artefatto di rilascio generato dalla pipeline. Con `S-8` la vista **non sarà vuota**: teleconsulto e telemonitoraggio hanno requisiti senza prove, e ciascuno va nella lista con la motivazione «rinviato per `S-8`, progettato e non esercitato» |
| 15 | Ogni artefatto reca la dichiarazione di non marcatura, nel testo riallineato a `D58`, e nessun materiale del rilascio contiene una data di marcatura | **No** | Contributore unico | `scripts/verifica-dichiarazione-non-marcatura.sh`, già esistente e già provato su artefatto deliberatamente privo, esteso agli artefatti di distribuzione; **più verifica testuale** sull'assenza di date di marcatura su tutto il materiale del rilascio. Fondato su elementi strutturali e non su una frase |
| 16 | Nessun `[NV]` aperto su un componente rilasciato | **No** | Contributore unico | Rapporto degli `[NV]` con destinatario, generato. **Vedi §2.4: questo criterio ha oggi due `[NV]` noti che lo violano**, e vanno chiusi prima del rilascio |
| 17 | Il fascicolo di rilascio contiene l'elenco delle lacune dichiarate, con i quattro tagli irreversibili in testa e la dichiarazione che nessuna verifica è stata eseguita da un secondo soggetto, **in entrambe le lingue** | **No** | Contributore unico; forma da `Q-282` | Artefatto di rilascio, verificato **testualmente** e in due lingue. È il criterio che sostituisce il riesame del rilascio **e non lo sostituisce davvero**: ciò che resta producibile è la dichiarazione esplicita che il riesame non c'è stato |
| 18 | Il periodo di supporto è dichiarato e il piano di dismissione delle versioni è pubblicato | **No** | **Committente e `COMP`** | Documento pubblicato. Dipende da `C-4` / `Q-186`, punto di decisione **15 ottobre 2026**. È l'unico criterio bloccante il cui titolare non è il contributore unico |

### 2.2 I tre criteri propri di `T-10`

| # | Criterio | Dipende dal codice | Come si dimostra soddisfatto |
|:-:|---|:-:|---|
| A | Manuale di installazione ed esercizio, **in italiano**, con i presupposti di installazione in testa; **avvertenze e limiti d'uso in entrambe le lingue** | **In parte** | Il manuale esiste, è pubblicato con l'artefatto, e la sua prima sezione è l'elenco dei presupposti di `03 §7.1`. La verifica testuale accerta che le sezioni «avvertenze» e «limiti d'uso» esistano nelle due lingue. Il manuale in inglese **non è dovuto** (`TG-19`) e l'assenza è dichiarata |
| B | Fascicolo che accompagna il rilascio | **In parte** | Vedi §4: sette elementi, ciascuno con la propria prova di esistenza |
| C | Il fascicolo dichiara, in modo non aggirabile e in entrambe le lingue, che **nessuna verifica è stata eseguita da un secondo soggetto** | **No** | Verifica testuale sulle due lingue, con l'elenco nominato delle quattro verifiche assenti: riesame del rilascio, audit interno, verifica di configurazione indipendente, revisione esterna del codice di sicurezza critico |

### 2.3 Che cosa è eseguibile senza codice, e quando si esegue

Sono **cinque** i criteri che non dipendono dal codice - 15, 16, 17, 18 e il criterio proprio C - a
cui si aggiungono le parti documentali dei criteri A e B e la metà documentale del criterio 5. È
poco in numero e molto in peso, perché sono precisamente i criteri che, se lasciati alla fine,
competono per le stesse tredici-ventisei ore della finestra di rilascio con la riesecuzione di tutto
il resto.

**La regola di questo piano: nessuno dei criteri non dipendenti dal codice entra nella finestra
22–30 novembre.** Le allocazioni sono al §12. Due di essi hanno un titolare che non è il
contributore unico e vanno posti prima, non ricordati dopo: il criterio 18 dipende dal committente
al 15 ottobre, e la forma del criterio 17 dipende da `Q-282` verso `COMP`, la cui unica scadenza
dichiarata è «prima di `T-10`» - che è una scadenza troppo debole per un criterio bloccante, e
questo piano la irrigidisce al **17 ottobre 2026** proponendola al destinatario, senza pretendere
di decidere al suo posto.

### 2.4 Il criterio 16, e i due `[NV]` che oggi lo violano

Il criterio 16 chiede che **nessun `[NV]` sia aperto su un componente rilasciato**. Due `[NV]`
oggi in essere ricadono su `RU-1` e vanno chiusi prima del rilascio, non scoperti durante:

1. **Il nome della distribuzione.** In testa a `docs/09_roadmap/03-primo-rilascio-utilizzabile.md`:
   «`[NV]` - la denominazione della distribuzione non è decisa». `D17` impone nomi, numeri di
   versione e cicli di vita distinti fra repository e distribuzione; `RU-1` è una designazione di
   pianificazione e **non può essere il nome dell'artefatto**. La struttura di versionamento della
   distribuzione identificata è la questione `Q-172`, che `docs/00_overview/04-stato-e-limiti.md`
   §6 dichiara da decidere **prima del primo rilascio**, perché una rinumerazione successiva è una
   discontinuità di identificazione che non si sana con una nota di rilascio. `Q-172` **non ha una
   data dichiarata in alcun documento**: questo piano la propone al committente per il **31 ottobre
   2026**, insieme a `Q-281` e `Q-185`, e la proposta è tale, non una decisione presa qui.
2. **Il numero di tenant per installazione.** `03 §9`, limite 21: «`[NV]` - non misurato. Ordine di
   grandezza dichiarato: centinaia. La misura è un'attività di rilascio, non una stima». È un `[NV]`
   su una proprietà di un componente rilasciato - la multi-tenancy - e il criterio 16 lo esclude.
   Due esiti sono ammissibili e vanno scelti prima del 21 novembre: **eseguire la misura** come
   attività di rilascio, oppure **dichiarare il destinatario** e riformulare il limite in modo che
   non sia un `[NV]` ma una proprietà non misurata dichiarata tale. Il secondo esito è quello che la
   capacità consente; il primo è quello che il testo di `03 §9` promette. La differenza va risolta,
   non arrotondata.

---

## 3. Che cosa significa «installabile»

È la parola del titolo del traguardo, ed è la parola su cui un rilascio si giudica. Definirla
significa rispondere a tre domande: **che cosa riceve chi installa**, **con quale procedura
installa**, **con quale verifica accerta che l'installazione sia riuscita**.

### 3.1 Che cosa riceve chi installa

L'elenco è quello di `docs/09_roadmap/03-primo-rilascio-utilizzabile.md` §7.3, e non è
un'appendice del rilascio: **è il rilascio**. Tredici voci, ciascuna con il proprio perimetro
dichiarato: definizioni di dispiegamento riproducibili per il **solo** profilo a tenant unico
(`TG-08`); migrazioni automatiche in finestra di manutenzione (`TG-11`); verifiche di configurazione
bloccanti all'avvio; distinta dei materiali firmata per ogni artefatto, componenti delle immagini di
base compresi; attestazioni di rilascio; **procedura eseguibile di verifica a cura di chi installa**;
procedura di copia e ripristino con il materiale di chiave; procedura di verifica dell'integrità del
registro, senza ancoraggio esterno (`TG-23`); esportazione delle metriche con i nomi delle serie
documentati; scheda dei dati per la dichiarazione dei fornitori rilevanti; politica di divulgazione
coordinata con canale funzionante e tempi dichiarati; manuale di installazione ed esercizio;
**elenco delle lacune dichiarate**.

Va detto in negativo con la stessa evidenza, perché è ciò che distingue `RU-1` da un prototipo e da
un prodotto: **chi installa non riceve un dispositivo medico**, non riceve una dichiarazione di
conformità, non riceve un'interfaccia di amministrazione (`TG-10`), non riceve cruscotti (`TG-09`),
non riceve un secondo profilo di dispiegamento (`TG-08`), non riceve un referto (`TG-01`), non
riceve una facciata di interoperabilità (`TG-02`), non riceve un componente incorporabile
(`TG-03`).

### 3.2 Con quale procedura

`RU-1` **dà per acquisiti** i quindici presupposti di installazione di `03 §7.1`. Non sono
raccomandazioni: sono la lista che determina se un'installazione è possibile, e chi non può
soddisfarli non può installare. Tre di essi hanno peso strutturale e vanno in testa al manuale
(criterio proprio A):

- l'**isolamento di rete in uscita del nodo di relay**, che è **difesa primaria** e non dipende
  dalla correttezza del codice: le liste di indirizzi vietati sono difesa in profondità (`V-10`);
- la **negazione di rotta in uscita ai componenti applicativi**, con la sola eccezione del mediatore
  (`V-157`);
- la **separazione dei privilegi fra archivio applicativo e archivio del registro**, che con `TG-23`
  cessa di essere uno strato fra quattro e diventa **lo strato che resta**.

Il terzo va scritto nel manuale con la conseguenza esplicita: in sua assenza la garanzia di non
alterabilità del registro scende a quella della sola catena applicativa, e **non c'è più uno strato
che compensi**. Chi installa deve poterlo pesare nei propri adempimenti, prima di installare.

L'installazione avviene per **configurazione dichiarativa versionata e procedure a riga di comando**
(`TG-10`), quindi **richiede accesso all'installazione e competenza tecnica**, e non è delegabile a
un amministratore non tecnico. È il taglio che pesa di più sull'esercizio quotidiano, ed è un
presupposto, non una preferenza.

### 3.3 Con quale verifica: la procedura di verifica a cura di chi installa

Esiste, ha un nome proprio nel progetto, ed è **il collegamento che questo piano deve stabilire**.

**Dove nasce.** È il criterio 8 di `T-03` (`docs/09_roadmap/02-traguardi.md` §3, 26 settembre 2026):
«Esiste la procedura documentata di verifica a cura di chi installa, con i comandi, ed è eseguibile
da chiunque». La sua fondazione tecnica è in
`docs/01_technical/09-integrazione-continua-e-rilascio.md` §7.3, che la colloca nel manuale di
installazione con i comandi, e in §9, che la elenca fra le attività dell'ambiente di collaudo.

**Che cosa contiene.** I sette passi di
`docs/09_roadmap/03-primo-rilascio-utilizzabile.md` §10: verificare firma e provenienza
dell'artefatto; confrontare la distinta dei materiali con il proprio inventario e conservarla;
ricostruire l'artefatto principale dal sorgente pubblicato e confrontare le impronte; eseguire le
verifiche di configurazione all'avvio in un ambiente pulito e osservare che il sistema **si rifiuti
di avviarsi** nelle configurazioni insicure; eseguire la procedura di ripristino su un ambiente
separato e verificare che la catena del registro risulti verificabile **dopo** il ripristino;
leggere il rapporto di tracciabilità, in particolare la vista dei requisiti senza prove; leggere
l'elenco delle lacune dichiarate.

**Perché è il cuore della definizione di «installabile».** Perché sotto `TG-20` questa procedura
acquista un peso che in un progetto ordinario non avrebbe: **è l'unica verifica indipendente che
esisterà su `RU-1`**, e la esegue chi installa. Il progetto la scrive, la pubblica ed è tenuto a
renderla eseguibile da chiunque; **non la esegue per conto di nessuno**, e che sia eseguita da chi
non l'ha scritta non è un criterio di `T-03` né di `T-10`, perché sotto `D54` non è producibile.

Ne discende la definizione che questo piano adotta, e che va scritta nel manuale con queste parole:

> **`RU-1` è installabile quando una persona che non ha partecipato alla sua costruzione può, con i
> soli artefatti pubblicati e i comandi del manuale, portare il sistema in esercizio di prova e
> accertare da sé che ciò che ha ricevuto è ciò che è dichiarato - compreso ciò che manca.**

Il «compreso ciò che manca» non è retorica: i passi 6 e 7 della procedura sono la lettura dei
requisiti senza prove e delle lacune dichiarate, ed è l'informazione che nessun'altra parte del
fascicolo contiene.

---

## 4. Il fascicolo del rilascio

### 4.1 Che cosa accompagna l'artefatto

Sette elementi, dal criterio 2 di `T-10` e da `03 §7.3`. Ciascuno con la prova della propria
esistenza, perché un fascicolo elencato e non prodotto è la forma di debito regolatorio più costosa.

| Elemento | Contenuto | Prova di esistenza |
|---|---|---|
| **Note di rilascio** | Struttura fissa di `01_technical/09` §10.2: modifiche a impatto clinico o di sicurezza **in testa** e con evidenza; correzioni di vulnerabilità con gravità e componente; modifiche al perimetro contrattuale con la versione; azioni richieste a chi installa; limiti noti; componenti di terze parti aggiornati | Artefatto firmato e pubblicato; verifica testuale sull'ordine delle sezioni |
| **Distinta dei materiali firmata** | Per **ogni** artefatto, componenti delle immagini di base compresi; identificativo, versione esatta, licenza, impronta, relazione di dipendenza | Generata a ogni costruzione; criterio bloccante 7 |
| **Attestazioni di provenienza** | Sorgente, revisione, definizione di pipeline, esecutore, ingressi; più esito delle prove, tracciabilità, riproducibilità dell'artefatto principale, conformità del profilo di produzione | Attestazioni prodotte dalla fascia di rilascio; firma con materiale che non risiede nella pipeline (`T-03` cr. 7) |
| **Rapporto di tracciabilità** | Requisito → prove; requisiti scoperti; controlli di rischio → prove | Criterio bloccante 14. La vista «requisiti senza prove» **non sarà vuota**, e ogni riga porta la motivazione |
| **Elenco dei limiti dichiarati** | Le ventiquattro voci di `03 §9`, ciascuna con la natura: perimetro, taglio reversibile, taglio irreversibile, dipendenza esterna, proprietà inesistente nella tecnologia | Verifica testuale di corrispondenza uno a uno con `03 §9` |
| **Elenco delle lacune dichiarate, con la data in cui ciascuna è nata** | Vedi §4.2. I quattro tagli irreversibili in testa | Criterio bloccante 17, in **entrambe le lingue** |
| **Manuale di installazione ed esercizio** | In italiano, presupposti in testa; avvertenze e limiti d'uso in entrambe le lingue | Criterio proprio A |

A questi si aggiunge, e non è facoltativo, il **materiale che il rilascio deve dichiarare** secondo
i documenti alla radice del repository: la dichiarazione di non essere un dispositivo medico
(`NOT-A-MEDICAL-DEVICE.md`) e la politica di distribuzione (`DISTRIBUTION-POLICY.md`), richiamate
con **URL assoluti verso GitHub** e non con percorsi relativi. Il fascicolo ripete, e non rinvia
soltanto, le quattro affermazioni che quei documenti rendono non fraintendibili: l'intenzione di
certificare **non trasferisce nulla** a chi installa oggi; **nessuna data**; ciò che un giorno potrà
essere certificato è una **distribuzione identificata e non il repository**; **ricompilare i
sorgenti non riproduce il dispositivo**, e chi costruisce per proprio conto è fabbricante del
proprio artefatto.

### 4.2 Le lacune da dichiarare, con la data in cui ciascuna è nata

Il progetto **dichiara le lacune invece di ometterle**, e la loro assenza dal fascicolo sarebbe
peggiore della lacuna stessa. L'elenco è chiuso e ordinato: **prima i quattro tagli irreversibili**,
poi le lacune di processo, poi le riduzioni di perimetro di verifica.

**I quattro tagli irreversibili, in testa.**

| Lacuna | Data di nascita | Perché non si recupera |
|---|---|---|
| `TG-20` - **riesame del rilascio, audit interno, verifica di configurazione eseguita da chi non ha scritto il codice** | Nasce con `D54`, **25 agosto 2026**; si consolida su `RU-1` con il superamento del punto di decisione di `Q-189` al **30 settembre 2026** in assenza di decisione | Una registrazione di riesame di un rilascio **già avvenuto** non è un riesame: è una ricostruzione a posteriori, e chi verifica la riconosce come tale. Lo stesso vale per un audit su un periodo concluso. Ciò che si può fare dopo è riesaminare il rilascio **successivo** |
| `TG-21` - **revisione esterna indipendente del codice di sicurezza critico** (`D18`) | Nasce con `D54`, **25 agosto 2026**; si riferisce al periodo di `RU-1` | **Recuperabile come attività, irrecuperabile come stato del rilascio.** Il codice non scade; il periodo in cui l'artefatto è stato distribuito senza revisione non si annulla, e `D18` prescrive di eseguirla **prima** |
| `TG-22` - **valutazione formativa di usabilità durante lo sviluppo** | Nasce con `D54`, **25 agosto 2026**, e matura ogni giorno in cui una decisione di interfaccia viene presa | La valutazione formativa è **contemporanea per definizione** alle decisioni di progettazione che valuta. Eseguirla dopo è una sommativa su un'interfaccia già decisa, e serve a un'altra cosa |
| `TG-23` - **ancoraggio periodico firmato della catena del registro immutabile** | Nasce con la prima scrittura del registro in `T-08`, quindi **non prima del 3 ottobre 2026** e non oltre il 14 novembre 2026; la data esatta è quella della prima scrittura ed è registrabile | L'ancoraggio si attiva in qualunque momento futuro, ma **le registrazioni scritte prima non acquistano un ancoraggio retroattivo**. Per il periodo di `RU-1` la garanzia resta quella della catena applicativa e della separazione dei privilegi, e **non è dimostrabile verso un terzo che non si fidi dell'operatore del sistema** |

**Le lacune di processo, che discendono da `Q-189` e vanno dichiarate con la stessa evidenza.**

La prima voce di `Q-189` è nominata nel criterio 2 di `T-01` e va ripetuta nel fascicolo:
**sotto `D54` redattore e approvatore coincidono**, e questa è una **lacuna dichiarata e non una
conformità**. Va detta con la sua conseguenza operativa, che il registro delle revisioni di
`docs/09_roadmap/00-indice.md` §8.4 documenta: la protezione del ramo principale è stata configurata
nella forma in cui il proprietario del repository può approvare e unire le proprie modifiche
(`Q-283`, risolta il 26 agosto 2026); la firma crittografica dei commit è adottata localmente ma la
firma obbligatoria sul ramo resta in sospeso (`Q-284`, aperta). Ne discende, alla lettera, che **la
registrazione di approvazione non ha la forma che la procedura di controllo dei documenti descrive**,
e va letta per ciò che è: la traccia di che cosa è stato fatto, non la prova che non si potesse fare
altrimenti.

Alla stessa famiglia appartiene `TG-18`: la **riemissione sotto controllo dei documenti prodotti
prima di `T-01`** non è eseguibile entro il 30 novembre 2026 ed è dichiarata come lacuna. È l'unico
taglio reversibile il cui costo **cresce ogni giorno**, e il fascicolo lo scrive perché è
l'informazione che un lettore ricostruirebbe solo confrontando le date.

**Le registrazioni datate non ricostruibili a posteriori.** La forma con cui la loro assenza va
dichiarata è la questione `Q-282` verso `COMP`, il cui punto di decisione è «prima di `T-10`». La
regola che questo piano applica in attesa, e che è già il criterio bloccante 17, è la seguente:
ogni lacuna porta **che cosa manca, a quale periodo si riferisce, perché non è producibile, e che
cosa il progetto ha fatto comunque** - con l'avvertenza esplicita che ciò che il progetto ha fatto
comunque **non sostituisce** ciò che manca, e che presentarlo come sostituto sarebbe una
registrazione formalmente presente e sostanzialmente vuota, peggiore dell'assenza perché falsamente
rassicurante.

**Le riduzioni del perimetro di verifica**, che sono lacune di dimostrazione e non di funzione:
`TG-14`, riproducibilità verificata sul solo artefatto principale; `TG-12`, degrado provato agli
estremi e non lungo la scala; `TG-13`, latenza misurata in sessione ma senza prova automatica di
regressione; `TG-05`, funzionamento senza terminologie a licenza vincolata **soddisfatto in forma
degenere**, perché nel perimetro ridotto non esiste contenuto codificato da risolvere - e il
fascicolo lo dichiara invece di contarlo come verifica; `TG-07`, i sei canali di inferenza
dell'oscuramento non esercitati, la cui chiusura resta proprietà di progettazione non provata.

### 4.3 Le due affermazioni che convivono, e che vanno entrambe scritte

Sono la formulazione esatta di `01 §12.1`, e il fascicolo le riporta accostate perché separate si
prestano entrambe a essere lette male:

> **Tutti i criteri di `RU-1` sono verificabili da chiunque**, con la procedura descritta.
> **Nessuna verifica è stata eseguita da un secondo soggetto.**

Sono compatibili, entrambe vere, ed entrambe necessarie. La prima senza la seconda è una
rassicurazione; la seconda senza la prima è una resa.

---

## 5. La differenza fra ciò che il materiale pubblico dichiara e ciò che `RU-1` consegna

### 5.1 Come è formulata la questione

`Q-281`, verificata nella bacheca inter-agenti e in `docs/09_roadmap/05-rischi-e-dipendenze.md`
§5, è formulata così: sotto `D53` e `D54` il primo rilascio esce con un perimetro ridotto e
dichiarato; **alla pubblicazione del rilascio la distanza fra il materiale pubblico e l'artefatto
diventa verificabile da chiunque**, e la destinazione d'uso di un dispositivo è determinata **anche
dal materiale promozionale**. Serve la **formulazione approvata** che dichiara la differenza, «con
la stessa evidenza dell'elenco delle funzioni». Vale in particolare per le capacità tagliate con
`TG-01`, `TG-02` e `TG-03`. Punto di decisione: **31 ottobre 2026**. Titolari: `PROD` e committente.
Rischio associato: `R-19`, impatto `I5`, «un periodo di pubblicazione non si annulla».

La conseguenza dichiarata in `docs/09_roadmap/02-traguardi.md` §6 in caso di mancata decisione è
netta: «`RU-1` viene pubblicato mentre il materiale pubblico dichiara capacità che il rilascio non
contiene: è la stessa aggravante di `Q-185`, su un artefatto in più».

### 5.2 Come si misura, e la misura è un artefatto

La differenza **non si valuta a giudizio**: si misura, e la misura è un artefatto versionato,
generato prima della decisione del 31 ottobre e ripubblicato con il rilascio.

**Il metodo, in tre passi.** Primo: si enumerano le **affermazioni pubbliche** - ogni voce di
`features` in `publiccode.yml` nelle due lingue, ogni funzione dichiarata nella `longDescription`,
ogni voce della destinazione d'uso di `NOT-A-MEDICAL-DEVICE.md` nelle due lingue, ogni riga della
tabella dei limiti di `docs/00_overview/04-stato-e-limiti.md` §4, il richiamo in evidenza del
documento di presentazione del repository, la pagina di atterraggio del sito. Secondo: si associa a
ciascuna affermazione **una riga del perimetro** di `03 §3` o **una riga di esclusione** di `03 §4`,
`03 §5` o `03 §9`. Terzo: si conta, e si pubblica il conteggio con l'elenco, in tre stati soltanto -
**esercitata in `RU-1`**, **esercitata in forma ridotta con la riduzione dichiarata**, **non
esercitata in `RU-1`**. Nessun quarto stato, nessun avverbio.

**La misura eseguita il 26 agosto 2026 su `publiccode.yml`**, che è il materiale pubblico più
esposto perché è metadato di catalogo e viene letto da macchine:

| Voce di `features` | Stato rispetto a `RU-1` | Riferimento |
|---|---|---|
| Televisita con referto | **Non esercitata** per la parte «con referto» | `TG-01`; `03 §9` limite 5 |
| Teleconsulto sincrono e asincrono fra professionisti | **Non esercitata** | `S-8`; `03 §4.2` |
| Teleassistenza | **Non esercitata** | `S-8`; `03 §4.2` |
| Telemonitoraggio di parametri clinici | **Non esercitata** | `S-8`; `03 §4.2`, prima posizione della coda |
| Interoperabilità FHIR R4 profilata sulle guide italiane | **Non esercitata** | `TG-02`; `03 §9` limite 6 |
| Alimentazione del Fascicolo Sanitario Elettronico | **Non esercitata** | `03 §4.3`, `Q-07`; `03 §9` limite 14 |
| Autenticazione con identità digitale nazionale | **Non esercitata** | `03 §4.3`, `D38` |
| Registro degli accessi immutabile a catena di hash | **Esercitata in forma ridotta** | Copertura integrale, **senza ancoraggio esterno**: `TG-23`; `03 §9` limite 12 |
| Integrazione per interfacce applicative, eventi e componenti incorporabili | **Esercitata in forma ridotta** | Interfaccia applicativa sì; eventi **senza broker** (`TG-04`); componente incorporabile **assente** (`TG-03`) |
| Interfaccia accessibile e progettata prima per dispositivi mobili | **Esercitata** | `03 §3.8`; criterio bloccante 9 |

**Dieci voci: una esercitata, due in forma ridotta, sette non esercitate.** Lo stesso conteggio vale
per il blocco `en`, che è la traduzione speculare. A ciò si aggiunge una **incoerenza tecnica
misurabile** e non interpretativa: `dependsOn.open` elenca Apache Kafka con `optional: false`,
mentre `TG-04` toglie il broker dal perimetro di `RU-1` e `03 §5.2` scrive che è «l'unico taglio che
alleggerisce chi installa». Un metadato di catalogo che dichiara obbligatorio un componente che il
rilascio non installa è un'affermazione falsificabile in trenta secondi da chiunque scarichi
l'artefatto.

Va misurato allo stesso modo, e in questo piano è misurato, il caso di
`docs/00_overview/04-stato-e-limiti.md` §4: il testo descrive il percorso di `RU-1` «dall'appuntamento
ricevuto per riferimento **fino al documento clinico validato e restituito** al sistema di origine»,
mentre `03 §2.1` dichiara che il percorso **si ferma prima della refertazione** e restituisce un
esito strutturato. È la stessa capacità di `TG-01`, dichiarata in una sede e negata in un'altra.

### 5.3 Che cosa **non** si fa per chiudere la differenza

Va scritto, perché è l'errore che una lettura affrettata di `Q-281` produrrebbe.

**Non si restringe la destinazione d'uso.** Le voci di `NOT-A-MEDICAL-DEVICE.md` - «produrre e
trasmettere documenti clinici firmati dal professionista», «raccogliere parametri per la revisione
differita e segnalare il superamento di soglie configurate dal professionista» - descrivono la
**destinazione d'uso del prodotto**, non il perimetro del primo rilascio. `D55` ha congelato la
destinazione d'uso e `D46` impone che ogni sua modifica comporti una rivalutazione; `Q-275` osserva
inoltre che la revisione esterna del congelamento non è stata condotta. **Modificare la destinazione
d'uso per farla combaciare con `RU-1` sarebbe il rimedio più costoso disponibile**, e produrrebbe un
danno regolatorio maggiore del problema che risolve.

La differenza si chiude quindi **aggiungendo un enunciato di perimetro di rilascio**, non
sottraendo un enunciato di destinazione d'uso. Le due grandezze restano distinte e vanno tenute
distinte anche nella forma tipografica, perché è precisamente la loro confusione che il rischio
`R-19` misura.

### 5.4 Come si comunica, e dove

Quattro sedi, e la comunicazione avviene **al momento del rilascio, non dopo**.

1. **Nel fascicolo di rilascio**, come sezione autonoma, in entrambe le lingue, con l'elenco delle
   affermazioni pubbliche non esercitate e il rinvio puntuale al taglio o all'esclusione che le
   spiega. Non è un rinvio generico a `03 §5`: è una riga per affermazione.
2. **In `publiccode.yml`**, dove le voci di `features` che il rilascio non esercita vanno rese
   coerenti con l'artefatto. Le voci di conformità restano **`false`**, tutte, e restano tali finché
   la prova corrispondente non è pubblicata **ed eseguita** nella catena di integrazione continua:
   `lineeGuidaDesign`, `modelloInteroperabilita`, `misureMinimeSicurezza`, `gdpr`, e le cinque voci
   di `piattaforme`. Il rilascio non ne alza nessuna. La coerenza di `dependsOn` con il perimetro
   effettivo è parte della stessa verifica.
3. **Nel materiale pubblico di panoramica**, dove `04-stato-e-limiti.md` §4 descrive un percorso che
   arriva al documento clinico. La correzione è di competenza di `PROD` e si salda con `Q-185`, il
   cui punto di decisione è lo stesso 31 ottobre 2026.
4. **Nelle note di rilascio**, fra le «azioni richieste a chi installa», con una riga che dice
   dove leggere la differenza. Chi installa non deve dedurla: deve trovarla.

### 5.5 Il presidio automatico, perché una verifica a vista si dimentica

La misura del §5.2 va resa **generata e non compilata a mano**, con la stessa ragione per cui la
distinta dei materiali si genera: un inventario scritto a mano mente entro tre mesi, e questo ne è
già la dimostrazione. Il presidio proposto è un controllo di pipeline che, per ogni voce di
`features` di `publiccode.yml` e per ogni riga della tabella dei limiti della panoramica, esiga una
riga corrispondente nella mappa di perimetro versionata, e **faccia fallire la costruzione** quando
una voce pubblica non ha corrispondenza. Il controllo entra fra quelli **in sola segnalazione** con
la data dichiarata in cui diventa bloccante, secondo il criterio 4 di `T-03`, perché un controllo
senza quella data è una riduzione temporanea che diventa permanente.

Va detto senza attenuazioni che questo controllo **non esisteva** al 26 agosto 2026 e che la sua
costruzione compete per le stesse ore di `T-08`. Se non entra, la misura resta manuale e va
rieseguita a mano prima della pubblicazione: è meno buono, è dichiarato, ed è comunque preferibile
a scoprire la differenza dopo.

---

## 6. La sequenza di rilascio, e i punti oltre i quali non si torna indietro

### 6.1 La sequenza

La procedura di base è quella di `docs/01_technical/09-integrazione-continua-e-rilascio.md` §10.1,
con la variante che `D54` impone e che va dichiarata invece che eseguita in silenzio (vedi §11,
prima contraddizione).

| Passo | Che cosa accade | Data allocata | Reversibile? |
|:-:|---|---|---|
| 1 | **Gate di innesco**: `T-08` e `T-06` chiusi, con tutti i criteri soddisfatti in forma binaria. Se uno non lo è, non si entra in fascia di rilascio | 21 novembre 2026 | Sì |
| 2 | **Congelamento della revisione** e apertura del ramo di rilascio | 22 novembre 2026 | Sì: un ramo si chiude |
| 3 | **Esecuzione completa della fascia di rilascio** sulla revisione congelata: costruzione riproducibile, distinta, firma, attestazioni, rapporto di tracciabilità | 22–25 novembre 2026 | Sì |
| 4 | **Riesame documentale**, eseguito dall'autore e **dichiarato tale**: note di rilascio, elenco delle modifiche a impatto clinico o di sicurezza, aggiornamento del registro dei componenti, verifica che la dichiarazione di non marcatura sia presente | 26 novembre 2026 | Sì |
| 5 | **Verifica dei diciotto criteri bloccanti più i tre propri**, uno per uno, in forma binaria, con l'esito registrato per ciascuno | 26–27 novembre 2026 | Sì. **È l'ultimo passo reversibile** |
| 6 | **Decisione di pubblicare o non pubblicare.** Se un solo criterio non è soddisfatto, non si pubblica | 27 novembre 2026 | Sì, ed è la decisione stessa |
| 7 | **Firma degli artefatti** con materiale che non risiede nella pipeline, e marcatura della revisione | 28 novembre 2026 | **No, in parte**: una firma si revoca, ma la revoca è essa stessa un evento pubblico |
| 8 | **Pubblicazione** degli artefatti, del fascicolo, del manuale e della misura di `Q-281` | 30 novembre 2026 | **No** |
| 9 | **Registrazione dell'esito** nel registro delle revisioni della roadmap, con la data e con le righe dell'ordine di sacrificio consumate | 30 novembre 2026 | Sì |

### 6.2 I punti di non ritorno, e perché ciascuno lo è

Un rilascio pubblico è irreversibile: quel che è stato distribuito è stato distribuito. Cinque punti
meritano di essere nominati, perché quattro di essi si superano **prima** del passo 8 e chi li
supera tende a non accorgersene.

**Primo - il nome e lo schema di versione della distribuzione (passo 7, effetto permanente).** Una
volta pubblicato, l'identificativo della distribuzione non si rinumera: una rinumerazione successiva
è una **discontinuità di identificazione**, e in un dispositivo registrato non si sana con una nota
di rilascio (`Q-172`). Va deciso prima, ed è la ragione per cui il §2.4 lo colloca al 31 ottobre.

**Secondo - la dichiarazione del periodo di supporto (passo 8).** Dichiarare un periodo di supporto
apre un obbligo di aggiornamento per la sua durata, con livello di servizio espresso in **giorni
dalla pubblicazione dell'avviso, per gravità** (`V-185`), su una capacità che è una persona a tempo
parziale (`R-12`). Il periodo si può prorogare, **non accorciare**: accorciarlo dopo averlo
dichiarato è una modifica peggiorativa unilaterale su chi ha già installato.

**Terzo - qualunque contenuto pubblicato una volta (passo 8).** Vale in particolare per il contenuto
terminologico a licenza vincolata (`R-09`, impatto `I5`): un contenuto pubblicato **non si ritira**,
si rimuove dal ramo corrente ma non dalla cronologia né dalle copie altrui. Vale identicamente per un
segreto: la rilevazione non basta, serve la **rotazione**, ed è procedura documentata e non decisione
del momento. Nel repository non compare alcun segreto: solo segnaposto `${VARIABILE_AMBIENTE}`.

**Quarto - la differenza di `Q-281` (passo 8, e a ritroso).** Alla pubblicazione la distanza fra
materiale pubblico e artefatto diventa verificabile da chiunque. Il punto di non ritorno non è la
pubblicazione dell'artefatto: è il **31 ottobre**, oltre il quale la formulazione non decisa produce
comunque un effetto, perché `RU-1` esce con il materiale pubblico non allineato.

**Quinto - le lacune datate (passo 8, e per sempre).** La pubblicazione fissa la data del periodo di
`RU-1`. Da quel momento le quattro lacune irreversibili sono **datate a quel periodo** e non si
colmano più: ciò che si acquisisce dopo vale dai rilasci successivi in avanti (`OL-22`). È la
proprietà per cui `R-29` ha impatto `I5` ed è l'unica voce del registro che **peggiora da sola**,
perché ogni rilascio prodotto nelle stesse condizioni aggiunge una riga all'elenco invece di
lasciarlo costante.

### 6.3 La regola che governa la decisione del passo 6

> **Non si pubblica un artefatto che si chiami «primo rilascio installabile» e non soddisfi i
> diciotto criteri.** Pubblicare qualcosa di più povero con lo stesso nome è l'esito esplicitamente
> peggiore fra i due che `R-28` descrive, perché la scelta di che cosa è stato sacrificato **smette
> di essere leggibile** - che è precisamente ciò che `D53` obbliga a garantire.

---

## 7. L'ordine di sacrificio, applicato

`S-1`…`S-8` sono tagli **già decisi**: sono l'ordine dichiarato in anticipo in
`docs/09_roadmap/03-primo-rilascio-utilizzabile.md` §6.2, e la loro esecuzione non richiede una
nuova decisione - richiede un **segnale** e una **registrazione**. Un taglio eseguito troppo tardi
non compra nulla: se si esegue nella settimana in cui il lavoro che avrebbe evitato è già stato
fatto, si è pagato il lavoro e si è perso il perimetro.

### 7.1 Le tre regole, richiamate perché vincolano questo paragrafo

L'ordine si esegue **dall'alto, per intero**, e ogni esecuzione è **registrata** nel registro delle
revisioni con la data e la causa. Nell'ordine entrano **soltanto tagli reversibili**. I criteri di
rilascio bloccanti e l'elenco di `03 §5.4` **non vi entrano mai**: se l'ambito non è più riducibile
senza toccarli, **la data si dichiara mancata**.

### 7.2 Lo stato dell'ordine al 26 agosto 2026

`S-8` è **già eseguito**, con la procedura ordinaria e prima che la pressione di calendario
arrivasse, come il registro delle revisioni documenta. Restano disponibili **sette righe**:
`S-1`…`S-7`.

Va dichiarata una tensione, invece di essere smussata. La regola «si esegue dall'alto» convive ora
con un ordine la cui **ultima riga è consumata e le sette superiori no**. La ragione è legittima e
scritta - `S-8` non è stato eseguito come assorbimento di uno scostamento, ma **deciso** con la
procedura ordinaria proprio per non doverlo decidere sotto pressione - ma la conseguenza va
registrata: chi conta le righe residue per l'indicatore anticipatore di `R-28` deve contare **sette**
e non otto, e deve sapere che la settima riga disponibile è `S-7` e non `S-8`.

### 7.3 L'ordine, con il segnale di esecuzione e il criterio su cui morde

Il segnale è un **fatto osservabile in revisione**, non una sensazione di ritardo. La revisione è
mensile fino al 19 ottobre 2026 e **settimanale da quella data**, con il solo contenuto delle righe
residue e dei criteri bloccanti soddisfatti.

| # | Taglio | Segnale di esecuzione | Su che cosa morde | Che cosa resta |
|:-:|---|---|---|---|
| `S-1` | Esportazione delle metriche in formato aperto | Alla revisione del **19 ottobre 2026**, `T-08` non ha almeno i criteri 1, 2 e 3 chiusi - struttura dei moduli, contesto di tenant, prove di isolamento. Sono i tre che stanno a monte di tutto il resto: se non sono chiusi, il residuo non è comprimibile con il lavoro | Nessun criterio bloccante. Morde su `03 §3.9` e sul presupposto di installazione «costruzione dei propri cruscotti» | La misura resta interna e storicizzata: il dato è disponibile in seguito. **La capacità di misura non è tagliata** - `Q-184` la vuole come requisito del primo rilascio e resta tale: si taglia l'esportazione, non la misura |
| `S-2` | Attestazione strutturata della qualità del collegamento nell'esito restituito | Alla revisione settimanale del **26 ottobre 2026**, il criterio 4 di `T-08` - il registro immutabile - non ha una prima scrittura funzionante | Nessun criterio bloccante. Morde su `03 §3.6` | L'attestazione resta **misurata e registrata**; l'**avviso di qualità inadeguata al professionista resta intero**, perché è controllo di rischio e sta in `03 §5.4` |
| `S-3` | Sala d'attesa e ammissione come stati distinti | Alla revisione settimanale del **2 novembre 2026**, il criterio 6 di `T-08` - il percorso verticale - non attraversa ancora l'intera macchina a stati | Nessun criterio bloccante. Morde su `03 §3.4` | La **verifica tecnica preventiva resta**: è ciò che protegge l'assistito da una sessione che non funzionerà |
| `S-4` | Elenco delle prestazioni del giorno nell'interfaccia del professionista | Stesso segnale di `S-3`, se `S-3` da solo non è sufficiente. Si esegue nella stessa revisione, non nella successiva | Morde sul criterio bloccante **9**, riducendo il numero di schermate su cui l'accessibilità va verificata. Il criterio resta intero: si riduce la superficie, non la soglia | Si entra in sessione dal rinvio dell'integratore, che è il caso d'uso di riferimento |
| `S-5` | Ripiego telefonico come esito tipizzato | Alla revisione settimanale del **9 novembre 2026**, il criterio 6 di `T-08` non è chiuso | Morde sul criterio bloccante **14**: una riga in meno nella matrice di tracciabilità, con la lacuna dichiarata e motivata | Resta registrabile come esito generico con nota: si perde la tipizzazione, **non la tracciabilità** |
| `S-6` | Firma asimmetrica degli eventi in uscita con identificativo di chiave risolvibile | Alla revisione settimanale del **9 novembre 2026**, l'outbox non consegna verso un consumatore esterno | Morde su `03 §3.7`. **Non morde su alcun criterio bloccante**, ed è la ragione per cui è eseguibile tardi | **Non è ammesso il segreto condiviso come sostituto** (`V-162`, confermato da `D60`): o la firma asimmetrica, o **l'evento non esce verso terzi** e resta il recupero per chiamata autenticata. Il taglio è quindi sulla capacità, non sul presidio |
| `S-7` | Conteggio esatto delle parole del corpus (`T-02` criterio 5) | **Nessun segnale residuo: la riga è già inesigibile.** Il conteggio è stato eseguito il 26 agosto 2026 - 875.748 parole - e ha chiuso il criterio 5 di `T-02` e l'`[NV]` sul volume | Nessuno | La riga resta nell'ordine come voce storica e **non è più disponibile come margine**. L'ordine effettivamente residuo al 26 agosto 2026 è quindi di **sei righe**, non di sette, e questa è la seconda correzione che l'indicatore di `R-28` deve recepire |
| `S-8` | Teleconsulto e telemonitoraggio dal percorso verticale dimostrabile | **Eseguito il 26 agosto 2026**, con la procedura ordinaria | Ha morso sul criterio 6 di `T-08`, portandolo da «percorso verticale completo» a «completo per una sola prestazione». **Non ha toccato il criterio 4**, il registro immutabile, la cui copertura non è riducibile | Teleconsulto e telemonitoraggio restano **integralmente progettati** in dominio, requisiti, regole di business e scenari di prova. Due percorsi verticali restano da costruire in rilasci successivi |

### 7.4 La conclusione che questa tabella impone

Il margine disponibile è **sei righe**, non otto e non sette. Nessuna di esse morde sui due criteri
che l'aritmetica dichiara insufficienti - il criterio 4 e il criterio 6 di `T-08` - perché entrambi
sono protetti: la copertura del registro non è riducibile e il percorso verticale **è** il rilascio.
**Eseguire l'ordine per intero compra poco contro il vincolo reale**, e il registro delle revisioni
lo scriveva già il 26 agosto 2026. È esattamente la ragione per cui il §8 esiste e non è
un'appendice.

---

## 8. Il piano di risalita se la data non tiene

Non è un'attenuazione, ed è la sezione che va letta per intera prima del 19 ottobre, non dopo. Le
opzioni sono poche e vanno nominate.

### 8.1 Il gate del 19 ottobre 2026

Il registro delle revisioni fissa la soglia: **se nella settimana del 19 ottobre 2026 uno qualunque
dei nove traguardi di classe `A`, `B` e `C` non è chiuso, la data diviene intenibile senza ulteriori
riduzioni reversibili.** I traguardi da controllare in quella revisione sono `T-01` (12 settembre),
`T-14` (19 settembre), `T-03` (26 settembre), `T-04` (3 ottobre), `T-05` (3 ottobre), e per la parte
già scaduta `T-07` (26 settembre) e `T-02` (10 ottobre). Il controllo è **binario per ciascun
criterio**: un traguardo con dieci criteri e nove soddisfatti è un traguardo non raggiunto, e il
rapporto dice quale criterio manca.

### 8.2 Le quattro opzioni, e nessuna quinta

**Prima - eseguire l'ordine di sacrificio per intero.** Sei righe residue, secondo il §7. Si esegue
dall'alto, si registra ciascuna con data e causa, e si accetta il perimetro che ne risulta. È
l'opzione già pianificata, è quella che il piano esegue per prima, e **non basta**: il §7.4 dice
perché.

**Seconda - chiedere al committente un ulteriore taglio reversibile, con la procedura ordinaria, e
farlo prima che serva.** È il precedente di `S-8`, ed è l'opzione con la finestra più stretta,
perché ha una proprietà che la rende facile da perdere: la regola 2 di `03 §6.1` e la logica con cui
`S-8` è stato deciso impongono che un taglio **non si decida sotto pressione di calendario**. Ne
discende che **la finestra per decidere un ulteriore taglio si chiude prima del 19 ottobre, non
dopo**: quando il segnale arriva, la decisione doveva già essere stata presa. Questo piano pone
quindi la domanda al committente entro il **12 ottobre 2026** e la formula così: *esiste un ulteriore
taglio reversibile che il committente è disposto ad autorizzare, e quale.* Il piano **non propone la
voce**, perché proporla equivarrebbe a deciderla, e perché la superficie reversibile residua è
sottile: `03 §5.4` protegge otto famiglie e i diciotto criteri bloccanti, e ciò che resta fuori da
entrambi è poco. Se la risposta è «nessuno», l'opzione decade e restano la terza e la quarta.

**Terza - variare la capacità dichiarata.** È decisione del committente e ha un innesco di revisione
fuori cadenza proprio (`00 §8.2`: variazione della capacità, e ingresso di un contributore
continuativo). Va detto con precisione che cosa comprerebbe e che cosa no. **Comprerebbe** la
risoluzione parziale di `R-02` - continuità - e, se il secondo contributore fosse continuativo,
**la condizione perché alcune registrazioni a ruoli distinti tornino producibili**, che è il solo
modo di ridurre `R-29` invece di dichiararlo. **Non comprerebbe** ore utili in novembre: un
contributore che entra a ottobre su un progetto con ottocentosettantacinquemila parole di corpus e
nessuna riga di codice consuma capacità prima di produrne, e la guida dei fondamenti esiste appunto
perché quel consumo sia finito e non infinito - ma finito non significa nullo. La quantificazione
è `[NV]`: il progetto non ha cronologia di consegna su cui calibrarla e **non la inventa**.

**Quarta - dichiarare la data mancata.** È l'esito dichiarato e previsto, ed è **preferibile** al
rilascio più povero pubblicato con lo stesso nome (`R-28`, forma 1 contro forma 2). Non è un
fallimento del metodo: è il metodo che funziona. Ha però una forma precisa, e senza quella forma
diventa uno slittamento silenzioso, che è ciò che `00 §8.3` vieta.

### 8.3 Che cosa significa, concretamente, dichiarare la data mancata

Cinque atti, tutti databili, nessuno rinviabile.

1. **Una revisione fuori cadenza registrata**, con l'innesco («superamento di un punto di decisione
   irreversibile senza decisione», oppure «un rischio del registro che si materializza»), la **causa**
   e non solo la conseguenza, e l'elenco dei criteri non soddisfatti.
2. **La causa scritta senza attenuanti**, ed è già nota: l'ambito non è stato ridotto in misura
   corrispondente alla capacità che `D53` e `D54` avevano già fissato. Non è una stima sbagliata -
   non ci sono stime.
3. **Nessun artefatto pubblicato il 30 novembre 2026 che si presenti come primo rilascio
   installabile.** Ciò che si può pubblicare è la registrazione dello stato al 30 novembre, con i
   criteri soddisfatti e quelli mancanti, in forma binaria. Non è un rilascio e non ne porta il nome.
4. **La data mancata resta nella cronologia con la sua causa.** Non si riscrive la storia: è l'unica
   base su cui l'allocazione successiva può essere migliore della precedente.
5. **Una nuova data si pone soltanto con un criterio nuovo o una causa nuova**, mai spostando la
   vecchia. Chi la pone è il committente, perché la data del 30 novembre è sua (`D53`).

Va aggiunto ciò che **non cambia** nemmeno in questo scenario, perché è la parte del piano che non
si negozia: `T-01`, `T-03`, `T-04` e `T-14` si fanno comunque - le prime tre perché il costo di
ometterle non è un ritardo ma un'impossibilità, la quarta perché il suo tempo di attraversamento non
dipende da noi. Una data di rilascio mancata **non sospende** le attività di classe `A` e `B`: le
rende più urgenti.

---

## 9. I rischi propri di `T-10`, con la contromisura

I rischi di programma sono nel registro di `docs/09_roadmap/05-rischi-e-dipendenze.md` e questo piano
non li riscrive. Elenca i cinque che si materializzano **dentro** la finestra di rilascio, con la
contromisura e con l'indicatore che li anticipa.

| Rischio | Come si manifesta in `T-10` | Contromisura, e quando si applica |
|---|---|---|
| `R-28` - data ravvicinata con capacità dichiarata bassa | La finestra 21–30 novembre è di tredici-ventisei ore e deve contenere la riesecuzione di ventuno criteri | La regola del §1.2: nessun criterio bloccante si soddisfa per la prima volta nella finestra. **Indicatore**: al 14 novembre, il numero di criteri bloccanti con almeno un'esecuzione registrata. Se è inferiore a diciotto, la finestra non basta |
| `R-29` - registrazioni a ruoli distinti non producibili | Il passo 4 della sequenza - riesame documentale - e il passo 6 - decisione di pubblicare - sono eseguiti dalla stessa persona che ha prodotto ciò che riesamina | Non si aggira: si **dichiara**, ed è il criterio bloccante 17 e il criterio proprio C. La contromisura non è una verifica sostitutiva: è che la procedura di verifica a cura di chi installa sia pubblicata **perché sia eseguita davvero** |
| `R-19` - materiale pubblico non allineato | `RU-1` esce mentre `publiccode.yml`, la panoramica e il sito dichiarano capacità che il rilascio non contiene | La misura del §5.2, generata e pubblicata; la decisione di `Q-281` al 31 ottobre. **Indicatore**: la misura non eseguita al 17 ottobre |
| `R-20` - il registro immutabile è più costoso di quanto una pianificazione ingenua assuma | Il criterio bloccante 3 dipende dal criterio 4 di `T-08`, che il progetto stesso classifica «mesi» | Nessuna contromisura di pianificazione: la copertura non è tagliabile e lo strato tagliabile è già stato tagliato (`TG-23`). Resta il §8 |
| `R-27` - la costruzione riproducibile non si ottiene | Il criterio bloccante 6 fallisce al primo confronto di impronte, e la prima misura tipicamente fallisce | Eseguire il confronto **una prima volta prima del 14 novembre**, su un artefatto qualunque, per scoprire le sorgenti di non determinismo quando c'è ancora tempo. **Indicatore**: il primo confronto non eseguito perché «tanto è uguale» |

A questi si aggiunge un rischio che il registro non contiene perché è specifico di questa finestra e
non del programma: **il rischio di pubblicare in fretta il passo 4**. `01_technical/09` §10.1 lo
dice già - «il passo 4 è quello che si salta quando si va di fretta, ed è quello che rende il
rilascio tracciabile» - e sotto `D54` la fretta e l'auto-revisione si sommano. La contromisura è che
il passo 4 abbia una data propria nella sequenza del §6.1 e non sia una coda del passo 3.

---

## 10. Che cosa `T-10` non comprende

L'elenco è parte del traguardo, non un'appendice.

**Non comprende alcuna marcatura CE, alcuna dichiarazione di conformità, alcuna valutazione di un
organismo notificato.** Il progetto non appone marcatura CE. `RU-1` si costruisce e si pubblica
indipendentemente dall'esistenza del soggetto fabbricante, perché `RU-1` **non è marcato e non lo
dichiara**.

**Non comprende la costituzione del soggetto fabbricante** (`T-14`, criterio 1, e `Q-280`), né la
nomina della persona responsabile del rispetto della normativa, né la firma di alcun contratto, né
la sottomissione di alcun fascicolo.

**Non comprende il riesame del rilascio, l'audit interno, la verifica di configurazione eseguita da
un secondo soggetto, la revisione esterna del codice di sicurezza critico** (`TG-20`, `TG-21`). Non
entrano nel piano come attività, per `V-281`: entrano come lacune dichiarate con la data in cui
nascono.

**Non comprende l'esecuzione della procedura di verifica a cura di chi installa.** Il progetto la
scrive, la pubblica e la rende eseguibile da chiunque; l'esecuzione è di chi installa, e in `RU-1` è
l'unica verifica indipendente che esisterà.

**Non comprende alcuna valutazione di usabilità**, né formativa (`TG-22`, irreversibile) né
sommativa (`T-11`). La verifica manuale con tecnologia assistiva reale del criterio bloccante 9
**non è una valutazione formativa e non va presentata come tale**.

**Non comprende la traduzione integrale del corpus** (`T-09`), né il manuale di installazione in
inglese (`TG-19`). Restano in entrambe le lingue le avvertenze, i limiti d'uso e il fascicolo delle
lacune, che sono la parte il cui fraintendimento produce danno.

**Non comprende il pacchetto regolatorio consegnabile** (`T-12`), né la matrice dei requisiti
generali, né il file di rischio con i criteri di accettabilità, né il piano e il rapporto di
valutazione clinica, né il piano di sorveglianza post-commercializzazione.

**Non comprende alcuna installazione presso terzi**, né assistenza a un'installazione, né una
configurazione idonea alla produzione clinica: le definizioni di dispiegamento pubblicate sono
strumenti per provare e sviluppare, come `DISTRIBUTION-POLICY.md` §1 dichiara.

**Non comprende alcun uso su pazienti reali.** `D16` lo esclude per ogni artefatto distribuito, e
nessuna configurazione lo rimuove. Gli impieghi legittimi sono quattro e sono in `03 §1.2`:
integrazione e sviluppo presso un integratore, formazione con dati sintetici, valutazione tecnica e
di conformità, base del fascicolo tecnico.

**Non comprende le capacità che il perimetro esclude per ragioni indipendenti dalla data**:
refertazione, facciata di interoperabilità, componente incorporabile, broker, gateway terminologico
attivo, accesso d'emergenza, oscuramento applicato dal motore, profilo su orchestratore, cruscotti,
interfaccia di amministrazione, conferimento alle infrastrutture documentali nazionali, conformità
verificata sull'identità digitale nazionale, teleconsulto, teleassistenza, telemonitoraggio.

---

## 11. Le contraddizioni fra documenti trovate, e non corrette

Sono registrate qui e **non sanate**: la correzione appartiene ai titolari delle aree, e questo
piano non modifica `docs/`, `website/` né `scripts/`.

**Prima - la procedura di rilascio prescrive due atti che la roadmap dichiara non producibili.**
`docs/01_technical/09-integrazione-continua-e-rilascio.md` §10.1 elenca al passo 4 un «riesame
documentale» e al passo 6 la «registrazione dell'approvazione con responsabile e data». Sotto `D54`
questi sono esattamente `TG-20`, dichiarato taglio irreversibile. La procedura tecnica e la roadmap
dicono cose diverse sullo stesso atto. La variante applicata in questo piano - riesame eseguito
dall'autore e **dichiarato tale** - è quella che il criterio bloccante 17 rende obbligatoria, ma non
è scritta nella procedura tecnica, e una procedura che prescrive ciò che non si può fare produce o
una violazione o una finzione.

**Seconda - la stessa area prescrive la revisione esterna indipendente come proprietà in essere.**
`01_technical/09` §12 scrive che «il codice di sicurezza critico ha in più una revisione esterna
indipendente (D18)». In `RU-1` non l'ha (`TG-21`), e il limite dichiarato 24 di `03 §9` lo scrive.

**Terza - la tabella degli ambienti prevede dati reali in esercizio.** `01_technical/09` §9 assegna
all'ambiente di esercizio dati «Reali». Per `RU-1` è escluso da `D16`, e la riga andrebbe letta come
riferita a uno stato futuro del prodotto, non a questo rilascio. Non è dichiarato nel testo.

**Quarta - il controllo di divergenza linguistica è descritto in due modi.** `01_technical/09` §3
elenca `G8` fra i controlli obbligatori che **bloccano** su «documento italiano modificato senza il
corrispondente inglese», mentre il criterio 3 di `T-03` prescrive un comportamento **differenziato**
per effetto di `D56`: blocca sulle aree prerequisito, segnala sul resto. Analogamente `G9` è
motivato con `D52`, che `D56` ha emendato.

**Quinta - il percorso di `RU-1` è descritto in due modi.** `docs/00_overview/04-stato-e-limiti.md`
§4 lo fa arrivare «al documento clinico validato e restituito»; `03 §2.1` lo ferma **prima** della
refertazione con `TG-01`. È la contraddizione centrale di `Q-281`, ed è misurata al §5.2.

**Sesta - `publiccode.yml` dichiara obbligatorio un componente che il rilascio non installa.**
`dependsOn.open` elenca Apache Kafka con `optional: false`; `TG-04` toglie il broker dal perimetro.

**Settima - il numero di righe dell'ordine di sacrificio è dichiarato in tre modi.**
`05-rischi-e-dipendenze.md` §1.3 e l'indicatore di `R-28` dicono **sette**; `03 §6.2` ne elenca
**otto**; la disponibilità effettiva al 26 agosto 2026 è di **sei**, perché `S-8` è consumata e `S-7`
è inesigibile per avvenuta esecuzione del conteggio. L'indicatore anticipatore del rischio dominante
del programma conta quindi righe che non esistono più.

**Ottava - il registro delle revisioni e la bacheca divergono su `Q-283`.**
`docs/09_roadmap/00-indice.md` §8.4 registra la protezione del ramo principale come non attuata, con
la verifica `404 Branch not protected` del 26 agosto 2026; la bacheca inter-agenti registra `Q-283`
come **risolta** lo stesso giorno, con la protezione configurata e verificata. Le due sedi sono
datate identicamente e dicono il contrario.

**Nona - la fotografia dello stato di fatto diverge fra le due sedi, e ora nel verso opposto.**
`docs/00_overview/04-stato-e-limiti.md` §2 riporta diciassette moduli della guida su ventuno e la
versione inglese «assente»; `docs/09_roadmap/00-indice.md` §4 riporta ventuno moduli completi e il
51% del corpus tradotto. La nota di lettura della panoramica dichiara la divergenza e la attribuisce
al fatto che la roadmap sarebbe **anteriore**: al 26 agosto 2026 è vero il contrario. È `Q-202`,
aperta, e la raccomandazione già registrata è la fonte generata.

**Decima - il diagramma e l'innesco di `T-10` non coincidono.** Il diagramma di `02 §7` colloca la
barra di `T-10` dal 14 novembre; l'innesco richiede anche `T-06`, che chiude il 21 novembre.

**Undicesima - il criterio bloccante 16 e il limite dichiarato 21 si escludono.** Il criterio esclude
ogni `[NV]` aperto su un componente rilasciato; il limite 21 di `03 §9` è un `[NV]` sul numero di
tenant per installazione. Vedi §2.4 di questo piano.

**Dodicesima - `T-05` e il punto di decisione di `Q-186` hanno date diverse.** `T-05` è datato 3
ottobre 2026 e comprende `C-4`/`Q-186` fra le voci da porre; il punto di decisione irreversibile di
`02 §6` è il 15 ottobre 2026. Non è una contraddizione di sostanza - `T-05` **pone** la domanda e non
la decide - ma le due date insieme lasciano il criterio bloccante 18 dipendente da una decisione che
matura dopo la chiusura del traguardo che la pone.

---

## 12. Il calendario di questo piano

Le date sono **allocazioni del calendario residuo**, non stime, e non portano percentuali. Dove il
titolare non è il contributore unico è indicato, perché una data assegnata a chi non l'ha accettata
è una speranza con un formato.

| Quando | Che cosa | Titolare | Perché lì e non dopo |
|---|---|---|---|
| **entro il 3 ottobre 2026** | Struttura del fascicolo di rilascio e testo delle tre dichiarazioni non aggirabili - lacune datate, nessuna verifica di secondo soggetto, non marcatura - **in italiano e inglese** | Contributore unico | Non dipende dal codice e non dipende dall'esito di `Q-189`: l'esito predefinito è già dichiarato, quindi il testo è scrivibile ora |
| **entro il 12 ottobre 2026** | Domanda al committente sull'eventuale ulteriore taglio reversibile (§8.2, seconda opzione) | Contributore unico pone, committente decide | La finestra per decidere un taglio si chiude **prima** che la pressione arrivi, non dopo |
| **15 ottobre 2026** | Periodo di supporto dichiarato e piano di dismissione (`C-4`, `Q-186`) | **Committente, `COMP`** | Punto di decisione irreversibile già dichiarato. È il criterio bloccante 18 |
| **entro il 17 ottobre 2026** | Misura di `Q-281` eseguita e versionata: affermazione pubblica → riga di perimetro, con i tre stati. Forma della dichiarazione delle lacune datate (`Q-282`) | Contributore unico per la misura; **`COMP`** per la forma | La misura deve precedere la decisione del 31 ottobre, altrimenti la decisione si prende senza il dato |
| **19 ottobre 2026** | **Gate.** Prima revisione settimanale. Contenuto: righe residue dell'ordine di sacrificio e criteri bloccanti soddisfatti | Contributore unico | Soglia dichiarata dal registro delle revisioni |
| **entro il 24 ottobre 2026** | Manuale di installazione: presupposti di `03 §7.1` in testa; sezioni «avvertenze» e «limiti d'uso» nelle due lingue; rinvio alla procedura di verifica a cura di chi installa | Contributore unico | I presupposti non dipendono dal codice. Ciò che dipende dal codice sono i comandi, che si aggiungono dopo su una struttura già esistente |
| **31 ottobre 2026** | `Q-281` - formulazione della differenza. `Q-185` - correzione del materiale pubblico. **Proposta**: `Q-172`, nome e schema di versione della distribuzione | **`PROD` e committente** | I primi due sono punti di decisione irreversibili dichiarati. Il terzo è una proposta di questo piano, motivata al §2.4 |
| **entro il 14 novembre 2026** | Primo confronto di impronte fra due esecutori, su un artefatto qualunque. Chiusura dei due `[NV]` del §2.4 | Contributore unico | La prima misura di riproducibilità tipicamente fallisce, e va fatta fallire quando c'è ancora tempo |
| **21 novembre 2026** | **Gate di innesco.** `T-08` e `T-06` chiusi. Ogni criterio bloccante ha almeno un'esecuzione registrata | Contributore unico | Regola del §1.2 |
| **22–30 novembre 2026** | Sequenza di rilascio, passi 2–9 del §6.1 | Contributore unico | Tredici-ventisei ore: riesecuzione su revisione congelata, non prima esecuzione |
| **30 novembre 2026** | Pubblicazione, oppure dichiarazione della data mancata secondo il §8.3. Registrazione dell'esito nel registro delle revisioni, in entrambi i casi | Contributore unico | Una data mancata si registra con la stessa procedura con cui si registra una data rispettata |

---

## 13. Le tre frasi che questo piano non consente di scrivere

Sono elencate perché un piano si giudica anche da ciò che rende impossibile.

**«`RU-1` è conforme a…»** - nessuna formula di conformità senza una prova che possa fallire,
pubblicata **ed eseguita**. Le voci di `publiccode.yml` restano `false`.

**«Il prodotto sarà marcato entro…»** - nessuna data di marcatura, in alcuna forma, in alcun
materiale (`V-171`, `V-280`). Il progetto **intende** assumere il ruolo di fabbricante; il soggetto
è **ancora da costituire**; oggi il prodotto **non reca marcatura CE**; chi installa, integra o
mette in servizio assume gli obblighi che ne derivano. Nessuna forma abbreviata di questa
formulazione è ammessa, perché ogni abbreviazione cade sul lato dell'intenzione e perde lo stato di
fatto.

**«Il rilascio è quasi pronto.»** - i criteri sono binari. Un rilascio con ventuno criteri e venti
soddisfatti è un rilascio non fatto, e il rapporto dice quale criterio manca.
