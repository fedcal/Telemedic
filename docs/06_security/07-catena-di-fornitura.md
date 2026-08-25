---
title: Catena di fornitura
sidebar_position: 8
description: La distinta dei materiali come obbligo normativo con il suo contenuto minimo, le dichiarazioni di esposizione, la divulgazione coordinata, la firma degli artefatti e la provenienza, la classificazione dei componenti di terze parti e il caso del servizio esterno di terminologia.
---

# Catena di fornitura

> **Presupposto di lettura.** Che cosa sono i componenti software di origine ignota, perché la
> distinta dei materiali è un obbligo e non una buona pratica, che cosa significa divulgazione
> coordinata: [10 §12 — Crittografia e sicurezza, §11](../10_fondamenti/12-crittografia-e-sicurezza.md).
> Qui si descrivono gli artefatti che il progetto produce, le loro proprietà e i loro obblighi.

## 1. Perché questo capitolo è quello con il rendimento più alto

La catena di build è il bene con il **fattore di moltiplicazione più alto**
([01 §2.5](./01-modello-di-minaccia.md)): la sua compromissione si propaga a tutte le
installazioni contemporaneamente, ed è invisibile a chi riceve, perché ciò che riceve è firmato
con la chiave giusta e proviene dal canale giusto.

C'è però una seconda ragione, che riguarda l'accesso al mercato più che la sicurezza in senso
stretto, e va detta senza giri di parole. **Chi installa è, quasi sempre, un soggetto che deve
dimostrare a un'autorità la sicurezza della propria catena di approvvigionamento.** L'art. 24,
comma 2, lettera d), del d.lgs. 4 settembre 2024, n. 138, gliene fa obbligo; il comma 3 gli
impone di valutare «le specifiche vulnerabilità di ciascun fornitore diretto» e «la qualità
complessiva dei prodotti e le pratiche di cybersicurezza dei fornitori, **comprese le procedure
di sviluppo sicuro**». Un fornitore che si presenti senza distinta dei materiali, senza politica
di divulgazione, senza esportazione delle evidenze e senza documentazione di sviluppo sicuro non
è «meno competitivo»: è **inutilizzabile**, perché impedisce a chi installa di chiudere le
proprie evidenze documentali.

## 2. La distinta dei materiali è un obbligo normativo

Non è una buona pratica. L'**Allegato I, Parte II, punto 1, del Regolamento (UE) 2024/2847**
impone al fabbricante di identificare e documentare i componenti contenuti nel prodotto,
«elaborando una **distinta base del software** in un formato comunemente utilizzato e leggibile
automaticamente, che copra **almeno le dipendenze di primo livello** del prodotto».

Tre precisazioni operative, che sono le tre cose che si fraintendono più spesso:

1. **Il minimo di legge sono le dipendenze di primo livello**, non l'albero transitivo completo.
   Una distinta generata automaticamente dai sistemi di compilazione del progetto soddisfa e
   **supera** il minimo, perché li attraversa entrambi per intero. Il progetto adotta il minimo
   più esteso, non quello di legge.
2. **La distinta non deve necessariamente essere pubblicata**: il regolamento la richiede come
   parte della documentazione tecnica, da rendere disponibile alle autorità di vigilanza su
   richiesta motivata. **La pubblicazione è però la scelta razionale** per un progetto che vuole
   essere integrabile, perché è ciò che consente a chi integra di completare la propria
   diligenza dovuta senza chiedere.
3. **La distinta non è la sola cosa che la Parte II richiede.** Gli altri obblighi sono:
   affrontare senza indugio le vulnerabilità mediante aggiornamenti di sicurezza; effettuare
   prove e riesami periodici della sicurezza; **divulgare pubblicamente le informazioni sulle
   vulnerabilità corrette** una volta reso disponibile l'aggiornamento; attuare una **politica di
   divulgazione coordinata**; facilitare la condivisione delle informazioni sulle vulnerabilità
   potenziali; garantire **meccanismi sicuri di distribuzione degli aggiornamenti**; distribuire
   le correzioni **senza indugio e a titolo gratuito**.

