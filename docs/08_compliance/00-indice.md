---
title: Conformità - indice e orientamento
sidebar_position: 1
description: "Come è organizzata l'area di conformità di Telemedic, che cosa contiene e che cosa rinvia altrove. Percorsi di lettura per chi intende certificare, per chi installa e per chi contribuisce; confini rispetto alla sicurezza e alla guida dei fondamenti; vincoli recepiti e imposti; ciò che quest'area deliberatamente non dice; e la nota su che cosa è cambiato con le decisioni D57 e D58 e su che cosa non è cambiato."
---

# Conformità - indice e orientamento

> **Quest'area non dichiara una conformità: la attribuisce.** Non esiste in questa documentazione
> una frase che affermi che il progetto è conforme a qualcosa, e l'assenza è deliberata. Un
> software non è conforme: **un soggetto lo è**, rispetto a un obbligo che grava su di lui, in un
> momento determinato. Ogni capitolo di quest'area risponde perciò a tre domande e a nessun'altra:
> *quale fonte*, *su chi grava*, *da quando*.

## 1. Il presupposto che governa tutto

Il progetto pubblica **codice sorgente sotto licenza libera**. Chi lo prende, lo integra, lo
distribuisce o lo mette in servizio **eroga prestazioni sanitarie**. Sono due posizioni giuridiche
diverse, e quasi tutte le fonti di quest'area si rivolgono alla seconda.

Da qui discendono i tre fatti che nessun capitolo può contraddire.

**Primo - il prodotto non reca marcatura CE, e il progetto non è oggi fabbricante** (`D28`,
`D49` e `V-06`, come emendati da `D58`). Il progetto **intende** assumere il ruolo di fabbricante,
e **il soggetto giuridico che lo eserciterebbe non è ancora costituito**. Produce e pubblica il
materiale regolatorio - fascicolo tecnico, ciclo di vita del software, gestione del rischio,
ingegneria dell'usabilità - **per quel percorso**, e si ferma esattamente dove comincia un atto che
presuppone un soggetto giuridico, una firma e una responsabilità che oggi non esistono. La ragione
non è prudenza: è che una parte di quel materiale **non è recuperabile a posteriori** (`D45`), e la
sua assenza renderebbe impossibile a chiunque certificare in seguito, **noi compresi**.

**Secondo - la distinzione fra il repository e la distribuzione è sostanziale, non retorica**
(`D17`). Il repository è codice sorgente e lo dichiara in
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
e in
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
Il dispositivo è una **distribuzione identificata**, con un fabbricante, un numero di versione, un
identificativo unico e un ciclo di vita propri. I due artefatti non hanno lo stesso nome e non
hanno lo stesso regime.

**Terzo - ciò che non è verificato si dichiara tale.** Ogni affermazione normativa di quest'area
cita la fonte puntuale; dove la verifica sul testo primario non è stata compiuta, la voce è
marcata **`[NV]`** con l'indicazione di che cosa va verificato e presso chi. Un riferimento
inventato in materia regolatoria non è un errore di stile: è un difetto che si propaga in un
documento controllato e vi resta.

### 1.1 Che cosa è cambiato con `D57` e `D58`, e che cosa no

Questa sezione esiste per una ragione precisa: **chi ha letto la versione precedente di quest'area
non deve dedurre il cambiamento da un mutamento di formulazioni.** Fino a `D58`, l'area era
costruita sulla figura di un **soggetto terzo indefinito** che avrebbe intrapreso il percorso di
certificazione, e a quel soggetto rinviava con l'espressione «chi certifica». Quella figura non
esiste più.

> **Prima di ogni altra riga, e in questa posizione perché è la sola che cambia le decisioni di
> chi legge.** Il prodotto **non reca marcatura CE**, **non è coperto da alcuna dichiarazione di
> conformità** e **non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti
> reali**. Chi legge «il progetto intende certificare» e ne conclude «allora posso usarlo» trae
> una conclusione **sbagliata**: l'intenzione non copre nessuno, non trasferisce alcun obbligo e
> non rende utilizzabile una versione non certificata.

