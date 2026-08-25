# log-AVV — Riscrittura delle avvertenze pubbliche dopo `D57` e `D58`

**Agente**: AVV. **Data**: 25 agosto 2026.
**Perimetro assegnato**: quattro artefatti pubblici di radice —
`NOT-A-MEDICAL-DEVICE.md`, `DISTRIBUTION-POLICY.md`, il richiamo `> [!IMPORTANT]` di
`README.md` nelle due lingue, le due `longDescription` di `publiccode.yml`.
**Fuori perimetro e non toccati**: i capitoli di `docs/08_compliance/`, la bacheca dei vincoli,
ogni altra sezione del `README`.

**Principio applicato, e unica lente di tutta la riscrittura**: cambia **chi** è il destinatario
del percorso di certificazione; **non cambia quanto il prodotto è pronto oggi**. Nessuna
avvertenza sullo stato attuale è stata attenuata, abbreviata o spostata più in basso nella
pagina.

---

## 1. Deliverable

| File | Che cosa è cambiato |
|---|---|
| `NOT-A-MEDICAL-DEVICE.md` | Riscritto il § «Cosa contiene questo repository» (chiusura del paragrafo); riscritta la chiusura del § «Cosa deve fare chi lo mette in servizio»; **aggiunto il § «Il percorso di certificazione: chi lo intraprende, e che cosa non cambia»**, in coda alle avvertenze e non sopra di esse; aggiunta una frase di chiusura al § sull'esclusione di responsabilità. Destinazione d'uso e limiti d'uso **intatti, parola per parola** |
| `DISTRIBUTION-POLICY.md` | Numerate le sezioni per poterle richiamare; riscritta la chiusura del § 1; aggiunto al § 2 il capoverso «l'intenzione non trasferisce nulla»; **aggiunto il § 3 «I due artefatti»**, con tabella comparativa e tre affermazioni non attenuabili; aggiunta una voce al § 4 sugli identificativi che non si sovrappongono; riscritta la richiesta 1 del § 5; aggiunto un capoverso al richiamo di apertura |
| `README.md` | **Solo** i due blocchi `> [!IMPORTANT]`. Nessun'altra riga toccata: nessuna frase del resto del README dipendeva dalla figura del terzo (verificato con lettura integrale) |
| `publiccode.yml` | **Solo** l'ultimo capoverso delle due `longDescription`, cioè esattamente il punto in cui si diceva che il progetto «non percorre il percorso al posto di chi lo intraprende». Nessun'altra chiave modificata: `conforme`, `piattaforme` e i commenti che le motivano restano `false` e invariati |

---

## 2. Le quattro affermazioni che dovevano restare, e dove sono finite

| # | Affermazione | Dove sta ora, e con quale evidenza |
|---|---|---|
| **1** | **Oggi nessuna marcatura CE, nessuna dichiarazione di conformità** | Prima frase sostantiva di ogni documento. `NOT-A-MEDICAL-DEVICE.md` § 1 (rafforzata: aggiunti «nessuna procedura di valutazione della conformità è stata conclusa» e «il fabbricante non è ancora costituito», e la qualifica esplicita di **stato di fatto**); `DISTRIBUTION-POLICY.md` § 1; prima riga di entrambi i richiami del `README`; primo periodo del capoverso finale di entrambe le `longDescription` |
| **2** | **Chi installa assume gli obblighi; l'intenzione non trasferisce nulla** | I quattro obblighi di `NOT-A-MEDICAL-DEVICE.md` sono **testualmente invariati** e restano nella stessa posizione. Il varco è chiuso in quattro punti indipendenti: `NOT-A-MEDICAL-DEVICE.md` § «Il percorso di certificazione» punto 1 — che nomina il fraintendimento com'è formulato davvero («stanno certificando» → «allora posso usarlo») e lo dichiara sbagliato; `DISTRIBUTION-POLICY.md` § 2, capoverso di chiusura; `README`, secondo capoverso del richiamo; `publiccode.yml`, «l'intenzione non trasferisce alcun obbligo a chi installa oggi una versione non certificata» |
| **3** | **Nessuna data** (`V-171`) | Nessun documento contiene una data, una finestra, un «entro», un anno o un ordine temporale relativo. Il divieto è inoltre **enunciato** in `NOT-A-MEDICAL-DEVICE.md` § «Il percorso di certificazione» punto 2, con il fondamento (art. 2, punto 12, e art. 7 del Regolamento (UE) 2017/745) e la distinzione fra intenzione e promessa datata; ripetuto in forma breve nel `README` e in `publiccode.yml` |
| **4** | **Responsabilità verso il danneggiato non escludibile** | § finale di `NOT-A-MEDICAL-DEVICE.md`, **invariato** nel testo esistente (Direttiva (UE) 2024/2853, art. 15 e art. 10) e in coda alla stessa posizione di prima. Aggiunta una sola frase: l'intenzione di certificare non copre nessuno, né il progetto né chi installa |

---

## 3. Conservato intatto, e perché

