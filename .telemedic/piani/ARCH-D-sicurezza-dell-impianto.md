# ARCH-D - Sicurezza dell'impianto

Analisi condotta il 26 agosto 2026, il giorno stesso di `D63`. È un'analisi scritta: non contiene
codice, non contiene configurazione, non tocca alcun file del repository al di fuori di questo.

Ogni ritrovamento porta un identificativo `RS-nn` e il luogo esatto in cui è verificabile. Le
proposte di decisione portano `DS-nn` e stanno tutte nel §9. Chi legge non deve fidarsi di questo
documento: deve poterlo smentire aprendo i file citati.

**Avvertenza di merito.** Questa analisi non descrive un impianto insicuro. Descrive un impianto
**progettato bene e presidiato quasi per nulla**, che è una condizione diversa e in certi aspetti
più pericolosa, perché la qualità della prosa produce fiducia che i controlli non giustificano. Il
progetto ha una regola propria - *un controllo che nessuno ha visto fallire non è un controllo*, e
il suo corollario *una regola scritta e non presidiata da un controllo non è una regola* - e questa
analisi non fa altro che applicarla all'area di sicurezza fino in fondo. L'esito è severo perché la
regola è severa.

---

## 1. Che cosa ho letto e che cosa no

### 1.1 Letto per intero

| Documento | Nota |
|---|---|
| `CLAUDE.md` | Regole non negoziabili |
| `SECURITY.md` | Entrambe le lingue |
| `docs/06_security/00-indice.md` … `10-risposta-agli-incidenti.md` | Tutti e undici i file, per intero |
| `docs/02_architecture/08-viste-di-deployment.md` | Per intero, §§3.2, 3.3 e 5 con attenzione |
| `docs/02_architecture/05-multi-tenancy.md` | §§2-7 |
| `docs/02_architecture/06-eventi-e-integrazione-interna.md` | §§3, 4, 5 |
| `docs/adr/0007`, `0011`, `0013`, `0015`, `0025` | Per intero |
| `docs/01_technical/09-integrazione-continua-e-rilascio.md` | Per intero, §§3, 4, 6, 7, 8, 11, 12 con attenzione |
| `docs/01_technical/03-persistenza.md` | §§4-5 |
| `docs/01_technical/01-stack-e-motivazioni.md` | §§7, 11, 12 |
| `docs/08_compliance/00-indice.md` | Per intero |
| `docs/09_roadmap/03-primo-rilascio-utilizzabile.md` | §§5.3, 5.4, 7.1, 7.2, 7.3 e la tabella dei tagli `TG-01`…`TG-16` |
| `pipeline/README.md`, `pipeline/collocazione-dei-controlli.tsv` | Per intero, e la tabella **eseguita** |
| `.github/workflows/*.yml` | Tutti e cinque, per struttura dei lavori |
| `.telemedic/context/05_BACHECA_INTERAGENTI.md` | Estratti mirati: `V-06`, `V-178`, `V-182`, `V-280`, `Q-150`, `Q-151`, `Q-155`, `Q-156`, `Q-158`, `Q-189`, `Q-200`, `Q-276`, `Q-282`…`Q-293` |
| `.telemedic/context/00_PROJECT_BRIEF.md` | §§5 (decisioni `D17`, `D18`, `D19`, `D22`, `D23`, `D45`, `D49`, `D54`, `D62`), 6, 7, 8 |
| `.telemedic/piani/D63-recepimento-del-ruolo-di-fabbricante.md` | §§1-5 |

**Una verifica eseguita e non solo letta.** Ho eseguito `scripts/verifica-collocazione-dei-controlli.sh`.
Esito: **fallisce**, un errore, riga 9, controllo `G1`. Il dettaglio è il ritrovamento `RS-03`. Non
ho eseguito nient'altro e non ho modificato nulla.

### 1.2 Letto in parte, e lo dichiaro

- `docs/06_security/00-indice.md` e `10-risposta-agli-incidenti.md` sono in modifica da parte di un
  altro agente. Li ho letti nello stato del 26 agosto 2026 ore 16:34 e **non vi ho scritto**. Il §2.4
  del capitolo 10 porta già una «Dichiarazione di `Q-276`» che non compare nell'indice: se il lavoro
  in corso la sposta, le citazioni di questa analisi vanno riverificate.
- `docs/08_compliance/` oltre l'indice: **non letto**. Le affermazioni regolatorie di questa analisi
  provengono da `06_security/08` e dalla bacheca, non dai capitoli di conformità. Dove la
  qualificazione giuridica conta, la marco.
- `docs/10_fondamenti/`: **non letto**. È il presupposto dichiarato dell'area di sicurezza, e questa
  analisi non ne ripete i concetti.
- `.telemedic/research/B3-verifica-coturn-webrtc.md`: **non letto**. Il capitolo `05` vi rinvia per
  gli identificativi puntuali delle vulnerabilità del relay. Non cito alcun identificativo di
  vulnerabilità, coerentemente con la convenzione dell'area.
- I piani `T-08`, `T-10`, `T-12`, `T-14`: letti solo per ricerca mirata su analisi statica, analisi
  dinamica e analisi delle dipendenze. L'esito di quella ricerca è `RS-01`.

### 1.3 Che cosa questa analisi non fa

Non contiene passi di attacco, non contiene comandi, non contiene percorsi operativi di
sfruttamento. Descrive classi di problema e difese. Dove un difetto storico di un componente è già
descritto per meccanismo nei documenti del progetto, mi limito a rinviarvi.

Non nomina alcun fornitore commerciale che non sia già nominato nei documenti del repository.

Non è consulenza legale. Dove la conseguenza è regolatoria e la qualificazione dipende da un
accertamento che non ho compiuto, la marco `[NV]` e dico a chi va chiesta.

---

## 2. Il divario fra il modello di minaccia scritto e i presidi che esistono

### 2.1 Il fatto, prima dell'analisi

`docs/06_security/01-modello-di-minaccia.md` §7 enuncia la regola dell'area:

> «ogni riga del §5 abbia **almeno un requisito e almeno una prova automatica**, e che la prova sia
> una prova **negativa** … e non solo positiva.»

Il §5 ha quindici righe, da `M-01` a `M-15`. Il §7 elenca quindici forme di prova corrispondenti.

`pipeline/collocazione-dei-controlli.tsv` contiene sedici righe. **Nessuna di esse corrisponde a una
qualunque delle quindici prove.**

Non è una critica di calendario. Il formato della tabella prevede esattamente il caso del controllo
che non ha ancora oggetto: la colonna `stato = segnalazione` con `bloccante_dal` obbligatoria, e il
`README.md` della cartella spiega perché - «una riduzione senza data di scadenza non è temporanea: è
una rinuncia che nessuno ha dichiarato». Cinque righe usano già quel meccanismo: `G4` accessibilità
al 3 ottobre 2026, `G13` regole di dipendenza alla stessa data, `G7` copertura e `G12` profilo di
esercizio al 14 novembre, `G6` compatibilità di contratto al 30 novembre. Tutte e cinque
presuppongono codice che `V-182` vieta, e hanno comunque una riga e una data.

**L'accessibilità automatica ha una data. La prova negativa fra tenant no. Le regole di dipendenza
hanno una data. La suite di abuso contro il mediatore di uscita no.** Non è una questione di che
cosa è possibile oggi: è una questione di che cosa è stato dichiarato.

### 2.2 `RS-01` - undici attività di sicurezza prescritte in integrazione continua, una realizzata

`docs/06_security/07-catena-di-fornitura.md` §5 contiene una tabella di undici attività, con
frequenza ed effetto sul rilascio. Otto portano «Blocco», una porta «Segnalazione, poi blocco prima
del rilascio», due non bloccano.

`docs/01_technical/09-integrazione-continua-e-rilascio.md` §3 contiene la tabella dei controlli
obbligatori, `G1`…`G13`. È la tabella che la pipeline realizza e che
`pipeline/collocazione-dei-controlli.tsv` sorveglia.

Il confronto riga per riga:

| Attività prescritta da `06_security/07` §5 | Effetto dichiarato | Ha una `G`? | Riga nel TSV? | Esiste? |
|---|---|:-:|:-:|:-:|
| Analisi statica del codice | Blocco su soglia | **No** | **No** | **No** |
| Analisi delle dipendenze e corrispondenza con le banche dati di vulnerabilità | Blocco su soglia | **No** | **No** | **No** |
| Analisi dei segreti | Blocco assoluto | `G1` | Sì, bloccante | **Sì** |
| Analisi dinamica sull'applicazione in esecuzione | Blocco su gravità elevata | **No** | **No** | **No** |
| Prove negative di autorizzazione fra tenant su ogni punto di ingresso | Blocco, **e blocco sulla mancata copertura** | **No** | **No** | **No** |
| Suite di prove di abuso contro il mediatore di uscita | Blocco | **No** | **No** | **No** |
| Prove di abuso sul relay | Blocco, a ogni aggiornamento di versione | **No** | **No** | **No** |
| Verifica della conformità del trasporto cifrato | Blocco sotto la soglia dichiarata | **No** | **No** | **No** |
| Verifica di conformità della federazione delle identità | Segnalazione, poi blocco | **No** | **No** | **No** |
| Modello delle minacce tracciabile | Condizione di completezza | **No** | **No** | Sì come documento, no come cancello |
| Prova periodica di ripristino, materiale di chiave compreso | Evidenza documentale | **No** | **No** | **No** |

**Undici attività, una realizzata, e nessuna delle dieci mancanti ha una data.** La ricerca testuale
di «analisi statica», «analisi dinamica» e «analisi delle dipendenze» su `.telemedic/piani/*.md` e su
`docs/09_roadmap/*.md` restituisce **zero occorrenze**: non sono in ritardo, non sono pianificate.

La conseguenza va detta nella forma che il progetto usa: l'area di sicurezza ha scritto undici
regole; dieci non sono regole.

### 2.3 `RS-02` - un documento pubblico afferma controlli che non esistono

`SECURITY.md`, sezione «Sicurezza nel ciclo di sviluppo», afferma:

> «Analisi delle dipendenze e delle vulnerabilità note in integrazione continua.»
> «Analisi statica e verifica dei segreti su ogni pull request.»

E nella versione inglese, identicamente: «Dependency and known-vulnerability analysis in continuous
integration. Static analysis and secret scanning on every pull request.»

La verifica dei segreti esiste. **L'analisi statica non esiste. L'analisi delle vulnerabilità note
non esiste.** I controlli `G2` e `G5` confrontano la distinta dei materiali con le annotazioni del
registro dei componenti per licenza e per censimento - `scripts/verifica-registro-componenti.sh` -
e non interrogano alcuna banca dati di vulnerabilità.

Questo è il ritrovamento che pesa di più sul piano della credibilità, e per una ragione precisa: è
esattamente la classe di difetto che il progetto vieta a sé stesso. `CLAUDE.md` enuncia «nessuna
formula di conformità non dimostrata». `V-171` vieta a ogni artefatto pubblico di affermare o
lasciare intendere una conformità che non esiste. `06_security/01` §3.3 dice che l'attaccante mirato
«cerca il punto in cui la documentazione promette più di ciò che il codice fa». `SECURITY.md` è il
primo file che quell'attaccante apre, ed è il file in cui quel punto oggi esiste.

Va aggiunto che l'affermazione è anche **operativamente dannosa**: `06_security/08` §7 accerta che il
cliente pubblico e il soggetto obbligato devono dimostrare i controlli **anche sulla componente
fornita**, e che le linee guida sugli approvvigionamenti impongono requisiti «chiusi - sì o no, con
evidenza». Un cliente che risponda «sì, il fornitore esegue analisi statica» citando `SECURITY.md`
produce presso di sé un'evidenza documentale falsa. È il danno che `07` §1 dice di voler evitare,
prodotto dal file che doveva evitarlo.

### 2.4 `RS-03` - il cancello della tabella dei controlli è rosso, e lo è per un debito che nessuno può chiudere

`scripts/verifica-collocazione-dei-controlli.sh` fallisce oggi:

```
✗ riga 9 (G1): senza prova negativa: un controllo che nessuno ha visto fallire non è un controllo
Righe verificate: 16 · Errori: 1
```

La causa è nota e dichiarata: `Q-288` in bacheca. `G1` vive come azione di terze parti, non è
eseguibile localmente, e scrivere nel banco un sostituto «proverebbe il sostituto, non il
controllo». La questione elenca tre vie e ne dichiara i costi, fra cui la terza - lasciare la
tabella in errore - con la sua obiezione già scritta: «un cancello sempre rosso smette di essere
letto».

Non aggiungo una quarta via. Aggiungo un fatto che `Q-288` non registra e che cambia la scelta: la
tabella oggi è rossa **per il controllo che presidia la proprietà più irrecuperabile
dell'elenco**. Un segreto entrato nella cronologia di un repository pubblico è compromesso, e
`03-protezione-dei-dati.md` §4 lo dice senza attenuazioni: «la procedura è la rotazione, non la
rimozione dalla cronologia». Il cancello rosso e la proprietà irrecuperabile coincidono, e la
coincidenza rende la terza via la peggiore delle tre invece che la più onesta: dopo qualche
settimana il rosso viene letto come «è il solito `G1`», e il giorno in cui è un'altra riga a
cadere nessuno se ne accorge. La via (a) - rendere lo strumento eseguibile localmente - costa un
onere di aggiornamento ricorrente che `D54` rende oneroso; la via (b) - uno stato dichiarato di
*non collaudabile* con motivo e data di riesame - riproduce esattamente il meccanismo di
`bloccante_dal`, che nel repository funziona ed è già stato collaudato su cinque righe. La mia
posizione è al §9, `DS-03`.

### 2.5 `RS-04` - la regola dichiarata «prevalente su ogni altra» non ha presidio

`00_PROJECT_BRIEF.md` §8 chiude l'elenco delle convenzioni con: «**Riservatezza (R0)**: mai nominare
aziende, marchi, prodotti commerciali o domini di potenziali partner. **Questa regola prevale su
ogni altra.**»

`01_technical/09` §3 istituisce `G11` e lo descrive come «la traduzione automatizzata della regola
`R0`. È una lista di termini vietati, versionata, con procedura di aggiornamento».

Stato accertato:

