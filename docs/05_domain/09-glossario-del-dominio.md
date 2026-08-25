---
title: Glossario del dominio
sidebar_position: 10
description: Glossario esteso italiano/inglese del dominio sanitario, con natura della definizione, rinvii incrociati, indice inverso, sigle, collisioni terminologiche e termini da non usare.
---

# Glossario del dominio

Questo glossario è la forma consultabile del linguaggio ubiquo definito nel
[capitolo 01](01-linguaggio-ubiquo.md). Non lo sostituisce: il capitolo 01 stabilisce **come** si
governa il vocabolario, questo capitolo elenca **che cosa** contiene.

## Come si legge

La colonna **Natura** dichiara il livello della definizione secondo la regola di precedenza di
`DM-01`:

| Sigla | Significato |
|---|---|
| **N** | **Normativa**: definita da un atto normativo o amministrativo italiano. Il progetto non può restringerla, estenderla né rinominarla |
| **G** | **Guida nazionale**: definita da una guida di implementazione italiana; prevale sul modello generico |
| **S** | **Standard**: definita dallo standard internazionale adottato; struttura, non significato clinico |
| **P** | **Progetto**: definizione operativa di quest'area, ammessa perché i livelli superiori tacciono |

La colonna **Rinvio** indica dove il termine è trattato: `01`–`08` sono i capitoli di quest'area,
`F01`–`F13` i moduli di [`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md).

Le voci di natura **N** riportano la fonte in forma sintetica; il testo integrale è nel modulo
[F02](../10_fondamenti/02-prestazioni-di-telemedicina.md) per le prestazioni e nel modulo
[F03](../10_fondamenti/03-il-dato-clinico.md) per il dato clinico.

---

## A

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Aderenza** | Adherence | P | Rapporto fra attese soddisfatte e attese generate dal piano, in una finestra dichiarata, con esclusioni esplicite | 08 |
| **Aderenza terapeutica** | Treatment adherence | P | Comportamento della persona rispetto alla terapia prescritta. Non osservabile dal sistema se non per dichiarazione o dato di terzi | 08, F10 |
| **Alimentazione del fascicolo** | EHR feeding | N | Conferimento di dati e documenti al fascicolo sanitario elettronico, entro cinque giorni dall'erogazione, a cura dei soggetti obbligati (DM 7 settembre 2023, artt. 12–13) | 04 |
| **Allarme clinico** | Clinical alert | P | Segnalazione relativa alla condizione dell'assistito, destinata al centro erogatore | 02, 08, F10 |
| **Allarme tecnico** | Technical alert | P | Segnalazione relativa al funzionamento di dispositivi o infrastruttura, destinata al centro servizi | 02, 03 |
| **Ambito di consulto** | Consultation scope | P | Insieme chiuso ed effimero di documenti a cui accede il consulente in forza di una richiesta di teleconsulto, con scadenza obbligatoria | 02 |
| **Amministratore di sostegno** | Support administrator | N | Figura di protezione con poteri **delimitati dal decreto di nomina**, che possono non comprendere le decisioni sanitarie | 03, 06 |
| **Anagrafica per riferimento** | Reference-based demographics | P | Modello in cui i dati anagrafici restano al sistema di origine e il progetto lavora su identificatori esterni qualificati | 03 |
| **Annotazione digitale** | Digital note | N | Documento che sostituisce il referto nella televisita programmata ed erogata dal medico di assistenza primaria (DM 30 settembre 2022, All. B) | 02, 04 |
| **Annullamento del documento** | Document voiding | P | Cessazione di efficacia di un documento firmato senza emissione di una versione sostitutiva | 04 |
| **Arruolamento** | Enrolment | P | Inserimento formale dell'assistito in un servizio strutturato di telemedicina, tipico del telemonitoraggio. Precede l'agenda | 08, F10 |
| **Assistito** | Beneficiary, enrollee | N | Persona titolare del diritto all'assistenza. Qualifica **amministrativa**, distinta da «paziente» | 01, 03 |
| **Attesa di rilevazione** | Expected observation | P | Entità generata dal piano che dichiara grandezza, finestra e tolleranza attese. L'assenza di misura è la sua transizione a «mancata» | 05, 08 |
| **Autenticazione** | Authentication | S | Accertamento che chi si collega possieda una credenziale. Distinta dall'identificazione | 01, 03, F04 |

## B

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Base giuridica** | Legal basis | N | Fondamento di liceità del trattamento. Attributo del **trattamento**, non della persona né del documento | 06, F03 |
| **Bitemporalità** | Bitemporality | P | Proprietà di un fatto che porta sia il periodo di validità nel mondo sia l'istante di registrazione nel sistema | 03, F11 |
| **Bozza** | Draft | P | Materiale di lavoro non firmato. **Non è un documento clinico**: non visibile, non trasmissibile, non conservato come tale | 01, 04 |
| **Branca specialistica** | Clinical specialty | N | Area disciplinare della prestazione. Attributo del servizio offerto, non del professionista in assoluto | 03 |

## C

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Caregiver** | Caregiver | N | Persona che assiste stabilmente l'assistito. **Assistere non è rappresentare**: non può prestare consenso per un assistito capace | 03, 06 |
| **Cartella clinica elettronica** | Local electronic health record | P | Repository clinico del singolo erogante. Nel modello di integrazione resta al sistema del partner | 01, F03 |
| **Catalogo delle prestazioni** | Service catalogue | P | Insieme dei tipi di prestazione con codice, canali ammessi, professioni abilitate, artefatti obbligatori e validità temporale | 02, 07 |
| **Centro erogatore** | Delivering centre | N | Struttura con compiti prettamente sanitari; gestisce gli allarmi sanitari (DM 21 settembre 2022, All. A) | 03 |
| **Centro servizi** | Service centre | N | Struttura con compiti prettamente tecnici; gestisce gli allarmi tecnici e l'assistenza agli utenti (DM 21 settembre 2022, All. A) | 03 |
| **Compliance digitale dell'assistito** | Patient digital readiness | P | Capacità della persona di interagire con i sistemi digitali. Dimensione della verifica di eseguibilità, distinta dalla verifica tecnica del dispositivo | 01, 02, 08 |
| **Concetto codificato** | Coded concept | S | Valore qualificato da sistema di codifica, versione e codice, con eventuale testo originale | 07 |
| **Consegna differita** | Deferred delivery | P | Differimento motivato della messa a disposizione di un documento all'assistito, con data prevista registrata | 04 |
| **Consenso all'atto sanitario** | Informed consent to treatment | N | Manifestazione di volontà relativa all'esecuzione dell'atto, preceduta da informazione adeguata | 06, F03 |
| **Consenso alla consultazione** | Consent to access | N | Autorizzazione alla consultazione del fascicolo da parte di terzi (DM 7 settembre 2023, art. 8) | 06 |
| **Consenso alla registrazione** | Consent to record | P | Consenso specifico per sessione alla cattura audio-video; non ereditabile da un consenso generale | 06 |
| **Consenso al trattamento dei dati** | Data processing consent | N | Manifestazione di volontà sul trattamento dei dati, ove il consenso sia la base giuridica applicabile | 06, F03 |
| **Conservazione a norma** | Compliant digital preservation | N | Processo che garantisce integrità, leggibilità e reperibilità nel tempo. Distinta dal backup | 04, F03 |
| **Contatto** | Encounter | S | Singola interazione fra assistito e sistema di erogazione, in un luogo anche virtuale, con inizio e fine. Nel codice `Encounter`, **mai** `Contact` | 01, 02 |
| **Copertura oraria dichiarata** | Declared service coverage | P | Giorni, fasce, tipo di risposta garantita, termine di presa in carico atteso, comportamento fuori copertura. È requisito di sicurezza | 08 |

## D

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Dataset canonico** | Canonical dataset | P | Rappresentazione del contenuto informativo di un documento, indipendente dal formato di serializzazione | 04 |
| **Dati a maggiore tutela dell'anonimato** | Highly protected health data | N | Categoria chiusa dell'art. 6 del DM 7 settembre 2023, visibile a terzi solo previo consenso esplicito reso all'erogante | 04, 06 |
| **Delegato** | Delegate | P | Soggetto autorizzato dall'assistito capace ad accedere ai documenti o operare per suo conto, con ambito e scadenza obbligatoria | 03, 06 |
| **Deviazione dal percorso** | Pathway deviation | P | Scostamento motivato dell'istanza dalla definizione del percorso. È un fatto registrato, non un errore di validazione | 08 |
| **Diario clinico** | Progress notes | P | Annotazioni cronologiche del decorso, non destinate all'assistito né trasmesse ai sistemi esterni | 04, F03 |
| **Display ufficiale** | Official display | S | Stringa descrittiva del concetto fornita dal titolare della terminologia. **Non è** l'etichetta di interfaccia | 01, 07 |
| **Documento clinico** | Clinical document | P | Artefatto con autore identificato, validato, immutabile, con destinatario e regime di conservazione propri | 04 |
| **Dossier sanitario** | Organisational health record | P | Insieme dei dati dell'assistito presso una singola struttura. Distinto dal fascicolo | 01, F03 |

## E

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Eleggibilità** | Eligibility | P | Verifica che l'assistito possa ricevere quella prestazione **in quel canale**. Distinta dal diritto all'esenzione | 02, 08 |
| **Episodio di cura** | Episode of care | S | Contenitore temporale della presa in carico su un problema di salute. Radice dell'aggregato della presa in carico | 08 |
| **Erogazione** | Delivery of care | P | Atto materiale di fornitura della prestazione. Non implica refertata né rendicontata | 01, 02 |
| **Esenzione** | Co-payment exemption | N | Diritto a non corrispondere in tutto o in parte la compartecipazione. Un'esenzione per patologia **rivela la patologia** | 03, F03 |
| **Esito del contatto** | Encounter outcome | P | Codice strutturato che dichiara come l'atto si è concluso, distinto dallo **stato** del contatto | 02 |
| **Etichetta di interfaccia** | UI label | P | Stringa del progetto, per lingua, collegata al codice. Architetturalmente separata dal display ufficiale | 01, 07 |

## F

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Fascicolo sanitario elettronico** | National electronic health record | N | Insieme dei dati e documenti sanitari dell'assistito, sotto il suo controllo, alimentato dalle strutture (art. 12 D.L. 179/2012 e atti attuativi) | 04, 06, F07 |
| **Finalità dichiarata** | Declared purpose of use | P | Finalità con cui un accesso è richiesto; entra nella decisione di autorizzazione e nel registro degli accessi | 06 |
| **Finestra di refertazione** | Reporting window | P | Intervallo fra conclusione del contatto e termine entro cui il documento deve essere firmato | 01, 04 |
| **Firma del documento** | Document signature | N | Sottoscrizione con valore probatorio, di livello determinato per tipologia documentale | 04, F03 |
| **Fusione anagrafica** | Record merge | P | Unione controllata di due anagrafiche duplicate nello stesso tenant. **Mai automatica** | 03, F04 |

## G

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Gateway terminologico** | Terminology gateway | P | Punto unico di risoluzione, validazione ed espansione dei codici, con politica per sistema di codifica | 07 |
| **Grandezza** | Observable quantity | S | Ciò che la misura misura, identificato da un codice. Distingue parametri che condividono l'unità | 05 |

## I

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Identificazione** | Patient identification | N | Accertamento che la persona collegata sia l'assistito atteso. **Atto del professionista**, distinto dall'autenticazione | 01, 02, F04 |
| **Identificatore esterno** | External identifier | P | Coppia dominio di attribuzione più valore con cui un sistema terzo identifica il soggetto. Chiave di lavoro del modello per riferimento | 03 |
| **Indirizzo di svolgimento** | Session location address | P | Luogo in cui l'assistito si trova durante la sessione. Richiesto e confermato a ogni sessione, necessario in emergenza | 02, 03 |
| **Informativa** | Privacy notice | N | Documento informativo che precede e fonda il consenso. Versionata, con versioni precedenti conservate | 06 |
| **Integratore** | Integrator | P | Soggetto terzo che incorpora il sistema nel proprio. **Principal applicativo**, non utente | 01, 03 |
| **Istante di inserimento** | Entry timestamp | P | Quando il dato è stato immesso nel sistema da un soggetto | 05 |
| **Istante di ricezione** | Reception timestamp | P | Quando il sistema ha ricevuto il dato da una sorgente esterna | 05 |
| **Istante di rilevazione** | Observation timestamp | S | Quando il fatto misurato è accaduto. Unico asse della serie clinica | 05, F09 |

## L

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Linguaggio ubiquo** | Ubiquitous language | P | Vocabolario condiviso fra clinici e sviluppatori, usato identicamente nella conversazione, nel codice e nell'interfaccia | 01 |
| **Livello di garanzia** | Level of assurance | N | Grado di affidabilità dell'autenticazione dell'identità digitale, propagato come attributo del soggetto | 03, F04 |
| **Livello di provenienza** | Provenance level | P | Descrizione della catena con cui una misura è arrivata. Non è un giudizio di attendibilità applicato dal sistema | 05 |
| **Livello di riservatezza** | Sensitivity label | P | Attributo del documento che ne governa condivisione automatica e notifiche | 04, 06 |

## M

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Mancata presentazione** | No-show | P | Assenza dell'assistito senza alcun tentativo di connessione entro la finestra. **Distinta** dal fallimento tecnico | 02 |
| **Matrice di visibilità documentale** | Document visibility matrix | N | Corrispondenza tipologia documentale × ruolo, definita dal DM 19 novembre 2025, All. 3, § 5.2 | 04 |
| **Misura** | Observation | S | Valore più il contesto in cui è stato ottenuto. Immutabile; si corregge con una nuova versione | 05 |
| **Modalità con registrazione** | Recording mode | P | Modalità di sessione in cui il flusso transita per il componente di registrazione e **non è più cifrato fino agli estremi** | 02, 06 |

## N

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Nomenclatore** | Fee schedule | N | Catalogo codificato delle prestazioni con relativa tariffa. **Versionato nel tempo e variabile per regime** | 07, F01 |
| **Non conferibile** | Non-transmissible | P | Stato del documento che, per ragioni normative, non può essere conferito al fascicolo. Distinto da «non ancora conferito» | 04, 06 |

## O

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Oscuramento** | Data suppression | N | Diritto dell'assistito a rendere invisibili documenti a determinati soggetti, **senza che la scelta sia conoscibile** (DM 7 settembre 2023, art. 9) | 06, F03 |
| **Overbooking** | Overbooking | P | Assegnazione controllata di più appuntamenti allo stesso slot. Se emerge da una corsa critica è un difetto, non una funzione | 01 |

## P

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Partecipante** | Participant | S | Soggetto ammesso alla sessione con ruolo, qualifica dichiarata, istante di ingresso e di uscita | 02 |
| **Paziente** | Patient | S | Persona destinataria dell'atto sanitario. Qualifica **clinica**, distinta da «assistito» | 01, 03 |
| **Percorso diagnostico-terapeutico assistenziale** | Care pathway | N | Sequenza attesa di atti per una condizione, in un'organizzazione. È il **modello**, non l'istanza | 08, F10 |
| **Piano assistenziale individuale** | Individual care plan | N | Piano della presa in carico integrata, multiprofessionale, con dimensione sanitaria e sociale | 08, F10 |
| **Piano di cura** | Care plan | S | Istanza sul singolo assistito di ciò che si è deciso di fare, con obiettivi e calendario | 08 |
| **Piano di telemonitoraggio** | Remote monitoring plan | N | Documento che definisce operativamente cicli, durata, frequenze, fasce orarie, soglie e regole (DM 19 novembre 2025, All. 1, § 2.24). Firmato | 02, 05, 08 |
| **Presa in carico** | Enrolment into care | P | Assunzione formale di responsabilità clinica continuativa. Non coincide con «avere un appuntamento» | 08, F10 |
| **Pre-verifica tecnica** | Technical pre-check | P | Controllo di dispositivo, permessi, banda e raggiungibilità eseguito prima dell'ingresso in sala d'attesa, con esito registrato | 01, 02 |
| **Prestazione erogata** | Delivered service | P | L'atto effettivamente eseguito. Distinto dalla prestazione richiesta e da quella rendicontata | 01, 02 |
| **Prestazione richiesta** | Requested service | S | La richiesta o il quesito che può dare origine a un atto | 01, 02 |
| **Progetto riabilitativo individuale** | Individual rehabilitation project | N | Contenitore obbligatorio delle prestazioni di riabilitazione, teleriabilitazione compresa | 08 |
| **Punto di erogazione** | Point of delivery | S | Luogo, anche virtuale, in cui la struttura eroga. Distinto dall'indirizzo di svolgimento | 03 |

## Q

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Qualità del collegamento** | Connection quality | N | Evidenza che il referto di televisita deve riportare, insieme alla conferma di idoneità all'esecuzione (Accordo 215/CSR 2020) | 02, 04 |
| **Quesito diagnostico** | Diagnostic question | N | Motivo codificato della richiesta, campo del tracciato del referto di televisita | 04, 07 |

## R

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Referto** | Report | N | Documento sanitario firmato con esito e conclusioni di un atto. Per la televisita esiste una tipologia documentale propria | 02, 04 |
| **Registro degli accessi** | Access log | P | Catena append-only con impronte, conservata separatamente, che registra chi ha fatto cosa su quale soggetto | 04, 06 |
| **Relazione clinica** | Clinical letter | P | Comunicazione discorsiva fra professionisti su un caso. Non certifica un esame | 04, F03 |
| **Relazione collaborativa** | Collaborative report | N | Tipologia documentale del teleconsulto, conferita al fascicolo **come allegato** al documento dell'evento principale | 02, 04 |
| **Relazione di cura** | Care relationship | P | Fatto materializzato che fonda l'accesso ai dati clinici, con condizione di esistenza, periodo e fonte | 03 |
| **Rendicontazione** | Reporting for reimbursement | N | Trasmissione dei dati di erogazione ai flussi informativi, con tracciamento della modalità a distanza | 02, F01 |
| **Rettifica** | Amendment | P | Emissione di una versione successiva che annulla e sostituisce la precedente, con motivazione | 04 |
| **Ripiego di canale** | Channel fallback | P | Passaggio dichiarato da un canale a un altro durante l'atto, registrato perché può incidere sulla natura dell'atto | 01, 02 |
| **Riprogrammazione** | Rescheduling | P | Spostamento che conserva il collegamento alla richiesta originaria e la catena degli appuntamenti sostituiti | 02 |
| **Ruolo organizzativo** | Practitioner role | S | Relazione fra professionista e organizzazione, con disciplina, prestazioni erogabili e **validità temporale** | 03 |

## S

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Sala d'attesa virtuale** | Virtual waiting room | P | Stato del contatto più una coda. **Non** una stanza media dedicata | 02 |
| **Servizi minimi** | Minimum services | N | I quattro servizi che l'infrastruttura regionale deve erogare: televisita, teleconsulto/teleconsulenza, telemonitoraggio, teleassistenza | 01, 02 |
| **Sessione applicativa** | Application session | P | Sessione di accesso di un utente al sistema | 01 |
| **Sessione media** | Media session | P | Istanza di collegamento in tempo reale fra partecipanti. **Aggregato distinto dal contatto** | 01, 02 |
| **Setting di erogazione** | Care setting | P | Contesto organizzativo dell'erogazione. **Discrimina regole**: obbligo di referto, necessità della prescrizione, regime di rendicontazione | 02 |
| **Slot** | Slot | S | Intervallo temporale elementare di un'agenda. Uno slot occupato **non è** un appuntamento | 01 |
| **Soglia clinica** | Clinical threshold | P | Valore di riferimento per un parametro di un singolo assistito, configurato dal professionista. **Mai cablato** | 05, 08 |
| **Soglia tecnica** | Technical threshold | P | Valore di riferimento sulla qualità del canale. Specifica di prodotto, non requisito normativo | 01, 02 |
| **Sorveglianza del volume atteso** | Expected volume monitoring | P | Controllo del volume aggregato di misure per sorgente e tenant, distinto dalla sorveglianza per assistito | 05 |
| **Stanza laterale** | Breakout room | P | Colloquio riservato fra professionisti che esclude temporaneamente l'assistito. **Sempre annunciato**, mai silenzioso | 02 |
| **Stato del contatto** | Encounter state | P | Dove si trova il contatto nel suo ciclo di vita. Distinto dall'esito | 02 |
| **Stato di risoluzione** | Resolution status | P | Esito del tentativo di risolvere un codice: risolto, sistema disattivato, servizio non raggiungibile, codice non trovato | 07 |
| **Struttura erogante** | Delivering organisation | N | Soggetto giuridico responsabile dell'erogazione. Non coincide con il tenant | 01, 03 |

## T

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Teleassistenza** | Tele-care | N | Atto professionale di pertinenza della professione sanitaria non medica, con assistito o caregiver, prevalentemente programmato e ripetibile | 02, F02 |
| **Teleconsulenza medico-sanitaria** | Tele-advice | N | Attività fra professionisti sanitari **con responsabilità differenti**, sempre programmata, **non** utilizzabile in surroga del soccorso | 02, F02 |
| **Teleconsulto** | Physician-to-physician teleconsultation | N | Atto fra due o più medici, anche asincrono, che **non dà luogo a referto autonomo** | 02, F02 |
| **Telecontrollo medico** | Medical tele-check | N | Prestazione medica a contatti cadenzati con videochiamata e condivisione di dati raccolti presso l'assistito. È a nomenclatore | 02, F02 |
| **Telemedicina** | Telemedicine | N | Modalità di erogazione di prestazioni sanitarie a distanza. **Canale**, non specialità | 01, F02 |
| **Telemonitoraggio** | Remote patient monitoring | N | Rilevamento e trasmissione a distanza di parametri. Non afferisce alla specialistica ambulatoriale se non affiancato | 02, 05, F02 |
| **Telerefertazione** | Tele-reporting | N | Relazione asincrona su esame già acquisito, con firma digitale validata del medico responsabile | 02, F02 |
| **Teleriabilitazione** | Telerehabilitation | N | Erogazione a distanza di interventi riabilitativi, inquadrata nel progetto riabilitativo individuale | 02, 08 |
| **Televisita** | Video visit | N | Atto **medico** in tempo reale con l'assistito, limitato alle attività di controllo di pazienti con diagnosi già formulata in presenza | 02, F02 |
| **Tenant** | Tenant | P | Confine di isolamento logico dei dati e della configurazione. Distinto da organizzazione, struttura erogante e integratore | 01, 03 |
| **Terzo in sessione** | Third party in session | P | Soggetto che accede a contenuti sanitari senza essere parte della relazione di cura: interprete, discente, caregiver | 02, 03 |
| **Tesserino dispositivi** | Device card | N | Documento firmato dal professionista che assegna il dispositivo, con identificativo univoco e parametri tecnici (DM 19 novembre 2025, All. 1, § 2.23) | 02, 04, 05 |
| **Titolare del trattamento** | Data controller | N | Soggetto che determina finalità e mezzi. Per la finalità di cura è chi redige i dati e i documenti | 03, 06, F03 |

## U

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Unità di misura codificata** | Coded unit | S | Codice dell'unità, mai stringa libera. Obbligatorio per ogni valore numerico | 05, 07 |

## V

| Termine | English | Natura | Definizione | Rinvio |
|---|---|---|---|---|
| **Valore aggregato** | Aggregated value | P | Entità distinta dalla misura, con funzione, finestra, numero di misure incluse e numero di attese non soddisfatte | 05 |
| **Valutazione di eseguibilità** | Feasibility assessment | P | Atto con tre esiti indipendenti: utilità clinica, sicurezza clinica, compliance digitale | 02, 08 |
| **Versione del documento** | Document version | P | Elemento della catena immutabile di un documento clinico, con riferimento alla precedente e motivazione | 04 |

---

## Indice inverso inglese → italiano

| English | Italiano |
|---|---|
| Access log | Registro degli accessi |
| Adherence | Aderenza |
| Aggregated value | Valore aggregato |
| Amendment | Rettifica |
| Application session | Sessione applicativa |
| Authentication | Autenticazione |
| Beneficiary | Assistito |
| Bitemporality | Bitemporalità |
| Breakout room | Stanza laterale |
| Canonical dataset | Dataset canonico |
| Care pathway | Percorso diagnostico-terapeutico assistenziale |
| Care plan | Piano di cura |
| Care relationship | Relazione di cura |
| Care setting | Setting di erogazione |
| Caregiver | Caregiver |
| Channel fallback | Ripiego di canale |
| Clinical alert | Allarme clinico |
| Clinical document | Documento clinico |
| Clinical letter | Relazione clinica |
| Clinical specialty | Branca specialistica |
| Clinical threshold | Soglia clinica |
| Coded concept | Concetto codificato |
| Coded unit | Unità di misura codificata |
| Collaborative report | Relazione collaborativa |
| Compliant digital preservation | Conservazione a norma |
| Connection quality | Qualità del collegamento |
| Consent to access | Consenso alla consultazione |
| Consent to record | Consenso alla registrazione |
| Consultation scope | Ambito di consulto |
| Data controller | Titolare del trattamento |
| Data processing consent | Consenso al trattamento dei dati |
| Data suppression | Oscuramento |
| Declared purpose of use | Finalità dichiarata |
| Declared service coverage | Copertura oraria dichiarata |
| Deferred delivery | Consegna differita |
| Delegate | Delegato |
| Delivered service | Prestazione erogata |
| Delivering centre | Centro erogatore |
| Delivering organisation | Struttura erogante |
| Delivery of care | Erogazione |
| Device card | Tesserino dispositivi |
| Diagnostic question | Quesito diagnostico |
| Digital note | Annotazione digitale |
| Document signature | Firma del documento |
| Document version | Versione del documento |
| Document visibility matrix | Matrice di visibilità documentale |
| Document voiding | Annullamento del documento |
| Draft | Bozza |
| EHR feeding | Alimentazione del fascicolo |
| Eligibility | Eleggibilità |
| Encounter | Contatto |
| Encounter outcome | Esito del contatto |
| Encounter state | Stato del contatto |
| Enrolment | Arruolamento |
| Enrolment into care | Presa in carico |
| Entry timestamp | Istante di inserimento |
| Episode of care | Episodio di cura |
| Expected observation | Attesa di rilevazione |
| Expected volume monitoring | Sorveglianza del volume atteso |
| External identifier | Identificatore esterno |
| Feasibility assessment | Valutazione di eseguibilità |
| Fee schedule | Nomenclatore |
| Highly protected health data | Dati a maggiore tutela dell'anonimato |
| Individual care plan | Piano assistenziale individuale |
| Individual rehabilitation project | Progetto riabilitativo individuale |
| Informed consent to treatment | Consenso all'atto sanitario |
| Integrator | Integratore |
| Legal basis | Base giuridica |
| Level of assurance | Livello di garanzia |
| Local electronic health record | Cartella clinica elettronica |
| Media session | Sessione media |
| Medical tele-check | Telecontrollo medico |
| Minimum services | Servizi minimi |
| National electronic health record | Fascicolo sanitario elettronico |
| No-show | Mancata presentazione |
| Non-transmissible | Non conferibile |
| Observable quantity | Grandezza |
| Observation | Misura |
| Observation timestamp | Istante di rilevazione |
| Official display | Display ufficiale |
| Organisational health record | Dossier sanitario |
| Overbooking | Overbooking |
| Participant | Partecipante |
| Pathway deviation | Deviazione dal percorso |
| Patient | Paziente |
| Patient digital readiness | Compliance digitale dell'assistito |
| Patient identification | Identificazione |
| Physician-to-physician teleconsultation | Teleconsulto |
| Point of delivery | Punto di erogazione |
| Practitioner role | Ruolo organizzativo |
| Privacy notice | Informativa |
| Progress notes | Diario clinico |
| Provenance level | Livello di provenienza |
| Recording mode | Modalità con registrazione |
| Record merge | Fusione anagrafica |
| Reference-based demographics | Anagrafica per riferimento |
| Remote monitoring plan | Piano di telemonitoraggio |
| Remote patient monitoring | Telemonitoraggio |
| Report | Referto |
| Reporting for reimbursement | Rendicontazione |
| Reporting window | Finestra di refertazione |
| Requested service | Prestazione richiesta |
| Rescheduling | Riprogrammazione |
| Resolution status | Stato di risoluzione |
| Sensitivity label | Livello di riservatezza |
| Service catalogue | Catalogo delle prestazioni |
| Service centre | Centro servizi |
| Session location address | Indirizzo di svolgimento |
| Slot | Slot |
| Support administrator | Amministratore di sostegno |
| Technical alert | Allarme tecnico |
| Technical pre-check | Pre-verifica tecnica |
| Technical threshold | Soglia tecnica |
| Tele-advice | Teleconsulenza medico-sanitaria |
| Tele-care | Teleassistenza |
| Telemedicine | Telemedicina |
| Telerehabilitation | Teleriabilitazione |
| Tele-reporting | Telerefertazione |
| Tenant | Tenant |
| Terminology gateway | Gateway terminologico |
| Third party in session | Terzo in sessione |
| Treatment adherence | Aderenza terapeutica |
| Ubiquitous language | Linguaggio ubiquo |
| UI label | Etichetta di interfaccia |
| Video visit | Televisita |
| Virtual waiting room | Sala d'attesa virtuale |

---

## Sigle sciolte

Le sigle sono sciolte in italiano e in inglese; le sigle di atti normativi restano nella forma
originale, come impone `D50` per i riferimenti normativi italiani.

| Sigla | Forma estesa italiana | English | Rinvio |
|---|---|---|---|
| CDA | Architettura dei documenti clinici | Clinical Document Architecture | 04, F05 |
| CUP | Centro unico di prenotazione | Central booking service | F01 |
| DPIA | Valutazione d'impatto sulla protezione dei dati | Data protection impact assessment | F03 |
| EDS | Ecosistema dati sanitari | Health data ecosystem | F07 |
| FSE | Fascicolo sanitario elettronico | National electronic health record | 04, F07 |
| INI | Infrastruttura nazionale per l'interoperabilità | National interoperability infrastructure | F07 |
| INT | Infrastruttura nazionale di telemedicina | National telemedicine infrastructure | 02, F02 |
| IRT | Infrastruttura regionale di telemedicina | Regional telemedicine infrastructure | 02, F02 |
| LEA | Livelli essenziali di assistenza | Essential levels of care | F01 |
| MMG | Medico di medicina generale | General practitioner | 02, 03 |
| NIT | Nodo di interoperabilità telemedicina | Telemedicine interoperability node | F02 |
| PAI | Piano assistenziale individuale | Individual care plan | 08 |
| PDTA | Percorso diagnostico-terapeutico assistenziale | Care pathway | 08 |
| PLS | Pediatra di libera scelta | Family paediatrician | 02, 03 |
| PNT | Piattaforma nazionale di telemedicina | National telemedicine platform | 02, F02 |
| PRI | Progetto riabilitativo individuale | Individual rehabilitation project | 08 |
| RPD / DPO | Responsabile della protezione dei dati | Data protection officer | 06 |
| UDI | Identificazione unica del dispositivo | Unique device identification | 02, 05 |

---

## Termini da non usare

Non sono errori di ortografia: sono termini che, usati nel modello o nella documentazione,
introducono un significato sbagliato o un impegno che il prodotto non può mantenere.

| Da non usare | Perché | Che cosa si usa |
|---|---|---|
| «Sessione» non qualificata | Ambigua fra atto clinico, connessione media e sessione applicativa | *contatto*, *sessione media*, *sessione applicativa* |
| «Contact» nel codice | Collide con l'elemento dei recapiti dello standard | `Encounter` |
| «Monitoraggio in tempo reale» | Sposta la classificazione regolatoria (`D46`) | *raccolta differita per la revisione periodica del professionista* |
| «Audit immutabile» riferito al versionamento delle entità | Il versionamento non rende immutabile (`D42`) | *registro degli accessi a catena di impronte* |
| «Referto di teleconsulto» | Il teleconsulto non dà luogo a referto autonomo | *relazione collaborativa* |
| «Consenso alla piattaforma» | Non esiste: i consensi sono cinque oggetti distinti | il tipo di consenso specifico |
| «Soglia di legge» riferita a parametri tecnici | Nessuna soglia tecnica è imposta dalla normativa italiana (`V-12`) | *specifica di prodotto configurabile* |
| «Qualità clinica» come claim | Non ha definizione verificabile (`D29`) | enunciati tecnici verificabili su risoluzione, continuità, esito |
| «Diagnosi automatica», «suggerimento clinico» | Fuori perimetro (`V2`) | *registrazione della decisione del professionista* |
| «Il paziente autenticato è identificato» | Autenticazione e identificazione sono atti distinti | *identificazione registrata dal professionista* |
| Nomi di aziende, prodotti, marchi, domini di potenziali partner | Regola `R0`, prevalente su ogni altra | *l'integratore*, *un sistema EHR di terze parti* |

---

## Collisioni presidiate

Elenco delle parole che hanno due significati legittimi nel prodotto. La regola è **qualificare
sempre**; il controllo è automatizzabile perché la lista è chiusa
([capitolo 01](01-linguaggio-ubiquo.md) § 6).

Sessione · Contatto · Ticket · Teleassistenza · Registro · Firma · Priorità · Stato · Piano ·
Monitoraggio · Verifica · Validazione.

---

## Manutenzione del glossario

1. **Una voce entra con la sua fonte**: livello N, G o S con citazione, oppure livello P con la
   ragione per cui è necessaria.
2. **Una voce italiana senza traducente non è una voce** (`D50`).
3. **I termini non si rinominano, si deprezzano**: la voce resta, marcata come deprecata, con il
   rinvio alla nuova e la data.
4. **Ogni evento di dominio nuovo passa da qui.** Il nome dell'evento è un termine del
   linguaggio.
5. **L'allineamento con il glossario nazionale è dichiarato voce per voce**: coincide, specializza
   o è proprio del progetto. **[NV]** L'allineamento non è ancora stato eseguito; va chiesto
   all'area `COMP` prima del congelamento.
