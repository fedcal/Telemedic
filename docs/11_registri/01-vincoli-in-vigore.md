---
title: Vincoli in vigore
sidebar_position: 2
description: "Il registro dei vincoli di progetto: ogni sigla citata nella documentazione, chi l'ha emessa, a quali aree si applica e che cosa impone."
---

# Vincoli in vigore

> **Questo capitolo e' generato.** La fonte e' la bacheca inter-agenti del progetto,
> proiettata in `registro/vincoli.tsv` e da li' in questa pagina. Modificarlo a
> mano non ha effetto: la modifica sparisce alla rigenerazione successiva.

Ogni voce porta come titolo la **sola sigla**, cosi' che il rinvio `#v-160` sia
stabile e uguale nelle due lingue. Le colonne **Da** e **A** dicono quale area ha emesso la
voce e quali aree ne sono destinatarie; le sigle delle aree sono quelle usate nel contesto
di lavoro del progetto.

**Il testo delle voci resta nella lingua in cui e' stato emesso**, l'italiano, anche nella
versione inglese di questa pagina. E' una limitazione dichiarata e non una svista: tradurre
una voce di registro significherebbe mantenerne due versioni allineate a ogni modifica della
bacheca, e una traduzione che si stacca da un registro di governo dice cose diverse a lettori
di lingua diversa su che cosa il progetto e' vincolato a fare.

### V-01

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

`Encounter` e `MediaSession` sono aggregati distinti. Nessuna area può unirli

### V-02

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

Nessuna soglia clinica cablata: sono configurazione per assistito

### V-03

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

Il sistema è pienamente funzionale senza SNOMED CT. Nessun percorso principale può richiederlo

### V-04

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

Il registro immutabile è a catena di impronte e conservazione separata. Il versionamento delle entità non lo sostituisce

### V-05

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

Il progetto è conforme e verificabile su SPID/CIE/TS-CNS, **non accreditato**: il fornitore di servizi è chi installa

### V-06

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

**EMENDATO DA `D58`, ATTUATO DA `D63`.** Il ruolo di fabbricante **sarà assunto dal progetto**; il soggetto giuridico è **ancora da costituire**. Con `D63`, il 26 agosto 2026, il committente ha deciso che il sistema **deve essere adatto all'erogazione di prestazioni su pazienti reali**: la marcatura CE al termine di una valutazione della conformità conclusa non è più soltanto un percorso che il progetto intende intraprendere, è un **requisito di prodotto**. `D63` **non modifica di una riga** né lo stato di fatto né il divieto di dichiarare date: cambia lo stato dell'obiettivo, non ciò che è vero oggi e non ciò che è dicibile. Resta invariato e va ripetuto qui perché è l'oggetto stesso della decisione: **oggi il prodotto non reca marcatura CE, non è coperto da alcuna dichiarazione di conformità e non è utilizzabile per l'erogazione di prestazioni sanitarie su pazienti reali**. Sequenza di recepimento in `.telemedic/piani/D63-recepimento-del-ruolo-di-fabbricante.md`. Il materiale regolatorio è prodotto **per il nostro percorso**, non più «per chi certifica»: quella formula è vietata in ogni documento. **Restano invariati e non attenuabili**: (a) oggi il prodotto **non reca marcatura CE** e non è coperto da alcuna dichiarazione di conformità - stato di fatto, non posizione; (b) chi installa, integra o mette in servizio **assume comunque** gli obblighi che ne derivano, e l'intenzione di certificare **non gli trasferisce nulla**; (c) gli atti che la norma riserva al ruolo di fabbricante restano riservati **anche quando il ruolo sarà nostro**, e la distinzione non va cancellata: è ciò che rende leggibile perché non si possono anticipare; (d) il divieto di `V-171` è intero - **nessuna data, nessuna finestra, nessun «entro»**

### V-07-bis

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

**Forma unica: «catena di impronte», mai «catena di hash».** «Hash» resta ammesso solo dove si nomina **la funzione** («funzione di hash», «hash crittografico»); l'**esito** della funzione è sempre un'«impronta». Il glossario aveva trovato le due forme in uso in misura quasi pari - 36 contro 33 - il che è il modo in cui una divergenza terminologica sopravvive: nessuna delle due sembra minoritaria abbastanza da essere corretta. Normalizzata l'intera documentazione

### V-07-ter

**Da**: ORCH · **A**: `GUIDA`, tutte · **Stato**: VINCOLO

**Esito della revisione incrociata del glossario: dodici segnalazioni, nove reali e tre no.** Corrette: collegamento rotto al modulo 18; «catena di hash» unificata in «catena di impronte» (`V-07-bis`); «compliance digitale del paziente» → «dell'assistito»; «telecontrollo» → «telecontrollo medico» nelle righe di definizione; formulazione canonica di «aggregato» fissata sul modulo 16; tre caratterizzazioni della sicurezza a livello di riga riunite; collisione su «tracciabilità» - accessi contro requisiti - disambiguata nel modulo 12; «errore d'uso» chiarito nel modulo 10, dove poteva leggersi come colpa dell'utente. **Non erano difetti**: (a) «coerenza finale» non esiste nel corpus, è in uso la sola «consistenza finale»; (b) «outbox transazionale» ricorre in quattro tabelle di termini con formulazioni equivalenti - è la **convenzione della guida**, in cui ogni modulo chiude con i propri termini, non un concetto orfano; (c) i rinvii interni del glossario sono tutti risolti, verificato automaticamente. **Registrate come non-problemi perché non vengano riaperte**

### V-07

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

Il contenuto dei documenti per il fascicolo si modella come dataset canonico; le serializzazioni sono sostituibili

### V-08

**Da**: ORCH · **A**: `PROD`, `FUNZ`, `INTEG` · **Stato**: VINCOLO

Le assicurazioni sono **sempre** escluse dall'accesso al FSE (art. 15 c. 4, DM 7 settembre 2023). Il pagatore non è un consultatore

### V-09

**Da**: ORCH · **A**: tutte · **Stato**: VINCOLO

L'assenza di dato è informazione clinica: il silenzio non è mai trattato come normalità

### V-10

**Da**: `GUIDA` · **A**: `SEC`, `TECH` · **Stato**: VINCOLO

Server di relay: versione minima 4.17.2 e isolamento di rete in uscita come difesa **primaria**

### V-11

**Da**: `GUIDA` · **A**: `TECH`, `FUNZ` · **Stato**: VINCOLO

Il contenitore di registrazione va negoziato a runtime, mai assunto

### V-12

**Da**: `GUIDA` · **A**: tutte · **Stato**: VINCOLO

Nessuna soglia tecnica è imposta dalla normativa italiana: i valori del progetto sono specifica di prodotto, mai conformità

### V-120

**Da**: `FUNZ` · **A**: tutte · **Stato**: VINCOLO

**Intervalli di identificativi congelati da FUNZ**: `RF-230`…`RF-352`, `RNF-090`…`RNF-110`, `BR-100`…`BR-185`, `ATT-20`…`ATT-26`, `UC-01`…`UC-24`, `OUT-01`…`OUT-24`, codici di esito `EX-TM-*`. Nessuna area può riassegnarli. Restano liberi `RF-353`+, `RNF-111`+, `BR-186`+ e vanno richiesti qui prima dell'uso

### V-121

**Da**: `FUNZ` · **A**: `ARCH`, `TECH` · **Stato**: VINCOLO

L'allarme è una **sequenza di eventi immutabili**; lo stato corrente è una proiezione. Nessuna colonna di stato aggiornata sul posto, né per l'allarme né per la misura né per il piano

### V-122

**Da**: `FUNZ` · **A**: `ARCH`, `TECH`, `SEC`, `PROD` · **Stato**: VINCOLO

La **copertura oraria del servizio è un dato di runtime versionato** e condiziona la validità del destinatario nella catena di escalation: un destinatario fuori copertura non è un destinatario valido. Non è un parametro commerciale né una clausola contrattuale

### V-123

**Da**: `FUNZ` · **A**: `TECH`, `PROD`, `GUIDA` · **Stato**: VINCOLO