- `scripts/verifica-termini-vietati.sh` **esiste** (33 KB, modificato il 26 agosto 2026 alle 16:23);
- `pipeline/termini-vietati.esempio.tsv` e `pipeline/termini-ammessi.tsv` esistono;
- la ricerca di `termini-vietati` e di `G11` su `.github/workflows/` restituisce **zero occorrenze**:
  il controllo non è collegato ad alcun flusso;
- `pipeline/collocazione-dei-controlli.tsv` **non ha una riga `G11`**, né bloccante né in
  segnalazione con data.

Quindi oggi la regola che il progetto dichiara prevalente su ogni altra è presidiata dalla sola
revisione umana, che `01_technical/09` §3 dichiara esplicitamente insufficiente per il caso che
conta - «il caso in cui un nome finisce in un commento o in un file di configurazione di esempio».

**Riserva onesta**: esiste `.telemedic/piani/G11-regola-di-riservatezza.md`, modificato oggi alle
16:24, ed è verosimile che il collegamento sia in corso. Il ritrovamento resta perché la tabella dei
controlli è la fonte di verità dichiarata su che cosa blocca, e oggi non registra `G11` in alcuna
forma: uno script che esiste e non gira è indistinguibile, dal punto di vista della proprietà
presidiata, da uno script che non esiste.

### 2.6 `RS-05` - le formule di conformità vietate non hanno alcun controllo, e `D63` ne allarga la superficie

È `Q-289`, aperta il 26 agosto 2026, e la riga `T01-C8` del TSV lo scrive da sé, in maiuscolo:

> «ATTENZIONE: lo script implementa due dei tre controlli che questa riga prometteva … Le formule di
> conformità vietate di `04_protocols/10` §2 **NON hanno alcun controllo**, qui né altrove: è debito
> dichiarato, non copertura.»

Aggiungo la parte che riguarda la sicurezza. Fra le formule vietate ce n'è una che è
un'affermazione di sicurezza: «**cifrato fino agli estremi**» senza la condizione della modalità
senza registrazione. `05-sicurezza-del-tempo-reale.md` §5.1 spiega perché la condizione non è un
dettaglio - in modalità con registrazione la proprietà **è diversa**, non attenuata. Una
documentazione, una nota di rilascio o una risposta a capitolato che usi la formula nuda afferma il
falso su una proprietà crittografica, e nessun controllo del repository la intercetta.

`Q-292` osserva che la sequenza di recepimento di `D63` «si esegue senza rete» proprio per questo.
Concordo, e aggiungo che il rischio è massimo sulle formule di sicurezza, perché sono quelle che un
valutatore tecnico verifica per prime e che un attaccante mirato usa come mappa.

### 2.7 `RS-06` - una contraddizione fra due documenti su che cosa fa il sistema all'avvio

Due luoghi esatti, sullo stesso invariante.

`docs/02_architecture/08-viste-di-deployment.md` §8, tabella delle verifiche all'avvio:

> | Uscita di rete negata ai componenti applicativi, consentita al solo mediatore di uscita | **Avvio rifiutato** |

`docs/06_security/06-sicurezza-applicativa.md` §8.5:

> «le regole di rete che negano l'uscita ai componenti applicativi sono configurazione
> dell'installazione. Il progetto le documenta nella configurazione di riferimento e le **verifica
> all'avvio dove tecnicamente possibile, emettendo un avviso esplicito** se il componente scopre di
> avere rotta verso l'esterno.»

Rifiuto contro avviso. La differenza non è redazionale: `V-157` è dichiarato «requisito
architetturale, non regola di codifica», e la sua intera giustificazione - §8.1 - è che «un vincolo
di rete non dipende dalla diligenza di nessuno». Se l'avvio prosegue con un avviso, la diligenza
di qualcuno torna dentro, ed è la diligenza di chi legge un log all'avvio, che è la forma di
diligenza meno affidabile che esista. Se invece l'avvio è rifiutato, allora `06` §8.5 sottodichiara
una proprietà che l'architettura garantisce, e sottodichiarare una difesa è meno grave ma produce
comunque due affermazioni incompatibili in due documenti che un valutatore legge insieme.

La stessa tabella di `08` §8 mostra che il progetto sa modulare la severità quando serve: la riga
sull'archivio del registro dice «Avvio rifiutato nel servizio gestito; avviso bloccante con conferma
esplicita nell'installazione presso il cliente». Quella distinzione è motivata. Sulla rotta di
uscita non ce n'è nessuna, e le due frasi divergono senza che nessuno dei due documenti sappia
dell'altro.

### 2.8 `RS-07` - un commento di flusso giustifica una scelta su una premessa non più vera

`.github/workflows/fascia-di-rilascio.yml`, intestazione:

> «la sua distinta è generata nel lavoro `distinta-dei-materiali` di `fascia-completa.yml` - perché è
> così che la colloca, oggi, `pipeline/collocazione-dei-controlli.tsv` (riga `G5`, fascia «completa»,
> stato «**segnalazione**»): questo flusso non duplica quel lavoro.»

Nel TSV la riga `G5` è oggi `bloccante`, ed è stata promossa il 26 agosto 2026 - il motivo di
collocazione lo dichiara per esteso. Il commento resta scritto sulla premessa precedente.

È il ritrovamento meno grave dell'elenco e lo scrivo comunque, perché è la forma in cui i cancelli
marciscono: una giustificazione che continua a citare uno stato superato è una giustificazione che
nessuno riverifica quando lo stato cambia di nuovo.

### 2.9 Ordinamento per costo del ritardo

Il criterio, dichiarato prima dell'elenco perché altrimenti l'elenco è un'opinione. **Costo del
ritardo** = irrecuperabilità della proprietà, per il tasso con cui il debito si accumula, per il
fatto che un intervento tardivo ripristini la proprietà oppure si limiti a fermare l'emorragia. Non
è gravità: una minaccia gravissima ma pienamente rimediabile domani ha costo del ritardo basso.

| # | Che cosa | Costo del ritardo | Perché |
|:-:|---|---|---|
| **1** | Capacità di vigilanza: tassonomia stabile degli eventi contati e conservazione della diagnostica pari alla finestra di vigilanza (`V-178`, `Q-276`) | **Massimo, e monotono** | **Contano eventi.** Una serie non raccolta non si ricostruisce, e accorpare o rinominare una categoria fa **sparire** l'aumento significativo invece di rilevarlo. Con `D63` la titolarità è nostra. Non figurano fra le quattro attività irrecuperabili di `D45` |
| **2** | Sapere **dove** una versione vulnerabile è installata (`RS-18`, §7.3) | **Massimo per coorte** | La prima coorte di installazioni resta invisibile per sempre. Ogni artefatto pubblicato prima che il meccanismo esista aggiunge installazioni non raggiungibili |
| **3** | Distinta dei materiali che descriva l'artefatto realmente distribuito (`RS-14`, §6.3) | **Alto** | `D45` la dichiara retroattivamente irrecuperabile: censire a posteriori costa un multiplo e la tracciabilità non si ricostruisce. Oggi la distinta è generata dal solo file di blocco del sito |
| **4** | Controllo di **copertura** delle prove negative fra tenant (`RS-09`, §3.6) | **Alto** | `06` §5.3 lo dice da sé: «senza questo controllo il requisito degrada nel giro di pochi mesi». Ogni punto di ingresso scritto prima che il controllo esista è un punto che nessuno retroadatterà |
| **5** | Copertura del registro degli accessi e prova dell'omissione all'origine (`RS-11`, §4.4) | **Alto** | Un accesso non registrato non si registra dopo. `03-primo-rilascio-utilizzabile.md` §5.4 lo colloca fra ciò che «non è tagliabile» proprio per questo |
| **6** | Visibilità della riduzione di garanzia del registro quando la separazione dei privilegi manca (`RS-10`, §4.3) | **Alto per il periodo** | `TG-23` è già dichiarato irreversibile per il periodo. La riduzione non dichiarata rende il periodo indistinguibile da uno in cui la garanzia c'era |
| **7** | Analisi delle dipendenze con banca dati di vulnerabilità, e analisi statica (`RS-01`, `RS-02`) | **Medio-alto e crescente** | Recuperabili come attività. Ma ogni giorno senza è un giorno di ingresso di dipendenze non valutate per vulnerabilità, e `RS-02` è **un'affermazione pubblica falsa oggi**, che è un difetto ora e non domani |
| **8** | Suite di prove di abuso su relay e mediatore (`RS-12`, §5.5) | **Medio-alto** | Recuperabili. Ma il relay è il componente esposto con la cadenza di vulnerabilità più alta accertata dal progetto stesso, e la difesa di configurazione è stata aggirata sei volte in otto anni |
| **9** | Allineamento dei tempi di divulgazione con l'obbligo delle 24 ore dell'integratore (`RS-16`, §7.2) | **Medio, con scadenza a sedici giorni** | Correzione documentale, costo quasi nullo. L'11 settembre 2026 è fra sedici giorni ed è la data da cui l'obbligo dell'integratore decorre |
| **10** | `G11` regola di riservatezza e controllo sulle formule vietate (`RS-04`, `RS-05`) | **Medio** | Le due regole che il progetto dichiara più assolute, entrambe senza presidio. `D63` allarga la superficie della seconda |
| **11** | Contraddizione rifiuto/avviso all'avvio (`RS-06`) | **Basso ora, alto al primo cliente** | Costo di correzione nullo oggi. Al primo capitolato diventa una risposta che non si può dare in modo univoco |

---

## 3. L'isolamento multi-tenant e ciò che lo aggira

### 3.1 Che cosa la difesa garantisce davvero

`ADR-0007` sceglie **uno schema per tenant su base dati condivisa, con sicurezza a livello di riga
come difesa in profondità**, e la decisione è ben motivata: l'alternativa a righe condivise rende la
dimostrazione della separazione «argomentativa» invece che strutturale, e rende il ripristino
selettivo e la dismissione operazioni su decine di tabelle.

Le quattro condizioni che la rendono efficace sono scritte e sono quelle giuste:

1. politiche imposte **anche al proprietario** delle tabelle;
2. ruolo applicativo **non proprietario** e privo dell'attributo che consente di superare le
   politiche;
3. entrambe **verificate all'avvio**, con avvio rifiutato se non soddisfatte;
4. la verifica automatica accerta **l'effetto**, non l'esistenza: «un tentativo di accesso a una riga
   di un altro tenant deve fallire nella prova, non essere semplicemente evitato dal codice».

`docs/02_architecture/05-multi-tenancy.md` §2 aggiunge la regola che regge tutto: il contesto di
tenant è **risolto dall'asserzione di identità, mai dalla richiesta**, ed è azzerato alla
restituzione della connessione al pool.

Questo è un progetto solido. Il resto di questo capitolo riguarda ciò che gli passa accanto.

### 3.2 I percorsi con privilegi elevati

`05-multi-tenancy.md` §6 li nomina e li qualifica con precisione: «Sono la superficie più pericolosa
del sistema, perché per definizione hanno privilegi che nessun percorso applicativo ha». Le cinque
regole che vi impone sono buone - percorso separato con ruolo di base dati distinto, nessun accesso
al contenuto, soglia minima di aggregazione, tracciamento rafforzato con il **perimetro effettivo e
non quello richiesto**, nessun percorso interattivo.

**Che cosa manca.** Nessuna delle cinque ha una prova associata, e la quarta - «perimetro effettivo,
non richiesto» - è precisamente quella che si può realizzare male senza che si veda: registrare il
perimetro richiesto invece di quello effettivo produce un registro che appare completo ed è
sistematicamente ottimista. La prova che serve è negativa e semplice da enunciare: si esegue
un'operazione che attraversa i tenant su un perimetro dichiarato, si induce l'operazione a toccarne
uno in più, e si verifica che la riga di registro riporti quello in più. Non esiste, non è
pianificata.

Aggiungo un secondo punto, che i documenti non trattano. `06_security/04` §7 elenca fra gli
indicatori di rilevazione «Accessi da utenze amministrative a dati clinici - l'amministratore di
sistema non ha titolo clinico: ogni suo accesso a dato clinico è un'anomalia per definizione». Il
percorso che attraversa i tenant è, per costruzione, un accesso privilegiato non nominativo: è un
processo, non una persona. `04` §3.1 prescrive che la riga porti `actor.sub`. **Che cosa vi si
scrive quando l'attore è un lavoro pianificato?** Se vi si scrive un identificativo di servizio, il
registro non distingue fra due esecuzioni innescate da persone diverse; se vi si scrive la persona
che ha innescato, il campo mente per le esecuzioni programmate. La domanda non è oziosa: `V-153` e
tutta l'architettura dell'accesso d'emergenza si fondano sul fatto che dietro ogni riga ci sia un
soggetto imputabile. È una questione aperta che nessun documento pone.

### 3.3 Le migrazioni

`05-multi-tenancy.md` §4 impone quattro proprietà - versionata, idempotente, reversibile con
procedura di annullamento **provata**, con esito registrato per schema - e §4.2 il metodo in due
fasi obbligatorio.

La superficie che nessuno tratta è il **ruolo che le esegue**. Una migrazione altera oggetti di cui
il ruolo applicativo, per `ADR-0007`, non è proprietario: quindi esiste un secondo ruolo che è
proprietario, e per costruzione le politiche di riga non lo fermano - o se lo fermano, la migrazione
non può eseguirle. Quel ruolo attraversa tutti gli schemi, ha privilegi di modifica dello schema, e
i suoi accessi non sono stati oggetto di alcuna riga in nessuno dei documenti letti. Il registro
degli accessi non lo copre: `04` §3.1 descrive righe di operazioni applicative su oggetti clinici,
non di operazioni strutturali.

Due conseguenze concrete:

- **La finestra di migrazione è una finestra in cui l'invariante «nessuna interrogazione senza tenant
  risolto» non vale.** `05-multi-tenancy.md` §4.1 dice che «un insieme di schemi in stati diversi è
  una condizione normale durante la finestra di migrazione». Durante quella finestra il codice deve
  funzionare con entrambe le forme (§4.2), e non esiste una prova che verifichi che l'isolamento
  regga in **entrambe**. La prova negativa fra tenant, quando esisterà, girerà sullo schema finale.
- **La migrazione dei dati clinici (§4.3) legge contenuto clinico di tutti i tenant.** Il §4.3
  elenca requisiti aggiuntivi, e nessuno di essi è «la trasformazione produce righe di registro». Se
  una migrazione tocca contenuto clinico e non lascia traccia nel registro, esiste una classe di
  accesso al contenuto clinico che il registro non vede, e la sua esistenza è la premessa perfetta
  per un accesso indebito mascherato da manutenzione.

