---
title: Richiesta agli organismi notificati
sidebar_position: 12
description: "Il testo versionato della richiesta di informazioni agli organismi notificati, in italiano e in inglese, con i campi da compilare al momento dell'invio: le cinque domande sul calcolo, sui tempi delle singole fasi, sul riesame preliminare, sull'audit combinato e sul confronto del totale. Con la ricognizione degli organismi designati, la fonte consultata e la data di consultazione, il codice di designazione dichiarato non verificato, e il registro degli invii con il suo formato."
---

# Richiesta agli organismi notificati

> **Stato di fatto, in prima posizione perché è la sola riga che cambia le decisioni di chi
> legge.** Il prodotto **non reca marcatura CE**, **non è coperto da alcuna dichiarazione di
> conformità** e **non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti
> reali**. Il progetto **intende** assumere il ruolo di fabbricante e **il soggetto giuridico che
> lo eserciterebbe non è costituito**. Nulla di quanto segue attenua queste righe: una richiesta
> di informazioni non è un ingaggio, un ingaggio non è una valutazione, una valutazione non è un
> esito. Chi legge «hanno scritto agli organismi notificati» e ne conclude «allora posso usarlo»
> trae una conclusione **sbagliata**: l'intenzione non copre nessuno e non trasferisce alcun
> obbligo a chi installa, integra o mette in servizio il software.
>
> **Avvertenza sul genere di questo capitolo.** Non è una procedura del sistema di gestione della
> qualità e non può essere presentato come tale ([`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174)). È un **ingresso**: contiene il testo che il
> soggetto fabbricante, da costituire, riemetterà sotto il proprio controllo dei documenti prima
> di usarlo in una trattativa.

## 1. Che cosa dimostra questo capitolo

Il traguardo `T-14` della [roadmap, §02 - Traguardi](../09_roadmap/02-traguardi.md) chiede, al terzo dei
suoi criteri, che la richiesta di informazioni sia stata inviata a ciascun organismo notificato
designato per la categoria di dispositivo pertinente, con data e testo versionato. Il criterio è
binario: si dimostra con tre cose che devono **coesistere**, e nove elementi su dieci lo lasciano
non soddisfatto.

Le tre cose sono il **testo** della richiesta, versionato e privo delle formule vietate da
[01 §11](./01-inquadramento-normativo.md); la **ricognizione** degli organismi designati per la
categoria pertinente, con la fonte consultata e la data di consultazione; e un **registro** con
una riga per ciascun organismo dell'elenco, ciascuna con la data di invio e il canale. Questo
capitolo produce il primo e il secondo. Il terzo è il file
[`registro/organismi-notificati.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/organismi-notificati.tsv),
il cui formato è descritto al § 8 e in
[`registro/README.md`](https://github.com/fedcal/Telemedic/blob/main/registro/README.md).

**Il criterio non è soddisfatto oggi, e va detto qui invece che in fondo.** La ricognizione del
§ 4 si è fermata prima dell'elenco dei destinatari, per una ragione che il § 4.2 espone per esteso
e che non è una svista: la categoria di designazione pertinente non è documentata in alcun
capitolo di quest'area, e l'elenco pubblicato non è stato letto. Il registro degli invii esiste
con la propria intestazione e **nessuna riga di dato**, che è la forma corretta di dichiarare
zero invii: un registro assente si confonde con un registro non ancora popolato, un registro
vuoto no.

## 2. Perché la richiesta parte prima che il soggetto esista, e perché il testo lo dice

La richiesta di informazioni **non richiede il soggetto costituito**; il contratto sì. È la
ragione per cui questo lavoro precede l'atto societario invece di attenderlo, e la ragione è
aritmetica prima che organizzativa: il vincolo effettivo del percorso non è la scrittura del
testo, è la **coda** dell'organismo. [09 §2](./09-percorso-e-calendario.md) misura quella coda
con dati che il progetto dichiara di fonte secondaria e non verificati sulle pubblicazioni
originali, e ne trae una constatazione che qui va ripetuta senza attenuazioni: in un mercato con
organico in contrazione e domande in eccesso rispetto ai certificati emessi, **un fabbricante
nuovo, di micro dimensione, alla prima valutazione di conformità, non è un cliente prioritario**.
Il profilo descritto è il nostro. Entrare in coda prima è l'unica leva che il progetto possiede,
e non ne possiede altre.

Ne discende un obbligo redazionale che è il punto più delicato dell'intero capitolo. Un organismo
che scopra **dopo** aver risposto che il richiedente non è un soggetto giuridico costituito ha
ricevuto una richiesta fuorviante, e il danno non si ripara con una precisazione successiva: si
è già speso il tempo di qualcuno su un presupposto sbagliato. Il testo del § 5 dichiara quindi la
condizione del richiedente **nel primo capoverso**, prima di qualunque domanda, e non in una nota
a fondo pagina. La regola di forma che governa questa dichiarazione è quella di
[01 §11](./01-inquadramento-normativo.md): l'intenzione si esprime con il verbo «intende» e mai
con un futuro indicativo, e l'assenza del soggetto giuridico si ripete **nella stessa frase** in
cui l'intenzione compare.

C'è una seconda ragione, che appartiene al regime dei dispositivi e non alla cortesia. **La
destinazione d'uso si ricava anche dal materiale che si spedisce**: l'art. 2, punto 12, del
Regolamento (UE) 2017/745 la ricava dalle indicazioni fornite «sull'etichetta, nelle istruzioni
per l'uso o nel materiale o nelle dichiarazioni di promozione o vendita», e l'art. 7 vieta le
dichiarazioni fuorvianti anche in assenza di marcatura. Una lettera che descrivesse il prodotto
come pronto, o che lasciasse dedurre un esito, sarebbe materiale regolatorio contro il progetto
stesso. Il testo del § 5 è scritto per reggere anche se letto da chi ha interesse a leggerlo
diversamente, ed è la ragione per cui contiene una clausola esplicita che ne dichiara la natura
invece di lasciarla dedurre dal tono.

## 3. Le cinque domande, e la ragione di ciascuna

Il contenuto della richiesta non è deciso qui: è deciso in
[09 §8.3](./09-percorso-e-calendario.md), che elenca cinque regole per chiedere i preventivi.
Questo paragrafo ne riporta la ragione, perché una domanda posta senza sapere che cosa protegge
si lascia cadere alla prima risposta evasiva.

**Il calcolo e non il prezzo.** Le tariffe degli organismi notificati sono oggetto di un obbligo
di pubblicazione dell'Allegato VII, sezione 1.2.8, del Regolamento (UE) 2017/745, e il progetto
adotta la regola di **non stimare ciò che ha una fonte pubblica primaria**
([09 §8.2](./09-percorso-e-calendario.md)). Un prezzo comunicato senza il calcolo è quindi
un'informazione che vale meno di quella già pubblicata: chiedere le giornate previste per
ciascuna attività e il metodo con cui sono calcolate, con riferimento alla tariffa pubblicata, è
l'unico modo di rendere due risposte comparabili fra loro.

**Gli impegni sui tempi delle singole fasi, e i rimedi in caso di scostamento.** Un'offerta priva
di impegni sui tempi è un'offerta su un solo asse, e l'asse mancante è quello che decide.
Interessano tre fasi in particolare, perché sono le tre in cui la coda è dell'organismo e non del
richiedente: la **verifica di completezza**, il **primo ciclo di quesiti** e il **tempo di
risposta alle repliche**. La terza è la meno domandata e la più costosa: i cicli di risposta alle
non conformità sono classificati fra le voci **non stimabili** di
[09 §8.2](./09-percorso-e-calendario.md), perché due cicli o quattro sono la stessa
pianificazione con un costo diverso di un fattore due.

**Il riesame preliminare a pagamento, quando offerto.** Riduce i cicli di non conformità, cioè
riduce proprio la voce non stimabile più pesante. È la forma più efficace di spesa anticipata di
questo percorso, e chiedere gli impegni sui tempi senza chiedere anche il riesame preliminare è
la forma più comune di risparmio apparente.

**L'audit combinato.** La certificazione ISO 13485 e i certificati rilasciati ai sensi
dell'Allegato IX **non sono la stessa cosa e non si sostituiscono**
([09 §1](./09-percorso-e-calendario.md)): la prima è rilasciata da un organismo di certificazione
accreditato, i secondi dall'organismo notificato. Quando lo stesso soggetto può rilasciare
entrambi, l'audit combinato è la singola ottimizzazione più efficace dell'intero percorso, ed è
una domanda che va posta prima e non dopo, perché condiziona la scelta.

**Il confronto sul totale e non sulla tariffa.** L'organismo più economico per giornata può
essere il più costoso in totale se genera più cicli o ha code più lunghe. Confrontare le tariffe
orarie è **fuorviante**, e la regola prescrive di dirlo a chi lo propone: è l'unica delle cinque
che non si rivolge all'organismo ma a chi legge le risposte.

## 4. La ricognizione degli organismi designati

### 4.1 Che cosa è stato consultato, e quando

La ricognizione è registrata qui con la fonte e la data, perché «li abbiamo contattati tutti» non
è un enunciato verificabile e un elenco di destinatari non riconducibile a una ricognizione
registrata rende il criterio non soddisfatto anche se le lettere sono partite.

| Fonte consultata | Data | Esito della consultazione |
|---|---|---|
| Pagina della Commissione europea sugli organismi notificati per i dispositivi medici, `https://health.ec.europa.eu/medical-devices-topics-interest/notified-bodies-medical-devices_en` | 27 agosto 2026 | **Letta.** Dichiara che la Commissione pubblica l'elenco degli organismi notificati designati nel sistema informativo NANDO e rinvia, per il Regolamento (UE) 2017/745, all'indirizzo della riga seguente |
| Elenco NANDO filtrato, `https://webgate.ec.europa.eu/single-market-compliance-space/notified-bodies/notified-body-list?filter=legislationId:34,notificationStatusId:1` | 27 agosto 2026 | **Non letta.** L'indirizzo restituisce l'involucro di un'applicazione con esecuzione a lato cliente: nessun nome di organismo, nessun numero di identificazione, nessun paese è stato ottenuto. Il criterio di filtro è quello proposto dalla pagina della riga precedente e non è stato modificato |
| Testo dell'atto di esecuzione che stabilisce i codici di designazione, su EUR-Lex, nelle versioni inglese e italiana | 27 agosto 2026 | **Non letto.** Le richieste non hanno restituito il contenuto dell'atto. Il riferimento indicato da una fonte secondaria è al § 4.2 e resta `[NV]` da chiedere alla Commissione europea |
| Regolamento di esecuzione (UE) 2017/2185 su EUR-Lex, `https://eur-lex.europa.eu/legal-content/IT/TXT/HTML/?uri=CELEX:32017R2185` e la corrispondente forma inglese | 27 agosto 2026, secondo tentativo | **Non letto.** Entrambe le forme dell'indirizzo hanno restituito una pagina priva di contenuto testuale. Il dato che se ne ricava non è sul contenuto dell'atto ma sullo strumento: **la fonte primaria non è raggiungibile con i mezzi finora usati**, e completare il § 4.3 richiede un accesso diverso - la Gazzetta ufficiale dell'Unione in forma di documento scaricabile, oppure una consultazione presso l'autorità competente. Registrarlo evita che il tentativo si ripeta identico una terza volta |

**Che cosa questa tabella dice, alla lettera.** Dice che l'elenco ufficiale esiste, che il luogo
in cui è pubblicato è stato individuato su una fonte istituzionale e non dedotto, e che **il suo
contenuto non è stato letto**. Non dice quanti organismi siano designati, non ne nomina alcuno e
non riporta alcun recapito. È il massimo che si potesse registrare senza inventare, ed è meno di
quanto il criterio richieda.

**Perché nessun nome compare qui.** Un elenco di organismi ricostruito da fonti secondarie, da
memoria o da un motore di ricerca ha esattamente l'aspetto di un elenco verificato, e questa
somiglianza è il difetto: chi lo legge non ha modo di distinguerlo, e chi lo usa spedisce lettere
a soggetti che potrebbero non essere designati per la categoria pertinente, o non esserlo più.
**Un elenco inventato è un esito peggiore di un elenco assente**, perché un elenco assente si
vede. La regola di quest'area è già scritta e qui si applica senza sconti: le fonti si citano,
non si ricordano, e la memoria di chi scrive non è una fonte ([00 §8](./00-indice.md)).

### 4.2 Che cosa manca, ed è più di quanto il criterio lasci intendere

Manca il **codice di designazione** pertinente, e senza di esso l'elenco dei destinatari non è
determinabile nemmeno avendo l'elenco completo sotto gli occhi. Un organismo notificato non è
designato «per i dispositivi medici»: è designato per un insieme di codici, e la designazione ha
condizioni e limitazioni proprie. Filtrare l'elenco senza il codice significa scegliere i
destinatari per comodità.

Il capitolo [02](./02-qualificazione-e-classificazione.md) determina la **Classe IIa** in
applicazione della Regola 11 e la procedura dell'Allegato IX, e il suo § 1 mostra i codici di
designazione come discendenti dalla classificazione; **non dichiara alcun codice**, e la
questione è registrata fra le voci non verificate del suo § 12 e fra ciò che quest'area non
chiude ([00 §6](./00-indice.md), punto 8). La determinazione della classe non produce il codice
per deduzione: sono due esiti distinti di due atti distinti.

**`[NV]` - il codice di designazione pertinente.** Due fonti secondarie indipendenti, consultate il 27 agosto
2026, indicano nel Regolamento di esecuzione (UE) 2017/2185 - del 23 novembre 2017 - l'atto che stabilisce i codici e i
corrispondenti tipi di dispositivo ai fini della designazione degli organismi notificati, e
riferiscono l'esistenza di famiglie di codici con i prefissi `MDA`, `MDN`, `MDT` e `MDS`. **La
concordanza fra due fonti secondarie non fa una fonte primaria**, e va detto perché è il modo in
cui una convinzione si consolida senza essere verificata: le due fonti potrebbero derivare l'una
dall'altra, o entrambe da una terza. **Il
testo dell'atto non è stato letto su fonte primaria**, nessun codice è quindi riportato in questo
capitolo, e il riferimento all'atto stesso va confermato da `COMP` prima di comparire in un documento
destinato a una trattativa. È la stessa cautela che [01 §9](./01-inquadramento-normativo.md)
impone per le fonti italiane e che [09 §2](./09-percorso-e-calendario.md) impone per le cifre di
mercato: una fonte secondaria non diventa primaria perché è comoda.

### 4.3 Come si completa la ricognizione, e con quale ordine

Il lavoro residuo è di tre passi, e l'ordine non è indifferente. **Primo**, si legge il testo
dell'atto di esecuzione sui codici su fonte primaria e si individua il codice o i codici che
corrispondono alla destinazione d'uso congelata e alla determinazione di classe del capitolo
[02](./02-qualificazione-e-classificazione.md), motivando l'individuazione per ciascun codice
scartato e non solo per quelli scelti. **Secondo**, si legge l'elenco pubblicato nella banca dati
europea con quel codice come criterio di filtro, si registrano per ciascun organismo il nome, il
numero di identificazione, il paese e il recapito istituzionale pubblicato, e si registra la data
in cui l'elenco è stato letto, perché l'elenco cambia e una fotografia non datata non è una
ricognizione. **Terzo**, si popola il registro del § 8 con una riga per ciascun organismo, e la
riga nasce priva della data di invio: quella si scrive quando la lettera parte, non quando si
programma di farla partire.

**Se il codice non fosse determinabile**, l'elenco si costruisce comunque, ma su un criterio
esplicito dichiarato nel registro, e l'`[NV]` resta scritto. Ciò che non è ammesso è la terza
via, cioè inviare a un insieme scelto per comodità senza dichiarare come è stato costruito: è la
forma in cui un criterio binario diventa una percentuale.

## 5. Il testo della richiesta - versione italiana

> **Versione del testo: `1`.** Il numero di versione compare nel registro degli invii, colonna
> `revisione_del_testo`, perché due lettere inviate in momenti diversi possono avere testi diversi
> e la differenza va ricostruibile a distanza. Ogni modifica sostanziale al testo che segue
> incrementa il numero e va riportata **nella stessa modifica** anche nel gemello inglese del
> § 6: due lettere che divergono in due lingue sono due richieste diverse presentate come una.

I campi fra doppie parentesi quadre si compilano al momento dell'invio e sono elencati al § 7.
Nessuno di essi può restare nella forma con cui compare qui.

---

Oggetto: richiesta di informazioni sulla valutazione della conformità di un software dispositivo
medico - **non è una domanda e non è una richiesta di offerta contrattuale**

Alla cortese attenzione di [[ORGANISMO]], numero di identificazione [[NUMERO]], [[PAESE]].

**Premessa che determina il senso di tutta la lettera, e che chi scrive chiede di leggere prima
delle domande.** Il prodotto a cui questa richiesta si riferisce **non reca marcatura CE** e
**non è coperto da alcuna dichiarazione di conformità**. Chi scrive è un progetto di software
libero che **intende** costituire il soggetto giuridico che assumerebbe il ruolo di fabbricante,
e **quel soggetto non è oggi costituito**: non esiste quindi un fabbricante che possa
sottoscrivere una domanda, firmare un contratto o assumere gli obblighi dell'art. 10 del
Regolamento (UE) 2017/745. La presente è **una richiesta di informazioni**, e
chi scrive preferisce dichiararlo ora piuttosto che lasciarlo scoprire a Voi dopo che avrete
speso tempo su un presupposto sbagliato.

**Natura di questo documento.** La presente non costituisce offerta, proposta contrattuale,
ordine, impegno a contrarre, né domanda di valutazione della conformità ai sensi di alcuno degli
allegati del Regolamento (UE) 2017/745. Non contiene alcuna dichiarazione di prontezza del
prodotto, alcuna data e alcuna affermazione da cui si possa ricavare un esito della valutazione
della conformità. Nessuna risposta che vorrete dare produce obblighi in capo a Voi o a chi
scrive.

**Che cosa il progetto è, in tre righe.** È una piattaforma di telemedicina rilasciata sotto
licenza libera, il cui perimetro funzionale comprende la raccolta differita di parametri per la
revisione periodica del professionista sanitario. La determinazione di classificazione del
progetto, riferita alla destinazione d'uso nella revisione [[REVISIONE DELLA DESTINAZIONE D'USO]],
conclude per la **classe IIa** in applicazione della Regola 11 dell'Allegato VIII, con la
procedura di valutazione della conformità dell'**Allegato IX**. Tale determinazione è un
documento di lavoro del progetto, **non** una determinazione formale sottoscritta da una persona
responsabile del rispetto della normativa presso un fabbricante, per la ragione già detta: quel
soggetto non è costituito. Il sistema di gestione della qualità è impostato secondo ISO 13485 e
**non è certificato**.

