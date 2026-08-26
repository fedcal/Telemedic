# Piano di esecuzione - `T-14`, percorso di fabbricante avviato

> **Che cos'è questo documento.** È **pianificazione interna del progetto** (`D57`) per il solo
> traguardo `T-14`, come è enunciato in `docs/09_roadmap/02-traguardi.md` §3. Non è un documento
> pubblico, non modifica alcun criterio, non sposta alcuna data e non aggiunge criteri a quelli
> scritti nella fonte: li **esegue**.
>
> **Nessuna data di marcatura compare in questo documento, in nessuna forma** - né come data, né
> come finestra, né come «entro il», né come stima, né per rinvio a una tabella che ne contenga
> una. È il divieto di `V-171`, ripreso da `V-280` e riportato alla lettera in
> `docs/08_compliance/01-inquadramento-normativo.md` §11, regola 4: *«nessuna data, nessuna
> finestra temporale, nessun "entro"»*. Entrambi i vincoli sono stati verificati sul testo prima
> di scrivere: `V-171` in `01 §11` e `§13`, `V-280` in `docs/09_roadmap/00-indice.md` §3.1 e §9.5.
>
> **Stato di fatto, invariato e ripetuto perché nulla di questo piano lo modifica.** Oggi il
> prodotto **non reca marcatura CE**, non è coperto da alcuna dichiarazione di conformità, e chi lo
> installa, integra o mette in servizio assume comunque gli obblighi che ne derivano (`D16`,
> `D58`). Il ruolo di fabbricante **sarà assunto dal progetto** e il soggetto giuridico che lo
> eserciterebbe **non esiste oggi**. Nessun lavoro elencato qui, per quanto portato a termine,
> cambia una sola di queste righe.

---

## 1. Il traguardo alla lettera

| Voce | Valore, dalla fonte |
|---|---|
| Identificativo e titolo | `T-14` - *Percorso di fabbricante avviato* |
| Classe di attività | **`B`** - tempo di attraversamento determinato da terzi |
| Classe di enunciato | `[IMPEGNO]` |
| Data | **19 settembre 2026** |
| Innesco | Immediato, all'entrata in vigore di `D58` |
| Titolare | **Committente.** Il contributore unico esegue le attività materiali; la costituzione del soggetto e la nomina non sono sue |
| Rischi dichiarati | `R-06`, `R-22`, `R-30` |

**Che cosa la data è, e che cosa non è.** È un'**allocazione del calendario residuo** sotto la
capacità dichiarata da `D54` e quantificata da `D62`, non una stima di sforzo (`02-traguardi.md`,
avvertenza sulle date). Questo piano non la trasforma in stima e non produce durate proprie: dove
una durata non è del progetto, la dichiara non determinabile e nomina la fonte del vincolo.

**Perché il traguardo è eseguibile oggi, ed è il suo pregio.** `V-182` vieta ogni riga di codice
applicativo prima di `T-03` (26 settembre 2026). `T-14` **non contiene codice applicativo**: occupa
esattamente la finestra in cui il codice è vietato, e il suo rinvio non libera capacità, perché il
lavoro che lo sostituirebbe non è eseguibile. È la ragione per cui `02-traguardi.md` §2.4 lo colloca
secondo nel calendario e non dopo il primo rilascio, e per cui §4.3 lo elenca fra i quattro
traguardi che «si fanno comunque».

---

## 2. La tripartizione che `D58` impone, ed è la struttura di questo piano

`D58` stabilisce due cose che vanno tenute separate per tutto il piano: **il ruolo di fabbricante
sarà assunto dal progetto**, e **il soggetto che lo eserciterà è ancora da costituire**. Ne discende
che le attività di `T-14` non sono omogenee. Confonderle produce l'errore tipico di questo percorso:
attendere il soggetto per fare cose che non lo richiedono, e insieme dare per avviato ciò che senza
il soggetto non può neppure cominciare.

| Genere | Che cos'è | Chi lo compie | Che cosa lo determina |
|---|---|---|---|
| **Atto giuridico** | Costituzione del soggetto, iscrizioni conseguenti, nomina formale | Committente, presso terzi | Procedimenti amministrativi. **Non si accelera lavorando di più** |
| **Lavoro documentale anticipabile** | Testo della richiesta agli organismi, profilo della persona responsabile, bozza del piano di valutazione clinica, registri di avvio, controllo testuale | Contributore unico | Capacità del progetto. **Comprimibile** |
| **Riservato al ruolo** | Firma di contratti, sottomissione di fascicoli, approvazione e firma del rapporto di valutazione clinica, apposizione della marcatura | Nessuno, oggi | **L'esistenza del soggetto.** È la catena critica |