Il documento è onesto su un punto correlato: «**Il registro immutabile non si migra.** Le sue voci
sono immutabili: una modifica di schema produce una nuova generazione di registro, con l'ancoraggio
che collega la nuova alla precedente». È la scelta giusta. Ma sotto `TG-23` **l'ancoraggio non
esiste in `RU-1`**, quindi il collegamento fra due generazioni di registro, in quel periodo, non ha
il meccanismo che lo rende dimostrabile.

### 3.4 Esportazioni, dismissione e copie di sicurezza

**Esportazioni.** `06_security/06` §7 prescrive limiti stretti per punto di ingresso sulle
esportazioni e `04` §7 le elenca fra gli indicatori di rilevazione, «Esportazioni massive per attore
e volume». `04` §8 punto 4 dice che «l'esportazione del registro è un atto sorvegliato: soglie,
motivazione, notifica al responsabile designato». Tutto giusto e tutto in prosa.

Ciò che aggira l'isolamento è il ciclo di vita del tenant. `05-multi-tenancy.md` §7 definisce lo
stato **Estratto**: «L'esportazione completa è stata consegnata al titolare in formato aperto e la
consegna è stata verificata». Un'esportazione completa di un tenant è, per definizione, un archivio
che contiene tutto ciò che le politiche di riga proteggevano, in un formato che non le porta con sé.
Da quel momento la separazione non è più una proprietà del sistema: è una proprietà della custodia
del file da parte del titolare. Il documento non dice **come il pacchetto è protetto** - cifrato con
quale chiave, consegnato per quale canale, con quale attestazione. `03-protezione-dei-dati.md` §3.3
elenca ciò che è cifrato a riposo e non nomina i pacchetti di esportazione.

**Copie di sicurezza.** Sono trattate bene in due punti - §3.3 di `03` («le copie di sicurezza,
**senza eccezioni**») e §7.3 sulla cancellazione differita, che è la parte più matura dell'intera
area. Aggiungo la superficie che `08-viste-di-deployment.md` §6.3 individua e non chiude: «Una copia
collocata fuori dal perimetro è **meno visibile** di una dipendenza di esercizio e altrettanto
rilevante: non compare nell'inventario delle dipendenze e non emerge dalle prove funzionali». È
esatto, ed è la ragione per cui il profilo di collocazione, che il progetto verifica con una prova
di percorribilità sulle dipendenze di esercizio (§6.1), **non copre le copie**. Il §6.1 ha tre passi
e nessuno guarda dove finiscono le copie. La verifica di sovranità del progetto ha quindi un buco
esattamente nel punto che lo stesso documento indica come il meno visibile.

**Una copia contiene tutti i tenant.** Nessun documento lo dice, e discende da `ADR-0007`: base dati
condivisa, schemi separati. Il ripristino selettivo di un tenant è dichiarato realizzabile (`SQ-08`)
e questo è un vantaggio dell'alternativa 3. La copia però resta un oggetto multi-tenant, e chi ha
accesso alla copia ha accesso a tutti i titolari. La cifratura per artefatto con chiavi per tenant
(`03` §4) è la difesa, ed è la difesa giusta - ma copre gli artefatti, non i metadati di sessione
che stanno nelle tabelle applicative e che `01` §2.2 qualifica come dato relativo alla salute di
prima classe. **Chi ottiene una copia e non ha le chiavi di tenant non legge i referti e legge chi
ha avuto una sessione con chi, quando e per quanto.** Questo è un rischio residuo reale, non è
dichiarato in nessuno dei documenti letti, e merita di esserlo.

### 3.5 Code e messaggi

Qui l'isolamento è di natura diversa e va detto con precisione.

`06-eventi-e-integrazione-interna.md` §4.2: «La chiave [di partizionamento] è **l'identificativo
dell'aggregato** … non il tenant. Partizionare per tenant sembra naturale e produce due difetti».
Le due ragioni tecniche sono corrette. La conseguenza di sicurezza non è scritta: **gli eventi di
tutti i tenant condividono gli stessi argomenti e le stesse partizioni**, e l'isolamento sul broker è
affidato al campo `tenantid` della busta - `EV-4`, `EV-5` - cioè a una convenzione applicativa, non
a un meccanismo del motore. Non c'è nulla di equivalente alla sicurezza di riga.

Ne discendono tre punti:

1. **Un consumatore sottoscritto a un argomento riceve le buste di tutti i tenant** salvo che il
   broker applichi un'autorizzazione per sottoscrizione. Nessun documento letto descrive come. `06`
   §5.3 prescrive che la prova negativa fra tenant copra «i canali di sottoscrizione agli eventi»,
   quindi il requisito **esiste in prosa**; il meccanismo che lo realizza no.
2. La difesa sostanziale c'è ed è `ADR-0011`, **eventi magri**: nessun contenuto clinico verso
   l'esterno, e per gli eventi interni «si trasporta ciò che serve al consumatore per decidere». Ma
   `01` §2.2 dice che i metadati di sessione **sono** dato sanitario, e una busta che porta tenant,
   riferimento alla prestazione e attributi di discriminazione è metadato di sessione. Il divieto di
   contenuto clinico non è un divieto di dato sanitario.
3. La coda dei messaggi non elaborabili è «per tenant» (§3.2) ed è «ispezionabile dall'amministratore
   del tenant» - `ADR-0011` lo cita come vantaggio degli eventi magri. Corretto per il contenuto
   clinico. Resta che un amministratore di tenant ispeziona buste che descrivono prestazioni, e
   `04` §7 qualifica come anomalia per definizione «accessi da utenze amministrative a dati clinici».
   Le due regole non si contraddicono formalmente e stanno scomode insieme.

**Attenuante rilevante e da dichiarare**: `TG-04` toglie il broker da `RU-1` per intero, e l'outbox
resta la sorgente di verità con consegna per chiamata autenticata. Per il primo rilascio il problema
non si pone. Si porrà al secondo, e il momento giusto per decidere il meccanismo di isolamento sul
broker è **prima** che il broker rientri, non quando rientra.

### 3.6 `RS-09` - la prova negativa fra tenant e il controllo di copertura

`06_security/06` §5.3 è, per qualità di formulazione, il paragrafo migliore dell'area:

> «**La copertura è verificata in modo automatico.** Un controllo in integrazione continua confronta
> l'elenco dei punti di ingresso dichiarati nel documento di interfaccia con l'elenco di quelli
> coperti dalle prove negative, e fallisce se la differenza non è vuota. **Senza questo controllo, il
> requisito degrada nel giro di pochi mesi**: i punti di ingresso nuovi non vengono coperti.»

Il progetto ha già scritto la propria diagnosi. Non ha una `G`, non ha una riga nel TSV, non ha una
data. E `07` §5 lo elenca con «Blocco; **e blocco anche sulla mancata copertura**», cioè con la forma
più forte dell'intera tabella.

Questo è il controllo con il quarto costo del ritardo dell'elenco del §2.9 e vale la pena dire
perché non è più alto: la finestra di codice applicativo si apre il 26 settembre 2026 (`V-182`), i
punti di ingresso oggi sono zero, e il controllo può nascere insieme al primo. Se nasce insieme al
primo, costa quasi nulla. Se nasce dopo il ventesimo, costa venti retroadattamenti che nessuno farà
con dieci-venti ore alla settimana.

### 3.7 Registri diagnostici

`V-150` è chiaro: «i log di diagnostica non portano identificativi diretti dell'assistito», e `04`
§3.2 spiega la ragione giusta - «i log di diagnostica hanno un pubblico più ampio, escono per il
supporto, finiscono negli allegati delle segnalazioni».

Due cose vanno però dette.

**La prima.** `03-protezione-dei-dati.md` §6 indica come verifica «Analisi automatica dei log di
un'esecuzione di prova contro un dizionario di schemi». È un controllo, è ben definito, e non ha una
`G`, non ha una riga nel TSV, non è pianificato. È l'undicesima regola non presidiata dell'area, ed è
quella che protegge il vincolo che l'area cita più spesso.

**La seconda, e non è nei documenti.** `04` §3.2 prescrive che l'identificativo diretto sia
sostituito da «un riferimento opaco risolvibile solo dentro il perimetro». Un riferimento opaco
stabile è uno pseudonimo, e uno pseudonimo stabile che compaia in molte righe di diagnostica
consente di correlare tutte le occorrenze dello stesso soggetto anche a chi non può risolverlo.
Chi riceve un pacchetto di log per un'indagine non sa chi sia il soggetto `X`, e sa che il soggetto
`X` ha avuto sette sessioni in due settimane, tutte con la stessa unità organizzativa. `01` §2.2
dice esattamente che frequenza e cadenza «distinguono un controllo occasionale da un percorso
continuativo». La minimizzazione dei log di diagnostica è quindi meno protettiva di quanto il
vincolo lasci intendere, e la differenza andrebbe scritta - non perché la scelta sia sbagliata, ma
perché l'area ha una regola sull'inventario onesto (`03` §5) e questo punto le sfugge.

### 3.8 L'archivio a serie temporali e quello del registro: non sono l'archivio relazionale

È la parte della domanda che dà l'esito più netto.

**Archivio del registro.** `08-viste-di-deployment.md` §2.1 lo dichiara sostituibile **con una
condizione**: «Sì, purché soddisfi le proprietà di §2 del capitolo sul tracciamento». La condizione è
esattamente ciò che serve. Resta aperto, e il documento lo dichiara al §9, «se l'archivio del
registro possa essere lo stesso motore dell'archivio applicativo con credenziali disgiunte, o se
debba essere un motore diverso» - rinviato all'area di sicurezza. `ADR-0013` lo rinvia a sua volta a
`SEC` fra i punti `[NV]`. **La domanda è aperta da entrambi i lati e non è chiusa da nessuno.** Non è
un dettaglio: se è lo stesso motore, la separazione dei privilegi è una proprietà della
configurazione dei ruoli, revocabile da chi amministra quel motore; se è un motore diverso, è una
proprietà dell'infrastruttura. Le due ipotesi producono garanzie di forza diversa e il progetto oggi
non sa quale sta promettendo.

**Archivio a serie temporali.** `08-viste-di-deployment.md` §2.1 lo dichiara «Sostituibile: Sì,
dietro l'interfaccia del contesto» - **senza alcuna clausola sulle proprietà da soddisfare**. Il
contrasto con la riga del registro, che sta due righe sopra nella stessa tabella, è visibile a
occhio nudo.

Oggi la sostanza è meno grave di quanto sembri, e va detto: `01_technical/03-persistenza.md` §5.2
mostra le misure cliniche in una tabella `t0001_monitoring.misura` con `tenant_id` esplicito dentro
lo schema di tenant del medesimo motore relazionale, e §5.3 offre due realizzazioni - estensione per
serie temporali o partizionamento nativo - **entrambe sullo stesso motore**. In quella forma
l'isolamento è quello di `ADR-0007`, politiche di riga comprese.

Il rischio è nella clausola di sostituibilità. Nel giorno in cui qualcuno sostituisce l'archivio a
serie temporali con un motore dedicato - che è precisamente ciò che la parola «sostituibile»
autorizza, e che il §4 di `04-modello-dati.md` rende plausibile citando «compressione e aggregazioni
continue» come funzioni native - **le misure cliniche escono dal perimetro delle politiche di riga e
nessun documento dice che cosa il sostituto deve garantire**. Sono dati sanitari: `03-persistenza.md`
§5.1 lo dichiara senza mezzi termini, «Sono **dati sanitari**: immutabili, con contesto di rilevazione
completo, soggetti a conservazione normata, a diritto di accesso, a tracciamento degli accessi».

La riga della tabella si corregge in una frase. Vale la pena correggerla oggi, quando costa una
frase.

### 3.9 `RS-08` - riepilogo: che cosa aggira l'isolamento

Otto percorsi, e per sei di essi non esiste alcun presidio automatico né alcuna riga che ne
dichiari uno futuro.

| Percorso | Aggira? | Che cosa lo tiene | Presidio automatico |
|---|:-:|---|:-:|
| Percorso applicativo ordinario | No | Schema + politiche di riga + contesto da asserzione | Prova negativa **prescritta, non esistente** |
| Operazioni che attraversano i tenant | **Sì, per progetto** | Cinque regole in prosa (`05-multi-tenancy` §6) | **Nessuno** |
| Migrazioni | **Sì, per necessità** | Nulla di scritto sul ruolo che le esegue | **Nessuno** |
| Esportazione e dismissione | **Sì, a valle** | Nulla sulla protezione del pacchetto consegnato | **Nessuno** |
| Copie di sicurezza | **Sì, per contenuto** | Cifratura per artefatto; **non copre i metadati di sessione** | Prova di ripristino **prescritta, non esistente** |
| Broker di eventi | **Sì, per meccanismo** | Campo `tenantid` in busta, convenzione applicativa | **Nessuno**; attenuato da `TG-04` in `RU-1` |
| Log di diagnostica | Parzialmente | `V-150`; pseudonimo stabile correlabile | Analisi **prescritta, non esistente** |
| Archivio a serie temporali | **Potenzialmente** | Oggi stesso motore; clausola di sostituibilità **senza condizioni** | **Nessuno** |
| Archivio del registro | Per progetto, ed è voluto | Privilegi disgiunti; forma tecnica **non decisa** | **Nessuno** |

---

## 4. Il registro immutabile e la separazione dei privilegi

### 4.1 Che cosa i documenti garantiscono davvero

`ADR-0013` è, insieme a `06_security/03` §7.3, la parte migliore del corpus. La domanda posta
dall'area di sicurezza - quale delle quattro tecniche - viene dichiarata mal posta, e la risposta è
«tutte e quattro», con una tabella che per ciascuna dichiara **che cosa non copre**. Le decisioni
derivate sono quelle giuste: catena **per tenant e non globale**, perché una catena globale renderebbe
impossibile consegnare a un titolare l'evidenza dei propri accessi senza rivelargli l'esistenza degli
altri; scrittura **bloccante** sull'archivio primario, con la conseguenza dichiarata e non nascosta
che l'indisponibilità del registro è indisponibilità del sistema per le operazioni su dato clinico;
catena che **non si ripara** ma apre una nuova generazione ancorata alla precedente.

`04-tracciamento.md` §4.1 dichiara i due limiti che una catena presentata da sola nasconderebbe: non
protegge dalla riscrittura integrale, non protegge dall'omissione all'origine. Sono le due cose
giuste da dire.

