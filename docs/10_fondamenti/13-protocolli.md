---
title: I protocolli, uno per uno
sidebar_position: 14
description: Catalogo ragionato di ogni protocollo che Telemedic parla — trasporto, web, interfacce applicative, identità, integrazione sanitaria, eventi, tempo reale — con il problema risolto, il meccanismo, l'uso nel progetto, gli errori tipici e le alternative scartate.
---

# I protocolli, uno per uno

Un sistema di telemedicina non è un'applicazione: è una **conversazione fra macchine che non
si conoscono**. Un gestionale sanitario di terze parti crea un appuntamento; un browser
scarica una pagina; due dispositivi si scambiano audio e video attraversando reti che non
vogliono farli passare; un evento di fine sessione raggiunge un sistema che potrebbe essere
spento in quel momento; un referto finisce in un'infrastruttura nazionale. Ognuna di queste
conversazioni ha regole proprie, e quelle regole si chiamano protocolli.

Questo modulo è il catalogo di **tutti** i protocolli che il progetto parla. Non è un elenco
di sigle: per ciascuno dice quale problema risolve, come funziona nei suoi meccanismi
essenziali, dove il progetto lo usa, quali errori si fanno regolarmente e quali alternative
sono state scartate e perché. Si può leggere di seguito, ma è pensato soprattutto per essere
consultato: ogni voce ha la stessa struttura, sempre.

---

## 0. Come si legge questo modulo

### 0.1 La struttura di ogni scheda

Ogni protocollo è trattato con sei voci, sempre nello stesso ordine:

| Voce | Che cosa contiene |
|---|---|
| **Problema** | La difficoltà concreta che il protocollo esiste per risolvere. Se non riesci a enunciarla, non hai capito il protocollo |
| **Meccanismo** | Come funziona: i messaggi, gli stati, le garanzie. Solo l'essenziale, non la specifica riscritta |
| **Nel progetto** | Dove Telemedic lo usa, in quale componente e per quale flusso |
| **Specifica** | Documento normativo, numero, stato di maturità. **Se una specifica è scaduta, in bozza o superata, è detto qui** |
| **Errori tipici** | Ciò che si sbaglia davvero, non ciò che si potrebbe teoricamente sbagliare |
| **Alternative scartate** | Che cosa si sarebbe potuto usare al suo posto, e la ragione per cui non lo si usa |

### 0.2 Legenda dei marcatori

| Marcatore | Significato |
|---|---|
| *(nessuno)* | Riferimento a un documento normativo pubblicato: il numero identifica in modo stabile il testo e si trova su `rfc-editor.org`, su `w3.org`, su `hl7.org` o sul sito dell'ente indicato |
| **`[B6]` `[B7]` `[R5]`** | Verificato su fonte primaria durante la fase di ricerca del progetto, nel documento indicato. Sono le affermazioni su cui il progetto ha già fatto il lavoro di controllo |
| **`[NV]`** | **Non verificato** su fonte primaria mentre questo modulo veniva scritto. Non significa «falso»: significa «controlla prima di implementare» |
| **«proposta di progetto»** | Non è uno standard: è una scelta di Telemedic. Nomi di intestazione, di scope, di claim e di endpoint marcati così **non vanno mai presentati come standard** |

Questa disciplina non è pedanteria. Buona parte degli errori di integrazione nasce da
qualcuno che ha scritto «header standard» accanto a un nome che nessun ente ha mai
standardizzato, e da qualcun altro che ci ha creduto.

### 0.3 Che cosa questo modulo non copre

- **Il dettaglio del tempo reale.** ICE, STUN, TURN, DTLS-SRTP, RTP e il canale dati hanno
  un modulo dedicato: [08 — WebRTC da zero](08-webrtc-da-zero.md). Qui ne trovi una scheda
  sintetica (§7) che serve a collocarli nel quadro generale, non a sostituirla.
- **Gli standard di contenuto sanitario.** HL7 versione 2, CDA release 2, i profili IHE, DICOM
  e le terminologie cliniche sono trattati in
  [05 — Gli standard di interoperabilità](05-standard-di-interoperabilita.md). Qui compaiono
  **solo come protocolli di trasporto o di interfaccia** (MLLP, DICOMweb, FHIR REST), con
  rinvio esplicito.
- **Il modello dati FHIR.** Sta in [06 — FHIR da zero](06-fhir-da-zero.md).
- **La teoria crittografica.** Cifratura simmetrica e asimmetrica, firma, PKI, funzioni di
  hash: [12 — Crittografia e sicurezza](12-crittografia-e-sicurezza.md). Qui si dà per
  acquisito che tu sappia cosa sia una firma digitale, e si parla di come i protocolli la
  usano.

---

## 1. Che cos'è un protocollo, davvero

### 1.1 La definizione minima

Un **protocollo** è un accordo fra due o più parti su:

1. **quali messaggi** possono essere scambiati;
2. **in quale ordine** (la macchina a stati della conversazione);
3. **come sono rappresentati i byte** di ciascun messaggio;
4. **che cosa significa** ciascun messaggio;
5. **che cosa succede quando qualcosa va storto** — messaggi persi, duplicati, fuori ordine,
   controparte che tace, controparte ostile.

Il quinto punto è quello che distingue un protocollo serio da una convenzione fra amici. È
anche quello che i tutorial saltano e che in produzione costa. Un protocollo senza semantica
degli errori è un protocollo che funziona solo quando tutto funziona — cioè quando non serve.

Un esempio minimo, per fissare l'idea. Immagina due processi che si scambiano numeri:

```text
A → B :  HELLO 1
B → A :  HELLO-OK 1
A → B :  SOMMA 3 4
B → A :  RISULTATO 7
A → B :  BYE
```

Questo è già un protocollo. Ha un vocabolario (`HELLO`, `SOMMA`, `BYE`), una sequenza
obbligata (`HELLO` prima di tutto), una rappresentazione (testo ASCII, campi separati da
spazio, un messaggio per riga), una semantica. Manca il quinto punto: cosa fa `A` se `B` non
risponde entro un secondo? Cosa fa `B` se riceve `SOMMA` senza aver visto `HELLO`? Se
`RISULTATO` arriva due volte, il secondo è un errore o una ritrasmissione? Finché non
rispondi, non hai un protocollo utilizzabile.

### 1.2 Protocollo, formato, standard: la confusione più frequente

Sono tre cose diverse, e vengono scambiate continuamente — anche in documentazione
professionale.

| | Che cos'è | Domanda a cui risponde | Esempi |
|---|---|---|---|
| **Formato** (o *serializzazione*) | Un modo di rappresentare dati strutturati come sequenza di byte | *Come scrivo questo dato?* | JSON, XML, ndjson, Protocol Buffers, CSV |
| **Protocollo** | Un accordo su messaggi, ordine, semantica ed errori | *Come parliamo?* | TCP, HTTP, WebSocket, MLLP, STUN |
| **Standard** | Un documento pubblicato da un ente riconosciuto, che descrive un formato, un protocollo, un modello dati o un profilo | *Chi lo dice, e con che autorità?* | RFC 9110, ISO/IEC 29115, OASIS SAML 2.0 |

Tre corollari che eliminano la maggior parte delle confusioni:

- **JSON non è un protocollo.** Non dice a nessuno quando parlare, in che ordine né cosa fare
  se il messaggio si perde. È solo un modo di scrivere un albero di valori. «Le nostre API
  parlano JSON» non descrive un'interfaccia: descrive una preferenza tipografica.
- **REST non è un protocollo.** È uno *stile architetturale* che vincola l'uso di un
  protocollo (HTTP). Ne parliamo in §3.1, dove il punto è esattamente questo.
- **FHIR non è né l'uno né l'altro.** È uno standard che comprende un **modello dati**
  (le risorse), **due formati** (JSON e XML) e **un protocollo applicativo** (l'API REST
  descritta in [06 §7](06-fhir-da-zero.md)). Dire «usiamo FHIR» senza dire quale dei tre
  strati si sta usando è una delle ambiguità più costose nelle trattative di integrazione.

Altra distinzione che vale la pena fissare: **standard** e **specifica pubblicata** non
coincidono con **standard di fatto**. `Idempotency-Key` (§3.7) è usato ovunque e non è
standardizzato da nessuno. La forma dei tre header `RateLimit-Limit`/`Remaining`/`Reset`
(§3.8) è diffusissima e non è mai stata uno standard, oltre a essere ormai superata dalla
bozza che l'ha sostituita `[B6]`. Un protocollo diffuso non è un protocollo normato, e la
differenza conta quando qualcuno scrive «conforme a» in un capitolato.

### 1.3 La pila di protocolli e i modelli a livelli

Nessun protocollo lavora da solo. Ciascuno **presuppone** un servizio fornito da quello sotto
e **offre** un servizio a quello sopra. L'insieme si chiama **pila** (*stack*).

L'idea chiave si chiama **incapsulamento**: ogni livello prende il messaggio del livello
superiore, lo tratta come un blocco opaco di byte (*payload*) e ci aggiunge la propria
intestazione. Chi riceve fa il percorso inverso.

```text
┌──────────────────────────────────────────────────────────────┐
│  Applicazione:  { "resourceType": "Encounter", ... }         │  ← significato
├──────────────────────────────────────────────────────────────┤
│  HTTP:  POST /fhir/Encounter  +  intestazioni  +  corpo      │  ← richiesta/risposta
├──────────────────────────────────────────────────────────────┤
│  TLS:   record cifrato e autenticato                         │  ← riservatezza, integrità
├──────────────────────────────────────────────────────────────┤
│  TCP:   segmento  (porte, numeri di sequenza, riscontri)     │  ← flusso ordinato affidabile
├──────────────────────────────────────────────────────────────┤
│  IP:    datagramma  (indirizzo sorgente e destinazione)      │  ← instradamento globale
├──────────────────────────────────────────────────────────────┤
│  Ethernet / Wi-Fi / rete mobile: trama                       │  ← un salto fisico
└──────────────────────────────────────────────────────────────┘
```

Un **modello a livelli** è la mappa concettuale di questa struttura. I due che incontrerai:

- **Il modello OSI** (ISO/IEC 7498-1), a sette livelli: fisico, collegamento, rete, trasporto,
  sessione, presentazione, applicazione. È il vocabolario di riferimento — quando qualcuno dice
  «un bilanciatore di livello 7» intende «che legge HTTP», e «livello 4» significa «che vede
  solo TCP/UDP e porte». È un modello descrittivo: non esiste una pila reale che gli
  corrisponda esattamente.
- **Il modello di Internet**, a quattro livelli (collegamento, internet, trasporto,
  applicazione), che è quello effettivamente implementato. TLS, formalmente, non ha un livello
  proprio: sta fra trasporto e applicazione, e questa è già una prima crepa nella purezza del
  modello.

Due avvertenze pratiche, perché la stratificazione è una comodità concettuale e non una legge
fisica:

1. **I livelli si violano di continuo, per necessità.** Il NAT (descritto in
   [08 §2.3](08-webrtc-da-zero.md)) è un dispositivo di livello 3 che riscrive porte di
   livello 4. QUIC (§2.4) sposta dentro il trasporto funzioni che erano di TLS e di HTTP.
   Non sono difetti: sono compromessi consapevoli.
2. **Un problema risolto a un livello non è risolto per gli altri.** TLS garantisce che
   nessuno abbia letto o alterato i byte *in transito*: non dice nulla su chi li ha scritti
   né su cosa succede dopo la terminazione. È la ragione per cui la firma dei webhook (§6.3)
   esiste anche su canali TLS, ed è la ragione per cui la registrazione lato server rompe
   l'end-to-end (decisione D23) pur restando tutto cifrato in transito.

### 1.4 Contratto di interfaccia

Il **contratto di interfaccia** è la descrizione, verificabile da una macchina, di ciò che una
parte promette all'altra: quali operazioni esistono, quali parametri accettano, quali
rappresentazioni restituiscono, quali errori possono emettere, quali garanzie valgono.

La differenza fra un contratto e una documentazione è che il contratto è **eseguibile**: si
può generare da esso un client, si può validare contro di esso una risposta, si può far
fallire una pipeline di integrazione continua quando il codice diverge dal contratto.

Nel progetto i contratti sono tre, e sono di natura diversa:

| Contratto | Formalismo | Copre |
|---|---|---|
| API applicativa | **OpenAPI 3.1** (§3.2) | sessioni, consensi, configurazione, amministrazione |
| API clinica | **FHIR `CapabilityStatement`** + profili `StructureDefinition` | risorse cliniche, ricerche, operazioni |
| Eventi | **Schema CloudEvents** + registro degli schemi dei payload (§6.2) | ciò che il sistema pubblica verso l'esterno |

Il vincolo **V3** del progetto («nessuna funzionalità accessibile solo dalla UI») ha una
conseguenza diretta e spesso sottovalutata: **se una capacità non compare in uno dei tre
contratti, non esiste**. Il contratto non è la documentazione della funzione: è la funzione.

### 1.5 Serializzazione

**Serializzare** significa trasformare una struttura in memoria in una sequenza di byte
trasmissibile o memorizzabile; **deserializzare** è l'inverso. Sembra banale, e produce tre
famiglie di bug ricorrenti:

- **Perdita di precisione.** Un numero JSON è, per RFC 8259 §6, un numero decimale senza
  vincoli di precisione, ma quasi tutti i parser lo mappano su un `double` a 64 bit. Un
  identificativo numerico oltre 2^53 si corrompe silenziosamente. Regola del progetto: **gli
  identificativi sono stringhe, sempre**, anche quando sembrano numeri. FHIR lo impone già
  per il tipo `id`.
- **Perdita di fuso e di precisione temporale.** Un istante serializzato senza indicazione di
  fuso è un dato ambiguo. Regola del progetto: **ogni istante è in UTC, in forma RFC 3339, con
  almeno i millisecondi**. Vedi anche §8.1 sulla sincronizzazione degli orologi.
- **Ambiguità dell'assenza.** In JSON, `null`, campo assente e stringa vuota sono tre cose
  diverse, e le tre vengono confuse costantemente. In FHIR la differenza è normativa: un
  elemento assente significa «non so», non «no». Il modulo [06](06-fhir-da-zero.md) insiste
  su questo punto per una buona ragione.

I formati concreti e i criteri di scelta sono in §8.3.

### 1.6 Concetti trasversali che tornano in ogni scheda

Vale la pena fissarli una volta sola, perché ricorrono in tutto il catalogo.

**Sincrono e asincrono.** In una interazione *sincrona* il chiamante attende la risposta e
la risposta contiene l'esito dell'operazione. In una *asincrona* la risposta conferma solo la
presa in carico, e l'esito arriva dopo, per un altro canale (polling, webhook, evento). La
scelta non è di gusto: un'operazione che dura più di qualche secondo **non può** essere
sincrona su HTTP senza esporsi a timeout intermedi di proxy e bilanciatori che non controlli.
FHIR Bulk Data (§5.2) è il caso canonico di asincrono normato.

**Stato.** Un protocollo è *stateful* se il significato di un messaggio dipende da quelli
precedenti sulla stessa connessione. TCP lo è (i numeri di sequenza), HTTP di per sé no
(ogni richiesta è autosufficiente), WebSocket lo è. L'assenza di stato ha un pregio enorme:
consente di mettere N istanze del server dietro un bilanciatore senza coordinamento. Ogni
volta che si introduce stato di sessione lato server, si compra una funzionalità e si vende
scalabilità.

**Idempotenza.** Un'operazione è **idempotente** se eseguirla una volta o N volte produce lo
stesso stato finale. RFC 9110 §9.2.2 dichiara idempotenti `GET`, `HEAD`, `PUT`, `DELETE`,
`OPTIONS`, `TRACE`, e **non** idempotenti `POST` e `PATCH`. L'idempotenza è ciò che rende
sicuro il ritentativo, ed è quindi il concetto che regge webhook, code di eventi e client
resilienti. Non è la stessa cosa di *sicura* (*safe*): una richiesta sicura non modifica lo
stato del server (RFC 9110 §9.2.1); una idempotente può modificarlo, purché sempre allo
stesso modo.

**A-lo-più-una-volta, almeno-una-volta, esattamente-una-volta.** Le tre garanzie di consegna.
La terza, presa alla lettera, **non è ottenibile** su un canale inaffidabile fra due parti
indipendenti: ciò che si ottiene è «almeno una volta» più deduplicazione lato ricevente, che
è un «esattamente una volta» **osservabile**, non reale. Chiunque prometta la terza senza
nominare la deduplicazione sta descrivendo male ciò che ha costruito. Vedi §6.4.

### 1.7 Come si legge una specifica IETF, e che valore ha

Le RFC non sono tutte uguali, e il numero non dice nulla sull'autorevolezza. Ciò che conta è
lo **stato**:

| Stato | Significato | Come trattarlo |
|---|---|---|
| **Internet-Draft** | Documento di lavoro. **Scade dopo sei mesi** se non rinnovato | Non è uno standard. Citarlo come tale è scorretto |
| **Proposed Standard** | Standards Track: specifica stabile, implementabile | È lo stato in cui vive la stragrande maggioranza dei protocolli che usi ogni giorno |
| **Internet Standard** | Standards Track maturo, con implementazioni multiple e interoperanti | Raro |
| **Best Current Practice (BCP)** | Raccomandazione operativa, non definizione di protocollo | Vincolante nella pratica quanto uno standard |
| **Informational** | Descrittivo, senza pretesa normativa | Utile, non citabile come conformità |
| **Experimental** | In prova | Non produzione |
| **Historic** | Superato | Se lo trovi in un capitolato, il capitolato è vecchio |

Due punti di metodo:

1. **Una RFC può essere «obsoleted by» un'altra.** HTTP/1.1 non si cita più con RFC 2616:
   quel testo è stato sostituito prima da RFC 7230–7235 e poi dalla revisione del 2022
   (RFC 9110–9114). Citare una RFC obsoleta è il modo più rapido per far capire che la
   documentazione non è manutenuta.
2. **Le parole in maiuscolo hanno valore normativo.** `MUST`, `MUST NOT`, `SHOULD`,
   `SHOULD NOT`, `MAY` sono definite in RFC 2119 e precisate in RFC 8174 (che chiarisce che
   valgono **solo** quando sono in maiuscolo). Un `SHOULD` non è un `MUST` educato: significa
   che puoi discostarti se hai capito le conseguenze e le hai documentate. Il modulo
   [05 §9.3](05-standard-di-interoperabilita.md) tratta gli equivalenti nel mondo sanitario
   (`SHALL`, `SHOULD`, `MAY` di HL7 e IHE).

---

## 2. Trasporto e web

### 2.1 IP — Internet Protocol

**Problema.** Consegnare un blocco di byte da una macchina qualsiasi del pianeta a un'altra,
attraverso una sequenza di reti gestite da soggetti diversi che non si coordinano fra loro.

**Meccanismo.** IP definisce un **datagramma**: un'intestazione con indirizzo sorgente,
indirizzo destinazione, un contatore di salti residui (*TTL*, o *hop limit* in IPv6) e
l'indicazione del protocollo trasportato, seguita dal payload. Ogni router legge l'indirizzo
di destinazione, consulta la propria tabella di instradamento e passa il datagramma al salto
successivo. Nessun router conserva memoria della conversazione.

Il servizio offerto è deliberatamente povero, ed è importante capire quanto:

- **nessuna garanzia di consegna** — un datagramma può essere scartato in qualunque punto,
  tipicamente perché una coda è piena;
- **nessuna garanzia di ordine** — due datagrammi possono seguire percorsi diversi e arrivare
  invertiti;
- **nessuna garanzia di unicità** — un datagramma può essere duplicato;
- **nessuna riservatezza, nessuna autenticazione** — l'indirizzo sorgente è un campo scritto
  dal mittente, e mentire su quel campo (*spoofing*) è banale.

Tutto ciò che c'è sopra — affidabilità, ordine, cifratura, identità — è ricostruito da altri
protocolli su questa base volutamente minima. Due versioni convivono: **IPv4** (RFC 791,
indirizzi a 32 bit, esauriti) e **IPv6** (RFC 8200, 128 bit). L'esaurimento degli indirizzi
IPv4 è la causa storica del NAT, che è a sua volta la ragione per cui una videochiamata è un
problema difficile: vedi [08 §2.3](08-webrtc-da-zero.md).

**Nel progetto.** Ovunque, implicitamente. Diventa esplicito in due punti: la configurazione
di rete dei nodi TURN, dove servono indirizzi pubblici raggiungibili, e l'uso dell'indirizzo
sorgente nell'audit, dove va registrato sapendo che è un'informazione **indicativa, non
probatoria**, perché un indirizzo può essere condiviso da migliaia di utenti dietro un CGNAT
o falsificato.

**Specifica.** RFC 791 (IPv4, Internet Standard, 1981); RFC 8200 (IPv6, Internet Standard,
2017).

**Errori tipici.** Trattare l'indirizzo IP come identificativo dell'utente, per
autorizzazione o per limitazione del traffico: dietro un CGNAT è condiviso da un intero
quartiere. Assumere che due richieste dallo stesso indirizzo siano lo stesso utente e che due
indirizzi diversi siano utenti diversi: entrambe le implicazioni sono false, e in rete mobile
l'indirizzo può cambiare a metà sessione.

### 2.2 UDP — User Datagram Protocol

**Problema.** Aggiungere a IP il minimo indispensabile per distinguere le applicazioni sulla
stessa macchina, senza aggiungere altro.

**Meccanismo.** Otto byte di intestazione: porta sorgente, porta destinazione, lunghezza,
checksum. Nient'altro. Nessuna connessione, nessun riscontro, nessuna ritrasmissione, nessun
riordino, nessun controllo di congestione. Un datagramma inviato è un datagramma dimenticato.

Questa povertà è esattamente il pregio quando i dati hanno **valore che decade nel tempo**.
In una conversazione audio, un pacchetto arrivato 400 ms tardi è inutile anche se è integro:
il momento in cui andava riprodotto è passato. Ritrasmetterlo peggiora la situazione, perché
occupa banda e ritarda ciò che viene dopo. Meglio perderlo e mascherare il buco.

**Nel progetto.** È il trasporto del media in tempo reale: RTP su UDP, dentro DTLS-SRTP.
È anche il trasporto di STUN e TURN, e di QUIC (quindi di HTTP/3). La trattazione completa è
in [08 §2.2](08-webrtc-da-zero.md).

**Specifica.** RFC 768 (Internet Standard, 1980). Ottanta righe: vale la pena leggerla
integralmente almeno una volta, per capire quanto poco serva per essere uno standard che
regge cinquant'anni.

**Errori tipici.** Costruirsi «un TCP fatto in casa» sopra UDP con ritrasmissioni ingenue e
senza controllo di congestione: si ottiene un protocollo che sotto carico peggiora la
congestione invece di adattarsi, danneggiando anche il traffico degli altri. Se serve
affidabilità su UDP, si usa QUIC o SCTP, che quel lavoro l'hanno già fatto.

**Alternative scartate.** Per il media, TCP: scartato perché la sua garanzia di ordine
produce il blocco in testa alla coda descritto in §2.3, che è precisamente il difetto
inaccettabile in tempo reale.

### 2.3 TCP — Transmission Control Protocol

**Problema.** Offrire all'applicazione l'illusione di un **flusso di byte affidabile e
ordinato** fra due processi, costruita sopra un servizio che non garantisce né consegna né
ordine.

**Meccanismo.** Quattro pilastri:

1. **Connessione.** Una stretta di mano in tre passi (`SYN` → `SYN-ACK` → `ACK`) stabilisce
   i numeri di sequenza iniziali. Costa un tempo di andata e ritorno (*RTT*) prima che
   il primo byte utile parta.
2. **Numerazione e riscontro.** Ogni byte ha un numero di sequenza; il ricevente conferma
   ciò che ha ricevuto. Ciò che non è confermato entro un timeout viene ritrasmesso.
3. **Riordino.** Il ricevente consegna all'applicazione i byte in ordine, sempre.
4. **Controllo di flusso e di congestione.** Il primo evita di sommergere il ricevente
   (finestra annunciata); il secondo evita di sommergere la rete, riducendo il ritmo quando
   rileva perdite.

Il punto 3 ha una conseguenza pesante che va capita bene: il **blocco in testa alla coda**
(*head-of-line blocking*). Se il segmento numero 5 si perde, i segmenti 6, 7, 8 già arrivati
restano fermi nel buffer del ricevente finché il 5 non viene ritrasmesso e ricevuto. Per un
trasferimento di file è irrilevante; per l'audio è la differenza fra una conversazione e un
disastro.

**Nel progetto.** È il trasporto di tutto ciò che non è media: HTTP in tutte le versioni
tranne la terza, WebSocket, MLLP, il protocollo del broker di eventi, le connessioni al
database. E, in modalità di ripiego, anche del media, quando TURN deve usare TCP o TLS
perché la rete blocca UDP — con il degrado di qualità che ne consegue
([08 §5.9](08-webrtc-da-zero.md)).

**Specifica.** RFC 9293 (2022), che sostituisce e consolida RFC 793 e la lunga serie di
aggiornamenti successivi. **Se trovi RFC 793 citata in un documento recente, quel documento
non è aggiornato.**

**Errori tipici.** Credere che «il messaggio è arrivato» perché la `write` è ritornata: TCP
garantisce la consegna al *sistema operativo* della controparte, non all'applicazione, e
meno che mai la sua elaborazione. Solo un riscontro applicativo prova l'elaborazione — è
esattamente la ragione per cui HL7 versione 2 ha gli `ACK` applicativi
([05 §4.5](05-standard-di-interoperabilita.md)). Secondo errore: dimenticare che TCP non
delimita i messaggi. Il flusso è di byte, non di messaggi; senza un incorniciamento esplicito
non sai dove finisce l'uno e comincia l'altro. MLLP (§5.3) esiste solo per questo.

### 2.4 QUIC

**Problema.** TCP ha due difetti strutturali che non si possono correggere senza rompere la
compatibilità: il blocco in testa alla coda su tutti i flussi multiplati sulla stessa
connessione, e il fatto che la connessione sia identificata dalla cinquina
(indirizzi e porte), quindi muoia quando l'indirizzo del client cambia — cosa che accade a
ogni passaggio da Wi-Fi a rete mobile.

**Meccanismo.** QUIC è un trasporto costruito **sopra UDP**, in spazio utente, che
reimplementa affidabilità, ordine e controllo di congestione, ma con tre differenze
sostanziali:

- **Flussi indipendenti.** Una connessione QUIC contiene molti flussi; la perdita di un
  pacchetto blocca solo il flusso a cui apparteneva.
- **Cifratura integrata e non opzionale.** TLS 1.3 non sta *sopra* QUIC: è incorporato nel
  suo handshake. Non esiste un QUIC in chiaro.
- **Identificatore di connessione.** La connessione è identificata da un *connection ID*, non
  dalla cinquina: se il client cambia indirizzo, la connessione **migra** invece di morire.

