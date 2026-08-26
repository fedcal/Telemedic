---
title: Casi d'uso
sidebar_position: 4
description: Ventiquattro casi d'uso di Telemedic con precondizioni, flusso principale, flussi alternativi, flussi di errore e postcondizioni; esiti tipizzati della prestazione sincrona e del telemonitoraggio, con collegamento ai requisiti e alle regole di business.
---

# Casi d'uso

## 1. Struttura e convenzioni

Ogni caso d'uso è descritto con la stessa struttura, e le sezioni **non sono facoltative**:

- **Attore primario** e attori secondari;
- **Portata**: quale confine di sistema è coinvolto;
- **Precondizioni**: ciò che deve essere vero prima, verificabile dal sistema;
- **Innesco**;
- **Flusso principale**: il percorso nominale, numerato;
- **Flussi alternativi**: percorsi legittimi diversi dal nominale, che non sono errori;
- **Flussi di errore**: percorsi in cui qualcosa fallisce, ciascuno con l'esito registrabile;
- **Postcondizioni**: ciò che è vero dopo, distinto per successo e per fallimento;
- **Requisiti e regole**: collegamento alla matrice di tracciabilità.

**Sui flussi di errore.** Sono la metà del dominio, non un'appendice. In telemedicina la
maggioranza dei casi non nominali determina la percezione di affidabilità del servizio, e in
telemonitoraggio alcuni percorsi di errore - l'assenza di dato, il guasto della catena di
ingestione - sono **percorsi clinici a tutti gli effetti**, non gestioni di eccezione. Un flusso
di errore senza esito registrabile non è progettato: è un `catch` che scrive in un registro.

**Esiti tipizzati.** La prestazione sincrona usa i codici di esito già congelati (`EX-NOSHOW`,
`EX-TECH-PATIENT`, `EX-TECH-DROP`, `EX-TECH-FAIL`, `EX-QOS`, `EX-CLIN-STOP`, `EX-ESCALATE`,
`EX-EMERGENCY`, `EX-IDENT-FAIL`, `EX-CAPACITY`, `EX-THIRD-PARTY`, `EX-ABUSE`). Il telemonitoraggio
introduce qui una famiglia propria, da questo momento congelata:

| Codice | Evento | Rilevabilità automatica | Destinatario naturale |
|---|---|---|---|
| `EX-TM-NOSIGNAL` | misura attesa non pervenuta entro la finestra | sì | clinico |
| `EX-TM-DEVICE` | guasto o esaurimento del dispositivo | sì, se la sorgente riporta lo stato | tecnico |
| `EX-TM-LINK` | perdita di connettività della catena domiciliare | sì, con segnale di presenza | tecnico |
| `EX-TM-INGEST` | guasto della catena di ingestione, silenzio collettivo | sì, con sorveglianza del volume atteso | tecnico, con comunicazione al clinico |
| `EX-TM-USEERR` | rilevazione iniziata e non completata | sì, se i tentativi sono registrati | tecnico e clinico |
| `EX-TM-DECLARED` | assenza dichiarata dal paziente o dal caregiver | no, è dichiarata | clinico, severità ridotta |
| `EX-TM-ADMIN` | assenza spiegata da evento amministrativo noto | sì, per integrazione | clinico |
| `EX-TM-UNEXPLAINED` | silenzio residuo dopo l'esclusione di ogni causa nota | per esclusione | clinico, con contatto umano |
| `EX-TM-DROPOUT` | abbandono del percorso da parte della persona | per esclusione | clinico |
| `EX-TM-IMPLAUS` | valore fuori dall'intervallo tecnicamente possibile | sì | tecnico |
| `EX-TM-LATE` | dato pervenuto dopo la scadenza della finestra | sì | clinico, con marcatura di tardività |
| `EX-TM-CORRECTED` | misura corretta o dichiarata non valida | no, è dichiarata | clinico |
| `EX-TM-OUTOFHOURS` | evento generato fuori dalla copertura dichiarata | sì | secondo la politica di copertura |
| `EX-TM-NOACK` | scadenza di riscontro decorsa senza presa in carico | sì | anello successivo della catena |
| `EX-TM-ESCFAIL` | catena di escalation esaurita senza gestione | sì | responsabile del servizio |
| `EX-TM-EXIT` | uscita dal canale per item marcato dal clinico | sì, per confronto sul marcatore | paziente, con notifica al team |
| `EX-TM-PLANSTALE` | versione del piano non presa in carico dal lato paziente | sì | clinico e tecnico |

## 2. Casi d'uso della prestazione sincrona

### UC-01 - Prenotazione di una prestazione a distanza da un sistema esterno

**Attore primario**: integratore (`ATT-15`). **Secondari**: front-office (`ATT-10`), paziente
(`ATT-01`).
**Portata**: agenda e prestazione clinica.

**Precondizioni.** Il principal applicativo è autenticato e autorizzato per il tenant; il
riferimento anagrafico del paziente è risolubile o creabile per identificativo esterno; la
prestazione è presente nel catalogo del tenant ed è marcata erogabile nel canale richiesto; il
tenant ha una configurazione di relay valida e raggiungibile per l'area di erogazione.

**Innesco.** Il sistema esterno invia una richiesta di creazione di appuntamento.

**Flusso principale.**

1. Il sistema risolve il riferimento anagrafico esterno o crea l'anagrafica locale per riferimento.
2. Verifica che la prestazione ammetta il canale richiesto e che il professionista sia abilitato.
3. Verifica l'ammissibilità del canale rispetto alla presa in carico, secondo la configurazione del
   tenant.
4. Assegna lo slot in modo atomico.
5. Genera i collegamenti di accesso per ciascun partecipante, monouso e a scadenza.
6. Restituisce identificativo del contatto e collegamenti al sistema di origine.
7. Notifica il paziente con conferma, istruzioni e richiamo alla verifica tecnica preventiva.

**Flussi alternativi.**

- **A1 - Prestazione che richiede diagnosi già formulata e assistito privo di episodio attivo.** Il
  sistema richiede una deroga motivata da un professionista; se la deroga è registrata la
  prenotazione procede e genera un evento di audit di severità alta (`RF-346`).
- **A2 - Agenda di proprietà del sistema esterno.** Ogni modifica locale è rifiutata con
  l'indicazione del sistema autoritativo (`RF-040`).
- **A3 - Contatto multi-professionista.** Il sistema verifica la disponibilità simultanea di tutte
  le agende coinvolte e propone solo gli intervalli comuni (`RF-049`).

**Flussi di errore.**

- **E1 - Slot occupato da richiesta concorrente.** Una richiesta ottiene conferma, l'altra un
  conflitto esplicito con proposta di alternative. Non esistono due conferme (`BR-020`).
- **E2 - Configurazione di relay assente o non raggiungibile.** La prenotazione è rifiutata:
  prenotare ciò che non si può erogare è un difetto di dominio (`BR-021`).
- **E3 - Richiesta marcata come urgente.** Rifiutata con indicazione del canale corretto: non
  esistono percorsi di televisita in urgenza (`RF-347`).
- **E4 - Prestazione non ammessa nel canale.** Rifiutata indicando i canali ammessi (`RF-030`).

**Postcondizioni.** *Successo*: esiste un contatto in stato prenotato, con collegamenti validi e
notifica inviata. *Fallimento*: nessuna risorsa parziale è stata creata; il motivo del rifiuto è
restituito in forma strutturata e registrato.

**Requisiti e regole**: `RF-020`, `RF-038`, `RF-039`, `RF-041`, `RF-052`, `RF-346`, `RF-347`,
`BR-001`, `BR-002`, `BR-020`, `BR-021`, `BR-028`.

### UC-02 - Verifica di eseguibilità e registrazione delle condizioni di erogabilità

**Attore primario**: medico (`ATT-04`). **Secondari**: front-office, infermiere.
**Portata**: prestazione clinica.

**Precondizioni.** Esiste un contatto prenotato in televisita.

**Flusso principale.**

1. Il sistema presenta le condizioni di erogabilità previste per il tipo di prestazione.
2. Il medico dichiara che la prestazione non richiede la completezza dell'esame obiettivo.
3. Il medico seleziona almeno una delle condizioni di erogabilità applicabili.
4. Il medico o il front-office registrano l'esito della verifica di eseguibilità sulle tre
   dimensioni: utilità clinica, sicurezza clinica, capacità di interazione digitale.