### 4.2 Che cosa presuppone dal cliente, e quanto di ciò che presuppone regge

Tre presupposti, in ordine di fragilità crescente.

**Primo - separazione dei privilegi fra archivio applicativo e archivio del registro.**
`08-viste-di-deployment.md` §3.2 la marca «**Requisito, non raccomandazione**. In sua assenza la
garanzia si riduce a quella della sola catena applicativa, e la riduzione va dichiarata».
`ADR-0013` conclude allo stesso modo, aggiungendo che «nell'installazione presso il cliente la
separazione dei privilegi **non è imponibile dal progetto**».

**Secondo - custodia e ciclo di vita propri.** `04` §4.2 elenca credenziali distinte,
amministrazione distinta, ciclo di vita distinto, capacità di sopravvivere alla compromissione
dell'applicazione. Sono tutti atti di chi installa.

**Terzo - l'ancoraggio esterno.** È lo strato che copre la collusione, ed è quello che `TG-23`
**taglia da `RU-1`**, dichiarando il taglio irreversibile per il periodo con una motivazione esatta:
«le registrazioni scritte prima non acquistano un ancoraggio retroattivo … Attivarlo dopo non
retrodata nulla».

Sommando: in `RU-1`, la garanzia di non alterabilità del registro poggia su **due strati su quattro**
- catena applicativa e privilegi disgiunti - e il secondo dei due è un presupposto che il progetto
non può imporre. `03-primo-rilascio-utilizzabile.md` §7.1 lo scrive con la precisione che merita:
«con `TG-23` il suo peso aumenta: senza ancoraggio periodico firmato, la separazione dei privilegi è
**lo strato che resta**».

**Se il cliente non la realizza, resta uno strato su quattro**, e quello strato - la catena
applicativa - è per costruzione riscrivibile da chi controlla l'applicazione. Cioè: contro
l'avversario primario dichiarato dal §3.1 del modello di minaccia, il registro in quella
configurazione **non prova nulla**.

### 4.3 `RS-10` - chi se ne accorge, e come

Questa è la domanda che il committente pone e che i documenti non chiudono. La risposta accertata,
in tre passaggi.

**Che cosa esiste.** `08-viste-di-deployment.md` §8 prevede la verifica all'avvio «Archivio del
registro non raggiungibile con le credenziali applicative», con conseguenza differenziata: «**Avvio
rifiutato** nel servizio gestito; **avviso bloccante con conferma esplicita** nell'installazione presso
il cliente». `ADR-0013` conferma: il progetto «rende la separazione la configurazione predefinita,
**rileva e segnala** la configurazione in cui i due archivi condividono le credenziali, e dichiara la
conseguenza».

**Che cosa questo significa in pratica.** Nell'installazione presso il cliente - che è l'assetto in
cui il presupposto può mancare - il sistema **si avvia comunque**, previa conferma esplicita di chi
installa. La conferma è un atto compiuto una volta, da una persona, in un momento in cui la sua
priorità è mettere in servizio il sistema. Da quel momento la riduzione è uno stato permanente e
silenzioso dell'installazione.

**Chi se ne accorge.** Rispondo per esclusione, ed è il punto:

- *Il titolare del trattamento*: **no**. `ADR-0013` prevede come seconda destinazione
  dell'attestazione «Consegna dell'attestazione al titolare del trattamento insieme al rapporto
  periodico», e la definisce «la misura più forte a costo quasi nullo». Ma quell'attestazione è
  **l'ancoraggio**, e `TG-23` lo toglie da `RU-1`. In `RU-1` non c'è attestazione, quindi non c'è il
  canale.
- *Chi riceve un'esportazione del registro*: **no**. `04` §6.1 prescrive per il pacchetto esportato
  formato aperto, impronta di integrità e firma. **Nessun documento prescrive che il pacchetto
  dichiari il livello di garanzia in vigore al momento in cui le righe furono scritte.** Un
  verificatore riceve un pacchetto firmato, ne verifica l'impronta, la catena torna, e non ha modo
  di sapere se quelle righe erano protette da quattro strati, da due o da uno.
- *Chi esegue la verifica di integrità programmata*: **no**. `03-primo-rilascio-utilizzabile.md` §7.3
  elenca «Procedura di verifica dell'integrità del registro - Su richiesta e programmata, con esito
  registrato. **Senza ancoraggio esterno** (`TG-23`)». La verifica ricalcola la catena. Una catena
  riscritta integralmente torna coerente: è precisamente il limite che `04` §4.1 dichiara. La
  verifica quindi **restituisce esito positivo** anche nel caso che dovrebbe rilevare.
- *L'autorità in sede ispettiva*: **no**, per la stessa ragione della seconda voce.
- *Chi ha compiuto la conferma esplicita all'avvio*: **sì**, e non è un controllo: è la stessa
  persona.

**Conclusione.** Oggi, nell'installazione presso il cliente, la riduzione di garanzia del registro è
visibile **al solo operatore che l'ha causata**, e diventa invisibile a chiunque altro, incluso il
soggetto che ne subisce le conseguenze giuridiche. La frase di `08-viste-di-deployment.md` §3.2 - «la
riduzione va dichiarata» - descrive un obbligo senza un destinatario, senza una forma e senza un
momento.

La correzione è a costo quasi nullo e sta al §9 come `DS-06`: la riduzione non si dichiara in un
documento, si **lega all'evidenza**. Ogni pacchetto di esportazione, ogni rapporto di verifica di
integrità e ogni attestazione portano un campo che dichiara gli strati attivi al momento della
scrittura delle righe che contengono. Un'evidenza che dichiara la propria forza è verificabile da un
terzo; una dichiarazione conservata altrove non viaggia con la prova e non arriva mai a chi la deve
pesare.

### 4.4 `RS-11` - l'omissione all'origine è il limite più serio, ed è quello senza presidio

`04-tracciamento.md` §4.1, secondo limite:

> «**La catena non protegge dall'omissione all'origine.** Se un'operazione non produce una riga, la
> catena resta coerente. La difesa non è crittografica: è che **la scrittura della riga sia sul
> percorso obbligato dell'operazione**, non un effetto collaterale che si possa disattivare. Un punto
> di accesso che possa restituire dati senza scrivere nel registro è un difetto di progettazione, e
> la prova che lo rileva è **una prova di copertura**, non una prova crittografica.»

Il paragrafo è impeccabile e nomina il proprio presidio: una prova di copertura. Che non esiste, non
ha una `G`, non ha una riga nel TSV, non è pianificata.

È il gemello esatto di `RS-09` - copertura delle prove negative fra tenant - e ha la stessa forma:
un controllo che confronta l'elenco dei punti di ingresso con l'elenco di quelli che producono una
riga di registro, e fallisce se la differenza non è vuota. **I due controlli possono essere lo stesso
controllo**, con due colonne invece di una, ed è il modo più economico di ottenerli entrambi.

Il costo del ritardo è alto per la ragione che `03-primo-rilascio-utilizzabile.md` §5.4 scrive
meglio di come potrei riscriverla: «Un accesso non registrato non si registra dopo. Ciò che si è
potuto ridurre è uno strato di garanzia (`TG-23`), **mai la copertura**». Il documento dichiara la
copertura non tagliabile, e non le assegna il controllo che la rende vera.

### 4.5 Due punti minori e uno di merito

**Il primo.** `ADR-0013` dichiara la scrittura del registro bloccante e l'indisponibilità del
registro come indisponibilità del sistema. Corretto e coraggioso. Ne discende però che l'archivio
del registro è un punto di guasto singolo sul percorso clinico, e che
`08-viste-di-deployment.md` §2.1 lo dichiara «Sostituibile: Sì». Un sostituto scelto male non
degrada la riservatezza: **ferma le visite**. Va detto nella riga della tabella, non solo dedotto
dall'`ADR`.

**Il secondo.** `04` §5 impone che la cancellazione a scadenza «è essa stessa registrata: la riga che
attesta la cancellazione del blocco scaduto sopravvive al blocco». È giusto, ed è anche l'unico
punto in cui una riga del registro sopravvive alla propria generazione: la conservazione di quelle
righe di attestazione ha necessariamente un termine diverso dai 24 mesi di `V-152`, e nessun
documento lo fissa.

**Il terzo, di merito.** `04` §8 punto 3 - «l'interessato ha titolo a conoscere gli accessi ai propri
dati … è anche la misura di trasparenza con il maggiore effetto deterrente sull'avversario primario»
- è, a mio giudizio, la singola misura con il miglior rapporto fra effetto e costo dell'intera area,
e nell'elenco dei tagli di `RU-1` non compare né fra ciò che è tagliato né fra ciò che non è
tagliabile. Non so se sia dentro `RU-1`, e non l'ho trovato: `[NV]`, va chiesto a `ROAD`.

---

## 5. Contenitori e installazione nativa a confronto

### 5.1 Il fatto da cui partire

**L'installazione nativa senza contenitori non è documentata in nessun punto del repository.** La
ricerca testuale di «installazione nativa», «senza contenitori», «bare metal» e «senza container» su
`docs/`, `.telemedic/` e sui file di radice restituisce, come unici riscontri, frasi che riguardano
le prove unitarie in memoria. Non è un capitolo mancante: è un assetto mancante.

Ciò che i documenti prevedono è:

- `01_technical/01-stack-e-motivazioni.md` §11: definizione di composizione a contenitori per il
  profilo a tenant unico, pacchetto per orchestratore per il servizio gestito, «i due non sono
  alternativi: sono i due modelli di `D8`»;
- `08-viste-di-deployment.md` §3.1: gli stessi due, «secondo le capacità del cliente»;
- `03-primo-rilascio-utilizzabile.md`, taglio `TG-08`: «`RU-1` si installa **solo** nel profilo a
  tenant unico con definizioni a contenitori. Chi vuole l'orchestratore costruisce i propri
  manifesti, **e il progetto non li supporta**».

Quindi la richiesta del committente introduce un **terzo** assetto, in un impianto che ha già
dichiarato che il secondo è tagliato dal primo rilascio perché «un secondo profilo è una seconda
matrice di prova e una seconda superficie di supporto».

### 5.2 Confronto, dimensione per dimensione

| Dimensione | Contenitori (assetto documentato) | Installazione nativa (non documentata) |
|---|---|---|
| **Superficie d'attacco** | Definita dall'immagine, che il progetto compone e la cui distinta è pubblicata. Ciò che non è nell'immagine non è raggiungibile | Definita dal sistema operativo del cliente. Il progetto **non la conosce e non può descriverla** |
| **Segreti** | Iniettati come `${VARIABILE_AMBIENTE}` (`CLAUDE.md`); nessun segreto nell'immagine (`03` §4) | Stessa regola applicabile, ma il meccanismo di iniezione è del cliente; nessuna configurazione di riferimento esiste |
| **Esecuzione senza privilegi** | Proprietà dell'immagine, verificabile e verificata dal controllo `G12` sul profilo di esercizio | Proprietà della configurazione del servizio sull'host. **`G12` verifica «configurazione dell'immagine»: senza immagine non ha oggetto** |
| **Aggiornamento dei componenti esposti** | Il relay arriva con la versione che il progetto dichiara, e `V-10` la verifica all'avvio | Il relay è il pacchetto della distribuzione del cliente, con la versione che la distribuzione ha. Vedi §5.3 |
| **Isolamento di rete fra i componenti** | Reti separate nella definizione di composizione; `V-157` realizzabile per configurazione dichiarativa | Realizzabile solo con firewall, spazi dei nomi o unità di servizio irrobustite dell'host. **Nessun documento del progetto ne descrive la forma** |
| **Nessun servizio co-locato sul nodo del relay** (`05` §4.3, quarto corollario) | Proprietà del nodo, ottenibile con un contenitore su un nodo dedicato | Su un'installazione nativa a nodo singolo il relay **è per definizione co-locato** con tutto il resto |
| **Riproducibilità** | `09` §6.2: immagine di base fissata per impronta, ordinamento deterministico, nessun contenuto scaricato non fissato | L'artefatto in esercizio è assemblato all'installazione dai depositi del cliente. **La proprietà di §6.1 - due costruzioni identiche byte per byte - non si trasferisce** |
| **Promozione dell'artefatto** | `09` §9: «Si promuove l'artefatto, non si ricostruisce» | Ciò che gira in esercizio **non è l'artefatto provato in collaudo**: è quel software su un altro sistema operativo, con altre librerie di sistema |
| **Distinta dei materiali** | `09` §8: per **ogni** artefatto, immagini di base comprese, «una distinta che li ignora è incompleta» | La distinta descrive ciò che il progetto costruisce; **le librerie di sistema del cliente non vi compaiono** |
| **Misure compensative per la deroga sugli endpoint** (`08` §6) | Cinque, di cui tre sono proprietà del contenitore: irrobustimento, filesystem in sola lettura, verifica dell'integrità delle immagini | **Tre su cinque non esistono in quella forma.** La dichiarazione tecnica di deroga elencherebbe misure inesistenti |

### 5.3 Il punto più tagliente: il relay in installazione nativa

Questo merita un paragrafo perché è il punto in cui la scelta smette di essere una preferenza
operativa e diventa una scelta di rischio.

`V-10` fissa la versione minima del relay a 4.17.2 e la verifica all'avvio. `05` §4.1 quantifica la
cadenza a monte: «**quattordici rilasci in poco più di sette mesi**, cinque nel solo mese in cui la
verifica è stata condotta». `05` §4.2 elenca sei difetti distinti di aggiramento del diniego dei
destinatari, **quattro dei quali negli otto mesi precedenti la verifica**.

In assetto a contenitori il progetto controlla quale versione arriva. In installazione nativa il
relay è il pacchetto della distribuzione del cliente. Ne discendono due esiti, entrambi cattivi:

1. la distribuzione fornisce una versione anteriore alla minima - che è il caso ordinario per una
   distribuzione con supporto a lungo termine - e la verifica di `V-10` **rifiuta l'avvio**: il
   sistema non si installa;
2. il cliente compila dalla sorgente per soddisfare `V-10`, e da quel momento **assume l'onere di
   inseguire quattordici rilasci in sette mesi** su un componente esposto a Internet. Con la cadenza
   accertata, un cliente che aggiorni trimestralmente è mediamente indietro di tre o quattro
   rilasci.