L'handshake unificato porta la connessione a un solo RTT nel caso normale, e a zero RTT nel
caso di ripresa — con l'avvertenza, non trascurabile, che i dati inviati a zero RTT sono
esposti a replay e non devono quindi veicolare operazioni non idempotenti.

**Nel progetto.** È il trasporto di HTTP/3 (§2.9). Rilevante soprattutto per il vincolo
**V6**: il paziente tipico è su smartphone in rete mobile, e la migrazione di connessione è
la funzione che gli evita di perdere la sessione applicativa mentre esce di casa. Il media
non usa QUIC: usa RTP su UDP come descritto in [08](08-webrtc-da-zero.md).

**Specifica.** RFC 9000 (trasporto), RFC 9001 (uso di TLS 1.3 in QUIC), RFC 9002
(rilevamento delle perdite e controllo di congestione), tutte del maggio 2021.

**Errori tipici.** Assumere che sia disponibile. QUIC gira su UDP, e **le reti ospedaliere e
aziendali bloccano UDP con notevole frequenza**. Ogni client deve saper ripiegare su
HTTP/2 su TCP senza intervento dell'utente e senza attese lunghe. Secondo errore: aspettarsi
che i middlebox lo capiscano — per un firewall di livello 4, QUIC è traffico UDP opaco, e
questo cambia sia le regole da configurare sia ciò che si vede negli strumenti diagnostici.

### 2.5 TLS — Transport Layer Security

**Problema.** Su una rete che chiunque può ascoltare e alterare, garantire tre cose insieme:
che i dati non siano leggibili da terzi (**riservatezza**), che non siano modificabili senza
accorgersene (**integrità**), e che la controparte sia chi dice di essere (**autenticazione**).

**Meccanismo.** TLS si inserisce fra trasporto e applicazione. Si compone di una fase di
**negoziazione** (*handshake*) e di una fase di **trasporto di record** cifrati.

Nell'handshake di TLS 1.3, semplificato:

```mermaid
sequenceDiagram
    autonumber
    participant C as Client
    participant S as Server

    C->>S: ClientHello<br/>versioni supportate, cifrari, gruppi,<br/>key_share (chiave pubblica effimera), SNI, ALPN
    S->>S: sceglie cifrario e gruppo,<br/>genera la propria chiave effimera
    S->>C: ServerHello (key_share del server)
    Note over C,S: da qui in poi tutto è cifrato:<br/>il segreto condiviso è già derivabile da entrambi
    S->>C: EncryptedExtensions, Certificate,<br/>CertificateVerify (firma sull'handshake), Finished
    C->>C: valida la catena del certificato,<br/>verifica il nome, controlla la revoca,<br/>verifica la firma dell'handshake
    C->>S: (opzionale: Certificate + CertificateVerify del client)
    C->>S: Finished
    Note over C,S: canale stabilito — un solo RTT
```

Tre punti che spiegano perché la stretta di mano è fatta così:

- **Il segreto non viaggia mai.** Client e server si scambiano chiavi pubbliche effimere e
  ciascuno calcola in proprio lo stesso segreto condiviso (scambio Diffie-Hellman su curve
  ellittiche). Un intercettatore che registri l'intero scambio non può derivarlo. E poiché le
  chiavi sono effimere e distrutte a fine sessione, una compromissione futura della chiave
  privata del server **non consente di decifrare le sessioni passate**: è la *forward secrecy*,
  in TLS 1.3 obbligatoria.
- **Il certificato serve a legare una chiave a un nome.** `CertificateVerify` è la prova che
  il server possiede la chiave privata corrispondente al certificato; la validazione della
  catena fino a un'autorità fidata è la prova che quel certificato è stato emesso a chi
  dichiara quel nome. Sono due controlli distinti e servono entrambi.
- **`SNI` e `ALPN` sono negoziati in chiaro nel `ClientHello`.** Il primo dice quale nome
  virtuale si sta contattando (necessario quando molti servizi condividono un indirizzo), il
  secondo quale protocollo applicativo si intende parlare (`h2`, `http/1.1`, `h3`).
  Conseguenza di riservatezza da conoscere: **un osservatore vede quale servizio stai
  contattando**, anche se non vede cosa gli dici.

**mTLS — autenticazione reciproca.** Nell'uso comune solo il server presenta un certificato.
In **mTLS** anche il client ne presenta uno, e il server lo valida allo stesso modo. Il
risultato è che l'identità del client è provata **dal canale**, non da un segreto trasportato
dentro il canale. È qualitativamente diverso da una chiave API: un token rubato è
riutilizzabile ovunque, una chiave privata protetta da un dispositivo no.

**Nel progetto.** TLS è ovunque, come minimo assoluto. mTLS in quattro punti precisi:

1. **MLLP** verso i motori di integrazione ospedalieri (§5.3): è l'unico modo di rendere
   accettabile un protocollo nato senza sicurezza;
2. **TS-CNS**, dove il certificato del cittadino su smart card autentica l'utente al livello
   del trasporto `[B7]` — è l'unico canale ex art. 64 CAD privo di dipendenze esterne;
3. **traffico interno** fra componenti nei profili di installazione che lo richiedono;
4. **opzionalmente**, per legare i token di un integratore al suo certificato client
   (RFC 8705, *token binding* mTLS), come irrobustimento del profilo di §4.

**Specifica.** TLS 1.3: **RFC 8446** (2018). TLS 1.2: RFC 5246, ancora ammesso ma da
considerare in via di dismissione. TLS 1.0 e 1.1 sono **formalmente deprecati da RFC 8996**
(BCP 195): non vanno abilitati, in nessun profilo, nemmeno per compatibilità. Politica del
progetto: **TLS 1.3 preferito, TLS 1.2 ammesso solo con cifrari con forward secrecy e solo
dove una controparte legacy lo imponga, con la deroga documentata**. La scelta dei cifrari e
delle dimensioni delle chiavi segue ETSI TS 119 312 e le indicazioni AgID-ACN (decisione
D19), non elenchi copiati da guide di configurazione.

**Errori tipici.**

- **Disattivare la verifica del certificato** per «far funzionare il collaudo». Un client che
  accetta qualunque certificato ha la cifratura ma non l'autenticazione: è indifeso davanti a
  un intermediario attivo, e quella riga di configurazione poi arriva in produzione. Vale
  anche per MLLP: [05 §4.6](05-standard-di-interoperabilita.md) lo dice negli stessi termini.
- **Verificare la catena ma non il nome.** Sono due controlli separati e la seconda si
  dimentica in molte librerie di basso livello.
- **Ignorare la revoca.** Un certificato compromesso e revocato resta crittograficamente
  valido fino alla scadenza. Servono OCSP (RFC 6960) o le liste di revoca (RFC 5280), e serve
  decidere **che cosa fare quando il servizio di revoca non risponde** — decisione che va
  presa consapevolmente, perché entrambe le risposte hanno un costo.
- **Considerare TLS sufficiente per il non ripudio.** TLS protegge il canale; non produce
  alcuna prova opponibile a un terzo su chi ha inviato che cosa. Per quello servono firme sui
  messaggi (§6.3) e una catena di impronte sull'audit (decisione D42).

**Alternative scartate.** Cifrare a livello applicativo lasciando il trasporto in chiaro:
scartato perché espone intestazioni e metadati e perché nessuno implementa correttamente una
negoziazione crittografica in proprio. IPsec: adeguato a collegare due reti, ma non offre
l'identità *per servizio* che serve qui.

### 2.6 HTTP: il modello comune alle tre versioni

Prima di distinguere le versioni, conviene fissare ciò che **non cambia**. Dal 2022 la
revisione delle specifiche ha separato esplicitamente i due piani:

- **La semantica** — metodi, codici di stato, campi di intestazione, negoziazione del
  contenuto, richieste condizionali, autenticazione — è definita **una volta sola** in
  **RFC 9110**, e vale identica per HTTP/1.1, HTTP/2 e HTTP/3.
- **La sintassi e il trasporto** cambiano da versione a versione: RFC 9112 (HTTP/1.1),
  RFC 9113 (HTTP/2), RFC 9114 (HTTP/3). La cache ha una specifica propria, RFC 9111.

Questa separazione è la ragione per cui **passare da HTTP/1.1 a HTTP/2 non cambia una riga di
codice applicativo**: cambia come i byte viaggiano, non cosa significano. Ed è anche la
ragione per cui le discussioni del tipo «migriamo le API a HTTP/2» sono spesso mal poste:
non c'è nulla da migrare nell'applicazione, c'è da configurare l'infrastruttura.

**Il modello di interazione** è invariante: il client invia una **richiesta** (metodo, bersaglio,
intestazioni, corpo opzionale); il server invia una **risposta** (codice di stato,
intestazioni, corpo opzionale). Il server non parla per primo. Questa asimmetria è il
problema che WebSocket e SSE risolvono in due modi diversi (§2.10 e §2.11).

### 2.7 HTTP/1.1

**Problema.** Trasferire rappresentazioni di risorse su una connessione TCP, in modo leggibile
e implementabile da chiunque.

**Meccanismo.** Testo, riga per riga. Una richiesta è una riga iniziale, un blocco di
intestazioni `Nome: valore`, una riga vuota, e un corpo la cui lunghezza è data da
`Content-Length` o dalla codifica a blocchi (`Transfer-Encoding: chunked`).

```http
GET /v1/sessions/9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d HTTP/1.1
Host: api.telemedic.esempio.it
Accept: application/json
Authorization: Bearer eyJhbGciOiJFUzM4NCIsImtpZCI6InRtLTIwMjYtMDgifQ...
```

```http
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
ETag: "a3f1c9e2"
Cache-Control: no-store

{"id":"9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d","status":"in-progress","tenant":"asl-nord-01"}
```

Il limite strutturale è che **su una connessione si serve una richiesta per volta**. Il
*pipelining* previsto dalla specifica non ha mai funzionato in pratica per l'obbligo di
rispondere in ordine, e i browser hanno risolto aprendo sei connessioni in parallelo per
origine — un rimedio che moltiplica strette di mano TCP e TLS.

**Nel progetto.** È il minimo comun denominatore garantito: ogni integratore lo parla. È la
versione in cui sono scritti tutti gli esempi della documentazione, perché è l'unica leggibile
a occhio.

**Specifica.** RFC 9112 (2022), con la semantica in RFC 9110. Sostituisce RFC 7230 e, prima
ancora, RFC 2616.

**Errori tipici.** Costruire intestazioni per concatenazione di stringhe con dentro input
dell'utente: un ritorno a capo non filtrato produce *response splitting*. Assumere che i nomi
delle intestazioni siano sensibili alle maiuscole: non lo sono. Assumere che un'intestazione
compaia una volta sola: molte sono ripetibili, e l'unione avviene per virgola.

### 2.8 HTTP/2

**Problema.** Rimuovere il limite di una richiesta per connessione senza cambiare la
semantica.

**Meccanismo.** HTTP/2 è **binario** e introduce tre concetti:

- **Trame** (*frame*): l'unità elementare. Tipi distinti per intestazioni, dati, controllo.
- **Flussi** (*stream*): ogni coppia richiesta/risposta è un flusso numerato; le trame di
  flussi diversi si alternano liberamente sulla stessa connessione TCP. È il **multiplexing**.
- **Compressione delle intestazioni** (HPACK, RFC 7541): le intestazioni ripetute fra
  richieste sulla stessa connessione non vengono ritrasmesse per intero, ma referenziate in
  una tabella dinamica condivisa.

Il guadagno reale, in un'applicazione web moderna, viene più dalla compressione delle
intestazioni e dall'uso di una sola connessione TLS che dal multiplexing in sé.

**Il limite che resta.** Il multiplexing è a livello HTTP, ma **sotto c'è ancora una sola
connessione TCP**: se si perde un segmento, TCP blocca la consegna di *tutti* i flussi finché
non lo ritrasmette. Il blocco in testa alla coda è stato spostato, non eliminato. È
esattamente il problema che HTTP/3 risolve.

**Nel progetto.** È la versione predefinita per il traffico applicativo fra il gateway e i
client moderni, e per il traffico interno fra servizi. La negoziazione avviene con ALPN
(RFC 7301) durante l'handshake TLS, quindi è trasparente per l'applicazione.

**Specifica.** RFC 9113 (2022), che sostituisce RFC 7540; HPACK in RFC 7541.

**Errori tipici.** Mantenere il *domain sharding* (distribuire le risorse su più nomi host)
ereditato da HTTP/1.1: con HTTP/2 è controproducente, perché impedisce di sfruttare la
connessione unica. Dimenticare che il *server push*, molto pubblicizzato all'inizio, è stato
**abbandonato in pratica** dai browser: non va progettato nulla che ne dipenda `[NV]`.

### 2.9 HTTP/3

**Problema.** Eliminare il blocco in testa alla coda residuo di HTTP/2 e sopravvivere al
cambio di rete del client.

**Meccanismo.** Stessa semantica, stesso modello a flussi, ma sopra **QUIC** (§2.4) invece
che sopra TCP+TLS. La perdita di un pacchetto blocca solo il flusso interessato; il
cambio di indirizzo IP del client non abbatte la connessione. La compressione delle
intestazioni usa QPACK (RFC 9204), variante di HPACK progettata per non introdurre a sua
volta dipendenze d'ordine fra flussi.

**Nel progetto.** Abilitato sul gateway pubblico, con **ripiego automatico obbligatorio** su
HTTP/2 quando UDP è bloccato. Il beneficio si concentra dove il progetto ne ha più bisogno:
paziente su smartphone, rete mobile, qualità variabile — cioè il vincolo **V6**.

**Specifica.** RFC 9114 (2022); QPACK in RFC 9204.

**Errori tipici.** Considerarlo un requisito. Non lo è, e non può esserlo: molte reti sanitarie
bloccano UDP in uscita. Il progetto non può avere una funzionalità che esiste solo su HTTP/3.
Secondo errore: dimenticare che le metriche e i log cambiano forma, perché non c'è più una
connessione TCP a cui riferire le statistiche.

### 2.10 WebSocket

**Problema.** HTTP è a iniziativa del client. Serve un canale in cui **anche il server possa
parlare per primo**, con basso ritardo e senza il costo di una nuova richiesta per ogni
messaggio.

**Meccanismo.** Il client apre una normale richiesta HTTP con `Upgrade: websocket`, un
`Sec-WebSocket-Key` casuale e la versione. Se il server accetta, risponde `101 Switching
Protocols` e da quel momento **la connessione TCP smette di parlare HTTP**: diventa un canale
bidirezionale a messaggi, con un incorniciamento binario proprio, che supporta testo, binario,
ping/pong e chiusura ordinata con codice.

```http
GET /ws/signaling HTTP/1.1
Host: api.telemedic.esempio.it
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: x3JJHMbDL1EzLkh9GBhXDw==
Sec-WebSocket-Version: 13
Sec-WebSocket-Protocol: telemedic.signaling.v1
Origin: https://app.telemedic.esempio.it
```

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: HSmrc0sMlYUkAGmm5OPpG2HaGWk=
Sec-WebSocket-Protocol: telemedic.signaling.v1
```

Tre cose che WebSocket **non** dà e che si finisce sempre per implementare:

1. **Nessuna semantica applicativa.** Sopra c'è un flusso di messaggi opachi: il protocollo
   dei messaggi te lo scrivi tu, compresi correlazione, errori e versionamento. Il parametro
   `Sec-WebSocket-Protocol` serve proprio a negoziarne il nome e la versione — usarlo è
   buona igiene, non un dettaglio.
2. **Nessuna riconnessione.** Se la connessione cade — e in rete mobile cade — riconnettersi
   e **recuperare i messaggi persi nel frattempo** è un problema applicativo. Serve un
   numero di sequenza dei messaggi e una ripresa da un punto noto, altrimenti si perdono
   eventi in silenzio.
3. **Nessuna autorizzazione continua.** L'autorizzazione avviene alla stretta di mano
   iniziale. Se il token scade dopo dieci minuti e la connessione dura un'ora, la connessione
   resta aperta con un'autorizzazione morta, a meno che il protocollo applicativo non preveda
   una ri-presentazione periodica del token e la chiusura in caso di revoca.

**Nel progetto.** È il canale di **segnalazione** WebRTC (scambio di offerta, risposta e
candidati ICE: vedi [08 §4](08-webrtc-da-zero.md)), ed è il canale delle notifiche
interattive verso la UI clinica. È il caso d'uso in cui la bidirezionalità serve davvero,
perché entrambe le parti generano eventi in modo indipendente e imprevedibile.

**Specifica.** **RFC 6455** (2011). Il funzionamento su HTTP/2 come flusso multiplato è
definito da **RFC 8441** e non è universalmente supportato: il progetto non ci fa affidamento
`[NV]`. La `WebSocket API` lato browser è definita dallo standard HTML del WHATWG, non
dall'IETF: sono due documenti diversi per due strati diversi.

**Errori tipici.**

- **Mettere il token nell'URL** (`wss://…?token=…`) perché l'API del browser non consente
  intestazioni personalizzate nell'handshake. L'URL finisce nei log di ogni intermediario. La
  soluzione del progetto — *proposta di progetto* — è un **token d'ingresso a uso singolo,
  a scadenza brevissima, emesso back-channel** e speso come primo messaggio applicativo dopo
  l'apertura, coerentemente con la decisione D18.
- **Non validare `Origin`.** L'apertura di una WebSocket **non è soggetta alla politica di
  stessa origine** allo stesso modo delle richieste `fetch`, e i cookie vengono inviati: senza
  validazione di `Origin` lato server si ottiene la variante WebSocket del CSRF, nota come
  *cross-site WebSocket hijacking*.
- **Trascurare i ping.** Senza ping/pong periodici, i NAT e i bilanciatori chiudono
  connessioni inattive dopo pochi minuti, e il client se ne accorge solo quando prova a
  scrivere.
- **Usarlo per dati che devono sopravvivere alla disconnessione.** Un evento clinico
  consegnato solo via WebSocket a un client disconnesso è un evento perso. Gli eventi durevoli
  passano dal broker e dai webhook (§6), non dal canale interattivo.

**Alternative scartate.** Per la segnalazione: *long polling* HTTP, scartato per il ritardo
aggiuntivo e per il costo di una richiesta per messaggio; SSE, scartato perché è
unidirezionale e la segnalazione è intrinsecamente bidirezionale.

### 2.11 Server-Sent Events

**Problema.** Il server deve poter spingere aggiornamenti al browser, ma la conversazione è
**a senso unico** e non giustifica il costo e i rischi di un canale bidirezionale.

**Meccanismo.** Una normale risposta HTTP con `Content-Type: text/event-stream` che **non si
chiude**. Il server scrive eventi in un formato testuale a righe; il client li riceve man mano.

```http
GET /v1/sessions/9f1c2b3d/events HTTP/1.1
Accept: text/event-stream
Last-Event-ID: 42
```

```http
HTTP/1.1 200 OK
Content-Type: text/event-stream; charset=utf-8
Cache-Control: no-store
Connection: keep-alive

id: 43
event: session.participant-joined
data: {"participant":"prc-8812","role":"PPRF","at":"2026-08-25T09:14:02.310Z"}

id: 44
event: session.quality-degraded
data: {"rttMs":412,"packetLossPct":4.2,"at":"2026-08-25T09:15:00.005Z"}

: heartbeat
```

Il pregio meno noto e più importante è la **ripresa integrata**: il client ricorda l'ultimo
`id` ricevuto e, alla riconnessione automatica, lo rimanda nell'intestazione `Last-Event-ID`.
Il server riprende da lì. È la funzionalità che con WebSocket devi scriverti da solo, e che
quasi nessuno scrive correttamente.

**Nel progetto.** Notifiche a senso unico verso l'interfaccia: cambi di stato della sessione,
avanzamento di un'operazione lunga, allerte di telemonitoraggio da mostrare al professionista,
esito di un'elaborazione asincrona. Nel mondo FHIR è anche uno dei canali di notifica delle
sottoscrizioni.

**Specifica.** **Non è una RFC.** È definito nello *HTML Living Standard* del WHATWG, sezione
*Server-sent events*, insieme all'interfaccia `EventSource`. È uno standard vivo, cioè privo
di numero di versione: si cita per sezione, non per revisione. Il tipo di contenuto
`text/event-stream` è registrato presso IANA.

**Errori tipici.**

- **Non disattivare il buffering degli intermediari.** Un proxy inverso che accumula la
  risposta prima di inoltrarla annulla completamente il punto di SSE: gli eventi arrivano a
  blocchi, o non arrivano. Va configurato esplicitamente, e va verificato con un test, non
  con la fiducia.
- **Non inviare commenti di battito** (le righe che iniziano con `:`): senza traffico, gli
  intermediari chiudono la connessione inattiva.
- **Usarlo con HTTP/1.1 e molte schede aperte.** Il limite di sei connessioni per origine si
  esaurisce con sei flussi SSE. Su HTTP/2 e HTTP/3 il problema non esiste, perché i flussi
  sono multiplati: **SSE va abbinato a HTTP/2**, e questo è il caso in cui la versione del
  protocollo ha una conseguenza applicativa reale.
- **Mandarci dati binari.** Il formato è testuale a righe: il binario va codificato, con
  l'aumento di dimensione che comporta.

### 2.12 Come si sceglie fra polling, SSE e WebSocket

È una delle domande in cui la risposta sbagliata costa mesi. Il criterio non è «quale è più
moderno», ma **quante parti parlano, con quale frequenza, e cosa succede se il client non c'è**.

| Criterio | Polling | SSE | WebSocket |
|---|---|---|---|
| Direzione | client → server | server → client | bidirezionale |
| Ritardo tipico | metà dell'intervallo di sondaggio | prossimo alla rete | prossimo alla rete |
| Costo per messaggio | alto (richiesta completa) | basso | bassissimo |
| Ripresa dopo caduta | nativa (è già senza stato) | **nativa** (`Last-Event-ID`) | **da implementare** |
| Attraversa proxy e firewall | sempre | quasi sempre | spesso, non sempre |
| Autorizzazione | per richiesta, sempre fresca | all'apertura | all'apertura |
| Complessità operativa | minima | bassa | media |
| Adatto a molti client inattivi | sì | no (una connessione ciascuno) | no |

**Le regole del progetto** (*proposta di progetto*, derivate dai casi d'uso reali):

1. **Se il server non ha nulla da dire finché il client non chiede, si usa una richiesta
   normale.** Non serve altro. La maggior parte di ciò che viene realizzato con canali
   persistenti non ne aveva bisogno.
2. **Se il flusso è a senso unico verso il browser, si usa SSE.** La ripresa integrata e
   l'assenza di un protocollo applicativo da inventare valgono più della bidirezionalità che
   non useresti.
3. **Si usa WebSocket quando entrambe le parti generano eventi indipendenti e il ritardo
   conta.** Nel progetto è, in sostanza, la sola segnalazione.
4. **Il polling resta la scelta corretta per le operazioni asincrone lunghe fra sistemi**,
   dove non c'è un essere umano in attesa e la controparte può essere spenta. È il modello
   di FHIR Bulk Data (§5.2), e non è un ripiego: è la risposta giusta a quel problema.
5. **Nessun evento che debba sopravvivere alla disconnessione viaggia solo su un canale
   interattivo.** Il canale interattivo è un'ottimizzazione della latenza percepita, mai
   la fonte di verità. La fonte di verità è il broker (§6.1) e, verso l'esterno, il webhook
   con ritentativi (§6.3).

Sul polling, un'ultima nota che evita danni: **se un client deve sondare, il server deve
dirgli ogni quanto**. L'intestazione `Retry-After` (RFC 9110 §10.2.3) esiste per questo, ed è
la differenza fra mille client cortesi e mille client che ti fanno da attacco distribuito
ogni volta che il servizio rallenta.

---

## 3. Interfacce applicative

### 3.1 REST, e i suoi vincoli reali

**Problema.** Definire un'interfaccia fra sistemi che sopravviva all'evoluzione indipendente
delle due parti, che sia comprensibile senza documentazione proprietaria e che sfrutti
l'infrastruttura esistente del web (cache, proxy, bilanciatori) invece di aggirarla.

**Meccanismo.** REST — *REpresentational State Transfer* — non è un protocollo né uno
standard: è uno **stile architetturale** descritto nel 2000 nella tesi di dottorato di Roy
Fielding, che è anche uno degli autori delle specifiche HTTP. Impone sei vincoli:
architettura client-server; **assenza di stato di sessione sul server**; possibilità di
memorizzare le risposte in cache; interfaccia uniforme; sistema a strati; *code on demand*
(opzionale e praticamente inutilizzato).

Il vincolo che porta quasi tutto il valore è l'**interfaccia uniforme**, articolata a sua
volta in quattro sotto-vincoli: identificazione delle risorse tramite URI, manipolazione
tramite rappresentazioni, messaggi auto-descrittivi, e ipermedia come motore dello stato
applicativo (*HATEOAS*).

**Che cosa significa nella pratica, e cosa no.** Vale la pena essere espliciti, perché il
termine è abusato:

- **Un'API non è REST perché usa JSON su HTTP.** La stragrande maggioranza delle «API REST»
  in circolazione — inclusa, in parte, quella di questo progetto — sono *HTTP-JSON con
  orientamento alle risorse*. È una scelta legittima; chiamarla REST senza precisare è
  impreciso e va evitato nella documentazione pubblica.
- **HATEOAS è il vincolo che quasi nessuno rispetta**, ed è quello che dovrebbe consentire al
  client di scoprire le transizioni possibili dai collegamenti nella rappresentazione invece
  che dalla documentazione. Il progetto lo adotta **parzialmente**: le collezioni paginate
  espongono i collegamenti di navigazione con l'intestazione `Link` (RFC 8288) e i `Bundle`
  FHIR li espongono in `Bundle.link`, come impone lo standard. Le transizioni di stato di una
  sessione, invece, sono documentate nel contratto OpenAPI, non scoperte a runtime: è una
  deviazione consapevole, e questa frase è la sua documentazione.
- **L'assenza di stato è il vincolo che si viola per primo e che costa di più.** Ogni
  richiesta deve contenere tutto ciò che serve a interpretarla: identità, tenant, contesto.
  Nessuna «sessione» lato server che leghi richieste successive. È ciò che consente di
  aggiungere istanze del gateway senza sessioni condivise, ed è la ragione per cui l'identità
  viaggia in un token per richiesta (§4).

**Progettazione delle risorse — le regole del progetto** (*proposta di progetto*):

| Regola | Esempio corretto | Esempio da evitare |
|---|---|---|
| Sostantivi, non verbi, negli URI | `POST /v1/sessions` | `POST /v1/createSession` |
| Plurale per le collezioni | `/v1/sessions/{id}` | `/v1/session/{id}` |
| Le relazioni sono sotto-risorse | `/v1/sessions/{id}/participants` | `/v1/getParticipantsBySession?id=` |
| Il verbo sta nel metodo HTTP | `DELETE /v1/sessions/{id}` | `POST /v1/sessions/{id}/delete` |
| Gli identificativi sono opachi | `9f1c2b3d-4e5f-…` | un intero incrementale |
| La versione maggiore è nel percorso | `/v1/…` | solo in un'intestazione personalizzata |

Sull'ultima riga il dibattito è antico e non ha una risposta oggettivamente superiore. Il
progetto sceglie la versione nel percorso per una ragione pratica: è visibile nei log, nei
grafici e nei ticket di assistenza, e un integratore può dire «sto usando la v1» senza dover
ispezionare le intestazioni.

Un'ultima regola, che discende dai vincoli **V4** e §6.2.3 del profilo di integrazione: **gli
identificativi esterni non diventano mai identificativi interni**. Il paziente è identificato
dall'integratore; Telemedic lo referenzia con la coppia (sistema di identificazione,
valore), come fa FHIR con `Patient.identifier`. Il progetto non è il master data e non deve
diventarlo.

