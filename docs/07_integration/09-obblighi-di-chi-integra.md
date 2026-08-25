---
title: Obblighi di chi integra
sidebar_position: 10
description: Che cosa assume chi integra sul piano regolatorio, di protezione dei dati, di sicurezza e di terminologie. Con la tabella di ripartizione delle responsabilità e la lista di controllo prima della messa in servizio.
---

# Obblighi di chi integra

> **È il documento più importante di quest'area.** Va letto **prima** della firma di un
> contratto, non dopo. Le altre pagine descrivono come far funzionare le cose; questa descrive
> di che cosa rispondete quando funzionano.

## 0. Come leggere questo capitolo

Il capitolo non è un parere legale e non lo sostituisce. Fa una cosa diversa e utile: **elenca
gli obblighi che nascono da fatti tecnici** descritti nelle altre pagine, citando la fonte, e
dice **a chi** ricadono. Quello che poi ne discende per la vostra organizzazione va valutato con
i vostri consulenti.

Ogni affermazione normativa cita l'atto. Dove la fonte non è verificata, è marcato **`[NV]`** e
si dice a chi va chiesto. Dove il progetto ha preso una decisione propria, è dichiarato come
tale.

## 1. Il punto di partenza: che cosa state integrando

### 1.1 Il repository è codice sorgente, non un dispositivo medico

> **Il repository pubblico è codice sorgente distribuito con licenza Apache-2.0. Non è un
> dispositivo medico immesso sul mercato, e lo dichiara.**

Sono due artefatti distinti, con nomi, numeri di versione e cicli di vita diversi:

| Artefatto | Che cos'è | Chi risponde |
|---|---|---|
| **Repository** | Codice sorgente sotto licenza aperta | Nessuno, nei limiti della licenza |
| **Distribuzione identificata** | Prodotta da costruzione riproducibile, sottoposta a controllo qualità, con un fabbricante preciso, un responsabile della conformità e una registrazione | **Il fabbricante** |

La distinzione non è formale: è ciò che protegge insieme la comunità che scrive il codice e la
persona che riceve la prestazione. Ed è ciò che vi riguarda direttamente, perché **chi
trasforma il primo artefatto nel secondo siete voi**, se lo fate.

### 1.2 Il progetto non appone la marcatura

> **Il progetto produce e pubblica il materiale regolatorio, ma non costituisce un soggetto
> fabbricante, non ingaggia organismi di valutazione, non conduce la valutazione clinica e non
> appone la marcatura CE.** Chi integra e immette sul mercato assume il ruolo di fabbricante.

E la conseguenza operativa che vale **oggi**, senza eccezioni:

> Finché non esiste una marcatura, il software **non è utilizzabile per l'erogazione di
> prestazioni sanitarie su pazienti reali**. Ogni artefatto distribuito lo dichiara, e nessun
> documento, pagina o messaggio può lasciare intendere il contrario.

Se il vostro piano commerciale presuppone l'inverso, il piano va corretto — non la
documentazione.

### 1.3 La clausola di esclusione di responsabilità della licenza non vale verso il paziente

È il punto che genera l'equivoco più costoso, ed è bene affrontarlo apertamente.

La licenza Apache-2.0 contiene clausole di esclusione di garanzia e di limitazione di
responsabilità. **Valgono fra le parti del rapporto di licenza. Non valgono verso il
danneggiato.**

- La Direttiva (UE) 2024/2853 sulla responsabilità per danno da prodotti difettosi, all'**art.
  15**, **vieta l'esclusione o la limitazione contrattuale della responsabilità verso il
  danneggiato**.
- L'**art. 10** della stessa direttiva **presume la difettosità** del prodotto in caso di non
  conformità a requisiti obbligatori di sicurezza previsti dal diritto dell'Unione.

Tradotto in una frase: **una licenza che dice «senza garanzie» non vi protegge da una richiesta
di risarcimento di una persona che ha subito un danno**. Vi protegge, nei limiti che essa
stessa pone, nei rapporti con chi vi ha fornito il codice.

## 2. Regolatorio: dispositivi medici