5. Il sistema registra la dichiarazione con autore e istante e la rende immutabile.

**Flussi alternativi.**

- **A1 - Capacità di interazione digitale insufficiente ma caregiver disponibile.** La dimensione
  resta negativa, il percorso prosegue con il coinvolgimento formale del caregiver e la generazione
  di un collegamento di accesso dedicato (`RF-345`).
- **A2 - Esito negativo su utilità o sicurezza clinica.** Il contatto è instradato verso la
  prestazione in presenza; l'esito negativo resta consultabile e non è confuso con un rifiuto
  amministrativo.

**Flussi di errore.**

- **E1 - Tentativo di avviare l'atto senza dichiarazione registrata.** Avvio impedito con
  indicazione della registrazione mancante (`RF-343`).
- **E2 - Tentativo di modificare la dichiarazione dopo l'atto.** Rifiutato; l'eventuale
  correzione è una nuova dichiarazione che non cancella la precedente.

**Postcondizioni.** *Successo*: il contatto porta la dichiarazione di erogabilità e l'esito della
verifica di eseguibilità, entrambi immutabili. *Fallimento*: il contatto resta prenotato e non
erogabile.

**Requisiti e regole**: `RF-343`, `RF-344`, `RF-345`, `BR-180`, `BR-181`, `BR-182`.

### UC-03 - Verifica tecnica preventiva del paziente

**Attore primario**: paziente (`ATT-01`) o caregiver (`ATT-02`). **Secondario**: front-office.
**Portata**: sessione media e sala d'attesa.

**Precondizioni.** Esiste un contatto prenotato con collegamento valido.

**Flusso principale.**

1. Il paziente apre il collegamento di verifica, in qualunque momento prima dell'appuntamento.
2. Il sistema verifica telecamera, microfono, altoparlante, banda, latenza e raggiungibilità del
   relay.
3. Presenta l'esito con semaforo e spiegazione in linguaggio comune.
4. Associa l'esito all'appuntamento e lo rende disponibile al front-office.

**Flussi alternativi.**

- **A1 - Permesso di dispositivo non concesso.** Il sistema mostra istruzioni specifiche per il
  browser e il sistema operativo rilevati, con l'immagine della richiesta effettiva, e consente la
  riesecuzione del test senza ripartire dall'inizio (`RF-055`, `RF-060`).
- **A2 - Dispositivo o browser non supportati.** Rilevazione precoce con indicazione
  dell'alternativa concreta e tempo utile per cambiare dispositivo prima dell'appuntamento.
- **A3 - Diagnostica assistita dal front-office.** Su consenso dell'utente, l'operatore avvia da
  remoto una diagnostica che restituisce solo informazioni tecniche (`RF-168`).

**Flussi di errore.**

- **E1 - Esito negativo persistente a ridosso dell'appuntamento.** Il contatto compare nella vista
  dei rischi della giornata; il front-office interviene proattivamente, propone il ripiego
  telefonico o riprogramma.
- **E2 - Verifica mai eseguita.** I promemoria la richiamano; l'assenza di verifica è visibile al
  front-office e non produce da sola alcun effetto amministrativo a carico del paziente.

**Postcondizioni.** L'esito e la sua data sono associati al contatto; il front-office dispone della
vista dei rischi aggiornata.

**Requisiti e regole**: `RF-055`, `RF-060`, `RF-161`, `RF-162`, `RF-168`, `BR-024`.

### UC-04 - Raccolta delle manifestazioni di volontà

**Attore primario**: paziente (`ATT-01`) o rappresentante legale (`ATT-03`).
**Portata**: consenso.

**Precondizioni.** Le informative vigenti sono pubblicate e versionate; il tipo di prestazione
dichiara quali manifestazioni sono obbligatorie.

**Flusso principale.**

1. Il sistema presenta l'informativa nella versione vigente.
2. Presenta separatamente ciascuna manifestazione richiesta: adesione informata alla prestazione a
   distanza, base giuridica del trattamento ove il consenso sia applicabile, consenso alla
   registrazione ove prevista, consenso alla presenza di terzi ove prevista.
3. Nessuna opzione risulta preselezionata; la conferma si abilita dopo lo scorrimento completo del
   testo.
4. Registra per ciascuna: identità del dichiarante e dell'interessato, versione del testo, istante,
   canale, esito.

**Flussi alternativi.**

- **A1 - Manifestazione resa da un rappresentante legale.** Il sistema verifica che l'ambito dei
  poteri registrati copra l'atto; registra titolo, estremi del provvedimento e validità temporale
  (`RF-117`).
- **A2 - Raccolta in sessione.** La raccolta avviene con lettura del testo e manifestazione
  esplicita durante la sessione, prima dell'inizio dell'atto (`RF-113`).
- **A3 - Revoca.** Ha effetto immediato sui trattamenti futuri, non richiede motivazione e non
  travolge le altre manifestazioni (`RF-115`).

**Flussi di errore.**

- **E1 - Manifestazione obbligatoria mancante all'ammissione.** Il sistema la segnala al
  professionista e propone la raccolta immediata prima dell'inizio dell'atto (`RF-114`).
- **E2 - Caregiver che tenta di prestare consenso per un paziente capace.** Rifiutato in ogni
  configurazione, con messaggio che distingue assistenza e rappresentanza (`BR-062`).
- **E3 - Ambito dei poteri non comprensivo dell'atto sanitario.** Rifiutato con segnalazione al
  front-office (`RF-117`).

**Postcondizioni.** Esiste, per ciascuna manifestazione, un'evidenza riferita a una versione
immutabile di testo, consultabile dal paziente e dal responsabile della protezione dei dati.

**Requisiti e regole**: `RF-110` … `RF-117`, `RF-237`, `BR-060` … `BR-063`.

### UC-05 - Ingresso in sala d'attesa e ammissione

**Attore primario**: paziente. **Secondario**: medico, front-office.
**Portata**: sala d'attesa e prestazione clinica.

**Precondizioni.** Il contatto è prenotato; la finestra della sala d'attesa è aperta.

**Flusso principale.**

1. Il paziente apre il collegamento; il sistema esegue il controllo tecnico e mostra l'esito.
2. Il paziente entra in sala d'attesa; il professionista vede orario previsto, ora di arrivo, esito
   tecnico, presenza di terzi dichiarati.
3. Il professionista ammette esplicitamente il paziente. Non esiste ingresso automatico.

**Flussi alternativi.**

- **A1 - Ritardo del professionista oltre la soglia.** Il paziente riceve automaticamente in sala
  d'attesa il ritardo stimato, aggiornato periodicamente (`RF-058`).
- **A2 - Uscita e rientro entro la finestra.** La posizione in coda e l'esito tecnico sono
  preservati (`RF-061`).
- **A3 - Contatto multi-professionista.** Il consulente attende in un'area professionale distinta,
  non visibile al paziente finché la sessione condivisa non inizia (`RF-063`).

**Flussi di errore.**

- **E1 - Accesso fuori finestra.** Rifiutato con messaggio che indica l'orario corretto, mai con un
  errore generico (`BR-029`).
- **E2 - Paziente mai connesso entro la tolleranza.** Esito `EX-NOSHOW`, ma **solo** se la
  telemetria non registra alcun tentativo di connessione (`BR-024`).
- **E3 - Paziente connesso, tecnicamente bloccato.** Esito `EX-TECH-PATIENT`: non è una mancata
  presentazione, non produce effetti amministrativi e apre il percorso di riprogrammazione.
- **E4 - Paziente entrato e uscito senza essere ammesso.** Esito di abbandono in attesa, con gli
  istanti registrati; distinto dalla mancata presentazione (`RF-062`).
- **E5 - Chiusura della finestra con paziente ancora presente.** Messaggio esplicativo con
  riferimento del front-office e proposta di riprogrammazione, mai una disconnessione muta
  (`RF-064`).

**Postcondizioni.** *Successo*: il contatto è in corso. *Fallimento*: il contatto porta un esito
tipizzato che distingue la responsabilità e non produce addebiti impropri.