**Che cosa è cambiato.**

| | Prima | Ora |
|---|---|---|
| Chi intraprende il percorso di certificazione | Un soggetto terzo indefinito, «chi certifica» | **Il progetto nel ruolo di fabbricante**, ruolo che **intende** assumere e il cui soggetto giuridico **è ancora da costituire** (`D58`) |
| Di chi sono la roadmap e le date | Presentate come percorso di terzi | **Pianificazione interna del progetto** (`D57`), mai il percorso di un soggetto esterno |
| A chi gravano le attività retroattivamente irrecuperabili di `D45` | «Su chi intende certificare» | **Su di noi**, in modo diretto invece che ipotetico - il che le rende **più** urgenti, non meno |
| Che cosa è il materiale regolatorio pubblicato | Un pacchetto per un terzo | Il materiale **del nostro percorso**, che resta utilizzabile anche da altri |

**Che cosa non è cambiato**, e va letto con la stessa attenzione della tabella precedente, perché
è la parte che si perde nelle riformulazioni.

1. **La ripartizione tecnica delle responsabilità resta valida per intero.** Gli atti che la norma
   riserva al ruolo di fabbricante - apporre la marcatura, firmare la dichiarazione di conformità,
   comporre e mantenere il fascicolo, nominare la persona responsabile del rispetto della normativa
   - **restano riservati a quel ruolo anche quando il ruolo sarà nostro**. La distinzione non è
   stata cancellata perché è precisamente ciò che rende leggibile **perché quelle attività non si
   possono anticipare**: l'intenzione non è il soggetto. L'elenco chiuso è in
   [04 §12](./04-fascicolo-tecnico.md), e non si è accorciato di una riga.
2. **Lo stato di fatto del prodotto è identico a ieri.** Nessuna marcatura, nessuna dichiarazione
   di conformità, nessuna valutazione di un organismo notificato, nessuna certificazione del
   sistema di gestione della qualità. Se dalla lettura di quest'area risultasse che il prodotto è
   più vicino all'uso clinico di quanto fosse prima di `D58`, **la lettura sarebbe sbagliata e la
   riformulazione un difetto da correggere**.
3. **Chi installa, integra o mette in servizio assume comunque gli obblighi che ne derivano.**
   L'intenzione del progetto di certificare **non gliene trasferisce alcuno**, e lasciarlo
   intendere sarebbe più dannoso del silenzio.
4. **Nessuna data di marcatura, da nessuna parte** (`V-171`). Non si scrive, e non si lascia
   intendere, che il prodotto sarà marcato entro un termine: una pianificazione interna **non
   diventa una promessa perché è nostra**. Nessuna data, nessuna finestra, nessun «entro» -
   l'unica occorrenza ammessa di quella parola è dentro l'enunciato del divieto stesso.
5. **La responsabilità verso il danneggiato non è escludibile per contratto** (Direttiva (UE)
   2024/2853, art. 15). Vale ora come prima, e con più forza da quando l'intenzione è nostra.

**Il registro che ne discende, e che vale per ogni capitolo di quest'area.** L'espressione «chi
certifica» come soggetto terzo **non è più usata**. Al suo posto, a seconda di ciò di cui si parla:
**il progetto nel ruolo di fabbricante** dove si parla di chi intende intraprendere il percorso;
**il fabbricante** dove si parla di un atto che la norma riserva a quel ruolo formale, a prescindere
da chi lo eserciti; **il soggetto fabbricante, da costituire** dove il passo presuppone l'esistenza
giuridica che oggi manca; **chi installa** o **chi integra** dove il testo si riferisce a loro. Le
regole di forma con cui l'intenzione va nominata - verbo «intende», assenza del soggetto ripetuta
nella stessa frase, stato di fatto negativo in prima posizione, nessuna data - sono in
[01 §11](./01-inquadramento-normativo.md) e sono parte di `V-171`.

## 2. I capitoli

