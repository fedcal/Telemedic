---
title: Contribuire, area per area
sidebar_position: 19
description: "Da dove si comincia in concreto, area per area: che cosa serve sapere prima, qual è il primo contributo sensato, quali errori commette chi arriva dall'informatica gestionale e quali chi arriva dalla sanità, che cosa non si tocca senza discuterne e come si verifica il proprio lavoro."
---

# Contribuire, area per area

[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) dice **come**
si contribuisce: le cinque regole non negoziabili, il formato dei commit, la firma di origine, lo
stile del codice. Questo modulo risponde a una domanda diversa e successiva: **ho letto la guida,
so che voglio contribuire, da dove comincio in concreto per l'area che mi interessa.**

La differenza non è redazionale. In un progetto ordinario la risposta è «prendi una segnalazione
marcata come facile». Qui non funziona, per tre ragioni che vale la pena enunciare subito.

**La prima.** Le aree di questo progetto hanno prerequisiti asimmetrici. Toccare la
segnalazione della sessione media richiede di conoscere l'attraversamento dei NAT; toccare la
composizione documentale richiede di sapere che cos'è un referto e perché una bozza non è un
referto. Chi sceglie l'area sbagliata rispetto a ciò che sa non produce un contributo mediocre:
produce un contributo che sembra corretto e che nessuno riesce a rivedere in tempo ragionevole.