**Requisiti e regole**: `RF-055` … `RF-064`, `BR-024`, `BR-029`.

### UC-06 - Identificazione del paziente

**Attore primario**: medico. **Portata**: prestazione clinica.

**Precondizioni.** La sessione è avviata. L'autenticazione è avvenuta, ma **non è
identificazione**: certifica chi possiede la credenziale, non chi è davanti alla telecamera.

**Flusso principale.**

1. Il professionista richiede al paziente di identificarsi con il metodo configurato.
2. Registra l'avvenuta identificazione con il metodo effettivamente usato, l'esito e l'istante.
3. Il sistema sblocca l'apertura della bozza di documento.

**Flussi alternativi.**

- **A1 - Metodo alternativo configurato.** Riconoscimento da parte del curante che conosce il
  paziente, accesso con identità digitale di livello elevato, presenza di un operatore presso il
  punto di erogazione. Il metodo effettivamente usato è registrato nominativamente e riportato nel
  documento (`RF-080`).
- **A2 - Terzo presente non previsto.** Il professionista lo dichiara, il sistema chiede al paziente
  conferma esplicita, l'ingresso e l'uscita sono registrati con gli orari. Il sistema **non** esegue
  rilevazione automatica di volti.

**Flussi di errore.**

- **E1 - Documento non leggibile o discordanza minore.** Il sistema propone il metodo alternativo
  configurato; l'esito è registrato.
- **E2 - Discordanza sostanziale.** Esito `EX-IDENT-FAIL`: l'atto non è eseguibile, il contatto è
  annullato senza addebito, la motivazione è registrata.
- **E3 - Apertura della bozza senza identificazione registrata.** Impedita (`RF-077`).
- **E4 - Soggetto minore o incapace senza titolo valido.** Esito `EX-CAPACITY`: contatto sospeso in
  attesa del titolo, senza addebito.

**Postcondizioni.** L'atto di identificazione esiste come fatto autonomo, distinto
dall'autenticazione, con metodo, esito, autore e istante.

**Requisiti e regole**: `RF-077`, `RF-080`, `BR-031`.

### UC-07 - Svolgimento della prestazione a distanza

**Attore primario**: medico. **Secondari**: paziente, caregiver, interprete, consulente.
**Portata**: prestazione clinica e sessione media.

**Precondizioni.** Consensi verificati, identificazione registrata, luogo di svolgimento
confermato.

**Flusso principale.**

1. Il sistema chiede al paziente di confermare o correggere l'indirizzo in cui si trova e lo
   conserva per la durata del contatto.
2. I partecipanti sono elencati con nome e qualifica, visibili a tutti per l'intera durata.
3. Il professionista conduce l'atto, annota, condivide documenti, richiede allegati.
4. Il sistema campiona le metriche di qualità a intervallo fisso.
5. Il professionista chiude la sessione selezionando un esito da elenco codificato.

**Flussi alternativi.**

- **A1 - Estensione oltre la durata pianificata.** Il sistema mostra il ritardo indotto e informa il
  paziente successivo in attesa (`RF-085`).
- **A2 - Stanza laterale fra professionisti.** Sempre annunciata al paziente con messaggio esplicito
  e registrata; non esiste modalità silenziosa (`BR-068`).
- **A3 - Trasferimento a un altro professionista.** Il paziente è informato con nome e qualifica del
  subentrante; il contatto registra entrambi con i rispettivi intervalli (`RF-086`).

**Flussi di errore.**

- **E1 - Emergenza clinica.** Vedi `UC-09`, flusso dedicato.
- **E2 - Chiusura senza esito.** Impedita: il contatto resta sospeso e viene segnalato; il sistema
  non attribuisce esiti clinici (`BR-032`).
- **E3 - Disattivazione amministrativa dell'utente durante la sessione.** La sessione media è
  terminata entro il tempo previsto, i partecipanti ricevono una notifica di interruzione
  amministrativa e il contatto resta sospeso (`RF-011`).

**Postcondizioni.** Il contatto è concluso con esito dichiarato da un professionista; il rapporto
tecnico di sessione è disponibile.

**Requisiti e regole**: `RF-078` … `RF-086`, `RF-352`, `BR-032`, `BR-038`, `BR-039`.

### UC-08 - Degrado del canale, ripiego e riconnessione

**Attore primario**: sistema. **Secondari**: medico, paziente.
**Portata**: sessione media, con effetti sulla prestazione clinica.

**Precondizioni.** Sessione in corso; soglie di qualità configurate per il tipo di prestazione.

**Flusso principale.**

1. Il sistema rileva il superamento della soglia per la durata configurata.
2. Avvisa entrambi i partecipanti indicando la causa probabile e le azioni suggerite, **senza
   formulare valutazioni cliniche**.
3. Riduce il profilo video preservando l'audio.
4. Se il degrado persiste, commuta il flusso su relay.
5. La decisione di proseguire, degradare o interrompere resta del professionista.

**Flussi alternativi.**

- **A1 - Degrado rientrato.** Ripristino del profilo nominale, con il cambio registrato.
- **A2 - Sola fonia.** Il video è sospeso, l'audio prosegue senza interruzioni percepibili, entrambi
  i partecipanti sono avvisati (`RF-073`).
- **A3 - Ripiego su canale telefonico.** Il cambio di canale e la motivazione sono registrati e
  riportati nel documento: un atto svolto senza componente visiva può non soddisfare i requisiti
  della prestazione prevista (`BR-006`, `RF-076`).

**Flussi di errore.**

- **E1 - Perdita di connettività.** Il contatto **non cambia stato**: la sessione media passa a
  riconnessione, il paziente vede un conto alla rovescia con azioni disponibili, il professionista
  vede il tempo residuo di attesa (`BR-030`, `RF-074`, `RF-075`).
- **E2 - Riconnessione riuscita entro la finestra.** Esito `EX-TECH-DROP`: stessa sessione clinica,
  interruzione e durata annotate nel contatto.
- **E3 - Riconnessione non riuscita.** Esito `EX-TECH-FAIL`: si propone il ripiego in fonia o la
  riprogrammazione con priorità.
- **E4 - Qualità sotto la soglia clinicamente accettabile per quel tipo di prestazione.** Esito
  `EX-QOS`: l'atto è sospeso o degradato per decisione del professionista.

**Postcondizioni.** Ogni cambio di canale, interruzione e ripresa è registrato con istanti e durate,
ed è disponibile per il documento e per la gestione dei reclami.

**Requisiti e regole**: `RF-072` … `RF-076`, `RF-166`, `RF-167`, `RF-172`, `BR-006`, `BR-030`,
`BR-033`, `BR-034`.

### UC-09 - Emergenza clinica e interruzione con riprogrammazione in presenza

**Attore primario**: medico. **Secondari**: front-office, caregiver.
**Portata**: prestazione clinica.

**Precondizioni.** Sessione in corso; luogo di svolgimento confermato all'avvio.

**Flusso principale (emergenza).**

1. Il professionista attiva la procedura con un comando sempre visibile.
2. Il sistema mostra immediatamente luogo dichiarato, recapiti telefonici e contatto di emergenza.
3. Allerta il front-office con priorità che scavalca le preferenze di notifica.
4. Il professionista registra ora di attivazione, azioni intraprese ed esito.
5. La sessione non può essere chiusa senza la registrazione dell'esito.

**Il sistema non chiama i soccorsi e non valuta la gravità.** Rende disponibili al medico le
informazioni logistiche che non ha perché il paziente non è nella stessa stanza. È supporto
logistico, non supporto decisionale clinico.

**Flusso principale (interruzione per inadeguatezza del canale).**

1. Il professionista interrompe la prestazione.
2. Seleziona l'esito tipizzato con la causa.
3. Il sistema genera la richiesta di prestazione in presenza collegata al contatto interrotto.
4. Propone al paziente gli appuntamenti disponibili, senza addebito ulteriore.

**Flussi alternativi.**

- **A1 - Escalation clinica decisa dal professionista.** Esito `EX-ESCALATE`: la prestazione è
  erogata e conclusa, e ne nasce una nuova richiesta. È un esito legittimo, da misurare come
  indicatore e non da minimizzare.