**Che cosa Vi si chiede.** Cinque informazioni, nell'ordine in cui incidono sulla decisione di
chi scrive.

1. **Il calcolo, non il prezzo.** Per la procedura dell'Allegato IX applicata a un software
   dispositivo medico della classe indicata: quante **giornate** prevedete per ciascuna attività
   distinta - valutazione del sistema di gestione della qualità, audit in sito, valutazione della
   documentazione tecnica, valutazione clinica - e con quale **metodo** quelle giornate sono
   calcolate, con riferimento alla Vostra tariffa pubblicata ai sensi dell'Allegato VII, sezione
   1.2.8. Chi scrive non chiede uno sconto e non intende negoziare la tariffa: chiede il calcolo,
   perché è l'unica forma in cui due risposte diverse sono confrontabili.

2. **Gli impegni sui tempi delle singole fasi, e i rimedi.** Quali termini indicativi o
   contrattuali applicate alla **verifica di completezza** della domanda, al **primo ciclo di
   quesiti** e al **tempo di risposta alle repliche** del fabbricante; e quali **rimedi** sono
   previsti in caso di scostamento da quei termini. Se non applicate termini a una di queste tre
   fasi, chi scrive Vi chiede di dirlo esplicitamente: un'informazione negativa esplicita è
   utilizzabile, un silenzio no.