**Il lavoro documentale si fa ora perché il soggetto lo trovi già fatto.** Ogni documento prodotto
adesso è tempo che il soggetto, quando esisterà, non spenderà.
`docs/08_compliance/07-valutazione-clinica.md` §4 lo dice per la valutazione clinica - il progetto
produce la bozza tecnica, il fabbricante approva e assume - e la stessa forma vale per il profilo
della persona responsabile e per il testo della richiesta agli organismi.

**La catena critica non è il lavoro documentale: è l'atto giuridico.**
`docs/08_compliance/09-percorso-e-calendario.md` §5 lo isola con parole che questo piano non
migliora: *«la costituzione del soggetto fabbricante non è attività di documentazione: è atto
societario. Non si accelera lavorando di più, dipende da procedimenti amministrativi con tempi
propri, e finché non è avviata ogni voce che presuppone il ruolo resta bloccata a monte - non
rallentata, bloccata. È la sola attività di questo calendario che non possiamo portare avanti
scrivendo.»*

**Ciò che è riservato al ruolo non entra in questo piano come attività.** Sarebbe la violazione di
`V-281` nella sua forma più tentante: pianificare un'attività non producibile è il modo più efficace
di farla sparire dalla vista. Entra invece al §8 come *ciò che il traguardo non comprende*, con il
luogo in cui è coperto.

---

## 3. I criteri, uno per uno

Ogni criterio è diviso in tre parti: **che cosa esiste già**, **che cosa manca**, **come si
dimostra**. La dimostrazione è binaria e osservabile da chiunque apra il repository: non esiste la
forma «quasi», e un criterio con nove elementi su dieci è un criterio **non soddisfatto**
(`00-indice.md` §8.3).

### Criterio 1 - Forma giuridica scelta e registrata, pratica di costituzione avviata con data

**Che cosa esiste già.** La decisione di principio: `D58` attribuisce il ruolo al progetto. La
questione è posta al committente come `Q-280`, con punto di decisione al **19 settembre 2026**, e vi
è registrata la ragione della classe `B`: *«costa poche ore e molti mesi»*. Esiste il materiale
istruttorio: `09-percorso-e-calendario.md` §8.1 qualifica la costituzione come attività non
comprimibile, §9 elenca le figure e la loro permanenza, e `01-inquadramento-normativo.md` §12
dichiara che la costituzione di una persona giuridica che sostenga lo sviluppo apre la posizione di
**custode di software open source**, con obblighi alleggeriti - cioè una posizione migliore
dell'attuale sotto il profilo della certezza, non peggiore. È un elemento che appartiene alla scelta
della forma e che oggi sta in un capitolo che nessuno leggerebbe per decidere una forma societaria.

**Che cosa manca.** Tutto il resto: nessuna forma è scelta, nessuna pratica è avviata, nessuna data
di avvio è registrata, e **non esiste nel repository un luogo in cui quella data sarebbe
registrabile**. `Q-272` dichiara inoltre che nessuna area del progetto è titolare dell'atto e che
serve la dichiarazione del committente su chi lo conduce e con quali risorse; è aperta e senza
risposta.

**Come si dimostra.** Esiste, nel repository, un registro di avvio del percorso di fabbricante -
collocazione proposta accanto a `registro/`, con la forma decisa dalla procedura di
`docs/08_compliance/10-controllo-dei-documenti.md` - che contiene una riga con: **forma giuridica
scelta**, **riferimento della pratica**, **data di avvio**. Il criterio è soddisfatto se e solo se
la riga esiste e nessuno dei tre campi è vuoto. Sono **non ammessi** come valori «in corso di
valutazione», «da definire», «avviato» senza data: sono precisamente il modo in cui un criterio
binario diventa una percentuale.

> **Il criterio non chiede che il soggetto esista.** Chiede che la scelta sia fatta e la pratica
> avviata. La distinzione è deliberata nella fonte e va conservata: l'esistenza del soggetto è
> l'esito di un procedimento esterno e **non è databile dal progetto** (`02-traguardi.md` §8, voce
> marcata `[NV]`).

### Criterio 2 - Profilo della persona responsabile definito, ricerca avviata con data