- **A2 - Caregiver presente.** Il professionista impartisce istruzioni operative; la presenza è
  registrata.

**Flussi di errore.**

- **E1 - Nessuno slot disponibile per la prestazione in presenza.** Il caso entra in una coda di
  intervento del front-office con priorità, e non si chiude come «riprogrammazione proposta».
- **E2 - Recapiti telefonici assenti o non verificati.** Il sistema lo segnala **prima** dell'inizio
  della sessione, nella vista dei rischi, perché in emergenza è troppo tardi.

**Postcondizioni.** Esiste una traccia completa dell'evento con istanti e azioni; nel caso di
interruzione esiste una richiesta di prestazione in presenza collegata.

**Requisiti e regole**: `RF-081`, `RF-082`, `RF-156`, `RF-348`, `BR-039`, `BR-183`.

### UC-10 - Refertazione, firma e consegna

**Attore primario**: medico. **Secondari**: paziente, integratore.
**Portata**: documentazione clinica.

**Precondizioni.** Contatto concluso con esito; identificazione registrata; modello di documento
associato al tipo di prestazione.

**Flusso principale.**

1. Il professionista apre la bozza, che non è visibile al paziente né trasmissibile.
2. Il sistema precompila **soltanto** dati anagrafici, amministrativi e temporali; nessun campo di
   valutazione clinica contiene testo generato.
3. Il documento riporta automaticamente identità e qualifica del refertante, struttura, punto di
   erogazione, data e ora dell'atto, tipo di prestazione, canale, metodo di identificazione,
   attestazione della qualità del collegamento ed eventuali limitazioni tecniche occorse.
4. Il professionista completa il contenuto clinico e conferma l'idoneità del collegamento.
5. Appone la firma con il livello configurato; il sistema verifica validità e stato del certificato.
6. Il documento diventa immodificabile e viene messo a disposizione del paziente in area
   autenticata, con notifica priva di contenuto clinico.
7. Il documento e i metadati sono trasmessi al sistema di origine e, se abilitato e consentito, al
   repository documentale.

**Flussi alternativi.**

- **A1 - Erogazione da parte del medico di assistenza primaria.** Prescrizione non necessaria e
  annotazione digitale in luogo del referto (`RF-349`).
- **A2 - Consegna differita motivata.** Il paziente vede l'indicazione che l'esito sarà illustrato
  in un colloquio programmato; il differimento è registrato con l'identità di chi lo ha disposto
  (`RF-132`).
- **A3 - Riservatezza rafforzata.** Il documento è escluso dalla condivisione automatica e dalle
  notifiche esterne; la trasmissione richiede un'azione esplicita motivata (`RF-135`).
- **A4 - Teleconsulto con documenti multipli.** Relazione del consulente e documento del curante
  restano distinti, con autori distinti, collegati allo stesso contatto (`RF-133`).
- **A5 - Difficoltà di accesso al fascicolo dichiarata dall'assistito.** Consegna su canale sicuro
  con doppia autenticazione, su richiesta registrata (`RF-351`).

**Flussi di errore.**

- **E1 - Sezione obbligatoria non compilata.** Firma impedita con indicazione della sezione
  mancante (`RF-125`).
- **E2 - Certificato scaduto o revocato.** Firma rifiutata con messaggio specifico; il documento
  resta bozza (`RF-127`).
- **E3 - Consenso alla trasmissione assente.** La trasmissione non parte; il fatto è registrato come
  condizione nota e comunicato al professionista, non come errore tecnico (`RF-120`).
- **E4 - Fallimento della trasmissione al sistema di origine.** Il caso entra nella coda di
  riconciliazione visibile, con causa, numero di tentativi e possibilità di rilancio; non è un
  errore silenzioso (`RF-215`, `BR-048`).
- **E5 - Termine di refertazione superato.** Sollecito al professionista e segnalazione al
  responsabile del servizio (`RF-130`).

**Postcondizioni.** *Successo*: esiste un documento firmato, immodificabile, disponibile al paziente
e restituito al sistema di origine. *Fallimento*: esiste una bozza, e il motivo dell'impedimento è
esplicito e tracciato.

**Requisiti e regole**: `RF-124` … `RF-136`, `RF-215`, `RF-349` … `RF-351`, `BR-040` … `BR-049`.

### UC-11 - Rettifica di un documento firmato

**Attore primario**: medico. **Portata**: documentazione clinica.

**Precondizioni.** Esiste un documento firmato e messo a disposizione.

**Flusso principale.**

1. Il professionista richiede la rettifica indicando la motivazione.
2. Il sistema crea una nuova versione che annulla e sostituisce la precedente.
3. Entrambe le versioni restano consultabili; la precedente è marcata come annullata e la nuova
   riporta il riferimento e la motivazione.
4. La nuova versione segue lo stesso percorso di firma, consegna e trasmissione.

**Flussi alternativi.**

- **A1 - Rettifica di un documento già trasmesso all'esterno.** La trasmissione della nuova versione
  include il riferimento a quella sostituita, e l'esito della sostituzione presso il destinatario è
  tracciato.

**Flussi di errore.**

- **E1 - Tentativo di modifica in luogo di rettifica.** Rifiutato: un documento firmato è
  immutabile (`BR-044`).
- **E2 - Rettifica senza motivazione.** Rifiutata.
- **E3 - Notifica al paziente che rivela il contenuto della correzione.** Impedita dalla regola sul
  contenuto minimo delle notifiche esterne (`BR-050`).

**Postcondizioni.** La catena documentale è integra e ricostruibile; nessuna versione è andata
perduta.

**Requisiti e regole**: `RF-128`, `BR-044`, `BR-050`.

### UC-12 - Teleconsulto fra professionisti

**Attore primario**: medico richiedente (`ATT-04`, `ATT-05`). **Secondario**: consulente (`ATT-06`).
**Portata**: prestazione clinica e documentazione.

**Precondizioni.** Il richiedente ha una relazione di cura con l'assistito; il materiale da
allegare è selezionabile.

**Flusso principale.**

1. Il richiedente apre la richiesta con quesito clinico, urgenza e allegati selezionati.
2. Il sistema verifica la relazione di cura e crea un **ambito di accesso limitato** ai soli
   allegati.
3. Notifica il consulente con la scadenza.
4. Il consulente accetta, consulta esclusivamente il materiale nell'ambito, redige e firma la
   risposta.
5. Il sistema notifica il richiedente, **revoca l'ambito** e restituisce la risposta al sistema di
   origine.

**Flussi alternativi.**

- **A1 - Teleconsulto sincrono con paziente presente.** Il paziente è informato della presenza del
  terzo professionista e ne presta consenso; l'elenco dei partecipanti con nome e qualifica è
  visibile per tutta la durata; esiste un conduttore identificato con i poteri di moderazione.
- **A2 - Secondo parere richiesto dall'assistito.** Non è un teleconsulto: il richiedente è il
  paziente e il consulente non entra nella presa in carico. Il percorso è distinto e la fattispecie
  documentale è diversa.

**Flussi di errore.**

- **E1 - Rifiuto o scadenza.** L'ambito è revocato immediatamente; il richiedente è notificato con
  la motivazione.
- **E2 - Tentativo del consulente di accedere fuori ambito.** Rifiutato e registrato come tentativo
  di accesso non autorizzato (`BR-014`).
- **E3 - Ambito ancora attivo oltre il termine.** Anomalia rilevata e chiusa automaticamente, con
  evento di sicurezza.

**Postcondizioni.** Esistono una richiesta e una relazione collegate, con autori distinti; l'ambito
di accesso del consulente è chiuso.

**Requisiti e regole**: `RF-133`, `BR-007`, `BR-014`, `BR-049`, `BR-184`.

## 3. Casi d'uso del telemonitoraggio

### UC-13 - Pubblicazione di un percorso di cura

**Attore primario**: redattore e approvatore del percorso (`ATT-25`).
**Portata**: percorso di cura.

**Precondizioni.** L'attore opera in un ambito organizzativo del tenant per cui è abilitato.

**Flusso principale.**

1. L'attore carica il percorso come dato strutturato: popolazione, criteri di inclusione ed
   esclusione, nodi, punti di decisione, responsabilità, tempi e finestre, criteri di transizione e
   di uscita, indicatori.