3. **Il riesame preliminare a pagamento.** Se offrite un riesame preliminare della documentazione
   a pagamento, prima della domanda formale: in che cosa consiste, quali documenti esamina, in
   quale forma restituisce i rilievi, e se i suoi esiti sono utilizzabili nella successiva
   valutazione o restano privi di effetto su di essa.

4. **L'audit combinato.** Se il Vostro gruppo può rilasciare **anche** la certificazione
   ISO 13485 tramite un organismo di certificazione accreditato, e se in tal caso è praticabile
   un **audit combinato** con la valutazione del sistema di gestione della qualità ai sensi
   dell'Allegato IX: a quali condizioni, con quale risparmio di giornate rispetto ai due percorsi
   separati, e con quali limiti di indipendenza che il combinato comporta.

5. **Il totale.** Sulla base delle risposte precedenti, quale **totale** di giornate e di oneri
   deriva dal Vostro calcolo per il percorso completo, distinto per fase, comprensivo degli oneri
   ricorrenti di sorveglianza. Chi scrive confronterà i totali e non le tariffe per giornata, e Vi
   chiede di indicare le voci che il totale non comprende.

**Due informazioni che Vi si chiedono e che non riguardano il preventivo.** La prima: per quali
**codici di designazione** siete designati ai sensi del Regolamento (UE) 2017/745, e se un
software con la destinazione d'uso sopra descritta rientra nel Vostro perimetro di designazione,
comprese le eventuali condizioni e limitazioni. La seconda: se accettate **nuovi fabbricanti alla
prima valutazione di conformità**, e in caso affermativo quale procedura di accettazione
applicate. Chi scrive preferisce una risposta negativa immediata a una trattativa che si
interrompa più avanti per questa ragione.

