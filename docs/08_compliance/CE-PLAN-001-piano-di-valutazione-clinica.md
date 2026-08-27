---
title: "CE-PLAN-001 - Piano di valutazione clinica (bozza)"
sidebar_position: 13
description: "Bozza tecnica del piano di valutazione clinica. Porta tutte le voci di contenuto che il capitolo 07 §4 elenca per CE-PLAN-001, ciascuna compilata oppure dichiarata vuota con la ragione dell'assenza. Compila la strategia della validazione tecnica, dichiara vuote le voci che richiedono una competenza clinica documentabile o il ruolo di fabbricante, nomina il fabbisogno di competenza clinica e le forme con cui si intende acquisirlo, e registra le due condizioni a monte non soddisfatte."
---

# `CE-PLAN-001` - Piano di valutazione clinica (bozza)

> **Stato di fatto, prima di ogni altra riga.** Il prodotto **non reca marcatura CE**, **non è
> coperto da alcuna dichiarazione di conformità** e **non è utilizzabile per l'erogazione di
> prestazioni sanitarie su pazienti reali**. **Nessuna valutazione clinica è stata condotta**: non
> esiste un piano approvato, non esiste una ricerca sistematica avviata, non esiste un rapporto, e
> **nessun beneficio clinico è ad oggi dimostrato**. Questo documento è una **bozza tecnica** e non
> attenua una sola di queste righe.
>
> Il progetto **intende** assumere il ruolo di fabbricante (`D58`), e **il soggetto giuridico che
> lo eserciterebbe è ancora da costituire**. L'approvazione e l'assunzione di questo piano sono
> atti che la norma riserva a quel ruolo ([07 §4](./07-valutazione-clinica.md)) e **non
> appartengono a questa bozza**.
>
> **Chi legge che il progetto intende certificare e ne conclude «allora posso usarlo» trae una
> conclusione sbagliata.** L'intenzione non copre nessuno, non trasferisce alcun obbligo e non
> rende utilizzabile una versione non certificata: chi installa, integra o mette in servizio il
> software oggi assume per intero gli obblighi che ne derivano.
>
> **Nessuna data compare in questo documento.** Non una data di marcatura, non una finestra, non un
> termine, in nessuna forma e per nessuna voce: è il vincolo
> [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) nella lettura che ne dà
> [01 §11](./01-inquadramento-normativo.md), regola 4. Le durate che compaiono sono citate dal
> capitolo [07 §2](./07-valutazione-clinica.md) come proprietà delle attività, e **una durata non è
> un termine**.

---

## 1. Scheda del piano

