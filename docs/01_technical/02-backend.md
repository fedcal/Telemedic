---
title: Backend
sidebar_position: 3
description: Struttura dei moduli, regola di dipendenza, confini transazionali, modello di concorrenza sui thread virtuali, validazione ai confini del sistema, gestione degli errori, configurazione tipizzata e profili di esecuzione.
---

# Backend

Questo capitolo descrive **come è fatto** il servizio: dove sta il codice, che cosa può
dipendere da che cosa, dove comincia e dove finisce una transazione, che cosa succede quando
arrivano mille richieste insieme, che cosa si valida e dove, e che forma ha un errore. Non
descrive che cosa fa il sistema: quello è `docs/03_functional/`. Non descrive perché i confini
dei contesti sono quelli: quello è `docs/02_architecture/` e la base architetturale §1.

I fondamenti — che cos'è una transazione, che cos'è un aggregato, che cos'è l'idempotenza —
stanno in [`docs/10_fondamenti/11-fondamenti-informatici.md`](../10_fondamenti/11-fondamenti-informatici.md)
e non si ripetono.

---

## 1. La regola che governa tutto: si separa per dominio, non per livello

L'errore di struttura più costoso è organizzare il codice per natura tecnica — tutti i
controllori insieme, tutti i servizi insieme, tutti i repositori insieme. Produce un sistema in
cui ogni funzionalità è sparsa in cinque punti e in cui nessuna dipendenza è vietata, perché
tutto sta allo stesso livello di tutto.

Telemedic si organizza per **contesto delimitato**, secondo la tabella della base architetturale
§1. Ogni contesto è un modulo di compilazione autonomo con un confine reale, non una convenzione
di nomi di cartella.

```
telemedic/
├─ platform/                 componenti trasversali, nessuna logica di dominio
│  ├─ tenancy/               risoluzione, propagazione e verifica del contesto di tenant
│  ├─ security/              confine di autorizzazione, scambio di token, livello di garanzia
│  ├─ outbox/                tabella di outbox, relay, buste degli eventi
│  ├─ problem/               catalogo degli errori e loro rappresentazione
│  ├─ observability/         correlazione, redazione, misure
│  └─ terminology-gateway/   punto unico di accesso alle terminologie
├─ contexts/
│  ├─ identity/              identità e accessi
│  ├─ registry/              anagrafiche
│  ├─ scheduling/            agenda
│  ├─ encounter/             prestazione clinica
│  ├─ media-session/         sessione media
│  ├─ clinical-document/     documentazione clinica
│  ├─ monitoring/            telemonitoraggio
│  ├─ alerting/              notifiche e allarmi
│  ├─ consent/               consenso
│  ├─ outbound/              interoperabilità in uscita
│  ├─ audit/                 tracciamento
│  └─ tenant-admin/          amministrazione tenant
├─ interfaces/
│  ├─ rest-api/              interfaccia applicativa di progetto
│  ├─ fhir-facade/           facciata di interoperabilità
│  ├─ signaling/             segnalazione della sessione media
│  └─ webhooks/              consegna verso sistemi terzi
└─ app/                      assemblaggio, configurazione, avvio
```

**Regole di dipendenza, verificate automaticamente in integrazione continua.** Non sono
raccomandazioni: sono prove che falliscono la costruzione.

1. Nessun contesto dipende da un altro contesto. Comunicano per interfaccia sincrona esposta
   nel proprio pacchetto `api`, o per evento.
2. Nessun contesto accede alla base dati di un altro contesto. Lo schema è per contesto (vedi
   [`03-persistenza.md`](./03-persistenza.md) §2) e le credenziali applicative non hanno
   privilegi incrociati: la regola è applicata dal motore, non dalla disciplina.
3. `platform` non dipende da `contexts` né da `interfaces`. È il livello sotto.
4. `interfaces` dipende da `contexts` attraverso i pacchetti `api`, mai attraverso `domain` o
   `infrastructure`.
5. `contexts/*/domain` non dipende da nulla se non dalla libreria standard e da `platform`.
   Nessuna annotazione di persistenza, nessuna annotazione web, nessun tipo del quadro di
   lavoro nel dominio.