2. Il sistema valida integralmente il percorso.
3. L'attore pubblica la versione con ambito e data di decorrenza.
4. La versione diventa immutabile e disponibile per l'istanziazione.

**Flussi alternativi.**

- **A1 - Sostituzione di una versione in vigore.** La nuova versione entra in vigore alla data
  dichiarata; le istanze in corso restano agganciate alla versione precedente e la loro migrazione
  è un atto esplicito di un professionista (`RF-232`).
- **A2 - Ritiro di una versione.** La versione non è più istanziabile; le istanze esistenti
  proseguono e sono elencate per la valutazione della migrazione.

**Flussi di errore.**

- **E1 - Percorso incoerente.** Pubblicazione rifiutata con l'elenco puntuale degli elementi non
  validi, in linguaggio comprensibile a chi lo ha redatto; nessuna versione parziale è creata
  (`RF-231`).
- **E2 - Percorso che contiene soglie individuali.** Rifiutato: il percorso può indicare
  riferimenti attribuiti, non stabilire la soglia di un assistito (`BR-130`, `BR-131`).
- **E3 - Tentativo di pubblicare in un ambito non di competenza.** Rifiutato e registrato.

**Postcondizioni.** Esiste una versione di percorso immutabile, con ambito e decorrenza, disponibile
solo al proprio tenant.

**Requisiti e regole**: `RF-230` … `RF-232`, `BR-100`, `BR-101`, `BR-104`, `BR-105`.

### UC-14 - Arruolamento e redazione del piano di telemonitoraggio

**Attore primario**: professionista responsabile del piano (`ATT-20`). **Secondari**: paziente,
caregiver, case manager, centro servizi, formatore.
**Portata**: percorso di cura, consenso, anagrafiche.

**Precondizioni.** Esiste una presa in carico; esiste una versione di percorso applicabile; la
copertura del servizio è dichiarata e vigente.

**Flusso principale.**

1. Proposta di arruolamento, originata da una presa in carico esistente, da una dimissione o da una
   valutazione ambulatoriale.
2. Valutazione di eleggibilità sulle quattro dimensioni: clinica, tecnologica, di autonomia e
   competenza, di contesto. Ciascuna con esito registrato.
3. Raccolta delle manifestazioni di volontà dell'arruolamento (`UC-04`).
4. Istanziazione del piano dalla versione di percorso applicabile, con il riferimento alla versione.
5. Redazione del piano: parametri, cadenze codificate, fasce orarie, tipo di rilevazione, durata,
   destinatari degli allarmi, item di uscita dal canale.
6. **Configurazione delle soglie individuali**, con campi vuoti obbligatori e riferimenti del
   percorso mostrati accanto, attribuiti e in sola lettura.
7. Assegnazione dei dispositivi con verifica tecnica ed emissione del documento firmato di
   assegnazione.
8. Formazione del paziente e del caregiver, con esito registrato.
9. Firma del piano.

**Flussi alternativi.**

- **A1 - Non eleggibile.** Il percorso si chiude con motivazione registrata e con l'indicazione del
  percorso alternativo; l'esito negativo resta consultabile.
- **A2 - Eleggibile con caregiver.** L'autonomia insufficiente è compensata dal caregiver, che
  diventa parte del piano con proprio collegamento e proprie istruzioni.
- **A3 - Deviazione dal percorso.** Il professionista imposta cadenze o parametri diversi da quelli
  del percorso, registrando la motivazione; l'operazione non è bloccata (`RF-234`).

**Flussi di errore.**

- **E1 - Tentativo di auto-attivazione da parte del paziente.** La funzione non esiste
  nell'interfaccia e la chiamata applicativa è rifiutata (`RF-236`).
- **E2 - Soglia fuori dai limiti di ammissibilità.** Rifiutata con l'indicazione dell'intervallo; il
  tentativo è registrato come quasi evento (`RF-241`).
- **E3 - Documento di assegnazione del dispositivo incompleto.** Generazione rifiutata con
  l'indicazione del campo mancante (`RF-238`).
- **E4 - Dimensione di eleggibilità non valutata.** Il passaggio alla redazione del piano è impedito
  (`RF-235`).

**Postcondizioni.** *Successo*: esiste un piano firmato, non ancora attivo, completo di soglie,
destinatari, dispositivi assegnati e formazione registrata. *Fallimento*: esiste una valutazione di
eleggibilità con esito e motivazione, e nessun piano attivo.

**Requisiti e regole**: `RF-233` … `RF-241`, `BR-102`, `BR-103`, `BR-106`, `BR-131`, `BR-132`.

### UC-15 - Attivazione del piano

**Attore primario**: professionista responsabile. **Portata**: percorso di cura.

**Precondizioni.** Piano firmato; soglie configurate per tutti i parametri che generano allarme;
copertura dichiarata e vigente; destinatari degli allarmi individuati; dispositivi assegnati con
verifica positiva; formazione registrata.

**Flusso principale.**

1. Il professionista richiede l'attivazione.
2. Il sistema verifica tutte le condizioni di attivabilità.
3. Registra l'istante di attivazione.
4. Da quell'istante iniziano a decorrere le finestre di attesa di ciascun parametro.
5. Il paziente e il caregiver ricevono la conferma con la copertura del servizio, il canale
   alternativo e le istruzioni operative.

**Flussi alternativi.**

- **A1 - Attivazione differita.** L'attivazione è programmata a una data futura; fino ad allora il
  piano non genera assenze e compare fra i piani firmati e non attivi.

**Flussi di errore.**

- **E1 - Condizione di attivabilità non soddisfatta.** Attivazione rifiutata con l'elenco puntuale;
  nessuna configurazione consente di superare il controllo (`RF-243`).
- **E2 - Copertura non dichiarata.** Caso particolare del precedente, e il più importante: un
  servizio che promette sorveglianza senza dichiarare quando la esercita è più pericoloso
  dell'assenza di servizio (`BR-160`).
- **E3 - Piano firmato e mai attivato oltre il tempo previsto.** Compare in una coda dedicata con
  l'indicazione del tempo trascorso; non decade da solo (`RF-242`).

**Postcondizioni.** Il piano è attivo con un istante preciso; la sorveglianza è iniziata; il
paziente conosce la copertura e il canale alternativo.

**Requisiti e regole**: `RF-242`, `RF-243`, `RF-309`, `RF-310`, `BR-107`, `BR-160`, `BR-161`.

### UC-16 - Rilevazione e acquisizione di una misura

**Attore primario**: paziente (`ATT-01`), caregiver (`ATT-02`) o gateway (`ATT-24`).
**Portata**: telemonitoraggio.

**Precondizioni.** Piano attivo; parametro previsto; finestra di rilevazione aperta secondo il
piano.

**Flusso principale (inserimento manuale).**

1. L'interfaccia mostra il parametro atteso, l'unità di misura e le condizioni di rilevazione
   previste dal piano.
2. L'utente inserisce il valore; il sistema applica il formato locale corretto e la tastiera
   appropriata.
3. Il sistema verifica la plausibilità e, se necessario, chiede una conferma esplicita che ripete il
   valore in forma discorsiva con l'unità.
4. Registra la misura con istante di misura, istante di ricezione, provenienza, unità, condizioni e
   indicatore di attendibilità.
5. La misura entra nella serie e viene valutata contro le regole del piano vigente all'istante di
   misura.

**Flusso principale (ingestione da gateway).**

1. Il gateway trasmette il lotto autenticandosi come principal applicativo.
2. Il sistema verifica appartenenza del soggetto al tenant, conformità allo schema, unità, criterio
   di identità per l'idempotenza.
3. Acquisisce le misure conformi, rifiuta puntualmente le non conformi e restituisce l'esito.

**Flussi alternativi.**

- **A1 - Caregiver che assiste più persone.** Il soggetto corrente è indicato in modo permanente; il
  cambio richiede una conferma che nomina il soggetto di destinazione (`RF-264`).
- **A2 - Misura fuori dalle condizioni previste.** Acquisita e marcata come incompleta rispetto al
  protocollo; l'incompletezza è visibile a chi la valuta.
- **A3 - Connettività assente durante l'inserimento.** La misura è conservata localmente e trasmessa
  al ripristino, con istante di misura preservato (`RNF-107`).
