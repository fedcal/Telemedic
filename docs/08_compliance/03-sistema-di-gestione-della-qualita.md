---
title: Sistema di gestione della qualità
sidebar_position: 4
description: "Che cosa significa un sistema di gestione della qualità quando i contributori non sono dipendenti. ISO 13485 e IEC 62304 applicate a un progetto aperto, le procedure realmente necessarie, i record da produrre a ogni rilascio, la tracciabilità nelle due direzioni, la gestione dei componenti di terze parti e perché «latest» è vietato. Il sistema che il progetto esercita su sé stesso e il sistema che il soggetto fabbricante, da costituire, dovrà istituire ed esercitare."
---

# Sistema di gestione della qualità

> **Presupposto di lettura.** Che cosa siano una norma tecnica, una norma armonizzata, un sistema
> di gestione della qualità, il ciclo di vita del software e la tracciabilità è spiegato da zero
> in [10 §15 - Il quadro regolatorio da zero, §§5–6](../10_fondamenti/15-regolatorio-da-zero.md).
> **Qui non si ripete: si applica a un progetto aperto**, che è il caso su cui nessuna delle due
> norme è stata scritta.
>
> **Avvertenza di perimetro.** **Il prodotto non reca marcatura CE**, il progetto **non è oggi
> fabbricante** e **nessun sistema di gestione della qualità è certificato né in esercizio**
> (`D49`, come emendata da `D58`). È lo stato di fatto da cui il capitolo parte, e nessuna riga di
> ciò che segue lo attenua.
>
> Il progetto **intende** assumere il ruolo di fabbricante, e **il soggetto giuridico che lo
> eserciterebbe è ancora da costituire**.
>
> Ciò che descrive questo capitolo è: (a) il sistema che il progetto **esercita su sé stesso**,
> perché senza di esso il materiale che produce non sarebbe utilizzabile in alcun percorso di
> certificazione, **il nostro compreso**; (b) il sistema che **il soggetto fabbricante, da
> costituire, dovrà istituire, far certificare ed esercitare**, e che questo capitolo documenta
> come manuale operativo. Le due cose si sovrappongono largamente ma non coincidono, e ogni
> sezione dichiara di quale delle due parla.
>
> **Che cosa `D58` cambia qui, e che cosa no.** Cambia il **destinatario** del manuale: (b) non è
> più il piano di un soggetto esterno indefinito ma **il nostro piano**, e questo lo rende
> esigibile invece che illustrativo. **Non cambia la ripartizione tecnica**: istituire il sistema,
> farlo certificare da un organismo accreditato ed esercitarlo restano atti che presuppongono il
> **ruolo formale di fabbricante**, e non diventano anticipabili perché quel ruolo sarà nostro.
> **Non cambia** neppure il limite posto da `D54`: alcune registrazioni - audit interno, riesame
> del rilascio, verifica di configurazione eseguita da chi non ha scritto il codice - **richiedono
> persone distinte**, e nessuna quantità di lavoro individuale le rende producibili internamente
> (§ 4.1, prima avvertenza).
>
> **E il varco che questa avvertenza potrebbe aprire, chiuso qui.** Chi legge che il progetto
> intende istituire un sistema di gestione della qualità e ne conclude che il software sia già
> utilizzabile in un contesto clinico reale trae una conclusione **sbagliata**. Un sistema che
> non è in esercizio non produce alcuna registrazione, non copre alcun rilascio e non trasferisce
> alcun obbligo: chi installa o mette in servizio il software oggi li assume per intero, e
> l'intenzione dichiarata in questa pagina **non gliene toglie nessuno**.

## 1. La domanda che nessuna delle due norme si pone

ISO 13485 e IEC 62304 presuppongono, senza mai enunciarlo, un'organizzazione con dipendenti.
Parlano di «personale», di «responsabilità e autorità», di «competenza» documentata, di
«infrastruttura», di «riesame della direzione». Presuppongono che chi scrive il codice sia una
persona sulla quale l'organizzazione ha un potere di direzione e un obbligo di formazione.

In un progetto aperto **niente di tutto questo è vero** per la maggior parte di chi tocca il
codice. Un contributore non è assunto, non è formabile, non è valutabile a priori, non firma un
mansionario e può sparire fra una proposta di modifica e la successiva. La domanda non è
retorica: *chi risponde della progettazione di codice scritto da persone che non si controllano?*

**La risposta non è giuridica, è di processo, ed è una sola:** il controllo della progettazione
**non sta nella scrittura, sta nell'accettazione**.

> Una proposta di modifica è una **proposta**. L'accettazione è un **atto di progettazione**,
> compiuto da una persona identificata, competente e responsabile. Il contributore propone; chi
> unisce progetta.

Questo sposta l'intero problema dal reclutamento al **controllo in ingresso**, che è terreno noto
alle norme: ISO 13485 § 7.4 disciplina l'approvvigionamento e il controllo dei fornitori, e
l'art. 10, paragrafo 9, lettera d), dell'MDR nomina espressamente «la gestione delle risorse,
compresa la selezione e il controllo dei fornitori e dei subfornitori». Un contributore esterno
non è formalmente un fornitore, ma **il codice che propone è materiale in ingresso**, e come tale
si tratta.

### 1.1 I meccanismi, e la clausola che ciascuno soddisfa

Nessuno di questi meccanismi è stato inventato per la conformità: esistono già in un progetto
aperto ben tenuto. Ciò che manca, e che va aggiunto, è **la procedura che spiega a un auditor
perché soddisfano la clausola**.

| Meccanismo | Funzione regolatoria | Clausola |
|---|---|---|
| **Attestazione di origine obbligatoria** su ogni contributo, verificata automaticamente | Catena di provenienza dei diritti e **tracciabilità nominativa dell'autore** dentro l'elemento di configurazione | IEC 62304 § 8; ISO 13485 § 7.5.8 |
| **Proprietari del codice dichiarati** e revisione obbligatoria da parte loro | Il controllo della progettazione resta in capo a chi rilascia. È **l'atto di accettazione**, e ha un nome e una data | ISO 13485 §§ 7.3.4, 7.3.9 |
| **Protezione dei rami, firma delle modifiche, unione solo tramite proposta** | Integrità e non ripudio del ciclo di vita; impossibilità di introdurre codice fuori dal processo | ISO 13485 § 4.2.5; IEC 62304 § 8.2 |
| **Elenco nominativo dei revisori qualificati per area**, con il dossier di competenza di ciascuno | È il **registro di competenza** richiesto dalla norma. Riguarda **chi approva**, non chi propone: è la traduzione corretta della clausola in questo contesto | ISO 13485 § 6.2 |
| **Tracciabilità obbligatoria su ogni proposta** che tocchi codice di prodotto | Collegamento requisito → modifica → prova, costruito mentre si lavora | IEC 62304 § 5.1.1; § 7 di questo capitolo |
| **Verifiche automatiche bloccanti** in integrazione continua | Evidenza ripetibile e datata di verifica, con l'identificazione della versione su cui è stata eseguita | IEC 62304 §§ 5.5–5.7 |
| **Distinta dei materiali generata a ogni costruzione** | Identificazione univoca dei componenti di terze parti | IEC 62304 § 8.1.2 |