### 2.1 Chi è il fabbricante

È fabbricante chi **immette sul mercato o mette in servizio** il dispositivo a proprio nome.
Se prendete il codice, ne producete una distribuzione e la usate per erogare prestazioni
sanitarie — anche solo ai vostri clienti, anche senza vendere il software — **siete voi**.

Da qui discende tutto il resto di questa sezione. Non è evitabile con una clausola contrattuale
verso il progetto, perché il progetto non è il vostro fornitore nel senso in cui lo intende la
disciplina: è la fonte del codice.

### 2.2 La classificazione e le sue conseguenze

Il perimetro funzionale del progetto **include il telemonitoraggio** e la **valutazione
automatica delle soglie**, ed è l'elemento che costituisce interpretazione. Il progetto dichiara
una finalità medica propria e assume la classificazione corrispondente, con le conseguenze
vincolanti:

| Conseguenza | Effetto per voi |
|---|---|
| Serve un **organismo notificato** | Non è autocertificabile |
| Il sistema di gestione qualità dev'essere **certificato**, non solo implementato | Costo e tempi propri |
| Serve una **valutazione clinica** ai sensi dell'art. 61 e dell'Allegato XIV | Percorso documentale autonomo |
| Procedura di valutazione della conformità dell'Allegato IX (oppure X + XI) | — |

E il fatto che pesa di più sulla vostra pianificazione:

> **Il fattore limitante non è lo sviluppo: è la disponibilità degli organismi notificati.** I
> tempi dichiarati dalle rilevazioni di settore collocano la maggioranza dei percorsi fra 13 e 18
> mesi dalla firma dell'accordo al certificato, con una quota rilevante fra 19 e 24 mesi; il
> divario fra domande presentate e certificati emessi è ampio e l'organico degli organismi è in
> contrazione. **Un fabbricante nuovo, piccolo, alla prima certificazione non è un cliente
> prioritario**, e va messo in conto nella negoziazione.

### 2.3 La destinazione d'uso è il documento più costoso da sbagliare

Una singola frase sposta la classificazione e con essa i tempi e i costi.

| Formulazione | Classificazione | Classe di sicurezza del software |
|---|---|---|
| «monitoraggio **in tempo reale** dei parametri vitali» | Superiore | Superiore |
| «raccolta **differita** di parametri per la revisione periodica del professionista» | Quella assunta dal progetto | Quella assunta dal progetto |

La differenza vale, nelle stime di settore, **dodici-diciotto mesi e un ordine di grandezza di
costo**.

**Che cosa dovete fare, in concreto:**

1. **Congelare la vostra destinazione d'uso prima di ingaggiare qualunque organismo.** Cambiarla
   dopo comporta una rivalutazione.
2. **Sottoporla a revisione esterna** prima del congelamento.
3. **Verificare che il vostro materiale commerciale non la contraddica.** Una brochure che
   promette il monitoraggio in tempo reale è una dichiarazione di destinazione d'uso, anche se
   non si chiama così.

### 2.4 Che cosa il progetto vi consegna, e che cosa no

**Vi consegna** — è il pacchetto per chi certifica:

- fascicolo tecnico;
- documentazione di ciclo di vita del software ai sensi di IEC 62304;
- gestione del rischio ai sensi di ISO 14971;
- file di ingegneria dell'usabilità ai sensi di IEC 62366-1;
- inventario dei componenti di terze parti e distinta dei materiali, generati dalla prima
  pipeline;
- tracciabilità requisito → progettazione → codice → prova, con identificativi **congelati**;
- il manuale operativo del percorso di certificazione, scritto per chi certifica.

**Non vi consegna**: la marcatura, la dichiarazione di conformità, la registrazione, la
valutazione clinica, il rapporto con l'organismo, il responsabile della conformità normativa.
Sono vostri.

L'ultima riga del primo elenco merita attenzione: **gli identificativi di requisito non vengono
mai rinumerati**. Se il vostro processo li rimappa su una vostra numerazione, la tracciabilità
si rompe, e la tracciabilità **non si ricostruisce a posteriori**.

### 2.5 Le funzionalità a un passo dalla classificazione superiore