**Che cosa esiste già.** La sostanza del profilo è scritta e non va ricostruita:
`09-percorso-e-calendario.md` §9.1 riporta i requisiti alternativi di qualifica dell'art. 15 -
titolo universitario in disciplina pertinente **più almeno un anno** di esperienza in materia di
regolamentazione o di sistemi di gestione della qualità sui dispositivi medici, **oppure quattro
anni** di tale esperienza - la **deroga per le micro e piccole imprese**, che non obbliga ad avere
la persona all'interno purché sia **permanentemente e continuamente a disposizione**, e le due
implicazioni: la disponibilità va **contrattualizzata** e il rapporto occasionale a chiamata è
escluso. Lo stesso paragrafo dichiara la scarsità della figura e il fatto che la deroga **aumenta la
domanda** invece di ridurla, perché consente a molte strutture di attingere allo stesso mercato.

**Che cosa manca.** Il documento di profilo non esiste come artefatto: la sostanza è dispersa in un
capitolo di analisi normativa, che è un ingresso e non un documento operativo (`V-174`). Manca il
registro delle richieste con le date. Resta `[NV]` dichiarato nella fonte la corrispondenza fra la
sostanza dei requisiti e la numerazione dei paragrafi dell'art. 15: il piano **non la chiude e non
la inventa** - va verificata sul testo consolidato prima che il profilo sia usato in una trattativa.

**Come si dimostra.** Esistono due artefatti versionati: **(a)** un documento di profilo che riporta,
in forma di requisiti, le due alternative di qualifica, il regime di disponibilità permanente e
continuativa, l'ammissibilità della figura esterna nel regime delle micro e piccole imprese, e la
forma contrattuale che rende la disponibilità verificabile; **(b)** un registro delle richieste con
**almeno una riga datata**. Senza quella data, l'indicatore anticipatore di `R-22` - il tempo fra la
prima richiesta a un professionista specializzato e la sua risposta, con soglia dichiarata di due
settimane - **non è misurabile**, e un rischio senza indicatore osservabile viola `V-189`.

### Criterio 3 - Richiesta inviata a ciascun organismo notificato designato, con data e testo versionato

**Che cosa esiste già.** Il **contenuto** della richiesta è già deciso e scritto:
`09-percorso-e-calendario.md` §8.3 elenca le cinque regole - chiedere **il calcolo e non il prezzo**,
con le giornate previste per attività e il metodo di calcolo con riferimento alla tariffa pubblicata;
**chiedere impegni sui tempi delle singole fasi** (verifica di completezza, primo ciclo di quesiti,
tempo di risposta alle repliche) e i rimedi in caso di scostamento; chiedere un riesame preliminare a
pagamento quando offerto; chiedere l'audit combinato; confrontare il totale e non la tariffa. Esiste
anche la ragione per cui l'invio precede il soggetto: `Q-280` e `R-30` dichiarano che **la richiesta
di informazioni non richiede il soggetto costituito**, mentre il contratto lo richiede, e che la coda
è il vincolo effettivo.

**Che cosa manca, ed è più di quanto il criterio lasci intendere.**

1. **L'elenco degli organismi designati non esiste in nessun documento del progetto.** Il criterio
   chiede l'invio «a ciascun organismo notificato designato per la categoria di dispositivo
   pertinente secondo l'elenco pubblicato nella banca dati europea». La **categoria di designazione**
   pertinente **non è documentata**: `02-qualificazione-e-classificazione.md` determina la Classe IIa
   e la procedura dell'Allegato IX, e non dichiara alcun codice di designazione. **`[NV]`** -
   l'individuazione del codice e la lettura dell'elenco sono lavoro da fare, ed è ciò che rende
   l'elenco dei destinatari verificabile invece che opinabile.
2. **Il testo della richiesta non esiste.**
3. **Il registro degli invii non esiste.**

**Come si dimostra.** Coesistono: **(a)** il testo della richiesta, versionato, che contiene le
cinque domande del §8.3 e nessuna delle formule vietate di `01 §11`; **(b)** la ricognizione degli
organismi designati per la categoria pertinente, con la fonte consultata e la data di consultazione;
**(c)** un registro con **una riga per ciascun organismo dell'elenco**, con data di invio e canale.
Il criterio è **non soddisfatto** se esiste anche una sola riga priva di data, o se l'elenco dei
destinatari non è riconducibile a una ricognizione registrata: «li abbiamo contattati tutti» non è
un enunciato verificabile.

> **Una precisazione che il criterio impone.** La richiesta è **di informazioni**, non un'offerta di
> contratto, e va scritta perché resti tale anche se letta da chi ha interesse a leggerla
> diversamente. Il testo non contiene alcuna dichiarazione di prontezza del prodotto, alcuna data e
> alcuna formulazione da cui si ricavi un esito: la destinazione d'uso si ricava **anche** dal
> materiale che si spedisce.

