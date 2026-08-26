---
title: Controllo dei documenti
sidebar_position: 11
description: "La procedura di controllo dei documenti del progetto: elenco dei documenti sottoposti a controllo, regole di identificazione e versione, revisori per categoria, forma dell'approvazione, regola di ritiro. Come la corrispondenza fra revisione, revisore e approvazione costituisce la registrazione di approvazione nel modello «documenti come codice», e su quali strumenti si appoggia. La lacuna esplicita e non attenuata: redattore e approvatore coincidono, e questa è una lacuna dichiarata di T-01 Q-189."
---

# Controllo dei documenti

> **Presupposto di lettura.** Che cosa sia un sistema di gestione della qualità, che cosa sia ISO 13485 §4.2.4, che cosa significhi «controllo dei documenti» e qual sia la ripartizione fra le funzioni di un fabbricante e quelle di chi installa, è spiegato da zero in [10 §15](../10_fondamenti/15-regolatorio-da-zero.md).
>
> **Che cosa è cambiato con `D58`.** Questo capitolo riporta il sistema di gestione della qualità che il progetto esercita su sé stesso, perché senza di esso il materiale che produce non sarebbe utilizzabile in alcun percorso di certificazione. Con `D58`, descrive anche il sistema che il soggetto fabbricante **da costituire** dovrà istituire. La ripartizione fra le due cose è dichiarata nelle sezioni pertinenti. La costituzione del soggetto è un prerequisito interno con un proprio tempo ([09 §4.2](./09-percorso-e-calendario.md), `T-14`), non un'attesa: ogni settimana in cui non si avvia è una settimana che il progetto sottrae al proprio percorso di certificazione.
>
> **Questo capitolo è una procedura?** No, e da oggi la distinzione ha un secondo termine invece di essere una sola negazione. Questo capitolo è la **definizione** della procedura: la documentazione di come si applica, il perimetro di ciò a cui si applica e la ragione di ciascuna regola. La procedura vera e propria - chi fa che cosa, quando, con quale atto, e quale traccia resta - è un documento separato: [Procedura di controllo dei documenti](/08_compliance/PROCEDURA-controllo-dei-documenti.md), che il criterio 1 di `T-01` esige versionata **ed essa stessa sotto controllo**, e che infatti compare nel proprio elenco con il proprio revisore, la propria regola di versione e la propria regola di ritiro. Le procedure operative del sistema di gestione della qualità, quando verranno redatte dal soggetto fabbricante, risiederanno nel proprio sistema documentale a norma di ISO 13485 §4.2.4.
>
> **Che cosa resta vero di `V-174`, e che cosa non lo è più.** Resta vero per i **capitoli**: questo, come ogni altro di questa documentazione, è un ingresso per la creazione del sistema di gestione della qualità del soggetto fabbricante e **non è esso stesso sottoposto ai controlli che descrive**. Non è più vero del repository nel suo insieme, perché la procedura richiamata sopra è sotto il proprio controllo. La distinzione non è formale: un capitolo che si dichiarasse procedura violerebbe `V-174`, e una procedura che si escludesse dai propri controlli non sarebbe una procedura.

---

## 1. Perimetro

Il controllo dei documenti ai sensi di ISO 13485 §4.2.4 governa l'approvazione, il rilascio, la distribuzione e il ritiro di documenti che hanno rilevanza regolativa. In questo progetto, che pubblica il codice sorgente e la documentazione come artefatti versionati nel repository, il perimetro è:

**Documenti sottoposti a controllo formale:**