Tre funzionalità sono **a una singola storia utente** dalla classificazione superiore, e vanno
governate con controllo delle modifiche:

1. **Allerta su soglia** — se l'avviso passasse da «la misura ha superato la soglia che hai
   impostato» a un giudizio interpretativo, cambia natura.
2. **Riproduzione con miglioramento** — un'elaborazione che «migliora» un'immagine o un audio a
   fini di valutazione clinica è un'altra cosa.
3. **Refertazione assistita** — un sistema che propone contenuto clinico non è più persistenza di
   contenuto redatto dal professionista.

Se il vostro modulo sostitutivo ([08](08-moduli-sostituibili.md)) introduce una di queste
capacità, **avete cambiato la natura del prodotto**, e la valutazione di conformità è da rifare
sul vostro perimetro.

### 2.6 Il conflitto riconosciuto fra protezione degli endpoint e certificazione

C'è un punto in cui due discipline confliggono, e l'autorità lo riconosce espressamente:
installare protezioni sugli endpoint di un dispositivo medico «ne potrebbe invalidare la
certificazione». La deroga esiste **ma richiede misure compensative documentate, che deve
fornire il fornitore**.

Il progetto produce quelle misure come parte del pacchetto, invece di lasciarle a voi. **Ma è a
voi che verranno chieste**, quindi vanno recepite nel vostro fascicolo e non archiviate.

## 3. Protezione dei dati

### 3.1 I ruoli

Non si sceglie il ruolo: **si determina in base a chi decide finalità e mezzi**.

| Scenario | Titolare | Responsabile |
|---|---|---|
| Voi erogate prestazioni con il vostro software, che include Telemedic | **Voi** | Eventuali vostri fornitori di infrastruttura |
| Voi fornite il servizio a strutture sanitarie che erogano le prestazioni | **La struttura sanitaria** | **Voi** |
| Più titolari determinano insieme finalità e mezzi | **Contitolarità**, con l'accordo previsto dall'art. 26 GDPR | — |

**Il progetto non è titolare né responsabile**: non tratta dati, fornisce codice. Nel momento in
cui esiste un'installazione che tratta dati, i ruoli sono fra voi, i vostri clienti e i vostri
fornitori.

### 3.2 Che cosa non potete evitare di fare

| Adempimento | Nota |
|---|---|
| **Base giuridica** per ciascun trattamento | Il consenso non è quasi mai la base giusta per la cura: l'art. 9, par. 2, lett. h) esiste per questo. Usare il consenso dove non serve crea un diritto di revoca che rende il trattamento insostenibile |
| **Informative** distinte e comprensibili | Per l'assistito, per il professionista, per il caregiver |
| **Registro dei trattamenti** | Con le categorie di dati, le finalità, i destinatari, i termini di conservazione |
| **Valutazione d'impatto** | Trattamento su larga scala di dati relativi alla salute con tecnologie nuove: i presupposti dell'art. 35 sono ampiamente integrati |
| **Accordi con i responsabili** ai sensi dell'art. 28 | Con ciascun fornitore che tratta per vostro conto |
| **Misure di sicurezza** ai sensi dell'art. 32 | Documentate, non solo attuate |
| **Procedura di violazione** | §3.5 |

**Termini di conservazione che non sono negoziabili.** Alcune categorie hanno termini fissati
dalla disciplina di settore, e vanno configurati di conseguenza: **ventiquattro mesi** per i log
di tracciabilità e **dodici mesi** per i dati di accesso e autenticazione (DM 19 novembre 2025,
Allegato 4). Non sono valori predefiniti da lasciare come sono: sono valori da verificare
rispetto al vostro caso e da giustificare se divergono.

### 3.3 La registrazione della sessione, e il suo effetto sull'informativa

È il punto in cui una scelta tecnica diventa un obbligo informativo.

> **Quando la registrazione è attiva, la cifratura viene terminata sul server e la sessione non è
> più cifrata fino agli estremi.** È una conseguenza inderogabile dell'architettura, non un
> difetto.

Da cui, per voi:

1. **L'informativa di consenso deve dichiararlo esplicitamente.** Un consenso alla registrazione
   che non dica che la sessione cessa di essere protetta fino agli estremi è un consenso su
   un'informazione incompleta.
2. **L'interfaccia deve segnalare lo stato di registrazione in modo persistente e non
   occultabile** per tutta la durata. Nessuna personalizzazione può nasconderlo
   ([05 §7.2](05-componente-incorporabile.md)).
3. **Il passaggio fra le due modalità è tracciato.**
4. **Il file è cifrato a riposo** con chiavi per tenant e la conservazione è configurabile —
   dovete configurarla, non ereditarla.

### 3.4 Sovranità e collocazione

Il progetto è costruito perché **nessun componente obbligatorio del percorso principale dipenda
da servizi non sostituibili o stabiliti fuori dall'Unione europea**, e sostiene tre profili di
collocazione: Unione europea, territorio italiano, cloud qualificato.

**Che cosa resta a voi**: le vostre scelte. Se aggiungete un servizio di trascrizione, un sistema
di monitoraggio degli errori o un servizio di terminologie stabilito altrove, il vincolo è
vostro e la valutazione del trasferimento è vostra.

Il punto che cambia la natura della questione: la sovranità del dato **non è più solo un
argomento commerciale**. La disciplina sulla sicurezza delle reti obbliga il soggetto a
**dichiarare nominativamente all'autorità i propri fornitori rilevanti**, con ragione sociale,
codice fiscale, **Paese della sede legale** e criterio di rilevanza. Un componente stabilito
fuori dall'Unione è un dato che il vostro cliente deve comunicare a un'autorità.

### 3.5 Violazioni

| Obbligo | Chi | Termine |
|---|---|---|
| Notifica all'autorità di controllo | Il titolare | 72 ore dalla conoscenza (art. 33 GDPR) |
| Comunicazione agli interessati, se il rischio è elevato | Il titolare | Senza ingiustificato ritardo (art. 34 GDPR) |
| Informazione al titolare | Il responsabile | Senza ingiustificato ritardo (art. 33, par. 2) |
| Notifica ai sensi della disciplina sulla sicurezza delle reti | Il soggetto NIS | Termini propri, distinti da quelli GDPR |
| Notifica ai sensi della disciplina sulla vigilanza dei dispositivi | Il fabbricante | Termini propri |

**Tre discipline, tre termini, tre destinatari.** Una procedura di violazione che ne considera
solo una è incompleta. E la responsabilità di coordinarle è di chi mette in servizio, non del
progetto.

## 4. Sicurezza

### 4.1 Il termine non è una data unica

> **Il termine di adeguamento alle misure di sicurezza è soggettivo**, non una data uguale per
> tutti: la regola è **diciotto mesi dalla ricezione della comunicazione di inserimento**.
> Ciascun cliente ha quindi un termine proprio.

Conseguenza per il vostro prodotto: **la conformità va parametrizzata sul termine del singolo
utilizzatore**, non cablata su una data nella vostra roadmap. Se avete scritto una data nel
vostro piano, è una vostra stima e non un termine di legge.

Il catalogo delle misure, su fonte dell'autorità, distingue i soggetti importanti dagli
essenziali con numeri di misure e requisiti diversi. Quale dei due siate — o siano i vostri
clienti — non lo decidete voi.

### 4.2 Siete un fornitore rilevante

In modalità di servizio gestito ricadete sotto entrambi i criteri di rilevanza; **in
installazione presso il cliente ricadete comunque sotto quello di non fungibilità**. Il vostro
cliente dovrà dichiararvi nominativamente all'autorità.

**Che cosa vi conviene fare**: preparare in anticipo la scheda con i dati che il cliente è tenuto
a dichiarare. Il progetto la fornisce per sé come deliverable; voi dovete produrre la vostra.

### 4.3 Il registro immutabile non è il versionamento delle entità

È l'errore tecnico più costoso di questa sezione, e va detto chiaramente.

> **Un meccanismo di versionamento delle entità versiona, non rende immutabile.** Chi ha accesso
> in scrittura alla base dati può alterare anche le tabelle di versione.