- **Destinazione d'uso e limiti d'uso** di `NOT-A-MEDICAL-DEVICE.md`: non una parola. Sono il
  documento da cui dipende la qualificazione (`D29`, `D46`, `D55`), la formulazione del
  telemonitoraggio è **congelata** e ogni ritocco sarebbe una modifica non controllata della
  destinazione d'uso.
- **I quattro obblighi di chi mette in servizio** e **i cinque obblighi di chi distribuisce**:
  testo e ordine invariati. Sono le avvertenze che `D58` vieta espressamente di attenuare.
- **La tabella «che cos'è / che cosa non è»** di `DISTRIBUTION-POLICY.md`: invariata. Descrive
  ciò che il progetto pubblica **oggi**, e oggi non è cambiato nulla.
- **«Deve verificare il codice»**, in tutti i luoghi in cui compariva, con la stessa
  qualificazione («non è una formula di stile»).
- **Il carattere fattuale e non perpetuo** della posizione del progetto: conservato e reso più
  preciso, perché ora è nota anche la direzione del cambiamento. È stata mantenuta integralmente
  la seconda condizione, indipendente dal percorso di certificazione: la qualificazione attuale
  del repository dipende dal fatto che non sia reso disponibile un prodotto pronto all'uso nel
  quadro di un'attività commerciale (soglia 3 di `01-inquadramento-normativo.md` § 12).
- **La regola di riscrittura preventiva**: il documento va riscritto *prima* del cambiamento,
  non dopo.
- **`R0`**: nessun documento nomina aziende, prodotti, marchi o domini. Il fabbricante è sempre
  «il soggetto fabbricante, ancora da costituire»; gli integratori restano categorie generiche.

---

## 4. Il punto delicato di `DISTRIBUTION-POLICY.md`: i due artefatti

Trattato al **§ 3**, con richiamo in apertura del documento perché non dipenda dalla lettura
sequenziale. Tre affermazioni, formulate perché non sopravviva una lettura alternativa:

1. il repository resta aperto e resta ciò che è — la certificazione di una distribuzione non lo
   chiude, non ne cambia licenza né natura;
2. **chi prende il codice dal repository e lo installa non installa un dispositivo certificato**,
   oggi come il giorno in cui una distribuzione certificata esisterà — una marcatura copre
   l'artefatto esatto valutato nella versione esatta valutata, e non si estende ai sorgenti né a
   costruzioni altrui né a versioni successive non valutate;
3. **ricompilare i sorgenti non riproduce il dispositivo** — a parità di codice, ciò che rende un
   artefatto *quel* dispositivo è la catena di costruzione controllata, il rilascio sotto il
   sistema di gestione della qualità del fabbricante e l'identificazione che ne consegue; chi
   costruisce per proprio conto è fabbricante del proprio artefatto.

La terza affermazione è nuova rispetto a `D17` e ne è la conseguenza tecnica: senza di essa la
distinzione fra i due artefatti si legge come una formalità di denominazione, e la riproducibilità
della costruzione — che il progetto persegue per altre ragioni — diventerebbe l'argomento con cui
qualcuno sostiene di aver ricostruito il dispositivo. Chiusa anche la porta laterale al § 4, con
la regola che gli identificativi dei due artefatti non si sovrappongono.

---

## 5. Punti in cui la nuova formulazione mi è sembrata rischiosa