**Che cosa chi scrive può fornire, e in quale stato.** Il progetto pubblica come materiale aperto
la documentazione di ciclo di vita del software, la gestione del rischio, il fascicolo di
usabilità e la mappa del fascicolo tecnico. Questo materiale è **preparatorio**: non è emesso
sotto un controllo dei documenti in esercizio, non è approvato e non è firmato, e non viene
presentato come completo né come pronto per una valutazione. È indicato qui perché la quantità di
lavoro che un organismo prevede dipende da che cosa il richiedente porta già scritto, e chi
scrive preferisce che quella previsione sia fatta su ciò che esiste davvero.

**Trattamento dei dati e riservatezza.** Questa lettera non contiene dati personali di terzi né
dati relativi alla salute. Chi scrive chiede che l'eventuale risposta sia indirizzata al solo
recapito indicato di seguito e non contenga dati personali diversi da quelli necessari alla
corrispondenza.

Recapito per la risposta: [[RECAPITO DEL RICHIEDENTE]].
Riferimento di questa richiesta: [[RIFERIMENTO]], versione del testo `1`.
Luogo e data: [[LUOGO]], [[DATA DI INVIO]].
Firma: [[SOTTOSCRITTORE]], nella qualità dichiarata in premessa.

---

## 6. Il testo della richiesta - versione inglese