La quinta regola è quella che si viola per prima e che costa di più. La motivazione non è di
purezza: il dominio clinico è la parte che va verificata più a fondo per il fascicolo tecnico, e
una classe che per essere provata richiede un contenitore, una base dati e un contesto web è una
classe che si prova male, lentamente e raramente.

---

## 2. Anatomia di un contesto

Ogni contesto ha la stessa forma interna. La ripetizione è voluta: chi apre un contesto che non
conosce sa già dove guardare.

```
contexts/media-session/
├─ api/                interfacce e tipi che gli altri possono usare
│  ├─ MediaSessionFacade.java
│  ├─ command/         comandi in ingresso, immutabili
│  └─ view/            proiezioni in uscita, immutabili
├─ domain/             modello, invarianti, decisioni
│  ├─ model/           aggregati, entità, oggetti valore
│  ├─ event/           eventi di dominio
│  ├─ policy/          regole esprimibili senza infrastruttura
│  └─ port/            porte verso l'esterno, dichiarate dal dominio
├─ application/        casi d'uso, orchestrazione, confine transazionale
└─ infrastructure/     realizzazioni delle porte: persistenza, clienti, adattatori
```

**`api` è contratto interno.** Un altro contesto vede solo questo. Cambiare `domain` non rompe
nessuno; cambiare `api` sì, ed è un cambiamento che si discute.

**`domain` non ha effetti collaterali.** Riceve dati, decide, restituisce una decisione e degli
eventi. Non scrive, non chiama, non registra. Questo lo rende provabile con prove unitarie pure
— e le prove unitarie pure sono le uniche che si possono eseguire migliaia di volte, cioè le
uniche su cui si può fondare una copertura credibile.

**`application` è il livello che ha effetti.** Apre la transazione, carica l'aggregato, invoca il
dominio, persiste il risultato, scrive l'evento nell'outbox, chiude. È il posto in cui si trova
`@Transactional`, e l'unico.

**`infrastructure` è sostituibile per definizione.** È il livello che conosce la base dati, il
protocollo, il formato. Nessuna decisione di dominio ci abita.

---

## 3. Il confine di autorizzazione

Il confine è unico e sta all'ingresso: nessuna richiesta raggiunge un contesto senza aver
attraversato la catena di sicurezza, e nessun contesto ripete la validazione del token. Ripeterla
darebbe l'illusione della difesa in profondità e, in pratica, produrrebbe versioni divergenti
della stessa logica.

Il gateway di Telemedic realizza in proprio lo scambio di token, come impone D18. Sul piano
tecnico i punti non negoziabili sono quattro.

1. **Il token in ingresso dell'integratore è validato per intero prima di qualunque altra cosa**:
   firma su chiave risolta dal materiale pubblico dichiarato per quel tenant, emittente atteso,
   destinatario atteso, finestra temporale con tolleranza dichiarata, identificativo di chiave
   presente nell'insieme consentito per quel tenant. Un token che non superi anche uno solo di
   questi controlli non produce un token interno e non produce una registrazione di accesso: è
   un tentativo respinto e come tale finisce nel tracciamento.
2. **La delega si rappresenta sempre con il claim di attore**, mai sostituendo il soggetto. La
   differenza è sostanziale in sede di indagine post-incidente: la delega dice «X ha operato per
   conto di Y», l'impersonificazione dice «era Y», e cancella la responsabilità reale.
3. **Il livello di garanzia dell'autenticazione viaggia nel claim dedicato ed è qualificato con
   un marcatore proprio del progetto** che distingue l'autenticazione **eseguita** da Telemedic
   da quella **riferita** dall'integratore. Il vincolo V-18 di `INTEG` e il vincolo V-17 di `SEC`
   convergono su questo punto e questa area li recepisce: un'operazione che la norma lega
   all'autenticazione forte richiede un livello **eseguito**, e la verifica avviene nel punto di
   decisione, non nel gateway.
4. **Il contesto di tenant è risolto qui e solo qui.** Da questo punto in poi è un dato del
   contesto di esecuzione, propagato esplicitamente e verificato all'ingresso di ogni contesto.
   Non è mai un parametro di richiesta: un parametro è controllabile dal chiamante.