| Voce | Valore |
|---|---|
| **Identificativo del documento regolatorio** | `CE-PLAN-001`, nello spazio riservato dal vincolo [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172) e assegnato da [07 §4](./07-valutazione-clinica.md) |
| **Identificativo nel repository** | Il percorso assoluto: [`docs/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md`](CE-PLAN-001-piano-di-valutazione-clinica.md), secondo la regola di identificazione della [procedura di controllo dei documenti](/08_compliance/PROCEDURA-controllo-dei-documenti.md) |
| **Gemello inglese** | [`website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md`](https://github.com/fedcal/Telemedic/blob/main/website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md). Le due versioni sono **lo stesso documento in due lingue**, non due documenti |
| **Versione** | L'impronta del commit che ha modificato per ultimo il file, leggibile con `git log -1 --format=%H -- docs/08_compliance/CE-PLAN-001-piano-di-valutazione-clinica.md`. **Non è trascritta qui**: un'impronta scritta in questo campo sarebbe falsa dal commit successivo |
| **Stato** | **Bozza tecnica. Non approvata, non assunta, non firmata.** Non è un documento del fascicolo tecnico e non lo diventa per il fatto di essere pubblicata |
| **Chi la redige** | Il **contributore unico** del progetto, che è anche il revisore nominato per la riga `/docs/08_compliance/` di [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS). La coincidenza fra chi redige e chi rivede è la lacuna dichiarata come prima voce di [`Q-189`](../11_registri/02-questioni-aperte.md#q-189), e qui si dichiara invece di essere taciuta |
| **Chi dovrebbe approvarla** | **Il fabbricante**, cioè il ruolo formale che il progetto **intende** assumere e il cui **soggetto giuridico è ancora da costituire**. [07 §4](./07-valutazione-clinica.md) assegna al progetto la bozza tecnica e al fabbricante l'approvazione e l'assunzione |
| **Data di approvazione** | **Nessuna.** Il documento non è approvato, e la ragione è al § 2 |
| **Riesame** | Obbligatorio se cambia la formulazione della destinazione d'uso, se la revisione esterna di [`Q-275`](../11_registri/02-questioni-aperte.md#q-275) produce un rilievo sulla formulazione, o se la decisione del committente su [`Q-176`](../11_registri/02-questioni-aperte.md#q-176) rende disponibile la competenza clinica del § 10 |

**Come si legge il campo «Stato».** «Bozza» non significa «testo provvisorio scritto in fretta»:
significa che il testo è quello che il progetto propone e che l'atto mancante è **l'approvazione**,
non la scrittura. La distinzione conta perché è la stessa che
[la procedura di controllo dei documenti](/08_compliance/PROCEDURA-controllo-dei-documenti.md)
applica al proprio campo di stato, ed è verificabile: chi trova questo campo modificato senza che
esista il soggetto che possa approvare ha trovato un difetto, non un aggiornamento.

---

## 2. Che cos'è questo documento, e perché oggi non può essere approvato

Questo documento **non è un capitolo**. I capitoli di quest'area sono ingressi divulgativi e
nessuno di essi è una procedura o un documento del sistema di gestione della qualità: è il vincolo
[`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174), che questa bozza non scalfisce perché non
si presenta come capitolo. È invece la **bozza tecnica di un documento regolatorio** che
[07 §4](./07-valutazione-clinica.md) attribuisce al progetto, e che il fabbricante dovrà approvare
e assumere per intero prima che valga qualcosa.

**Perché non può essere approvato oggi, in tre condizioni che vanno lette insieme.**

La prima è che **il soggetto manca**. Il progetto **intende** assumere il ruolo di fabbricante e
**il soggetto giuridico che lo eserciterebbe non è costituito**: non esiste nessuno che possa
apporre una firma che sia una dichiarazione anziché una firma su un testo.

La seconda è che **manca l'apparato che rende una firma una dichiarazione**. Anche a soggetto
costituito, un piano di valutazione clinica approvato fuori da un controllo dei documenti in
esercizio non è ancorabile a una revisione esatta, e un documento che non dichiara a quale
revisione si riferisce è precisamente l'oggetto che un organismo notificato non può accettare
([02 §5.2](./02-qualificazione-e-classificazione.md)). Ne discende un costo che va detto e non
smussato: **un documento nato fuori dal controllo documentale va riemesso, non semplicemente
approvato dopo** ([03 §4.1](./03-sistema-di-gestione-della-qualita.md); [09 §5](./09-percorso-e-calendario.md), attività irrecuperabile n. 3). Questa
bozza è quindi materiale preparatorio che risparmia tempo di scrittura, **non** tempo di emissione.

La terza è che **manca la persona**. La determinazione che l'evidenza sia sufficiente presuppone un
valutatore qualificato con dichiarazione di assenza di conflitto di interessi, figura che il
progetto non ha internamente. È la stessa ragione per cui `CE-REP-001`, il rapporto di valutazione
clinica, **non è producibile dal progetto in nessuna forma, nemmeno in bozza**, e per cui questo
documento si ferma dove comincia quel rapporto.

**Una conseguenza redazionale che vale per tutto ciò che segue.** Dove una voce non è compilabile,
questo piano scrive una sezione **dichiarata vuota con la ragione dell'assenza**, e non omette la
sezione. Una sezione mancante e una sezione dichiarata vuota non sono la stessa cosa: solo la
seconda è verificabile da chi legge, e solo la seconda impedisce che il vuoto si scopra quando
costa di più. È la stessa disciplina che il vincolo
[`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281) impone alla pianificazione - ciò che non è
producibile si dichiara come lacuna e non si pianifica come attività - applicata qui alla
redazione.

---

## 3. Le voci di contenuto di `07 §4`, e lo stato di ciascuna

[07 §4](./07-valutazione-clinica.md) elenca il contenuto di `CE-PLAN-001` in sei voci. Sono
riportate qui **nell'ordine e nei termini della fonte**, perché è su quell'elenco che la
completezza di questa bozza si misura, e non su un elenco plausibile ricavato dall'impianto
generale del regolamento.

| # | Voce di contenuto, da `07 §4` | Sezione di questo piano | Stato |
|:-:|---|---|---|
| 1 | Destinazione d'uso e **affermazioni da dimostrare** | § 4 | **Compilata**, con un residuo dichiarato e motivato al § 4.3 |
| 2 | **Stato dell'arte** | § 5 | **Dichiarata vuota**, con la ragione |
| 3 | **Parametri clinici e criteri di accettabilità** | § 6 | **Compilata quanto al metodo e alla forma**; **dichiarata vuota quanto ai valori**, con la ragione |
| 4 | **Strategia dell'evidenza** per ciascuna delle tre componenti | § 7 | **Una componente compilata** (§ 7.2), **due dichiarate vuote** con la ragione (§§ 7.1 e 7.3) |
| 5 | **Protocollo della ricerca** | § 8 | **Compilata quanto al metodo**; **dichiarata vuota quanto alle interrogazioni**, con la ragione |
| 6 | **Piano di seguito** | § 9 | **Compilata quanto alla strumentazione**; **dichiarata vuota quanto all'impegno**, con la ragione |
| - | *Fabbisogno di competenza clinica e forma di acquisizione* - non è voce di `07 §4`: è richiesta propria del criterio 4 di `T-14` | § 10 | **Compilata** |

**Che cosa questa tabella dichiara, e che cosa no.** Dichiara che nessuna voce dell'elenco è
assente da questo documento. **Non** dichiara che il piano sia completo: quattro voci su sei hanno
una parte vuota, e la somma di quelle parti è la maggioranza del lavoro di valutazione clinica.
Leggere la prima colonna come un avanzamento sarebbe l'errore che
[07 §2.1](./07-valutazione-clinica.md) descrive per esteso - scambiare per lavoro documentale
un'attività di metodo che non si comprime con risorse.

---

## 4. Destinazione d'uso e affermazioni da dimostrare

### 4.1 La formulazione da cui tutto discende

La formulazione della destinazione d'uso del telemonitoraggio **è congelata** dalla decisione `D55`
ed è **«raccolta differita di parametri per la revisione periodica del professionista»**. È la
formulazione su cui è scritto l'intero modello di dominio, ed è vincolante per ogni artefatto del
progetto ai sensi di [`V-144`](../11_registri/01-vincoli-in-vigore.md#v-144): nessun documento,
nessuna interfaccia, nessun nome di classe o di evento può usare «monitoraggio in tempo reale»,
«sorveglianza continua» o formule equivalenti. La formulazione alternativa è **esclusa**, e con
essa il corpus di letteratura che le corrisponderebbe.

**Perché il congelamento vale più qui che altrove.** Per la valutazione clinica la differenza fra
le due formulazioni non era di classe: era **di corpus**. Le stringhe di interrogazione, i criteri
di inclusione e lo stato dell'arte di riferimento sono letteralmente diversi nei due casi, e
cambiare formulazione dopo l'avvio della ricerca non modificherebbe un paragrafo: **azzererebbe il
lavoro** ([07 §2.2](./07-valutazione-clinica.md)).

### 4.2 Le affermazioni da dimostrare, una per una

Il beneficio clinico dichiarato appartiene al **secondo ramo** della definizione dell'art. 2 del
Regolamento (UE) 2017/745 - l'effetto positivo sulla **gestione del paziente** - e non al ramo
degli esiti diagnostici. La formulazione che il progetto propone come bozza, riportata da
[07 §1.1](./07-valutazione-clinica.md), è: *consentire l'accesso a prestazioni programmate a
persone per le quali l'accesso in presenza è oneroso o non tempestivo, mantenendo la completezza e
la tracciabilità dell'informazione clinica*.

Da quella formulazione discendono **tre affermazioni positive**, e nessun'altra. L'elenco è chiuso:
ogni parola aggiunta alla destinazione d'uso è evidenza in più da produrre, e ogni affermazione
aggiunta riapre i criteri di inclusione della ricerca del § 8.

| Sigla locale | Affermazione da dimostrare | Componente dell'evidenza che la copre | Dove sta l'evidenza in questo piano |
|:-:|---|---|---|
| `AF-1` | L'uso del dispositivo **consente l'accesso** a prestazioni programmate a persone per le quali l'accesso in presenza è oneroso o non tempestivo | Terza componente, in via prevalente; seconda in via strumentale | § 7.3, **vuoto dichiarato**; il seguito clinico del § 9 è ciò che deve colmarlo |
| `AF-2` | L'uso del dispositivo **mantiene la completezza** dell'informazione clinica | Seconda componente per la trasmissione e la conservazione; terza per l'effetto sulla gestione | § 7.2 per la parte tecnica; § 7.3 **vuoto dichiarato** per l'effetto |
| `AF-3` | L'uso del dispositivo **mantiene la tracciabilità** dell'informazione clinica | Seconda componente, in via prevalente | § 7.2 |

**Le sigle `AF-` sono locali a questo documento** e non appartengono ad alcuna famiglia di
identificativi del progetto: non entrano nella matrice di tracciabilità e non possono comparire in
una prova. Servono a rendere citabile una riga dentro questo testo, e a null'altro.

**L'asimmetria che sfugge, e che questo piano registra perché è la ragione di metà del lavoro del
§ 8.** «Mantenendo la completezza dell'informazione clinica» non è una clausola difensiva: è
un'**affermazione da dimostrare**, e come tale determina una parte dei criteri di inclusione della
ricerca e almeno una grandezza da misurare nel seguito clinico. Non esistono parole neutre in una
destinazione d'uso.

**Le affermazioni negative, che costano quanto quelle positive.** Le quattro esclusioni di
[02 §4.3](./02-qualificazione-e-classificazione.md) - nessun monitoraggio in tempo reale di
parametri vitali su pazienti critici o instabili, nessuna generazione di allarmi con finalità di
emergenza o di soccorso, nessun uso come unico o primario mezzo di sorveglianza, nessuna
generazione autonoma di informazione clinica non redatta dal professionista - **non sono un
contorno del perimetro: sono condizioni di validità della classificazione**, e questo piano le
recepisce come tali. Se una sola di esse cade nel prodotto, cade la determinazione di
classificazione, cambia il corpus della ricerca e questo piano va riscritto dalla presente sezione
in avanti.

### 4.3 Che cosa di questa voce resta non compilabile, e perché

Tre parti, dichiarate qui invece di essere lasciate dedurre.

**La prima.** La sezione 10 della traccia di destinazione d'uso - **limiti d'uso e requisiti
dell'ambiente operativo**, cioè le soglie sotto le quali il sistema segnala la degradazione e
sconsiglia la prosecuzione - **non è compilabile**, perché quelle soglie non sono state misurate
([`Q-115`](../11_registri/02-questioni-aperte.md#q-115), come richiamata da
[02 §5.1](./02-qualificazione-e-classificazione.md)). Non si scrive un valore per completare una
tabella: dal momento in cui una soglia è dichiarata nella destinazione d'uso diventa **prestazione
dichiarata**, e dichiarare una soglia che il prodotto non rispetta è più grave che non dichiararne
alcuna. Nessuna soglia italiana è imposta dalla normativa
([`V-12`](../11_registri/01-vincoli-in-vigore.md#v-12)): sono specifica di prodotto, e finché non
sono misurate questa voce resta vuota.

**La seconda.** La formulazione del beneficio clinico riportata al § 4.2 è **una proposta del
progetto** e va sottoposta a verifica da un redattore clinico qualificato prima di essere
congelata: è la raccomandazione esplicita di [07 §1.1](./07-valutazione-clinica.md), e questo piano
non se ne discosta. Il fabbisogno che ne discende è al § 10.

**La terza** non è di questa voce ma la condiziona per intero, ed è al § 12: la revisione esterna
della destinazione d'uso congelata **non è stata condotta**.

---

## 5. Stato dell'arte

> **Sezione dichiarata vuota.** Non contiene alcun contenuto, e l'assenza è dichiarata qui con la
> sua ragione invece di essere lasciata alla deduzione di chi legge.

**Che cosa dovrebbe contenere.** Il dossier dello stato dell'arte descrive **qual è oggi la pratica
clinica di riferimento** per le prestazioni nel perimetro dichiarato: che cosa si fa, con quali
risultati, con quali limiti riconosciuti. È costruito su fonti pubbliche - atti nazionali sulla
telemedicina, accordi in sede di conferenza permanente, linee guida di società scientifiche,
letteratura sottoposta a revisione paritaria - e non contiene nulla di specifico di un fabbricante
([07 §4.1](./07-valutazione-clinica.md)).

**Chi servirebbe.** Un **redattore clinico con qualifica documentabile**: titolo e percorso
verificabili, esperienza nella materia, e - poiché il prodotto del suo lavoro entra in un fascicolo
sottoposto a un organismo notificato - curriculum e dichiarazione di assenza di conflitto di
interessi presentabili. La struttura della qualifica del valutatore è essa stessa oggetto di
verifica da parte dell'organismo ([07 §2.1](./07-valutazione-clinica.md)).

**Che cosa produrrebbe.** Il dossier, con l'individuazione delle fonti, la loro gerarchia, la
descrizione della pratica di riferimento e i limiti dichiarati di quella pratica; e, come effetto
laterale non secondario, la base su cui il § 8 costruisce i criteri di inclusione della ricerca
sistematica.

**Perché oggi non è disponibile.** Perché **il progetto non ha internamente quella competenza** e
non la acquisisce in fretta ([07 §2.1](./07-valutazione-clinica.md), terza ragione). La produzione
del dossier è un **impegno di risorse esterne**, non un'estensione della documentazione, ed è la
questione [`Q-176`](../11_registri/02-questioni-aperte.md#q-176), aperta verso il committente e
senza risposta. La domanda che quella questione pone non è retorica e non è rinviabile a costo
zero: il dossier è a monte della ricerca sistematica, sta su una catena seriale che non si comprime
con risorse, e il suo rinvio si trasferisce integralmente in fondo a quella catena.

**Che cosa questa sezione vuota non autorizza.** Non autorizza a considerare lo stato dell'arte una
voce facoltativa, né a sostituirlo con una rassegna informale della letteratura: una rassegna
informale, presentata come stato dell'arte, produce un ciclo di non conformità e la riscrittura
riparte dal protocollo.

---

## 6. Parametri clinici e criteri di accettabilità

### 6.1 Che cosa questa sezione fissa: il metodo e la forma, mai i valori

Questa voce è quella in cui un piano di valutazione clinica scritto da un gruppo tecnico commette
l'errore più grave e meno visibile: **scrivere un numero**. Questo piano non lo scrive, e la
ragione è una regola di prodotto prima che di redazione.

> **Nessuna soglia clinica è fissata in questo piano, e nessuna può esserlo.** Le soglie che
> qualificano un parametro come dentro o fuori norma sono **configurazione per assistito**,
> definite dal professionista per quella persona, mai costanti e mai proposte dal sistema. Una
> soglia scritta qui sarebbe una decisione clinica presa da chi non ha visto il paziente, e
> sarebbe insieme la contraddizione dell'esclusione `E4` di
> [02 §4.3](./02-qualificazione-e-classificazione.md), che è una delle condizioni di validità della
> classificazione.

Ne discende che i **parametri clinici** di cui questa voce parla non sono valori: sono le
**grandezze osservabili** su cui la valutazione clinica misura le proprie affermazioni, e i
**criteri di accettabilità** sono le regole che dicono quando l'evidenza raccolta su ciascuna
grandezza è sufficiente. La distinzione è la stessa che
[05 §3.2](./05-gestione-del-rischio.md) enuncia per la gestione del rischio - la norma non fornisce
alcuna soglia, i criteri li stabilisce il fabbricante e il piano deve contenere **la motivazione
della loro collocazione**, non solo le soglie - e questo piano la recepisce senza ricopiarla.

### 6.2 Le regole di forma che le grandezze devono rispettare

Sono cinque, e valgono per ogni grandezza che questo piano o il piano di seguito del § 9 dovessero
adottare.

1. **La definizione è versionata.** Una grandezza il cui significato cambia senza che ne cambi il
   nome rende la serie storica incomparabile e vanifica la misura senza che nessuno se ne accorga.
2. **Il denominatore è esplicito.** Una frazione senza il proprio denominatore visibile non è una
   misura: è un'affermazione.
3. **La grandezza è confrontabile fra installazioni e nel tempo**, altrimenti aggrega dati che non
   parlano della stessa cosa.
4. **La grandezza non contiene contenuto clinico.** È una condizione, non una coincidenza: il
   seguito clinico deve poter essere alimentato da installazioni presso terzi senza che dati
   identificabili escano da quelle installazioni.
5. **La grandezza è un fatto misurato, non un giudizio.** Un conteggio con la propria definizione
   esplicita è ammesso; una fascia di merito, un punteggio pesato o un indice sintetico è
   informazione clinica nuova, ed è fuori perimetro
   ([02 §6.1](./02-qualificazione-e-classificazione.md)).

### 6.3 L'assenza di dato è un esito, e i criteri devono dirlo

Un criterio di accettabilità che tratti il silenzio come normalità è un criterio difettoso, e in
questo dominio è difettoso in modo pericoloso. **L'assenza di una misura attesa è informazione
clinica**: dice che qualcosa non è avvenuto, e questo è precisamente il tipo di fatto che una
revisione periodica deve poter vedere.

La conseguenza operativa è già un vincolo del progetto e questo piano vi si àncora:
[`V-148`](../11_registri/01-vincoli-in-vigore.md#v-148) stabilisce che **l'attesa di rilevazione è
un'entità** - l'assenza di misura è una riga che dichiara l'assenza, con finestra attesa, istante
di scadenza e causa quando nota, non l'assenza di una riga. Ne discendono due regole per i criteri
di accettabilità di questo piano:

- **nessun criterio è definito su un insieme di dati ricevuti senza dichiarare che cosa si è fatto
  dei dati attesi e non ricevuti**;
- **la mancata rilevazione non è un dato mancante da escludere dal calcolo**: è un esito da
  contare, e il criterio dice in quale direzione conta.

### 6.4 Che cosa di questa voce resta vuoto, e perché

> **Dichiarata vuota:** i **valori** dei criteri di accettabilità, cioè le soglie oltre le quali
> l'evidenza raccolta su ciascuna affermazione del § 4.2 si considera sufficiente.

**Chi servirebbe.** Il redattore clinico qualificato del § 5, e - per la determinazione finale - il
valutatore qualificato con dichiarazione di assenza di conflitto, che è atto riservato al ruolo di
fabbricante.

**Che cosa produrrebbe.** La collocazione motivata di ciascun criterio, con l'argomento clinico che
la sostiene: che è la parte che l'organismo notificato legge per prima, perché un criterio senza
motivazione è un numero e un numero senza motivazione non si difende in sede di quesiti.

**Perché oggi non è disponibile.** Perché la collocazione di un criterio di accettabilità clinica
è un **giudizio di valore clinico motivato**, non un dato oggettivo, e il progetto non ha
internamente la competenza che lo formuli ([`Q-176`](../11_registri/02-questioni-aperte.md#q-176)).
Scriverlo comunque produrrebbe l'artefatto peggiore fra quelli disponibili: una tabella di numeri
che sembra un criterio e non lo è.

---

## 7. Strategia dell'evidenza per ciascuna delle tre componenti

**MDCG 2020-1** articola l'evidenza clinica di un software dispositivo medico in tre componenti
distinte e **tutte necessarie**: validità dell'associazione clinica, validazione tecnica,
validazione clinica ([07 §3](./07-valutazione-clinica.md)).
La revisione corrente del documento `[NV]` da verificare su `COMP` al momento dell'uso: i documenti del
gruppo di coordinamento vengono revisionati, e questa bozza non fissa una revisione che a quel
momento potrebbe non essere più quella vigente.

Questo paragrafo tratta le tre componenti nell'ordine della fonte. **Una sola è compilata**, ed è
quella che il capitolo 07 dichiara già producibile dal progetto.

### 7.1 Prima componente - validità dell'associazione clinica

> **Sezione dichiarata vuota.**

**Che cosa dovrebbe contenere.** La dimostrazione che esiste un'associazione riconosciuta fra
l'uscita del software e la condizione clinica o lo stato fisiologico a cui si riferisce, fondata su
letteratura, linee guida, standard clinici e dati esistenti.

**Perché oggi non è disponibile.** È la componente **meno** dipendente dal prodotto - è dominio, ed
è in linea di principio preparabile - ma poggia interamente sul dossier dello stato dell'arte del
§ 5, che non esiste, e sulla competenza clinica che il progetto non ha internamente
([`Q-176`](../11_registri/02-questioni-aperte.md#q-176)). Ciò che il progetto può predisporre senza
quella competenza è l'infrastruttura documentale e il metodo del § 8, non il giudizio che questa
componente richiede.

### 7.2 Seconda componente - validazione tecnica

> **Sezione compilata.** È la voce che [07 §4](./07-valutazione-clinica.md) dichiara producibile
> dal progetto, ed è il contributo più sostanzioso che questa bozza porta.

**La domanda a cui la componente risponde.** Il software genera l'uscita attesa a partire dagli
ingressi, in modo **accurato, affidabile e ripetibile**?

**Le classi di evidenza che il piano adotta, e a quale affermazione ciascuna risponde.**

| Classe di evidenza | Che cosa dimostra | Affermazione servita |
|---|---|---|
| Prove di unità e copertura dichiarata sulle funzioni correlate alla sicurezza | Che il comportamento specificato è quello realizzato, sulle porzioni in cui un difetto ha conseguenza clinica | `AF-2`, `AF-3` |
| Prove di integrazione e prove end-to-end sui percorsi principali | Che il percorso completo - dalla rilevazione alla presentazione al professionista - si comporta come specificato | `AF-1`, `AF-2` |
| Prove sulla qualità del canale con simulazione di perdita di pacchetti e di variazione del ritardo | Che la prestazione dichiarata regge in condizioni degradate, e che la degradazione è **segnalata** invece che subita | `AF-1` |
| Prove sulla trasmissione verso il sistema di origine, con stato esplicito e conferma di presa in carico dal ricevente | Che l'informazione clinica arriva **integra**, e che nessuno stato intermedio è ambiguo | `AF-2` |
| Prove sul trattamento dell'attesa di rilevazione non soddisfatta | Che l'assenza di una misura attesa è registrata come esito e non come silenzio ([`V-148`](../11_registri/01-vincoli-in-vigore.md#v-148)) | `AF-2` |
| Prove sulla registrazione immutabile degli atti | Che la ricostruzione a posteriori di chi ha visto che cosa e quando è possibile | `AF-3` |
| Tracciabilità requisiti verso prove, **generata e non compilata a mano** | Che la copertura dichiarata corrisponde alla copertura reale, e che la corrispondenza non dipende da un aggiornamento manuale | Tutte |

**La condizione senza la quale nessuna di queste prove è evidenza citabile.** È il vincolo
[`V-176`](../11_registri/01-vincoli-in-vigore.md#v-176), e questo piano lo assume come requisito di
ammissibilità e non come buona pratica: ogni esito di prova destinato a essere citato deve essere
prodotto in **forma citabile** e conservato come **artefatto immutabile**, con versione esatta del
software, ambiente dichiarato, data e ora, esecutore, esito e impronta di integrità. **Un rapporto
rigenerabile ma non conservato non è evidenza**: al momento della citazione l'ambiente è cambiato,
il risultato non è più lo stesso, e un valutatore che chiede di vedere l'esito citato ne riceve uno
diverso. La ragione è la **citabilità**, ed è più stringente della ricostruibilità richiesta dal
ciclo di vita del software, perché il destinatario è esterno.

**Lo stato di fatto di questa componente, senza attenuazioni.** La strategia sopra è compilata;
**gli esiti che dovrebbe citare non esistono**. Il progetto è in fase di progettazione: non esiste
codice applicativo, e non può esistere prima della catena di costruzione che genera la distinta dei
materiali e il registro degli identificativi di requisito
([`V-182`](../11_registri/01-vincoli-in-vigore.md#v-182)). Ne discende che questa sezione è
**compilata quanto al piano e vuota quanto alla materia**, e che il primo esito citabile nascerà
soltanto quando la catena di costruzione conserverà i rapporti nella forma di
[`V-176`](../11_registri/01-vincoli-in-vigore.md#v-176). Chi legge questa sezione e ne ricava che
l'evidenza tecnica sia già raccolta compie un'inferenza che questa riga esclude.

> **Contraddizione incontrata e non corretta, perché la correzione appartiene al titolare
> dell'area.** [07 §3.1 e §4](./07-valutazione-clinica.md) descrivono l'evidenza di validazione
> tecnica in una forma che un lettore prende per esistente - copertura di prova elevata, prove di
> integrazione, prove end-to-end, tracciabilità generata - e la colonna «Il progetto, oggi» la
> qualifica come «integrale». Sul disco, oggi, non esiste codice applicativo e non esiste alcun
> rapporto di prova. Le due letture si conciliano se quelle righe si intendono come **strategia
> assunta** e non come **inventario**, ma il testo non lo dice, e questa bozza non lo decide al
> posto di chi quel capitolo lo mantiene.

**E il varco che questa sezione potrebbe aprire, chiuso qui.** **L'evidenza tecnica non è evidenza
clinica.** Nessuna quantità di copertura di prova, di prove end-to-end o di misure di qualità del
canale dimostra che l'uso del dispositivo produca l'effetto atteso sulla gestione del paziente.
L'abbondanza della seconda componente **non compensa il vuoto della terza**, ed è esattamente in
questo senso che le tre componenti sono tutte necessarie.

### 7.3 Terza componente - validazione clinica

> **Sezione dichiarata vuota.** È **il vuoto** del piano, e va letto come tale.

**Che cosa dovrebbe contenere.** La dimostrazione che l'uscita del software, usata nel contesto
clinico previsto, produce l'effetto atteso sulla gestione del paziente: cioè `AF-1` per intero e la
parte di `AF-2` che riguarda l'effetto e non la trasmissione.

**Chi servirebbe e che cosa produrrebbe.** Il redattore clinico qualificato del § 5 per la ricerca
e la valutazione critica delle fonti; il **valutatore qualificato con dichiarazione di assenza di
conflitto di interessi** per la sintesi e per la determinazione che l'evidenza sia sufficiente. Il
prodotto di quest'ultimo è `CE-REP-001`, che **non appartiene a questo documento in nessuna forma**.

**Perché oggi non è disponibile.** Perché la letteratura disponibile riguarda la telemedicina come
**modalità di erogazione**, non questo specifico prodotto, e il ponte fra i due livelli - dal «la
prestazione erogata a distanza in una data specialità è efficace» al «questo software consente
quella prestazione con completezza e tracciabilità dell'informazione clinica» - **è precisamente
ciò che il rapporto deve costruire**. Non esiste una scorciatoia: esiste un'argomentazione, che va
scritta bene, e la cui debolezza si paga in cicli di non conformità. Costruire quel ponte richiede
la ricerca del § 8, che non è avviata, e il giudizio qualificato del ruolo di fabbricante, che non
è costituito.

**Che cosa il piano dichiara al posto dell'evidenza che non ha.** Che il vuoto esiste, che è sulla
terza componente, e che il seguito clinico del § 9 è lo strumento con cui **si intende** colmarlo.
Un piano che dichiara il vuoto e definisce come colmarlo è difendibile; un piano che lo nasconde
dietro l'abbondanza della seconda componente non lo è.

---

## 8. Protocollo della ricerca sistematica

### 8.1 Che cosa il congelamento della destinazione d'uso rende scrivibile

Il congelamento di `D55` rende avviabile la **parte metodologica** della valutazione clinica, e
questa sezione la compila per quanto è compilabile senza competenza clinica.

**La ricerca è un'attività di metodo, non una rassegna.** Ha un protocollo registrato, criteri di
inclusione ed esclusione dichiarati **prima** dell'interrogazione, doppia selezione da parte di due
valutatori, recupero dei testi integrali e valutazione critica di **ciascuna** fonte inclusa. Un
rapporto costruito su una rassegna informale viene respinto, e la riscrittura riparte dal
protocollo: è la ragione per cui il protocollo si scrive prima e non dopo.

**Le regole di protocollo che questo piano fissa** e che non dipendono dalla competenza clinica:

1. **I criteri di inclusione discendono dalle affermazioni del § 4.2**, una per una, e non
   dall'argomento generale «telemedicina». Un criterio che non serve un'affermazione è un criterio
   che allarga il corpus senza servire il rapporto.
2. **I criteri di esclusione sono dichiarati insieme a quelli di inclusione**, e non ricavati per
   complemento durante la selezione.
3. **La selezione è a due valutatori indipendenti**, con la regola di risoluzione dei disaccordi
   dichiarata prima. Questo requisito **il progetto non lo soddisfa internamente**: richiede due
   persone distinte, e ricade nella famiglia di lacune di
   [`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281) e di
   [`Q-189`](../11_registri/02-questioni-aperte.md#q-189). Si dichiara qui, e non si pianifica come
   se fosse eseguibile.
4. **Ogni interrogazione è registrata** con banca dati, stringa esatta, data di esecuzione e numero
   di risultati, in forma che consenta a un terzo di ripeterla e ottenere lo stesso insieme.
5. **La selezione produce un diagramma** che dichiara, a ogni passaggio, quanti record entrano,
   quanti escono e per quale criterio.
6. **La valutazione critica di ciascuna fonte inclusa è scritta**, non implicita nell'inclusione.
7. **Il corpus è quello della raccolta differita per la revisione periodica**, non quello della
   sorveglianza continua: sono corpora distinti, con esiti, popolazioni e disegni di studio
   diversi, e mescolarli è il modo più rapido di rendere il rapporto indifendibile.

**La strategia dell'evidenza è costruita senza equivalenza**, per le ragioni del § 11.2: la
letteratura non richiede equivalenza, ed è la strada normale per questo tipo di prodotto.

### 8.2 Che cosa di questa voce resta vuoto, e perché

> **Dichiarata vuota:** l'**elenco delle banche dati** da interrogare, le **stringhe di
> interrogazione** e i **criteri di inclusione ed esclusione nella loro formulazione operativa**.

**Chi servirebbe.** Il redattore clinico qualificato del § 5, che è anche la figura che sa quali
fonti sono pertinenti per le prestazioni nel perimetro e quali no.

**Che cosa produrrebbe.** Il protocollo eseguibile: banche dati nominate, stringhe scritte,
criteri operativi, regola di risoluzione dei disaccordi, e la registrazione del protocollo prima
dell'esecuzione.

**Perché oggi non è disponibile.** Per la stessa ragione del § 5 - la competenza clinica non è
interna, ed è [`Q-176`](../11_registri/02-questioni-aperte.md#q-176) - e per una ragione ulteriore
che va detta: **una stringa di interrogazione scritta senza competenza di dominio produce un corpus
che sembra completo e non lo è**, e il difetto si scopre in sede di quesiti, quando la ricerca va
rifatta e non integrata.

**L'elenco delle banche dati bibliografiche pertinenti `[NV]` da determinare dal Committente non è determinato in questa bozza**
e non viene ipotizzato. Alcune delle banche dati usate in questo campo sono prodotti commerciali ad
accesso oneroso: la loro individuazione ha quindi una componente di scelta e una componente di
spesa, entrambe fuori dalla portata di questo documento, e nominarne alcune a titolo di esempio
produrrebbe un elenco che qualcuno userebbe come se fosse il protocollo.

---

## 9. Piano di seguito clinico post-commercializzazione

### 9.1 Che cosa questo piano può contenere: la strumentazione, e prima del piano

Il seguito clinico è disciplinato dall'Allegato XIV, Parte B, del Regolamento (UE) 2017/745 come
processo **continuo** di aggiornamento della valutazione clinica, con un piano - metodi, procedure,
obiettivi, razionale, riferimento alle parti pertinenti del rapporto e ai requisiti generali di
sicurezza e prestazione - e un calendario, il cui esito è un rapporto che alimenta insieme la
valutazione clinica e la sorveglianza post-commercializzazione
([07 §7](./07-valutazione-clinica.md), [08](./08-sorveglianza-post-commercializzazione.md)).

**Qui il seguito è sostanziale e non formale**, per una ragione che discende dal § 7.3: la
valutazione clinica iniziale poggerà in misura prevalente su letteratura relativa alla modalità di
erogazione e su validazione tecnica, quindi il vuoto di evidenza è sulla terza componente ed è
precisamente il vuoto che il seguito deve colmare.

**Ciò che questa bozza contribuisce è la condizione perché quel piano sia scrivibile**, ed è un
requisito di progettazione del dato, non un capitolo di documentazione:

> **[`V-177`](../11_registri/01-vincoli-in-vigore.md#v-177).** Le grandezze che il piano di seguito
> clinico si impegna a raccogliere devono **esistere come dati** - con definizione stabile,
> versionata e confrontabile fra installazioni e nel tempo - **prima** che il piano sia scritto.
> Progettare la strumentazione dopo aver scritto il piano significa scoprire che il dato non c'è, e
> **un dato che non c'è non si recupera retroattivamente per il periodo trascorso**.

Le grandezze plausibili per questo prodotto e il requisito che ciascuna pone al modello dati sono
già elencate in [07 §7.1](./07-valutazione-clinica.md) e **non si ricopiano qui**: due elenchi
della stessa cosa in due luoghi divergono al primo aggiornamento. Ciò che questa sezione aggiunge è
la loro qualificazione ai fini di questo piano, in tre righe:

- ciascuna di quelle grandezze deve rispettare le **cinque regole di forma del § 6.2**, e in
  particolare la quinta: sono conteggi su fatti, non giudizi;
- **nessuna di esse contiene contenuto clinico**, ed è una condizione e non una coincidenza, perché
  il seguito deve poter essere alimentato da installazioni presso terzi senza che dati
  identificabili escano da quelle installazioni;
- ciascuna deve trattare l'**assenza** come esito, secondo il § 6.3: una grandezza che conta solo
  ciò che è arrivato misura la propria strumentazione, non il dispositivo.

### 9.2 Che cosa di questa voce resta vuoto, e perché

> **Dichiarata vuota:** il **piano di seguito** in quanto tale, cioè `PMCF-PLAN-001`.

**Chi servirebbe.** Il ruolo di fabbricante, e con esso il valutatore qualificato: il piano di
seguito è **solo del fabbricante** ([07 §4](./07-valutazione-clinica.md)).

**Che cosa produrrebbe.** L'impegno: che cosa si raccoglierà dal campo per colmare i vuoti di
evidenza, con metodi, periodicità e obiettivi, e il collegamento puntuale alle parti del rapporto
di valutazione clinica che ciascuna raccolta serve.

**Perché oggi non è disponibile.** Perché **un piano di seguito è un impegno, non un'analisi**, e
un impegno presuppone un soggetto che possa assumerlo. Il progetto **intende** assumere il ruolo di
fabbricante e **il soggetto giuridico che lo eserciterebbe è ancora da costituire**: nessuno può
oggi impegnarsi a raccogliere alcunché dal campo, e scriverne il piano produrrebbe un documento
formalmente presente e sostanzialmente vuoto, che è peggiore dell'assenza perché falsamente
rassicurante.

---

## 10. Il fabbisogno di competenza clinica, e la forma con cui si intende acquisirlo

### 10.1 Che cosa serve esattamente

Il fabbisogno non è generico e va nominato per quello che è, perché una descrizione vaga produce
una ricerca vaga.

| Fabbisogno | A che cosa serve in questo piano | Requisito minimo |
|---|---|---|
| **Redattore clinico con qualifica documentabile** | Dossier dello stato dell'arte (§ 5); criteri di inclusione ed esclusione e stringhe di interrogazione (§ 8.2); verifica della formulazione del beneficio clinico (§ 4.3) | Qualifica verificabile, esperienza nella materia, disponibilità a fornire curriculum e dichiarazione di assenza di conflitto di interessi |
| **Secondo valutatore per la selezione** | Doppia selezione della ricerca sistematica (§ 8.1, regola 3) | Persona **distinta** dalla prima: è un requisito di numero di persone, non di ore |
| **Valutatore qualificato con dichiarazione di assenza di conflitto** | Sintesi, giudizio e determinazione di sufficienza dell'evidenza | Atto **riservato al ruolo di fabbricante**: non è acquisibile prima che il soggetto esista |

**Il progetto non ha internamente nessuna delle tre**, e la terza non è nemmeno acquisibile oggi.
Le prime due lo sono.

### 10.2 Le forme possibili di acquisizione, con il costo e la conseguenza di ciascuna

**Il costo non è espresso in denaro né in ore, ed è deliberato.** Il progetto non stima costi e
tariffe, e non produce stime di sforzo: mancano una cronologia di consegna su cui calibrare e
un'unità che attraversi lavori eterogenei. Il costo è quindi dichiarato nei termini che il progetto
usa - **da che cosa dipende**, **se è comprimibile**, **che cosa resta scoperto** - ed è
l'informazione che serve per decidere.

| # | Forma | Da che cosa dipende | Comprimibile | Che cosa si ottiene | Che cosa resta scoperto |
|:-:|---|---|---|---|---|
| 1 | **Incarico professionale a un redattore clinico esterno** | Disponibilità della figura sul mercato e decisione di spesa del committente | No quanto alla ricerca della figura; sì quanto all'avvio, che si può fare subito | Stato dell'arte, criteri e stringhe: cioè le §§ 5, 6.4 e 8.2 | Il secondo valutatore della selezione, se l'incarico è a una sola persona |
| 2 | **Collaborazione con una struttura che disponga della competenza** - società scientifica, ente di ricerca, struttura sanitaria interessata al percorso | Esito di una trattativa il cui tempo non dipende dal progetto | No | Le stesse voci della forma 1, più la possibilità del secondo valutatore | La riservatezza e la titolarità del prodotto vanno regolate prima, non dopo |
| 3 | **Acquisizione interna della qualifica** da parte del contributore | Tempo di formazione e di esperienza documentabile | **No, in modo strutturale**: la qualifica è documentabile solo se ha una storia, e una storia non si comprime | Nulla nel breve periodo | Tutto ciò che serve ora. Sotto la capacità dichiarata dal progetto, sottrarrebbe inoltre capacità a lavoro già a calendario |
| 4 | **Rinvio dichiarato**, senza acquisire nulla | Nessuna dipendenza esterna: è una scelta | Non applicabile | Nulla | Le §§ 5, 6.4, 7.1, 7.3 e 8.2 restano vuote. Il costo non è il documento mancante: è che lo stato dell'arte sta **a monte** di una catena seriale che non si comprime con risorse, e ogni periodo di rinvio si trasferisce integralmente in fondo a quella catena |

**Due osservazioni che il committente ha diritto di avere scritte, e che non sono la decisione.**

La prima: le forme 1 e 2 **non richiedono il soggetto fabbricante costituito**. Un incarico
professionale e una collaborazione si possono avviare prima, e il prodotto - il dossier dello stato
dell'arte - non è specifico di un fabbricante. È la stessa proprietà per cui `T-14` colloca in
posizione anticipata le attività il cui vincolo effettivo è la coda altrui: **entrare in coda prima
è l'unica leva che il progetto ha** su ciò che non dipende da lui.

La seconda: la forma 4 **non è la scelta a costo nullo**, ed è quella che lo sembra. Il suo costo
non compare in questo documento perché non compare in nessun documento: è un ritardo che si osserva
soltanto a valle, quando la ricerca sistematica non è avviata e il rapporto non esiste.

### 10.3 Che cosa questa sezione non decide, e perché non può

**La scelta fra le quattro forme è del committente e non di questo documento.** È la questione
[`Q-176`](../11_registri/02-questioni-aperte.md#q-176), che **pone** la domanda e non la risolve, e
che questa bozza non può risolvere al posto di chi la deve decidere: comporta un impegno di risorse
esterne e una scelta imprenditoriale, e quest'area non decide al posto del committente.

Ciò che questa sezione fa, ed è ciò che il criterio 4 di `T-14` chiede alla lettera, è **nominare
il fabbisogno** - tre figure, con i requisiti minimi del § 10.1 - e **nominare le forme con cui si
intende acquisirlo**, ciascuna con ciò da cui dipende e ciò che resta scoperto. La decisione
manca, ed è dichiarata mancante.

---

## 11. Due esclusioni metodologiche, dichiarate invece che taciute

### 11.1 L'esenzione dell'art. 61(10) è considerata, e scartata

L'**art. 61(10)** del Regolamento (UE) 2017/745 prevede che, quando la dimostrazione della
conformità ai requisiti generali di sicurezza e prestazione sulla base di dati clinici non è
considerata appropriata, si fornisca un'adeguata giustificazione fondata sui risultati della
gestione del rischio e sulla considerazione delle specificità dell'interazione fra dispositivo e
corpo umano, delle prestazioni cliniche previste e delle indicazioni del fabbricante.
`[NV]` - la numerazione del paragrafo va verificata sul testo consolidato prima che questa riga
compaia in un documento sottoposto a un organismo notificato.

**Questo piano non la invoca**, e ne documenta la considerazione perché è una domanda che
l'organismo notificato pone, ed è meglio avere la risposta già scritta che improvvisarla in sede di
quesiti. Le ragioni dello scarto sono tre e sono quelle di [07 §5](./07-valutazione-clinica.md):
la giustificazione dovrebbe essere **accettata** dall'organismo, e per un software che presenta
informazione clinica a un professionista l'accettazione è improbabile, perché l'interazione con la
decisione clinica è precisamente ciò che fonda la qualificazione; anche se accettata **non esonera
dal seguito clinico**; e una giustificazione respinta al primo ciclo di quesiti **costa più** di
una valutazione clinica condotta bene, perché la valutazione va poi fatta comunque ripartendo da
zero, con il fascicolo già in valutazione.

### 11.2 Il piano è costruito senza equivalenza, e l'analisi non entra qui in nessuna forma

L'Allegato XIV consente di fondare la valutazione clinica sui dati clinici di un dispositivo di cui
si dimostri l'equivalenza, purché la dimostrazione copra caratteristiche tecniche, biologiche e
cliniche e purché il fabbricante disponga di un **livello di accesso sufficiente ai dati** del
dispositivo di confronto. Per un software questo significa accesso all'architettura e agli
algoritmi di un prodotto altrui: con un dispositivo di un terzo serve un contratto che nessun
operatore concorrente ha interesse a concedere, e l'equivalenza con un dispositivo dello stesso
fabbricante **qui non esiste**, perché si tratta della prima generazione.

**Questo piano è quindi costruito senza equivalenza**, e l'equivalenza è trattata come attività
**condizionata** e non pianificata: un piano che pianifica una trattativa il cui esito non dipende
da chi la conduce non è un piano.

> **[`V-274`](../11_registri/01-vincoli-in-vigore.md#v-274)**, che questa bozza rispetta e non
> attenua. **L'analisi di equivalenza dell'Allegato XIV non entra nella documentazione pubblica del
> progetto, in nessuna forma e in nessuna fase**: nomina necessariamente un dispositivo di
> confronto, appartiene al fascicolo tecnico sotto il controllo dei documenti del fabbricante, e il
> vincolo non si attenua per effetto dell'assunzione del ruolo. Nessun riferimento a un possibile
> dispositivo di confronto, nemmeno di categoria, compare in questo documento.

---

## 12. Le due condizioni a monte non soddisfatte

Non sono di questo documento e non si risolvono scrivendolo. Vi incidono entrambe, e sono
registrate qui perché un piano che le tacesse sembrerebbe più avanti di quanto sia.

**Prima - la revisione esterna della destinazione d'uso congelata non è stata condotta.** Le
decisioni `D46` e `D55` la impongono **prima** di ingaggiare qualunque organismo notificato. È la
questione [`Q-275`](../11_registri/02-questioni-aperte.md#q-275), aperta verso il committente, e ha
una proprietà che la distingue da tutto il resto di questo capitolo: **è l'unica prescrizione di
`D46` eseguibile senza il soggetto fabbricante costituito**. L'ingaggio dell'organismo presuppone
il soggetto; la revisione no, e si commissiona a un revisore regolatorio indipendente senza che
alcun soggetto giuridico esista. Rinviarla espone al rischio peggiore fra quelli disponibili: che
il congelamento regga fino al primo confronto esterno e non più in là, quando il presente piano, il
perimetro della ricerca, l'analisi dei pericoli e la specifica d'uso vi sono già stati scritti sopra
e vanno **tutti rifatti**. Il § 4 di questo documento è il primo testo che vi si appoggia.

**Seconda - il ruolo di fabbricante non è costituito.** Il progetto **intende** assumerlo e **il
soggetto giuridico che lo eserciterebbe è ancora da costituire**. Ne discende, per questo
documento, che **approvazione e assunzione del piano sono riservate al ruolo** e non appartengono a
questa bozza; che il rapporto `CE-REP-001` e il piano di seguito `PMCF-PLAN-001` non sono
producibili qui nemmeno in bozza; e che la riserva **non cade perché il ruolo sarà nostro**: cade
quando il soggetto esiste, la persona responsabile del rispetto della normativa è nominata e il
controllo dei documenti del fabbricante è in esercizio.

**Che cosa le due condizioni non impediscono**, perché dichiararle non deve diventare una ragione
per non fare ciò che si può fare: non impediscono di scrivere questa bozza, di predisporre il
metodo del § 8, di adottare le regole di forma del § 6.2, di vincolare la strumentazione del § 9.1
prima che il piano di seguito sia scrivibile, né di avviare le forme 1 e 2 del § 10.2. Sono tutte
voci che, non fatte ora, si pagano più tardi allo stesso prezzo o a un prezzo maggiore.

---

## 13. Che cosa questa bozza lascia aperto

| Riferimento | Voce | A chi |
|---|---|---|
| [`Q-176`](../11_registri/02-questioni-aperte.md#q-176) | **Se e come acquisire la competenza clinica documentabile** che il progetto non ha internamente. Il § 10.2 elenca quattro forme con ciò da cui ciascuna dipende e ciò che resta scoperto; la scelta comporta un impegno di risorse esterne e **non è di quest'area** | → Committente |
| [`Q-275`](../11_registri/02-questioni-aperte.md#q-275) | **La revisione esterna della destinazione d'uso congelata non è stata condotta** (§ 12). È l'unica prescrizione di `D46` eseguibile senza il soggetto costituito, e il § 4 di questo piano vi si appoggia già | → Committente |
| [`Q-115`](../11_registri/02-questioni-aperte.md#q-115) | Le soglie dell'ambiente operativo non sono state misurate: finché non lo sono, la voce «limiti d'uso e requisiti dell'ambiente operativo» della destinazione d'uso resta non compilabile (§ 4.3) | Tecnica, prodotto |
| [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) | **La doppia selezione della ricerca sistematica richiede due persone distinte** (§ 8.1, regola 3), e ricade nella stessa famiglia di lacune delle registrazioni a ruoli distinti. Si dichiara come lacuna e non si pianifica come attività ([`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281)) | → Committente |
| `[NV]` | Revisione corrente di MDCG 2020-1 (§ 7): da verificare **al momento dell'uso** e non una volta per sempre | `COMP` |
| `[NV]` | Numerazione puntuale dell'art. 61, paragrafo 10 (§ 11.1), e dei punti dell'art. 2 richiamati al § 4.2: da verificare sul testo consolidato | `COMP` |
| `[NV]` | Elenco delle banche dati bibliografiche pertinenti (§ 8.2): non determinato, non ipotizzato, con la ragione dichiarata | `COMP`, con la competenza del § 10 |
| - | **Collocazione di questo documento nell'elenco dei documenti sottoposti a controllo.** La [procedura di controllo dei documenti](/08_compliance/PROCEDURA-controllo-dei-documenti.md) elenca al § 3 i documenti controllati; questa bozza **non vi compare**, e aggiungervela è una modifica di un documento approvato, non un atto di questa bozza | Conformità, con il revisore nominato |
| - | **Contraddizione dichiarata al § 7.2**: [07 §§3.1 e 4](./07-valutazione-clinica.md) descrivono l'evidenza di validazione tecnica come esistente, mentre non esiste codice applicativo né alcun rapporto di prova. Non corretta qui: la correzione appartiene al titolare dell'area | Conformità |
| - | **Il rapporto di valutazione clinica `CE-REP-001` non è producibile dal progetto in nessuna forma, nemmeno in bozza** (§§ 2 e 7.3), e **il piano di seguito `PMCF-PLAN-001` nemmeno** (§ 9.2) | **Il fabbricante**, con soggetto costituito e valutatore nominato |