Convergono sullo stesso artefatto: la misura sull'inventario dei sistemi e delle applicazioni
software delle specifiche di base dell'autorità nazionale; la famiglia di controlli
sull'inventario dei software autorizzati delle misure minime nazionali per le pubbliche
amministrazioni; il requisito R33 dell'appendice sui requisiti di sicurezza eleggibili delle
linee guida nazionali sugli approvvigionamenti; e l'obbligo di censimento dei componenti di
origine ignota che deriva dalla disciplina del ciclo di vita del software dei dispositivi
medici.

### 2.1 Contenuto minimo di ciascuna voce

| Campo | Perché serve |
|---|---|
| Nome e **identificatore univoco del pacchetto** | Senza identificatore la corrispondenza con le banche dati di vulnerabilità è approssimativa, e l'approssimazione produce falsi positivi che nessuno tratta |
| **Versione esatta** | Un intervallo di versioni non è una distinta |
| **Licenza** | È l'informazione che chi integra usa per la propria valutazione di compatibilità |
| **Impronta** dell'artefatto | Lega la voce a un file specifico e rende verificabile che l'artefatto distribuito sia quello descritto |
| **Fornitore o autore** | È il dato che chi installa deve poter risalire, per la ragione del §3 |
| **Relazione** con gli altri componenti | Distingue una dipendenza diretta da una transitiva, e una di compilazione da una di esercizio |

La distinta è **generata dalla pipeline**, non compilata a mano: una distinta compilata a mano è
disallineata al primo aggiornamento. È **prodotta per ogni rilascio**, **firmata**, e conservata
come parte degli artefatti di rilascio.

### 2.2 Il momento in cui va fatta è adesso

È una delle attività **retroattivamente irrecuperabili** individuate dalla decisione D45:
censire i componenti di terze parti a posteriori costa un multiplo del censirli mentre entrano,
e la tracciabilità non si ricostruisce. La distinta va generata **dalla prima esecuzione della
pipeline**, prima ancora che ci sia molto da censire.

## 3. La distinta ha un lettore che non è tecnico

Questa sezione esiste perché è il punto in cui la sicurezza incontra un adempimento che quasi
nessun fornitore anticipa.

L'art. 18 della determinazione dell'autorità nazionale per la cybersicurezza n. 127437 del 13
aprile 2026 obbliga ogni soggetto destinatario della disciplina a **comunicare all'autorità
l'elenco nominativo dei propri fornitori rilevanti**, con cinque campi: ragione sociale;
identificativo fiscale; **Paese della sede legale**; codici della nomenclatura europea degli
appalti relativi alle forniture utilizzate; criterio di rilevanza applicato. `[NV]` sul testo:
la determinazione non è stata letta su fonte primaria e i suoi estremi provengono da fonti
secondarie qualificate concordanti e dalla comunicazione istituzionale dell'autorità. Va
verificata prima di citarne il contenuto puntuale — è la questione Q-151 nella sua parte
relativa a questa determinazione.

Quattro conseguenze dirette:

1. **Chi eroga il servizio a un soggetto destinatario della disciplina sarà dichiarato
   nominativamente all'autorità.** In modalità di servizio gestito ricade con ogni probabilità
   sotto entrambi i criteri di rilevanza; in installazione presso il cliente il primo criterio
   può non applicarsi, ma **il secondo — la non fungibilità della fornitura — resta**, perché
   manutenzione e supporto non sono sostituibili prontamente.
2. **Il Paese della sede legale è un campo obbligatorio.** La sovranità del dato cessa di essere
   un argomento commerciale e diventa **un dato che il cliente trasmette a un'autorità**. Una
   dipendenza a runtime da un servizio stabilito fuori dall'Unione aumenta l'esposizione
   dichiarativa del cliente, e **il cliente lo scopre nel momento in cui compila la
   dichiarazione**: non c'è modo di rinviarne la scoperta.
3. **Servono i codici della nomenclatura degli appalti**, pubblicati dal progetto in forma
   direttamente riutilizzabile, per evitare che ogni cliente li ricostruisca in modo diverso. La
   **selezione puntuale dei codici va concordata con un consulente di appalti e verificata sul
   vocabolario vigente**: `[NV]`, non è compito di quest'area.