**La riga sulla competenza è quella che va spiegata, perché è l'unica interpretativa.** La norma
chiede che il personale che esegue attività che influenzano la qualità del prodotto sia
competente, e che la competenza sia documentata. In un progetto aperto la traduzione corretta non
è «documentare la competenza di tutti i contributori» - che è impossibile e privo di senso - ma
**documentare la competenza di chi ha l'autorità di accettare**. Chi propone non ha autorità;
chi accetta ce l'ha, ed è un insieme piccolo, stabile e documentabile.

**Il punto su cui questa costruzione è fragile, e va detto:** funziona finché l'insieme di chi
accetta è piccolo e stabile. Un progetto che, per accelerare, allarghi l'insieme dei revisori
senza aggiornare i dossier di competenza **perde la proprietà nel momento esatto in cui lo fa**, e
la perde in modo non ricostruibile a posteriori - perché l'evidenza mancante è la qualifica di chi
ha approvato una modifica in una data passata.

### 1.2 La domanda che l'organismo notificato porrà per prima

È nota in anticipo, e conviene avere la risposta scritta prima che sia posta:

> *Come si garantisce che l'artefatto certificato corrisponda esattamente a un sorgente
> controllato, dato che il repository accetta contributi esterni?*

La risposta documentale ha cinque elementi, e nessuno è sostituibile dagli altri: **costruzione
riproducibile**, **firma degli artefatti**, **elenco delle modifiche incluse nel rilascio**,
**revisione obbligatoria con revisori nominati e qualificati**, **attestazione di origine**.
Insieme dimostrano che fra il sorgente sottoposto a controllo e il binario distribuito non esiste
uno spazio in cui qualcosa possa essere entrato senza traccia.

## 2. ISO 13485 non è l'MDR, e la confusione costa

**Errore concettuale da rimuovere all'inizio.** Il certificato ISO 13485 **non vale** come
certificato ai sensi del regolamento sui dispositivi medici. L'organismo notificato valuta il
sistema di gestione della qualità **contro i requisiti dell'art. 10, paragrafo 9, e dell'Allegato
IX**, non contro la ISO 13485. Il certificato riduce l'attrito e accorcia l'audit; non lo
sostituisce.

**Che cosa chiede l'art. 10, paragrafo 9.** Un sistema che assicuri la conformità «nel modo più
efficace e proporzionato alla classe di rischio e al tipo di dispositivo», e che affronti almeno:
la strategia di conformità regolamentare comprese le procedure di valutazione della conformità e
di gestione delle modifiche; l'identificazione dei requisiti generali di sicurezza e prestazione
applicabili; la responsabilità della direzione; la gestione delle risorse compresa la selezione e
il controllo dei fornitori; la gestione del rischio; la valutazione clinica e il suo seguito
post-commercializzazione; la realizzazione del prodotto; la verifica dell'attribuzione
dell'identificativo unico; la sorveglianza post-commercializzazione; la comunicazione con autorità
e organismi notificati; la segnalazione di incidenti gravi e azioni correttive di sicurezza; la
gestione delle azioni correttive e preventive e il monitoraggio della loro efficacia; i processi di
monitoraggio e misurazione, l'analisi dei dati e il miglioramento.

**Che cosa ISO 13485 non copre.** È una norma **armonizzata** sotto l'MDR - il riferimento è
pubblicato nell'allegato di una decisione di esecuzione della Commissione, più volte modificata -
e la sua applicazione conferisce **presunzione di conformità** per i requisiti coperti (art. 8
MDR). **Ma la copertura non è totale**: ISO 13485 non copre di per sé la valutazione clinica
dell'art. 61, la sorveglianza post-commercializzazione nella forma degli artt. 83–86, né gli
obblighi di vigilanza degli artt. 87–92. Occorrono procedure aggiuntive, ed è il blocco B del § 4.

**`[NV]`** - lo stato di armonizzazione va verificato sull'elenco consolidato pubblicato dalla
Commissione **alla data d'uso**, non a memoria, da `COMP`: l'elenco è modificato con frequenza, e
una presunzione di conformità invocata su una versione non più citata è una presunzione che non
opera.

## 3. Il sistema di gestione della qualità come codice

Il rischio tipico della realtà piccola non è un sistema insufficiente: è un sistema **troppo
grande per essere rispettato**. Le non conformità in audit nascono quasi sempre dallo scarto fra
procedura scritta e prassi reale, non da procedure mancanti. Da cui la regola pratica, che vale
più di qualunque modello: **se una procedura descrive un'attività che non si intende svolgere
davvero ogni volta, va riscritta, non aggirata.**

### 3.1 Perché il repository è il posto giusto

Un sistema di gestione della qualità tenuto come documentazione versionata nel repository -
procedure sotto controllo di versione, approvazione tramite proposta di modifica con revisori
nominati, immutabilità garantita dalla protezione dei rami e dalla firma delle modifiche -
soddisfa le clausole 4.2.4 (controllo dei documenti) e 4.2.5 (controllo delle registrazioni)
**in modo più robusto di un archivio di documenti su un'unità condivisa**, per una ragione
semplice: la cronologia non è alterabile senza traccia e l'approvazione è un fatto verificabile,
non una firma su un foglio.

Perché questo regga davanti a un auditor servono però due cose che non vengono gratis:

1. **una procedura che spieghi la corrispondenza.** L'auditor cerca «chi ha approvato, quando, e
   qual era la revisione approvata». Va scritto, in una procedura, che l'approvazione è la
   revisione favorevole di un proprietario di codice designato, che la data è quella dell'unione,
   e che la revisione approvata è identificata dall'impronta della modifica. Senza questo
   documento, l'auditor non ha modo di sapere che cosa sta guardando;