- **A4 - Dato in ritardo.** Concorre alla serie del giorno della misura, non del giorno della
  ricezione; se esiste un allarme di assenza per quella finestra, viene riconciliato con esito
  `EX-TM-LATE` (`RF-254`, `RF-304`).
- **A5 - Dato fuori ordine.** Innesca la rivalutazione della finestra interessata; un eventuale
  allarme generato è marcato come tardivo con l'età del dato (`RF-262`, `RF-263`).

**Flussi di errore.**

- **E1 - Valore tecnicamente impossibile.** Esito `EX-TM-IMPLAUS`: allarme tecnico, la misura non
  entra nella serie clinica (`RF-259`).
- **E2 - Unità di misura assente o conversione non definita.** Misura rifiutata invece di essere
  acquisita con unità presunta; rifiuto restituito al gateway e generato come allarme tecnico
  (`RF-256`).
- **E3 - Duplicato.** Nessun secondo punto nella serie, nessun secondo allarme; il duplicato è
  contato nella telemetria tecnica (`RF-260`).
- **E4 - Rilevazione iniziata e non completata.** Esito `EX-TM-USEERR`: il tentativo è registrato con
  la fase di interruzione e concorre a qualificare il silenzio (`RF-266`).
- **E5 - Dispositivo con carica insufficiente o taratura scaduta.** Esito `EX-TM-DEVICE`: allarme
  tecnico generato **prima** che le misure si interrompano (`RF-265`).

**Postcondizioni.** *Successo*: la serie contiene una misura immutabile con il proprio contesto
completo, ed è stata valutata. *Fallimento*: esiste un allarme tecnico con causa puntuale, e la
serie clinica non è stata contaminata.

**Requisiti e regole**: `RF-251` … `RF-266`, `BR-110` … `BR-115`.

### UC-17 - Somministrazione di un questionario e calcolo di un punteggio

**Attore primario**: paziente o caregiver; in eterosomministrazione, professionista.
**Portata**: telemonitoraggio e punteggi.

**Precondizioni.** Il piano prevede il questionario; la scala è registrata con versione,
popolazione, regola di calcolo, trattamento dei mancanti, regola interpretativa e licenza.

**Flusso principale.**

1. Il sistema somministra gli item nella versione prevista dal piano.
2. Registra ogni risposta con item, valore, chi ha risposto e modalità di somministrazione.
3. Calcola il punteggio secondo la regola versionata.
4. Persiste il punteggio con la tracciabilità completa del calcolo.
5. Presenta il punteggio al professionista **come proposta da validare**, con il dettaglio degli
   item che lo compongono.
6. Il professionista valida; il punteggio è attribuito a lui.

**Flussi alternativi.**

- **A1 - Item marcato come uscita dal canale.** Il flusso si interrompe e si passa a `UC-20` prima di
  qualunque altra interazione; le risposte già fornite sono conservate.
- **A2 - Somministrazione da parte del caregiver.** La modalità è registrata e resta distinguibile:
  un valore riferito dalla persona e uno stimato da un terzo non sono lo stesso dato.
- **A3 - Scala che ammette imputazione dei mancanti.** Il punteggio è calcolato e **marcato come
  parziale**, e non è confrontato con punteggi pieni senza dichiararlo.

**Flussi di errore.**

- **E1 - Item mancante con scala che non ammette imputazione.** Nessun punteggio è prodotto; il
  sistema mostra quali item mancano (`RF-326`).
- **E2 - Scala priva di riferimento alla licenza.** Non abilitabile (`RF-323`).
- **E3 - Discordanza fra due presentazioni dello stesso punteggio.** Deve essere impossibile:
  aritmetica esatta e assenza di arrotondamenti divergenti sono verificate automaticamente
  (`RF-328`).
- **E4 - Punteggio non validato usato in un documento firmato.** Impedito (`RF-331`).

**Postcondizioni.** Esiste un punteggio con otto elementi di tracciabilità e un validatore
identificato, oppure non esiste alcun punteggio e la ragione è esplicita.

**Requisiti e regole**: `RF-253`, `RF-323` … `RF-332`, `BR-120` … `BR-127`.

### UC-18 - Generazione, consegna e presa in carico di un allarme

**Attore primario**: sistema. **Secondari**: case manager (`ATT-21`), professionista responsabile
(`ATT-20`), centro servizi (`ATT-22`), centro erogatore (`ATT-23`).
**Portata**: allarmi.

**Precondizioni.** Piano attivo con regole e soglie; copertura dichiarata; destinatari configurati
per fascia oraria e severità.

**Flusso principale.**

1. Il motore valuta la misura contro le regole del piano vigente **all'istante di misura**.
2. Al soddisfacimento di una condizione genera un evento di allarme immutabile contenente:
   condizione, riferimenti puntuali ai dati che l'hanno prodotto, versione della regola, natura
   tecnica o clinica, severità, destinatario, scadenza di riscontro.
3. Consegna la notifica sui canali configurati e registra, per ciascuno, esito e istante della
   conferma.
4. Il destinatario prende in carico con un'azione deliberata, distinta dalla visualizzazione.
5. Esegue la valutazione clinica e la registra.
6. Chiude l'allarme con esito tipizzato e azione intrapresa.

**Flussi alternativi.**

- **A1 - Nessuna condizione soddisfatta.** La valutazione si chiude senza allarme, e il fatto della
  valutazione resta registrato.
- **A2 - Raggruppamento.** Più allarmi correlati sono notificati insieme; il gruppo eredita la
  **severità massima** e la scadenza dell'allarme più severo (`RF-286`).
- **A3 - Sospensione temporanea.** Attribuita, motivata, con durata massima codificata e
  riattivazione automatica; alla riattivazione la condizione eventualmente persistente è
  ripresentata (`RF-287`).
- **A4 - Allarme tecnico.** Instradato al centro servizi, che non accede al contenuto clinico.

**Flussi di errore.**

- **E1 - Consegna non confermata entro il tempo previsto per il canale.** Evento di consegna non
  confermata, tentativo del canale successivo, episodio visibile nella storia (`RF-277`).
- **E2 - Nessun destinatario attivo in quella fascia.** L'allarme è marcato `EX-TM-OUTOFHOURS` e
  trattato secondo la politica di copertura; non risulta in alcuno stato che lasci intendere una
  presa in carico avvenuta (`RF-312`).
- **E3 - Presa in carico senza risoluzione oltre il tempo massimo.** L'allarme entra nella coda
  degli assunti e non chiusi, visibile al responsabile del servizio (`RF-279`, `RF-280`).
- **E4 - Allarme tecnico non risolto entro il tempo definito.** Genera un allarme **clinico** di
  assenza di sorveglianza, collegato al primo (`RF-288`).
- **E5 - Tentativo di chiusura senza esito tipizzato.** Rifiutato: senza esito non si può misurare la
  quota di allarmi che producono azione (`RF-289`).

**Postcondizioni.** *Successo*: l'allarme è chiuso con esito e azione, e la sua storia è integralmente
ricostruibile. *Fallimento*: l'allarme è aperto, con lo stato esatto della catena e senza alcuna
chiusura implicita.

**Requisiti e regole**: `RF-269` … `RF-290`, `BR-133` … `BR-143`.

### UC-19 - Mancato riscontro ed escalation

**Attore primario**: sistema. **Secondari**: catena dei destinatari, responsabile del servizio.
**Portata**: allarmi.

**Precondizioni.** Esiste un allarme consegnato con scadenza di riscontro; esiste una catena di
escalation configurata per tenant, percorso e severità, consapevole delle fasce orarie.

**Flusso principale.**

1. La scadenza decorre senza presa in carico: esito `EX-TM-NOACK`, generato come evento.
2. Il sistema individua l'anello successivo, verificando che sia **effettivamente coperto** in quel
   momento.
3. Consegna sul canale previsto per quell'anello, eventualmente diverso dal precedente.
4. Registra istante, destinatario, canale, esito della consegna e motivo del passaggio.
5. Ripete finché un anello prende in carico.

**Flussi alternativi.**

- **A1 - Aumento di severità.** L'escalation può muoversi lungo severità, destinatario, canale e
  perimetro: le quattro dimensioni sono ortogonali e configurabili.
