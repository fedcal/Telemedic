# Runbook - traduzione integrale della documentazione in inglese

> **Decisione di riferimento**: **D56** (traduzione assistita).
> **Destinazione**: `website/i18n/en/docusaurus-plugin-content-docs/current/<area>/<stesso nome file>`.
> **Fonte**: `docs/<area>/<file>.md`. **Gli originali non si toccano mai.**
> **Glossario vincolante**: `.telemedic/context/log-TRAD-1.md` §3 (rese sistematiche) e §7
> (asimmetrie fra le due lingue), più `.telemedic/context/GLOSSARIO-TRADUZIONE-EN.md` per le
> rese aggiunte dalle ondate successive.

Questo file esiste perché la traduzione è un lavoro ricorrente su oltre centoquaranta documenti,
distribuito su più agenti e più sessioni. Senza un mandato scritto ogni agente reinventa le rese,
e su un sito bilingue una divergenza terminologica fra aree è l'equivalente inglese del problema
Q-06. Chi traduce legge questo file **prima** di aprire il sorgente, e lo aggiorna **dopo**.

---

## 1. Stato della traduzione

La misura autoritativa è il confronto fra il numero di `.md` in `docs/<area>/` e quello in
`website/i18n/en/docusaurus-plugin-content-docs/current/<area>/`. Si ottiene con:

```bash
for a in $(ls docs); do
  it=$(ls docs/$a/*.md 2>/dev/null | wc -l)
  en=$(ls website/i18n/en/docusaurus-plugin-content-docs/current/$a/*.md 2>/dev/null | wc -l)
  echo "$a  IT=$it  EN=$en"
done
```

Un file può essere presente e **incompleto**: la traduzione interrotta a metà porta in coda un
marcatore `<!--TRADn-CONT-->`. Si trovano tutti con:

```bash
grep -rn "CONT-->" website/i18n/en/
```

Un file inglese privo di marcatore e con un conteggio parole inferiore di oltre il 15% rispetto
all'originale va guardato: è probabile che sia stato riassunto invece che tradotto.

---

## 2. Protocollo di continuazione

Un documento della guida dei fondamenti può superare le trentamila parole: nessun agente lo chiude
in una volta. La regola è:

1. Si traduce **in ordine**, dalla prima sezione non ancora resa.
2. Ci si ferma **solo a un confine di sezione di livello `##`**. Una sezione a metà non si consegna
   mai: il lettore di una sezione troncata non ha modo di sapere che manca qualcosa.
3. In coda si scrive il marcatore `<!--TRADn-CONT-->` su una riga propria.
4. Nel rapporto si dichiara **l'ultima sezione tradotta e la prima non tradotta**, per numero e
   titolo. È l'unico dato che permette all'agente successivo di riprendere senza rileggere tutto.
5. L'agente che riprende **rimuove il marcatore** e lo sostituisce con la traduzione. Un file
   consegnato completo non contiene marcatori.

Prima di riprendere, l'agente successivo legge la parte già tradotta: deve proseguire in modo
indistinguibile da chi ha scritto la prima parte, per registro, lessico e ampiezza.

---

## 3. Regole di traduzione - vincolanti

**Lingua.** Inglese britannico (`organisation`, `recognised`, `behaviour`, `minimisation`,
`authorisation`), coerente con `htmlLang: en-GB` nella configurazione del sito.

**Integralità.** Traduzione riga per riga. Nessun paragrafo omesso, accorpato, riassunto o
aggiunto. L'ampiezza della resa inglese è equivalente all'originale, con scarto entro il ±5%, in
genere leggermente in difetto perché l'inglese perde le perifrasi con «di» e «che». **Non è un
riassunto: è una traduzione.** È il modo più comune in cui questo lavoro fallisce.

**Registro.** Prosa italiana piena → prosa inglese piena. Il progetto rifiuta gli elenchi puntati
incollati: se l'originale è prosa, la traduzione è prosa.

**Frontmatter.** `title` e `description` tradotti; `sidebar_position` **mai toccato**. Un valore
che contiene due punti seguiti da spazio **va quotato**, altrimenti la costruzione fallisce con un
errore di indentazione che non ha nulla a che vedere con l'indentazione. Le virgolette già
presenti nell'originale si mantengono. L'em dash non richiede quotatura.