Il codice di questo confine è codice di sicurezza critico e ne discendono obblighi propri —
revisione esterna indipendente, prove di abuso dedicate, copertura sostanzialmente totale sul
percorso di validazione. Il modello di minaccia sta in `docs/06_security/`.

---

## 4. Transazioni

### 4.1 Il confine è il caso d'uso

Una transazione comincia all'inizio di un metodo di `application` e finisce alla sua uscita.
Mai più in alto — un confine sul controllore terrebbe aperta la transazione durante la
serializzazione della risposta — e mai più in basso — un confine sul repositorio produrrebbe
tante transazioni quante sono le scritture, distruggendo l'atomicità che è la ragione per cui
esistono.

### 4.2 Le cinque regole

**R1 — L'evento di dominio si scrive nella stessa transazione del dato.** È l'outbox
transazionale imposto dalla base architetturale §5. Non c'è una seconda scrittura applicativa
verso il broker, e non c'è un `@TransactionalEventListener` che pubblichi dopo il commit: quello
è precisamente il modo di perdere un evento se il processo muore fra il commit e la
pubblicazione.

**R2 — Nessuna chiamata remota dentro una transazione.** Chiamare il sistema dell'integratore,
il fascicolo, il gateway delle terminologie o il prodotto di federazione mentre una transazione
è aperta significa tenere una connessione e dei blocchi per la durata di una latenza che non
si controlla. Il modello è: si legge, si chiude, si chiama, si riapre e si applica il risultato
con un controllo di concorrenza ottimistica. Dove serve coordinare più passi con effetti esterni
si usa un processo a lunga durata con compensazione esplicita, non una transazione lunga.

**R3 — Le letture sono dichiarate in sola lettura.** Non è micro-ottimizzazione: consente al
livello di persistenza di saltare il controllo delle modifiche e, soprattutto, rende esplicito
nel codice che quel caso d'uso non modifica nulla — informazione utile a chi legge e a chi
verifica.

**R4 — L'isolamento predefinito è quello della base dati, e le eccezioni sono motivate nel
codice.** Dove un invariante richiede un isolamento più forte, lo si dichiara con un commento
che dice *quale* invariante lo richiede. Un livello di isolamento alzato «per sicurezza» è un
punto di conflitto in attesa di manifestarsi sotto carico.

**R5 — Il contesto di tenant è impostato dentro la transazione, prima di qualunque
interrogazione.** La sicurezza a livello di riga legge una variabile di sessione: se la
variabile non è impostata, le politiche devono negare tutto. Impostarla fuori dalla transazione
o dopo la prima interrogazione è la classe di errore che produce fughe di dati fra tenant, ed è
esattamente ciò che la difesa in profondità deve rendere impossibile.

### 4.3 Come si vede in pratica

```java
package dev.telemedic.contexts.mediasession.application;

// Illustrativo. Le firme sono realistiche, il contenuto è ridotto all'essenziale.
@Service
public class ChiudiSessioneMediaUseCase {

    private final MediaSessionRepository sessioni;
    private final OutboxWriter outbox;
    private final Clock clock;

    public ChiudiSessioneMediaUseCase(MediaSessionRepository sessioni,
                                      OutboxWriter outbox,
                                      Clock clock) {
        this.sessioni = sessioni;
        this.outbox = outbox;
        this.clock = clock;
    }

    /**
     * Chiude una sessione media e registra l'esito.
     * Il contesto di tenant è già risolto e verificato: qui si assume presente
     * e lo si asserisce, perché un'assunzione non verificata è un difetto latente.
     */
    @Transactional
    public EsitoChiusura esegui(ChiudiSessioneCommand comando, TenantContext tenant) {
        Objects.requireNonNull(tenant, "contesto di tenant non risolto");

        MediaSession sessione = sessioni.caricaPerAggiornamento(comando.sessionId(), tenant)
                .orElseThrow(() -> new SessioneNonTrovata(comando.sessionId()));

        // Il dominio decide. Non scrive, non chiama, non registra.
        RisultatoChiusura risultato = sessione.chiudi(
                comando.motivo(),
                comando.riepilogoQualita(),
                Instant.now(clock));

        sessioni.salva(sessione);

        // Stessa transazione del dato: è la regola R1.
        // La busta non trasporta contenuto clinico: è il vincolo V-14 di INTEG.
        outbox.accoda(EventoDominio.di(
                "dev.telemedic.mediasession.chiusa.v1",
                sessione.id(),
                tenant.id(),
                risultato.riferimentiPubblicabili()));

        return EsitoChiusura.da(risultato);
    }
}
```