| # | Capitolo | A quale domanda risponde |
|---|---|---|
| [01](./01-inquadramento-normativo.md) | **Inquadramento normativo** | Quali fonti toccano il progetto, su chi grava ciascun obbligo, da quando. Con la tabella artefatto → regime applicabile e le formule che nessun artefatto può usare |
| [02](./02-qualificazione-e-classificazione.md) | **Qualificazione e classificazione** | Perché il progetto è software dispositivo medico di Classe IIa, quali due leve tengono la IIa e non la IIb, quali dodici richieste ragionevoli sposterebbero la qualificazione |
| [03](./03-sistema-di-gestione-della-qualita.md) | **Sistema di gestione della qualità** | Che cosa significano ISO 13485 e IEC 62304 quando i contributori non sono dipendenti; le procedure realmente necessarie, i record di ogni rilascio, la tracciabilità, i componenti di terze parti |
| [04](./04-fascicolo-tecnico.md) | **Fascicolo tecnico** | Che cosa contiene il fascicolo voce per voce, quale documento di questo repository alimenta ciascuna voce, che cosa manca oggi e quali atti restano riservati al ruolo di fabbricante |
| [05](./05-gestione-del-rischio.md) | **Gestione del rischio** | Come si applica ISO 14971 a questo sistema: criteri di accettabilità, registro con esempi reali del dominio, gerarchia delle misure, rischio residuo dichiarato, raccordo con il modello di minaccia |
| [06](./06-usabilita-e-accessibilita.md) | **Usabilità e accessibilità** | L'ingegneria dell'usabilità come obbligo regolatorio, la valutazione formativa e quella sommativa, e il rapporto con l'accessibilità, che è un obbligo distinto sulla stessa interfaccia |
| [07](./07-valutazione-clinica.md) | **Valutazione clinica** | Che cosa si deve dimostrare, con quali dati, in quanto tempo, e perché è il secondo percorso a tempo lungo dopo l'organismo notificato |
| [08](./08-sorveglianza-post-commercializzazione.md) | **Sorveglianza post-commercializzazione** | I due processi distinti - sorveglianza e vigilanza -, i termini di segnalazione, le modifiche e quando richiedono l'intervento dell'organismo notificato |
| [09](./09-percorso-e-calendario.md) | **Percorso e calendario** | Gli ottenimenti da conseguire, in quale ordine, con quali prerequisiti, e gli scenari temporali con i punti di decisione irreversibili. **È la sede unica delle date**, che sono **pianificazione interna del progetto** (`D57`) e mai una data di marcatura |
| [10](./10-controllo-dei-documenti.md) | **Controllo dei documenti** | La procedura di controllo dei documenti approvata: elenco dei documenti, regole di identificazione e versione, revisori per categoria, forma dell'approvazione, ritiro. Come la registrazione di approvazione funziona nel modello «documenti come codice» e la lacuna esplicita dichiarata: redattore e approvatore coincidono, è la prima voce di `Q-189` |

**Una regola di collocazione che vale per tutta l'area: le date stanno solo nel capitolo 09.** Gli
altri capitoli rinviano. Due calendari in due luoghi divergono al primo aggiornamento, e in
materia regolatoria una data sbagliata in un documento pubblico è una promessa che qualcuno
leggerà come impegno.

## 3. Percorsi di lettura

### 3.1 Chi intende certificare

È il lettore per cui quest'area è stata scritta: chi intende assumere il ruolo di fabbricante,
comporre il fascicolo e immettere sul mercato una distribuzione identificata. **Da `D58` quel
lettore è in primo luogo il progetto stesso**, che intende assumere quel ruolo e non ha ancora
costituito il soggetto che lo eserciterebbe; resta valido anche per un integratore che assuma il
ruolo sulla propria distribuzione, e le due letture non si escludono. Per entrambi l'area è un
**manuale operativo**, non un'informativa - con la differenza, non piccola, che per il progetto è
un elenco di adempimenti propri e non un servizio reso a un terzo.