- **A2 - Anello fuori copertura.** Saltato con registrazione del motivo; la catena prosegue verso un
  destinatario attivo (`RF-281`).

**Flussi di errore.**

- **E1 - Catena esaurita senza presa in carico.** Esito `EX-TM-ESCFAIL`: viene generato un
  **fallimento dichiarato della gestione**, con severità propria e notifica al responsabile del
  servizio. L'allarme **resta aperto**; non viene chiuso per scadenza (`RF-282`).
- **E2 - Canale di notifica indisponibile.** L'assenza di consegna è rilevata e trattata: una
  escalation che si interrompe in silenzio quando cade un servizio esterno riproduce esattamente il
  problema che doveva risolvere (`RF-277`).
- **E3 - Anello che punta allo stesso destinatario che non ha risposto.** Configurazione rifiutata
  alla definizione della catena, non tollerata a tempo di esecuzione.
- **E4 - Catena mai provata a freddo entro la periodicità dichiarata.** Segnalata come tale: una
  catena mai provata è, statisticamente, una catena rotta (`RF-284`, `RNF-097`).

**Postcondizioni.** Ogni passaggio è persistito; l'eventuale fallimento della gestione è un fatto
registrato e visibile, non un silenzio.

**Requisiti e regole**: `RF-274`, `RF-281` … `RF-284`, `RNF-096`, `RNF-097`, `BR-133`, `BR-134`,
`BR-141`, `BR-142`.

### UC-20 - Uscita dal canale e instradamento

**Attore primario**: paziente o caregiver. **Secondario**: team clinico.
**Portata**: telemonitoraggio, copertura, notifiche.

**Precondizioni.** Il piano contiene item marcati da un clinico come uscita dal canale, con i
relativi testi di instradamento configurati per territorio e per orario.

**Flusso principale.**

1. Il paziente fornisce una risposta corrispondente a un item marcato.
2. Il sistema **riconosce il marcatore** per confronto sull'item strutturato.
3. Interrompe immediatamente il flusso in corso.
4. Mostra l'istruzione di instradamento configurata: quale canale, con quale recapito, con quale
   urgenza. Il testo è configurato, non generato.
5. Registra che cosa è stato mostrato, quando, a chi, e che cosa l'utente ha fatto dopo.
6. Notifica il team secondo le regole del piano, **senza far dipendere l'istruzione dalla risposta
   del team**.

**Flussi alternativi.**

- **A1 - Evento fuori copertura.** L'istruzione al paziente è identica e immediata; la notifica al
  team è accodata secondo la politica dichiarata (`RF-318`).
- **A2 - Rilevazione da un canale diverso.** L'uscita può emergere da un questionario, da un valore
  inserito, da un'interazione in sessione: il sistema deve intercettarla da più punti d'ingresso con
  la stessa conseguenza.

**Flussi di errore.**

- **E1 - Testo di instradamento non configurato per il territorio o l'orario.** Il piano non è
  attivabile; se l'anomalia emerge in esercizio, il sistema mostra il testo di livello superiore
  configurato e genera un allarme di configurazione con severità alta.
- **E2 - Messaggio che promette un richiamo in luogo dell'istruzione.** Impedito: la verifica
  automatica del catalogo dei messaggi fallisce se un messaggio di uscita non contiene canale,
  recapito e urgenza (`RF-319`, `RNF-105`).
- **E3 - Tentativo di dedurre l'uscita da testo libero o da combinazioni non dichiarate.** La
  verifica di conformità architetturale fallisce: il sistema riconosce, non inferisce (`RF-315`).

**Postcondizioni.** Il paziente ha ricevuto un'istruzione operativa immediata e inequivocabile; il
fatto è documentato ed è al tempo stesso documentazione clinica e prova di adempimento.

**Requisiti e regole**: `RF-311`, `RF-313`, `RF-315` … `RF-320`, `BR-162` … `BR-165`.

### UC-21 - Silenzio del paziente

**Attore primario**: sistema. **Secondari**: case manager, centro servizi, paziente.
**Portata**: telemonitoraggio e allarmi.

**Precondizioni.** Piano attivo con finestre di attesa derivate dalla frequenza codificata e dalla
fascia oraria.

**Flusso principale.**

1. La finestra di attesa di un parametro decorre senza misura.
2. Il sistema genera l'evento `EX-TM-NOSIGNAL`, con destinatario, scadenza ed escalation come ogni
   altro allarme.
3. Il sistema tenta di **spiegare** il silenzio, nell'ordine: stato del dispositivo, segnale di
   presenza, tentativi falliti registrati, dichiarazione di indisponibilità, eventi amministrativi
   noti.
4. Qualifica l'allarme con la causa individuata e lo instrada di conseguenza: al centro servizi se
   tecnica, al team clinico altrimenti.
5. Se nessuna causa spiega il silenzio, l'esito è `EX-TM-UNEXPLAINED` e il sistema apre
   un'**attività di contatto umano** assegnata a una persona, con scadenza propria.
6. La chiusura dell'attività di contatto, con esito, risolve l'allarme.

**Flussi alternativi.**

- **A1 - Misura non attesa.** Nessun evento è generato; la vista clinica indica che in quel momento
  la misura non era attesa, e non lascia una lacuna ambigua (`RF-295`).
- **A2 - Assenza dichiarata.** Esito `EX-TM-DECLARED`: l'evento è generato con causa dichiarata e
  severità ridotta secondo il piano, **non soppresso**; alla fine del periodo la severità torna
  ordinaria senza alcuna azione (`RF-297`).
- **A3 - Assenza spiegata da un evento amministrativo.** Esito `EX-TM-ADMIN`: la causa presunta e la
  sua fonte sono riportate, e il destinatario la conferma o la smentisce registrando l'esito.
- **A4 - Dato che arriva in ritardo.** L'allarme è chiuso con `EX-TM-LATE` e la misura è valutata
  (`RF-304`).

**Flussi di errore.**

- **E1 - Silenzio persistente senza spiegazione né contatto riuscito.** Esito `EX-TM-DROPOUT` solo
  dopo l'esaurimento documentato dei tentativi di contatto e con decisione del professionista; **mai
  per decorso del tempo** (`RF-247`).
- **E2 - Assenza trattata come normalità da una vista clinica.** Difetto di sicurezza: ogni vista
  espone l'età dell'ultimo dato in evidenza, e l'assenza è rappresentata come tale nei report
  (`RF-248`, `RF-303`).
- **E3 - Sospensione della sorveglianza per ridurre il rumore.** Vietata: la riduzione del rumore
  agisce sulla severità e sull'instradamento, mai sulla generazione dell'evento di assenza
  (`BR-150`).

**Postcondizioni.** Ogni finestra decorsa senza misura ha prodotto un fatto registrato, qualificato
per causa, con un responsabile della sua chiusura.

**Requisiti e regole**: `RF-293` … `RF-299`, `RF-304`, `BR-150` … `BR-154`.

### UC-22 - Guasto sistemico dell'ingestione

**Attore primario**: sistema. **Secondari**: amministratore di sistema, centro servizi, servizio
clinico.
**Portata**: telemonitoraggio, piattaforma.

**Precondizioni.** Il sistema conosce il volume di misure atteso per finestra, per tenant e per
sorgente.

**Perché è il caso peggiore.** Riguarda tutti i pazienti insieme; è invisibile per costruzione se il
sistema non lo cerca attivamente, perché «non arriva nulla» è indistinguibile dalla normalità in un
sistema mal progettato; e genera, se non rilevato, un'onda di allarmi individuali che satura il
servizio proprio nel momento in cui i dati mancano.

**Flusso principale.**

1. Il volume ricevuto scende oltre la soglia di scostamento configurata rispetto all'atteso.
2. Il sistema genera un **unico** allarme di piattaforma `EX-TM-INGEST`, con severità massima,
   destinatario tecnico, elenco delle sorgenti coinvolte e numero di soggetti interessati.
3. Comunica il guasto **anche al servizio clinico**, mentre accade, con il perimetro di sorveglianza
   sospeso.
4. Qualifica gli allarmi individuali di assenza generati nel periodo come **non valutabili per
   indisponibilità della sorgente**, senza cancellarli.
