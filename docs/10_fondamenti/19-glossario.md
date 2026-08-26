---
title: Glossario
sidebar_position: 20
description: "Glossario della guida dei fondamenti: ogni termine e ogni sigla introdotti dai venti moduli, in italiano e in inglese, con la natura della definizione, il rinvio al modulo che lo tratta, i falsi sinonimi, i termini da non usare e le parole che cambiano significato con il contesto."
---

# Glossario

Questo è il glossario della **guida dei fondamenti**. Non è un dizionario di telemedicina e non
è il glossario del modello di dominio: è l'indice consultabile di **ciò che i venti moduli di
questa guida hanno effettivamente introdotto**, raccolto in un unico posto perché nessuno legge
la guida in ordine e quasi tutti la interrompono a metà per cercare una parola.

Ogni voce elencata qui compare in almeno un modulo della guida o in almeno un'area della
documentazione. Non ci sono voci aggiunte per completezza enciclopedica: un glossario che
definisce termini che il progetto non usa è rumore, e il rumore fa perdere fiducia proprio nelle
voci che contano.

## 1. Come si usa questo glossario

**Si consulta, non si legge.** È l'unico modulo della guida per cui questa raccomandazione è
letterale. Cerca la parola, leggi due righe, segui il rinvio se ti serve il contesto, torna a
quello che stavi facendo.

**Il glossario rinvia, non ripete.** Ogni voce contiene la definizione minima sufficiente a non
sbagliare, e il puntatore al modulo o all'area in cui il concetto è trattato per esteso. Se la
voce ti sembra troppo breve, è perché lo è di proposito: la trattazione sta altrove, e duplicarla
qui garantirebbe soltanto che le due copie divergano.

**Le trappole sono la parte utile.** Molti termini di questo dominio hanno un uso comune e un uso
tecnico che non coincidono, e la confusione fra i due produce una quota consistente degli errori
che questa guida esiste per prevenire. Dove la trappola esiste, la voce la dichiara. Se leggi solo
una parte di una voce, leggi quella.

### 1.1 Che cosa questo glossario non contiene

1. **Non contiene il dettaglio di modellazione.** Per sapere se un termine è un'entità, un oggetto
   valore, un evento di dominio o un attributo, e con quali invarianti, la fonte è il
   [glossario del dominio](../05_domain/09-glossario-del-dominio.md), che dichiara per ciascuna
   voce la natura della definizione e i capitoli in cui è modellata. Questo glossario **assorbe**
   quella fonte per le voci che la guida introduce e vi **rinvia** per tutto il resto.
2. **Non contiene soglie cliniche.** Nessun valore numerico di riferimento per alcun parametro
   compare in questa pagina, in nessuna forma. Le soglie sono configurazione clinica per singolo
   assistito, decise dal professionista, e un glossario non è il luogo in cui si stabiliscono.
3. **Non contiene contenuto di terminologie sotto licenza.** In particolare **nessun codice e
   nessuna descrizione SNOMED CT**, in nessuna forma. La voce «SNOMED CT» descrive il regime della
   terminologia; non ne riporta un solo concetto.
4. **Non contiene dati reali.** Nessun esempio di questa pagina fa riferimento a persone
   esistenti; gli identificatori citati sono descritti nella loro struttura, mai istanziati.
5. **Non contiene nomi di aziende, prodotti commerciali, marchi o domini di potenziali partner.**
   Le controparti di integrazione sono nominate per categoria: «l'integratore», «un gestionale
   sanitario cloud», «un sistema EHR di terze parti».
6. **Non contiene definizioni normative inventate.** Dove un termine ha una definizione di legge,
   la voce riporta quella e cita l'estremo puntuale. Dove non ce l'ha, la voce dichiara che la
   definizione è **di progetto**. Ciò che non è stato verificato è marcato `[NV]`.

### 1.2 Come si legge una voce

Ogni voce ha quattro elementi.

| Elemento | Contenuto |
|---|---|
| **Termine** | La forma italiana, seguita dall'equivalente inglese fra parentesi quando esiste. Quando l'equivalente inglese **non è esatto** - perché il termine italiano designa un istituto giuridico nazionale privo di corrispondente - la voce lo dice espressamente |
| **Nat.** | La natura della definizione, secondo la legenda che segue |
| **Definizione** | Una o due frasi comprensibili a chi non conosce il dominio; dove esiste, la **trappola** in grassetto |
| **Dove** | Il modulo della guida o l'area di documentazione che introduce il termine, con collegamento |

Legenda della colonna **Nat.**, mutuata dalla regola di precedenza fra le fonti definita nel
[linguaggio ubiquo](../05_domain/01-linguaggio-ubiquo.md):

| Sigla | Significato |
|---|---|
| **N** | **Normativa** - la definizione è data da un atto normativo o amministrativo, italiano o dell'Unione, citato nella voce. Il progetto non può restringerla, estenderla né rinominarla |
| **G** | **Guida nazionale** - la definizione è data da una guida di implementazione o da una specifica tecnica nazionale; prevale sul modello generico internazionale |
| **S** | **Standard o vocabolario tecnico consolidato** - la definizione è data da una specifica internazionale (HL7, IETF, ISO, IEC, W3C, CEN) o dal vocabolario tecnico corrente. Fissa la struttura, non il significato clinico |
| **P** | **Progetto** - definizione operativa adottata da Telemedic, ammessa perché i livelli superiori tacciono. È una scelta, e come tale è discutibile e versionata |

`[NV]` marca un elemento **non verificato** su fonte primaria. Dove compare, non è un difetto di
stesura: è la dichiarazione onesta che l'informazione va confermata prima di farne discendere una
decisione.

### 1.3 Legenda dei rinvii

I codici `F00`–`F20` indicano i moduli di questa guida; i codici in lettere indicano le aree di
documentazione. Nelle voci il codice è sempre un collegamento.

| Codice | Destinazione |
|---|---|
| F00 | [Come usare questa guida](00-come-usare-questa-guida.md) |
| F01 | [Il sistema sanitario italiano](01-sistema-sanitario-italiano.md) |
| F02 | [Le prestazioni di telemedicina](02-prestazioni-di-telemedicina.md) |
| F03 | [Il dato clinico](03-il-dato-clinico.md) |
| F04 | [Identità e anagrafiche](04-identita-e-anagrafiche.md) |
| F05 | [Gli standard di interoperabilità](05-standard-di-interoperabilita.md) |
| F06 | [FHIR da zero](06-fhir-da-zero.md) |
| F07 | [FSE e infrastrutture nazionali](07-fse-e-infrastrutture-nazionali.md) |
| F08 | [WebRTC da zero](08-webrtc-da-zero.md) |
| F09 | [Fondamenti clinici](09-fondamenti-clinici.md) |
| F10 | [Percorsi di cura e sicurezza del paziente](10-percorsi-di-cura-e-sicurezza.md) |
| F11 | [Fondamenti informatici](11-fondamenti-informatici.md) |
| F12 | [Crittografia e sicurezza](12-crittografia-e-sicurezza.md) |
| F13 | [I protocolli, uno per uno](13-protocolli.md) |
| F14 | [I flussi funzionali](14-flussi-funzionali.md) |
| F15 | [Il quadro regolatorio da zero](15-regolatorio-da-zero.md) |
| F16 | [L'architettura del progetto](16-architettura-del-progetto.md) |
| F17 | [L'ambiente di sviluppo](17-ambiente-di-sviluppo.md) |
| F18 | [Contribuire, area per area](18-contribuire-per-area.md) |
| F20 | [Fonti primarie](20-fonti-primarie.md) |
| TEC | [Area tecnica](../01_technical/00-indice.md) |
| ARC | [Area architetturale](../02_architecture/00-indice.md) |
| FUN | [Area funzionale](../03_functional/00-indice.md) |
| PRO | [Area protocolli](../04_protocols/00-indice.md) |
| DOM | [Area dominio](../05_domain/00-indice.md) |
| SEC | [Area sicurezza](../06_security/00-indice.md) |
| INT | [Area integrazione](../07_integration/00-indice.md) |
| CMP | [Area conformità](../08_compliance/00-indice.md) |
| RDM | [Area roadmap](../09_roadmap/00-indice.md) |

### 1.4 Una precisazione che vale per tutte le voci regolatorie

Il progetto **intende assumere il ruolo di fabbricante** ai sensi del Regolamento (UE) 2017/745;
il soggetto giuridico che lo eserciterà **è ancora da costituire** e la sua costituzione è un
prerequisito interno con un proprio tempo. Le voci di questo glossario che descrivono obblighi del
fabbricante vanno lette in questa luce: non descrivono il percorso di un terzo indefinito,
descrivono un percorso del progetto.

**Ciò che non cambia, e che questo glossario ripete ogni volta che serve: oggi il prodotto non
reca marcatura CE** e non è coperto da alcuna dichiarazione di conformità. Chi installa, integra o
mette in servizio il software assume gli obblighi che ne derivano. Nessuna voce di questa pagina -
e nessun altro documento del progetto - afferma che il prodotto sarà marcato entro una data.

---

## 2. Elenco alfabetico

### A

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **ABAC** (*attribute-based access control*, controllo degli accessi basato sugli attributi) | S | Modello di autorizzazione in cui la decisione valuta attributi del soggetto, della risorsa, dell'azione e del contesto, e non un solo ruolo. **Trappola:** in sanità il ruolo non basta quasi mai, perché il permesso dipende dall'esistenza di una relazione di cura con quel singolo assistito | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/00-indice.md) |
| **Accessorio** (*accessory*) | N | Articolo che, pur non essendo esso stesso un dispositivo, è destinato dal fabbricante a essere usato con dispositivi medici specifici per abilitarne l'uso o assisterne la funzionalità medica (Reg. (UE) 2017/745, art. 2, punto 2) | [F15](15-regolatorio-da-zero.md) |
| **Accreditamento istituzionale** (*institutional accreditation*; equivalente inglese approssimativo: è un istituto del diritto sanitario italiano) | N | Riconoscimento regionale che abilita una struttura a erogare prestazioni per conto del servizio sanitario. **Trappola:** presuppone l'autorizzazione sanitaria ma non coincide con essa, e non equivale al contratto: sono tre passaggi distinti e una struttura può avere i primi due senza il terzo | [F01](01-sistema-sanitario-italiano.md) |
| **ACK / NACK** (*acknowledgement / negative acknowledgement*) | S | Messaggi di conferma o di rifiuto in HL7 v2, disponibili in modalità originale ed estesa. **Trappola:** un ACK non significa che il contenuto è stato accettato dal sistema clinico, ma solo che il messaggio è stato ricevuto o elaborato nel senso dichiarato dalla modalità | [F05](05-standard-di-interoperabilita.md), [PRO](../04_protocols/00-indice.md) |
| **ACN - Accordo collettivo nazionale** (*national collective agreement for contracted physicians*; istituto italiano senza equivalente diretto) | N | Contratto della medicina convenzionata: medici di medicina generale, pediatri di libera scelta, specialisti ambulatoriali. **Trappola:** la stessa sigla designa l'Agenzia per la cybersicurezza nazionale. Nella documentazione del progetto va sempre sciolta | [F01](01-sistema-sanitario-italiano.md) |
| **ACN - Agenzia per la cybersicurezza nazionale** (*National Cybersecurity Agency*) | N | Autorità che qualifica servizi e infrastrutture cloud per la pubblica amministrazione, emana le misure di sicurezza in attuazione della disciplina NIS e ospita il CSIRT Italia. **Trappola:** vedi la voce precedente | [F07](07-fse-e-infrastrutture-nazionali.md), [SEC](../06_security/00-indice.md) |
| **`acr`** (*Authentication Context Class Reference*) | S | Claim che dichiara il contesto, e quindi il livello, dell'autenticazione effettivamente eseguita. **Trappola:** il livello di garanzia sta qui, non nel claim `act`, che esprime la delega e non la robustezza dell'autenticazione | [F13](13-protocolli.md), [PRO](../04_protocols/00-indice.md) |
| **Acuto** (*acute*) | S | Detto di un evento o di una malattia con inizio identificabile, decorso breve ed esito definito; corrisponde a un modello di cura episodico. **Trappola:** il modello dati costruito sull'acuto non regge la cronicità, che non ha un inizio né una fine e richiede contenitori di presa in carico | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **ADI - Assistenza domiciliare integrata** (*integrated home care*) | N | Erogazione di prestazioni sanitarie e sociosanitarie al domicilio dell'assistito, articolata per livelli di intensità | [F01](01-sistema-sanitario-italiano.md) |
| **ADT** | S | Famiglia di messaggi HL7 v2 dedicata all'anagrafica e ai contatti assistenziali: ammissione, dimissione, trasferimento, aggiornamento anagrafico | [F05](05-standard-di-interoperabilita.md), [PRO](../04_protocols/00-indice.md) |
| **Aderenza** (*adherence*) | P | Rapporto fra le attese soddisfatte e le attese generate dal piano, in una finestra dichiarata e con esclusioni esplicite. **Trappola:** non è obbedienza, e la sua assenza non è una colpa del paziente ma un dato clinico che richiede interpretazione | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Aderenza terapeutica** (*treatment adherence*) | P | Corrispondenza fra il comportamento reale della persona e lo schema terapeutico concordato. **Trappola:** non è osservabile dal sistema se non per dichiarazione dell'interessato o per dato di terzi; ogni sua misura è un'approssimazione dichiarata | [F09](09-fondamenti-clinici.md) |
| **Adesione informata** (*informed acceptance of the remote channel*) | N | Manifestazione preventiva di volontà con cui la persona accetta di ricevere quella prestazione **attraverso quel canale**. **Trappola:** è un atto clinico distinto sia dal consenso all'atto sanitario sia dal consenso al trattamento dei dati; fonderli rende ingovernabile la revoca | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/06-consenso-e-riservatezza.md) |
| **AEAD** (*authenticated encryption with associated data*) | S | Cifratura autenticata con dati associati: fornisce insieme riservatezza e integrità e lega dati in chiaro al testo cifrato (RFC 5116) | [F12](12-crittografia-e-sicurezza.md) |
| **Affaticamento da allarme** (*alarm fatigue*) | S | Desensibilizzazione progressiva dell'operatore esposto a un numero elevato di allarmi non azionabili. **Trappola:** è un meccanismo documentato di produzione del danno, non un problema di disciplina del personale; va trattato come rischio nel senso di ISO 14971 | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Affiliata nazionale** (*national affiliate*) | S | Organizzazione che adatta gli standard di un ente internazionale al contesto giuridico di un paese. Per gli standard sanitari, in Italia, è HL7 Italia | [F05](05-standard-di-interoperabilita.md) |
| **Affinity Domain Italia** | G | Documento di specifiche tecniche nazionali per l'interoperabilità fra i sistemi regionali del fascicolo sanitario elettronico | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **AGENAS** (*National Agency for Regional Healthcare Services*) | N | Agenzia nazionale per i servizi sanitari regionali, anche agenzia nazionale per la sanità digitale. Gestisce l'infrastruttura nazionale di telemedicina e l'ecosistema dati sanitari, e svolge il Processo di Validazione delle soluzioni terze | [F01](01-sistema-sanitario-italiano.md), [F02](02-prestazioni-di-telemedicina.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **AgID - Agenzia per l'Italia digitale** (*Agency for Digital Italy*) | N | Autorità delle regole tecniche trasversali ai sensi dell'art. 71 del Codice dell'amministrazione digitale: modello di interoperabilità, piattaforma dei dati, accessibilità, riuso. Gestisce la federazione e il registro dell'identità digitale | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Aggiornamento perduto** (*lost update*) | S | Anomalia per cui una modifica viene sovrascritta da un'altra senza che nessuno se ne accorga. Si previene con la concorrenza ottimistica | [F13](13-protocolli.md), [F11](11-fondamenti-informatici.md) |
| **Aggregato** (*aggregate*) | S | Gruppo di entità e oggetti valore trattato come una sola unità di consistenza, che cambia insieme in una sola transazione perché una regola resti vera. **Trappola:** l'aggregato non è un raggruppamento di comodo: è il confine entro cui un'invariante è garantita, e sceglierlo male produce corse critiche che nessun test funzionale intercetta | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](../02_architecture/03-modello-di-dominio.md) |
| **Agilità crittografica** (*cryptographic agility*) | S | Capacità di sostituire algoritmi e dimensioni di chiave senza riscrivere il sistema, grazie all'identificativo dell'algoritmo memorizzato accanto al dato cifrato | [F12](12-crittografia-e-sicurezza.md) |
| **AIC - Autorizzazione all'immissione in commercio** (*marketing authorisation number*) | N | Codice italiano che identifica un medicinale in commercio. **Trappola:** identifica la confezione commerciale, non il principio attivo; sono due livelli diversi e servono a domande diverse | [F05](05-standard-di-interoperabilita.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Alimentazione del fascicolo** (*EHR feeding*) | N | Conferimento di dati e documenti al fascicolo sanitario elettronico da parte dei soggetti obbligati, entro i termini fissati dagli artt. 12–13 del DM 7 settembre 2023 | [F07](07-fse-e-infrastrutture-nazionali.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Allarme clinico** (*clinical alert*) | P | Segnale che comunica che la condizione di una persona richiede attenzione entro un tempo definito. Richiede quattro elementi: condizione, destinatario, scadenza, escalation. **Trappola:** il suo destinatario è il centro erogatore, mai il centro servizi | [F10](10-percorsi-di-cura-e-sicurezza.md), [FUN](../03_functional/05-gestione-degli-allarmi.md) |
| **Allarme tecnico** (*technical alert*) | P | Segnale che il sistema di misura o di trasmissione non funziona. Il destinatario è tecnico e **non ha accesso al contenuto clinico**. **Trappola:** una coda unica di notifiche produce il tecnico che riceve un allarme clinico e il clinico assuefatto agli allarmi tecnici | [F10](10-percorsi-di-cura-e-sicurezza.md), [FUN](../03_functional/05-gestione-degli-allarmi.md) |
| **Almeno una volta** (*at-least-once*) | S | Garanzia di consegna per cui un messaggio arriva una o più volte. **Trappola:** richiede un ricevente idempotente; senza idempotenza «almeno una volta» significa «duplicati in produzione» | [F11](11-fondamenti-informatici.md), [F13](13-protocolli.md) |
| **ALPN** (*Application-Layer Protocol Negotiation*) | S | Negoziazione, dentro la stretta di mano TLS, del protocollo applicativo che verrà usato sulla connessione | [F13](13-protocolli.md) |
| **Al più una volta** (*at-most-once*) | S | Garanzia di consegna senza ritentativi: il messaggio arriva zero o una volta | [F11](11-fondamenti-informatici.md) |
| **Ambiente effimero** (*ephemeral environment*) | P | Servizio avviato in contenitore per la durata di una suite di prove e distrutto alla fine, con stato ricreato da zero a ogni esecuzione | [F17](17-ambiente-di-sviluppo.md), [TEC](../01_technical/08-qualita-e-test.md) |
| **Ambito di accesso effimero** (*ephemeral access scope*) | P | Insieme chiuso di risorse accessibili a un consulente per il tempo necessario alla risposta, distinto dall'accesso al dossier. **Trappola:** senza scadenza obbligatoria non è un ambito effimero, è un accesso permanente con un nome rassicurante | [F14](14-flussi-funzionali.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Amministratore di sistema** (*system administrator*, nell'accezione della disciplina italiana sulla protezione dei dati) | N | Chi ha privilegi tecnici elevati su sistemi che trattano dati personali. Soggetto a designazione individuale, tracciamento degli accessi e verifica periodica dell'operato | [F03](03-il-dato-clinico.md) |
| **Amministratore di sostegno** (*support administrator*; istituto del diritto civile italiano, senza equivalente esatto) | N | Figura di protezione i cui poteri sono **delimitati dal decreto di nomina** e possono non comprendere le decisioni sanitarie. **Trappola:** trattarlo come un tutore è un errore ricorrente; l'ambito va registrato e verificato per singolo atto | [F03](03-il-dato-clinico.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Anagrafe consensi e revoche** (*consent and revocation registry*) | N | Componente dell'infrastruttura nazionale per l'interoperabilità che registra i consensi alla consultazione del fascicolo sanitario elettronico e le loro revoche | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Anagrafica per riferimento** (*reference-based demographics*) | P | Modello in cui i dati anagrafici restano al sistema di origine e il progetto lavora su identificatori esterni qualificati. **Trappola:** è una decisione architetturale, non un ripiego: duplicare l'anagrafica significa diventare un secondo master data e dover riconciliare per sempre | [DOM](../05_domain/03-assistito-professionista-organizzazione.md), [INT](../07_integration/07-dati-e-sincronizzazione.md) |
| **Anamnesi** (*medical history taking*) | S | Raccolta guidata della storia clinica della persona, articolata in familiare, fisiologica, patologica remota e patologica prossima. **Trappola:** è la parte dell'atto medico che il canale a distanza degrada meno; questo è il motivo per cui la televisita funziona nel controllo e non nella prima valutazione | [F09](09-fondamenti-clinici.md) |
| **ANA - Anagrafe nazionale degli assistiti** (*national registry of healthcare beneficiaries*) | N | Anagrafe sanitaria prevista dall'art. 62-*ter* del Codice dell'amministrazione digitale: chi è assistito, da quale Regione, con quale medico di fiducia e con quali esenzioni | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Ancoraggio** (*anchoring*) | P | Impronta della testa di una catena di registro, firmata, marcata temporalmente e conservata separatamente. **Trappola:** è ciò che rende contraddittoria la riscrittura successiva della storia; senza ancoraggio esterno una catena di impronte protegge solo da alterazioni ingenue | [F16](16-architettura-del-progetto.md), [ARC](../02_architecture/07-tracciamento-e-registro-immutabile.md) |
| **Annotazione digitale** (*digital note*; tipologia documentale del diritto italiano, senza equivalente) | N | Documento che sostituisce il referto nella televisita programmata ed erogata dal medico di assistenza primaria (DM 30 settembre 2022, Allegato B) | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Annullamento del documento** (*document voiding*) | P | Cessazione di efficacia di un documento firmato **senza** emissione di una versione sostitutiva. **Trappola:** non è la rettifica, che invece sostituisce; confonderli produce buchi nella catena documentale | [DOM](../05_domain/04-documenti-clinici.md) |
| **Anonimizzazione** (*anonymisation*) | N | Trattamento che rende l'interessato non più identificabile con mezzi ragionevolmente disponibili; fa uscire il dato dal perimetro del Regolamento (UE) 2016/679. **Trappola:** è diversa dalla pseudonimizzazione, che non fa uscire nulla dal perimetro | [F03](03-il-dato-clinico.md) |
| **ANPR - Anagrafe nazionale della popolazione residente** (*national resident population registry*) | N | Anagrafe civile ai sensi dell'art. 62 del Codice dell'amministrazione digitale e del D.P.C.M. 194/2014, subentrata alle anagrafi comunali. Fonte autoritativa di generalità, residenza, stato civile e decesso | [F04](04-identita-e-anagrafiche.md) |
| **AO / AOU - Azienda ospedaliera / Azienda ospedaliero-universitaria** (*hospital trust*) | N | Ospedali costituiti in azienda autonoma, dipendenti dalla Regione e non dall'azienda sanitaria locale | [F01](01-sistema-sanitario-italiano.md) |
| **Append-only** (*archivio a sola aggiunta*) | S | Archivio in cui si può soltanto aggiungere: nessuna modifica e nessuna cancellazione, per nessun ruolo, incluso chi amministra il sistema | [F16](16-architettura-del-progetto.md), [SEC](../06_security/04-tracciamento.md) |
| **`Appointment` / `AppointmentResponse`** | S | Risorse FHIR che rappresentano l'appuntamento e la risposta di un singolo partecipante. **Trappola:** l'appuntamento non è lo slot, e non è il contatto | [F06](06-fhir-da-zero.md) |
| **Arruolamento** (*enrolment*) | P | Inserimento formale della persona in un servizio strutturato di telemedicina, tipico del telemonitoraggio. **Trappola:** è un atto professionale e **precede l'agenda**; trattarlo come una prenotazione fa perdere il momento in cui la responsabilità clinica viene assunta | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Asserzione** (*assertion*) | S | Documento firmato dal gestore dell'identità che dichiara chi è l'utente, quando e come è stato autenticato e con quali attributi. In SAML è un documento XML firmato | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **ASL - Azienda sanitaria locale** (*local health authority*; istituto italiano, l'equivalente inglese è approssimativo) | N | Ente pubblico che garantisce i livelli essenziali di assistenza a un territorio. **Trappola:** ha natura insieme di committente e di erogatore, il che spiega buona parte delle sue procedure. La denominazione varia per Regione: AUSL, ASP, AST, APSS, ATS, ASST | [F01](01-sistema-sanitario-italiano.md) |
| **Assistito** (*beneficiary*, *enrollee*) | N | Persona titolare del diritto all'assistenza. **Trappola:** è una qualifica **amministrativa** e non coincide con «paziente», che è una qualifica clinica; la stessa persona è assistita senza essere paziente per anni | [F01](01-sistema-sanitario-italiano.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Attacco dell'intermediario** (*man in the middle*) | S | Sostituzione delle impronte da parte del server di segnalazione, che si inserisce fra i due estremi di una sessione media. **Trappola:** è precisamente ciò che la verifica indipendente delle chiavi serve a rendere rilevabile; senza quella verifica, «cifrato da estremo a estremo» è un'affermazione non dimostrabile | [F08](08-webrtc-da-zero.md), [SEC](../06_security/05-sicurezza-del-tempo-reale.md) |
| **`Attachment`** | S | Tipo di dato FHIR: contenuto binario o suo riferimento, con tipo, dimensione, impronta e titolo | [F06](06-fhir-da-zero.md) |
| **Attesa di rilevazione** (*expected observation*) | P | Entità generata dal piano che dichiara la grandezza attesa, la finestra e la tolleranza. **Trappola:** l'assenza della misura non è un non-evento: è la transizione di questa entità allo stato «mancata», ed è un fatto clinico | [F16](16-architettura-del-progetto.md), [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **Attesa esponenziale** (*exponential backoff*) | S | Strategia di ritentativo in cui l'intervallo raddoppia a ogni tentativo fino a un tetto. **Trappola:** senza una componente casuale produce ondate sincronizzate che impediscono il recupero del servizio | [F11](11-fondamenti-informatici.md) |
| **Attestazione di origine del contributo** (*developer certificate of origin*) | P | Dichiarazione allegata a ogni commit con cui chi contribuisce afferma di avere il diritto di conferirlo sotto la licenza del progetto. **Trappola:** non è una cessione di diritti d'autore, e non va presentata come tale | [F17](17-ambiente-di-sviluppo.md) |
| **Attestazione di provenienza** (*provenance attestation*) | S | Dichiarazione verificabile di quale sorgente, quale processo e quale ambiente hanno prodotto un artefatto | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/07-catena-di-fornitura.md) |
| **Attività di base della vita quotidiana (ADL)** (*activities of daily living*) | S | Funzioni la cui perdita rende necessaria l'assistenza diretta: igiene, vestirsi, spostarsi, alimentarsi, continenza | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Attività strumentali della vita quotidiana (IADL)** (*instrumental activities of daily living*) | S | Funzioni più complesse, che si perdono per prime: telefono, spesa, preparazione dei pasti, trasporti, **gestione dei farmaci**, gestione del denaro. **Trappola:** la gestione dei farmaci è fra queste, e la sua perdita precede spesso ogni segnale clinico misurabile | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **ATNA** (*Audit Trail and Node Authentication*) | S | Profilo IHE per il tracciamento degli eventi e l'autenticazione di nodo | [F05](05-standard-di-interoperabilita.md), [PRO](../04_protocols/05-ihe.md) |
| **Attore** (*actor*, IHE) | S | Ruolo funzionale che un sistema assume dentro un profilo di integrazione. **Trappola:** è un ruolo, non un prodotto: lo stesso sistema può implementare più attori | [F05](05-standard-di-interoperabilita.md) |
| **Attributo** (*attribute*) | S | Informazione che descrive un'identità senza individuarla. **Trappola:** distinto dall'identificatore, che invece individua; confonderli è il modo in cui un attributo diventa per sbaglio una chiave | [F04](04-identita-e-anagrafiche.md) |
| **`aud` - Audience** | S | Destinatario per cui un token è valido. **Trappola:** un resource server deve **rifiutare** i token non destinati a sé; ometterne la verifica è uno dei difetti più comuni e più sfruttabili | [F13](13-protocolli.md) |
| **`AuditEvent`** | S | Risorsa FHIR che registra chi ha fatto cosa, quando e con quale esito | [F06](06-fhir-da-zero.md) |
| **Auscultazione** (*auscultation*) | S | Ascolto dei suoni interni del corpo con lo stetoscopio. **Trappola:** non è trasferibile attraverso il canale audio ordinario di una videochiamata, che è progettato e compresso per la voce | [F09](09-fondamenti-clinici.md) |
| **Autenticazione** (*authentication*) | S | Prova che chi si presenta controlla la credenziale associata a un'identità. **Trappola:** **non** accerta chi è fisicamente presente. L'accertamento della persona è l'identificazione, ed è un atto del professionista | [F04](04-identita-e-anagrafiche.md), [F12](12-crittografia-e-sicurezza.md) |
| **Autenticazione bilaterale TLS** (*mutual TLS*, mTLS) | S | Variante di TLS in cui anche il client presenta un certificato: l'identità è provata dal canale. È il meccanismo con cui si realizza l'accesso con la tessera sanitaria dotata di microchip | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **Autorità di certificazione** (*certification authority*) | S | Entità che emette certificati attestando il legame fra una chiave pubblica e un'identità | [F12](12-crittografia-e-sicurezza.md) |
| **Autorizzazione** (*authorisation*) | S | Determinazione di che cosa un soggetto **già autenticato** può fare su una risorsa specifica in un contesto specifico | [F12](12-crittografia-e-sicurezza.md) |
| **Autorizzazione sanitaria** (*healthcare facility licence*) | N | Titolo che abilita una struttura all'esercizio. **Trappola:** è il presupposto dell'accreditamento istituzionale e non equivale ad esso | [F01](01-sistema-sanitario-italiano.md) |