**Identificativi mai tradotti.** `V-…`, `Q-…`, `D…`, `P-…`, `R-…`, `M-…`, `C-…`, `ITI-…`, `ABSC …`,
`GV.*`/`ID.*`/`PR.*`/`DE.*`/`RS.*`/`RC.*`, codici LOINC, codici e segmenti HL7 v2, nomi di risorse
e profili FHIR, URI, RFC, nomi di guide di implementazione HL7 Italia (`IT-Core` e i nomi delle
quattro guide sulle prestazioni). Tradurre il nome di una guida pubblicata produce un riferimento
non risolvibile.

**`[NV]` resta `[NV]`**, con la nota tradotta. Lo stesso per le altre marcature di verificabilità.

**Estremi normativi italiani.** Non si traducono mai. Alla **prima occorrenza per documento** segue
una glossa inglese fra parentesi, nelle forme fissate in `log-TRAD-1.md §3.4`. Chi riprende un file
a metà valuta la prima occorrenza **sull'intero documento**: se il termine compare già nella parte
tradotta, la glossa non si ripete.

**Collegamenti relativi invariati** (`./…`, `../…`): si traduce il testo di ancoraggio, mai il
percorso. Docusaurus risolve nella locale corretta e ricade sull'italiano finché il bersaglio non è
tradotto. È il comportamento atteso, non un errore.

**Mermaid.** Si traducono **solo** le etichette destinate a un lettore. Sintassi, frecce,
`subgraph` e id dei nodi restano intatti. Negli `stateDiagram-v2` gli id di stato in italiano sono
anche l'etichetta visualizzata e vanno tradotti; gli id che sono **valori di codice di uno
standard** non si traducono mai.

**Blocchi di codice.** JSON, HTTP, YAML, HL7 v2, DICOM e i loro identificatori restano invariati.
Si traducono solo le stringhe destinate a un lettore umano: `title`/`detail`/`message` nei corpi
`problem+json`, `text` negli `OperationOutcome`, `display` in una `Coding` d'esempio,
`summary`/`description` nei frammenti OpenAPI, i commenti, i segnaposto `<…>`. **Un payload che
trascrive un messaggio reale su rete italiana non si traduce**: tradurlo falsificherebbe l'esempio.

**Tabelle.** Intestazioni e contenuto tradotti; l'allineamento delle colonne (`:-:`, `---:`) si
preserva ovunque compaia.

**Parole chiave normative.** `SHALL`, `SHOULD`, `MUST NOT`, `MAY` in maiuscolo e non tradotte, come
prescrive `docs/04_protocols/00-indice.md`.

**Citazioni.** Le citazioni di specifiche inglesi restano verbatim. Le citazioni di fonti italiane
si rendono in inglese con la stessa marcatura dell'originale.

---

## 4. I quattro vincoli di progetto che la traduzione può violare

Sono i punti in cui una traduzione «utile» fa danno. Vanno riletti prima di ogni file.

**R0 - nessun dato reale di paziente.** I dati d'esempio restano quelli sintetici dell'originale,
invariati. Non si introducono nomi, identificativi o valori nuovi.

**Le perifrasi non si risolvono.** Dove l'italiano usa una perifrasi descrittiva al posto di un
nome proprio di azienda, marchio, prodotto o terminologia sotto licenza - «il prodotto di
federazione», «i tre motori di riferimento», «il servizio esterno di terminologia», «la
terminologia clinica internazionale» - la traduzione **mantiene la perifrasi**, anche dove il
referente è ovvio a un lettore tecnico. Dove l'originale è deliberatamente reticente su
identificativi che coincidono con marchi, **la traduzione conserva la reticenza**.

**Nessuna soglia clinica alterata.** I valori numerici si riportano identici, unità comprese. **Le
unità di misura non si convertono mai.** Dove l'originale dichiara che una soglia è configurazione
per assistito e non costante, la traduzione lo dichiara con la stessa forza.

**Nessuna formula di conformità rafforzata.** Se l'italiano scrive che qualcosa è oneroso, incerto
o non dimostrato, l'inglese lo scrive con la stessa durezza. La traduzione non smussa le tensioni:
il progetto le dichiara deliberatamente.

---

## 5. Ambiguità e difetti dell'originale

**Le ambiguità si conservano, non si sciolgono.** Se l'italiano è ambiguo, la resa inglese deve
esserlo altrettanto. Sciogliere un'ambiguità significa decidere al posto dell'autore.

**I difetti si riproducono fedelmente e si segnalano, non si correggono.** Correggere in
traduzione crea una divergenza silenziosa fra italiano e inglese, che è peggio del difetto.
Tradurre è la revisione più severa che un testo riceva: i difetti trovati vanno nel rapporto con
file, punto preciso e bersaglio corretto, perché una sessione successiva li chiuda **sull'italiano
e sull'inglese insieme**.