Tre cose che questo frammento dichiara implicitamente e che vale la pena rendere esplicite:
l'orologio è iniettato — senza di che le prove sul tempo diventano fragili e il comportamento
non è riproducibile; il caricamento è *per aggiornamento*, cioè con la semantica di blocco
dichiarata nel repositorio e non lasciata al caso; l'evento porta **riferimenti**, non
contenuto.

---

## 5. Concorrenza

### 5.1 Il modello scelto

**Un thread virtuale per richiesta, codice bloccante, nessuna programmazione reattiva sul
percorso principale.** La motivazione è di leggibilità e di verificabilità: il dominio clinico è
già abbastanza difficile senza aggiungere una macchina a stati implicita fatta di operatori
concatenati. Uno stack di eccezione leggibile e un punto di interruzione che funziona sono, in
un sistema che deve essere ispezionabile dopo un incidente, un requisito e non un lusso.

### 5.2 Le trappole reali dei thread virtuali

Vanno scritte, perché sono la ragione per cui questa scelta a volte fallisce.

**Il blocco su monitor nativo inchioda il thread portante.** Una sezione sincronizzata che
contiene un'operazione bloccante impedisce al thread virtuale di sganciarsi, e il vantaggio
svanisce. Regola di progetto: **nessuna sezione sincronizzata contenente attese**; dove serve
mutua esclusione si usa un blocco riferibile della libreria di concorrenza. La regola è
verificata da analisi statica, non lasciata alla memoria.

**Il vero limite non è il numero di thread: è il pool di connessioni alla base dati.** Con
migliaia di thread virtuali che convergono su venti connessioni, il collo di bottiglia si
sposta e il sintomo diventa una coda invisibile con latenze in coda lunga. Conseguenza
operativa: il pool va dimensionato e **osservato** (tempo di attesa di acquisizione, non solo
connessioni attive), e ogni caso d'uso ha un limite di tempo. Il dimensionamento è in
[`07-prestazioni-e-capacita.md`](./07-prestazioni-e-capacita.md).

**Le variabili di contesto vanno propagate esplicitamente.** Il contesto di tenant, il contesto
di sicurezza e il contesto di correlazione non attraversano da soli un confine asincrono. Si usa
il meccanismo di propagazione del contesto del quadro di lavoro, e le prove verificano che
attraversino: una prova che verifichi che il tenant è ancora quello dopo un salto asincrono vale
più di dieci pagine di documentazione.

**Non si mette in cache un thread virtuale.** Sono a buon mercato e si creano; un pool di thread
virtuali è un controsenso che reintroduce esattamente il limite che si voleva togliere.

### 5.3 Dove la programmazione reattiva è ammessa

In un solo caso: i flussi a lunga durata con molte connessioni per lo più inattive — la
segnalazione della sessione media, la consegna di eventi verso l'interfaccia. Lì il modello a
eventi è appropriato perché il problema è realmente quello. Ovunque altro è vietato dal profilo
di progetto, e l'introduzione va discussa come decisione architetturale.

### 5.4 Contropressione

Un sistema che accetta tutto ciò che gli arriva non è disponibile: è in ritardo, che è peggio,
perché il chiamante non lo sa. La contropressione è esplicita a quattro livelli — limite di
richieste per tenant e per credenziale, semaforo di ammissione per classe di operazione, coda
limitata con rifiuto dichiarato quando è piena, limite di tempo su ogni chiamata uscente. Il
dettaglio, i valori e il modo in cui si dichiarano al chiamante stanno in
[`07-prestazioni-e-capacita.md`](./07-prestazioni-e-capacita.md) §5.

Il principio tecnico è uno: **il rifiuto è una risposta corretta, l'attesa indefinita no**. Un
rifiuto con indicazione di quando riprovare permette al chiamante di comportarsi bene; un'attesa
senza fine produce ritentativi che moltiplicano il carico proprio quando il sistema è già in
difficoltà.