| Ordine | Capitolo | Perché in questa posizione |
|:-:|---|---|
| 1 | [02](./02-qualificazione-e-classificazione.md) | La qualificazione e la classe determinano tutto il resto. Leggere prima qualunque altra cosa significa leggerla senza sapere quale regime si applichi |
| 2 | [01](./01-inquadramento-normativo.md) | La mappa delle fonti e l'attribuzione: quali obblighi diventano suoi nel momento in cui immette sul mercato |
| 3 | [04](./04-fascicolo-tecnico.md) | L'inventario di ciò che è già fatto, di ciò che manca e degli atti che **solo il fabbricante** può compiere |
| 4 | [09](./09-percorso-e-calendario.md) | I tempi reali, prima di prendere impegni con chiunque |
| 5 | [03](./03-sistema-di-gestione-della-qualita.md), [05](./05-gestione-del-rischio.md), [06](./06-usabilita-e-accessibilita.md), [07](./07-valutazione-clinica.md), [08](./08-sorveglianza-post-commercializzazione.md) | I cinque flussi di lavoro paralleli, ciascuno con i propri tempi |

**Due avvertenze che gli risparmiano mesi, e che stanno in fondo ai capitoli invece che in
apertura.** La prima: le attività dei primi trenta giorni - costituzione del soggetto fabbricante,
congelamento della destinazione d'uso, individuazione del responsabile del rispetto della
normativa, primi contatti con gli organismi notificati, avvio del piano di valutazione clinica -
**non sono delegabili allo sviluppo** e non si recuperano a valle. Da `D58` queste attività
**gravano sul progetto**: la costituzione del soggetto è un **prerequisito interno con un proprio
tempo**, non un'attesa di un terzo, e ogni settimana in cui non si avvia è una settimana che il
progetto sottrae al proprio percorso. La seconda: la destinazione
d'uso è il documento più costoso da sbagliare, perché una singola formulazione sposta la classe di
rischio e la classe di sicurezza del software insieme (`D46`), e cambiarla dopo aver ingaggiato un
organismo comporta una rivalutazione.

### 3.2 Chi installa e mette in servizio

È l'azienda sanitaria, la struttura privata, la regione o l'operatore che porta il sistema in
esercizio senza necessariamente immetterlo sul mercato come prodotto proprio. Per lui la domanda
utile non è «di che classe è il software», ma **«che cosa diventa un obbligo mio».**

| Domanda | Dove si risponde |
|---|---|
| Quali fonti mi riguardano e da quando | [01](./01-inquadramento-normativo.md) |
| Che cosa non posso aspettarmi dal progetto | [01 §10](./01-inquadramento-normativo.md), [04 §12](./04-fascicolo-tecnico.md) |
| Come si ripartiscono le responsabilità fra me, l'integratore e il progetto | [06_security/09](../06_security/09-ripartizione-delle-responsabilita.md) e [07_integration/09](../07_integration/09-obblighi-di-chi-integra.md) |
| Quali rischi residui il progetto dichiara e mi trasferisce | [05 §8.4](./05-gestione-del-rischio.md) |
| Quali componenti hanno un regime di licenza che limita l'offerta come servizio gestito | [03 §9.5](./03-sistema-di-gestione-della-qualita.md), [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) |
| Che cosa devo comunicare all'autorità sui fornitori rilevanti | [01 §4](./01-inquadramento-normativo.md), [06_security/08](../06_security/08-quadro-normativo-e-misure.md) |

**Il punto che va detto per primo a questo lettore, e che quest'area non attenua:** finché non
esiste una marcatura CE, il sistema **non è utilizzabile per l'erogazione di prestazioni sanitarie
su pazienti reali** (`D16`). Non è una formalità superabile con una valutazione interna di rischio:
è la condizione dichiarata in ogni artefatto del progetto, ed è vincolante indipendentemente dalla
qualità tecnica del prodotto.

### 3.3 Chi contribuisce al codice

Per un contributore quest'area non è materia da conoscere per intero. Ne servono **tre pezzi**, e
tutti e tre hanno una conseguenza immediata su una proposta di modifica.