`08-viste-di-deployment.md` §3.2 elenca già «Cadenza di aggiornamento dei componenti esposti - in
particolare per il relay, che è esposto e per il quale l'aggiornamento è un obbligo, non una buona
pratica». In assetto a contenitori quell'obbligo si soddisfa aggiornando un'immagine. In assetto
nativo si soddisfa con una catena di compilazione presso il cliente, ed è un obbligo di natura
diversa che va scritto come tale prima di offrire l'assetto, non dopo.

Il quarto corollario di `05` §4.3 chiude il punto: «**nessun servizio co-locato**, e il servizio di
metadati dell'infrastruttura deve essere irraggiungibile … se non c'è nulla da raggiungere, il
difetto di canonicalizzazione non ha bersaglio». Su un'installazione nativa a nodo singolo - che è
esattamente la configurazione che uno studio associato installerebbe - il relay è co-locato con
l'applicazione, con la base dati e con l'archivio del registro. La difesa che ha retto a tutti e sei
i difetti storici, l'isolamento di rete, **non c'è**.

### 5.4 Che cosa il progetto può garantire e che cosa deve pretendere

| | Assetto a contenitori | Assetto nativo |
|---|---|---|
| **Il progetto garantisce** | Composizione dell'immagine, versioni dei componenti, esecuzione senza privilegi, distinta completa, riproducibilità, verifiche all'avvio, configurazione di rete di riferimento | Il proprio codice e la propria configurazione applicativa. **Nient'altro** |
| **Il progetto pretende da chi installa** | Regole di rete, dominio e certificati, custodia della chiave radice, separazione dei privilegi del registro, copie e ripristino, sorveglianza | Tutto quanto a sinistra, **più**: isolamento di rete del relay senza contenitore, esecuzione senza privilegi, irrobustimento dell'host, compilazione e aggiornamento del relay, inventario delle librerie di sistema, e un nodo dedicato al relay |
| **Il progetto può verificare** | Configurazione all'avvio, profilo di esercizio (`G12`), integrità dell'immagine | Configurazione all'avvio, e nulla dell'ambiente |

Il modo più onesto di dirlo è: **l'assetto a contenitori è quello in cui la ripartizione delle
responsabilità di `06_security/09` regge; l'assetto nativo sposta a destra un numero di righe che
quella tabella non è stata scritta per sopportare.** Se l'assetto nativo entra, `09` va riscritto con
una colonna in più, e la scrittura di quella colonna è essa stessa il modo per scoprire se l'assetto
è offribile.

### 5.5 Che cosa cambia per ciò che un fabbricante può dichiarare

Qui la domanda è diretta e la risposta è la parte più importante del capitolo.

`D17`, riportato in `01_technical/09` §1, distingue il repository dalla **distribuzione**, e
definisce quest'ultima «**Artefatto identificato**, prodotto da costruzione riproducibile, con
controllo qualità». `09` §6.1 spiega perché la riproducibilità non è un esercizio: «è ciò che
consente a un terzo … di **verificare che l'artefatto distribuito corrisponda al sorgente
pubblicato**. Senza, la separazione fra repository e distribuzione di §1 è un'affermazione non
verificabile». Il Regolamento (UE) 2017/745, Allegato I § 17.4, richiede al fabbricante di dichiarare
i requisiti minimi di hardware, di rete e di misure di sicurezza necessari al funzionamento previsto
- lo cita `06_security/08` §7.

Ne discende, come mia analisi e non come citazione:

1. **In assetto nativo l'artefatto in esercizio non è la distribuzione identificata.** È il software
   del progetto composto, all'installazione, con librerie di sistema che il progetto non ha scelto,
   non ha provato e non elenca nella propria distinta. Non c'è una costruzione riproducibile di
   quell'insieme, e nessun terzo può verificarne la corrispondenza con il sorgente pubblicato.
2. **Le conseguenze si biforcano, e non esiste una terza via.** O l'assetto nativo diventa una
   **seconda distribuzione identificata** - con la propria matrice di prova, la propria distinta, il
   proprio periodo di supporto e la propria valutazione: cioè il costo che `TG-08` ha già giudicato
   insostenibile per il **secondo** profilo, moltiplicato; oppure resta **fuori dal perimetro di ciò
   che sarà marcato**, e va dichiarato come tale in ogni artefatto, con la stessa evidenza con cui il
   progetto dichiara oggi che non reca marcatura.
3. **La seconda opzione è compatibile con `D63` solo se detta bene.** `D63` stabilisce che il sistema
   deve essere adatto all'erogazione su utenti reali, e `Q-290` accerta che «adatto a pazienti reali»
   ha un solo significato: marcatura al termine di una valutazione conclusa. Un assetto nativo fuori
   perimetro sarebbe quindi **un assetto non utilizzabile per l'erogazione**, e offrirlo senza
   dichiararlo con quella precisione produrrebbe esattamente la lettura fuorviante che l'art. 7 del
   Regolamento (UE) 2017/745 vieta - lo stesso rischio che `Q-290` lettera (b) individua
   sull'accostamento fra `RU-1` e il percorso di conformità.
4. **La dichiarazione tecnica di deroga sugli endpoint diventa parzialmente falsa** in assetto
   nativo. `06_security/08` §6 elenca fra le misure compensative disponibili nativamente
   l'irrobustimento del contenitore, il filesystem in sola lettura e la verifica dell'integrità delle
   immagini. Su un'installazione senza contenitori due di queste non esistono e la terza cambia
   oggetto. Poiché `08` §6 dice che «**senza questo documento il cliente non può chiudere la
   deroga**», un documento che elenchi misure inapplicabili all'assetto installato non chiude nulla e
   lo fa credere.

`[NV]` sulla qualificazione regolatoria della biforcazione al punto 2: se un'installazione nativa
assemblata presso il cliente configuri una **modifica** del dispositivo ai sensi della disciplina
delle modifiche, o una distribuzione autonoma, o un uso fuori dalla destinazione dichiarata, non è
accertato in questa analisi e non è deducibile dai documenti letti. Va chiesto a `COMP` e a un
consulente regolatorio, prima di offrire l'assetto e non dopo.

### 5.6 `RS-12` - le due suite di abuso, che sono requisiti e non esistono

Chiudo il capitolo su ciò che vale in entrambi gli assetti.

`05` §4.5 apre con «**Requisito, non raccomandazione**» ed elenca sei destinazioni da tentare contro
il relay, aggiungendo che gli ultimi due casi «sono quelli che una suite scritta prima della verifica
non contiene, e sono esattamente i due che corrispondono ai difetti più recenti». `06` §8.4 elenca
tredici casi per la suite unica contro il mediatore di uscita e chiude con «**Questo è l'intero costo
della difesa**: una suite invece di cinque».

`08-viste-di-deployment.md` §5.2 quarto strato dice la cosa che conta: «Il quarto strato è quello che
distingue una misura documentata da una misura efficace. Una configurazione corretta oggi non resta
corretta dopo un aggiornamento del componente o una modifica alla rete: **solo una prova eseguita a
ogni costruzione lo accerta**».

Nessuna delle due suite ha una `G`, una riga nel TSV o una data. Sono le due prove che, per esplicita
ammissione dei documenti che le prescrivono, sono la differenza fra una configurazione documentata e
una difesa. Il costo del ritardo è medio-alto e non massimo per un motivo solo: sono pienamente
recuperabili, e il giorno in cui esistono coprono anche il passato. Ma sono anche le uniche prove
dell'elenco **eseguibili contro componenti che esistono già** - il relay è un componente di terze
parti, non richiede codice applicativo, e `V-182` non lo tocca. Sono cioè le uniche che si potrebbero
scrivere oggi e non lo sono state.

---

## 6. Catena di fornitura

### 6.1 Che cosa è deciso e regge

`Q-287` è stata risolta il 26 agosto 2026: **firma con identità effimera legata all'esecuzione della
catena**, nessuna chiave privata da custodire, prova in un registro di trasparenza pubblico.

La motivazione dichiarata è `D54`, ed è corretta: «la custodia di una chiave è un onere *ricorrente*
- protezione, rotazione, revoca, continuità fra contributori - e la capacità dichiarata è di un
contributore unico a tempo parziale. Un onere ricorrente che nessuno ha il tempo di esercitare non è
una misura di sicurezza: è una chiave abbandonata, che è peggio di nessuna chiave».

**Concordo, e la decisione è sostenibile con un solo contributore a tempo parziale.** È anzi l'unica
delle due famiglie che lo sia. La domanda posta dal committente - se la decisione «le chiavi non
risiedono nella pipeline» regga sotto `D54` - ha quindi risposta affermativa, e la ragione è che la
decisione non è più «le chiavi stanno altrove» ma «non ci sono chiavi». Sono cose diverse e la
seconda è più forte.

`01_technical/09` §7.1 conserva ancora la formulazione precedente - «il materiale di firma è
custodito in un servizio dedicato e l'operazione di firma è tracciata» - che descrive la **prima**
famiglia, quella scartata. Non è una contraddizione grave perché `Q-287` è di oggi, ma è un
allineamento da fare nello stesso atto in cui la fase 4 di `T-03` si progetta, altrimenti il capitolo
tecnico descriverà per mesi una scelta che non è stata presa.

### 6.2 `RS-13` - che cosa succede se non regge, e le tre conseguenze che nessuno ha ancora scritto

`Q-287` dichiara un costo e lo dichiara bene: «la verificabilità degli artefatti dipende da un
registro di trasparenza di terze parti e dalla sua disponibilità *nel tempo*, che per un dispositivo
medico è un orizzonte lungo». E prescrive di scrivere nella procedura di verifica «che cosa fare se
quel registro non è più raggiungibile». Aggiungo tre conseguenze che la questione non registra e che
cambiano che cosa va scritto.

**Prima - la radice di fiducia si sposta sulla catena, e la catena è approvata da chi la scrive.**
Con la firma a identità effimera, ciò che l'artefatto attesta è «prodotto da quella definizione di
pipeline, in quel repository, su quella revisione». La sicurezza dell'artefatto diventa quindi la
sicurezza del **controllo su chi modifica la definizione di pipeline**. `Q-283` accerta la forma
adottata: la protezione del ramo principale è attiva, e «il proprietario del repository (committente)
può approvarsi le proprie modifiche e unirle». Sotto `D54` questo è inevitabile e la questione lo
riconosce - «non risolve la lacuna di `Q-189`, la rende visibile e circoscritta». Ma la conseguenza
sulla catena di fornitura non è scritta da nessuna parte: **una modifica alla definizione di
pipeline è, oggi, autoapprovata, e produce artefatti firmati che ogni installazione accetterà come
autentici.** È esattamente la minaccia `M-12`, con il fattore di moltiplicazione che `01` §2.5 le
attribuisce, e la difesa che il modello di minaccia le assegna al §7 è «Verifica della firma e della
provenienza dell'artefatto; **riproducibilità della compilazione**».

**Seconda - la riproducibilità è la sola difesa residua, e in `RU-1` è ridotta.** `07` §8 la
qualifica senza ambiguità: «È la **sola** difesa contro una compromissione della pipeline che
sopravviva alla firma». `09` §6.3 prescrive un lavoro pianificato che ricostruisce l'ultima
distribuzione su un esecutore diverso e confronta le impronte. `TG-14` riduce la verifica di
riproducibilità **all'artefatto principale del servizio**, e non agli altri. Sommando: la radice di
fiducia è la definizione di pipeline; il controllo umano su quella definizione è un'autoapprovazione;
la difesa che sopravvive alla firma è la riproducibilità; la riproducibilità è ridotta a un artefatto
e non ha ancora un lavoro che la esegua. Non c'è nulla di irrimediabile in questo quadro, e va
guardato tutto insieme invece che una riga alla volta.

**Terza - la verifica offline nel tempo lungo.** `07` §8 richiede che «la verifica della firma sia
**documentata come passo obbligatorio** dell'installazione, non come possibilità». Con l'identità
effimera, la verifica richiede che il verificatore raggiunga il registro di trasparenza. Un
verificatore che apra un'indagine su un incidente avvenuto anni prima - che è precisamente lo
scenario che `09` §11.3 prevede quando dice che il progetto non rimuove gli artefatti pubblicati -
potrebbe non trovare più quel registro. La contromisura è che **la procedura di verifica prescriva
di conservare localmente, al momento del prelievo, la prova di inclusione e il materiale di
verifica**, così che l'artefatto resti verificabile anche se il servizio non c'è più. È una riga di
procedura, costa nulla, e va scritta ora perché ogni artefatto pubblicato prima che esista è un
artefatto per cui nessuno l'ha conservata.

### 6.3 `RS-14` - la distinta dei materiali non descrive ciò che sarà distribuito

`01_technical/09` §8 è esplicito: la distinta è generata «per **ogni** artefatto - servizio,
interfaccia, immagini, chart - e non solo per il servizio principale. Le immagini di base contengono
componenti di sistema che sono componenti di terze parti a tutti gli effetti, e **una distinta che
li ignora è incompleta**».

Lo stato accertato è nel motivo di collocazione della riga `G5` del TSV:

> «La distinta si genera ora **dal solo file di blocco**, perche' la camminata dell'albero installato
> va in errore dentro arborist sul campo overrides: vedi C-3 del runbook degli errori.»

Sotto `V-182` l'unico artefatto è il sito, e il ripiego è ragionevole. Il ritrovamento non è che il
ripiego sia sbagliato: è che **non ha una data di scadenza**. Il formato della tabella ha
`bloccante_dal` per le riduzioni temporanee, e il `README.md` dichiara la ragione: «una riduzione
senza data di scadenza non è temporanea: è una rinuncia che nessuno ha dichiarato». La riduzione qui
non sta nella colonna dello stato, sta nel motivo di collocazione, dove la regola non la vede.

Il costo del ritardo è alto perché `D45` colloca la distinta fra le quattro attività retroattivamente
irrecuperabili, e `07` §2.2 lo scrive per esteso: «censire i componenti di terze parti a posteriori
costa un multiplo del censirli mentre entrano, e la tracciabilità non si ricostruisce».

Aggiungo la conseguenza regolatoria, che è la parte che rende il punto urgente e non solo ordinato:
`07` §2 accerta che l'Allegato I, Parte II, punto 1 del Regolamento (UE) 2024/2847 impone di
documentare **i componenti contenuti nel prodotto**. Le librerie di sistema dell'immagine di base
sono componenti contenuti nel prodotto. Una distinta generata dal file di blocco delle dipendenze
applicative non le contiene. Se e quando l'assetto nativo entra, il problema si aggrava: parte del
tempo di esecuzione non proviene dal progetto e non è censibile da nessuna sua pipeline.