> **Stessa versione del testo del § 5: `1`.** Molti organismi notificati non sono stabiliti in
> Italia, e la lettera inglese non è una traduzione di cortesia: è la versione che verrà davvero
> letta. I due testi dicono la stessa cosa e si modificano nella stessa modifica; se divergono,
> sono due richieste diverse presentate come una.

La lettera è riprodotta qui nella lingua in cui viene spedita e non viene ritradotta in italiano:
ciò che un organismo riceve è il testo che segue, e una sua parafrasi italiana sarebbe un terzo
testo. I campi fra doppie parentesi quadre si compilano al momento dell'invio e sono elencati al
§ 7.

---

Subject: request for information on the conformity assessment of medical device software - **this
is not an application and is not a request for a contractual offer**

To the attention of [[BODY]], identification number [[NUMBER]], [[COUNTRY]].

**Preliminary statement that determines the meaning of this whole letter, and which the sender
asks you to read before the questions.** The product to which this request refers **does not bear
CE marking** and **is not covered by any declaration of conformity**. The sender is a free
software project that **intends** to establish the legal entity that would take on the
manufacturer role, and **that entity is not established today**: there is therefore no
manufacturer able to sign an application, sign a contract or take on the obligations of Article 10
of Regulation (EU) 2017/745. This is **a request for information**, and the sender
prefers to state it now rather than let you discover it after you have spent time on a wrong
assumption.