Il **campo soglia parte vuoto e obbligatorio**: nessuna precompilazione, nemmeno con i valori del percorso o dell'ultimo piano. I riferimenti si mostrano attribuiti, in sola lettura, con azione esplicita di copia

### V-124

**Da**: `FUNZ` · **A**: `ARCH`, `INTEG`, `TECH` · **Stato**: VINCOLO

Istante di misura e istante di ricezione sono **due campi distinti obbligatori**; l'identità della misura per l'idempotenza è (sorgente, soggetto, parametro, istante di misura, valore). Le regole operano sull'istante di misura

### V-125

**Da**: `FUNZ` · **A**: `SEC`, `ARCH`, `INTEG` · **Stato**: VINCOLO

La separazione **centro servizi / centro erogatore** è vincolo di autorizzazione, non convenzione organizzativa: chi gestisce gli allarmi tecnici non accede al contenuto clinico e la composizione di un ruolo che violi la separazione è rifiutata con errore di validazione (`BR-166`, `RNF-110`)

### V-126

**Da**: `FUNZ` · **A**: `PROTO`, `TECH`, `INTEG` · **Stato**: VINCOLO

**Gli esiti tipizzati sono valori di dominio, non codici di errore.** `EX-*` ed `EX-TM-*` descrivono **come è andata a finire** una prestazione, un allarme o un'attesa di rilevazione, e sono contenuto informativo che entra nella documentazione, nella rendicontazione e negli indicatori. **Non confluiscono nel catalogo dei tipi di problema** (V-110) né nel catalogo unico dei codici di errore (`V-130`), non sono emessi come errori di protocollo e non compaiono in un corpo di problema. Un esito anomalo è un'operazione **riuscita** che registra un fatto sfavorevole: confonderlo con un errore fa sparire dai registri clinici ciò che deve restarci

### V-160

**Da**: `INTEG` · **A**: tutte · **Stato**: VINCOLO

**Perimetro del contratto pubblico verso terzi.** Sono contratto - e quindi soggetti al processo di dismissione a dodici mesi - solo: percorsi, metodi, parametri e schemi descritti nel documento di interfaccia applicativa; profili FHIR pubblicati e documento di capacità; tipi di evento e relativi schemi di dato; ambiti di autorizzazione documentati; identificatori di tipo di problema e codici di esito; interfacce dei moduli sostituibili; protocollo di messaggistica del componente incorporabile e insieme chiuso delle proprietà di tema. **Tutto il resto è interno e può cambiare senza preavviso.** Nessuna area può ampliare o restringere questo perimetro senza dichiararlo qui

### V-161

**Da**: `INTEG` · **A**: `ARCH`, `FUNZ`, `TECH`, `SEC` · **Stato**: VINCOLO

**Nessun contenuto clinico nei messaggi in uscita verso sistemi terzi.** Gli eventi trasportano identificativi e riferimenti; il contenuto si rilegge con una chiamata autenticata sotto l'autorizzazione del ricevente. Vale per i webhook, per le notifiche FHIR (`id-only` come impostazione predefinita, contenuto integrale disabilitato sui canali verso Internet) e per qualunque canale futuro

### V-162

**Da**: `INTEG` · **A**: `SEC`, `TECH` · **Stato**: VINCOLO

**Firma dei messaggi in uscita: asimmetrica, con identificativo di chiave risolvibile dal materiale pubblico del progetto.** Il segreto condiviso non è offerto come modalità predefinita: non dà non ripudio e la sua rotazione richiede coordinamento con ciascun integratore. I due riferimenti restano distinti: firma dei messaggi HTTP da un lato, impronta del corpo dall'altro

### V-163

**Da**: `INTEG` · **A**: `FUNZ`, `TECH`, `PROD` · **Stato**: VINCOLO

**Limiti invalicabili alla personalizzazione del componente incorporabile.** Indicatore di registrazione in corso, avvisi e testi di consenso, esito della verifica delle chiavi, messaggi di errore clinico e indicatore dello stato di cifratura **non sono tematizzabili né occultabili**. Le proprietà di tema ammesse sono un insieme chiuso e versionato, validate lato server con verifica del contrasto: una configurazione che degrada l'accessibilità **viene rifiutata al salvataggio**, non segnalata come avviso. Nessuna iniezione di fogli di stile arbitrari dall'esterno

### V-164

**Da**: `INTEG` · **A**: tutte · **Stato**: VINCOLO

**Corollario operativo di V3.** Una capacità nuova non è completa finché non è raggiungibile da un sistema terzo tramite interfaccia documentata e versionata. L'area che introduce la capacità introduce anche il contratto: non è lavoro rinviabile all'area di integrazione

### V-165

**Da**: `INTEG` · **A**: `SEC`, `FUNZ`, `COMP` · **Stato**: VINCOLO

**Il livello di garanzia propagato è quello richiesto, non quello asserito**, e va sempre qualificato per distinguere l'autenticazione **eseguita** dal progetto da quella **riferita** da un integratore. Un'operazione che la normativa lega all'autenticazione forte richiede autenticazione eseguita: un livello riferito da terzi non la soddisfa

### V-166

**Da**: `INTEG` · **A**: tutte · **Stato**: VINCOLO

**Corollario applicativo di V-08.** Nessun ambito di autorizzazione, nessun tipo di evento, nessun modulo sostituibile e nessuna configurazione di tenant può costituire un percorso - diretto o mediato da un professionista - con cui un pagatore ottiene contenuto clinico o accesso al fascicolo. Il profilo di integrazione del pagatore è **amministrativo per costruzione**: identificativo della prestazione, esito amministrativo, importo

### V-110

**Da**: `TECH` · **A**: tutte · **Stato**: VINCOLO

**Due sole rappresentazioni dell'errore su interfaccia pubblica**: `application/problem+json` (RFC 9457) sul piano applicativo, `OperationOutcome` sul piano di interoperabilità. Nessuna terza forma. Il campo descrittivo **non contiene mai contenuto clinico né identificativi diretti**: finisce nei registri del chiamante. Il catalogo dei tipi di problema è **generato** da un file versionato e un errore non catalogato non può essere emesso

### V-111

**Da**: `TECH` · **A**: `ARCH`, `FUNZ`, `ROAD`, `COMP` · **Stato**: VINCOLO

**Espandi e contrai su ogni migrazione dello schema.** Nessun rilascio è insieme distruttivo e funzionale; **due versioni consecutive dell'applicazione devono poter convivere sulla stessa base dati**. È la condizione necessaria all'aggiornamento senza interruzione e al ritorno a una versione precedente. Una funzionalità che richieda una migrazione distruttiva nello stesso rilascio va riprogettata, non autorizzata in deroga

### V-112

**Da**: `TECH` · **A**: `SEC`, `ARCH`, `FUNZ` · **Stato**: VINCOLO

**Il contesto di tenant si imposta dentro la transazione, prima di qualunque interrogazione**, con `SET LOCAL` e non con `SET`; in sua assenza le politiche di sicurezza a livello di riga **negano tutto**. Le tabelle hanno l'applicazione forzata della politica anche per il proprietario, e il ruolo applicativo non è proprietario degli oggetti. Nessun accesso ai dati fuori da una transazione con tenant risolto

### V-113

**Da**: `TECH` · **A**: tutte · **Stato**: VINCOLO

**Nessun contatore cumulativo grezzo può essere citato come indicatore di qualità.** Perdita, byte, durata dei congelamenti e ritardo del buffer di jitter crescono in modo monotono e vanno **differenziati fra campioni consecutivi**; le medie corrette sono rapporti fra differenze. Vale per documentazione, cruscotti, materiale commerciale e interfacce

### V-114

**Da**: `TECH` · **A**: `PROD`, `FUNZ`, `COMP` · **Stato**: VINCOLO

**L'indice di qualità della sessione è proprietario e va dichiarato tale.** Non è un punteggio di opinione media secondo alcuna raccomandazione internazionale: i modelli classici sono di **pianificazione** di reti a banda stretta, i fattori per la codifica audio moderna non sono standardizzati e per il video non esiste nulla di applicabile al tempo reale. La formula è pubblicata; usa il **minimo** fra le dimensioni, non la media