### 6.4 `RS-15` - la dichiarazione di esposizione non ha un produttore

`07` §4 istituisce la dichiarazione di esposizione con cinque regole, e la quinta è la più forte
della sezione: «Il rilascio è **bloccato** in presenza di vulnerabilità aperte oltre la soglia di
gravità definita e **non coperte** dalla dichiarazione».

Perché quella regola sia realizzabile serve una cosa che non esiste: **l'elenco delle vulnerabilità
aperte della distinta**, cioè l'analisi delle dipendenze contro una banca dati di vulnerabilità che
`RS-01` accerta assente. Quindi la regola di blocco più severa del capitolo sulla catena di fornitura
poggia su un ingresso che il progetto non produce.

C'è un secondo punto, più sottile e più serio sul piano dell'onere ricorrente. `07` §4 impone che la
dichiarazione «accompagna ogni rilascio e copre **tutte** le vulnerabilità aperte della distinta»,
con la motivazione giusta: «una copertura parziale non è utilizzabile: chi la legge non sa se il
silenzio significa "non esposto" o "non valutato"». Valutare l'esposizione richiede, per ciascuna
vulnerabilità, di stabilire se il codice vulnerabile sia raggiungibile - che è un'analisi umana, non
automatizzabile. Su un impianto con le dipendenze che questo avrà, è un onere ricorrente per
rilascio. **Sotto `D54`, dieci-venti ore alla settimana, questo è il singolo obbligo di catena di
fornitura che più probabilmente non verrà esercitato**, e l'esito di un obbligo non esercitato è una
dichiarazione parziale, che per la regola stessa del progetto non è utilizzabile.

Non ho una soluzione da proporre che non sia una scelta del committente, e sta al §9 come `DS-09`:
va deciso ora se la dichiarazione di esposizione si produce integrale per rilascio - accettando che
la sua produzione entri nel percorso critico di ogni rilascio - o se si dichiara fin d'ora una forma
ridotta, esplicita su che cosa non valuta. La terza possibilità, quella che si verifica per
inerzia, è una dichiarazione che si degrada in silenzio, ed è la peggiore delle tre perché è quella
che il §4 dichiara «non utilizzabile» pur avendo l'aspetto di essere stata prodotta.

---

## 7. Vulnerabilità, sorveglianza, e ciò che è retroattivamente irrecuperabile

### 7.1 Che cosa cambia con `D63`

`06_security/08` §5 accerta lo stato precedente: il progetto non è un prodotto immesso sul mercato
nel corso di un'attività commerciale, il titolare in quanto persona fisica non può essere
amministratore fiduciario di software libero, «nessun obbligo sorge oggi in capo al progetto».
`D63` non cambia questo stato di fatto - `V-06`, strato `D63`, lo ripete due volte - ma cambia lo
stato dell'obiettivo, e con esso cambia **che cosa è irrecuperabile a partire da oggi**.

Il quadro dei termini che il progetto ha già accertato, e che non ripeto se non per le date che
cadono nella finestra di questa analisi:

- **11 settembre 2026**: applicabilità dell'art. 14 del Regolamento (UE) 2024/2847, obblighi di
  segnalazione delle vulnerabilità attivamente sfruttate e degli incidenti gravi (`08` §3.1). **Sono
  sedici giorni.**
- **11 dicembre 2027**: il resto del regolamento - requisiti essenziali, valutazione della
  conformità, marcatura.
- La vigilanza sui dispositivi con i suoi tre termini - due, dieci e quindici giorni - grava sul
  fabbricante, e `06_security/10` §2.4, nella riscrittura in corso, la attribuisce ora al «soggetto
  fabbricante, da costituire» per la nostra distribuzione.

### 7.2 `RS-16` - i tempi dichiarati non reggono l'obbligo che devono alimentare

`06_security/10` §2.5 stabilisce il nesso con precisione:

> «l'obbligo sorge in capo a chi integra il progetto in un prodotto commerciale, e sorge adesso. Un
> integratore che riceva la notizia di una vulnerabilità attivamente sfruttata ha **24 ore**, e non
> può rispettarle se il progetto non ha una politica di divulgazione con tempi dichiarati e un canale
> funzionante. **La capacità di segnalazione del progetto è quindi un requisito dell'integratore
> prima ancora che un obbligo proprio.**»

`SECURITY.md` dichiara i tempi verso chi segnala:

| Fase | Tempo indicativo |
|---|---|
| Presa in carico | **3 giorni lavorativi** |
| Prima valutazione con classificazione di gravità | **10 giorni lavorativi** |

**Tre giorni lavorativi di presa in carico non alimentano un obbligo di ventiquattro ore.** In una
settimana con un festivo, tre giorni lavorativi sono cinque giorni di calendario: l'integratore ha
già mancato il proprio termine di quattro volte prima che il progetto abbia preso in carico la
segnalazione. E dieci giorni lavorativi per la classificazione di gravità significano che, quando
l'integratore deve decidere se ciò che ha in mano è una vulnerabilità attivamente sfruttata, il
progetto non gli ha ancora detto quanto è grave.

Aggiungo che il progetto ha già un termine più stretto altrove, e non è quello pubblicato:
`06_security/09` §9, misura `RS.CO-02`, impegna il progetto a «**Notifica al cliente sotto le 24 ore**
e immediata per gli incidenti di gravità elevata», e `10` §4 lo ripete con la motivazione - «il
margine è la sostanza dell'obbligo, non un supplemento di cortesia». Quindi il progetto ha due
orologi diversi in due documenti diversi, **e quello pubblico è il più lento**.

Sono due termini per due cose diverse - riscontro a chi segnala e notifica al cliente - e non è una
contraddizione formale. È però una lacuna sostanziale: manca il terzo, che è quello che serve a
`10` §2.5, cioè il termine entro cui il progetto **avvisa i propri integratori** di una vulnerabilità
attivamente sfruttata, indipendentemente dal fatto che sia già stata corretta. Quel termine oggi non
è dichiarato in alcun documento, e l'11 settembre 2026 è la data in cui la sua assenza inizia a
costare a qualcun altro.

### 7.3 `RS-18` - sapere dove una versione vulnerabile è installata

È la parte della domanda del committente con la risposta più netta: **il progetto oggi non può
saperlo, e non c'è nulla nei documenti che lo preveda.**

I fatti che lo determinano, tutti dichiarati e ciascuno corretto in sé:

- l'assetto principale è l'installazione presso il cliente (`08-viste-di-deployment.md` §3), quindi il
  progetto non gestisce le installazioni;
- `03-protezione-dei-dati.md` §6 impone fra le impostazioni predefinite «telemetria a **adesione
  esplicita**», che è la scelta giusta e significa che nessuna installazione si annuncia;
- gli artefatti sono pubblici e prelevabili senza registrazione;
- `09` §11.3 stabilisce che il progetto **non rimuove** gli artefatti pubblicati al termine del
  supporto, li marca come non supportati - scelta giusta e motivata dalla ricostruibilità per la
  vigilanza, e che però garantisce che versioni superate restino prelevabili per sempre.

Sommando: il progetto potrà pubblicare un avviso di sicurezza e non potrà **raggiungere** chi ha
installato. `07` §6 impone «distribuzione delle correzioni **senza indugio e a titolo gratuito**,
attraverso un canale autenticato»: pubblicare su un canale autenticato è distribuzione disponibile,
non distribuzione recapitata.

**Che cosa è irrecuperabile.** La conoscenza è recuperabile in avanti e mai all'indietro: ogni
artefatto pubblicato prima che un meccanismo esista genera una coorte di installazioni che resterà
invisibile per sempre. Questo è il secondo costo del ritardo dell'intero elenco, e la ragione per cui
sta così in alto è che il rimedio è a costo bassissimo **oggi**, quando gli artefatti pubblicati sono
zero, e diventa impossibile per la parte già distribuita.

Le forme possibili, con i loro costi, senza raccomandarne una:

1. **Registro delle installazioni al momento del prelievo**, su base contrattuale per chi vuole
   ricevere gli avvisi. Costo di privacy quasi nullo se registra l'organizzazione e la versione, non
   l'esercizio. Copre solo chi aderisce.
2. **Canale di avvisi firmato che l'installazione interroga**, con l'interrogazione che porta la
   versione. Copre tutti gli attivi, richiede una dipendenza di rete in uscita che va instradata dal
   mediatore (`V-157`) e va dichiarata nell'inventario dei flussi - `ID.AM-03` di `09` §5 la
   richiede comunque.
3. **Nessun meccanismo, dichiarato come limite**, con l'onere di sorveglianza degli avvisi
   interamente su chi installa. È una posizione difendibile per un progetto aperto e **non lo è per
   un fabbricante**: `07` §2 elenca fra gli obblighi della Parte II «garantire meccanismi sicuri di
   distribuzione degli aggiornamenti», e sapere a chi si distribuisce è il presupposto della
   sorveglianza post-commercializzazione.

Sotto `D63` la terza opzione smette di essere gratuita. La decisione è del committente e sta al §9
come `DS-02`.

### 7.4 `RS-15` (vigilanza) - le due capacità che contano eventi

Non le riscopro: sono `V-178` e `Q-276`, e la bacheca le enuncia meglio di come farei.

> «**(a) Tassonomia stabile degli eventi contati**: … rinominare o accorpare una categoria rende la
> serie incomparabile e **fa sparire l'aumento significativo invece di rilevarlo**. **(b)
> Conservazione dei segnali di diagnostica pari almeno alla finestra entro cui una segnalazione può
> arrivare**: il termine è determinato dagli obblighi di vigilanza, non dal fabbisogno operativo, ed è
> distinto dai termini di `V-152`.»

E `Q-276`: «Entrambe **contano eventi**: non si accendono a posteriori, e la serie storica mancante
non si ricostruisce … Finché l'obbligo di vigilanza era di un terzo, la lacuna era un problema suo;
con `D58` la titolarità sarà nostra e la lacuna è **nostra**.»

La mia valutazione di sicurezza, che è ciò che aggiungo:

**Sono, senza confronto, la voce con il costo del ritardo più alto dell'intera analisi**, e la
ragione non è regolatoria ma logica: tutte le altre voci di questo documento riguardano proprietà che
un intervento tardivo **ripristina**. Queste due riguardano una serie di misure. Un intervento
tardivo non ripristina la serie: la ricomincia. E il metodo di rilevazione che entrambe alimentano -
l'aumento statisticamente significativo della frequenza di eventi non gravi - **richiede la serie
precedente per funzionare**. Un fabbricante che accenda il conteggio nel 2028 non rileva alcun
aumento nel 2028: rileva il primo aumento nel 2029, e nel frattempo il segnale che avrebbe dovuto
rilevare gli sfugge senza lasciare traccia del fatto che gli è sfuggito.

C'è inoltre una conseguenza di **sicurezza informatica**, non solo di vigilanza, che nessun documento
collega. La conservazione della diagnostica pari alla finestra di vigilanza è lo stesso requisito che
rende possibile la ricostruzione della sequenza temporale di un incidente. `06_security/10` §4
impone al fornitore il «Rapporto che descriva tipologia di attacco subito, vulnerabilità sfruttate,
**sequenza temporale degli eventi** e contromisure adottate - **entro il giorno successivo**». Se la
diagnostica dura giorni e l'incidente emerge dopo settimane - che è lo scenario ordinario, perché
l'acquisizione dell'evidenza è «tipicamente successiva al verificarsi dell'incidente» (`10` §3) - il
rapporto non è redigibile. **La stessa configurazione mancante rompe due obblighi in due regimi
diversi**, e questo raddoppia il costo del ritardo invece di dividerlo.

La proposta motivata già in bacheca - dodici mesi configurabili per i segnali riferibili a una
prestazione o a un allarme, con determinazione finale del fabbricante - è, dal punto di vista della
sicurezza, adeguata e non eccessiva. `[NV]` sul valore, come dichiara `V-178`: nessuna fonte fissa un
termine per la diagnostica.

### 7.5 `RS-17` - il periodo di supporto è l'impegno ricorrente che nessuna aritmetica copre

`07` §6: «Il periodo di supporto è dichiarato per ciascun rilascio maggiore, con data di fine. Il
regolamento impone al fabbricante un minimo di **cinque anni**; un progetto che ne dichiari meno
rende il proprio integratore non conforme. La decisione sul periodo effettivo è del committente ed è
aperta come questione `Q-155`.»

Metto insieme tre numeri che il progetto ha già scritto separatamente e che nessun documento accosta.

1. **Cinque anni** di aggiornamenti di sicurezza per ciascun rilascio maggiore.
2. **Quattordici rilasci in poco più di sette mesi** sul solo relay (`05` §4.1), con l'obbligo -
   dichiarato quantificato e non generico - che «la configurazione e l'elenco delle vulnerabilità
   vanno riverificati a ogni aggiornamento di versione minore».
3. **Valutazione avviata entro il giorno successivo** al rilascio di una correzione su un componente
   utilizzato, requisito R45, e `07` §6 aggiunge: «Il termine è quello, ed è **quotidiano**: si
   soddisfa con automazione, non con una persona».
4. **Dieci-venti ore alla settimana**, `D62`, con l'aritmetica della finestra di codice che il
   committente ha già dichiarato non chiusa: «**L'aritmetica non chiude**, e questa dichiarazione è
   l'innesco della revisione fuori cadenza».

Il quarto numero è stato calcolato sulla finestra di quarantanove giorni fra `T-03` e `T-08`. **Il
periodo di supporto non è in quel calcolo affatto**, e non è una finestra: è un carico ricorrente che
comincia al primo rilascio e non finisce per cinque anni per ogni rilascio maggiore, cumulandosi.

Non è un argomento contro la dichiarazione di cinque anni, che è un minimo di legge e non una scelta.
È un argomento perché la decisione di `Q-155` **sia presa sapendo questo**, e perché la sola leva
disponibile - ridurre il numero di rilasci maggiori supportati contemporaneamente, e automatizzare
integralmente il punto 3 - venga individuata come tale prima e non durante.

### 7.6 Che cosa è retroattivamente irrecuperabile - l'elenco completo

`docs/08_compliance/09-percorso-e-calendario.md` §5 ne conta quattro, come riporta `Q-276`. Dal punto
di vista della sicurezza l'elenco è più lungo, e questo è il mio contributo principale a questo
capitolo.