**Nature of this document.** This is not an offer, a contractual proposal, an order, an
undertaking to contract, nor an application for conformity assessment under any of the annexes to
Regulation (EU) 2017/745. It contains no statement of product readiness, no date and no assertion
from which an outcome of a conformity assessment could be inferred. No answer you may give
creates obligations for you or for the sender.

**What the project is, in three lines.** It is a telemedicine platform released under a free
licence, whose functional perimeter includes the deferred collection of parameters for the
healthcare professional's periodic review. The project's classification determination, referred
to the intended purpose in revision [[INTENDED PURPOSE REVISION]], concludes for **class IIa**
under Rule 11 of Annex VIII, with the conformity assessment procedure of **Annex IX**. That
determination is a working document of the project, **not** a formal determination signed by a
person responsible for regulatory compliance at a manufacturer, for the reason already given:
that entity is not established. The quality management system is set up according to ISO 13485
and is **not certified**.

**What you are being asked.** Five pieces of information, in the order in which they bear on the
sender's decision.

1. **The calculation, not the price.** For the Annex IX procedure applied to medical device
   software of the class indicated: how many **days** you envisage for each distinct activity -
   quality management system assessment, on-site audit, technical documentation assessment,
   clinical evaluation - and by what **method** those days are calculated, with reference to your
   fee published under Annex VII, section 1.2.8. The sender is not asking for a discount and does
   not intend to negotiate the rate: it asks for the calculation, because it is the only form in
   which two different answers are comparable.

2. **Commitments on the timing of the individual phases, and the remedies.** What indicative or
   contractual time limits you apply to the **completeness check** of the application, to the
   **first cycle of questions** and to the **response time to the manufacturer's replies**; and
   what **remedies** are provided in the event of deviation from those limits. If you apply no
   time limit to one of these three phases, the sender asks you to say so explicitly: an explicit
   negative answer is usable, silence is not.

3. **The paid preliminary review.** Whether you offer a paid preliminary review of the
   documentation ahead of the formal application: what it consists of, which documents it
   examines, in what form it returns the findings, and whether its outcomes are usable in the
   subsequent assessment or have no effect on it.

4. **The combined audit.** Whether your group can **also** issue ISO 13485 certification through
   an accredited certification body, and if so whether a **combined audit** with the quality
   management system assessment under Annex IX is practicable: on what conditions, with what
   saving in days compared with the two separate paths, and with what limits of independence the
   combination entails.

5. **The total.** On the basis of the previous answers, what **total** of days and charges
   follows from your calculation for the complete path, broken down by phase, including the
   recurring surveillance charges. The sender will compare totals and not per-day rates, and asks
   you to indicate the items the total does not include.

**Two pieces of information requested that do not concern the quotation.** First: for which
**designation codes** you are designated under Regulation (EU) 2017/745, and whether software
with the intended purpose described above falls within your designation scope, including any
conditions and limitations. Second: whether you accept **new manufacturers at their first
conformity assessment**, and if so what acceptance procedure you apply. The sender prefers an
immediate negative answer to a discussion that breaks off later for this reason.

**What the sender can supply, and in what state.** The project publishes as open material the
software life cycle documentation, the risk management, the usability file and the map of the
technical documentation. This material is **preparatory**: it is not issued under a document
control system in operation, it is not approved and not signed, and it is not presented as
complete or as ready for assessment. It is mentioned here because the amount of work a body
foresees depends on what the requester already has written, and the sender prefers that forecast
to be made on what actually exists.

**Data processing and confidentiality.** This letter contains no personal data of third parties
and no health data. The sender asks that any reply be addressed solely to the contact point given
below and contain no personal data other than what is necessary for the correspondence.

Contact point for the reply: [[REQUESTER CONTACT POINT]].
Reference of this request: [[REFERENCE]], text version `1`.
Place and date: [[PLACE]], [[DATE OF SENDING]].
Signature: [[SIGNATORY]], in the capacity stated in the preliminary statement.

---

## 7. I campi da compilare al momento dell'invio

I campi sono segnati in modo che nessuno possa restare non compilato per distrazione: doppie
parentesi quadre e testo tutto maiuscolo, forma che non compare in nessun altro punto del corpus
e che una ricerca testuale banale trova. **Una lettera che contenga ancora una doppia parentesi
quadra non si invia**, e il controllo è a carico di chi la invia, non del testo.

