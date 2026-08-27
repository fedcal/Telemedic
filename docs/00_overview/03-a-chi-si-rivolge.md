---
title: A chi si rivolge
sidebar_position: 4
description: "I destinatari reali del progetto - struttura sanitaria, professionista, assistito e caregiver, integratore, ente regionale - con ciò che ciascuno ottiene, ciò che deve mettere di suo e ciò che il progetto deliberatamente non gli dà."
---

# A chi si rivolge

Un progetto che dichiara di rivolgersi «a tutti gli attori della sanità digitale» non si rivolge a
nessuno. Questo capitolo elenca **cinque destinatari reali** e, per ciascuno, tre cose: che cosa
ottiene, che cosa deve mettere di suo, che cosa il progetto **non** gli dà.

La terza colonna è quella che conta. Un'aspettativa non soddisfatta scoperta a valle costa molto
più di una capacità mancante dichiarata a monte, e il capitolo esiste per anticiparla.

> **Vale per tutti e cinque, senza eccezioni.** **Oggi il prodotto non reca marcatura CE**, e
> finché una marcatura non esiste **il software non è utilizzabile per l'erogazione di prestazioni
> sanitarie su pazienti reali** (`D16`). Il limite non è rimovibile per configurazione, per licenza
> o per accordo contrattuale, ed è verificabile: ogni artefatto distribuito reca la dichiarazione
> di non marcatura, e la sua assenza impedisce la pubblicazione. Il progetto ha deciso di assumere
> in proprio il ruolo di fabbricante (`D58`), ma il soggetto giuridico è **ancora da costituire**:
> l'intenzione non modifica lo stato di fatto, e **nessun documento dichiara una data entro cui il
> prodotto sarà marcato**.

## 1. La struttura sanitaria che eroga a distanza

Azienda sanitaria pubblica, casa di cura, poliambulatorio, studio associato: il soggetto che
installa il sistema o lo riceve da un integratore e lo porta in esercizio.

### 1.1 Che cosa ottiene

**Un sistema installabile presso di sé, non solo utilizzabile.** Sono documentati e supportati due
assetti - installazione presso il cliente e servizio gestito multi-tenant - con **stesso codice e
stessa struttura**: l'installazione a tenant unico è il caso degenere del modello multi-tenant, non
un ramo separato che diverge alla seconda versione.