| # | Rischio | Che cosa ho fatto | Che cosa resta da decidere |
|---|---|---|---|
| **1** | **Dichiarare l'intenzione è essa stessa materiale regolatorio.** L'art. 2, punto 12, ricava la destinazione d'uso anche dal materiale pubblicato: «il progetto intende costituire il fabbricante» avvicina il progetto alla figura del fabbricante *prima* che il soggetto esista, e si somma a una dichiarazione di destinazione d'uso già pubblicata sotto il nome del progetto (tensione già dichiarata in `02-qualificazione-e-classificazione.md` § 5) | Il verbo è sempre **«intende»**, mai «certificherà»; l'assenza del soggetto è ripetuta ogni volta che l'intenzione compare, nella stessa frase; nessuna data, nessuna sequenza, nessun ordine temporale | Se la questione `Q-170` (forma di pubblicazione della traccia di destinazione d'uso) vada rivalutata alla luce di `D58`: l'argomento «la traccia è per un terzo» **non è più disponibile**, perché il terzo siamo noi. → **ORCH / Committente** |
| **2** | **Ho perso una frase forte.** `NOT-A-MEDICAL-DEVICE.md` diceva «il progetto **non appone** la marcatura CE e **non sottoscrive** dichiarazioni di conformità» come posizione permanente. `D58` la rende falsa come posizione e vera solo come stato di fatto odierno | Sostituita con lo stato di fatto, rafforzato (procedura non conclusa, soggetto non costituito). La forza persa è recuperata dove è ancora vera senza riserve: `DISTRIBUTION-POLICY.md` § 3, riga «Che cosa può portare» → **repository: nessuna marcatura, mai** | Nulla, ma è il punto da rileggere per primo se qualcuno segnala un'attenuazione |
| **3** | **`V-06` è ora disallineato.** In `05_BACHECA_INTERAGENTI.md` recita ancora «Il progetto non appone marcatura CE. Il materiale regolatorio è manuale per chi certifica». `D58` lo emenda espressamente. Non l'ho toccato: la bacheca è fuori dal mio perimetro | Segnalato qui | Riformulazione di `V-06` da parte di `ORCH`. Finché resta com'è, ogni agente che lo legge riprodurrà la figura del terzo e riaprirà la divergenza con le avvertenze pubbliche |
| **4** | **Divergenza fra avvertenze pubbliche e area conformità.** I capitoli 00–04 sono ancora scritti sulla figura del terzo, e in un punto in modo esplicito: `01-inquadramento-normativo.md` § 13 chiude con «una data manca deliberatamente: quella della marcatura CE. **Non è del progetto** (`D49`), dipende da un soggetto terzo». Anche `02` § 5.1 e § 5 attribuiscono la distribuzione identificata a «chi certifica», e la tabella `V-171` del § 11 ammette la formula «certificabile da chi intende certificarlo» | Fuori perimetro, non toccato | Riscrittura dei capitoli 00, 02, 03, 04 e del § 13 di `01`, già prevista da `D58`. **La riga del § 13 va corretta con priorità**: contraddice frontalmente i quattro documenti pubblici, e la contraddizione è verificabile da chiunque legga entrambi. Da notare che la motivazione dell'omissione della data **resta valida e va conservata** — cambia solo la ragione: non «non è nostra», ma «l'intenzione non è una promessa datata». → `COMP-A`, `COMP-B` |
| **5** | **Il richiamo del `README` è cresciuto da un capoverso a tre.** Un'avvertenza più lunga è un'avvertenza meno letta, ed è l'unico punto in cui l'aggiunta poteva diluire | Ordine imposto: la negazione resta la **prima frase in grassetto**; l'intenzione arriva dopo, in capoverso separato e subordinato, e non contiene alcuna affermazione positiva sul prodotto; la chiusura resta l'invito a leggere la dichiarazione di destinazione d'uso, com'era | Se dopo revisione il richiamo risulti troppo lungo, il capoverso comprimibile è **soltanto** il terzo (rinvio alla politica di distribuzione), mai il secondo |
| **6** | **Parità linguistica.** Una divergenza fra italiano e inglese in un documento che dichiara destinazione d'uso e limiti d'uso è un difetto regolatorio | Riscrittura proposizione per proposizione, non traduzione libera: ogni frase aggiunta esiste in entrambe le versioni con lo stesso contenuto e la stessa posizione. Inglese britannico. Riferimenti normativi citati nella forma originale | Resta **un'asimmetria preesistente non introdotta da me**: nel § 1 la versione italiana rinvia anche a `docs/10_fondamenti/15-regolatorio-da-zero.md`, l'inglese no. È un collegamento, non una proposizione; l'ho lasciata invariata per non toccare ciò che non era in perimetro. Da sanare quando l'area guida produce l'equivalente inglese |
| **7** | **Àncore interne e schema del catalogo.** Ho introdotto due rinvii interni per àncora (`#il-percorso-di-certificazione…`, `#i-due-artefatti…`) e allungato le due `longDescription` | Le àncore sono costruite dalla forma canonica dei titoli e valgono su GitHub; i quattro file di radice non sono pagine Docusaurus | `[NV]` — non ho verificato il limite di lunghezza di `longDescription` nello schema `publiccode.yml` 0.4: il testo resta nell'ordine di grandezza precedente, ma la verifica sullo schema non è stata fatta |

---

## 6. Fonti citate nei documenti, e loro stato

| Fonte | Dove | Stato |
|---|---|---|
| Regolamento (UE) 2017/745 — ruolo di fabbricante | `NOT-A-MEDICAL-DEVICE.md`, `README` (due lingue) | Citato **senza numero di articolo**, deliberatamente: la definizione di fabbricante è all'art. 2, ma il numero del punto non è stato verificato sul testo consolidato e un'avvertenza pubblica non è il luogo di un `[NV]` |
| Regolamento (UE) 2017/745, art. 2, punto 12 (destinazione d'uso ricavata dal materiale pubblicato) e art. 7 (dichiarazioni fuorvianti) | `NOT-A-MEDICAL-DEVICE.md` § «Il percorso di certificazione», punto 2 | Già in uso nel progetto con questi numeri (`01-inquadramento-normativo.md` § 11, `02` § 5). Nessun numero nuovo introdotto |
| Direttiva (UE) 2024/2853, art. 15 e art. 10 | `NOT-A-MEDICAL-DEVICE.md`, § finale | **Testo preesistente non modificato**, coerente con `D28` e `D58` punto 4 |

**Nessun articolo, data o termine è stato inventato.** Nessuna fonte nuova è stata introdotta:
tutte le citazioni erano già presenti nel materiale del progetto o nei documenti riscritti.