**La seconda.** Una parte consistente del lavoro utile **non è codice**, e il progetto ne ha
molto meno di quanto gliene servirebbe. Un clinico che legge il modulo sulle prestazioni e apre
una segnalazione su una definizione imprecisa fa un lavoro che nessuno sviluppatore può fare al
posto suo. La sezione [§14](#14-i-contributi-che-non-sono-codice) esiste per questo.

**La terza.** Alcune modifiche non si valutano nel merito tecnico. Una funzione dell'elenco
chiuso del perimetro regolatorio viene rifiutata **per politica**, con motivazione scritta, anche
se è ben implementata e utile (vincolo `V-170`). Saperlo prima di scrivere il codice è la
differenza fra una discussione di dieci minuti e due settimane buttate.

> **Prerequisito.** Questo modulo presuppone che tu abbia già letto
> [00 - Come usare questa guida](00-come-usare-questa-guida.md) e che tu abbia percorso almeno il
> percorso di lettura del tuo profilo. Presuppone inoltre
> [17 - L'ambiente di sviluppo](17-ambiente-di-sviluppo.md) per tutto ciò che riguarda
> l'esecuzione locale dei controlli.

---

## 1. Se ti interessa X, vai all'area Y

La tabella si legge da sinistra. La colonna «primo modulo» è quello da cui partire se non hai
mai lavorato su quel tema: non è un suggerimento, è il modulo senza il quale la sezione dell'area
risulterà compatta fino all'incomprensibilità.

| Se ti interessa… | Area | Sezione di questo modulo | Primo modulo da leggere |
|---|---|---|---|
| Videochiamata, codec, qualità del media, relay | Tecnica | [§4](#4-area-tecnica) | [08 - WebRTC da zero](08-webrtc-da-zero.md) |
| Struttura dei moduli del servizio, transazioni, concorrenza | Tecnica | [§4](#4-area-tecnica) | [11 - Fondamenti informatici](11-fondamenti-informatici.md) |
| Interfaccia utente, accessibilità, resa su schermo piccolo | Tecnica | [§4](#4-area-tecnica) | [11](11-fondamenti-informatici.md) §sull'interfaccia, poi [09](09-fondamenti-clinici.md) |
| Base dati, migrazioni, isolamento fra tenant | Tecnica | [§4](#4-area-tecnica) | [11 - Fondamenti informatici](11-fondamenti-informatici.md) |
| Perché i confini interni sono quelli e non altri | Architettura | [§5](#5-area-architetturale) | [11 - Fondamenti informatici](11-fondamenti-informatici.md) |
| Eventi, outbox, idempotenza, ordinamento | Architettura | [§5](#5-area-architetturale) | [11](11-fondamenti-informatici.md), poi [13](13-protocolli.md) |
| Registro immutabile, catena di impronte | Architettura e sicurezza | [§5](#5-area-architetturale), [§9](#9-area-sicurezza) | [12 - Crittografia e sicurezza](12-crittografia-e-sicurezza.md) |
| Che cosa fa il sistema, per chi, con quali regole | Funzionale | [§6](#6-area-funzionale) | [02 - Le prestazioni di telemedicina](02-prestazioni-di-telemedicina.md) |
| Allarmi, soglie, silenzio del paziente, escalation | Funzionale | [§6](#6-area-funzionale) | [10 - Percorsi di cura e sicurezza del paziente](10-percorsi-di-cura-e-sicurezza.md) |
| Accessibilità come requisito verificabile | Funzionale | [§6](#6-area-funzionale) | [10](10-percorsi-di-cura-e-sicurezza.md) §sull'errore d'uso |
| FHIR, profili, risorse, ricerche | Protocolli | [§7](#7-area-protocolli) | [06 - FHIR da zero](06-fhir-da-zero.md) |
| Messaggistica ospedaliera, profili di interoperabilità | Protocolli | [§7](#7-area-protocolli) | [05 - Gli standard di interoperabilità](05-standard-di-interoperabilita.md) |
| Buste degli eventi, firma dei messaggi uscenti | Protocolli | [§7](#7-area-protocolli) | [13 - I protocolli](13-protocolli.md) |
| Che cos'è clinicamente un referto, una misura, un consenso | Dominio | [§8](#8-area-dominio) | [03 - Il dato clinico](03-il-dato-clinico.md) |
| Macchine a stati delle prestazioni, esiti, catalogo | Dominio | [§8](#8-area-dominio) | [02 - Le prestazioni di telemedicina](02-prestazioni-di-telemedicina.md) |
| Terminologie cliniche e loro licenze | Dominio | [§8](#8-area-dominio) | [05 §8 - Le terminologie cliniche](05-standard-di-interoperabilita.md) |
| Modello di minaccia, autorizzazione, cifratura | Sicurezza | [§9](#9-area-sicurezza) | [12 - Crittografia e sicurezza](12-crittografia-e-sicurezza.md) |
| Tracciamento degli accessi e sua dimostrabilità | Sicurezza | [§9](#9-area-sicurezza) | [12](12-crittografia-e-sicurezza.md) §sulle catene di impronte |
| Identità digitale nazionale, livelli di garanzia | Sicurezza e integrazione | [§9](#9-area-sicurezza), [§10](#10-area-integrazione) | [04 - Identità e anagrafiche](04-identita-e-anagrafiche.md) |
| Collegare un gestionale esistente | Integrazione | [§10](#10-area-integrazione) | [14 - I flussi funzionali](14-flussi-funzionali.md) |
| Componente incorporabile, tema, marchio bianco | Integrazione | [§10](#10-area-integrazione) | [13 - I protocolli](13-protocolli.md) |
| Fascicolo tecnico, gestione del rischio, usabilità regolatoria | Conformità | [§11](#11-area-conformita) | [15 - Il quadro regolatorio da zero](15-regolatorio-da-zero.md) |
| Verificare che una fonte citata sia esatta e vigente | Conformità e guida | [§11](#11-area-conformita), [§12](#12-guida-dei-fondamenti) | [20 - Fonti primarie](20-fonti-primarie.md) |
| Spiegare qualcosa a chi parte da zero | Guida | [§12](#12-guida-dei-fondamenti) | [00 - Come usare questa guida](00-come-usare-questa-guida.md) |
| Traduzione integrale in inglese | Guida e sito | [§12](#12-guida-dei-fondamenti), [§13](#13-sito-di-documentazione) | [19 - Glossario](19-glossario.md) |
| Navigazione, ricerca, cambio lingua, costruzione del sito | Sito | [§13](#13-sito-di-documentazione) | [17 §9 - I controlli](17-ambiente-di-sviluppo.md) |

Due voci non compaiono nella tabella perché non sono aree ma **attraversano tutte**: la
roadmap, che raccoglie il quando e non il che cosa
([`docs/09_roadmap/`](../09_roadmap/00-indice.md)), e la panoramica, che è materiale di
presentazione. Nessuna delle due si modifica in isolamento: una voce di roadmap si sposta perché
è cambiato qualcosa altrove, e una pagina di presentazione si riscrive dopo che il fatto
presentato è cambiato, non prima.

---

## 2. Come si legge una sezione di quest'elenco

Ogni sezione da [§4](#4-area-tecnica) a [§13](#13-sito-di-documentazione) ha la stessa struttura
in sei punti. La ripetizione è voluta: chi conosce già una sezione sa dove guardare in tutte le
altre.

| Punto | Che cosa contiene | A che cosa serve |
|---|---|---|
| **Che cosa si fa qui** | Il perimetro reale dell'area e il tipo di lavoro di cui c'è bisogno **oggi**, che non coincide con l'elenco dei capitoli | Capire se l'area è quella giusta prima di leggerne mille righe |
| **Che cosa sapere prima** | I moduli della guida, **in ordine**, con la ragione per cui quell'ordine e non un altro | Non scoprire a metà lavoro che manca un presupposto |
| **Il primo contributo sensato** | Un lavoro concreto, piccolo, utile e non simbolico | Entrare nell'area con un ciclo completo di revisione, invece che con una modifica grande e irrevisionabile |
| **Errori tipici di chi arriva da un altro dominio** | Distinti per provenienza: **informatica gestionale** e **sanità**. Sono errori diversi, e presidiarli insieme non funziona | Riconoscere il proprio errore prima che lo riconosca chi rivede |
| **Che cosa non si tocca senza discuterne prima** | Gli elementi vincolati da una decisione, da un vincolo di bacheca o da una fonte normativa, con l'indicazione di **dove** si discute | Non spendere giorni su una modifica che verrà rifiutata per una ragione che non è tecnica |
| **Come si verifica il proprio lavoro** | I controlli, le prove e le letture da fare **prima** di aprire la proposta | Non consumare un ciclo di attesa per un difetto che si vedeva in locale |

Sul quarto punto vale una precisazione, perché è la parte del modulo che qualcuno leggerà come
scortesia. Non lo è. **Le due provenienze sbagliano in modo sistematicamente diverso**, e
descrivere l'errore tipico è il modo più economico di evitarlo. Chi arriva dall'informatica
gestionale tende a semplificare il dominio: fonde concetti che la norma tiene distinti, tratta un
valore clinico come un numero, ottimizza un modello finché non è più capace di dire la verità su
ciò che è accaduto. Chi arriva dalla sanità tende a sottovalutare i vincoli di macchina:
presuppone che il sistema «sappia» ciò che un professionista sa, che una regola formulata a voce
sia implementabile, che un caso limite raro non richieda comunque un comportamento definito.
Nessuna delle due tendenze è un difetto personale: sono le forme di ignoranza reciproca che
questa guida esiste per ridurre.

---

## 3. Le sei cose che valgono in ogni area

Prima delle sezioni specifiche, ciò che non cambia. Sono in ordine di frequenza con cui vengono
violate.

**Prima - nessun dato reale, in nessun artefatto.** Vale per codice, prove, esempi di
documentazione, segnalazioni, immagini di schermata, messaggi di commit e cronologia. Vale anche
per i tuoi dati. La ragione, la tecnica di generazione e il marcatore di sinteticità persistito
nel dato sono in [03 §10](03-il-dato-clinico.md) e in
[17 §5](17-ambiente-di-sviluppo.md). Il controllo `G10` è l'ultima rete, non la prima: se scatta,
qualcosa a monte è già andato storto.

**Seconda - la regola di riservatezza `R0`.** Nessun nome di azienda, marchio, prodotto
commerciale o dominio di potenziali partner compare in alcun artefatto del progetto. Si scrive
sempre «un gestionale sanitario cloud», «un sistema di cartella clinica di terze parti»,
«l'integratore». Il controllo `G11` la traduce in verifica automatica. Non è una preferenza
editoriale: esistono ragioni di riservatezza che non spetta a chi contribuisce valutare.

**Terza - le formule che nessun artefatto pubblico può usare.** Nessun testo del progetto -
pagina, titolo di sezione, descrizione di interfaccia, messaggio di errore, nota di rilascio -
può affermare o lasciare intendere una conformità, una marcatura o una certificazione che non
esistono. La tabella delle formule vietate e di quelle ammesse è in
[`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md)
§11, ed è un vincolo (`V-171`) con fondamento normativo: il materiale promozionale **è**
materiale regolatorio. L'elenco parallelo per i protocolli, che vieta di dichiarare conformità a
specifiche informative o a bozze scadute, è in
[`docs/04_protocols/10-conformita-e-prove.md`](../04_protocols/10-conformita-e-prove.md) §2
(`V-133`).

**Quarta - gli identificativi non si rinumerano.** `RF-*`, `RNF-*`, `BR-*`, `ATT-*`, `UC-*`,
`OUT-*` e i codici di esito sono congelati. Un identificativo riusato per un requisito diverso
rende inservibile l'intera matrice di tracciabilità, e mantenere la tracciabilità è una delle
attività **retroattivamente irrecuperabili** della decisione `D45`. Gli intervalli liberi si chiedono in
bacheca prima dell'uso (`V-120`).

**Quinta - una proposta che tocca il contenuto italiano non è completa finché non aggiorna
l'inglese.** Il controllo `G8` blocca la divergenza. Non è un rischio di traduzione: è contenuto
normativo diverso in due lingue, che in un contesto di dispositivo medico è un difetto
documentale.

**Sesta - i controlli obbligatori non si aggirano.** Sono condizioni di ammissibilità, non
giudizi di qualità: aggirarne uno produce un artefatto che non avrebbe potuto essere prodotto e
che porta con sé una dichiarazione falsa. Se un controllo blocca legittimamente uno sviluppo
legittimo, **si corregge il controllo con la procedura prevista**, non lo si disattiva per la
propria proposta (`V-191`, [17 §9.4](17-ambiente-di-sviluppo.md)).

---

## 4. Area tecnica

Perimetro: [`docs/01_technical/`](../01_technical/00-indice.md). Codice: `telemedic/platform/`,
`telemedic/contexts/*/infrastructure`, `telemedic/interfaces/`, `web/`.

### 4.1 Che cosa si fa qui

Quest'area stabilisce **come il sistema è realizzato**: quali tecnologie, con quale struttura,
con quali limiti misurati o dichiarati. Non decide che cosa il sistema fa, né perché i confini
interni sono quelli.

Il lavoro di cui c'è bisogno oggi non è distribuito uniformemente sui nove capitoli. Tre fronti
sono aperti e concreti.

Il primo è la **catena di costruzione**, che per vincolo `V-182` **precede** la prima riga di
codice applicativo: distinta dei materiali generata automaticamente, registro degli identificativi
di requisito, controlli obbligatori eseguibili anche in locale. È lavoro poco appariscente e
strutturalmente insostituibile, perché censire i componenti di terze parti a posteriori costa
diverse volte tanto.

Il secondo è l'**interfaccia**, dove i criteri di accettazione esistono già in forma verificabile
(`M1`-`M8` per la resa su schermo piccolo, `A1`-`A10` per l'accessibilità) e mancano le
implementazioni. È il fronte con la barriera d'ingresso più bassa e l'impatto più alto, perché ogni
schermata che viola uno dei criteri `A1`-`A10` non è completabile nel senso di
[`01_technical/04-frontend.md`](../01_technical/04-frontend.md) §7.2, e quindi non è una
schermata terminata.

Il terzo è la **misura**: il piano media espone contatori grezzi che vanno differenziati fra
campioni consecutivi prima di significare qualcosa (`V-113`), e il dispositivo di riferimento su
cui misurare le soglie dell'interfaccia non è ancora dichiarato (`Q-115`). Chi ha un apparecchio
di fascia media di qualche anno fa e sa misurare seriamente fa un lavoro che oggi nessuno sta
facendo.

### 4.2 Che cosa sapere prima

In quest'ordine, e l'ordine conta.

1. [11 - Fondamenti informatici](11-fondamenti-informatici.md) per intero se non hai familiarità
   con consistenza, aggregati, idempotenza, contropressione, percentili e sicurezza a livello di
   riga. L'area tecnica **presuppone** questo modulo e non ne ripete un concetto.
2. [`docs/01_technical/01-stack-e-motivazioni.md`](../01_technical/01-stack-e-motivazioni.md),
   che dice per ogni tecnologia quale problema risolve, quali alternative sono state scartate e
   qual è la versione minima con la sua ragione.
3. Il capitolo dell'area che riguarda il tuo lavoro: `02` per il servizio, `03` per la
   persistenza, `04` per l'interfaccia, `05` per il media, `06` per l'osservabilità.
4. [`docs/01_technical/08-qualita-e-test.md`](../01_technical/08-qualita-e-test.md), sempre,
   perché la soglia di copertura è differenziata per ambito e la tracciabilità requisito → prova
   è una condizione di certificabilità, non una buona pratica.

Se tocchi il **media**, aggiungi [08 - WebRTC da zero](08-webrtc-da-zero.md) per intero **prima**
del capitolo 05, e leggi il §1 di quel capitolo per primo: distingue ciò che il progetto realizza
da ciò che appartiene al protocollo e al navigatore, ed è la distinzione che risparmia i due
errori più costosi dell'area.

Se tocchi l'**interfaccia**, aggiungi [09 - Il corpo, i parametri, il ragionamento
clinico](09-fondamenti-clinici.md). Non è un capriccio: chi progetta il campo in cui si inserisce
una saturazione senza sapere che cosa misura una saturazione produce un campo che accetta valori
impossibili e rifiuta valori legittimi.

### 4.3 Il primo contributo sensato

**Prendi una schermata e portala a conformità sui criteri `A1`-`A10`, con la prova che lo
dimostra.** È un contributo piccolo, autocontenuto, verificabile da un terzo e utile
immediatamente. Ha inoltre il pregio di farti attraversare l'intero ciclo: modifica, prova
automatica, prova manuale con tecnologia assistiva, aggiornamento della documentazione italiana e
inglese, controlli obbligatori in locale.

Alternativa di pari dimensione sul lato servizio: **aggiungi la scheda di un componente di terze
parti mancante** alla distinta dei materiali - funzione nel sistema, alternativa nota, canale
degli avvisi, impatto sul rischio - e fai passare il controllo `G5`. È il tipo di lavoro che
sembra burocratico e che, se non fatto ora, non si fa più.

### 4.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Usa un contatore cumulativo come indicatore di qualità.** Perdita, byte, durata dei
  congelamenti e ritardo del buffer crescono in modo monotono: la media corretta è un rapporto
  fra differenze di campioni consecutivi, non un valore letto una volta (`V-113`). L'errore
  produce cruscotti che sembrano funzionare e che mentono in modo crescente.
- **Aggiunge un valore predefinito «ragionevole».** In un contesto clinico non esiste un valore
  predefinito ragionevole per una soglia: il campo parte vuoto e obbligatorio (`V-123`). La
  precompilazione, anche con il valore dell'ultimo piano, è vietata.
- **Tratta la migrazione dello schema come un atto unico.** Nessun rilascio è insieme distruttivo
  e funzionale: due versioni consecutive devono poter convivere sulla stessa base dati
  (`V-111`). Una funzionalità che richieda una migrazione distruttiva nello stesso rilascio va
  riprogettata, non autorizzata in deroga.
- **Imposta il contesto di tenant fuori dalla transazione.** Le politiche di sicurezza a livello
  di riga negano tutto in assenza di contesto: l'impostazione va fatta **dentro** la transazione
  e con la forma locale, non con quella di sessione (`V-112`).

**Chi arriva dalla sanità.**

- **Chiede un comportamento «come in ambulatorio» senza definire il caso limite.** In ambulatorio
  la disambiguazione la fa una persona; nel software la fa una riga di codice, e se non è scritta
  il sistema fa comunque qualcosa. La domanda giusta da porre è sempre: *che cosa deve accadere
  quando il dato non c'è?*
- **Sottovaluta la rete dell'assistito.** La progettazione parte dallo schermo piccolo e dalla
  connessione peggiore, non dal desktop dello sviluppatore. Un requisito che non si completa su
  un apparecchio modesto in rete mobile **non è soddisfatto**, per criterio esplicito.
- **Confonde una soglia tecnica con una conformità.** Nessuna soglia tecnica di quest'area è
  imposta dalla normativa italiana: i valori del progetto sono specifica di prodotto (`V-12`).
  Presentarli come conformità è un difetto regolatorio.

### 4.5 Che cosa non si tocca senza discuterne prima

| Elemento | Perché è vincolato | Dove si discute |
|---|---|---|
| Sostituzione o aggiunta di una tecnologia dello stack | Ogni scelta ha versione minima motivata e classificazione come componente di terze parti | Segnalazione, poi decisione architetturale registrata |
| Forma degli errori sulle interfacce pubbliche | Esistono **due sole** rappresentazioni ammesse, e un codice non catalogato non può essere emesso (`V-110`, `V-130`) | Bacheca, aree tecnica e protocolli |
| Contenitore e codec della registrazione | Si negoziano a runtime e si registrano nei metadati: **nessun formato unico può essere dichiarato** (`V-11`, `V-115`) | Bacheca |
| Indice di qualità della sessione | È proprietario e va dichiarato tale; non è un punteggio di opinione media secondo alcuna raccomandazione (`V-114`) | Bacheca |
| Etichette di versione mobili su dipendenze o immagini di base | Violano una clausola sul controllo della configurazione, non una preferenza (`V-173`) | Area di conformità |
| Confini fra moduli del servizio | Sono la struttura del sistema; il controllo `G13` li verifica | Area architetturale |

### 4.6 Come si verifica il proprio lavoro

Prima di aprire la proposta: costruzione completa; suite di prove del perimetro toccato; controllo
dei segreti; controllo delle terminologie; verifica automatica di accessibilità se hai toccato
l'interfaccia; aggiornamento dell'inglese se hai toccato un documento italiano. La sequenza
minima e le vie d'uscita quando un controllo fallisce sono in
[17 §9](17-ambiente-di-sviluppo.md).

Due verifiche in più che l'automazione non fa e che quest'area richiede comunque. La prima:
**prova manuale con una tecnologia assistiva reale**, perché la verifica automatizzata intercetta
una minoranza dei difetti di accessibilità. La seconda: se hai toccato il media, **prova in rete
degradata**, con perdita e ritardo simulati, e non solo in rete locale - dove tutto funziona
sempre.

---

## 5. Area architetturale

Perimetro: [`docs/02_architecture/`](../02_architecture/00-indice.md) e
[`docs/adr/`](../adr/README.md).

### 5.1 Che cosa si fa qui

Quest'area stabilisce **i confini**: quali contesti esistono, quali invarianti reggono, quali
aggregati delimitano una transazione, come si propaga il contesto di tenant, come si dimostra ciò
che è accaduto. È l'area che viene prima delle altre, e un errore commesso qui si propaga per
costruzione ovunque.

Ne discende la caratteristica che la distingue da tutte le altre: **qui non si contribuisce con
una modifica, si contribuisce con un argomento.** La forma di un contributo architetturale è un
documento di decisione che ricostruisce il contesto, le alternative considerate, la decisione e
le conseguenze. Un'affermazione architetturale senza documento di decisione è un difetto di
documentazione, non una scorciatoia ammessa.

Il lavoro aperto oggi è concentrato nel capitolo delle **decisioni rinviate**, che elenca ciò che
deliberatamente non è deciso con i criteri per deciderlo. È il posto giusto da cui cominciare, ed
è anche il posto in cui si scopre che una domanda apparentemente nuova è già registrata.

### 5.2 Che cosa sapere prima

1. [11 - Fondamenti informatici](11-fondamenti-informatici.md), integralmente. Quest'area
   presuppone contesto delimitato, aggregato, outbox transazionale, idempotenza, consistenza,
   sicurezza a livello di riga e percentili come vocabolario acquisito.
2. [`docs/02_architecture/01-visione-architetturale.md`](../02_architecture/01-visione-architetturale.md),
   che contiene i compromessi accettati **e quelli rifiutati**. La seconda lista è quella che
   evita di riproporre un'opzione già scartata con motivazione.
3. [`docs/02_architecture/02-contesti-delimitati.md`](../02_architecture/02-contesti-delimitati.md),
   almeno la mappa e la tabella di sintesi.
4. [`docs/02_architecture/09-decisioni-rinviate.md`](../02_architecture/09-decisioni-rinviate.md),
   **prima** di proporre qualunque cosa, per verificare di non stare decidendo d'ufficio qualcosa
   che è deliberatamente aperto.

Se il tuo contributo tocca il registro immutabile, aggiungi
[12 - Crittografia e sicurezza](12-crittografia-e-sicurezza.md), le sezioni su funzioni di hash e
catene di impronte. Se tocca il modello dati, aggiungi [06 - FHIR da zero](06-fhir-da-zero.md),
perché il rapporto fra modello canonico e rappresentazione standard è il punto in cui l'area si
gioca la propria sostituibilità.

### 5.3 Il primo contributo sensato

**Prendi una decisione già presa e verifica che il documento che la registra sia completo.** Un
documento di decisione utile contiene quattro cose: il contesto, le alternative **con la ragione
per cui sono state scartate**, la decisione e le conseguenze - comprese quelle sfavorevoli. Ne
mancano regolarmente una o due. Aggiungere l'alternativa scartata che manca, o la conseguenza
operativa che nessuno aveva scritto, è un contributo piccolo e di valore sproporzionato, perché è
esattamente ciò che sei mesi dopo nessuno ricorda.

Alternativa: **prendi una voce delle decisioni rinviate e scrivi i criteri di decisione**, senza
decidere. Elencare che cosa andrebbe misurato, quale vincolo la decisione deve soddisfare e quale
conseguenza avrebbe ciascuna opzione è lavoro utile e non richiede l'autorità di scegliere.

### 5.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Fonde la prestazione clinica e la sessione media.** Sono aggregati distinti con cicli di vita
  indipendenti (`V-01`): fonderli fa sì che ogni disconnessione crei un contatto fantasma e che
  una caduta di rete chiuda un atto clinico. È l'errore numero due della casistica dell'area di
  dominio, ed è quello che sembra più ragionevole.
- **Introduce una colonna di stato aggiornata sul posto.** L'allarme è una sequenza di eventi
  immutabili e lo stato corrente è una proiezione (`V-121`). Una colonna aggiornata sul posto
  cancella la storia proprio dove la storia è l'oggetto della prova.
- **Usa un identificatore esterno come chiave primaria.** La normalizzazione degli identificatori
  avviene al confine, mai nel dominio (`V-142`): il dominio conosce un identificativo canonico
  interno e una collezione di identificatori esterni qualificati da dominio di attribuzione.
- **Confonde il versionamento delle entità con l'immutabilità.** Chi ha accesso in scrittura alla
  base dati può alterare anche le tabelle di versione: serve catena di impronte e conservazione
  separata (`V-04`, decisione `D42`).

**Chi arriva dalla sanità.**

- **Chiede che il sistema «sappia» qualcosa che nessuno gli ha detto.** Il sistema non deduce
  soglie, non interpreta silenzi come normalità e non calcola punteggi non richiesti. L'assenza di
  dato è informazione clinica e va rappresentata come entità, non come assenza di riga (`V-09`,
  `V-148`).
- **Descrive un percorso di cura come se fosse una funzionalità.** Nessun percorso di cura sta nel
  codice: aggiungerne uno deve richiedere una definizione caricata, validata e pubblicata con
  versione, **mai** un rilascio del software (`V-147`). Un contributo che cabli un percorso viene
  rifiutato anche se il percorso è corretto.
- **Sottovaluta la moltiplicazione territoriale.** Ventuno cicli amministrativi indipendenti
  diventano ventuno rami di codice se il modello non li tiene fuori. È la ragione per cui il
  catalogo delle prestazioni ha struttura nel prodotto e contenuto per tenant.

### 5.5 Che cosa non si tocca senza discuterne prima

Praticamente tutto ciò che quest'area contiene è vincolato per costruzione: è il suo scopo. In
concreto, richiedono discussione preventiva e documento di decisione registrato:
la separazione fra prestazione e sessione media; il modello di isolamento fra tenant; ciò che
passa dall'outbox e ciò che non vi passa; la struttura del registro immutabile e il punto di
ancoraggio esterno della sua impronta; l'identificativo canonico delle anagrafiche; il perimetro
di ciò che è contratto verso terzi (`V-160`).

Dove si discute: **bacheca inter-agenti** per il coordinamento fra aree, **documento di decisione
architetturale** per l'atto. In caso di divergenza fra un documento di quest'area e un documento
di un'altra area su un fatto architetturale, prevale quest'area, e chi rileva la divergenza non la
risolve d'ufficio: la porta in bacheca.

### 5.6 Come si verifica il proprio lavoro

Un contributo architetturale si verifica in modo diverso da un contributo di codice, e la verifica
è più severa, non meno.

Prima: **ogni conseguenza dichiarata deve essere verificabile da un terzo**. «Migliora la
manutenibilità» non è una conseguenza; «due versioni consecutive possono convivere sulla stessa
base dati, e la prova X lo dimostra» lo è. Seconda: **le alternative scartate devono essere
scartate con una ragione, non con una preferenza**. Terza: **la decisione non deve contraddire un
vincolo in vigore**; se lo contraddice, va dichiarato esplicitamente e contestato in bacheca, non
taciuto. Quarta: i collegamenti interni devono reggere il controllo `G9`, perché un documento di
decisione che rinvia a un capitolo inesistente è un documento che nessuno può verificare.

---

## 6. Area funzionale

Perimetro: [`docs/03_functional/`](../03_functional/00-indice.md).

### 6.1 Che cosa si fa qui

Quest'area descrive **che cosa il sistema fa**, per chi, a quali condizioni e con quali
conseguenze quando le cose vanno diversamente da come dovrebbero. Il criterio redazionale che la
governa è uno solo, e va enunciato prima di contribuirvi: **un requisito che non sai come
verificare non è un requisito.** Ogni voce del catalogo ha un criterio di accettazione nella forma
*dato / quando / allora*, e ogni requisito non funzionale ha metrica, soglia, condizione di misura
e metodo di verifica.

Il lavoro aperto oggi è di due tipi. Il primo è la **copertura dei flussi di errore**: i flussi
principali sono descritti, i flussi alternativi e di errore lo sono in modo diseguale, e in questo
dominio è nei flussi di errore che si annida il danno - il paziente che non riesce a collegarsi
non è il paziente che non si è presentato, e i due casi hanno effetti amministrativi opposti
(`V-141`). Il secondo è la **verifica dei criteri di accettazione contro utenti reali**, che oggi
non è stata fatta e che senza un dispositivo di riferimento dichiarato non è nemmeno
completamente eseguibile (`Q-115`).

### 6.2 Che cosa sapere prima

1. [02 - Le prestazioni di telemedicina](02-prestazioni-di-telemedicina.md). Senza questo modulo
   metà delle scelte dell'area sembra arbitraria: le definizioni sono normative, non commerciali,
   e la differenza fra televisita, teleconsulto e teleconsulenza cambia gli attori ammessi.
2. [10 - Percorsi di cura e sicurezza del paziente](10-percorsi-di-cura-e-sicurezza.md),
   **obbligatorio** se tocchi soglie, allarmi, silenzio del paziente o copertura oraria. È il
   modulo che spiega perché una scala clinica non è una formula e perché l'errore d'uso è una
   categoria distinta dal difetto.
3. [14 - I flussi funzionali](14-flussi-funzionali.md), per vedere come i pezzi si incastrano
   end-to-end, ripieghi compresi.
4. [`docs/03_functional/07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md), **prima**
   di proporre una funzionalità. Contiene ciò che il sistema deliberatamente non fa, con la
   categoria di riapribilità di ciascuna esclusione.

Se tocchi l'accessibilità, aggiungi
[`docs/03_functional/06-accessibilita-e-usabilita.md`](../03_functional/06-accessibilita-e-usabilita.md),
che traduce il criterio di accettazione operativo in due prove obbligatorie per ciascun percorso
critico.

### 6.3 Il primo contributo sensato

**Prendi un caso d'uso e scrivi il flusso di errore che manca.** Non il flusso principale, che
c'è: il caso in cui l'assistito perde la connessione a metà, in cui il professionista chiude la
scheda per errore, in cui la misura arriva due volte, in cui il consenso viene revocato mentre la
sessione è in corso. Ogni flusso di errore aggiunto è un comportamento che smette di essere
implicito.

La forma del contributo è precisa: precondizioni, passi, esito tipizzato, effetto amministrativo,
postcondizione. E la regola che lo rende accettabile: **un esito anomalo è un'operazione riuscita
che registra un fatto sfavorevole**, non un errore di protocollo (`V-126`). Confondere le due cose
fa sparire dai registri clinici ciò che deve restarci.

### 6.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Collassa stato ed esito in un unico campo.** Lo stato dice dove si trova il contatto, l'esito
  che cosa è successo. Due esiti possono condividere lo stato terminale e avere effetti
  amministrativi opposti (`V-141`).
- **Scrive un requisito non falsificabile.** «Il sistema deve essere affidabile» non produce un
  test che possa fallire, quindi non è un requisito. La formulazione va rifatta con metrica,
  soglia e condizione di misura.
- **Mette un valore clinico in un documento tecnico.** Nessuna soglia clinica compare in questi
  documenti, nemmeno come esempio: un valore numerico scritto in una specifica finisce, prima o
  poi, in una costante (`V-02`). Dove serve un esempio si usa una lettera.
- **Tratta il consenso come un booleano.** Esistono cinque oggetti di consenso distinti con cicli
  di vita indipendenti, e la revoca di uno non tocca gli altri (`V-146`). Nessun «consenso alla
  piattaforma» esiste nel modello.

**Chi arriva dalla sanità.**

- **Formula la regola come la formulerebbe a un collega.** «Se il paziente sta peggiorando si
  chiama» non è implementabile. Serve: quale grandezza, misurata quando, confrontata con che
  cosa, con quale finestra, con quale destinatario, entro quanto tempo, e che cosa accade se il
  destinatario non risponde.
- **Presume che la copertura oraria sia un dettaglio contrattuale.** È un dato di runtime
  versionato che condiziona la validità del destinatario nella catena di escalation: un
  destinatario fuori copertura non è un destinatario valido (`V-122`). È una misura di controllo
  del rischio, non una clausola di listino.
- **Chiede una funzione che sposta la qualificazione del prodotto.** Soglia proposta dal sistema,
  ordinamento per gravità, interpolazione dei buchi, indice sintetico, miglioramento d'immagine,
  codifica automatica, sintesi automatica: sono in un elenco chiuso e si rifiutano **per politica
  di perimetro**, non nel merito tecnico (`V-170`). Il rifiuto non è un giudizio sulla bontà
  dell'idea.

### 6.5 Che cosa non si tocca senza discuterne prima

| Elemento | Perché è vincolato | Dove si discute |
|---|---|---|
| Aggiungere una funzione dell'elenco fuori perimetro | Cambia la classe di rischio e la classe di sicurezza del software insieme (`V-170`) | Area di conformità, con motivazione regolatoria scritta |
| Numerare un requisito nuovo | Gli intervalli sono congelati e quelli liberi si chiedono (`V-120`) | Bacheca |
| Riformulare la destinazione d'uso del telemonitoraggio | «Raccolta differita per la revisione periodica» è formulazione vincolata: «monitoraggio in tempo reale» sposta la classe (`V-144`) | Area di conformità |
| Presentare la copertura oraria come livello di servizio commerciale | È una misura di controllo del rischio del livello più debole della gerarchia | Prodotto, questione `Q-121` |
| Esporre contenuto clinico a un pagatore | Esclusione normativa permanente, non configurabile (`V-08`, `V-166`) | Nessuna discussione possibile: è una fonte in vigore |

### 6.6 Come si verifica il proprio lavoro

Tre verifiche, in quest'ordine.

**La prima è di forma:** ogni requisito che hai scritto produce un test che può fallire? Se non
sai come scriverlo, il requisito non è finito.

**La seconda è di tracciabilità:** il requisito è collegato a un caso d'uso e a una regola, e la
regola cita la fonte normativa dove esiste? Una modifica che non cita il requisito rompe la
tracciabilità, che non si ricostruisce.

**La terza è di perimetro:** hai verificato in
[`07-fuori-perimetro.md`](../03_functional/07-fuori-perimetro.md) che ciò che proponi non sia già
escluso, e con quale categoria? Un'esclusione di categoria normativa non si riapre finché la fonte
è in vigore; un'esclusione di categoria di perimetro si riapre con il normale governo del
prodotto. Sono due risposte diverse alla stessa proposta.

---

## 7. Area protocolli

Perimetro: [`docs/04_protocols/`](../04_protocols/00-indice.md). Codice:
`telemedic/interfaces/`.

### 7.1 Che cosa si fa qui

Quest'area descrive **come Telemedic usa i protocolli**, non che cosa sono. Tre affermazioni la
reggono, e sono anche il criterio con cui un contributo viene accettato o respinto.

**Una versione non dichiarata è una versione non adottata.** Ogni specifica citata porta numero di
versione, stato di maturità e data. Scrivere «FHIR R4» invece di «FHIR 4.0.1» in un progetto
soggetto a controllo della configurazione è un difetto, perché le due revisioni differiscono negli
invarianti e i validatori si comportano di conseguenza.

**Uno standard citato non è uno standard rispettato.** L'area distingue sistematicamente ciò che
una specifica impone, ciò che raccomanda e ciò che è scelta di progetto perché la specifica tace.
Le scelte di progetto sono marcate come tali e non vengono presentate come conformità.

**Una specifica in bozza è una dipendenza con una data di scadenza.** Buona parte di ciò che serve
a un sistema di telemedicina italiano è in stato di implementazione di prova o di bozza attiva.
Ciò non impedisce di adottarla; impone di fissarne la versione, dichiararne lo stato e programmare
il ricontrollo.

Il lavoro aperto è concentrato su due punti: l'**analisi degli scostamenti** fra il tracciato
informativo cogente del referto di televisita e il profilo che dovrebbe rappresentarlo, che non è
stata eseguita (`Q-132`); e gli **strumenti di validazione eseguibili in locale**, senza i quali
la richiesta di validare le risorse prima di aprire una proposta non è eseguibile (`Q-193`).

### 7.2 Che cosa sapere prima

1. [05 - Gli standard di interoperabilità](05-standard-di-interoperabilita.md), che spiega perché
   esistono, chi li scrive e come si leggono. Il §9 di quel modulo, su come si legge uno standard,
   è la parte che risparmia più tempo.
2. [06 - FHIR da zero](06-fhir-da-zero.md) per intero se tocchi il piano clinico.
3. [13 - I protocolli, uno per uno](13-protocolli.md), che contiene il catalogo ragionato con
   stato e versione di ciascuna specifica. Il §9 è la tabella riassuntiva.
4. [`docs/04_protocols/01-principi-di-interoperabilita.md`](../04_protocols/01-principi-di-interoperabilita.md),
   che dice quali versioni sono fissate, che cosa succede quando cambiano e che cosa è promesso a
   chi integra.

Se tocchi il tempo reale, [08 - WebRTC da zero](08-webrtc-da-zero.md) è prerequisito e non
sostituto: il capitolo 09 dell'area presuppone quel modulo integralmente.

### 7.3 Il primo contributo sensato

**Prendi una specifica citata nell'area e verifica sul testo primario che la citazione sia
esatta**: numero, sezione, stato, e - soprattutto - se la specifica sia stata superata da una più
recente. È un contributo che non richiede di scrivere codice, richiede di leggere con attenzione,
e produce esattamente il tipo di correzione che nessuno trova per caso.

Il secondo contributo di pari valore: **aggiungi una prova negativa**. Le prove negative di
quest'area sono peculiari e insostituibili - verificano che qualcosa **non** accada. Che
un'intestazione vietata dalla specifica non compaia; che un token privo del claim dell'attore non
venga mai emesso; che un codice non catalogato non possa essere prodotto. Una prova negativa
mancante è un divieto che esiste solo nella prosa.

### 7.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Chiama «standard» ciò che non lo è.** L'intestazione di idempotenza è una bozza scaduta e
  archiviata; quelle di limitazione del traffico sono una bozza attiva, e la forma a tre campi non
  è mai stata standard. Presentarle come standard è vietato esplicitamente (`V-133`).
- **Mette il contenuto clinico nell'evento.** Gli eventi trasportano riferimenti; il contenuto si
  rilegge con una chiamata autenticata sotto l'autorizzazione del ricevente (`V-135`, `V-161`). È
  senza eccezioni, anche sul canale clinico.
- **Usa l'impersonificazione invece della delega.** Quando l'identità proviene da un emittente
  esterno si usa sempre la delega, con il claim dell'attore: nessuna configurazione supportata
  emette un token che ne sia privo (`V-132`). È criterio di rilascio bloccante.
- **Assume la consegna ordinata da un meccanismo che non la garantisce.** Il protocollo che
  trasporta i candidati di connessione deve consegnarli esattamente una volta e nello stesso
  ordine; una diffusione senza persistenza non lo garantisce, e il difetto che ne deriva è
  intermittente e dipendente dal carico (`V-131`).

**Chi arriva dalla sanità.**

- **Presume che «conforme allo standard» sia un'affermazione binaria.** Non lo è quasi mai: si è
  conformi a una versione, per un insieme di risorse, con un profilo dichiarato, e le mappe fra
  formati sono spesso documenti informativi che non fondano alcuna conformità.
- **Presume che il documento italiano esista in forma tecnica.** I modelli documentali, i codici
  di tipologia e i metadati di indicizzazione delle tipologie della telemedicina non sono
  pubblicamente disponibili (`Q-07`): l'adattatore esiste come punto di estensione con contratto
  dichiarato, e l'implementazione è rinviata. Nessun modello è cablato (`V-136`).
- **Chiede che il sistema scriva nel documento un valore che ha misurato.** Il valore misurato
  entra nel documento **confermato dal professionista**, mai generato autonomamente: sarebbe
  informazione prodotta dal sistema dentro un documento clinico.

### 7.5 Che cosa non si tocca senza discuterne prima

Il perimetro di ciò che è **contratto** verso terzi (`V-160`): percorsi, metodi, parametri e
schemi documentati; profili pubblicati e documento di capacità; tipi di evento e schemi del loro
dato; ambiti di autorizzazione; identificatori dei tipi di problema e codici di esito; interfacce
dei moduli sostituibili; protocollo di messaggistica del componente incorporabile. Tutto ciò è
soggetto a un processo di dismissione a dodici mesi, e una modifica non additiva richiede una
versione maggiore dichiarata - il controllo `G6` la intercetta.

Non si toccano senza discussione neppure: la versione fissata di una guida o di un profilo; il
catalogo unico dei codici di errore, che è generato e non scritto a mano (`V-130`); la forma della
firma dei messaggi in uscita, che è asimmetrica per scelta motivata (`V-162`).

Dove si discute: bacheca inter-agenti verso l'area competente, e - per ciò che è contratto -
documento di decisione registrato, perché la modifica ha effetti su soggetti esterni al progetto.

### 7.6 Come si verifica il proprio lavoro

**Validazione delle risorse contro i profili fissati**, con i pacchetti risolti come artefatto di
costruzione e non scaricati al momento: un cambiamento a monte non può cambiare l'esito di una
validazione già eseguita. Distinguere sempre, nel rapporto, la conformità al modello di base dalla
conformità al profilo: è la distinzione che conta all'atto pratico.

`[NV]` - nomi, versioni e modalità di invocazione degli strumenti non sono fissati (`Q-133`,
`Q-193`). Finché non lo sono, la verifica minima è: citazione controllata sul testo primario,
prova negativa dove esiste un divieto, e dichiarazione esplicita di ciò che è scelta di progetto.

---

## 8. Area dominio

Perimetro: [`docs/05_domain/`](../05_domain/00-indice.md). Codice: `telemedic/contexts/*/domain`.

### 8.1 Che cosa si fa qui

Quest'area risponde a una sola domanda: **come si trasforma il dominio sanitario reale in un
modello eseguibile senza tradirlo.** Il criterio che governa ogni scelta è che **il modello deve
poter dire la verità su ciò che è accaduto**. Un modello che non sa distinguere un assistito che
non si è presentato da uno che ha tentato e non è riuscito a collegarsi non è impreciso: è falso,
e produce addebiti ingiusti.

È l'area in cui il contributo di un clinico vale più di quello di uno sviluppatore, e in cui il
contributo di uno sviluppatore che ha letto il blocco clinico della guida vale più di quello di
uno sviluppatore che l'ha saltato.

Il lavoro aperto oggi è di tre tipi. Il primo è l'**allineamento terminologico** al glossario
nazionale, che non è stato eseguito voce per voce e che va compiuto **prima** del congelamento del
glossario del dominio e prima della traduzione, perché una divergenza scoperta dopo si propaga su
due lingue (`Q-146`). Il secondo è la **verifica di copertura** fra il dataset canonico dei
documenti e il tracciato cogente. Il terzo, meno appariscente e più utile, è la **revisione
clinica delle definizioni**: leggere il linguaggio ubiquo e dire dove una definizione operativa
tradisce il concetto reale.

### 8.2 Che cosa sapere prima

1. [03 - Il dato clinico](03-il-dato-clinico.md): che cos'è un dato relativo alla salute, perché è
   una categoria particolare, che cosa comporta trattarlo.
2. [02 - Le prestazioni di telemedicina](02-prestazioni-di-telemedicina.md), per le definizioni
   normative e le condizioni di erogabilità.
3. [09 - Il corpo, i parametri, il ragionamento clinico](09-fondamenti-clinici.md), che è il
   modulo che chi arriva dall'informatica è più tentato di saltare ed è quello che paga di più.
   Senza sapere che cosa misura una saturazione e perché un valore isolato non significa nulla si
   scrive codice che tratta un parametro vitale come un numero qualsiasi.
4. [04 - Identità e anagrafiche](04-identita-e-anagrafiche.md), se tocchi soggetti, ruoli o
   deleghe.
5. [`docs/05_domain/01-linguaggio-ubiquo.md`](../05_domain/01-linguaggio-ubiquo.md), che contiene
   i termini che sembrano sinonimi e non lo sono, e la regola di precedenza fra le fonti di
   definizione.

L'ordine di lettura interno all'area, per chi progetta il modello, è `01 → 03 → 02 → 04 → 05 → 06`:
prima il vocabolario, poi i soggetti, poi gli atti, poi ciò che gli atti producono. È l'ordine di
dipendenza reale, non quello di numerazione.

### 8.3 Il primo contributo sensato

Per chi **arriva dalla clinica**: leggi il capitolo sul linguaggio ubiquo e apri una segnalazione
per ogni definizione che, nella tua pratica, non funziona. Non serve proporre l'alternativa: serve
dire dove il modello sbaglia. È il contributo più prezioso e più scarso del progetto, e non
richiede una riga di codice.

Per chi **arriva dall'informatica**: prendi una macchina a stati di una prestazione e verifica che
ogni transizione ammessa abbia un'invariante scritta e ogni transizione non ammessa sia rifiutata
con un errore che dice perché. Le macchine a stati sono descritte; i rifiuti sono la parte che
manca più spesso.

### 8.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Riduce la misura a valore più istante.** Senza contesto - chi ha misurato, con quale
  strumento, in quali condizioni, con quale unità, con quale affidabilità - la misura non è
  interpretabile. E istante di misura e istante di ricezione sono **due campi distinti
  obbligatori**: le regole operano sul primo (`V-124`).
- **Tratta il ruolo come attributo della persona.** Lo stesso professionista opera in più
  organizzazioni, e i ruoli hanno validità temporale. Un ruolo-attributo perde la storia e rende
  indimostrabile chi aveva titolo di accedere quando.
- **Modifica in luogo un documento firmato.** Il documento firmato non si modifica: si rettifica,
  con catena ricostruibile. Una modifica in luogo distrugge l'integrità proprio dove serve.
- **Costruisce l'oscuramento nei consumatori.** L'oscuramento è applicato dal motore di
  autorizzazione, in un unico punto che filtra e calcola i totali sull'insieme filtrato; i sei
  canali di inferenza - numerazione, conteggi, paginazione, notifiche, differenze fra
  interrogazioni, messaggi d'errore - vanno chiusi tutti (`V-149`).
- **Crea un solo tipo di «prestazione» che copre richiesta, esecuzione e addebito.** Produce campi
  nulli, regole condizionali fragili e rendicontazione impossibile.

**Chi arriva dalla sanità.**

- **Tratta caregiver e rappresentante legale come la stessa figura.** Non lo sono, e la
  conseguenza è che un consenso viene raccolto da chi non ha titolo per prestarlo.
- **Considera la bozza di referto già un referto.** Un documento non validato acquisisce così un
  valore probatorio che non ha. La distinzione fra redazione, validazione e firma è modellata
  perché è reale.
- **Presume che una scala clinica si possa calcolare.** Il progetto **non calcola punteggi
  derivati da dati clinici** se non con tracciabilità completa del calcolo, e alcune scale sono
  escluse in via cautelativa anche per ragioni di licenza. Se hai una scala che vorresti vedere
  supportata, la prima domanda non è tecnica: è chi ne detiene i diritti.
- **Dà per scontata la codifica.** Il sistema è **pienamente funzionale senza la terminologia
  clinica onerosa** (`V-03`), e questo non è un ripiego: è un vincolo. Un contributo che renda un
  percorso principale dipendente da quella terminologia viene rifiutato.

### 8.5 Che cosa non si tocca senza discuterne prima

| Elemento | Perché è vincolato | Dove si discute |
|---|---|---|
| Cablare un percorso di cura o un catalogo di prestazioni | Ventuno cicli amministrativi indipendenti; il progetto non distribuisce alcun catalogo (`V-147`) | Area architetturale |
| Tipologia documentale del referto di televisita | Ha una tipologia propria del fascicolo; l'ipotesi alternativa è **errata** e non va usata in alcun artefatto (`V-143`) | Nessuna discussione: è una fonte in vigore |
| Aggiungere contenuto terminologico al repository | Quattro regimi di licenza distinti, verificati sul testo primario; il controllo `G3` blocca | [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), poi area di conformità |
| Confondere stringhe di interfaccia ed etichette ufficiali | Le traduzioni delle terminologie sono opere derivate assegnate ai rispettivi titolari | Area architetturale, decisione già registrata |
| Trattare l'assenza di misura come assenza di riga | L'attesa di rilevazione è un'entità (`V-148`) | Bacheca |
| Separazione fra chi gestisce gli allarmi tecnici e chi accede al contenuto clinico | È vincolo di autorizzazione, non convenzione organizzativa (`V-125`) | Area di sicurezza |

### 8.6 Come si verifica il proprio lavoro

**Prima verifica, di verità:** il modello che proponi sa distinguere i due casi che hanno effetti
opposti? Prendi la coppia più vicina al tuo contributo - non presentato contro fallimento tecnico,
bozza contro firmato, revoca di un consenso contro revoca di un altro, assenza di misura contro
misura nulla - e verifica che il modello li distingua.

**Seconda, di licenza:** il contributo introduce contenuto terminologico? Il controllo `G3` lo
intercetta, ma è meglio saperlo prima: codice e identificatore di sistema sono sempre ammessi,
descrizioni e contenuti no.

**Terza, di dati sintetici:** i dati di collaudo che accompagnano il contributo comprendono i casi
scomodi? In particolare, per l'oscuramento, **devono comprendere documenti oscurati**: altrimenti
nessuna prova esercita quel percorso (`V-149`).

---

## 9. Area sicurezza

Perimetro: [`docs/06_security/`](../06_security/00-indice.md). Codice: `telemedic/platform/security`,
`telemedic/contexts/audit`, `telemedic/contexts/outbound`.

### 9.1 Che cosa si fa qui

Quest'area **non è un elenco di misure**. Un elenco di misure è utile a chi ha già in testa il
modello che le giustifica ed è dannoso a chi non ce l'ha, perché induce a credere che applicare la
misura equivalga a ottenere la proprietà. Ogni misura arriva dopo il bene che protegge,
l'avversario da cui lo protegge e la conseguenza - **clinica**, non solo informatica - del suo
fallimento.

Tre fatti governano l'area e vanno letti prima di contribuirvi. **Non esistono dati non sensibili
accanto a dati sensibili**: il fatto stesso che una persona abbia una sessione con uno specialista
è dato relativo alla salute, prima e indipendentemente dal contenuto. **L'avversario primario non
è il criminale esterno, è chi è già dentro il perimetro con le credenziali giuste**: un'architettura
costruita sul perimetro non lo intercetta. **Il fallimento di una misura produce conseguenze
cliniche**: una sessione degradata è una visita non conclusa, un registro alterato è
l'impossibilità di accertare un accesso indebito.

Il lavoro aperto oggi: il **registro immutabile a catena di impronte con conservazione separata**,
che è lo sforzo maggiore dell'intero catalogo e va pianificato come tale, non come configurazione
(decisione `D42`); il **mediatore unico di uscita** con la sua suite di prove di abuso (`V-157`);
e gli **intervalli di indirizzi vietati** per la prova di confinamento del nodo di relay, senza i
quali la prova non è scrivibile e il vincolo resta una dichiarazione (`Q-196`).

### 9.2 Che cosa sapere prima

1. [12 - Crittografia e sicurezza](12-crittografia-e-sicurezza.md). È il prerequisito integrale:
   riservatezza e integrità e non ripudio, modelli di minaccia, cifratura simmetrica e
   asimmetrica, funzioni di hash e catene di impronte, firma, infrastruttura a chiave pubblica,
   revoca, marca temporale, autenticazione e autorizzazione, accesso d'emergenza.
2. [04 - Identità e anagrafiche](04-identita-e-anagrafiche.md), se tocchi identità, livelli di
   garanzia o federazione.
3. [13 - I protocolli](13-protocolli.md), le sezioni su autorizzazione delegata, scambio di token
   e firma dei messaggi.
4. [`docs/06_security/01-modello-di-minaccia.md`](../06_security/01-modello-di-minaccia.md),
   sempre, perché è il documento da cui ogni misura dell'area discende.
5. [08 - WebRTC da zero](08-webrtc-da-zero.md), se tocchi il piano media.

### 9.3 Il primo contributo sensato

**Scrivi una prova di abuso.** Non una prova che verifica che la funzione funzioni: una prova che
verifica che l'abuso **non** riesca. Un accesso a una risorsa di un altro tenant deve fallire; una
credenziale valida non deve poter creare permessi verso un indirizzo interno; un token privo del
claim dell'attore non deve essere accettato; un messaggio d'errore non deve rivelare l'esistenza
di un documento oscurato.

È il contributo giusto per cominciare per tre ragioni: è piccolo, è verificabile, e in
quest'area la prova negativa mancante è la forma più comune di difetto - il divieto è scritto
nella prosa e non esiste nel codice.

### 9.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Registra troppo.** Il registro immutabile e i log applicativi **non contengono contenuto
  clinico**, e i log di diagnostica non portano identificativi diretti dell'assistito (`V-150`).
  Un log verboso in questo dominio non è un aiuto alla diagnosi: è una seconda copia non protetta
  dei dati.
- **Dichiara una proprietà crittografica statica.** Il progetto **non dichiara** versioni di
  protocollo né suite negoziate: le misura per sessione e le registra (`V-156`). La negoziazione
  avviene fra due estremi che il progetto non controlla, e qualunque affermazione statica sarebbe
  falsa per una parte del parco installato.
- **Apre una connessione verso una destinazione derivata da un dato in ingresso.** Solo il
  mediatore unico ha rotta verso l'esterno; agli altri l'uscita è negata a livello di rete
  (`V-157`). È requisito architetturale proprio perché la difesa non deve dipendere dalla
  correttezza del codice.
- **Etichetta una metrica infrastrutturale con l'identificativo di sessione.** Basta questo per
  trasformare un cruscotto operativo in una fonte di dati sulla salute (`V-155`).
- **Confonde il livello di garanzia richiesto con quello asserito.** Un livello riferito da un
  integratore va marcato come tale e **non** soddisfa un obbligo di autenticazione forte (`V-154`,
  `V-165`).

**Chi arriva dalla sanità.**

- **Chiede un accesso «per emergenza» senza tracciamento.** L'accesso d'emergenza è un requisito
  funzionale con forma precisa: motivazione libera obbligatoria, finestra e perimetro limitati,
  notifica, riesame con esito registrato (`V-153`). Non è una scorciatoia, è un percorso.
- **Presume che la cifratura fino agli estremi sia sempre attiva.** Quando la registrazione è
  attiva la cifratura è terminata sul server e la sessione **non** è cifrata fino agli estremi:
  l'informativa deve dichiararlo e l'interfaccia deve segnalarlo in modo persistente e non
  occultabile.
- **Considera l'insider un caso teorico.** È la fattispecie dei provvedimenti sanzionatori in
  ambito sanitario e una tipologia autonoma di incidente significativo. Un contributo che assuma
  la buona fede dell'utente autenticato è un contributo che manca il modello di minaccia
  principale.

### 9.5 Che cosa non si tocca senza discuterne prima

Nessun **parametro crittografico** si sceglie per abitudine: la fonte sono le raccomandazioni
europee e nazionali vigenti, e ciò che non è stato letto sul testo si marca `[NV]`. Nessun
**identificativo di vulnerabilità** si cita se non è stato letto sulla fonte che lo pubblica: i
difetti si descrivono per meccanismo e versione di correzione, che è la forma utile a chi deve
decidere la versione minima da distribuire. Nessun **requisito puntuale delle misure nazionali** si
cita testualmente prima che gli allegati di dettaglio siano stati letti riga per riga: si citano i
codici, che sono pubblici e verificati (`Q-151`).

Non si toccano senza discussione: i termini di conservazione dei registri, che sono di fonte
settoriale (`V-152`); la struttura del registro immutabile; la difesa primaria del nodo di relay,
che è l'isolamento di rete in uscita e non la lista di indirizzi vietati (`V-10`); la separazione
fra chi gestisce gli allarmi tecnici e chi accede al contenuto clinico (`V-125`).

Dove si discute: bacheca, e - per le vulnerabilità - **mai in una segnalazione pubblica**. La
procedura riservata è in
[`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md).

### 9.6 Come si verifica il proprio lavoro

Il controllo `G1` sui segreti verifica **la cronologia**, non solo lo stato corrente: un segreto
rimosso con una modifica successiva resta nella cronologia di un repository pubblico ed è lì che
viene trovato, in pochi minuti dalla pubblicazione. La conseguenza operativa è che il rilevamento
non basta: serve la **rotazione**.

Oltre ai controlli obbligatori, quest'area richiede: esecuzione della **suite di prove di abuso**
contro il mediatore di uscita, se hai toccato un percorso che comunica verso l'esterno; verifica
che nessun campo descrittivo di errore contenga contenuto clinico o identificativi diretti;
verifica che ogni esempio usi segnaposto espliciti e nessun valore utilizzabile.

---

## 10. Area integrazione

Perimetro: [`docs/07_integration/`](../07_integration/00-indice.md). Codice:
`telemedic/interfaces/webhooks`, `web/embeddable`, i moduli sostituibili.

### 10.1 Che cosa si fa qui

È **l'area su cui si gioca l'adozione del progetto**, ed è scritta per un lettore preciso: uno
sviluppatore che non ha mai visto il codice di Telemedic e non ha intenzione di vederlo, e che
deve far parlare il proprio sistema con questo in un tempo definito, senza sorprese a valle.

Ne discende la caratteristica che distingue il contributo utile da quello inutile: **qui la
qualità si misura in tempo risparmiato a un estraneo.** Un esempio che non si compila è peggio di
nessun esempio. Un passo del primo avvio che presuppone una conoscenza non dichiarata costa a ogni
integratore la stessa mezza giornata.

Il lavoro aperto: la **suite di prove di integrazione che esercita almeno due tenant e due
integratori distinti**, con configurazioni deliberatamente divergenti - una prova che passa con un
solo integratore configurato non dimostra la proprietà multi-integratore (`V-188`); e il
**contratto minimo del gateway di misure di terze parti**, di cui due elementi richiesti dal
modello di sicurezza non è verificato che i gateway di mercato espongano (`Q-122`).

### 10.2 Che cosa sapere prima

1. [14 - I flussi funzionali](14-flussi-funzionali.md), che descrive i percorsi end-to-end e
   quindi il punto in cui l'integrazione si innesta.
2. [02 - Le prestazioni di telemedicina](02-prestazioni-di-telemedicina.md) e
   [04 - Identità e anagrafiche](04-identita-e-anagrafiche.md): il primo perché la distinzione fra
   i tipi di prestazione cambia il modello dati, il secondo perché la riconciliazione delle
   anagrafiche è il punto in cui la maggior parte delle integrazioni si complica.
3. [13 - I protocolli](13-protocolli.md), le sezioni su autorizzazione, scambio di token, buste
   degli eventi e firma dei messaggi.
4. [`docs/07_integration/09-obblighi-di-chi-integra.md`](../07_integration/09-obblighi-di-chi-integra.md),
   **prima di ogni altra cosa dell'area**, perché contiene la ripartizione delle responsabilità e
   il fatto che chi integra e mette in servizio assume obblighi propri.

Se il tuo contributo riguarda il componente incorporabile, aggiungi
[`docs/07_integration/05-componente-incorporabile.md`](../07_integration/05-componente-incorporabile.md)
e in particolare i limiti invalicabili alla personalizzazione.

### 10.3 Il primo contributo sensato

**Esegui il primo avvio dell'integratore da zero, cronometrandoti, e annota ogni punto in cui ti
sei fermato.** Poi apri una segnalazione per ciascuno. Le tre informazioni più utili, in ordine:
l'esempio che non funziona; il punto in cui ti sei bloccato e per quanto tempo; **la cosa che
avevi assunto e che si è rivelata falsa**. La terza è la più preziosa, perché indica dove la
documentazione dice qualcosa di ambiguo invece di qualcosa di sbagliato - che è più difficile da
trovare.

Se preferisci un contributo di codice: **aggiungi un esempio eseguibile e verificato in
integrazione continua** per un percorso che oggi è descritto solo in prosa. Gli esempi
dell'area sono verificati automaticamente proprio perché un esempio che marcisce è un difetto che
si scopre solo quando qualcuno ci perde una giornata.

### 10.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Prova a passare l'identità dal browser.** La consegna dell'identità avviene fra back-end. È
  il 70 % del costo di un'integrazione tipica e non si aggira: aggirarla produce un percorso che
  funziona in dimostrazione e non è difendibile.
- **Chiede il contenuto clinico dentro la notifica.** Non c'è, e non ci sarà: la notifica dice che
  è successo qualcosa e dove trovarlo (`V-161`). Non è una limitazione da negoziare, è una regola
  di progetto senza eccezioni.
- **Tratta il pagatore come un consultatore.** Un fondo, una mutua o una polizza che paga la
  prestazione ottiene l'**esito amministrativo**, non il contenuto clinico, e nessun percorso -
  diretto o mediato da un professionista - può costituire un accesso al fascicolo (`V-08`,
  `V-166`). È un equivoco che si commette in buona fede, perché il pagatore è un soggetto
  legittimo del percorso.
- **Presenta come standard un nome di intestazione che è una scelta di progetto.** L'area marca
  esplicitamente ciò che è proposta di progetto, e la regola vale anche per la documentazione
  interna dell'integratore.
- **Degrada l'accessibilità con il tema.** Indicatore di registrazione, avvisi e testi di
  consenso, esito della verifica delle chiavi, messaggi di errore clinico e indicatore dello stato
  di cifratura **non sono tematizzabili né occultabili**; una configurazione che degrada il
  contrasto viene **rifiutata al salvataggio**, non segnalata come avviso (`V-163`).

**Chi arriva dalla sanità.**

- **Presume che l'integrazione sia una configurazione.** Nelle modalità che coinvolgono identità
  federata e restituzione del contenuto clinico c'è sviluppo, custodia di chiavi private e un
  impegno di manutenzione nel tempo. Presentarlo come «attivazione» produce aspettative che poi
  qualcuno deve smentire.
- **Confonde ciò che il progetto è con ciò che il progetto sarà.** Finché non esiste una
  marcatura, il software **non è utilizzabile per l'erogazione di prestazioni sanitarie su
  pazienti reali**. Ogni artefatto lo dichiara, e nessun documento di integrazione può attenuarlo.
- **Presume che il progetto sia accreditato presso la federazione delle identità.** Non lo è e non
  può esserlo: il fornitore di servizi verso la federazione è **chi installa** (`V-05`).

### 10.5 Che cosa non si tocca senza discuterne prima

Il perimetro del contratto pubblico (`V-160`) e le sue regole di dismissione: ampliarlo o
restringerlo richiede una dichiarazione in bacheca, perché ha effetti su soggetti esterni. Il
limite invalicabile alla personalizzazione del componente incorporabile (`V-163`). L'insieme
chiuso e versionato delle proprietà di tema. Il registro di fiducia verso gli integratori, che è
unico e condiviso fra federazione, origini ammesse per l'incorporamento e destinazioni ammesse per
le notifiche: tre registri separati divergono sempre.

E il corollario che vale per tutte le aree: **una capacità nuova non è completa finché non è
raggiungibile da un sistema terzo tramite interfaccia documentata e versionata** (`V-164`). L'area
che introduce la capacità introduce anche il contratto: non è lavoro rinviabile qui.

### 10.6 Come si verifica il proprio lavoro

**Gli esempi si eseguono**, non si rileggono. Se hai aggiunto o modificato un esempio, deve
passare la verifica automatica; se non è verificabile automaticamente, va detto nell'esempio
stesso.

**La prova di integrazione esercita due tenant e due integratori** con configurazioni divergenti:
domini di attribuzione degli identificatori diversi, profili di uscita diversi, modalità di
recapito diverse, insiemi di moduli sostituiti diversi (`V-188`).

**Il controllo `G6`** verifica che una modifica non additiva a un elemento del perimetro
contrattuale sia dichiarata. Se scatta, la risposta non è aggirarlo: è rendere la modifica additiva
o dichiarare la nuova versione maggiore.

---

## 11. Area conformità {#11-area-conformita}

Perimetro: [`docs/08_compliance/`](../08_compliance/00-indice.md).

### 11.1 Che cosa si fa qui

Quest'area **non dichiara una conformità: la attribuisce.** Non esiste in questa documentazione
una frase che affermi che il progetto è conforme a qualcosa, e l'assenza è deliberata. Un software
non è conforme: **un soggetto lo è**, rispetto a un obbligo che grava su di lui, in un momento
determinato. Ogni capitolo risponde a tre domande e a nessun'altra: *quale fonte, su chi grava, da
quando.*

Il presupposto che governa tutto: il progetto pubblica codice sorgente; chi lo prende, lo integra,
lo distribuisce o lo mette in servizio eroga prestazioni sanitarie. Sono due posizioni giuridiche
diverse, e quasi tutte le fonti dell'area si rivolgono alla seconda. **Il progetto non è
fabbricante e non appone la marcatura CE**; produce il materiale regolatorio come pacchetto per
il soggetto fabbricante, da costituire, e si ferma dove comincia un atto che presuppone un soggetto
giuridico e una firma.

Il lavoro aperto è quasi tutto **verifica di fonti**: l'area ha un numero non trascurabile di voci
marcate come non verificate, ciascuna con l'indicazione di che cosa va controllato. Chiuderne una,
con la citazione esatta letta sul testo primario, è un contributo di valore alto e barriera
d'ingresso bassa.

### 11.2 Che cosa sapere prima

1. [15 - Il quadro regolatorio da zero](15-regolatorio-da-zero.md) per intero. Spiega che cos'è un
   dispositivo medico, una destinazione d'uso, una classe di rischio, un organismo notificato, una
   norma armonizzata, e perché questo repository non è un fabbricante. Chi salta questo modulo
   trova l'area compatta fino all'incomprensibilità, e non è un difetto dell'area.
2. [10 - Percorsi di cura e sicurezza del paziente](10-percorsi-di-cura-e-sicurezza.md), per
   pericolo, situazione pericolosa, errore d'uso e rischio residuo.
3. [20 - Fonti primarie](20-fonti-primarie.md), che dice dove si reperisce ciascun testo e come si
   verifica che sia ancora vigente.
4. [`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md)
   §6, se contribuisci al codice: contiene le richieste ragionevoli che sposterebbero la
   qualificazione, e quindi il motivo per cui una proposta ben fatta può essere rifiutata.

Per un contributore che non intende specializzarsi in quest'area, servono **tre pezzi soltanto**:
l'elenco delle funzioni che spostano la qualificazione; le regole su tracciabilità e componenti di
terze parti; la tabella delle formule vietate.

### 11.3 Il primo contributo sensato

**Chiudi una voce non verificata.** Prendi una marcatura `[NV]`, reperisci il testo primario,
verifica la citazione - numero dell'articolo, comma, allegato, sezione, data di pubblicazione - e
proponi la correzione **con l'indicazione della fonte consultata e della data di consultazione**.
Se la verifica smentisce ciò che è scritto, tanto meglio: è esattamente il caso per cui la
marcatura esiste.

Attenzione a una regola dell'area: **le fonti si citano, non si ricordano.** Un riferimento
normativo proviene dal testo o è marcato non verificato. Non esiste una terza possibilità, e la
memoria di chi scrive non è una fonte. Una citazione plausibile ma sbagliata in un documento
regolatorio è il difetto più dannoso che questa documentazione possa contenere, perché si propaga
e nessuno la ricontrolla.

### 11.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Scrive «conforme a» un regolamento.** La conformità è di un titolare o di un soggetto
  obbligato, non di un software. Un prodotto **abilita**: fornisce capacità tecniche ed evidenze
  documentali.
- **Confonde un sistema di gestione della qualità implementato con uno certificato.** Sono cose
  diverse e la differenza è la ragione per cui una delle formule è vietata.
- **Presume che la licenza sposti gli obblighi.** Nessuna clausola di esclusione di garanzia
  sposta sul ricevente la responsabilità di un regolamento, e l'esclusione contrattuale non opera
  verso il danneggiato. Chi integra in un prodotto commerciale è fabbricante per legge,
  indipendentemente da quanto scritto nella licenza.
- **Aggiunge una dipendenza senza scheda e senza versione esatta.** È un elemento di
  configurazione non identificato, e le etichette di versione mobili sono vietate perché rendono
  falsa la distinta dei materiali del rilascio precedente (`V-173`).

**Chi arriva dalla sanità.**

- **Presume che il documento pubblicato sia un documento controllato.** Non lo è: nessun capitolo
  di `docs/` è una procedura del sistema di gestione della qualità né un documento del fascicolo
  tecnico. I capitoli sono **ingressi**, contengono l'analisi da cui un documento controllato si
  scrive (`V-174`). È il punto di giunzione dell'intero modello.
- **Cerca in quest'area una consulenza.** Non è consulenza legale né regolatoria: la
  qualificazione di un soggetto e di un prodotto dipende da elementi di fatto da accertare caso
  per caso da un professionista abilitato.
- **Presume che una data pubblicata sia un impegno.** Le date stanno solo nel capitolo dedicato, e
  nessun documento del progetto dichiara una data per un traguardo che non è del progetto
  (`V-180`).

### 11.5 Che cosa non si tocca senza discuterne prima

La **destinazione d'uso** è il documento più costoso da sbagliare: una singola formulazione sposta
la classe di rischio e la classe di sicurezza del software insieme, e la differenza vale mesi e un
ordine di grandezza di costo. Non si modifica in una proposta ordinaria.

Non si toccano senza discussione: lo spazio riservato degli identificativi dei documenti
regolatori (`V-172`); la tabella delle formule vietate; il perimetro delle funzioni escluse per
politica regolatoria (`V-170`); e qualunque affermazione sullo stato di armonizzazione di una
norma, che va verificato **alla data d'uso** e non una volta per sempre.

Dove si discute: bacheca verso l'area di conformità, e per le decisioni che richiedono una scelta
imprenditoriale - monetizzazione, costituzione di un soggetto giuridico, periodo di supporto
dichiarato - la questione si porta alla persona, non si decide d'ufficio.

### 11.6 Come si verifica il proprio lavoro

Tre domande, tutte a risposta binaria.

**La citazione è stata letta sul testo primario?** Se no, va marcata come non verificata, con
l'indicazione di che cosa manca e a chi va chiesto.

**La fonte è ancora vigente alla data in cui stai scrivendo?** Il metodo di verifica è in
[20 §11](20-fonti-primarie.md). Una norma abrogata citata come vigente è un errore che si propaga
in tutta la documentazione.

**Il testo che hai scritto contiene una delle formule vietate?** La tabella è la lista di
controllo, e la verifica non è documentale ma di processo: una modifica a un testo pubblico non
passa dalla revisione del codice e non fa fallire alcun controllo automatico. È l'unico presidio
dell'area che nessuna verifica automatica intercetta (`Q-174`).

---

## 12. Guida dei fondamenti

Perimetro: [`docs/10_fondamenti/`](00-come-usare-questa-guida.md) - questa guida.

### 12.1 Che cosa si fa qui

La guida è una **guida formativa che parte da zero**, destinata a chiunque voglia contribuire, e
copre l'intero contesto medico-sanitario del progetto, tutti i protocolli applicati e la
conoscenza tecnico-informatica e clinico-organizzativa necessaria prima di scrivere una riga di
codice. È prerequisito dichiarato di
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md).

Le regole redazionali sono cinque e sono in
[00 - Come usare questa guida](00-come-usare-questa-guida.md): ogni sigla sciolta alla prima
occorrenza, ogni concetto sanitario spiegato a un informatico e ogni concetto informatico a un
clinico, ogni affermazione normativa con la fonte, ciò che non è verificato dichiarato tale,
nessun dato reale.

Il lavoro aperto: **completare i moduli mancanti**; **verificare che ciascun modulo regga la
prova del lettore che parte da zero**; e - il fronte più grande in assoluto - la **traduzione
inglese integrale**, che per decisione esplicita non è una sintesi e che ha come rischio reale non
la traduzione mancante ma **la divergenza fra le due versioni**.

### 12.2 Che cosa sapere prima

Meno di quanto si pensi, e in un ordine diverso dal solito.

1. [00 - Come usare questa guida](00-come-usare-questa-guida.md), per le regole redazionali e i
   percorsi di lettura per profilo.
2. Il modulo che intendi toccare, **per intero**, prima di modificarne un paragrafo. I moduli di
   questa guida sono costruiti come percorsi: una modifica locale che ignora il percorso rompe
   l'ordine di introduzione dei concetti.
3. I moduli che vi rinviano. Un concetto spostato o rinominato qui si ripercuote sulle aree, che
   citano questa guida invece di riscriverla.
4. [19 - Glossario](19-glossario.md), se introduci un termine nuovo: la guida ha un glossario
   esaustivo bilingue con rinvii incrociati, e un termine introdotto senza voce di glossario è un
   termine che qualcuno cercherà invano.

### 12.3 Il primo contributo sensato

**Leggi un modulo con gli occhi di chi non sa e segna ogni punto in cui ti sei fermato.** Poi apri
una segnalazione per ciascuno, con la citazione del punto esatto. Non serve saper riscrivere il
paragrafo: serve dire dove il testo presuppone qualcosa che non ha spiegato. La regola numero due
della guida lo dice esplicitamente: se una spiegazione presuppone l'altro mondo, **è un difetto**.

È il contributo con il rapporto valore/competenza più alto dell'intero progetto, ed è aperto a
chiunque: un clinico che non capisce un paragrafo tecnico e uno sviluppatore che non capisce un
paragrafo clinico stanno facendo, entrambi, esattamente il lavoro che serve.

### 12.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Riassume invece di spiegare.** Un modulo che parte da zero è lungo per costruzione. La
  compressione che sembra eleganza è, per il lettore destinatario, una barriera.
- **Duplica il contenuto di un'area.** La guida spiega, le aree decidono. Se un modulo comincia a
  fissare versioni, vincoli o limiti, sta invadendo un'area e va riportato al rinvio. La regola
  simmetrica vale per le aree: se un capitolo d'area comincia a spiegare la teoria, sta duplicando
  la guida.
- **Usa una sigla senza scioglierla.** Nessuna eccezione, nemmeno per le più note: chi arriva da
  un altro paese non sa che cosa sia un'azienda sanitaria locale italiana.

**Chi arriva dalla sanità.**

- **Dà per scontato ciò che è ovvio in corsia.** Che un referto vada firmato, che un consenso si
  raccolga prima e non dopo, che una misura fuori contesto non significhi nulla: sono ovvietà
  professionali che il lettore informatico non possiede.
- **Corregge il contenuto clinico senza aggiornare i rinvii.** Un concetto clinico corretto qui
  può avere conseguenze sul modello di dominio, che vi rinvia. Segnalarlo è parte della
  correzione.
- **Scrive una definizione senza la fonte.** Le sintesi senza fonte invecchiano male e non sono
  verificabili: la regola numero tre non ammette deroghe per le definizioni cliniche.

### 12.5 Che cosa non si tocca senza discuterne prima

La **struttura dei moduli e la loro numerazione**: i moduli sono citati per numero da tutte le aree
e da entrambe le lingue, e una rinumerazione rompe un numero elevato di rinvii. La **collocazione
di un concetto**: spostare una spiegazione da un modulo all'altro è una modifica strutturale, non
redazionale. La **posizione della guida come prerequisito** di `CONTRIBUTING.md`.

E una regola che vale per ogni modifica: **una proposta che tocca il contenuto italiano non è
completa finché non aggiorna l'inglese** (`G8`). Vale anche per una correzione di una riga.

### 12.6 Come si verifica il proprio lavoro

**Prova del lettore che parte da zero:** dai il modulo modificato a qualcuno che non conosce
l'argomento e chiedigli dove si è fermato. È l'unica verifica che conta, e non è automatizzabile.

**Controllo `G9` sui riferimenti interni:** un collegamento rotto in una guida formativa è un
lettore perso. Il controllo è bloccante prima del primo deploy del sito.

**Controllo `G8` sulla divergenza linguistica**, e **controlli `G10` e `G11`** su dati sintetici e
riservatezza, che nella prosa scattano più spesso che nel codice, perché è nella prosa che si è
tentati di fare un esempio realistico.

---

## 13. Sito di documentazione

Perimetro: la configurazione del generatore, il tema, la navigazione, la ricerca,
l'internazionalizzazione e la pubblicazione.

### 13.1 Che cosa si fa qui

La sequenza di lavoro approvata è netta: si completa **tutta** la documentazione, poi si
costruisce il sito con internazionalizzazione, lo si pubblica e se ne **verifica il funzionamento
reale** - navigazione, ricerca, cambio lingua, collegamenti interni, costruzione riproducibile.
**Nessuna area si considera chiusa finché non è navigabile online nelle due lingue** (`V-183`).

Ne discende che il lavoro sul sito non è cosmesi finale: è la condizione di chiusura di tutto il
resto. E ne discende un fatto operativo che vale la pena dire subito: **i collegamenti interni
verso moduli non ancora scritti sono ammessi durante la stesura ma sono bloccanti prima del primo
deploy.** Chi lavora sul sito lavora quindi anche su un elenco di collegamenti da chiudere che non
è suo, e che va restituito alle aree competenti invece di essere risolto con una rimozione.

Il lavoro aperto: la configurazione del generatore non esiste ancora; l'internazionalizzazione va
impostata con struttura dei file speculare; serve un controllo automatico che segnali i documenti
italiani modificati senza il corrispondente inglese; e servono le verifiche di raggiungibilità dei
rinvii **fuori** dalla cartella della documentazione, che oggi sono scritti come indirizzi
assoluti verso il repository proprio perché la duplicazione dentro la documentazione è esclusa.

### 13.2 Che cosa sapere prima

1. [00 - Come usare questa guida](00-come-usare-questa-guida.md) e gli indici delle nove aree, per
   capire la struttura che il sito deve rendere navigabile. Non è un dettaglio: la struttura non
   la decide chi costruisce il sito.
2. [17 §9 - I controlli che devono passare](17-ambiente-di-sviluppo.md), perché `G8` e `G9` sono i
   due controlli che il sito rende esigibili.
3. Le convenzioni di scrittura del progetto: frontmatter con titolo, posizione e descrizione;
   diagrammi in un linguaggio testuale versionabile; blocchi di codice con linguaggio dichiarato;
   collegamenti relativi verso i documenti interni e **assoluti** verso i file alla radice del
   repository.

### 13.3 Il primo contributo sensato

**Aggiungi o correggi il frontmatter di un documento che ne è privo o che lo ha incompleto**, e
verifica che la costruzione non fallisca. C'è una trappola documentata che vale la pena conoscere
prima di incontrarla: **un valore di frontmatter che contiene due punti seguiti da spazio va
racchiuso fra virgolette doppie**, altrimenti la costruzione fallisce con un errore che rimanda a
una riga non ovvia.

Contributo di pari dimensione e valore superiore: **il rapporto dei collegamenti interni rotti**,
prodotto automaticamente e ordinato per area di destinazione. Non risolverli: elencarli e
consegnarli. È l'informazione che serve alle aree per chiudere, ed è bloccante.

### 13.4 Errori tipici di chi arriva da un altro dominio

**Chi arriva dall'informatica gestionale.**

- **Risolve un collegamento rotto rimuovendolo.** Un rinvio verso un modulo non ancora scritto è
  un debito dichiarato, non un errore di battitura: rimuoverlo cancella l'informazione che quel
  rinvio serviva.
- **Duplica un file della radice dentro la documentazione per far funzionare un collegamento.**
  È esplicitamente escluso: due copie di un documento che dichiara destinazione d'uso e limiti
  d'uso sono due documenti che divergeranno, e in questo contesto la divergenza documentale è un
  difetto regolatorio, non un fastidio di manutenzione. La forma corretta è l'indirizzo assoluto
  verso il repository, con verifica di raggiungibilità.
- **Traduce liberamente.** La traduzione non è un adattamento: i riferimenti normativi italiani
  restano citati nella forma originale, con la spiegazione in lingua. Tradurre il titolo di un
  decreto lo rende irreperibile.
- **Costruisce il sito da una versione mobile di uno strumento.** La costruzione deve essere
  riproducibile: nessuna etichetta di versione mobile, nemmeno sugli strumenti della catena
  (`V-173`).

**Chi arriva dalla sanità.**

- **Presume che il sito sia la documentazione.** Il sito è una pubblicazione leggibile degli
  stessi contenuti; non è un manuale d'uso di un dispositivo medico, e non può esserlo. La
  distinzione è dichiarata nella politica di distribuzione.
- **Chiede una pagina di presentazione che «faccia capire il valore».** Ogni testo pubblico è
  materiale da cui si ricava giuridicamente la destinazione d'uso: passa dalla revisione
  regolatoria, con la tabella delle formule vietate come lista di controllo.

### 13.5 Che cosa non si tocca senza discuterne prima

L'**ordine delle sezioni nella barra di navigazione**, che riflette una decisione sulla struttura
della documentazione e non una preferenza estetica. La **posizione della guida dei fondamenti**,
che sta immediatamente dopo la panoramica per decisione esplicita. La **strategia di
internazionalizzazione**, che deve mantenere la struttura dei file speculare. La **politica di
pubblicazione**, che ha una destinazione primaria e un mirror.

### 13.6 Come si verifica il proprio lavoro

Il criterio è comportamentale, non dichiarativo: **la costruzione riesce; la navigazione funziona;
la ricerca trova; il cambio lingua non porta a una pagina inesistente; nessun collegamento interno
è rotto; la costruzione è riproducibile a partire dallo stesso stato del repository.** Sei
condizioni binarie. Cinque su sei significa non pronto.

---

## 14. I contributi che non sono codice

Questa sezione non è un'appendice di cortesia. In questo progetto i contributi che seguono
**valgono quanto il codice e sono più scarsi**, per una ragione strutturale: richiedono competenze
che la popolazione degli sviluppatori open source in media non ha, e che la popolazione che le ha
in media non sa di poter conferire.

### 14.1 Revisione clinica

**Che cos'è.** Un professionista sanitario legge un modulo, un capitolo di dominio o un flusso
funzionale e dice dove il modello tradisce la realtà: una definizione che nella pratica non
funziona, una distinzione che il testo non fa e che in corsia è essenziale, un caso frequente che
il flusso non contempla, un esito che ha un effetto amministrativo diverso da quello scritto.

**Perché vale tanto.** Nessuno sviluppatore può farlo. Le fonti normative definiscono le
prestazioni ma non descrivono che cosa accade davvero in un ambulatorio, e la distanza fra le due
cose è il posto in cui i sistemi sanitari falliscono silenziosamente.

**Come si fa in concreto.** I moduli su cui la revisione clinica è più utile sono
[02](02-prestazioni-di-telemedicina.md), [03](03-il-dato-clinico.md),
[09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md) e
[14](14-flussi-funzionali.md), e i capitoli di dominio su prestazioni, documenti, parametri e
consenso. La forma del contributo è una segnalazione per punto, con la citazione esatta e la
descrizione di che cosa accade nella pratica. **Non serve proporre la soluzione.**

**Che cosa non serve.** Non serve conoscere il codice, non serve installare nulla, non serve
sapere che cos'è una pull request: la segnalazione basta.

### 14.2 Verifica delle fonti normative

**Che cos'è.** Prendere una citazione - un decreto, un articolo, un allegato, una norma tecnica,
una specifica - reperire il testo primario, e verificare che il riferimento sia esatto e che la
fonte sia ancora vigente.

**Perché vale tanto.** Una citazione sbagliata in un documento regolatorio si propaga: viene
copiata in un altro capitolo, poi in una risposta a un capitolato, poi in un documento che qualcuno
firma. E nessuno la ricontrolla, perché sembra precisa. Le voci marcate come non verificate
esistono proprio per rendere visibile ciò che non è stato controllato, ma la marcatura non è la
verifica.

**Come si fa in concreto.** Cerca le marcature `[NV]` nell'area che ti interessa, scegline una,
reperisci il testo, e proponi la correzione con **la fonte consultata e la data di
consultazione**. Se la verifica conferma, va detto: una voce verificata che perde la marcatura è
un contributo, non un non-evento. Il metodo di verifica della vigenza è in
[20 §11](20-fonti-primarie.md).

**Che cosa non serve.** Non serve essere giuristi. Serve saper leggere un testo normativo e
resistere alla tentazione di completare per inferenza ciò che il testo non dice.

### 14.3 Traduzione

**Che cos'è.** La versione inglese integrale di ogni modulo e di ogni area. Non una sintesi: il
testo completo, con struttura dei file speculare.

**Perché vale tanto.** È l'obbligo di dimensione maggiore dell'intero corpo documentale, e il suo
rischio reale non è la traduzione mancante: è **la divergenza fra le due versioni**. Due documenti
che dicono cose diverse sullo stesso obbligo, in un contesto di dispositivo medico, sono un difetto
documentale.

**Come si fa in concreto.** Si traduce un documento per volta, integralmente, mantenendo i
riferimenti normativi italiani nella forma originale con la spiegazione in inglese. Il glossario
bilingue è il riferimento per la resa dei termini: se un termine manca, si aggiunge lì prima di
usarlo. Il controllo `G8` verifica che una modifica italiana abbia il corrispondente inglese, ma
non verifica che la traduzione sia buona: quello lo fa la revisione.

**Che cosa non serve.** Non serve essere traduttori professionisti. Serve conoscere il dominio
abbastanza da non tradurre un termine tecnico con un sinonimo apparente.

### 14.4 Prove di accessibilità con tecnologie assistive reali

**Che cos'è.** Usare il sistema - o, oggi, i suoi prototipi e la sua documentazione - con un
lettore di schermo, con la sola tastiera, con ingrandimento elevato, con contrasto elevato, con
preferenza di movimento ridotto, su un apparecchio modesto e in rete limitata.

**Perché vale tanto.** La verifica automatizzata intercetta **una minoranza** dei difetti di
accessibilità. Il resto si trova solo usando, e chi usa quotidianamente una tecnologia assistiva
trova in dieci minuti difetti che una verifica automatica non troverà mai. Gli utenti
rappresentativi di questo sistema comprendono persone anziane e persone con disabilità: non sono
un caso limite, sono la popolazione di riferimento.

**Come si fa in concreto.** Si esegue un percorso completo - non una schermata - e si annota dove
ci si perde, che cosa non viene annunciato, quale ordine di attraversamento è illogico, quale
informazione è veicolata dal solo colore, quale messaggio non è comprensibile. La forma del
contributo è una segnalazione per percorso, con il nome della tecnologia usata e la sua versione.

**Un punto specifico su cui il progetto ha bisogno di verifica reale.** La verifica delle chiavi
di sessione è un codice breve che i due interlocutori si confrontano a voce. Deve essere leggibile
da un lettore di schermo, non veicolata dal solo colore, e comprensibile a una persona anziana o
poco alfabetizzata digitalmente. È al tempo stesso una misura di sicurezza e un controllo di
rischio: se non è usabile, non è una misura.

### 14.5 Segnalazione di ambiguità nella documentazione

**Che cos'è.** Riportare i punti in cui la documentazione **non è sbagliata ma è ambigua**: dove si
può capire in due modi, dove un presupposto non è dichiarato, dove un termine è usato con due
significati, dove un esempio suggerisce una regola che il testo non enuncia.

**Perché vale tanto, e più di quanto sembri.** Un errore si trova: qualcuno lo verifica e lo
corregge. Un'ambiguità no: ciascuno la risolve a modo proprio, in silenzio, e il difetto emerge
mesi dopo come divergenza fra due implementazioni che si credevano concordi. La formulazione
proposta dall'area di integrazione è la più utile in assoluto: **«la cosa che avevo assunto e che
si è rivelata falsa»**.

**Come si fa in concreto.** Segnalazione con: il punto esatto, le due letture possibili, e quale
delle due avevi adottato. Se hai perso tempo per l'ambiguità, dire **quanto** aiuta a stabilire la
priorità.

### 14.6 Perché queste cinque cose sono scarse, e che cosa ne consegue

Sono scarse tutte e cinque, ma **per due ragioni diverse**, e conviene distinguerle perché si
correggono in modi diversi. I punti 14.1, 14.2 e 14.4 richiedono competenze che il modello mentale
del contributo open source non associa a un progetto software: chi le possiede - il professionista
sanitario, chi sa reperire un testo normativo alla fonte, chi usa quotidianamente una tecnologia
assistiva - spesso non si considera un potenziale contributore. È un fraintendimento, e questo
modulo esiste anche per dissolverlo. I punti 14.3 e 14.5 sono scarsi per la ragione opposta:
**non** richiedono competenze rare, e il testo dei due paragrafi lo dice esso stesso; sono scarsi
perché sono lavoro di volume e di pazienza il cui risultato è invisibile quando è fatto bene, e
nessuno lo propone spontaneamente perché non somiglia a un contributo.

Ne consegue una regola pratica per chi rivede: **una segnalazione ben fatta di uno dei cinque tipi
va trattata con la stessa serietà di una proposta di codice**, con un esito registrato e una
risposta motivata anche quando l'esito è il rifiuto. Un contributore che segnala un'ambiguità e
non riceve risposta non segnala una seconda volta, e con lui si perde l'unica fonte di quel tipo
di informazione.

---

## 15. Matrice: area del codice → conoscenze richieste

La matrice è la forma compatta di tutto ciò che precede, e risponde alla domanda «sto per toccare
questo pezzo di codice: che cosa devo aver letto?». La colonna **obbligatorio** contiene ciò senza
cui la revisione non può concludersi positivamente; la colonna **necessario se** contiene i moduli
che diventano obbligatori a una condizione.

| Zona del codice | Obbligatorio | Necessario se… |
|---|---|---|
| `platform/tenancy` | [11](11-fondamenti-informatici.md) | tocchi le migrazioni → area tecnica cap. 3 |
| `platform/security` | [12](12-crittografia-e-sicurezza.md), [13](13-protocolli.md) | tocchi identità nazionale → [04](04-identita-e-anagrafiche.md) |
| `platform/outbox` | [11](11-fondamenti-informatici.md) | tocchi le buste → [13](13-protocolli.md) |
| `platform/problem` | [13](13-protocolli.md) | esponi errori sul piano clinico → [06](06-fhir-da-zero.md) |
| `platform/observability` | [12](12-crittografia-e-sicurezza.md), [03](03-il-dato-clinico.md) | - |
| `contexts/terminology` | [05 §8](05-standard-di-interoperabilita.md) | tocchi la licenza → [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) |
| `contexts/identity` | [04](04-identita-e-anagrafiche.md), [12](12-crittografia-e-sicurezza.md) | tocchi la federazione → [13](13-protocolli.md) |
| `contexts/registry` | [04](04-identita-e-anagrafiche.md), [03](03-il-dato-clinico.md) | - |
| `contexts/scheduling` | [02](02-prestazioni-di-telemedicina.md), [14](14-flussi-funzionali.md) | - |
| `contexts/encounter` | [02](02-prestazioni-di-telemedicina.md), [03](03-il-dato-clinico.md), [09](09-fondamenti-clinici.md) | tocchi il referto → [06](06-fhir-da-zero.md), [07](07-fse-e-infrastrutture-nazionali.md) |
| `contexts/media-session` | [08](08-webrtc-da-zero.md) integrale | tocchi la cifratura → [12](12-crittografia-e-sicurezza.md) |
| `contexts/clinical-document` | [03](03-il-dato-clinico.md), [06](06-fhir-da-zero.md), [07](07-fse-e-infrastrutture-nazionali.md) | tocchi la firma → [12](12-crittografia-e-sicurezza.md) |
| `contexts/monitoring` | [09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md) | **sempre**: è l'area a rischio clinico più alto |
| `contexts/alerting` | [10](10-percorsi-di-cura-e-sicurezza.md) integrale | tocchi l'escalation → [14](14-flussi-funzionali.md) |
| `contexts/consent` | [03](03-il-dato-clinico.md), [02](02-prestazioni-di-telemedicina.md) | tocchi l'oscuramento → [07](07-fse-e-infrastrutture-nazionali.md) |
| `contexts/outbound` | [13](13-protocolli.md), [12](12-crittografia-e-sicurezza.md) | - |
| `contexts/audit` | [12](12-crittografia-e-sicurezza.md), [03](03-il-dato-clinico.md) | - |
| `contexts/tenant-admin` | [11](11-fondamenti-informatici.md) | tocchi la copertura oraria → [10](10-percorsi-di-cura-e-sicurezza.md) |
| `interfaces/rest-api` | [13](13-protocolli.md) | - |
| `interfaces/fhir-facade` | [06](06-fhir-da-zero.md) integrale, [05](05-standard-di-interoperabilita.md) | tocchi i documenti → [07](07-fse-e-infrastrutture-nazionali.md) |
| `interfaces/signaling` | [08](08-webrtc-da-zero.md) integrale, [13](13-protocolli.md) | - |
| `interfaces/webhooks` | [13](13-protocolli.md) | - |
| `web/core`, `web/design-system` | [11](11-fondamenti-informatici.md) | **sempre** i criteri di accessibilità dell'area funzionale |
| `web/features` (consulto) | [08](08-webrtc-da-zero.md), [02](02-prestazioni-di-telemedicina.md) | - |
| `web/features` (consenso, refertazione) | [03](03-il-dato-clinico.md), [09](09-fondamenti-clinici.md) | - |
| `web/features` (monitoraggio) | [09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md) | - |
| `web/embeddable` | [13](13-protocolli.md), area integrazione cap. 5 | - |
| Catena di costruzione e controlli | [17 §9](17-ambiente-di-sviluppo.md), [15](15-regolatorio-da-zero.md) §sulla configurazione | - |

Quattro righe meritano di essere lette come avvertenze e non come voci di tabella. `contexts/monitoring`
e `contexts/alerting` sono le zone in cui un difetto produce un danno clinico diretto, ed è la
ragione per cui i moduli clinici vi sono obbligatori senza condizioni. `contexts/media-session`
richiede il modulo sul tempo reale **integrale** e non a spizzichi, perché la maggior parte dei
difetti di quel piano nasce dall'aver capito metà del protocollo. `web/design-system` è la zona con
l'effetto moltiplicatore più alto: un componente di base non accessibile rende non accessibile ogni
schermata che lo usa, e la correzione a valle costa molte volte quella a monte.

---

## 16. Quando la tua proposta viene rifiutata

Succederà, e il modo in cui succede è parte del funzionamento del progetto. Vale la pena
distinguere **quattro tipi di rifiuto**, perché richiedono risposte diverse e confonderli è la
causa più comune di frustrazione.

**Rifiuto tecnico.** Il contributo ha un difetto: si corregge e si ripropone. È il caso ordinario
e non richiede commenti.

**Rifiuto di perimetro.** Il contributo introduce una funzione dell'elenco chiuso e **non si valuta
nel merito tecnico**: si rifiuta per politica, con motivazione regolatoria scritta (`V-170`). Non
è un giudizio sulla qualità del lavoro, ed è la ragione per cui l'elenco è pubblicato: leggerlo
prima costa dieci minuti.

**Rifiuto di competenza.** Il contributo decide qualcosa che non spetta a chi lo propone: una
scelta architetturale senza documento di decisione, una modifica al perimetro contrattuale senza
dichiarazione, una risposta a una questione indirizzata a un'altra area. La risposta corretta non
è insistere: è portare la questione dove si decide.

**Rifiuto di forma regolatoria.** Il contributo contiene una formula vietata, una citazione non
verificata presentata come verificata, un identificativo rinumerato o un dato non sintetico. È il
tipo di rifiuto che sembra pedante e non lo è: è il difetto che si propaga.

In tutti e quattro i casi vale una regola sola, che è anche il modo in cui questo progetto decide:
**si discute finché non resta un'obiezione sostanziale non risolta**, con argomenti riferiti a
fonti verificabili. Se il disaccordo persiste si scrive il documento di decisione con le
alternative. Le decisioni non scritte non esistono: sei mesi dopo nessuno ricorda perché. Il
processo completo, i ruoli e la procedura di disaccordo sono in
[`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md).

---

## 17. Punti non verificati di questo modulo

Elencati qui perché una lacuna dichiarata è utilizzabile e una lacuna implicita no.

| Riferimento | Che cosa manca | A chi spetta |
|---|---|---|
| `[NV]` | Il **comando aggregato** che esegue in locale i controlli obbligatori non è fissato: finché non lo è, la sezione «come si verifica» di ogni area si appoggia a una sequenza manuale (`Q-190`) | Area tecnica |
| `[NV]` | Gli **strumenti di validazione dei profili clinici eseguibili in locale** non sono fissati per nome e versione: la verifica prescritta per l'area protocolli non è quindi eseguibile in forma riproducibile (`Q-133`, `Q-193`) | Aree protocolli e tecnica |
| `[NV]` | Il **dispositivo di riferimento** per i criteri di resa su schermo piccolo non è dichiarato: due requisiti di accessibilità non sono verificabili finché non lo è (`Q-115`) | Prodotto |
| `[NV]` | Gli **intervalli di indirizzi vietati** per la prova di confinamento del nodo di relay non sono elencati: senza l'elenco la prova non è scrivibile (`Q-196`) | Area sicurezza |
| `[NV]` | Il **profilo minimo praticabile** di macchina per l'ambiente locale non è misurato: chi ha una macchina modesta non sa in anticipo se può partecipare (`Q-191`) | Aree tecnica e roadmap |
| `Q-195` | Non esiste un **elenco pubblico e mantenuto dei contributi di primo ingresso** per area, coerente con le sezioni «il primo contributo sensato» di questo modulo. Senza di esso le indicazioni restano descrittive e non azionabili | → orchestrazione, con le aree |
| `Q-197` | Non è definito **chi risponde alle segnalazioni non di codice** - revisione clinica, verifica delle fonti, prove di accessibilità - né entro quanto. È la condizione perché il §14 produca contributi ripetuti invece che singoli | → orchestrazione, con la governance |
| `Q-198` | La **doppia denominazione di questo modulo** nei rinvii esistenti è risolta sul testo: `CONTRIBUTING.md` - nel blocco italiano e in quello inglese - il modulo 00 e il modulo 17 sono stati allineati al `title` del file, «Contribuire, area per area», che è la denominazione autorevole; il glossario vi era già allineato. Resta la parte non redazionale: la **verifica automatica di raggiungibilità** dei rinvii va inserita fra i controlli bloccanti prima del primo deploy (si salda con `Q-26`) | Guida e sito |

---

## Cosa devi ricordare

1. **La domanda giusta non è «c'è qualcosa di facile»: è «che cosa so già».** Le aree di questo
   progetto hanno prerequisiti asimmetrici, e sceglierne una senza i prerequisiti produce un
   contributo che nessuno riesce a rivedere.
2. **Il primo contributo si sceglie piccolo per attraversare l'intero ciclo**, non per fare poco.
   Modifica, prove, controlli in locale, doppia lingua, revisione: la prima volta è il ciclo che
   si impara, non il codice.
3. **Esistono quattro tipi di rifiuto e solo uno è tecnico.** Il rifiuto di perimetro non è un
   giudizio sul lavoro; il rifiuto di competenza si risolve portando la questione dove si decide.
4. **Gli errori tipici sono due, e dipendono da dove vieni.** Chi arriva dall'informatica
   gestionale semplifica il dominio; chi arriva dalla sanità sottovaluta i vincoli di macchina.
   Riconoscere il proprio è più veloce che scoprirlo in revisione.
5. **I controlli obbligatori sono condizioni di ammissibilità, non giudizi di qualità.** Aggirarne
   uno produce un artefatto che non avrebbe potuto essere prodotto. Se un controllo blocca
   legittimamente uno sviluppo legittimo, si corregge il controllo.
6. **Una proposta che tocca il contenuto italiano non è completa finché non aggiorna l'inglese.**
   Vale anche per una riga.
7. **I contributi che non sono codice valgono quanto il codice e sono più scarsi.** Revisione
   clinica, verifica delle fonti, traduzione, prove di accessibilità reali, segnalazione di
   ambiguità: cinque tipi di lavoro che nessuno sviluppatore può fare al posto di chi ha la
   competenza giusta.
8. **La cosa più preziosa che puoi riportare è quella che avevi assunto e che si è rivelata
   falsa.** Indica dove la documentazione è ambigua, che è il difetto che nessun controllo
   automatico troverà.