### Criterio 4 - Bozza del piano di valutazione clinica, con il fabbisogno di competenza clinica dichiarato

**Che cosa esiste già.** La struttura è definita: `07-valutazione-clinica.md` §4 elenca il contenuto
di `CE-PLAN-001` - destinazione d'uso e affermazioni da dimostrare, stato dell'arte, parametri
clinici e criteri di accettabilità, strategia dell'evidenza per ciascuna delle tre componenti,
protocollo della ricerca, piano di seguito - e dichiara che il progetto produce la **bozza tecnica
con la parte di validazione tecnica già compilata**, mentre approvazione e assunzione sono
**riservate al ruolo**. La dipendenza a monte è soddisfatta: la destinazione d'uso è **congelata** da
`D55` sulla raccolta differita di parametri per la revisione periodica del professionista (`V-144`),
e §2.2 dichiara che il congelamento rende avviabile **la parte metodologica**. Il fabbisogno è già
nominato: §4.1 dice che il dossier dello stato dell'arte *«richiede una competenza clinica
documentabile che il progetto oggi non ha internamente»*, ed è `Q-176`, aperta verso il committente.

**Che cosa manca.** La bozza come artefatto, e la **forma** con cui il fabbisogno si intende
acquisire, che il criterio richiede esplicitamente: `Q-176` pone la domanda e non la risolve. Resta
inoltre non soddisfatta una condizione a monte che non è di questo traguardo ma vi incide: `D46` e
`D55` impongono che la destinazione d'uso congelata sia **sottoposta a revisione esterna prima** di
ingaggiare qualunque organismo notificato, e quella revisione **non è stata condotta** (`Q-275`), che
osserva anche come sia l'unica prescrizione di `D46` eseguibile **senza** il soggetto costituito.

**Come si dimostra.** Esiste un documento in bozza che porta **tutte** le voci di contenuto elencate
in `07 §4` per `CE-PLAN-001`, dove ogni voce è o compilata o presente come sezione dichiarata vuota
**con la ragione dell'assenza** - una sezione mancante e una sezione dichiarata vuota non sono la
stessa cosa, e solo la seconda è verificabile. Contiene inoltre una sezione che nomina il fabbisogno
di competenza clinica e la forma con cui si intende acquisirlo. Il criterio **non** chiede
l'approvazione del piano, che è atto riservato al ruolo: chiederla sarebbe pianificare un'attività
non producibile (`V-281`).

### Criterio 5 - Nessun documento del traguardo contiene una data di marcatura; la verifica è testuale

**Che cosa esiste già.** La regola, nella forma più precisa che il progetto abbia:
`01-inquadramento-normativo.md` §11 la scompone in quattro regole - l'intenzione si esprime con il
verbo «intende» e mai con un futuro indicativo; l'assenza del soggetto giuridico si ripete **nella
stessa frase** in cui l'intenzione compare e non è rinviabile a una nota; lo stato di fatto negativo
sta **in prima posizione**, in grassetto; **nessuna data, nessuna finestra temporale, nessun
«entro»**, con l'unica occorrenza ammessa dentro l'enunciato del divieto stesso. Esiste un precedente
di metodo: `scripts/verifica-dichiarazione-non-marcatura.sh`, provato su artefatto deliberatamente
privo, fondato su **elementi strutturali** e non su una frase che una riformulazione cambierebbe
(`00-indice.md` §8.4).

**Che cosa manca.** Il controllo. `scripts/verifica-conformita-redazionale.sh` verifica il
frontmatter, i rinvii relativi che escono da `docs/` e i segnaposto di segreti: **non cerca date di
marcatura**. `scripts/verifica-dichiarazione-non-marcatura.sh` verifica la **presenza** della
dichiarazione su un artefatto pubblicato, che è la proprietà complementare e non questa. Oggi
**nessuno script del repository fallisce se un documento afferma una data di marcatura**.

**Come si dimostra.** Esiste un controllo eseguibile che, applicato ai documenti prodotti da `T-14`,
fallisce quando vi trova la co-occorrenza di una menzione di marcatura o di dichiarazione di
conformità e di un riferimento temporale - data, mese, trimestre, anno, o le forme «entro», «a
partire da», «non oltre». Il controllo è **provato al contrario**, con un documento deliberatamente
non conforme che deve farlo fallire: *un controllo che non è stato visto fallire non è un controllo*
(`T-03` criterio 2, formulazione che questo piano adotta). L'esito è registrato con la data.