Ciò che serve — e che i requisiti applicabili richiedono — è una **catena di hash** con
**conservazione separata dal sistema che genera gli eventi**. Il progetto lo implementa; se
sostituite la destinazione delle tracce ([08 §4](08-moduli-sostituibili.md)), **la proprietà di
immutabilità diventa una vostra responsabilità**, e va dimostrata, non dichiarata.

Che cosa il registro contiene: chi, che cosa, quando, su quale soggetto, con quale esito e con
quale livello di garanzia dell'autenticazione. **Non contiene contenuto clinico.** Se il vostro
sistema di correlazione degli eventi lo arricchisce con contenuto clinico, avete creato un
secondo archivio sanitario con obblighi propri.

### 4.4 Il regime applicabile è per artefatto, non per progetto

La disciplina sulla resilienza informatica dei prodotti con elementi digitali **esclude i
prodotti coperti dalla disciplina dei dispositivi medici**. Ne discende che il prodotto marcato è
fuori, **ma gli altri artefatti no**: strumenti client, componente incorporabile, immagini e
pacchetti di distribuzione non coperti dalla marcatura vi ricadono.

Il progetto adotta l'intero impianto senza invocare esenzioni, e mantiene una tabella artefatto →
regime applicabile. **Voi dovete produrre la vostra**, perché i vostri artefatti non sono i
nostri.

> **`[NV]`** — La composizione esatta della vostra tabella dipende da che cosa distribuite e come.
> Va costruita con i vostri consulenti; il progetto fornisce la propria come modello, non come
> risposta.

## 5. Il pagatore non è un consultatore

Questa sezione è breve e non ammette interpretazioni.

> **L'art. 15, comma 4, del DM 7 settembre 2023 esclude sempre le compagnie di assicurazione
> dall'accesso al Fascicolo sanitario elettronico, insieme a periti e datori di lavoro.**

Il caso d'uso in cui una prestazione di telemedicina è **pagata** da un fondo, una mutua o una
polizza è pienamente valido. Che cosa non è valido:

| Non è consentito | Nemmeno se… |
|---|---|
| Un assicuratore accede al fascicolo | …l'assistito ha firmato una liberatoria |
| Un assicuratore riceve il referto della prestazione che ha pagato | …il referto è stato prodotto grazie alla polizza |
| Un professionista accede al fascicolo **per conto** di un assicuratore | …il professionista è abilitato all'accesso per finalità di cura |
| Un modulo sostitutivo di fatturazione arricchisce l'evento amministrativo con la diagnosi | …il tariffario del pagatore dipende dalla prestazione erogata |
| Un ambito di autorizzazione consente a un client di un pagatore di leggere documentazione clinica | …è stato richiesto a contratto |

**La terza riga è quella su cui si sbaglia in buona fede.** L'abilitazione di un professionista
all'accesso è funzionale alla cura: usarla per alimentare una valutazione assicurativa è una
finalità diversa, e la diversità di finalità non si sana con l'identità del soggetto che accede.

**Che cosa il pagatore può legittimamente ottenere**: identificativo della prestazione, tipo di
prestazione, istanti, esito amministrativo, importo, riferimenti al dominio dell'integratore. È
esattamente il contenuto dell'evento amministrativo descritto in
[04 §2.5](04-integrazione-per-eventi.md), e **il profilo di integrazione del pagatore è
amministrativo per costruzione**: non esiste una configurazione che lo arricchisca.

E una conseguenza sulla vostra comunicazione: **se il vostro materiale commerciale presenta il
caso d'uso assicurativo come «accesso alla documentazione clinica del proprio assicurato», va
corretto.** Il pagatore non è un consultatore.

## 6. Terminologie e licenze

È la sezione con le conseguenze economiche più sottovalutate.

### 6.1 I quattro regimi

Ogni terminologia clinica è collocata in uno di quattro regimi, verificati sulla licenza
primaria:

| Regime | Che cosa significa | Chi paga |
|---|---|---|
| **A — coesistenza piena** | Utilizzabile nei sorgenti sotto licenza aperta, con attribuzione | Nessuno |
| **B — cartella dedicata con licenza propria** | Ridistribuibile a condizioni proprie | Nessuno, ma la licenza va rispettata |
| **C — acquisizione o interrogazione a runtime a cura di chi installa** | Il progetto **non la scarica mai** | **Voi** |
| **D — esclusione totale** | Solo identificatore e codice, mai il contenuto | — |

### 6.2 Le tre trappole del regime C

**Trappola 1 — il servizio esterno non vi esonera.** Appoggiarsi a un servizio di terminologie di
terzi **non elimina la vostra licenza**: chi crea o analizza record che contengono quei concetti
è, secondo la definizione della licenza, un sistema di trattamento dei dati soggetto a licenza.
Le tariffe sono **per sito** e si applicano **anche in ambienti non di produzione**.

**Trappola 2 — distribuite un prodotto sotto licenza anche senza contenere un concetto.** Chi
distribuisce un software che è progettato per lavorare con quel contenuto distribuisce un
prodotto soggetto alla licenza, anche se il pacchetto non contiene un solo concetto.

**Trappola 3 — la cache è un derivato.** Una memoria persistita su disco di risposte del servizio
di terminologie costituisce un sottoinsieme, e un sottoinsieme è un derivato. Il progetto usa
quindi **memoria non persistita su disco** per i sistemi la cui licenza non consente derivati. Se
sostituite il punto di accesso alle terminologie, **la regola resta e diventa vostra**.

### 6.3 Il sistema funziona senza

> **Con i sistemi di codifica a licenza onerosa disattivati, il sistema resta pienamente
> operativo**, appoggiandosi a quelli che non costano nulla. Nessun percorso principale li
> richiede.

Il costo di disattivarli è dichiarato: alcune validazioni di codice non si eseguono. È una scelta
che potete fare consapevolmente, e in molti casi è la scelta giusta.

### 6.4 Due precisazioni che evitano errori diffusi

- **Le traduzioni di alcuni sistemi di codifica sono derivati assegnati al titolare della
  licenza.** Ne discende una regola architetturale: **le stringhe di interfaccia del vostro
  prodotto vanno tenute separate dalle etichette ufficiali dei codici**. Mescolarle significa
  produrre un derivato senza accorgersene.
- **Una dichiarazione di licenza apposta su una guida di implementazione non dispone dei diritti
  di terzi sul contenuto ricompreso.** Una guida pubblicata con licenza permissiva può contenere
  materiale i cui diritti appartengono ad altri. **La verifica va fatta artefatto per artefatto**,
  non guida per guida.

## 7. Identità digitale

Il quadro è in [06 §6](06-identita-e-delega.md). Qui il riassunto della responsabilità:

> **Il fornitore di servizi verso la federazione nazionale è chi eroga il servizio in rete, cioè
> voi.** Il progetto è conforme e verificabile, **non accreditato**, e non può esserlo.

Restano a voi: la convenzione con l'autorità; l'elenco dei servizi attivi con il livello di
sicurezza previsto per ciascuno; la motivazione delle scelte di livello e degli attributi
richiesti; la conservazione dei registri per il periodo prescritto; la sincronizzazione oraria
entro la tolleranza prescritta; l'assistenza agli utenti; la notifica delle violazioni nel
termine prescritto; il rinnovo dei certificati e il rideposito del documento di metadata.

E un dato di pianificazione: **i tempi del procedimento non sono dichiarati in alcuna fonte
primaria**, salvo alcuni termini a valle della firma. Non si pianifica contro un termine che non
esiste.

## 8. Accessibilità

Non è un adempimento finale: è un **requisito funzionale** del sistema, e vale per ogni
schermata, inclusi il componente incorporabile e la documentazione.