4. **La catena del progetto diventa visibile.** Se il sistema si appoggia a un servizio di
   relay gestito, a un servizio di notifiche, a un fornitore di firma remota o a una rete di
   distribuzione dei contenuti, quei soggetti diventano potenzialmente fornitori rilevanti **di
   secondo livello** per il cliente. È l'argomento regolatorio — non solo etico — a sostegno del
   vincolo di sovranità: **riduce la superficie dichiarativa del cliente**.

## 4. Dichiarazioni di esposizione

Una distinta dei materiali, da sola, produce un elenco di vulnerabilità delle dipendenze che nel
contesto del prodotto sono, per la maggior parte, **non sfruttabili**: perché il codice
vulnerabile non è raggiungibile, perché la funzione non è usata, perché una configurazione la
neutralizza.

Se il progetto non lo dichiara, chi integra deve dedurlo. Non ha gli elementi per farlo, e quindi
o rimedia a vulnerabilità irrilevanti — costo puro — o le ignora tutte, compresa quella che
conta. **La dichiarazione di esposizione è l'artefatto che risolve questo problema**, e il
regolamento sulla resilienza informatica lo presuppone quando obbliga a facilitare la
condivisione delle informazioni sulle vulnerabilità.

Regole del progetto:

| Regola | Motivo |
|---|---|
| La dichiarazione **accompagna ogni rilascio** e copre **tutte** le vulnerabilità aperte della distinta | Una copertura parziale non è utilizzabile: chi la legge non sa se il silenzio significa «non esposto» o «non valutato» |
| Ogni voce riporta lo **stato** e, per gli stati che lo richiedono, la **motivazione** | Uno stato senza motivazione è un'opinione |
| È **firmata** e leggibile automaticamente | Deve poter entrare in un processo automatico di chi integra |
| Uno stato di non esposizione **motivato dalla configurazione** dichiara **quale** configurazione | Se chi installa cambia quella configurazione, la dichiarazione non vale più, e deve poterlo sapere |
| Il rilascio è **bloccato** in presenza di vulnerabilità aperte oltre la soglia di gravità definita e **non coperte** dalla dichiarazione | È l'obbligo di immissione «senza vulnerabilità note sfruttabili» dell'Allegato I, Parte I, del regolamento |

## 5. Sviluppo sicuro e verifica in integrazione continua

Un unico processo soddisfa insieme la disciplina delle attività di sicurezza nel ciclo di vita
del software sanitario, gli obblighi della Parte II dell'Allegato I del regolamento sulla
resilienza informatica, l'obbligo di «procedure di sviluppo sicuro» che il cliente deve
verificare presso il fornitore, e i controlli sulla valutazione continua delle vulnerabilità
delle misure minime nazionali. **Progettarli separatamente è l'errore che questa sezione serve a
evitare.**

| Attività | Frequenza | Effetto sul rilascio |
|---|---|---|
| Analisi statica del codice | Ogni proposta di modifica | Blocco al superamento della soglia |
| Analisi delle dipendenze e corrispondenza con le banche dati di vulnerabilità | Ogni proposta di modifica e ogni giorno sul ramo principale | Blocco al superamento della soglia |
| Analisi dei segreti | Ogni proposta di modifica | Blocco assoluto |
| Analisi dinamica sull'applicazione in esecuzione | Periodica e prima del rilascio | Blocco su esiti di gravità elevata |
| **Prove negative di autorizzazione fra tenant** su ogni punto di ingresso | Ogni proposta di modifica | Blocco; **e blocco anche sulla mancata copertura** ([06 §5.3](./06-sicurezza-applicativa.md)) |
| **Suite di prove di abuso contro il mediatore di uscita** | Ogni proposta di modifica | Blocco ([06 §8.4](./06-sicurezza-applicativa.md)) |
| **Prove di abuso sul relay** | Ogni proposta di modifica e a ogni aggiornamento di versione | Blocco ([05 §4.5](./05-sicurezza-del-tempo-reale.md)) |
| Verifica della conformità del trasporto cifrato | Ogni proposta di modifica | Blocco sotto la soglia dichiarata |
| Verifica di conformità della federazione delle identità | Periodica | Segnalazione, poi blocco prima del rilascio |
| Modello delle minacce | A ogni capacità nuova con confine o punto di uscita, e comunque annuale | Non blocca; è **condizione di completezza** della capacità |
| Prova periodica di ripristino, **materiale di chiave compreso** | Programmata | Non blocca; il suo esito è evidenza documentale |