| Categoria | Documenti | Frequenza di revisione | Contesto |
|---|---|---|---|
| **Dichiarazioni pubbliche** | [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) · [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) · [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | Ogni modifica | Fondamenti legali e contrattuali |
| **Specifiche regolatorie pubbliche** | Ogni capitolo di `docs/08_compliance/` | A completamento di un traguardo che modifica il perimetro regolativo | Obblighi normativi nei confronti del fabbricante, del fabbricante futuro e di chi installa |
| **Requisiti e traguardi** | `docs/03_functional/` · `docs/09_roadmap/` | A completamento di un traguardo che modifica il perimetro funzionale | Prerequisiti della progettazione |
| **Architettura e ciclo di vita** | `docs/02_architecture/` · `docs/01_technical/` · `docs/04_protocols/` | A completamento di un traguardo che modifica le decisioni architetturali | Fondamenti della progettazione e realizzazione |
| **Modello del dominio e linguaggio** | `docs/05_domain/` · `docs/10_fondamenti/` | A completamento di un modulo che modifica il linguaggio ubiquo | Controllo della terminologia e della concettualizzazione |
| **Registro degli identificativi** | Registro degli identificativi di requisito (`RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`, `OUT-*`, `EX-*`, `DM-*`) | A ogni variazione di stato (in vigore / ritirato) | Criteri 3 e 4 di `T-01` |
| **Decisioni architetturali** | `docs/adr/` | A completamento di una decisione | Tracciabilità delle scelte che governano il sistema |

**Documenti non sottoposti a controllo formale in questa procedura:**

- Changelog dei repository (`CHANGELOG.md`)
- Questioni e proposta di modifica nel sistema di gestione sorgenti (GitHub Issues e Pull Requests): questi artefatti sono tracciati, versionati e immutabili per costruzione; la loro immutabilità e tracciabilità costituiscono il controllo
- Documentazione interna nella bacheca inter-agenti e nei log di sessione (`/.telemedic/context/`)
- Traduzioni in corso in fase parallela allo sviluppo, non ancora controllate dal sistema di divergenza

---

## 2. Identificazione univoca dei documenti

Ogni documento controllato è identificato univocamente per:

1. **Percorso di file assoluto** nel repository: non esiste duplicazione di percorso, e il percorso è conservato indefinitamente anche dopo il ritiro. Un documento ritirato non ha il suo numero di identificativo riusato.
2. **Versione del documento**, determinata dal commit in cui il documento è stato modificato per l'ultima volta. La versione è l'impronta SHA-1 del commit.
3. **Data di approvazione**, registrata nel messaggio di commit e controllabile dal log storico di git.
4. **Stato** (in vigore / ritirato): lo stato è dichiarato esplicitamente in un registro, non è implicito dall'assenza del documento dal repository.

**Metodo di identificazione nei riferimenti incrociati:** Una citazione di un documento controllato cita sempre il percorso e, dove necessario per disambiguare versioni storiche, il commit. Un riferimento senza percorso assoluto o senza commit è incompleto. Nei riferimenti normativi, dove il documento è online, si cita l'URL assoluto.

---

## 3. Versione e cronologia

**Versione nel repository:** La versione di un documento è il commit in cui è stato modificato. Il sistema di versione distribuito di git garantisce che:

- La cronologia completa è immutabile senza traccia (ogni modifica richiede una nuova impronta di commit).
- Ogni versione è identificabile univocamente dall'impronta SHA-1 del commit.
- La data e l'autore di ogni modifica sono registrati nel commit stesso.
- Il messaggio di commit dichiara la modifica (tipo, ambito, descrizione).

**Versione dei rilasci distribuiti:** Un rilascio distribuito (software o documentazione compilata) porta un proprio numero di versione secondo lo schema dichiarato in [01_technical/09](../01_technical/09-integrazione-continua-e-rilascio.md). Esso cita l'impronta del commit cui corrisponde, rendendolo tracciabile alla versione specifica di ogni documento incluso.

**Numerazione dei documenti regolatori:** I documenti che generano identificativi di requisito - specifiche, fascicoli, piani di sviluppo - usano spazi di identificativi dichiarati e congelati (`V-120`). Non si rinumerano mai e non si riusano dopo il ritiro ([08/03 §5](./03-sistema-di-gestione-della-qualita.md)). Un identificativo ritirato rimane nella storia e viene marcato come tale.

---

## 4. Revisori e competenza per categoria

La norma ISO 13485 §6.2 richiede che il personale che esegue attività che influenzano la qualità del prodotto sia competente e che la competenza sia documentata. In un progetto aperto, questa competenza non si richiede al contributore, ma al revisore: chi approva è chi ha l'autorità e la responsabilità sulla qualità di quello che entra nel repository.

**Categorizzazione dei documenti e revisori nominati:**

| Categoria | Revisore nominato | Competenza richiesta |
|---|---|---|
| **Dichiarazioni pubbliche e avvertenze** | Committente | Autorità sulla conformità regolativa e sulla rappresentazione pubblica del progetto |
| **Specifiche regolatorie** (`docs/08_compliance/`) | Autore dell'area, con revisione secondaria del Committente | Conoscenza approfondita della norma applicabile; capacità di mappare i requisiti alla soluzione tecnica |
| **Requisiti e traguardi** (`docs/03_functional/`, `docs/09_roadmap/`) | Titolare della roadmap (per traguardi); titolare dell'area funzionale (per requisiti) | Conoscenza della destinazione d'uso, del perimetro funzionale e della pianificazione |
| **Architettura e ciclo di vita** (`docs/02_architecture/`, `docs/01_technical/`) | Architetto del dominio | Conoscenza dell'architettura del progetto e della ripartizione fra contesti delimitati |
| **Dominio e linguaggio** (`docs/05_domain/`, `docs/10_fondamenti/`) | Autore del modulo, con revisione secondaria del dominio | Conoscenza del contesto sanitario e dei termini regolatori |
| **Decisioni architetturali** (`docs/adr/`) | Revisore tecnico designato nella decisione | Conoscenza del problema risolto |
| **Registro degli identificativi** | Autore del registro | Conoscenza del catalogo completo e dello stato di ogni identificativo |

**Dossier di competenza - impegno preso e non ancora realizzato:** La forma che ISO 13485 §6.2 richiede per documentare la competenza è un dossier per ciascun revisore nominato, contenente la descrizione della competenza specifica per la categoria cui è assegnato, esso stesso documento controllato nella sezione dedicata del sistema documentale del fabbricante quando costituito. **Oggi quel dossier non esiste.** Nel repository non c'è alcun file che lo contenga: la parola compare soltanto nella prosa che lo prescrive, questa compresa. Va detto come sta, perché è una registrazione e non un proposito: la competenza dei revisori è, alla data odierna, asserita da questo capitolo e non provata da una registrazione. La lacuna è della stessa natura di quella descritta al § 9 - una registrazione che la norma presuppone e che la capacità dichiarata da `D54` non ha ancora prodotto - e come quella si dichiara invece di attenuarla. La sua chiusura è legata alla costituzione del soggetto fabbricante ([09 §4.2](./09-percorso-e-calendario.md), `T-14`), che è il momento in cui il dossier avrà un sistema documentale in cui risiedere; fino ad allora l'assenza è nota, dichiarata qui, e va elencata fra le lacune che l'organismo notificato troverà già scritte anziché doverle scoprire.

**Punto di fragilità esplicito:** Un progetto che allarghi l'insieme dei revisori senza aggiornare i dossier di competenza perde la proprietà del controllo nel momento esatto in cui lo fa, e la perde in modo non ricostruibile a posteriori - perché l'evidenza mancante è la qualifica di chi ha approvato una modifica in una data passata. È il motivo per cui questo controllo esiste e per cui la sua violazione è inaccettabile.

---

## 5. Forma dell'approvazione

Nel modello «documenti come codice» con git e GitHub, l'approvazione di un documento controllato avviene per mezzo di una **revisione favorevole di una proposta di modifica** (Pull Request). La revisione è vincolante per l'unione della modifica nel ramo principale.

**Elementi della registrazione di approvazione:**

| Elemento | Tracciato in | Immutabilità | Verificabilità |
|---|---|---|---|
| **Identità del revisore** | Profilo GitHub del revisore | Sì - registrato nel commit | Consultabile dal log di GitHub |
| **Testo esatto del documento approvato** | Contenuto della Pull Request al momento della approvazione | Sì - GitHub mantiene la versione per ogni commit | Ricostruibile dal commit esatto citato nella PR |
| **Data e ora dell'approvazione** | Timestamp della revisione favorevole | Sì - assegnato dal server | Consultabile dalla timeline della PR |
| **Commit identificativo** | Impronta SHA-1 del commit di merge | Sì - calcolata dal contenuto | Immutabile e univoca |
| **Dichiarazione di modifica** | Messaggio di commit nel main | Sì - firmato se richiesto | Verificabile con `git log` |

**Come avviene l'approvazione:** Ogni proposta di modifica che tocchi un documento controllato rimane sospesa finché non riceva una revisione favorevole («Approved») dal revisore nominato per quella categoria. La proposta non deve essere unita senza questa approvazione: **la procedura lo prescrive, e il controllo tecnico della protezione dei rami su GitHub è attuato dal 26 agosto 2026**. L'unione stessa - l'atto di incorporazione nel ramo principale - è registrata nel log di git con l'identità di chi l'ha compiuta. **L'approvazione è concepita come tripla**: revisione favorevole sulla proposta, protezione del ramo che blocca l'unione non autorizzata, registro immutabile di chi ha compiuto l'unione. Oggi i tre elementi sono presidiati, ma non tutto ciò che questa procedura prescrive è imposto dalla macchina, e la differenza va detta per intero invece che smussata. **Ciò che la macchina impone** è una revisione favorevole per ogni proposta: senza di essa l'unione è bloccata, e questo vale per chiunque non sia amministratore del repository. **Ciò che la procedura prescrive e la macchina non impone** è che quella revisione venga dal revisore nominato per la categoria del documento: la protezione del ramo ha deliberatamente `require_code_owner_reviews` a `false`, e [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) ne dà la ragione con la prova. Con un solo manutentore ogni riga di quel file assegna la stessa persona; se la voce fosse a `true`, ogni proposta richiederebbe l'approvazione di un proprietario diverso dall'autore, e nessuna proposta si potrebbe mai unire senza il bypass da amministratore. La scelta è quindi consapevole, ma la sua conseguenza va enunciata senza attenuazioni: **oggi la corrispondenza fra il revisore che approva e il revisore nominato per la categoria è affidata alla disciplina di chi lavora, non a un presidio tecnico**, e un'approvazione data dalla persona sbagliata verrebbe accettata dal sistema senza segnalazione. La voce `require_code_owner_reviews` va riconsiderata quando i manutentori saranno almeno due - non prima, perché prima renderebbe il repository inutilizzabile senza il bypass che dovrebbe evitare. A questo si aggiunge che il committente, in quanto amministratore, può approvare sé stesso e unire il proprio lavoro. Questa forma **non risolve la lacuna di `Q-189`** - sotto capacità dichiarata di `D54`, il redattore di documenti è la stessa persona che li approva - ma la **rende visibile e circoscritta**: il sistema la registra, la traccia è immutabile, e la circostanza è attestabile nel fascicolo tecnico come lacuna dichiarata. La registrazione di approvazione ha ora la forma che questa procedura descrive.

**Forma della dichiarazione di modifica:** Il messaggio di commit che accompagna l'unione dichiara il tipo di modifica (feat, fix, refactor, docs, test, chore, perf, ci), l'ambito (quale area, quale documento), e una descrizione sintetica della modifica. Il messaggio è parte obbligatoria della registrazione, perché l'auditor che chiede «che cosa è entrato in questa versione» trova la risposta nel messaggio di commit, e il messaggio non è alterabile dopo l'unione (il commit non è alterabile).

---

## 6. Regola di ritiro dei documenti

Un documento controllato può essere ritirato - portato a uno stato che lo esclude dagli atti attuali - per le ragioni seguenti:

1. **Abrogazione di una specifica.** Una specifica esaurisce il suo scopo, viene sostituita da una versione nuova, o viene eliminata perché il requisito è scartato.
2. **Correzione di un errore normativo grave.** Un capitolo di conformità contiene un'affermazione che, verificata al testo primario, risulta falsa. Il capitolo viene ritirato, corretti gli errori, e ripubblicato con un nuovo numero di versione.
3. **Esaurimento dello scopo temporale.** Una bozza o un piano interno scade quando il traguardo cui era associato è chiuso.

**Procedimento di ritiro:**

1. Viene creata una proposta di modifica che dichiara il ritiro nel messaggio di commit, citando la ragione.
2. La proposta riceve l'approvazione del revisore nominato per la categoria.
3. Il documento è marcato come «ritirato» in uno stato registrale mantenuto nel repository. Il file non è mai cancellato dal sistema di versione.
4. L'impronta del commit di ritiro, la data e la ragione rimangono tracciabili nel log di git.

**Divieto di riuso di identificativi:** Un identificativo di requisito o di documento ritirato non è mai riusato. Se un requisito è ritirato e successivamente una nuova proposta affronta lo stesso argomento, gli viene assegnato un nuovo identificativo. Questo preserva la tracciabilità storica: un lettore che consulti un rilascio vecchio e veda un identificativo non è tratto in inganno dalla possibilità che quell'identificativo sia stato reassegnato e significhi qualcos'altro oggi.

---

## 7. Registrazione dell'approvazione nel modello «documenti come codice»

La corrispondenza fra revisione, revisore e approvazione costituisce la registrazione di approvazione nel modello «documenti come codice». Non esiste una registrazione separata: la registrazione è la storia di git e la sequenza di eventi in GitHub.

### 7.1 Come avviene

Un processo tipico è il seguente:

1. **Creazione della proposta di modifica.** Un contributore crea una Pull Request che propone una modifica a un documento controllato. La proposta include il testo della modifica, una descrizione del cambiamento, e un collegamento ai requisiti o alle questioni che motivano il cambiamento.

2. **Revisione automatica preliminare.** I controlli di costruzione girati in pipeline (sintassi YAML, link interni, terminologia proibita, identificativi di requisito) eseguono automaticamente e segnalano eventuali rilievi. Queste verifiche sono bloccanti: se falliscono, la proposta non può procedere. La loro esecuzione è registrata nel log della proposta.

3. **Revisione manuale dal revisore nominato.** Il revisore nominato per la categoria legge la proposta, controlla che la modifica sia conforme alle regole della categoria (per una specifica: è tracciata al requisito? È citata correttamente la norma?), e dichiara «Approved» o richiede cambiamenti. La revisione è immutabile e datata.

4. **Risoluzione dei rilievi, se presenti.** Se il revisore ha richiesto cambiamenti, il contributore modifica la proposta. Ogni modifica genera un nuovo commit nella proposta, che la pipeline torna a verificare.

5. **Unione nel ramo principale.** Dopo l'approvazione, il revisore oppure una persona delegata unisce la proposta nel ramo principale («merge»). Questa azione è registrata in git con l'identità del richiedente e in GitHub nella timeline della proposta. La procedura prescrive che l'unione avvenga **solo dopo l'approvazione**, e dal 26 agosto 2026 il controllo della protezione del ramo che impone questa regola è attuato: una proposta che non abbia ricevuto almeno una revisione favorevole non può essere unita, sicché la regola non poggia più sul solo rispetto procedurale. Restano a corredo, come prima, la traccia del commit nel log di git e la timeline della proposta. Va detto con precisione che cosa la protezione **non** copre: non si applica agli amministratori del repository, e il proprietario conserva quindi la facoltà di unire il proprio lavoro dopo essersi approvato da sé - circostanza dichiarata al § 5 e registrata come lacuna in `Q-189`, non nascosta da questa attuazione.

6. **Immediatezza della pubblicazione.** Il documento entra in vigore immediatamente dopo l'unione, perché il sito di documentazione e gli artefatti distribuiti sono generati dalla versione corrente del main.

**Ciò che rende questa registrazione superiore a una firma su un modulo:**

- **Immutabilità:** Non è possibile alterare retrospettivamente che cosa è stato approvato, da chi, e quando. Una modifica posteriore al commit è un commit nuovo e separato, che appare nella cronologia come tale.
- **Granularità:** Non è l'intero documento che è approvato, ma la modifica specifica. Il revisore vede esattamente che cosa è entrato e che cosa è cambiato rispetto alla versione precedente.
- **Tracciabilità:** La proposta è collegata ai requisiti, alle questioni e ai rilievi. Il filo logico che lega la decisione al cambiamento è parte della registrazione.
- **Distribuito:** La cronologia completa è copiata in ogni clone del repository, il che significa che nessun evento è mai perso se un server fallisce.

### 7.2 Cicli di approvazione

**Il ciclo ordinario:** Una modifica a un documento controllato segue il ciclo sopra descritto. La proposta rimane aperta fino all'approvazione e all'unione, il che di solito richiede da poche ore a pochi giorni. Le eccezioni sono documenti sulla conformità che necessitano di revisione secondaria da parte del Committente, il cui tempo di risposta può essere più lungo.

**Il ciclo accelerato (per correzioni e aggiornamenti urgenti):** Entro 48 ore dalla scoperta di un errore normativo grave o di una incongruenza regolativa, il revisore nominato può approvare e unire una correzione senza il ciclo ordinario, purché la modifica sia marcata come «fix» nel commit. Questo ciclo presuppone però che il revisore sia disponibile: non è un modo per aggirare il controllo, ma un modo per non intralciare i rilasci critici.

---

## 8. Gli strumenti e la loro validazione

La registrazione di approvazione descritta al § 7 poggia su quattro strumenti:

| Strumento | Funzione nel sistema di controllo | Validazione richiesta |
|---|---|---|
| **git** (versionamento distribuito) | Calcolo e verificabilità dell'impronta di ogni commit; immutabilità della cronologia | Conformità alle clausole 4.2.4 e 8 di IEC 62304 (controllo della configurazione). Validazione: la cronologia non è alterabile senza traccia; ogni commit è identificabile univocamente |
| **GitHub** (piattaforma di ospitalità) | Traccia delle proposte di modifica; protezione dei rami; registrazione degli eventi di revisione e unione; immutabilità dei log | Conformità alla clausola 8.2 di IEC 62304 (gestione della configurazione del software e verifica). Validazione: nessuna revisione favorevole può essere registrata in retroattivo; nessuna unione può avvenire senza la traccia della proposta |
| **Controlli automatici di costruzione** (linter, sintassi, link checker, identificativi) | Verifica che ogni proposta rispetti le regole tecniche e regolatorie prima dell'unione | Conformità alle clausole 5.5–5.7 di IEC 62304 (test di integrazione e di sistema). Validazione: un controllo che non blocca quando dichiara che bloccherebbe è un difetto del controllo (criterio 5 di `T-01`). Ciascun controllo bloccante è provato con un caso deliberatamente non conforme che deve farlo fallire |
| **Firma crittografica dei commit** (adottata, firma obbligatoria sul ramo in sospeso) | Attestazione crittografica dell'identità di chi ha compiuto il commit (GPG sign) | Conformità alla clausola 7.5.8 di ISO 13485 (tracciabilità dell'autore). Nota: la clausola è oggi soddisfatta dal `Signed-off-by` obbligatorio (DCO, tracciabilità nominativa testuale). La firma crittografica è un controllo **ulteriore e più forte**. **Adottata il 26 agosto 2026:** configurazione locale `user.signingkey`, `gpg.format`, `commit.gpgsign` impostata; chiave `ed25519`, intestata a `Federico Calò <fedcal01@gmail.com>`, scadenza 20 febbraio 2029. **Passo in sospeso:** firma obbligatoria sul ramo, con **innesco preciso**: finché la chiave pubblica non è caricata su GitHub, i commit firmati risulterebbero «non verificati» e il push verrebbe rifiutato. È l'ultimo passo e ha un innesco specifico, non una data. Registrato come questione aperta `Q-284` | <!-- dato-reale-consentito: intestazione della chiave di firma, tracciabilità nominativa richiesta dalla clausola 7.5.8 di ISO 13485 -->