| Che cosa leggere | Perché una proposta può essere rifiutata per questo |
|---|---|
| [02 §6](./02-qualificazione-e-classificazione.md) - le dodici richieste che spostano la qualificazione | Una funzionalità dell'elenco **non viene respinta per merito tecnico, ma per politica di perimetro**. Il rifiuto è regolatorio e la motivazione va scritta come tale (vincolo `V-170`) |
| [03 §§7, 9](./03-sistema-di-gestione-della-qualita.md) - tracciabilità e componenti di terze parti | Una modifica che non cita il requisito rompe la tracciabilità, che non si ricostruisce. Una dipendenza aggiunta senza scheda e senza versione esatta è un elemento di configurazione non identificato (`V-173`) |
| [01 §11](./01-inquadramento-normativo.md) - le formule vietate | Una riga di documentazione, un messaggio di errore o un titolo di sezione che affermi una conformità inesistente è un difetto regolatorio (`V-171`), anche se il codice è impeccabile |

Chi non ha mai incontrato questa materia **non deve cominciare da qui**: il modulo
[10 §15 - Il quadro regolatorio da zero](../10_fondamenti/15-regolatorio-da-zero.md) è scritto per
chi parte da zero, è prerequisito dichiarato di
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), e quest'area lo
presuppone in ogni pagina.

## 4. I confini

### 4.1 Rispetto alla guida dei fondamenti

Quest'area **non spiega**: applica. La distinzione è netta e vale per ogni capitolo.

| Se cerchi… | Vai a |
|---|---|
| Che cos'è un dispositivo medico, una destinazione d'uso, una classe di rischio, un organismo notificato, una norma armonizzata | [10 §15, §§1–2](../10_fondamenti/15-regolatorio-da-zero.md) |
| Chi è il fabbricante e perché questo repository non lo è | [10 §15, §3](../10_fondamenti/15-regolatorio-da-zero.md) |
| Che cosa sono ISO 13485, IEC 62304, ISO 14971, IEC 62366-1 e che rapporto hanno fra loro | [10 §15, §5](../10_fondamenti/15-regolatorio-da-zero.md) |
| Che cosa sono pericolo, situazione pericolosa, rischio residuo | [10 §10, §9.6](../10_fondamenti/10-percorsi-di-cura-e-sicurezza.md) e [10 §15, §5.5](../10_fondamenti/15-regolatorio-da-zero.md) |
| Il quadro italiano della telemedicina e il fascicolo sanitario | [10 §02](../10_fondamenti/02-prestazioni-di-telemedicina.md), [10 §07](../10_fondamenti/07-fse-e-infrastrutture-nazionali.md) |

Un lettore che salti quei moduli troverà quest'area compatta fino all'incomprensibilità, e non
sarà un difetto di quest'area.

### 4.2 Rispetto all'area di sicurezza

I due perimetri si toccano in tre punti e non si sovrappongono in nessuno.

| Oggetto | Sta in `docs/06_security/` | Sta qui |
|---|---|---|
| Minacce, avversari, misure tecniche, incidenti | Integralmente | - |
| **File di rischio** | Il modello di minaccia è un **ingresso** | Il file di rischio ai sensi di ISO 14971 e la regola con cui l'ingresso vi entra: [05 §9](./05-gestione-del-rischio.md) |
| Obblighi in materia di sicurezza delle reti e di resilienza dei prodotti | Le misure e la loro attuazione: [06_security/08](../06_security/08-quadro-normativo-e-misure.md) | L'attribuzione del soggetto obbligato e la tabella artefatto → regime: [01 §§4–5](./01-inquadramento-normativo.md) |
| Ripartizione delle responsabilità fra i soggetti | La tabella operativa: [06_security/09](../06_security/09-ripartizione-delle-responsabilita.md) | Il riscontro di conformità su quella tabella, che ne conferma le righe e ne rafforza cinque: [01 §10](./01-inquadramento-normativo.md) |

**La regola che disambigua i casi dubbi:** se la domanda è «come lo si protegge», è sicurezza; se
è «chi risponde, verso chi, in base a quale fonte», è conformità.