2. **la validazione degli strumenti**, § 3.2.

### 3.2 La trappola: gli strumenti che gestiscono la qualità sono software da validare

La clausola 4.1.6 di ISO 13485 richiede la **validazione delle applicazioni software utilizzate
nel sistema di gestione della qualità**, con un approccio proporzionato al rischio associato al
loro uso. È la clausola che i progetti tecnici sottovalutano più spesso, e nel caso di un sistema
tenuto come codice ha un perimetro ampio e preciso:

| Strumento | Perché ricade nella clausola |
|---|---|
| La catena di costruzione e rilascio | Produce l'artefatto che sarà il dispositivo, e ne attesta la riproducibilità |
| Il sistema di verifica automatica che blocca l'unione | È il meccanismo con cui si dimostra che una verifica è stata eseguita |
| Il generatore della matrice di tracciabilità | Produce un artefatto del fascicolo tecnico |
| Il generatore della distinta dei materiali | Produce l'evidenza della clausola 8.1.2 di IEC 62304 |
| Il gestore delle segnalazioni e delle proposte di modifica | Contiene le registrazioni di riesame di progettazione e di risoluzione dei problemi |
| Il generatore del sito di documentazione | Produce le istruzioni per l'uso, se sono pubblicate in quella forma |

**Che cosa significa validare, in pratica.** Non «dimostrare che lo strumento è corretto», che è
impossibile. Significa: definire l'uso previsto dello strumento nel sistema, individuare che cosa
accadrebbe se lo strumento sbagliasse, definire e **eseguire** prove che dimostrino che nell'uso
previsto lo strumento fa ciò che deve - per esempio, che una modifica priva di tracciabilità
**viene effettivamente rifiutata**, e non solo segnalata -, e registrarne l'esito con la versione
esatta dello strumento. La prova negativa vale più di quella positiva: si valida un blocco
dimostrando che blocca.

### 3.3 Le esclusioni, e perché vanno motivate una per una

Un fabbricante di software senza produzione fisica esclude tipicamente dal perimetro le clausole
su controllo della contaminazione, pulizia del prodotto, requisiti particolari per i dispositivi
sterili, validazione dei processi di sterilizzazione e controllo dei dispositivi di misurazione.

**Ogni esclusione va motivata per iscritto**, e la motivazione generica viene contestata. «Non
applicabile perché siamo software» non è una motivazione: lo è «il prodotto non ha
rappresentazione fisica, non è confezionato, non è trasportato e non entra in contatto con il
paziente o con materiale biologico; non esiste quindi processo di pulizia da controllare».