Le categorie che ricorrono, dalla prima ondata: rinvii incrociati a paragrafi sbagliati,
riferimenti a identificativi di proposta sbagliati, enumerazioni che annunciano un numero e ne
elencano un altro, incoerenze terminologiche interne, refusi di elisione.

---

## 6. Che cosa un agente di traduzione non fa

- Non tocca alcun file sotto `docs/`. Il lavoro è **interamente additivo** su
  `website/i18n/en/docusaurus-plugin-content-docs/current/`.
- Non traduce `code.json`, `current.json`, `navbar.json`, `footer.json`: sono già tradotti e vanno
  **usati come fonte** per le rese già fissate, non riscritti.
- Non crea `_category_.json`: le etichette di categoria della sidebar sono in `current.json`.
- Non esegue commit.

---

## 7. Verifica prima del commit - Definition of Done

1. Nessun marcatore residuo: `grep -rn "CONT-->" website/i18n/en/` non restituisce nulla, oppure
   i marcatori restanti sono dichiarati e attesi.
2. Rapporto di ampiezza plausibile su ogni file toccato: `wc -w` inglese entro il ±15% dell'italiano.
3. Nessun `sidebar_position` alterato: `git diff` sul frontmatter non mostra quel campo.
4. **La costruzione passa**: `cd website && npm run build`. È il gate che nessuna ondata può saltare
   - il frontmatter non quotato e le etichette Mermaid riscritte sono i due punti che rompono.
5. Le nuove rese terminologiche sono state riversate in `GLOSSARIO-TRADUZIONE-EN.md`.
6. I difetti segnalati dagli agenti sono stati riportati in `02_QUESTIONI_APERTE.md` o chiusi.

---

## 8. Trappole già incontrate

- **Non aggiungere `"type": "module"`** a `website/package.json`: i file generati da Docusaurus
  verrebbero trattati come ESM e il caricamento differito si rompe con `require.resolveWeak is not
  a function`, errore che non indica affatto la causa reale.
- **Frontmatter con due punti seguiti da spazio non quotato**: la costruzione fallisce con un errore
  di indentazione fuorviante.
- **Rinvii ai documenti alla radice del repository** (`CONTRIBUTING.md`, `NOT-A-MEDICAL-DEVICE.md`):
  devono essere URL assoluti verso GitHub. Un percorso relativo che esce da `docs/` funziona su
  GitHub ma non sul sito.