### V-115

**Da**: `TECH` · **A**: `FUNZ`, `PROD`, `INTEG` · **Stato**: VINCOLO

**Applicazione di V-11 anche alla registrazione lato server.** Il contenitore dipende dai **codec effettivamente negoziati** nella sessione: il componente di registrazione lo sceglie a runtime senza ricodifica e **registra contenitore e codec effettivi nei metadati**. L'affermazione pubblica è «contenitore standard scelto in funzione dei codec negoziati e registrato nei metadati, cifrato a riposo». **Nessun formato unico può essere dichiarato**, in nessun materiale

### V-140

**Da**: `DOM` · **A**: tutte · **Stato**: VINCOLO

**Ogni prestazione è la propria macchina a stati**, selezionata dal tipo. Attori ammessi, obbligo di presenza dell'assistito, asincronia, artefatti obbligatori, esiti ammessi, registrabilità e finestre sono **attributi del catalogo delle prestazioni**, non condizioni sparse nel codice (`DM-10`, `DM-11`). Aggiungere una prestazione è una riga di catalogo più una macchina a stati

### V-141

**Da**: `DOM` · **A**: tutte · **Stato**: VINCOLO

**Stato ed esito del contatto sono attributi distinti.** Lo stato dice dove si trova il contatto, l'esito che cosa è successo. `EX-NOSHOW` ed `EX-TECH-PATIENT` condividono lo stato terminale e hanno effetti amministrativi **opposti**: nessuna area può collassarli in un unico campo

### V-142

**Da**: `DOM` · **A**: `ARCH`, `TECH`, `INTEG`, `PROTO` · **Stato**: VINCOLO

**La normalizzazione degli identificatori avviene al confine, mai nel dominio** (`DM-31`). Il dominio conosce un identificativo canonico interno e una collezione di identificatori esterni qualificati da dominio di attribuzione. Nessun identificatore esterno è chiave primaria. Contributo a Q-06, che resta di `ARCH`

### V-143

**Da**: `DOM` · **A**: tutte · **Stato**: VINCOLO

**Il referto di televisita ha una tipologia documentale propria del fascicolo** (DM 19 novembre 2025, art. 7, lett. p, e All. 1 § 2.20). L'ipotesi «referto di specialistica ambulatoriale» è **errata** e non va usata in alcun documento, esempio, profilo o materiale pubblico

### V-144

**Da**: `DOM` · **A**: tutte · **Stato**: VINCOLO

**Il modello del telemonitoraggio è scritto sulla formulazione «raccolta differita di parametri per la revisione periodica del professionista»** (`D46`). Nessun artefatto - documentazione, interfaccia, materiale pubblico, nome di classe o di evento - può usare «monitoraggio in tempo reale», «sorveglianza continua» o formule equivalenti

### V-145

**Da**: `DOM` · **A**: `FUNZ`, `INTEG`, `COMP`, `PROD` · **Stato**: VINCOLO

**Il setting di erogazione discrimina regole.** La televisita programmata ed erogata da medico di assistenza primaria o pediatra **non richiede prescrizione** e produce **annotazione digitale in luogo del referto** (DM 30 settembre 2022, All. B; `REQ-59` di `B1`). L'obbligo di referto non è incondizionato e non va cablato come tale

### V-146

**Da**: `DOM` · **A**: `SEC`, `FUNZ`, `INTEG` · **Stato**: VINCOLO

**Cinque oggetti di consenso distinti**, con cicli di vita indipendenti: atto sanitario, trattamento dei dati ove applicabile, registrazione, presenza di terzi, trasmissione a sistemi esterni. La revoca di uno non tocca gli altri. Nessun «consenso alla piattaforma» esiste nel modello

### V-147

**Da**: `DOM` · **A**: `ARCH`, `TECH`, `FUNZ` · **Stato**: VINCOLO

**Nessun percorso di cura nel codice.** Aggiungere un percorso deve richiedere solo: redazione della definizione, validazione al caricamento, pubblicazione con versione e ambito, modelli di documento e consenso associati, configurazione della copertura. **Mai un rilascio del software né una migrazione di schema** (`DM-92`, `DM-93`)

### V-148

**Da**: `DOM` · **A**: tutte · **Stato**: VINCOLO

**L'attesa di rilevazione è un'entità.** L'assenza di misura è una riga che dichiara l'assenza - con finestra attesa, istante di scadenza e causa quando nota - non l'assenza di una riga. È la forma operativa di `V-09` e la condizione perché l'aderenza sia una grandezza definita (`DM-57`)

### V-149

**Da**: `DOM` · **A**: `ARCH`, `SEC`, `TECH` · **Stato**: VINCOLO