| Obbligo | Chi |
|---|---|
| Il prodotto soddisfa i criteri dichiarati, con l'unica non conformità dichiarata | Il progetto |
| **La personalizzazione non degrada l'accessibilità** | Il progetto lo impedisce tecnicamente ([05 §7.2](05-componente-incorporabile.md)); voi non aggirate il meccanismo |
| **Dichiarazione di accessibilità** del servizio erogato | **Voi** |
| Verifica con tecnologie assistive reali, oltre a quella automatica | **Voi**, sul vostro perimetro. L'automazione intercetta una parte minoritaria dei difetti |
| Conformità alle linee guida di design per i servizi digitali della pubblica amministrazione, dove applicabile | **Voi** |

L'unica non conformità dichiarata dal progetto riguarda i sottotitoli in tempo reale, con
l'interprete come misura alternativa. **Se la vostra organizzazione ha un obbligo che quella
misura alternativa non soddisfa, è un vostro problema da risolvere prima della messa in
servizio**, non dopo.

## 9. Tabella di ripartizione delle responsabilità

Legenda: **P** progetto · **I** integratore o chi mette in servizio · **C** cliente finale
(struttura sanitaria) · **—** non applicabile.

| # | Ambito | Attività | P | I | C |
|---|---|---|:--:|:--:|:--:|
| 1 | Regolatorio | Produrre fascicolo tecnico, documentazione di ciclo di vita, gestione del rischio, file di usabilità | **P** | | |
| 2 | Regolatorio | Congelare gli identificativi di requisito e mantenere la tracciabilità | **P** | I | |
| 3 | Regolatorio | Costituirsi fabbricante, nominare il responsabile della conformità | | **I** | |
| 4 | Regolatorio | Dichiarare la destinazione d'uso e i limiti d'uso del **proprio** prodotto | | **I** | |
| 5 | Regolatorio | Ingaggiare l'organismo, condurre la valutazione clinica, apporre la marcatura, registrare | | **I** | |
| 6 | Regolatorio | Sorveglianza post-commercializzazione e vigilanza sugli incidenti | | **I** | C |
| 7 | Regolatorio | Controllo delle modifiche sulle funzionalità a un passo dalla classificazione superiore | **P** | **I** | |
| 8 | Dati | Determinare finalità e mezzi, quindi il ruolo | | I | **C** |
| 9 | Dati | Informative, basi giuridiche, registro dei trattamenti | | I | **C** |
| 10 | Dati | Valutazione d'impatto | | I | **C** |
| 11 | Dati | Accordi fra titolare e responsabile | | **I** | **C** |
| 12 | Dati | Configurare i termini di conservazione | | **I** | C |
| 13 | Dati | Rispondere alle richieste degli interessati | | I | **C** |
| 14 | Dati | Notificare le violazioni all'autorità e agli interessati | | I | **C** |
| 15 | Dati | Fornire le funzioni tecniche che rendono esercitabili i diritti | **P** | | |
| 16 | Sicurezza | Registro a catena di hash con conservazione separata | **P** | I se sostituito | |
| 17 | Sicurezza | Determinare il proprio termine di adeguamento | | I | **C** |
| 18 | Sicurezza | Dichiarare i fornitori rilevanti all'autorità | | | **C** |
| 19 | Sicurezza | Fornire i dati che il cliente deve dichiarare | **P** | **I** | |
| 20 | Sicurezza | Misure compensative per il conflitto sugli endpoint | **P** | I | |
| 21 | Sicurezza | Gestione delle vulnerabilità sui **propri** artefatti | **P** | **I** | |
| 22 | Sicurezza | Custodia delle chiavi private dell'integrazione | | **I** | |
| 23 | Sicurezza | Contromisure verso risorse interne sugli indirizzi forniti | **P** | **I** sul proprio lato | |
| 24 | Identità | Essere fornitore di servizi verso la federazione | | I | **C** |
| 25 | Identità | Conformità verificabile del prodotto | **P** | | |
| 26 | Identità | Motivare livelli e attributi richiesti | | I | **C** |
| 27 | Terminologie | Collocare ogni terminologia in un regime, verificato sulla licenza | **P** | | |
| 28 | Terminologie | Acquisire le licenze dei sistemi abilitati | | **I** | **C** |
| 29 | Terminologie | Non persistere su disco ciò che la licenza non consente | **P** | **I** se sostituito | |
| 30 | Accessibilità | Prodotto conforme, personalizzazione non degradante | **P** | | |
| 31 | Accessibilità | Dichiarazione di accessibilità del servizio | | I | **C** |
| 32 | Accessibilità | Verifica con tecnologie assistive reali sul proprio perimetro | **P** | **I** | C |
| 33 | Clinico | Definire le soglie di monitoraggio | | | **C** (il professionista) |
| 34 | Clinico | Dichiarare la copertura oraria del servizio | | I | **C** |
| 35 | Clinico | Firmare i documenti clinici | | | **C** (il professionista) |
| 36 | Clinico | Conferire i documenti alle infrastrutture nazionali | | I | **C** |
| 37 | Pagatore | Garantire che nessun percorso porti contenuto clinico al pagatore | **P** | **I** | |