**Isolamento applicato dal motore, non dalla correttezza del codice.** Uno schema per tenant su
base dati condivisa, con sicurezza a livello di riga come difesa in profondità e **negazione
predefinita** in assenza di contesto di tenant risolto: nessun accesso ai dati avviene fuori da una
transazione con tenant impostato (vincolo [`V-112`](../11_registri/01-vincoli-in-vigore.md#v-112)).

**Un registro immutabile che regge a un'indagine.** Non è il versionamento delle entità, che
versiona ma non rende immutabile: è una struttura in sola aggiunta con catena di impronte,
archiviazione a privilegi disgiunti, ancoraggio periodico dell'impronta cumulativa, verifica
dell'integrità su richiesta e programmata, esportazione in formato aperto (vincolo [`V-04`](../11_registri/01-vincoli-in-vigore.md#v-04)). Il
registro non contiene contenuto clinico: contiene chi, cosa, quando, su quale soggetto, con quale
esito e con quale livello di garanzia dell'autenticazione (vincolo [`V-150`](../11_registri/01-vincoli-in-vigore.md#v-150)).

**La ripartizione delle responsabilità scritta riga per riga.** Il documento
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md)
esiste specificamente perché nessuno creda di essere coperto dove non lo è, ed è la tabella da
mettere accanto a un capitolato.

**Artefatti che rendono possibile un adempimento invece di prometterlo**: distinta dei materiali
firmata per ogni artefatto, attestazioni di rilascio con provenienza ed esito delle prove,
procedura eseguibile di verifica a cura di chi installa, procedura di copia e ripristino con almeno
un'esecuzione documentata, procedura di verifica dell'integrità del registro, modello di rapporto
di incidente, **scheda dei dati per la dichiarazione dei fornitori rilevanti** all'autorità
nazionale (denominazione, identificativo fiscale, Paese della sede legale, codici della
nomenclatura degli appalti, criterio di rilevanza).

### 1.2 Che cosa deve mettere di suo

L'elenco completo dei presupposti di installazione è in
[`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md) §5.
Non sono raccomandazioni: **chi non può soddisfarli non può installare**, e saperlo prima vale più
di scoprirlo dopo. I sei che si sottovalutano più spesso:

| Presupposto | Perché non è un'opzione |
|---|---|
| **Isolamento di rete in uscita del nodo di relay**, applicato dall'infrastruttura | È la **difesa primaria** e non dipende dalla correttezza del codice. Le liste di indirizzi vietati sono difesa in profondità (vincolo [`V-10`](../11_registri/01-vincoli-in-vigore.md#v-10)) |
| **Negazione di rotta in uscita ai componenti applicativi**, con la sola eccezione del mediatore | È requisito architetturale, non regola di codifica: la difesa non deve dipendere dal fatto che un programmatore non sbagli (vincolo [`V-157`](../11_registri/01-vincoli-in-vigore.md#v-157)) |
| **Separazione dei privilegi fra archivio applicativo e archivio del registro** | In sua assenza la garanzia di non alterabilità **si riduce alla fiducia nell'operatore**, che è precisamente ciò che il requisito esclude. La riduzione va dichiarata |
| **Custodia della chiave radice** della gerarchia di cifratura | La chiave che protegge le copie non può risiedere nel sistema che le produce |
| **Determinazione dei termini di conservazione** della documentazione sanitaria | Il prodotto li rende configurabili, **non li decide**: la determinazione è del titolare del trattamento |
| **Cadenza di aggiornamento dei componenti esposti**, in particolare del relay | Per un componente esposto l'aggiornamento è un obbligo. Il nodo di relay ha avuto quattordici rilasci in poco più di sette mesi, cinque nel solo agosto 2026 |

Sul piano degli adempimenti, tre restano interamente suoi e **nessuna clausola contrattuale li
sposta**: la valutazione d'impatto sulla protezione dei dati, che precede il trattamento; la
notifica degli incidenti alle autorità, con i propri termini - il progetto notifica **al cliente**
e fornisce l'evidenza, non notifica all'autorità al posto suo; l'approvazione dei piani da parte
degli organi di amministrazione.

### 1.3 Che cosa il progetto non gli dà

- **Non gli dà una marcatura CE**, oggi né a una data dichiarata. Se mette in servizio il sistema
  per erogare prestazioni sanitarie assume gli obblighi che ne derivano, incluso quello di
  fabbricante quando ne ricorrono i presupposti. Che il progetto intenda certificare in futuro
  (`D58`) **non gli trasferisce nulla** su una versione non certificata.
- **Non gli dà conservazione a norma**, e non è l'archivio clinico primario della struttura
  (`OUT-23`).
- **Non gli dà una data di conformità alle misure nazionali di sicurezza.** Il termine è
  **soggettivo**: decorre dalla comunicazione di inserimento che ha ricevuto **lui**, e non è
  determinabile dal fornitore. Il progetto dichiara **quali evidenze** consegna e **da quale
  rilascio** ciascuna è disponibile (vincolo [`V-186`](../11_registri/01-vincoli-in-vigore.md#v-186)).
- **Non gli dà i valori dei livelli di servizio.** Il prodotto li **misura** e storicizza la
  disponibilità per tenant e per servizio; la soglia la sceglie chi installa.
- **Non gli dà una consulenza legale o regolatoria.** La qualificazione giuridica di un soggetto e
  di un prodotto dipende da elementi di fatto che vanno accertati caso per caso da un professionista
  abilitato.

## 2. Il professionista sanitario

Medico specialista, medico di assistenza primaria, medico consulente, infermiere, professionista
della riabilitazione, psicologo, case manager, responsabile di un piano di telemonitoraggio.

### 2.1 Che cosa ottiene

**Un modello che non gli attribuisce atti che non ha compiuto.** È la proprietà che distingue
questo sistema, ed è composta di regole verificabili:

- **nessun contatto si chiude automaticamente.** La chiusura con esito è sempre atto del
  professionista; in sua assenza il contatto resta sospeso ed è segnalato. Un sistema che chiude da
  solo attribuisce un esito clinico;
- **nessun atto si conclude per scadenza di un termine.** Il tempo può produrre uno stato terminale
  **non** nominale - mancata presentazione, scadenza -, non concludere un atto sanitario;
- **nessun contenuto clinico interpretativo è precompilato** all'apertura di un documento: la
  precompilazione riguarda dati anagrafici, amministrativi e temporali (`OUT-07`);
- **nessuna soglia è dedotta o proposta.** Il campo parte vuoto e obbligatorio, senza
  precompilazione nemmeno con i valori del percorso o dell'ultimo piano; i riferimenti si mostrano
  attribuiti, in sola lettura, con un'azione esplicita di copia (vincolo [`V-123`](../11_registri/01-vincoli-in-vigore.md#v-123));
- **una caduta di rete non chiude l'atto clinico.** Prestazione e sessione media sono aggregati
  distinti (vincolo [`V-01`](../11_registri/01-vincoli-in-vigore.md#v-01)), e l'unica transizione che la sessione media provoca sul contatto è la
  sospensione dopo una riconnessione fallita oltre la finestra configurata.

**Strumenti che riflettono la realtà dell'atto a distanza.** La sala d'attesa ha **due controlli
distinti con esito separato e visibile separatamente** - tecnico e amministrativo - perché un
semaforo unico costringe l'operatore a indovinare quale dei due manca. L'ammissione in sessione è
**sempre esplicita**. La lista dei partecipanti, con nome e qualifica, è visibile per l'intera
durata **senza possibilità di occultamento**. La stanza laterale fra professionisti è un periodo
dichiarato, con inizio, fine e annuncio: non esiste modalità silenziosa.

**Un accesso d'emergenza che è un requisito, non un'eccezione tollerata**: motivazione libera
obbligatoria, finestra e perimetro limitati, notifica, riesame con esito registrato (vincolo
[`V-153`](../11_registri/01-vincoli-in-vigore.md#v-153)).

**Una procedura di emergenza che gli dà ciò che gli manca davvero.** Non una valutazione di
gravità, ma le informazioni logistiche che non ha perché l'assistito non è nella stessa stanza:
**indirizzo in cui la persona si trova in quel momento**, recapiti, contatto di emergenza. Da qui
l'obbligo di chiedere e confermare l'indirizzo di svolgimento all'inizio di **ogni** sessione,
perché l'indirizzo di residenza è inutile in emergenza.

### 2.2 Che cosa deve mettere di suo

**L'atto professionale, per intero.** Le decisioni che il sistema non prende sono le sue: se la
prestazione sia erogabile a distanza; l'identificazione dell'assistito, che è atto suo e non esito
di un algoritmo - il progetto non esegue riconoscimento biometrico né rilevazione automatica di
volti (`OUT-14`); l'attestazione di idoneità della qualità del collegamento, che il sistema misura
e **lui conferma**; la soglia individuale e la regola di allerta; l'esito clinico, compreso il
codice di priorità, che il sistema registra e non calcola (`OUT-03`); la decisione di proseguire,
degradare o interrompere quando la qualità si degrada.

**La firma.** Il documento clinico è persistenza di contenuto redatto da lui, e una volta firmato
è **immutabile**: la correzione è una versione successiva che sostituisce o rettifica, mantenendo
la catena. Non esiste un ritorno allo stato precedente.

### 2.3 Che cosa il progetto non gli dà

- Nessun suggerimento diagnostico, prognostico, terapeutico o farmacologico (`OUT-01` … `OUT-05`).
- Nessun punteggio, indice di rischio o classificazione calcolati in autonomia. Il calcolo di
  punteggi di scale cliniche validate è **escluso in via cautelativa** finché non è verificato il
  regime di licenza di ciascuno strumento: il sistema conserva la **risposta** al questionario, con
  riferimento a una versione immutabile dello strumento, e non il punteggio.
- Nessuna elaborazione dell'immagine che ne modifichi il contenuto informativo a fini di lettura
  clinica (`OUT-06`).
- Nessun canale di emergenza e nessuna attivazione automatica dei soccorsi (`OUT-13`).
- Nessuna attivazione automatica della registrazione in caso di emergenza, contenzioso o sospetto:
  la registrazione resta subordinata al consenso, e non è utilizzabile come strumento difensivo
  unilaterale (`OUT-16`).

## 3. L'assistito e chi lo assiste

È il destinatario che quasi nessun progetto tratta come tale, perché non è mai il committente.

### 3.1 Che cosa ottiene

**Percorsi progettati per lo schermo piccolo e la rete peggiore.** Non «mobile compatibile»:
**mobile first come metodo di progettazione**, perché l'assistito tipico di una televisita usa uno
smartphone, spesso su rete mobile, spesso senza assistenza (`D25`). Il criterio di accettazione è
operativo e verificabile: ogni requisito funzionale deve poter essere completato da un assistito
anziano su smartphone in rete mobile.

**Accessibilità come requisito funzionale, con una sola non conformità dichiarata.** WCAG 2.1 AA
ed EN 301 549 integrali, verificati in automatico **e** a mano con tecnologie assistive reali,
perché l'automazione intercetta una parte minoritaria dei difetti. L'unica non conformità
dichiarata riguarda i **sottotitoli in tempo reale**, con l'interprete come misura alternativa e il
canale dati dei sottotitoli comunque definito e versionato nel protocollo, per innestare in futuro
un motore di trascrizione senza riprogettare (`D24`).

**Degradazione comprensibile invece di un errore.** Banda scarsa, rete intermittente, dispositivo
modesto: **audio prima del video, sempre**, avvisi chiari, ripresa della sessione, e un **ripiego
telefonico** che è esito tipizzato obbligatorio - con la registrazione del cambio di canale, perché
può incidere sulla natura dell'atto.

**Consensi che sono fatti, non caselle.** Cinque oggetti di consenso distinti con cicli di vita
indipendenti - atto sanitario, trattamento dei dati ove applicabile, registrazione, presenza di
terzi, trasmissione a sistemi esterni - e la revoca di uno non tocca gli altri. **Non esiste, nel
modello, un «consenso alla piattaforma»** (vincolo [`V-146`](../11_registri/01-vincoli-in-vigore.md#v-146)).

**Una verifica delle chiavi pensata per essere usata da lui.** Il codice breve derivato dalle
impronte della sessione, confrontato a voce con l'interlocutore, è obbligatorio per impostazione
predefinita ed è insieme ciò che rende dimostrabile la cifratura fino agli estremi e un controllo
di rischio tracciabile. I requisiti di accessibilità sono vincolanti: leggibile da un lettore di
schermo, **mai veicolato dal solo colore**, comprensibile a una persona anziana o poco
alfabetizzata digitalmente, con una procedura definita in caso di mancata corrispondenza (`D22`).

**Avvertenze che non si possono nascondere.** L'indicatore di registrazione in corso, i testi di
consenso, l'esito della verifica delle chiavi, i messaggi di errore clinico e l'indicatore dello
stato di cifratura **non sono tematizzabili né occultabili da nessun integratore** (vincolo
[`V-163`](../11_registri/01-vincoli-in-vigore.md#v-163)). Il canale asincrono, il ripiego telefonico e l'inserimento manuale delle misure
dichiarano in modo persistente e non chiudibile i tempi di risposta attesi e la **non idoneità
all'emergenza**. La copertura oraria del servizio è visibile con lo **stato corrente**, non con
l'orario teorico, insieme al canale alternativo.

**Il caregiver esiste nel modello con un ruolo proprio.** Non è confuso con il rappresentante
legale: **il caregiver non presta consenso per un assistito capace**. È un partecipante con ruolo,
qualifica dichiarata, istante di ingresso e istante di uscita, perché la presenza di un terzo è un
fatto con conseguenze giuridiche.

### 3.2 Che cosa deve mettere di suo

Il meno possibile, ed è un obiettivo di progetto. Nessun passaggio obbligato può presupporre
competenze informatiche; la verifica tecnica precede la sessione invece di fallire durante; il
ripiego telefonico esiste. Restano indispensabili un dispositivo con telecamera e microfono, una
connessione, e - quando la struttura lo richiede - un'identità digitale nazionale, il cui
riconoscimento è però adempimento di chi eroga il servizio, non suo.

### 3.3 Che cosa il progetto non gli dà

- **Non gli dà un canale di emergenza.** Per un'emergenza si contattano i numeri di emergenza:
  è scritto nella dichiarazione di destinazione d'uso ed è ripetuto in modo persistente
  nell'interfaccia.
- **Non gli dà sorveglianza continua.** La raccolta dei parametri è **differita** e la presa in
  carico dipende dall'organizzazione che eroga il servizio e dalla copertura oraria che essa
  dichiara.
- **Non gli dà una modalità fuori linea per il contenuto clinico.** È una scelta dichiarata,
  motivata dal rischio di contenuto clinico su un dispositivo che il titolare del trattamento non
  controlla.
- **Non gli dà sottotitoli in tempo reale**, come sopra.
- **Non gli dà una sessione cifrata fino agli estremi quando la registrazione è attiva.** È il
  punto più importante di questa sezione, ed è trattato per esteso in
  [04 - Stato e limiti](./04-stato-e-limiti.md) §5: la registrazione avviene lato server, e in
  quella modalità la cifratura è terminata sul server. L'informativa di consenso **lo dichiara
  esplicitamente**.

## 4. L'integratore

Il fornitore di un gestionale sanitario cloud, di un sistema EHR di terze parti, di un portale per
il cittadino, di un motore di integrazione già in esercizio. È l'area su cui si gioca l'adozione
del progetto.

### 4.1 Che cosa ottiene

**Quattro modalità di integrazione, non alternative ma strati.** Servizio autonomo; interfacce
applicative; componente incorporabile; moduli sostituibili - refertazione, agenda, fatturazione,
risoluzione degli identificativi, destinazione dell'archiviazione. Il capitolo
[`docs/07_integration/01-modalita-di-integrazione.md`](../07_integration/01-modalita-di-integrazione.md)
le descrive con la parte che conta di più: **quando ciascuna è la scelta sbagliata**.

**Tre garanzie che discendono dal profilo su cui il progetto è costruito.** Non impone la propria
interfaccia; non impone la propria autenticazione; **non diventa il dato di riferimento**. Lavora
per riferimento sugli identificatori del suo dominio di attribuzione e restituisce al sistema di
origine ciò che produce.

**Un perimetro contrattuale dichiarato.** È contratto - e cambia solo con dodici mesi di preavviso,
con due oscuramenti programmati a nove e undici mesi - l'interfaccia applicativa documentata, i
profili pubblicati e il documento di capacità, i tipi di evento e i loro schemi, gli ambiti di
autorizzazione, gli identificatori dei tipi di problema e i codici di esito, le interfacce dei
moduli sostituibili, il protocollo del componente incorporabile e l'insieme chiuso delle proprietà
di tema. **Tutto il resto è interno e può cambiare senza preavviso** (vincolo [`V-160`](../11_registri/01-vincoli-in-vigore.md#v-160)).

**Regole che lo proteggono anche quando gli costano.** Gli eventi in uscita trasportano
**riferimenti, mai contenuto clinico**: il contenuto si rilegge con una chiamata autenticata sotto
l'autorizzazione del ricevente (vincolo [`V-161`](../11_registri/01-vincoli-in-vigore.md#v-161)). La firma dei messaggi in uscita è **asimmetrica**,
perché un segreto condiviso non dà non ripudio e la sua rotazione richiede coordinamento con
ciascun integratore (vincolo [`V-162`](../11_registri/01-vincoli-in-vigore.md#v-162)). L'identità proveniente da un emittente esterno è sempre
rappresentata come **delega, mai come impersonificazione**: nessuna configurazione supportata
emette un token privo del claim dell'attore (vincolo [`V-132`](../11_registri/01-vincoli-in-vigore.md#v-132)).

**Due sole rappresentazioni dell'errore**, con catalogo **generato** da un file versionato e il
divieto di emettere un errore non catalogato (vincoli [`V-110`](../11_registri/01-vincoli-in-vigore.md#v-110), [`V-130`](../11_registri/01-vincoli-in-vigore.md#v-130)).

### 4.2 Che cosa deve mettere di suo

**La consegna dell'identità fra back-end. È circa il settanta per cento del costo, e non si può
aggirare passando dal browser.** Richiede crittografia asimmetrica e custodia di una chiave
privata. È il punto in cui un'integrazione riesce o fallisce, ed è dichiarato in anticipo proprio
per questo.

**Un ambiente e una controparte.** L'integrazione con un sistema di terze parti richiede un
ambiente di prova, credenziali e una controparte disponibile: nessuno dei tre è sotto il controllo
del progetto, ed è la ragione per cui il progetto non promette date di integrazione.

**La verifica del codice.** Non è una formula di stile: è la condizione a cui il progetto rende
disponibile il proprio lavoro.

**Il ruolo di fabbricante, se immette sul mercato.** Chi integra il software in un prodotto
commerciale e lo immette sul mercato **è fabbricante per legge**, indipendentemente da quanto
scritto nella licenza. Il capitolo
[`docs/07_integration/09-obblighi-di-chi-integra.md`](../07_integration/09-obblighi-di-chi-integra.md)
va letto **prima** della firma di un contratto, non dopo.

### 4.3 Che cosa il progetto non gli dà

- **Non gli dà personalizzazione illimitata del componente incorporabile.** Le proprietà di tema
  sono un insieme chiuso e versionato, validate lato server con verifica del contrasto: una
  configurazione che degrada l'accessibilità **viene rifiutata al salvataggio**, non segnalata come
  avviso. Nessuna iniezione di fogli di stile arbitrari dall'esterno (vincolo [`V-163`](../11_registri/01-vincoli-in-vigore.md#v-163)).
- **Non gli dà un livello di garanzia che valga come autenticazione forte.** Il livello propagato è
  quello **richiesto**, non quello asserito, ed è sempre qualificato per distinguere
  l'autenticazione **eseguita** dal progetto da quella **riferita** da lui. Un'operazione che la
  normativa lega all'autenticazione forte richiede autenticazione eseguita (vincoli [`V-154`](../11_registri/01-vincoli-in-vigore.md#v-154),
  [`V-165`](../11_registri/01-vincoli-in-vigore.md#v-165)).
- **Non gli dà token ispezionabili dall'esterno.** I token verso l'esterno sono opachi, tradotti in
  token autoportanti dal gateway: la ragione è la **revoca effettiva**, perché in un sistema che
  tratta dati sanitari la domanda «da quando ha smesso di poter accedere?» deve avere come risposta
  un istante e non un intervallo. È attrito dichiarato con la motivazione, non una limitazione
  arbitraria.
- **Non gli dà alcun percorso verso il fascicolo per un pagatore.** Se il suo cliente è un fondo,
  una mutua o una polizza, il profilo di integrazione è **amministrativo per costruzione**:
  identificativo della prestazione, esito amministrativo, importo. Nessun ambito, evento o modulo
  può costituire un percorso - diretto o mediato da un professionista - verso il contenuto clinico
  (vincolo [`V-166`](../11_registri/01-vincoli-in-vigore.md#v-166), `OUT-18`).
- **Non gli dà un kit di sviluppo nel primo rilascio.** L'interfaccia applicativa versionata è
  sufficiente alla prima integrazione; il kit è comodità, non capacità.

## 5. L'ente regionale e il committente pubblico

Regione, provincia autonoma, azienda sanitaria che bandisce, stazione appaltante.

### 5.1 Che cosa ottiene

**Un applicativo pensato per la terza via.** Il DM 19 novembre 2025, art. 3, comma 4, consente di
erogare telemedicina con applicativi diversi da quelli acquisiti nelle procedure nazionali, purché
rispettino standard certificati e alimentino il fascicolo. Il progetto è costruito per stare in
quello spazio: non sostituisce l'infrastruttura nazionale, si progetta per parlarci.

**Recepimento esplicito dei requisiti del DM 21 settembre 2022**, che è l'atto tecnicamente più
prescrittivo del quadro: architettura a micro-servizi, orientata agli eventi, in contenitori,
multi-tenant, **mobile first**, accessibile, multilingua. E il recepimento del divieto di
duplicazione: dove esiste un modulo regionale - refertazione e firma in primo luogo - il sistema si
**integra invece di duplicare**, e i moduli propri sono disattivabili e sostituibili per
configurazione (`D14`).

**Una modalità di esercizio a non conservazione del contenuto clinico**, coerente con il DM 19
novembre 2025, art. 12, in cui le infrastrutture regionali non conservano i dati e i documenti
generati e il conferimento è a carico delle strutture sanitarie.

**Documentazione verificabile invece di dichiarazioni.** Per una valutazione di offerta, i tre
documenti da mettere accanto al capitolato sono la ripartizione delle responsabilità
([`docs/06_security/09`](../06_security/09-ripartizione-delle-responsabilita.md)), la catena di
fornitura con gli artefatti che la diligenza dovuta richiede
([`docs/06_security/07`](../06_security/07-catena-di-fornitura.md)) e il perimetro del primo
rilascio con i suoi limiti dichiarati
([`docs/09_roadmap/03`](../09_roadmap/03-primo-rilascio-utilizzabile.md)).

**Un catalogo delle prestazioni che non lo lega alla cadenza di rilascio del fornitore.** La
struttura di una voce di catalogo è nel prodotto; il **contenuto è dato di tenant**, caricato per
interfaccia documentata. Con doppia codificazione nativa - codice del catalogo regionale e codice
nazionale - e **validità temporale obbligatoria**, senza la quale la rendicontazione storica è
irriproducibile.

### 5.2 Che cosa deve mettere di suo

Tutto ciò che la norma attribuisce al soggetto che eroga: il ruolo di titolare del trattamento; il
ruolo di fornitore di servizi verso la federazione nazionale delle identità; gli adempimenti in
materia di sicurezza delle reti, con i propri termini; la determinazione dei termini di
conservazione; la definizione dei livelli di servizio attesi verso i propri assistiti, distinti dai
livelli che il prodotto misura.

E una cosa che si scopre spesso tardi: **i cataloghi regionali sono ventuno cicli di aggiornamento
indipendenti**. Il progetto non li distribuisce e non li mantiene; li accetta per riferimento dal
cliente.

### 5.3 Che cosa il progetto non gli dà

- **Non gli dà un fornitore accreditato presso la federazione nazionale delle identità.** Non
  perché non voglia: perché **non può**. Il fornitore di servizi è chi eroga il servizio in rete
  (`D36`, vincolo [`V-05`](../11_registri/01-vincoli-in-vigore.md#v-05), `OUT-22`). Il progetto punta a essere conforme e verificabile in
  integrazione continua, e non dichiara tempi che nessuna fonte primaria stabilisce.
- **Non gli dà, oggi, il conferimento ai repository documentali nazionali e regionali.** I modelli
  documentali, i codici di tipologia e i metadati di indicizzazione delle dieci tipologie della
  telemedicina **non sono pubblicamente disponibili** (questione [`Q-07`](../11_registri/02-questioni-aperte.md#q-07)). La risposta strutturale
  esiste - dataset canonico e serializzazione sostituibile, con l'adattatore come punto di
  estensione a contratto dichiarato - ma **manca il contenuto, non il progetto**, e nessun modello
  documentale è cablato (vincolo [`V-136`](../11_registri/01-vincoli-in-vigore.md#v-136)).
- **Non gli dà una data per un esito che non dipende soltanto dal progetto.** Per
  l'accreditamento presso la federazione delle identità, per il termine di adeguamento alle misure
  nazionali di sicurezza e per la disponibilità dei modelli documentali il motivo è che il
  traguardo **non è del progetto** (vincolo [`V-180`](../11_registri/01-vincoli-in-vigore.md#v-180)). Per la **marcatura CE** il motivo è diverso e
  va detto con precisione: la pianificazione è interna al progetto (`D57`, `D58`), ma **una
  pianificazione interna non diventa una promessa solo perché è nostra**, e la promessa di un esito
  regolatorio datato produce un effetto che l'intenzione non produce. Di ciascuno il progetto
  dichiara **le condizioni** e **ciò che fornisce**; mai la data.
- **Non gli dà una voce `[INTENZIONE]` presentata come `[IMPEGNO]`.** Nessun materiale del progetto
  - documentazione, sito, risposta a gara, nota di rilascio - può farlo (vincolo [`V-184`](../11_registri/01-vincoli-in-vigore.md#v-184)). Una voce
  della coda successiva al primo rilascio non è **pianificata** se non ha insieme criterio di
  completamento binario, innesco dichiarato e titolare nominato: in assenza anche di uno solo dei
  tre è **desiderabile**, e va marcata tale anche in una risposta a capitolato (vincolo [`V-187`](../11_registri/01-vincoli-in-vigore.md#v-187)).

## 6. Due lettori adiacenti, che questo capitolo non tratta

**Chi immette sul mercato un prodotto derivato.** Integra il codice in un proprio prodotto, lo
immette sul mercato e **assume per ciò stesso il ruolo di fabbricante**, indipendentemente da
quanto scritto nella licenza. Per lui l'`COMP` è un **manuale operativo**, non
un'informativa, e il percorso di lettura è in
[`docs/08_compliance/00-indice.md`](../08_compliance/00-indice.md) §3.1. Le due avvertenze che gli
risparmiano mesi: le attività dei primi trenta giorni non sono delegabili allo sviluppo e non si
recuperano a valle; e la destinazione d'uso è il documento più costoso da sbagliare, perché una
singola formulazione sposta insieme la classe di rischio e la classe di sicurezza del software.

Il progetto ha deciso di percorrere lo stesso cammino in proprio (`D58`), costituendo un soggetto
fabbricante che oggi **non esiste ancora**. Le due cose non si sovrappongono e non si sostituiscono:
il percorso del progetto riguarda **la propria distribuzione identificata**, non il prodotto
derivato di un terzo.

**Chi contribuisce al codice.** La guida dei fondamenti in
[`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) è **prerequisito dichiarato**
di [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), e non è un
adempimento burocratico: un sistema che tratta dati sanitari e ricade nella disciplina dei
dispositivi medici accumula danni silenziosi quando viene modificato da chi non conosce il
contesto.

## Dove continuare

- [04 - Stato e limiti](./04-stato-e-limiti.md): che cosa esiste oggi, che cosa non esiste, le
  tensioni accettate consapevolmente e ciò che va saputo prima di decidere.
- [`docs/07_integration/00-indice.md`](../07_integration/00-indice.md): l'albero decisionale per
  scegliere la modalità di integrazione e le tre avvertenze che non si possono rinviare.
- [`docs/06_security/09-ripartizione-delle-responsabilita.md`](../06_security/09-ripartizione-delle-responsabilita.md):
  misura per misura, che cosa fa il progetto, che cosa fa chi installa, che cosa è condiviso.
- [`docs/09_roadmap/03-primo-rilascio-utilizzabile.md`](../09_roadmap/03-primo-rilascio-utilizzabile.md):
  i presupposti di installazione e i limiti dichiarati del primo rilascio.