> **Perché conviene che il controllo nasca qui e non a `T-10`.** È anche il criterio bloccante di
> rilascio n. 15 di `03-primo-rilascio-utilizzabile.md` §8 e la risposta strutturale di `R-19`.
> Scriverlo ora costa una volta sola e presidia da subito la superficie che `D58` ha reso più
> esposta: la vicinanza fra «il progetto intende certificare» e «il prodotto sarà certificato», che
> `R-19` descrive come facili da confondere **in buona fede**. Scrivere controlli di verifica non
> viola `V-182`, che vieta il **codice applicativo**: è la stessa collocazione deliberata dei criteri
> 5 e 7 di `T-01`, che precedono la pipeline di `T-03` e sono i primi due controlli che essa riceve.

---

## 4. La sequenza dei lavori, con le dipendenze

I lavori sono nominati con etichette locali di questo documento - «Lavoro 1»… - e **non sono
identificativi di progetto**: non appartengono alle famiglie `T-`, `Q-`, `V-`, `S-`, `R-`, non
entrano nella matrice di tracciabilità e non possono comparire in una prova (`00-indice.md` §11).

| # | Lavoro | Genere | Criterio servito | Dipende da | Parallelizzabile con |
|---|---|---|---|---|---|
| 1 | Ricognizione degli organismi designati, con fonte e data | Documentale | 3 | Individuazione del codice di designazione (`[NV]`) | 2, 3, 4, 6, 7 |
| 2 | Testo della richiesta di informazioni, versionato | Documentale | 3 | Nulla | 1, 3, 4, 6, 7 |
| 3 | Documento di profilo della persona responsabile | Documentale | 2 | Nulla | 1, 2, 4, 6, 7 |
| 4 | Bozza del piano di valutazione clinica | Documentale | 4 | Destinazione d'uso congelata (**soddisfatta**, `D55`) | 1, 2, 3, 6, 7 |
| 5 | Registro di avvio: forma giuridica, pratica, data | Registrazione | 1 | **Decisione del committente su `Q-280`** | - |
| 6 | Registri delle richieste, con date | Registrazione | 2, 3 | Lavori 1, 2, 3 per il contenuto | 4, 7 |
| 7 | Controllo testuale sull'assenza di date di marcatura, provato al contrario | Verifica | 5 | Nulla per la scrittura; 1–4 per l'esecuzione | 1, 2, 3, 4 |

**Il grafo, in una riga.** Sei lavori su sette non hanno dipendenze fra loro e possono procedere in
qualunque ordine; il settimo - il registro di avvio della costituzione - **non dipende da lavoro
tecnico e non è accelerabile da esso**: dipende da una decisione del committente, ed è la sola voce
il cui ritardo non si compensa in alcun modo.

**Che cosa è parallelizzabile e che cosa no, senza attenuazioni.** È parallelizzabile tutto ciò che
è documentale, ma **la capacità che lo esegue è una sola persona** (`D54`, `D62`): parallelizzare qui
significa «l'ordine è libero», non «si fanno insieme». Non è parallelizzabile nulla rispetto all'atto
giuridico, perché non è lavoro: è attesa di un procedimento.

**L'ordine consigliato, e la sua ragione.** Prima i lavori 2 e 3, perché il loro prodotto serve a
**mettere in coda** qualcun altro - l'organismo, il professionista qualificato - e la coda è il
vincolo effettivo di un traguardo di classe `B`. Poi il lavoro 1, che senza il codice di designazione
resta incompleto e va comunque avviato per far emergere l'`[NV]`. Poi il 6, che senza i precedenti
non ha righe. Il lavoro 4 può stare ovunque: non mette in coda nessuno e non blocca nessuno. Il
lavoro 7 si scrive quando esiste il primo documento su cui girare, e si esegue sull'insieme completo
prima di dichiarare chiuso il traguardo.

---

## 5. Il costo dichiarato di ciascun lavoro

**Non ci sono ore in questa tabella, ed è deliberato.** Il progetto non produce stime di sforzo:
mancano una cronologia di consegna su cui calibrare e un'unità che attraversi lavori eterogenei
(`02-traguardi.md`, avvertenza sulle date; `D62`, che quantifica la capacità **senza** trasformare
le allocazioni in stime). Il costo si dichiara nei termini che il progetto usa: **la classe
dell'attività**, **ciò da cui dipende**, **se è comprimibile**.