**Il modello delle minacce è tracciabile verso i requisiti e verso le prove**: ogni minaccia
rilevante ha almeno un requisito e almeno una prova associata
([01 §7](./01-modello-di-minaccia.md)). È la stessa struttura richiesta dalla tracciabilità
requisito–progettazione–codice–prova della disciplina del ciclo di vita: **un unico artefatto
serve entrambi gli scopi**, ed è anche il formato che una commissione di gara sa leggere, perché
le linee guida nazionali sugli approvvigionamenti raccomandano espressamente di scrivere i
requisiti di sicurezza in forma «chiara, oggettiva e quanto più possibile chiusa», lasciando
meno spazio possibile alla valutazione soggettiva. **Una matrice requisito → evidenza →
riferimento puntuale, non una prosa descrittiva.**

## 6. Divulgazione coordinata

Il progetto mantiene una politica di divulgazione coordinata delle vulnerabilità, pubblicata nel
file dedicato alla sicurezza in radice di repository, con: canale di contatto dedicato; tempi
di riscontro e di rimedio dichiarati per fascia di gravità; impegno a non intraprendere azioni
contro chi segnala in buona fede rispettando la politica; procedura di attribuzione
dell'identificativo dove applicabile.

Due obblighi ulteriori che discendono dal regolamento sulla resilienza informatica:

- **divulgazione pubblica delle informazioni sulle vulnerabilità corrette**, una volta reso
  disponibile l'aggiornamento, tramite avviso di sicurezza pubblicato;
- **distribuzione delle correzioni senza indugio e a titolo gratuito**, attraverso un canale
  autenticato.

E un obbligo che discende dalle linee guida nazionali sugli approvvigionamenti e che va
recepito perché è oneroso e viene scoperto tardi: il **monitoraggio della pubblicazione di
aggiornamenti, correzioni e correttivi urgenti** relativi ai componenti utilizzati, con
**valutazione avviata entro il giorno successivo al rilascio** e propedeutica all'installazione
(requisito R45). Il termine è quello, ed è quotidiano: si soddisfa con automazione, non con una
persona.

**Il periodo di supporto è dichiarato per ciascun rilascio maggiore, con data di fine.** Il
regolamento impone al fabbricante un minimo di **cinque anni**; un progetto che ne dichiari meno
rende il proprio integratore non conforme. La decisione sul periodo effettivo **è del
committente** ed è aperta come questione Q-155.

## 7. Classificazione dei componenti di terze parti

Ogni componente di terze parti è censito con: identità e versione; **motivo dell'inclusione**;
licenza e regime di compatibilità; valutazione del rischio; criteri e cadenza di aggiornamento;
**posizione rispetto al percorso principale**; **momento di dipendenza**.

Le ultime due colonne sono quelle che cambiano la valutazione, e vanno spiegate:

| Dimensione | Valori | Perché conta |
|---|---|---|
| **Momento della dipendenza** | Compilazione · Esercizio | Una dipendenza di compilazione non è raggiungibile in esercizio: la sua vulnerabilità espone la catena di build, non l'installazione. Una dipendenza di esercizio è nel perimetro dell'installazione |
| **Posizione** | Percorso principale · Percorso accessorio · Disattivabile | Un componente sul percorso principale è un punto di guasto singolo, e diventa oggetto della dichiarazione dei fornitori rilevanti di secondo livello (§3) |

**Criterio di esclusione ancorato a un fatto, non a un sospetto.** Un componente non mantenuto
non si esclude perché «sembra abbandonato»: si esclude sulla base della **data dell'ultimo
intervento** e del numero di segnalazioni aperte, che sono dati verificabili, in applicazione
della disciplina sui componenti di origine ignota del ciclo di vita del software dei dispositivi
medici. La verifica è documentata e datata.

### 7.1 Il caso del servizio esterno di terminologia — risposta alla questione Q-04

La questione Q-04 della bacheca chiedeva di classificare il servizio esterno di terminologia e
di verificarne la compatibilità con il vincolo di sovranità. **La risposta è chiusa da
quest'area e si riporta qui per esteso.**