| Campo italiano | Campo inglese | Che cosa contiene | Da dove si prende |
|---|---|---|---|
| `[[ORGANISMO]]` | `[[BODY]]` | Denominazione dell'organismo come pubblicata nell'elenco | Elenco pubblicato nella banca dati europea, letto e datato (§ 4) |
| `[[NUMERO]]` | `[[NUMBER]]` | Numero di identificazione dell'organismo | Idem |
| `[[PAESE]]` | `[[COUNTRY]]` | Paese di stabilimento come pubblicato | Idem |
| `[[REVISIONE DELLA DESTINAZIONE D'USO]]` | `[[INTENDED PURPOSE REVISION]]` | Identificativo di revisione esatto della traccia di destinazione d'uso a cui la determinazione di classe si riferisce | Traccia di destinazione d'uso, [02 §5.1](./02-qualificazione-e-classificazione.md) |
| `[[RECAPITO DEL RICHIEDENTE]]` | `[[REQUESTER CONTACT POINT]]` | Recapito **istituzionale** del progetto per la corrispondenza, mai un recapito personale | Politica di contatto del progetto |
| `[[RIFERIMENTO]]` | `[[REFERENCE]]` | Riferimento univoco della singola lettera, riportato identico nel registro | Registro degli invii, § 8 |
| `[[LUOGO]]` | `[[PLACE]]` | Luogo di emissione | - |
| `[[DATA DI INVIO]]` | `[[DATE OF SENDING]]` | Data effettiva di invio, in forma `AAAA-MM-GG` nel registro | Registro degli invii, § 8 |
| `[[SOTTOSCRITTORE]]` | `[[SIGNATORY]]` | Chi sottoscrive, **nella qualità dichiarata in premessa** e non in una qualità che presupponga il soggetto fabbricante | - |

**Due campi che non esistono, e la loro assenza è deliberata.** Non esiste un campo per una data
prevista di alcun atto del percorso di valutazione della conformità, e non esiste un campo per una
data desiderata di avvio: sarebbero il modo più semplice di far entrare in una lettera esterna una
previsione che [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) vieta in ogni artefatto. Un organismo che
abbia bisogno di una collocazione temporale per rispondere la chiederà, e a quel punto sarà una
sua domanda a cui si risponde, non una nostra affermazione da cui si ricava un impegno.

## 8. Il registro degli invii