| # | Lavoro | Classe | Dipende da | Comprimibile |
|---|---|:-:|---|---|
| 1 | Ricognizione degli organismi designati | `D` | Disponibilità e leggibilità dell'elenco pubblicato; codice di designazione, oggi `[NV]` | Sì, salvo l'`[NV]` |
| 2 | Testo della richiesta | `D` | Nulla che non sia già scritto in `09 §8.3` | Sì |
| 3 | Profilo della persona responsabile | `D` | Nulla che non sia già scritto in `09 §9.1`; resta l'`[NV]` sulla numerazione dei paragrafi | Sì, salvo l'`[NV]` |
| 4 | Bozza del piano di valutazione clinica | `D` | Destinazione d'uso congelata, già soddisfatta; la **forma di acquisizione** della competenza dipende da `Q-176` | Parzialmente: la struttura sì, la sezione sul fabbisogno no |
| 5 | Registro di avvio della costituzione | **`B`** | **Decisione del committente su `Q-280`**, poi procedimenti amministrativi | **No.** «Poche ore e molti mesi» |
| 6 | Registri con le date | `D` | I lavori 1–3 | Sì |
| 7 | Controllo testuale, provato al contrario | `D` | Nulla | Sì |

**La riga 5 è il piano.** Le altre sei messe insieme non spostano di un giorno la riga 5, e la riga 5
da sola determina quando il resto del percorso ha un soggetto che possa compierlo. È la proprietà che
`R-30` descrive come impatto **crescente**: ogni settimana di ritardo si trasferisce integralmente in
fondo alla catena, e nessun aumento di capacità la recupera.

**Che cosa questo piano non dichiara, e perché.** Non dichiara una durata per la costituzione del
soggetto. `02-traguardi.md` §8 la marca `[NV]` e dichiara che i tempi non sono attestati da una fonte
citabile. `09-percorso-e-calendario.md` §8.1 le assegna invece un tempo minimo dichiarato: **la
divergenza fra i due documenti è registrata al §9 e non viene sanata qui**, perché sanarla scegliendo
un numero significherebbe far entrare dalla finestra la stima che la roadmap ha escluso dalla porta.

---

## 6. Le dipendenze esterne, e che cosa accade se non arrivano

Una dipendenza esterna non è un rischio: è una **condizione strutturale**
(`05-rischi-e-dipendenze.md` §3). Il rischio è ciò che accade quando la si mette sul percorso
critico - e qui, per costruzione, tre delle cinque ci stanno.

| Dipendenza | Chi la controlla | Che cosa ne dipende in `T-14` | Se non arriva |
|---|---|---|---|
| **Procedimento amministrativo di costituzione** | Amministrazione | Criterio 1 quanto all'**esito**; nulla quanto all'**avvio** | Il criterio 1 **resta soddisfatto** se l'avvio è registrato: la fonte lo àncora all'avvio proprio per questo. Restano bloccati a valle tutti gli atti riservati al ruolo (`R-30`, `Q-272`) |
| **Risposta degli organismi notificati** | Terzi privati designati | Nulla, in `T-14`: il criterio è sull'invio | Se nessun organismo risponde con una disponibilità reale entro un termine registrato dalla data di invio, l'indicatore di `R-06` è osservato e lo scenario di riferimento di `02 §5` è già decaduto: va dichiarato nella revisione successiva, non atteso |
| **Mercato dei professionisti con qualifica documentabile** | Mercato | Nulla, in `T-14`: il criterio è sull'avvio della ricerca | Se il tempo fra prima richiesta e risposta supera le due settimane, `R-22` è osservato e la pianificazione va rifatta su quel dato. La deroga per le micro e piccole imprese **non aiuta**: aumenta la domanda sullo stesso mercato |
| **Competenza clinica documentabile** | Mercato, e una decisione di spesa | Criterio 4, per la sola sezione sul fabbisogno | Il criterio resta soddisfacibile **dichiarando** il fabbisogno e l'assenza della forma di acquisizione: è ciò che il criterio chiede alla lettera. Non si recupera il tempo del dossier dello stato dell'arte, che `07 §2` colloca su una catena seriale non comprimibile |
| **Elenco pubblicato degli organismi designati** | Amministrazione europea | Criterio 3, per l'individuazione dei destinatari | Se il codice di designazione pertinente non è determinabile, l'elenco si dichiara costruito su un criterio esplicito e l'`[NV]` resta scritto. **Non si invia a un elenco scelto per comodità senza dichiarare come è stato costruito** |

> **La regola comune dell'area, e la famiglia che la viola.** `05 §3.1` prescrive che ogni dipendenza
> esterna abbia una modalità degradata provata. **Le prime tre righe non ne hanno una**: non esiste
> una versione degradata di un procedimento amministrativo, di una coda altrui o della disponibilità
> di una persona qualificata. Ciò che il progetto può fare è **entrare in coda prima**, ed è
> esattamente ciò che `T-14` è.