5. Al ripristino, rivaluta i dati arrivati nel frattempo e riattiva gli allarmi che restano privi di
   spiegazione.

**Flussi alternativi.**

- **A1 - Scostamento attribuibile a una singola sorgente.** L'allarme è circoscritto a quella
  sorgente e ai suoi soggetti, senza sospendere la sorveglianza degli altri.
- **A2 - Variazione fisiologica del volume.** La soglia di scostamento e la finestra di osservazione
  sono configurabili proprio per distinguere la variazione attesa dal guasto.

**Flussi di errore.**

- **E1 - Guasto rilevato dopo la scadenza delle finestre individuali.** Il requisito è violato:
  `RNF-092` impone la rilevazione **prima** della scadenza della prima finestra individuale del
  piano più stretto in esercizio.
- **E2 - Soppressione degli allarmi individuali invece della loro qualificazione.** Vietata: la
  qualificazione conserva l'informazione, la soppressione la distrugge (`RF-302`).
- **E3 - Comunicazione al solo gruppo tecnico.** Difetto: è il servizio clinico che deve decidere se
  attivare un canale alternativo per i pazienti più instabili, e può farlo solo se sa (`RF-303`).

**Postcondizioni.** Esiste un unico allarme di piattaforma con perimetro esplicito; il servizio
clinico è informato; nessun allarme individuale è andato perduto.

**Requisiti e regole**: `RF-300` … `RF-303`, `RNF-092`, `BR-155`.

### UC-23 - Revisione e conclusione del piano

**Attore primario**: professionista responsabile. **Secondari**: paziente, caregiver, centro
servizi, medico curante.
**Portata**: percorso di cura.

**Flusso principale (revisione).**

1. Il professionista modifica soglie, cadenze, parametri o destinatari.
2. Il sistema crea una nuova versione con autore, motivazione e istante di efficacia.
3. Propaga la versione al lato paziente e ne attende la presa in carico.
4. Lo stato di efficacia è visibile a entrambe le parti.

**Flusso principale (conclusione).**

1. Il professionista conclude il piano selezionando una motivazione tipizzata: obiettivo raggiunto,
   durata esaurita, revoca dell'adesione, non aderenza persistente, evento che rende il percorso non
   più applicabile.
2. Il sistema genera la relazione finale in bozza.
3. Notifica il paziente e il medico curante.
4. Apre l'attività di ritiro dei dispositivi assegnati.

**Flussi alternativi.**

- **A1 - Migrazione a una nuova versione di percorso.** Atto esplicito e tracciato, che non avviene
  mai per effetto della pubblicazione della nuova versione (`RF-232`).
- **A2 - Sospensione temporanea del piano.** Con durata dichiarata, motivazione e ripresa
  automatica; il paziente è informato che in quel periodo non è sorvegliato.

**Flussi di errore.**

- **E1 - Versione non presa in carico dal lato paziente.** Esito `EX-TM-PLANSTALE`: il professionista
  vede lo stato «in attesa di presa in carico» con l'istante dell'ultimo tentativo, e **non** uno
  stato che lasci intendere che la modifica sia operativa (`RF-245`).
- **E2 - Tentativo di modifica sul posto.** Rifiutato: ogni modifica è una nuova versione (`RF-244`).
- **E3 - Piano che smette di ricevere dati e nessuno lo conclude.** Non è concluso, è **abbandonato**,
  che è la condizione peggiore: resta attivo con anomalia persistente in evidenza (`RF-247`).
- **E4 - Conclusione senza relazione finale.** La conclusione è registrata ma il percorso resta
  incompleto e compare fra le pendenze documentali del servizio.

**Postcondizioni.** Esiste una catena di versioni del piano integralmente ricostruibile; alla
conclusione esistono una motivazione tipizzata, una relazione finale e un'attività di ritiro dei
dispositivi.

**Requisiti e regole**: `RF-244` … `RF-248`, `BR-102`, `BR-108`, `BR-109`.

### UC-24 - Correzione di una misura e riconciliazione degli allarmi

**Attore primario**: paziente, caregiver o professionista.
**Portata**: telemonitoraggio e allarmi.

**Precondizioni.** Esiste una misura acquisita, eventualmente già valutata e all'origine di un
allarme.

**Flusso principale.**

1. L'utente corregge la misura o la dichiara non valida.
2. Il sistema crea una nuova versione, marcando la precedente come sostituita; **nulla è
   cancellato**.
3. Rivaluta la finestra interessata con le regole vigenti all'istante di misura.
4. Se sulla misura originaria era stato generato un allarme, l'allarme **non scompare**: è chiuso
   con esito `EX-TM-CORRECTED` e resta nella storia.
5. Se la rivalutazione produce una nuova condizione, genera un nuovo allarme marcato come derivante
   da rivalutazione.

**Flussi alternativi.**

- **A1 - Correzione dopo la chiusura dell'allarme.** L'allarme chiuso resta chiuso; la correzione è
  collegata e visibile nella sua storia.
- **A2 - Correzione che riguarda un dato già confluito in un report periodico.** Il report non è
  riscritto: si emette una versione successiva che riporta la correzione.

**Flussi di errore.**

- **E1 - Tentativo di cancellare la misura.** Rifiutato in ogni ruolo (`RF-261`).
- **E2 - Correzione che non riconcilia gli allarmi.** Difetto: è lo scenario d'uso pericoloso che
  lascia in circolo un valore errato già valutato.
- **E3 - Rivalutazione che genera un allarme su un fatto vecchio.** Ammessa ma **marcata come
  tardiva** con l'età del dato, e chiudibile con esito dedicato senza alterare le statistiche di
  riscontro (`RF-263`).

**Postcondizioni.** La storia contiene entrambe le versioni, ciò che il sistema ha valutato quando lo
ha valutato, e gli allarmi riconciliati con esito esplicito.

**Requisiti e regole**: `RF-258`, `RF-261` … `RF-263`, `RF-304`, `BR-110`, `BR-113`, `BR-115`.

## 4. Sintesi degli esiti e responsabilità

La tabella riassume, per ciascuna famiglia di esiti, chi ne risponde e quale effetto amministrativo
è ammesso. È la parte che, se sbagliata, produce contenzioso.

| Famiglia di esiti | Chi decide l'esito | Effetto amministrativo ammesso |
|---|---|---|
| Esiti clinici della prestazione (`EX-CLIN-STOP`, `EX-ESCALATE`, `EX-EMERGENCY`) | esclusivamente il professionista | secondo il tipo di prestazione; l'escalation in presenza è un esito legittimo, non un fallimento |
| Esiti tecnici imputabili al servizio (`EX-TECH-FAIL`, `EX-QOS`) | il sistema rileva, il professionista qualifica | nessun addebito al paziente; obbligo di riprogrammazione |
| Esiti tecnici imputabili al lato paziente (`EX-TECH-PATIENT`) | il sistema rileva con evidenza telemetrica | **non** è mancata presentazione; riprogrammazione senza addebito |
| Mancata presentazione (`EX-NOSHOW`) | il sistema, solo in assenza di qualunque tentativo registrato | effetti configurabili dal tenant, solo se comunicati in fase di prenotazione |
| Esiti di identificazione e capacità (`EX-IDENT-FAIL`, `EX-CAPACITY`) | il professionista | contatto annullato o sospeso senza addebito |
| Esiti di assenza del dato (`EX-TM-NOSIGNAL`, `EX-TM-UNEXPLAINED`, `EX-TM-DROPOUT`) | il sistema rileva, il clinico qualifica e chiude | nessuno automatico; la conclusione del percorso richiede sempre un atto |
| Esiti tecnici del telemonitoraggio (`EX-TM-DEVICE`, `EX-TM-LINK`, `EX-TM-INGEST`) | il centro servizi | nessuno a carico dell'assistito |
| Esiti di gestione dell'allarme (`EX-TM-NOACK`, `EX-TM-ESCFAIL`) | il sistema rileva, il responsabile del servizio risponde | indicatore di sicurezza; nessun effetto sull'assistito |
| Uscita dal canale (`EX-TM-EXIT`) | il sistema riconosce un marcatore posto da un clinico | nessuno; il fatto è documentazione clinica e prova di adempimento |