---

## 6. Validazione ai confini

### 6.1 Il principio

Nessun dato proveniente dall'esterno del processo è considerato valido: né quello dell'utente,
né quello dell'integratore, né quello del sistema regionale, né quello che arriva dal broker.
La validazione è **al confine**, una volta, in modo completo, e produce un errore che dice
esattamente che cosa non va e dove.

### 6.2 I quattro confini

| Confine | Che cosa entra | Come si valida | Che cosa si emette in caso di rifiuto |
|---|---|---|---|
| **Interfaccia applicativa di progetto** | Documenti JSON | Schema derivato dal documento di interfaccia, applicato a runtime e non solo generato in documentazione | Rappresentazione del problema in `application/problem+json` con l'elenco degli errori per campo |
| **Facciata di interoperabilità** | Risorse cliniche | Validazione strutturale, poi validazione di profilo contro i profili nazionali fissati per versione, poi validazione dei vincoli di terminologia attraverso il gateway | Esito dell'operazione secondo il modello della specifica, con gravità e localizzazione |
| **Eventi in ingresso** | Buste standardizzate | Schema della busta, poi schema del dato, poi verifica della chiave di deduplicazione | Messaggio spostato nella coda dei non elaborabili con motivo strutturato; mai scartato silenziosamente |
| **Segnalazione media** | Messaggi di negoziazione | Schema del protocollo di progetto, versionato, più verifica di appartenenza del mittente alla sessione | Chiusura del canale con codice e motivo; l'evento finisce nel tracciamento |

### 6.3 Tre precisazioni che fanno la differenza

**La validazione di profilo non è opzionale e non è gratuita.** Validare una risorsa clinica
contro un profilo nazionale richiede il pacchetto del profilo e, per i vincoli forti, la
risoluzione dei codici. Il pacchetto è **fissato per versione** e conservato come artefatto di
costruzione: una validazione che cambia esito perché a monte è cambiato un pacchetto è una
validazione non riproducibile, il che è inaccettabile in un sistema tracciabile.

**Il gateway delle terminologie deve poter essere assente.** Il vincolo V-03 impone che nessun
percorso principale richieda una terminologia a licenza vincolata. Sul piano tecnico questo
significa: il gateway ha una modalità degradata dichiarata per sistema di codifica, in cui la
struttura si valida e il codice si accetta con esito «non verificato» registrato sul dato, non
con un rifiuto. Il vincolo V-14 di `SEC` aggiunge che al gateway esterno non transitano
identificativi dell'assistito e che non esiste cache persistita su disco: entrambi sono vincoli
di realizzazione di questo componente e vanno provati.

**La validazione dell'ingresso non è la validazione dell'invariante.** Che una data sia una data
si controlla al confine. Che quella data sia compatibile con lo stato della prestazione si
controlla nel dominio. Confondere i due porta a duplicare regole cliniche nel livello web, dove
nessuno le cerca e dove divergeranno.

---

## 7. Errori

### 7.1 Due rappresentazioni, nessuna terza

Sul piano applicativo l'errore è una rappresentazione di problema in `application/problem+json`
secondo RFC 9457; sul piano di interoperabilità è l'esito dell'operazione previsto dalla
specifica clinica. Non esiste una terza forma. Il vincolo che questa area pone alle altre è
scritto in bacheca.

Struttura di progetto, con i membri di estensione ammessi:

```json
{
  "type": "https://telemedic.example/problems/sessione-non-avviabile",
  "title": "La sessione non può essere avviata",
  "status": 409,
  "detail": "L'appuntamento richiesto non è in uno stato che consente l'avvio della sessione.",
  "instance": "/v1/sessioni/ses_01J9ZC5P",
  "traceId": "00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01",
  "errors": [
    { "pointer": "#/appuntamento/stato", "code": "stato-non-ammesso" }
  ],
  "documentation": "https://docs.telemedic.example/it/errori/sessione-non-avviabile"
}
```

### 7.2 Le regole non negoziabili