**Stato di attuazione oggi:** I controlli automatici di costruzione (terminologie, conformità redazionale, segreti, distinta dei materiali, divergenza fra lingue) sono attivi e bloccanti in pipeline. La protezione dei rami è attuata dal 26 agosto 2026 (configurazione verificata, forma dichiarata); la firma crittografica è adottata a livello locale (26 agosto 2026), mentre la firma obbligatoria sul ramo è prescritta e non ancora attuata (questione aperta `Q-284`, in sospeso fino al caricamento della chiave pubblica su GitHub). **Quando questi strumenti saranno validati:** I traguardi `T-01` criteri 5 e 7, e `T-03`, presuppongono la validazione formale di tutti gli strumenti. Finché questa validazione non esiste, i controlli sono asserzioni di funzionamento, non prove. La validazione è compresa nei traguardi del primo rilascio e rientra nella pianificazione del primo anno ([09 §4](./09-percorso-e-calendario.md)).

**Implicazioni di un fallimento della validazione:** Se uno di questi strumenti risultasse non conforme al suo scopo - per esempio, se la protezione del ramo una volta attuata potesse essere aggirata, o se GitHub alterasse retroattivamente le date - la registrazione di approvazione di questo sistema di controllo cadrebbe completamente, e il progetto dovrebbe adottare un sistema alternativo. Questa è la ragione per cui la validazione non è opzionale e per cui i traguardi la collocano prima dell'esercizio a pieno della procedura.