- **Ancore in entrata verso file già tradotti - metodo di ricalcolo.** Quando si traduce un file,
  si traducono i suoi titoli e quindi i suoi *slug*. I collegamenti che **altri file** puntano a
  quelle ancore (`…/12-crittografia-e-sicurezza.md#5-funzioni-di-hash`) restano sullo slug italiano
  e si rompono. Il fenomeno è invisibile finché il bersaglio non è tradotto, e si manifesta **solo
  nella costruzione inglese**: una pagina non ancora tradotta viene servita da Docusaurus nella
  locale inglese con il contenuto italiano, e da lì punta a un'ancora che nel frattempo è diventata
  inglese.

  **Procedura di ricalcolo**: Un'àncora è generata da Docusaurus dalla stringa del titolo di
  sezione. Per ricalcolarla quando il titolo è tradotto:

  1. Identificare il documento bersaglio **nel corpus inglese** (non nell'italiano). Ad esempio:
     se il collegamento punta a `../02_architecture/03-modello-di-dominio.md#3-la-separazione…`,
     aprire `website/i18n/en/docusaurus-plugin-content-docs/current/02_architecture/03-modello-di-dominio.md`.
  2. Elencare i titoli di sezione con `grep -n '^#' <file>` - non leggere il file per intero.
  3. Identificare il titolo inglese che corrisponde al concetto dell'àncora italiana.
  4. Ricavare l'àncora applicando la regola di Docusaurus: minuscolo, spazi e punteggiatura in
     trattini, accenti conservati, trattini multipli conservati dove il titolo ha un separatore
     doppio. Esempio: `## 3. The separation between clinical performance and media session`
     genera `#3-the-separation-between-clinical-performance-and-media-session`.
  5. Sostituire **solo la parte dopo `#`** nel collegamento.
  6. Se il titolo bersaglio non esiste nel documento inglese (è stato rinumerato o rimosso), non
     inventare un'àncora: segnalare il collegamento come non risolvibile nel rapporto.

  **Non tradurre l'àncora a mente.** Il titolo inglese potrebbe non essere la traduzione letterale
  che immagini. Un'àncora inventata è peggio di un'àncora rotta: quella rotta la vede la costruzione,
  quella inventata no.

  Regola: **chi traduce un file aggiorna anche le ancore in entrata provenienti dai file
  già tradotti**, e chi traduce un file che punta a un bersaglio già tradotto **usa lo slug
  inglese**, non quello italiano. Il gate `npm run build` le elenca tutte: vanno azzerate prima del
  commit.
- **Un agente che riassume invece di tradurre** non lo dichiara nel rapporto. Il controllo di
  ampiezza del punto 7.2 è l'unico modo per accorgersene.

---

## 9. Passate di correzione - come si organizzano

Aggiunto dopo la tornata del 26 agosto 2026, in cui cinque agenti hanno chiuso una cinquantina
di voci del registro dei difetti.

### 9.1 Si partiziona per file, mai per famiglia di difetto

Sembra naturale dare a un agente «tutti i rinvii sbagliati» e a un altro «tutte le enumerazioni».
**È l'errore da non fare**: due agenti finiscono sullo stesso documento e si sovrascrivono a
vicenda, e la collisione non produce un errore - produce una modifica persa, che nessuno vede.

Si partiziona **per file**, in modo che nessun documento appartenga a due mandati. È già successo
sui file di contesto condivisi (`W-1`, numerazione dei blocchi del glossario) e la lezione vale a
maggior ragione sui documenti pubblicati.

Corollario: i file di contesto condivisi - `REGISTRO-DIFETTI-TRADUZIONE.md`,
`GLOSSARIO-TRADUZIONE-EN.md`, `05_BACHECA_INTERAGENTI.md` - **non si danno in scrittura a un
agente di una passata parallela**. Li consolida chi orchestra, in un passaggio unico, quando tutti
sono rientrati. Nel mandato va scritto esplicitamente.

### 9.2 Ogni voce si verifica sul testo prima di applicarla

Il registro dei difetti è a sua volta un documento fallibile. Nella tornata citata **nove voci su
circa cinquanta** erano sbagliate: una poggiava su una premessa falsa e applicarla avrebbe
*introdotto* l'incoerenza che dichiarava di correggere; sette avevano perimetro incompleto; due
davano riferimenti di sezione in cui il termine non compariva.

Nel mandato di ogni agente va quindi chiesto, in forma esplicita:

1. **verificare la voce sul testo bersaglio** prima di correggere - aprire le sezioni citate,
   contare gli elementi, cercare le altre occorrenze;
2. **riferire gli errori trovati nel registro stesso**, in una sezione dedicata del rapporto;
3. **dire anche quando una voce risulta corretta** dopo verifica, perché conferma il metodo.

Chi orchestra consolida poi quegli errori nel registro, così la passata successiva non li ritrova.

### 9.3 Il perimetro dichiarato è quasi sempre più stretto di quello reale

Una correzione terminologica segnalata su un file ricorre quasi sempre altrove. Prima di chiudere
una voce, `grep` sull'intero corpus - `docs/` **e** `website/i18n/en/` - per la forma scartata, e
verifica che il risultato sia vuoto. Le uniche eccezioni ammesse vanno dichiarate con la ragione:
un omonimo, un referente diverso, una resa inglese che è corretta in inglese.

### 9.4 Le correzioni aprono conseguenze fuori dal proprio perimetro

Un agente che lavora su un file non può chiudere gli effetti che la sua correzione produce
altrove. Deve **segnalarli**, e chi orchestra deve prevedere una **passata di coda** dedicata.
Esempi reali della tornata: unificare un termine in un modulo ha lasciato un'altra area
disallineata; rinominare un titolo di sezione ha fatto divergere il nome di una procedura dal nome
del criterio di traguardo che la richiama.

Corollario sui titoli: **prima di cambiare un titolo di sezione**, `grep` per verificare che
nessun file punti alla sua ancora. Se qualcuno la punta, o si aggiornano i rinvii nello stesso
passaggio, o non si cambia il titolo.

### 9.5 Non tutte le correzioni hanno un versante inglese

Alcuni difetti italiani spariscono necessariamente in traduzione: un'elisione (`alla impronta` →
`all'impronta`), una concordanza, due sinonimi italiani che collassano in un'unica parola inglese.
In quei casi **non si forza una modifica inglese fittizia** per far tacere il controllo di
divergenza: si dichiara la perdita nella sezione apposita del registro.

Vale anche il caso opposto, e va verificato prima di agire: un anglismo che in italiano è un
difetto può essere **la resa corretta in inglese**. `deployer` è italiano scorretto e inglese
giusto: 22 occorrenze da correggere in italiano, 119 da lasciare intatte in inglese.