---

## 7. I rischi propri del traguardo, con la contromisura

| Rischio | Che cos'è | Indicatore, dalla fonte | Contromisura di questo piano |
|---|---|---|---|
| `R-30` - Il ruolo di fabbricante non è ancora costituito · *Accertato* · `I3 crescente` | Il soggetto non esiste e più passi lo presuppongono formalmente | Superamento del **19 settembre 2026** senza che `Q-280` sia decisa e senza data di avvio registrata | Nessuna, sul piano tecnico: è atto del committente. Ciò che il piano fa è **rendere l'indicatore osservabile**, creando il registro in cui la data mancante è visibile come riga vuota, invece che come silenzio |
| `R-06` - I tempi degli organismi notificati · *Alta* · `I3` | Code lunghe, organico in contrazione, e **un fabbricante nuovo, micro, alla prima certificazione non è un cliente prioritario**: il profilo descritto è il nostro | Numero di organismi che rispondono con disponibilità reale, non con un listino, entro un termine registrato dalla data di invio | Inviare **prima** che il soggetto esista; chiedere il calcolo e non il prezzo; chiedere impegni sui tempi delle singole fasi. Registrare la data di invio per ciascuno: senza, l'indicatore non esiste |
| `R-22` - Le figure specialistiche sono una risorsa scarsa · *Media* · `I3` | Qualifica documentabile e disponibilità permanente; la deroga per le piccole imprese aumenta la domanda | Tempo fra prima richiesta e risposta; oltre due settimane il mercato è saturo | Avviare la ricerca **prima** che serva - è la ragione della data del traguardo. **Non è più ammesso trasferire con dichiarazione**: con `D58` il fabbisogno è nostro |
| `R-19` - Il materiale pubblico non è allineato ai claim approvati · *Accertato* · `I5` | `D58` introduce la tentazione di annunciare l'intenzione di certificare come esito datato | La durata: ogni revisione registra da quanti giorni la condizione persiste | Il criterio 5, e il controllo del lavoro 7 - la sola misura di questo elenco che **si automatizza** |
| `R-29` - Le registrazioni a ruoli distinti non sono producibili · *Accertato* · `I5` | Tocca `T-14` di sfioro e va nominato: nulla in questo traguardo produce registrazioni a ruoli distinti, e nulla vi si sostituisce | Superamento del **30 settembre 2026** senza decisione su `Q-189` | Nessuna: `V-281` vieta di pianificare l'attività. Il piano si limita a **non presentare** come verifica ciò che è auto-verifica |

**Un rischio che la fonte non attribuisce a `T-14` e che questo piano nomina.** `R-07` - i cicli di
risposta alle non conformità occupano le stesse persone - non colpisce `T-14`, ma il criterio 3 è il
momento in cui il progetto può ridurlo a costo quasi nullo: la seconda e la terza regola del §8.3
(impegni sui tempi delle singole fasi; riesame preliminare a pagamento) esistono precisamente per
questo, e chiedere l'una e non l'altra è la forma più comune di risparmio apparente. La riserva
formale per quelle voci è `Q-188` e resta aperta.

---

## 8. Che cosa `T-14` non comprende, e dove è coperto

| Non compreso | Dove è coperto |
|---|---|
| La **firma di qualunque contratto** | `T-13`, pianificazione interna; presuppone il soggetto costituito |
| La **sottomissione di qualunque fascicolo** | `T-12` per il pacchetto consegnabile; `T-13` per il percorso |
| L'**esecuzione della valutazione clinica** e la firma del rapporto | `07-valutazione-clinica.md` §4: `CE-REP-001` è **solo del fabbricante**, firmato da valutatore qualificato con dichiarazione di assenza di conflitto. Non producibile dal progetto **in nessuna forma, nemmeno in bozza** |
| L'**apposizione della marcatura** | Atto esclusivo del fabbricante, non anticipabile né sostituibile (`09 §7.1`). **Nessuna data, in nessun luogo** |
| L'**esistenza** del soggetto giuridico | Esito di procedimento esterno; `[NV]` dichiarato in `02 §8` |
| La **revisione esterna della destinazione d'uso congelata** (`D46`, `D55`) | `Q-275`, aperta. È eseguibile **senza** il soggetto costituito e non è in `T-14`: va deciso se collocarla altrove o dichiararne il rinvio |
| Il **sistema di gestione della qualità** | `docs/08_compliance/03-sistema-di-gestione-della-qualita.md`; l'unica parte a calendario nel 2026 è il controllo dei documenti, che è `T-01` criterio 1 |
| Le **registrazioni a ruoli distinti** | Non sono attività: sono lacune dichiarate (`V-281`, `R-29`, `Q-189`, `TG-20`) |
| Le **valutazioni formative di usabilità** | `Q-273`: attività nostra e non differibile, ma richiede soggetti distinti da chi ha progettato l'interfaccia. Fra i tagli irreversibili di `03 §5` |