| # | Capacità o attività | Perché non si recupera | Già nell'elenco delle quattro? |
|:-:|---|---|:-:|
| 1 | Tassonomia stabile degli eventi contati (`V-178` a) | La serie non si ricostruisce; rinominare fa sparire il segnale | **No** - è `Q-276` |
| 2 | Conservazione della diagnostica pari alla finestra di vigilanza (`V-178` b) | I segnali non conservati non tornano | **No** - è `Q-276` |
| 3 | Distinta dei materiali dalla prima pipeline (`D45`) | Censire a posteriori costa un multiplo; la tracciabilità non si ricostruisce | Sì |
| 4 | Congelamento degli identificativi di requisito (`D45`) | La tracciabilità del ciclo di vita non si ricostruisce | Sì |
| 5 | Controllo dei documenti (`D45`) | Ciò che nasce fuori controllo va riemesso | Sì |
| 6 | Separazione fra repository e distribuzione (`D45`) | - | Sì |
| 7 | **Copertura del registro degli accessi** | Un accesso non registrato non si registra dopo | **No** |
| 8 | **Ancoraggio del registro** per il periodo in cui manca (`TG-23`) | «Attivarlo dopo non retrodata nulla» | Dichiarato come taglio, non come irrecuperabile di catalogo |
| 9 | **Sapere quali installazioni esistono** (`RS-18`) | La coorte distribuita prima del meccanismo resta invisibile | **No** |
| 10 | **Segreti entrati nella cronologia pubblica** | «La rimozione dalla cronologia non recupera le copie già distribuite» (`03` §4) | **No** - è la proprietà che `G1` presidia, e `G1` è la riga rossa di `RS-03` |
| 11 | Riesame del rilascio, audit interno, verifica indipendente (`TG-20`) | «Un riesame di un rilascio già avvenuto non è un riesame» | Dichiarato come taglio irreversibile |
| 12 | Valutazione formativa di usabilità (`TG-22`) | «È contemporanea per definizione alle decisioni che valuta» | Dichiarato come taglio irreversibile |
| 13 | Revisione esterna del codice di sicurezza critico, **per il periodo** (`TG-21`) | Recuperabile come attività, irrecuperabile come stato del rilascio | Dichiarato come taglio irreversibile |

Le righe 1, 2, 7, 9 e 10 sono quelle che oggi non stanno in nessun elenco governato. Le prime due
hanno una questione aperta; le altre tre non hanno nulla.

---

## 8. Le tre lacune che il progetto già si dichiara, valutate come rischio di sicurezza

Non le riscopro. Sono `TG-20`, `TG-21` e `TG-22`, con la ripartizione aperta in `Q-189` - punto di
decisione **30 settembre 2026** - e la forma della dichiarazione aperta in `Q-282`. Le valuto per il
rischio di sicurezza che ciascuna produce e per il momento in cui diventa esigibile.

### 8.1 `TG-20` - audit interno, riesame del rilascio, verifica di configurazione indipendente

**Il rischio di sicurezza, in una frase.** La verifica di configurazione eseguita da chi non ha
scritto il codice è, in questo impianto, la difesa contro la classe di difetto che tutti gli altri
controlli non vedono: **la configurazione corretta per costruzione e sbagliata per intenzione**.

Concretamente. `08-viste-di-deployment.md` §8 elenca undici verifiche bloccanti all'avvio. Sono un
ottimo presidio contro l'errore. Nessuna di esse è un presidio contro l'autore: chi scrive la
verifica decide anche che cosa la verifica guarda, e le due omissioni più costose - la politica di
riga imposta al proprietario, e la rotta di uscita del componente applicativo - sono omissioni che
il codice della verifica può contenere senza che nulla lo riveli. `ADR-0007` chiede espressamente
che la prova accerti «l'**effetto**, non l'esistenza», ed è la formulazione giusta: ma chi scrive la
prova che accerta l'effetto è la stessa persona che ha scritto l'effetto.

**Quanto è grave.** Media, e non alta, per una ragione precisa e verificabile:
`03-primo-rilascio-utilizzabile.md` §5.3 dichiara che «tutti i criteri di `RU-1` restano
**verificabili da chiunque**, con la procedura descritta», e §7.3 elenca fra ciò che il progetto
consegna la «Procedura eseguibile di verifica a cura di chi installa - Con i comandi. **Eseguibile da
chiunque**; non eseguita da un secondo soggetto». Le due affermazioni sono entrambe vere ed entrambe
scritte, e la prima trasferisce a chi installa la capacità di colmare la seconda. Il rischio non è
che nessuno possa verificare: è che nessuno abbia verificato **prima** della distribuzione.

**Quando diventa esigibile.** Con la prima installazione presso un soggetto obbligato, cioè al primo
capitolato. `06_security/08` §4.3 elenca undici documenti che richiedono l'approvazione degli organi
direttivi del cliente, e la misura `ID.IM-01` - «Valutazione dell'efficacia delle misure e piano di
adeguamento» - assegna al progetto il contributo «Esiti delle verifiche automatiche, delle prove di
ripristino **e dell'audit di terza parte**». Il cliente troverà nella tabella che il progetto dovrebbe
fornire un audit di terza parte, e nel fascicolo la dichiarazione che non esiste. Questo è coerente e
sostenibile, purché sia la dichiarazione ad arrivare per prima: `Q-282` chiede esattamente con quale
forma, e ha ragione.

### 8.2 `TG-21` - revisione esterna indipendente del codice di sicurezza critico

**Questa è la più grave delle tre sul piano della sicurezza, e la sua gravità è sottodichiarata.**

Il perimetro. `D18` la prescrive per lo scambio di token nel gateway. `ADR-0015` la ribadisce: «Il
codice che realizza lo scambio è **codice di sicurezza critico**: va sottoposto a revisione esterna
indipendente e a prove di abuso dedicate, non trattato come un adattatore». `ADR-0025` ne aggiunge un
secondo: «il gateway diventa un punto in cui transita **ogni richiesta autenticata**: la sua
compromissione ha conseguenze proporzionate, e va trattato come codice di sicurezza critico».

Sommando le due decisioni: il componente non rivisto è quello che **traduce ogni identità in ingresso
in ogni autorizzazione interna**, risolve ogni token opaco, applica il registro di fiducia per tenant
e produce il contesto di tenant su cui poggia l'intero isolamento di `ADR-0007`. Un difetto lì non
espone un dato: espone la premessa di tutti gli altri controlli. È la sede naturale della minaccia
`M-11`, fuga fra tenant, che `01` §5 descrive come «Come `M-01`, con esposizione di massa e senza un
attore identificabile».

**Il rischio residuo che il taglio produce** è quindi: il confine di autorizzazione più critico
dell'impianto sarà distribuito senza che alcun occhio esterno lo abbia letto. `03-primo-rilascio-utilizzabile.md`
§5.3 lo qualifica correttamente - «recuperabile come attività, irrecuperabile come stato del rilascio
`RU-1`» - e dichiara che cosa il progetto fa comunque: la verifica empirica di `T-04` criteri 1 e 2,
con prova negativa su tutte le configurazioni supportate. E aggiunge, con onestà che va riconosciuta:
«Sono verifiche **del comportamento**, e non sostituiscono una revisione del codice: la differenza è
dichiarata e non attenuata».

**Quando diventa esigibile.** Prima di `RU-1`, non dopo, perché `D18` prescrive di eseguirla prima.
E - qui sta la parte che nessun documento collega - **la stessa lacuna pesa sulla catena di
fornitura**: `06_security/08` §5 e `Q-291` accertano che la responsabilità da prodotto ha come
esimente lo stato dell'arte, e la revisione esterna del codice di sicurezza critico è lo stato
dell'arte per un componente di quella natura. La lacuna non è solo un buco nel fascicolo: è un
elemento che, in una contestazione, sta dalla parte sbagliata.

**Una nota sul costo, perché cambia la decisione di `Q-189`.** Delle tre lacune, questa è l'unica il
cui perimetro è **piccolo e delimitabile**: non è «rivedere il codice», è rivedere un componente. Il
progetto sa già quale, sa già che è uno, e sa già che `ADR-0025` ne aggiunge un secondo contiguo. Se
la decisione del 30 settembre deve scegliere quale sottoinsieme si copre acquisendo la funzione
all'esterno, questa è quella con il miglior rapporto fra rischio evitato e spesa, e lo dico
esplicitamente perché `Q-189` chiede una ripartizione e non una lista.

### 8.3 `TG-22` - valutazione formativa di usabilità durante lo sviluppo

**Il rischio di sicurezza esiste ed è quello che si vede meno.** L'usabilità sembra estranea alla
sicurezza; in questo impianto non lo è, per tre punti puntuali.

**Primo - la stringa di autenticazione breve.** `05` §3.3 la rende obbligatoria per impostazione
predefinita, la qualifica come «controllo di rischio tracciabile» e la classifica come «privo di
mitigazione alternativa standard: non esiste un'altra strada». È un controllo di sicurezza **eseguito
da due esseri umani che confrontano un codice a voce**. La sua efficacia non è una proprietà
crittografica: è una proprietà del comportamento umano sotto le condizioni reali d'uso. `05` §3.3
elenca cinque requisiti di accessibilità, fra cui «comprensibile a una persona anziana o poco
alfabetizzata digitalmente» e «procedura definita in caso di mancata corrispondenza», e chiude:
«Un controllo di sicurezza senza procedura di fallimento è un controllo che, al primo fallimento,
viene ignorato». **Se il controllo viene ignorato, la proprietà di cifratura fino agli estremi torna
a fondarsi sulla fiducia nel server di segnalazione**, che è precisamente ciò che §3.1 dichiara
inaccettabile. La valutazione formativa è il metodo con cui si scopre se il controllo viene eseguito
o saltato; senza di essa, la sua efficacia è un'assunzione.

**Secondo - l'indicatore di registrazione in corso.** `05` §5.2 punto 4: persistente, non
occultabile, leggibile da lettore di schermo, non veicolato dal solo colore. È la misura che rende
informato il consenso su una sessione che **non è più cifrata fino agli estremi**. Se non è notato,
il consenso resta formalmente prestato e sostanzialmente disinformato.

**Terzo - l'accesso d'emergenza.** `02` §10 punto 2: «Avviso esplicito prima dell'atto … È il
**singolo elemento più efficace** nel ridurne l'uso improprio». L'efficacia dichiarata è un'efficacia
comportamentale, e non è misurata.

**Quanto è grave.** In `RU-1` è attenuata da `TG-01`, `TG-03` e `TG-06`: senza documentazione clinica
persistente e senza accesso d'emergenza, due dei tre punti non hanno oggetto. **Il primo ce l'ha**:
la verifica delle chiavi è nell'elenco di `03-primo-rilascio-utilizzabile.md` §5.4 di ciò che «non è
tagliabile», con la motivazione «Senza di essa la proprietà di cifratura fino agli estremi non è
dimostrabile all'interlocutore, e la dichiarazione pubblica corrispondente non sarebbe sostenibile».
Quindi in `RU-1` c'è un controllo di sicurezza non tagliabile, eseguito da umani, la cui efficacia
dipende da una valutazione che è stata tagliata.

**Quando diventa esigibile.** La bacheca è netta e va citata perché è di oggi: le formative «sono
anche l'unica voce del capitolo che **non attende nulla** - si conducono su prototipi, prima che il
soggetto fabbricante sia costituito, senza organismo notificato e senza interfaccia congelata». Cioè:
è la lacuna che si potrebbe chiudere per prima, e non è in coda a niente.

**Che cosa non va fatto**, e `03-primo-rilascio-utilizzabile.md` lo dice meglio di me: la verifica
manuale con tecnologia assistiva reale prescritta da `T-08` criterio 7 «**non è una valutazione
formativa e non va presentata come tale**. Chiamarla così sarebbe la forma di debito regolatorio più
costosa: una registrazione formalmente presente e sostanzialmente vuota, che è peggiore dell'assenza
perché è falsamente rassicurante». Sottoscrivo, e aggiungo che la stessa frase vale per ogni voce di
questa analisi: il fascicolo può reggere una lacuna dichiarata, non regge una registrazione vuota.

### 8.4 Sintesi

| Lacuna | Rischio di sicurezza specifico | Gravità | Esigibile da |
|---|---|:-:|---|
| `TG-20` | Configurazione e verifiche scritte e verificate dallo stesso soggetto; la classe di difetto per intenzione resta invisibile | Media | Prima installazione presso un soggetto obbligato |
| `TG-21` | Il confine di autorizzazione da cui dipendono isolamento, deleghe e revoca è distribuito senza lettura esterna; è la sede naturale di `M-11` | **Alta** | Prima di `RU-1`, per prescrizione di `D18` |
| `TG-22` | L'efficacia dei controlli di rischio eseguiti da umani - verifica delle chiavi in testa - non è misurata; è l'unica chiudibile subito | Media, alta sul solo punto della verifica delle chiavi | **Ora**: non attende nulla |

---

## 9. Che cosa propongo di decidere subito

Sono proposte, non decisioni. Ciascuna dichiara chi decide e che cosa costa non decidere.

**`DS-01` - Aprire una questione in bacheca sull'assetto di installazione nativa, prima di
qualunque lavoro.**
L'assetto non è documentato in alcun punto del repository e ne cambia la ripartizione delle
responsabilità, la distinta dei materiali, la riproducibilità e - per `RS-12` e §5.3 - la difesa
primaria del relay. Va deciso se è una **seconda distribuzione identificata** con la propria matrice
di prova o un assetto **fuori dal perimetro di ciò che sarà marcato**, dichiarato come tale. La
terza possibilità - offrirlo senza decidere quale delle due sia - produce la dichiarazione fuorviante
che `Q-290` lettera (b) individua. *Decide: committente, con `COMP` e `ARCH`. Costo del non decidere:
un assetto offerto e non qualificabile, che entra nelle risposte a capitolato prima che qualcuno lo
abbia classificato.*

**`DS-02` - Decidere ora come si saprà dove una versione è installata.**
Le tre forme sono al §7.3. Va scelta prima della pubblicazione del primo artefatto, perché ogni
artefatto pubblicato prima genera una coorte permanentemente invisibile. Se la scelta è la terza -
nessun meccanismo - va scritta come limite dichiarato e va riesaminata quando il soggetto fabbricante
esiste, perché sotto `D63` smette di essere gratuita. *Decide: committente. Costo del non decidere:
irrecuperabile per coorte, e cresce a ogni pubblicazione.*