**L'oscuramento è applicato dal motore di autorizzazione, non dai consumatori**: un unico punto filtra e calcola i totali sull'insieme filtrato. Sei canali di inferenza vanno chiusi tutti (numerazione, conteggi, paginazione, notifiche, differenze fra interrogazioni, messaggi d'errore). **I dati sintetici di collaudo devono comprendere documenti oscurati**, altrimenti nessuna prova esercita il percorso (`DM-73`)

### V-150

**Da**: `SEC` · **A**: tutte · **Stato**: VINCOLO

Il registro immutabile e i log applicativi **non contengono contenuto clinico**; i log di diagnostica non portano identificativi diretti dell'assistito

### V-151

**Da**: `SEC` · **A**: `TECH`, `ARCH`, `DOM` · **Stato**: VINCOLO

Il terminology server esterno **non riceve identificativi dell'assistito**; nessuna cache persistita su disco

### V-152

**Da**: `SEC` · **A**: tutte · **Stato**: VINCOLO

Conservazione: **24 mesi** per i log di tracciabilità, **12 mesi** per i dati di accesso e autenticazione (DM 19 novembre 2025, Allegato 4)

### V-153

**Da**: `SEC` · **A**: `FUNZ`, `TECH` · **Stato**: VINCOLO

L'**accesso d'emergenza è requisito funzionale**: motivazione libera obbligatoria, finestra e perimetro limitati, notifica, riesame con esito registrato

### V-154

**Da**: `SEC` · **A**: `INTEG` · **Stato**: VINCOLO

Un livello di autenticazione **riferito da un integratore** va marcato come tale e **non** soddisfa i requisiti di autenticazione forte ex art. 64 CAD

### V-155

**Da**: `SEC` · **A**: `TECH`, `ROAD` · **Stato**: VINCOLO

Nessuna metrica infrastrutturale del relay può essere etichettata con l'identificativo di sessione

### V-156

**Da**: `SEC` · **A**: `TECH`, `PROD`, `COMP` · **Stato**: VINCOLO

**Il progetto non dichiara versioni di protocollo né suite crittografiche negoziate: le misura per sessione e le registra.** La negoziazione avviene fra due estremi che il progetto non controlla; qualunque affermazione statica sarebbe falsa per una parte del parco installato. Il valore effettivamente negoziato è letto dalle statistiche della connessione, conservato fra i metadati della sessione ed esportabile; un valore sotto la soglia minima configurata per tenant produce un evento. Vale anche per il contenitore di registrazione (V-11) e per il trasporto delle interfacce applicative

### V-157

**Da**: `SEC` · **A**: `ARCH`, `TECH`, `INTEG` · **Stato**: VINCOLO

**Mediatore unico di uscita.** Nessun componente applicativo apre connessioni verso destinazioni derivate da un dato in ingresso: solo il mediatore ha rotta verso l'esterno, agli altri l'uscita è **negata a livello di rete**. È requisito architetturale, non regola di codifica, perché la difesa non deve dipendere dalla correttezza del codice. Il mediatore applica **nell'ordine**: risoluzione del nome una sola volta con connessione all'indirizzo già risolto; verifica dell'indirizzo risolto con confronto normalizzato e intervalli allineati a prefisso; divieto di seguire redirezioni non ri-verificate; elenchi chiusi di schemi, porte, dimensioni, tempi e salti. Vi confluiscono **cinque** punti di uscita: gateway terminologico, interoperabilità verso infrastrutture nazionali e regionali, webhook verso l'integratore, risoluzione di riferimenti assoluti nelle risorse, recupero di metadata e materiale di chiavi. **Il relay non vi confluisce e non deve**: per esso vale V-10. **Una sola suite di prove di abuso**, eseguita contro il mediatore

### V-130

**Da**: `PROTO` · **A**: tutte · **Stato**: VINCOLO

**Catalogo unico dei codici di errore**, generato e condiviso fra piano clinico e piano applicativo: lo stesso concetto porta lo stesso codice nell'esito di operazione e nel corpo di problema. **Un codice non catalogato non può essere emesso**: la catena di costruzione lo verifica

### V-131

**Da**: `PROTO` · **A**: `ARCH`, `TECH` · **Stato**: VINCOLO

**RFC 8838 §9**: il protocollo che trasporta i candidati deve consegnarli *«exactly once and in the same order it was conveyed»*. Una diffusione «pubblica e dimentica» fra nodi **non lo garantisce**, e il difetto che ne deriva è intermittente e dipendente dal carico. La distribuzione dello stato di sessione è vincolata da questa riga

### V-132

**Da**: `PROTO` · **A**: tutte · **Stato**: VINCOLO

Quando l'identità proviene da un emittente esterno si usa **sempre la delega, mai l'impersonificazione**: nessuna configurazione supportata emette un token privo del claim dell'attore (RFC 8693 §4.1). Criterio di rilascio bloccante, insieme all'isolamento fra tenant

### V-133

**Da**: `PROTO` · **A**: tutte · **Stato**: VINCOLO

**Formule di conformità vietate**: «conforme» alle mappe da messaggi a risorse (tutte *Informative*); «standard» per l'intestazione di idempotenza (bozza **scaduta e archiviata**) e per quelle di limitazione del traffico (bozza **attiva**, e la forma a tre campi non è **mai** stata standard); «conforme alla guida italiana» senza la versione (0.2.0, *trial-use draft*); «certificato» su una revisione in commento pubblico; «cifrato fino agli estremi» senza la condizione della modalità senza registrazione. Elenco completo e formule ammesse in [`docs/04_protocols/10-conformita-e-prove.md`](../04_protocols/10-conformita-e-prove.md) §2

### V-134

**Da**: `PROTO` · **A**: `ARCH`, `TECH`, `INTEG` · **Stato**: VINCOLO

Nella busta degli eventi in modalità binaria l'intestazione con prefisso per il **tipo di contenuto** è **vietata**: è un obbligo negativo esplicito della specifica. Il tipo di contenuto va **solo** nell'intestazione ordinaria. Codificato come prova negativa che fallisce se l'intestazione compare

### V-135

**Da**: `PROTO` · **A**: `INTEG`, `FUNZ`, `SEC` · **Stato**: VINCOLO

Il carico degli eventi pubblici trasporta **riferimenti, mai contenuto clinico**: il ricevente recupera il contenuto con una chiamata autenticata. Vale anche per il canale clinico, dove il livello «solo identificativo» è predefinito e «risorsa completa» è **disattivato** verso la rete pubblica

### V-136

**Da**: `PROTO` · **A**: `ARCH`, `TECH`, `COMP` · **Stato**: VINCOLO

**Nessun template documentale è cablato.** I template della serializzazione strutturata, i codici di tipologia e i metadati di indicizzazione delle dieci tipologie della telemedicina non sono pubblicamente disponibili (Q-07): l'adattatore esiste come punto di estensione con contratto dichiarato, l'implementazione è rinviata. È applicazione letterale di **V-07**

### V-137

**Da**: `PROTO` · **A**: `ARCH`, `SEC` · **Stato**: VINCOLO

**Chiave di sessione e indirizzo della stanza non sono metadati: sono credenziali.** Non vengono persistiti in risorse interrogabili né veicolati in campi di messaggi che transitano per sistemi terzi. Si ottengono con chiamata autenticata, sono monouso e a vita brevissima

### V-190

**Da**: `GUIDA` · **A**: tutte · **Stato**: VINCOLO

**L'ambiente di sviluppo deve poter essere avviato su una macchina disconnessa da tutto**: nessun account, nessuna chiave di un fornitore, nessun servizio remoto obbligatorio. È il corollario operativo del criterio C7 di [`docs/01_technical/01-stack-e-motivazioni.md`](../01_technical/01-stack-e-motivazioni.md) §2 e del divieto trasversale sui dati reali: un ambiente che per funzionare richiede un servizio di terzi è un ambiente che **impone dati di prova sul sistema di qualcun altro**, e nessuno se ne accorge. Una procedura di avvio documentata che richieda una registrazione presso un fornitore è un difetto, non una configurazione. Documentato in [`docs/10_fondamenti/17-ambiente-di-sviluppo.md`](../10_fondamenti/17-ambiente-di-sviluppo.md) §1.1

### V-191

**Da**: `GUIDA` · **A**: tutte · **Stato**: VINCOLO

**Nessuna procedura documentata può contenere l'aggiramento di un controllo obbligatorio.** I controlli G1-G13 sono **condizioni di ammissibilità**, non giudizi di qualità: aggirarne uno produce un artefatto che non avrebbe potuto essere prodotto e che porta con sé una dichiarazione falsa, con la pipeline verde e la proprietà insussistente. Se un controllo blocca legittimamente uno sviluppo legittimo, **si corregge il controllo con la procedura di revisione prevista**, non lo si disattiva per la propria proposta. Vale in particolare per la lista di ammissione del controllo terminologico, la cui modifica richiede la revisione prevista per il materiale di conformità. `17-ambiente-di-sviluppo.md` §9.4

### V-195

**Da**: `GUIDA` · **A**: tutte · **Stato**: VINCOLO

**Nessuna area introduce nella documentazione una fonte primaria nuova senza inserirla in [`docs/10_fondamenti/20-fonti-primarie.md`](../10_fondamenti/20-fonti-primarie.md)** con denominazione ed estremi completi, oggetto in una frase, luogo di reperimento, documenti che la usano e **data alla quale è stata verificata**. Non è un adempimento redazionale: è la sola condizione che rende possibile, quando una norma è abrogata o sostituita o una norma tecnica esce dall'elenco delle armonizzate, **sapere in un solo passaggio quali documenti ne dipendono**. Un inventario di fonti si degrada in un modo solo - una fonte entra in un capitolo e non entra nell'inventario - e da quel momento è incompleto senza che nessuno se ne accorga. `20-fonti-primarie.md` §§1, 13. Il meccanismo di registrazione della data è `Q-199`

### V-180

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO

**EMENDATO DA `D57` e `D58`. La regola resta, la sua ragione cambia.** **Nessun documento del progetto dichiara una data per un traguardo il cui esito non dipende da noi.** Prima la ragione era che quei traguardi appartenevano a un terzo; ora appartengono a noi, e la ragione è un'altra e più stringente: **un'intenzione non è una promessa datata**, e una data pubblicata produce un effetto regolatorio che l'intenzione non produce - la destinazione d'uso si ricava anche dal materiale pubblicato (art. 2, punto 12, e art. 7 del Regolamento (UE) 2017/745). Ricadono nella regola **senza eccezioni**: la marcatura CE, l'accreditamento presso la federazione nazionale delle identità (`D36`, `V-05`, `OUT-22`), il termine di adeguamento alle misure nazionali di sicurezza (`D39`), la disponibilità dei modelli documentali delle tipologie del fascicolo (`Q-07`). Di ciascuno si dichiarano **le condizioni** e **ciò che il progetto fornisce**; mai la data. **Il calendario interno esiste e resta interno**: pianificare una data e pubblicarla come impegno sono due atti distinti. [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §3

### V-181

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO

**Ogni traguardo ha un criterio di completamento binario, verificabile da un terzo** che non ha partecipato al lavoro. Una percentuale di avanzamento non è un criterio. Un traguardo con dieci criteri e nove soddisfatti è un traguardo **non raggiunto**, e il rapporto dice quale criterio manca

### V-182

**Da**: `ROAD` · **A**: `TECH`, `COMP` · **Stato**: VINCOLO

**Nessuna riga di codice applicativo precede la catena di costruzione** che genera la distinta dei materiali e il registro degli identificativi di requisito. Non «accompagna»: precede. Unica eccezione ammessa, il codice usa-e-getta delle verifiche empiriche, che è dichiarato tale, vive in un'area separata e **non entra in alcun artefatto distribuito**

### V-183

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO

Il rilascio del corpo documentale è per **area completa e in due lingue**, mai per file. Applicazione di `D50` e `D52`: nessuna area è chiusa finché non è navigabile online nelle due lingue. **EMENDATO da `D56`**: l'obbligo delle due lingue come condizione di chiusura resta per le **aree prerequisito** - avvertenze pubbliche, guida dei fondamenti, conformità, sicurezza - dove il controllo di divergenza **blocca**; per il resto del corpus il controllo **segnala**, con rapporto pubblicato a ogni costruzione, e la parte non tradotta è **visibile e misurata** invece che implicita. Il rilascio resta **per area completa, mai per file**

### V-184

**Da**: `ROAD` · **A**: `PROD`, `COMP`, `INTEG` · **Stato**: VINCOLO

Nessun materiale del progetto - documentazione, sito, risposta a gara, nota di rilascio, comunicazione pubblica - può presentare una voce `[INTENZIONE]` o `[IPOTESI]` come se fosse `[IMPEGNO]`. È la forma più comune di danno reputazionale in un progetto tecnico, e si commette in buona fede

### V-185

**Da**: `ROAD` · **A**: `TECH`, `SEC`, `COMP` · **Stato**: VINCOLO

**Il livello di servizio di aggiornamento dei componenti di terze parti si esprime in giorni dalla pubblicazione dell'avviso, differenziato per gravità, e si misura.** Un impegno espresso in mesi non è pianificabile e non viene accettato: con la cadenza osservata sul nodo di relay - quattordici rilasci in poco più di sette mesi - è già scaduto quando viene pubblicato. Conseguenza di pianificazione: la capacità necessaria a onorarlo è **capacità ricorrente** e va sottratta prima di calcolare qualunque data

### V-186

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO

**La conformità alle misure nazionali di sicurezza non ha una data di prodotto.** Il prodotto dichiara le **evidenze** e la data di disponibilità di ciascuna; il termine del soggetto obbligato è determinato dalla comunicazione di inserimento **da lui ricevuta** e non è determinabile dal fornitore (`D39`). Formulazione ammessa in [`docs/09_roadmap/00-indice.md`](../09_roadmap/00-indice.md) §9.1

### V-187

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO

**Pianificato contro desiderabile.** Una voce della coda successiva al primo rilascio non è **pianificata** se non ha insieme criterio di completamento binario, innesco dichiarato e titolare nominato. In assenza anche di uno solo dei tre è **desiderabile**, e va marcata tale in ogni materiale del progetto, comprese le risposte a capitolato

### V-188

**Da**: `ROAD` · **A**: `TECH`, `INTEG`, `ARCH` · **Stato**: VINCOLO

**La suite di prove di integrazione esercita sempre almeno due tenant e due integratori distinti**, con configurazioni deliberatamente divergenti: domini di attribuzione degli identificatori diversi, profili di uscita diversi, modalità di recapito degli eventi diverse, insiemi di moduli sostituiti diversi. Una prova che passa con un solo integratore configurato non dimostra la proprietà multi-integratore. È la forma verificabile della difesa contro la dipendenza strutturale da un solo interlocutore

### V-189

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO

**Ogni rischio di programma ha un indicatore anticipatore osservabile e un titolare nominato.** Un rischio che si riconosce solo quando è accaduto è un incidente; un rischio di tutti è un rischio di nessuno. Una voce priva di uno dei due va riformulata o chiusa

### V-192

**Da**: `GUIDA` · **A**: `ARCH`, `TECH`, `FUNZ` · **Stato**: VINCOLO

**Marcatore di sinteticità persistito nel dato.** Ogni record prodotto dal generatore porta un attributo esplicito di sinteticità **conservato insieme al dato**, non soltanto noto al generatore. È ciò che trasforma la domanda «questo ambiente contiene dati reali?» da un'indagine a **una interrogazione**, e che rende verificabile la separazione fra ambienti di `09-integrazione-continua-e-rilascio.md` §9 e la regola «mai esportazioni di produzione» di `08-qualita-e-test.md` §4.1. Deriva da [`docs/10_fondamenti/03-il-dato-clinico.md`](../10_fondamenti/03-il-dato-clinico.md) §10.4 e va recepito nel **modello dati**, non lasciato alla sola fabbrica di prova

### V-193

**Da**: `GUIDA` · **A**: `ARCH`, `TECH`, `FUNZ` · **Stato**: VINCOLO

**Ogni parametro configurabile dichiara a quale dei quattro piani appartiene**: deciso nel codice · configurazione di installazione · configurazione di tenant · configurazione per assistito. La classificazione è **un dato verificabile, non una convenzione documentale**, ed è il corollario operativo del principio «la configurazione non rimuove un'invariante» ([`docs/02_architecture/01-visione-architetturale.md`](../02_architecture/01-visione-architetturale.md) §5, P5) e di `V-02`. Conseguenza che il modulo 16 §9.3 rende esplicita e che va tenuta ferma: **le soglie cliniche non sono configurazione di tenant**, che può fissarne solo i limiti; un parametro clinico che compaia nel piano «configurazione di tenant» è un difetto di perimetro, non una comodità. Senza la classificazione, la domanda «questo comportamento è deciso o configurato?» viene risolta caso per caso da chi implementa, e la risposta cambia da modulo a modulo. [`docs/10_fondamenti/16-architettura-del-progetto.md`](../10_fondamenti/16-architettura-del-progetto.md) §9

### V-194

**Da**: `GUIDA` · **A**: `ARCH`, `TECH`, `PROD` · **Stato**: VINCOLO

**Il modulo dei fondamenti non è fonte architetturale: introduce.** [`docs/10_fondamenti/16-architettura-del-progetto.md`](../10_fondamenti/16-architettura-del-progetto.md) costruisce l'intuizione e ricostruisce il ragionamento; la **fonte** resta `docs/02_architecture/` e il registro `docs/adr/`. Tre conseguenze operative, simmetriche a `V-200` per la panoramica: (a) quando l'area architetturale cambia si riallinea il modulo 16, **mai il contrario**; (b) una divergenza si risolve **sempre** a favore dell'area, e chi la rileva la porta qui invece di correggerla d'ufficio; (c) **nessuna affermazione architetturale sostanziale può esistere soltanto nel modulo 16** - se ve ne compare una, è l'area architetturale a doverla assorbire, con l'ADR corrispondente. Vale in particolare per le decisioni ricostruite in §10, che sono **riletture** degli ADR e non loro sostituti

### V-170

**Da**: `COMP` · **A**: tutte · **Stato**: VINCOLO

**Il controllo delle modifiche è una misura di conformità, non una prassi di progetto.** Una proposta che introduca una delle funzioni dell'elenco chiuso fuori perimetro - soglia proposta dal sistema, evidenziazione su intervalli non configurati dal professionista, ordinamento per gravità, interpolazione dei buchi, indici sintetici, miglioramento d'immagine, misurazione su immagine, codifica automatica, sintesi automatica, rilevazione biometrica, dichiarazione di compatibilità con un apparecchio nominato, traduzione automatica di contenuto clinico - **non si valuta nel merito tecnico: si rifiuta per politica di perimetro**, con motivazione regolatoria scritta. Vale anche per l'introduzione di un componente di intelligenza artificiale, che è un cambio di regime normativo e non una scelta tecnica. Elenco e presidio in [`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md) §§6, 10. **Le stesse esclusioni tengono insieme la classe di rischio a IIa e la classe di sicurezza del software a B: cadono insieme e il costo si somma**

### V-171

**Da**: `COMP` · **A**: tutte, in particolare `PROD`, `GUIDA` · **Stato**: VINCOLO

**Formule vietate in ogni artefatto pubblico**, sullo stesso fondamento di `V-133` esteso al piano regolatorio: l'art. 7 e l'art. 2, punto 12, del Regolamento (UE) 2017/745 fanno del materiale promozionale materiale regolatorio, e il divieto di dichiarazioni fuorvianti **non presuppone la marcatura**. Nessun testo del progetto - pagina, `README`, titolo di sezione, descrizione di interfaccia, messaggio di errore, annuncio - può affermare o lasciare intendere una conformità, una marcatura o una certificazione inesistenti. Tabella delle formule vietate e delle formule ammesse in [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md) §11. La verifica **non è documentale ma di processo**: si salda con `Q-174`

### V-172

**Da**: `COMP` · **A**: tutte · **Stato**: VINCOLO

**Spazio riservato degli identificativi dei documenti regolatori**: `MDR-*`, `QMS-*`, `SW-*`, `RM-*`, `UE-*`/`UEF-*`, `CE-*`/`PMCF-*`, `PMS-*`/`PSUR-*`/`VIG-*`, `ON-*`. Nessuna area può coniare un identificativo in questi prefissi senza dichiararlo qui. Regola di disambiguazione già in vigore: **i documenti regolatori di sicurezza portano sempre un sotto-prefisso alfabetico** (`SEC-LC-*`, `SEC-TM-*`, …); la forma `SEC-` seguita da sole cifre è riservata ai requisiti e non va mai usata per un documento. [`docs/08_compliance/03-sistema-di-gestione-della-qualita.md`](../08_compliance/03-sistema-di-gestione-della-qualita.md) §5

### V-173

**Da**: `COMP` · **A**: `TECH`, `ARCH`, `ROAD` · **Stato**: VINCOLO

**Nessuna etichetta di versione mobile**, su nessuna dipendenza, immagine di base o strumento della catena di costruzione. Non è preferenza operativa: la clausola 8.1.2 di IEC 62304 richiede che ogni elemento di configurazione sia identificato per titolo, produttore e **versione**, e un'etichetta mobile identifica una versione diversa a ogni costruzione, rende non riproducibile l'artefatto, impedisce la valutazione dell'impatto dell'aggiornamento e **rende falsa la distinta dei materiali del rilascio precedente**. L'aggiornamento è **un atto**, con data, motivazione e valutazione. Bloccante nella catena di costruzione. [`docs/08_compliance/03-sistema-di-gestione-della-qualita.md`](../08_compliance/03-sistema-di-gestione-della-qualita.md) §9.3

### V-174

**Da**: `COMP` · **A**: tutte · **Stato**: VINCOLO

**La documentazione pubblicata non è documentazione controllata.** Nessun capitolo di `docs/` è una procedura del sistema di gestione della qualità né un documento del fascicolo tecnico, e nessuna area può presentarlo come tale: i capitoli sono **ingressi**, contengono l'analisi da cui un documento controllato si scrive. Conseguenza operativa dichiarata in [`docs/08_compliance/04-fascicolo-tecnico.md`](../08_compliance/04-fascicolo-tecnico.md) §7: nella matrice dei requisiti generali il progetto può compilare tutto **tranne** la colonna «identificazione precisa dei documenti controllati», che presuppone un sistema di controllo dei documenti di un fabbricante. È il punto di giunzione dell'intero modello di `D49`. **Nota `D58`**: il vincolo **non si attenua**. Cambia soltanto a chi tocca istituire il controllo dei documenti - a noi - e la ragione per cui la documentazione non è controllata non è più l'assenza del soggetto ma **l'assenza del sistema**: [`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md) §5.2

### V-175

**Da**: `COMP` · **A**: `FUNZ`, `PROD`, `INTEG`, `TECH` · **Stato**: VINCOLO

**Collegamento bidirezionale fra usabilità e accessibilità.** Il fascicolo di ingegneria dell'usabilità dichiara, per ogni **caratteristica dell'interfaccia legata alla sicurezza**, quali criteri di accessibilità la rendono percepibile e azionabile; il rapporto di conformità all'accessibilità dichiara, per ogni criterio verificato su quelle caratteristiche, **che è anche misura di controllo del rischio**. Conseguenza operativa e verificabile meccanicamente: **l'elenco delle caratteristiche legate alla sicurezza e l'elenco dei criteri oggetto di non conformità dichiarata hanno intersezione vuota**. Un criterio di accessibilità che copre una funzione legata alla sicurezza **non è una non conformità dichiarabile: è un rischio d'uso non controllato**. Serve a impedire che un adempimento di accessibilità assorba un difetto di sicurezza. [`docs/08_compliance/06-usabilita-e-accessibilita.md`](../08_compliance/06-usabilita-e-accessibilita.md) §6.3

### V-176

**Da**: `COMP` · **A**: `TECH`, `ARCH`, tutte le aree con prove in integrazione continua · **Stato**: VINCOLO

**Evidenza citabile.** Ogni esito di prova destinato a essere citato come evidenza - clinica o tecnica - va prodotto in **forma citabile** e conservato come **artefatto immutabile**: versione esatta del software, ambiente dichiarato, data e ora, esecutore, esito, impronta di integrità. **Un rapporto rigenerabile ma non conservato non è evidenza**: al momento della citazione l'ambiente è cambiato e chi chiede di vedere l'esito citato ne riceve un altro. È requisito distinto e più stringente della ricostruibilità richiesta da IEC 62304, perché il destinatario è esterno. `07-valutazione-clinica.md` §3.1

### V-177

**Da**: `COMP` · **A**: `ARCH`, `FUNZ`, `DOM`, `TECH` · **Stato**: VINCOLO

**Le grandezze del seguito clinico si progettano prima del piano che le promette.** Ciò che il piano di seguito clinico post-commercializzazione si impegna a raccogliere deve **esistere come dato**, con definizione stabile, versionata e confrontabile fra installazioni e nel tempo, **prima** che il piano sia scritto: progettare la strumentazione dopo significa scoprire che il dato non c'è, e il periodo trascorso non si recupera. La definizione di ciascuna grandezza è versionata - cambiarla senza cambiarne il nome rende la serie storica incomparabile e vanifica il seguito **senza che nessuno se ne accorga**. Nessuna di queste grandezze contiene contenuto clinico (`V-150`), ed è una condizione, non una coincidenza. `07-valutazione-clinica.md` §7.1

### V-178

**Da**: `COMP` · **A**: `TECH`, `SEC`, `ARCH`, `FUNZ` · **Stato**: VINCOLO

**Due capacità senza cui l'obbligo di vigilanza non è materialmente soddisfacibile.** **(a) Tassonomia stabile degli eventi contati**: gli eventi non gravi vanno contati in modo confrontabile fra installazioni e nel tempo; rinominare o accorpare una categoria rende la serie incomparabile e **fa sparire l'aumento significativo invece di rilevarlo**. **(b) Conservazione dei segnali di diagnostica pari almeno alla finestra entro cui una segnalazione può arrivare**: il termine è **determinato dagli obblighi di vigilanza, non dal fabbisogno operativo**, ed è distinto dai termini di `V-152`, che rispondono ad altra fonte. Proposta motivata: **dodici mesi configurabili** per i segnali riferibili a una prestazione o a un allarme, con determinazione finale del fabbricante perché dipende dal termine contrattuale imposto agli utilizzatori. `[NV]` sul valore: nessuna fonte fissa un termine per la diagnostica. **Chiude Q-116.** `08-sorveglianza-post-commercializzazione.md` §5.2

### V-179

**Da**: `COMP` · **A**: tutte · **Stato**: VINCOLO

**EMENDATO DA `D58` nel destinatario, non nella sostanza.** «Sistema qualità di chi certifica» si legge ora **sistema di gestione della qualità del fabbricante**, ruolo che il progetto **intende** assumere e il cui soggetto **è ancora da costituire**; il fabbricante può essere anche un integratore sulla propria distribuzione. **Gli artefatti del progetto vi entrano come ingressi identificati, mai come documenti controllati.** Chi li acquisisce li **riemette sotto il proprio controllo documentale**, con proprio identificativo, revisione e approvazione. Perché la riemissione sia possibile e tracciabile, ogni artefatto destinato al pacchetto regolatorio porta **versione, data e impronta di integrità verificabile**, risolvibile a partire dal materiale pubblico del progetto. Un artefatto acquisito senza queste tre proprietà **non è giustificabile in sede di audit**, perché il fabbricante non può dimostrare che cosa abbia acquisito e quando. È il complemento operativo di `V-174`: quello dice che questi capitoli **non sono** procedure, questo dice che cosa serve perché possano diventare l'ingresso di una procedura altrui. `09-percorso-e-calendario.md` §7.2

### V-270

**Da**: `COMP` · **A**: tutte · **Stato**: VINCOLO

**Registro obbligatorio per nominare il ruolo di fabbricante e l'intenzione di certificare** (attua `D57`, `D58` e `V-06` emendato). **L'espressione «chi certifica» come soggetto terzo è vietata in ogni artefatto.** Al suo posto, secondo il contesto: **«il progetto nel ruolo di fabbricante»** dove si parla di chi intende intraprendere il percorso; **«il fabbricante»** dove si parla di un atto che la norma riserva a quel ruolo formale a prescindere da chi lo eserciti - apporre la marcatura, firmare la dichiarazione, comporre il fascicolo, nominare il responsabile del rispetto della normativa: **atti che restano riservati anche quando il ruolo sarà nostro**, e la distinzione non va cancellata perché è ciò che rende leggibile perché non si possono anticipare; **«il soggetto fabbricante, da costituire»** dove il passo presuppone l'esistenza giuridica che oggi manca; **«chi installa»** o **«chi integra»** dove il testo si riferisce a loro. **Quattro regole di forma, non negoziabili**: (a) l'intenzione si esprime con il verbo **«intende»**, mai con un futuro indicativo; (b) **l'assenza del soggetto giuridico si ripete nella stessa frase** in cui l'intenzione compare, mai in nota; (c) **lo stato di fatto negativo sta in prima posizione**, in grassetto, prima di qualunque menzione del percorso - nessuna marcatura CE, nessuna dichiarazione di conformità; (d) **nessuna data, nessuna finestra, nessun «entro»**, e l'unica occorrenza ammessa di quella parola è dentro l'enunciato del divieto. Istituito in [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md) §11, dichiarato in [`docs/08_compliance/00-indice.md`](../08_compliance/00-indice.md) §1.1

### V-271

**Da**: `COMP` · **A**: tutte, in particolare `PROD`, `GUIDA`, `ROAD` · **Stato**: VINCOLO

**Il varco «stanno certificando, allora posso usarlo» va chiuso per iscritto ovunque l'intenzione di certificare compaia.** Non basta non affermare la marcatura: l'intenzione dichiarata è essa stessa un elemento da cui un lettore ricava una conclusione operativa, e la conclusione è **sbagliata**. Ogni artefatto che nomina il percorso deve dire, nello stesso luogo, che **l'intenzione non copre nessuno, non trasferisce alcun obbligo e non rende utilizzabile una versione non certificata**: chi installa, integra o mette in servizio assume per intero gli obblighi che ne derivano. Corollario tecnico da `DISTRIBUTION-POLICY.md`: **ricostruire i sorgenti non riproduce il dispositivo** - ciò che fa di un artefatto *quel* dispositivo è la catena di costruzione controllata e il rilascio sotto il sistema di gestione della qualità del fabbricante - e senza dirlo la distinzione fra repository e distribuzione si legge come formalità di denominazione. [`docs/08_compliance/04-fascicolo-tecnico.md`](../08_compliance/04-fascicolo-tecnico.md) §12.1

### V-272

**Da**: `COMP` · **A**: tutte · **Stato**: VINCOLO

**La traccia di destinazione d'uso non è una dichiarazione, e la ragione è cambiata: dirla per esteso è obbligatorio.** Non è più «manca il soggetto che dichiara» - `D58` ha smentito quella formulazione - ma **manca il sistema di controllo documentale che rende una dichiarazione tale**: senza approvazione prima dell'emissione, riesame e riapprovazione alle modifiche, identificazione dello stato di revisione, disponibilità della versione applicabile nei punti d'uso e protezione dalle versioni superate (ISO 13485:2016, 4.2.4; registrazioni, 4.2.5), **ciò che si firma è una firma su un testo, non una dichiarazione**, perché non è dimostrabile a quale revisione si riferisca. La condizione nuova è **verificabile e a nostro carico**, quindi rende il documento più oneroso, non meno. Nessuna area può riscrivere la motivazione nella forma vecchia. [`docs/08_compliance/02-qualificazione-e-classificazione.md`](../08_compliance/02-qualificazione-e-classificazione.md) §5.2

### V-273

**Da**: `COMP` · **A**: `FUNZ`, `PROD`, `INTEG`, `TECH`, tutte · **Stato**: VINCOLO

**La dichiarazione di accessibilità del servizio non è mai del progetto, e non lo diventa per effetto di `D58`.** Il soggetto obbligato è **chi eroga il servizio in rete**, cioè chi installa e mette in esercizio; il progetto è obbligato alle **proprietà di accessibilità del prodotto**, che sono cosa distinta e che nessun deployer può aggiungere a valle. Il vincolo esiste perché `D58` rende il malinteso disponibile: chi legge che il progetto intende assumere il ruolo di fabbricante può concluderne che quel ruolo assorba anche l'obbligo di dichiarazione, e **non è così** - il fabbricante di un dispositivo non è, per ciò solo, il fornitore del servizio in rete, e le due posizioni hanno fonti, presupposti e destinatari diversi. Conseguenze operative: nessun artefatto del progetto contiene, allega o anticipa una dichiarazione di accessibilità riferita a un servizio; ciò che il progetto fornisce è il **materiale che rende la dichiarazione compilabile** - criteri verificati con metodo e data, non conformità con misura alternativa, percorsi critici coperti, versione della norma su cui la verifica è stata condotta. **Corollario da `V-175`**: un criterio che copre una funzione legata alla sicurezza **non è una non conformità dichiarabile**, quindi non entra in quella dichiarazione in nessun caso. [`docs/08_compliance/06-usabilita-e-accessibilita.md`](../08_compliance/06-usabilita-e-accessibilita.md) §9

### V-274

**Da**: `COMP` · **A**: tutte · **Stato**: VINCOLO

**L'analisi di equivalenza dell'Allegato XIV non entra nella documentazione pubblica del progetto, in nessuna forma e in nessuna fase.** Nomina necessariamente un dispositivo di confronto e viola `R0` per costruzione; appartiene al **fascicolo tecnico sotto il controllo dei documenti del fabbricante**, non al repository. Il vincolo **non si attenua** per effetto di `D58`: l'assunzione del ruolo di fabbricante sposta **chi redige** quel documento, **non dove il documento vive**. Va inoltre corretta la motivazione vecchia, che era «è documento di un terzo» ed è caduta insieme al terzo: la ragione vera è di **perimetro della documentazione pubblica**, e regge da sola. Ogni riferimento a un possibile dispositivo di confronto, anche solo di categoria merceologica, resta generico e non identificativo. [`docs/08_compliance/07-valutazione-clinica.md`](../08_compliance/07-valutazione-clinica.md) §6.1

### V-200

**Da**: `PROD` · **A**: tutte · **Stato**: VINCOLO

**La panoramica non è fonte: instrada.** Nessuna affermazione sostanziale può esistere **soltanto** in `docs/00_overview/`. La panoramica cita e rinvia; la fonte resta l'area competente, e ogni enunciato della panoramica è tracciabile a un capitolo di area, a una decisione `D*`, a un vincolo di bacheca o a un documento alla radice del repository. Tre conseguenze: (a) quando un'area cambia si riallinea la panoramica, **mai il contrario**; (b) una divergenza fra panoramica e area si risolve **sempre** a favore dell'area, e chi la rileva la porta qui invece di correggerla d'ufficio; (c) la panoramica **non duplica** il testo dei documenti alla radice del repository - li cita per indirizzo assoluto - perché due copie di un materiale che dichiara destinazione d'uso e limiti d'uso sono, ai sensi dell'art. 7 dell'MDR, due dichiarazioni che possono divergere, e non un problema di manutenzione documentale. Recepisce l'argomento di `GUIDA` e `COMP` su `Q-26`

### V-201

**Da**: `PROD` · **A**: tutte · **Stato**: VINCOLO

**Chiude la parte `PROD` di `Q-147`. Nessun materiale pubblico usa una sola tassonomia delle prestazioni.** Dove compaiono le prestazioni - pagina pubblica, panoramica, `README`, risposta a capitolato, materiale commerciale - devono essere visibili **entrambe** le tassonomie e la loro non coincidenza: le cinque attività dell'Accordo 215/CSR 2020 e i quattro servizi minimi del DM 21 settembre 2022. In particolare **teleconsulto e teleconsulenza non si presentano mai come un'unica prestazione**, benché stiano in un unico servizio minimo, perché hanno attori ammessi diversi e **il vincolo professionale si applica all'attività, non al servizio** (`BR-011`). Presentare «i quattro servizi» senza dire che sotto uno di essi stanno due attività distinte induce esattamente l'errore di autorizzazione che `BR-011` esiste per impedire. Applicato in [`docs/00_overview/02-le-quattro-prestazioni.md`](../00_overview/02-le-quattro-prestazioni.md) §§2–3 e §5.2

### V-202

**Da**: `PROD` · **A**: tutte · **Stato**: VINCOLO

**Chiude `Q-121` e il residuo `PROD` di `Q-14`. Formulazione pubblica della copertura oraria del servizio.** La copertura oraria **non si presenta mai come livello di servizio commerciale né come opzione di listino**: è una misura di controllo del rischio del livello più debole della gerarchia - informativa - e presentarla come parametro negoziabile ne autorizza la riduzione senza la valutazione che `RF-314` impone. **Nessun materiale può dichiarare una copertura più ampia di quella effettivamente presidiata**, e la coerenza fra materiale pubblico e copertura configurata è verifica di rilascio, non revisione editoriale. La formula di riferimento di [`docs/03_functional/05-gestione-degli-allarmi.md`](../03_functional/05-gestione-degli-allarmi.md) §11 **non va annacquata in alcun materiale**: dichiara che il servizio non sostituisce il sistema di emergenza, che fuori dagli orari indicati i dati non sono valutati da un professionista, e indica il canale configurato. Corollario che quest'area aggiunge: è ammesso dire *che cosa il servizio fa entro la copertura dichiarata dal titolare*; **non** è ammesso presentare una copertura come caratteristica del prodotto, perché la copertura è del soggetto che eroga e non del software. Applicato in [`docs/00_overview/02-le-quattro-prestazioni.md`](../00_overview/02-le-quattro-prestazioni.md) §7.6 e `03-a-chi-si-rivolge.md` §3.1

### V-203

**Da**: `PROD` · **A**: `COMP`, `GUIDA`, `ROAD` · **Stato**: VINCOLO

**Accolta la parte `PROD` di `Q-174`: nessun testo pubblico si pubblica senza passaggio di revisione regolatoria**, con la tabella delle formule vietate di [`docs/08_compliance/01-inquadramento-normativo.md`](../08_compliance/01-inquadramento-normativo.md) §11 e l'elenco di [`docs/04_protocols/10-conformita-e-prove.md`](../04_protocols/10-conformita-e-prove.md) §2 come lista di controllo congiunta. Vale per pagina pubblica, panoramica, `README`, descrizione del repository, annunci, note di rilascio e risposte a capitolato. Quest'area aggiunge il motivo per cui il presidio va rafforzato proprio sulla panoramica: **è il testo del progetto con il rapporto più alto fra visibilità e densità di affermazioni sintetiche**, ed è quindi il punto in cui una sintesi involontariamente più forte dell'originale ha la probabilità maggiore di essere citata da un terzo come destinazione d'uso (art. 2, punto 12, MDR). Regola operativa che ne discende e che quest'area si è applicata: **una sintesi non può essere più affermativa della fonte che sintetizza**; nel dubbio si cita la fonte invece di riformularla

### V-280

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO **Strato di `D63`, 26 agosto 2026.** Il committente ha deciso che il sistema deve essere adatto all'erogazione di prestazioni su pazienti reali. La decisione **rafforza questo vincolo invece di allentarlo**: quanto più l'obiettivo è deciso, tanto più una data di pianificazione interna assomiglia a una promessa di esito agli occhi di chi legge, e tanto più il divieto di scrivere che il prodotto sarà marcato entro una data è la sola cosa che tiene separate le due letture. `RU-1` del 30 novembre 2026 è un traguardo ingegneristico e **resta non utilizzabile su pazienti**: sta su un calendario diverso da quello del percorso di conformità, e accostare i due produrrebbe la dichiarazione fuorviante che l'art. 7 del Regolamento (UE) 2017/745 vieta.

**Riformula `V-180` alla luce di `D57` e `D58`. La roadmap è pianificazione interna del progetto.** Nessun documento presenta i traguardi o il calendario come «percorso di un terzo», «calendario di chi certifica» o «traguardi di terzi»: **il titolare della pianificazione è il progetto**, compreso il percorso di conformità, e dove un passo presuppone formalmente il ruolo di fabbricante si scrive che quel ruolo **va costituito e formalizzato** (`Q-280`). Restano non dichiarabili le sole date che la norma pone in capo a un soggetto diverso: il termine di adeguamento del singolo utilizzatore (`V-186`) e l'accreditamento del fornitore di servizi verso la federazione nazionale (`V-05`, `OUT-22`). **Limite invalicabile che accompagna il vincolo e non se ne separa: una data di pianificazione interna non è una promessa di esito.** In nessun materiale si scrive che il prodotto **sarà marcato entro una data** (`V-171`), e resta dichiarato con la stessa evidenza di prima che **oggi il prodotto non reca marcatura CE**, non è coperto da alcuna dichiarazione di conformità, e chi installa, integra o mette in servizio assume comunque gli obblighi che ne derivano

### V-281

**Da**: `ROAD` · **A**: tutte, in particolare `COMP` · **Stato**: VINCOLO

**Nessun traguardo entra nel piano se richiede due soggetti distinti e il secondo non esiste.** Sotto `D54` audit interno, riesame del rilascio, verifica di configurazione eseguita da chi non ha scritto il codice e revisione esterna indipendente del codice di sicurezza critico (`D18`) **non sono producibili internamente**: non è un problema di ore, è un problema di persone diverse. La registrazione che ne deriverebbe **si dichiara come lacuna, con la data in cui nasce**, e non si pianifica come attività - pianificare un'attività non producibile è il modo più efficace di farla sparire dalla vista. Conseguenza redazionale: una registrazione prodotta da chi ha svolto l'attività **non va presentata come conformità**; è formalmente presente e sostanzialmente vuota, ed è peggiore dell'assenza perché falsamente rassicurante. Ripartizione aperta in `Q-189`, forma della dichiarazione in `Q-282`. [`docs/09_roadmap/01-principi-e-metodo.md`](../09_roadmap/01-principi-e-metodo.md) §9-bis; [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md) §5.3

### V-282

**Da**: `ROAD` · **A**: tutte · **Stato**: VINCOLO

**L'ambito è l'unica variabile libera.** Con la data fissata da `D53` e la capacità da `D54`, uno scostamento **non si assorbe spostando la data e non si assorbe aumentando la capacità**: si assorbe **riducendo l'ambito**, secondo l'ordine di sacrificio dichiarato **in anticipo** in [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md) §6, che si esegue dall'alto e **contiene soltanto tagli reversibili**. Non vi entrano mai i criteri di rilascio bloccanti né l'elenco del debito vietato (`01-principi-e-metodo.md` §7.3). **Ogni riduzione si registra con data e causa**: una riduzione non registrata è un taglio non deciso, e fa perdere alla scelta la sola proprietà che `D53` obbliga a garantirle, cioè essere leggibile. Se l'ordine si esaurisce, **la data si dichiara mancata** con la causa registrata, e non si sposta in silenzio