Il registro è il file
[`registro/organismi-notificati.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/organismi-notificati.tsv):
testo separato da carattere di tabulazione, codifica UTF-8, righe di commento che iniziano con
`#`, poi la riga di intestazione e una riga per ciascun organismo. È la stessa convenzione degli
altri registri della cartella, ed è documentata in
[`registro/README.md`](https://github.com/fedcal/Telemedic/blob/main/registro/README.md).

| Colonna | Contenuto |
|---|---|
| `data_invio` | Data effettiva di invio, in forma ISO `AAAA-MM-GG`. **Mai una data programmata**: il campo si scrive quando la lettera è partita |
| `organismo` | Denominazione come pubblicata nell'elenco ufficiale |
| `numero` | Numero di identificazione dell'organismo |
| `paese` | Paese di stabilimento come pubblicato |
| `codice_designazione` | Codice o codici in base ai quali l'organismo è stato incluso nell'elenco dei destinatari; `NV` finché il codice pertinente non è determinato (§ 4.2) |
| `canale` | Come la lettera è partita: modulo pubblicato sul sito dell'organismo, recapito istituzionale di posta elettronica pubblicato, posta elettronica certificata, altro dichiarato |
| `recapito` | Recapito **istituzionale** usato, come pubblicato dall'organismo. Mai il nome di una persona fisica, mai un recapito personale |
| `revisione_del_testo` | Versione del testo del § 5 e del § 6 effettivamente spedita |
| `lingua` | `it` o `en`, secondo quale dei due testi è stato spedito |
| `nota` | Testo libero, può essere vuoto; non contiene mai un carattere di tabulazione |

**Il registro contiene oggi zero righe di dato**, e la circostanza è dichiarata nel blocco di
commento in testa al file invece che lasciata dedurre da un file corto. Zero righe significa zero
invii, e zero invii significa che il criterio 3 di `T-14` **non è soddisfatto**. È il modo in cui
un registro serve a qualcosa: rendere visibile come riga assente ciò che altrimenti sarebbe
silenzio.

**Una riga priva di data di invio rende il criterio non soddisfatto**, anche se tutte le altre
colonne sono compilate. Non è una durezza formale: una riga senza data non consente di misurare
l'indicatore del rischio `R-06`, che è il numero di organismi che rispondono con una
disponibilità reale entro un termine registrato **a partire dalla data di invio**. Senza quella
data l'indicatore non esiste, e un rischio senza indicatore osservabile non è sorvegliato.

## 9. Le formule che questo testo non contiene, e perché

Il testo del § 5 e del § 6 è stato scritto contro la tabella delle formule vietate di
[01 §11](./01-inquadramento-normativo.md), voce per voce. Questo paragrafo dichiara le scelte
che ne discendono, perché una cautela non dichiarata si perde alla prima riscrittura.

**Non compare la parola «dispositivo medico» riferita al repository.** Compare riferita alla
categoria di software di cui si chiede la valutazione, che è l'oggetto della domanda rivolta
all'organismo, e la lettera dichiara nella stessa premessa che il prodotto non reca marcatura CE.

**Non compare alcun futuro indicativo sull'intenzione.** «Il progetto intende costituire il
soggetto giuridico», mai «il progetto costituirà». L'assenza del soggetto è ripetuta nella stessa
frase in cui l'intenzione compare, e non rinviata a una nota.

**Non compare alcuna data riferita alla marcatura o a una dichiarazione di conformità**, in
nessuna forma: né data, né mese, né trimestre, né anno, né «entro», né «a partire da», né «non
oltre». <!-- data-e-marcatura: enunciato del divieto, §11 regola 4 - l'elenco delle forme vietate le nomina tutte per poterle vietare --> Le uniche date della lettera sono la data di invio e la revisione della destinazione
d'uso, che sono fatti registrati e non previsioni. È il criterio 5 di `T-14` applicato a ciò che
questo capitolo produce, e sarà verificato dal controllo testuale che quel criterio esige.

**Non compare alcuna dichiarazione di prontezza.** Il materiale del progetto è descritto come
preparatorio, non emesso sotto controllo dei documenti, non approvato e non firmato. È la
constatazione già scritta in [09 §5](./09-percorso-e-calendario.md) sull'attività
retroattivamente irrecuperabile n. 3, e ripeterla in una lettera esterna costa nulla e protegge
molto.

**Non compare «certificato ISO 13485».** Compare «impostato secondo ISO 13485, non certificato»,
che è la formula ammessa. La distinzione non è pedanteria verso l'interlocutore: è precisamente
l'informazione che gli serve per calcolare le giornate.

**Non compare alcun nome di azienda, marchio o prodotto commerciale di terzi**, e la
documentazione di integrazione resta agnostica rispetto ai dispositivi di misura. La ragione
regolatoria è la trappola dell'accessorio descritta in
[02 §6.1](./02-qualificazione-e-classificazione.md), riga 11: una frase può importare la classe
di un apparecchio di terzi.

**Non compaiono dati personali.** Nessun nome di persona fisica, nessun recapito personale, né
nel testo né nel registro. Il campo del sottoscrittore si compila con la qualità dichiarata in
premessa, e i recapiti sono quelli istituzionali pubblicati.

## 10. Che cosa questo capitolo lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| `[NV]` | **Il codice di designazione pertinente** e il testo dell'atto di esecuzione che lo stabilisce: da verificare su EUR-Lex della Commissione (§ 4.2). Finché resta aperto, l'elenco dei destinatari non è determinabile e il registro del § 8 resta senza righe | richiesta a Commissione, EUR-Lex |
| `[NV]` | **Il contenuto dell'elenco pubblicato** nella banca dati europea NANDO: da verificare alla data d'uso e non una volta per sempre, perché l'elenco cambia (§ 4.1) | richiesta a Commissione, NANDO |
| [`Q-280`](../11_registri/02-questioni-aperte.md#q-280) | **La decisione sulla forma giuridica e l'avvio della pratica di costituzione.** Non blocca l'invio delle richieste, che non presuppone il soggetto costituito, e blocca tutto ciò che segue: la firma di un contratto è atto riservato al ruolo | → Committente |
| [`Q-188`](../11_registri/02-questioni-aperte.md#q-188) | **La riserva economica per il riesame preliminare a pagamento e per i cicli di risposta alle non conformità.** Le domande 2 e 3 del § 5 esistono per ridurre quella voce, e chiederle senza la riserva significa raccogliere un'informazione che non si potrà usare | → Committente |
| [`Q-275`](../11_registri/02-questioni-aperte.md#q-275) | **La revisione esterna della destinazione d'uso congelata**, prescritta da `D46` e non condotta. È eseguibile **senza** il soggetto costituito, e la lettera del § 5 cita la revisione della destinazione d'uso: una revisione esterna non condotta è una debolezza che l'organismo rileverà | → Committente |
| [`Q-179`](../11_registri/02-questioni-aperte.md#q-179) | **Forma di pubblicazione del calendario interno.** Questo capitolo non riproduce alcuna data di quel calendario e non ne deriva alcuna, ma vi rinvia per il contenuto delle cinque domande: se la forma di pubblicazione cambiasse, i rinvii vanno rifatti | → Committente |
| [`V-270`](../11_registri/01-vincoli-in-vigore.md#v-270) | Il progetto intende assumere il ruolo di fabbricante e il soggetto che lo eserciterebbe non è costituito: finché non lo è, e finché il controllo dei documenti non è in esercizio, la lettera del § 5 **non può** essere sottoscritta in una qualità che presupponga quel ruolo | Conformità, orchestrazione |
| [`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281) | Nulla in questo capitolo pianifica un'attività non producibile oggi. La firma del contratto, la sottomissione della domanda e l'apposizione della marcatura **non sono attività di questo capitolo**: sono atti riservati al ruolo, e compaiono qui solo come ciò che il capitolo non copre | Conformità |
| [`V-06`](../11_registri/01-vincoli-in-vigore.md#v-06) | Lo stato di fatto ripetuto in apertura non è attenuato da alcuna riga di questo capitolo, e non lo sarà da alcuna risposta ricevuta | Tutte |