**Errori tipici.** Un endpoint per ogni caso d'uso, che riproduce in HTTP la chiamata a
procedura remota e ne eredita i difetti. Il `GET` che modifica lo stato: viola RFC 9110
§9.2.1, e sarà ripetuto da qualunque cache, prefetch del browser, crawler o retry automatico.
Il `POST` usato per leggere, che rende impossibile qualunque memorizzazione in cache.

**Alternative scartate.**

| Alternativa | Perché scartata |
|---|---|
| **GraphQL** | Il progetto espone già FHIR, che ha un proprio linguaggio di ricerca ricco e normato. Aggiungere un secondo modello di interrogazione significa duplicare autorizzazione e audit su due strati diversi — e l'autorizzazione per campo in un contesto sanitario è il punto in cui si sbaglia. Fuori perimetro v1.0 |
| **gRPC** | Eccellente fra servizi propri, ma richiede HTTP/2 senza intermediari che lo degradino e strumenti che il profilo dell'integratore tipico non ha. Resta valutabile per il traffico interno, mai come interfaccia pubblica |
| **SOAP** | Fuori dal panorama tecnologico del progetto. Compare solo come vincolo esterno quando un'infrastruttura nazionale lo impone; in quel caso lo si parla in un adattatore dedicato, e non contamina il modello interno |
| **Chiamata a procedura remota su HTTP** | È ciò che si ottiene per inerzia quando non si progetta. Non è una scelta, è un esito |

### 3.2 OpenAPI 3.1

**Problema.** Rendere il contratto dell'API applicativa (§1.4) **verificabile da una
macchina**, così che client, documentazione, test di contratto e validazione a runtime
derivino tutti dalla stessa fonte invece di divergere.

**Meccanismo.** Un documento YAML o JSON descrive percorsi, operazioni, parametri, corpi,
risposte, schemi e schemi di sicurezza. La novità decisiva della **3.1** rispetto alla 3.0 è
che gli schemi sono **JSON Schema completo** (dialetto 2020-12), non più un sottoinsieme
divergente: cade la lunga serie di incompatibilità che rendeva impossibile riusare gli stessi
schemi per la validazione e per la documentazione. La 3.1 supporta inoltre `webhooks` come
elemento di primo livello — cioè consente di descrivere **le richieste che il server invia**,
non solo quelle che riceve.

```yaml
openapi: 3.1.0
info:
  title: Telemedic Session API
  version: 1.4.0
paths:
  /v1/sessions:
    post:
      operationId: createSession
      summary: Crea una sessione di televisita a partire da un appuntamento esistente
      parameters:
        - name: Idempotency-Key
          in: header
          required: true
          schema: { type: string, format: uuid }
          description: >
            Convenzione di progetto, non standard IETF: vedi §3.7 del modulo 13.
      requestBody:
        required: true
        content:
          application/json:
            schema: { $ref: '#/components/schemas/SessionCreateRequest' }
      responses:
        '201':
          description: Sessione creata
          headers:
            Location: { schema: { type: string, format: uri } }
            ETag:     { schema: { type: string } }
          content:
            application/json:
              schema: { $ref: '#/components/schemas/Session' }
        '409':
          description: Conflitto — esiste già una sessione per questo appuntamento
          content:
            application/problem+json:
              schema: { $ref: '#/components/schemas/Problem' }
      security:
        - oauth2: ['https://telemedic.example/scopes/session.start']
webhooks:
  sessionCompleted:
    post:
      summary: Notifica di sessione conclusa
      requestBody:
        content:
          application/cloudevents+json:
            schema: { $ref: '#/components/schemas/SessionCompletedEvent' }
      responses:
        '204': { description: Presa in carico }
```

**Nel progetto.** OpenAPI 3.1 è il contratto dell'API applicativa (sessioni, consensi,
configurazione, amministrazione, webhook). **Non descrive l'API FHIR**: quella ha il proprio
formalismo di conformità (`CapabilityStatement` e profili), e generare uno OpenAPI da FHIR
produce un documento enorme e povero, che descrive la forma sintattica e perde i vincoli che
contano davvero. Sono due contratti, per due interfacce diverse.

Politica di progetto, in tre punti:

1. **Il contratto è la fonte, non il derivato.** Si scrive il documento OpenAPI e da lì si
   generano client e test di contratto; il codice viene verificato contro il contratto in
   integrazione continua. L'alternativa — generare la specifica dalle annotazioni del codice —
   fa sì che qualunque modifica accidentale del codice diventi automaticamente una modifica
   del contratto, il che è precisamente ciò che il contratto dovrebbe impedire.
2. **La compatibilità è verificata automaticamente.** Una modifica che rimuove un campo,
   restringe un tipo o aggiunge un obbligo fa fallire la pipeline se la versione maggiore non
   cambia.
3. **Ogni esempio nel documento è validato** contro il proprio schema. Un esempio che non
   valida è un difetto, non un dettaglio: gli esempi sono ciò che gli integratori copiano.

**Specifica.** OpenAPI Specification 3.1, pubblicata dalla OpenAPI Initiative (Linux
Foundation), su `spec.openapis.org`. **Non è una RFC.** Il dialetto di JSON Schema è
`2020-12`. Le versioni successive alla 3.1 esistono `[NV]`: prima di adottarne una va
verificato il supporto degli strumenti effettivamente in uso, che storicamente arriva con
molto ritardo.

**Errori tipici.** Un unico file di seimila righe non navigabile: si spezza per dominio e si
compone con `$ref`. Descrivere solo il caso felice e nessun errore: l'integratore scoprirà i
codici di errore in produzione. Usare `additionalProperties: true` ovunque, il che rende lo
schema incapace di rilevare qualsiasi errore. Documentare un'operazione senza dichiararne gli
scope: l'integratore non può sapere quale autorizzazione chiedere.

### 3.3 La semantica dei codici di stato

**Problema.** Comunicare l'esito di un'operazione in modo che un client generico — un proxy,
una cache, una libreria di ritentativi che non sa nulla del tuo dominio — possa comportarsi
correttamente senza leggere il corpo della risposta.

**Meccanismo.** RFC 9110 §15 definisce cinque classi. La prima cifra è ciò che conta per
l'infrastruttura; il codice preciso è ciò che conta per il client applicativo.

| Classe | Significato | Che cosa deve fare un client generico |
|---|---|---|
| `1xx` | Informativo | Attendere la risposta vera |
| `2xx` | Successo | Procedere |
| `3xx` | Ulteriore azione richiesta | Seguire il rinvio (con un limite di salti) |
| `4xx` | Errore del client | **Non ritentare tale e quale**: la richiesta è sbagliata |
| `5xx` | Errore del server | **Ritentare** con attesa crescente e componente casuale |

La distinzione fra `4xx` e `5xx` **non è cosmetica**: è la riga di codice che decide se un
client ritenta. Restituire `500` per un input non valido produce client che ritentano
all'infinito una richiesta che non potrà mai riuscire. Restituire `400` per un guasto interno
temporaneo produce client che rinunciano a un'operazione che sarebbe riuscita un secondo dopo.
È uno degli errori più comuni e più costosi.

I codici che il progetto usa e la loro semantica esatta:

| Codice | Quando | Note per il progetto |
|---|---|---|
| `200 OK` | Lettura riuscita, o modifica con corpo di risposta | |
| `201 Created` | Risorsa creata | **`Location` obbligatoria** con l'URI della risorsa creata |
| `202 Accepted` | Presa in carico, esito successivo | **`Content-Location`** con l'URI di stato; è il modello di FHIR Bulk Data (§5.2) |
| `204 No Content` | Riuscito, nessun corpo | Tipico per una cancellazione o per l'accettazione di un webhook |
| `303 See Other` | L'esito è altrove | Usato per far seguire un `POST` con un `GET` |
| `304 Not Modified` | Il validatore condizionale corrisponde | Vedi §3.5. Non ha corpo |
| `400 Bad Request` | Sintassi o schema non validi | Errore di forma, non di regola di dominio |
| `401 Unauthorized` | Credenziale assente, scaduta o non valida | Nome storicamente sbagliato: significa *non autenticato*. Obbliga a `WWW-Authenticate` |
| `403 Forbidden` | Autenticato ma non autorizzato | Attenzione: `403` conferma l'esistenza della risorsa. Vedi sotto |
| `404 Not Found` | Non esiste, o non sei autorizzato a saperlo | |
| `405 Method Not Allowed` | Metodo errato sulla risorsa | Obbliga a `Allow` |
| `406 Not Acceptable` | Nessuna rappresentazione soddisfa `Accept` | |
| `409 Conflict` | Lo stato attuale impedisce l'operazione | Doppia creazione, transizione di stato illecita |
| `410 Gone` | Esisteva, è stato rimosso definitivamente | Semanticamente diverso da `404`: è un'informazione utile |
| `412 Precondition Failed` | Il validatore di `If-Match` non corrisponde | Concorrenza ottimistica: §3.6 |
| `415 Unsupported Media Type` | `Content-Type` non gestito | |
| `422 Unprocessable Content` | Sintatticamente valido, semanticamente no | Regola di dominio violata |
| `428 Precondition Required` | Manca `If-Match` dove è obbligatoria | RFC 6585. Impedisce l'aggiornamento cieco |
| `429 Too Many Requests` | Limite di traffico superato | RFC 6585. **`Retry-After` obbligatoria** nel progetto |
| `500 Internal Server Error` | Guasto non previsto | Mai con dettagli interni nel corpo |
| `503 Service Unavailable` | Indisponibilità temporanea | `Retry-After` |

**Il caso `403` contro `404`.** In un sistema sanitario la scelta non è di stile. Rispondere
`403` a chi chiede una risorsa che esiste ma non gli compete **conferma che quella risorsa
esiste**: se l'identificativo è il codice fiscale o un identificativo di episodio, questo è
già un'informazione sulla persona. La regola del progetto: **fuori dal proprio perimetro
autorizzativo si risponde `404`**, e `403` si usa solo quando il richiedente ha comunque
titolo a sapere che la risorsa esiste (ad esempio, appartiene al suo tenant ma richiede uno
scope superiore). La distinzione va documentata all'integratore, altrimenti la interpreterà
come un bug.

**Un errore che merita una riga a sé:** rispondere `200 OK` con un corpo che contiene
`{"error": "..."}`. Ogni cache, ogni proxy, ogni libreria di ritentativi e ogni cruscotto di
monitoraggio vedranno un successo. Il tasso di errore misurato sarà zero mentre il servizio è
fuori uso.

### 3.4 Negoziazione del contenuto

**Problema.** La stessa risorsa può avere rappresentazioni diverse — JSON o XML, italiano o
inglese, compressa o meno. Come si mettono d'accordo client e server senza moltiplicare gli
URI?

**Meccanismo.** Il client dichiara le proprie preferenze con le intestazioni `Accept`,
`Accept-Language`, `Accept-Encoding`, ciascuna con pesi di qualità `q` fra 0 e 1; il server
sceglie e dichiara la scelta in `Content-Type`, `Content-Language`, `Content-Encoding`, e
segnala con `Vary` quali intestazioni hanno influito — informazione indispensabile alle cache,
che altrimenti servirebbero la rappresentazione sbagliata a un altro client.

```http
GET /fhir/Encounter/enc-4471 HTTP/1.1
Accept: application/fhir+json;q=1.0, application/fhir+xml;q=0.5
Accept-Language: it-IT, it;q=0.9, en;q=0.5
Accept-Encoding: gzip, br
```

```http
HTTP/1.1 200 OK
Content-Type: application/fhir+json; charset=utf-8
Content-Language: it-IT
Content-Encoding: gzip
Vary: Accept, Accept-Language, Accept-Encoding
ETag: W/"3"
```

**Nel progetto.** Tre usi concreti:

1. **FHIR** richiede i tipi `application/fhir+json` e `application/fhir+xml`. Il progetto
   serve JSON come rappresentazione primaria e XML dove un integratore lo esiga.
2. **`application/problem+json`** per gli errori (§3.9): è un tipo distinto, e il client lo
   riconosce senza sapere nulla dell'API.
3. **La lingua.** Vale la pena essere precisi su un punto che ha sostanza giuridica: la
   negoziazione linguistica riguarda i **messaggi dell'interfaccia**, mai il **contenuto
   clinico**. Un referto redatto in italiano resta in italiano. E — regola terminologica del
   progetto, decisione D34 — la traduzione italiana del `display` di un codice non è una
   stringa di interfaccia da negoziare: è materiale con titolarità propria, tenuto separato
   architetturalmente. Vedi [05 §8.5](05-standard-di-interoperabilita.md).

**Specifica.** RFC 9110 §12 (negoziazione), §8.3-8.5 (`Content-Type`, `Content-Encoding`,
`Content-Language`), §12.5.5 (`Vary`).

**Errori tipici.** Dimenticare `Vary` e servire a un utente inglese la risposta memorizzata in
cache per un italiano. Ignorare `Accept` e restituire sempre JSON con `200`: la risposta
corretta a una preferenza insoddisfacibile è `406`. Usare estensioni nell'URI (`/risorsa.json`)
al posto della negoziazione: è ammesso e diffuso, ma moltiplica gli URI per la stessa risorsa
e complica la cache. Il progetto usa la negoziazione.

### 3.5 Cache e validatori

**Problema.** Non rispedire ciò che il client ha già, e non far rieseguire al server un lavoro
il cui risultato non è cambiato.

**Meccanismo.** Due modelli complementari, definiti in RFC 9111.

**Freschezza.** Il server dichiara per quanto tempo una risposta può essere considerata
valida senza chiedere. `Cache-Control: max-age=300` autorizza una cache a servirla per cinque
minuti. Le direttive che contano:

| Direttiva | Significato |
|---|---|
| `no-store` | **Non memorizzare affatto**, in nessuna forma, nemmeno su disco |
| `no-cache` | Memorizzabile, ma **rivalida sempre** prima di servire |
| `private` | Solo cache del singolo utente, mai cache condivisa |
| `public` | Memorizzabile anche da cache condivise |
| `max-age=N` | Fresco per N secondi |
| `must-revalidate` | Scaduto il tempo, non servire il vecchio: rivalida |

`no-cache` e `no-store` sono le due direttive che vengono scambiate più spesso. `no-cache`
**non** impedisce la memorizzazione: impedisce l'uso senza rivalidazione. Per un dato
sanitario serve `no-store`.

**Validazione.** Il server allega alla risposta un **validatore** — un `ETag` (identificatore
opaco della rappresentazione) o una `Last-Modified` — e il client, alla richiesta successiva,
lo ripropone in `If-None-Match` o `If-Modified-Since`. Se nulla è cambiato, il server risponde
`304 Not Modified` senza corpo.

```http
GET /v1/tenants/asl-nord-01/branding HTTP/1.1
If-None-Match: "a3f1c9e2"
```

```http
HTTP/1.1 304 Not Modified
ETag: "a3f1c9e2"
Cache-Control: private, max-age=60
```

Un `ETag` può essere **forte** (`"a3f1c9e2"`) o **debole** (`W/"a3f1c9e2"`). Il forte garantisce
identità byte per byte; il debole solo equivalenza semantica. FHIR usa `ETag` deboli, con il
numero di versione della risorsa come valore ([06 §7.7](06-fhir-da-zero.md)).

**Nel progetto — la regola vincolante.** Il progetto tratta dati appartenenti alle categorie
particolari dell'art. 9 GDPR. La politica è netta e non è negoziabile per comodità:

- **ogni risposta che contiene dato clinico o dato personale porta `Cache-Control: no-store`**;
- gli `ETag` restano comunque, perché servono alla **concorrenza ottimistica** (§3.6), che è un
  meccanismo distinto dalla cache pur usando lo stesso campo;
- si memorizza in cache ciò che è pubblico o di configurazione: metadati di scoperta,
  `CapabilityStatement`, JWKS, definizioni di profilo, risorse di branding, terminologie;
- **una cache condivisa non deve mai poter servire a un utente una risposta calcolata per un
  altro**: `private` sulle risposte personalizzate e `Vary` corretta su `Authorization` sono
  il minimo, ma il minimo affidabile è `no-store`.

**Errori tipici.** `Cache-Control: no-cache` creduto equivalente a `no-store`. Un `ETag`
calcolato sull'oggetto in memoria anziché sui byte serializzati, che cambia a ogni richiesta
perché l'ordine delle chiavi non è stabile — un validatore che non è stabile non è un
validatore. Nessuna intestazione di cache: il comportamento predefinito degli intermediari
è definito dalla specifica ma non è quello che la maggior parte delle persone si aspetta, e
non è una buona idea scoprirlo in produzione con dati sanitari.

### 3.6 ETag e concorrenza ottimistica

**Problema.** Due professionisti aprono lo stesso referto, entrambi modificano, entrambi
salvano. Senza contromisure, il secondo salvataggio sovrascrive il primo e nessuno se ne
accorge. Si chiama **aggiornamento perduto** (*lost update*), ed è un difetto silenzioso: non
produce errori, produce dati sbagliati.

**Meccanismo.** La strategia *pessimistica* consiste nel bloccare la risorsa: funziona male in
un contesto distribuito, perché un client che si disconnette lascia un blocco appeso e serve
un meccanismo di scadenza che riapre il problema. La strategia **ottimistica** non blocca
nulla: consente a tutti di provare, e fa fallire chi arriva con una versione superata.

Il meccanismo su HTTP è la **richiesta condizionale** con `If-Match`:

```mermaid
sequenceDiagram
    autonumber
    participant A as Client A
    participant B as Client B
    participant S as Server

    A->>S: GET /v1/reports/rep-77
    S-->>A: 200 OK, ETag: "v7"
    B->>S: GET /v1/reports/rep-77
    S-->>B: 200 OK, ETag: "v7"
    A->>S: PUT /v1/reports/rep-77, If-Match: "v7"
    S-->>A: 200 OK, ETag: "v8"
    B->>S: PUT /v1/reports/rep-77, If-Match: "v7"
    S-->>B: 412 Precondition Failed
    Note over B: il client ricarica, mostra il conflitto<br/>e chiede all'utente come procedere
```

Il passaggio decisivo è l'ultimo, e non è tecnico: **cosa mostra l'interfaccia quando arriva
il `412`**. Un messaggio «errore 412» è inaccettabile per il vincolo **V6**; scartare
silenziosamente il lavoro dell'utente è peggio. Il comportamento richiesto è: conservare ciò
che l'utente ha scritto, mostrare che cosa è cambiato nel frattempo e chi l'ha cambiato,
chiedere una decisione esplicita.

**Nel progetto.** Obbligatorio su ogni risorsa clinica modificabile: referto in redazione,
piano di monitoraggio, consenso, configurazione di tenant. Su queste risorse una `PUT` o una
`PATCH` **senza `If-Match` viene rifiutata con `428 Precondition Required`** (RFC 6585) —
*proposta di progetto*, ma con una motivazione che va oltre la tecnica: consentire un
aggiornamento cieco su un documento clinico è un rischio da registrare nell'analisi ai sensi
di ISO 14971, non una comodità da concedere.

In FHIR il meccanismo è lo stesso, con `ETag` deboli allineati a `meta.versionId`
([06 §7.7](06-fhir-da-zero.md)).

**Specifica.** RFC 9110 §8.8.3 (`ETag`), §13.1.1 (`If-Match`), §13.1.2 (`If-None-Match`),
§15.5.13 (`412`); RFC 6585 §3 (`428`).

**Errori tipici.** Usare `Last-Modified` al posto di `ETag` come validatore per la
concorrenza: la risoluzione è al secondo, e due modifiche nello stesso secondo diventano
indistinguibili. Generare l'`ETag` da un timestamp con lo stesso difetto. Accettare `If-Match: *`
credendo che significhi «qualunque versione»: significa «purché la risorsa esista», il che
disattiva completamente la protezione.

### 3.7 `Idempotency-Key` — e il suo stato di specifica

**Problema.** Un client invia `POST /v1/sessions`. La rete cade prima che la risposta torni.
Il client non sa se la sessione è stata creata. Se ritenta, rischia di crearne due; se non
ritenta, rischia di non averne nessuna. `POST` non è idempotente per definizione (RFC 9110
§9.2.2), quindi il ritentativo non è sicuro.

**Meccanismo.** Il client genera un identificativo unico **per il tentativo logico** e lo
invia in un'intestazione. Il server, alla prima richiesta con quella chiave, esegue
l'operazione e **memorizza la risposta** associata alla chiave. A ogni richiesta successiva
con la stessa chiave, non riesegue nulla: restituisce la risposta memorizzata.

```http
POST /v1/sessions HTTP/1.1
Host: api.telemedic.esempio.it
Content-Type: application/json
Idempotency-Key: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f
Authorization: Bearer eyJhbGciOiJFUzM4NCI...

{
  "appointmentRef": "Appointment/789",
  "tenant": "asl-nord-01",
  "scheduledStart": "2026-09-01T09:00:00.000Z"
}
```

Quattro decisioni che vanno prese e documentate, perché la sola intestazione non basta:

1. **Chi genera la chiave.** Il client, sempre. Una chiave generata dal server non risolve
   nulla, perché il problema è proprio che il client non sa se il server ha visto la richiesta.
2. **Per quanto tempo si ricorda.** *Proposta di progetto:* 24 ore. Oltre, la chiave scade e
   una nuova richiesta viene eseguita come nuova.
3. **Che cosa succede se la stessa chiave arriva con un corpo diverso.** Deve essere un
   errore, non una sostituzione silenziosa: il progetto risponde `422` con un
   `Problem Details` che dichiara il riuso improprio. Il controllo si fa su un'impronta del
   corpo, memorizzata insieme alla chiave.
4. **Che cosa succede se la seconda richiesta arriva mentre la prima è ancora in corso.**
   *Proposta di progetto:* `409 Conflict` con `Retry-After`, che è più onesto che far
   attendere il client su una connessione aperta.

**Nel progetto.** Obbligatorio su tutte le operazioni non idempotenti che creano stato
clinico o hanno effetti esterni: creazione di sessione, invio di referto verso il sistema di
origine, registrazione di un consenso, pubblicazione di un documento. È inoltre il meccanismo
che il progetto **chiede ai ricevitori dei propri webhook** di implementare (§6.4).

**Specifica — questo è il punto che va detto senza ambiguità.**

> **`Idempotency-Key` non è uno standard IETF.** Il documento è
> `draft-ietf-httpapi-idempotency-key-header`, del working group *httpapi*; l'ultima revisione
> è la **-07 del 15 ottobre 2025**, e risulta **scaduta e archiviata** sul datatracker: non è
> più un documento attivo e **non è mai stato pubblicato come RFC** `[B6]`.

Conseguenza redazionale vincolante: nella documentazione pubblica, nei contratti di
integrazione e nei capitolati, `Idempotency-Key` va presentato come **convenzione di progetto
ispirata a un Internet-Draft scaduto**, mai come conformità a uno standard. Il nome del campo
è mantenuto proprio perché è la convenzione di settore più diffusa e gli integratori la
riconoscono: cambiarlo produrrebbe attrito senza alcun guadagno.

**Errori tipici.** Confondere la chiave di idempotenza con l'identificativo della risorsa: la
prima identifica il *tentativo*, la seconda il *risultato*. Registrare la chiave **dopo**
l'esecuzione anziché nella stessa transazione: due richieste simultanee passano entrambe.
Riusare la stessa chiave per operazioni logicamente diverse. Ometterla nei ritentativi
automatici della libreria client, che è il punto in cui il meccanismo serve di più.

**Alternative scartate.** Deduplicazione lato server su un'impronta del corpo, senza chiave
esplicita: scartata perché due creazioni legittime e identiche (due sessioni identiche
programmate per lo stesso momento) sarebbero indistinguibili da un duplicato. La creazione
condizionale di FHIR (`If-None-Exist`) risolve un problema affine dentro il perimetro FHIR, ma
non copre le operazioni applicative.

### 3.8 Limitazione del traffico: la forma oggi corretta

**Problema.** Dire a un client quanto traffico gli resta, **prima** che venga respinto, così
che possa rallentare da solo invece di essere bloccato.

**Meccanismo e stato della specifica.** Qui c'è un errore diffuso da correggere in modo
esplicito, perché è ripetuto in moltissima documentazione professionale.

> La terna `RateLimit-Limit` / `RateLimit-Remaining` / `RateLimit-Reset` **non è mai stata uno
> standard**, ed è oggi anche **superata**. Il documento di riferimento è
> `draft-ietf-httpapi-ratelimit-headers`, revisione **-11 del 23 maggio 2026**, che è un
> **Internet-Draft attivo** con *intended status* Standards Track ma **non è una RFC**. La
> revisione corrente definisce **due soli campi**, entrambi *Structured Fields*:
> **`RateLimit`** e **`RateLimit-Policy`** `[B6]`.

I parametri, come accertati nella fase di ricerca `[B6]`:

| Campo | Parametro | Significato |
|---|---|---|
| `RateLimit-Policy` | `q` | quota complessiva |
| | `w` | ampiezza della finestra, in secondi |
| | `qu` | unità di quota (`requests`, `content-bytes`, `concurrent-requests`) |
| | `pk` | chiave di partizione: a che cosa si applica la quota |
| `RateLimit` | `r` | quota residua |
| | `t` | secondi alla reimpostazione della finestra |
| | `pk` | chiave di partizione |

Il draft registra inoltre presso IANA tre tipi di problema (`quota-exceeded`,
`temporary-reduced-capacity`, `abnormal-usage-detected`) utilizzabili come `type` di un
`Problem Details` (§3.9).

Esempio conforme alla revisione corrente:

```http
HTTP/1.1 200 OK
RateLimit-Policy: "sessions";q=1000;w=3600;qu="requests";pk=:dGVuYW50OmFzbC1ub3JkLTAx:
RateLimit: "sessions";r=417;t=1832
```

E la risposta quando la quota è esaurita:

```http
HTTP/1.1 429 Too Many Requests
Content-Type: application/problem+json
Retry-After: 1832
RateLimit: "sessions";r=0;t=1832

{
  "type": "https://iana.org/assignments/http-problem-types#quota-exceeded",
  "title": "Quota superata",
  "status": 429,
  "detail": "Superato il limite di 1000 creazioni di sessione per ora sul tenant asl-nord-01.",
  "instance": "/v1/sessions"
}
```