Una delle esclusioni abituali **va invece riconsiderata**, ed è il motivo per cui questa sezione
esiste: il controllo dei dispositivi di misurazione. Se la posizione sulla **funzione di misura**
(questione [`Q-173`](../11_registri/02-questioni-aperte.md#q-173), [02 §12](./02-qualificazione-e-classificazione.md)) dovesse concludere che la
presentazione di parametri costituisce funzione di misura, l'esclusione cade e con essa cade la
motivazione già scritta. È un esempio di come una questione aperta apparentemente marginale abbia
effetti a distanza sul perimetro del sistema.

## 4. Le procedure realmente necessarie

Tre blocchi. Il primo è imposto da ISO 13485, il secondo dall'MDR e non è coperto dal primo, il
terzo dalle norme di ciclo di vita del software.

**Blocco A - richieste da ISO 13485:2016.** Controllo dei documenti (4.2.4) · Controllo delle
registrazioni (4.2.5) · Riesame della direzione (5.6.1) · Risorse umane, competenza, formazione
(6.2) · Infrastruttura e ambiente di lavoro (6.3, 6.4.1) · Gestione del rischio nella
realizzazione del prodotto (7.1) · Riesame dei requisiti del prodotto e comunicazione con il
cliente (7.2) · Progettazione e sviluppo (7.3.1–7.3.8) · Controllo delle modifiche di progettazione
(7.3.9) · Approvvigionamento e controllo dei fornitori (7.4) · Produzione ed erogazione,
identificazione e tracciabilità (7.5.1, 7.5.8, 7.5.9) · Validazione dei processi (7.5.6) ·
Installazione e assistenza (7.5.3, 7.5.4) · Riscontri dal campo (8.2.1) · Gestione dei reclami
(8.2.2) · Segnalazione alle autorità (8.2.3) · Audit interno (8.2.4) · Controllo del prodotto non
conforme (8.3) · Analisi dei dati (8.4) · Azioni correttive e preventive (8.5.2, 8.5.3) ·
Validazione del software usato nel sistema (4.1.6).

**Blocco B - imposte dall'MDR e non coperte da ISO 13485.** Strategia di conformità regolamentare
e gestione delle modifiche (art. 10, par. 9, lett. a) · Identificazione e mantenimento dei
requisiti generali applicabili (Allegato I) · Gestione del fascicolo tecnico (art. 10, par. 4,
Allegati II e III) · Valutazione clinica e suo seguito (art. 61, Allegato XIV) · Sorveglianza
post-commercializzazione e rapporto periodico (artt. 83–86, Allegato III) · Vigilanza, incidenti
gravi e azioni correttive di sicurezza (artt. 87–92) · Attribuzione e gestione dell'identificativo
unico e registrazioni (artt. 27, 29, 31) · Comunicazione con l'organismo notificato e con le
autorità (art. 10, par. 9, lett. l) · Rilascio del dispositivo e dichiarazione di conformità
(artt. 19, 20) · Ruolo, compiti e indipendenza della persona responsabile del rispetto della
normativa (art. 15).

**Blocco C - specifiche del software.** Ciclo di vita e classificazione di sicurezza (IEC 62304
§§ 4.3, 5) · Gestione dei componenti di terze parti (IEC 62304 §§ 5.3.3, 5.3.4, 7.1.2–7.1.3,
8.1.2) · Gestione della configurazione e costruzione riproducibile (IEC 62304 § 8) · Risoluzione
dei problemi software (IEC 62304 § 9) · Ingegneria dell'usabilità (IEC 62366-1 § 5) · Sicurezza
informatica nel ciclo di vita e divulgazione coordinata delle vulnerabilità (ISO/IEC 81001-5-1;
MDCG 2019-16 Rev.1).

**Totale: circa trentasei procedure.** Per una realtà piccola è realistico accorparne alcune -
risorse umane con infrastruttura, produzione con validazione dei processi e assistenza, analisi
dei dati con azioni correttive - scendendo a **venticinque o ventotto documenti**. **Non è
realistico scendere sotto venti**, e un sistema che ci riesce di solito ha semplicemente omesso il
blocco B.

### 4.1 Tre avvertenze sulla forma

**Prima.** L'audit interno **non può essere svolto da chi ha eseguito l'attività auditata**
(clausola 8.2.4). In una realtà piccola dove il rappresentante della direzione coincide con la
persona responsabile del rispetto della normativa, la conseguenza pratica è una sola: **l'audit
interno va commissionato all'esterno.** Non è un'opzione di qualità, è una condizione di validità.

**Seconda.** Il sistema deve **girare per almeno un ciclo completo prima dell'audit di
certificazione**: registrazioni reali di progettazione e sviluppo, almeno un riesame di
progettazione, almeno un'azione correttiva, almeno un rilascio controllato, un audit interno su
tutti i processi e un riesame della direzione. Senza questi, la seconda fase dell'audit non è
superabile - non perché l'auditor sia severo, ma perché **non c'è nulla da auditare**. Ne discende
che la data di avvio dell'esercizio determina, con circa sei mesi di scarto, la prima data utile
per la certificazione. **Da `D58` discende che quella data di avvio è una decisione nostra, non
un'attesa**: è un ritardo che il progetto si infligge da solo se non avvia l'esercizio. Ciò non
autorizza a scrivere da nessuna parte una data di marcatura - [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) lo vieta senza eccezioni, e
una pianificazione interna non diventa una promessa perché è nostra - ma sposta il costo del
rinvio dal conto di un terzo al nostro.

**Terza - e riguarda quest'area direttamente.** Le procedure sono **documenti controllati**; la
documentazione pubblicata in queste pagine **non lo è**. È il vincolo [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174): nessun capitolo di
questa documentazione è una procedura del sistema di gestione della qualità, e nessuna area può
presentare un proprio capitolo come tale. I capitoli sono **ingressi**: contengono l'analisi da
cui una procedura si scrive, non la procedura.

## 5. Gli identificativi dei documenti regolatori

Il progetto adotta uno spazio di identificativi per i documenti regolatori, distinto da quello dei
requisiti (`RF-*`, `RNF-*`, `BR-*`, congelati da [`V-120`](../11_registri/01-vincoli-in-vigore.md#v-120)) e da quello dei documenti di decisione
architetturale. **Questo spazio è dichiarato qui e vale come vincolo [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172):** nessuna area può
coniare un identificativo in questi prefissi senza dichiararlo in bacheca.

| Prefisso | Ambito |
|---|---|
| `MDR-*` | Documenti regolatori di prodotto: destinazione d'uso, classificazione, procedura di valutazione, fascicolo tecnico, matrice dei requisiti generali, etichettatura, istruzioni per l'uso, requisiti dell'ambiente operativo, configurazioni e varianti, siti e fornitori, identificativo unico |
| `QMS-*` | Manuale, procedure e registrazioni del sistema di gestione della qualità |
| `SW-*` | Documentazione di ciclo di vita del software ai sensi di IEC 62304 |
| `RM-*` | Gestione del rischio ai sensi di ISO 14971: piano, file, rapporto |
| `UE-*`, `UEF-*` | Ingegneria dell'usabilità ai sensi di IEC 62366-1 |
| `CE-*`, `PMCF-*` | Valutazione clinica e suo seguito post-commercializzazione |
| `PMS-*`, `PSUR-*`, `VIG-*` | Sorveglianza post-commercializzazione e vigilanza |
| `ON-*` | Rapporti con l'organismo notificato: screening, richieste di informazioni, selezione |

**Una collisione va risolta ora, perché produrrebbe danni in una matrice di tracciabilità.** Il
catalogo dei requisiti di sicurezza prodotto in fase di ricerca usa identificativi nella forma
`SEC-nnn`. I documenti di sicurezza del ciclo di vita usano invece forme come `SEC-LC-*`,
`SEC-TM-*`, `SEC-RMF-*`, `SEC-PT-*`. **Regola: i documenti regolatori di sicurezza portano sempre
un sotto-prefisso alfabetico; la forma `SEC-` seguita da sole cifre è riservata ai requisiti e non
va mai usata per un documento.**

## 6. IEC 62304: la classe di sicurezza e ciò che ne discende

### 6.1 La determinazione

La classe dipende dal danno possibile **dopo** l'applicazione delle misure di controllo del
rischio **esterne al sistema software**. Il ragionamento e la conclusione sono già riassunti in
[02 §11](./02-qualificazione-e-classificazione.md); qui la determinazione item per item, che è ciò
che va nel documento.

| Item software | Classe | Motivazione |
|---|:-:|---|
| Acquisizione, trasmissione, persistenza e presentazione dei parametri; evidenziazione dei valori fuori dalla soglia configurata | **B** | Le misure esterne - destinazione d'uso ristretta, revisione periodica programmata, presenza organizzativa del Centro erogatore, istruzione al paziente sull'emergenza - riducono il danno possibile a **non grave**. **Se anche una sola non fosse documentabile e verificabile, l'item passa a C** |
| Associazione fra identità dell'assistito, sessione, dati e documento clinico | **B**, trattato come rischio prioritario | La mis-associazione persona-dato è la situazione pericolosa peggiore dell'architettura. Resta B **solo** perché il professionista verifica l'identità in apertura di sessione: la verifica va **imposta dall'interfaccia**, non lasciata all'abitudine |
| Trasporto del media, segnalazione, attraversamento della rete, indicatori di qualità | **B** | Un guasto produce interruzione o degrado; il professionista interrompe e riprogramma. L'esito è un contatto non concluso, non un dato falso |
| Redazione, firma e trasmissione del contenuto clinico | **B** | La perdita o l'alterazione di un documento ritarda decisioni; la firma e la conferma esplicita sono controlli |
| Identità, autorizzazioni, isolamento fra tenant, registro immutabile | **B** | Divulgazione non autorizzata: danno alla persona possibile, non grave sul piano fisico |
| Metriche di qualità, cruscotti, telemetria tecnica | **A** | Nessun contributo a una situazione pericolosa clinica, **previa segregazione documentata** |
| Interfaccia informativa, documentazione, internazionalizzazione, portale pubblico | **A** | - |

**Classe dichiarata del sistema software: B**, con item di classe A isolati e **segregazione
documentata** ai sensi della clausola 5.3.5. La norma richiede che l'architettura **dimostri
l'efficacia della segregazione**, non che la affermi: un'affermazione di segregazione non
accompagnata dal meccanismo che la realizza - confine di processo, confine di rete, assenza di
percorso di dati - è un rilievo garantito.

**Avvertenza da mettere per iscritto nel documento di determinazione, e non in nota.** La classe B
è **condizionata** alle esclusioni della destinazione d'uso. Introdurre una funzione di allarme, un
punteggio calcolato, una soglia definita dal sistema o l'estensione a pazienti instabili **riporta
la determinazione a C**, con l'obbligo della progettazione dettagliata a livello di unità
(clausola 5.4) e della verifica di ogni unità. **È una decisione architetturale, non una scelta di
prodotto**, ed è il motivo per cui il vincolo [`V-170`](../11_registri/01-vincoli-in-vigore.md#v-170) esiste.

### 6.2 Che cosa cambia in classe B, e quanto costa davvero

Rispetto alla classe A diventano obbligatori: la **progettazione architetturale** (5.3),
l'**implementazione e verifica delle unità** (5.5), l'**integrazione e i test di integrazione**
(5.6), il **test del sistema software** (5.7), e la versione piena dei processi di manutenzione
(6), gestione del rischio software (7) e risoluzione dei problemi (9). Resta esclusa la sola
progettazione dettagliata a livello di unità (5.4), obbligatoria in classe C.

**Il costo incrementale non è tecnico: è documentale.** Il progetto prevede già copertura di prova
elevata ed enforced, prove di integrazione, prove da capo a capo, prove di qualità del media,
analisi statica e dinamica di sicurezza e tracciabilità (`D10`). Ciò che manca è di natura diversa:

| Manca | Perché non è sostituibile da ciò che esiste |
|---|---|
| Piano di sviluppo software approvato **prima** | Un piano scritto dopo descrive ciò che è accaduto, non ciò che era previsto. La norma chiede il secondo |
| **Criteri di accettazione delle unità definiti prima** | «Copertura ≥ 80%» è una soglia, non un criterio di accettazione. Il criterio dice che cosa deve essere vero perché l'unità sia accettata |
| Verbali di **riesame architetturale** | Una decisione architetturale discussa e non verbalizzata, per la norma, non è stata riesaminata |
| Rapporti di verifica **firmati e datati**, con chi ha eseguito e **su quale versione** | Un esito di verifica automatica senza la versione dell'oggetto verificato non è tracciabile a un rilascio |
| **Matrice di tracciabilità come artefatto di rilascio** | Una matrice ricostruibile su richiesta non è una matrice: § 7 |

## 7. La tracciabilità

È la sola cosa di questo capitolo che **si perde per sempre** se non la si costruisce mentre si
lavora, ed è per questo che `D45` la colloca fra le attività retroattivamente irrecuperabili.

### 7.1 Che cosa deve collegare

La catena richiesta non è «requisito → prova». È più lunga e ha un anello che si dimentica sempre:

```
requisito → elemento architetturale → unità → prova → esito
   ↑                                                    ↓
rischio  →  misura di controllo  →  verifica dell'efficacia della misura
```

L'anello dimenticato è l'ultimo: **la verifica che la misura di controllo del rischio sia
efficace**, non che sia stata implementata. Sono cose diverse. «Il campo soglia è obbligatorio» è
implementazione; «una prova dimostra che un piano non si attiva con il campo soglia vuoto» è
verifica dell'efficacia. La clausola 7.3.3 di IEC 62304 chiede la seconda.

### 7.2 Perché in entrambe le direzioni

In avanti, per dimostrare che **ogni requisito è stato verificato**. All'indietro, per dimostrare
che **ogni riga di codice risponde a un requisito**. La direzione all'indietro è quella che
sorprende: serve a dimostrare l'assenza di funzionalità non richiesta, che in un dispositivo
medico non è codice inutile - è **funzionalità non valutata nel rischio, non descritta nella
destinazione d'uso e non verificata**. È, letteralmente, il meccanismo con cui una delle funzioni
del § 6.1 del capitolo precedente entrerebbe nel prodotto senza che nessuno lo dichiari.

### 7.3 Perché si perde e non si recupera

Se gli identificativi di requisito cambiano, la matrice va ricostruita a mano. Se le proposte di
modifica non citano il requisito, il collegamento fra una modifica e la sua ragione va ricostruito
leggendo il codice, che è un'operazione **interpretativa**: chi la compie sta dichiarando a
posteriori che cosa qualcuno intendeva fare, e l'organismo notificato non ha motivo di crederci.

Da qui i due presidi, entrambi già in vigore:

1. **gli identificativi sono congelati** e non si rinumerano mai ([`V-120`](../11_registri/01-vincoli-in-vigore.md#v-120));
2. **la matrice è generata**, non redatta. Una matrice mantenuta a mano diverge dal codice al
   terzo rilascio; una matrice generata dai riferimenti nelle modifiche e nelle prove è vera per
   costruzione, e la sua generazione **fallisce** quando un riferimento manca.

## 8. I record da produrre a ogni rilascio

È la domanda più concreta che un gruppo di sviluppo pone, e la risposta è un elenco chiuso. Un
rilascio della distribuzione destinata alla certificazione **non è completo** se manca uno di
questi elementi, e il criterio non è di stile: ciascuno è richiesto da una clausola.

| # | Record | Fonte | Generato o redatto |
|---|---|---|---|
| 1 | **Registro dello stato di configurazione**: elenco esatto degli elementi e delle loro versioni che compongono il rilascio | IEC 62304 § 8.3 | Generato |
| 2 | **Elenco delle modifiche incluse**, con riferimento al requisito o alla segnalazione che ciascuna soddisfa | IEC 62304 §§ 8.2, 9 | Generato |
| 3 | **Matrice di tracciabilità** nello stato corrispondente al rilascio | IEC 62304 §§ 5.1.1, 7.3.3 | Generato |
| 4 | **Rapporto di verifica e validazione** con esito, ambiente, versione dell'oggetto verificato, e **anomalie residue con la loro valutazione** | IEC 62304 §§ 5.5–5.8 | Generato + redatto |
| 5 | **Distinta dei materiali** firmata, per ciascun artefatto costruito | IEC 62304 § 8.1.2; disciplina sulla resilienza; DM 19 novembre 2025, All. 4 | Generato |
| 6 | **Valutazione dell'impatto sulla sicurezza degli aggiornamenti** dei componenti di terze parti inclusi | IEC 62304 § 6; § 9.4 di questo capitolo | Redatto |
| 7 | **Esito delle verifiche automatiche di sicurezza** e stato delle vulnerabilità note aperte, con la decisione motivata su ciascuna | ISO/IEC 81001-5-1; disciplina sulla resilienza | Generato + redatto |
| 8 | **Attestazione di riproducibilità della costruzione** e **firma degli artefatti** | Allegato II, sez. 3, MDR; § 1.2 | Generato |
| 9 | **Aggiornamento del file di rischio** dove il rilascio tocca una misura di controllo | ISO 14971 | Redatto |
| 10 | **Dichiarazione di rilascio**: verifica del completamento delle attività previste, anomalie residue accettate, archiviazione | IEC 62304 § 5.8 | Redatto |

**Le due righe che si dimenticano sono la 4 e la 6**, e vale la pena dire perché.

La 4: **le anomalie residue non si nascondono, si valutano**. La norma non impone di rilasciare
senza difetti - sarebbe una condizione irrealizzabile -: impone di **elencare i difetti noti al
momento del rilascio e di documentare la valutazione della loro rilevanza per la sicurezza**. Un
rilascio senza elenco di anomalie residue non è un rilascio pulito: è un rilascio non documentato.

La 6: è **il punto su cui l'organismo notificato insiste di più negli audit di sorveglianza**.
Aggiornare una dipendenza è, per un progetto software, un'operazione di routine; per la norma è
una modifica al prodotto, e ogni modifica va valutata per il suo impatto sulla sicurezza **prima**
di entrare in un rilascio certificato.

## 9. Componenti di terze parti

### 9.1 Perché è il capitolo più oneroso

Uno stack applicativo moderno con framework di back end e front end, prodotto di federazione delle
identità, base dati con estensione per serie temporali, broker di eventi, nodo di relay e immagini
di contenitore genera facilmente **oltre millecinquecento dipendenze transitive**. Trattarle tutte
con lo stesso rigore è impossibile **e non è richiesto**. Ciò che è richiesto è: identificarle
tutte univocamente (clausola 8.1.2), e trattare con rigore proporzionale quelle che contano.

### 9.2 I tre livelli

| Livello | Criterio di appartenenza | Trattamento |
|---|---|---|
| **L1 - critici** | Il componente realizza o supporta direttamente una misura di controllo del rischio, oppure un suo guasto può contribuire a una situazione pericolosa: libreria crittografica, pila del media in tempo reale, nodo di relay, prodotto di federazione, motore e driver della base dati, libreria del modello di interscambio clinico, libreria di firma, quadro di autorizzazione, ambiente di esecuzione | Scheda completa: produttore, **versione esatta**, funzione svolta, **requisiti funzionali e prestazionali attesi** (5.3.3), **requisiti dell'ambiente di esecuzione** (5.3.4), valutazione delle anomalie pubblicate (7.1.2–7.1.3), fonte di avvisi sorvegliata, criterio e cadenza di aggiornamento, valutazione dell'impatto di **ogni** aggiornamento |
| **L2 - di piattaforma** | Componenti d'infrastruttura non direttamente coinvolti in misure di controllo | Scheda ridotta: identificazione, versione, funzione, fonte di avvisi, politica di aggiornamento. Nessuna analisi funzionale individuale |
| **L3 - transitive** | Tutto il resto | **Copertura mediante distinta dei materiali** generata a ogni costruzione, firmata, allegata al rilascio, con verifica automatica bloccante sulle vulnerabilità note. È l'attuazione della clausola 8.1.2 su migliaia di componenti |

**Il registro non si redige: si genera dalla distinta e si arricchisce.** La distinta contiene nome,
produttore e versione; non contiene funzione nel sistema, alternativa nota, impatto sul rischio,
livello di servizio di aggiornamento e data di riesame. Questi cinque campi vivono in un file di
annotazioni versionato, e **la costruzione fallisce se un componente compare nella distinta e non
nelle annotazioni**: è il meccanismo che impedisce l'ingresso di una dipendenza non valutata, ed è
già stabilito dall'area tecnica come esito della questione [`Q-17`](../11_registri/02-questioni-aperte.md#q-17).

### 9.3 Perché `latest` è vietato

Non è una preferenza operativa e non è una questione di riproducibilità delle costruzioni, benché
lo sia anche. È **una violazione diretta di una clausola normativa**.

La clausola 8.1.2 di IEC 62304 richiede che ciascun elemento di configurazione - inclusi i
componenti di terze parti - sia identificato univocamente per **titolo, produttore e versione**.
Un riferimento a un'etichetta mobile:

1. **non identifica una versione**: identifica una versione diversa a ogni costruzione;
2. rende **non riproducibile** l'artefatto certificato, e quindi indimostrabile la corrispondenza
   fra il sorgente controllato e il binario distribuito (§ 1.2);
3. rende **impossibile** la valutazione dell'impatto sulla sicurezza dell'aggiornamento richiesta
   dalla clausola 6, perché l'aggiornamento avviene senza che nessuno lo decida;
4. rende **falsa** la distinta dei materiali del rilascio precedente, perché descrive una
   composizione che una nuova costruzione non riprodurrebbe.

**La conseguenza pratica è la regola più semplice dell'intero capitolo, e la più violata:** ogni
dipendenza, ogni immagine di base, ogni strumento della catena di costruzione porta una versione
esatta, e l'aggiornamento è **un atto, con una data, una motivazione e una valutazione**. Il
vincolo [`V-173`](../11_registri/01-vincoli-in-vigore.md#v-173) lo rende bloccante.

### 9.4 Sorveglianza e finestre di rimedio

La clausola 7.1.2 richiede di **valutare** ogni anomalia pubblicata rilevante per il componente,
non di correggerla sempre. **La decisione motivata di non aggiornare è ammessa se documentata**, ed
è spesso la decisione giusta: un aggiornamento non valutato introduce più rischio di quanto ne
tolga.

**Questa sezione risponde alla questione [`Q-113`](../11_registri/02-questioni-aperte.md#q-113)**, aperta dall'area tecnica, che chiedeva un
livello di servizio di aggiornamento espresso in giorni dalla pubblicazione dell'avviso e
differenziato per gravità.

| Gravità | Finestra dalla pubblicazione dell'avviso, per i componenti L1 | Nota |
|---|---|---|
| **Critica, con sfruttamento noto** | **72 ore** per il rilascio correttivo | Coerente con l'obbligo di segnalazione delle vulnerabilità attivamente sfruttate, che decorre dall'11 settembre 2026 |
| **Critica** | **7 giorni** | |
| **Alta** | **15 giorni** | |
| **Media** | **prossimo rilascio programmato** | Con dichiarazione della data prevista |
| **Bassa** | valutazione registrata, nessun impegno di data | La valutazione è comunque dovuta: è la clausola 7.1.2 |

**Due precisazioni che rendono questi numeri usabili invece che decorativi.**

**Prima - l'orologio parte dalla pubblicazione dell'avviso, non dalla conoscenza.** Un impegno che
decorra dalla conoscenza è un impegno che il fornitore controlla, e come tale privo di valore per
il cliente.

**Seconda, e va detta perché la confusione è frequente: queste finestre non hanno nulla a che
vedere con i livelli di servizio di manutenzione correttiva del DM 21 settembre 2022**, che
riguardano la presa in carico e il ripristino di un **incidente in esercizio** con tempi
dell'ordine di decine di minuti. Sono due orologi diversi, con due oggetti diversi - il difetto di
un componente contro l'indisponibilità di un servizio - e due destinatari diversi. Fonderli
produce un impegno che nessun fornitore può mantenere: nessuno corregge una vulnerabilità di una
libreria in sessanta minuti.

**Un dato di realtà che giustifica la scelta di esprimere le finestre in giorni e non in mesi.**
Un solo componente critico dell'architettura - il nodo di relay - ha avuto **quattordici rilasci
in poco più di sette mesi, cinque nel solo mese di agosto 2026**, con una vulnerabilità critica
corretta a metà percorso. Un impegno espresso in mesi, su un componente con questa cadenza, non
descrive alcun comportamento.

**Ciò che resta fuori da questa sezione e appartiene al committente:** il **periodo di supporto
dichiarato** per ciascun rilascio maggiore, minimo cinque anni secondo la disciplina sulla
resilienza. È la questione [`Q-155`](../11_registri/02-questioni-aperte.md#q-155), e finché è aperta **il progetto non può pubblicare una data di
fine supporto**, che è però un elemento obbligatorio della documentazione richiesta dai clienti e
dalla norma sulla sicurezza del ciclo di vita.

### 9.5 Il regime di licenza di un componente non è un dettaglio del componente

**Questa sezione risponde alla questione [`Q-112`](../11_registri/02-questioni-aperte.md#q-112)**, aperta dall'area tecnica sull'estensione per
serie temporali, le cui funzionalità avanzate risulterebbero distribuite non sotto licenza open
source approvata ma sotto una licenza propria di tipo sorgente disponibile, con restrizioni
sull'offerta come servizio gestito a terzi.

**Che cosa quest'area può stabilire senza leggere la licenza.**

1. **Il progetto non ridistribuisce il componente**, che è acquisito da chi installa come parte
   dell'infrastruttura. Ne discende che **la restrizione, quale che sia, non grava sul progetto**:
   grava su chi distribuisce e su chi offre il servizio.
2. **Ne discende un obbligo del progetto**, che è documentale e non è facoltativo: la
   documentazione destinata a chi installa deve dichiarare **quali componenti dell'infrastruttura
   di riferimento hanno un regime di licenza che limita l'offerta come servizio gestito**, perché
   è precisamente il modello di erogazione dell'integratore archetipico. Un integratore che scopra
   la restrizione dopo l'avvio del servizio ha un problema che il progetto poteva evitargli con
   una riga.
3. **Il ripiego esiste ed è provato**: il partizionamento dichiarativo nativo, verificato in
   integrazione continua. La sua esistenza va dichiarata **insieme** alla restrizione, altrimenti
   la restrizione si legge come un difetto insuperabile.
4. **Il principio generale che governa il caso** è quello già fissato da `D34`: la licenza
   apposta su un contenitore **non dispone dei diritti di terzi sul contenuto ricompreso**, e la
   verifica va fatta **artefatto per artefatto**.

**`[NV]`** - la lettura del testo della licenza primaria, artefatto per artefatto e versione per
versione, **non è stata compiuta** da `COMP` e quest'area non la sostituisce con una ricostruzione.
Finché non è compiuta, nessun documento del progetto può affermare né che il componente sia open
source né che non lo sia. La questione resta quindi aperta nella sua parte di verifica.

### 9.6 Le scale e i questionari clinici hanno licenze proprie

**Questa sezione risponde parzialmente alla questione [`Q-11`](../11_registri/02-questioni-aperte.md#q-11)**, aperta dall'area della guida, che
chiedeva di estendere formalmente la politica sulle terminologie a scale e punteggi **prima** di
scrivere il primo motore di calcolo.

**Esito: la richiesta è accolta, e l'estensione è formulata così.**

> **Una scala clinica validata, un questionario strutturato per la raccolta di esiti riferiti dal
> paziente e il relativo algoritmo di punteggio sono, ai fini della politica di licenza, oggetti
> della stessa natura di un sistema di codifica**: hanno un titolare dei diritti, una licenza, una
> versione, condizioni d'uso che possono differenziare l'uso clinico da quello di ricerca e da
> quello commerciale, e talvolta condizioni sulla **traduzione**, che è un'opera derivata.
> Ricadono quindi nei quattro regimi già stabiliti da `D31`, e **la collocazione va accertata
> prima dell'inserimento**, non dopo.

Ne discendono tre regole operative:

1. **Nessun testo di item, nessuna tabella di punteggio e nessuna soglia di interpretazione di una
   scala entra nel repository prima che il suo regime sia accertato e dichiarato**;
2. **la definizione della scala è un dato, non codice**: come per i percorsi di cura ([`V-147`](../11_registri/01-vincoli-in-vigore.md#v-147)),
   aggiungere una scala non deve richiedere un rilascio del software. Ne discende anche che una
   scala il cui regime lo richieda può essere **acquisita a runtime da chi installa**, che è il
   regime C;
3. **il calcolo del punteggio va tenuto distinto dalla sua interpretazione.** La somma degli item
   secondo una regola dichiarata è aritmetica tracciabile; l'attribuzione di una fascia di
   gravità è **interpretazione** e ricade nei confini del capitolo
   [02 §6](./02-qualificazione-e-classificazione.md).

**Ciò che resta aperto è la parte non delegabile a una regola:** l'accertamento del regime **scala
per scala**, che richiede la lettura delle condizioni del titolare dei diritti per ciascuna. Non è
stato compiuto per alcuna scala, e la questione resta aperta con questa precisazione.

### 9.7 Il progetto è a sua volta un componente di terze parti

È un rovesciamento di prospettiva che vale la pena rendere esplicito, perché cambia il senso
economico di tutto il capitolo.

Per l'integratore che assume il ruolo di fabbricante, **questo progetto è un componente di terze
parti**, e ricade nel suo livello L1. Deve quindi produrne la scheda: funzione svolta, requisiti
funzionali e prestazionali attesi, requisiti dell'ambiente di esecuzione, valutazione delle
anomalie pubblicate, criterio di aggiornamento.

**Pubblicare gli artefatti di ciclo di vita** - piano di sviluppo, specifica dei requisiti,
architettura, evidenze di verifica, distinta dei materiali firmata, dichiarazione di fine
supporto - **riduce in modo diretto e misurabile l'onere regolatorio di chi integra**. Non è un
costo puro sostenuto per virtù: è la differenza fra essere un componente qualificabile e essere
codice di provenienza ignota, che nel percorso di un fabbricante è una differenza di mesi.

**`D58` aggiunge un secondo destinatario, e non è un dettaglio.** Il rovesciamento di prospettiva
valeva finora verso l'esterno: chi integra, e assume il ruolo di fabbricante sulla propria
distribuzione, deve produrre la scheda di questo progetto come componente di terze parti. Da
`D58`, **la stessa scheda serve a noi**, perché il soggetto fabbricante da costituire dovrà
qualificare come componenti di terze parti tutte le dipendenze della propria distribuzione, e la
qualificazione **non si ricostruisce a posteriori**: è la seconda delle attività retroattivamente
irrecuperabili ([09 §5](./09-percorso-e-calendario.md)). Ciò che era un servizio reso a un terzo è
diventato **un adempimento nostro con una scadenza implicita**, e va trattato come tale.

## 10. Gli ingressi al file di rischio che quest'area registra

Il file di rischio (`RM-FILE-001`) **non esiste ancora**: è un deliverable del percorso, non di
questa documentazione, e la sua produzione richiede il piano di gestione del rischio con i criteri
di accettabilità che lo precede. Ma tre questioni della bacheca hanno prodotto **ingressi
identificati** che, se non registrati ora, andrebbero ricostruiti dopo.

**Questa sezione risponde alle questioni [`Q-13`](../11_registri/02-questioni-aperte.md#q-13) e [`Q-114`](../11_registri/02-questioni-aperte.md#q-114)** e recepisce l'esito di [`Q-12`](../11_registri/02-questioni-aperte.md#q-12).

| Origine | Ingresso | Che cosa va determinato nel file di rischio |
|---|---|---|
| [`Q-13`](../11_registri/02-questioni-aperte.md#q-13), area della guida | Due scenari d'uso pericolosi individuati nel modulo sulla sicurezza del paziente | Gravità e probabilità, che quest'area **non determina**: la stima richiede i criteri di accettabilità del piano |
| [`Q-12`](../11_registri/02-questioni-aperte.md#q-12), `FUNZ` | **Dieci scenari d'uso pericolosi del telemonitoraggio**, mappati con **il rischio introdotto dalla mitigazione** | Il rischio introdotto dalla mitigazione è l'elemento che ISO 14971 richiede espressamente e che si omette quasi sempre: va conservato nella forma in cui è stato prodotto |
| [`Q-114`](../11_registri/02-questioni-aperte.md#q-114), area tecnica | **Soglie di qualità e avviso al professionista**: al superamento della soglia di inidoneità il sistema informa e offre il rinvio | È **una misura di controllo del rischio**, non una funzione di comodità. Ne discende che va verificata nella sua efficacia, non solo implementata (§ 7.1) |
| [`Q-114`](../11_registri/02-questioni-aperte.md#q-114), area tecnica | **Obiettivo del buffer di variazione del ritardo**: abbassarlo riduce la latenza **al costo di un aumento della perdita udibile** | È un compromesso con conseguenza clinica: la scelta va registrata con la motivazione, non lasciata come parametro di configurazione |
| [`Q-114`](../11_registri/02-questioni-aperte.md#q-114), area tecnica | **Preferenza di degradazione** fra risoluzione e fluidità | La formulazione difendibile è **preferenza di resa scelta dall'utente**, mai adattamento automatico guidato dal contenuto clinico: in quest'ultima forma sarebbe elaborazione a fini clinici |

**La regola che questa sezione istituisce**, e che vale per tutte le aree: **un compromesso
tecnico con conseguenza clinica non si risolve in una configurazione. Si registra come voce del
file di rischio, con la sua alternativa scartata e la sua motivazione.** Un parametro
configurabile senza traccia della decisione è, per l'organismo notificato, una decisione mai presa.

## 11. Che cosa questo capitolo lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| [`Q-155`](../11_registri/02-questioni-aperte.md#q-155) | **Periodo di supporto dichiarato**, minimo cinque anni. Finché è aperta, il progetto non può pubblicare una data di fine supporto, che è però elemento obbligatorio della documentazione al cliente (§ 9.4) | → Committente |
| [`Q-11`](../11_registri/02-questioni-aperte.md#q-11) | Accertamento del regime di licenza **scala per scala**. La regola è stabilita (§ 9.6); l'accertamento non è stato compiuto per alcuna scala | Conformità, dominio |
| [`Q-112`](../11_registri/02-questioni-aperte.md#q-112) | Lettura del testo della licenza primaria del componente per serie temporali, artefatto per artefatto (§ 9.5) | Conformità, tecnica |
| [`Q-173`](../11_registri/02-questioni-aperte.md#q-173) | Se la presentazione di parametri costituisca funzione di misura: da essa dipende la validità di un'esclusione già motivata (§ 3.3) | Dominio, funzionale |
| [`Q-13`](../11_registri/02-questioni-aperte.md#q-13), [`Q-114`](../11_registri/02-questioni-aperte.md#q-114) | Gravità e probabilità degli ingressi registrati al § 10: determinabili **solo dopo** il piano di gestione del rischio con i criteri di accettabilità | Conformità, alla produzione del file di rischio |
| `[NV]` | Stato di armonizzazione di ISO 13485 e della norma sulla sicurezza del ciclo di vita, da verificare sull'elenco consolidato **alla data d'uso** (§ 2) | `COMP` |
| `[NV]` | Numerazione puntuale delle clausole di IEC 62304 e di ISO 13485 citate in questo capitolo: derivano dalla ricerca del progetto e vanno riverificate sul testo delle norme prima di comparire in un documento controllato | `COMP` |