**`DS-03` - Chiudere `Q-288` scegliendo la via (b), lo stato dichiarato di non collaudabile.**
La regola 2 del `README.md` della cartella `pipeline/` ha già istituito il meccanismo che serve -
uno stato ridotto con una data che lo fa scadere da solo - e cinque righe lo usano oggi senza che si
sia riempito di comodo. Estenderlo con `non_collaudabile` più motivo più data di riesame è coerente
con la forma già collaudata; il rischio della casella di comodo, che `Q-288` giustamente teme, è lo
stesso rischio già accettato per `bloccante_dal`. La via (c) - lasciare la tabella rossa - va
scartata per la ragione di `RS-03`: il cancello è rosso proprio sul controllo che presidia la
proprietà più irrecuperabile, e un rosso permanente lì è peggio che altrove. *Decide: `TECH` con
`SEC`. Costo del non decidere: un cancello che smette di essere letto, e con esso il presidio dei
segreti.*

**`DS-04` - Assegnare una `G` e una riga nel TSV, in segnalazione con data, a ciascuna delle dieci
attività di sicurezza mancanti di `RS-01`.**
Non «implementarle»: **dichiararle**. Il meccanismo esiste, è già usato da cinque righe che non hanno
oggetto, ed è la sola cosa che distingue un lavoro in coda da una rinuncia non dichiarata. Le date
naturali discendono da quelle già in tabella: le due suite di abuso - relay e mediatore - possono
avere una data **anteriore** alle altre, perché il relay è un componente di terze parti che esiste
già e `V-182` non lo tocca. *Decide: `SEC` propone, `TECH` colloca. Costo del non decidere: dieci
regole che, per la regola del progetto, non sono regole.*

**`DS-05` - Correggere `SECURITY.md` oggi.**
Le due frasi di `RS-02` affermano controlli inesistenti in un documento pubblico, in entrambe le
lingue. La correzione è di due righe e va fatta prima e non insieme a `DS-04`, perché un'affermazione
falsa oggi non si sana promettendo che diventerà vera. La forma corretta è quella che il progetto usa
altrove: dire che cosa esiste - verifica dei segreti a ogni proposta di modifica, distinta dei
materiali generata dalla catena, censimento dei componenti con licenza verificata - e non ciò che si
intende aggiungere. *Decide: `SEC`, con l'attenzione di `RS-04`: entrambe le lingue nello stesso
atto, e dal 12 settembre 2026 il controllo sulle avvertenze diventa bloccante.*

**`DS-06` - Legare la dichiarazione della riduzione di garanzia del registro all'evidenza, non a un
documento.**
Ogni pacchetto di esportazione del registro, ogni rapporto di verifica di integrità e ogni
attestazione portano un campo che dichiara **quali strati erano attivi** al momento della scrittura
delle righe contenute: catena, archivio a sola scrittura, privilegi disgiunti, ancoraggio. È la
risposta alla domanda «chi se ne accorge, e come»: se ne accorge chi riceve la prova, nel momento in
cui la riceve, senza dover cercare altrove. Costa un campo e va deciso prima dello schema della voce
di registro, che `T-08` colloca fra ciò che «non si migra: sbagliarlo costa una generazione».
*Decide: `ARCH` con `SEC`. Costo del non decidere: uno schema di registro che non porta il proprio
livello di garanzia, e che per cambiarlo richiede una nuova generazione.*

**`DS-07` - Un solo controllo di copertura, con due colonne.**
`RS-09` chiede un controllo che confronti i punti di ingresso dichiarati con quelli coperti da prova
negativa fra tenant; `RS-11` chiede un controllo che confronti i punti di ingresso con quelli che
producono una riga di registro. **Sono lo stesso controllo**, con due colonne invece di una, e va
progettato come uno solo prima che esistano punti di ingresso, quando il costo è quello di scriverlo
e non quello di retroadattare. *Decide: `ARCH` e `TECH`. Costo del non decidere: per esplicita
ammissione di `06` §5.3, il degrado del requisito «nel giro di pochi mesi».*

**`DS-08` - Dichiarare il termine entro cui il progetto avvisa i propri integratori di una
vulnerabilità attivamente sfruttata.**
Non è la presa in carico di chi segnala (tre giorni lavorativi) né la notifica al cliente sotto le 24
ore: è il terzo termine, quello che alimenta l'obbligo di 24 ore dell'integratore, e oggi non esiste
in alcun documento. L'11 settembre 2026 è fra sedici giorni. *Decide: `SEC` propone, committente
approva perché è un impegno. Costo del non decidere: un obbligo di terzi che il progetto rende
inadempibile, con la propria documentazione che lo dichiara.*

**`DS-09` - Decidere la forma della dichiarazione di esposizione prima del primo rilascio.**
Integrale per rilascio, con la produzione nel percorso critico del rilascio; oppure ridotta e
esplicita su che cosa non valuta. La terza, che si verifica per inerzia, è una dichiarazione che si
degrada in silenzio, ed è quella che `07` §4 definisce da sé «non utilizzabile». *Decide: committente,
perché è una scelta di capacità sotto `D54`. Costo del non decidere: la regola di blocco più severa
del capitolo sulla catena di fornitura resta inapplicabile.*

**`DS-10` - Portare al 30 settembre, con `Q-189`, la raccomandazione su quale lacuna coprire.**
Delle tre, `TG-21` è quella con il perimetro più piccolo, il rischio più concentrato e il miglior
rapporto fra rischio evitato e spesa: un componente, non un corpus. `TG-22` è quella che non attende
nulla e può cominciare oggi su prototipi. `TG-20` è quella che si può ragionevolmente accettare come
lacuna dichiarata, purché la dichiarazione arrivi prima dell'installazione e non dopo, che è
esattamente ciò che `Q-282` sta decidendo. *Decide: committente, punto di decisione già fissato.*

**`DS-11` - Correggere due righe di tabella, oggi, a costo nullo.**
La prima: `08-viste-di-deployment.md` §2.1, riga dell'archivio a serie temporali, va allineata a
quella dell'archivio del registro - «Sì, purché soddisfi …» - perché contiene dati sanitari e oggi la
sostituibilità è dichiarata senza condizioni. La seconda: la stessa tabella, riga dell'archivio del
registro, va integrata con il fatto che `ADR-0013` rende la sua scrittura bloccante, quindi un
sostituto scelto male non degrada la riservatezza ma ferma le prestazioni cliniche. *Decide: `ARCH`.
Costo del non decidere: una clausola di sostituibilità che autorizza a portare dati sanitari fuori
dal perimetro delle politiche di riga.*

**`DS-12` - Sciogliere `RS-06`: rifiuto o avviso.**
Due documenti dicono cose diverse sulla stessa verifica all'avvio. La conseguenza sostanziale è che
`V-157` è dichiarato architetturale «perché non dipende dalla diligenza di nessuno», e un avviso
reintroduce la diligenza. Se la ragione della divergenza è che nell'installazione presso il cliente
il rifiuto è impraticabile, allora va scritta la stessa distinzione motivata che la riga
sull'archivio del registro porta già. *Decide: `ARCH` con `SEC`. Costo del non decidere: una risposta
a capitolato che non si può dare in modo univoco.*

---

## 10. Tensioni e punti `[NV]`

### 10.1 Tensioni, dichiarate e non smussate

**Prima - fra la qualità della documentazione e l'assenza di presidi.** È la tensione che governa
l'intera analisi. Il corpus di sicurezza di questo progetto è, per accuratezza e per onestà, migliore
di quello di gran parte dei prodotti che una marcatura ce l'hanno. La distanza fra quel corpus e i
sedici controlli della tabella è enorme. Un lettore competente che legga l'area e poi apra
`pipeline/collocazione-dei-controlli.tsv` prova una sorpresa, e la sorpresa è il rischio: la fiducia
prodotta dalla prosa non è giustificata dai controlli, e il progetto ha una regola che dice esattamente
questo, e non se l'è ancora applicata.

**Seconda - fra `D63` e `D54`.** `D63` fa della marcatura un requisito di prodotto e trasferisce al
progetto obblighi ricorrenti: sorveglianza, vigilanza, gestione delle vulnerabilità, aggiornamenti di
sicurezza per cinque anni. `D54` e `D62` dichiarano dieci-venti ore settimanali di un contributore
unico, e il committente ha già registrato che «l'aritmetica non chiude» per una finestra di
quarantanove giorni. Gli obblighi di `D63` **non sono in quell'aritmetica**, non sono una finestra e
non finiscono. Non traggo da questo la conclusione che `D63` sia sbagliata: traggo che la decisione
di `Q-155` sul periodo di supporto e la decisione di `Q-189` sulla ripartizione delle funzioni
acquisite all'esterno sono, insieme, la vera risposta a `D63`, e vanno prese come una cosa sola.

**Terza - fra l'assetto nativo e ogni proprietà verificabile del progetto.** Riproducibilità,
promozione dell'artefatto, distinta completa, esecuzione senza privilegi, isolamento del relay,
misure compensative per la deroga sugli endpoint: sono sei proprietà, e l'assetto nativo le tocca
tutte e sei. La richiesta del committente è legittima - un'installazione senza contenitori è ciò che
molte strutture piccole sanno gestire - e non è gratuita. La tensione non si scioglie
riformulando: si scioglie decidendo se l'assetto è dentro o fuori il perimetro di ciò che sarà
marcato.

**Quarta - fra la telemetria a adesione esplicita e il dovere di sapere dove si è installati.**
`03` §6 impone la telemetria a adesione esplicita come impostazione predefinita, ed è la scelta
corretta per la minimizzazione. Sotto `D63` il fabbricante deve sapere dove il proprio prodotto è in
uso, per raggiungerlo con un aggiornamento e per sorvegliarlo. Le due esigenze sono in tensione
reale, e la soluzione plausibile - registrare l'organizzazione e la versione, mai l'esercizio - va
progettata come tale invece di emergere come un'eccezione alla regola di minimizzazione.

**Quinta - fra l'apertura del codice e l'autoapprovazione.** `01` §3.3 stabilisce che l'apertura è
«neutra rispetto alla sicurezza e positiva rispetto alla verificabilità, **a condizione che la
sicurezza non dipenda in alcun punto dalla segretezza del progetto**». La condizione è rispettata. Ma
con la firma a identità effimera la radice di fiducia è la definizione di pipeline, e sotto `D54` una
modifica a quella definizione è autoapprovata (`Q-283`). L'apertura del codice rende quella
definizione leggibile a chiunque, il che è un bene; non produce nessuno che la legga, il che sotto
`D54` è la condizione reale. La difesa dichiarata è la riproducibilità, ed è ridotta a un artefatto
da `TG-14`.

**Sesta - fra la severità di questa analisi e ciò che `V-182` consente oggi.** Ho contato come
mancante ciò che non ha una riga con una data, non ciò che non è implementato. È il criterio che il
progetto ha scelto per sé, e l'ho applicato senza sconti. Chi ritenesse il criterio troppo severo
deve però spiegare perché l'accessibilità automatica e le regole di dipendenza hanno una data e le
prove negative fra tenant no.

### 10.2 Punti `[NV]` di questa analisi

| `[NV]` | Che cosa non è verificato | A chi va chiesto |
|---|---|---|
| 1 | Se un'installazione nativa assemblata presso il cliente configuri una modifica del dispositivo, una distribuzione autonoma o un uso fuori dalla destinazione dichiarata (§5.5) | `COMP` e consulente regolatorio, **prima** di offrire l'assetto |
| 2 | Se la capacità dell'interessato di conoscere gli accessi ai propri dati (`04` §8 punto 3) sia dentro o fuori il perimetro di `RU-1`: non l'ho trovata né fra i tagli né fra ciò che non è tagliabile | `ROAD` |
| 3 | Se l'archivio del registro debba essere un motore diverso da quello applicativo o possa esserne lo stesso con privilegi disgiunti. **Aperto da entrambi i lati**: `08-viste-di-deployment.md` §9 lo rinvia a `SEC`, `ADR-0013` lo rinvia a `SEC`, e `SEC` non lo ha chiuso | `SEC`, e la risposta cambia la forza della garanzia dichiarabile |
| 4 | Valore dell'intervallo e della soglia di volume dell'ancoraggio (`Q-158`), che `ADR-0013` rinvia a `SEC` e che resta aperto anche se `TG-23` lo rende ininfluente per `RU-1` | `SEC` |
| 5 | Che cosa si scrive in `actor.sub` del registro quando l'attore è un processo che attraversa i tenant (§3.2) | `ARCH`, `SEC` |
| 6 | Termine di conservazione delle righe di attestazione della cancellazione a scadenza, che sopravvivono alla propria generazione e non possono seguire i 24 mesi di `V-152` (§4.5) | `SEC`, `COMP` |
| 7 | Se `G11` sia stato collegato a un flusso dopo le 16:23 del 26 agosto 2026 (§2.5): il piano `G11-regola-di-riservatezza.md` è di oggi e il lavoro potrebbe essere in corso | `TECH` |
| 8 | Se i due capitoli `06_security/00` e `06_security/10`, in modifica al momento della lettura, portino ancora le formulazioni citate in questa analisi | Agente in corso su quell'area |
| 9 | Stato dei capitoli `docs/08_compliance/01`…`09`, non letti: le affermazioni regolatorie di questa analisi provengono da `06_security/08` e dalla bacheca | `COMP` |
| 10 | Quale sia oggi lo stato del passo 3 della sequenza `D63`, che tocca `06_security/00:170` e `06_security/10:125` e che questa analisi ha letto in transito | `ORCH` |

### 10.3 Una nota finale sul metodo

Ho evitato di proporre misure nuove dove i documenti ne prescrivono già una. In quasi tutti i punti di
questa analisi, la misura giusta era **già scritta** nell'area di sicurezza, e ciò che mancava era la
riga che la fa esistere. Questo è, credo, il ritrovamento più importante e il più incoraggiante:
il divario non è di progetto, è di presidio, e il presidio ha già un formato, una tabella e una regola
che lo governa. Colmare il divario non richiede di riprogettare nulla. Richiede sedici righe in più in
un file di valori separati da tabulazione, ciascuna con una data che scade da sola.

Il costo è basso oggi. Non lo sarà quando ci sarà del codice a cui applicarle.