**Nel progetto.** Il limite è **per tenant e per scope**, non per indirizzo IP (§2.1 spiega
perché l'indirizzo non identifica nessuno), ed è configurabile per integratore, come richiede
il requisito di multi-integratore §6.2.6 del profilo. La politica adottata:

- **emettere `RateLimit` e `RateLimit-Policy`** conformi alla revisione corrente del draft;
- **emettere anche i tre campi legacy**, per compatibilità con i client esistenti che li
  cercano;
- **dichiarare nella documentazione che entrambi sono non normativi**, con il numero di
  revisione del draft su cui il progetto si è allineato e la data;
- `429` **sempre con `Retry-After`**, perché è l'unico campo di questa famiglia che è
  effettivamente normato (RFC 9110 §10.2.3) e che le librerie generiche rispettano.

**Errori tipici.** Restituire `429` senza `Retry-After`, lasciando il client a indovinare —
tipicamente ritentando subito e peggiorando la situazione. Applicare il limite dopo
l'autenticazione anziché prima, in modo che un attacco a forza bruta consumi comunque risorse
di validazione crittografica. Contare le richieste e non il costo: mille letture leggere e
mille esportazioni massive non sono lo stesso carico, ed è la ragione per cui il draft prevede
unità di quota diverse dalle richieste.

### 3.9 `Deprecation` e `Sunset`

**Problema.** Un'API cambia. Gli integratori vanno avvisati in modo che un programma possa
accorgersene, non solo un essere umano che legge una newsletter.

**Meccanismo e stato.** Anche qui la fase di ricerca ha corretto un'informazione diffusa:

> **`Deprecation` è una RFC.** È **RFC 9745**, *The Deprecation HTTP Response Header Field*,
> **Standards Track, marzo 2025**, iscritta come campo permanente nel registro IANA dei nomi
> di campo HTTP, di tipo strutturato *Item* `[B6]`. Chi la descrive ancora come Internet-Draft
> sta citando informazione superata.

Il valore è una **Date** di *Structured Fields*, cioè un intero preceduto da `@` che esprime
i secondi dall'epoca Unix (RFC 9651 §3.3.7) `[B6]`:

```http
HTTP/1.1 200 OK
Deprecation: @1688169599
Sunset: Sat, 31 Oct 2026 23:59:59 GMT
Link: <https://docs.telemedic.esempio.it/api/v1-deprecation>; rel="deprecation"; type="text/html"
Link: <https://api.telemedic.esempio.it/v2/sessions>; rel="successor-version"
```

Le tre parti hanno ruoli distinti e complementari:

| Campo | Ruolo | Specifica |
|---|---|---|
| `Deprecation` | **Da quando** l'endpoint è deprecato. Una data nel passato significa «già deprecato»; nel futuro, «lo sarà» | RFC 9745 |
| `Sunset` | **Quando smetterà di funzionare** | RFC 8594 |
| `Link; rel="deprecation"` | Documentazione **per un essere umano** che spiega cosa fare | RFC 9745, con il registro delle relazioni di RFC 8288 |

Vincolo normativo esplicito, citato in fase di ricerca: *«the timestamp given in the Sunset
HTTP header field MUST NOT be earlier than the one given in the Deprecation header field»*
`[B6]`. `Sunset` prima di `Deprecation` è una violazione, non una svista.

**Nel progetto.** La politica di deprecazione (*proposta di progetto*) è:

1. Nessun endpoint viene rimosso senza essere stato deprecato **almeno dodici mesi prima**,
   con `Deprecation` e `Sunset` emessi su ogni risposta per tutto il periodo.
2. La deprecazione è **misurata**: si registra quali integratori chiamano ancora l'endpoint
   deprecato e con quale volume. Senza questa misura, la data di dismissione è una scommessa.
3. La deprecazione compare **anche nel contratto** OpenAPI (`deprecated: true` sull'operazione)
   e nella documentazione, non solo nell'intestazione a runtime.
4. In ambito sanitario si aggiunge un vincolo che altrove non c'è: se un integratore usa
   l'endpoint deprecato in un percorso che tocca la sicurezza del paziente, la sua
   dismissione è un **cambiamento soggetto a controllo delle modifiche** ai sensi di
   IEC 62304, non una scelta di prodotto.

**Errori tipici.** Deprecare senza `Sunset`, il che comunica «un giorno» e non produce alcun
movimento. Rimuovere prima della data dichiarata. Deprecare senza indicare il successore:
`Link; rel="successor-version"` esiste apposta. Emettere l'intestazione solo sulla
documentazione e non sulle risposte, dove i sistemi automatici la vedrebbero.

### 3.10 `Problem Details` — gli errori in forma leggibile da una macchina

**Problema.** Ogni API inventa il proprio formato di errore. Un client che ne integra cinque
scrive cinque parser. Nessuno di quei formati è comprensibile a uno strumento generico.

**Meccanismo.** RFC 9457 definisce un tipo di contenuto — `application/problem+json` — e un
insieme di campi:

| Campo | Obbligatorietà | Contenuto |
|---|---|---|
| `type` | consigliato | URI che **identifica il tipo di problema**. È la chiave stabile su cui il client ramifica |
| `title` | consigliato | Sintesi leggibile, **costante per tipo** |
| `status` | opzionale | Il codice di stato HTTP, ripetuto per comodità |
| `detail` | opzionale | Spiegazione **specifica di questa occorrenza** |
| `instance` | opzionale | URI che identifica l'occorrenza specifica |

Il documento è estendibile: si possono aggiungere campi propri, ed è lì che va
l'informazione strutturata di dominio.

```http
HTTP/1.1 422 Unprocessable Content
Content-Type: application/problem+json
Content-Language: it-IT
```

```json
{
  "type": "https://docs.telemedic.esempio.it/problems/consenso-registrazione-mancante",
  "title": "Consenso alla registrazione non acquisito",
  "status": 422,
  "detail": "La sessione ses-9f1c2b3d richiede il consenso esplicito del paziente prima di attivare la registrazione lato server.",
  "instance": "/v1/sessions/ses-9f1c2b3d/recording",
  "traceId": "0f5b1c2d9a8e4b7f",
  "tenant": "asl-nord-01",
  "violations": [
    { "field": "recording.enabled", "rule": "requires-explicit-consent" }
  ]
}
```

**Nel progetto.** È il formato **unico** degli errori dell'API applicativa. Con tre regole
proprie:

1. **`type` è un URI stabile e risolvibile**, che punta a una pagina della documentazione con
   la causa, le conseguenze e il rimedio. È il collegamento che riduce i ticket di assistenza,
   e va trattato come parte del contratto: cambiarlo è una modifica non retro-compatibile.
2. **`detail` non contiene mai dato clinico né dato personale.** Un messaggio d'errore finisce
   nei log del client, in quelli degli intermediari e negli strumenti di monitoraggio. «Il
   paziente RSSMRA80A01H501U non ha consenso attivo» è una violazione confezionata come
   messaggio di cortesia. Si usa un identificativo interno, e la corrispondenza si risolve nei
   sistemi autorizzati.
3. **`traceId` è sempre presente** e corrisponde all'identificativo di traccia distribuita:
   è ciò che consente all'assistenza di trovare l'evento senza chiedere all'integratore di
   riprodurre il problema.

**Il rapporto con FHIR.** L'API FHIR **non** usa `Problem Details`: usa la risorsa
`OperationOutcome`, che è il meccanismo normato dallo standard
([06 §6.22](06-fhir-da-zero.md)). Non è un'incoerenza da sanare: sono due interfacce con due
contratti diversi, e in ciascuna si usa il formalismo che le compete. Il progetto mantiene una
**tabella di corrispondenza** fra i propri `type` e i codici `OperationOutcome.issue.code`, in
modo che lo stesso problema di dominio sia riconoscibile su entrambe le superfici.

**Specifica.** **RFC 9457** (2023), che **sostituisce RFC 7807**. La differenza principale è
che il nuovo testo chiarisce l'estendibilità e introduce il registro IANA dei tipi di
problema. Se trovi RFC 7807 citata, il riferimento va aggiornato.

**Errori tipici.** Usare `Content-Type: application/json` invece di
`application/problem+json`: il client generico non riconosce il documento. Far variare `title`
con l'occorrenza — `title` è costante per tipo, la parte variabile sta in `detail`. Usare come
`type` un URI che non esiste. Restituire uno stack trace in `detail`: è un dono a chi cerca la
struttura interna del sistema.

---

## 4. Identità e autorizzazione

Una premessa che elimina metà delle confusioni. **Autenticazione** e **autorizzazione** sono
due domande distinte:

- *chi sei?* → **autenticazione**. Risponde OpenID Connect, risponde SAML 2.0, rispondono
  SPID, CIE e TS-CNS.
- *cosa ti è consentito fare?* → **autorizzazione**. Risponde OAuth 2.0, rispondono gli scope
  e le regole di dominio.

OAuth 2.0 **non è un protocollo di autenticazione**, e usarlo come tale è la vulnerabilità
storica di questa famiglia. OpenID Connect esiste precisamente perché OAuth non rispondeva
alla prima domanda. Il quadro dell'identità digitale italiana — SPID, CIE, TS-CNS, i livelli
di garanzia, chi è il fornitore di servizi — è in
[04 — Identità e anagrafiche](04-identita-e-anagrafiche.md); qui si trattano i protocolli.

### 4.1 OAuth 2.0

**Problema.** Un'applicazione deve accedere a una risorsa per conto di un utente **senza
conoscerne la password**. Prima di OAuth la soluzione corrente era chiedere all'utente le
credenziali del servizio di destinazione e usarle al suo posto: nessuna limitazione di
ambito, nessuna scadenza, nessuna revoca selettiva.

**Meccanismo.** OAuth introduce quattro ruoli e un oggetto:

| Ruolo | Chi è |
|---|---|
| **Resource Owner** | L'utente, che possiede il dato |
| **Client** | L'applicazione che vuole accedervi |
| **Authorization Server** | Chi autentica l'utente ed emette i token |
| **Resource Server** | L'API che espone il dato e valida il token |

L'oggetto è l'**access token**: una credenziale a vita breve, limitata ad ambiti specifici
(**scope**) e a destinatari specifici (**audience**). Il client lo presenta come *bearer token*
(RFC 6750) nell'intestazione `Authorization: Bearer …`.

«*Bearer*» significa letteralmente «al portatore»: **chiunque lo possieda può usarlo**. È
tutto ciò che serve sapere per capire perché le durate sono brevi, perché non deve mai
comparire in un URL e perché esistono i meccanismi di vincolo al possessore (§4.4).

**I flussi, e quali sono ancora ammissibili.**

| Flusso | Quando | Stato |
|---|---|---|
| **Authorization Code + PKCE** | C'è un essere umano davanti a un browser | **L'unico flusso interattivo ammesso nel progetto** |
| **Client Credentials** | Nessun utente: sistema che chiama sistema | Ammesso, con autenticazione asimmetrica (§4.3) |
| **Refresh Token** | Rinnovare l'accesso senza reinteragire | Ammesso, con rotazione |
| **Device Authorization Grant** (RFC 8628) | Dispositivo senza browser | Fuori perimetro v1.0 `[NV]` |
| **Implicit** | — | **Vietato.** RFC 9700 §2.1.2: i client «SHOULD NOT use the implicit grant» `[R5]` |
| **Resource Owner Password Credentials** | — | **Vietato.** RFC 9700 §2.4: «MUST NOT be used» `[R5]` |

Il divieto dei due ultimi non è un irrigidimento del progetto: l'implicit consegnava il token
nel frammento dell'URL, dove finisce in cronologia e nei log; il flusso a password
reintroduce esattamente il problema che OAuth esiste per risolvere, cioè far transitare la
password dell'utente per l'applicazione.

**Nel progetto.** OAuth 2.0 è il fondamento di tutta l'autorizzazione: sull'API applicativa,
sull'API FHIR (dove SMART on FHIR è un profilo di OAuth, §5.4), sul componente incorporabile
e nelle chiamate fra Telemedic e i sistemi degli integratori. L'authorization server è
Keycloak.

**Specifica.** RFC 6749 (framework, 2012); RFC 6750 (uso del bearer token); **RFC 9700**,
*Best Current Practice for OAuth 2.0 Security*, che è il documento operativamente vincolante
e da cui discendono i divieti sopra `[R5]`. Documenti di supporto che il progetto usa:
RFC 8414 (metadati dell'authorization server), RFC 8252 / BCP 212 (app native), RFC 8707
(resource indicators), RFC 9207 (identificazione dell'issuer nella risposta, contro l'attacco
di *mix-up*) `[R5]`.

**Errori tipici.** Trattare l'access token come prova d'identità dell'utente (è
un'autorizzazione, non un'asserzione di identità: per quello serve l'`id_token` di OIDC).
Emettere token senza `aud`, che possono così essere rigirati verso un altro resource server —
RFC 9700 §2.3 prescrive la restrizione di audience `[R5]`. Scope grossolani del tipo
`read`/`write`, che rendono impossibile applicare il minimo privilegio. Token a vita lunga
«per comodità dell'integratore».

### 4.2 PKCE

**Problema.** Nel flusso Authorization Code, l'authorization server rinvia il browser al
client con un **codice** di autorizzazione, che il client scambia poi con un token. Su un
dispositivo mobile o in un'applicazione a pagina singola quel rinvio può essere intercettato
— per esempio da un'applicazione ostile registrata sullo stesso schema di URL. Chi cattura il
codice e conosce il `client_id` (che è pubblico) ottiene il token.

**Meccanismo.** **PKCE** — *Proof Key for Code Exchange* — lega il codice a un segreto
generato dal client per quella singola richiesta.

```text
code_verifier   = 43..128 caratteri casuali da [A-Z][a-z][0-9]-._~   (RFC 7636 §4.1)
code_challenge  = BASE64URL( SHA-256( ASCII(code_verifier) ) )        (RFC 7636 §4.2, S256)
```

Il client invia il `code_challenge` nella richiesta di autorizzazione e il `code_verifier`
nella richiesta di token. Il server ricalcola l'hash e confronta. Chi ha intercettato il
codice non ha il verifier, e il codice gli è inutile.

```mermaid
sequenceDiagram
    autonumber
    participant U as Utente (browser)
    participant C as Client
    participant AS as Authorization Server
    participant RS as Resource Server

    C->>C: genera code_verifier casuale<br/>code_challenge = S256(code_verifier)
    C->>U: redirect a /authorize?response_type=code&client_id=…<br/>&redirect_uri=…&scope=…&state=…<br/>&code_challenge=…&code_challenge_method=S256
    U->>AS: richiesta di autorizzazione
    AS->>U: autenticazione (SPID / CIE / TS-CNS / credenziali locali)
    AS->>U: schermata di consenso, se prevista
    AS->>C: redirect a redirect_uri?code=…&state=…&iss=…
    C->>C: verifica che state coincida<br/>e che iss sia quello atteso (RFC 9207)
    C->>AS: POST /token  grant_type=authorization_code<br/>code, redirect_uri, code_verifier, client_id
    AS->>AS: SHA-256(code_verifier) == code_challenge ?
    AS-->>C: access_token, id_token, refresh_token
    C->>RS: GET /risorsa  Authorization: Bearer «access_token»
    RS->>RS: valida firma, iss, aud, exp, scope, tenant
    RS-->>C: 200 OK
```

**Nel progetto.** Obbligatorio su **tutti** i client, pubblici e confidenziali, con
`code_challenge_method=S256`. Il metodo `plain`, pur ammesso da RFC 7636, è **rifiutato**: non
protegge dall'intercettazione, che è la sola minaccia contro cui PKCE esiste. Questo allinea
il progetto sia a RFC 9700 §2.1.1 sia a SMART App Launch, che è categorico — «All SMART apps
SHALL support PKCE», i server «SHALL support the `S256` `code_challenge_method` and SHALL NOT
support the `plain` method» `[R5]`.

Due controlli che accompagnano sempre PKCE e che vengono dimenticati:

- **`state`**, con almeno 122 bit di entropia secondo SMART `[R5]`, verificato al ritorno: è
  la difesa dal CSRF sul rinvio;
- **corrispondenza esatta del `redirect_uri`**: RFC 9700 §2.1 impone lo *exact string
  matching*, con l'unica eccezione della porta di `localhost` per le applicazioni native
  `[R5]`. Un rinvio con corrispondenza parziale o con caratteri jolly è una fuga di token in
  attesa di accadere.

**Specifica.** RFC 7636 (2015). Reso obbligatorio da RFC 9700 §2.1.1 `[R5]`.

**Errori tipici.** Generare il `code_verifier` con un generatore pseudocasuale non
crittografico. Riusare lo stesso verifier fra sessioni. Implementare PKCE lato client e non
verificarlo lato server, che è come mettere una serratura senza il pistone.

### 4.3 OpenID Connect

**Problema.** OAuth dice che il client è autorizzato ad accedere a qualcosa, ma non dice
**chi è l'utente**, né in che modo è stato autenticato, né quando.

**Meccanismo.** OIDC è uno strato sottile sopra OAuth 2.0 che aggiunge:

- Lo **`id_token`**: un JWT firmato dall'authorization server che asserisce l'identità
  dell'utente. **È l'unico artefatto di autenticazione**; l'access token non lo è.
- Lo scope **`openid`**, che attiva il comportamento OIDC.
- L'endpoint **`userinfo`**, per ottenere attributi ulteriori.
- La **scoperta** su `/.well-known/openid-configuration`, che pubblica endpoint, algoritmi
  supportati e posizione del JWKS.

I claim dell'`id_token` che vanno **sempre** validati:

| Claim | Verifica |
|---|---|
| `iss` | Coincide esattamente con l'issuer atteso |
| `aud` | Contiene il proprio `client_id` |
| `exp` / `iat` | Non scaduto, non emesso nel futuro (con una tolleranza minima) |
| `nonce` | Coincide con quello inviato nella richiesta — difesa dal replay |
| `azp` | Se presente e ci sono più audience, è il proprio `client_id` |
| `acr` | **Il livello di autenticazione effettivamente ottenuto** |
| `auth_time` | Quando è avvenuta l'autenticazione, se serve una freschezza |

L'ultimo punto merita attenzione: `acr` (*Authentication Context Class Reference*) è il campo
in cui viaggia il livello di garanzia, e nel contesto italiano ha valori normati — §4.9.

**Nel progetto.** OIDC è il protocollo di autenticazione verso Keycloak per la UI clinica, per
la UI paziente e per i client degli integratori. È anche il protocollo con cui Keycloak si
federa verso **CIE**, per la quale è disponibile un profilo OIDC `[B7]`.

**Specifica.** *OpenID Connect Core 1.0* della OpenID Foundation. **Non è una RFC**: è uno
standard di un'altra organizzazione, e va citato come tale. La scoperta è definita da *OpenID
Connect Discovery 1.0*; il documento di metadati dell'authorization server ha anche una forma
IETF in RFC 8414.

**Errori tipici.**

- **Usare l'access token come prova di identità.** È la confusione fondamentale. L'access
  token è per il resource server; l'`id_token` è per il client.
- **Non validare `nonce`.** Senza, un `id_token` catturato altrove può essere riproposto.
- **Fidarsi di `email` come identificativo stabile.** Cambia, e in alcuni provider può essere
  modificata senza verifica. Il progetto ha un caso concreto: fra i difetti di Keycloak
  segnalati in fase di ricerca c'è proprio che **l'utente federato può cambiarsi l'email
  senza verifica e assegnarsi una password locale**, difetti da trattare come rischi ai sensi
  di ISO 14971 e non come note di configurazione `[B7]`. L'identificativo è `iss` + `sub`,
  sempre.
- **Derivare l'identità nazionale da `sub`.** Nel contesto italiano l'identificativo
  dell'assistito è il codice fiscale, con le sue regole; vedi
  [04](04-identita-e-anagrafiche.md).

### 4.4 JWT e JWS: i tranelli di validazione

**Problema.** Trasportare un insieme di affermazioni (*claim*) fra due parti in modo che il
destinatario possa verificarne l'origine e l'integrità **senza interrogare l'emittente a ogni
richiesta**.

**Meccanismo.** Un **JWT** è un contenitore di claim JSON. Nella forma usata praticamente
sempre — **JWS Compact Serialization** — è composto da tre parti separate da punti, ciascuna
codificata in base64url:

```text
eyJhbGciOiJFUzM4NCIsImtpZCI6InRtLTIwMjYtMDgiLCJ0eXAiOiJhdCtqd3QifQ   ← header
.
eyJpc3MiOiJodHRwczovL3RlbGVtZWRpYy5lc2VtcGlvLml0L3JlYWxtcy9jbGluaWMi… ← payload
.
MEUCIQDf1sK9x0Rz…                                                    ← firma
```

**base64url non è cifratura.** Chiunque abbia il token ne legge il contenuto. Un JWT protegge
integrità e origine, non riservatezza. Se il contenuto deve essere segreto serve **JWE**
(RFC 7516), che è un'altra cosa e che il progetto non usa per i token di accesso.

Payload realistico di un access token del progetto (valori sintetici):

```json
{
  "iss": "https://telemedic.esempio.it/realms/clinic",
  "aud": "telemedic-api",
  "sub": "https://idp.integratore.example#prof-001",
  "act": { "sub": "b1f2c3d4-integratore-client-id",
           "iss": "https://telemedic.esempio.it/realms/clinic" },
  "acr": "urn:telemedic:acr:asserted-by-issuer",
  "scope": "https://telemedic.example/scopes/session.start system/Encounter.cu",
  "tenant": "asl-nord-01",
  "fhirUser": "https://telemedic.esempio.it/fhir/Practitioner/prc-8812",
  "exp": 1787654621,
  "iat": 1787654321,
  "jti": "0f5b1c2d-9a8e-4b7f-a1c2-3d4e5f6a7b8c"
}
```

> `tenant`, `fhirUser`, `auth_source` e `urn:telemedic:acr:asserted-by-issuer` sono **proposte
> di progetto**, non claim standard `[R5]` `[B7]`. `act` è invece standard: RFC 8693 §4.1.

**I tranelli di validazione.** Sono noti, documentati e continuano a ripresentarsi. RFC 8725
(*JSON Web Token Best Current Practices*) li raccoglie; questi sono quelli che contano:

1. **`alg: none`.** La specifica JWA prevede un algoritmo «nessuno». Una libreria che accetti
   l'header `{"alg":"none"}` accetta token non firmati. **Il verificatore non deve mai
   dedurre l'algoritmo dal token**: deve imporre l'insieme degli algoritmi ammessi.
2. **Confusione fra algoritmi simmetrici e asimmetrici.** Se il verificatore accetta `HS256`
   e la chiave usata come segreto è la chiave *pubblica* RSA del server — che è pubblica per
   definizione — l'attaccante può firmare token validi. Stessa contromisura: allow-list degli
   algoritmi, per emittente.
3. **`kid` non sanificato.** Il `kid` viene spesso usato per cercare una chiave in un archivio
   o in un file: se finisce in una query o in un percorso senza controlli, si ottiene
   *injection* o *path traversal*.
4. **`jku` seguito ciecamente.** L'header può contenere l'URL del JWK Set. Seguirlo significa
   lasciare che sia il token a dire dove prendere la chiave per verificarlo: è una superficie
   di *server-side request forgery* e di confusione di chiavi. Regola del progetto: il `jku`
   dell'header **va confrontato con il `jwks_uri` registrato per quel `client_id`**, e se non
   coincide la richiesta si rifiuta `[R5]`.
5. **`aud` non verificato.** Un token emesso per un altro servizio viene accettato. È
   l'attacco che il parametro `aud` di SMART esiste per impedire — la specifica lo motiva
   testualmente: «This parameter prevents leaking a genuine bearer token to a counterfeit
   resource server» `[R5]`.
6. **`exp` verificato con tolleranza generosa.** Una tolleranza di minuti per compensare
   orologi mal sincronizzati estende la finestra di replay. La soluzione dell'orologio è NTP
   (§8.1), non l'indulgenza del verificatore.
7. **Nessun controllo di replay su `jti`.** Per le asserzioni di autenticazione del client,
   `jti` va memorizzato fino a `exp` e i duplicati vanno rifiutati.

**Il compromesso fondamentale del JWT.** Un token autoconsistente si valida senza rete, ma
**non si revoca**: fino a `exp` è valido, punto. Le tre risposte possibili sono: token brevi
(la sola che scali davvero), introspezione a ogni richiesta (§4.6), lista di revoca (efficace
ma introduce lo stato che il JWT voleva eliminare). Politica del progetto: **token brevi**,
con le durate proposte in fase di ricerca — 5-10 minuti per l'access token dell'utente in
contesto clinico, 300 secondi per i token di sistema, allineandosi alla raccomandazione
esplicita di SMART Backend Services `[R5]`.

**Vincolare il token al possessore.** Poiché un bearer token rubato è utilizzabile da
chiunque, esistono meccanismi che lo legano a una chiave del client: **DPoP** (RFC 9449), che
allega alla richiesta una prova firmata, e i **token vincolati a mTLS** (RFC 8705). Il
progetto li considera irrobustimenti applicabili per tenant, non requisiti generali della
v1.0 `[NV]`.

**Specifica.** RFC 7519 (JWT), RFC 7515 (JWS), RFC 7516 (JWE), RFC 7517 (JWK), RFC 7518
(JWA), **RFC 8725** (BCP sui JWT). Per gli access token in forma JWT esiste un profilo
dedicato che definisce fra l'altro il `typ: at+jwt` `[NV]`.

### 4.5 JWKS e rotazione delle chiavi

**Problema.** Chi verifica una firma deve conoscere la chiave pubblica di chi ha firmato, e
deve continuare a funzionare quando quella chiave cambia — senza un intervento coordinato di
tutte le parti nello stesso istante.

**Meccanismo.** Un **JWK Set** è un documento JSON che pubblica un insieme di chiavi
pubbliche, ciascuna con un identificativo `kid`. È esposto su un URL stabile, tipicamente
dichiarato nei metadati di scoperta.

```json
{
  "keys": [
    {
      "kty": "EC", "crv": "P-384", "use": "sig", "alg": "ES384",
      "kid": "tm-2026-08",
      "x": "3BdVKq...", "y": "9fTz1a..."
    },
    {
      "kty": "EC", "crv": "P-384", "use": "sig", "alg": "ES384",
      "kid": "tm-2026-02",
      "x": "Lp0Qm2...", "y": "7Yb4Rc..."
    }
  ]
}
```

**La rotazione** funziona perché per un periodo **coesistono due chiavi**:

```text
t0   pubblica la nuova chiave nel JWKS (kid nuovo); continua a firmare con la vecchia
t1   comincia a firmare con la nuova; entrambe restano pubblicate
t2   scaduti tutti i token firmati con la vecchia, la rimuove dal JWKS
```

Il periodo fra `t0` e `t1` esiste per dare tempo ai verificatori di aggiornare la propria
cache. **Saltarlo significa invalidare in blocco tutti i token in circolazione.**

**Nel progetto.** Il progetto è **su entrambi i lati**: pubblica il proprio JWKS per chi
verifica i suoi token e i suoi webhook firmati, e consuma i JWKS degli authorization server
degli integratori e dei provider di identità. Le regole (*proposta di progetto*, derivate
dalla fase di ricerca `[R5]`):

- **allow-list degli host** ammessi come `jwks_uri`/`jku`, per tenant;
- **cache con TTL** e recupero forzato solo su `kid` sconosciuto, con **limite di frequenza
  sui recuperi**, altrimenti un `kid` casuale in un token contraffatto diventa un
  amplificatore di traffico verso un terzo;
- **mai un recupero sincrono nel percorso critico** di validazione senza timeout stretto;
- **la chiave privata non sta nel filesystem del contenitore**: sta in un gestore di segreti o
  in un modulo crittografico.

**Specifica.** RFC 7517 (JWK e JWK Set), RFC 7518 (parametri per tipo di chiave).

**Errori tipici.** Rotazione senza sovrapposizione. Cache senza scadenza, che rende la
rotazione invisibile. Nessuna cache, che rende l'authorization server un punto di guasto
sincrono per ogni richiesta. Emettere token senza `kid`, costringendo il verificatore a
provare tutte le chiavi — con l'effetto collaterale di rendere impossibile capire, in un
incidente, quale chiave ha firmato cosa.

### 4.6 Introspezione e revoca

**Introspezione (RFC 7662).** Il resource server chiede all'authorization server se un token è
valido **in questo momento**, e ne riceve i metadati.

```http
POST /realms/clinic/protocol/openid-connect/token/introspect HTTP/1.1
Content-Type: application/x-www-form-urlencoded

token=eyJhbGciOiJFUzM4NCI...&token_type_hint=access_token
```

```json
{
  "active": true,
  "scope": "https://telemedic.example/scopes/session.start",
  "client_id": "b1f2c3d4-integratore-client-id",
  "sub": "https://idp.integratore.example#prof-001",
  "aud": "telemedic-api",
  "exp": 1787654621,
  "iat": 1787654321
}
```

Il campo che conta è **`active`**: è l'unico che dà una risposta *aggiornata all'istante*,
perché tiene conto della revoca. Il costo è una chiamata di rete sincrona per ogni richiesta,
che va mitigata con una cache di durata molto breve — e ogni secondo di cache è un secondo in
cui una revoca non ha ancora effetto.

**Revoca (RFC 7009).** Il client dichiara all'authorization server che un token non va più
onorato, tipicamente al logout. Un dettaglio della specifica che sorprende: l'endpoint
risponde `200` anche per un token già inesistente, per non trasformarsi in un oracolo che
rivela quali token esistono.

**Politica del progetto.** Token **opachi** verso l'esterno con introspezione, oppure **JWT**
con durate molto brevi: sono due punti coerenti di un compromesso, e mescolarli male dà il
peggio dei due. La scelta di riferimento:

| Superficie | Formato | Validazione |
|---|---|---|
| Token dell'utente per l'API applicativa e FHIR | JWT breve (5-10 min) | Locale, firma + `aud` + `scope` + `tenant` |
| Token di sistema (integratore) | JWT breve (300 s) | Locale |
| Operazioni ad alto impatto (esportazione massiva, amministrazione del tenant, attivazione della registrazione) | JWT | **Locale più introspezione**, perché la finestra di revoca deve essere minima |

Il **refresh token** è l'oggetto a vita più lunga del sistema ed è quindi quello da revocare
per primo in un incidente. RFC 9700 §2.2.2 impone che i refresh token dei client pubblici
siano vincolati al mittente **o** ruotati a ogni uso `[R5]`; SMART prevede espressamente la
rotazione, con l'obbligo per il client di scartare il precedente `[R5]`. Il progetto adotta la
rotazione e concede `offline_access` **solo** a client confidenziali con autenticazione
asimmetrica.

**Errori tipici.** Introspezione a ogni richiesta senza cache: l'authorization server diventa
il collo di bottiglia dell'intero sistema. Cache dell'introspezione troppo lunga, che rende la
revoca decorativa. Revocare l'access token e non il refresh token, il che equivale a non aver
revocato nulla.

### 4.7 Token Exchange e la delega fra organizzazioni

**Problema.** È il problema centrale dell'architettura di integrazione del progetto. Un medico
è già autenticato nel sistema dell'integratore. Clicca «avvia teleconsulto». Deve comparire la
stanza video **senza un secondo login e senza rinvii visibili**. Ma Telemedic deve sapere chi
è il medico (per l'audit non ripudiabile, vincolo **V5**), quale tenant (**V4**), quali
permessi ha, e deve saperlo da una fonte fidata — non dal browser, che è manipolabile.

**Meccanismo.** RFC 8693 definisce un tipo di concessione OAuth che scambia un token con un
altro token. Il chiamante presenta il token del soggetto (`subject_token`), si autentica come
client, e riceve un token valido nel dominio di destinazione.

```mermaid
sequenceDiagram
    autonumber
    participant U as Browser del medico
    participant IUI as UI dell'integratore
    participant IBE as Backend dell'integratore
    participant TAS as Authorization Server di Telemedic
    participant TAPI as API di Telemedic

    U->>IUI: clic "Avvia teleconsulto"
    IUI->>IBE: POST /consulti/{id}/avvia  (sessione interna dell'integratore)
    IBE->>TAS: POST /token<br/>grant_type=…:token-exchange<br/>subject_token=«token del medico»<br/>subject_token_type=…:access_token<br/>audience=telemedic-api<br/>+ client_assertion (private_key_jwt)
    TAS->>TAS: 1. autentica il client<br/>2. risale al tenant dal client_id<br/>3. valida il subject_token contro il<br/>trust anchor DI QUEL tenant<br/>4. mappa i claim
    TAS-->>IBE: access_token con sub=medico e act={integratore}
    IBE->>TAPI: POST /v1/sessions  Authorization: Bearer …
    TAPI-->>IBE: { sessionId, embedUrl, oneTimeToken }
    IBE-->>IUI: URL di incorporamento + token a uso singolo
    IUI->>U: monta il componente incorporato
```

Il punto decisivo è che **il token del medico non raggiunge mai il browser di Telemedic e non
compare mai in un URL**: lo scambio avviene da backend a backend.

**Parametri principali** (RFC 8693 §2.1) `[R5]`:

| Parametro | Obbligatorietà | Contenuto |
|---|---|---|
| `grant_type` | REQUIRED | `urn:ietf:params:oauth:grant-type:token-exchange` |
| `subject_token` | REQUIRED | Token che rappresenta il soggetto per conto del quale si agisce |
| `subject_token_type` | REQUIRED | Identificatore del tipo (`…:token-type:access_token`, `…:jwt`, `…:saml2`, …) |
| `audience` / `resource` | OPTIONAL | Destinatario logico o URI del servizio destinatario |
| `scope` | OPTIONAL | Ambiti desiderati |
| `actor_token` / `actor_token_type` | OPTIONAL / condizionale | Token che rappresenta la parte agente |

**Delega, non impersonificazione — e perché è vincolante qui.** RFC 8693 §1.1 distingue due
esiti:

- **Impersonificazione**: si passa il solo `subject_token`; il token risultante rende il
  chiamante indistinguibile dall'utente. L'audit registra «il dott. Rossi ha fatto X», e
  **perde** l'informazione «tramite il sistema Y».
- **Delega**: il token porta entrambe le identità, con il claim **`act`** (RFC 8693 §4.1).
  L'audit può rispondere alla domanda «quale sistema ha agito per conto di quale persona».

Il progetto **usa sempre la delega, mai l'impersonificazione** — è la decisione D18, ed è una
conseguenza diretta dei vincoli di auditabilità (**V5**) e degli obblighi di tracciabilità in
contesto MDR e GDPR `[R5]`. Le catene annidate si preservano: se l'integratore agiva a sua
volta per conto di un terzo, l'`act` annidato lo registra.

**Come nasce la fiducia.** Non basta validare la firma del `subject_token`: bisogna sapere
**che quel token viene dall'emittente giusto per quel tenant**. Il modello del progetto
`[R5]`:

1. per ogni tenant si registra un **trust anchor**: issuer dell'IdP dell'integratore,
   `jwks_uri`, algoritmi ammessi, eventuale `aud` atteso;
2. il `client_id` che presenta la richiesta è legato al tenant. **Non si accetta un
   `subject_token` il cui `iss` non sia il trust anchor del tenant del client chiamante** —
   senza questo controllo, l'integratore A può presentare un token dell'IdP dell'integratore B;
3. si valida firma, `iss`, `exp`, `nbf`, `aud`, con l'algoritmo in allow-list;
4. la mappatura dei claim verso l'identità interna è **configurabile per tenant**, mai
   cablata: quale claim porta il codice fiscale, quale il ruolo, quale l'organizzazione.

**Stato dell'implementazione — informazione rilevante per la pianificazione.** Keycloak 26.2
ha reso supportato lo *Standard Token Exchange*, dichiarato conforme a RFC 8693, ma con
perimetro iniziale **interno-interno** (scambio fra client dello stesso realm); lo scambio
*esterno-interno* era indicato come lavoro successivo. Keycloak 26.5 ha introdotto **in
anteprima** il supporto al *JWT Authorization Grant* di RFC 7523 §2.1 `[R5]`. Da qui la
decisione D18: **il token exchange è implementato nel gateway di Telemedic**, non delegato a
una funzione in anteprima, con un ripiego indipendente (token d'ingresso a uso singolo,
scadenza brevissima, emesso back-channel, mai in URL), uno spike di verifica nella prima
settimana di sviluppo e una revisione esterna indipendente.

**Specifica.** RFC 8693 (2020, Standards Track). Correlata: RFC 7523, che definisce sia il
JWT come asserzione di autenticazione del client (`private_key_jwt`) sia il JWT come
concessione di autorizzazione.

**Errori tipici.** Accettare qualunque `subject_token` con firma valida senza legarlo al
tenant. Usare l'impersonificazione perché è più semplice. Propagare l'`acr` del token in
ingresso come se fosse un'autenticazione eseguita da sé (§4.9). Emettere il token risultante
senza restringerne l'audience, ottenendo un token più potente di quello di partenza —
un'escalation di privilegio confezionata come integrazione.

### 4.8 SAML 2.0, e perché in Italia resta necessario

**Problema.** Federare l'autenticazione fra organizzazioni diverse, con asserzioni firmate,
in un mondo che nel 2005 era fatto di XML e di applicazioni web server-side.

**Meccanismo.** Tre ruoli: il **Service Provider** (chi eroga il servizio), l'**Identity
Provider** (chi autentica), l'utente col suo browser. Il flusso *SP-initiated*:

1. l'utente chiede una risorsa protetta al Service Provider;
2. il SP genera una **`AuthnRequest`** XML firmata e la fa recapitare all'IdP tramite il
   browser (binding HTTP-Redirect o HTTP-POST);
3. l'IdP autentica l'utente;
4. l'IdP restituisce una **`Response`** contenente una **`Assertion`** firmata, con
   l'identità, gli attributi e il contesto di autenticazione (`AuthnContextClassRef`), sempre
   tramite il browser (binding HTTP-POST);
5. il SP valida firma, destinatario, validità temporale, `Audience`, e apre la sessione.

La fiducia si stabilisce con lo scambio dei **metadata**: documenti XML firmati che dichiarano
entityID, endpoint, certificati e attributi richiesti.

**Perché non è stato sostituito da OIDC.** Per una ragione che non è tecnica ma di fatto:

> **SPID non è utilizzabile in OpenID Connect.** Le linee guida OIDC per SPID esistono, ma
> **nessun Identity Provider lo supporta in produzione**: per SPID si adotta SAML 2.0. Per CIE
> è invece disponibile anche OIDC `[B7]`. È la decisione D37.

Ne discende che il progetto **deve** parlare SAML 2.0, non come compatibilità con il passato
ma come requisito corrente per accedere all'identità digitale nazionale. E deve parlarne la
variante italiana, che **non è SAML generico**: le regole tecniche SPID introducono deviazioni
che un'implementazione generica non soddisfa. Due esempi accertati in fase di ricerca `[B7]`:

- l'`Issuer` dell'`AuthnRequest` deve portare l'attributo **`NameQualifier`**, che il profilo
  SAML 2.0 core non prevede per il formato `entity`;
- l'attributo `AllowCreate` su `NameIDPolicy` **non va emesso**, mentre il SAML nativo di
  Keycloak lo emette per impostazione predefinita;
- l'`AuthnStatement` porta `SessionIndex` **per SpidL1** e **non** per SpidL2 e SpidL3, perché
  per i livelli 2 e 3 non è prevista alcuna sessione condivisa di autenticazione. Conseguenza
  diretta e non ovvia: **con SPID L2 non esiste SSO federato**, il Single Logout verso l'IdP è
  privo di senso pratico e la durata della sessione è interamente responsabilità del Service
  Provider `[B7]`;
- gli errori non sono errori SAML generici: l'IdP veicola l'anomalia in `StatusMessage` come
  stringa strutturata `ErrorCode nrNN`, e il Service Provider **ha l'obbligo** di tradurla nei
  messaggi prescritti da AgID. Diversi di quei codici (19, 20, 21, 22, 23, 25) **non sono
  errori applicativi**: sono esiti normali di una sessione utente, e registrarli come errori
  produce falsi allarmi `[B7]`.

**Nel progetto.** SAML 2.0 è il protocollo verso gli Identity Provider SPID, tramite un realm
broker dedicato (`citizen-idp`) che funge da unico Service Provider verso la federazione, per
non moltiplicare metadata e adesioni fra i realm `clinic` e `patient` `[B7]`. Vale la pena
ripetere il punto di sostanza fissato dalla decisione D36: **il Service Provider è chi eroga
il servizio in rete, cioè il deployer, mai il progetto**. Telemedic è «SPID/CIE/TS-CNS ready»,
verificabile in integrazione continua; non è né può essere «accreditato».

**Specifica.** *OASIS Security Assertion Markup Language (SAML) V2.0*, standard OASIS del
15 marzo 2005 (Core, Bindings, Profiles, Metadata sono documenti distinti). Il profilo
italiano è nelle *Regole tecniche SPID* di AgID, integrate dagli **avvisi**, che modificano il
testo base e vanno letti insieme a esso `[B7]`.

**Errori tipici.** Usare una libreria SAML generica assumendo che basti. Non verificare la
firma dell'`Assertion` **e** che la parte firmata sia quella che si sta leggendo: è la
famiglia di attacchi *XML Signature Wrapping*, ed è la ragione per cui il criterio di
accettazione del progetto include il superamento integrale di `spid_sp_test`, **casi XSW1-XSW8
compresi** `[B7]`. Consentire l'espansione delle entità XML esterne. Considerare gli avvisi
AgID materiale accessorio.

### 4.9 I livelli di garanzia e come si propagano

**Problema.** «L'utente è autenticato» non è un'informazione sufficiente. Autenticato **come**?
Con una password, con due fattori, con un certificato su dispositivo? La differenza determina
quali operazioni sono lecite.

**Meccanismo.** Il livello viaggia nel claim `acr` (OIDC) e nell'elemento
`AuthnContextClassRef` (SAML). Nel contesto italiano i valori sono normati e — punto non
ovvio — **sono gli stessi per SPID e per CIE** `[B7]`:

```text
https://www.spid.gov.it/SpidL1
https://www.spid.gov.it/SpidL2
https://www.spid.gov.it/SpidL3
```

Sono URI, con schema `https` e senza barra finale. La mappatura verso il modello
internazionale è dichiarata dal *Regolamento recante le modalità attuative per la
realizzazione dello SPID* `[B7]`:

| Livello | ISO/IEC 29115 | Fattori |
|---|---|---|
| SPID L1 | **LoA2** | Un fattore (password) |
| SPID L2 | **LoA3** | Due fattori, **non** necessariamente basati su certificati |
| SPID L3 | **LoA4** | Due fattori **basati su certificati digitali**, chiavi private su dispositivo conforme all'Allegato II del Regolamento (UE) 910/2014 |

**Tre trappole verificate, che cambiano il design.**

1. **Con CIE il livello non è desumibile dalla risposta.** Le regole tecniche dichiarano che
   l'`AuthnContextClassRef` di ritorno è **sempre `SpidL3`**, perché la CIE fornisce il
   massimo livello di affidabilità. Ne discende che un accesso con sola password (CIE L1) e
   uno con carta e PIN (CIE L3) producono **la stessa asserzione**. L'unica leva è la
   *richiesta*: il livello va imposto in `RequestedAuthnContext` `[B7]`. Da qui la regola:
   **si registrano sempre entrambi, `acr_requested` e `acr_asserted`**, ed è l'unico modo di
   rispettare **V5** senza affermare il falso.
2. **Il livello non viaggia nel claim `act`.** RFC 8693 §4.1 esprime la delega — *chi agisce* —
   non il livello di autenticazione del soggetto. Metterlo lì è un abuso semantico. Il livello
   sta in `acr` `[B7]`.
3. **`acr` non significa la stessa cosa nelle due direzioni.** Se il cittadino si è
   autenticato **su** Telemedic con SPID, `acr` è autoritativo. Se l'identità arriva per token
   exchange dall'IdP di un integratore, `acr` è **riferito**: Telemedic riporta ciò che il
   token asserisce, non ciò che ha verificato. Copiare l'uno nell'altro senza qualificarlo
   farebbe apparire come verificata da Telemedic un'autenticazione che Telemedic non ha
   eseguito `[B7]`.

La rappresentazione adottata (**proposta di progetto** in ogni sua parte tranne `acr` e `act`):

```json
{
  "acr": "https://www.spid.gov.it/SpidL2",
  "auth_source": {
    "kind": "national-federation",
    "channel": "spid",
    "acr_requested": "https://www.spid.gov.it/SpidL2",
    "acr_asserted": "https://www.spid.gov.it/SpidL2",
    "verified_by_telemedic": true
  }
}
```

e, per il caso dell'identità riferita da un integratore:

```json
{
  "acr": "urn:telemedic:acr:asserted-by-issuer",
  "auth_source": {
    "kind": "federated-partner",
    "iss": "https://idp.integratore.example",
    "acr_asserted": "https://www.spid.gov.it/SpidL2",
    "verified_by_telemedic": false
  }
}
```

Le regole di autorizzazione che ne discendono `[B7]`: un'operazione che la normativa lega
all'autenticazione forte ex art. 64 CAD richiede `verified_by_telemedic = true`; un'operazione
clinica interna può accettare l'identità riferita, purché il trust anchor del tenant lo
consenta e il livello riferito raggiunga la soglia configurata; **la configurazione «quali
`acr` esterni sono accettati per quale operazione» è per tenant e fa parte del contratto di
integrazione, non del codice**; ogni voce di audit registra `acr`, `auth_source` e `act` per
intero.

**Un costo di implementazione che viene sistematicamente dimenticato.** Il provider SPID per
Keycloak configura i `RequestedAuthnContext` **staticamente per identity provider**. Se il
livello deve essere dinamico — L2 per il paziente, L3 per l'amministratore — servono **due
istanze di identity provider per ciascun IdP SPID**, una per livello `[B7]`. Con una decina
di IdP nel registro, il lotto di lavoro non è marginale.

**Un vincolo economico da documentare per il deployer**, non tecnico ma decisivo nelle scelte
di prodotto: chiedere **un solo attributo oltre l'anagrafica** porta il costo per accesso da
0,4 € a 3,5 € `[B7]`. È la ragione tecnica ed economica per cui l'insieme minimo di attributi
richiesti va difeso: chiedere `address` o `idCard` per una televisita è un eccesso, ed è
anche contestabile in sede di convenzione.

---

## 5. Integrazione sanitaria

Questa sezione tratta i quattro protocolli sanitari **in quanto protocolli**: come si parla,
non che cosa si dice. Il contenuto — risorse, profili, terminologie, template — è nei moduli
[05](05-standard-di-interoperabilita.md) e [06](06-fhir-da-zero.md).

### 5.1 FHIR REST

**Problema.** Scambiare dati clinici strutturati con un'interfaccia web ordinaria, senza il
peso dei modelli documentali e dei messaggi delle generazioni precedenti.

**Meccanismo.** FHIR definisce un'API REST sopra HTTP in cui **ogni risorsa è un URI** e le
operazioni sono i metodi HTTP:

| Interazione | Richiesta |
|---|---|
| `read` | `GET [base]/Encounter/enc-4471` |
| `vread` | `GET [base]/Encounter/enc-4471/_history/3` |
| `create` | `POST [base]/Encounter` |
| `update` | `PUT [base]/Encounter/enc-4471` |
| `patch` | `PATCH [base]/Encounter/enc-4471` |
| `delete` | `DELETE [base]/Encounter/enc-4471` |
| `search` | `GET [base]/Encounter?patient=…&date=ge2026-08-01` |
| `transaction` | `POST [base]` con un `Bundle` di tipo `transaction` |
| `operation` | `POST [base]/Patient/$export` |

Ciò che rende FHIR REST un protocollo e non solo un'applicazione di HTTP:

- **Un formalismo di conformità.** `GET [base]/metadata` restituisce un `CapabilityStatement`
  che dichiara che cosa il server supporta. È il contratto (§1.4), in forma FHIR.
- **Un linguaggio di ricerca normato**, con modificatori, prefissi di confronto,
  concatenamento e inclusioni.
- **Una semantica di errore propria**, `OperationOutcome` (§3.10).
- **Concorrenza ottimistica normata** con `ETag` deboli allineati a `meta.versionId` e
  `If-Match` obbligatoria per l'aggiornamento sicuro ([06 §7.7](06-fhir-da-zero.md)).
- **Tipi di contenuto propri**: `application/fhir+json`, `application/fhir+xml`.

**Nel progetto.** È l'interfaccia clinica, **in entrambi i ruoli**: Telemedic è **server FHIR**
per gli integratori che leggono e scrivono contenuto clinico, ed è **client FHIR** verso i
sistemi degli integratori quando deve leggere `Patient` o `Appointment` che non gli sono stati
passati `[R5]`. Il modello dati segue le guide di HL7 Italia (decisione D13), con `Composition`
dentro un `Bundle` come artefatto primario del referto e `DiagnosticReport` mantenuto solo
come proiezione in sola lettura.

**Specifica.** FHIR release 4, versione **4.0.1**, sezione *RESTful API* dello standard.
Scrivere «FHIR R4» senza `4.0.1` è già un'imprecisione, come ricorda
[05 §2.4](05-standard-di-interoperabilita.md).

**Errori tipici.** Trattare la ricerca come SQL e chiedere al server operazioni che il
linguaggio di ricerca non esprime. Ignorare la paginazione dei `Bundle` e assumere che la
prima pagina sia il risultato completo. Usare `PUT` per creare con un identificativo scelto
dal client su un server che non lo consente. Ignorare il `CapabilityStatement` e scoprire in
produzione che un'interazione non è supportata.

### 5.2 FHIR Bulk Data — l'asincrono normato

**Problema.** Estrarre centinaia di migliaia di risorse. Una ricerca paginata sincrona non
regge: i timeout intermedi la uccidono, la paginazione su un dataset che cambia dà risultati
incoerenti, e la memoria del server esplode.

**Meccanismo.** Un protocollo asincrono in tre fasi, che è il caso di studio canonico del
modello `202 Accepted` + polling di §2.12:

```mermaid
sequenceDiagram
    autonumber
    participant C as Client
    participant S as Server FHIR
    participant F as Archivio dei file

    C->>S: GET Group/«id»/$export?_type=Encounter,Observation<br/>Accept: application/fhir+json<br/>Prefer: respond-async
    S-->>C: 202 Accepted<br/>Content-Location: «url di stato»
    loop finché non è pronto
        C->>S: GET «url di stato»  (Accept: application/json)
        S-->>C: 202 Accepted + Retry-After: 120 + X-Progress
    end
    C->>S: GET «url di stato»
    S-->>C: 200 OK + manifest JSON
    C->>F: GET «url di ciascun file» (ndjson)
    F-->>C: righe ndjson, una risorsa per riga
```

Gli elementi accertati in fase di ricerca `[B6]` e da recepire senza errori:

- **La versione corrente è la 3.0.0**, *trial-use*, attiva dall'11 dicembre 2025. Chi cita
  ancora STU2 è disallineato.
- L'intestazione **`Prefer: respond-async`** è obbligatoria nel kick-off; la 3.0.0 ammette il
  secondo valore `separate-export-status`.
- Parametri nuovi nella 3.0.0 rispetto a STU2: **`_until`**, **`organizeOutputBy`**,
  **`allowPartialManifests`**, oltre a `_outputFormat`, `_since`, `_type`, `_elements`,
  `patient` (solo POST), `includeAssociatedData`, `_typeFilter`.
- Il **manifest** di completamento contiene `transactionTime`, `request`,
  `requiresAccessToken`, `output`, `error`, e — nuovi nella 3.0.0 — `outputOrganizedBy` e
  `link` per la paginazione.
- **Avvertenza esplicita**: il *continuous build* della guida presenta un manifest
  strutturalmente diverso (rinomina `error` in `outcome`, aggiunge `manifestType`, `fileSize`,
  rimuove `request`). **Non è materiale su cui implementare** `[B6]`. È esattamente il genere
  di divergenza che produce implementazioni non interoperabili, ed è la ragione per cui il
  progetto pinna le versioni delle guide.

**Nel progetto.** Estrazione massiva verso ricerca, cruscotti, migrazioni, portabilità del
dato ai sensi dell'art. 20 GDPR. Con due vincoli propri: **l'esportazione massiva è
un'operazione ad alto impatto**, quindi richiede introspezione del token (§4.6), è tracciata
integralmente nell'audit e richiede uno scope dedicato; e **il formato di uscita è ndjson**
(§8.3), che è la ragione tecnica per cui quel formato entra nel progetto.

**Errori tipici.** Sondare con frequenza fissa ignorando `Retry-After`. Assumere che l'URL dei
file non richieda autenticazione: il manifest ha il campo `requiresAccessToken` proprio per
dirlo. Caricare in memoria un file ndjson da gigabyte invece di elaborarlo riga per riga —
il formato esiste per essere letto in streaming.

### 5.3 MLLP su TLS

**Problema.** HL7 versione 2 definisce il contenuto del messaggio, non il trasporto. Su una
connessione TCP i byte arrivano come flusso continuo (§2.3): serve sapere dove finisce un
messaggio e comincia il successivo.

**Meccanismo.** **MLLP** — *Minimal Lower Layer Protocol* — incornicia ogni messaggio fra un
byte di inizio e una coppia di byte di fine:

```text
0x0B   <messaggio HL7 v2>   0x1C 0x0D
```

Nient'altro. Nessuna autenticazione, nessuna cifratura, nessun controllo di integrità, nessun
riscontro a livello di trasporto — il riscontro è **applicativo**, ed è il messaggio `ACK`
descritto in [05 §4.5](05-standard-di-interoperabilita.md).

**Il punto che conta.**

> **MLLP nudo è testo in chiaro su TCP.** Chiunque sia sul percorso di rete legge nomi, codici
> fiscali, diagnosi, e può modificarli senza che nessuna delle due parti se ne accorga.

Non è un difetto dello standard: MLLP nasce per reti ospedaliere chiuse degli anni Ottanta,
dove il modello di minaccia era un altro. È un difetto **del deployment** usarlo così oggi.

**Nel progetto.** Regole vincolanti, coerenti con
[05 §4.6](05-standard-di-interoperabilita.md):

1. Ogni listener MLLP è esposto **esclusivamente** dentro un canale TLS con **autenticazione
   reciproca** (§2.5) — che è esattamente ciò che prescrive il profilo IHE di autenticazione
   di nodo.
2. Mai un listener raggiungibile da rete non fidata, nemmeno «temporaneamente per il collaudo».
3. Il certificato della controparte va **verificato**, non solo presentato.
4. L'adattatore HL7 v2 è un componente di frontiera: traduce verso il modello canonico interno
   e non lo contamina.

**Specifica.** *HL7 Transport Specification: MLLP*, standard HL7 distinto dallo standard di
messaggistica. I valori esadecimali dell'incorniciamento sono confermati da due fonti
indipendenti che citano la specifica ufficiale; il documento primario non è stato letto
direttamente in fase di ricerca. **[NV]** La porta 6660, spesso citata come convenzionale,
**non** risulta registrata per MLLP: nella pratica si concorda fra le parti.

**Errori tipici.** Cercare i byte di incorniciamento con una ricerca di sottostringa senza
gestire i messaggi frammentati su più segmenti TCP. Assumere che una connessione serva un solo
messaggio: le connessioni MLLP sono persistenti e servono flussi continui. Non implementare
un timeout sull'attesa dell'`ACK`, con il risultato che un blocco della controparte blocca
l'intera coda. Rispondere `ACK` prima di aver persistito, il che trasforma la conferma in una
bugia.

**Alternative scartate.** MLLP su HTTP: esiste come pratica, ma perde i riscontri applicativi
sincroni su cui i motori di integrazione ospedalieri sono costruiti. Il progetto lo supporta
come modalità aggiuntiva (decisione D4), non come sostituzione.

### 5.4 DICOMweb

**Problema.** Le immagini biomediche hanno un proprio standard, DICOM, nato con un protocollo
di rete su TCP (`DIMSE`) che presuppone porte aperte, associazioni negoziate e configurazioni
punto a punto. In un mondo web, e attraverso confini organizzativi, non funziona.

**Meccanismo.** **DICOMweb** è l'insieme dei servizi RESTful definiti dallo standard DICOM:

| Servizio | Che cosa fa | Metodo |
|---|---|---|
| **QIDO-RS** | *Query based on ID for DICOM Objects* — cerca studi, serie, istanze | `GET` |
| **WADO-RS** | *Web Access to DICOM Objects* — recupera le istanze | `GET` |
| **STOW-RS** | *Store Over the Web* — memorizza | `POST` |
| **UPS-RS** | Gestione dei passi di lavoro | vari |

I metadati sono disponibili in una rappresentazione JSON, e i dati binari in `multipart` con i
tipi di trasferimento DICOM.

**Nel progetto — e qui il vincolo è architetturale, non tecnico.** Telemedic **non è un
sistema di archiviazione di immagini**. Il rapporto con DICOMweb è di sola consultazione, e
vale una regola che il modulo [05 §7.3](05-standard-di-interoperabilita.md) enuncia come
divieto:

> **Le immagini diagnostiche non transitano sul canale video.** La compressione con perdita
> del video fa sì che ciò che si vede **non sia** il dato diagnostico. Condividere lo schermo
> con un'immagine radiologica sopra non è refertazione: è una conversazione su un'immagine.

Ne discende che, quando serve, l'immagine si apre da un visualizzatore che la recupera per
DICOMweb dalla sua fonte autorevole, con la propria autorizzazione e il proprio audit. Il
canale video resta un canale di comunicazione. È anche un confine rilevante per la
qualificazione MDR (vincolo **V2**).

**Specifica.** DICOM PS3.18, *Web Services*. Lo standard DICOM è pubblicato per parti e
aggiornato con cadenza frequente: si cita la parte, non «DICOM» in generale.

**Errori tipici.** Reinstradare i pixel attraverso il proprio backend senza necessità,
diventando responsabile di dati che non si è titolati a conservare. Trascurare che le immagini
DICOM contengono dati identificativi negli attributi, non solo nei pixel: un'immagine
«anonimizzata» tagliando l'intestazione visibile non è anonimizzata. Assumere che tutti i
sistemi implementino DICOMweb: molti parlano ancora solo DIMSE, e serve un ponte.

### 5.5 SMART App Launch e SMART Backend Services

**Problema.** OAuth 2.0 non basta in ambito sanitario. Mancano tre cose: il **contesto
clinico** (quale paziente, quale incontro), gli **scope granulari sulle risorse cliniche**, e
una **scoperta standardizzata** degli endpoint di autorizzazione di un server FHIR.

**Meccanismo — App Launch.** È un profilo di OAuth 2.0 Authorization Code che aggiunge:

- **il contesto di lancio**: l'applicazione riceve paziente e incontro correnti **senza
  chiederli all'utente**;
- **gli scope FHIR**, nella forma `{patient|user|system}/{Risorsa}.{permessi}` — dove i
  permessi della versione 2 sono le lettere di `cruds` (create, read, update, delete, search),
  che **devono comparire nell'ordine di quella stringa**: `.cu` e `.rs` sono validi, `.dus` no
  `[R5]`;
- **la scoperta** su `{fhirBase}/.well-known/smart-configuration`, che ha sostituito il
  vecchio meccanismo basato sul `CapabilityStatement`: la specifica dichiara espressamente che
  quel meccanismo «is now deprecated» `[R5]`.

Due modalità: **EHR launch**, in cui il sistema clinico avvia l'applicazione passandole `iss`
(l'endpoint FHIR) e `launch` (un identificativo **opaco** che l'applicazione non deve
interpretare); e **standalone launch**, in cui l'applicazione parte da sola e chiede il
contesto con gli scope `launch/patient` e `launch/encounter`.

Il parametro **`aud`** nella richiesta di autorizzazione non è cosmetico: contiene l'URL del
resource server FHIR, e la specifica lo motiva testualmente — «This parameter prevents leaking
a genuine bearer token to a counterfeit resource server» `[R5]`.

La risposta del token endpoint estende quella OAuth con il contesto. Tre campi risolvono
problemi reali del progetto senza estensioni proprietarie `[R5]`:

| Campo | A cosa serve nel progetto |
|---|---|
| `need_patient_banner` | Dice se il sistema ospitante mostra già l'intestazione con il paziente: risolve il problema della doppia intestazione nel componente incorporabile |
| `smart_style_url` | È il **meccanismo standard di white-label** per applicazioni SMART: l'ospitante pubblica colori e caratteri, l'applicazione li applica. Va trattato come input non fidato — è un URL controllato da un terzo |
| `tenant` | Mappa direttamente sul vincolo **V4** |
| `fhirContext` | È la sede naturale del riferimento all'`Appointment` che ha originato il consulto |

**Meccanismo — Backend Services.** È il pattern per **backend che chiama backend, senza
utente**: il caso del gestionale che crea una sessione di teleconsulto da un job dell'agenda.
Richiede il profilo *client-confidential-asymmetric*: il client si autentica con un **JWT
firmato con la propria chiave privata** (RFC 7523), non con un segreto condiviso `[R5]`.

```http
POST /realms/clinic/protocol/openid-connect/token HTTP/1.1
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials
&scope=system%2FEncounter.cu%20system%2FDiagnosticReport.c
&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer
&client_assertion=eyJhbGciOiJFUzM4NCIsImtpZCI6IjJmN2M5YTFlIn0...
```

Tre vantaggi rispetto al segreto condiviso, tutti rilevanti per un sistema multi-integratore
`[R5]`: il segreto non transita mai sulla rete, nemmeno una volta; il server custodisce solo
chiavi pubbliche, quindi la compromissione della sua base dati non consente di impersonare i
client; la rotazione non richiede coordinamento sincrono, basta pubblicare la nuova chiave con
un `kid` diverso (§4.5).

Vincoli sul JWT di autenticazione, dalla specifica `[R5]`: `alg`, `kid`, `typ` obbligatori
nell'header; `iss` e `sub` entrambi uguali al `client_id`; `aud` uguale all'URL del token
endpoint; `exp` **non oltre cinque minuti nel futuro**; `jti` come nonce anti-replay. Gli
algoritmi `RS384` ed `ES384` sono obbligatori. Sulla registrazione della chiave la specifica
ha una preferenza netta: **URL al JWK Set** («strongly preferred») contro JWK Set consegnato
alla registrazione («strongly discouraged»).

**Nel progetto.** Il progetto ha **due ruoli SMART distinti**, e la documentazione deve
tenerli separati per non generare confusione `[R5]`:

- **come client SMART**, legge `Patient`, `Appointment`, `Practitioner` dal server FHIR
  dell'integratore, con App Launch o Backend Services *verso* di lui;
- **come server SMART** (authorization server e resource server), espone la propria API FHIR e
  accetta applicazioni di terze parti.

Entrambi sono in perimetro per la v1.0 e vanno stimati separatamente.

Un dettaglio di integrazione che genera segnalazioni ricorrenti: **lo `scope` restituito può
essere più ristretto di quello richiesto**. Il client deve leggerlo, non assumerlo `[R5]`.

E un vincolo di igiene semantica: le capacità applicative che **non** corrispondono a risorse
FHIR — avviare una sessione video, ruotare una chiave TURN, gestire il consenso alla
registrazione — **non vanno mascherate da scope FHIR**. Forzare «avvia una sessione» dentro
`patient/Encounter.cu` è un abuso semantico e rende impossibile revocare l'una senza l'altra.
Vanno espresse come scope in forma di URI `[R5]`.

**Specifica.** *SMART App Launch*, HL7, versione 2.x; *SMART Backend Services* e
*Client Confidential Asymmetric* sono pagine della stessa guida. *SMART Web Messaging* è una
guida **separata e a maturità inferiore** (versione 1.0.0, STU1, 2022-05-06) e va documentata
come sperimentale `[B6]`.

**Quando NON usare SMART** `[R5]`:

| Situazione | Perché no | Alternativa |
|---|---|---|
| L'integratore non ha un server FHIR né intende averlo | SMART presuppone un resource server FHIR come `aud`; senza, si riduce a OAuth con nomi strani | OAuth + API applicativa REST (§3) |
| Serve solo propagare l'identità, senza contesto clinico | Il contesto di lancio è il valore aggiunto: se non serve, si paga complessità a vuoto | Token Exchange (§4.7) |
| Comunicazione fra sistemi senza alcuna semantica FHIR | Gli scope `system/{Risorsa}` non modellano capacità non-FHIR | `client_credentials` con `private_key_jwt` e scope URI |
| Sistema che parla solo HL7 v2 su MLLP | Nessun HTTP, nessun OAuth | §5.3, adattatore v2 con mTLS |

---

## 6. Eventi e messaggistica

### 6.1 Il protocollo del broker adottato

**Problema.** Disaccoppiare chi produce un fatto da chi lo consuma. Il produttore non deve
sapere quanti consumatori esistono, se sono attivi, né a che ritmo elaborano. Il consumatore
deve poter essere spento per un'ora e ritrovare tutto al riavvio.

**Meccanismo.** Il progetto adotta **Apache Kafka** (decisione D15). Il suo protocollo è
**binario su TCP**, con richieste e risposte tipizzate e versionate, e non è una RFC: è
documentato dal progetto stesso. Le proprietà che contano per il design:

- **Registro persistente ordinato per partizione.** Non una coda che si svuota: un registro
  append-only. Il consumatore mantiene un **offset**, e può rileggere dall'inizio.
- **Ordine garantito solo dentro la partizione.** È il punto più frainteso. L'ordine globale
  fra partizioni **non esiste**. La chiave del messaggio determina la partizione: mettere
  l'identificativo di sessione come chiave garantisce l'ordine **degli eventi di quella
  sessione**, che è l'unico ordine di cui il dominio ha davvero bisogno.
- **Consumer group.** Le partizioni sono distribuite fra i consumatori di un gruppo; il
  parallelismo massimo è il numero di partizioni.
- **Ritenzione temporale o dimensionale**, indipendente dal consumo. Da qui una conseguenza
  che va detta esplicitamente: **il broker non è un archivio di dati clinici**. La ritenzione
  degli eventi è configurata per l'operatività, e la conservazione a norma sta altrove.

**L'outbox transazionale — la parte che non è del broker ma è indispensabile.** La decisione
D15 prescrive un **outbox transazionale su PostgreSQL** davanti a Kafka:

```mermaid
flowchart LR
    A["Transazione applicativa<br/>(PostgreSQL)"] -->|"stessa transazione"| B["tabella outbox"]
    A --> C["tabelle di dominio"]
    B -->|"relay"| D["Apache Kafka"]
    D --> E["consumatori interni"]
    D --> F["dispatcher webhook"]
```

La ragione è un problema classico e insidioso: se si scrive nella base dati **e poi** si
pubblica sul broker, si hanno due operazioni non atomiche. Un guasto nel mezzo produce o un
**evento perso** (dato scritto, evento mai pubblicato) o un **evento fantasma** (evento
pubblicato per una transazione poi annullata). Scrivendo l'evento nella *stessa transazione*
del dato, e pubblicandolo con un processo di relay che legge la tabella, il problema
scompare: o entrambe le scritture avvengono, o nessuna.

Il relay pubblica **almeno una volta**: un evento può essere pubblicato due volte se il relay
cade fra la pubblicazione e la marcatura. È accettato per costruzione, e la deduplicazione è
del consumatore (§6.4).

**Nel progetto.** Tutti gli eventi di dominio: sessione creata, iniziata, conclusa, annullata;
referto firmato; consenso acquisito o revocato; soglia di telemonitoraggio superata; documento
pubblicato. L'astrazione di pubblicazione **resta dietro un'interfaccia di progetto**, per non
incastrare il codice di dominio nel broker (D15). Per l'installazione presso il cliente si
adotta la **modalità a nodo singolo KRaft**, per contenere il peso operativo.

**Specifica.** *Apache Kafka protocol guide*, documentazione del progetto. Non è uno standard
di un ente di normazione: è la specifica di un'implementazione, ed è corretto dirlo. La
qualificazione come SOUP ai sensi di IEC 62304 ne discende (decisione D12).

**Errori tipici.** Aspettarsi ordine globale. Usare una chiave a cardinalità bassa, creando
una partizione sovraccarica. Confondere il broker con una base dati e interrogarlo per stato
corrente. Mettere **dati clinici nel payload** senza considerare che il broker li conserva per
tutta la ritenzione, in chiaro, su nodi che potrebbero non avere lo stesso regime di
protezione della base dati — motivo per cui il progetto preferisce payload **con riferimenti**
e non con contenuto clinico completo (§6.4).

**Alternative scartate.**

| Alternativa | Perché scartata |
|---|---|
| **Coda AMQP o MQTT** | Semantica di coda (il messaggio si consuma) invece che di registro: si perde la rilettura, che serve per riconciliazione e per ricostruire proiezioni |
| **Chiamate HTTP dirette fra servizi** | Accoppiamento temporale: se il destinatario è spento, l'evento è perso. È esattamente ciò che si vuole evitare |
| **Tabella di code sulla base dati** | Funziona su piccola scala, ma il polling ad alta frequenza degrada la base dati, che è già il componente più prezioso |

### 6.2 CloudEvents

**Problema.** Ogni sistema inventa la propria busta per gli eventi. Un consumatore che ne
integra tre scrive tre parser e non può costruire strumenti generici — instradamento, tracce,
archiviazione — che funzionino su tutti.

**Meccanismo.** CloudEvents definisce un insieme minimo di **attributi di contesto** comuni a
qualunque evento, e i **binding** che li mappano su protocolli concreti.

Attributi obbligatori: `id`, `source`, `specversion`, `type`. Opzionali di uso comune:
`subject`, `time`, `datacontenttype`, `dataschema`. Il contenuto specifico sta in `data`.

```json
{
  "specversion": "1.0",
  "type": "it.telemedic.session.completed.v1",
  "source": "/tenants/asl-nord-01/sessions",
  "subject": "ses-9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d",
  "id": "8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f",
  "time": "2026-08-25T09:47:12.004Z",
  "datacontenttype": "application/json",
  "dataschema": "https://docs.telemedic.esempio.it/schemas/session-completed-v1.json",
  "data": {
    "tenant": "asl-nord-01",
    "sessionId": "ses-9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d",
    "encounterRef": "Encounter/enc-4471",
    "outcome": "completed",
    "durationSeconds": 1284,
    "recorded": false
  }
}
```

**I due modi di trasportarlo su HTTP.** Il binding HTTP definisce due modalità:

- **structured**: l'intero evento, busta compresa, è nel corpo, con
  `Content-Type: application/cloudevents+json`;
- **binary**: gli attributi di contesto vanno nelle intestazioni HTTP con prefisso `ce-`, e il
  corpo contiene solo `data`.

La regola di formazione è testuale nella specifica: *«all CloudEvents context attributes,
including extensions, MUST be mapped to HTTP headers with the same name as the attribute name
but prefixed with `ce-`»* `[B6]`.

**Con una trappola verificata che va codificata nei test.** L'attributo `datacontenttype`
**non** ha un header `ce-`: il suo valore corrisponde a `Content-Type`, e la specifica è
esplicita — *«Note that a `ce-datacontenttype` HTTP header MUST NOT also be present in the
message»* `[B6]`. Emettere `ce-datacontenttype` è una violazione di un `MUST NOT`.

```http
POST /webhooks/telemedic HTTP/1.1
Host: gestionale.integratore.example
ce-specversion: 1.0
ce-type: it.telemedic.session.completed.v1
ce-source: /tenants/asl-nord-01/sessions
ce-subject: ses-9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d
ce-id: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f
ce-time: 2026-08-25T09:47:12.004Z
Content-Type: application/json
Idempotency-Key: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f

{"tenant":"asl-nord-01","sessionId":"ses-9f1c2b3d…","outcome":"completed"}
```

**Nel progetto.** CloudEvents è la busta di **ogni** evento pubblicato, sia sul broker interno
sia verso l'esterno nei webhook. Convenzioni di progetto:

- **`type` gerarchico e versionato**: `it.telemedic.<dominio>.<fatto>.v<N>`. La versione fa
  parte del tipo, così che un consumatore possa ignorare una versione che non conosce invece
  di fallire su un campo inatteso.
- **`source` contiene il tenant**, coerentemente con **V4**.
- **`subject` è l'entità a cui l'evento si riferisce**, il che consente il filtraggio senza
  deserializzare `data`.
- **`dataschema` punta a uno schema pubblicato e versionato**: è il terzo contratto di §1.4.
- **`id` è l'identificativo di deduplicazione**, riusato come `Idempotency-Key` nel webhook.

**Specifica.** *CloudEvents* v1.0, specifica CNCF; il binding HTTP è nella versione **1.0.2**
`[B6]`. Non è una RFC.

**Errori tipici.** Mettere dato clinico in `data` senza valutare dove finisce l'evento
(§6.4). Cambiare la forma di `data` senza cambiare la versione nel `type`, rompendo tutti i
consumatori in silenzio. Usare `time` come identificativo o come chiave di ordinamento fra
sorgenti diverse — sono orologi diversi, §8.1.

### 6.3 Webhook e firma dei messaggi HTTP

**Problema.** Notificare un sistema esterno che qualcosa è accaduto, senza che quel sistema
debba sondare. E, dal lato di chi riceve, essere certi che la notifica venga davvero da
Telemedic e non da chiunque conosca l'URL.

**Meccanismo.** Un **webhook** è una richiesta HTTP che il produttore invia a un URL fornito
dal consumatore. È il modello inverso rispetto all'API: qui il produttore è il client.

Il problema di sicurezza è strutturale: **un URL di webhook è pubblico e chiunque può
chiamarlo**. La riservatezza del contenuto è garantita da TLS, ma l'**autenticità del
mittente** no: TLS autentica il server verso il client, non il contrario. Servono tre
contromisure, tutte e tre:

1. **Firma del messaggio**, perché il ricevente possa verificare origine e integrità.
2. **Marca temporale dentro la firma**, con una finestra di accettazione stretta, contro il
   replay.
3. **Identificativo di evento univoco** che consenta la deduplicazione.

**Il metodo di firma, e il suo stato di specifica.** Il metodo normato è **HTTP Message
Signatures**, che definisce come firmare un insieme scelto di componenti di una richiesta —
metodo, percorso, autorità, intestazioni selezionate, un'impronta del corpo — con parametri
espliciti (identificativo di chiave, algoritmo, istante di creazione, scadenza, nonce). È
**RFC 9421, *HTTP Message Signatures*, Standards Track, febbraio 2024** — verificato sul
registro RFC durante la stesura di questo modulo. È l'unico approccio normato, e sostituisce
le firme proprietarie che ogni piattaforma ha inventato per conto proprio.

Un punto che genera confusione: **RFC 9421 non definisce l'impronta del corpo**. Il testo
dichiara espressamente di non coprire direttamente il contenuto del messaggio e di appoggiarsi
a una specifica separata: `Content-Digest` è definito da **RFC 9530**, documento compagno. Chi
firma un corpo deve quindi implementare entrambe.

```http
POST /webhooks/telemedic HTTP/1.1
Host: gestionale.integratore.example
Content-Type: application/json
Content-Digest: sha-256=:X48E9qOokqqrvdts8nOJRJN3OWDUoyWxBf7kbu9DBPE=:
Signature-Input: sig1=("@method" "@target-uri" "content-digest" "ce-id" "ce-type");\
  created=1787654321;keyid="tm-2026-08";alg="ecdsa-p384-sha384";expires=1787654621
Signature: sig1=:MEUCIQDf1sK9x0Rz…:
```

Il ricevente ricostruisce la stringa canonica dai componenti elencati in `Signature-Input`,
recupera la chiave pubblica dal JWKS di Telemedic tramite `keyid`, verifica la firma e
controlla che `created` sia dentro la finestra accettata.

**Nel progetto.** I webhook sono la modalità (a) della decisione D4. La configurazione è **per
integratore**: URL, chiave, filtri sui tipi di evento, politica di ritentativo, limiti di
traffico. Regole del progetto:

- **firma sempre**, con chiave asimmetrica e `keyid` risolvibile dal JWKS pubblico, così che
  la rotazione (§4.5) non richieda coordinamento con ciascun integratore;
- **finestra temporale accettata di cinque minuti** (*proposta di progetto*);
- **payload magro**: identificativi e riferimenti, non contenuto clinico. Chi riceve rilegge
  dall'API con la propria autorizzazione. Questo riduce l'esposizione, rende la notifica
  indipendente dall'evoluzione del modello dati e — punto non secondario — impedisce che un
  URL di webhook mal configurato diventi una fuga di dati sanitari;
- **il ricevente deve rispondere `2xx` rapidamente** e fare il lavoro in modo asincrono: la
  risposta significa «preso in carico», non «elaborato».

**L'alternativa standard nel mondo FHIR.** Per le notifiche su risorse cliniche esiste la
risorsa `Subscription`, e per FHIR R4 la guida *Subscriptions R5 Backport* (versione 1.1.0,
STU, 11 gennaio 2023) `[B6]`. Due dettagli che la fase di ricerca ha corretto e che vanno
recepiti: **non esiste alcuna estensione `backport-topic`** — in R4 il canonical del
`SubscriptionTopic` si scrive **direttamente in `Subscription.criteria`**; e in R4 **non
esiste la risorsa `SubscriptionStatus`**: lo stato viaggia come `Parameters` conforme a un
profilo, con i nomi dei parametri in kebab-case (`event-number`, non `eventNumber`) `[B6]`.
Il progetto offre entrambi i canali: `Subscription` per gli integratori FHIR-nativi, webhook
CloudEvents per tutti gli altri.

**Errori tipici.**

- **Firmare con HMAC e un segreto condiviso.** Funziona, è diffuso, e ha due difetti: il
  ricevente possiede il segreto e può quindi **fabbricare** notifiche indistinguibili dalle
  vere, il che distrugge il non ripudio; e la rotazione richiede coordinamento con ogni
  integratore.
- **Firmare solo il corpo.** Senza metodo e URI nella firma, la stessa notifica firmata può
  essere replicata verso un altro endpoint.
- **Confrontare le firme con un confronto di stringhe non a tempo costante.**
- **Non validare l'URL di destinazione fornito dall'integratore.** Un URL che punta a
  `127.0.0.1`, a `169.254.169.254` o a un indirizzo di rete interna trasforma il dispatcher di
  webhook in un motore di *server-side request forgery* verso la propria infrastruttura.
  Servono allow-list, risoluzione DNS controllata e divieto di rinvii.
- **Consegnare in modo sincrono dentro la transazione di dominio.** Un integratore lento
  diventa il collo di bottiglia del sistema clinico.

### 6.4 Consegna, ritentativi, ordine

Tre proprietà che vanno decise esplicitamente, perché il valore predefinito è sempre il
peggiore.

**Consegna.** Il progetto garantisce **almeno una volta**. È l'unica garanzia onesta su un
canale inaffidabile fra due parti indipendenti (§1.6). «Esattamente una volta» si ottiene
**solo** come effetto congiunto di almeno-una-volta più deduplicazione lato ricevente, e va
descritto così nel contratto di integrazione: è un impegno che coinvolge anche l'altra parte.

Da qui una richiesta esplicita all'integratore: **deduplicare su `ce-id`**, che il progetto
riusa come `Idempotency-Key` (§3.7). Un ricevente che non deduplica elaborerà due volte lo
stesso evento, e in un contesto clinico questo significa, per esempio, due referti pubblicati.

**Ritentativi.** La politica del progetto (*proposta di progetto*):

| Aspetto | Scelta |
|---|---|
| Quando si ritenta | `5xx`, `429`, timeout, errore di connessione |
| Quando **non** si ritenta | `4xx` diversi da `429`: la richiesta è sbagliata, ritentarla è inutile |
| Attesa | Esponenziale con componente casuale (*jitter*), da 1 s a 6 h |
| Tentativi | Fino a 24 ore complessive |
| `Retry-After` | **Rispettata quando presente**, e prevale sull'attesa calcolata |
| Dopo l'esaurimento | L'evento va in coda di scarto (*dead letter*), l'integratore è notificato per un canale fuori banda, l'evento resta **recuperabile via API** |

La componente casuale non è un dettaglio: senza, mille dispatcher che ritentano dopo un guasto
convergono sullo stesso istante e producono un'ondata sincronizzata che impedisce al
destinatario di riprendersi. È il fenomeno noto come *thundering herd*.

L'ultima riga della tabella è il punto che rende il sistema recuperabile senza intervento
umano: **una notifica persa non deve significare un dato perso**. Il consumatore deve poter
chiedere «dammi tutti gli eventi dopo l'identificativo X», e questo è un endpoint di API, non
un'operazione di assistenza.

**Ordine.** Il progetto garantisce l'ordine **per soggetto**, non globalmente:

- sul broker, l'ordine è garantito dentro la partizione, e la chiave è l'identificativo di
  sessione (§6.1);
- sui webhook, **l'ordine non è garantito affatto**, e va detto senza attenuazioni: con
  ritentativi e consegne parallele, l'evento «sessione conclusa» può arrivare prima di
  «sessione iniziata».

Ne discende una regola di progettazione degli eventi che vale più di qualunque meccanismo di
riordino: **ogni evento porta il proprio numero di sequenza per soggetto e uno stato
autosufficiente**, così che il consumatore possa scartare ciò che è più vecchio di quanto già
elaborato. Progettare eventi che richiedono l'ordine per essere interpretati significa
costruire un sistema che sarà scorretto in ogni condizione di guasto.

---

## 7. Tempo reale — scheda sintetica

> **Questa è una scheda di orientamento, non la trattazione.** Il tempo reale ha un modulo
> dedicato: [08 — WebRTC da zero](08-webrtc-da-zero.md), che copre il NAT e i suoi tipi, la
> segnalazione e il modello offerta/risposta, la raccolta e l'accoppiamento dei candidati, la
> stretta di mano DTLS e ciò che l'impronta del certificato garantisce davvero, la Short
> Authentication String, i codec, il controllo della congestione e la misura della qualità.
> Qui si dice **solo** quale protocollo risolve quale problema, per collocarli nel quadro
> generale.

### 7.1 La pila del media, in un colpo d'occhio

```text
┌───────────────────────────────────────────────────────────┐
│  Audio e video codificati (Opus, VP8/VP9/H.264/AV1)        │
├───────────────────────────────────────────────────────────┤
│  RTP  (trasporto del media)  +  RTCP  (controllo e qualità)│
├───────────────────────────────────────────────────────────┤
│  SRTP  (cifratura e autenticazione del media)              │
│  chiavi derivate dalla stretta di mano DTLS (DTLS-SRTP)    │
├───────────────────────────────────────────────────────────┤
│  ICE  (scelta del percorso)  —  STUN  —  TURN se serve     │
├───────────────────────────────────────────────────────────┤
│  UDP  (o TCP/TLS solo come ripiego attraverso TURN)        │
├───────────────────────────────────────────────────────────┤
│  IP                                                        │
└───────────────────────────────────────────────────────────┘

canale dati:  SCTP  sopra  DTLS  sopra  ICE/UDP
```

### 7.2 Il catalogo

| Protocollo | Problema che risolve | Specifica | Nel progetto |
|---|---|---|---|
| **ICE** (*Interactive Connectivity Establishment*) | Due dispositivi dietro NAT non sanno quale percorso funzioni fra loro. ICE non sceglie: **prova tutte le combinazioni** di candidati e tiene quella che funziona, con un ordine di priorità | RFC 8445 | Ogni sessione. Il riavvio di ICE è il meccanismo di ripresa quando la rete cambia |
| **STUN** (*Session Traversal Utilities for NAT*) | Un dispositivo dietro NAT non conosce il proprio indirizzo pubblico. Lo chiede a un server esterno, che gli risponde «ti vedo come questo indirizzo e questa porta» | RFC 8489 | Server `coturn` proprio, nei profili di installazione previsti (vincolo **V1**) |
| **TURN** (*Traversal Using Relays around NAT*) | Quando nessun percorso diretto funziona — NAT simmetrici da entrambi i lati, firewall restrittivo — serve un **relay** che inoltri il traffico | RFC 8656 | Stesso server. È il caso in cui la parola «peer-to-peer» smette di descrivere il percorso: vedi la riformulazione della decisione D19 |
| **DTLS** (*Datagram TLS*) | TLS presuppone un trasporto affidabile e ordinato. Su UDP non c'è: DTLS riporta la stretta di mano e la cifratura sopra i datagrammi | RFC 6347 (1.2); RFC 9147 (1.3) | Negoziazione delle chiavi del media e trasporto del canale dati |
| **DTLS-SRTP** | Legare la stretta di mano DTLS alla derivazione delle chiavi SRTP, così che il media sia cifrato con chiavi negoziate direttamente fra i due estremi | RFC 5764 | È ciò che consente l'affermazione «cifrato end-to-end», **condizionata alla verifica indipendente delle chiavi** (D19, D22) |
| **SRTP** (*Secure RTP*) | Cifrare e autenticare i pacchetti RTP con basso costo computazionale e senza aggiungere ritardo | RFC 3711 | Media di ogni sessione |
| **RTP / RTCP** | RTP trasporta i campioni con marca temporale e numero di sequenza; RTCP riporta perdita, jitter e tempo di andata e ritorno | RFC 3550 | RTCP è la fonte delle metriche di qualità della sessione |
| **SCTP** e **canale dati WebRTC** | Un canale di messaggi affidabile o parzialmente affidabile, ordinato o non ordinato, dentro la stessa connessione del media | RFC 9260 (SCTP); RFC 8261 (SCTP su DTLS); RFC 8831 (canali dati); RFC 8832 (protocollo di apertura) | Canale dei sottotitoli — definito e versionato nel protocollo anche prima che esista un motore di trascrizione (decisione D24) — e scambi accessori a bassa latenza |
| **SDP** (*Session Description Protocol*) | Descrivere in modo testuale le capacità di una sessione: codec, indirizzi, chiavi, impronte. **Non è un protocollo di trasporto**: è un formato trasportato dalla segnalazione | RFC 8866; l'uso in WebRTC è definito da RFC 8829 (JSEP) | Corpo dei messaggi di segnalazione, che viaggiano sulla WebSocket di §2.10 |

### 7.3 Le tre cose da ricordare qui

1. **La segnalazione non è WebRTC.** WebRTC non specifica come i due estremi si scambino
   offerta, risposta e candidati: è deliberatamente lasciato all'applicazione. Nel progetto è
   la WebSocket di §2.10. Ne discende che **la sicurezza della segnalazione è responsabilità
   del progetto**, non dello standard, ed è il punto in cui un intermediario potrebbe
   sostituire le impronte dei certificati — la ragione per cui la Short Authentication String
   è obbligatoria per impostazione predefinita (decisione D22).
2. **Il ripiego su relay non è un dettaglio operativo.** Cambia il percorso, il costo e la
   latenza, e cambia ciò che si può affermare pubblicamente sul percorso dei dati.
3. **La registrazione lato server termina la cifratura sul server.** È la conseguenza
   inderogabile della decisione D23, e non è un difetto da nascondere: è una proprietà da
   dichiarare nell'informativa di consenso e da segnalare in modo persistente e non
   occultabile nell'interfaccia.

---

## 8. Protocolli e formati trasversali

### 8.1 NTP e la sincronizzazione degli orologi

**Problema.** Gli orologi delle macchine derivano. Un oscillatore ordinario perde o guadagna
secondi al giorno. In un sistema distribuito questo produce tre categorie di guasto, tutte
subdole perché non generano errori:

1. **Sicurezza.** Un token con `exp` valutato contro un orologio in ritardo resta accettato
   dopo la scadenza. Una firma di webhook con finestra di cinque minuti (§6.3) viene rifiutata
   sistematicamente se i due orologi divergono di sei.
2. **Ordine degli eventi.** Ricostruire l'ordine di due eventi provenienti da macchine diverse
   confrontando le loro marche temporali è **scorretto**, e il modulo
   [11 — Fondamenti informatici](11-fondamenti-informatici.md) spiega perché in termini
   generali. Per questo il progetto usa numeri di sequenza per soggetto (§6.4).
3. **Prova legale.** L'audit non ripudiabile (**V5**, decisione D42) ha valore solo se le sue
   marche temporali sono attendibili e la loro attendibilità è dimostrabile.

**Meccanismo.** **NTP** stima insieme lo scarto dell'orologio locale e il ritardo di rete,
scambiando quattro marche temporali per ogni interrogazione, e **corregge gradualmente**
(*slewing*) invece di saltare, perché un salto all'indietro fa apparire eventi futuri nel
passato e rompe qualunque logica basata sulla monotonia.

Il problema di sicurezza di NTP è che il protocollo classico non è autenticato: chi controlla
la rete può spostare l'orologio di un sistema — e con esso la validità dei token. La risposta
è **NTS** (*Network Time Security*), che autentica la sorgente.

**Nel progetto.** Regole (*proposta di progetto*):

- **ogni nodo è sincronizzato**, con la sincronizzazione **monitorata**: un nodo il cui scarto
  supera una soglia genera un allarme, perché è già un rischio di sicurezza;
- **ogni istante in ogni messaggio e in ogni riga di audit è in UTC**, in forma RFC 3339, con
  almeno i millisecondi. Nessuna ora locale nei dati; l'ora locale è una scelta di
  presentazione;
- **la durata si misura con un orologio monotono**, mai per differenza di due orologi di
  parete: un aggiustamento NTP nel mezzo produrrebbe durate negative;
- per l'audit conservato a lungo termine, la marca temporale interna **non è una marca
  temporale qualificata**: se serve opponibilità a terzi, occorre un servizio di validazione
  temporale, ed è una decisione da prendere esplicitamente `[NV]`.

**Specifica.** NTP versione 4: **RFC 5905**. NTS: **RFC 8915**. Per sincronizzazioni molto più
strette esiste PTP (IEEE 1588), che il progetto non usa: non serve, e richiede supporto
hardware nella rete.

**Errori tipici.** Usare `System.currentTimeMillis()` — o l'equivalente in qualunque
linguaggio — per misurare una durata. Confrontare istanti provenienti da macchine diverse per
dedurne l'ordine. Salvare istanti senza fuso e ricostruirlo per convenzione. Consentire il
salto all'indietro dell'orologio su un nodo che scrive audit.

### 8.2 DNS, quel tanto che serve

**Problema.** Le persone e i file di configurazione usano nomi; la rete usa indirizzi. Serve
una mappa distribuita, che regga miliardi di voci e cambi in continuazione.

**Meccanismo.** Uno spazio di nomi gerarchico, risolto per delega successiva. I tipi di record
che si incontrano nel progetto:

| Record | Contenuto |
|---|---|
| `A` / `AAAA` | Indirizzo IPv4 / IPv6 |
| `CNAME` | Alias verso un altro nome |
| `SRV` | Servizio, protocollo, porta, priorità e peso: usato dai client che sanno cercarlo |
| `TXT` | Testo arbitrario, tipicamente per verifiche di proprietà del dominio |
| `CAA` | Quali autorità di certificazione possono emettere certificati per il dominio |
| `HTTPS` / `SVCB` | Parametri di servizio (fra cui l'ALPN) recuperabili **prima** della connessione |

Due proprietà con conseguenze operative dirette:

- **La cache è governata dal TTL**, e il TTL è rispettato con creatività da risolutori,
  sistemi operativi e runtime. Un cambio di indirizzo non è istantaneo, e **abbassare il TTL
  va fatto prima del cambio**, non durante.
- **Il DNS classico è in chiaro e non autenticato.** Chi controlla la risoluzione controlla la
  destinazione. Le contromisure sono DNSSEC (firma dei record, RFC 4033-4035) e il trasporto
  cifrato: DoT (RFC 7858) e DoH (RFC 8484).

**Nel progetto.** Tre punti in cui il DNS non è infrastruttura invisibile ma decisione di
progetto:

1. **Risoluzione degli URL forniti dagli integratori** — webhook, `jwks_uri`, `jku`. È il
   vettore di *server-side request forgery* già citato in §4.4 e §6.3: la risoluzione va
   controllata, gli indirizzi privati e di collegamento locale vanno rifiutati, e il controllo
   va fatto **sull'indirizzo effettivamente usato per la connessione**, non su una risoluzione
   precedente — altrimenti resta aperta la finestra fra il controllo e l'uso.
2. **Record `CAA`** sui domini del progetto, per limitare chi può emettere certificati.
3. **Scoperta dei server TURN**, dove nomi e priorità hanno effetto diretto sulla qualità.

**Specifica.** RFC 1034 e RFC 1035 (base); RFC 4033-4035 (DNSSEC); RFC 7858 (DoT); RFC 8484
(DoH); RFC 9460 (`SVCB` e `HTTPS`).

**Errori tipici.** Memorizzare in cache la risoluzione per sempre dentro il processo, e non
accorgersi di un cambio di indirizzo. Nell'opposto, risolvere a ogni richiesta e rendere il
DNS un punto di guasto sincrono. Verificare un URL e poi risolverlo di nuovo al momento della
connessione, aprendo la finestra di *rebinding*.

### 8.3 I formati, e quando ciascuno ha senso

#### JSON

**Problema.** Uno scambio strutturato leggibile, con un modello di dati minimo, mappabile su
qualunque linguaggio.

**Meccanismo.** Sei tipi: oggetto, array, stringa, numero, booleano, `null`. Nient'altro. Non
ci sono date, non ci sono numeri decimali esatti, non ci sono commenti, non ci sono dati
binari.

**Nel progetto.** È il formato primario di tutto: API applicativa, FHIR JSON, CloudEvents,
JWT, configurazione. Con quattro regole di progetto, tutte conseguenza delle assenze appena
elencate:

1. **Le date sono stringhe RFC 3339 in UTC.** JSON non ha un tipo data; ogni sistema che ne
   inventa uno rompe l'interoperabilità.
2. **Gli identificativi sono stringhe**, anche quando sembrano numeri (§1.5).
3. **Gli importi e le misure decimali non sono numeri in virgola mobile.** In FHIR il tipo
   `decimal` va preservato nella sua rappresentazione, perché la precisione dichiarata è
   informazione clinica: `36.5` e `36.50` non dicono la stessa cosa su come è stata fatta la
   misura.
4. **I binari sono base64**, con l'aumento di dimensione di circa un terzo che comporta; se il
   binario è grande, non va nel JSON ma dietro un riferimento.

**Specifica.** RFC 8259 (che è insieme Standards Track e Internet Standard) ed ECMA-404, che
descrivono la stessa sintassi da due prospettive. Gli schemi: **JSON Schema**, dialetto
`2020-12`, usato da OpenAPI 3.1 (§3.2). Le modifiche parziali: `application/json-patch+json`
(RFC 6902) e `application/merge-patch+json` (RFC 7386).

#### XML

**Problema.** Documenti con struttura mista, spazi dei nomi, validazione per schema e —
soprattutto — **firma di una parte del documento**.

**Meccanismo.** Alberi di elementi con attributi, spazi dei nomi, e un ecosistema di standard
correlati: XSD per la validazione, XPath e XSLT per la navigazione e la trasformazione,
XML Signature per la firma, XML Encryption per la cifratura.

**Nel progetto.** Non è una scelta ma un vincolo esterno, in tre punti:

- **SAML 2.0** (§4.8): asserzioni e metadata sono XML firmato;
- **CDA release 2**, dove i documenti clinici italiani hanno una tradizione consolidata
  ([05 §5](05-standard-di-interoperabilita.md));
- **FHIR XML**, dove un integratore lo richieda.

XML fa una cosa che JSON non fa: consente di **firmare una porzione** di un documento e di
verificare che quella porzione sia quella che si sta leggendo. È la ragione per cui SAML è
XML, ed è anche la ragione per cui esiste la famiglia di attacchi *XML Signature Wrapping*
(§4.8): la firma è valida, ma copre un frammento diverso da quello che l'applicazione
processa.

**Errori tipici, che sono quasi tutti di sicurezza.** Non disabilitare la risoluzione delle
entità esterne (*XXE*), che consente lettura di file e richieste dalla macchina che elabora.
Non limitare l'espansione delle entità, che consente un esaurimento di memoria con pochi
kilobyte. Non canonicalizzare correttamente prima di firmare o verificare.

#### ndjson

**Problema.** Trasferire milioni di record senza costruire un unico documento gigantesco che
va letto per intero prima di poter essere elaborato.

**Meccanismo.** Un documento JSON completo per riga, separato da avanzamento riga. Il file nel
suo insieme **non** è un documento JSON valido, ed è precisamente questo il punto: si legge
riga per riga, si elabora e si scarta, con memoria costante indipendentemente dalla dimensione
del file. E una riga corrotta non invalida il resto.

**Nel progetto.** È il formato di uscita di FHIR Bulk Data (§5.2), con il tipo
`application/fhir+ndjson`, e il formato delle esportazioni massive verso strumenti analitici.

**Specifica.** Non è una RFC. È una convenzione documentata su `ndjson.org` e nota anche come
*JSON Lines*. Il tipo di contenuto FHIR è invece definito dallo standard FHIR.

**Errori tipici.** Caricarlo in memoria per intero, annullando la sola ragione della sua
esistenza. Aspettarsi che sia un array JSON. Non gestire il caso della riga finale senza
avanzamento riga.

#### Protocol Buffers

**Problema.** Quando volume e latenza contano, la serializzazione testuale costa: in byte
sulla rete e in cicli di CPU per la codifica e la decodifica.

**Meccanismo.** Uno schema `.proto` definisce i messaggi; un compilatore genera il codice; la
codifica è binaria e compatta, con i campi identificati da **numeri** e non da nomi. Da qui la
regola di evoluzione: **il numero di campo non si riusa mai**. Aggiungere campi opzionali è
retro-compatibile; cambiare il tipo o riusare un numero rompe i lettori esistenti in modo
silenzioso, che è il peggior modo di rompersi.

**Nel progetto.** **Non usato nelle interfacce pubbliche**, e la ragione è deliberata:
l'integratore archetipico (§6.1 del profilo di progetto) non ha strumenti né competenze per
consumare un formato binario con schema compilato, e il vincolo **V3** impone che ogni
capacità sia raggiungibile da un sistema terzo. Un formato che richiede una catena di
compilazione alza la barriera d'ingresso più di quanto la prestazione la abbassi.

Resta valutabile per il traffico interno ad alto volume — le metriche di qualità della
sessione verso TimescaleDB sono il candidato naturale — dove entrambe le parti sono controllate
dal progetto `[NV]`.

**Specifica.** *Protocol Buffers Language Guide*, pubblicata dal progetto stesso. Non è uno
standard di un ente di normazione. La versione corrente del linguaggio è `proto3`.

#### La tabella di scelta

| Se… | Formato |
|---|---|
| È un'API pubblica letta anche da esseri umani | **JSON** |
| È un documento che deve essere firmato in parte, o lo impone uno standard | **XML** |
| È un'esportazione massiva da leggere in streaming | **ndjson** |
| È traffico interno ad altissimo volume fra componenti controllati | **Protocol Buffers** *(da valutare)* |
| È un file binario grande (immagine, registrazione, allegato) | **Nessuno dei precedenti**: riferimento a una risorsa, mai contenuto incorporato |

L'ultima riga è una regola vincolante e non un consiglio: incorporare in base64 dentro JSON un
file da decine di megabyte moltiplica memoria e banda, rende impossibile la ripresa di un
trasferimento interrotto e trasforma ogni riga di log in un problema.

---

## 9. Tabella riassuntiva

Nella colonna «stato» compaiono solo le informazioni rilevanti per l'implementazione: se una
specifica è una bozza, se è scaduta o se è superata, è detto qui.

### 9.1 Trasporto e web

| Protocollo | Problema risolto | Dove nel progetto | Specifica | Stato |
|---|---|---|---|---|
| IP | Instradamento globale | Ovunque | RFC 791 / RFC 8200 | Internet Standard |
| UDP | Multiplazione minima, senza garanzie | Media, STUN/TURN, QUIC | RFC 768 | Internet Standard |
| TCP | Flusso di byte affidabile e ordinato | HTTP, WebSocket, MLLP, broker, base dati | **RFC 9293** | Standards Track; sostituisce RFC 793 |
| QUIC | Flussi indipendenti, migrazione di connessione | Trasporto di HTTP/3 | RFC 9000, 9001, 9002 | Standards Track |
| TLS | Riservatezza, integrità, autenticazione del canale | Ovunque | **RFC 8446** (1.3) | Standards Track. **TLS 1.0/1.1 deprecati da RFC 8996** |
| mTLS | Autenticazione del client a livello di trasporto | MLLP, TS-CNS, traffico interno | RFC 8446 | Standards Track |
| HTTP (semantica) | Metodi, stati, intestazioni, cache | Tutte le API | **RFC 9110**, RFC 9111 | Standards Track |
| HTTP/1.1 | Sintassi testuale | Compatibilità universale | RFC 9112 | Standards Track; sostituisce RFC 7230 e RFC 2616 |
| HTTP/2 | Multiplazione, compressione delle intestazioni | Predefinito su gateway e traffico interno | RFC 9113, RFC 7541 | Standards Track |
| HTTP/3 | Nessun blocco in testa alla coda, migrazione | Gateway pubblico, con ripiego obbligatorio | RFC 9114, RFC 9204 | Standards Track |
| WebSocket | Canale bidirezionale a messaggi | Segnalazione WebRTC, notifiche interattive | RFC 6455; su HTTP/2 RFC 8441 | Standards Track. RFC 8441 non universalmente supportato `[NV]` |
| Server-Sent Events | Spinta a senso unico verso il browser | Cambi di stato, avanzamenti, allerte | **WHATWG HTML Living Standard**, sezione *Server-sent events* | **Non è una RFC**: standard vivo, senza versione |

### 9.2 Interfacce applicative

| Protocollo / meccanismo | Problema risolto | Dove nel progetto | Specifica | Stato |
|---|---|---|---|---|
| REST | Interfaccia uniforme sulle risorse | API applicativa | Tesi di R. Fielding, 2000 | **Stile architetturale, non standard** |
| OpenAPI 3.1 | Contratto verificabile da una macchina | API applicativa e webhook | OpenAPI Initiative | **Non è una RFC**. JSON Schema `2020-12` |
| Codici di stato | Esito comprensibile a client generici | Ovunque | RFC 9110 §15 | Standards Track |
| Negoziazione del contenuto | Rappresentazione e lingua concordate | FHIR, errori, i18n | RFC 9110 §12 | Standards Track |
| Cache e validatori | Non ritrasmettere l'invariato | Metadati, JWKS, profili, branding | RFC 9111; `ETag` RFC 9110 §8.8.3 | Standards Track |
| `ETag` + `If-Match` | Concorrenza ottimistica | Ogni risorsa clinica modificabile | RFC 9110 §13.1.1; `428` RFC 6585 | Standards Track |
| `Idempotency-Key` | Ritentativo sicuro di operazioni non idempotenti | Creazioni, invii, consensi, webhook | `draft-ietf-httpapi-idempotency-key-header-07` | **NON è una RFC. Bozza scaduta e archiviata (2025-10-15)** `[B6]` |
| `RateLimit`, `RateLimit-Policy` | Comunicare la quota residua | Gateway, per tenant e scope | `draft-ietf-httpapi-ratelimit-headers-11` | **NON è una RFC**. Internet-Draft attivo (2026-05-23). **La forma a tre campi è superata** `[B6]` |
| `Retry-After` | Dire quando ritentare | `429`, `503`, polling | RFC 9110 §10.2.3 | Standards Track |
| `Deprecation` | Da quando un endpoint è deprecato | Dismissione delle versioni di API | **RFC 9745** | **Standards Track, marzo 2025** `[B6]` |
| `Sunset` | Quando smetterà di funzionare | Idem | RFC 8594 | Standards Track. Mai anteriore a `Deprecation` `[B6]` |
| `Problem Details` | Errori leggibili da una macchina | Tutti gli errori dell'API applicativa | **RFC 9457** | Standards Track; **sostituisce RFC 7807** |

### 9.3 Identità e autorizzazione

| Protocollo | Problema risolto | Dove nel progetto | Specifica | Stato |
|---|---|---|---|---|
| OAuth 2.0 | Autorizzazione delegata | Tutta l'autorizzazione | RFC 6749, RFC 6750 | Standards Track |
| Sicurezza OAuth | Che cosa è ancora ammissibile | Postura di default | **RFC 9700** | **BCP**. Vieta implicit e password `[R5]` |
| PKCE | Legare il codice al client | Tutti i client, `S256` | RFC 7636 | Standards Track; obbligatorio per RFC 9700 §2.1.1 |
| Issuer nella risposta | Difesa dal *mix-up* | Client verso più AS | RFC 9207 | Standards Track `[R5]` |
| OpenID Connect | Autenticazione e identità | UI clinica e paziente, CIE | **OpenID Connect Core 1.0** | **Non è una RFC** (OpenID Foundation) |
| JWT / JWS / JWK | Claim verificabili senza rete | Token, asserzioni, firme | RFC 7519, 7515, 7517, 7518 | Standards Track |
| Buone pratiche JWT | Evitare i tranelli noti | Ogni validazione | **RFC 8725** | BCP |
| JWKS | Chiavi pubbliche e rotazione | Verso e da ogni controparte | RFC 7517 | Standards Track |
| `private_key_jwt` / JWT grant | Autenticazione asimmetrica del client | Backend Services, integratori | RFC 7523 | Standards Track |
| Introspezione | Validità del token adesso | Operazioni ad alto impatto | RFC 7662 | Standards Track |
| Revoca | Invalidare un token | Logout, incidenti | RFC 7009 | Standards Track |
| Token Exchange | Delega fra organizzazioni | Identità dell'integratore, claim `act` | **RFC 8693** | Standards Track. Delega, mai impersonificazione (D18) `[R5]` |
| Vincolo al possessore | Token non riutilizzabile se rubato | Irrobustimento per tenant | RFC 9449 (DPoP), RFC 8705 (mTLS) | Standards Track. Fuori dal minimo v1.0 `[NV]` |
| SAML 2.0 | Federazione con asserzioni firmate | **SPID** | OASIS SAML V2.0, 15 marzo 2005 | Standard OASIS. **Necessario: SPID non è esercito in OIDC** `[B7]` |
| Livelli di garanzia | Quanto è forte l'autenticazione | `acr`, autorizzazione per operazione | Regole tecniche SPID / CIE; ISO/IEC 29115 | `SpidL1\|L2\|L3` = LoA2/3/4. **Con CIE l'asserzione è sempre `SpidL3`** `[B7]` |

### 9.4 Integrazione sanitaria, eventi, tempo reale, trasversali

| Protocollo | Problema risolto | Dove nel progetto | Specifica | Stato |
|---|---|---|---|---|
| FHIR REST | Scambio clinico strutturato su HTTP | API clinica, nei due ruoli | FHIR **4.0.1**, sezione *RESTful API* | Normativa per le parti dichiarate tali |
| FHIR Bulk Data | Estrazione massiva asincrona | Esportazioni, migrazioni, portabilità | Guida **3.0.0** | **Trial-use, attiva dall'11-12-2025.** STU2 superata. Il *continuous build* diverge: non implementarci sopra `[B6]` |
| MLLP | Incorniciamento di HL7 v2 su TCP | Motori di integrazione ospedalieri | *HL7 Transport Specification: MLLP* | Standard HL7. **Nudo è in chiaro: sempre in mTLS** |
| DICOMweb | Servizi RESTful su immagini | Sola consultazione, mai sul canale video | DICOM PS3.18 | Standard DICOM |
| SMART App Launch | Contesto clinico e scope FHIR su OAuth | Client e server SMART | HL7 SMART App Launch 2.x | Pubblicata. PKCE `S256` obbligatorio, `plain` vietato `[R5]` |
| SMART Backend Services | Sistema che chiama sistema, senza utente | Integratori, job di agenda | Stessa guida | Pubblicata. `expires_in` consigliato 300 s `[R5]` |
| SMART Web Messaging | Dialogo fra applicazione incorporata e ospitante | Ciclo di vita dell'incorporamento | Guida **separata**, 1.0.0 STU1, 2022-05-06 | **Maturità inferiore: documentare come sperimentale** `[B6]` |
| FHIR `Subscription` (R4 backport) | Notifiche su risorse cliniche | Integratori FHIR-nativi | Guida **1.1.0**, 2023-01-11 | STU. **Nessuna estensione `backport-topic`**; il topic sta in `Subscription.criteria` `[B6]` |
| Protocollo del broker | Registro persistente, disaccoppiamento | Tutti gli eventi di dominio | *Apache Kafka protocol guide* | Specifica di un'implementazione, non di un ente. SOUP ai sensi di IEC 62304 |
| CloudEvents | Busta comune degli eventi | Broker e webhook | CloudEvents 1.0; binding HTTP **1.0.2** | Specifica CNCF. **`ce-datacontenttype` MUST NOT** `[B6]` |
| HTTP Message Signatures | Autenticità e integrità del webhook | Ogni webhook uscente | **RFC 9421** | Standards Track, febbraio 2024 |
| `Content-Digest` | Impronta del corpo da firmare | Webhook | **RFC 9530** | Standards Track. **RFC 9421 non lo definisce** |
| ICE / STUN / TURN | Trovare un percorso attraverso i NAT | Ogni sessione video | RFC 8445 / 8489 / 8656 | Standards Track. Dettaglio nel modulo 08 |
| DTLS / DTLS-SRTP / SRTP | Cifrare il media con chiavi negoziate fra gli estremi | Media di ogni sessione | RFC 6347 e 9147 / RFC 5764 / RFC 3711 | Standards Track. Dettaglio nel modulo 08 |
| RTP / RTCP | Trasporto del media e misura della qualità | Media e metriche | RFC 3550 | Internet Standard |
| SCTP e canale dati | Canale di messaggi dentro la sessione | Sottotitoli, scambi accessori | RFC 9260, 8261, 8831, 8832 | Standards Track |
| SDP | Descrizione della sessione | Corpo della segnalazione | RFC 8866; JSEP RFC 8829 | Standards Track. **È un formato, non un trasporto** |
| NTP / NTS | Orologi allineati e autenticati | Token, firme, audit, metriche | RFC 5905 / RFC 8915 | Standards Track |
| DNS | Risoluzione dei nomi | Ovunque; controllo degli URL di terzi | RFC 1034/1035; RFC 4033-4035; 7858; 8484; 9460 | Standards Track |
| JSON | Serializzazione primaria | Ovunque | RFC 8259; ECMA-404 | Internet Standard |
| XML | Documenti firmabili in parte | SAML, CDA, FHIR XML | Raccomandazioni W3C | Vincolo esterno, non scelta |
| ndjson | Streaming di molti record | Bulk Data, esportazioni | Convenzione `ndjson.org`; tipo FHIR normato | **Non è una RFC** |
| Protocol Buffers | Serializzazione binaria compatta | Non nelle interfacce pubbliche | *Language Guide*, `proto3` | Specifica di progetto, non di un ente |

---

## 10. Come si sceglie un protocollo

Non esiste un protocollo migliore: esiste quello adatto a un problema, in un contesto, con
vincoli dati. Questi sono i criteri effettivamente usati nel progetto, **nell'ordine in cui
vanno applicati**. L'ordine conta: i primi tre eliminano opzioni, gli altri scelgono fra
quelle rimaste.

### Criterio 1 — Esiste già uno standard per questo problema?

Se sì, si usa. Non perché sia sempre tecnicamente superiore, ma perché **l'interoperabilità è
il prodotto**, non un attributo del prodotto. Un formato proprietario migliore del 20% e
comprensibile a nessuno vale meno di uno standard mediocre che l'integratore già parla.

Il corollario, meno ovvio: **si usa lo standard anche quando se ne usa una frazione**. Adottare
CloudEvents per una busta di sei campi sembra sovradimensionato, finché non arriva il secondo
consumatore e non serve uno strumento generico di instradamento.

### Criterio 2 — La sovranità del dato lo consente? (vincolo V1)

Nessun componente obbligatorio ospitato fuori dall'Unione Europea, nessuna dipendenza di
runtime da servizi che non si possano installare nel profilo più restrittivo (decisione D24).
Questo criterio **elimina opzioni prima di ogni valutazione tecnica**: un protocollo che
funziona solo con un servizio gestito da un fornitore fuori perimetro non è una candidata da
confrontare, è una candidata esclusa.

E dalla decisione D40 discende che non è più nemmeno solo un argomento tecnico: il soggetto
NIS deve **dichiarare nominativamente all'autorità i fornitori rilevanti**, con Paese della
sede legale. La scelta di un protocollo che vincola a un fornitore è un dato che il cliente
dovrà comunicare.

### Criterio 3 — Passa attraverso le reti reali degli utilizzatori?

Un protocollo che funziona in laboratorio e non attraversa il firewall di un'azienda
ospedaliera non funziona. In concreto: UDP è spesso bloccato in uscita, le porte non standard
sono spesso chiuse, i proxy che ispezionano il traffico rompono i protocolli che non
riconoscono, le reti mobili cambiano indirizzo.

Conseguenza operativa: **ogni scelta che dipende da una condizione di rete ha un ripiego
obbligatorio**, e il ripiego è progettato insieme alla scelta principale, non dopo. HTTP/3 con
ripiego su HTTP/2; media diretto con ripiego su relay; WebSocket con ripiego su polling per la
sola funzione di stato.

### Criterio 4 — Chi sta dall'altra parte, e cosa sa fare?

Il profilo dell'integratore archetipico è un gestionale sanitario cloud di fascia piccola e
media, con un'équipe di sviluppo ridotta e nessuna specializzazione in interoperabilità
sanitaria. Un protocollo che richiede una catena di compilazione, una libreria specifica o una
conoscenza approfondita di uno standard è un protocollo che **non verrà adottato**, e il
vincolo **V3** ne uscirebbe soddisfatto solo sulla carta.

Da qui tre scelte concrete già prese: JSON e non Protocol Buffers sulle interfacce pubbliche;
accettare gli scope SMART nella sintassi v1 convertendoli, invece di rifiutarli `[R5]`;
offrire i webhook accanto alle `Subscription` FHIR invece di imporre le seconde.

### Criterio 5 — Che cosa succede quando qualcosa va storto?

La domanda va posta **prima** di adottare, non dopo il primo incidente:

- Se il destinatario è spento per un'ora, l'informazione si perde?
- Se il messaggio arriva due volte, cosa accade?
- Se arriva fuori ordine?
- Se il messaggio è a metà, il destinatario se ne accorge?
- Se qualcuno lo intercetta e lo rispedisce, viene accettato?
- Se la controparte è ostile, qual è il danno massimo?

Un protocollo che non ha risposte a queste sei domande non è stato scelto: è stato subito.

### Criterio 6 — È osservabile e diagnosticabile?

Un protocollo di cui non si può vedere il traffico senza strumenti specializzati costa in
assistenza ogni giorno della sua vita. È uno dei motivi seri, non estetici, per cui il
progetto usa formati testuali sulle interfacce pubbliche: quando un integratore apre un
ticket, la differenza fra un `curl` incollato nel ticket e un dump binario da decodificare è la
differenza fra dieci minuti e due giorni.

Corollario: **ogni protocollo del progetto deve poter essere tracciato**. Identificativo di
correlazione propagato, marca temporale affidabile (§8.1), registrazione degli esiti. Un
protocollo che non si può correlare a una traccia distribuita è un punto cieco.

### Criterio 7 — Che cosa comporta in regime di dispositivo medico?

Criterio che altrove non esiste e qui è vincolante. Ogni protocollo implementato con una
libreria di terze parti è **SOUP** ai sensi di IEC 62304 (decisione D12): va censito,
giustificato, sorvegliato per vulnerabilità e aggiornato nel periodo di supporto dichiarato,
con la SBOM generata dalla pipeline (decisione D45). Un protocollo con dieci dipendenze
transitive costa dieci volte in qualificazione.

Ne discende un criterio raramente enunciato altrove: **a parità di funzione, si preferisce il
protocollo con la superficie di dipendenze minore**, anche se un po' meno comodo. È la stessa
logica per cui l'SDK TypeScript del progetto dipende dai soli tipi FHIR e implementa il
trasporto internamente `[B6]`.

### Criterio 8 — È una scelta reversibile?

Un protocollo dietro un'interfaccia di progetto si sostituisce; un protocollo il cui modello
è entrato nel codice di dominio no. È esattamente la ragione per cui la decisione D15
prescrive che l'astrazione di pubblicazione degli eventi resti dietro un'interfaccia propria,
e per cui il contenuto del referto è modellato come **dataset canonico** con la
serializzazione documentale trattata come sostituibile (decisione D30).

La domanda operativa: *se fra due anni dovessimo sostituirlo, quante righe di codice di
dominio cambierebbero?* Se la risposta è «molte», serve un adattatore prima di procedere.

---

## 11. Errori tipici, per chi non ha mai lavorato con i protocolli

Sono gli errori che si ripetono, in questo ordine di frequenza.

**1. Confondere «funziona» con «è corretto».** Un'implementazione che funziona contro una
controparte non è conforme: è compatibile con quella controparte. La conformità si verifica
contro la specifica e contro un validatore, non contro un partner cortese. Nel progetto questo
ha un nome preciso: il criterio di accettazione della v1.0 è il superamento integrale di
`spid_sp_test`, non «l'accesso funziona» `[B7]`.

**2. Trattare le condizioni di errore come casi rari.** Nel funzionamento reale non lo sono:
la rete cade, i timeout scattano, i messaggi si duplicano. Il percorso di errore va progettato
e **testato** con la stessa cura del percorso felice. Un ritentativo mai eseguito in prova è
un ritentativo che non funziona.

**3. Ignorare l'idempotenza.** È l'errore più costoso in ambito sanitario, perché produce dati
duplicati che nessuno nota subito: due referti, due sessioni, due allerte. Ogni operazione che
modifica stato deve avere una risposta esplicita alla domanda «cosa succede se arriva due
volte?».

**4. Fidarsi di ciò che arriva dalla rete.** Ogni byte proveniente dall'esterno è ostile fino a
prova contraria. Include: i campi di un JSON, la lunghezza di una stringa, l'URL di un
webhook fornito da un integratore, il `kid` di un JWT, il `jku` nell'header, l'`Origin` di una
WebSocket, il contenuto di un XML. Il progetto è tenuto a questa disciplina non solo per buona
pratica ma perché il regime CRA (decisione D27) la rende un obbligo documentale.

**5. Mettere i segreti negli URL.** Token, chiavi, identificativi di sessione. Gli URL finiscono
nei log di ogni intermediario, nella cronologia del browser, nell'intestazione `Referer`, nei
sistemi di monitoraggio. È la ragione per cui il progetto usa un token d'ingresso a uso singolo
e a scadenza brevissima per l'apertura della WebSocket, invece del token di accesso.

**6. Confondere cifratura e codifica.** base64 non è cifratura. La codifica per URL non è
cifratura. Un JWT è leggibile da chiunque lo possieda.

**7. Assumere che gli orologi siano allineati.** Le scadenze dei token, le finestre di firma,
l'ordine degli eventi: tutti dipendono da un'ipotesi che va garantita e monitorata, non data
per scontata (§8.1).

**8. Ignorare la versione della specifica.** «Usiamo FHIR» non dice nulla: `4.0.1` dice
qualcosa. «Usiamo Bulk Data» non dice nulla: la 3.0.0 ha parametri e manifest diversi dalla
STU2 `[B6]`. Ogni riferimento a uno standard senza versione è un debito.

**9. Chiamare standard ciò che non lo è.** `Idempotency-Key` non è uno standard. La terna
`RateLimit-*` classica non lo è mai stata ed è anche superata. Gli scope proprietari non sono
scope SMART. I claim `tenant` e `auth_source` sono proposte di progetto. Scriverlo è la
differenza fra una documentazione affidabile e una che genera aspettative infondate.

**10. Progettare per il caso felice della rete.** Banda larga, latenza bassa, nessuna perdita.
Il paziente reale è su smartphone in rete mobile, in un corridoio, con due tacche di segnale.
Il vincolo **V6** dice che degradare in modo comprensibile — audio prima del video, avvisi
chiari, ripresa della sessione — **è parte dell'accessibilità**, non un'ottimizzazione.

**11. Costruire un protocollo proprietario dove ne esiste uno.** Costa la progettazione, la
documentazione, l'implementazione su entrambi i lati, i test di interoperabilità e la
manutenzione perpetua. Ogni tanto è giustificato; quasi mai è la prima ipotesi corretta.

**12. Non leggere la fonte primaria.** La quasi totalità delle affermazioni sbagliate su
protocolli e standard proviene da sintesi di sintesi. Le correzioni raccolte in questo modulo
— `Deprecation` che è diventata una RFC, `Idempotency-Key` che non lo è, la forma di
`RateLimit` che è cambiata, l'estensione `backport-topic` che non esiste, `ce-datacontenttype`
che è vietato — sono **tutte** frutto della lettura del testo originale `[B6]`. Nessuna sarebbe
emersa da una ricerca superficiale.

---

## Cosa devi ricordare

1. **Protocollo, formato e standard sono tre cose diverse.** JSON è un formato; REST è uno
   stile; FHIR è uno standard che contiene un modello dati, due formati e un protocollo. Dire
   quale dei tre si sta usando elimina metà delle incomprensioni di integrazione.
2. **Un protocollo senza semantica degli errori non è un protocollo utilizzabile.** Il
   comportamento in caso di perdita, duplicazione, disordine e controparte ostile è parte
   della specifica, non un dettaglio implementativo.
3. **I livelli si presuppongono, non si sostituiscono.** TLS protegge il canale, non prova chi
   ha scritto il contenuto: per quello servono la firma dei messaggi e la catena di impronte
   sull'audit.
4. **La distinzione fra `4xx` e `5xx` decide se un client ritenta.** È la riga di codice che
   più spesso viene sbagliata, e produce o cicli infiniti o operazioni abbandonate.
5. **Ogni risposta con dato clinico porta `Cache-Control: no-store`.** `no-cache` non è
   equivalente: consente la memorizzazione, impone solo la rivalidazione.
6. **`ETag` e `If-Match` sono l'unica difesa dall'aggiornamento perduto su un documento
   clinico.** Sulle risorse cliniche modificabili, l'aggiornamento senza `If-Match` è
   rifiutato con `428`, e il conflitto è un caso di interfaccia da progettare, non un errore
   tecnico da mostrare.
7. **`Idempotency-Key` non è uno standard**: l'Internet-Draft è scaduto e archiviato. Va
   adottato come convenzione di progetto e dichiarato come tale `[B6]`.
8. **La forma corretta della limitazione del traffico oggi è `RateLimit` più
   `RateLimit-Policy`**, non i tre campi storici — che non sono mai stati standard e sono
   anche superati. Il documento resta un Internet-Draft attivo, non una RFC `[B6]`.
9. **`Deprecation` è diventata RFC 9745, Standards Track, marzo 2025**, con valore Date di
   *Structured Fields*; `Sunset` (RFC 8594) non può mai precederla `[B6]`.
10. **Gli errori dell'API applicativa sono `Problem Details` (RFC 9457, che sostituisce la
    7807); quelli dell'API FHIR sono `OperationOutcome`.** Sono due contratti diversi, con una
    tabella di corrispondenza fra loro.
11. **OAuth autorizza, OIDC autentica.** L'access token non è una prova di identità:
    l'`id_token` sì. Confonderli è la vulnerabilità storica di questa famiglia.
12. **PKCE con `S256` su tutti i client**, `plain` rifiutato, `redirect_uri` con
    corrispondenza esatta, `state` verificato. Sono quattro controlli, e servono tutti e
    quattro.
13. **Un JWT si valida imponendo gli algoritmi ammessi, mai deducendoli dal token**, e non si
    segue mai ciecamente il `jku` dell'header: va confrontato con il `jwks_uri` registrato per
    quel client.
14. **La delega non è l'impersonificazione.** Il claim `act` di RFC 8693 §4.1 registra *quale
    sistema ha agito per conto di quale persona*: senza, l'audit non può rispondere a quella
    domanda. Il progetto usa sempre la delega (D18).
15. **Il livello di garanzia sta in `acr`, mai in `act`**, e va distinto fra eseguito e
    riferito. Con CIE l'asserzione di ritorno è **sempre `SpidL3`**: il livello effettivo non è
    desumibile dalla risposta, quindi si registrano sia il richiesto sia l'asserito `[B7]`.
16. **SPID richiede SAML 2.0**, non OIDC, e richiede la sua variante italiana con le
    deviazioni delle regole tecniche e degli avvisi. Il Service Provider è il deployer, mai il
    progetto (D36).
17. **MLLP nudo è testo in chiaro senza autenticazione.** Sempre dentro TLS con autenticazione
    reciproca, senza eccezioni «per il collaudo».
18. **Le immagini diagnostiche non transitano sul canale video**: si recuperano per DICOMweb
    dalla loro fonte autorevole, con la propria autorizzazione e il proprio audit.
19. **L'outbox transazionale precede il broker.** È ciò che elimina insieme gli eventi persi e
    gli eventi fantasma; il resto della catena garantisce «almeno una volta», e l'«esattamente
    una volta» è un risultato osservabile ottenuto con la deduplicazione lato ricevente.
20. **L'ordine è garantito per soggetto, non globalmente**, e sui webhook non è garantito
    affatto: ogni evento deve portare un numero di sequenza e uno stato autosufficiente.
21. **I webhook si firmano con RFC 9421**, con chiave asimmetrica — mai HMAC condiviso, che
    consentirebbe al ricevente di fabbricare notifiche indistinguibili — e l'impronta del corpo
    è `Content-Digest` di RFC 9530, che RFC 9421 **non** definisce.
22. **`ce-datacontenttype` non deve mai essere emesso**: il tipo di contenuto di un CloudEvent
    in modalità binaria sta solo in `Content-Type`. È un `MUST NOT` della specifica `[B6]`.
23. **Gli orologi vanno sincronizzati e monitorati.** Le durate si misurano con un orologio
    monotono; gli istanti si scrivono in UTC; l'ordine fra macchine diverse non si deduce dalle
    marche temporali.
24. **Ogni scelta che dipende da una condizione di rete ha un ripiego obbligatorio**, progettato
    insieme alla scelta principale: HTTP/3 → HTTP/2, media diretto → relay, canale interattivo
    → recupero da API.
25. **Una specifica si cita con la versione e con lo stato.** Se è una bozza, se è scaduta, se
    è superata, va detto. È l'informazione che manca quasi ovunque, ed è quella che evita di
    costruire su terreno che si muove.

---

## Termini introdotti in questo modulo

| Termine | Definizione breve |
|---|---|
| **Protocollo** | Accordo su quali messaggi si scambiano, in quale ordine, come sono rappresentati, cosa significano e cosa accade in caso di errore. |
| **Formato** (*serializzazione*) | Modo di rappresentare dati strutturati come sequenza di byte. Non dice nulla su quando e come si comunica. |
| **Standard** | Documento pubblicato da un ente riconosciuto che descrive un formato, un protocollo o un modello. |
| **Standard di fatto** | Convenzione diffusa che nessun ente ha normato. Diffuso non significa normato. |
| **Pila di protocolli** (*stack*) | Insieme di protocolli sovrapposti, ciascuno che presuppone il servizio di quello sotto. |
| **Modello a livelli** | Mappa concettuale della pila; OSI a sette livelli, il modello di Internet a quattro. |
| **Incapsulamento** | Ogni livello tratta il messaggio di quello superiore come payload opaco e vi aggiunge la propria intestazione. |
| **Contratto di interfaccia** | Descrizione della promessa fra due parti, verificabile da una macchina. |
| **Blocco in testa alla coda** (*head-of-line blocking*) | Un elemento bloccato impedisce la consegna di quelli già arrivati dietro di lui. |
| **RTT** (*round-trip time*) | Tempo di andata e ritorno fra due estremi. |
| **Idempotenza** | Eseguire un'operazione una o N volte produce lo stesso stato finale. |
| **Sicura** (*safe*, di un metodo HTTP) | Non modifica lo stato del server. |
| **Almeno una volta / a-lo-più-una-volta / esattamente una volta** | Le tre garanzie di consegna; la terza è ottenibile solo come «almeno una volta» più deduplicazione. |
| **Deduplicazione** | Scartare lato ricevente ciò che è già stato elaborato, riconoscendolo da un identificativo. |
| **Bearer token** | Credenziale «al portatore»: chiunque la possieda può usarla. |
| **Scope** | Ambito di autorizzazione richiesto e concesso a un token. |
| **Audience** (`aud`) | Destinatario per cui un token è valido; un resource server deve rifiutare i token non destinati a sé. |
| **Claim** | Affermazione contenuta in un token. |
| **JWT / JWS / JWE / JWK** | Token; token firmato; token cifrato; rappresentazione di una chiave. |
| **JWKS** (*JWK Set*) | Documento che pubblica un insieme di chiavi pubbliche con i rispettivi `kid`. |
| **`kid`** | Identificativo della chiave usata per firmare, che consente la rotazione senza interruzione. |
| **Rotazione delle chiavi** | Sostituzione di una chiave con un periodo in cui vecchia e nuova coesistono. |
| **PKCE** | Meccanismo che lega il codice di autorizzazione a un segreto generato dal client per quella richiesta. |
| **Introspezione** | Interrogazione all'authorization server sulla validità attuale di un token. |
| **Revoca** | Dichiarazione che un token non va più onorato. |
| **Token Exchange** | Scambio di un token con un altro, valido in un altro dominio (RFC 8693). |
| **Delega contro impersonificazione** | Nella delega il token porta sia il soggetto sia l'attore (claim `act`); nell'impersonificazione l'attore scompare. |
| **Trust anchor** | Emittente riconosciuto come fidato per un tenant, con issuer, chiavi e algoritmi ammessi. |
| **`acr`** (*Authentication Context Class Reference*) | Claim che dichiara il contesto e quindi il livello dell'autenticazione eseguita. |
| **Livello di garanzia** (*LoA*) | Misura della robustezza dell'autenticazione; SPID L1/L2/L3 = ISO/IEC 29115 LoA2/LoA3/LoA4. |
| **Service Provider / Identity Provider** | Chi eroga il servizio; chi autentica l'utente e ne asserisce l'identità. |
| **Asserzione** (SAML) | Documento XML firmato che afferma l'identità e gli attributi dell'utente. |
| **Metadata** (SAML) | Documento che dichiara entityID, endpoint, certificati e attributi di un'entità della federazione. |
| **XML Signature Wrapping** | Attacco in cui la firma resta valida ma copre un frammento diverso da quello elaborato. |
| **mTLS** | TLS in cui anche il client presenta un certificato: l'identità è provata dal canale. |
| **Forward secrecy** | Proprietà per cui la compromissione futura della chiave privata non consente di decifrare le sessioni passate. |
| **ALPN** | Negoziazione, dentro l'handshake TLS, del protocollo applicativo (`h2`, `http/1.1`, `h3`). |
| **SNI** | Nome del servizio richiesto, inviato in chiaro nel `ClientHello`. |
| **Validatore** (HTTP) | `ETag` o `Last-Modified`: consente al server di rispondere `304` se nulla è cambiato. |
| **Concorrenza ottimistica** | Non si blocca la risorsa: si fa fallire chi salva con una versione superata (`If-Match` → `412`). |
| **Aggiornamento perduto** (*lost update*) | Una modifica sovrascritta da un'altra senza che nessuno se ne accorga. |
| **Negoziazione del contenuto** | Accordo su rappresentazione, lingua e codifica tramite `Accept*` e `Content-*`. |
| **`Vary`** | Dichiara quali intestazioni della richiesta hanno determinato la risposta; indispensabile alle cache. |
| **Problem Details** | Formato normato degli errori HTTP, `application/problem+json` (RFC 9457). |
| **Structured Fields** | Grammatica normata per i valori delle intestazioni HTTP (RFC 9651). |
| **Outbox transazionale** | L'evento è scritto nella stessa transazione del dato e pubblicato da un relay: niente eventi persi né fantasma. |
| **Offset** (broker) | Posizione del consumatore nel registro; consente la rilettura. |
| **Partizione** | Unità di parallelismo e di ordinamento del broker: l'ordine è garantito solo al suo interno. |
| **Coda di scarto** (*dead letter*) | Destinazione dei messaggi che hanno esaurito i ritentativi. |
| **Ondata sincronizzata** (*thundering herd*) | Ritentativi che convergono sullo stesso istante e impediscono il recupero; si evita con una componente casuale nell'attesa. |
| **CloudEvents** | Specifica CNCF che definisce una busta comune per gli eventi e i suoi binding sui protocolli. |
| **Webhook** | Notifica HTTP inviata dal produttore a un URL fornito dal consumatore. |
| **HTTP Message Signatures** | Firma di componenti selezionati di un messaggio HTTP (RFC 9421); l'impronta del corpo è `Content-Digest` (RFC 9530). |
| **SSRF** (*server-side request forgery*) | Indurre un server a chiamare una destinazione scelta dall'attaccante, tipicamente interna. |
| **MLLP** | Incorniciamento minimo dei messaggi HL7 v2 su TCP; in chiaro per costruzione. |
| **DICOMweb** | I servizi RESTful di DICOM: QIDO-RS, WADO-RS, STOW-RS, UPS-RS. |
| **SMART on FHIR** | Profilo di OAuth 2.0 che aggiunge contesto clinico, scope FHIR e scoperta standardizzata. |
| **Contesto di lancio** | Paziente, incontro e altre risorse consegnati all'applicazione senza chiederli all'utente. |
| **Bulk Data** | Estrazione massiva asincrona FHIR, con kick-off, polling, manifest e file ndjson. |
| **ndjson** | Un documento JSON per riga; leggibile in streaming con memoria costante. |
| **SDP** | Formato testuale che descrive una sessione multimediale; è trasportato, non trasporta. |
| **ICE / STUN / TURN** | Scelta del percorso attraverso i NAT; scoperta del proprio indirizzo pubblico; relay quando il diretto non è possibile. |
| **DTLS-SRTP** | Derivazione delle chiavi SRTP dalla stretta di mano DTLS fra i due estremi. |
| **Canale dati** | Canale di messaggi SCTP su DTLS dentro la stessa sessione WebRTC. |
| **NTP / NTS** | Sincronizzazione degli orologi; la seconda ne autentica la sorgente. |
| **Orologio monotono** | Sorgente di tempo che non torna indietro; l'unica corretta per misurare durate. |
| **SOUP** | *Software of unknown provenance*: componente di terze parti da censire e sorvegliare ai sensi di IEC 62304. |