1. **`detail` non contiene mai contenuto clinico né identificativi diretti dell'assistito.**
   Finisce nei registri del chiamante, che il progetto non controlla. Nell'esempio sopra il
   messaggio dice *che cosa* non va senza dire *chi* e *quando*: l'informazione specifica si
   ritrova con `traceId`, dentro il perimetro. Questo recepisce il vincolo V-13 di `SEC` e lo
   estende al canale degli errori, che è il punto in cui la fuga avviene più spesso.
2. **`type` è un indirizzo risolvibile** che porta alla pagina di documentazione dell'errore, con
   le cause tipiche e la risoluzione. È ciò che trasforma un errore in un'istruzione.
3. **Il catalogo è generato.** Gli identificativi di problema vivono in un file versionato da cui
   si generano le costanti del codice, la documentazione e i tipi dei kit di sviluppo. Un errore
   non catalogato **non deve poter essere emesso**: il gestore predefinito converte qualunque
   eccezione non mappata in un problema generico con codice 500, registra l'eccezione originale
   con il proprio identificativo di correlazione e **non** ne espone il messaggio. Un messaggio di
   eccezione esposto è una fuga di informazione strutturale.
4. **Gli errori si distinguono per natura, non per codice HTTP.** Un errore di validazione, un
   conflitto di stato del dominio, un'indisponibilità di un sistema a valle e un difetto interno
   sono quattro cose diverse per chi indaga, anche quando due di esse producono lo stesso codice.
   La distinzione vive nell'identificativo del tipo di problema e nella classificazione interna.
5. **Nessun errore clinico è silenzioso.** Se un'allerta non è stata recapitata, il fallimento è
   un fatto registrato e sottoposto a riscontro, non una riga di registro. Discende direttamente
   dal vincolo V-09: l'assenza di dato è informazione.

### 7.3 Gerarchia delle eccezioni

Quattro radici, e nient'altro: violazione di invariante di dominio, violazione di
precondizione applicativa, indisponibilità di una dipendenza, difetto interno. La mappatura
verso il catalogo dei problemi avviene in un unico punto, all'uscita. Un'eccezione tradotta in
due posti diversi produce, prima o poi, due risposte diverse per lo stesso caso.

---

## 8. Configurazione

### 8.1 Tipizzata, validata, che fallisce all'avvio

La configurazione è collegata a classi tipizzate e immutabili, validata con annotazioni, e
**verificata all'avvio**. Un servizio che parte con una configurazione incompleta e fallisce alla
prima richiesta clinica è peggiore di un servizio che non parte: il primo è un guasto durante un
consulto, il secondo è un guasto durante l'installazione.

```java
package dev.telemedic.platform.config;

// Illustrativo.
@ConfigurationProperties(prefix = "telemedic.media.relay")
@Validated
public record RelayProperties(
        @NotEmpty List<@NotBlank String> urls,
        @NotBlank String staticAuthSecretRef,      // riferimento, non valore
        @Min(60) @Max(3600) int credentialTtlSeconds,
        @NotNull Duration allocationBudget) {

    public RelayProperties {
        if (urls.stream().noneMatch(u -> u.startsWith("turns:"))) {
            throw new IllegalStateException(
                "Almeno un indirizzo di relay su trasporto protetto è obbligatorio");
        }
    }
}
```

Il punto rilevante è `staticAuthSecretRef`: **un riferimento, non un valore**. Il codice non
riceve mai il segreto dalla configurazione applicativa; lo risolve da un gestore di segreti al
momento dell'uso. Nei file di esempio, nella documentazione e nelle prove compaiono soltanto
segnaposto.

### 8.2 Le tre origini della configurazione, e la loro precedenza

| Origine | Contenuto | Chi la governa |
|---|---|---|
| **Predefiniti del prodotto** | Valori sicuri, nel repository | Il progetto |
| **Configurazione dell'installazione** | Indirizzi, dimensionamenti, profili attivi, moduli sostituibili | Il deployer |
| **Configurazione per tenant** | Personalizzazione di tema, terminologie abilitate, copertura oraria, quote, recapiti | L'amministratore del tenant |

Nessun segreto viaggia in nessuna delle tre: i segreti hanno un percorso separato. Le regole di
precedenza sono dichiarate e provate — una precedenza non provata è una fonte di sorprese in
produzione.