---

## 9. Contraddizioni fra documenti, incontrate e non corrette

**Nessuna è stata corretta**: la correzione appartiene ai titolari delle aree.

1. **La durata della costituzione è insieme non stimabile e stimata.** `02-traguardi.md` §8 la
   dichiara `[NV]`; `09-percorso-e-calendario.md` §8.1 le assegna un tempo minimo, e il diagramma del
   §3.4 le assegna una barra con inizio e fine.
2. **La data dell'invio delle richieste agli organismi è dichiarata tre volte in modo diverso.**
   `T-14` criterio 3 la colloca al 19 settembre 2026; `09 §3.5` la registra come punto di decisione
   irreversibile al 30 settembre 2026; il diagramma di `09 §3.4` colloca «Richieste di informazioni e
   di offerta» in una barra che comincia dopo entrambe.
3. **La bozza del piano di valutazione clinica ha due collocazioni incompatibili.** Il criterio 4 la
   vuole al 19 settembre 2026; il diagramma di `09 §3.4` colloca «Piano di valutazione clinica» in
   una barra che comincia dopo quella data e finisce molto oltre.
4. **`01 §11` vieta «nessuna data, nessuna finestra temporale, nessun "entro"» in ogni artefatto, e
   `09 §§3.1–3.4` contiene voci datate che culminano nella marcatura.** Il capitolo `09` le qualifica
   come pianificazione interna e le fa precedere da un'avvertenza; `01 §13` dichiara che la data della
   marcatura **manca deliberatamente** dalla propria tabella e rinvia a `09`. Il punto non è che `09`
   menta: **entrambi i capitoli sono pubblicati sul sito**, e la questione su forma e ammissibilità
   di quella pubblicazione è `Q-179`, tuttora aperta. Questo piano non riproduce quelle voci, non le
   conferma e non ne deriva alcuna data.
5. **`09 §4` attribuisce ancora la marcatura a «un fabbricante, che oggi non esiste».** È la
   formulazione da terzo che `D58` ha sostituito; `Q-271` la segnala già insieme ad altri tre residui
   dello stesso capitolo. Resta aperta.
6. **La revisione del 26 agosto 2026 non riporta lo stato di `T-14`.** `00 §8.1` prescrive che ogni
   revisione produca, **per ciascun traguardo aperto**, lo stato dei criteri in forma binaria; la
   tabella di `00 §8.4` riporta `T-01`, `T-03`, `T-06`, `T-08` e `T-10`, e omette `T-02`, `T-04`,
   `T-05`, `T-07` e `T-14`. Per un traguardo di classe `B` con punto di decisione al 19 settembre,
   l'omissione è quella che pesa di più: è il traguardo il cui ritardo non si osserva lavorando.

---

## 10. Come si dichiara chiuso il traguardo

`T-14` è chiuso quando **tutte e cinque** le caselle sono barrate, e non prima. Una casella non
barrata rende il traguardo non raggiunto, e il rapporto dice **quale**.

- [ ] **Criterio 1** - Esiste la riga di registro con forma giuridica, riferimento della pratica e data di avvio, e nessuno dei tre campi è vuoto.
- [ ] **Criterio 2** - Esistono il documento di profilo e il registro delle richieste, con almeno una data di prima richiesta.
- [ ] **Criterio 3** - Esistono il testo versionato della richiesta, la ricognizione degli organismi designati con la fonte, e il registro degli invii senza righe prive di data.
- [ ] **Criterio 4** - Esiste la bozza del piano di valutazione clinica con tutte le voci di `07 §4`, ciascuna compilata o dichiarata vuota con la ragione, e con la sezione sul fabbisogno di competenza clinica.
- [ ] **Criterio 5** - Esiste il controllo testuale, è stato **visto fallire** su un documento deliberatamente non conforme, ed è stato eseguito con esito registrato e datato sull'insieme dei documenti prodotti dal traguardo.

**E una casella che non è un criterio, senza la quale la chiusura è muta:** lo stato di `T-14` entra
nella tabella della revisione periodica, in forma binaria, accanto agli altri traguardi aperti.