---

## 9. La lacuna esplicita: redattore e approvatore coincidono

Sotto la capacità dichiarata da `D54` - un contributore unico a tempo parziale - il redattore di un documento è la stessa persona che lo approva. Questo **rende impossibile il controllo di un arbitro esterno sulla qualità della redazione**, ed è una violazione della struttura che ISO 13485 §6.2 e §4.2.4 presuppongono. La norma assume che revisore e autore siano persone diverse; quando sono la stessa, il controllo che solo l'indipendenza garantisce - il controllo di chi non ha scritto che cosa è stato scritto - non esiste.

### 9.1 Che cosa non è soddisfatto

La norma ISO 13485 presuppone che il controllo dei documenti sia esercitato da persone che **non hanno scritto il documento**. Questa presupposizione non è formulata come requisito esplicito («il revisore deve essere diverso dall'autore»), ma è implicita in ogni clausola sul controllo. La conseguenza della presupposizione è: **se l'autore è il revisore, non esiste controllo esterno sulla qualità della redazione, e la proprietà di verifica è compromessa.**

Non è detto che la redazione sia di bassa qualità. È detto che non esiste verifica di terzo che accerti che sia di alta qualità. Un autore può controllare la propria redazione, e lo farà; un autore però non vede gli errori che lui stesso ha commesso, perché gli errori sono invisibili a chi li ha prodotti. È la ragione per cui il controllo peer è una pratica ovunque nel software, e la sua assenza è una lacuna.

### 9.2 La conseguenza sulla priorità

Sotto `D54`, la lacuna della coincidenza redattore/approvatore **non è risolvibile con più ore di lavoro**. È risolvibile soltanto con una seconda persona. Poiché la capacità è fissa ([02 §2.1](/09_roadmap/02-traguardi.md#21-le-tre-decisioni-che-determinano-questo-capitolo)), l'unica via è acquisire la funzione dall'esterno.

### 9.3 Lo stato di questa lacuna nel percorso di certificazione

La lacuna è **dichiarata e accettata come tale fino a una data** - la data in cui il soggetto fabbricante avrà costituito la propria organizzazione ed avrà risorse per revisione di terzo. Fino a quella data:

- **Non è una conformità.** Nessun capitolo di questo repository descrive il controllo dei documenti come conforme a ISO 13485.
- **È la prima voce di Q-189.** Q-189 chiede di stabilire quale sottoinsieme di registrazioni a ruoli distinti il progetto accetta come lacuna dichiarata e quale si propone di coprire acquisendo la funzione all'esterno. La coincidenza redattore/approvatore è la prima voce di questa ripartizione.
- **È registrata nel fascicolo tecnico.** Nel fascicolo che accompagnerà la marcatura, la lacuna è elencata con la data in cui è nata e la forma della sua risoluzione dichiarata.

### 9.4 Come viene gestita in pratica

Sebbene esista una sola persona che redige e approva, il progetto mantiene **comunque** le registrazioni di approvazione secondo le regole descritte ai §§ 7–8, perché:

1. Le registrazioni non sono perse quando la capacità aumenta. Se domani si aggiungesse un secondo membro stabile, le registrazioni esistenti non avrebbero bisogno di essere ricostruite.
2. La mancanza di controllo esterno in questo momento non invalida la forma della registrazione. La forma - identità del revisore, data, impronta del commit, testo esatto - è corretta; è il fatto che il revisore sia anche l'autore che è problematico. L'organismo notificato lo chiederà esplicitamente («chi approva?»), e la risposta («stesso autore, registrato così») è più utile di un tentativo di fingere che non sia così.

---

## 10. Che cosa questo capitolo lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| **`Q-189`** | **Ripartizione delle registrazioni a ruoli distinti.** Quale sottoinsieme di registrazioni che il sistema di gestione della qualità richiede - audit interno, riesame del rilascio, verifica di configurazione da chi non ha scritto il codice, revisione esterna del codice critico - il progetto accetta come lacuna dichiarata sotto `D54`, e quale si propone di coprire acquisendo le persone dall'esterno. La coincidenza redattore/approvatore è la prima voce di questa ripartizione. L'esito predefinito è la lacuna dichiarata, da marcare nel fascicolo tecnico alla data della prima distribuzione | → Committente |
| **`Q-283`** | **Protezione del ramo principale - RISOLTA il 26 agosto 2026.** Configurata con `gh api -X PUT repos/fedcal/Telemedic/branches/main/protection --input -` e verificata lo stesso giorno. Una proposta di modifica a un documento controllato non può ora essere unita senza almeno una revisione favorevole. **Che cosa la configurazione impone e che cosa no**: impone una revisione, non che venga dal revisore nominato per la categoria - `require_code_owner_reviews` è deliberatamente a `false`, per la ragione data in [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS), e la corrispondenza fra revisore effettivo e revisore nominato resta affidata alla disciplina (§ 5). **Forma dichiarata dal committente**: il proprietario del repository (committente), in quanto amministratore, può approvarsi le proprie modifiche e unirle; i contributori esterni ricevono una revisione favorevole prima che l'unione sia possibile. Questa forma **non risolve la lacuna di `Q-189`** - l'autore approva sé stesso sotto `D54` - ma la **rende visibile e circoscritta**: il sistema la registra e la circostanza è attestabile nel fascicolo tecnico. Lacuna strutturale dichiarata | Tecnica, compliance |
| **`Q-284`** | **Firma crittografica dei commit - adottata il 26 agosto 2026, firma obbligatoria sul ramo in sospeso.** La procedura prescrive che i commit nel ramo principale portino firma crittografica (GPG) verificabile. **Stato adottato**: configurazione locale `user.signingkey` `13EEEA8DBE18B284`, `gpg.format openpgp`, `commit.gpgsign true`, `tag.gpgsign true`. Chiave `ed25519` intestata a `Federico Calò <fedcal01@gmail.com>`, scadenza 20 febbraio 2029. **Passo rimasto aperto**: firma obbligatoria sul ramo `main` con innesco preciso - finché la chiave pubblica non è caricata su GitHub, i commit firmati risulterebbero «non verificati» e il push verrebbe rifiutato. È l'ultimo passo e ha un innesco specifico, non una data. Distinguere dal `Signed-off-by` (DCO, oggi obbligatorio e attivo, che soddisfa ISO 13485 §7.5.8 sulla tracciabilità nominativa): la firma crittografica è controllo ulteriore e più forte | Tecnica, compliance | <!-- dato-reale-consentito: intestazione della chiave di firma, tracciabilità nominativa richiesta dalla clausola 7.5.8 di ISO 13485 -->
| `[NV]` | **Validazione formale dei quattro strumenti.** La validazione degli strumenti (git, GitHub, controlli automatici, firma crittografica) è prerequisito funzionale dei traguardi `T-01` criteri 5 e 7, e `T-03`. La forma della validazione (come provare che uno strumento fa quello che deve) è definita in [03 §3.2](./03-sistema-di-gestione-della-qualita.md); l'esecuzione della validazione non è stata iniziata. Finché la validazione non esiste, il controllo è asserzione, non prova | Conformità, tecnica, pipeline |
| - | **Accesso e deleghe di controllo del ramo principale.** Chi può unire una proposta di modifica senza ulteriore approvazione, quando e per quale ragione, rimane nella documentazione interna del progetto e non viene qui ripetuto. La decisione deve rimanere aperta a revisione ogni sei mesi, perché è il punto su cui un ampliamento informale della capacità rischia di diventare permanente | → Contributore unico per la revisione trimestrale |