**La configurazione per tenant è dato, non file.** Vive nella base dati, è versionata, è
soggetta a tracciamento (chi ha cambiato la soglia di allerta e quando è una domanda che si
porrà) e ha una cronologia. La configurazione dell'installazione è file, ed è nel controllo di
configurazione del deployer.

### 8.3 Che cosa la configurazione **non** può fare

Non può cambiare il comportamento clinico. Nessuna proprietà può disattivare la registrazione di
un accesso, alterare la catena del registro immutabile, sopprimere un avviso di qualità
inadeguata, disattivare la verifica delle chiavi della sessione o modificare la valutazione di
una soglia. Le proprietà che toccano la sicurezza o la sicurezza del paziente hanno un solo
valore ammesso in produzione, il profilo di produzione lo impone, e una prova lo verifica. È
la traduzione tecnica del principio per cui un dispositivo non deve poter essere configurato in
uno stato non sicuro.

---

## 9. Profili

I profili sono ortogonali e si combinano; non sono un elenco piatto.

| Asse | Valori | Che cosa cambia |
|---|---|---|
| **Ambiente** | `dev` · `test` · `staging` · `prod` | Verbosità dei registri, generazione dei dati sintetici, esposizione degli endpoint di diagnostica, rigidità dei controlli di avvio |
| **Modello di installazione** | `single-tenant` · `multi-tenant` | Risoluzione del tenant (fissa contro derivata dal token), presenza dei pannelli di amministrazione multi-tenant |
| **Persistenza serie temporali** | `timeseries-extension` · `timeseries-native` | Realizzazione del repositorio delle serie temporali (vedi `01-stack-e-motivazioni.md` §7.3) |
| **Moduli sostituibili** | per modulo: `internal` · `external` · `disabled` | Refertazione, agenda, fatturazione: D14 impone che siano disattivabili e sostituibili per configurazione |
| **Registrazione** | `off` · `server-side` | Presenza del componente di registrazione. Vedi [`05-media-e-tempo-reale.md`](./05-media-e-tempo-reale.md) §8 |

**Regola vincolante: un profilo non cambia il codice del dominio.** Sostituire l'agenda interna
con quella dell'integratore cambia la realizzazione di una porta, non la logica della
prenotazione dal punto di vista del contesto della prestazione. Se cambiare profilo richiede un
ramo condizionale nel dominio, la porta è stata disegnata male.

**Regola vincolante: il profilo di produzione non ammette scorciatoie di sviluppo.** L'avvio in
profilo di produzione fallisce se sono attive origini permissive per le richieste da altri
domini, se un endpoint di diagnostica è esposto senza autenticazione, se il livello di registro
del dominio è a diagnostica, se un segreto è stato risolto da un valore letterale invece che dal
gestore. Sono controlli di avvio, con messaggi che dicono che cosa correggere.

---

## 10. Che cosa il backend non fa

Elenco breve, ma è quello che tiene i confini.

- **Non genera contenuto clinico.** Persiste ciò che il professionista ha redatto. È il vincolo
  V2 e vale fino in fondo: nessuna precompilazione che produca affermazioni cliniche, nessuna
  sintesi automatica presentata come contenuto del referto.
- **Non deduce soglie.** Le soglie sono configurate dal professionista per assistito (V-02). Il
  sistema le applica e traccia il calcolo; non le propone e non le adatta.
- **Non decifra il media.** Nella modalità predefinita non ne ha le chiavi e non le può avere.
  Nella modalità con registrazione il componente di registrazione è un servizio distinto, con un
  perimetro proprio, e la differenza è dichiarata nel consenso e segnalata in interfaccia in modo
  persistente.
- **Non è il padrone dei dati anagrafici.** Lavora per riferimento verso gli identificativi
  esterni del sistema di origine, come impone il profilo dell'integratore archetipo.
- **Non ha funzionalità raggiungibili solo dall'interfaccia.** È il vincolo V3, ribadito dal
  vincolo V-17 di `INTEG`: la capacità e il suo contratto nascono insieme.

---

**Prosegue in**: [`03-persistenza.md`](./03-persistenza.md) per lo schema, le migrazioni e
l'isolamento per tenant a livello di motore.