> È componente di terze parti **a runtime**, non dipendenza di compilazione: ricade nei
> requisiti sulla catena di fornitura e nella diligenza dovuta verso i fornitori. Tre
> conseguenze:
>
> **(a)** non può stare sul **percorso principale**. È il vincolo V-03: il sistema è pienamente
> funzionale senza il sistema di codifica che richiede un servizio esterno, e nessun percorso
> principale può richiederlo. Il costo è dichiarato — una parte dei codici di un legame non si
> valida — e non è un ripiego: è un corollario obbligato.
>
> **(b)** se stabilito fuori dall'Unione, è un **trasferimento** nel momento in cui riceve dati
> riferibili a un assistito. Quindi **le interrogazioni non devono mai portare identificativi
> dell'assistito**, e **la sovranità si soddisfa per assenza di dato, non per collocazione**.
> È il vincolo V-151. Un'interrogazione che chiede se un codice esista in un sistema di codifica
> non è un trasferimento di dato personale, ovunque risponda il servizio. Ne discende inoltre il
> divieto di **cache persistita su disco**, che varrebbe anche per la sola ragione di licenza:
> una cache persistente è un archivio non inventariato.
>
> **(c)** diventa **fornitore rilevante di secondo livello**, che il cliente deve dichiarare
> nominativamente all'autorità con il Paese della sede legale (§3).
>
> **Resta all'architettura** la scelta del punto di risoluzione e del contratto del gateway.

Questo è il modello di ragionamento da applicare a **ogni** componente di terze parti a runtime,
non un caso isolato: momento della dipendenza, posizione rispetto al percorso principale, natura
del dato che riceve, effetto sulla dichiarazione del cliente.

## 8. Firma degli artefatti, provenienza e configurazione sicura

| Requisito | Contenuto |
|---|---|
| **Firma di tutti gli artefatti distribuiti** | Immagini, pacchetti, distinta dei materiali, dichiarazione di esposizione, avvisi di sicurezza. La verifica della firma è **documentata come passo obbligatorio** dell'installazione, non come possibilità |
| **Provenienza verificabile** | Attestazione che leghi l'artefatto alla revisione del codice sorgente e all'esecuzione della pipeline che lo ha prodotto. È ciò che la diligenza dovuta di chi integra verifica |
| **Compilazione riproducibile** | Obiettivo dichiarato: chi vuole deve poter ricostruire l'artefatto dal sorgente e ottenere lo stesso risultato. È la sola difesa contro una compromissione della pipeline che sopravviva alla firma |
| **Canale di distribuzione autenticato** | Per gli artefatti e per gli aggiornamenti |
| **Configurazione sicura per impostazione predefinita** | Nessun account predefinito attivo, nessuna credenziale predefinita, nessun servizio non necessario esposto. È requisito della Parte I dell'Allegato I del regolamento e dei controlli sulle configurazioni sicure delle misure minime nazionali |
| **Configurazione di riferimento documentata** per ciascun componente | Con verifica automatica di conformità della configurazione predefinita rispetto ad essa, e **rilevazione delle deviazioni** in esercizio |
| **Ripristino alla configurazione di riferimento** | Capacità esposta, non procedura manuale |
| **Ambiente e procedura di collaudo degli aggiornamenti** | Prima dell'installazione in esercizio, in particolare per i componenti non standard. Si raccorda con l'obbligo di prove di funzionamento dopo ogni aggiornamento rilevante previsto per le prestazioni di telemedicina |

## 9. Che cosa quest'area lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| Q-04 | **Chiusa da quest'area** con il §7.1. Resta all'architettura la scelta del punto di risoluzione e del contratto del gateway | Architettura, per la sola parte residua |
| Q-151 | Verifica su fonte primaria della determinazione che introduce l'obbligo di dichiarazione dei fornitori rilevanti, dei codici richiesti e del contenuto puntuale dei requisiti delle misure di base | Conformità |
| Q-155 | **Periodo di supporto dichiarato**, minimo cinque anni: decisione del committente. Nella stessa questione, l'effetto della monetizzazione sul ruolo di fabbricante | → Committente |
| `[NV]` | Selezione puntuale dei codici della nomenclatura degli appalti (§3) | Conformità, con consulente di appalti |
| Q-17 | La tabella riassuntiva dei protocolli dell'area protocolli è di fatto un **inventario di partenza** dei componenti di terze parti: va usata come base invece di ricostruirla | Tecnica, conformità |