### B

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **BALP** (*Basic Audit Log Patterns*) | S | Guida IHE che definisce schemi riusabili per gli eventi di tracciamento | [F05](05-standard-di-interoperabilita.md) |
| **Ballot / public comment** | S | Fase in cui una specifica è sottoposta alla comunità per osservazioni prima della pubblicazione. **Trappola:** una specifica in ballot non è pubblicata, e costruirci sopra significa accettare che cambi | [F05](05-standard-di-interoperabilita.md) |
| **Base giuridica** (*legal basis*) | N | Fondamento di liceità del trattamento dei dati personali. **Trappola:** è un attributo del **trattamento** - combinazione di finalità, categoria di dato e soggetto - non della persona e non del documento. Cercare «la base giuridica del paziente» è la domanda sbagliata | [F03](03-il-dato-clinico.md), [DOM](../05_domain/06-consenso-e-riservatezza.md) |
| **Basic UDI-DI** | N | Identificativo primario di un modello di dispositivo; chiave di accesso a documentazione tecnica, dichiarazione di conformità e registrazioni. **Trappola:** non compare sull'etichetta, e non va confuso con lo UDI-DI | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/04-fascicolo-tecnico.md) |
| **Bearer token** (*credenziale al portatore*) | S | Credenziale che chiunque la possieda può usare. **Trappola:** il nome dice tutto e viene ignorato: un bearer token intercettato è un'identità rubata, e nessun controllo successivo lo rileva | [F13](13-protocolli.md) |
| **Binding** | S | Dichiarazione che un elemento di un profilo prende i valori da un determinato value set | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Binding, forza del** (*binding strength*) | S | Grado di obbligatorietà del binding, in ordine crescente: `example`, `preferred`, `extensible`, `required`. **Trappola:** un binding `required` verso una terminologia che il progetto non può distribuire è un costo, non un dettaglio | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Bitemporalità** (*bitemporality*) | S | Modellazione con due assi temporali indipendenti: quando il fatto è vero nel mondo e quando il sistema lo ha saputo. **Trappola:** senza il secondo asse è impossibile rispondere alla domanda «che cosa sapevamo quel giorno», che è esattamente la domanda che si pone dopo un evento avverso | [F11](11-fondamenti-informatici.md), [ARC](../02_architecture/04-modello-dati.md) |
| **Blocco in testa alla coda** (*head-of-line blocking*) | S | Ritardo di tutti i dati successivi causato dall'attesa di un dato perso che li precede. **Trappola:** è la ragione per cui le garanzie di TCP sono dannose per il media in tempo reale | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **Bozza** (*draft*) | P | Materiale di lavoro non firmato. **Trappola:** **non è un documento clinico**: non è visibile alla persona assistita, non è trasmissibile, non è conservato come tale. Il modello che segue il linguaggio corrente e crea un referto «in stato bozza» prima o poi lo espone in un elenco non filtrato | [DOM](../05_domain/04-documenti-clinici.md) |
| **Branca specialistica** (*clinical specialty*) | N | Area disciplinare della prestazione. **Trappola:** è un attributo del **servizio offerto**, non del professionista in assoluto: lo stesso professionista può erogare in branche diverse presso organizzazioni diverse | [F01](01-sistema-sanitario-italiano.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Bulk Data** | S | Estrazione massiva asincrona di dati FHIR, con avvio, interrogazione periodica dello stato, manifesto e file in formato ndjson | [F13](13-protocolli.md), [PRO](../04_protocols/02-fhir.md) |
| **BUNDLE** (SDP) | S | Meccanismo che fa condividere ad audio, video e canale dati una sola connessione, una sola stretta di mano e una sola allocazione di relay (RFC 8843) | [F08](08-webrtc-da-zero.md) |
| **`Bundle`** (FHIR) | S | Contenitore di risorse; il tipo dichiarato ne determina la semantica. Il **bundle documento** ha la `Composition` come prima voce ed è immutabile e firmabile | [F06](06-fhir-da-zero.md) |
| **Business Glossary** | N | Componente della infrastruttura nazionale di telemedicina che comprende terminology server, strumento di authoring, repository e linee di indirizzo, e pubblica il glossario nazionale di telemedicina | [F02](02-prestazioni-di-telemedicina.md) |

### C

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **CAD - Codice dell'amministrazione digitale** (*Digital Administration Code*) | N | D.lgs. 7 marzo 2005, n. 82. Contiene fra l'altro l'art. 50-*ter* sulla piattaforma nazionale dei dati, l'art. 62 e l'art. 62-*ter* sulle anagrafi, l'art. 64 sull'identità digitale, gli artt. 68–69 sul riuso e l'art. 71 sulle regole tecniche | [F07](07-fse-e-infrastrutture-nazionali.md), [F20](20-fonti-primarie.md) |
| **CAdES / PAdES / XAdES** | N | Formati normalizzati di firma elettronica, rispettivamente per file generici, per documenti PDF e per documenti XML | [F03](03-il-dato-clinico.md), [PRO](../04_protocols/03-documenti-clinici.md) |
| **Cache non persistita** (*non-persistent cache*) | P | Memoria di lavoro che non scrive su disco. **Trappola:** è un requisito, non un'ottimizzazione: per i sistemi di codifica la cui licenza non consente derivati, una cache persistente delle risposte costituirebbe un sottoinsieme derivato | [F17](17-ambiente-di-sviluppo.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Campo, componente, sottocomponente** (*field, component, subcomponent*) | S | I tre livelli di suddivisione interna di un segmento HL7 v2 | [F05](05-standard-di-interoperabilita.md) |
| **Candidato** (*candidate*, ICE) | S | Coppia di indirizzo e porta a cui un estremo di una sessione media può essere raggiunto | [F08](08-webrtc-da-zero.md) |
| **Candidato host** | S | Candidato corrispondente all'indirizzo di un'interfaccia locale del dispositivo | [F08](08-webrtc-da-zero.md) |
| **Candidato server-reflexive** (`srflx`) | S | Indirizzo pubblico del dispositivo, scoperto interrogando un server STUN | [F08](08-webrtc-da-zero.md) |
| **Candidato peer-reflexive** (`prflx`) | S | Indirizzo scoperto durante i controlli di connettività e non annunciato in anticipo | [F08](08-webrtc-da-zero.md) |
| **Candidato relayed** (`relay`) | S | Indirizzo prestato da un server TURN. **Trappola:** ha preferenza di tipo **zero**, cioè è l'ultima scelta; per verificare che il percorso instradato funzioni davvero occorre forzarlo esplicitamente nelle prove | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **`CapabilityStatement`** | S | Risorsa FHIR, elaborabile da una macchina, che descrive che cosa un server sa fare | [F06](06-fhir-da-zero.md) |
| **Cardinalità** (*cardinality*) | S | Numero minimo e massimo di occorrenze ammesse per un elemento, nella forma `min..max` | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Caregiver** (*caregiver*) | N | Persona che assiste stabilmente l'assistito. **Trappola:** **assistere non è rappresentare**. Il caregiver accompagna, aiuta, può essere presente in sessione, ma non può prestare consenso al posto di una persona capace, in nessuna configurazione | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Cartella clinica** (*inpatient medical record*) | N | Documentazione formata durante un episodio di ricovero presso una struttura. **Trappola:** non è la cartella clinica elettronica ambulatoriale, non è il dossier sanitario e non è il fascicolo: quattro contenitori con quattro regimi di accesso | [F03](03-il-dato-clinico.md) |
| **Cartella clinica elettronica** (*local electronic health record*) | P | Repository clinico del singolo soggetto erogante. **Trappola:** nel modello di integrazione del progetto **resta al sistema dell'integratore**; Telemedic non è il master data clinico | [F03](03-il-dato-clinico.md), [DOM](../05_domain/01-linguaggio-ubiquo.md) |
| **Case manager** (*case manager*) | P | Figura di coordinamento continuativo della presa in carico e punto di contatto della persona assistita; micro-servizio essenziale del telemonitoraggio | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Catalogo delle prestazioni** (*service catalogue*) | P | Insieme dei tipi di prestazione con codice, canali ammessi, professioni abilitate, artefatti obbligatori e validità temporale | [DOM](../05_domain/02-le-prestazioni-modellate.md), [FUN](../03_functional/02-catalogo-dei-requisiti.md) |
| **Catena di fiducia** (*chain of trust*) | S | Sequenza di certificati che, dal certificato finale, risale a una radice presente nell'archivio fidato | [F12](12-crittografia-e-sicurezza.md) |
| **Catena di hash / catena di impronte** (*hash chain*) | S | Sequenza in cui ogni voce porta l'impronta del proprio contenuto e quella della voce precedente, così che ogni alterazione o rimozione sia rilevabile. **Trappola:** è ciò che il versionamento delle entità **non** fornisce; vedi la voce «Registro degli accessi» | [F12](12-crittografia-e-sicurezza.md), [F16](16-architettura-del-progetto.md) |
| **Catena di sostituzione** (*substitution chain*) | P | Collegamento fra appuntamenti riprogrammati che conserva la data della richiesta originaria ai fini dei tempi di attesa. **Trappola:** perdere questo collegamento significa azzerare l'attesa a ogni spostamento, e produce un indicatore falso | [F14](14-flussi-funzionali.md) |
| **Categorie particolari di dati** (*special categories of personal data*) | N | Le categorie dell'art. 9, par. 1 del Regolamento (UE) 2016/679, fra cui i dati relativi alla salute. Il trattamento è vietato salvo deroghe tassative | [F03](03-il-dato-clinico.md) |
| **Categorie prioritarie** (*priority categories*, EHDS) | N | Insiemi di dati sanitari che devono circolare nello Spazio europeo dei dati sanitari: profilo sanitario sintetico, prescrizione elettronica, referti di laboratorio e di diagnostica per immagini, lettere di dimissione | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Cattura delle modifiche** (*change data capture*) | S | Estrazione delle variazioni di una base dati a partire dal suo registro di replica | [F11](11-fondamenti-informatici.md) |
| **CdC - Casa della comunità** (*community health centre*; istituto italiano introdotto dal DM 77/2022) | N | Struttura fisica ad accesso libero in cui opera un'équipe multiprofessionale territoriale | [F01](01-sistema-sanitario-italiano.md) |
| **CDA - Clinical Document Architecture** | S | Standard HL7 per i documenti clinici, in XML, articolato in intestazione e corpo | [F05](05-standard-di-interoperabilita.md), [PRO](../04_protocols/03-documenti-clinici.md) |
| **CDA2** | G | Rilascio 2 di CDA, standard documentale nazionale del fascicolo sanitario elettronico, veicolato dentro un PDF firmato digitalmente. **Trappola:** finché i template nazionali per la telemedicina non sono acquisiti, il progetto modella un **dataset canonico** e tratta la serializzazione come sostituibile, per non cablare un template che potrebbe cambiare | [F07](07-fse-e-infrastrutture-nazionali.md), [PRO](../04_protocols/03-documenti-clinici.md) |
| **Centro erogatore** (*delivering centre*) | N | Struttura con compiti prettamente sanitari, che eroga le prestazioni e **gestisce gli allarmi clinici** (DM 21 settembre 2022, Allegato A) | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Centro servizi** (*service centre*) | N | Struttura con compiti prettamente tecnici: manutenzione, gestione delle utenze, assistenza agli utenti, dispositivi a domicilio, **allarmi tecnici** (DM 21 settembre 2022, Allegato A). **Trappola:** la distinzione fra i due centri non è organizzativa, è normativa, e determina a chi va instradato ciascun tipo di allarme | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Certificato X.509** | S | Documento elettronico che lega una chiave pubblica a un'identità, firmato da un'autorità di certificazione (RFC 5280) | [F12](12-crittografia-e-sicurezza.md) |
| **CGNAT** (*Carrier-Grade NAT*) | S | Secondo livello di traduzione degli indirizzi, applicato dentro la rete dell'operatore, con indirizzi nello spazio riservato dalla RFC 6598. **Trappola:** è comune sulle reti mobili italiane, ed è una delle ragioni per cui il percorso diretto fallisce con pazienti che usano lo smartphone | [F08](08-webrtc-da-zero.md) |
| **Chaining / reverse chaining** | S | Attraversamento dei riferimenti fra risorse FHIR, in avanti o all'indietro, dentro i criteri di ricerca | [F06](06-fhir-da-zero.md) |
| **Chiave di deduplicazione** (*deduplication key*) | S | Identificativo con cui un consumatore riconosce di aver già trattato un messaggio. **Trappola:** va conservata **più a lungo** della finestra massima di ritentativo, altrimenti il duplicato arriva dopo che la chiave è scaduta | [F16](16-architettura-del-progetto.md) |
| **Chiave di idempotenza** (*idempotency key*) | S | Identificativo generato dal chiamante che identifica **l'intenzione, non il tentativo**, e consente al ricevente di riconoscere i ritentativi | [F11](11-fondamenti-informatici.md), [PRO](../04_protocols/06-api-di-progetto.md) |
| **Chiave di partizionamento** (*partition key*) | S | Valore che determina in quale partizione di un log finisce un evento, e quindi il suo ordinamento relativo. **Trappola:** l'ordine è garantito solo dentro la partizione; scegliere male la chiave significa perdere l'ordine fra eventi che devono averlo | [F11](11-fondamenti-informatici.md) |
| **CIE - Carta d'identità elettronica** (*Italian electronic identity card*) | N | Canale di identità digitale ai sensi dell'art. 64 del Codice dell'amministrazione digitale; il gestore dell'identità è il Ministero dell'Interno. Disponibile sia in SAML 2.0 sia in OpenID Connect. **Trappola:** le regole tecniche dichiarano che il livello riportato nell'asserzione di ritorno è sempre il massimo, quindi il livello effettivamente eseguito **non è desumibile dall'asserzione** | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Cifrario a blocchi** (*block cipher*) | S | Algoritmo che trasforma blocchi di dimensione fissa sotto il controllo di una chiave | [F12](12-crittografia-e-sicurezza.md) |
| **Cifrario a flusso** (*stream cipher*) | S | Algoritmo che genera un flusso di chiave combinato bit a bit con il testo in chiaro | [F12](12-crittografia-e-sicurezza.md) |
| **Cifratura a riposo** (*encryption at rest*) | S | Protezione dei dati memorizzati. **Trappola:** protegge dal furto del supporto, **non** dall'accesso ottenuto attraverso il sistema; dichiararla come misura contro l'accesso indebito è un errore ricorrente | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/03-protezione-dei-dati.md) |
| **Cifratura da estremo a estremo** (*end-to-end encryption*) | S | Cifratura in cui nessun componente intermedio, incluso il server del servizio, possiede le chiavi. **Trappola:** l'affermazione è dimostrabile solo con la verifica indipendente delle chiavi da parte dei due interlocutori, e **decade quando la registrazione lato server è attiva** | [F08](08-webrtc-da-zero.md), [F12](12-crittografia-e-sicurezza.md) |
| **Cifratura ibrida** (*hybrid encryption*) | S | Combinazione di cifratura asimmetrica per la chiave e simmetrica per il contenuto | [F12](12-crittografia-e-sicurezza.md) |
| **Cifratura in transito** (*encryption in transit*) | S | Protezione dei dati che attraversano una rete. **Trappola:** si interrompe a ogni punto di terminazione; una catena di tratte cifrate non è una cifratura da estremo a estremo | [F12](12-crittografia-e-sicurezza.md) |
| **Cinquina** (*five-tuple*) | S | Protocollo, indirizzo e porta di origine, indirizzo e porta di destinazione: l'insieme che identifica una comunicazione | [F08](08-webrtc-da-zero.md) |
| **CIPESS** | N | Comitato interministeriale per la programmazione economica e lo sviluppo sostenibile; delibera il riparto del fabbisogno sanitario fra le Regioni | [F01](01-sistema-sanitario-italiano.md) |
| **Claim** (*asserzione contenuta in un token*) | S | Affermazione contenuta in un token. **Trappola:** un claim è vero quanto è affidabile chi lo ha emesso: la sua presenza non è una verifica | [F13](13-protocolli.md) |
| **Classe di sicurezza software (A / B / C)** (*software safety classification*) | N | Classificazione della IEC 62304 fondata sul danno possibile **dopo** le misure di controllo esterne al sistema software; determina quali processi del ciclo di vita sono obbligatori. La destinazione d'uso congelata dal progetto mantiene la classe **B** | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/02-qualificazione-e-classificazione.md) |
| **Classi di rischio (I, IIa, IIb, III)** (*risk classes*) | N | Classificazione dei dispositivi medici secondo l'Allegato VIII del Regolamento (UE) 2017/745; determina la procedura di valutazione della conformità applicabile. Il progetto si colloca in **Classe IIa** | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/02-qualificazione-e-classificazione.md) |
| **CloudEvents** | S | Specifica che definisce una busta comune per gli eventi e i suoi legami con i protocolli di trasporto | [F13](13-protocolli.md), [PRO](../04_protocols/07-eventi-e-webhook.md) |
| **Code system** (*sistema di codifica*) | S | Insieme dei codici possibili con il loro significato, identificato da un URI canonico | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **`CodeableConcept`** | S | Tipo di dato FHIR: un concetto espresso da zero o più codifiche, più un testo destinato all'essere umano | [F06](06-fhir-da-zero.md) |
| **Codec** | S | Algoritmo di compressione e decompressione del segnale audio o video | [F08](08-webrtc-da-zero.md) |
| **Codice ANA** | N | Identificatore dell'assistito nell'anagrafe nazionale degli assistiti, con il proprio dominio di attribuzione dichiarato | [F04](04-identita-e-anagrafiche.md) |
| **Codice Belfiore** (*municipality cadastral code*) | N | Codice di quattro caratteri del comune o dello Stato di nascita, contenuto nelle posizioni 12–15 del codice fiscale | [F04](04-identita-e-anagrafiche.md) |
| **Codice di priorità** (*priority class*) | N | Classe di urgenza che fissa il tempo massimo entro cui la prestazione richiesta va erogata. **Trappola:** non è la gravità clinica della persona, ed è una proprietà della **richiesta**, non del paziente | [F01](01-sistema-sanitario-italiano.md) |
| **Codice fiscale** (*Italian tax code*) | N | Identificatore **tributario** della persona fisica, previsto dal D.P.R. 605/1973 e dal D.M. 23 dicembre 1976, adottato dalla sanità come chiave di correlazione. **Trappola:** è calcolabile a partire dai dati anagrafici, mutevole, non universale e **non segreto**: usarlo come credenziale o come prova di identità è un difetto di sicurezza | [F04](04-identita-e-anagrafiche.md) |
| **`Coding`** | S | Tipo di dato FHIR: singola codifica, con sistema, versione, codice e descrizione ufficiale | [F06](06-fhir-da-zero.md) |
| **Coda di riconciliazione** (*reconciliation queue*) | P | Elenco visibile delle trasmissioni fallite verso sistemi esterni, con causa, numero di tentativi e possibilità di rilancio. **Trappola:** senza una coda visibile a un essere umano, un fallimento di trasmissione verso il fascicolo diventa silenzioso e si scopre dopo mesi | [F14](14-flussi-funzionali.md) |
| **Coda di scarto** (*dead letter queue*) | S | Destinazione dei messaggi che hanno esaurito i ritentativi. **Trappola:** una coda di scarto che nessuno guarda è equivalente alla perdita del messaggio | [F13](13-protocolli.md) |
| **Coerenza finale** (*eventual consistency*) | S | Proprietà per cui, cessate le scritture, tutte le copie convergono, senza limite dichiarato sul quando. **Trappola:** «finale» non significa «rapida»; in un flusso clinico va dichiarato che cosa l'utente vede nel frattempo | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Collisione delle offerte** (*glare*) | S | Situazione in cui i due estremi emettono un'offerta simultaneamente; si risolve assegnando un ruolo cortese e uno scortese | [F08](08-webrtc-da-zero.md) |
| **Commit a due fasi** (*two-phase commit*, 2PC) | S | Protocollo di transazione distribuita con fase di preparazione e fase di conferma. **Trappola:** il progetto lo evita: blocca risorse e trasforma un guasto parziale in un blocco totale | [F11](11-fondamenti-informatici.md) |
| **Compensazione** (*compensating transaction*) | S | Transazione che contrasta gli effetti di un passo precedente di una saga. **Trappola:** in ambito clinico non è un annullamento: è una **rettifica tracciata**, perché il fatto è accaduto e non può essere cancellato dalla storia | [F11](11-fondamenti-informatici.md) |
| **Compenso** (*compensation*, in senso fisiologico) | S | Insieme delle risposte fisiologiche che mantengono una grandezza regolata entro l'intervallo utile nonostante una perturbazione. **Trappola:** un parametro «normale» in compenso non significa assenza di problema: significa che il problema è ancora contenuto | [F09](09-fondamenti-clinici.md) |
| **Complessità assistenziale** (*care complexity*) | P | Insieme delle dimensioni non cliniche - sociali, abitative, cognitive, di alfabetizzazione - che determinano la realizzabilità concreta di un percorso a distanza | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Compliance digitale dell'assistito** (*patient digital readiness*) | P | Capacità della persona di interagire con i sistemi digitali. **Trappola:** è una dimensione della valutazione di eseguibilità distinta dalla verifica tecnica del dispositivo: un tablet perfettamente funzionante in mano a chi non sa usarlo non rende eseguibile la prestazione | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **`Composition`** | S | Risorsa FHIR che rappresenta un documento clinico strutturato in sezioni. Nel progetto **è il referto**; `DiagnosticReport` è soltanto una proiezione in sola lettura per gli integratori che la attendono | [F06](06-fhir-da-zero.md), [PRO](../04_protocols/03-documenti-clinici.md) |
| **Composizione** (*MCU*, *multipoint control unit*) | S | Server che decodifica i flussi, li compone e li ricodifica. **Trappola:** massima latenza e massimo costo di calcolo, e come ogni server intermedio termina la cifratura | [F08](08-webrtc-da-zero.md) |
| **Concetto codificato** (*coded concept*) | S | Valore qualificato da sistema di codifica, versione e codice, con eventuale testo originale | [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Concorrenza ottimistica** (*optimistic concurrency*) | S | Strategia in cui non si blocca la risorsa: si fa fallire chi salva a partire da una versione superata | [F13](13-protocolli.md), [F06](06-fhir-da-zero.md) |
| **`Condition`** | S | Risorsa FHIR che rappresenta un problema o una diagnosi, con stato clinico e stato di verifica. **Trappola:** i due stati sono distinti, e un sospetto diagnostico non è una diagnosi confermata | [F06](06-fhir-da-zero.md) |
| **Condizione latente** (*latent condition*) | S | Falla introdotta a monte da decisioni di progettazione o di organizzazione, innocua finché non incontra la circostanza che la attiva. **Trappola:** il software produce condizioni latenti, non errori attivi: chi scrive il codice non commette l'errore, costruisce l'ambiente in cui diventa possibile | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Conferenza Stato-Regioni** | N | Organo di raccordo fra Stato e Regioni. Produce **Intese**, vincolanti, e **Accordi**, che diventano cogenti previo recepimento regionale. **Trappola:** un Accordo non recepito da una Regione non è applicabile in quella Regione | [F01](01-sistema-sanitario-italiano.md), [F20](20-fonti-primarie.md) |
| **Confine di fiducia** (*trust boundary*) | S | Linea che separa zone con assunzioni di sicurezza diverse; ogni attraversamento richiede validazione in ingresso e autorizzazione in uscita | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/01-modello-di-minaccia.md) |
| **Consegna differita** (*deferred delivery*) | P | Differimento motivato della messa a disposizione di un documento alla persona assistita, con data prevista registrata. **Trappola:** è una scelta clinica legittima e va distinta dall'inadempimento; il modello che non le separa non permette di misurare né l'una né l'altro | [DOM](../05_domain/04-documenti-clinici.md) |
| **Consenso all'atto sanitario** (*informed consent to treatment*) | N | Manifestazione di volontà relativa all'esecuzione dell'atto, preceduta da informazione adeguata (L. 219/2017) | [F03](03-il-dato-clinico.md), [DOM](../05_domain/06-consenso-e-riservatezza.md) |
| **Consenso alla consultazione** (*consent to access*) | N | Autorizzazione alla consultazione del fascicolo sanitario elettronico da parte di terzi (DM 7 settembre 2023, art. 8) | [DOM](../05_domain/06-consenso-e-riservatezza.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Consenso alla registrazione** (*consent to record*) | P | Consenso specifico, per singola sessione, alla cattura audio-video. **Trappola:** **non è ereditabile** da un consenso generale, e l'informativa che lo accompagna deve dichiarare che con la registrazione attiva la sessione non è più cifrata da estremo a estremo | [DOM](../05_domain/06-consenso-e-riservatezza.md), [SEC](../06_security/05-sicurezza-del-tempo-reale.md) |
| **Consenso al trattamento dei dati** (*data processing consent*) | N | Manifestazione di volontà sul trattamento dei dati, ove il consenso sia la base giuridica applicabile. **Trappola:** per la finalità di cura il consenso **non è tipicamente** la base giuridica del trattamento; assumerlo produce un modello che chiede consensi non dovuti e ne omette di dovuti | [F03](03-il-dato-clinico.md), [DOM](../05_domain/06-consenso-e-riservatezza.md) |
| **`Consent`** | S | Risorsa FHIR che registra un consenso, con ambito, periodo, azioni consentite ed eccezioni | [F06](06-fhir-da-zero.md) |
| **Consegna almeno una volta** | S | Vedi *Almeno una volta* | [F16](16-architettura-del-progetto.md) |
| **Conservazione a norma** (*compliant digital preservation*) | N | Processo che garantisce nel tempo autenticità, integrità, leggibilità e reperibilità del documento informatico. **Trappola:** **non è il backup**, e nessuna politica di backup la soddisfa | [F03](03-il-dato-clinico.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Consistenza forte** (*strong consistency*) | S | Modello in cui ogni lettura successiva a una scrittura confermata osserva quella scrittura | [F11](11-fondamenti-informatici.md) |
| **Contatto** (*encounter*) | S | Singola interazione fra la persona assistita e il sistema di erogazione, in un luogo anche virtuale, con un inizio e una fine. **Trappola:** nel codice si chiama `Encounter`, **mai** `Contact`, che nello standard designa il recapito. Ed è un aggregato distinto dalla sessione media | [F14](14-flussi-funzionali.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **`contained`** | S | Risorsa FHIR che vive dentro un'altra, senza esistenza autonoma; si referenzia con il carattere `#` | [F06](06-fhir-da-zero.md) |
| **Contenitore** (*container*, formato media) | S | Formato di file che intreccia i flussi audio e video. **Trappola:** il supporto **diverge fra browser** e nessun formato è universale: va negoziato a runtime e registrato nei metadati, mai assunto | [F08](08-webrtc-da-zero.md) |
| **Contenitori effimeri** | P | Vedi *Ambiente effimero* | [F17](17-ambiente-di-sviluppo.md) |
| **Contesto delimitato** (*bounded context*) | S | Confine esplicito dentro il quale un modello e il suo linguaggio sono coerenti e validi, e dentro il quale un termine ha un solo significato. **Trappola:** il modello è **privato** del contesto; la traduzione avviene al confine e non dentro | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](../02_architecture/02-contesti-delimitati.md) |
| **Contesto di lancio** (*launch context*) | S | Paziente, contatto e altre risorse consegnati a un'applicazione clinica all'avvio, senza chiederli all'utente | [F13](13-protocolli.md), [INT](../07_integration/03-integrazione-per-api.md) |
| **Contesto sicuro** (*secure context*) | S | Condizione richiesta dal browser senza la quale l'acquisizione di telecamera, microfono e schermo non funziona. In sviluppo locale è soddisfatta dall'origine di loopback | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **Contitolarità** (*joint controllership*) | N | Determinazione congiunta di finalità e mezzi da parte di più titolari, con accordo trasparente ai sensi dell'art. 26 del Regolamento (UE) 2016/679 | [F03](03-il-dato-clinico.md) |
| **Contratto di interfaccia** (*interface contract*) | S | Descrizione della promessa fra due parti, verificabile da una macchina | [F13](13-protocolli.md), [PRO](../04_protocols/06-api-di-progetto.md) |
| **Contropressione** (*backpressure*) | S | Meccanismo con cui un componente lento comunica a chi lo alimenta di rallentare | [F11](11-fondamenti-informatici.md) |
| **Controllo della congestione** (*congestion control*) | S | Adattamento del bitrate alle condizioni della rete. **Trappola:** non è codice del progetto: sta nel browser, e va misurato, non riscritto | [F08](08-webrtc-da-zero.md) |
| **Controllo di connettività** (*connectivity check*) | S | Richiesta STUN autenticata inviata su una coppia di candidati per verificarne il funzionamento | [F08](08-webrtc-da-zero.md) |
| **Controllo di consenso** (*consent freshness*) | S | Verifica periodica che l'altro estremo di una sessione media sia ancora presente e consenziente a ricevere traffico | [F08](08-webrtc-da-zero.md) |
| **Controllo obbligatorio di pipeline** (*required check*) | P | Verifica che **blocca** l'integrazione invece di emettere un avviso. **Trappola:** è una condizione di ammissibilità, non un giudizio di qualità, e non si aggira: se blocca legittimamente un lavoro legittimo, si corregge il controllo con la revisione prevista | [F17](17-ambiente-di-sviluppo.md), [TEC](../01_technical/09-integrazione-continua-e-rilascio.md) |
| **Copertura oraria dichiarata** (*declared service coverage*) | P | Giorni, fasce orarie, tipo di risposta garantita, termine di presa in carico atteso e comportamento fuori copertura. **Trappola:** è un **requisito di sicurezza**, non un parametro commerciale: un allarme generato fuori copertura senza una regola dichiarata è un allarme che nessuno riceve | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Copertura per mutazione** (*mutation coverage*) | S | Misura che introduce modifiche automatiche al codice e verifica che le prove le rilevino. **Trappola:** è ciò che distingue una suite che **verifica** da una che si limita a **eseguire**; la copertura di riga non fa questa distinzione | [F17](17-ambiente-di-sviluppo.md), [TEC](../01_technical/08-qualita-e-test.md) |
| **Coreografia** (*choreography*) | S | Coordinamento in cui ogni componente reagisce agli eventi altrui e nessuno conosce il processo nel suo insieme. **Trappola:** rende il processo non interrogabile: nessun componente può rispondere alla domanda «a che punto è» | [F16](16-architettura-del-progetto.md) |
| **Correlazione** (*correlation*) | S | Propagazione di un identificativo comune attraverso tutti i componenti coinvolti in una richiesta | [F11](11-fondamenti-informatici.md), [TEC](../01_technical/06-osservabilita.md) |
| **Correzione d'errore in avanti** (*forward error correction*, FEC) | S | Ridondanza inviata preventivamente: costa banda sempre, ma non costa un giro di rete (RFC 8854) | [F08](08-webrtc-da-zero.md) |
| **Correzione d'errore incorporata** (`useinbandfec`) | S | Meccanismo del codec audio Opus che include nel pacchetto una copia a bassa fedeltà del pacchetto precedente | [F08](08-webrtc-da-zero.md) |
| **Corrispondenza deterministica / probabilistica** (*deterministic / probabilistic matching*) | S | Le due famiglie di tecniche di riconciliazione anagrafica: regola esatta su un identificatore, oppure punteggio di somiglianza su più attributi con soglie. **Trappola:** la seconda non produce mai una certezza, e la fusione delle anagrafiche non può essere automatica | [F04](04-identita-e-anagrafiche.md) |
| **Costruzione riproducibile** (*reproducible build*) | S | Proprietà per cui due costruzioni della stessa revisione, su macchine e in momenti diversi, producono artefatti identici byte per byte | [F17](17-ambiente-di-sviluppo.md), [SEC](../06_security/07-catena-di-fornitura.md) |
| **COT - Centrale operativa territoriale** (*territorial operations centre*; istituto italiano del DM 77/2022) | N | Servizio che coordina la presa in carico fra i diversi contesti assistenziali; nodo naturale della telemedicina territoriale | [F01](01-sistema-sanitario-italiano.md) |
| **CRA - Cyber Resilience Act** | N | Regolamento (UE) 2024/2847 sui requisiti orizzontali di cibersicurezza dei prodotti con elementi digitali. **Trappola:** l'esclusione dei dispositivi medici opera **per prodotto, non per progetto**: gli artefatti non coperti da una marcatura ricadono comunque nel regolamento | [F12](12-crittografia-e-sicurezza.md), [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/01-inquadramento-normativo.md) |
| **Credenziale temporanea** (*ephemeral credential*) | S | Credenziale del server di relay a scadenza breve, derivata via HMAC da un segreto condiviso. **Trappola:** sostituisce le credenziali statiche, che in un client web sono per costruzione pubbliche | [F08](08-webrtc-da-zero.md) |
| **Criterio dell'ottanta per cento** (*80% rule*) | S | Principio di FHIR per cui le risorse contengono gli elementi che servono alla maggior parte delle implementazioni; il resto si aggiunge con estensioni | [F06](06-fhir-da-zero.md) |
| **Cronico** (*chronic*) | S | Detto di una condizione che non si risolve e accompagna la persona: si controlla, non si guarisce. **Trappola:** richiede contenitori di presa in carico e non episodi; il modello costruito sull'acuto non la rappresenta | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **CT - Consistent Time** | S | Profilo IHE per la sincronizzazione oraria; è prerequisito del profilo di tracciamento | [F05](05-standard-di-interoperabilita.md) |
| **Cultura giusta** (*just culture*) | S | Modello che distingue errore umano, comportamento a rischio e violazione consapevole, separando l'apprendimento dalla sanzione | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **CUP - Centro unico di prenotazione** (*central booking service*) | N | Servizio che centralizza le prenotazioni per più soggetti eroganti. **Trappola:** è un **canale**, non un'agenda; assumere che sia il proprietario della disponibilità porta a un modello sbagliato | [F01](01-sistema-sanitario-italiano.md) |
| **Curva di dissociazione dell'emoglobina** (*oxyhaemoglobin dissociation curve*) | S | Relazione a forma di esse fra ossigeno disciolto nel sangue e saturazione dell'emoglobina. **Trappola:** rende la saturazione poco sensibile nella zona alta, cioè proprio dove si vorrebbe cogliere il peggioramento precoce | [F09](09-fondamenti-clinici.md) |
| **Custode di software open source** (*open-source software steward*) | N | Persona giuridica che sostiene sistematicamente un progetto open source, con obblighi ridotti ai sensi dell'art. 24 del Regolamento (UE) 2024/2847 (definizione all'art. 3, punto 14) | [F12](12-crittografia-e-sicurezza.md), [CMP](../08_compliance/01-inquadramento-normativo.md) |

### D

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Danno** (*harm*) | N | Lesione fisica o danno alla salute delle persone, nella definizione della ISO 14971. **Trappola:** nel linguaggio corrente «danno» comprende anche il danno economico o reputazionale; nella gestione del rischio del dispositivo no | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/05-gestione-del-rischio.md) |
| **Dataset canonico** (*canonical dataset*) | P | Definizione versionata del contenuto informativo di un documento, indipendente dalla forma in cui viaggia. **Trappola:** esiste per una ragione precisa - senza un termine proprio si finisce per dire «il CDA», e in tre mesi il modello dipende da un template che potrebbe cambiare | [F07](07-fse-e-infrastrutture-nazionali.md), [F16](16-architettura-del-progetto.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Dati a maggiore tutela dell'anonimato** (*highly protected health data*; categoria del diritto italiano, senza equivalente esatto) | N | Categoria chiusa definita dall'art. 6 del DM 7 settembre 2023, visibile a terzi solo previo consenso esplicito reso al soggetto erogante. **Trappola:** è una categoria **chiusa**: non si estende per analogia e non si restringe per comodità implementativa | [F03](03-il-dato-clinico.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Dati avversi** (*adversarial test data*) | P | Insieme di dati sintetici deliberatamente difficili - nomi con diacritici, serie con interruzioni, misure fuori ordine - usato nelle prove come dotazione ordinaria e non come curiosità | [F17](17-ambiente-di-sviluppo.md) |
| **Dato relativo alla salute** (*data concerning health*) | N | Dato personale che rivela informazioni sullo stato di salute passato, presente o futuro, **indipendentemente dalla fonte**. **Trappola:** l'ultima parola è quella che conta: un'esenzione per patologia rivela la patologia anche se il campo si chiama «codice amministrativo» | [F03](03-il-dato-clinico.md) |
| **Dato sintetico** (*synthetic data*) | P | Dato generato dal progetto, non derivato da persone reali. **Trappola:** è l'**unico** ammesso in ogni artefatto e in ogni ambiente non di esercizio, senza eccezioni; l'investimento va nel generatore, non nelle deroghe | [F17](17-ambiente-di-sviluppo.md), [F00](00-come-usare-questa-guida.md) |
| **Deduplicazione** (*deduplication*) | S | Scarto, da parte del ricevente, di ciò che è già stato elaborato, riconosciuto da un identificativo | [F13](13-protocolli.md) |
| **Deficit di polso** (*pulse deficit*) | S | Differenza fra la frequenza cardiaca e la frequenza del polso, quando alcune contrazioni non generano un'onda pulsatile percepibile. **Trappola:** un dispositivo che misura il polso può quindi riportare una frequenza inferiore a quella reale del cuore | [F09](09-fondamenti-clinici.md) |
| **Delega esplicita** (*explicit delegation*) | S | Rappresentazione in cui il contesto autorizzativo porta insieme il soggetto per conto del quale si agisce **e** l'attore che agisce, con il claim `act` della RFC 8693. **Trappola:** è l'opposto dell'impersonificazione, in cui l'attore scompare e il registro degli accessi diventa inutilizzabile | [F13](13-protocolli.md), [F16](16-architettura-del-progetto.md), [INT](../07_integration/06-identita-e-delega.md) |
| **Delegato** (*delegate*) | P | Soggetto autorizzato dalla persona assistita capace ad accedere ai documenti o a operare per suo conto, con ambito e scadenza obbligatoria. **Trappola:** non è il rappresentante legale e non è il caregiver: sono tre titoli diversi con tre fonti diverse | [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **DEMA** | N | Flusso della ricetta dematerializzata verso il Sistema Tessera Sanitaria | [F01](01-sistema-sanitario-italiano.md) |
| **Desensibilizzazione all'allarme** | S | Vedi *Affaticamento da allarme* | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Destinazione d'uso** (*intended purpose*) | N | Uso al quale il fabbricante destina il dispositivo secondo l'etichetta, le istruzioni per l'uso, il materiale promozionale e la valutazione clinica (Reg. (UE) 2017/745, art. 2, punto 12). **Trappola:** è il documento più costoso da sbagliare, perché una singola frase sposta la classificazione. La formulazione congelata dal progetto è «**raccolta differita di parametri per la revisione periodica del professionista**» | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/02-qualificazione-e-classificazione.md) |
| **Determinismo del generatore** (*generator determinism*) | P | Proprietà per cui, a parità di seme, il dataset sintetico prodotto è identico. **Trappola:** è ciò che rende riproducibile una segnalazione di difetto; senza, il caso non si riproduce e la correzione non si verifica | [F17](17-ambiente-di-sviluppo.md) |
| **Deviazione dal percorso** (*pathway deviation*) | P | Scostamento motivato dell'istanza rispetto alla definizione del percorso. **Trappola:** è un **fatto registrato**, non un errore di validazione: un sistema che impedisce la deviazione impedisce la medicina | [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **`Device`** | S | Risorsa FHIR che rappresenta il dispositivo che origina una misura | [F06](06-fhir-da-zero.md) |
| **Diagnosi** (*diagnosis*) | S | Conclusione motivata su quale condizione spieghi il quadro clinico. **Trappola:** ha autore, data e grado di certezza; rappresentarla come una stringa senza questi tre attributi la rende inutilizzabile e potenzialmente pericolosa | [F09](09-fondamenti-clinici.md) |
| **Diagnosi differenziale** (*differential diagnosis*) | S | Confronto sistematico fra le ipotesi, ordinate non solo per probabilità ma anche per **gravità delle conseguenze se mancate** | [F09](09-fondamenti-clinici.md) |
| **`DiagnosticReport`** | S | Risorsa FHIR del referto di un servizio diagnostico. **Trappola:** nel progetto è una **proiezione in sola lettura** per gli integratori che la attendono, mai l'artefatto primario, che è la `Composition` dentro un bundle documento | [F06](06-fhir-da-zero.md), [PRO](../04_protocols/02-fhir.md) |
| **Diario clinico** (*progress notes*) | P | Annotazioni cronologiche del decorso. **Trappola:** non è il referto, non è destinato alla persona assistita e non si trasmette ai sistemi esterni per automatismo | [F03](03-il-dato-clinico.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Dichiarazione di conformità UE** (*EU declaration of conformity*) | N | Atto con cui il fabbricante assume la responsabilità della conformità del dispositivo (Reg. (UE) 2017/745, art. 19 e Allegato IV). **Trappola:** oggi il prodotto non è coperto da alcuna dichiarazione di conformità | [F15](15-regolatorio-da-zero.md) |
| **DICOM** | S | Standard delle immagini biomediche: formato dei file e servizi di rete | [F05](05-standard-di-interoperabilita.md) |
| **DICOMweb** | S | Insieme dei servizi RESTful definiti da DICOM per ricerca, recupero e memorizzazione | [F05](05-standard-di-interoperabilita.md), [F13](13-protocolli.md) |
| **`differential` / `snapshot`** | S | In un profilo FHIR: le sole differenze rispetto alla struttura di base, oppure la struttura completa risultante | [F06](06-fhir-da-zero.md) |
| **Digest** (*impronta*, *riassunto*) | S | Output di lunghezza fissa di una funzione di hash | [F12](12-crittografia-e-sicurezza.md) |
| **Disciplina di coda** (*queueing discipline*, emulazione di rete) | S | Meccanismo del kernel che introduce ritardo, variabilità, perdita e limite di banda; strumento con cui si simulano le reti degradate nelle prove | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **Discriminatore** (*discriminator*) | S | Regola con cui si stabilisce a quale slice di un elemento ripetuto appartiene una singola occorrenza | [F06](06-fhir-da-zero.md) |
| **Display ufficiale** (*official display*) | S | Stringa descrittiva del concetto fornita dal titolare della terminologia. **Trappola:** **non è** l'etichetta di interfaccia, ed è architetturalmente separata da essa, perché su alcune terminologie le traduzioni sono derivati che appartengono al titolare | [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Disponibilità** (*availability*) | S | Accessibilità dell'informazione e del servizio quando servono. **Trappola:** la sua violazione è un incidente notificabile, non un semplice disservizio | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/10-risposta-agli-incidenti.md) |
| **Dispositivo attivo** (*active device*) | N | Dispositivo il cui funzionamento dipende da una fonte di energia diversa da quella generata dal corpo umano. Il software è **per definizione** un dispositivo attivo (Reg. (UE) 2017/745, art. 2, punto 4) | [F15](15-regolatorio-da-zero.md) |
| **Dispositivo medico** (*medical device*) | N | Oggetto - software compreso - destinato dal fabbricante a una delle finalità mediche tassative dell'art. 2, punto 1, del Reg. (UE) 2017/745. **Trappola:** la qualificazione dipende dalla **destinazione dichiarata**, non dalla tecnologia impiegata | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/02-qualificazione-e-classificazione.md) |
| **Distinta dei materiali software** (*software bill of materials*, SBOM) | N | Elenco leggibile da una macchina di tutti i componenti di un artefatto, con versione, licenza e impronta, generato a ogni costruzione. **Trappola:** censire i componenti a posteriori costa molte volte tanto: è una delle attività retroattivamente irrecuperabili | [F12](12-crittografia-e-sicurezza.md), [F17](17-ambiente-di-sviluppo.md), [SEC](../06_security/07-catena-di-fornitura.md) |
| **Distretto** (*health district*) | N | Articolazione territoriale dell'azienda sanitaria locale che organizza l'assistenza primaria e la specialistica di base | [F01](01-sistema-sanitario-italiano.md) |
| **Divulgazione coordinata** (*coordinated vulnerability disclosure*) | S | Procedura con cui una vulnerabilità è comunicata a chi può correggerla, con una finestra concordata prima della pubblicazione | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/10-risposta-agli-incidenti.md) |
| **Documento clinico** (*clinical document*) | P | Artefatto con autore identificato, validato, immutabile, con destinatario e regime di conservazione propri. **Trappola:** l'immutabilità è la caratteristica che lo distingue da tutto il resto; ciò che è modificabile non è un documento clinico | [DOM](../05_domain/04-documenti-clinici.md) |
| **`DocumentReference`** | S | Risorsa FHIR che porta i metadati di un documento, distinti dal contenuto; è il ponte verso l'indicizzazione documentale | [F06](06-fhir-da-zero.md) |
| **Dominio di attribuzione** (*assigning authority*) | S | Il soggetto che assegna gli identificatori e ne garantisce l'unicità nel proprio spazio dei nomi; nello standard è nominato dall'URI del campo `system`. **Trappola:** un identificatore senza il suo dominio è una stringa, non un identificatore | [F04](04-identita-e-anagrafiche.md) |
| **Doppia scrittura** (*dual write*) | S | Difetto per cui si scrive su due sistemi senza atomicità, producendo eventi persi o eventi fantasma. Si evita con l'outbox transazionale | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Doppio di prova** (*test double*) | S | Sostituto di un sistema esterno usato nelle prove. **Trappola:** nel progetto è costruito **sulla specifica pubblicata**, non sull'osservazione empirica del sistema reale, altrimenti si codifica in eterno il difetto di quel sistema | [F17](17-ambiente-di-sviluppo.md) |
| **Dossier sanitario** (*organisational health record*) | P | Insieme dei dati della persona assistita presso una singola struttura, per la continuità di cura interna. **Trappola:** distinto dal fascicolo sanitario elettronico, che è nazionale e sotto il controllo dell'assistito | [F03](03-il-dato-clinico.md), [DOM](../05_domain/01-linguaggio-ubiquo.md) |
| **DPIA - Valutazione d'impatto sulla protezione dei dati** (*data protection impact assessment*) | N | Valutazione obbligatoria **prima** del trattamento quando il rischio è elevato (art. 35 del Regolamento (UE) 2016/679) | [F03](03-il-dato-clinico.md), [SEC](../06_security/03-protezione-dei-dati.md) |
| **DTLS** (*Datagram Transport Layer Security*) | S | TLS adattato a un trasporto che perde e riordina i pacchetti (RFC 6347, RFC 9147) | [F08](08-webrtc-da-zero.md) |
| **DTLS-SRTP** | S | Meccanismo che estrae le chiavi SRTP dal segreto stabilito con la stretta di mano DTLS fra i due estremi (RFC 5764) | [F08](08-webrtc-da-zero.md), [SEC](../06_security/05-sicurezza-del-tempo-reale.md) |

### E

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **EDS - Ecosistema dati sanitari** (*health data ecosystem*) | N | Repository centrale istituito con DM 31 dicembre 2024; titolarità del Ministero della salute, gestione di AGENAS. Opera su pseudonimi e alimenta le finalità di governo, ricerca e valutazione delle tecnologie sanitarie | [F02](02-prestazioni-di-telemedicina.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **EHDS - Spazio europeo dei dati sanitari** (*European Health Data Space*) | N | Regolamento (UE) 2025/327 su uso primario e secondario dei dati sanitari; il capo III disciplina i sistemi di cartelle cliniche elettroniche. **Trappola:** il progetto potrebbe ricadervi pur non essendo un dispositivo medico: è una valutazione dichiarata, non una certezza, e va verificata sul testo | [F07](07-fse-e-infrastrutture-nazionali.md), [F15](15-regolatorio-da-zero.md) |
| **eIDAS** | N | Regolamento (UE) 910/2014 su identificazione elettronica e servizi fiduciari, come modificato dal Regolamento (UE) 2024/1183 | [F03](03-il-dato-clinico.md), [F12](12-crittografia-e-sicurezza.md) |
| **Eleggibilità** (*eligibility*) | P | Verifica che la persona possa ricevere quella prestazione **in quel canale**. **Trappola:** è cosa diversa dal diritto all'esenzione e dal diritto alla prestazione in sé | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Elemento a scelta di tipo** (`[x]`) | S | Elemento FHIR che ammette più tipi alternativi; nelle istanze il nome concatena il tipo scelto | [F06](06-fhir-da-zero.md) |
| **Elenco di fiducia** (*trusted list*) | S | Lista dei servizi fiduciari qualificati da cui si alimenta il magazzino di fiducia per la verifica dei certificati, filtrando le sole autorità abilitate alla verifica dell'identità | [F04](04-identita-e-anagrafiche.md) |
| **Emulatore di rete** (*network emulator*) | S | Strumento che introduce ritardo, variabilità, perdita e riordino dei pacchetti nei test. **Trappola:** il test con due schede dello stesso browser sullo stesso computer non dimostra quasi nulla | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **`Encounter`** | S | Vedi *Contatto*. È il nome della risorsa nello standard e nel codice del progetto | [F06](06-fhir-da-zero.md), [F14](14-flussi-funzionali.md) |
| **ENI - Europeo Non Iscritto** (*EU citizen not registered with the national health service*; codice del diritto italiano) | N | Codice di assistenza per cittadini dell'Unione presenti in Italia privi dei requisiti di iscrizione al servizio sanitario; sedici caratteri, attribuito localmente | [F04](04-identita-e-anagrafiche.md) |
| **Ente erogatore / ente fruitore** (*provider / consumer entity*, nella piattaforma nazionale dei dati) | N | Chi pubblica un servizio applicativo e chi ne chiede la fruizione. **Trappola:** sono **soggetti giuridici**, non software: l'autorizzazione riguarda l'ente, non l'istanza applicativa | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Entità** (*entity*) | S | Oggetto con identità che persiste attraverso i cambiamenti dei suoi attributi | [F11](11-fondamenti-informatici.md) |
| **Episodio di cura** (*episode of care*) | S | Contenitore temporale della presa in carico su un problema di salute; radice dell'aggregato della presa in carico | [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Erogazione** (*delivery of care*) | P | Atto materiale di fornitura della prestazione. **Trappola:** non implica né la refertazione né la rendicontazione: sono quattro stati successivi, e nessuno implica automaticamente il seguente | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Errore d'uso** (*use error*) | N | Azione o omissione dell'utente che produce un risultato diverso da quello inteso (IEC 62366-1). **Trappola:** **non implica colpa dell'utente**: è un difetto di progettazione dell'interfaccia, ed è così che va trattato nella gestione del rischio | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/06-usabilita-e-accessibilita.md) |
| **Esame obiettivo** (*physical examination*) | S | Rilevazione diretta dei segni da parte del professionista, articolata in ispezione, palpazione, percussione e auscultazione. **Trappola:** di queste quattro manovre solo l'ispezione è parzialmente trasferibile a distanza, e comunque degradata: è la ragione strutturale per cui la televisita è limitata al controllo | [F09](09-fondamenti-clinici.md) |
| **Esattamente una volta** (*exactly-once*) | S | Garanzia di consegna che **non è ottenibile da estremo a estremo**; si approssima con «almeno una volta» più idempotenza del ricevente | [F11](11-fondamenti-informatici.md), [F13](13-protocolli.md) |
| **Escalation** (*escalation*) | P | Regola che stabilisce che cosa accade quando un allarme non è preso in carico entro la scadenza. **Trappola:** deve essere **finita e terminare in un fallimento dichiarato**; una catena che non termina è una catena in cui l'allarme si perde senza che nessuno lo sappia | [F10](10-percorsi-di-cura-e-sicurezza.md), [F14](14-flussi-funzionali.md) |
| **Esenzione** (*co-payment exemption*) | N | Diritto a non corrispondere in tutto o in parte la compartecipazione alla spesa. **Trappola:** un'esenzione **per patologia rivela la patologia** ed è quindi un dato relativo alla salute, per quanto il campo appaia amministrativo | [F01](01-sistema-sanitario-italiano.md), [F03](03-il-dato-clinico.md) |
| **Esito del contatto** (*encounter outcome*) | P | Codice strutturato che dichiara come l'atto si è concluso. **Trappola:** è distinto dallo **stato** del contatto, che dice invece dove si trova nel suo ciclo di vita | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Esito tipizzato** (*typed outcome*) | P | Valore preso da un'enumerazione di dominio con cui si chiude un contatto o un allarme, **mai testo libero**. **Trappola:** il testo libero rende impossibile ogni misura successiva, e quella misura è un requisito di sicurezza | [F14](14-flussi-funzionali.md) |
| **Espandi e contrai** (*expand and contract*) | S | Regola di evoluzione dello schema in tre rilasci - aggiungi, migra la lettura, rimuovi - che consente la convivenza di due versioni dell'applicazione | [F17](17-ambiente-di-sviluppo.md), [TEC](../01_technical/03-persistenza.md) |
| **Espansione** (*expansion*) | S | Operazione che trasforma la selezione di un value set nell'elenco effettivo dei codici | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Estensione** (*extension*) | S | Meccanismo previsto dalla specifica di base per aggiungere informazione non prevista senza violare la conformità, identificato da un URL canonico | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Estensione cross-version** | S | Estensione ufficiale che espone in una versione dello standard un elemento definito in una versione successiva | [F06](06-fhir-da-zero.md) |
| **ETag / `If-Match` / 412** | S | Meccanismo di controllo di concorrenza ottimistico e codice di risposta di precondizione fallita | [F06](06-fhir-da-zero.md), [F13](13-protocolli.md) |
| **Etichetta di interfaccia** (*UI label*) | P | Stringa del progetto, per lingua, collegata al codice. **Trappola:** è architetturalmente separata dal display ufficiale della terminologia, e la separazione non è stilistica: è una conseguenza del regime di licenza di alcune terminologie | [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **EUDAMED** | N | Banca dati europea dei dispositivi medici: registrazione degli attori, dei dispositivi e dei certificati, vigilanza e sorveglianza | [F15](15-regolatorio-da-zero.md) |
| **Evento avverso** (*adverse event*) | S | Danno subito dalla persona assistita causato dalla **gestione sanitaria** e non dalla sua condizione clinica | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Evento di dominio** (*domain event*) | S | Fatto rilevante per il dominio, già accaduto, immutabile, nominato al passato nel linguaggio ubiquo, che altri contesti possono osservare. **Trappola:** un evento non è rifiutabile: se il fatto è accaduto, l'evento esiste, e la reazione al fatto è un problema di chi lo riceve | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](../02_architecture/06-eventi-e-integrazione-interna.md) |
| **Evento fantasma** (*phantom event*) | S | Messaggio consegnato che si riferisce a un fatto la cui transazione è poi fallita | [F16](16-architettura-del-progetto.md) |
| **Evento perso** (*lost event*) | S | Fatto avvenuto per cui il messaggio corrispondente non è mai stato pubblicato, **senza che nulla lo segnali**. È il più insidioso dei due difetti della doppia scrittura, perché è silenzioso | [F16](16-architettura-del-progetto.md) |
| **Evento sentinella** (*sentinel event*) | S | Evento avverso di particolare gravità, indicativo di un malfunzionamento del sistema, che richiede indagine immediata | [F10](10-percorsi-di-cura-e-sicurezza.md) |

### F

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Fabbrica di dati di prova** (*test data factory*) | P | Componente versionato che costruisce oggetti di prova con valori predefiniti sensati e sostituzione esplicita del solo elemento che la prova verifica | [F17](17-ambiente-di-sviluppo.md) |
| **Fabbricante** (*manufacturer*) | N | Chi fabbrica o fa fabbricare un dispositivo **e** lo commercializza apponendovi il proprio nome o marchio (Reg. (UE) 2017/745, art. 2, punto 30). **Nel progetto:** il ruolo sarà assunto dal progetto stesso, con il soggetto giuridico **ancora da costituire**; la costituzione è un prerequisito interno con un proprio tempo. **Trappola:** questo non cambia lo stato di fatto - **oggi il prodotto non reca marcatura CE**, e chi lo installa o lo mette in servizio assume gli obblighi che ne derivano | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/00-indice.md) |
| **Fallacie del calcolo distribuito** (*fallacies of distributed computing*) | S | Le otto assunzioni implicite e false su rete, latenza, banda, sicurezza, topologia, amministrazione, costo di trasporto e omogeneità | [F11](11-fondamenti-informatici.md) |
| **Fallimento dichiarato** (*declared failure*) | P | Esito che il sistema produce quando la catena di escalation si esaurisce senza che nessuno abbia preso in carico l'allarme. **Trappola:** è preferibile al silenzio in ogni circostanza: un allarme che si spegne da solo è indistinguibile da un allarme risolto | [F14](14-flussi-funzionali.md) |
| **Falsa rassicurazione** (*false reassurance*) | P | Riduzione della vigilanza della persona indotta dall'esistenza di un servizio che essa percepisce come sorveglianza continua. **Trappola:** è un rischio prodotto dal servizio stesso, e va gestito come tale nella documentazione destinata all'utilizzatore | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Falsificazione di richieste a livello di trasporto** | S | Uso improprio di un server di relay per raggiungere destinazioni interne. **Trappola:** la difesa primaria è l'**isolamento di rete in uscita**, non le liste di indirizzi vietati, che sono state ripetutamente aggirate | [F08](08-webrtc-da-zero.md), [SEC](../06_security/05-sicurezza-del-tempo-reale.md) |
| **Fascia della pipeline** (*pipeline tier*) | P | Raggruppamento delle verifiche per tempo di esecuzione: rapida a ogni invio, completa a ogni proposta di modifica, estesa su pianificazione, di rilascio su procedura | [F17](17-ambiente-di-sviluppo.md) |
| **Fascicolo sanitario elettronico (FSE)** (*national electronic health record*; istituto del diritto italiano, l'equivalente inglese è approssimativo) | N | Insieme dei dati e dei documenti sanitari e sociosanitari generati da eventi clinici riguardanti l'assistito, sotto il suo controllo, alimentato dalle strutture (art. 12 del D.L. 179/2012 e atti attuativi). **Trappola:** non è un archivio del quale il progetto dispone: è un sistema pubblico che si alimenta e si consulta a condizioni definite da altri | [F07](07-fse-e-infrastrutture-nazionali.md), [F03](03-il-dato-clinico.md) |
| **FSE 2.0** | N | Denominazione corrente della riforma introdotta dall'art. 21 del D.L. 4/2022: alimentazione per legge, finalità distinte, componenti nazionali, ecosistema dati sanitari, soluzioni tecnologiche di AGENAS | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Fascicolo tecnico** (*technical documentation*) | N | Documentazione completa del dispositivo secondo gli Allegati II e III del Reg. (UE) 2017/745 | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/04-fascicolo-tecnico.md) |
| **Fattore di autenticazione** (*authentication factor*) | S | Categoria di prova: qualcosa che sai, qualcosa che hai, qualcosa che sei. **Trappola:** due elementi della **stessa** categoria non sono due fattori, per quanto siano due passaggi | [F12](12-crittografia-e-sicurezza.md) |
| **FEA / FEQ / FES** (*advanced / qualified / simple electronic signature*) | N | Firma elettronica avanzata, qualificata e semplice: tre livelli con effetti giuridici diversi. **Trappola:** solo la firma qualificata equivale alla sottoscrizione autografa | [F03](03-il-dato-clinico.md) |
| **File di blocco delle dipendenze** (*lock file*) | S | File versionato che fissa le versioni esatte, dirette e transitive, delle dipendenze. **Trappola:** senza, la costruzione non è riproducibile, e ciò che si è verificato non è ciò che si distribuisce | [F17](17-ambiente-di-sviluppo.md) |
| **Finalità dichiarata** (*declared purpose of use*) | P | Finalità con cui un accesso a un dato clinico è richiesto; entra nella decisione di autorizzazione e nel registro degli accessi | [DOM](../05_domain/06-consenso-e-riservatezza.md), [SEC](../06_security/02-identita-e-accessi.md) |
| **Finalità** (*purpose*, nella piattaforma nazionale dei dati) | N | Ragione dichiarata di accesso a un servizio applicativo; è l'elemento su cui l'ente erogatore approva e su cui la catena resta verificabile a posteriori | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Finestra di attesa** (*expectation window*) | P | Intervallo, derivato dal piano, entro cui una misura è attesa. **Trappola:** il suo decorso **senza** misura è un evento clinico, non l'assenza di un evento | [F10](10-percorsi-di-cura-e-sicurezza.md), [F14](14-flussi-funzionali.md) |
| **Finestra di refertazione** (*reporting window*) | P | Intervallo fra la conclusione del contatto e il termine entro cui il documento deve essere firmato | [DOM](../05_domain/04-documenti-clinici.md) |
| **Firma del documento** (*document signature*) | N | Sottoscrizione con valore probatorio, di livello determinato per tipologia documentale. **Trappola:** è cosa diversa dalla firma crittografica di una busta o di un messaggio, che non ha alcun valore di sottoscrizione | [F03](03-il-dato-clinico.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Flusso ex art. 50** | N | Trasmissione al Sistema Tessera Sanitaria dei dati di prescrizione ed erogazione, ai sensi dell'art. 50 del D.L. 269/2003, convertito dalla L. 326/2003 | [F01](01-sistema-sanitario-italiano.md) |
| **Follow-up** (*follow-up*) | S | Verifica nel tempo dell'evoluzione della condizione e dell'effetto del trattamento | [F09](09-fondamenti-clinici.md) |
| **Fondazione** (*foundation*, ICE) | S | Etichetta condivisa da candidati omogenei, che regola l'ordine dei controlli di connettività | [F08](08-webrtc-da-zero.md) |
| **Formato** (*serialisation format*) | S | Modo di rappresentare dati strutturati come sequenza di byte. **Trappola:** non dice nulla su **quando** e **come** si comunica: quello è il protocollo | [F13](13-protocolli.md) |
| **Fotogramma completo** (*keyframe*) | S | Fotogramma autosufficiente, molto più pesante di uno differenziale. **Trappola:** una raffica di richieste di fotogramma completo può innescare una spirale di congestione, cioè peggiorare esattamente ciò che intendeva correggere | [F08](08-webrtc-da-zero.md) |
| **Fragilità** (*frailty*) | S | Ridotta riserva funzionale: risposta sproporzionata e spesso non reversibile a uno stress modesto. **Trappola:** non è sinonimo di età avanzata né di multimorbilità | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Fusione anagrafica** (*record merge*) | P | Unione controllata di due anagrafiche duplicate nello stesso tenant. **Trappola:** **mai automatica**; la corrispondenza probabilistica produce punteggi, non certezze, e una fusione errata è quasi impossibile da disfare | [F04](04-identita-e-anagrafiche.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |

### G

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **G.711** | S | Codec audio telefonico obbligatorio; serve all'interoperabilità con il mondo non-browser | [F08](08-webrtc-da-zero.md) |
| **Gate di appropriatezza** (*appropriateness gate*) | P | Registrazione, precedente all'atto, della dichiarazione che ricorrono le condizioni di erogabilità della prestazione a distanza. **Trappola:** è una precondizione registrata, non un avviso all'operatore: se non è registrata, non è dimostrabile | [F02](02-prestazioni-di-telemedicina.md), [F14](14-flussi-funzionali.md) |
| **Gateway terminologico** (*terminology gateway*) | P | Punto unico di risoluzione, validazione ed espansione dei codici, con politica dichiarata per ciascun sistema di codifica. **Trappola:** è punto unico proprio perché la politica sulle licenze si applica in un solo posto e non sparsa nel codice | [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Glicemia a digiuno / post-prandiale** (*fasting / postprandial blood glucose*) | S | Varianti distinte del parametro glicemia, con codici e intervalli di riferimento propri. **Trappola:** **non sono la stessa grandezza misurata in momenti diversi**: sono due grandezze, e trattarle come una sola produce serie temporali senza significato | [F09](09-fondamenti-clinici.md) |
| **Grandezza** (*observable quantity*) | S | Ciò che la misura misura, identificato da un codice. **Trappola:** è la grandezza a distinguere parametri che condividono l'unità di misura; l'unità da sola non identifica nulla | [DOM](../05_domain/05-parametri-e-osservazioni.md), [F09](09-fondamenti-clinici.md) |
| **Gruppo di consumatori** (*consumer group*) | S | Insieme di processi che si dividono le partizioni di un flusso, così che ogni evento sia elaborato da un solo membro | [F11](11-fondamenti-informatici.md) |
| **GSPR** (*general safety and performance requirements*) | N | Requisiti generali di sicurezza e prestazione dell'Allegato I del Reg. (UE) 2017/745 | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/04-fascicolo-tecnico.md) |
| **GST - Gestore Soluzioni di Telemedicina** | N | Micro-servizio dell'infrastruttura nazionale di telemedicina che assiste il Processo di Validazione delle soluzioni di terze parti | [F02](02-prestazioni-di-telemedicina.md) |
| **Guasto parziale** (*partial failure*) | S | Situazione in cui una parte del sistema è guasta e il resto **può non saperlo**. È la differenza essenziale fra un sistema distribuito e un programma locale | [F11](11-fondamenti-informatici.md) |
| **Guida di implementazione nazionale** (*national implementation guide*) | G | Guida prodotta da un'affiliata nazionale per il proprio ordinamento; prevale sul modello generico internazionale nel proprio contesto | [F05](05-standard-di-interoperabilita.md) |

### H

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **HKDF** | S | Funzione di derivazione di chiave basata su HMAC (RFC 5869), con separazione dei domini tramite un'etichetta di contesto | [F12](12-crittografia-e-sicurezza.md) |
| **HL7 International** | S | Organizzazione che produce gli standard di scambio dell'informazione sanitaria: HL7 v2, CDA, FHIR | [F05](05-standard-di-interoperabilita.md) |
| **HL7 Terminology** | S | Vocabolario condiviso di HL7, nel pubblico dominio. **Trappola:** contiene però concetti di terzi che nel pubblico dominio non sono: una dichiarazione di licenza apposta su un contenitore non dispone dei diritti altrui sul contenuto | [F05](05-standard-di-interoperabilita.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **HMAC** | S | Codice di autenticazione del messaggio basato su funzione di hash e chiave condivisa (RFC 2104). **Trappola:** dà integrità e autenticità, **non** non ripudio: entrambe le parti conoscono la chiave e quindi entrambe potrebbero averlo prodotto | [F12](12-crittografia-e-sicurezza.md) |
| **HTTP Message Signatures** | S | Firma di componenti selezionati di un messaggio HTTP (RFC 9421); l'impronta del corpo si veicola con `Content-Digest` (RFC 9530) | [F13](13-protocolli.md), [PRO](../04_protocols/07-eventi-e-webhook.md) |
| **`HumanName`** | S | Tipo di dato FHIR: nome di persona, con forma composta e scomposizione in parti | [F06](06-fhir-da-zero.md) |

### I

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **ICD-9-CM** | N | Classificazione delle malattie utilizzata in Italia per la codifica delle informazioni cliniche di ricovero | [F05](05-standard-di-interoperabilita.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **ICE** (*Interactive Connectivity Establishment*) | S | Procedura che raccoglie tutti i percorsi plausibili fra due estremi, li prova e sceglie il migliore (RFC 8445) | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **`id`** (identificatore logico) | S | Identifica una risorsa FHIR **su quel server**. **Trappola:** non ha significato clinico né portabilità: usarlo come chiave di correlazione fra sistemi è un difetto strutturale | [F06](06-fhir-da-zero.md) |
| **`identifier`** (identificatore di business) | S | Identifica l'entità **nel mondo reale**, con il proprio spazio dei nomi dichiarato nel campo `system` | [F06](06-fhir-da-zero.md) |
| **Identificativo di costruzione** (*build identifier*) | P | Marcatura che comprende versione, revisione esatta del codice e istante normalizzato; collega un comportamento osservato a un artefatto preciso | [F17](17-ambiente-di-sviluppo.md) |
| **Identificatore** (*identifier*) | S | Valore che individua un'identità **dentro un dominio dichiarato**. **Trappola:** senza il dominio è una stringa; due identificatori uguali in domini diversi non individuano la stessa entità | [F04](04-identita-e-anagrafiche.md) |
| **Identificatore esterno** (*external identifier*) | P | Coppia formata dal dominio di attribuzione e dal valore con cui un sistema terzo identifica il soggetto; è la chiave di lavoro del modello per riferimento | [DOM](../05_domain/03-assistito-professionista-organizzazione.md), [INT](../07_integration/07-dati-e-sincronizzazione.md) |
| **Identificazione** (*patient identification*) | N | Accertamento, da parte del professionista, che la persona presente all'altro capo del collegamento sia quella attesa. **Trappola:** è un **atto del professionista**, distinto dall'autenticazione, si compie a ogni prestazione e si registra con metodo ed esito | [F04](04-identita-e-anagrafiche.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Identità** (*identity*) | S | Rappresentazione di un'entità dentro un dominio. **Trappola:** un'entità ha tante identità quanti sono i domini in cui è rappresentata; non esiste «l'identità» in assoluto | [F04](04-identita-e-anagrafiche.md) |
| **Idempotenza** (*idempotency*) | S | Proprietà di un'operazione che, ripetuta con gli stessi argomenti, non aggiunge effetti. **Trappola:** in ambito clinico l'assenza di idempotenza produce la prestazione fantasma, cioè lo stesso atto registrato due volte | [F11](11-fondamenti-informatici.md), [F13](13-protocolli.md), [F16](16-architettura-del-progetto.md) |
| **`If-None-Exist`** | S | Intestazione della creazione condizionale in FHIR; è il meccanismo di idempotenza dell'ingestione | [F06](06-fhir-da-zero.md) |
| **IFoC - Infermiere di famiglia o di comunità** (*family and community nurse*) | N | Professionista di riferimento per la presa in carico proattiva della popolazione di un ambito territoriale | [F01](01-sistema-sanitario-italiano.md) |
| **IHE** (*Integrating the Healthcare Enterprise*) | S | Iniziativa che **non scrive standard**: definisce profili di integrazione combinando standard esistenti | [F05](05-standard-di-interoperabilita.md), [PRO](../04_protocols/05-ihe.md) |
| **Immissione sul mercato** (*placing on the market*) | N | Prima messa a disposizione di un dispositivo sul mercato dell'Unione (Reg. (UE) 2017/745, art. 2, punto 28) | [F15](15-regolatorio-da-zero.md) |
| **Impegnativa** (*NHS prescription form*; istituto italiano senza equivalente esatto) | N | Prescrizione su ricettario del servizio sanitario che dà titolo alla prestazione a carico pubblico. **Trappola:** è prescrizione **più** titolo di accesso: sono due funzioni in un solo documento, e il modello che ne rappresenta una sola perde l'altra | [F01](01-sistema-sanitario-italiano.md) |
| **Implementation Guide (IG)** | S | Pacchetto pubblicato che raccoglie profili, terminologie, estensioni, esempi e regole di conformità | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Impronta della migrazione** (*migration checksum*) | P | Somma di controllo di una migrazione applicata, verificata a ogni esecuzione; rende impossibile la modifica retroattiva di una migrazione già eseguita | [F17](17-ambiente-di-sviluppo.md) |
| **Incapsulamento** (*encapsulation*) | S | Proprietà per cui ogni livello di una pila di protocolli tratta il messaggio del livello superiore come contenuto opaco e vi aggiunge la propria intestazione | [F13](13-protocolli.md) |
| **Indice di perfusione** (*perfusion index*) | S | Indicatore di qualità del segnale esposto da alcuni ossimetri; misura l'ampiezza della componente pulsatile. **Trappola:** è un indicatore di **qualità della misura**, non un parametro clinico | [F09](09-fondamenti-clinici.md) |
| **Indice nazionale FSE** | N | Componente dell'infrastruttura nazionale per l'interoperabilità che indicizza i metadati dei documenti e li trasferisce all'indice della Regione di assistenza quando questa viene associata | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Indice principale del paziente** (*master patient index*) | S | Componente che riconcilia le rappresentazioni della stessa persona provenienti da sistemi diversi | [F04](04-identita-e-anagrafiche.md) |
| **Indirizzo di svolgimento** (*session location address*) | P | Luogo in cui la persona assistita si trova durante la sessione. **Trappola:** va richiesto e **confermato a ogni sessione**, perché è l'informazione necessaria in caso di emergenza e cambia senza preavviso | [DOM](../05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **INI - Infrastruttura nazionale per l'interoperabilità** | N | Componente nazionale del sistema del fascicolo sanitario elettronico, realizzata attraverso il Sistema Tessera Sanitaria; comprende indice, anagrafe dei consensi e portale nazionale | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Inoltro selettivo** (*selective forwarding unit*, SFU) | S | Server che riceve un flusso da ciascun partecipante e lo inoltra agli altri. **Trappola:** **termina la cifratura**: una sessione che passa per un inoltro selettivo non è cifrata da estremo a estremo | [F08](08-webrtc-da-zero.md) |
| **Informativa** (*privacy notice*) | N | Documento informativo che precede e fonda il consenso. **Trappola:** è versionata, e le versioni precedenti vanno conservate: senza, è impossibile dimostrare a quale testo una persona ha aderito | [DOM](../05_domain/06-consenso-e-riservatezza.md) |
| **INT - Infrastruttura nazionale di telemedicina** | N | Componente nazionale a titolarità di AGENAS che fornisce servizi abilitanti. **Trappola:** **non è un repository clinico**: non conserva i documenti prodotti dalle prestazioni | [F02](02-prestazioni-di-telemedicina.md) |
| **Integratore** (*integrator*) | P | Soggetto terzo che incorpora il sistema nel proprio. **Trappola:** è un **principale applicativo**, non un utente, e va distinto dalla persona per conto della quale agisce in ogni voce del registro degli accessi | [DOM](../05_domain/03-assistito-professionista-organizzazione.md), [INT](../07_integration/01-modalita-di-integrazione.md) |
| **Integrità** (*integrity*) | S | Assenza di alterazioni non autorizzate **e rilevabilità** di quelle che avvengono. La seconda parte è quella che si dimentica | [F12](12-crittografia-e-sicurezza.md) |
| **Interazione** (*interaction*, FHIR) | S | Una delle operazioni REST previste dallo standard: lettura, lettura di versione, aggiornamento, modifica parziale, cancellazione, creazione, ricerca, storia, capacità, transazione | [F06](06-fhir-da-zero.md) |
| **Interazione condizionale** | S | Creazione, aggiornamento, cancellazione o modifica selezionata da criteri di ricerca invece che da identificativo | [F06](06-fhir-da-zero.md) |
| **Interoperabilità tecnica** | S | I sistemi riescono a scambiarsi bit: rete, trasporto, cifratura | [F05](05-standard-di-interoperabilita.md) |
| **Interoperabilità sintattica** | S | I sistemi riescono a decodificare la struttura di ciò che si scambiano | [F05](05-standard-di-interoperabilita.md) |
| **Interoperabilità semantica** | S | I sistemi attribuiscono **lo stesso significato** ai valori scambiati. **Trappola:** è il livello in cui quasi tutti i progetti si fermano credendo di averlo raggiunto | [F05](05-standard-di-interoperabilita.md) |
| **Interoperabilità organizzativa** | S | Le organizzazioni hanno regole compatibili su autorizzazioni, consensi e responsabilità. È il livello che nessuno standard può risolvere da solo | [F05](05-standard-di-interoperabilita.md) |
| **Interruttore automatico** (*circuit breaker*) | S | Componente che smette di chiamare un servizio in fallimento continuo e riprova in modo cauto | [F11](11-fondamenti-informatici.md) |
| **Intervallo di riferimento** (*reference interval*) | S | Intervallo di valori atteso in una popolazione di riferimento, con un metodo e in un contesto determinati. **Trappola:** appartiene alla **misura**, non alla grandezza: cambia con il metodo, con il laboratorio e con la popolazione | [F09](09-fondamenti-clinici.md) |
| **Intramoenia** (istituto del diritto italiano, senza equivalente) | N | Libera professione svolta a pagamento dal medico dipendente del servizio sanitario dentro la struttura pubblica | [F01](01-sistema-sanitario-italiano.md) |
| **Introspezione** (*token introspection*) | S | Interrogazione all'authorization server sulla validità attuale di un token | [F13](13-protocolli.md) |
| **Invariante** (*invariant*) | S | Condizione che deve essere vera in ogni istante osservabile. **Trappola:** nel modello di dominio un'invariante va resa **impossibile da violare**, non semplicemente sconsigliata da una validazione | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Ipoglicemia** (*hypoglycaemia*) | S | Glucosio nel sangue al di sotto del livello utile. **Trappola:** è un evento acuto con scala temporale di minuti, **asimmetrico** rispetto all'iperglicemia: le due condizioni non si trattano con la stessa logica di allarme | [F09](09-fondamenti-clinici.md) |
| **IRCCS** | N | Istituto di ricovero e cura a carattere scientifico: ente riconosciuto per eccellenza clinica e attività di ricerca (D.lgs. 288/2003) | [F01](01-sistema-sanitario-italiano.md) |
| **IRT - Infrastruttura regionale di telemedicina** | N | Componente a titolarità regionale che eroga concretamente le prestazioni. **Trappola:** **non conserva** i documenti generati: la conservazione è altrove | [F02](02-prestazioni-di-telemedicina.md) |
| **Isolamento dei client** (*client isolation*) | S | Politica dei punti di accesso Wi-Fi che impedisce a due dispositivi della stessa rete di parlarsi direttamente. È una delle cause di fallimento del percorso diretto che nessuno prevede | [F08](08-webrtc-da-zero.md) |
| **Isolamento di rete in uscita** (*egress isolation*) | S | Assenza di rotte dal nodo di relay verso la rete interna e verso sé stesso. **Trappola:** è **la difesa primaria** contro l'uso improprio del relay, non le liste di indirizzi vietati | [F08](08-webrtc-da-zero.md), [SEC](../06_security/05-sicurezza-del-tempo-reale.md) |
| **Isolamento fra tenant, prove di** | P | Prove che tentano **attivamente** l'accesso illegittimo ai dati di un altro tenant, per ogni contesto e per ogni interfaccia. **Trappola:** una prova che passa perché non ha provato non dimostra nulla; questa è la forma della prova negativa | [F17](17-ambiente-di-sviluppo.md), [ARC](../02_architecture/05-multi-tenancy.md) |
| **ISO/IEC 29115** | S | Norma internazionale sui livelli di garanzia dell'identità. I tre livelli italiani corrispondono ai livelli LoA2, LoA3 e LoA4 della norma | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **Ispezione** (*inspection*) | S | Osservazione visiva della persona assistita. **Trappola:** è l'unica manovra dell'esame obiettivo parzialmente trasferibile a distanza, e comunque degradata da illuminazione, compressione e inquadratura | [F09](09-fondamenti-clinici.md) |
| **Istante di inserimento** (*entry timestamp*) | P | Quando il dato è stato immesso nel sistema da un soggetto | [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **Istante di ricezione** (*reception timestamp*) | P | Quando il sistema ha ricevuto il dato da una sorgente esterna | [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **Istante di rilevazione** (*observation timestamp*) | S | Quando il fatto misurato è accaduto. **Trappola:** è l'**unico** asse della serie clinica; ordinare una serie sull'istante di ricezione produce grafici falsi e tendenze inesistenti | [DOM](../05_domain/05-parametri-e-osservazioni.md), [F09](09-fondamenti-clinici.md) |
| **Isteresi** (*hysteresis*, di un allarme) | S | Uso di soglie diverse per l'attivazione e per il rientro di un allarme, per evitare l'oscillazione attorno al valore di attivazione | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **IUA** (*Internet User Authorization*) | S | Profilo IHE per l'autorizzazione basata su OAuth | [F05](05-standard-di-interoperabilita.md) |

### J–K

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Jitter** (rete) | S | Variabilità del ritardo fra pacchetti consecutivi | [F08](08-webrtc-da-zero.md) |
| **Jitter** (ritentativi) | S | Termine casuale aggiunto all'intervallo di attesa fra ritentativi per evitare raffiche sincronizzate. **Trappola:** stessa parola, due significati; vedi la sezione sui termini dipendenti dal contesto | [F11](11-fondamenti-informatici.md) |
| **Jitter buffer** | S | Coda in ricezione che assorbe la variabilità del ritardo aggiungendo latenza. **Trappola:** è il contributo **dominante** al ritardo percepito, e non è nel codice del progetto | [F08](08-webrtc-da-zero.md) |
| **JSEP** (*JavaScript Session Establishment Protocol*) | S | RFC 8829: come offerta e risposta appaiono all'interfaccia di programmazione del browser | [F08](08-webrtc-da-zero.md) |
| **JWT / JWS / JWE / JWK** | S | Rispettivamente: token, token firmato, token cifrato, rappresentazione di una chiave | [F13](13-protocolli.md) |
| **JWKS** (*JWK Set*) | S | Documento che pubblica un insieme di chiavi pubbliche con i rispettivi identificativi | [F13](13-protocolli.md) |
| **`KeyUpdate`** | S | Messaggio DTLS 1.3 che aggiorna le chiavi del livello record. **Trappola:** **non** aggiorna il segreto di esportazione, e quindi non rigenera le chiavi del media | [F08](08-webrtc-da-zero.md) |
| **`kid`** (*key identifier*) | S | Identificativo della chiave usata per firmare, che consente la rotazione senza interruzione del servizio | [F13](13-protocolli.md) |

### L

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Latenza** (*latency*) | S | Tempo fra richiesta e risposta di una singola operazione. **Trappola:** si dichiara sempre con un percentile, mai con una media; e nel progetto è una **metrica misurata, registrata e notificata**, non una promessa | [F11](11-fondamenti-informatici.md), [TEC](../01_technical/07-prestazioni-e-capacita.md) |
| **LEA - Livelli essenziali di assistenza** (*essential levels of care*; istituto del diritto italiano) | N | Prestazioni che il servizio sanitario deve garantire su tutto il territorio (D.P.C.M. 12 gennaio 2017) | [F01](01-sistema-sanitario-italiano.md) |
| **Legame di canale** (*channel bind*) | S | Associazione fra un numero di canale e un indirizzo su un server di relay, che riduce l'intestazione dei pacchetti | [F08](08-webrtc-da-zero.md) |
| **Legge di Little** (*Little's law*) | S | `L = λ × W`: il numero di elementi in un sistema è pari al tasso di arrivo moltiplicato per il tempo di permanenza | [F11](11-fondamenti-informatici.md) |
| **Lettera di dimissione ospedaliera** (*hospital discharge letter*) | N | Documento conclusivo del ricovero indirizzato al medico curante. **Trappola:** da non confondere con la scheda di dimissione ospedaliera, che è un flusso informativo amministrativo | [F03](03-il-dato-clinico.md) |
| **Linguaggio ubiquo** (*ubiquitous language*) | P | Vocabolario condiviso fra chi conosce il dominio e chi scrive il codice, usato identicamente nella conversazione, nel codice e nell'interfaccia. **Trappola:** vale **dentro un contesto delimitato**; pretenderlo unico su tutto il sistema produce un vocabolario che non significa nulla in nessun punto | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [DOM](../05_domain/01-linguaggio-ubiquo.md) |
| **Lista di ammissione** (*allowlist*, del controllo terminologico) | P | Elenco versionato di ciò che il controllo automatico consente. **Trappola:** la sua modifica richiede la revisione prevista per il materiale di conformità, non una semplice proposta di modifica | [F17](17-ambiente-di-sviluppo.md) |
| **Livello anticorruzione** (*anti-corruption layer*) | S | Strato di traduzione al confine che impedisce a un modello esterno di penetrare in quello interno | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Livello di garanzia (LoA)** (*level of assurance*) | N | Misura della fiducia nell'affermazione «questa persona è chi dice di essere»; dipende dalla verifica compiuta al momento del rilascio dell'identità e dai fattori usati all'accesso. **Trappola:** viaggia nel claim `acr`, non nel claim di delega, e per uno dei canali italiani il livello dichiarato nell'asserzione è sempre il massimo | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **Livello di isolamento** (*isolation level*) | S | Grado di separazione fra transazioni concorrenti, definito per le anomalie che esclude | [F11](11-fondamenti-informatici.md) |
| **Livello di provenienza** (*provenance level*) | P | Descrizione della catena attraverso cui una misura è arrivata al sistema. **Trappola:** **non è un giudizio di attendibilità** applicato dal sistema: è un fatto registrato che il professionista interpreta | [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **Livello di riservatezza** (*sensitivity label*) | P | Attributo del documento che ne governa la condivisione automatica e le notifiche | [DOM](../05_domain/04-documenti-clinici.md) |
| **Livello richiesto / livello dichiarato** | S | Il livello di garanzia preteso nella richiesta di autenticazione e quello riportato nell'asserzione di ritorno. **Trappola:** vanno registrati **entrambi**, perché per uno dei canali italiani il secondo non è informativo | [F04](04-identita-e-anagrafiche.md) |
| **LOINC** | S | Terminologia per osservazioni, misure, tipi di documento e sezioni; ridistribuibile con attribuzione. **Trappola:** le traduzioni sono derivati assegnati al titolare della terminologia: le stringhe di interfaccia del progetto vanno tenute architetturalmente separate dal display ufficiale | [F05](05-standard-di-interoperabilita.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Log degli eventi** (*event log*) | S | Sequenza ordinata, immutabile e a sola aggiunta di record, con posizione progressiva | [F11](11-fondamenti-informatici.md) |
| **Loopback** | S | Interfaccia di rete locale della macchina; unica origine trattata come contesto sicuro in sviluppo senza certificato | [F17](17-ambiente-di-sviluppo.md) |

### M

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Mancata presentazione** (*no-show*) | P | Assenza della persona assistita senza alcun tentativo di connessione entro la finestra prevista. **Trappola:** è **distinta** dal fallimento tecnico, e confonderle produce statistiche che accusano il paziente di difetti dell'infrastruttura | [DOM](../05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Mandatario** (*authorised representative*) | N | Persona stabilita nell'Unione incaricata per iscritto da un fabbricante stabilito fuori dall'Unione (Reg. (UE) 2017/745, art. 11) | [F15](15-regolatorio-da-zero.md) |
| **Mappa dei contesti** (*context map*) | S | Descrizione delle relazioni e dei rapporti di forza fra contesti delimitati | [F11](11-fondamenti-informatici.md), [ARC](../02_architecture/02-contesti-delimitati.md) |
| **Marca temporale** (*timestamp token*) | N | Attestazione opponibile, rilasciata da un prestatore di servizi fiduciari, che un documento o un'impronta esisteva in quella forma a quell'istante (RFC 3161) | [F03](03-il-dato-clinico.md), [F12](12-crittografia-e-sicurezza.md) |
| **Marcatore di sinteticità** (*synthetic flag*) | P | Attributo persistito nel dato che dichiara il record come generato. **Trappola:** serve a verificare con **una sola interrogazione** che un ambiente non contenga dati reali; senza, la verifica è un'affermazione di fiducia | [F17](17-ambiente-di-sviluppo.md) |
| **Marcatura CE** (*CE marking*) | N | Marchio con cui il fabbricante dichiara la conformità alla legislazione dell'Unione applicabile; per i dispositivi che richiedono un Organismo Notificato è seguita dal numero dell'organismo (Reg. (UE) 2017/745, art. 20). **Trappola: oggi il prodotto non reca marcatura CE**, e nessun documento del progetto afferma che la recherà entro una data | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/00-indice.md) |
| **Matrice di visibilità documentale** (*document visibility matrix*) | N | Corrispondenza fra tipologia documentale e ruolo, definita dal DM 19 novembre 2025, Allegato 3, § 5.2 | [DOM](../05_domain/04-documenti-clinici.md) |
| **MDCG** (*Medical Device Coordination Group*) | N | Gruppo di coordinamento per i dispositivi medici; pubblica linee guida **non vincolanti ma seguite di fatto** dagli organismi notificati | [F15](15-regolatorio-da-zero.md) |
| **MDM** | S | Famiglia di messaggi HL7 v2 per la notifica di documenti | [F05](05-standard-di-interoperabilita.md) |
| **MDR** | N | Regolamento (UE) 2017/745 sui dispositivi medici | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/01-inquadramento-normativo.md) |
| **MDSW** (*medical device software*) | N | Software che è esso stesso un dispositivo medico, e non un componente di uno | [F15](15-regolatorio-da-zero.md) |
| **mDNS** (*multicast DNS*) | S | Risoluzione dei nomi sulla rete locale, usata dai browser per offuscare gli indirizzi privati nei candidati ICE | [F08](08-webrtc-da-zero.md) |
| **Mesh** | S | Topologia in cui ogni partecipante invia a ogni altro. **Trappola:** preserva la cifratura da estremo a estremo ma non scala oltre pochissimi partecipanti | [F08](08-webrtc-da-zero.md) |
| **Messa in servizio** (*putting into service*) | N | Stadio in cui il dispositivo è reso disponibile all'utilizzatore finale come **pronto per l'uso** (Reg. (UE) 2017/745, art. 2, punto 29) | [F15](15-regolatorio-da-zero.md) |
| **`meta`** | S | Metadati tecnici di una risorsa FHIR: versione, ultimo aggiornamento, profili dichiarati, etichette | [F06](06-fhir-da-zero.md) |
| **Metadata** (*federation metadata*) | S | Documento che descrive un partecipante a una federazione di identità: identificativo di entità, indirizzi di risposta, chiavi pubbliche, attributi richiesti | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **MHD** (*Mobile access to Health Documents*) | S | Profilo IHE per la pubblicazione e il recupero di documenti clinici su FHIR REST | [F05](05-standard-di-interoperabilita.md) |
| **Misura** (*observation*) | S | Valore, più il contesto in cui è stato ottenuto. **Trappola:** è **immutabile**: non si corregge modificandola, si corregge emettendo una nuova versione, e la precedente resta | [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **MLLP** (*Minimal Lower Layer Protocol*) | S | Protocollo di incorniciamento dei messaggi HL7 v2 su TCP. **Trappola:** è in chiaro per costruzione, e la protezione va aggiunta sotto, non presupposta | [F05](05-standard-di-interoperabilita.md), [F13](13-protocolli.md) |
| **MMG - Medico di medicina generale** (*general practitioner*) | N | Medico di fiducia dell'adulto, **in convenzione e non in dipendenza**, remunerato a quota capitaria. **Trappola:** non è un dipendente dell'azienda sanitaria, e questo cambia chi è titolare del trattamento dei dati che produce | [F01](01-sistema-sanitario-italiano.md) |
| **Mobilità sanitaria** (*inter-regional patient mobility*) | N | Regolazione dei crediti fra Regioni per prestazioni erogate ad assistiti di un'altra Regione | [F01](01-sistema-sanitario-italiano.md) |
| **Modalità con registrazione** (*recording mode*) | P | Modalità di sessione in cui il flusso transita per il componente di registrazione. **Trappola: in questa modalità la sessione non è più cifrata fino agli estremi**, l'informativa deve dirlo esplicitamente e l'indicatore di stato deve essere persistente e non occultabile | [DOM](../05_domain/06-consenso-e-riservatezza.md), [SEC](../06_security/05-sicurezza-del-tempo-reale.md) |
| **Modalità degradata** (del gateway terminologico) | P | Comportamento del sistema quando un sistema di codifica è disattivato: i percorsi principali funzionano, la validazione di quei codici non viene eseguita **e la mancata validazione è dichiarata** | [F17](17-ambiente-di-sviluppo.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Modalità di guasto** (*failure mode*) | S | Modo specifico in cui un componente può smettere di funzionare | [F11](11-fondamenti-informatici.md) |
| **Modello a livelli** (*layered model*) | S | Mappa concettuale di una pila di protocolli: il modello OSI a sette livelli, il modello di Internet a quattro | [F13](13-protocolli.md) |
| **Modello canonico di scambio** (*canonical exchange model*) | P | Rappresentazione con cui i fatti clinici escono ed entrano dal sistema. **Trappola:** è una **proiezione**, mai una fonte: il modello interno non si piega alla forma di scambio | [F16](16-architettura-del-progetto.md) |
| **Modello di minaccia** (*threat model*) | S | Descrizione strutturata di ciò contro cui il sistema si difende, con attori, superficie, controlli e rischio residuo | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/01-modello-di-minaccia.md) |
| **ModI - Modello di Interoperabilità** | N | Regole tecniche di AgID sui modelli di interazione, sicurezza e tracciatura delle interfacce applicative delle pubbliche amministrazioni | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Modificatore / prefisso** (ricerca FHIR) | S | Qualificatore del comportamento di un parametro di ricerca / operatore di confronto sui tipi ordinati | [F06](06-fhir-da-zero.md) |
| **`modifierExtension`** | S | Estensione che **cambia il significato** del resto della risorsa. **Trappola:** chi non la riconosce **deve rifiutare** la risorsa; ignorarla silenziosamente è un difetto grave | [F06](06-fhir-da-zero.md) |
| **Modifica sostanziale** (*significant change*) | N | Modifica al sistema di gestione della qualità o al dispositivo approvato che incide su sicurezza, prestazioni o condizioni d'uso; richiede approvazione preventiva dell'Organismo Notificato | [F15](15-regolatorio-da-zero.md) |
| **Multimorbilità** (*multimorbidity*) | S | Coesistenza di due o più condizioni croniche. **Trappola:** è una condizione a sé, non la somma delle singole malattie: i percorsi costruiti su una sola condizione non la governano | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Must support** | S | Marcatura di un elemento in un profilo il cui significato **deve essere definito dal profilo stesso**. **Trappola:** non significa «obbligatorio», e leggerla così produce implementazioni sbagliate in entrambe le direzioni | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |

### N

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **`NACK` / `RTX`** | S | Richiesta di ritrasmissione e flusso di ritrasmissione nel media in tempo reale (RFC 4585, RFC 4588) | [F08](08-webrtc-da-zero.md) |
| **NANDO / SMCS** | N | Banca dati e portale della Commissione che elencano gli organismi notificati per legislazione, Stato membro e ambito di designazione | [F15](15-regolatorio-da-zero.md) |
| **NAT** (*Network Address Translation*) | S | Traduzione degli indirizzi che permette a più dispositivi di condividere un indirizzo pubblico; rende irraggiungibili dall'esterno gli host interni | [F08](08-webrtc-da-zero.md) |
| **NAT simmetrico** (*symmetric NAT*) | S | Traduzione con corrispondenza dipendente da indirizzo e porta di destinazione (RFC 4787). **Trappola:** se presente su entrambi i lati rende **impossibile** il percorso diretto: il relay non è un ripiego, è l'unica strada | [F08](08-webrtc-da-zero.md) |
| **ndjson** | S | Un documento JSON per riga; leggibile in flusso con memoria costante | [F13](13-protocolli.md) |
| **Negoziazione del contenuto** (*content negotiation*) | S | Accordo su rappresentazione, lingua e codifica tramite le intestazioni `Accept*` e `Content-*` | [F13](13-protocolli.md) |
| **Negoziazione perfetta** (*perfect negotiation*) | S | Schema che risolve la collisione delle offerte senza corse critiche | [F08](08-webrtc-da-zero.md) |
| **NIT - Nodo di interoperabilità della telemedicina** | N | Componente di interoperabilità interregionale, **senza persistenza**, con mutua autenticazione a certificati | [F02](02-prestazioni-di-telemedicina.md) |
| **Nomenclatore** (*fee schedule*) | N | Catalogo codificato delle prestazioni con la relativa tariffa massima. **Trappola:** è **versionato nel tempo e variabile per regime**; cablarne una versione significa produrre importi sbagliati alla prima revisione | [F01](01-sistema-sanitario-italiano.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Nomina** (*nomination*, ICE) | S | Designazione della coppia di candidati definitiva da parte dell'agente controllante | [F08](08-webrtc-da-zero.md) |
| **Nonce** | S | Valore usato **una sola volta per chiave**. **Trappola:** il suo riuso annulla insieme riservatezza e integrità nelle costruzioni a contatore; non è un dettaglio implementativo | [F12](12-crittografia-e-sicurezza.md) |
| **Non alterabile** (*tamper-evident*) | P | Proprietà per cui nessuno, incluso chi amministra il sistema, può modificare una voce senza che l'alterazione sia rilevabile | [F16](16-architettura-del-progetto.md), [SEC](../06_security/04-tracciamento.md) |
| **Non conferibile** (*non-transmissible*) | P | Stato del documento che, per ragioni normative, non può essere conferito al fascicolo. **Trappola:** distinto da «non ancora conferito», che è uno stato transitorio e non definitivo | [DOM](../05_domain/04-documenti-clinici.md) |
| **Non ripudio** (*non-repudiation*) | S | Impossibilità, per chi ha compiuto un atto, di negarlo davanti a un terzo. **Trappola:** richiede firma **asimmetrica**; nessun codice di autenticazione a chiave condivisa lo fornisce | [F12](12-crittografia-e-sicurezza.md), [F16](16-architettura-del-progetto.md) |
| **Norma armonizzata** (*harmonised standard*) | N | Norma tecnica il cui riferimento è pubblicato nella Gazzetta ufficiale dell'Unione a sostegno di una legislazione; la sua applicazione conferisce presunzione di conformità (Reg. (UE) 2017/745, art. 8) | [F15](15-regolatorio-da-zero.md) |
| **NRE - Numero di ricetta elettronica** | N | Identificativo univoco nazionale della ricetta dematerializzata. **Trappola:** identifica **la ricetta**, non il paziente | [F01](01-sistema-sanitario-italiano.md) |
| **NSG - Nuovo sistema di garanzia** | N | Sistema di indicatori con cui il Ministero valuta l'erogazione dei livelli essenziali di assistenza da parte delle Regioni | [F01](01-sistema-sanitario-italiano.md) |
| **NTP / NTS** | S | Sincronizzazione degli orologi; la seconda ne autentica la sorgente. **Trappola:** un registro degli accessi con orologi non sincronizzati e non autenticati è un registro contestabile | [F13](13-protocolli.md) |

### O

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **`Observation`** | S | Risorsa FHIR che rappresenta un'osservazione: misura, reperto, valore | [F06](06-fhir-da-zero.md) |
| **OCSP** | S | Protocollo di interrogazione puntuale sullo stato di revoca di un certificato (RFC 6960) | [F12](12-crittografia-e-sicurezza.md) |
| **OdC - Ospedale di comunità** (*community hospital*; istituto italiano del DM 77/2022) | N | Struttura di ricovero a gestione prevalentemente infermieristica per bassa intensità clinica | [F01](01-sistema-sanitario-italiano.md) |
| **Offerta / risposta** (*offer/answer*) | S | Modello di negoziazione in cui un estremo propone tutto ciò che sa fare e l'altro accetta, restringe o rifiuta (RFC 3264) | [F08](08-webrtc-da-zero.md) |
| **Offset** (*offset*, broker) | S | Posizione del consumatore nel registro degli eventi; è ciò che consente la rilettura | [F13](13-protocolli.md) |
| **Oggetto valore** (*value object*) | S | Oggetto immutabile senza identità, definito interamente dai suoi attributi | [F11](11-fondamenti-informatici.md) |
| **Omeostasi** (*homeostasis*) | S | Mantenimento attivo di alcune grandezze fisiologiche entro intervalli stretti mediante retroazione negativa. **Trappola:** spiega perché un valore stabile non equivale a un sistema in equilibrio: può essere un sistema che sta lavorando molto per restare stabile | [F09](09-fondamenti-clinici.md) |
| **Omissione coordinata** (*coordinated omission*) | S | Difetto di misura per cui un generatore di carico smette di generare quando il sistema rallenta, sottostimando drasticamente le attese osservate | [F11](11-fondamenti-informatici.md), [TEC](../01_technical/07-prestazioni-e-capacita.md) |
| **Omocodia** (*tax code collision*; fenomeno del solo ordinamento italiano) | N | Coincidenza del codice fiscale fra due persone; si risolve sostituendo progressivamente le cifre con lettere secondo una tabella fissa e ricalcolando il carattere di controllo. **Trappola:** dimostra che il codice fiscale non è un identificatore univoco per costruzione | [F04](04-identita-e-anagrafiche.md) |
| **Ondata sincronizzata** (*thundering herd*) | S | Ritentativi che convergono sullo stesso istante e impediscono il recupero del servizio; si evita con una componente casuale nell'attesa | [F13](13-protocolli.md) |
| **OpenID Connect** | S | Strato di identità sopra OAuth 2.0, basato su token JSON firmati. **Trappola:** in Italia è disponibile in produzione per uno dei canali di identità pubblica e **non** per l'altro | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **`OperationOutcome`** | S | Risorsa FHIR che veicola errori, avvertimenti e informazioni diagnostiche | [F06](06-fhir-da-zero.md) |
| **Operazione (`$`)** | S | Azione FHIR che non si esprime con le interazioni REST; invocabile a livello di sistema, di tipo o di istanza | [F06](06-fhir-da-zero.md) |
| **Opus** | S | Codec audio di riferimento per WebRTC (RFC 6716; trasporto RFC 7587) | [F08](08-webrtc-da-zero.md) |
| **Orchestrazione** (*orchestration*) | S | Coordinamento in cui un componente conosce la sequenza dei passi, gestisce le compensazioni e conserva lo stato del processo, che diventa **interrogabile**. È l'opposto della coreografia | [F16](16-architettura-del-progetto.md) |
| **Ordinale opaco di tenant** (*opaque tenant ordinal*) | P | Numero progressivo usato nei nomi degli schemi al posto del nome del tenant, che può essere di per sé un dato personale | [F17](17-ambiente-di-sviluppo.md), [ARC](../02_architecture/05-multi-tenancy.md) |
| **Organismo Notificato** (*notified body*) | N | Ente terzo designato secondo l'Allegato VII del Reg. (UE) 2017/745 che valuta la conformità dei dispositivi delle classi superiori. **Trappola:** non può fornire consulenza a chi valuta, e i tempi di attesa sono il fattore limitante dell'intero percorso, non lo sviluppo del software | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/09-percorso-e-calendario.md) |
| **Orologio logico** (*logical clock*) | S | Contatore che cattura la precedenza causale fra eventi, indipendente dall'orologio fisico | [F11](11-fondamenti-informatici.md) |
| **Orologio monotono** (*monotonic clock*) | S | Sorgente di tempo che non torna indietro. **Trappola:** è l'unica corretta per misurare durate; usare l'orologio di sistema produce durate negative quando l'orologio viene corretto | [F13](13-protocolli.md) |
| **ORU** | S | Messaggio HL7 v2 per la trasmissione di risultati | [F05](05-standard-di-interoperabilita.md) |
| **Oscuramento** (*data suppression*; istituto del diritto italiano) | N | Diritto della persona assistita di rendere invisibili determinati documenti a determinati soggetti (DM 7 settembre 2023, art. 9). **Trappola:** **non cancella** il documento e non lo sottrae a chi lo ha prodotto, che continua a vederlo | [F03](03-il-dato-clinico.md), [DOM](../05_domain/06-consenso-e-riservatezza.md) |
| **Oscuramento dell'oscuramento** | N | Requisito per cui **l'esistenza stessa** del documento oscurato non deve essere inferibile. **Trappola:** è il requisito che rompe le implementazioni ingenue, perché un elenco con un buco è un elenco che rivela il buco | [F03](03-il-dato-clinico.md) |
| **Osservabilità** (*observability*) | S | Capacità di rispondere a domande **non previste** a partire da ciò che il sistema emette. **Trappola:** non è la somma di metriche e log predisposti per le domande già note | [F11](11-fondamenti-informatici.md), [TEC](../01_technical/06-osservabilita.md) |
| **Overbooking** | P | Assegnazione controllata di più appuntamenti allo stesso slot. **Trappola:** se emerge da una corsa critica non è una funzione, è un difetto; la differenza sta nell'intenzione registrata | [DOM](../05_domain/01-linguaggio-ubiquo.md) |

### P

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Pacchetto FHIR** (*FHIR package*) | S | Unità di distribuzione di una guida di implementazione, identificata da nome e versione e risolta da un registro | [F06](06-fhir-da-zero.md) |
| **PACELC** | S | Estensione del teorema CAP: in presenza di partizione si sceglie fra disponibilità e consistenza; altrimenti fra latenza e consistenza | [F11](11-fondamenti-informatici.md) |
| **Paginazione per cursore** (*cursor pagination*) | S | Paginazione basata su un riferimento opaco alla posizione raggiunta, stabile rispetto alle inserzioni concorrenti | [F11](11-fondamenti-informatici.md) |
| **PAI - Piano assistenziale individuale** (*individual care plan*; istituto italiano) | N | Piano della presa in carico integrata, multiprofessionale, con dimensione sanitaria **e sociale**, redatto da un'équipe | [F01](01-sistema-sanitario-italiano.md), [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Palpazione** (*palpation*) | S | Rilevazione mediante il tatto. **Trappola:** impossibile per il professionista a distanza, in ogni configurazione tecnica | [F09](09-fondamenti-clinici.md) |
| **Paratia** (*bulkhead*) | S | Assegnazione di risorse separate e limitate a categorie diverse di lavoro, per contenere la propagazione dei guasti | [F11](11-fondamenti-informatici.md) |
| **Partecipante** (*participant*) | S | Soggetto ammesso alla sessione con ruolo, qualifica dichiarata, istante di ingresso e istante di uscita | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Partizione** (*partition*) | S | Unità di parallelismo e di ordinamento di un broker. **Trappola:** l'ordine è garantito **solo al suo interno** | [F13](13-protocolli.md) |
| **`Patient`** | S | Risorsa FHIR anagrafica della persona assistita. **Trappola:** nel modello per riferimento il progetto lavora sull'`identifier` con dominio dell'integratore, non sull'`id` locale | [F06](06-fhir-da-zero.md) |
| **Paziente** (*patient*) | S | Persona destinataria dell'atto sanitario. **Trappola:** è una qualifica **clinica**, distinta da «assistito», che è amministrativa; le regole di accesso ai due insiemi di dati hanno domini diversi | [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **PDND - Piattaforma Digitale Nazionale Dati** | N | Catalogo di servizi applicativi e autorità di autorizzazione ai sensi dell'art. 50-*ter* del Codice dell'amministrazione digitale. **Trappola:** rilascia voucher, **non trasporta i dati** | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **PDQm** | S | Profilo IHE per l'interrogazione demografica | [F05](05-standard-di-interoperabilita.md) |
| **PDTA - Percorso diagnostico-terapeutico assistenziale** (*care pathway*; istituto organizzativo italiano) | N | Sequenza attesa di atti per una condizione, in una determinata organizzazione. **Trappola:** è il **modello**, non l'istanza sul singolo paziente: il modello è versionato, l'istanza è il piano di cura | [F01](01-sistema-sanitario-italiano.md), [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Pepe** (*pepper*) | S | Segreto uguale per tutti, conservato fuori dalla base dati, aggiunto alla password oltre al sale | [F12](12-crittografia-e-sicurezza.md) |
| **Percentile** | S | Valore sotto il quale cade una data frazione delle osservazioni | [F11](11-fondamenti-informatici.md) |
| **Percussione** (*percussion*) | S | Rilevazione mediante il suono prodotto colpendo una superficie corporea. **Trappola:** impossibile a distanza | [F09](09-fondamenti-clinici.md) |
| **Pericolo** (*hazard*) | N | Potenziale sorgente di danno, nella definizione della ISO 14971. La catena completa è **pericolo → sequenza di eventi → situazione pericolosa → danno** | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |
| **Permesso** (*permission*, TURN) | S | Autorizzazione, per indirizzo, a inviare traffico verso un'allocazione di relay, con durata limitata | [F08](08-webrtc-da-zero.md) |
| **Peso secco** (*dry weight*) | S | Peso obiettivo della persona in dialisi dopo la rimozione dei liquidi in eccesso; è il riferimento rispetto al quale si valuta lo scostamento | [F09](09-fondamenti-clinici.md) |
| **Piano applicativo** (*application plane*) | P | Superficie di esposizione che rappresenta le capacità del prodotto, con una grammatica di azioni | [F16](16-architettura-del-progetto.md), [PRO](../04_protocols/06-api-di-progetto.md) |
| **Piano clinico** (*clinical plane*) | P | Superficie di esposizione che rappresenta gli stati clinici nella grammatica dello standard sanitario. **Trappola:** i due piani non si fondono: uno è il prodotto, l'altro è il dominio | [F16](16-architettura-del-progetto.md), [PRO](../04_protocols/02-fhir.md) |
| **Piano di cura** (*care plan*) | S | Istanza sul singolo assistito di ciò che si è deciso di fare, con obiettivi, attività e calendario | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Piano di rientro** (*regional deficit recovery plan*; istituto italiano) | N | Regime di vincoli sulla spesa imposto alle Regioni in disavanzo sanitario | [F01](01-sistema-sanitario-italiano.md) |
| **Piano di telemonitoraggio** (*remote monitoring plan*) | N | Documento individuale che definisce operativamente cicli, durata, frequenze, fasce orarie, **soglie e regole di comportamento** (DM 19 novembre 2025, Allegato 1). È firmato ed è una tipologia documentale del fascicolo. **Trappola:** le soglie sono configurate dal professionista per quel singolo assistito, mai dedotte dal sistema né cablate | [F02](02-prestazioni-di-telemedicina.md), [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Pinning** (*fissaggio della versione*) | S | Fissare la versione esatta di una dipendenza per rendere la costruzione riproducibile. **Trappola:** vale anche per le guide di implementazione e per i pacchetti terminologici, non solo per le librerie di codice | [F05](05-standard-di-interoperabilita.md), [F17](17-ambiente-di-sviluppo.md) |
| **PIXm** | S | Profilo IHE per la correlazione fra identificativi del paziente in domini diversi | [F05](05-standard-di-interoperabilita.md) |
| **PKCE** | S | Meccanismo che lega il codice di autorizzazione a un segreto generato dal client per quella specifica richiesta | [F13](13-protocolli.md) |
| **PKI** (*public key infrastructure*) | S | Infrastruttura a chiave pubblica: autorità, politiche, procedure e formati che rendono operativi i certificati | [F12](12-crittografia-e-sicurezza.md) |
| **`PLI` / `FIR`** | S | Segnalazione di perdita d'immagine e richiesta di fotogramma completo (RFC 4585, RFC 5104) | [F08](08-webrtc-da-zero.md) |
| **PLS - Pediatra di libera scelta** (*family paediatrician*) | N | Equivalente del medico di medicina generale per la fascia pediatrica | [F01](01-sistema-sanitario-italiano.md) |
| **PN-DT - Piattaforma nazionale per la diffusione della telemedicina** | N | Portale di formazione, catalogo e comunicazione sulla telemedicina | [F02](02-prestazioni-di-telemedicina.md) |
| **PNRR Missione 6** | N | Componente «Salute» del Piano nazionale di ripresa e resilienza: la prima sotto-componente riguarda territorio e telemedicina, la seconda innovazione e fascicolo sanitario elettronico | [F01](01-sistema-sanitario-italiano.md) |
| **PNT - Piattaforma nazionale di telemedicina** | N | Insieme dell'infrastruttura nazionale e delle infrastrutture regionali, istituito presso AGENAS dal DM 19 novembre 2025, art. 2 | [F02](02-prestazioni-di-telemedicina.md) |
| **Politica di trasporto forzata al relay** (*relay-only transport policy*) | P | Configurazione della negoziazione che scarta i candidati non di relay; è la prova rapida che il percorso instradato funziona davvero | [F17](17-ambiente-di-sviluppo.md) |
| **Porta** (*port*) | S | Numero che identifica il programma destinatario su una macchina | [F08](08-webrtc-da-zero.md) |
| **Portale nazionale FSE** | N | Componente dell'infrastruttura nazionale per l'interoperabilità che espone il fascicolo in rete alla persona assistita e agli operatori | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Portata cardiaca** (*cardiac output*) | S | Volume di sangue espulso dal cuore in un minuto; prodotto di gittata sistolica e frequenza cardiaca | [F09](09-fondamenti-clinici.md) |
| **Posologia** (*dosage*) | S | Specificazione strutturata di dose, unità, frequenza, via, momento, durata e condizioni di assunzione. **Trappola:** rappresentarla come testo libero rende impossibile ogni verifica successiva | [F09](09-fondamenti-clinici.md) |
| **`Practitioner` / `PractitionerRole` / `Organization`** | S | Le tre risorse che separano la persona fisica, la veste in cui opera e il soggetto per conto del quale opera. **Trappola:** il riferimento di dominio punta sempre al **ruolo**, mai alla persona, perché i permessi seguono la veste | [F04](04-identita-e-anagrafiche.md), [F06](06-fhir-da-zero.md) |
| **`Prefer: handling=strict`** | S | Intestazione che chiede al server di segnalare errore sui parametri di ricerca non riconosciuti, invece di ignorarli silenziosamente | [F06](06-fhir-da-zero.md) |
| **Preferenza di degrado** (*degradation preference*) | S | Scelta fra sacrificare risoluzione o fluidità quando la banda non basta. **Trappola:** in un contesto clinico la scelta non è indifferente e va decisa esplicitamente, non ereditata dal comportamento predefinito | [F08](08-webrtc-da-zero.md) |
| **Prefisso, radice, suffisso** (*prefix, root, suffix*) | S | Elementi di composizione del lessico medico, che permettono di decodificare il significato **letterale** di termini mai visti. **Trappola:** il significato letterale non è la definizione clinica, che resta un'altra cosa e va cercata | [F09](09-fondamenti-clinici.md) |
| **Preimmagine** (*preimage*) | S | Input che produce un dato digest; la resistenza alla preimmagine è la proprietà di base di una funzione di hash | [F12](12-crittografia-e-sicurezza.md) |
| **Presa in carico** (*enrolment into care*) | P | Assunzione formale di responsabilità clinica continuativa su un problema di salute. **Trappola:** **non coincide con «avere un appuntamento»**, ed è il fatto che fonda gli obblighi di risposta | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Prestazione erogata** (*delivered service*) | P | L'atto effettivamente eseguito. **Trappola:** distinto dalla prestazione **richiesta** e da quella **rendicontata**: tre entità con cicli di vita, autori e stati diversi | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Prestazione fantasma** (*phantom service*) | P | Atto sanitario registrato due volte perché la connessione è caduta ed è stata ristabilita. È la forma clinica del difetto di idempotenza | [F16](16-architettura-del-progetto.md) |
| **Prestazione richiesta** (*requested service*) | S | La richiesta o il quesito che può dare origine a un atto. Può non essere mai eseguita | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Pressione arteriosa media** (*mean arterial pressure*) | S | Media temporale della pressione nel ciclo cardiaco. **Trappola:** nei sistemi informativi è **una formula dichiarata**, non una misura: va rappresentata come valore derivato con la formula esplicitata | [F09](09-fondamenti-clinici.md) |
| **Pressione differenziale** (*pulse pressure*) | S | Differenza fra pressione sistolica e diastolica; valore derivato, non misurato | [F09](09-fondamenti-clinici.md) |
| **Prevalenza** (*prevalence*) | S | Proporzione di soggetti con la condizione nella popolazione testata. **Trappola:** è una proprietà della **popolazione**, non della malattia né del test, e determina il valore predittivo di ogni allarme | [F09](09-fondamenti-clinici.md) |
| **PRI - Progetto riabilitativo individuale** (*individual rehabilitation project*; istituto italiano) | N | Contenitore obbligatorio delle prestazioni di riabilitazione, teleriabilitazione compresa | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Principale applicativo** (*application principal*) | P | Il sistema che agisce per conto di una persona. **Trappola:** va distinto dalla persona **in ogni voce di registro**; fonderli rende il registro inservibile in caso di contestazione | [F16](16-architettura-del-progetto.md), [INT](../07_integration/06-identita-e-delega.md) |
| **Principio attivo** (*active substance*) | S | Sostanza responsabile dell'effetto del farmaco. **Trappola:** distinto dal nome del medicinale in commercio e dal codice della confezione | [F09](09-fondamenti-clinici.md) |
| **Privilegio minimo** (*least privilege*) | S | Assegnazione dei soli permessi necessari, per il solo tempo necessario | [F12](12-crittografia-e-sicurezza.md) |
| **Problem Details** | S | Formato normato degli errori HTTP, `application/problem+json` (RFC 9457) | [F13](13-protocolli.md), [PRO](../04_protocols/06-api-di-progetto.md) |
| **Processo di Validazione** | N | Procedura di AGENAS di certificazione degli standard tecnici per le soluzioni di terze parti, prevista dal DM 19 novembre 2025, art. 3, c. 4. **Trappola:** il contenuto operativo non è pubblicamente documentato `[NV]`: è la porta d'ingresso del progetto e la sua indeterminatezza è un rischio dichiarato | [F02](02-prestazioni-di-telemedicina.md) |
| **Profilazione** (*profiling*, di uno standard) | S | L'atto di restringere uno standard generale per renderlo verificabile in un contesto preciso | [F05](05-standard-di-interoperabilita.md) |
| **Profilo** (*profile*) | S | Restrizione di una specifica per un contesto d'uso. **Trappola:** può solo **restringere**, mai allargare; un «profilo» che aggiunge libertà non è un profilo | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Profilo di dimensione del dataset** | P | Selezione della quantità di dati sintetici generati: minima per i percorsi, dimostrativa per l'interfaccia, estesa per le prove di capacità | [F17](17-ambiente-di-sviluppo.md) |
| **Profilo di integrazione** (*integration profile*, IHE) | S | Composizione di attori e transazioni che risolve un problema di integrazione determinato | [F05](05-standard-di-interoperabilita.md) |
| **Profilo di protezione** (*protection profile*, SRTP) | S | Suite di cifratura del media negoziata fra i due estremi. **Trappola:** i profili nulli **non cifrano** e vanno rifiutati esplicitamente | [F08](08-webrtc-da-zero.md) |
| **Profilo sanitario sintetico** (*patient summary*) | N | Documento derivato, redatto e aggiornato dal medico di fiducia, che riassume la storia clinica rilevante della persona assistita | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Prognosi** (*prognosis*) | S | Previsione dell'evoluzione. **Trappola:** è una distribuzione di probabilità, non una data; rappresentarla come una data è clinicamente e giuridicamente sbagliato | [F09](09-fondamenti-clinici.md) |
| **Prontezza e vivacità** (*readiness and liveness*) | S | Due indicatori distinti dello stato di un servizio: **vivo** significa che il processo esiste, **pronto** che può ricevere traffico | [F17](17-ambiente-di-sviluppo.md), [TEC](../01_technical/06-osservabilita.md) |
| **Protocollo** (*protocol*) | S | Accordo su quali messaggi si scambiano, in quale ordine, come sono rappresentati, che cosa significano e che cosa accade in caso di errore | [F13](13-protocolli.md) |
| **`Provenance`** | S | Risorsa FHIR che registra da dove viene un dato e chi lo ha prodotto | [F06](06-fhir-da-zero.md) |
| **Prova a contratto** (*contract test*) | S | Prova che verifica che produttore e consumatore concordino sul contratto, senza eseguirli insieme | [F11](11-fondamenti-informatici.md), [F17](17-ambiente-di-sviluppo.md) |
| **Prova che verifica un divieto** | P | Prova il cui esito atteso è il **fallimento di un tentativo**: per esempio occultare l'indicatore di registrazione o salvare un tema che degrada il contrasto | [F17](17-ambiente-di-sviluppo.md) |
| **Prova negativa** (*negative test*) | P | Prova che passa **solo se un tentativo fallisce**; è la forma con cui si dimostra l'isolamento fra organizzazioni | [F16](16-architettura-del-progetto.md) |
| **PRRC** (*person responsible for regulatory compliance*) | N | Persona responsabile del rispetto della normativa; requisiti di qualifica e compiti fissati dall'art. 15 del Reg. (UE) 2017/745 | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **Pseudonimizzazione** (*pseudonymisation*) | N | Trattamento che impedisce l'attribuzione a un interessato senza informazioni aggiuntive conservate separatamente. **Trappola:** il dato resta **personale**, e resta dentro il perimetro del regolamento | [F03](03-il-dato-clinico.md) |
| **Pseudonimo** (*pairwise pseudonymous identifier*) | S | Identificatore opaco che individua una persona senza rivelarne l'identità. **Trappola:** è unico **per gestore e per fornitore**, quindi **non condivisibile** fra sistemi: usarlo come chiave di correlazione è un errore strutturale | [F04](04-identita-e-anagrafiche.md) |
| **PSN - Polo Strategico Nazionale** | N | Infrastruttura che ospita dati e servizi critici e strategici delle pubbliche amministrazioni su centri dati nazionali | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **PSUR** (*periodic safety update report*) | N | Rapporto periodico di aggiornamento sulla sicurezza (Reg. (UE) 2017/745, art. 86); previsto dalla Classe IIa in su | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Punto di erogazione** (*point of delivery*) | S | Luogo, anche virtuale, in cui la struttura eroga. **Trappola:** distinto dall'indirizzo di svolgimento, che è dove si trova la persona assistita | [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Punto di ripristino** (*recovery point objective*, RPO) | S | Quantità massima di dati che si accetta di perdere, espressa in tempo | [F11](11-fondamenti-informatici.md) |

### Q

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **QC1–QC4 / QI1–QI4** | N | Livelli di qualificazione dell'Agenzia per la cybersicurezza nazionale, rispettivamente dei servizi cloud e delle infrastrutture che li ospitano | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Qualità del collegamento** (*connection quality*) | N | Evidenza che il referto di televisita deve riportare, insieme alla conferma di idoneità all'esecuzione (Accordo 215/CSR 2020). **Trappola:** è un contenuto **obbligatorio del documento**, non una metrica interna di prodotto | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **`Quantity`** | S | Tipo di dato FHIR: misura con valore, unità leggibile dall'essere umano e **codice** dell'unità per la macchina | [F06](06-fhir-da-zero.md) |
| **Quasi evento** (*near miss*) | S | Evento che avrebbe potuto causare un danno e non lo ha causato. **Trappola:** è la fonte di apprendimento più preziosa, e un sistema che non lo registra spreca l'unica informazione gratuita che riceve | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Quesito diagnostico** (*diagnostic question*) | N | Motivo codificato della richiesta; è un campo del tracciato del referto di televisita | [DOM](../05_domain/04-documenti-clinici.md) |
| **`Questionnaire` / `QuestionnaireResponse`** | S | Definizione di un questionario strutturato e insieme di risposte compilate | [F06](06-fhir-da-zero.md) |
| **Quota capitaria** (*capitation*) | N | Finanziamento commisurato al numero di assistiti in carico, alternativo alla remunerazione a prestazione | [F01](01-sistema-sanitario-italiano.md) |

### R

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Radice di aggregato** (*aggregate root*) | S | Entità che è l'**unico** punto di accesso a un aggregato dall'esterno | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Rapporto di verosimiglianza** (*likelihood ratio*) | S | Fattore per cui un risultato di test moltiplica la quota a priori di malattia; proprietà del solo test | [F09](09-fondamenti-clinici.md) |
| **Rapporto tecnico di sessione** (*session technical report*) | P | Sintesi ricostruibile di qualità, interruzioni, ripieghi e cambi di canale di una prestazione, utilizzabile nel documento clinico e nella gestione dei reclami | [F14](14-flussi-funzionali.md) |
| **RBAC** (*role-based access control*) | S | Controllo degli accessi basato sui ruoli. **Trappola:** efficace per i permessi grossolani, **insufficiente** per la singola risorsa clinica, dove conta l'esistenza della relazione di cura | [F12](12-crittografia-e-sicurezza.md) |
| **RdA / RdE - Regione di assistenza / Regione di erogazione** | N | Dove la persona è iscritta e dove la prestazione è erogata. **Trappola:** non coincidono sempre, e vanno rappresentate **entrambe**: sono due attributi distinti di ogni prestazione | [F01](01-sistema-sanitario-italiano.md), [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Realm** (*contesto nazionale di una guida*) | S | Il contesto giuridico e organizzativo a cui una guida di implementazione si riferisce | [F05](05-standard-di-interoperabilita.md) |
| **Referto** (*report*) | N | Documento sanitario firmato con esito e conclusioni di un atto, destinato alla persona assistita e al richiedente. **Trappola:** per la televisita esiste una **tipologia documentale propria**, creata dal DM 19 novembre 2025, art. 7, che non coincide con il referto di specialistica ambulatoriale | [F01](01-sistema-sanitario-italiano.md), [F03](03-il-dato-clinico.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **`Reference`** | S | Tipo di dato FHIR: puntatore a un'altra risorsa | [F06](06-fhir-da-zero.md) |
| **Registro degli accessi** (*access log*) | P | Catena a sola aggiunta con impronte, conservata separatamente, che registra chi ha fatto cosa su quale soggetto. **Trappola:** è **distinto dal log applicativo e dal versionamento delle entità**: il versionamento non rende immutabile, perché chi ha accesso in scrittura alla base dati può alterare anche le tabelle di storico | [F12](12-crittografia-e-sicurezza.md), [F16](16-architettura-del-progetto.md), [SEC](../06_security/04-tracciamento.md) |
| **Registro delle violazioni** (*breach register*) | N | Documentazione obbligatoria di **ogni** violazione, anche di quelle non notificate (art. 33, par. 5 del Regolamento (UE) 2016/679) | [F03](03-il-dato-clinico.md) |
| **Relay dell'outbox** (*outbox relay*) | S | Processo separato che legge la tabella di outbox e pubblica gli eventi sul broker | [F11](11-fondamenti-informatici.md) |
| **Relazione clinica** (*clinical letter*) | P | Comunicazione discorsiva fra professionisti su un caso. **Trappola:** non certifica un esame e non è necessariamente destinata alla persona assistita | [F03](03-il-dato-clinico.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Relazione collaborativa** (*collaborative report*; tipologia documentale del diritto italiano) | N | Documento prodotto dal teleconsulto o dalla teleconsulenza, conferito al fascicolo **come allegato** al documento dell'evento principale. **Trappola:** non è un referto, e chiamarlo «referto di teleconsulto» è un errore che il decreto smentisce | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Relazione di cura** (*care relationship*) | P | Legame documentato fra professionista e persona assistita; è il fatto materializzato che **fonda l'accesso** ai dati clinici, con condizione di esistenza, periodo e fonte | [F12](12-crittografia-e-sicurezza.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Rendicontazione** (*reporting for reimbursement*) | N | Trasmissione dei dati di erogazione ai flussi informativi, con tracciamento della modalità a distanza | [F01](01-sistema-sanitario-italiano.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Responsabile del trattamento** (*processor*) | N | Chi tratta dati personali per conto del titolare sulla base di un atto ai sensi dell'art. 28 del Regolamento (UE) 2016/679 | [F03](03-il-dato-clinico.md) |
| **Retroazione sul trasporto** (`transport-cc`) | S | Riscontro dei tempi d'arrivo per tutti i pacchetti della connessione. **Trappola:** deriva da una bozza scaduta, ed è comunque ciò che i browser usano | [F08](08-webrtc-da-zero.md) |
| **Rettifica** (*amendment*) | P | Emissione di una versione successiva che annulla e sostituisce la precedente, con motivazione. **Trappola:** non cancella la precedente, che resta nella catena | [DOM](../05_domain/04-documenti-clinici.md) |
| **Revoca** (*revocation*) | S | Dichiarazione che un certificato o un token non è più valido prima della scadenza. **Trappola:** un certificato revocato resta **crittograficamente valido**: senza verifica della revoca, la revoca non esiste | [F12](12-crittografia-e-sicurezza.md), [F13](13-protocolli.md) |
| **Riacutizzazione / esacerbazione** (*exacerbation*) | S | Peggioramento rapido di una condizione cronica; principale determinante di ricovero, spesso preceduto da segnali misurabili | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Riavvio di ICE** (*ICE restart*) | S | Nuova raccolta e selezione dei percorsi senza rifare la sessione. **Trappola: non rigenera le chiavi** del media | [F08](08-webrtc-da-zero.md) |
| **Ricetta dematerializzata** (*dematerialised prescription*) | N | Prescrizione elettronica identificata dal numero di ricetta elettronica, sostitutiva del supporto cartaceo (DM 2 novembre 2011) | [F01](01-sistema-sanitario-italiano.md) |
| **Riconciliazione terapeutica** (*medication reconciliation*) | S | Confronto sistematico fra ciò che la persona assume davvero e ciò che risulta prescritto | [F09](09-fondamenti-clinici.md) |
| **Riferimento relativo / assoluto / logico / contenuto** | S | Le quattro forme di puntamento fra risorse FHIR: stesso server, altro server, per identificativo di business, frammento interno | [F06](06-fhir-da-zero.md) |
| **Ripiego** (*fallback*) | P | Comportamento alternativo quando la via principale non è disponibile. In ambito clinico: prosecuzione della prestazione su un canale degradato, registrata con motivazione e riportata nel documento. **Trappola:** **non è la stessa prestazione**, e il documento deve dirlo | [F11](11-fondamenti-informatici.md), [F14](14-flussi-funzionali.md) |
| **Ripiego di canale** (*channel fallback*) | P | Passaggio dichiarato da un canale a un altro durante l'atto, registrato perché può incidere sulla **natura** dell'atto e quindi sulla sua rendicontabilità | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Ripiego in presenza** (*in-person fallback*) | N | Obbligo di completare o riprogrammare la prestazione in presenza, **senza oneri aggiuntivi**, quando il canale a distanza non consente di mantenerne il contenuto sostanziale | [F02](02-prestazioni-di-telemedicina.md) |
| **Ripristino selettivo** (*selective restore*) | P | Riportare i dati di una sola organizzazione a un istante precedente senza toccare le altre. **Trappola:** un ripristino mai provato non esiste | [F16](16-architettura-del-progetto.md) |
| **Riprogrammazione** (*rescheduling*) | P | Spostamento che conserva il collegamento alla richiesta originaria e la catena degli appuntamenti sostituiti | [DOM](../05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Rischio** (*risk*) | N | Combinazione della probabilità di occorrenza del danno e della sua gravità (ISO 14971) | [F10](10-percorsi-di-cura-e-sicurezza.md), [CMP](../08_compliance/05-gestione-del-rischio.md) |
| **Rischio clinico** (*clinical risk*) | S | Probabilità che una persona subisca un danno come conseguenza delle cure ricevute | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Rischio residuo** (*residual risk*) | N | Rischio che permane dopo l'applicazione delle misure di controllo. **Trappola:** va ponderato singolarmente **e complessivamente**, dichiarato e comunicato: non è un valore che si azzera | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |
| **Riservatezza** (*confidentiality*) | S | Accessibilità dell'informazione ai soli autorizzati | [F12](12-crittografia-e-sicurezza.md) |
| **Risorsa** (*resource*, FHIR) | S | Unità di scambio di FHIR: oggetto di dominio autoconsistente, con identità e indirizzo propri | [F06](06-fhir-da-zero.md) |
| **Ritardo del consumatore** (*consumer lag*) | S | Differenza fra l'ultimo record scritto e la posizione raggiunta dal consumatore | [F11](11-fondamenti-informatici.md) |
| **Rotazione del segreto** (*secret rotation*) | P | Sostituzione di una credenziale esposta. **Trappola:** è necessaria **anche dopo la rimozione** del segreto dal codice, perché la cronologia del repository e le copie restano | [F17](17-ambiente-di-sviluppo.md) |
| **Rotazione delle chiavi** (*key rotation*) | S | Sostituzione di una chiave, con un periodo in cui la vecchia e la nuova coesistono | [F13](13-protocolli.md) |
| **Rottura del vetro** (*break the glass*) | S | Accesso in emergenza che supera l'autorizzazione ordinaria, con motivazione obbligatoria, tracciamento rinforzato, notifica e verifica successiva. **Trappola:** senza la verifica successiva è soltanto un'autorizzazione che si concede da sé | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/02-identita-e-accessi.md) |
| **RPD / DPO - Responsabile della protezione dei dati** (*data protection officer*) | N | Funzione di sorveglianza e punto di contatto; obbligatoria per trattamenti su larga scala di categorie particolari di dati | [F03](03-il-dato-clinico.md) |
| **RTT** (*round-trip time*) | S | Tempo di andata e ritorno fra due estremi. **Trappola:** nelle statistiche del media si legge nel blocco relativo al flusso in ingresso remoto, non in quelle in uscita | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **Ruolo organizzativo** (*practitioner role*) | S | Relazione fra professionista e organizzazione, con disciplina, prestazioni erogabili e **validità temporale** | [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **Ruolo unico di assistenza primaria** (istituto italiano della medicina convenzionata) | N | Figura che unifica le precedenti articolazioni della medicina generale convenzionata | [F01](01-sistema-sanitario-italiano.md) |

### S

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Saga** | S | Sequenza di transazioni locali con compensazioni, alternativa alla transazione distribuita | [F11](11-fondamenti-informatici.md) |
| **Sala d'attesa virtuale** (*virtual waiting room*) | P | Stato del contatto in cui la persona è connessa, verificata tecnicamente e in attesa di ammissione, più la coda relativa. **Trappola:** **non è una stanza media dedicata**: modellarla come tale raddoppia le sessioni media senza motivo | [DOM](../05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Sale** (*salt*) | S | Valore casuale unico per password, non segreto, che impedisce il precalcolo di tabelle riutilizzabili | [F12](12-crittografia-e-sicurezza.md) |
| **SAML 2.0** | S | Standard di federazione dell'identità basato su documenti XML firmati. **Trappola:** è l'unico protocollo utilizzabile **in produzione** per uno dei due canali di identità pubblica italiani | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **SAS** (*short authentication string*, stringa breve di verifica delle chiavi) | P | Codice breve derivato dalle impronte dei certificati, confrontato **a voce** dai due interlocutori all'avvio della sessione. **Trappola:** è l'unico meccanismo di verifica indipendente disponibile, ed è ciò che rende dimostrabile la cifratura da estremo a estremo; è obbligatorio per impostazione predefinita e deve essere leggibile da uno screen reader e mai veicolato dal solo colore | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md), [SEC](../06_security/05-sicurezza-del-tempo-reale.md) |
| **Scala clinica** (*clinical scale*) | S | Strumento che trasforma osservazioni in un valore confrontabile. **Trappola:** ha validazione, popolazione di riferimento, versione **e licenza**: nessuna delle quattro è facoltativa e l'ultima è quella che si dimentica | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Scala di allerta precoce** (*early warning score*) | S | Scala che aggrega parametri vitali in un punteggio legato a una frequenza di rivalutazione e a un livello di risposta | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **`Schedule` / `Slot`** | S | Risorse FHIR del calendario di disponibilità e della singola finestra prenotabile | [F06](06-fhir-da-zero.md) |
| **Scompenso** (*decompensation*) | S | Condizione in cui i meccanismi di compenso non bastano più e la grandezza regolata esce dall'intervallo utile | [F09](09-fondamenti-clinici.md) |
| **Scope** (*ambito di autorizzazione*) | S | Ambito richiesto e concesso a un token | [F13](13-protocolli.md) |
| **Scrittura obliqua** (*write skew*) | S | Anomalia in cui due transazioni corrette singolarmente producono uno stato globale non valido | [F11](11-fondamenti-informatici.md) |
| **SDO** (*standards development organization*) | S | Ente che produce specifiche tecniche tramite un processo di consenso fra portatori di interesse | [F05](05-standard-di-interoperabilita.md) |
| **SDP** (*Session Description Protocol*) | S | Formato testuale che descrive una sessione media: codec, parametri, indirizzi, impronte (RFC 8866). **Trappola:** è **trasportato**, non trasporta: non è un protocollo di segnalazione | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **Second opinion** | N | Valutazione indipendente, anche richiesta dalla persona assistita, da parte di un professionista che **non entra nella presa in carico** | [F02](02-prestazioni-di-telemedicina.md) |
| **Segmento** (*segment*, HL7 v2) | S | Una riga del messaggio, identificata da un nome di tre caratteri | [F05](05-standard-di-interoperabilita.md) |
| **Segnalazione** (*signaling*) | S | Scambio preliminare fra i due estremi delle descrizioni di sessione e dei candidati. **Trappola: non è standardizzata da WebRTC**: è interamente responsabilità dell'applicazione, ed è il punto in cui si inserisce l'attacco dell'intermediario | [F08](08-webrtc-da-zero.md) |
| **Segnale** (*sign*) | S | Manifestazione rilevabile dall'osservatore; ha come fonte il professionista. **Trappola:** distinto dal sintomo, che ha come fonte la persona assistita; la fonte è un attributo del dato, non un dettaglio | [F09](09-fondamenti-clinici.md) |
| **Segnale d'allarme** (*red flag*) | S | Elemento clinico la cui presenza impone di uscire dal canale a distanza. **Trappola:** è **altamente sensibile e poco specifico per costruzione**: produrrà falsi positivi, e questo è il comportamento voluto | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Segretezza in avanti** (*forward secrecy*) | S | Proprietà per cui la compromissione futura della chiave di lungo termine non espone le sessioni passate | [F12](12-crittografia-e-sicurezza.md), [F13](13-protocolli.md) |
| **Seme del generatore** (*generator seed*) | P | Valore che determina il dataset sintetico prodotto. **Trappola:** va registrato in ogni segnalazione di difetto, perché è ciò che rende il caso riproducibile | [F17](17-ambiente-di-sviluppo.md) |
| **Sensibilità** (*sensitivity*) | S | Quota di casi realmente positivi che il test o la regola individua. **Trappola:** è una proprietà del test, **indipendente dalla prevalenza**; alta sensibilità significa pochi falsi negativi, non pochi falsi allarmi | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Separazione dei compiti** (*separation of duties*) | S | Nessun singolo soggetto può completare da solo un'operazione critica. **Trappola:** alcune registrazioni del sistema di gestione della qualità richiedono soggetti **diversi**, e nessuna quantità di lavoro individuale le produce | [F12](12-crittografia-e-sicurezza.md), [CMP](../08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **Separazione dei domini** (*domain separation*) | S | Derivazione di chiavi distinte per usi distinti, così che la compromissione di un uso non si estenda agli altri | [F12](12-crittografia-e-sicurezza.md) |
| **Serie temporale** (*time series*) | S | Successione di misure dello stesso fenomeno nel tempo, con un profilo d'uso proprio | [F11](11-fondamenti-informatici.md) |
| **Service Provider / Identity Provider** | S | Chi eroga il servizio e chi autentica l'utente asserendone l'identità. **Trappola:** in una federazione pubblica il fornitore di servizi è **il soggetto che eroga in rete**, cioè chi installa, non chi scrive il software | [F13](13-protocolli.md), [F04](04-identita-e-anagrafiche.md) |
| **Servizi minimi** (*minimum services*) | N | I quattro servizi che l'infrastruttura regionale di telemedicina deve erogare: televisita, teleconsulto e teleconsulenza, telemonitoraggio, teleassistenza (DM 21 settembre 2022) | [F02](02-prestazioni-di-telemedicina.md) |
| **Sessione applicativa** (*application session*) | P | Sessione di accesso di un utente al sistema. **Trappola:** una delle tre cose che l'italiano chiama «sessione»; vedi la sezione sui termini dipendenti dal contesto | [DOM](../05_domain/01-linguaggio-ubiquo.md) |
| **Sessione media** (*media session*) | P | Istanza di collegamento in tempo reale fra partecipanti. **Trappola:** è un **aggregato distinto dal contatto**: un contatto può avere più sessioni media, e una sessione media caduta non chiude il contatto | [F14](14-flussi-funzionali.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Sezione media** (`m=`) | S | Blocco dell'SDP che descrive un flusso: tipo, codec offerti, direzione, attributi | [F08](08-webrtc-da-zero.md) |
| **Setting di erogazione** (*care setting*) | P | Contesto organizzativo dell'erogazione. **Trappola: discrimina regole** - obbligo di referto, necessità della prescrizione, regime di rendicontazione - e non è quindi un'etichetta descrittiva | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **SFrame** | S | Cifratura autenticata dei fotogrammi sopra SRTP (RFC 9605). **Trappola: non definisce la gestione delle chiavi**, che resta interamente a carico dell'applicazione | [F08](08-webrtc-da-zero.md) |
| **Sicura** (*safe*, di un metodo HTTP) | S | Detto di un metodo che non modifica lo stato del server | [F13](13-protocolli.md) |
| **Sicurezza a livello di riga** (*row level security*) | S | Filtro applicato dal motore della base dati a ogni interrogazione, sulla base del contesto di sessione. **Trappola:** nel progetto è la **seconda** barriera, non il meccanismo unico, e in assenza di contesto **nega tutto**, di proposito | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](../02_architecture/05-multi-tenancy.md) |
| **Sigillo periodico** (*periodic seal*) | P | Impronta della catena firmata, marcata temporalmente e depositata presso un soggetto distinto | [F12](12-crittografia-e-sicurezza.md) |
| **Sindrome** (*syndrome*) | S | Insieme di segni e sintomi che ricorrono insieme. **Trappola:** non è una diagnosi di causa | [F09](09-fondamenti-clinici.md) |
| **Sintomo** (*symptom*) | S | Manifestazione riferita dalla persona assistita e non osservabile direttamente. **Trappola:** distinto dal segno; la fonte del dato cambia il suo peso clinico e va rappresentata | [F09](09-fondamenti-clinici.md) |
| **Sistema TS - Sistema Tessera Sanitaria** | N | Infrastruttura del Ministero dell'economia e delle finanze prevista dall'art. 50 del D.L. 269/2003, su cui è realizzata l'infrastruttura nazionale per l'interoperabilità del fascicolo; gestisce anche ricetta dematerializzata e spese sanitarie | [F01](01-sistema-sanitario-italiano.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Situazione pericolosa** (*hazardous situation*) | N | Circostanza in cui persone, beni o ambiente sono esposti a uno o più pericoli (ISO 14971) | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |
| **SIU** | S | Famiglia di messaggi HL7 v2 per la programmazione degli appuntamenti | [F05](05-standard-di-interoperabilita.md) |
| **Slicing** | S | Partizione di un elemento ripetuto di un profilo in sottoinsiemi con vincoli propri | [F06](06-fhir-da-zero.md) |
| **Slot** | S | Intervallo temporale elementare di un'agenda. **Trappola:** uno slot occupato **non è** un appuntamento: è la sua proiezione sull'agenda, e fonderli rende impossibile l'overbooking controllato e produce la doppia prenotazione sotto concorrenza | [DOM](../05_domain/01-linguaggio-ubiquo.md) |
| **SMART on FHIR** | S | Profilo di OAuth 2.0 che aggiunge contesto clinico, ambiti FHIR e scoperta standardizzata | [F13](13-protocolli.md), [INT](../07_integration/03-integrazione-per-api.md) |
| **SNI** (*server name indication*) | S | Nome del servizio richiesto, inviato **in chiaro** nel primo messaggio della stretta di mano TLS | [F13](13-protocolli.md) |
| **SNOMED CT** | S | Terminologia clinica estesa. **Trappola:** in Italia è soggetta a licenza onerosa e **il progetto non ne distribuisce, non ne scarica e non ne riporta alcun contenuto**; il sistema è pienamente funzionale senza, al costo dichiarato di non validare alcuni binding | [F05](05-standard-di-interoperabilita.md), [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **Soggetto aggregatore / aggregato** | N | Schema che consente a un soggetto di aderire alla federazione dell'identità pubblica attraverso un terzo già accreditato, senza affrontare in proprio il procedimento | [F04](04-identita-e-anagrafiche.md) |
| **Soglia clinica** (*clinical threshold*) | P | Valore di riferimento per un parametro di un **singolo** assistito, configurato dal professionista. **Trappola: mai cablata, mai dedotta dal sistema, mai esposta a un amministratore di tenant.** È una decisione clinica individuale | [DOM](../05_domain/05-parametri-e-osservazioni.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Soglia tecnica** (*technical threshold*) | P | Valore di riferimento sulla qualità del canale. **Trappola:** è una **specifica di prodotto configurabile**, non un requisito normativo: nessuna soglia tecnica è imposta dalla normativa italiana | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/01-linguaggio-ubiquo.md) |
| **Soluzioni tecnologiche AGENAS** | N | Componenti per il controllo formale e semantico, la conversione nei formati standard e l'invio all'ecosistema dati sanitari; operano **senza persistenza** dei dati trattati | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Sorgente sintetica di media** (*fake media device*) | P | Flusso audio o video deterministico che sostituisce camera e microfono nelle prove automatiche | [F17](17-ambiente-di-sviluppo.md) |
| **Sorveglianza del volume atteso** (*expected volume monitoring*) | P | Confronto fra le misure attese e quelle ricevute in una finestra, per rilevare il **silenzio collettivo** prima delle assenze individuali. **Trappola:** è distinta dalla sorveglianza per singolo assistito, e intercetta guasti che quella non vede | [DOM](../05_domain/05-parametri-e-osservazioni.md), [F14](14-flussi-funzionali.md) |
| **Sorveglianza post-commercializzazione** (*post-market surveillance*) | N | Raccolta e analisi sistematica dei dati su qualità, prestazione e sicurezza per tutta la vita del dispositivo (Reg. (UE) 2017/745, artt. 83–86) | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Sospetto diagnostico** (*suspected diagnosis*) | S | Ipotesi che motiva un accertamento. **Trappola:** è un'entità distinta dalla diagnosi, con autore e ciclo di vita propri; rappresentarla nello stesso campo della diagnosi produce diagnosi che nessuno ha mai formulato | [F09](09-fondamenti-clinici.md) |
| **SOUP** (*software of unknown provenance*) | N | Componente software già disponibile, non sviluppato per quel dispositivo, oppure privo di registrazioni adeguate dei processi di sviluppo (IEC 62304 § 3.29). **Trappola:** la sua gestione è un **obbligo formale**, non una buona pratica, e censirlo a posteriori costa molte volte tanto | [F12](12-crittografia-e-sicurezza.md), [F13](13-protocolli.md), [F15](15-regolatorio-da-zero.md) |
| **Specialista ambulatoriale interno** (istituto italiano della medicina convenzionata) | N | Professionista convenzionato a rapporto orario che opera negli ambulatori dell'azienda sanitaria; distinto dal medico specialista dipendente | [F01](01-sistema-sanitario-italiano.md) |
| **Specifica** (*base standard*) | S | Documento che definisce il modello generale, volutamente permissivo per valere in ogni contesto. **Trappola:** una specifica di base non è implementabile senza un profilo: la permissività è voluta e va ristretta | [F05](05-standard-di-interoperabilita.md) |
| **Specificità** (*specificity*) | S | Quota di casi realmente negativi correttamente esclusi. **Trappola:** alta specificità significa pochi falsi positivi, e non ha nulla a che vedere con la sensibilità | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **SPID - Sistema pubblico di identità digitale** (istituto italiano) | N | Federazione di più gestori di identità accreditati. **Trappola:** l'ordine di presentazione dei gestori è obbligatoriamente casuale; con i livelli superiori non esiste sessione condivisa; e **in produzione è utilizzabile solo in SAML 2.0** | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **SRN** (*single registration number*) | N | Numero di registrazione unico dell'operatore economico nella banca dati europea dei dispositivi medici | [F15](15-regolatorio-da-zero.md) |
| **SRTP** (*Secure Real-time Transport Protocol*) | S | Formato che cifra e autentica i pacchetti del media in tempo reale (RFC 3711) | [F08](08-webrtc-da-zero.md) |
| **SSN - Servizio sanitario nazionale** (*Italian National Health Service*) | N | Complesso di funzioni, strutture, servizi e attività destinati alla salute dell'intera popolazione (L. 833/1978) | [F01](01-sistema-sanitario-italiano.md) |
| **SSRF** (*server-side request forgery*) | S | Indurre un server a chiamare una destinazione scelta dall'attaccante, tipicamente interna | [F13](13-protocolli.md), [SEC](../06_security/06-sicurezza-applicativa.md) |
| **Standard** | S | Documento pubblicato da un ente riconosciuto che descrive un formato, un protocollo o un modello | [F13](13-protocolli.md) |
| **Standard di fatto** (*de facto standard*) | S | Convenzione diffusa che nessun ente ha normato. **Trappola:** diffuso non significa normato, e citarlo come standard in un documento regolatorio è un errore | [F13](13-protocolli.md) |
| **Stanza laterale** (*breakout room*) | P | Colloquio riservato fra professionisti che esclude temporaneamente la persona assistita. **Trappola: sempre annunciato, mai silenzioso**, e registrato | [DOM](../05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Stato del contatto** (*encounter state*) | P | Dove si trova il contatto nel suo ciclo di vita. **Trappola:** distinto dall'**esito**, che dice invece come l'atto si è concluso | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Stato di risoluzione** (*resolution status*) | P | Esito del tentativo di risolvere un codice: risolto, sistema disattivato, servizio non raggiungibile, codice non trovato. **Trappola:** i quattro esiti sono diversi e vanno distinti, perché tre di essi non sono errori del dato | [DOM](../05_domain/07-terminologie-nel-dominio.md) |
| **`statusHistory`** | S | Traiettoria degli stati di un contatto assistenziale, con i rispettivi periodi | [F06](06-fhir-da-zero.md) |
| **STP - Straniero Temporaneamente Presente** (codice del diritto italiano) | N | Codice di assistenza previsto dall'art. 35 del d.lgs. 286/1998 per lo straniero non in regola con le norme sull'ingresso e il soggiorno; sedici caratteri, attribuito localmente, con validità temporale | [F04](04-identita-e-anagrafiche.md) |
| **STRIDE** | S | Metodo di modellazione delle minacce in sei categorie, ciascuna negazione di una proprietà di sicurezza | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/01-modello-di-minaccia.md) |
| **`StructureDefinition`** | S | Risorsa FHIR che definisce una struttura: risorsa di base, profilo, estensione o tipo di dato | [F06](06-fhir-da-zero.md) |
| **Structured Fields** | S | Grammatica normata per i valori delle intestazioni HTTP (RFC 9651) | [F13](13-protocolli.md) |
| **Struttura erogante** (*delivering organisation*) | N | Soggetto giuridico responsabile dell'erogazione. **Trappola:** **non coincide con il tenant**, che è un confine di isolamento tecnico: un tenant può contenere più strutture eroganti | [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **STUN** (*Session Traversal Utilities for NAT*) | S | Protocollo per scoprire il proprio indirizzo pubblico (RFC 8489) | [F08](08-webrtc-da-zero.md) |
| **`Subscription`** | S | Risorsa FHIR di sottoscrizione a notifiche su eventi; nella versione adottata presenta limiti strutturali noti | [F06](06-fhir-da-zero.md) |
| **Superficie di attacco** (*attack surface*) | S | Insieme dei punti in cui un avversario può interagire con il sistema; si riduce eliminando, restringendo, irrobustendo | [F12](12-crittografia-e-sicurezza.md) |

### T

> **Avvertenza sui nomi delle prestazioni di telemedicina.** Televisita, teleconsulto,
> teleconsulenza, teleassistenza, telemonitoraggio, telerefertazione, telecontrollo e
> teleriabilitazione **sono istituti del diritto italiano**, definiti dall'Accordo Stato-Regioni
> 215/CSR del 2020 e dagli atti successivi. I traducenti inglesi correnti - *video visit*,
> *teleconsultation*, *tele-advice*, *tele-care*, *remote patient monitoring* - **non sono
> equivalenti esatti**: designano pratiche organizzative, non fattispecie giuridiche, e non
> portano con sé né i limiti di erogabilità, né gli obblighi documentali, né il regime di
> rendicontazione che la definizione italiana comporta. Nella documentazione inglese del
> progetto il termine italiano resta nella forma originale, con la spiegazione a seguire; nel
> codice non si usa il traducente al posto del nome della fattispecie.

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Taccuino personale dell'assistito** (*patient's personal notebook*) | N | Sezione del fascicolo sanitario elettronico alimentata dal cittadino. **Trappola:** i suoi contenuti **non sono dati clinici certificati da un professionista**, e trattarli come tali è un errore di modello prima ancora che di sicurezza | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **TEAM - Tessera europea di assicurazione malattia** (*European Health Insurance Card*) | N | Identificatore, riportato sul retro della tessera sanitaria, che attesta il diritto all'assistenza in un altro Stato membro | [F04](04-identita-e-anagrafiche.md) |
| **Teleassistenza** (*tele-care*; **equivalente inglese non esatto**, vedi avvertenza) | N | Atto professionale di pertinenza delle professioni sanitarie **non mediche**, con la persona assistita o con il caregiver, prevalentemente programmato e ripetibile. **Trappola:** in informatica «teleassistenza» significa assistenza tecnica remota all'utente: sono due cose diverse e non vanno mai chiamate con la stessa parola | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Teleconsulenza medico-sanitaria** (*tele-advice*; **equivalente inglese non esatto**) | N | Attività di supporto a distanza fra professionisti sanitari **con responsabilità differenti**, sempre programmata. **Trappola:** **non** è utilizzabile in surroga del soccorso | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Teleconsulto** (*physician-to-physician teleconsultation*; **equivalente inglese non esatto**) | N | Atto fra due o più **medici** sulla situazione clinica di una persona, sincrono o asincrono. **Trappola: non dà luogo a referto autonomo**; produce una relazione collaborativa conferita come allegato al documento dell'evento principale | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Telecontrollo medico** (*medical tele-check*; **equivalente inglese non esatto**) | N | Prestazione medica a contatti cadenzati con videochiamata e condivisione di dati raccolti presso la persona assistita. **È a nomenclatore**, quindi tariffata | [F02](02-prestazioni-di-telemedicina.md) |
| **Telecooperazione sanitaria** (*tele-cooperation*; **equivalente inglese non esatto**) | N | Assistenza a distanza a un operatore impegnato in un atto in corso. **Trappola:** è fuori perimetro nella versione corrente del progetto | [F02](02-prestazioni-di-telemedicina.md) |
| **Telemedicina** (*telemedicine*) | N | Modalità di erogazione di prestazioni sanitarie a distanza. **Trappola:** è un **canale**, non una specialità: non esiste «il medico di telemedicina», esiste il medico di una branca che eroga a distanza | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/01-linguaggio-ubiquo.md) |
| **Telemonitoraggio** (*remote patient monitoring*; **equivalente inglese non esatto**) | N | Rilevamento e trasmissione a distanza di parametri vitali e clinici tramite sensori, dentro un piano e con soglie configurate dal professionista. **Trappola:** la destinazione d'uso congelata dal progetto è la **raccolta differita per la revisione periodica del professionista**; nessuna funzione può spostare il sistema verso il tempo reale clinico, e la valutazione va fatta prima di scrivere la funzione | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **Telerefertazione** (*tele-reporting*; **equivalente inglese non esatto**) | N | Relazione asincrona su un esame già acquisito, con firma digitale validata del medico responsabile. **Trappola:** non è il trasporto del referto da un luogo a un altro | [F02](02-prestazioni-di-telemedicina.md) |
| **Teleriabilitazione** (*telerehabilitation*; **equivalente inglese non esatto**) | N | Erogazione a distanza di interventi riabilitativi, inquadrata nel progetto riabilitativo individuale, con tariffa equivalente alla presenza (Accordo 231/CSR 2021) | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/08-percorsi-e-piani-di-cura.md) |
| **Televisita** (*video visit*; **equivalente inglese non esatto**) | N | Atto **medico** in tempo reale con la persona assistita, che si chiude con un referto. **Trappola:** è limitata alle attività di controllo di pazienti con diagnosi già formulata in presenza, e non è ammessa in urgenza o emergenza; una videochiamata fra medico e paziente non è automaticamente una televisita | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Tempo di ripristino** (*recovery time objective*, RTO) | S | Tempo massimo entro cui il servizio deve tornare disponibile | [F11](11-fondamenti-informatici.md) |
| **Tempo di sistema** (*transaction time*) | S | Istante in cui il sistema è venuto a conoscenza di un fatto | [F11](11-fondamenti-informatici.md) |
| **Tempo di validità** (*valid time*) | S | Istante o intervallo in cui un fatto è vero nel mondo | [F11](11-fondamenti-informatici.md) |
| **Tenant** | P | Confine di isolamento logico dei dati e della configurazione. **Trappola:** **non coincide** con l'organizzazione, né con la struttura erogante, né con l'integratore: quattro concetti che coincidono nei casi semplici e divergono in quelli reali | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](../02_architecture/05-multi-tenancy.md) |
| **Tendenza** (*trend*) | S | Variazione consistente nella stessa direzione su una finestra definita, oltre la variabilità attesa. **Trappola:** richiede tre parametri di configurazione clinica e non è deducibile dal solo dato | [F09](09-fondamenti-clinici.md) |
| **Terminology guard** (*controllo terminologico*) | P | Controllo automatico in integrazione continua che fa fallire la costruzione se rientra nel repository contenuto terminologico vietato, sulla base di una lista di ammissione versionata | [F05](05-standard-di-interoperabilita.md), [F17](17-ambiente-di-sviluppo.md) |
| **Terzo in sessione** (*third party in session*) | P | Soggetto che accede a contenuti sanitari senza essere parte della relazione di cura: interprete, discente, caregiver. **Trappola:** la sua presenza non è un dettaglio organizzativo, è un accesso a dato sanitario e va tracciata come tale | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Tessera sanitaria** (*Italian health insurance card*) | N | Supporto fisico previsto dall'art. 50 del D.L. 269/2003 che espone il codice fiscale. **Trappola: non introduce un identificatore nuovo**, e leggerla con un lettore di codici a barre **non è autenticare** | [F04](04-identita-e-anagrafiche.md) |
| **Tesserino dispositivi** (*device card*; tipologia documentale del diritto italiano) | N | Documento firmato dal professionista che assegna un dispositivo di telemonitoraggio, con identificativo univoco, fabbricante e parametri tecnici (DM 19 novembre 2025, Allegato 1) | [F02](02-prestazioni-di-telemedicina.md), [DOM](../05_domain/04-documenti-clinici.md) |
| **Ticket** (*co-payment*) | N | Quota di compartecipazione alla spesa a carico dell'assistito. **Trappola: non è il prezzo della prestazione**, e in informatica la stessa parola indica una segnalazione di assistenza: va sempre qualificata | [F01](01-sistema-sanitario-italiano.md) |
| **Timeout** | S | Tempo oltre il quale si smette di attendere una risposta | [F11](11-fondamenti-informatici.md) |
| **Titolare del trattamento** (*data controller*) | N | Soggetto che determina finalità e mezzi del trattamento e ne risponde. **Trappola:** per la finalità di cura è chi redige i dati e i documenti, non chi fornisce l'infrastruttura | [F03](03-il-dato-clinico.md), [DOM](../05_domain/06-consenso-e-riservatezza.md) |
| **Token Exchange** | S | Scambio di un token con un altro, valido in un altro dominio (RFC 8693). **Trappola:** nel progetto la delega è **sempre** rappresentata con il claim `act`, mai con l'impersonificazione | [F13](13-protocolli.md), [INT](../07_integration/06-identita-e-delega.md) |
| **Traccia** (*trace*) | S | Rappresentazione del percorso di una singola richiesta attraverso i componenti attraversati | [F11](11-fondamenti-informatici.md), [TEC](../01_technical/06-osservabilita.md) |
| **Tracciabilità** (*traceability*) | S | Catena percorribile **in entrambe le direzioni** fra regola di dominio, requisito, progettazione, codice, prova e misura di controllo del rischio. **Trappola:** non è ricostruibile a posteriori; il suo destinatario finale non è un valutatore, è il paziente | [F11](11-fondamenti-informatici.md), [F15](15-regolatorio-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **Transazione** (*transaction*, IHE) | S | Scambio specifico fra due attori, con formato, protocollo e regole di errore precisi | [F05](05-standard-di-interoperabilita.md) |
| **Transazione / lotto** (*transaction / batch*, FHIR) | S | Insieme atomico che fallisce interamente / insieme elaborato voce per voce | [F06](06-fhir-da-zero.md) |
| **Trasmissione discontinua** (`usedtx`) | S | Sospensione dell'invio audio durante il silenzio. **Trappola:** il progetto la disattiva per ragioni cliniche: il silenzio, in una valutazione a distanza, può essere informazione | [F08](08-webrtc-da-zero.md) |
| **Trasparenza dei certificati** (*certificate transparency*) | S | Registri pubblici e verificabili dei certificati emessi, che rendono rilevabile l'emissione anomala (RFC 6962, RFC 9162) | [F12](12-crittografia-e-sicurezza.md) |
| **Triage** | S | Processo di assegnazione della priorità temporale di valutazione in base al rischio di deterioramento nell'attesa. In Italia è articolato su cinque livelli `[NV]` | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Trickle ICE** | S | Invio dei candidati man mano che si scoprono, invece di attendere la fine della raccolta (RFC 8838) | [F08](08-webrtc-da-zero.md) |
| **Trigger event** (*evento scatenante*) | S | Il fatto del mondo reale che provoca l'invio di un messaggio HL7 v2 | [F05](05-standard-di-interoperabilita.md) |
| **Trial use / STU / Trial Implementation** | S | Stato di maturità di una specifica: pubblicata e utilizzabile, ma **esplicitamente soggetta a modifiche**. **Trappola:** va sempre citata insieme allo stato, e le versioni vanno fissate | [F05](05-standard-di-interoperabilita.md) |
| **Trust anchor** (*ancora di fiducia*) | S | Emittente riconosciuto come fidato per un tenant, con identificativo, chiavi e algoritmi ammessi | [F13](13-protocolli.md) |
| **TS-CNS** | N | Tessera sanitaria dotata del microchip di carta nazionale dei servizi; identità ai sensi dell'art. 64 del Codice dell'amministrazione digitale, realizzata con mutua autenticazione TLS. **Trappola:** è l'unico canale privo di dipendenze esterne e senza costo per accesso, e per questo è obbligatorio nel progetto, non facoltativo | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **TURN** (*Traversal Using Relays around NAT*) | S | Protocollo per farsi prestare un indirizzo da un server che inoltra i pacchetti (RFC 8656) | [F08](08-webrtc-da-zero.md) |

### U

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **UCA - Unità di continuità assistenziale** (*continuity of care unit*; istituto italiano del DM 77/2022) | N | Équipe mobile per situazioni di elevata complessità clinico-assistenziale | [F01](01-sistema-sanitario-italiano.md) |
| **UCUM** (*Unified Code for Units of Measure*) | S | Codifica standard delle unità di misura; è la forma in cui l'unità entra nel modello dati. **Trappola:** ridistribuibile verbatim, ma i derivati sono vietati e la licenza è revocabile | [F05](05-standard-di-interoperabilita.md), [F09](09-fondamenti-clinici.md) |
| **UDI / UDI-DI / UDI-PI** (*unique device identification*) | N | Sistema di identificazione unica del dispositivo. **Trappola:** per il software la parte di produzione corrisponde alla **versione** | [F02](02-prestazioni-di-telemedicina.md), [F15](15-regolatorio-da-zero.md) |
| **UDP** (*User Datagram Protocol*) | S | Protocollo di trasporto minimo: nessuna connessione, nessuna conferma, nessun ordine. **Trappola:** è precisamente ciò che serve al tempo reale, e sembra un difetto solo a chi arriva dalle applicazioni transazionali | [F08](08-webrtc-da-zero.md) |
| **Unità di misura codificata** (*coded unit*) | S | Codice dell'unità, **mai stringa libera**; obbligatorio per ogni valore numerico | [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **URI canonico** (*canonical URI*) | S | Identificatore globale e stabile di un artefatto o di un sistema di codifica. **Trappola: non è un indirizzo da visitare**, e può restare invariato anche quando il sito che lo ospitava cambia | [F05](05-standard-di-interoperabilita.md) |
| **Uso anomalo** (*abnormal use*) | N | Violazione intenzionale e ingiustificabile dell'uso previsto (IEC 62366-1). **Trappola:** è fuori dal perimetro della norma sull'usabilità ma **dentro** quello della gestione del rischio | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |

### V

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **Validatore** (*validator*, HTTP) | S | `ETag` o `Last-Modified`: consentono al server di rispondere che nulla è cambiato senza ritrasmettere il contenuto | [F13](13-protocolli.md) |
| **Validazione clinica** (*clinical validation of a document*) | N | Atto con cui il professionista dichiara definitivo il contenuto e se ne assume la responsabilità. **Trappola:** è **distinta dalla firma**, che è l'atto giuridico, e distintissima dalla validazione formale di una risorsa | [F03](03-il-dato-clinico.md) |
| **Validazione formativa / sommativa** (*formative / summative evaluation*) | N | Valutazioni di usabilità rispettivamente durante lo sviluppo e prima del rilascio, la seconda con utenti rappresentativi secondo protocollo. **Trappola:** gli utenti rappresentativi comprendono persone anziane e persone con disabilità; non sono un caso limite, sono la popolazione di riferimento | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/06-usabilita-e-accessibilita.md) |
| **Valore aggregato** (*aggregated value*) | P | Entità distinta dalla misura, con funzione, finestra, numero di misure incluse **e numero di attese non soddisfatte**. **Trappola:** una media che non dichiara quante misure mancano è un numero senza significato clinico | [DOM](../05_domain/05-parametri-e-osservazioni.md) |
| **Valore critico** (*critical value*) | S | Risultato che indica una condizione potenzialmente pericolosa per la vita e richiede comunicazione immediata e verificata. **Trappola:** è **definito dalla sorgente**, non dedotto dal sistema | [F09](09-fondamenti-clinici.md) |
| **Valore predittivo positivo** (*positive predictive value*) | S | Probabilità che la condizione sia presente dato un risultato positivo, o che l'evento sia realmente in corso dato un allarme. **Trappola: dipende dalla prevalenza**, non dalla sola sensibilità: è la ragione per cui una regola sensibile applicata a una popolazione a basso rischio produce in maggioranza falsi allarmi | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Valore predittivo negativo** (*negative predictive value*) | S | Probabilità che la condizione sia assente dato un risultato negativo; dipende dalla prevalenza | [F09](09-fondamenti-clinici.md) |
| **`ValueSet` / `CodeSystem`** | S | Selezione di codici per un uso specifico / definizione dei codici e del loro significato | [F06](06-fhir-da-zero.md) |
| **Valutazione clinica** (*clinical evaluation*) | N | Processo che dimostra prestazioni e benefici su dati clinici (Reg. (UE) 2017/745, art. 61 e Allegato XIV). **Trappola:** la Classe IIa non richiede un'indagine clinica ma richiede un percorso documentale autonomo con tempi propri, da avviare in parallelo allo sviluppo e non a valle | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/07-valutazione-clinica.md) |
| **Valutazione della conformità** (*conformity assessment*) | N | Procedimento con cui si dimostra il rispetto dei requisiti applicabili; per la Classe IIa, Allegato IX capi I e III più sezione 4, oppure Allegato XI | [F15](15-regolatorio-da-zero.md) |
| **Valutazione di eseguibilità** (*feasibility assessment*) | P | Atto con **tre esiti indipendenti**: utilità clinica, sicurezza clinica, compliance digitale. **Trappola:** i tre esiti non si sommano in un giudizio unico, e un solo esito negativo può bastare a escludere il canale a distanza | [DOM](../05_domain/02-le-prestazioni-modellate.md) |
| **Variabilità circadiana** (*circadian variability*) | S | Oscillazione di periodo approssimativamente giornaliero di molte grandezze fisiologiche. **Trappola:** è **struttura, non rumore**: eliminarla con un filtro elimina informazione clinica | [F09](09-fondamenti-clinici.md) |
| **`Vary`** | S | Intestazione che dichiara quali intestazioni della richiesta hanno determinato la risposta; indispensabile alle cache | [F13](13-protocolli.md) |
| **Verbale di pronto soccorso** (*emergency department record*) | N | Documento che attesta l'accesso al pronto soccorso, il triage, gli accertamenti, la diagnosi e l'esito | [F03](03-il-dato-clinico.md) |
| **Verifica della revoca** (*revocation checking*) | S | Controllo che un certificato non sia stato revocato, con liste scaricate periodicamente oppure interrogazione in linea. **Trappola:** in caso di indisponibilità del servizio il progetto adotta il **fallimento chiuso**, cioè nega l'accesso | [F04](04-identita-e-anagrafiche.md) |
| **Versionamento** (*versioning*) | S | Successione identificata e recuperabile degli stati di un'entità o di un contratto. **Trappola:** il versionamento delle entità **non rende immutabile** ciò che versiona; per l'immutabilità serve una catena di impronte conservata separatamente | [F11](11-fondamenti-informatici.md) |
| **Versione del documento** (*document version*) | P | Elemento della catena immutabile di un documento clinico, con riferimento alla versione precedente e motivazione | [DOM](../05_domain/04-documenti-clinici.md) |
| **Versione flottante** (*floating version*) | S | Dipendenza dichiarata senza numero di versione. **Trappola:** rende la costruzione non riproducibile, e in un contesto regolato significa che non si sa che cosa è stato verificato | [F06](06-fhir-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **`versionId`** | S | Numero di versione della risorsa sul server FHIR; base del controllo di concorrenza ottimistico | [F06](06-fhir-da-zero.md) |
| **Veste professionale** (*professional capacity*) | P | Relazione fra persona, organizzazione e branca, con validità temporale. **Trappola:** i permessi seguono la veste, **non la persona**: la stessa persona ha permessi diversi in vesti diverse, e una veste scaduta non autorizza più nulla | [F16](16-architettura-del-progetto.md), [DOM](../05_domain/03-assistito-professionista-organizzazione.md) |
| **VEX** (*vulnerability exploitability exchange*) | S | Documento che dichiara se una vulnerabilità nota di una dipendenza sia effettivamente sfruttabile nel prodotto | [F12](12-crittografia-e-sicurezza.md), [SEC](../06_security/07-catena-di-fornitura.md) |
| **Vettore di inizializzazione** (*initialisation vector*) | S | Valore variabile e pubblico che rende diverse due cifrature dello stesso testo con la stessa chiave | [F12](12-crittografia-e-sicurezza.md) |
| **Vigilanza** (*vigilance*) | N | Segnalazione di incidenti gravi e azioni correttive di sicurezza sul campo (Reg. (UE) 2017/745, artt. 87–92), con termini differenziati per gravità | [F15](15-regolatorio-da-zero.md), [CMP](../08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Violazione dei dati personali** (*personal data breach*) | N | Distruzione, perdita, modifica, divulgazione o accesso non autorizzati. **Trappola:** **non è solo la fuga di dati**: la perdita di disponibilità è una violazione a tutti gli effetti | [F03](03-il-dato-clinico.md), [SEC](../06_security/10-risposta-agli-incidenti.md) |
| **Voucher** (nella piattaforma nazionale dei dati) | N | Token di autorizzazione rilasciato al soggetto fruitore, presentato all'erogatore per dimostrare l'autorizzazione | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **VP8 / VP9 / H.264 / AV1** | S | Codec video. **Trappola:** solo alcuni sono obbligatori per l'interoperabilità (RFC 7742), e assumere la disponibilità degli altri produce sessioni che non si stabiliscono su alcuni dispositivi | [F08](08-webrtc-da-zero.md) |
| **`VR`** | S | Codice della classe di contatto FHIR che denota la modalità non compresente | [F06](06-fhir-da-zero.md) |

### W–Z

| Termine | Nat. | Definizione | Dove |
|---|---|---|---|
| **WebRTC** (*Web Real-Time Communication*) | S | Insieme di specifiche W3C e IETF che consentono a un browser di stabilire una sessione audio, video e dati in tempo reale con un altro estremo | [F08](08-webrtc-da-zero.md) |
| **Webhook** | S | Notifica HTTP inviata dal produttore a un indirizzo fornito dal consumatore | [F13](13-protocolli.md), [PRO](../04_protocols/07-eventi-e-webhook.md) |
| **XML Signature Wrapping** | S | Attacco in cui la firma resta valida ma copre un frammento diverso da quello effettivamente elaborato. **Trappola:** è la famiglia di attacchi che la suite di conformità dell'identità pubblica italiana verifica in modo specifico, e va superata per intero | [F13](13-protocolli.md), [F04](04-identita-e-anagrafiche.md) |

---

## 3. Falsi sinonimi

Sono coppie - o terne, o quaterne - di termini che il linguaggio corrente scambia e che il
modello non può scambiare. Non è pedanteria: ciascuna di queste distinzioni corrisponde a un
confine di aggregato, a un vincolo di autorizzazione, a una regola di rendicontazione o a un
requisito di sicurezza. Per ognuna sono indicati **perché i due termini vengono confusi** e
**che cosa si rompe** quando la confusione entra nel codice.

Le prime quattordici sono già individuate dall'area dominio, nel
[capitolo sul linguaggio ubiquo](../05_domain/01-linguaggio-ubiquo.md) § 5, e qui sono riprese in
forma sintetica con il rinvio. Le successive emergono dagli altri moduli di questa guida.

### 3.1 Le quattordici coppie dell'area dominio

**1. Assistito e paziente.**
*Perché si confondono:* nel parlato quotidiano designano la stessa persona, e in molte frasi sono
interscambiabili senza che nessuno se ne accorga.
*Che cosa si rompe:* le regole di accesso ai dati amministrativi - esenzioni, recapiti, scelta del
medico - e quelle di accesso ai dati clinici hanno domini diversi. Un operatore di sportello
lavora sull'assistito e non deve poter lavorare sul paziente. Con una sola entità e un solo
insieme di permessi, la separazione va ricostruita a mano su ogni campo, e prima o poi un campo
viene dimenticato.

**2. Prestazione richiesta, prestazione eseguita, prestazione addebitata.**
*Perché si confondono:* l'italiano le chiama tutte «prestazione».
*Che cosa si rompe:* sono tre entità con cicli di vita, autori e stati distinti. La richiesta nasce
dal prescrittore e può non essere mai eseguita; l'esecuzione nasce dall'erogante e può avvenire
senza richiesta; l'addebito nasce dall'amministrazione e può non seguire l'esecuzione, per esempio
nel teleconsulto, che non è tariffato. Un'unica entità «prestazione» rende impossibile
rappresentare tutti e tre i casi legittimi.

**3. Erogata, refertata, consegnata, rendicontata.**
*Perché si confondono:* sembrano fasi automatiche della stessa cosa.
*Che cosa si rompe:* nessuna implica la successiva. Erogata e non refertata è un inadempimento
visibile; refertata e non consegnata può essere una scelta clinica legittima; consegnata e non
rendicontata è un problema amministrativo, non clinico. Un unico campo `stato` con un valore
«completata» significa quattro cose diverse a seconda di chi lo legge.

**4. Autenticazione e identificazione.**
*Perché si confondono:* entrambe rispondono, in apparenza, alla domanda «chi è questa persona».
*Che cosa si rompe:* l'autenticazione accerta il possesso di una credenziale ed è un controllo del
sistema; l'identificazione accerta che la persona davanti alla telecamera sia quella attesa ed è
**un atto del professionista**. Un sistema che tratta la prima come la seconda ha un difetto che
si manifesta il giorno in cui un familiare si collega con le credenziali del paziente e la
sessione risulta regolarmente identificata.

**5. Consenso all'atto sanitario e consenso al trattamento dei dati.**
*Perché si confondono:* si raccolgono spesso nello stesso momento e con lo stesso gesto.
*Che cosa si rompe:* hanno natura giuridica, effetti e revocabilità diversi. Fonderli rende la
revoca ingovernabile, perché la revoca del consenso all'atto interrompe la cura, mentre la revoca
di un consenso a un trattamento accessorio non deve farlo.

**6. Caregiver e rappresentante legale.**
*Perché si confondono:* entrambi «si occupano» della persona e spesso sono presenti insieme.
*Che cosa si rompe:* **assistere non è rappresentare.** Il caregiver non può prestare consenso al
posto di una persona capace, in nessuna configurazione. Errore aggiuntivo e più sottile: trattare
l'amministratore di sostegno come un tutore, quando i suoi poteri sono delimitati dal decreto di
nomina e possono non comprendere le decisioni sanitarie.

**7. Bozza e referto.**
*Perché si confondono:* il linguaggio corrente dice «il referto è in bozza».
*Che cosa si rompe:* il modello che segue il linguaggio crea un referto con stato «bozza», e da
quell'elenco prima o poi qualcuno estrae dei documenti senza filtrare lo stato. Una bozza non è
visibile alla persona assistita, non è trasmissibile, non è conservata come documento sanitario.

**8. Oscuramento e cancellazione.**
*Perché si confondono:* entrambi «fanno sparire» qualcosa dalla vista.
*Che cosa si rompe:* l'oscuramento rende un documento invisibile a determinati soggetti, non lo
cancella e non lo sottrae a chi lo ha prodotto. La cancellazione è un'altra cosa e nel settore
sanitario incontra i limiti degli obblighi di conservazione. Implementare l'oscuramento come
cancellazione distrugge documentazione sanitaria; implementare la cancellazione come oscuramento
non soddisfa il diritto azionato.

**9. Fascicolo, dossier, cartella.**
*Perché si confondono:* sono tutti e tre «dove stanno i dati del paziente».
*Che cosa si rompe:* sono tre contenitori a tre scale, con tre regimi di accesso. Il fascicolo
sanitario elettronico è nazionale-regionale e sotto il controllo dell'assistito; il dossier
sanitario è l'insieme dei dati presso una singola struttura; la cartella clinica elettronica è il
repository del singolo erogante e, nel modello di integrazione del progetto, resta al sistema
dell'integratore. Confonderli produce trasmissioni verso il posto sbagliato.

**10. Slot e appuntamento.**
*Perché si confondono:* nell'interfaccia occupano la stessa casella.
*Che cosa si rompe:* uno slot occupato è la **proiezione** dell'appuntamento sull'agenda, non
l'appuntamento. Fonderli rende impossibile rappresentare l'overbooking controllato e produce, sotto
concorrenza, la doppia prenotazione.

**11. Soglia tecnica e soglia clinica.**
*Perché si confondono:* si chiamano entrambe «soglia» e finiscono nello stesso pannello di
configurazione.
*Che cosa si rompe:* la soglia tecnica riguarda il canale ed è specifica di prodotto configurabile
per tenant; la soglia clinica riguarda un parametro della persona ed è configurazione **per
assistito**, decisa dal professionista. Chiamarle entrambe «soglia» in un unico modulo è l'errore
che porta a esporre a un amministratore di tenant un campo che è una decisione clinica individuale.

**12. Allarme tecnico e allarme clinico.**
*Perché si confondono:* sono entrambi notifiche che arrivano dallo stesso sistema.
*Che cosa si rompe:* hanno destinatari diversi per norma - il tecnico al centro servizi, il clinico
al centro erogatore. Una coda unica produce due effetti, entrambi gravi: il tecnico che riceve un
allarme clinico e il clinico assuefatto agli allarmi tecnici.

**13. Aderenza e trasmissione.**
*Perché si confondono:* quando il dato non arriva, la spiegazione più immediata è che la persona
non abbia misurato.
*Che cosa si rompe:* un dato non arrivato può indicare un paziente non aderente, un dispositivo
guasto, una catena di ingestione interrotta **oppure un peggioramento clinico che impedisce la
misura**. Trattare l'assenza di dato come non aderenza fa perdere l'unico caso in cui l'assenza è
un'emergenza.

**14. Tenant, organizzazione, struttura erogante, integratore.**
*Perché si confondono:* nei casi semplici coincidono, e le prime installazioni sono sempre casi
semplici.
*Che cosa si rompe:* il tenant è un confine di isolamento; l'organizzazione è un soggetto giuridico;
la struttura erogante è chi risponde dell'erogazione; l'integratore è un principale applicativo, non
un utente. Un tenant può contenere più strutture eroganti e un integratore può operare su più
tenant: il modello che li fonde non rappresenta nessuna delle due situazioni.

### 3.2 Le coppie che emergono dagli altri moduli

**15. Segno e sintomo.**
*Perché si confondono:* entrambi sono «cose che il paziente ha».
*Che cosa si rompe:* il segno è rilevato dall'osservatore e ha come fonte il professionista; il
sintomo è riferito dalla persona e non è osservabile direttamente. La fonte è un attributo del dato
e cambia il peso clinico di ciò che è registrato. In telemedicina la distinzione pesa il doppio,
perché a distanza la quota di sintomi cresce e quella di segni si riduce.
Vedi [F09](09-fondamenti-clinici.md).

**16. Sensibilità, specificità e valore predittivo.**
*Perché si confondono:* sembrano tutti «quanto è affidabile il test».
*Che cosa si rompe:* sensibilità e specificità sono proprietà del test, indipendenti dalla
popolazione; il valore predittivo dipende dalla **prevalenza**. Una regola di allarme molto
sensibile applicata a una popolazione a basso rischio produce in maggioranza falsi positivi, e
questo non è un difetto della regola: è aritmetica. Chi progetta gli allarmi ignorandolo costruisce
sistematicamente affaticamento da allarme.
Vedi [F09](09-fondamenti-clinici.md) e [F10](10-percorsi-di-cura-e-sicurezza.md).

**17. Autorizzazione sanitaria, accreditamento istituzionale e contratto.**
*Perché si confondono:* nel parlato una struttura è genericamente «convenzionata».
*Che cosa si rompe:* sono tre titoli successivi e distinti. L'autorizzazione abilita all'esercizio,
l'accreditamento abilita a erogare per conto del servizio sanitario, il contratto stabilisce quanto
e a quali condizioni. Una struttura può avere i primi due e non il terzo: le sue prestazioni non
sono a carico pubblico. Un modello che ha un solo attributo booleano sbaglia la fatturazione.
Vedi [F01](01-sistema-sanitario-italiano.md).

**18. Cifratura in transito e cifratura da estremo a estremo.**
*Perché si confondono:* entrambe si descrivono con la parola «cifrato», e il lucchetto
dell'interfaccia è lo stesso.
*Che cosa si rompe:* la cifratura in transito si interrompe a ogni punto di terminazione; una catena
di tratte cifrate non è una cifratura da estremo a estremo. Dichiarare la seconda quando si ha la
prima è, oltre che tecnicamente falso, un claim che va corretto nella comunicazione pubblica: nel
progetto l'affermazione è ammessa solo condizionata alla verifica indipendente delle chiavi, e
**decade quando la registrazione lato server è attiva**.
Vedi [F12](12-crittografia-e-sicurezza.md) e [F08](08-webrtc-da-zero.md).

**19. Registro degli accessi, registro di diagnostica e versionamento delle entità.**
*Perché si confondono:* in italiano si chiamano tutti «log» o tutti «audit».
*Che cosa si rompe:* il versionamento delle entità **versiona, non rende immutabile**: chi ha
accesso in scrittura alla base dati può alterare anche le tabelle di storico. Il registro di
diagnostica è un artefatto operativo che si ruota e si cancella. Il registro degli accessi richiede
catena di impronte e conservazione separata dal sistema che genera gli eventi. Soddisfare il
requisito di auditabilità immutabile con un versionamento è il difetto più costoso da scoprire
tardi, perché lo si scopre quando qualcuno contesta un accesso.
Vedi [F12](12-crittografia-e-sicurezza.md) e [F16](16-architettura-del-progetto.md).

**20. Conservazione a norma e backup.**
*Perché si confondono:* entrambi «tengono i dati al sicuro nel tempo».
*Che cosa si rompe:* il backup protegge dalla perdita; la conservazione a norma garantisce nel
tempo autenticità, integrità, leggibilità e reperibilità del documento informatico, ed è un processo
con proprie regole e propri soggetti. Nessuna politica di backup, per quanto rigorosa, la soddisfa.
Vedi [F03](03-il-dato-clinico.md).

**21. Anonimizzazione e pseudonimizzazione.**
*Perché si confondono:* in entrambi i casi il nome non compare.
*Che cosa si rompe:* l'anonimizzazione fa uscire il dato dal perimetro della disciplina sulla
protezione dei dati; la pseudonimizzazione no, e il dato resta personale. Dichiarare anonimizzato un
dato pseudonimizzato significa applicargli un regime che non gli spetta - trasferimenti,
conservazione, comunicazione a terzi - e ciascuna di quelle applicazioni è una violazione.
Vedi [F03](03-il-dato-clinico.md).

**22. Diagnosi e sospetto diagnostico.**
*Perché si confondono:* nel testo libero di una relazione appaiono nella stessa frase.
*Che cosa si rompe:* sono due entità con autore, data, grado di certezza e ciclo di vita propri.
Rappresentarle nello stesso campo produce diagnosi che nessuno ha mai formulato, che poi viaggiano
verso il fascicolo, verso il sistema dell'integratore e verso le statistiche.
Vedi [F09](09-fondamenti-clinici.md).

**23. Contatto e sessione media.**
*Perché si confondono:* nell'esperienza dell'utente sono la stessa cosa: si entra in una stanza e
inizia la visita.
*Che cosa si rompe:* il contatto è l'atto clinico e amministrativo; la sessione media è
un'istanza di collegamento. Un contatto può avere più sessioni media, e una sessione media caduta
**non chiude il contatto**. Un modello che le fonde chiude atti sanitari quando cade la rete, con
conseguenze su referto, rendicontazione e tempi di attesa.
Vedi [F14](14-flussi-funzionali.md).

**24. Mancata presentazione e fallimento tecnico.**
*Perché si confondono:* dal punto di vista del sistema, in entrambi i casi la persona non compare.
*Che cosa si rompe:* la mancata presentazione presuppone che **nessun tentativo di connessione** sia
avvenuto entro la finestra; il fallimento tecnico è un tentativo andato male. Confonderli produce
statistiche che addebitano alla persona i difetti dell'infrastruttura, e in alcuni contesti produce
addebiti economici indebiti.
Vedi [F14](14-flussi-funzionali.md) e [DOM](../05_domain/02-le-prestazioni-modellate.md).

**25. Identificatore e attributo.**
*Perché si confondono:* entrambi sono «campi che descrivono la persona».
*Che cosa si rompe:* l'identificatore individua dentro un dominio dichiarato; l'attributo descrive
senza individuare. Trattare un attributo come chiave - la data di nascita, il recapito, il nome -
produce collisioni silenziose; trattare un identificatore senza il suo dominio produce
corrispondenze fra persone diverse.
Vedi [F04](04-identita-e-anagrafiche.md).

**26. `id` e `identifier`.**
*Perché si confondono:* i nomi si somigliano e in molte risorse compaiono a due righe di distanza.
*Che cosa si rompe:* l'`id` identifica la risorsa **su quel server** e non ha né significato clinico
né portabilità; l'`identifier` identifica l'entità nel mondo reale, con il proprio spazio dei nomi.
Usare il primo come chiave di correlazione fra sistemi produce un'integrazione che funziona finché
non si cambia server, e poi non funziona più in modo irreparabile.
Vedi [F06](06-fhir-da-zero.md).

**27. Conforme e marcato CE.**
*Perché si confondono:* nel parlato commerciale «a norma» copre entrambi.
*Che cosa si rompe:* la conformità a una norma tecnica è una proprietà verificabile del prodotto; la
marcatura CE è un atto formale del fabbricante, che per le classi superiori presuppone
l'intervento di un Organismo Notificato. **Oggi il prodotto non reca marcatura CE**, e ogni
formulazione che lascia intendere il contrario - anche una formulazione al futuro con una data -
produce un effetto regolatorio che l'intenzione di certificare non produce.
Vedi [F15](15-regolatorio-da-zero.md).

**28. Errore d'uso e uso anomalo.**
*Perché si confondono:* in entrambi i casi «l'utente ha fatto qualcosa che non doveva».
*Che cosa si rompe:* l'errore d'uso non implica colpa dell'utente ed è un difetto di progettazione
dell'interfaccia, da correggere nel prodotto; l'uso anomalo è una violazione intenzionale e
ingiustificabile, fuori dal perimetro della norma sull'usabilità ma dentro quello della gestione
del rischio. Classificare un errore d'uso come uso anomalo è il modo più efficace per non
correggere mai l'interfaccia.
Vedi [F10](10-percorsi-di-cura-e-sicurezza.md) e [F15](15-regolatorio-da-zero.md).

**29. Specifica e profilo.**
*Perché si confondono:* entrambi sono «il documento dello standard».
*Che cosa si rompe:* la specifica di base è volutamente permissiva per valere in ogni contesto; il
profilo la restringe per un contesto d'uso e può **solo restringere**. Implementare la specifica di
base credendo di essere conformi al profilo produce istanze che passano la validazione strutturale
e falliscono quella di profilo, tipicamente in produzione e presso il primo integratore serio.
Vedi [F05](05-standard-di-interoperabilita.md).

**30. Standard e standard di fatto.**
*Perché si confondono:* la diffusione somiglia all'autorevolezza.
*Che cosa si rompe:* diffuso non significa normato. Citare uno standard di fatto come standard in
un documento regolatorio è un'inesattezza che un valutatore rileva, e costruire su una bozza scaduta
senza dichiararlo produce dipendenze che si muovono sotto i piedi.
Vedi [F13](13-protocolli.md).

**31. Ripiego di canale e ripiego in presenza.**
*Perché si confondono:* sono entrambi «quello che si fa quando la videochiamata non funziona».
*Che cosa si rompe:* il ripiego di canale è il passaggio a un canale degradato durante l'atto, che va
registrato e riportato nel documento perché può incidere sulla natura dell'atto; il ripiego in
presenza è l'obbligo di completare o riprogrammare la prestazione di persona, senza oneri
aggiuntivi. Il primo è una decisione tecnica con effetti clinici, il secondo è un obbligo
normativo verso la persona assistita.
Vedi [F02](02-prestazioni-di-telemedicina.md) e [F14](14-flussi-funzionali.md).

**32. Esattamente una volta e almeno una volta più idempotenza.**
*Perché si confondono:* il risultato osservabile, quando tutto funziona, è identico.
*Che cosa si rompe:* la consegna esattamente una volta non è ottenibile da estremo a estremo;
prometterla significa non implementare l'idempotenza del ricevente. Il giorno in cui la rete cade
fra la scrittura e la conferma, l'atto sanitario risulta registrato due volte.
Vedi [F11](11-fondamenti-informatici.md) e [F13](13-protocolli.md).

---

## 4. Termini da non usare

Non sono errori di ortografia né questioni di stile. Sono termini che, usati nel modello, nel
codice, nell'interfaccia o nella documentazione, introducono un significato sbagliato o un impegno
che il prodotto non può mantenere. Le prime undici voci sono quelle già stabilite dall'area
dominio; le successive discendono dalle avvertenze pubbliche e dalle decisioni sulla comunicazione.

| Da non usare | Perché | Che cosa si usa al suo posto |
|---|---|---|
| «Sessione» non qualificata | Ambigua fra atto clinico, connessione media e sessione di accesso applicativo | *contatto*, *sessione media*, *sessione applicativa* |
| «Contact» nel codice | Collide con l'elemento dei recapiti dello standard, che ha lo stesso nome e un significato diverso | `Encounter` |
| «Monitoraggio in tempo reale» | Sposta la classificazione regolatoria dalla Classe IIa alla IIb e la classe di sicurezza software da B a C | *raccolta differita di parametri per la revisione periodica del professionista* |
| «Audit immutabile» riferito al versionamento delle entità | Il versionamento non rende immutabile: chi scrive nella base dati può alterare anche lo storico | *registro degli accessi a catena di impronte*, con conservazione separata |
| «Referto di teleconsulto» | Il teleconsulto non dà luogo a referto autonomo | *relazione collaborativa* |
| «Consenso alla piattaforma» | Non esiste: i consensi sono oggetti distinti con natura, effetti e revocabilità diversi | il tipo di consenso specifico, nominato per esteso |
| «Soglia di legge» riferita a parametri tecnici | Nessuna soglia tecnica è imposta dalla normativa italiana | *specifica di prodotto configurabile* |
| «Qualità clinica» come claim | Non ha definizione verificabile | enunciati tecnici verificabili su risoluzione, continuità, esito |
| «Diagnosi automatica», «suggerimento clinico» | Fuori perimetro: sposterebbe il sistema dal registrare decisioni al produrle | *registrazione della decisione del professionista* |
| «Il paziente autenticato è identificato» | Autenticazione e identificazione sono atti distinti, con responsabili diversi | *identificazione registrata dal professionista*, con metodo ed esito |
| Nomi di aziende, prodotti, marchi o domini di potenziali partner | Regola di riservatezza del progetto, prevalente su ogni altra | *l'integratore*, *un gestionale sanitario cloud*, *un sistema EHR di terze parti* |
| «Sarà marcato CE entro *data*» | L'intenzione di certificare e la promessa di un esito datato sono due cose diverse, e la seconda produce un effetto regolatorio che la prima non produce | *il ruolo di fabbricante va costituito e formalizzato*; *oggi il prodotto non reca marcatura CE* |
| «Chi certifica», riferito a un terzo indefinito | Il ruolo di fabbricante sarà assunto dal progetto: attribuire il percorso a un terzo indefinito non è più corretto | *il progetto nel ruolo di fabbricante, ruolo ancora da costituire* |
| «Il calendario di un soggetto terzo», «traguardi di terzi» | La roadmap e le date sono pianificazione interna del progetto | *pianificazione interna del progetto*, dichiarata come tale |
| «Peer-to-peer» come qualità permanente della sessione | Il percorso diretto non è sempre possibile, e la promessa non è mantenibile su tutte le reti | *cifrato da estremo a estremo, instradato direttamente quando la rete lo consente* |
| «Rotazione delle chiavi per sessione» | Formulazione ambigua: suggerisce un meccanismo di rotazione che non è quello adottato | *materiale crittografico generato ex novo per ogni sessione, senza riuso* |
| «Latenza inferiore a *N* millisecondi» come promessa | La latenza dipende da reti che il progetto non controlla | *metrica misurata, registrata e notificata*, con le soglie di prodotto dichiarate |
| «Accreditato SPID», «accreditato presso l'autorità» | Un progetto open source non può essere accreditato: il fornitore di servizi è chi eroga in rete, cioè chi installa | *conforme e verificabile in integrazione continua*, con la suite di conformità superata per intero |
| Sigle di conformità crittografica di ordinamenti extra-UE come garanzia | Non sono il riferimento applicabile e suggeriscono una qualificazione che il prodotto non ha | i riferimenti europei e nazionali applicabili, citati per esteso |
| Qualunque codice o descrizione di terminologie sotto licenza restrittiva, **SNOMED CT in particolare** | Il vincolo di licenza si perfeziona con l'accesso al contenuto ed è incompatibile con un repository pubblico | l'URI del sistema di codifica e il codice ricevuto dall'esterno, risolti a runtime dal gateway terminologico |
| «Paziente non compliante» come giudizio | L'aderenza non è obbedienza, e la sua assenza è un dato clinico da interpretare, non una colpa da registrare | *aderenza*, misurata come rapporto fra attese soddisfatte e attese generate, con le esclusioni dichiarate |
| «Il sistema ha rilevato un peggioramento» | Il sistema non deduce allerte cliniche: applica soglie configurate dal professionista | *il valore ha superato la soglia configurata*, con il riferimento a chi l'ha configurata |

---

## 5. Sigle e abbreviazioni

Ogni sigla è sciolta in italiano e in inglese. Le sigle degli atti normativi italiani restano
nella forma originale anche nella documentazione inglese, con la spiegazione a seguire: tradurre
la denominazione di un decreto lo rende irreperibile.

### 5.1 Sanità italiana e organizzazione

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| ACN | Accordo collettivo nazionale (medicina convenzionata) | National collective agreement for contracted physicians | [F01](01-sistema-sanitario-italiano.md) |
| ADI | Assistenza domiciliare integrata | Integrated home care | [F01](01-sistema-sanitario-italiano.md) |
| AGENAS | Agenzia nazionale per i servizi sanitari regionali | National Agency for Regional Healthcare Services | [F01](01-sistema-sanitario-italiano.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| AO / AOU | Azienda ospedaliera / ospedaliero-universitaria | Hospital trust / university hospital trust | [F01](01-sistema-sanitario-italiano.md) |
| ASL | Azienda sanitaria locale | Local health authority | [F01](01-sistema-sanitario-italiano.md) |
| CdC | Casa della comunità | Community health centre | [F01](01-sistema-sanitario-italiano.md) |
| CIPESS | Comitato interministeriale per la programmazione economica e lo sviluppo sostenibile | Interministerial committee for economic planning and sustainable development | [F01](01-sistema-sanitario-italiano.md) |
| COT | Centrale operativa territoriale | Territorial operations centre | [F01](01-sistema-sanitario-italiano.md) |
| CUP | Centro unico di prenotazione | Central booking service | [F01](01-sistema-sanitario-italiano.md) |
| DEMA | Ricetta dematerializzata (flusso) | Dematerialised prescription flow | [F01](01-sistema-sanitario-italiano.md) |
| IFoC | Infermiere di famiglia o di comunità | Family and community nurse | [F01](01-sistema-sanitario-italiano.md) |
| IRCCS | Istituto di ricovero e cura a carattere scientifico | Scientific institute for research, hospitalisation and healthcare | [F01](01-sistema-sanitario-italiano.md) |
| LEA | Livelli essenziali di assistenza | Essential levels of care | [F01](01-sistema-sanitario-italiano.md) |
| MMG | Medico di medicina generale | General practitioner | [F01](01-sistema-sanitario-italiano.md) |
| NRE | Numero di ricetta elettronica | Electronic prescription number | [F01](01-sistema-sanitario-italiano.md) |
| NSG | Nuovo sistema di garanzia | New guarantee system (LEA monitoring) | [F01](01-sistema-sanitario-italiano.md) |
| OdC | Ospedale di comunità | Community hospital | [F01](01-sistema-sanitario-italiano.md) |
| PLS | Pediatra di libera scelta | Family paediatrician | [F01](01-sistema-sanitario-italiano.md) |
| PNRR | Piano nazionale di ripresa e resilienza | National recovery and resilience plan | [F01](01-sistema-sanitario-italiano.md) |
| RdA / RdE | Regione di assistenza / Regione di erogazione | Region of entitlement / region of delivery | [F01](01-sistema-sanitario-italiano.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| SSN | Servizio sanitario nazionale | Italian National Health Service | [F01](01-sistema-sanitario-italiano.md) |
| UCA | Unità di continuità assistenziale | Continuity of care unit | [F01](01-sistema-sanitario-italiano.md) |

### 5.2 Telemedicina, percorsi e piani

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| GST | Gestore Soluzioni di Telemedicina | Telemedicine solutions manager | [F02](02-prestazioni-di-telemedicina.md) |
| INT | Infrastruttura nazionale di telemedicina | National telemedicine infrastructure | [F02](02-prestazioni-di-telemedicina.md) |
| IRT | Infrastruttura regionale di telemedicina | Regional telemedicine infrastructure | [F02](02-prestazioni-di-telemedicina.md) |
| NIT | Nodo di interoperabilità della telemedicina | Telemedicine interoperability node | [F02](02-prestazioni-di-telemedicina.md) |
| PAI | Piano assistenziale individuale | Individual care plan | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| PDTA | Percorso diagnostico-terapeutico assistenziale | Care pathway | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| PN-DT | Piattaforma nazionale per la diffusione della telemedicina | National telemedicine dissemination platform | [F02](02-prestazioni-di-telemedicina.md) |
| PNT | Piattaforma nazionale di telemedicina | National telemedicine platform | [F02](02-prestazioni-di-telemedicina.md) |
| PRI | Progetto riabilitativo individuale | Individual rehabilitation project | [F02](02-prestazioni-di-telemedicina.md) |
| ADL / IADL | Attività di base / strumentali della vita quotidiana | Basic / instrumental activities of daily living | [F10](10-percorsi-di-cura-e-sicurezza.md) |

### 5.3 Dato clinico, protezione dei dati e documenti

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| CAdES | Firma elettronica avanzata su file generici | CMS advanced electronic signature | [F03](03-il-dato-clinico.md) |
| DPIA | Valutazione d'impatto sulla protezione dei dati | Data protection impact assessment | [F03](03-il-dato-clinico.md) |
| FEA / FEQ / FES | Firma elettronica avanzata / qualificata / semplice | Advanced / qualified / simple electronic signature | [F03](03-il-dato-clinico.md) |
| PAdES | Firma elettronica avanzata su documenti PDF | PDF advanced electronic signature | [F03](03-il-dato-clinico.md) |
| RPD / DPO | Responsabile della protezione dei dati | Data protection officer | [F03](03-il-dato-clinico.md) |
| XAdES | Firma elettronica avanzata su documenti XML | XML advanced electronic signature | [F03](03-il-dato-clinico.md) |

### 5.4 Identità digitale e anagrafi

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| ANA | Anagrafe nazionale degli assistiti | National registry of healthcare beneficiaries | [F04](04-identita-e-anagrafiche.md) |
| ANPR | Anagrafe nazionale della popolazione residente | National resident population registry | [F04](04-identita-e-anagrafiche.md) |
| CIE | Carta d'identità elettronica | Italian electronic identity card | [F04](04-identita-e-anagrafiche.md) |
| ENI | Europeo Non Iscritto | EU citizen not registered with the health service | [F04](04-identita-e-anagrafiche.md) |
| LoA | Livello di garanzia | Level of assurance | [F04](04-identita-e-anagrafiche.md) |
| OIDC | Connessione a identità aperta | OpenID Connect | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| SAML | Linguaggio di marcatura per asserzioni di sicurezza | Security Assertion Markup Language | [F04](04-identita-e-anagrafiche.md) |
| SPID | Sistema pubblico di identità digitale | Italian public digital identity system | [F04](04-identita-e-anagrafiche.md) |
| STP | Straniero Temporaneamente Presente | Temporarily present foreign national | [F04](04-identita-e-anagrafiche.md) |
| TEAM | Tessera europea di assicurazione malattia | European Health Insurance Card | [F04](04-identita-e-anagrafiche.md) |
| TS-CNS | Tessera sanitaria - carta nazionale dei servizi | Health card with national services card chip | [F04](04-identita-e-anagrafiche.md) |

### 5.5 Standard, interoperabilità e terminologie

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| ADT | Messaggi di ammissione, dimissione e trasferimento | Admission, discharge, transfer messages | [F05](05-standard-di-interoperabilita.md) |
| AIC | Autorizzazione all'immissione in commercio | Marketing authorisation number | [F05](05-standard-di-interoperabilita.md) |
| ATNA | Tracciamento degli eventi e autenticazione di nodo | Audit Trail and Node Authentication | [F05](05-standard-di-interoperabilita.md) |
| BALP | Schemi di base per i registri di tracciamento | Basic Audit Log Patterns | [F05](05-standard-di-interoperabilita.md) |
| CDA | Architettura dei documenti clinici | Clinical Document Architecture | [F05](05-standard-di-interoperabilita.md) |
| CT | Tempo coerente (profilo di sincronizzazione oraria) | Consistent Time | [F05](05-standard-di-interoperabilita.md) |
| DICOM | Immagini e comunicazione digitale in medicina | Digital Imaging and Communications in Medicine | [F05](05-standard-di-interoperabilita.md) |
| FHIR | Risorse rapide per l'interoperabilità sanitaria | Fast Healthcare Interoperability Resources | [F06](06-fhir-da-zero.md) |
| HL7 | Livello sette della salute (organizzazione di standard) | Health Level Seven | [F05](05-standard-di-interoperabilita.md) |
| ICD-9-CM | Classificazione internazionale delle malattie, modifica clinica | International Classification of Diseases, Clinical Modification | [F05](05-standard-di-interoperabilita.md) |
| IG | Guida di implementazione | Implementation Guide | [F05](05-standard-di-interoperabilita.md) |
| IHE | Integrazione dell'impresa sanitaria | Integrating the Healthcare Enterprise | [F05](05-standard-di-interoperabilita.md) |
| IUA | Autorizzazione dell'utente Internet | Internet User Authorization | [F05](05-standard-di-interoperabilita.md) |
| LOINC | Nomi e codici degli identificatori logici delle osservazioni | Logical Observation Identifiers Names and Codes | [F05](05-standard-di-interoperabilita.md) |
| MDM | Messaggi di gestione dei documenti medici | Medical Document Management messages | [F05](05-standard-di-interoperabilita.md) |
| MHD | Accesso mobile ai documenti sanitari | Mobile access to Health Documents | [F05](05-standard-di-interoperabilita.md) |
| MLLP | Protocollo minimale di livello inferiore | Minimal Lower Layer Protocol | [F05](05-standard-di-interoperabilita.md) |
| ORU | Messaggio di trasmissione di risultati | Observation Result Unsolicited | [F05](05-standard-di-interoperabilita.md) |
| PDQm | Interrogazione demografica del paziente, versione mobile | Patient Demographics Query for Mobile | [F05](05-standard-di-interoperabilita.md) |
| PIXm | Correlazione degli identificativi del paziente, versione mobile | Patient Identifier Cross-referencing for Mobile | [F05](05-standard-di-interoperabilita.md) |
| SDO | Ente di sviluppo di standard | Standards Development Organization | [F05](05-standard-di-interoperabilita.md) |
| SIU | Messaggi di programmazione degli appuntamenti | Scheduling Information Unsolicited | [F05](05-standard-di-interoperabilita.md) |
| SNOMED CT | Nomenclatura sistematizzata della medicina, termini clinici | Systematized Nomenclature of Medicine - Clinical Terms | [F05](05-standard-di-interoperabilita.md) |
| STU | Uso di prova per standard | Standard for Trial Use | [F05](05-standard-di-interoperabilita.md) |
| UCUM | Codice unificato per le unità di misura | Unified Code for Units of Measure | [F05](05-standard-di-interoperabilita.md) |

### 5.6 Fascicolo sanitario e infrastrutture nazionali

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| ACN | Agenzia per la cybersicurezza nazionale | National Cybersecurity Agency | [F07](07-fse-e-infrastrutture-nazionali.md) |
| AgID | Agenzia per l'Italia digitale | Agency for Digital Italy | [F07](07-fse-e-infrastrutture-nazionali.md) |
| CAD | Codice dell'amministrazione digitale | Digital Administration Code | [F07](07-fse-e-infrastrutture-nazionali.md) |
| EDS | Ecosistema dati sanitari | Health data ecosystem | [F07](07-fse-e-infrastrutture-nazionali.md) |
| EHDS | Spazio europeo dei dati sanitari | European Health Data Space | [F07](07-fse-e-infrastrutture-nazionali.md) |
| FSE | Fascicolo sanitario elettronico | National electronic health record | [F07](07-fse-e-infrastrutture-nazionali.md) |
| INI | Infrastruttura nazionale per l'interoperabilità | National interoperability infrastructure | [F07](07-fse-e-infrastrutture-nazionali.md) |
| ModI | Modello di Interoperabilità | Interoperability model | [F07](07-fse-e-infrastrutture-nazionali.md) |
| PDND | Piattaforma Digitale Nazionale Dati | National digital data platform | [F07](07-fse-e-infrastrutture-nazionali.md) |
| PSN | Polo Strategico Nazionale | National strategic hub | [F07](07-fse-e-infrastrutture-nazionali.md) |
| QC / QI | Qualificazione dei servizi cloud / delle infrastrutture | Cloud service / infrastructure qualification levels | [F07](07-fse-e-infrastrutture-nazionali.md) |
| Sistema TS | Sistema Tessera Sanitaria | Health card system | [F07](07-fse-e-infrastrutture-nazionali.md) |

### 5.7 Tempo reale, rete e media

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| CGNAT | Traduzione di indirizzi di livello operatore | Carrier-Grade NAT | [F08](08-webrtc-da-zero.md) |
| DTLS | Sicurezza del livello di trasporto a datagrammi | Datagram Transport Layer Security | [F08](08-webrtc-da-zero.md) |
| FEC | Correzione d'errore in avanti | Forward error correction | [F08](08-webrtc-da-zero.md) |
| FIR | Richiesta di fotogramma completo | Full Intra Request | [F08](08-webrtc-da-zero.md) |
| ICE | Stabilimento interattivo della connettività | Interactive Connectivity Establishment | [F08](08-webrtc-da-zero.md) |
| JSEP | Protocollo di stabilimento della sessione da JavaScript | JavaScript Session Establishment Protocol | [F08](08-webrtc-da-zero.md) |
| MCU | Unità di controllo multipunto (composizione) | Multipoint Control Unit | [F08](08-webrtc-da-zero.md) |
| mDNS | Risoluzione dei nomi in multicast | Multicast DNS | [F08](08-webrtc-da-zero.md) |
| NAT | Traduzione degli indirizzi di rete | Network Address Translation | [F08](08-webrtc-da-zero.md) |
| PLI | Indicazione di perdita d'immagine | Picture Loss Indication | [F08](08-webrtc-da-zero.md) |
| RTT | Tempo di andata e ritorno | Round-trip time | [F08](08-webrtc-da-zero.md) |
| SAS | Stringa breve di verifica delle chiavi | Short Authentication String | [F08](08-webrtc-da-zero.md) |
| SDP | Protocollo di descrizione della sessione | Session Description Protocol | [F08](08-webrtc-da-zero.md) |
| SFU | Unità di inoltro selettivo | Selective Forwarding Unit | [F08](08-webrtc-da-zero.md) |
| SRTP | Protocollo sicuro di trasporto in tempo reale | Secure Real-time Transport Protocol | [F08](08-webrtc-da-zero.md) |
| STUN | Utilità di attraversamento della sessione per NAT | Session Traversal Utilities for NAT | [F08](08-webrtc-da-zero.md) |
| TCP | Protocollo di controllo della trasmissione | Transmission Control Protocol | [F08](08-webrtc-da-zero.md) |
| TURN | Attraversamento tramite relay attorno al NAT | Traversal Using Relays around NAT | [F08](08-webrtc-da-zero.md) |
| UDP | Protocollo a datagrammi utente | User Datagram Protocol | [F08](08-webrtc-da-zero.md) |
| WebRTC | Comunicazione web in tempo reale | Web Real-Time Communication | [F08](08-webrtc-da-zero.md) |

### 5.8 Architettura, dati e protocolli applicativi

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| 2PC | Commit a due fasi | Two-phase commit | [F11](11-fondamenti-informatici.md) |
| ALPN | Negoziazione del protocollo applicativo | Application-Layer Protocol Negotiation | [F13](13-protocolli.md) |
| JWT / JWS / JWE / JWK | Token web JSON / firmato / cifrato / chiave | JSON Web Token / Signature / Encryption / Key | [F13](13-protocolli.md) |
| JWKS | Insieme di chiavi web JSON | JSON Web Key Set | [F13](13-protocolli.md) |
| PACELC | Partizione: disponibilità o consistenza; altrimenti: latenza o consistenza | Partition: Availability or Consistency; Else: Latency or Consistency | [F11](11-fondamenti-informatici.md) |
| PKCE | Chiave di prova per lo scambio del codice pubblico | Proof Key for Code Exchange | [F13](13-protocolli.md) |
| RLS | Sicurezza a livello di riga | Row Level Security | [F11](11-fondamenti-informatici.md) |
| RPO | Obiettivo del punto di ripristino | Recovery Point Objective | [F11](11-fondamenti-informatici.md) |
| RTO | Obiettivo del tempo di ripristino | Recovery Time Objective | [F11](11-fondamenti-informatici.md) |
| SNI | Indicazione del nome del server | Server Name Indication | [F13](13-protocolli.md) |
| SSRF | Falsificazione di richieste lato server | Server-Side Request Forgery | [F13](13-protocolli.md) |

### 5.9 Sicurezza, crittografia e catena di fornitura

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| ABAC | Controllo degli accessi basato sugli attributi | Attribute-Based Access Control | [F12](12-crittografia-e-sicurezza.md) |
| AEAD | Cifratura autenticata con dati associati | Authenticated Encryption with Associated Data | [F12](12-crittografia-e-sicurezza.md) |
| CRA | Regolamento sulla ciberresilienza | Cyber Resilience Act | [F12](12-crittografia-e-sicurezza.md) |
| HKDF | Funzione di derivazione di chiave basata su HMAC | HMAC-based Key Derivation Function | [F12](12-crittografia-e-sicurezza.md) |
| HMAC | Codice di autenticazione del messaggio basato su hash | Hash-based Message Authentication Code | [F12](12-crittografia-e-sicurezza.md) |
| mTLS | Sicurezza del livello di trasporto con mutua autenticazione | Mutual TLS | [F13](13-protocolli.md) |
| OCSP | Protocollo di stato del certificato in linea | Online Certificate Status Protocol | [F12](12-crittografia-e-sicurezza.md) |
| PKI | Infrastruttura a chiave pubblica | Public Key Infrastructure | [F12](12-crittografia-e-sicurezza.md) |
| RBAC | Controllo degli accessi basato sui ruoli | Role-Based Access Control | [F12](12-crittografia-e-sicurezza.md) |
| SBOM | Distinta dei materiali software | Software Bill of Materials | [F12](12-crittografia-e-sicurezza.md) |
| SOUP | Software di provenienza ignota | Software Of Unknown Provenance | [F12](12-crittografia-e-sicurezza.md) |
| STRIDE | Falsificazione, manomissione, ripudio, divulgazione, negazione di servizio, elevazione di privilegio | Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege | [F12](12-crittografia-e-sicurezza.md) |
| VEX | Scambio sulla sfruttabilità delle vulnerabilità | Vulnerability Exploitability eXchange | [F12](12-crittografia-e-sicurezza.md) |

### 5.10 Regolatorio e qualità

| Sigla | Forma estesa italiana | English | Dove |
|---|---|---|---|
| CE | Conformità europea (marcatura) | European Conformity (marking) | [F15](15-regolatorio-da-zero.md) |
| EUDAMED | Banca dati europea dei dispositivi medici | European Database on Medical Devices | [F15](15-regolatorio-da-zero.md) |
| GSPR | Requisiti generali di sicurezza e prestazione | General Safety and Performance Requirements | [F15](15-regolatorio-da-zero.md) |
| MDCG | Gruppo di coordinamento per i dispositivi medici | Medical Device Coordination Group | [F15](15-regolatorio-da-zero.md) |
| MDR | Regolamento sui dispositivi medici | Medical Device Regulation | [F15](15-regolatorio-da-zero.md) |
| MDSW | Software che è dispositivo medico | Medical Device Software | [F15](15-regolatorio-da-zero.md) |
| NANDO | Nuovo approccio: organismi notificati e designati | New Approach Notified and Designated Organisations | [F15](15-regolatorio-da-zero.md) |
| PRRC | Persona responsabile del rispetto della normativa | Person Responsible for Regulatory Compliance | [F15](15-regolatorio-da-zero.md) |
| PSUR | Rapporto periodico di aggiornamento sulla sicurezza | Periodic Safety Update Report | [F15](15-regolatorio-da-zero.md) |
| SRN | Numero di registrazione unico | Single Registration Number | [F15](15-regolatorio-da-zero.md) |
| UDI / UDI-DI / UDI-PI | Identificazione unica del dispositivo / identificativo del dispositivo / della produzione | Unique Device Identification / Device Identifier / Production Identifier | [F15](15-regolatorio-da-zero.md) |
| WCAG | Linee guida per l'accessibilità dei contenuti web | Web Content Accessibility Guidelines | [F15](15-regolatorio-da-zero.md), [FUN](../03_functional/06-accessibilita-e-usabilita.md) |

---

## 6. Termini che significano cose diverse a seconda del contesto

È la categoria più insidiosa del glossario, e per una ragione precisa: **chi legge crede di aver
capito.** Con un falso sinonimo il lettore percepisce almeno un attrito - due parole per una cosa
sola. Qui no: la parola è una sola, il significato è plausibile, la frase scorre, e l'errore si
manifesta molti mesi dopo, in un punto del sistema che nessuno collega alla frase letta.

La regola del progetto non è scegliere un significato ed espellere l'altro - sarebbero entrambi
legittimi, ciascuno nel proprio contesto. La regola è **qualificare sempre**, e il controllo è
automatizzabile perché l'elenco è chiuso: nessuna delle parole che seguono compare da sola in un
nome di classe, di colonna, di endpoint, di evento o di etichetta di interfaccia.

### 6.1 Sessione

**Significati.** (a) L'atto clinico, unità rendicontabile. (b) La connessione media fra i
partecipanti. (c) La sessione di accesso applicativo di un utente al sistema.
**Come si riconosce.** Se la frase parla di durata fatturabile, di referto o di esito, è (a). Se
parla di codec, di caduta, di riconnessione o di qualità, è (b). Se parla di scadenza, di token o
di disconnessione per inattività, è (c).
**Forma da usare.** *contatto*, *sessione media*, *sessione applicativa*. Mai «sessione» da sola.

### 6.2 Contatto

**Significati.** (a) L'interazione fra la persona assistita e il sistema di erogazione.
(b) Il recapito telefonico o di posta elettronica.
**Come si riconosce.** Se ha un inizio, una fine, uno stato e un esito, è (a). Se ha un tipo, un
uso e una preferenza, è (b).
**Forma da usare.** Nel codice `Encounter` per il primo e *recapito* per il secondo. **Mai**
`Contact`, che nello standard designa già il secondo e produrrebbe una collisione con un elemento
esistente della risorsa anagrafica.

### 6.3 Ticket

**Significati.** (a) La quota di compartecipazione alla spesa a carico dell'assistito. (b) La
segnalazione di assistenza aperta presso il supporto.
**Come si riconosce.** Se compare un importo, un'esenzione o una rendicontazione, è (a). Se compare
uno stato di lavorazione, un assegnatario o una priorità di presa in carico, è (b).
**Forma da usare.** *quota di compartecipazione* / *segnalazione di assistenza*.

### 6.4 Teleassistenza

**Significati.** (a) L'atto professionale sanitario a distanza di pertinenza delle professioni non
mediche, definito dagli atti sulla telemedicina. (b) L'assistenza tecnica remota all'utente.
**Come si riconosce.** Se il soggetto è un professionista sanitario e l'oggetto è una persona
assistita o il suo caregiver, è (a). Se il soggetto è un tecnico e l'oggetto è un dispositivo o
un'utenza, è (b).
**Forma da usare.** *teleassistenza* per la prestazione sanitaria, *supporto tecnico* per l'altra.
Nel codice due nomi che non si somigliano.

### 6.5 Registro

**Significati.** (a) Il registro degli accessi, non ripudiabile, con catena di impronte.
(b) Il registro di diagnostica applicativa. (c) Il registro degli eventi di un broker, con
posizioni progressive e rilettura.
**Come si riconosce.** Se serve a rispondere a «chi ha visto che cosa», è (a). Se serve a capire
perché un processo si è comportato in un certo modo, è (b). Se ha partizioni, offset e consumatori,
è (c).
**Forma da usare.** *registro degli accessi* / *registro di diagnostica* / *log degli eventi*. I tre
artefatti hanno regimi di conservazione, di accesso e di alterabilità completamente diversi, e
confonderli è il modo in cui il requisito di auditabilità immutabile viene soddisfatto sulla carta e
non nei fatti.

### 6.6 Firma

**Significati.** (a) La sottoscrizione di un documento, con valore probatorio e livello determinato
per tipologia documentale. (b) La firma crittografica di un messaggio, di una busta o di un token.
**Come si riconosce.** Se c'è un firmatario che assume una responsabilità, è (a). Se c'è una chiave,
un algoritmo e un verificatore automatico, è (b).
**Forma da usare.** *firma del documento* / *firma della busta*. La prima è un atto giuridico, la
seconda una proprietà tecnica; nessuna delle due implica l'altra.

### 6.7 Priorità

**Significati.** (a) La classe di urgenza della prestazione richiesta, che fissa il tempo massimo di
erogazione. (b) La priorità di elaborazione o di consegna di un messaggio.
**Come si riconosce.** Se determina una scadenza verso la persona assistita, è (a). Se determina
l'ordine in una coda tecnica, è (b).
**Forma da usare.** *codice di priorità* / *priorità di consegna*.

### 6.8 Stato

**Significati.** (a) Lo stato clinico della persona. (b) Lo stato di una macchina a stati: contatto,
documento, allarme, messaggio.
**Come si riconosce.** Se il valore è interpretato da un clinico, è (a). Se il valore governa
transizioni ammesse e vincoli di validazione, è (b).
**Forma da usare.** *condizione clinica* / *stato del contatto*, *stato del documento* e così via.
Mai un campo `status` senza qualificatore in un'interfaccia rivolta a un professionista sanitario.

### 6.9 Piano

**Significati.** (a) Nel dominio clinico: piano di cura, piano assistenziale individuale, piano di
telemonitoraggio, progetto riabilitativo individuale - quattro oggetti distinti. (b) Nel dominio
tecnico: piano di esecuzione di un'interrogazione, piano di rilascio. (c) Nell'architettura del
progetto: piano applicativo e piano clinico come superfici di esposizione.
**Come si riconosce.** Se è firmato da un professionista, è (a). Se lo produce un motore, è (b). Se
descrive un'interfaccia verso l'esterno, è (c).
**Forma da usare.** Sempre qualificata, senza eccezioni. È la parola con il maggior numero di
significati legittimi nel prodotto.

### 6.10 Monitoraggio

**Significati.** (a) Il telemonitoraggio della persona assistita. (b) Il monitoraggio tecnico della
piattaforma.
**Come si riconosce.** Se il soggetto osservato è una persona, è (a). Se è un processo, una coda o
un servizio, è (b).
**Forma da usare.** *telemonitoraggio* / *osservabilità*. Appartengono a due contesti delimitati
diversi e non condividono né entità né vocabolario.

### 6.11 Verifica

**Significati.** (a) La verifica di eseguibilità clinica della prestazione a distanza. (b) La
pre-verifica tecnica di dispositivo, permessi, banda e raggiungibilità.
**Come si riconosce.** Se l'esito riguarda l'opportunità clinica di procedere, è (a). Se riguarda il
funzionamento della dotazione, è (b).
**Forma da usare.** *verifica di eseguibilità* / *pre-verifica tecnica*. Un esito positivo della
seconda non dice nulla sulla prima.

### 6.12 Validazione

**Significati.** (a) La validazione clinica di un documento da parte del professionista, che ne
dichiara definitivo il contenuto. (b) La validazione formale di una risorsa rispetto a uno schema o
a un profilo.
**Come si riconosce.** Se produce responsabilità, è (a). Se produce un elenco di errori e
avvertimenti, è (b).
**Forma da usare.** *validazione clinica* / *validazione formale*. Un documento formalmente valido e
clinicamente non validato non è un documento sanitario.

### 6.13 Jitter

**Significati.** (a) Nella rete: la variabilità del ritardo fra pacchetti consecutivi. (b) Nei
ritentativi: il termine casuale aggiunto all'intervallo di attesa per evitare raffiche
sincronizzate.
**Come si riconosce.** Se compare accanto a perdita di pacchetti e tempo di andata e ritorno, è (a).
Se compare accanto ad attesa esponenziale e coda di scarto, è (b).
**Forma da usare.** *variabilità del ritardo* per il primo, *componente casuale dell'attesa* per il
secondo, quando il contesto non è già evidente.

### 6.14 Profilo

**Significati.** (a) La restrizione di uno standard per un contesto d'uso. (b) Il profilo di
protezione del media, cioè la suite di cifratura negoziata. (c) Il profilo di distribuzione, cioè
la configurazione di collocazione dell'installazione. (d) Il profilo di dimensione del dataset
sintetico. (e) Il profilo sanitario sintetico, che è un documento clinico.
**Come si riconosce.** Il caso (e) è l'unico che compare in un contesto clinico e l'unico che ha un
autore; gli altri quattro si distinguono dal complemento che li accompagna.
**Forma da usare.** Sempre con il complemento: *profilo di conformità*, *profilo di protezione*,
*profilo di distribuzione*, *profilo di dataset*, *profilo sanitario sintetico*.

### 6.15 Risorsa

**Significati.** (a) L'unità di scambio dello standard sanitario. (b) La risorsa protetta di un
sistema di autorizzazione. (c) La risorsa di calcolo - memoria, connessioni, quote.
**Come si riconosce.** Se ha un `resourceType`, è (a). Se compare in una decisione di
autorizzazione insieme a soggetto e azione, è (b). Se compare in un limite o in una paratia, è (c).
**Forma da usare.** *risorsa FHIR* / *risorsa protetta* / *risorsa di sistema*.

### 6.16 Consenso

**Significati.** Almeno quattro oggetti distinti: consenso all'atto sanitario, consenso al
trattamento dei dati, consenso alla consultazione del fascicolo, consenso alla registrazione della
sessione. A questi si affianca l'adesione informata al canale a distanza, che consenso non è.
**Come si riconosce.** Dalla domanda a cui risponde: «posso curarti?», «posso trattare questi
dati?», «può vederli quel soggetto?», «posso registrare?».
**Forma da usare.** Sempre il tipo specifico, per esteso. «Consenso» da solo, e a maggior ragione
«consenso alla piattaforma», non identifica alcun oggetto del modello.

### 6.17 Livello

**Significati.** (a) Il livello di garanzia dell'identità. (b) Il livello di riservatezza di un
documento. (c) Il livello di isolamento delle transazioni. (d) Il livello di una pila di protocolli.
(e) La classe di sicurezza software, che qualcuno chiama impropriamente «livello».
**Come si riconosce.** Dal complemento, sempre presente in una frase scritta bene; la sua assenza è
il segnale che la frase va riscritta.
**Forma da usare.** Il complemento è obbligatorio. Per (e) si dice *classe di sicurezza software*,
mai «livello».

### 6.18 Segnale e segnalazione

**Significati.** (a) In clinica, il **segno**: manifestazione rilevabile dall'osservatore.
(b) Nel tempo reale, la **segnalazione**: lo scambio preliminare delle descrizioni di sessione e
dei candidati. (c) In organizzazione, la segnalazione di un incidente o di una vulnerabilità.
**Come si riconosce.** Se ha una fonte umana e un peso clinico, è (a). Se precede lo stabilimento di
una connessione, è (b). Se ha un destinatario istituzionale e un termine, è (c).
**Forma da usare.** *segno* / *segnalazione di sessione* / *segnalazione di incidente*.

### 6.19 Revoca

**Significati.** (a) La revoca di un certificato. (b) La revoca di un token. (c) La revoca di un
consenso da parte della persona assistita.
**Come si riconosce.** Le prime due sono atti tecnici con effetti immediati e verificabili; la terza
è un atto della persona con effetti che il sistema deve rispettare ma non produce da sé.
**Forma da usare.** Il complemento è obbligatorio. E va ricordato che (a) e (b) non hanno effetto
se nessuno verifica la revoca.

### 6.20 ACN

**Significati.** (a) L'Accordo collettivo nazionale della medicina convenzionata. (b) L'Agenzia per
la cybersicurezza nazionale.
**Come si riconosce.** Il contesto è sempre chiarissimo - remunerazione dei medici contro misure di
sicurezza - ed è proprio per questo che nessuno scioglie la sigla, e chi legge dall'esterno del
dominio si ferma.
**Forma da usare.** Sempre sciolta alla prima occorrenza di ogni documento, senza eccezioni. È il
caso di omonimia più frequente in questa documentazione.

---

## 7. Indice inverso inglese → italiano

Serve a chi arriva dalla letteratura tecnica internazionale e cerca il termine italiano
corrispondente. Le voci contrassegnate con **≈** sono quelle in cui l'equivalenza **non è esatta**,
tipicamente perché il termine italiano designa un istituto giuridico o un ruolo organizzativo
nazionale: in quei casi il rinvio serve a trovare la voce, non a sostituire il termine.

| English | Italiano |
|---|---|
| Access log | Registro degli accessi |
| Accessory | Accessorio |
| Active device | Dispositivo attivo |
| Adherence | Aderenza |
| Adverse event | Evento avverso |
| Aggregate / aggregate root | Aggregato / radice di aggregato |
| Aggregated value | Valore aggregato |
| Alarm fatigue | Affaticamento da allarme |
| Amendment | Rettifica |
| Anonymisation | Anonimizzazione |
| Anti-corruption layer | Livello anticorruzione |
| Append-only store | Archivio a sola aggiunta |
| Application principal | Principale applicativo |
| Application session | Sessione applicativa |
| Assertion | Asserzione |
| Assigning authority | Dominio di attribuzione |
| At-least-once / at-most-once / exactly-once | Almeno una volta / al più una volta / esattamente una volta |
| Attack surface | Superficie di attacco |
| Attribute | Attributo |
| Auscultation | Auscultazione |
| Authentication | Autenticazione |
| Authentication factor | Fattore di autenticazione |
| Authorisation | Autorizzazione |
| Availability | Disponibilità |
| Backpressure | Contropressione |
| Beneficiary ≈ | Assistito |
| Bitemporality | Bitemporalità |
| Binding strength | Forza del binding |
| Bounded context | Contesto delimitato |
| Breach register | Registro delle violazioni |
| Break the glass | Rottura del vetro |
| Breakout room | Stanza laterale |
| Bulkhead | Paratia |
| Canonical dataset | Dataset canonico |
| Canonical exchange model | Modello canonico di scambio |
| Canonical URI | URI canonico |
| Capitation | Quota capitaria |
| Care complexity | Complessità assistenziale |
| Care pathway ≈ | Percorso diagnostico-terapeutico assistenziale |
| Care plan | Piano di cura |
| Care relationship | Relazione di cura |
| Care setting | Setting di erogazione |
| Caregiver | Caregiver |
| CE marking | Marcatura CE |
| Certification authority | Autorità di certificazione |
| Chain of trust | Catena di fiducia |
| Change data capture | Cattura delle modifiche |
| Channel fallback | Ripiego di canale |
| Choreography | Coreografia |
| Circuit breaker | Interruttore automatico |
| Clinical alert | Allarme clinico |
| Clinical document | Documento clinico |
| Clinical evaluation | Valutazione clinica |
| Clinical letter | Relazione clinica |
| Clinical scale | Scala clinica |
| Clinical specialty | Branca specialistica |
| Clinical threshold | Soglia clinica |
| Coded concept | Concetto codificato |
| Coded unit | Unità di misura codificata |
| Collaborative report ≈ | Relazione collaborativa |
| Community health centre ≈ | Casa della comunità |
| Compensating transaction | Compensazione |
| Compliant digital preservation ≈ | Conservazione a norma |
| Confidentiality | Riservatezza |
| Conformity assessment | Valutazione della conformità |
| Congestion control | Controllo della congestione |
| Connection quality | Qualità del collegamento |
| Consent to access | Consenso alla consultazione |
| Consent to record | Consenso alla registrazione |
| Consumer group | Gruppo di consumatori |
| Consumer lag | Ritardo del consumatore |
| Context map | Mappa dei contesti |
| Contract test | Prova a contratto |
| Co-payment ≈ | Ticket |
| Co-payment exemption ≈ | Esenzione |
| Coordinated omission | Omissione coordinata |
| Coordinated vulnerability disclosure | Divulgazione coordinata |
| Correlation | Correlazione |
| Critical value | Valore critico |
| Cryptographic agility | Agilità crittografica |
| Cursor pagination | Paginazione per cursore |
| Data concerning health | Dato relativo alla salute |
| Data controller | Titolare del trattamento |
| Data processing consent | Consenso al trattamento dei dati |
| Data protection impact assessment | Valutazione d'impatto sulla protezione dei dati |
| Data suppression ≈ | Oscuramento |
| Dead letter queue | Coda di scarto |
| Declared purpose of use | Finalità dichiarata |
| Declared service coverage | Copertura oraria dichiarata |
| Decompensation | Scompenso |
| Deduplication | Deduplicazione |
| Deferred delivery | Consegna differita |
| Delegate | Delegato |
| Delivered service | Prestazione erogata |
| Delivering centre ≈ | Centro erogatore |
| Delivering organisation | Struttura erogante |
| Delivery of care | Erogazione |
| Deterministic / probabilistic matching | Corrispondenza deterministica / probabilistica |
| Device card ≈ | Tesserino dispositivi |
| Diagnosis | Diagnosi |
| Diagnostic question | Quesito diagnostico |
| Differential diagnosis | Diagnosi differenziale |
| Digital note ≈ | Annotazione digitale |
| Document signature | Firma del documento |
| Document version | Versione del documento |
| Document visibility matrix | Matrice di visibilità documentale |
| Document voiding | Annullamento del documento |
| Domain event | Evento di dominio |
| Domain separation | Separazione dei domini |
| Draft | Bozza |
| Dry weight | Peso secco |
| Dual write | Doppia scrittura |
| Early warning score | Scala di allerta precoce |
| Egress isolation | Isolamento di rete in uscita |
| EHR feeding | Alimentazione del fascicolo |
| Eligibility | Eleggibilità |
| Encounter | Contatto |
| Encounter outcome | Esito del contatto |
| Encounter state | Stato del contatto |
| Encryption at rest / in transit | Cifratura a riposo / in transito |
| End-to-end encryption | Cifratura da estremo a estremo |
| Enrolment | Arruolamento |
| Enrolment into care | Presa in carico |
| Entity | Entità |
| Ephemeral credential | Credenziale temporanea |
| Ephemeral environment | Ambiente effimero |
| Episode of care | Episodio di cura |
| Escalation | Escalation |
| Eventual consistency | Coerenza finale |
| Exacerbation | Riacutizzazione |
| Expansion | Espansione |
| Expected observation | Attesa di rilevazione |
| Expected volume monitoring | Sorveglianza del volume atteso |
| Explicit delegation | Delega esplicita |
| Exponential backoff | Attesa esponenziale |
| Extension | Estensione |
| External identifier | Identificatore esterno |
| Fallback | Ripiego |
| Fallacies of distributed computing | Fallacie del calcolo distribuito |
| False reassurance | Falsa rassicurazione |
| Feasibility assessment | Valutazione di eseguibilità |
| Fee schedule ≈ | Nomenclatore |
| Five-tuple | Cinquina |
| Floating version | Versione flottante |
| Follow-up | Follow-up |
| Forward secrecy | Segretezza in avanti |
| Fragility / frailty | Fragilità |
| General practitioner ≈ | Medico di medicina generale |
| Generator seed | Seme del generatore |
| Glare | Collisione delle offerte |
| Harm | Danno |
| Hash chain | Catena di impronte |
| Hazard | Pericolo |
| Hazardous situation | Situazione pericolosa |
| Head-of-line blocking | Blocco in testa alla coda |
| Highly protected health data ≈ | Dati a maggiore tutela dell'anonimato |
| Homeostasis | Omeostasi |
| Hospital discharge letter | Lettera di dimissione ospedaliera |
| Hysteresis | Isteresi |
| Idempotency / idempotency key | Idempotenza / chiave di idempotenza |
| Identifier | Identificatore |
| Identity | Identità |
| Implementation guide | Guida di implementazione |
| Individual care plan ≈ | Piano assistenziale individuale |
| Individual rehabilitation project ≈ | Progetto riabilitativo individuale |
| Informed acceptance ≈ | Adesione informata |
| Informed consent to treatment | Consenso all'atto sanitario |
| Inspection | Ispezione |
| Integrator | Integratore |
| Integrity | Integrità |
| Intended purpose | Destinazione d'uso |
| Invariant | Invariante |
| Isolation level | Livello di isolamento |
| Joint controllership | Contitolarità |
| Just culture | Cultura giusta |
| Keyframe | Fotogramma completo |
| Latency | Latenza |
| Latent condition | Condizione latente |
| Least privilege | Privilegio minimo |
| Legal basis | Base giuridica |
| Level of assurance | Livello di garanzia |
| Likelihood ratio | Rapporto di verosimiglianza |
| Local electronic health record | Cartella clinica elettronica |
| Lock file | File di blocco delle dipendenze |
| Logical clock | Orologio logico |
| Lost event / lost update | Evento perso / aggiornamento perduto |
| Man in the middle | Attacco dell'intermediario |
| Manufacturer | Fabbricante |
| Master patient index | Indice principale del paziente |
| Media session | Sessione media |
| Medical device | Dispositivo medico |
| Medication reconciliation | Riconciliazione terapeutica |
| Minimum services ≈ | Servizi minimi |
| Monotonic clock | Orologio monotono |
| Multimorbidity | Multimorbilità |
| Mutual TLS | Autenticazione bilaterale TLS |
| National electronic health record ≈ | Fascicolo sanitario elettronico |
| Near miss | Quasi evento |
| Negative test | Prova negativa |
| Network emulator | Emulatore di rete |
| No-show | Mancata presentazione |
| Non-persistent cache | Cache non persistita |
| Non-repudiation | Non ripudio |
| Non-transmissible | Non conferibile |
| Notified body | Organismo Notificato |
| Observable quantity | Grandezza |
| Observation | Misura |
| Observation timestamp | Istante di rilevazione |
| Observability | Osservabilità |
| Official display | Display ufficiale |
| Optimistic concurrency | Concorrenza ottimistica |
| Orchestration | Orchestrazione |
| Organisational health record | Dossier sanitario |
| Outbox relay | Relay dell'outbox |
| Overbooking | Overbooking |
| Palpation | Palpazione |
| Partial failure | Guasto parziale |
| Participant | Partecipante |
| Partition key | Chiave di partizionamento |
| Pathway deviation | Deviazione dal percorso |
| Patient | Paziente |
| Patient digital readiness | Compliance digitale dell'assistito |
| Patient identification | Identificazione |
| Patient summary | Profilo sanitario sintetico |
| Percussion | Percussione |
| Perfect negotiation | Negoziazione perfetta |
| Perfusion index | Indice di perfusione |
| Periodic seal | Sigillo periodico |
| Personal data breach | Violazione dei dati personali |
| Phantom event / phantom service | Evento fantasma / prestazione fantasma |
| Physical examination | Esame obiettivo |
| Physician-to-physician teleconsultation ≈ | Teleconsulto |
| Pinning | Fissaggio della versione |
| Placing on the market | Immissione sul mercato |
| Point of delivery | Punto di erogazione |
| Positive / negative predictive value | Valore predittivo positivo / negativo |
| Post-market surveillance | Sorveglianza post-commercializzazione |
| Practitioner role | Ruolo organizzativo |
| Prevalence | Prevalenza |
| Priority class ≈ | Codice di priorità |
| Privacy notice | Informativa |
| Processor | Responsabile del trattamento |
| Profile | Profilo |
| Prognosis | Prognosi |
| Progress notes | Diario clinico |
| Protection profile | Profilo di protezione |
| Provenance attestation | Attestazione di provenienza |
| Provenance level | Livello di provenienza |
| Pseudonymisation | Pseudonimizzazione |
| Readiness and liveness | Prontezza e vivacità |
| Recording mode | Modalità con registrazione |
| Record merge | Fusione anagrafica |
| Recovery point / time objective | Punto / tempo di ripristino |
| Red flag | Segnale d'allarme |
| Reference-based demographics | Anagrafica per riferimento |
| Region of entitlement / delivery ≈ | Regione di assistenza / di erogazione |
| Remote monitoring plan ≈ | Piano di telemonitoraggio |
| Remote patient monitoring ≈ | Telemonitoraggio |
| Report ≈ | Referto |
| Reporting for reimbursement ≈ | Rendicontazione |
| Reporting window | Finestra di refertazione |
| Reproducible build | Costruzione riproducibile |
| Requested service | Prestazione richiesta |
| Rescheduling | Riprogrammazione |
| Residual risk | Rischio residuo |
| Resolution status | Stato di risoluzione |
| Resource | Risorsa |
| Revocation | Revoca |
| Revocation checking | Verifica della revoca |
| Risk | Rischio |
| Row level security | Sicurezza a livello di riga |
| Saga | Saga |
| Salt / pepper | Sale / pepe |
| Secret rotation | Rotazione del segreto |
| Secure context | Contesto sicuro |
| Selective forwarding | Inoltro selettivo |
| Selective restore | Ripristino selettivo |
| Sensitivity / specificity | Sensibilità / specificità |
| Sensitivity label | Livello di riservatezza |
| Sentinel event | Evento sentinella |
| Separation of duties | Separazione dei compiti |
| Service catalogue | Catalogo delle prestazioni |
| Service centre ≈ | Centro servizi |
| Session location address | Indirizzo di svolgimento |
| Session technical report | Rapporto tecnico di sessione |
| Sign / symptom | Segno / sintomo |
| Signaling | Segnalazione |
| Significant change | Modifica sostanziale |
| Slicing | Slicing |
| Slot | Slot |
| Software bill of materials | Distinta dei materiali software |
| Software safety classification | Classe di sicurezza software |
| Special categories of personal data | Categorie particolari di dati |
| Strong consistency | Consistenza forte |
| Substitution chain | Catena di sostituzione |
| Support administrator ≈ | Amministratore di sostegno |
| Suspected diagnosis | Sospetto diagnostico |
| Symmetric NAT | NAT simmetrico |
| Syndrome | Sindrome |
| Synthetic data / synthetic flag | Dato sintetico / marcatore di sinteticità |
| System administrator ≈ | Amministratore di sistema |
| Technical alert | Allarme tecnico |
| Technical documentation | Fascicolo tecnico |
| Technical pre-check | Pre-verifica tecnica |
| Technical threshold | Soglia tecnica |
| Tele-advice ≈ | Teleconsulenza medico-sanitaria |
| Tele-care ≈ | Teleassistenza |
| Telemedicine | Telemedicina |
| Telerehabilitation ≈ | Teleriabilitazione |
| Tele-reporting ≈ | Telerefertazione |
| Tenant | Tenant |
| Terminology gateway | Gateway terminologico |
| Test double | Doppio di prova |
| Third party in session | Terzo in sessione |
| Threat model | Modello di minaccia |
| Time series | Serie temporale |
| Timestamp token | Marca temporale |
| Trace / traceability | Traccia / tracciabilità |
| Transaction time / valid time | Tempo di sistema / tempo di validità |
| Transactional outbox | Outbox transazionale |
| Treatment adherence | Aderenza terapeutica |
| Trend | Tendenza |
| Triage | Triage |
| Trust anchor | Ancora di fiducia |
| Trust boundary | Confine di fiducia |
| Typed outcome | Esito tipizzato |
| Ubiquitous language | Linguaggio ubiquo |
| UI label | Etichetta di interfaccia |
| Unique device identification | Identificazione unica del dispositivo |
| Use error / abnormal use | Errore d'uso / uso anomalo |
| Value object | Oggetto valore |
| Versioning | Versionamento |
| Video visit ≈ | Televisita |
| Virtual waiting room | Sala d'attesa virtuale |
| Vigilance | Vigilanza |
| Write skew | Scrittura obliqua |

---

## 8. Come si aggiunge, si corregge e si ritira una voce

Un glossario senza un processo di manutenzione degrada in pochi mesi, e degrada in modo
particolarmente dannoso: le voci sbagliate restano e continuano a essere citate. Le regole che
seguono sono operative e valgono per chiunque proponga una modifica.

1. **Una voce entra con la sua fonte.** Natura N, G o S con la citazione puntuale, oppure natura P
   con la ragione per cui la definizione di progetto è necessaria. Una voce senza fonte e senza
   necessità viene rifiutata in revisione, per quanto sia utile.
2. **Una voce italiana senza traducente non è una voce.** L'integralità delle due lingue è un
   vincolo del progetto, e per il glossario la regola è più stretta che altrove. Dove l'equivalente
   inglese non è esatto, si scrive il traducente **e** l'avvertenza: omettere il traducente non è
   un'alternativa ammessa.
3. **Una voce che questa guida non introduce non entra.** Il criterio di ammissione non è
   l'utilità astratta del termine: è che almeno un modulo o un'area lo usi. Se serve una voce
   nuova, prima si scrive il passaggio che la introduce.
4. **I termini non si rinominano: si deprezzano.** Rinominare rompe la corrispondenza fra codice
   già scritto, dati già registrati ed eventi già pubblicati. La voce vecchia resta, marcata come
   deprecata, con il rinvio a quella nuova e la data.
5. **Ogni evento di dominio nuovo passa da qui.** Il nome dell'evento è un termine del linguaggio:
   se non è nel glossario, l'evento non esiste ancora.
6. **Le trappole si aggiungono quando si scoprono.** Se una confusione ha prodotto un difetto reale,
   la sua descrizione appartiene alla voce corrispondente. È l'unico modo in cui un errore risolto
   una volta smette di ripetersi.
7. **Ciò che non è verificato si marca `[NV]`.** Vale per le date, per gli estremi normativi, per i
   contenuti di documenti non pubblicati. Una citazione plausibile ma non verificata è peggio di
   un'assenza dichiarata, perché viene ripresa da chi legge.
8. **Nessuna voce introduce una soglia clinica, un contenuto di terminologia sotto licenza, un dato
   reale o un nome commerciale.** I quattro divieti non hanno eccezioni e non ammettono deroghe
   caso per caso.

---

## 9. Dove continuare

**Se cerchi il dettaglio di modellazione di un termine di dominio.** Il
[glossario del dominio](../05_domain/09-glossario-del-dominio.md), che per ciascuna voce dichiara
la natura della definizione e i capitoli in cui è modellata, e il
[capitolo sul linguaggio ubiquo](../05_domain/01-linguaggio-ubiquo.md), che stabilisce **come** si
governa il vocabolario invece di elencare **che cosa** contiene.

**Se cerchi il testo originale di una fonte normativa citata.** Il modulo
[20 - Fonti primarie](20-fonti-primarie.md), che rinvia ai testi e non alle sintesi. Un glossario
è per definizione una sintesi, e le sintesi invecchiano.

**Se hai trovato una voce che ti sembra imprecisa.** Aprire una segnalazione vale più di dieci
righe di codice, e vale a maggior ragione se arrivi dal mondo clinico: le imprecisioni che chi
scrive software non vede sono precisamente quelle che il glossario esiste per evitare. Le regole
di contribuzione sono in
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), che dichiara
questa guida come prerequisito.

**Se stai per toccare un'area del codice.** Il modulo
[18 - Contribuire, area per area](18-contribuire-per-area.md), che dice area per area quali
conoscenze servono prima di modificarla, e quali sono gli errori tipici di chi arriva dall'altro
dominio.

**Prima di distribuire, integrare o mettere in servizio qualunque cosa.** Le avvertenze
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
e
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
Oggi il prodotto non reca marcatura CE, e chi lo installa o lo immette sul mercato assume gli
obblighi che ne derivano.