### 4.3 Rispetto alle altre aree

Quest'area **non contiene** l'architettura ([`02_architecture/`](../02_architecture/00-indice.md)),
il catalogo dei requisiti ([`03_functional/`](../03_functional/00-indice.md)), il contratto delle
interfacce verso terzi ([`07_integration/`](../07_integration/00-indice.md)) né la pianificazione
di prodotto ([`09_roadmap/`](../09_roadmap/00-indice.md)). Verso quelle aree apre questioni invece
di decidere al loro posto, e le questioni sono registrate in fondo a ciascun capitolo.

## 5. Vincoli recepiti e vincoli imposti

**Recepiti da altre aree**, e vincolanti per ogni capitolo di quest'area: `V-05` (il fornitore di
servizi di identità è chi installa, non il progetto) · `V-06`, **emendato da `D58`** (il prodotto
non reca marcatura CE e il progetto non è oggi fabbricante; il ruolo di fabbricante è quello che il
progetto **intende** assumere, con il soggetto giuridico ancora da costituire, e gli atti riservati
a quel ruolo restano riservati)
· `V-07` (dataset canonico, serializzazioni sostituibili) · `V-12` (nessuna soglia tecnica è
imposta dalla normativa italiana: i valori sono specifica di prodotto, mai conformità) · `V-120`
(identificativi di requisito congelati) · `V-144` (la formulazione della destinazione d'uso del
telemonitoraggio è «raccolta differita di parametri per la revisione periodica del professionista»)
· `V-152` (termini di conservazione dei registri) · `V-154` e `V-165` (un livello di garanzia
riferito da un integratore non soddisfa un obbligo di autenticazione forte) · `V-163` (i testi di
avvertenza e di consenso non sono tematizzabili né occultabili).

**Imposti da quest'area a tutte le altre**, e non negoziabili senza contestazione motivata in
bacheca:

| # | Vincolo | Dove è istituito |
|---|---|---|
| `V-170` | **Controllo delle modifiche come misura di conformità.** Una proposta che introduca una delle funzioni fuori perimetro non si valuta nel merito tecnico: si rifiuta per politica di perimetro, con motivazione regolatoria scritta | [02 §10](./02-qualificazione-e-classificazione.md) |
| `V-171` | **Formule vietate in ogni artefatto pubblico.** Nessun testo del progetto può affermare o lasciare intendere una conformità, una marcatura o una certificazione che non esistono | [01 §11](./01-inquadramento-normativo.md) |
| `V-172` | **Spazio degli identificativi dei documenti regolatori.** Nessuna area può coniare un identificativo nei prefissi riservati senza dichiararlo | [03 §5](./03-sistema-di-gestione-della-qualita.md) |
| `V-173` | **Nessuna etichetta di versione mobile** su dipendenze, immagini di base e strumenti della catena di costruzione: è violazione diretta di una clausola, non una preferenza operativa | [03 §9.3](./03-sistema-di-gestione-della-qualita.md) |
| `V-174` | **Questa documentazione non è un documento controllato.** Nessun capitolo è una procedura del sistema di gestione della qualità e nessuna area può presentarlo come tale: i capitoli sono ingressi | [03 §4.1](./03-sistema-di-gestione-della-qualita.md) |

## 6. Che cosa quest'area non dice

Questa sezione esiste perché l'assenza di una risposta, in materia regolatoria, viene letta come
una risposta implicita. Quello che segue è ciò che non è stato scritto, e la ragione.

1. **Non dice che il progetto è conforme a qualcosa.** Non lo dice per l'MDR, non per il quadro di
   protezione dei dati, non per quello di sicurezza delle reti. Un prodotto **abilita** una
   conformità che appartiene a un soggetto.
2. **Non è consulenza legale né regolatoria.** La qualificazione giuridica di un soggetto e di un
   prodotto dipende da elementi di fatto che vanno accertati caso per caso da un professionista
   abilitato.