Le righe **7, 16, 19, 20, 23, 29, 32 e 37** sono quelle in cui la responsabilità è **condivisa**:
sono le più insidiose, perché una responsabilità condivisa non presidiata è una responsabilità di
nessuno. Vanno assegnate nominativamente nel vostro contratto.

## 10. Lista di controllo prima della messa in servizio

| # | Verifica | ✓ |
|---|---|---|
| 1 | La destinazione d'uso del **nostro** prodotto è scritta, congelata e coerente con il materiale commerciale | ☐ |
| 2 | Il ruolo nel trattamento è determinato e scritto, con gli accordi corrispondenti firmati | ☐ |
| 3 | La valutazione d'impatto è conclusa | ☐ |
| 4 | I termini di conservazione sono **configurati**, non ereditati dai valori predefiniti | ☐ |
| 5 | L'informativa sulla registrazione dichiara che la sessione **non è più cifrata fino agli estremi** | ☐ |
| 6 | La procedura di violazione copre **tutte e tre** le discipline, con i rispettivi termini | ☐ |
| 7 | Il registro delle tracce ha catena di hash e conservazione separata, anche se ne abbiamo sostituito la destinazione | ☐ |
| 8 | Le licenze delle terminologie abilitate sono acquisite, **anche per gli ambienti non di produzione** | ☐ |
| 9 | Nessun ambito, evento o modulo consente a un pagatore di ottenere contenuto clinico | ☐ |
| 10 | La dichiarazione di accessibilità del servizio è pubblicata | ☐ |
| 11 | La copertura oraria dichiarata è realistica e presidiata | ☐ |
| 12 | Le chiavi private dell'integrazione sono in un gestore di segreti, mai nel repository né nelle immagini | ☐ |
| 13 | Il nostro materiale commerciale non promette funzioni che spostano la classificazione | ☐ |
| 14 | La tabella §9 è stata assegnata nominativamente, riga per riga | ☐ |
| 15 | Se non c'è ancora una marcatura, **nessun paziente reale è coinvolto** | ☐ |

## 11. Che cosa chiedere per contratto

Se state negoziando con un fornitore che integra Telemedic per vostro conto, queste sono le
domande che vale la pena porre. Se **siete voi** il fornitore, sono le domande che vi verranno
poste.

1. **Chi è il fabbricante della distribuzione che state mettendo in servizio, e qual è il numero
   di versione esatto?**
2. **Qual è la destinazione d'uso dichiarata, per iscritto?**
3. **Esiste la marcatura? Se no, con quale base state erogando prestazioni?**
4. **Chi è titolare e chi responsabile, e dove sta l'accordo?**
5. **Dove sono collocati i dati, e quali fornitori compaiono nella catena?**
6. **Il registro delle tracce è immutabile in senso proprio, o è un versionamento?**
7. **Quali terminologie sono abilitate, e chi ne ha acquisito la licenza?**
8. **Qual è la copertura oraria dichiarata, e chi risponde fuori da quella finestra?**
9. **Qual è la procedura in caso di violazione, e chi notifica a chi entro quanto?**
10. **Chi risponde se un modulo sostitutivo introduce contenuto clinico generato?**

Una risposta assente a una di queste domande non è un dettaglio da chiarire dopo la firma: è
esattamente il punto su cui, in caso di contestazione, si stabilirà chi risponde.