3. **Non contiene il fascicolo tecnico.** Contiene la sua mappa e il materiale che lo alimenta: la
   differenza è trattata in [04 §1](./04-fascicolo-tecnico.md) ed è la stessa che passa fra
   un'analisi e un documento approvato.
4. **Non contiene le procedure del sistema di gestione della qualità.** Ne elenca l'insieme
   necessario e ne spiega la ragione; scriverle è un atto di chi le esercita, dentro un controllo
   dei documenti che **non è in esercizio** (`V-174`). Che il ruolo di fabbricante sia quello che
   il progetto intende assumere non cambia questo punto: cambia soltanto a chi tocca istituirlo.
5. **Non stima costi e tariffe.** Le tariffe standard degli organismi notificati sono pubblicate
   per obbligo normativo: in presenza di una fonte primaria, stimare è un errore di metodo.
6. **Non fissa la data della marcatura CE.** L'omissione resta intatta e la sua ragione è cambiata
   con `D58`: non è più che la data «non è del progetto», ma che **un'intenzione non è una promessa
   datata** e che l'esito dipende da organismi notificati con code non misurate. Una data
   pubblicata verrebbe letta come previsione dell'esito, che è esattamente l'affermazione vietata
   da `V-171`. La motivazione per esteso è in [01 §13](./01-inquadramento-normativo.md).
7. **Non decide al posto del committente.** Le decisioni che richiedono una scelta imprenditoriale
   - monetizzazione, costituzione di un soggetto giuridico, periodo di supporto dichiarato, forma
   di pubblicazione della traccia di destinazione d'uso - restano aperte e sono marcate come tali.
8. **Non chiude le verifiche che non ha compiuto.** Dove il testo primario non è stato letto, la
   voce è `[NV]`: le più rilevanti riguardano la numerazione puntuale di alcune sezioni degli
   allegati, i codici di designazione applicabili al dispositivo e lo stato di armonizzazione di
   alcune norme, che va verificato **alla data d'uso** e non una volta per sempre.

## 7. Le questioni che quest'area tiene aperte

Ciascun capitolo si chiude con la propria tabella; qui si registra soltanto lo spazio di
numerazione, perché una questione senza numero non è rintracciabile. Quest'area usa `Q-170`…`Q-174`
e ha aperto: `Q-170` forma di pubblicazione della traccia di destinazione d'uso · `Q-171` pacchetto
documentale del regolamento sullo spazio europeo dei dati sanitari · `Q-172` struttura di
versionamento della distribuzione identificata e rapporto con l'identificativo unico · `Q-173`
se la presentazione di parametri costituisca funzione di misura · `Q-174` passaggio di revisione
regolatoria dei testi pubblici prima della pubblicazione. Le prime tre e la quinta richiedono una
decisione che non è di quest'area; la quarta richiede un fatto tecnico che quest'area non conosce.

**Lo spazio `Q-270`…`Q-279` e `V-270`…`V-279` è riservato alle voci aperte dalla riformulazione
imposta da `D57` e `D58`**, e le voci già aperte sono registrate in bacheca.

## 8. Come si mantiene quest'area

Tre regole, tutte con una conseguenza pratica.

**Le fonti si citano, non si ricordano.** Un riferimento normativo che compare in un capitolo
proviene dal testo o è marcato `[NV]`. Non esiste una terza possibilità, e la memoria di chi
scrive non è una fonte.

**Le date scadono.** Lo stato di armonizzazione di una norma, la versione di una guida, l'elenco
degli organismi designati e i termini di adeguamento cambiano. Ogni voce che dipende dal tempo va
riverificata alla data d'uso, e i capitoli lo dichiarano riga per riga invece di presentare una
fotografia come se fosse permanente.

**L'inglese non è una sintesi.** Ai sensi di `D50` quest'area esiste in italiano e in inglese
integrali, e la traduzione mantiene i riferimenti normativi italiani nella forma originale con la
spiegazione in lingua. Il rischio reale non è la traduzione mancante: è **la divergenza fra le due
versioni**, che in materia regolatoria produce due documenti che dicono cose diverse sullo stesso
obbligo.
