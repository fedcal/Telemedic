---
title: "WebRTC e trasporto media real-time"
sidebar_position: 4
description: "WebRTC, JSEP, ICE/STUN/TURN, coturn, DTLS-SRTP, topologie, codec, congestion control, getStats, latenza, registrazione e testing."
---

# WebRTC e trasporto media real-time - ricerca tecnica di riferimento (R4)

> **Stato del documento**: output della fase di ricerca. Ogni affermazione normativa è ancorata a un RFC (con numero e sezione) o a una specifica W3C citata con il titolo esatto. Dove la verifica non è stata possibile entro i limiti di questa ricerca, il testo riporta esplicitamente **`[non verificato]`**. Le stime numeriche di dimensionamento sono marcate come **`[ordine di grandezza]`** e devono essere validate con misure proprie prima di finire in documentazione pubblica.
>
> **Regola R0 applicata**: nessun nome di azienda o prodotto commerciale di potenziale partner compare in questo documento. I progetti open source citati (coturn, mediasoup, Janus, Jitsi, LiveKit, Pion) sono opzioni tecnologiche, non partner.

## 0. Errata sul mandato e note di metodo

Due correzioni preliminari, perché gli agenti a valle non propaghino errori:

1. **RFC 8826 e RFC 8827 sono invertiti nel mandato.** La numerazione corretta, verificata su datatracker:
   - **RFC 8826** - *Security Considerations for WebRTC* (analisi delle minacce).
   - **RFC 8827** - *WebRTC Security Architecture* (architettura, requisiti crittografici, identity provider).
2. **`RFC 5245` e `RFC 5389` non vanno più citati come riferimento vivo.** ICE è oggi **RFC 8445**, STUN è **RFC 8489**, TURN è **RFC 8656** (che obsoleta RFC 5766 e RFC 6156, cfr. RFC 8656 §24 e §25). Il profilo SDP per ICE è stato scorporato in **RFC 8839**, che obsoleta RFC 5245 e RFC 6336.

Nel testo, "il sito dichiara" indica un'affermazione pubblica del progetto Telemedic ripresa dal context pack; "verificato" indica un fatto controllato su fonte primaria in questa ricerca.

---

## 1. Architettura WebRTC e specifiche di base

### 1.1 La doppia natura della specifica: W3C + IETF

WebRTC non è *una* specifica. È la composizione di due corpi normativi che si presuppongono a vicenda:

- **W3C** definisce **l'API JavaScript** esposta al browser: *WebRTC: Real-Time Communication in Browsers*, **W3C Recommendation del 13 marzo 2025** (verificato). È una Recommendation con "candidate amendments", cioè una raccomandazione stabile che continua a incorporare modifiche sostanziali - un dettaglio non banale: la superficie API non è congelata.
- **IETF** definisce **i protocolli sul filo**, coordinati dall'applicability statement **RFC 8825** - *Overview: Real-Time Protocols for Browser-Based Applications*.

RFC 8825 non definisce protocolli: elenca quali altre specifiche un'implementazione deve rispettare per potersi dire WebRTC. La sua struttura (§1–§12) copre trasporto dati (§4), framing e messa in sicurezza (§5), formati (§6), gestione della connessione (§7).

La costellazione normativa IETF verificata:

| RFC | Titolo | Ruolo |
|---|---|---|
| **8825** | Overview: Real-Time Protocols for Browser-Based Applications | Applicability statement, punto di coordinamento |
| **8826** | Security Considerations for WebRTC | Modello di minaccia |
| **8827** | WebRTC Security Architecture | Requisiti crittografici e di identità |
| **8829** | JavaScript Session Establishment Protocol (JSEP) | Semantica offer/answer lato API |
| **8831** | WebRTC Data Channels | Requisiti dei data channel |
| **8832** | WebRTC Data Channel Establishment Protocol (DCEP) | Protocollo di apertura dei canali |
| **8834** | Media Transport and Use of RTP in WebRTC | Profilo RTP obbligatorio |
| **8835** | Transports for WebRTC | ICE, TURN, BUNDLE, SCTP/DTLS |
| **8836** | Congestion Control Requirements for Interactive Real-Time Media | Requisiti (non algoritmo) |
| **8837** | DSCP Packet Markings for WebRTC QoS | Marcature DiffServ |
| **8854** | WebRTC Forward Error Correction Requirements | FEC audio/video |
| **8864** | Negotiation Data Channels Using SDP | Negoziazione data channel in SDP |

### 1.2 `RTCPeerConnection`, `RTCDataChannel`, `MediaStream`

Le interfacce principali definite dalla W3C Recommendation (verificate): `RTCPeerConnection`, `RTCDataChannel`, `RTCRtpSender`, `RTCRtpReceiver`, `RTCRtpTransceiver`, `RTCDtlsTransport`, `RTCIceTransport`, `RTCSctpTransport`, `RTCCertificate`.

`MediaStream` e `MediaStreamTrack` **non** appartengono alla specifica WebRTC: sono definiti da *Media Capture and Streams* (W3C), e `getUserMedia()` vive lì. È una distinzione che conta quando si scrivono i requisiti: i vincoli su risoluzione, frame rate e device selection (`MediaTrackConstraints`) sono governati da quella specifica, non da WebRTC.

I membri di `RTCConfiguration` sono esattamente sei (verificati sulla Recommendation):

```javascript
const pc = new RTCPeerConnection({
  iceServers: [/* RTCIceServer[] */],   // default: []
  iceTransportPolicy: "all",             // "all" | "relay"
  bundlePolicy: "balanced",              // "balanced" | "max-compat" | "max-bundle"
  rtcpMuxPolicy: "require",              // "require"
  certificates: [],                      // RTCCertificate[]
  iceCandidatePoolSize: 0,               // octet
});
```

Due implicazioni operative immediate per Telemedic:

- **`iceTransportPolicy: "relay"`** è il modo canonico per forzare il percorso TURN. È lo strumento che rende testabile in CI il "fallback relay" dichiarato nella feature 1 del sito (vedi §11.4).
- **`certificates`** consente di riusare un `RTCCertificate` generato con `RTCPeerConnection.generateCertificate()`. Rilevante se si vuole controllare l'algoritmo della chiave (ECDSA P-256 vs RSA) e la durata; per default il browser genera un certificato self-signed effimero per PeerConnection.

Il `RTCDataChannel` gira su **SCTP over DTLS over ICE** (RFC 8835 §3.5: *"WebRTC endpoints MUST support SCTP over DTLS over ICE"*, con l'estensione I-DATA di RFC 8260 obbligatoria). Per Telemedic è il canale naturale per: segnali di controllo in-band (mute, richiesta di ripetizione, "sto scrivendo"), scambio di piccoli artefatti clinici, e - punto importante - **eventuali metadati di sessione che non devono transitare per il server di signaling**.

### 1.3 Il modello JSEP e perché il signaling non è standardizzato

**RFC 8829 (JSEP)** è il documento che spiega la scelta di design più fraintesa di WebRTC.

Il razionale, citato da §1.1: *"different applications may prefer to use different protocols, such as the existing SIP call signaling protocol, or something custom to the particular application"*, e *"the JSEP implementation is almost entirely divorced from the core signaling flow, which is instead handled by the JavaScript"*.

RFC 8825 lo ribadisce dal lato architetturale: *"The choice of protocols for client-server and inter-server signaling, and the definition of the translation between them, are outside the scope of the WebRTC protocol suite described in this document."*

Che cosa significa in pratica:

- Il browser espone una **macchina a stati offer/answer** (RFC 8829 §3.2, Figura 2) con gli stati `stable`, `have-local-offer`, `have-remote-offer`, `have-local-pranswer`, `have-remote-pranswer`, `closed`.
- Il browser **produce** e **consuma** blob SDP tramite `createOffer()` (§4.1.8), `createAnswer()` (§4.1.9), `setLocalDescription()` (§4.1.11), `setRemoteDescription()` (§4.1.12), con rollback in §4.1.10.2 e trickling ICE in §3.5.2.
- **Il trasporto di quei blob è interamente responsabilità dell'applicazione.**

**Conseguenza per il modello di sicurezza - e questo è il punto che gli agenti sulla sicurezza devono assorbire**: poiché il signaling non è standardizzato, non è nemmeno *protetto* dal protocollo. La catena di fiducia dell'intera cifratura media dipende dall'integrità di un canale che WebRTC non specifica. Se ne riparla in §5.4.

**Conseguenza per Telemedic**: il backend Spring Boot che fa signaling non è "un componente accessorio". È **il Trust Anchor de facto** dell'intera sessione media. Va progettato, documentato e minacciato (threat model) come tale.

---

## 2. Signaling

### 2.1 SDP e offer/answer

- **RFC 8866** - *SDP: Session Description Protocol*, obsoleta RFC 4566. È la grammatica.
- **RFC 3264** - *An Offer/Answer Model with the Session Description Protocol*. È il modello di negoziazione: un lato propone un insieme di `m=` section con le proprie capacità, l'altro risponde accettando, rifiutando (porta 0) o restringendo.
- **RFC 8839** - *SDP Offer/Answer Procedures for ICE*. Definisce gli attributi ICE in SDP (sintassi verificata):

```
a=candidate:<foundation> <component-id> <transport> <priority> <connection-address> <port> typ <cand-type> [raddr <rel-addr>] [rport <rel-port>]   ; §5.1, media-level
a=ice-ufrag:<ufrag>          ; §5.4, 4*256 ice-char
a=ice-pwd:<password>         ; §5.4, 22*256 ice-char
a=ice-options:<tag> [<tag>]  ; §5.6, session- o media-level
a=ice-lite                   ; §5.3, solo session-level
a=remote-candidates:<component-id> <addr> <port>  ; §5.2
```

- **RFC 8843** - *Negotiating Media Multiplexing Using SDP* (BUNDLE). `a=group:BUNDLE <tag> <tag> ...` (§5); il primo identification-tag è l'**offerer BUNDLE-tag** e la sua `m=` section porta l'indirizzo/porta usati per tutto il gruppo (§2). BUNDLE **richiede** rtcp-mux all'interno del gruppo (§9.3) e comporta **un solo transport ICE e una sola associazione DTLS** per l'intero gruppo (§10–§11). Per Telemedic questo è un fatto architetturale, non un dettaglio: audio, video e data channel condividono **una** porta, **un** handshake DTLS, **una** allocazione TURN. Il dimensionamento del relay (§4.7) si basa su questo.

- **RFC 8842** - *SDP Offer/Answer Considerations for DTLS and DTLS-SRTP*: definisce `a=setup:actpass|active|passive|holdconn` e la semantica del ruolo DTLS client/server. Aggiorna RFC 5763.

### 2.2 Trickle ICE (RFC 8838)

**RFC 8838**, Standards Track, gennaio 2021. Senza trickle, l'offer non può partire finché la raccolta dei candidati non è completa: significa attendere il timeout STUN/TURN più lento, tipicamente centinaia di millisecondi o secondi. Con trickle, l'offer parte subito e i candidati fluiscono dopo.

Regole verificate:

- §9 - dopo aver scoperto un candidato, l'agente verifica la ridondanza e lo invia; il protocollo di trasporto **deve** consegnare i candidati *"exactly once and in the same order it was conveyed"*. **Questo è un requisito diretto sul signaling di Telemedic**: la coda dei candidati deve essere ordinata e affidabile per-sessione. Un fan-out Redis pub/sub naïve non garantisce l'ordine.
- §10 - *"A Trickle ICE agent MUST NOT pair a local candidate until it has been trickled to the remote party"*.
- §13 - indicazione di **end-of-candidates**, che **deve** specificare la generazione (coppia ufrag/pwd). Dopo averla inviata, non si possono inviare altri candidati.
- §16 - **half-trickle**: l'iniziatore raccoglie una generazione completa prima dell'offer iniziale, il rispondente può usare trickle. Fallback per interoperare con agenti non-trickle.
- §3 - la segnalazione della capacità avviene con l'ICE option `trickle` (registrata in §19). L'encoding SDP è delegato ad altri documenti.

Nota onesta: nel browser, `onicecandidate` con `candidate === null` (o `pc.iceGatheringState === "complete"`) è il segnale di fine raccolta. La mappatura verso `a=end-of-candidates` è a carico dell'applicazione.

### 2.3 Glare e *perfect negotiation*

Il **glare** è la collisione di due offer simultanee: entrambi i peer entrano in `have-local-offer` e nessuno dei due può applicare l'offer dell'altro senza rollback.

Il pattern canonico è la **perfect negotiation**, documentato da MDN e fondato su `setLocalDescription()` senza argomenti e sul rollback implicito di `setRemoteDescription()`. Codice verificato:

```javascript
let makingOffer = false;
let ignoreOffer = false;
let isSettingRemoteAnswerPending = false;

pc.onnegotiationneeded = async () => {
  try {
    makingOffer = true;
    await pc.setLocalDescription();              // crea l'SDP appropriato allo stato
    signaler.send({ description: pc.localDescription });
  } catch (err) {
    console.error(err);
  } finally {
    makingOffer = false;
  }
};

pc.onicecandidate = ({ candidate }) => signaler.send({ candidate });

signaler.onmessage = async ({ data: { description, candidate } }) => {
  try {
    if (description) {
      const readyForOffer =
        !makingOffer &&
        (pc.signalingState === "stable" || isSettingRemoteAnswerPending);
      const offerCollision = description.type === "offer" && !readyForOffer;

      ignoreOffer = !polite && offerCollision;
      if (ignoreOffer) return;

      isSettingRemoteAnswerPending = description.type === "answer";
      await pc.setRemoteDescription(description); // rollback implicito se polite
      isSettingRemoteAnswerPending = false;

      if (description.type === "offer") {
        await pc.setLocalDescription();
        signaler.send({ description: pc.localDescription });
      }
    } else if (candidate) {
      try {
        await pc.addIceCandidate(candidate);
      } catch (err) {
        if (!ignoreOffer) throw err;             // candidati di un'offer ignorata
      }
    }
  } catch (err) {
    console.error(err);
  }
};
```

Punti che l'agente frontend deve interiorizzare:

- Il ruolo **polite/impolite** deve essere **assegnato dal server di signaling**, non negoziato dal client. Per Telemedic: assegnare `polite = true` al **paziente** e `polite = false` al **professionista sanitario**. Motivazione clinica: in caso di collisione, l'offer del medico vince e la sessione converge sulla configurazione media voluta da chi conduce il consulto.
- Si usa `setLocalDescription()` **senza argomenti**: è la forma che sceglie automaticamente offer o answer in base a `signalingState` e che abilita il rollback implicito.
- Si testa `makingOffer`, **non** `signalingState`, perché `signalingState` è aggiornato in modo asincrono e la finestra di race esiste davvero.

La rinegoziazione (`negotiationneeded`) si scatena in scenari clinicamente reali: attivazione dello screen sharing per mostrare un referto, sostituzione della traccia video (`RTCRtpSender.replaceTrack()`, che **non** scatena rinegoziazione se il codec è compatibile - via preferibile), aggiunta di un transceiver per un terzo partecipante.

### 2.4 Opzioni di trasporto per il signaling

| Opzione | Riferimento | Valutazione per Telemedic |
|---|---|---|
| **WebSocket** | **RFC 6455**; su HTTP/2 **RFC 8441**; su HTTP/3 **RFC 9220** | Baseline. Full-duplex, basso overhead, attraversa proxy/TLS su 443. |
| **WebSocket + STOMP** | STOMP 1.2 (spec di progetto, non IETF) | Supporto nativo Spring (`@EnableWebSocketMessageBroker`). Aggiunge routing per destinazione e un modello pub/sub. |
| **SockJS** | libreria, non standard | Fallback per reti che bloccano WebSocket. **Impone sticky session** (i trasporti HTTP-based di SockJS sono multi-richiesta). Costo architetturale reale. |
| **SIP over WebSocket** | **RFC 7118** | Sensato solo se serve interop con infrastruttura SIP/VoIP esistente. Per Telemedic aggiunge complessità senza beneficio, salvo requisito di integrazione telefonica. |
| **Matrix / MQTT** | fuori IETF / OASIS MQTT 5.0 | Matrix è sovradimensionato (porta con sé un intero modello di federazione e stanze). MQTT è interessante per bassa banda ma non offre il modello richiesta/risposta necessario alla negoziazione. |

**Raccomandazione**: WebSocket nativo (RFC 6455) con un protocollo applicativo JSON minimale, **senza STOMP e senza SockJS**, per queste ragioni:

1. Il signaling WebRTC è **point-to-point per sessione**, non pub/sub broadcast. Il modello STOMP a destinazioni non aggiunge valore in 1:1 e introduce un broker nel percorso critico.
2. SockJS impone sticky session, che è precisamente il vincolo di scalabilità che si vuole evitare (§2.5).
3. Un protocollo proprio, versionato e documentato con JSON Schema, è validabile ai confini di sistema - requisito di input validation della codebase.

Se la compatibilità con reti aziendali ostili risultasse un problema misurato (non ipotizzato), il fallback corretto non è SockJS ma **WebSocket su HTTP/2 (RFC 8441)** o long-polling *specifico* implementato ad hoc.

### 2.5 Scalabilità del signaling stateful

Il signaling WebRTC è intrinsecamente **stateful**: la "stanza" del consulto è una macchina a stati condivisa tra due connessioni WebSocket che possono atterrare su nodi diversi.

Tre pattern, con onestà sui costi:

**(a) Sticky session (affinità di sessione al load balancer).**
Semplice, ma fragile: il redeploy di un nodo termina tutte le sessioni ospitate; l'autoscaling non ridistribuisce; il draining richiede logica applicativa. Per un consulto medico in corso, la caduta del signaling **non interrompe il media già stabilito** (il flusso DTLS-SRTP prosegue) ma impedisce rinegoziazione, trickle e chiusura ordinata. Accettabile solo con drain graceful lungo.

**(b) Backplane pub/sub (Redis, o broker STOMP).**
Ogni nodo si iscrive al topic della sessione; i messaggi vengono rilanciati. Attenzione al requisito di RFC 8838 §9: **consegna esattamente una volta e nell'ordine**. Redis Pub/Sub è fire-and-forget e non garantisce né l'una né l'altra sotto riconnessione. Redis **Streams** con consumer group per-sessione è la scelta corretta se si sceglie questa via.

**(c) Routing deterministico della sessione (session affinity applicativa).**
Il `sessionId` del consulto determina il nodo proprietario tramite hashing consistente; i client che atterrano su un nodo diverso vengono reindirizzati (o il nodo fa da proxy verso il proprietario). Elimina il backplane dal percorso critico e mantiene la macchina a stati in un unico processo, dove l'ordinamento è banale.

**Raccomandazione**: (c) come architettura target, (a) come implementazione della v1.0 se il tempo stringe, mai (b) con Redis Pub/Sub semplice. La scelta va registrata come ADR.

**Vincolo V1 (sovranità)**: qualunque sia la scelta, il backplane è self-hosted UE. Nessun servizio di signaling gestito.

---

## 3. ICE, STUN, TURN

### 3.1 STUN - RFC 8489

*Session Traversal Utilities for NAT*, obsoleta RFC 5389. Fornisce il meccanismo di **Binding Request/Response** con cui un client scopre l'indirizzo pubblico che il NAT gli ha assegnato, e il meccanismo di autenticazione (short-term e **long-term credential**) riusato da TURN.

Elementi rilevanti: attributo `XOR-MAPPED-ADDRESS`, `MESSAGE-INTEGRITY` (HMAC-SHA1) e `MESSAGE-INTEGRITY-SHA256`, `FINGERPRINT` (CRC-32 con XOR `0x5354554e`), `NONCE` con il meccanismo di *nonce cookie* per la rotazione.

Il `FINGERPRINT` è ciò che rende possibile il **demultiplexing su porta singola** fra STUN, DTLS, SRTP e (storicamente) ZRTP/TURN ChannelData: la disciplina è codificata in **RFC 7983** (*Multiplexing Scheme Updates for SRTP Extension for DTLS*), aggiornato da **RFC 9443**. È il motivo per cui BUNDLE + rtcp-mux funzionano su una sola porta UDP.

### 3.2 ICE - RFC 8445

**Tipi di candidato** (§2.1, §4), definizioni verbatim verificate:

| Tipo | Definizione (RFC 8445) | `typ` in SDP |
|---|---|---|
| **Host** | *"A candidate obtained by binding to a specific port from an IP address on the host."* | `host` |
| **Server-reflexive** | *"A candidate whose IP address and port are a binding allocated by a NAT for an ICE agent after it sends a packet through the NAT to a server, such as a STUN server."* | `srflx` |
| **Peer-reflexive** | *"…after it sends a packet through the NAT to its peer."* | `prflx` |
| **Relayed** | *"A candidate obtained from a relay server, such as a TURN server."* | `relay` |

**Formula della priorità** (§5.1.2.1, verificata):

```
priority = (2^24) * (type preference)
         + (2^8)  * (local preference)
         + (2^0)  * (256 - component ID)
```

- *type preference*: 0–126. Valori raccomandati: **host = 126, peer-reflexive = 110, server-reflexive = 100, relayed = 0**.
- *local preference*: 0–65535, usata per ordinare candidati dello stesso tipo (es. preferire IPv6 su IPv4, o Ethernet su Wi-Fi).
- *component ID*: 1 (RTP) o 2 (RTCP); con rtcp-mux esiste solo la componente 1.

Il *type preference* = 0 per il relay è il fatto architetturale centrale: **ICE usa il relay solo se nient'altro funziona**. Il "fallback relay se il P2P fallisce" dichiarato dal sito non è una funzionalità che Telemedic implementa: è il comportamento nativo di ICE. La feature reale è *fornire credenziali TURN valide*, non "implementare il fallback".

**Foundation** (§4, §5.1.1.3): due candidati condividono la foundation se coincidono tipo, IP base, IP del server STUN/TURN e protocollo di trasporto. La foundation guida il *frozen algorithm*: si sblocca un solo candidato per foundation alla volta, per non saturare la rete di connectivity check.

**Priorità della coppia** (§6.1.2.3, verificata):

```
pair priority = 2^32 * MIN(G,D) + 2 * MAX(G,D) + (G > D ? 1 : 0)
```

con G = priorità del candidato del *controlling agent*, D = quella del *controlled agent*.

**Checklist** (§6.1.2): una per data stream; accoppiamento di tutti i locali con tutti i remoti della stessa componente e famiglia IP; ordinamento decrescente; pruning delle coppie ridondanti; **limite di default a 100 coppie**. Gli indirizzi IPv6 link-local si accoppiano solo con altri link-local.

Stati della coppia (§6.1.2.6): `Frozen`, `Waiting`, `In-Progress`, `Succeeded`, `Failed`. Stati della checklist (§6.1.2.1): `Running`, `Completed`, `Failed`.

**Nomination** (§2.3, §4): RFC 8445 specifica la sola **regular nomination** - il controlling agent invia una STUN request con l'attributo `USE-CANDIDATE`. La **aggressive nomination** di RFC 5245 è **deprecata**. Da segnalare: alcune implementazioni legacy la usano ancora; se in interop si osserva un cambio di coppia selezionata a metà negoziazione, è probabilmente quello.

**Ruoli** (§6.1.1): full/full → l'iniziatore è controlling; full/lite → il full è controlling; lite/lite → l'iniziatore è controlling. La risoluzione dei conflitti di ruolo è in §7.3.1.1 tramite risposte d'errore STUN.

**ICE-lite** (§2.5, §5.2): *"Lite agents only use host candidates and do not generate connectivity checks or run state machines, though they need to be able to respond to connectivity checks."* È il modello tipico di un **SFU con IP pubblico**. **RFC 8835 §3.4 vieta esplicitamente ICE-lite ai browser**: *"The implementation MUST be a full ICE implementation, not ICE-Lite."*

### 3.3 TURN - RFC 8656

Obsoleta RFC 5766 (§24) e RFC 6156 (§25). Struttura verificata:

- **Allocation** (§6, §7): struttura server-side con relayed transport address, 5-tuple, credenziali, timer di scadenza, permessi e channel binding.
- **Permission / CreatePermission** (§9, §10): il permesso restringe **quali IP peer** possono inviare traffico all'allocazione. Durata **5 minuti**, rinnovabile. Il permesso è per IP, **non** per porta.
- **ChannelBind** (§12): lega un numero di canale a un indirizzo peer, abilitando i messaggi **ChannelData** con overhead di soli 4 byte anziché l'header STUN completo. Durata **10 minuti**.
- **Send/Data indication** (§11): la modalità più costosa in banda (header STUN ~36 byte per pacchetto).
- **Trasporto client↔server** (§3.1): UDP, TCP, TLS-over-TCP, DTLS-over-UDP. **Il relay verso il peer resta UDP** in questa specifica.
- **REQUESTED-ADDRESS-FAMILY** (§7.1) e **ADDRESS-ERROR-CODE** (§7.2) per le allocazioni dual-stack, con codici 440 (address family non supportata) e 508 (capacità insufficiente).

Estensioni collegate:

- **RFC 6062** - TURN Extensions for TCP Allocations: permette il relay **verso peer TCP**. In coturn si disabilita con `no-tcp-relay`. Per WebRTC **non serve**: disabilitarlo riduce la superficie d'attacco.
- **RFC 6544** - ICE-TCP: consente candidati ICE su TCP (`tcptype active|passive|so`). Utile dietro firewall che bloccano UDP.
- **RFC 7635** - STUN Extension for Third-Party Authorization: autorizzazione TURN via token OAuth. È **lo standard**, in contrapposizione al de-facto "TURN REST API" (§4.3).

### 3.4 Comportamento dietro NAT simmetrico

Il caso patologico. Con un NAT **endpoint-dependent mapping** (terminologia di RFC 4787; colloquialmente "simmetrico"), la binding esterna dipende dalla destinazione: l'indirizzo `srflx` scoperto interrogando il server STUN **non è** l'indirizzo che il NAT userà per il peer. Il candidato server-reflexive è quindi inutile e il peer-reflexive non si forma.

Se **entrambi** i peer sono dietro NAT endpoint-dependent, **nessuna coppia diretta è valida** e il relay TURN è l'unica strada. RFC 8835 §3.4 lo dice esplicitamente come motivazione dell'obbligo di supportare TURN.

Scenari clinicamente rilevanti in cui questo accade con alta probabilità: reti aziendali/ospedaliere con NAT di carrier-grade a monte, connessioni mobili su **CGNAT** (molto comune sugli operatori italiani), reti Wi-Fi pubbliche.

**Implicazione onesta per il claim "peer-to-peer"**: una quota non trascurabile dei consulti **non sarà** peer-to-peer nel senso topologico. Sarà cifrata end-to-end (§5.5) ma instradata attraverso il TURN. Il materiale di comunicazione deve dire "media cifrato end-to-end, instradato peer-to-peer quando la rete lo consente, altrimenti tramite relay che non ha accesso al contenuto" - e non "peer-to-peer".

**Stima della quota di sessioni relayed**: le cifre di settore comunemente riportate oscillano fra il 5% e il 20% a seconda del mix di reti. **`[non verificato]`** - Telemedic deve misurarla sul proprio traffico tramite `RTCIceCandidatePairStats` (§8.4) e non citare numeri di terzi.

### 3.5 mDNS candidate obfuscation

Per impedire alle pagine web di raccogliere gli indirizzi IP privati degli utenti (un vettore di fingerprinting reale), i browser sostituiscono l'IP dei candidati **host** con un nome `<UUIDv4>.local` registrato via mDNS.

Fonte: `draft-ietf-mmusic-mdns-ice-candidates`. **Stato verificato: Internet-Draft SCADUTO** (pubblicato 5 dicembre 2021, scaduto 8 giugno 2022), **mai pubblicato come RFC**. È un caso in cui il comportamento è universale nei browser ma il documento non è normativo - va detto con precisione nella documentazione di Telemedic.

Procedura (dal draft): generare un nome unico che *"MUST consist of a version 4 UUID as defined in RFC4122, followed by '.local'"*, registrarlo via mDNS (tipicamente saltando il probing), memorizzare il mapping, sostituire l'IP nel candidato.

**Impatto sulla connettività**, citato dal draft: quando la risoluzione mDNS fallisce, *"ICE will attempt to fall back to either NAT hairpin, if supported, or TURN relay if not. This may result in reduced connectivity, reduced throughput and increased latency."* I test riportati indicano un calo relativo del **2%** del tasso di connessione e un degrado del **3%** nell'interazione con endpoint legacy. **`[cifre dal draft, non validate indipendentemente]`**

**Conseguenze concrete per Telemedic:**

1. **Il consulto "in corsia"** - medico e paziente sulla stessa LAN ospedaliera - è lo scenario più penalizzato: senza risoluzione mDNS non si forma la coppia host-host, e si finisce sul relay per una connessione che poteva restare su switch locale. mDNS su UDP 5353 multicast è spesso **bloccato dagli AP Wi-Fi enterprise** (client isolation).
2. **Il logging lato server dei candidati** vedrà nomi `.local` e non IP. Qualunque analitica di rete basata sui candidati host è inutile. Le metriche vanno prese da `getStats()` lato client (§8), non dai candidati nel SDP.
3. **Effetto collaterale positivo sulla privacy**: gli indirizzi IP privati dei dispositivi clinici non finiscono nei log del server di signaling. Questo va **valorizzato** nella DPIA: riduce la quantità di dati personali trattati.

### 3.6 Consumo di banda del relay e dimensionamento

Il calcolo va fatto con attenzione, perché è l'errore di dimensionamento più comune.

Per una sessione 1:1 con **una sola** allocazione relay (cioè un peer usa un candidato `relay` e l'altro un `srflx`/`host`), con bitrate `B` per direzione:

- flusso A→B: il TURN **riceve** B e **trasmette** B;
- flusso B→A: il TURN **riceve** B e **trasmette** B.

Quindi il server movimenta **2B in ingresso + 2B in uscita = 4B totali**. Se **entrambi** i peer usano candidati relay (coppia relay-relay, possibile con due NAT ostili e due allocazioni sullo stesso server), il traffico **raddoppia ancora**, a 8B.

Con un video 720p30 a ~1.5 Mbit/s per direzione più audio Opus a ~40 kbit/s, e un overhead del **~10%** per header IP/UDP, ChannelData e STUN keepalive **`[ordine di grandezza]`**:

| Scenario | Per sessione, aggregato sul TURN |
|---|---|
| 720p30, una allocazione relay | ~6.8 Mbit/s |
| 720p30, coppia relay-relay | ~13.6 Mbit/s |
| 1080p30 (~3 Mbit/s/dir), una allocazione | ~13.5 Mbit/s |
| Solo audio (Opus 40 kbit/s) | ~0.18 Mbit/s |

Dimensionamento derivato **`[ordine di grandezza]`**:

- **100 sessioni 720p concorrenti tutte relayed** ≈ 680 Mbit/s aggregati → **una NIC 1 GbE è al limite**; serve 10 GbE o più nodi.
- Se solo il 15% delle sessioni è relayed, 100 sessioni concorrenti ≈ 100 Mbit/s. Molto più gestibile - ma il picco va dimensionato sul caso avverso, non sulla media.
- **Range di porte relay**: default coturn 49152–65535, cioè **16 384 porte**. Con BUNDLE + rtcp-mux, una porta per allocazione: il limite teorico è ~16k allocazioni per IP di relay. Non è il collo di bottiglia; la banda lo è.

**CPU**: coturn nel percorso dati esegue essenzialmente parsing dell'header STUN/ChannelData e `sendto()`. È **I/O-bound, non CPU-bound**, salvo TURN over TLS dove si aggiunge la cifratura del tunnel (che è *aggiuntiva* rispetto a DTLS-SRTP: doppia cifratura). L'opzione `relay-threads` va tarata sul numero di core. Numeri specifici di throughput per core: **`[non verificato]` - richiede load test proprio (D10 prevede k6/Gatling; questo è un caso d'uso per un test dedicato al piano media, che k6 non copre nativamente).**

---

## 4. coturn in produzione

> Tutti i nomi di opzione in questa sezione sono stati **verificati sulla man page `turnserver.1` del repository upstream** o sul file `examples/etc/turnserver.conf`. Le opzioni non trovate sono marcate come tali.

### 4.1 Versioni e postura di aggiornamento

La versione **4.7.0** è di maggio 2025; il progetto ha successivamente accelerato la cadenza di rilascio con una serie di minor release nel 2026. **`[la versione esatta più recente va verificata al momento del deploy: la ricerca web ha restituito indicazioni non pienamente coerenti fra fonti secondarie e non è stato possibile interrogare direttamente le release GitHub]`**.

**Regola operativa per Telemedic**: coturn è un servizio esposto a Internet senza autenticazione preventiva sulla porta 3478. Deve essere in un **canale di patching tracciato** (Renovate/Dependabot sull'immagine Docker + monitoraggio del feed advisory upstream) con SLA di aggiornamento definito nel piano di Post-Market Surveillance MDR (D6).

### 4.2 Autenticazione: long-term credential vs credenziali effimere

**Long-term credential mechanism** (`lt-cred-mech`): username e password statici in database (`userdb`, `redis-userdb`, o `--user`). Descrizione man page: *"Use long-term credentials mechanism (this one you need for WebRTC usage)."*

Problema strutturale: le credenziali TURN **devono essere consegnate al browser**, quindi al client, quindi all'utente. Una credenziale statica è, per costruzione, **pubblica**. Chiunque apra il DevTools la legge e la riusa per far transitare traffico arbitrario dal TURN di Telemedic. Con costi di egress a carico dell'operatore e la responsabilità legale del traffico relayed.

**Credenziali effimere ("TURN REST API")**. Testo verbatim dalla man page/config coturn:

> *"TURN REST API flag. (Time Limited Long Term Credential) Flag that sets a special authorization option that is based upon authentication secret. This feature's purpose is to support 'TURN Server REST API'... This option is used with timestamp: usercombo -> 'timestamp:userid' turn user -> usercombo turn password -> base64(hmac(secret key, usercombo))"*

Formato verificato:

- `username` = `<unix-timestamp-di-scadenza>:<userid>`
- `password` = `base64(HMAC-SHA1(static-auth-secret, username))`

**Onestà normativa**: questo meccanismo **non è uno standard IETF**. Deriva da `draft-uberti-behave-turn-rest-00`, un Internet-Draft individuale scaduto. Lo standard vero è **RFC 7635** (autorizzazione di terza parte via token). Il "TURN REST API" è però l'unico meccanismo con supporto universale nei browser e in coturn, quindi è la scelta corretta - ma va documentato per quello che è: **una convenzione de-facto**, non uno standard.

Implementazione lato Spring Boot (Java 21):

```java
package dev.telemedic.media.turn;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Base64;
import java.util.List;

/** Credenziale TURN effimera secondo la convenzione "TURN REST API" di coturn. */
public record TurnCredential(String username, String credential, long ttlSeconds, List<String> urls) {

    private static final String HMAC_ALGORITHM = "HmacSHA1";

    /**
     * @param staticAuthSecret segreto condiviso con coturn (static-auth-secret).
     *                         DEVE provenire da un secret manager, mai dal sorgente.
     * @param subject          identificatore opaco della sessione (NON un identificativo
     *                         del paziente: finisce in chiaro nei log di coturn).
     * @param ttlSeconds       validità; raccomandato 300–3600 s.
     */
    public static TurnCredential issue(byte[] staticAuthSecret,
                                       String subject,
                                       long ttlSeconds,
                                       List<String> urls) {
        if (staticAuthSecret == null || staticAuthSecret.length == 0) {
            throw new IllegalArgumentException("TURN static auth secret non configurato");
        }
        if (subject == null || subject.isBlank() || subject.indexOf(':') >= 0) {
            throw new IllegalArgumentException("subject TURN non valido");
        }
        if (ttlSeconds <= 0 || ttlSeconds > 3600) {
            throw new IllegalArgumentException("ttlSeconds fuori range consentito");
        }

        final long expiry = Instant.now().getEpochSecond() + ttlSeconds;
        final String username = expiry + ":" + subject;

        try {
            final Mac mac = Mac.getInstance(HMAC_ALGORITHM);
            mac.init(new SecretKeySpec(staticAuthSecret, HMAC_ALGORITHM));
            final String credential = Base64.getEncoder()
                    .encodeToString(mac.doFinal(username.getBytes(StandardCharsets.UTF_8)));
            return new TurnCredential(username, credential, ttlSeconds, List.copyOf(urls));
        } catch (java.security.GeneralSecurityException e) {
            throw new IllegalStateException("Impossibile generare la credenziale TURN", e);
        }
    }
}
```

Note critiche su questo codice, da riportare nella documentazione di sicurezza:

- **HMAC-SHA1 non è negoziabile**: coturn calcola SHA-1 perché la long-term credential di STUN (RFC 8489 §9.2) usa MD5 sulla `key` e HMAC-SHA1 sul `MESSAGE-INTEGRITY`. Non è una scelta di Telemedic. Va **dichiarato esplicitamente** in ogni documento che parla di cipher suite, perché contraddice qualunque narrativa di "solo algoritmi moderni". Non è una vulnerabilità (HMAC-SHA1 resta robusto anche con SHA-1 collision-broken), ma è un fatto.
- Il `subject` finisce nei log di coturn in chiaro. **Non deve essere un identificativo del paziente né del professionista**: usare un identificativo opaco della sessione, non correlabile senza accesso al database di Telemedic. Requisito di minimizzazione GDPR.
- L'endpoint che emette la credenziale **deve** essere autenticato (JWT Keycloak), **deve** verificare che il richiedente sia parte del consulto, e **deve** essere rate-limited. Altrimenti è un distributore automatico di accessi al relay.

### 4.3 Configurazione di riferimento

```ini
# /etc/turnserver.conf - Telemedic, profilo produzione
# Tutte le direttive sono verificate sulla man page turnserver(1) upstream.

# ---------------------------------------------------------------------------
# Listener
# ---------------------------------------------------------------------------
listening-port=3478
tls-listening-port=5349
listening-ip=0.0.0.0
# Indirizzo locale usato per inoltrare i pacchetti verso il peer.
relay-ip=10.0.10.20
# Mappatura indirizzo privato -> pubblico quando il server è dietro NAT
# (cloud provider con IP elastico, Docker con port mapping).
# Sintassi: external-ip=<pubblico>/<privato>
external-ip=203.0.113.10/10.0.10.20

# Range delle porte di relay. 16384 porte: sovrabbondante per 1:1 con BUNDLE.
min-port=49152
max-port=65535

# ---------------------------------------------------------------------------
# Autenticazione - credenziali effimere HMAC (nessun utente statico)
# ---------------------------------------------------------------------------
realm=turn.telemedic.example
use-auth-secret
static-auth-secret=${TURN_STATIC_AUTH_SECRET}   # iniettato da secret manager
# Nonce a vita limitata: mitiga il replay delle credenziali intercettate.
stale-nonce=600
# Richiede autenticazione anche sulle Binding request (usi STUN).
# ATTENZIONE: verificare l'impatto sui client, che si aspettano STUN anonimo.
# secure-stun
fingerprint

# ---------------------------------------------------------------------------
# TLS
# ---------------------------------------------------------------------------
cert=/etc/coturn/certs/fullchain.pem
pkey=/etc/coturn/certs/privkey.pem
cipher-list="ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384"

# ---------------------------------------------------------------------------
# HARDENING DEL RELAY - la parte che conta davvero (vedi 4.5)
# ---------------------------------------------------------------------------
# Default-deny: si vieta tutto, poi si permette solo l'instradamento pubblico.
denied-peer-ip=0.0.0.0-0.255.255.255
denied-peer-ip=10.0.0.0-10.255.255.255
denied-peer-ip=100.64.0.0-100.127.255.255
denied-peer-ip=127.0.0.0-127.255.255.255
denied-peer-ip=169.254.0.0-169.254.255.255
denied-peer-ip=172.16.0.0-172.31.255.255
denied-peer-ip=192.0.0.0-192.0.0.255
denied-peer-ip=192.0.2.0-192.0.2.255
denied-peer-ip=192.88.99.0-192.88.99.255
denied-peer-ip=192.168.0.0-192.168.255.255
denied-peer-ip=198.18.0.0-198.19.255.255
denied-peer-ip=198.51.100.0-198.51.100.255
denied-peer-ip=203.0.113.0-203.0.113.255
denied-peer-ip=240.0.0.0-255.255.255.255
denied-peer-ip=::1
denied-peer-ip=::
denied-peer-ip=fc00::-fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
denied-peer-ip=fe80::-febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff
denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255   # forma IPv4-mapped

no-multicast-peers
# Nessun relay verso peer TCP (RFC 6062): WebRTC non ne ha bisogno.
no-tcp-relay

# ---------------------------------------------------------------------------
# Quote e limiti
# ---------------------------------------------------------------------------
user-quota=6            # allocazioni concorrenti per credenziale
total-quota=1200        # allocazioni concorrenti totali sul nodo
max-bps=2000000         # ~2 Mbit/s per sessione TURN
bps-capacity=800000000  # capacità aggregata dichiarata al nodo
max-allocate-lifetime=3600
channel-lifetime=600
permission-lifetime=300

# ---------------------------------------------------------------------------
# Osservabilità
# ---------------------------------------------------------------------------
prometheus
prometheus-port=9641

# ---------------------------------------------------------------------------
# Processo
# ---------------------------------------------------------------------------
proc-user=turnserver
proc-group=turnserver
syslog
# CLI di amministrazione disabilitata o protetta: espone stato e controlli.
cli-password=${TURN_CLI_PASSWORD}
```

**Direttive che il mandato citava ma che NON sono state trovate nella man page upstream** e che quindi vanno considerate **`[non verificate]`** finché non si controlla la versione esattamente in uso: `no-loopback-peers` (sostituita da `allow-loopback-peers`, che è il flag *permissivo*), `no-rfc5780`, `no-stun-backward-compatibility`, `response-origin-only-with-rfc5780`, `no-tlsv1`, `no-tlsv1_1`, `dh2066`, `no-cli`, `no-udp`, `no-software-attribute`, `unauthorized-ratelimit`, `keep-address-family` (presente in forma deprecata). **Nessuna di queste va scritta in documentazione pubblica senza verifica su `turnserver --help` della versione deployata.**

### 4.4 `external-ip` dietro NAT: la trappola operativa

Se coturn gira in Docker con port mapping, o su un'istanza cloud con IP elastico, il server vede solo l'indirizzo privato e annuncerebbe candidati relay inutilizzabili. `external-ip=<pubblico>/<privato>` risolve la mappatura.

Due errori ricorrenti:

1. **Port mapping del range relay.** Il range 49152–65535 **non può** essere mappato porta per porta in Docker (16 384 regole iptables: il container non parte, o parte in minuti). L'unica configurazione sana è `network_mode: host`. Va scritto nel Docker Compose di riferimento con un commento che spieghi perché.
2. **Un solo `external-ip` con più IP pubblici.** Con dual-stack o multi-homing servono più direttive `external-ip`.

### 4.5 La vulnerabilità che conta: relay verso loopback e reti interne

Questo è il rischio di sicurezza **più grave e più sottovalutato** dell'intera architettura.

**Il meccanismo dell'attacco.** Un TURN server è, per definizione, *un proxy UDP autenticato che inoltra byte arbitrari verso un indirizzo scelto dal client*. Se non si restringono le destinazioni, chiunque ottenga una credenziale TURN valida - e in Telemedic la ottiene **ogni paziente autenticato**, per progetto - può:

- raggiungere `127.0.0.1` sul TURN server stesso e parlare con servizi che si credevano non esposti;
- scansionare la rete interna dell'operatore (10.0.0.0/8, 192.168.0.0/16);
- raggiungere gli **endpoint di metadata dei provider cloud** (169.254.169.254), classica escalation verso credenziali IAM;
- usare l'infrastruttura come punto di rimbalzo per attacchi verso terzi, con l'IP di Telemedic in testa ai log della vittima.

È **SSRF a livello di trasporto**, non applicativo.

**Precedenti reali verificati:**

- **CVE-2020-26262** - inviando una richiesta CONNECT con `XOR-PEER-ADDRESS` pari a `0.0.0.0`, coturn rispondeva con successo e relayava verso l'interfaccia di loopback. Affette le versioni fino a 4.5.1.3, corretto in 4.5.2.
- Bypass tramite **indirizzi IPv4-mapped IPv6**: inviando `::ffff:127.0.0.1` in una `CreatePermission` o `ChannelBind`, il controllo `denied-peer-ip` su `127.0.0.0/8` veniva aggirato per insufficiente canonicalizzazione. Fonti secondarie riportano CVE del 2026 su questo tema con versioni corrette specifiche. **`[i numeri di CVE e le versioni esatte riportati dalle fonti secondarie non sono stati confermati su NVD/GitHub Security Advisories in questa ricerca - la ricerca deve essere ripetuta prima di citarli in documentazione pubblica]`**. **Il pattern d'attacco, però, è confermato e va mitigato a prescindere dal numero di CVE.**

**Cosa dice RFC 8656.** La §21 tratta la sicurezza, ma il documento **non impone** restrizioni esplicite sul relay verso loopback o reti RFC 1918. §7.2 si limita a dire che *"the TURN server application knows, through some means not specified here, that other applications running on the same host as the TURN server application will not be impacted by allocating ports"*. §21.2.2 menziona gli indirizzi in blacklist come considerazione di firewall, delegando all'operatore. **La difesa è responsabilità dell'operatore, non del protocollo.**

**Difesa a più strati, non negoziabile per Telemedic:**

1. **Configurazione**: `denied-peer-ip` in default-deny come nella §4.3, **includendo esplicitamente le forme IPv4-mapped** `::ffff:x.x.x.x`, e `no-multicast-peers`.
2. **Isolamento di rete**: il TURN server va in una **DMZ senza alcuna rotta verso la rete interna**. Security group / netfilter in uscita: consentito solo il traffico UDP verso Internet pubblico; negato tutto il resto, incluso il traffico verso se stesso. Questa è la difesa che regge anche se coturn ha un bug di parsing.
3. **Nessun servizio co-locato**: il nodo TURN non ospita altro. Nessun database, nessun agente di gestione in ascolto su loopback, nessun endpoint di metadata raggiungibile (su cloud: IMDSv2 obbligatorio o metadata disabilitato).
4. **Utente non privilegiato**: `proc-user`/`proc-group`.
5. **Verifica attiva in CI/CD**: un test di sicurezza che, con una credenziale valida, tenta `CreatePermission` verso `127.0.0.1`, `::ffff:127.0.0.1`, `169.254.169.254`, `10.0.0.1` e **fallisce la build se una qualunque riceve risposta di successo**. Questo test appartiene alla suite DAST prevista da D10 ed è tracciabile come misura di controllo del rischio ISO 14971.
6. **Monitoraggio**: alert su allocazioni verso destinazioni anomale e su picchi di traffico per credenziale.

### 4.6 Alta disponibilità e clustering

coturn **non ha un clustering nativo con stato condiviso**. Un'allocazione TURN vive in un singolo processo su un singolo nodo; se il nodo cade, l'allocazione muore e ICE deve ricominciare (ICE restart).

I pattern praticabili:

- **DNS round-robin / più `urls` TURN nella `RTCConfiguration`.** Il client riceve più URL; ICE alloca su più server in parallelo e sceglie la coppia migliore. È il pattern più semplice e il più efficace: **la ridondanza la fa ICE, non il TURN**. Costo: più allocazioni, quindi più consumo. Mitigabile con `user-quota`.
- **Anycast**: sconsigliato per UDP con stato. Un cambio di rotta BGP sposta i pacchetti su un nodo che non ha l'allocazione.
- **Load balancer L4**: richiede affinità per 5-tupla e non aiuta sul failover (lo stato resta perso).
- **Database condiviso** (`redis-userdb`, `redis-statsdb`): condivide *credenziali e statistiche*, **non le allocazioni**. Con `use-auth-secret` + `static-auth-secret` il database utenti non serve affatto: tutti i nodi validano l'HMAC con lo stesso segreto, in modo stateless. **Questa è la configurazione da preferire**: nessuno stato condiviso, scalabilità orizzontale banale.

**Raccomandazione**: N nodi coturn indipendenti, stessa `realm`, stesso `static-auth-secret`, tutti annunciati al client nella lista `iceServers`. Nessun cluster. Il failover lo fa ICE.

### 4.7 Osservabilità

`prometheus` + `prometheus-port=9641` (default verificato) espongono metriche in formato Prometheus. **`[l'elenco esatto delle metriche esposte non è stato verificato in questa ricerca; va estratto dall'endpoint della versione deployata prima di scrivere le dashboard]`**.

Le metriche che servono a Telemedic, indipendentemente dai nomi esatti: allocazioni attive, allocazioni per unità di tempo, byte relayed in/out, errori di autenticazione, allocazioni rifiutate per quota, permessi negati (segnale d'attacco: un picco di `CreatePermission` respinte è un tentativo di scansione interna).

Queste alimentano TimescaleDB accanto alle metriche di qualità lato client (§8), ma con una distinzione da mantenere netta nella modellazione dati: **le metriche TURN sono infrastrutturali (nessun dato personale), le metriche `getStats()` sono associate a una sessione clinica** e ricadono nel perimetro GDPR e nell'audit trail (V5).

---

## 5. Sicurezza del media

### 5.1 La pila

| Livello | Standard | Ruolo |
|---|---|---|
| Handshake | **DTLS 1.2 (RFC 6347)** / **DTLS 1.3 (RFC 9147)** | Autentica i peer, deriva il segreto master |
| Estrazione chiavi | **DTLS-SRTP (RFC 5764)** | Estrae il keying material SRTP dal segreto DTLS |
| Protezione media | **SRTP (RFC 3711)** + **AES-GCM (RFC 7714)** | Cifra e autentica RTP/RTCP |
| Binding dell'identità | **RFC 8122** (`a=fingerprint`), **RFC 8842** (`a=setup`) | Lega il certificato DTLS alla sessione segnalata |
| Requisiti | **RFC 8827 §6.5** | *"All media channels MUST be secured via SRTP and SRTCP"* |

**RFC 8834** è categorico sul profilo: *"WebRTC endpoints MUST NOT send packets using the basic RTP/AVP profile or the RTP/AVPF profile; they MUST employ the full RTP/SAVPF profile to protect all RTP and RTCP packets that are generated."* Non esiste WebRTC in chiaro.

**RFC 8827 §6.5** impone il supporto di **DTLS 1.2 con `TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256`** come minimo.

### 5.2 Come DTLS-SRTP deriva le chiavi

**RFC 5764 §4.1** definisce l'estensione TLS **`use_srtp`**, con cui i peer negoziano l'uso di SRTP e la lista dei protection profile; §4.1.1 ne specifica la struttura dati (profili + valore MKI).

**RFC 5764 §4.2**: il keying material si estrae dal master secret DTLS con l'exporter TLS usando l'etichetta **`"EXTRACTOR-dtls_srtp"`**. Ne derivano master key e master salt separate per client e server, che entrano nella KDF standard di SRTP (RFC 3711 §4.3).

**Protection profile registrati** (valori verificati):

| Profilo | Valore | Origine |
|---|---|---|
| `SRTP_AES128_CM_HMAC_SHA1_80` | `{0x00, 0x01}` | RFC 5764 §4.1.2 |
| `SRTP_AES128_CM_HMAC_SHA1_32` | `{0x00, 0x02}` | RFC 5764 §4.1.2 |
| `SRTP_NULL_HMAC_SHA1_80` | `{0x00, 0x05}` | RFC 5764 §4.1.2 |
| `SRTP_NULL_HMAC_SHA1_32` | `{0x00, 0x06}` | RFC 5764 §4.1.2 |
| `SRTP_AEAD_AES_128_GCM` | `{0x00, 0x07}` | RFC 7714 §14.2 |
| `SRTP_AEAD_AES_256_GCM` | `{0x00, 0x08}` | RFC 7714 §14.2 |

Due osservazioni doverose:

- I profili **`SRTP_NULL_*` non cifrano**: autenticano soltanto. Un endpoint che li negozia trasmette media in chiaro. Devono essere **rifiutati** e la loro assenza va **verificata a runtime** leggendo `RTCTransportStats.srtpCipher` (§8.5). Un test automatico che fallisce se `srtpCipher` contiene `NULL` è un controllo di rischio ISO 14971 concreto e a costo zero.
- **AES-GCM (RFC 7714) va preferito ad AES-CM+HMAC-SHA1**: è AEAD, ha tag a 16 ottetti, ed elimina SHA-1 dal percorso media. La preferenza si esprime tramite la configurazione della libreria, non tramite l'API W3C - nel browser non è direttamente controllabile, ma è **osservabile** via `srtpCipher`.

**DTLS 1.3 (RFC 9147, aprile 2022)**: le fonti indicano che gli ecosistemi Firefox (NSS) e Chromium (BoringSSL) hanno introdotto DTLS 1.3 e che il default di libwebrtc sarebbe cambiato **`[versioni e date non confermate su fonte primaria in questa ricerca]`**. Telemedic deve **misurare** la versione effettivamente negoziata via `RTCTransportStats.tlsVersion` invece di dichiararla.

### 5.3 Fingerprint e catena di fiducia - RFC 8122

**RFC 8122** (obsoleta RFC 4572) definisce l'attributo SDP che lega il certificato DTLS alla sessione. Sintassi verificata (§5):

```
fingerprint-attribute = "fingerprint" ":" hash-func SP fingerprint
hash-func             = "sha-1" / "sha-224" / "sha-256" / "sha-384" / "sha-512" /
                        "md5" / "md2" / token
fingerprint           = 2UHEX *(":" 2UHEX)
```

`md2` e `md5` sono deprecati e **MUST NOT** essere usati. RFC 8122 innalza la funzione preferita da SHA-1 a **SHA-256**.

**Il meccanismo.** Il peer A inserisce nell'SDP `a=fingerprint:sha-256 <hash del proprio certificato>`. Il peer B, completato l'handshake DTLS, calcola l'hash del certificato ricevuto e lo confronta con quello segnalato. Se coincidono, B ha la certezza che il DTLS è stato negoziato **con l'entità che ha prodotto quell'SDP**. Il certificato è self-signed: non esiste PKI, non esiste CA, non esiste revoca.

**La fragilità, dichiarata dalla specifica.** RFC 8122 §7: *"It is the responsibility of the encapsulating protocol to ensure the integrity of the SDP security descriptions"*, e la specifica precisa che senza protezione dell'integrità dell'SDP il meccanismo è equivalente a SSH - vulnerabile a un MITM al primo contatto.

RFC 8827 §9.1 è ancora più esplicito: *"Even if HTTPS is used, the signaling server can potentially mount a man-in-the-middle attack unless implementations have some mechanism for independently verifying keys."*

**Traduzione senza giri di parole**: *il server di signaling di Telemedic può, se compromesso o malevolo, sostituire i fingerprint nei due SDP e inserirsi come man-in-the-middle sul media, senza che né il medico né il paziente se ne accorgano.* TLS fra client e server non lo impedisce: protegge il canale **verso** il server, non **dal** server.

**Le contromisure esistenti:**

1. **RFC 8827 §7 - Identity Provider.** WebRTC definisce l'attributo SDP `a=identity` che porta un'asserzione firmata da un IdP terzo, legata crittograficamente al fingerprint (§7.4). Il browser verifica l'asserzione **fuori dal controllo del servizio di chiamata**. **`[il supporto browser dell'API IdP è stato storicamente scarso e in parte rimosso - va verificato prima di progettarci sopra]`**.
2. **Short Authentication String (SAS) fuori banda.** Derivare dalle due fingerprint una stringa breve (o un pattern visivo) mostrata a entrambi i lati, che i partecipanti confrontano **a voce**. È il modello ZRTP. Per una televisita è **particolarmente adatto**: i due partecipanti sono già in comunicazione audio-video e possono leggersi quattro parole. Costo di implementazione basso, guadagno di sicurezza reale e dimostrabile.
3. **Fingerprint pinning per il professionista.** Se il certificato del lato clinico è persistente (via `RTCPeerConnection.generateCertificate()` con chiave conservata in `IndexedDB`), può essere registrato lato server e verificato dal client paziente in modo indipendente. Attenua ma non elimina il problema (il server resta nella catena).

**Raccomandazione forte**: implementare (2). È l'unica contromisura che rende il claim di end-to-end *verificabile dall'utente* invece che *asserito dall'operatore*. Va progettata con l'agente accessibilità: la SAS deve essere leggibile da screen reader e non basata solo sul colore (WCAG 1.4.1).

### 5.4 Rekeying e "key rotation per sessione"

Il sito dichiara **"key rotation per sessione"**. Analizziamo cosa è vero.

**Vero**: ogni `RTCPeerConnection` esegue un handshake DTLS proprio, con certificati effimeri generati per l'istanza. Chiavi SRTP diverse a ogni sessione, senza riuso. In questo senso la rotazione *per sessione* è un fatto del protocollo, non una feature implementata da Telemedic.

**Non vero / da verificare**: la rotazione **durante** la sessione.

- La **rinegoziazione DTLS 1.2** (renegotiation) **non è supportata** nelle implementazioni WebRTC browser. **`[da verificare su fonte primaria; è la conoscenza corrente ed è coerente con l'assenza di API relative]`**.
- **DTLS 1.3 (RFC 9147)** introduce il messaggio **`KeyUpdate`** per l'aggiornamento delle chiavi di record. Tuttavia il keying material SRTP è **estratto una volta** dall'exporter (RFC 5764 §4.2): non è specificato che un `KeyUpdate` DTLS 1.3 rideriva le chiavi SRTP. **`[il comportamento esatto in presenza di DTLS 1.3 + use_srtp non è stato verificato ed è oggetto di lavoro IETF in corso]`**.
- **L'ICE restart NON rifà l'handshake DTLS.** Cambia il percorso di rete, non le chiavi. Confondere i due è un errore ricorrente.
- **RFC 3711 §9.2** stabilisce limiti di vita della master key legati al numero di pacchetti protetti (per AES-CM l'ordine di grandezza è 2^48 pacchetti SRTP / 2^31 SRTCP). Un consulto medico non si avvicina lontanamente a questi limiti: **il rekeying intra-sessione non è necessario per ragioni crittografiche.**

**Formulazione onesta da adottare**: *"Ogni sessione utilizza materiale crittografico generato ex novo tramite handshake DTLS, con certificati effimeri per connessione. Non avviene riutilizzo di chiavi fra sessioni."* Evitare "key rotation", che suggerisce una rotazione periodica intra-sessione che WebRTC non offre.

### 5.5 Il modello di minaccia, con precisione

Questa è la sezione che gli agenti di sicurezza e di marketing tecnico devono leggere per intero.

**Caso A - P2P diretto (coppia host/srflx).**
Il media viaggia direttamente. Le chiavi SRTP esistono solo nei due browser. **Nessun terzo può decifrare.** L'affermazione "end-to-end encrypted" è corretta, **condizionata all'integrità del signaling** (§5.3).

**Caso B - Attraverso il relay TURN.**
Questo è il punto su cui c'è più confusione, quindi va detto con chiarezza:

> **Il TURN server inoltra il payload UDP senza interpretarlo. Non partecipa all'handshake DTLS, non possiede il materiale di chiave, non può decifrare SRTP.** Il TURN vede: gli indirizzi IP dei due peer, il volume e la temporizzazione dei pacchetti, la dimensione dei pacchetti, la durata della sessione. **Non vede** audio, video, né dati del data channel.

Quindi: **passare dal TURN NON rompe l'end-to-end encryption.** Il claim del sito ("nessuna decifratura intermedia") è **corretto** anche in modalità relay.

Ma il TURN vede **metadati**, e i metadati di una televisita sono dati personali ai sensi del GDPR: chi ha parlato con chi, quando, per quanto, da quale indirizzo IP (quindi approssimativamente da dove). In un contesto sanitario, il solo fatto che un paziente abbia avuto un consulto con uno specialista di una determinata clinica **è già un dato relativo alla salute**. Il TURN va trattato come sistema che tratta dati personali: logging minimizzato, retention breve, registro dei trattamenti, e - vincolo V1 - **collocazione UE**.

**Caso C - Attraverso un SFU.**
Un SFU **termina DTLS-SRTP**. Esegue un handshake con ciascun partecipante, decifra i pacchetti in arrivo, li ricifra con le chiavi della sessione uscente. **Ha accesso al media in chiaro.** Qualunque architettura che introduca un SFU **distrugge** la proprietà end-to-end, a meno di aggiungere un livello di cifratura *sopra* SRTP (§5.6).

**Caso D - Endpoint compromesso.**
Fuori dalla portata di qualunque protocollo. Il browser ha il media in chiaro per definizione (deve renderizzarlo). Un'estensione malevola, un keylogger o uno screen recorder sul dispositivo vanificano tutto. Va scritto nella threat model STRIDE prevista da D10, non nascosto.

**Caso E - Signaling compromesso.**
MITM come da §5.3. **È il rischio residuo più alto dell'intera architettura** ed è quello con la mitigazione più economica (SAS).

### 5.6 Cifratura oltre l'hop: SFrame e Double SRTP

Se un giorno Telemedic introducesse un SFU (§6), l'end-to-end si recupera solo con un livello aggiuntivo.

**RFC 9605 - Secure Frame (SFrame)**, verificato: *"Lightweight Authenticated Encryption for Real-Time Media"*, **Standards Track, agosto 2024**, dal WG `sframe`. Fornisce *"end-to-end encryption and authentication mechanism for media frames in a multiparty conference call"* dove i server media centrali possono accedere ai metadati ma non al contenuto. È **indipendente da RTP** e opera su **frame media interi**, il che lo rende più efficiente in banda di una cifratura per-pacchetto.

- **Cipher suite** (§4.5): cinque suite - AES-CTR con HMAC-SHA256 (tag 80, 64, 32 bit) e AES-GCM con SHA256/SHA512 (tag pieni a 128 bit). La costruzione AES-CTR è in §4.5.1.
- **Header** (§4.3): header a lunghezza variabile con **KID** (key identifier) e **CTR** (contatore per il nonce).
- **Cifratura/decifratura** (§4.4.3, §4.4.4): AEAD con header SFrame + metadati opzionali come associated data.
- **Gestione delle chiavi** (§5): SFrame **non definisce lo scambio delle chiavi**. Due modelli: *Sender Keys* (§5.1) e derivazione da **MLS** (§5.2) via HKDF exporter. *"Applications bear responsibility for provisioning keys and managing rotation."*
- **Compatibilità SFU** (§6.1): riuso degli stream RTP (§6.1.1) con verifica del mittente tramite il KID autenticato; simulcast e SVC (§6.1.2–6.1.3) con chiave separata per layer; timing dei keyframe alla rotazione delle chiavi (§6.2).

**L'API browser** è definita da **WebRTC Encoded Transform** (W3C Working Draft; verificato: la versione consultata è datata **25 giugno 2026**), erede formalizzato di quello che si chiamava "Insertable Streams". Definisce `RTCRtpScriptTransform` (worker-based), `RTCEncodedVideoFrame`/`RTCEncodedAudioFrame`, `RTCRtpScriptTransformer`, e **trasformazioni SFrame native basate sulle cipher suite di RFC 9605**.

```javascript
// main thread
const worker = new Worker('transform.js');
const transform = new RTCRtpScriptTransform(worker);
sender.transform = transform;

// transform.js (worker)
self.onrtctransform = (event) => {
  const { readable, writable } = event.transformer;
  readable.pipeTo(writable);   // passthrough; qui andrebbe la cifratura
};
```

**Il punto onesto**: la specifica *"explicitly provides no key management functionality"*. Il problema difficile dell'E2EE non è cifrare i frame - è **distribuire e ruotare le chiavi senza fidarsi del server**. Chi dice "abbiamo l'E2EE perché usiamo Insertable Streams" ha risolto il 20% del problema.

**RFC 8723 - Double Encryption Procedures for SRTP** (Standards Track) è l'alternativa: due trasformazioni annidate, una **inner** end-to-end (AES-GCM con la chiave del mittente, nota solo agli endpoint) e una **outer** hop-by-hop (chiave condivisa con il Media Distributor). §4 stabilisce che l'MD può modificare **solo tre campi** dell'header RTP - **Payload Type, Sequence Number, Marker bit** - mentre tutti gli altri *"MUST remain unmodified"*; i valori originali sono preservati nell'**Optional Header Block (OHB)** per la verifica del ricevente. **RFC 8870** (*Encrypted Key Transport for SRTP*) copre il trasporto delle chiavi in questi scenari.

**Valutazione per Telemedic v1.0**: né SFrame né Double SRTP servono, perché non c'è SFU. Vanno però **documentati come percorso evolutivo** (§13), perché il giorno in cui entra un terzo partecipante la domanda "è ancora end-to-end?" arriverà da un DPO o da un cliente ospedaliero.

### 5.7 FIPS 140-2 / 140-3: la questione va affrontata di petto

Il sito dichiara **"cipher FIPS 140-2 compliant"**. Questa affermazione presenta **quattro problemi distinti**, e vanno esposti tutti.

**Problema 1 - FIPS 140-2 è in scadenza, e la scadenza cade prima della v1.0.**

Verificato: il **21 settembre 2026** il CMVP dichiarerà **historical** tutti i certificati FIPS 140-2 ancora attivi. Il CMVP ha smesso di accettare nuove sottomissioni 140-2 nell'aprile 2022. Dopo quella data, la formulazione operativa NIST è che le agenzie federali *"should not include"* moduli historical in nuove acquisizioni.

**Oggi è il 25 agosto 2026. La v1.0 di Telemedic è prevista per il 30 novembre 2026.** Il progetto lancerebbe rivendicando conformità a uno standard **dichiarato obsoleto due mesi prima del rilascio**. Questo non è un dettaglio di forma: in un contesto di dispositivo medico, dove la documentazione tecnica è oggetto di scrutinio, citare uno standard scaduto è un errore che si nota.

**Problema 2 - "cipher FIPS compliant" non è una categoria che esiste.**

FIPS 140-2/140-3 **non valida algoritmi**: valida **moduli crittografici** - un'implementazione specifica, in una versione specifica, compilata in un modo specifico, operante in "FIPS mode", con self-test all'avvio, gestione dello stato d'errore e boundary definito. AES-128-GCM non è "FIPS-validated"; *un modulo che implementa AES-128-GCM* può esserlo. Dire "usiamo cipher FIPS 140-2 compliant" è una categoria errata: al massimo si può dire "usiamo algoritmi **FIPS-approved**" (cioè presenti nelle SP 800-131A / FIPS 197 / SP 800-38D), che è vero ma molto più debole di quanto suoni.

**Problema 3 - Il browser non è sotto il controllo di Telemedic.**

Il media è cifrato **dal browser dell'utente**. Verificato dalla documentazione BoringSSL: *"BoringSSL as a whole is not FIPS validated"*; esiste un core, **BoringCrypto (BCM)**, che ha ottenuto validazioni CMVP. Ma la stessa documentazione avverte: *"we cannot answer questions about FIPS, nor about using BoringSSL in a FIPS-compliant manner"*, e nota che sul ramo di aggiornamento *"FIPS_version will return zero to indicate that it is not the validated module stream"*.

Cioè: **il modulo validato è una specifica revisione congelata, non ciò che gira nel browser che l'utente ha installato ieri.** Telemedic non ha modo di garantire - né di verificare - che la crittografia dell'endpoint provenga da un modulo in stato validato. Firefox usa NSS, altri browser altre librerie. Il claim è **non verificabile per costruzione**.

**Problema 4 - FIPS è uno standard federale statunitense, in un progetto che si vende come "sovereign telemedicine".**

Questa è la contraddizione più grossa dal punto di vista del posizionamento. Il vincolo V1 dichiara che i dati clinici non devono transitare per server US-based e che nessun componente obbligatorio è ospitato fuori dall'UE. Rivendicare come sigillo di qualità una validazione **NIST/CMVP** - cioè un programma del governo degli Stati Uniti e del Canada - indebolisce l'argomento di sovranità invece di rafforzarlo.

I riferimenti coerenti con il posizionamento europeo sono altri: **ETSI TS 119 312** (suite crittografiche per firme elettroniche), le raccomandazioni **ENISA** e **SOG-IS Agreed Cryptographic Mechanisms**, e in Italia le **Linee guida AgID/ACN sulla crittografia**. Per un dispositivo medico, IEC 62304 e ISO 14971 non richiedono FIPS: richiedono che le scelte crittografiche siano **motivate, documentate e proporzionate al rischio**.

**Che cosa Telemedic può affermare onestamente:**

> *"Il media è protetto con SRTP (RFC 3711) usando cipher suite AEAD basate su AES-GCM (RFC 7714), con chiavi negoziate via DTLS (RFC 6347/RFC 9147) secondo DTLS-SRTP (RFC 5764). Gli algoritmi impiegati appartengono agli insiemi raccomandati da ETSI TS 119 312 e SOG-IS. La cifratura è eseguita dalle librerie crittografiche del browser dell'utente: Telemedic non ne controlla la provenienza e non rivendica alcuna validazione FIPS 140-2 o 140-3, che riguarderebbe moduli e non algoritmi. La cipher suite effettivamente negoziata è osservabile e registrata per ogni sessione (`RTCTransportStats.srtpCipher`, `dtlsCipher`, `tlsVersion`)."*

Questa formulazione è **più forte** di quella attuale, perché è verificabile. E l'ultima frase - *registriamo e mostriamo quale cifratura è stata effettivamente usata in ogni consulto* - è una feature reale, che nessun claim di marketing sostituisce.

Se un cliente specifico (per esempio un'organizzazione soggetta a requisiti federali US) richiedesse davvero FIPS, la strada sarebbe: **componenti server** (coturn, JVM, TLS terminator) costruiti su OpenSSL 3.x con il FIPS provider validato, in FIPS mode, con documentazione del boundary. **Il piano media browser-to-browser resterebbe comunque fuori dal boundary.** Va detto in anticipo, non scoperto in fase di gara.

---

## 6. Topologie

### 6.1 Le tre topologie

**P2P / mesh.** Ogni partecipante invia il proprio stream a ogni altro. Con N partecipanti: N-1 upload e N-1 download per nodo, N(N-1)/2 connessioni totali, e - punto spesso ignorato - **N-1 encoding paralleli** se le condizioni di rete verso i peer differiscono.

- **N=2**: 1 connessione, 1 encode, 1 decode. Ottimale sotto ogni profilo.
- **N=3**: 3 connessioni, 2 encode e 2 decode per nodo. Upload richiesto ≈ 2× il bitrate. Ancora fattibile su una linea domestica decente.
- **N=4**: 6 connessioni, 3 encode per nodo. Upload ≈ 3×. Su ADSL asimmetrica o 4G congestionata è già problematico.
- **N≥5**: praticamente inutilizzabile. Il limite non è la banda downstream ma **l'upload asimmetrico e la CPU di encoding**.

Proprietà di sicurezza: **end-to-end nativo su ogni link**. Nessun intermediario ha il media.

**SFU (Selective Forwarding Unit).** Ogni partecipante invia **un solo** stream (o pochi layer, con simulcast/SVC) al server, che li inoltra selettivamente. Upload costante O(1), download O(N).

- Scala a decine di partecipanti per stanza.
- CPU server bassa rispetto all'MCU: nessuna transcodifica nel caso base.
- **Termina DTLS-SRTP.** Vede il media in chiaro (§5.5, caso C).

**MCU (Multipoint Control Unit).** Il server decodifica tutti gli stream, li compone in un singolo mosaico e ricodifica. Download O(1) - un solo stream, ideale per client deboli o per interop legacy (SIP, telefonia).

- **CPU per sessione altissima**: transcodifica di N flussi.
- **Latenza aggiuntiva significativa**: decode + compose + encode aggiunge decine di ms.
- Nessuna proprietà end-to-end; il layout è imposto lato server.

### 6.2 La scelta per Telemedic

**Per il consulto 1:1, la topologia P2P è inequivocabilmente corretta.** Non c'è alcun argomento a favore di un SFU per due partecipanti: aggiungerebbe una decodifica/ricodifica o un forwarding inutile, latenza, costo infrastrutturale, e **distruggerebbe la proprietà end-to-end che è il pilastro del posizionamento del progetto**.

**Per il terzo partecipante - interprete, caregiver, secondo specialista - la risposta corretta è: mesh a 3, non SFU.**

Motivazioni:

1. **A N=3 la mesh è tecnicamente sostenibile.** 2 upload e 2 download per nodo. Con encoding a 720p a ~1.5 Mbit/s, servono ~3 Mbit/s di upload - alla portata di FTTH e di gran parte delle FTTC italiane, e di una 4G/5G decente. Da verificare con test sul campo, non da assumere.
2. **Preserva l'end-to-end.** Passare a SFU per un terzo partecipante significherebbe dover riscrivere la comunicazione sulla sicurezza, rifare la DPIA, e affrontare la domanda "e allora il server vede il video del paziente?". Il costo di *narrativa* è più alto del costo tecnico.
3. **Per il caso "interprete LIS" o "caregiver" specificamente**, la mesh a 3 è persino preferibile: nessuna dipendenza da infrastruttura aggiuntiva, nessun single point of failure in più.

**Il vincolo va scritto esplicitamente**: Telemedic supporta **fino a 3 partecipanti in topologia mesh**. Oltre, serve una decisione architetturale nuova con implicazioni di sicurezza documentate. Meglio un limite dichiarato che un degrado silenzioso.

Sul piano dell'implementazione, la mesh a 3 richiede:

- **N-1 `RTCPeerConnection` per client** (2 in una stanza da 3). Il signaling deve gestire una topologia, non una coppia: ogni partecipante negozia con ogni altro.
- **Assegnazione deterministica dei ruoli polite/impolite per ogni coppia** (§2.3). Regola semplice e priva di ambiguità: ordinamento lessicografico dei `participantId`; nella coppia (X, Y) con X < Y, X è impolite.
- **`RTCRtpSender.setParameters({maxBitrate})` sensibile al numero di peer**: con 2 destinatari, il budget di upload va diviso.
- **Aggregazione delle metriche su N-1 connessioni** (§8): la "qualità della sessione" diventa il minimo, non la media, delle qualità per link.

### 6.3 Panoramica onesta degli SFU open source

Valutazione fatta *nell'ipotesi in cui Telemedic dovesse un giorno introdurne uno*, quindi con attenzione particolare alla compatibilità di licenza con **Apache-2.0** (decisione D1) e con il modello di distribuzione dell'integratore.

| Progetto | Licenza | Linguaggio | Maturità | Valutazione per Telemedic |
|---|---|---|---|---|
| **mediasoup** | **ISC** (verificato sul `LICENSE` upstream) | C++ (worker) + Node.js (control) | Alta, usato in produzione | Licenza permissiva, pienamente compatibile con Apache-2.0 e con la ridistribuzione dell'integratore. È una **libreria**, non un server pronto: richiede di costruire l'applicazione attorno. Introduce **Node.js** nello stack, che oggi è solo Java + browser. Costo operativo reale. |
| **Janus** | **GPLv3** (verificato sul `COPYING` upstream, con eccezione OpenSSL) | C, architettura a plugin | Alta, molto diffuso | **Problema di licenza.** GPLv3 è esattamente il tipo di copyleft che D1 ha scartato scegliendo Apache-2.0 al posto di EUPL-1.2. L'integrazione in un SaaS proprietario di un integratore diventa un problema legale da analizzare caso per caso. **Da escludere per coerenza con D1.** |
| **Jitsi Videobridge** | Apache-2.0 **`[da verificare sul repository upstream]`** | Java / Kotlin | Alta | **L'unico candidato omogeneo allo stack**: JVM, quindi stessa toolchain, stesso packaging, stesso know-how del team. Se un SFU dovesse servire, è il punto di partenza più razionale per un progetto Spring Boot. Da valutare l'accoppiamento con l'ecosistema Jitsi Meet, che porta con sé molte assunzioni sul modello di conferenza. |
| **LiveKit** | Apache-2.0 **`[da verificare]`** | Go (costruito su Pion) | Alta, in rapida evoluzione | Piattaforma completa, non solo SFU: SDK, room management, recording. Time-to-market rapido. Introduce Go nello stack. Verificare che il modello di deployment sia compatibile con il modello on-premise single-tenant di D8. |
| **ion-sfu** | MIT **`[da verificare]`** | Go | **Bassa / manutenzione incerta** | **Non raccomandato.** Lo stato di manutenzione del progetto va verificato prima di qualunque considerazione; adottare un SFU non mantenuto in un dispositivo medico è insostenibile sotto IEC 62304 (gestione dei SOUP). |
| **Pion** | MIT **`[da verificare]`** | Go | Alta come libreria | Non è un SFU: è un'**implementazione WebRTC in Go** con cui si costruisce un SFU. Massimo controllo, massimo lavoro. Ottima per costruire **strumenti di test** (§11) o un endpoint server-side per il recording (§10), anche senza adottarlo come SFU. |

**Conclusione**: nessun SFU nella v1.0. Se un giorno servisse, il candidato da valutare per primo è **Jitsi Videobridge** per omogeneità di stack, con **mediasoup** come alternativa se il controllo fine sul percorso media risultasse prioritario. **Janus va escluso per la licenza.**

Tutte le licenze marcate `[da verificare]` **devono** essere confermate sul repository upstream prima di comparire in documentazione: la compatibilità di licenza è una decisione legale, non una nota tecnica.

---

## 7. Codec e qualità

### 7.1 Codec video

**RFC 7742 - WebRTC Video Processing and Codec Requirements**, §5, testo verbatim verificato:

> *"WebRTC Browsers MUST implement the VP8 video codec as described in [RFC6386] and H.264 Constrained Baseline as described in [H264]."*

**H.264** (§6.2): obbligatorio il **Constrained Baseline Profile Level 1.2**; raccomandato (non obbligatorio) il **Constrained High Profile Level 1.3**. Packetization: *"endpoints MUST support the payload formats defined in [RFC6184]"*, e *"Packetization-mode 1 MUST be supported. Other modes MAY be negotiated and used."*

**VP8** (§6.1): *"endpoints MUST support the payload formats defined in [RFC7741]"*.

| Codec | Standard | Brevetti / licenze | Valutazione per Telemedic |
|---|---|---|---|
| **VP8** | RFC 6386; payload RFC 7741 | Royalty-free dichiarato; grant di brevetti dal licenziante | MTI. Baseline sicura. Efficienza inferiore a VP9/AV1 a parità di bitrate. |
| **VP9** | Specifica di progetto aperta | Royalty-free dichiarato | Migliore efficienza di VP8 (~30–50% a parità di qualità, **`[ordine di grandezza]`**). Supporto browser ampio ma non universale. Supporta SVC nativamente. |
| **H.264** | ITU-T H.264 / ISO 14496-10; payload RFC 6184 | **Coperto da pool di brevetti.** Le licenze hanno costi e condizioni. La distribuzione di un'implementazione può richiedere una licenza. | MTI, quindi presente ovunque, con **accelerazione hardware quasi universale** - il che significa **minor consumo di batteria e minor latenza di encoding sui dispositivi mobili**. Per una televisita da smartphone è spesso la scelta migliore in pratica. |
| **AV1** | AOMedia AV1; payload format AOMedia (**non un RFC**; esiste `draft-ietf-avtcore-rtp-av1`) | Royalty-free dichiarato da AOMedia | Efficienza superiore, ma **l'encoding software real-time è costoso in CPU** e l'accelerazione hardware in *encoding* è ancora rara. Il supporto in WebRTC (non in playback) è disomogeneo fra browser e piattaforme. |

**Onestà su AV1**: le fonti secondarie consultate concordano che nel 2026 **il real-time conferencing sullo stack WebRTC pubblico non usa AV1 per default**, che il supporto su alcune piattaforme è sperimentale e dipendente dall'hardware, e che il divario fra supporto **decoder** e supporto **encoder** resta ampio. **`[cifre puntuali non verificate su fonte primaria]`**.

**Raccomandazione**: non forzare la preferenza dei codec nella v1.0. Lasciare che la negoziazione SDP scelga, e **misurare** con `getStats()` (`RTCInboundRtpStreamStats.codecId` → `RTCCodecStats.mimeType`) quale codec viene effettivamente usato nel parco installato. Le decisioni sulla preferenza (`RTCRtpTransceiver.setCodecPreferences()`) vanno prese sui dati, non sulle tabelle di efficienza teorica. Per il rilevamento delle capacità: `RTCRtpSender.getCapabilities("video")`.

### 7.2 Audio: Opus

**RFC 6716** definisce Opus; **RFC 7587** ne definisce il payload format RTP. RFC 7874 stabilisce i codec audio obbligatori per WebRTC (Opus e G.711).

Clock rate obbligatorio verificato: `a=rtpmap:<pt> opus/48000/2` - **sempre 48000/2**, indipendentemente dal contenuto reale (il "/2" indica la capacità di trasportare stereo, non che lo stream sia stereo).

Parametri `fmtp` verificati (RFC 7587 §6.1):

| Parametro | Range / valori | Default |
|---|---|---|
| `maxplaybackrate` | 8000–48000 Hz | - |
| `sprop-maxcapturerate` | 8000–48000 Hz | - |
| `maxaveragebitrate` | 6000–510000 bit/s (range raccomandato) | - |
| `stereo` | `0` \| `1` | `0` |
| `sprop-stereo` | `0` \| `1` | `0` |
| `cbr` | `0` \| `1` | `0` |
| `useinbandfec` | `0` \| `1` | `0` |
| `usedtx` | `0` \| `1` | `0` |
| `ptime` | ms | `20` |
| `maxptime` | ms | `120` |

Esempio dalla §7 dell'RFC:

```
a=fmtp:101 maxplaybackrate=16000; sprop-maxcapturerate=16000; maxaveragebitrate=20000; stereo=1; useinbandfec=1; usedtx=0
```

Nota: **`minptime` non è definito da RFC 7587**, benché compaia negli SDP generati da alcune implementazioni. È un parametro extra-specifica: non citarlo come standard.

**Le tre funzionalità e la loro rilevanza clinica:**

- **FEC in-band (`useinbandfec=1`)**: Opus incorpora una versione a bassa fedeltà del frame precedente nel frame corrente. Recupera le perdite isolate senza aggiungere round-trip. Costo: un incremento del bitrate (**`[ordine di grandezza: 10–30% a seconda del profilo]`**). **RFC 8854 §4.1 lo RACCOMANDA esplicitamente** per Opus. **Per Telemedic va attivato**: l'intelligibilità della voce del paziente è funzionalmente critica.
- **DTX (`usedtx=1`)**: sospende la trasmissione durante il silenzio, inviando solo aggiornamenti di comfort noise. Risparmia banda in modo sostanziale in una conversazione a turni. **Ma**: introduce artefatti sull'attacco della parola e, in un consulto, i rumori di fondo possono avere valore clinico (respiro affannoso, tosse, sibili, tremore vocale). **Raccomandazione: DTX disattivato di default**, attivabile per contesti a banda estremamente limitata, con la scelta documentata come decisione clinica e non solo tecnica.
- **PLC (Packet Loss Concealment)**: sempre attivo, intrinseco al decoder. Interpola i frame mancanti. Non ha parametri SDP.

**Attenzione specifica al dominio**: il pipeline audio del browser applica di default **cancellazione dell'eco (AEC)**, **soppressione del rumore (NS)** e **controllo automatico del guadagno (AGC)** (vincoli di `MediaTrackConstraints`: `echoCancellation`, `noiseSuppression`, `autoGainControl`). Questi algoritmi sono ottimizzati per la voce e **possono sopprimere o distorcere segnali non vocali**. Per specialità in cui il suono ha valore semeiologico, disattivarli è una scelta che va offerta e documentata. **La documentazione MDR (V2) deve però essere chiara: se il suono viene usato per una valutazione diagnostica, si entra nel perimetro della regola 11 MDR.** Questa è una questione da girare all'agente compliance.

### 7.3 Simulcast e SVC in 1:1

**Simulcast**: il mittente codifica lo stesso contenuto in più risoluzioni/bitrate simultanei, ciascuno identificato da un `rid` (RFC 8851/8852 per RID e `a=simulcast`), e li invia tutti. Un SFU sceglie quale inoltrare a ciascun ricevente.

**SVC**: un singolo stream stratificato (layer temporali, spaziali, di qualità) da cui un forwarder può estrarre un sottoinsieme. In WebRTC si configura tramite **`scalabilityMode`** su `RTCRtpEncodingParameters`, definito dalla specifica **W3C *Scalable Video Coding (SVC) Extension for WebRTC*** (Working Draft, **17 agosto 2024**, verificato). §5 contiene la tabella normativa degli identificatori: `L1T1`, `L1T2`, `L1T3`, `L2T1`…`L3T3`, le varianti `h` (rapporto 1.5:1), le varianti `_KEY` (K-SVC) e i modi simulcast `S2T1`…`S3T3`. Oltre 40 identificatori.

**Hanno senso in 1:1? No.**

Il ragionamento è diretto: simulcast e SVC esistono per servire **riceventi eterogenei da un unico mittente**. In 1:1 esiste **un solo ricevente**, e il mittente può adattare l'encoding esattamente alle sue condizioni tramite congestion control e `setParameters()`. Il simulcast in 1:1 sprecherebbe banda in upload codificando layer che nessuno consuma.

**L'unica eccezione ragionevole** è `L1T2`/`L1T3` - **scalabilità puramente temporale su un solo layer spaziale**. Costa quasi nulla (nessun encoding aggiuntivo, solo una struttura di riferimento gerarchica) e conferisce **resilienza**: la perdita di un frame del layer temporale superiore non propaga l'errore, perché nessun frame vi fa riferimento. È una difesa contro il freeze video a costo marginale. **Vale la pena valutarla e misurarla.**

### 7.4 Congestion control

**RFC 8836** definisce i *requisiti*, non l'algoritmo. **RFC 8834** è esplicito: *"at the time of this writing, there is no standard congestion control algorithm that can be used for interactive media applications such as WebRTC's flows"*; gli endpoint devono implementare il **circuit breaker RTP (RFC 8083)** e possono usare algoritmi proprietari.

**GCC (Google Congestion Control)** è l'algoritmo de-facto implementato in libwebrtc, quindi in tutti i browser derivati da Chromium e - con differenze - in Firefox. È descritto in `draft-ietf-rmcat-gcc`, **Internet-Draft mai pubblicato come RFC**. Combina un controllore basato sul **ritardo** (stima del delay gradient tramite filtro di Kalman sui tempi di arrivo inter-gruppo) e uno basato sulla **perdita** (riduzione se la loss supera una soglia, tipicamente ~10%; incremento se sotto ~2%). **`[i valori di soglia sono conoscenza corrente, non verificati su fonte primaria in questa ricerca]`**.

**TWCC (transport-wide congestion control)**: aggiunge un numero di sequenza **a tutti i pacchetti della connessione** (attraverso tutti gli SSRC), permettendo al mittente di ricostruire i tempi di arrivo dall'altro lato. Verificato: definito in `draft-holmer-rmcat-transport-wide-cc-extensions`, **Internet-Draft individuale SCADUTO il 21 aprile 2016**, mai adottato, mai RFC. Il documento porta la nota *"not endorsed by the IETF"* e *"no formal standing in the IETF standards process"*. Feedback RTCP con **FMT=15** su **PT=205 (RTPFB)**. URI dell'estensione RTP: `http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions`. In SDP compare come `a=rtcp-fb:* transport-cc`.

**Questo è un punto di onestà tecnica importante**: l'algoritmo di congestion control su cui poggia la qualità di ogni sessione WebRTC del pianeta è un **draft scaduto da dieci anni**, standardizzato di fatto dall'implementazione e non dalla IETF.

Lo standard vero esiste ed è **RFC 8888** - *RTP Control Protocol (RTCP) Feedback for Congestion Control*, **Proposed Standard, gennaio 2021** (verificato). Usa **FMT=11 su PT=205**, sigla **CCFB**. Ogni blocco riporta, per pacchetto: **bit R** (ricevuto), campo **ECN** a 2 bit, campo **ATO** a 13 bit (arrival time offset in unità di 1/1024 s, misurato all'indietro dal Report Timestamp), fino a 16 384 numeri di sequenza per blocco. A differenza di transport-cc, RFC 8888 mantiene il feedback **per SSRC**, il che *"enables differential rate control and repair for audio and video flows"*. Il documento **non contiene informazioni sull'adozione nei browser**.

**Implicazione per Telemedic**: il "bitrate adattivo" dichiarato nella feature 1 del sito **non è codice di Telemedic**. È GCC dentro il browser. Il progetto non lo implementa: lo **configura** (tramite `setParameters`) e lo **osserva** (tramite `getStats`). La documentazione deve dirlo così, altrimenti rivendica un lavoro non svolto.

### 7.5 Controllo del bitrate lato applicazione

`RTCRtpSender.setParameters()` è il punto di intervento. Membri di `RTCRtpSendParameters` verificati sulla specifica W3C: `encodings`, `codecs`, `headerExtensions`, `rtcp`, `degradationPreference`, `transactionId`. Solo `encodings` (parzialmente) e `degradationPreference` sono modificabili.

Membri di `RTCRtpEncodingParameters` verificati sulla Recommendation W3C: `active`, `maxBitrate`, `maxFramerate`, `scaleResolutionDownBy`, `rid` (sola lettura), `priority`, `networkPriority`, `codec`. Il membro **`scalabilityMode`** è aggiunto dalla specifica SVC. **`[MDN elenca anche `dtx`, `channels`, `clockRate`, `mimeType`, `sdpFmtpLine` fra i membri di encoding: sono in realtà membri di `RTCRtpCodecParameters`, non di encoding. Non riportarli come tali.]`**

**`RTCDegradationPreference`**: i valori della specifica sono **`"maintain-framerate"`**, **`"maintain-resolution"`**, **`"balanced"`**. **`[MDN riporta anche `"maintain-framerate-and-resolution"`: non confermato sulla Recommendation W3C - non usarlo senza verifica.]`**

```javascript
/**
 * Applica un tetto di bitrate e la preferenza di degrado al sender video.
 * @param {RTCRtpSender} sender
 * @param {number} maxBitrateBps
 * @param {"maintain-framerate"|"maintain-resolution"|"balanced"} preference
 */
async function configureVideoSender(sender, maxBitrateBps, preference) {
  if (!sender || sender.track?.kind !== "video") {
    throw new TypeError("configureVideoSender richiede un RTCRtpSender video");
  }
  if (!Number.isInteger(maxBitrateBps) || maxBitrateBps <= 0) {
    throw new RangeError("maxBitrateBps deve essere un intero positivo");
  }

  // getParameters() DEVE precedere setParameters(): il transactionId
  // recuperato è l'unico accettato dall'implementazione.
  const params = sender.getParameters();
  if (!params.encodings || params.encodings.length === 0) {
    params.encodings = [{}];
  }
  params.encodings[0].maxBitrate = maxBitrateBps;
  params.degradationPreference = preference;

  try {
    await sender.setParameters(params);
  } catch (err) {
    // InvalidModificationError: transactionId obsoleto o campo non modificabile.
    console.error("setParameters rifiutato dall'implementazione", err);
    throw err;
  }
}
```

**La scelta di `degradationPreference` è una decisione clinica, non tecnica**, e va esposta all'utente o derivata dalla specialità:

- **`maintain-resolution`**: sacrifica il frame rate per preservare i dettagli spaziali. **Corretto per dermatologia** (una lesione cutanea richiede risoluzione, non fluidità), per la lettura di un referto o di un tracciato mostrato in video.
- **`maintain-framerate`**: sacrifica la risoluzione per preservare la fluidità. **Corretto per neurologia e fisiatria** (valutazione del cammino, del tremore, del range di movimento) e per **psichiatria** (la microespressività facciale si perde con frame rate basso).
- **`balanced`**: default ragionevole in assenza di informazione.

Questa mappatura specialità → `degradationPreference` è un'idea progettuale concreta che nasce da questa ricerca e che va girata all'agente funzionale.

**Attenzione MDR (V2)**: se il sistema *adatta la qualità video in funzione della finalità diagnostica dichiarata*, si avvicina pericolosamente alla soglia della regola 11. La formulazione difendibile è che si tratta di una **preferenza di rendering scelta dall'utente**, non di un adattamento automatico guidato dal contenuto clinico. Questione da girare all'agente compliance.

### 7.6 Meccanismi di resilienza

**RFC 8834** stabilisce cosa è obbligatorio (sezioni verificate):

| Meccanismo | Riferimento | Sezione RFC 8834 |
|---|---|---|
| Profilo **RTP/SAVPF** | RFC 5124 | §4.2 |
| **rtcp-mux** | RFC 5761 | §4.5 |
| **RTCP a dimensione ridotta** | RFC 5506 | §4.6 |
| **RTP/RTCP simmetrico** | RFC 4961 | §4.7 |
| **FIR** (Full Intra Request) | RFC 5104 | §5.1.1 |
| **PLI** (Picture Loss Indication) | RFC 4585 | §5.1.2 |
| **TMMBR** | RFC 5104 | §5.1.6 |
| **NACK** generico | RFC 4585 | §6.1 |
| **RTX** (ricezione) | RFC 4588 | §6.1 |
| **FEC** | RFC 8854 | §6.2 |
| Client-to-Mixer Audio Level | RFC 6464 | §5.2.2 |

**Come lavorano insieme** - la sequenza reale in caso di perdita video:

1. Il ricevente rileva un buco nella sequenza RTP.
2. Se l'RTT è basso rispetto al budget di jitter buffer, invia **NACK** (RFC 4585). Il mittente ritrasmette via **RTX** (RFC 4588) su SSRC/payload type separato (`a=rtpmap:<pt> rtx/90000`, `a=fmtp:<pt> apt=<pt-originale>`).
3. Se il NACK non è praticabile (RTT troppo alto, perdita troppo estesa) e il decoder ha perso il riferimento, il ricevente invia **PLI** (RFC 4585, PT=206 FMT=1) o **FIR** (RFC 5104, PT=206 FMT=4). Il mittente produce un **keyframe**.
4. **Il keyframe è costoso**: è tipicamente 5–10× un frame inter **`[ordine di grandezza]`**. Un burst di PLI può innescare una spirale - congestione → perdita → PLI → keyframe → maggiore congestione. GCC gestisce questo, ma le implementazioni applicano rate limiting sulle richieste di keyframe.

**FEC - RFC 8854, requisiti verbatim verificati:**

- Audio, §4.1: per Opus *"use of the built-in Opus FEC mechanism is RECOMMENDED"*; per codec a bitrate variabile non-Opus, *"redundant encoding (as described in Section 3.2) with lower-fidelity version(s) of the previous packet(s) is RECOMMENDED"*; per codec a bitrate costante come PCMU, *"redundant encoding MAY be used"*; uno stream FEC separato è *"NOT RECOMMENDED"* per l'audio, per l'eccesso di overhead a basso packet rate.
- Video, §5.1: *"use of a separate FEC stream with the Flexible FEC RTP payload format is RECOMMENDED"* (FlexFEC, **RFC 8627**).
- §7: le implementazioni *"MUST be able to receive and make use of the relevant FEC formats for their supported audio codecs"*; FlexFEC *"SHOULD also be supported"*; ULPFEC (RFC 5109) *"MAY be supported"*.

**RED** (RFC 2198) è il meccanismo di redundant encoding citato in §3.2; in SDP compare come `a=rtpmap:<pt> red/48000/2` per l'audio.

**Compromesso da documentare**: FEC consuma banda **sempre**, anche quando non c'è perdita. NACK/RTX consuma banda **solo** in caso di perdita, ma costa un RTT. Su link ad alto RTT o con perdita a burst, FEC vince; su link a basso RTT con perdita sporadica, NACK vince. Il browser fa questa scelta autonomamente in base alle stime di GCC; l'applicazione ha leve limitate.

**Jitter buffer adattivo**: sul lato audio, l'implementazione di riferimento (NetEq in libwebrtc) adatta dinamicamente il buffer alla distribuzione del jitter osservato, con time-stretching per allungare o accorciare senza artefatti percepibili. **Non esiste API per controllarlo direttamente**; esiste `RTCRtpReceiver.jitterBufferTarget` **`[membro proposto; supporto e stato di specifica da verificare prima di usarlo]`**. La sua osservabilità passa da `jitterBufferDelay` / `jitterBufferEmittedCount` (§8.2).

---

## 8. Misurazione della qualità

### 8.1 La specifica

**W3C *Identifiers for WebRTC's Statistics API*** (comunemente "WebRTC Statistics API"). Stato verificato: **Candidate Recommendation Draft, 25 settembre 2025**. Da citare con questo titolo esatto, non come "getStats spec".

`RTCPeerConnection.getStats()` restituisce una `Promise<RTCStatsReport>`, che è una mappa di oggetti tipizzati, ciascuno con `id`, `timestamp` e `type`, collegati fra loro da riferimenti a `id`.

### 8.2 Metriche verificate, per dizionario

**`RTCInboundRtpStreamStats`** (`type: "inbound-rtp"`) - membri confermati sulla specifica:

`jitter`, `packetsLost`, `framesPerSecond`, `freezeCount`, `totalFreezesDuration`, `pauseCount`, `nackCount`, `firCount`, `pliCount`, `framesDropped`, `totalInterFrameDelay`, `jitterBufferDelay`, `jitterBufferEmittedCount`.

**Non presenti** in questo dizionario: `roundTripTime`, `totalRoundTripTime`, `qualityLimitationReason`, `qualityLimitationDurations`, `availableOutgoingBitrate`, `currentRoundTripTime`, `retransmittedPacketsSent`, `fractionLost`.

**`RTCOutboundRtpStreamStats`** (`type: "outbound-rtp"`) - membri confermati:

`qualityLimitationReason`, `qualityLimitationDurations`, `nackCount`, `firCount`, `pliCount`, `retransmittedPacketsSent`, `framesPerSecond`, `framesEncoded`.

**Non presenti**: `roundTripTime`, `jitter`, `packetsLost`, `freezeCount`, `jitterBufferDelay`, `availableOutgoingBitrate`, `currentRoundTripTime`, `framesDropped`.

**`RTCRemoteInboundRtpStreamStats`** (`type: "remote-inbound-rtp"`) - membri confermati:

`roundTripTime`, `totalRoundTripTime`, `fractionLost`, più `jitter` e `packetsLost` ereditati dal dizionario padre.

> **Questo è il dizionario che risolve la confusione più diffusa.** L'RTT **non** sta in `outbound-rtp`. Sta in `remote-inbound-rtp`, che riporta ciò che il **peer remoto** ha osservato ricevendo il nostro stream, veicolato via RTCP Receiver Report. È quindi il vero indicatore della qualità **percepita dall'altra parte** - l'unica che conti in un consulto.

**`RTCIceCandidatePairStats`** (`type: "candidate-pair"`) - membri confermati (§8.19 della specifica):

`state`, `nominated`, `packetsSent`, `packetsReceived`, `bytesSent`, `bytesReceived`, `lastPacketSentTimestamp`, `totalRoundTripTime`, `currentRoundTripTime`, `availableOutgoingBitrate`, `availableIncomingBitrate`, `requestsReceived`, `requestsSent`, `responsesReceived`, `responsesSent`, `consentRequestsSent`, `packetsDiscardedOnSend`, `bytesDiscardedOnSend`.

**`RTCTransportStats`** (`type: "transport"`) - membri confermati (§8.17):

`dtlsState`, `srtpCipher`, `dtlsCipher`, `tlsVersion`, `selectedCandidatePairId`, `dtlsRole`.

> **Questi ultimi quattro sono la prova documentale della cifratura effettiva.** Registrarli per ogni sessione trasforma il claim di sicurezza in un fatto auditabile (§5.7). Devono finire nell'audit trail Envers, non solo nelle metriche.

### 8.3 Campionamento senza degradare le prestazioni

`getStats()` costruisce un report completo a ogni invocazione; il costo cresce con il numero di stream e transceiver. Regole pratiche:

- **Frequenza**: 1 Hz è lo standard di fatto ed è sufficiente. Sotto 1 Hz si perdono i transienti; sopra 2 Hz il costo cresce senza guadagno informativo. `webrtc-internals` campiona a 1 Hz.
- **Selettività**: `getStats(track)` limita il report a un singolo `MediaStreamTrack`, riducendo il costo.
- **Aggregazione client-side**: non inviare 1 campione/secondo al backend. Aggregare in finestre di 10–30 s calcolando min/media/p95/max e inviare il riassunto, con l'eccezione degli eventi (cambio di `qualityLimitationReason`, superamento di soglia, freeze) che vanno inviati subito.
- **I contatori sono cumulativi**: `packetsLost`, `bytesReceived`, `totalFreezesDuration`, `jitterBufferDelay` crescono monotonamente. **Vanno differenziati fra campioni consecutivi.** Un errore classico è graficare `packetsLost` grezzo e concludere che la qualità peggiora sempre.
- Le medie corrette si calcolano come rapporti fra delta: ad esempio il **jitter buffer delay medio** è `Δ(jitterBufferDelay) / Δ(jitterBufferEmittedCount)` (secondi per campione emesso).

```javascript
/**
 * Estrae un campione di qualità da una PeerConnection.
 * Restituisce solo metriche verificate sulla specifica W3C
 * "Identifiers for WebRTC's Statistics API".
 */
async function sampleQuality(pc) {
  const report = await pc.getStats();
  const sample = {
    at: Date.now(),
    inboundVideo: null,
    inboundAudio: null,
    outboundVideo: null,
    remoteInbound: [],
    selectedPair: null,
    transport: null,
  };

  let selectedPairId = null;

  for (const stat of report.values()) {
    switch (stat.type) {
      case "transport":
        sample.transport = {
          dtlsState: stat.dtlsState,
          dtlsRole: stat.dtlsRole,
          tlsVersion: stat.tlsVersion,
          dtlsCipher: stat.dtlsCipher,
          srtpCipher: stat.srtpCipher,     // prova documentale della cifratura
        };
        selectedPairId = stat.selectedCandidatePairId ?? selectedPairId;
        break;

      case "inbound-rtp": {
        const entry = {
          kind: stat.kind,
          packetsLost: stat.packetsLost,
          jitter: stat.jitter,                                   // secondi
          jitterBufferDelay: stat.jitterBufferDelay,             // cumulativo, s
          jitterBufferEmittedCount: stat.jitterBufferEmittedCount,
          framesPerSecond: stat.framesPerSecond,
          framesDropped: stat.framesDropped,
          freezeCount: stat.freezeCount,
          totalFreezesDuration: stat.totalFreezesDuration,        // cumulativo, s
          pauseCount: stat.pauseCount,
          totalInterFrameDelay: stat.totalInterFrameDelay,
          nackCount: stat.nackCount,
          pliCount: stat.pliCount,
        };
        if (stat.kind === "video") sample.inboundVideo = entry;
        else if (stat.kind === "audio") sample.inboundAudio = entry;
        break;
      }

      case "outbound-rtp":
        if (stat.kind === "video") {
          sample.outboundVideo = {
            framesEncoded: stat.framesEncoded,
            framesPerSecond: stat.framesPerSecond,
            retransmittedPacketsSent: stat.retransmittedPacketsSent,
            qualityLimitationReason: stat.qualityLimitationReason,
            qualityLimitationDurations: stat.qualityLimitationDurations,
            nackCount: stat.nackCount,
            pliCount: stat.pliCount,
          };
        }
        break;

      case "remote-inbound-rtp":
        // Ciò che il peer remoto osserva ricevendo il NOSTRO stream.
        sample.remoteInbound.push({
          kind: stat.kind,
          roundTripTime: stat.roundTripTime,          // secondi
          totalRoundTripTime: stat.totalRoundTripTime,
          fractionLost: stat.fractionLost,            // 0..1
          jitter: stat.jitter,
          packetsLost: stat.packetsLost,
        });
        break;
    }
  }

  if (selectedPairId) {
    const pair = report.get(selectedPairId);
    if (pair) {
      sample.selectedPair = {
        state: pair.state,
        nominated: pair.nominated,
        currentRoundTripTime: pair.currentRoundTripTime,
        availableOutgoingBitrate: pair.availableOutgoingBitrate,
        availableIncomingBitrate: pair.availableIncomingBitrate,
        bytesSent: pair.bytesSent,
        bytesReceived: pair.bytesReceived,
        packetsDiscardedOnSend: pair.packetsDiscardedOnSend,
        consentRequestsSent: pair.consentRequestsSent,
        // Il tipo del candidato (host/srflx/relay) si legge risolvendo
        // localCandidateId / remoteCandidateId su RTCIceCandidateStats.
        localCandidateId: pair.localCandidateId,
        remoteCandidateId: pair.remoteCandidateId,
      };
    }
  }

  return sample;
}
```

### 8.4 Rilevare l'uso del relay

Domanda operativa concreta: *questa sessione sta passando dal TURN?*

Si risolve leggendo `RTCIceCandidatePairStats.localCandidateId` / `remoteCandidateId`, risolvendo i corrispondenti `RTCIceCandidateStats` e controllando il membro `candidateType` (valori: `"host"`, `"srflx"`, `"prflx"`, `"relay"`). Se uno dei due è `"relay"`, la sessione è relayed.

Questa metrica va in TimescaleDB come dimensione di ogni sessione. Alimenta due decisioni: il **dimensionamento del TURN** (§3.6) e la diagnosi dei problemi di qualità (una sessione relayed ha un profilo di latenza diverso e va confrontata con il suo gruppo, non con le sessioni dirette).

### 8.5 Da metriche a indicatore sintetico di qualità

**L'E-model - ITU-T G.107.** Modello di pianificazione della trasmissione che produce un **fattore R** (0–100) come:

```
R = R0 - Is - Id - Ie-eff + A
```

dove `R0` è il rapporto segnale/rumore di base (valore di default ≈ 93.2), `Is` le compromissioni simultanee alla trasmissione della voce, `Id` quelle dovute al **ritardo**, `Ie-eff` il fattore di compromissione da apparecchiature (codec + perdita di pacchetti), `A` il fattore di vantaggio.

La conversione R → MOS (G.107, Annex B):

```
MOS = 1                                                    se R < 0
MOS = 1 + 0.035·R + R·(R-60)·(100-R)·7·10⁻⁶                se 0 ≤ R ≤ 100
MOS = 4.5                                                  se R > 100
```

**Onestà obbligatoria su questo punto**, perché è il luogo dove si costruiscono i numeri più fasulli:

1. **G.107 è un modello di pianificazione di reti telefoniche a banda stretta.** Non è un modello di misura di una sessione WebRTC.
2. **I valori di `Ie-eff` per Opus non sono standardizzati** nella tabella dell'Appendice I di ITU-T G.113 (che copre G.711, G.729, G.723.1 e simili). **`[non verificato che siano stati aggiunti in revisioni recenti]`**. Chi calcola un "MOS Opus" con l'E-model sta usando `Ie` di un altro codec, o un valore inventato.
3. Esistono **G.107.1** (E-model wideband) e **G.107.2** (E-model fullband), più appropriati per Opus. **`[la copertura esatta di Opus in G.107.2 non è stata verificata in questa ricerca]`**.
4. **Per il video non esiste nulla di paragonabile applicabile al real-time.** ITU-T P.1203 e P.1204 sono modelli per lo **streaming adattivo HTTP**, con assunzioni (buffering, stalli, segmenti) che non valgono per WebRTC.

**Raccomandazione**: non pubblicare un "MOS". Pubblicare un **indice di qualità della sessione proprietario, trasparente e documentato**, costruito su metriche osservate, con la formula pubblicata e la dichiarazione esplicita che **non è un MOS ITU-T**.

Proposta di struttura (da tarare su dati reali, non da adottare alla cieca):

```
QoS_index = min(S_latenza, S_perdita, S_jitter, S_continuità)
```

usando il **minimo** e non la media, perché la qualità percepita è dominata dalla dimensione peggiore: un audio perfetto non compensa un video congelato.

- `S_latenza` da `remote-inbound-rtp.roundTripTime`
- `S_perdita` da `ΔpacketsLost / Δ(packetsReceived + packetsLost)`
- `S_jitter` da `inbound-rtp.jitter` e da `Δ(jitterBufferDelay)/Δ(jitterBufferEmittedCount)`
- `S_continuità` da `Δ(totalFreezesDuration)` sulla finestra e da `Δ(freezeCount)`

**Soglie clinicamente rilevanti - proposta da validare.** Non esiste, per quanto emerso da questa ricerca, uno standard che definisca soglie di qualità video per la televisita generica. **`[da verificare con l'agente compliance: esistono linee guida nazionali italiane sulla telemedicina - indicazioni nazionali per l'erogazione di prestazioni in telemedicina - che potrebbero contenere requisiti tecnici minimi]`**. Le soglie seguenti sono una **proposta ingegneristica**, esplicitamente non normativa:

| Dimensione | Buono | Degradato (avviso) | Inadeguato (allerta) |
|---|---|---|---|
| RTT (`remote-inbound-rtp.roundTripTime`) | < 150 ms | 150–300 ms | > 300 ms |
| Perdita audio (frazione sulla finestra) | < 1% | 1–3% | > 3% |
| Perdita video | < 2% | 2–5% | > 5% |
| Jitter audio | < 30 ms | 30–60 ms | > 60 ms |
| Freeze video (`Δ totalFreezesDuration` / durata finestra) | < 1% | 1–5% | > 5% |
| Frame rate video ricevuto | ≥ 20 fps | 10–20 fps | < 10 fps |

**La conseguenza clinica delle soglie va progettata**, non solo misurata: al superamento della soglia "inadeguato" il sistema deve **informare il professionista** che le condizioni tecniche potrebbero non essere adatte alla valutazione in corso, e offrire l'opzione di rinviare. Questo è un **controllo di rischio ai sensi di ISO 14971** ed è probabilmente il singolo elemento di questa ricerca con maggiore rilevanza per il fascicolo tecnico MDR. Va girato all'agente compliance.

### 8.6 RTCP XR - RFC 3611

**RFC 3611** definisce sette tipi di blocco (sezioni e Block Type verificati):

| Block | § | BT | Contenuto |
|---|---|---|---|
| Loss RLE | 4.1 | 1 | Run-length delle perdite/ricezioni |
| Duplicate RLE | 4.2 | 2 | Run-length dei duplicati |
| Packet Receipt Times | 4.3 | 3 | Timestamp di ricezione |
| Receiver Reference Time | 4.4 | 4 | Wallclock del ricevente |
| **DLRR** | 4.5 | 5 | Delay since last RR - abilita il calcolo dell'RTT |
| Statistics Summary | 4.6 | 6 | Perdite, duplicati, jitter, TTL aggregati |
| **VoIP Metrics** | 4.7 | 7 | R factor, MOS-LQ, MOS-CQ, metriche burst/gap |

Il blocco **VoIP Metrics** (§4.7) è basato su ITU-T G.107 ed ETSI TS 101 329-5: R factor su scala 0–100 (94 = toll quality), MOS-LQ e MOS-CQ su scala 10–50 (cioè MOS × 10), e la distinzione **burst/gap** fra periodi ad alta e bassa perdita.

**Rilevanza per Telemedic - onesta**: RFC 8834 non elenca RTCP XR fra i meccanismi obbligatori, e il **supporto browser è limitato o assente** **`[non verificato]`**. La distinzione **burst vs gap** è però concettualmente preziosa: 5% di perdita distribuita uniformemente e 5% concentrata in due burst di 300 ms hanno effetti percettivi completamente diversi. Il primo è quasi impercettibile con FEC; il secondo produce due interruzioni udibili. **L'indice di qualità di Telemedic dovrebbe catturare la burstiness** - approssimabile lato client dalla varianza della perdita fra campioni consecutivi, senza bisogno di RTCP XR.

---

## 9. Il target "latenza < 200 ms"

### 9.1 Che cosa significa, esattamente

Il context pack riporta: *"Target di latenza media: < 200 ms"*. **La cifra, così com'è, è ambigua e va disambiguata prima di finire in documentazione tecnica**, perché ammette almeno quattro letture con ordini di grandezza diversi:

1. **RTT di rete** (round-trip). Misurabile con `remote-inbound-rtp.roundTripTime`. In Italia, fra due endpoint su fibra, è tipicamente **10–40 ms**. Un target di 200 ms su questa metrica è **banalmente raggiungibile** e comunicare ciò equivale a non dire nulla.
2. **Latenza di rete one-way** (≈ RTT/2). **5–20 ms** nello stesso scenario. Idem.
3. **Latenza audio bocca-orecchio** (mouth-to-ear). È la metrica di cui parla ITU-T G.114.
4. **Latenza glass-to-glass** (obiettivo della telecamera → pixel sul display remoto). È la metrica che l'utente **percepisce** e la sola che abbia significato clinico. È anche la più difficile da misurare e la più alta.

**Raccomandazione**: dichiarare esplicitamente quale. Se il target vuole essere significativo, deve riferirsi a (3) o (4).

### 9.2 Il budget di ritardo, componente per componente

**`[Tutti i valori seguenti sono ordini di grandezza ricavati da conoscenza di dominio, non da misure verificate in questa ricerca. Vanno sostituiti con misure proprie prima della pubblicazione.]`**

| Stadio | Contributo tipico | Note |
|---|---|---|
| Cattura (esposizione, rolling shutter, driver, buffering) | 10–40 ms | Le webcam USB economiche stanno all'estremo alto |
| Pre-processing (AEC, NS, AGC, scaling) | 5–15 ms | L'AEC introduce delay algoritmico |
| Encoding video | 5–30 ms | Real-time, low-latency, **senza B-frame**; hardware più veloce di software |
| Packetization + stack OS | 1–5 ms | |
| **Rete (one-way)** | **5–20 ms** diretto in-country; **20–60 ms** su mobile; **+10–50 ms** via TURN | Il relay aggiunge una tratta |
| Jitter buffer | **20–100 ms** | Adattivo. **È tipicamente il singolo contributo maggiore** e cresce con l'instabilità della rete |
| Decoding | 5–20 ms | |
| Rendering / compositing / vsync | 8–33 ms | A 30 fps, un frame = 33 ms; il vsync aggiunge fino a un intervallo di refresh |
| **Totale glass-to-glass** | **~60–260 ms** in condizioni buone; **150–400 ms** in condizioni reali | |

**Conclusioni oneste:**

- **Glass-to-glass < 200 ms è raggiungibile** su rete fibra domestica, con hardware decente, in P2P diretto. **Non è garantibile**: dipende da telecamera, CPU, display, rete e stato del jitter buffer, cioè da fattori quasi tutti fuori dal controllo di Telemedic.
- **Via TURN, con jitter buffer espanso per instabilità di rete, superare i 200 ms è normale e non indica un malfunzionamento.**
- Il jitter buffer, non la rete, è la leva dominante. E il jitter buffer **cresce apposta** quando la rete è instabile: è il meccanismo che sostituisce la latenza alla perdita di pacchetti. Un target rigido di latenza è quindi **in tensione diretta** con la qualità audio.

### 9.3 ITU-T G.114 e la soglia della percezione

Contenuti verificati della Recommendation ITU-T G.114 (*One-way transmission time*):

- One-way fra **150 e 400 ms** è accettabile *"provided that Administrations are aware of the transmission time impact on the transmission quality of user applications"*.
- **Oltre 400 ms**: inaccettabile per la pianificazione generale di rete, salvo casi eccezionali (doppio hop satellitare).
- Avvertenza chiave: i compiti **altamente interattivi** - *"many voice calls, interactive data applications, video conferencing"* - *"can be affected by much lower delays"* di quanto la soglia dei 400 ms suggerisca. Anche in **assenza totale di eco**, *"10% or more of the speakers may experience difficulty due to a delay of 400 ms"*.
- La Recommendation raccomanda di non superare **400 ms** one-way per la pianificazione generale, e descrive il ritardo come *"a vital resource that is to be consumed with caution"*.

La lettura corrente (dalla tabella classica di G.114): **0–150 ms** accettabile per la maggior parte delle applicazioni; **150–400 ms** accettabile con consapevolezza degli effetti; **> 400 ms** inaccettabile.

### 9.4 Formulazione onesta del target

> **"Latenza < 200 ms" non è falso, ma non è verificabile così com'è scritto.**

Formulazione proposta:

> *"Telemedic mira a una latenza audio one-way (bocca-orecchio) entro la soglia di 150 ms indicata da ITU-T G.114 come accettabile per la maggior parte delle applicazioni interattive, e comunque entro i 400 ms oltre i quali la stessa Recommendation considera la conversazione compromessa. In collegamento peer-to-peer diretto su rete fissa nazionale, la latenza glass-to-glass misurata si colloca tipicamente sotto i 200 ms. Quando il traffico è instradato tramite relay TURN, o quando l'instabilità della rete impone un jitter buffer più ampio, il valore cresce: il sistema misura la latenza di ogni sessione, la registra e ne informa il professionista al superamento delle soglie configurate."*

Questa versione è più lunga ma è **difendibile in un fascicolo tecnico** e trasforma un numero indimostrabile in una **capacità di misura**, che è una feature vera.

---

## 10. Registrazione della sessione

### 10.1 Il conflitto strutturale

**Registrare una chiamata cifrata end-to-end richiede, per definizione, che qualcuno con accesso al chiaro la scriva su disco.** Non esiste modo di aggirarlo. Le uniche entità che hanno il chiaro sono i due browser. Quindi:

- **Registrazione client-side**: preserva l'E2E. Il chiaro non lascia mai l'endpoint prima di essere ricifrato per il trasporto e la conservazione.
- **Registrazione server-side**: **rompe l'E2E**. Richiede un endpoint media server-side che completi il proprio handshake DTLS e decifri lo stream.

Il context pack (feature 6) dichiara *"Recording opzionale cifrato - consenso esplicito del paziente via UI dedicata, MP4 cifrato a riposo"*. **Non specifica dove avvenga la registrazione.** È la scelta architetturale più consequenziale ancora aperta.

### 10.2 Registrazione client-side con `MediaRecorder`

`MediaRecorder` è definito dalla specifica **W3C *MediaStream Recording***.

```javascript
/**
 * Registra localmente una composizione audio/video, con cifratura applicata
 * dall'applicazione prima della persistenza o dell'upload.
 */
function startLocalRecording(stream, onEncryptedChunk) {
  // Il mimeType DEVE essere verificato: il supporto varia per browser.
  const candidates = [
    "video/webm;codecs=vp9,opus",
    "video/webm;codecs=vp8,opus",
    "video/webm",
    "video/mp4",
  ];
  const mimeType = candidates.find((t) => MediaRecorder.isTypeSupported(t));
  if (!mimeType) {
    throw new Error("Nessun formato di registrazione supportato dal browser");
  }

  const recorder = new MediaRecorder(stream, {
    mimeType,
    videoBitsPerSecond: 1_500_000,
    audioBitsPerSecond: 64_000,
  });

  recorder.ondataavailable = async (event) => {
    if (event.data && event.data.size > 0) {
      // La cifratura applicativa avviene QUI, prima che il blob lasci
      // il contesto del browser. Chiavi gestite via WebCrypto.
      await onEncryptedChunk(event.data);
    }
  };

  recorder.onerror = (event) => {
    console.error("Errore MediaRecorder", event.error);
  };

  // timeslice: emette un blob ogni N ms, abilitando l'upload incrementale
  // e limitando la perdita in caso di crash del browser.
  recorder.start(5000);
  return recorder;
}
```

**Limiti reali, da documentare senza edulcorare:**

1. **Formato contenitore.** Il supporto di `video/mp4` in `MediaRecorder` **non è universale**; `video/webm` (VP8/VP9 + Opus) è il formato più ampiamente supportato. **La feature 6 dichiara "MP4 cifrato a riposo": se la registrazione è client-side, potrebbe essere necessario un remux server-side WebM → MP4, oppure rivedere il claim sul formato.** `[il supporto MP4 per browser va verificato con `MediaRecorder.isTypeSupported()` su ciascun target.]`
2. **Composizione dei due flussi.** `MediaRecorder` registra **uno** `MediaStream`. Per catturare medico + paziente insieme serve comporli: `MediaStreamTrackProcessor`/`VideoFrame` + `<canvas>` con `canvas.captureStream()`, e mixaggio audio con `AudioContext` + `MediaStreamAudioDestinationNode`. **Costo CPU sul client non trascurabile**, in aggiunta a encode + decode della chiamata. Su un portatile modesto durante un consulto, è un rischio di degrado della chiamata stessa. Va misurato.
3. **Sincronizzazione A/V.** Registrando la composizione locale, il **video remoto è già sfasato** rispetto all'audio locale della quantità di latenza di rete. Il risultato è una registrazione in cui le battute non si allineano perfettamente. Non è un difetto correggibile a valle senza timestamp RTP, che `MediaRecorder` non espone.
4. **Affidabilità.** Se il browser si chiude o il tab crolla, la registrazione si perde. L'upload incrementale via `timeslice` limita il danno ma non lo elimina.
5. **Il client deve rimanere disponibile.** Se il medico chiude il portatile a fine consulto prima che l'upload finisca, la registrazione è persa.

### 10.3 Registrazione server-side

Richiede un endpoint WebRTC lato server (costruito ad esempio su Pion, GStreamer con `webrtcbin`, o un SFU) che partecipi alla sessione come terzo peer.

**Conseguenze da mettere nero su bianco:**

- L'endpoint di registrazione **completa un handshake DTLS proprio** e ha il media in chiaro. **Il consulto registrato NON è più end-to-end.**
- La topologia cambia: da 1:1 a 1:1:1 (o si passa a un SFU). Cambia il dimensionamento, cambia il modello di minaccia, cambia la DPIA.
- **Il paziente deve saperlo.** Il consenso alla registrazione non è solo consenso a registrare: è consenso a un **modello di sicurezza diverso** per quella sessione. La UI di consenso deve dirlo in linguaggio comprensibile.

**Vantaggi**: affidabilità, sincronizzazione corretta (timestamp RTP disponibili), nessun carico sul client, formato controllato, cifratura a riposo gestita centralmente con rotazione delle chiavi e HSM.

### 10.4 Raccomandazione

**Registrazione client-side per la v1.0**, per queste ragioni:

1. **Preserva la proprietà che definisce il progetto.** Non si può costruire il posizionamento sull'end-to-end e poi introdurre un componente che lo termina.
2. **Il consulto registrato è la minoranza dei casi.** Non vale la pena riprogettare l'architettura per un caso opzionale.
3. **Riduce il perimetro GDPR e MDR.** Nessun media clinico in chiaro sui server dell'operatore, in nessun momento.

**Con questi vincoli espliciti:**

- Cifratura applicativa **nel browser** con **Web Crypto API** (AES-GCM) prima di qualunque upload. Chiave di contenuto casuale per sessione, incapsulata con la chiave pubblica del titolare del trattamento (envelope encryption).
- Upload incrementale a chunk cifrati (`timeslice`), con ripresa dopo interruzione.
- **Indicatore di registrazione persistente e non occultabile** nella UI di entrambi i partecipanti - requisito etico prima che tecnico, e requisito di accessibilità (annuncio via `aria-live`, non solo un pallino rosso: WCAG 1.4.1 vieta di veicolare informazione col solo colore).
- Cifratura a riposo con chiavi in un KMS UE, retention configurabile, cancellazione crittografica (distruzione della chiave) come meccanismo di cancellazione.
- **Il claim "MP4" va verificato e, se necessario, corretto in "WebM" o rivisto con un remux server-side** - il quale però tratterebbe contenuto **cifrato**, quindi non potrebbe rimuxare senza decifrarlo. **Questione aperta, da risolvere prima della v1.0.**

---

## 11. Testing di WebRTC

### 11.1 Fake media devices

**Chrome** - flag verificati sulla documentazione webrtc.org:

```bash
--allow-file-access-from-files
--disable-gesture-requirement-for-media-playback
--use-fake-ui-for-media-stream          # auto-accetta il prompt dei permessi
--use-fake-device-for-media-stream      # sostituisce camera/microfono con sorgenti sintetiche
--use-file-for-fake-video-capture=/path/to/file.y4m
```

La documentazione descrive `--use-file-for-fake-video-capture` come flag che *"feeds a Y4M test file to `getUserMedia()` instead of live camera input"*.

**`[Non verificati su fonte primaria in questa ricerca]`**: `--use-file-for-fake-audio-capture` (che accetta un file WAV), `--auto-accept-camera-and-microphone-capture`, e i requisiti di formato audio (PCM 16 bit, sample rate). Questi flag sono di uso comune ma **vanno confermati** su `media/base/media_switches.cc` della versione di Chrome usata in CI prima di finire nella documentazione.

**Firefox** - preferenze `media.navigator.streams.fake` e `media.navigator.permission.disabled`. **`[non verificate in questa ricerca]`**.

**Perché conta per Telemedic**: usare un file Y4M **deterministico** invece di rumore sintetico rende i test **riproducibili e misurabili**. Con un pattern noto (una sequenza di test standard, un timecode a schermo) si può misurare la latenza glass-to-glass in modo automatico e verificare che il video ricevuto corrisponda a quello trasmesso.

**Idea concreta di test**: un file Y4M che contiene un **timecode leggibile a schermo**; il ricevente cattura frame via `<canvas>`, esegue OCR del timecode e lo confronta con l'orologio. Fornisce una misura **oggettiva** di latenza glass-to-glass in CI - cioè esattamente il numero che il progetto rivendica al §9 e che oggi non misura.

### 11.2 Simulazione delle condizioni di rete

**Linux `tc` con `netem`** - lo strumento corretto, applicabile in container:

```bash
# Aggiunge 80 ms di ritardo con 20 ms di jitter, 3% di perdita e riordino
sudo tc qdisc add dev eth0 root netem \
    delay 80ms 20ms distribution normal \
    loss 3% \
    reorder 1% 50%

# Limite di banda: netem + tbf in cascata
sudo tc qdisc add dev eth0 root handle 1: tbf rate 1mbit burst 32kbit latency 400ms
sudo tc qdisc add dev eth0 parent 1:1 handle 10: netem delay 80ms 20ms loss 3%

# Rimozione
sudo tc qdisc del dev eth0 root
```

Profili di rete da definire come costanti di test e riusare in tutta la suite:

| Profilo | Ritardo | Jitter | Perdita | Banda | Scenario |
|---|---|---|---|---|---|
| `fiber` | 10 ms | 2 ms | 0.1% | 100 Mbit/s | FTTH domestica |
| `fttc` | 25 ms | 8 ms | 0.5% | 20/3 Mbit/s | FTTC asimmetrica |
| `mobile_4g` | 50 ms | 25 ms | 2% | 8/2 Mbit/s | 4G in mobilità |
| `mobile_congested` | 120 ms | 60 ms | 6% | 2/0.5 Mbit/s | Cella congestionata |
| `hospital_wifi` | 30 ms | 40 ms | 3% | 10/10 Mbit/s | Wi-Fi enterprise affollato |
| `degraded` | 250 ms | 100 ms | 10% | 1/0.3 Mbit/s | Caso peggiore accettabile |

Il profilo `degraded` serve a verificare che il sistema **degradi con grazia e avvisi l'utente** (§8.5), non che funzioni bene.

**Chrome DevTools** ha una throttling di rete, ma **agisce sul livello HTTP e non sul traffico UDP di WebRTC**. **Non è utilizzabile** per questi test. È un equivoco diffuso: va scritto nella documentazione di testing per evitare che qualcuno perda tempo.

### 11.3 Test E2E con Playwright

Playwright (previsto da D10) supporta i flag Chrome e le preferenze Firefox:

```typescript
// playwright.config.ts - estratto
import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  projects: [
    {
      name: 'chromium-webrtc',
      use: {
        ...devices['Desktop Chrome'],
        launchOptions: {
          args: [
            '--use-fake-ui-for-media-stream',
            '--use-fake-device-for-media-stream',
            '--use-file-for-fake-video-capture=./fixtures/media/timecode-640x480.y4m',
            '--allow-file-access-from-files',
            // Nota: --use-file-for-fake-audio-capture è di uso comune ma
            // va verificato sulla versione di Chrome in uso.
          ],
        },
        permissions: ['camera', 'microphone'],
      },
    },
  ],
});
```

Il test canonico usa **due `BrowserContext`** nella stessa istanza - uno per il professionista, uno per il paziente - e verifica la convergenza della sessione leggendo `getStats()` da entrambi tramite `page.evaluate()`.

```typescript
import { test, expect, type Page } from '@playwright/test';

/** Legge un sottoinsieme verificato di statistiche dalla PeerConnection della pagina. */
async function readStats(page: Page) {
  return page.evaluate(async () => {
    // window.__telemedicPc è esposta dall'app SOLO in build di test.
    const pc: RTCPeerConnection = (window as any).__telemedicPc;
    if (!pc) throw new Error('PeerConnection non esposta: build di test non attiva');

    const report = await pc.getStats();
    const out = {
      connectionState: pc.connectionState,
      iceConnectionState: pc.iceConnectionState,
      localCandidateType: null as string | null,
      remoteCandidateType: null as string | null,
      srtpCipher: null as string | null,
      dtlsState: null as string | null,
      inboundVideoBytes: 0,
    };

    let pairId: string | null = null;
    for (const s of report.values()) {
      if (s.type === 'transport') {
        out.srtpCipher = s.srtpCipher ?? null;
        out.dtlsState = s.dtlsState ?? null;
        pairId = s.selectedCandidatePairId ?? pairId;
      }
      if (s.type === 'inbound-rtp' && s.kind === 'video') {
        out.inboundVideoBytes = s.bytesReceived ?? 0;
      }
    }
    if (pairId) {
      const pair: any = report.get(pairId);
      if (pair) {
        out.localCandidateType = (report.get(pair.localCandidateId) as any)?.candidateType ?? null;
        out.remoteCandidateType = (report.get(pair.remoteCandidateId) as any)?.candidateType ?? null;
      }
    }
    return out;
  });
}

test('consulto 1:1 - la sessione media si stabilisce ed è cifrata', async ({ browser }) => {
  const clinicianCtx = await browser.newContext();
  const patientCtx = await browser.newContext();
  const clinician = await clinicianCtx.newPage();
  const patient = await patientCtx.newPage();

  await clinician.goto('/consulto/TEST-SESSION/clinico');
  await patient.goto('/consulto/TEST-SESSION/paziente');

  await expect
    .poll(async () => (await readStats(clinician)).connectionState, { timeout: 20_000 })
    .toBe('connected');

  const stats = await readStats(clinician);

  // Il media scorre davvero, non è solo "connected".
  expect(stats.inboundVideoBytes).toBeGreaterThan(0);

  // Controllo di sicurezza: nessuna cipher suite NULL (vedi §5.2).
  expect(stats.dtlsState).toBe('connected');
  expect(stats.srtpCipher).not.toBeNull();
  expect(stats.srtpCipher!.toUpperCase()).not.toContain('NULL');
});
```

### 11.4 Verificare il fallback su TURN in CI

Questo è il test che D10 richiede esplicitamente. Due approcci, complementari:

**(a) Forzatura tramite `iceTransportPolicy: "relay"`.**
La build di test configura `RTCConfiguration.iceTransportPolicy = "relay"`, che **scarta tutti i candidati non-relay**. Se la sessione si stabilisce comunque, il percorso TURN funziona. Assertion: entrambi i `candidateType` valgono `"relay"`.

```typescript
test('fallback TURN - la sessione si stabilisce con soli candidati relay', async ({ browser }) => {
  const ctx = await browser.newContext();
  const page = await ctx.newPage();
  // La build di test legge questo parametro e forza iceTransportPolicy.
  await page.goto('/consulto/TEST-RELAY/clinico?forceRelay=1');
  // ... apertura del secondo peer ...

  await expect
    .poll(async () => (await readStats(page)).connectionState, { timeout: 30_000 })
    .toBe('connected');

  const stats = await readStats(page);
  expect(stats.localCandidateType).toBe('relay');
  expect(stats.remoteCandidateType).toBe('relay');
});
```

**(b) Simulazione di NAT ostile con netfilter.**
Più realistico ma più complesso: in Docker Compose, si isolano i due client in reti separate e si bloccano i pacchetti UDP diretti fra loro, lasciando aperto solo il percorso verso il TURN. Verifica il comportamento *reale* di ICE, non un percorso forzato.

**Entrambi vanno implementati.** (a) è veloce e gira su ogni PR; (b) è un test di integrazione notturno.

**Terzo test, di sicurezza - obbligatorio (§4.5):**

```typescript
test('coturn - il relay verso indirizzi interni è negato', async () => {
  const cred = await issueTestTurnCredential();
  const forbidden = [
    '127.0.0.1',
    '::ffff:127.0.0.1',     // forma IPv4-mapped: il bypass storico
    '169.254.169.254',      // metadata cloud
    '10.0.0.1',
    '192.168.1.1',
    '0.0.0.0',              // CVE-2020-26262
  ];
  for (const peer of forbidden) {
    const result = await turnCreatePermission(cred, peer);
    expect(result.success, `Il relay verso ${peer} DEVE essere negato`).toBe(false);
  }
});
```

Questo test appartiene alla suite di sicurezza (D10) ed è tracciabile come **misura di controllo del rischio** nel file di gestione rischi ISO 14971.

### 11.5 Strumenti diagnostici

- **`chrome://webrtc-internals`**: la fonte di verità durante il debug. Grafici in tempo reale di tutte le statistiche, dump completo degli eventi della PeerConnection (createOffer, setLocalDescription, candidati, cambi di stato), e **export in JSON** del dump. Il JSON è archiviabile come allegato a una segnalazione di problema - utile per il processo di Post-Market Surveillance MDR.
- **`about:webrtc`** in Firefox: equivalente, con log del signaling.
- Cattura via **`RTCPeerConnection` event logging applicativo**: registrare lato applicazione ogni transizione di `iceConnectionState`, `connectionState`, `signalingState`, `iceGatheringState` con timestamp, e persisterla come parte dell'audit di sessione. Con Envers su un'entità `SessionEvent` questo diventa **tracciabilità non ripudiabile** (V5) del comportamento tecnico della sessione, non solo del suo esito clinico.

---

## 12. Accessibilità del real-time

### 12.1 Che cosa esige WCAG 2.1 AA sui media sincronizzati

I criteri pertinenti (WCAG 2.1, Linea guida 1.2 *Time-based Media*):

- **1.2.4 Captions (Live) - Livello AA**: *"Captions are provided for all live audio content in synchronized media."* Questo è il criterio che si applica a una televisita, ed è **di livello AA**, cioè **dentro il perimetro dichiarato dal progetto** (V6: WCAG 2.1 AA come requisito funzionale).
- **1.2.9 Audio-only (Live) - Livello AAA**: fuori perimetro.
- **1.2.5 Audio Description (Prerecorded) - AA**: si applica a media **preregistrati**, quindi eventualmente alle registrazioni riprodotte, non alla sessione live.

Criteri collaterali ma sostanziali per una videochiamata:

- **2.2.1 Timing Adjustable (A)**: se esiste un timeout di sessione, deve essere estendibile o disattivabile.
- **1.4.1 Use of Color (A)**: gli stati (connesso, in registrazione, qualità degradata) non possono essere veicolati **solo** dal colore. Rilevante per l'indicatore di registrazione (§10.4) e per l'indicatore di qualità (§8.5).
- **2.1.1 Keyboard (A)** e **2.4.7 Focus Visible (AA)**: mute, camera on/off, fine chiamata, condivisione schermo devono essere raggiungibili e attivabili da tastiera, con focus visibile.
- **4.1.3 Status Messages (AA)**: i cambi di stato (l'altro partecipante si è unito, la connessione si è degradata, la registrazione è iniziata) devono essere annunciati agli screen reader tramite `aria-live` senza spostare il focus.

### 12.2 Che cosa è realmente esigibile

**Va detto con franchezza**: 1.2.4 (Captions Live, AA) è **il criterio WCAG più costoso da soddisfare in assoluto** in un'applicazione di videochiamata. Richiede riconoscimento vocale in tempo reale, e per il dominio medico italiano - con terminologia clinica, farmaci, nomi propri, accenti regionali - un ASR generico produce risultati che possono essere **peggiori dell'assenza di sottotitoli**, perché introducono errori in un contesto clinico.

Le opzioni, valutate onestamente:

| Opzione | Sovranità (V1) | Qualità | Costo | Valutazione |
|---|---|---|---|---|
| **API ASR cloud** | ❌ La maggior parte dei servizi maturi è US-based | Alta | Basso | **Incompatibile con V1.** Inoltre invierebbe l'audio clinico a un terzo: problema GDPR grave. |
| **`SpeechRecognition` (Web Speech API)** | ❌ Nei browser Chromium l'implementazione tipicamente inoltra l'audio a un servizio remoto | Media | Nullo | **Da escludere**: rompe l'E2E e la sovranità in modo non evidente all'utente. Trappola sottile. |
| **ASR self-hosted UE** (modelli open weight eseguiti su infrastruttura propria) | ✅ | Media-alta, migliorabile con dizionari di dominio | Alto (GPU, MLOps) | **Tecnicamente la sola opzione coerente**, ma richiede che l'audio sia decifrato da qualche parte. Se gira **nel browser** (WASM/WebGPU), preserva l'E2E ma costa CPU/GPU al client durante la chiamata. |
| **Stenotipia / sottotitolazione umana** | ✅ | Massima | Molto alto per sessione | Praticabile come **servizio su richiesta** per il paziente che lo necessita, non come funzione sempre attiva. |
| **Interprete LIS come terzo partecipante** | ✅ | Massima per utenti sordi segnanti | Organizzativo | **È la soluzione giusta per il caso d'uso reale.** Rientra nella mesh a 3 (§6.2). |

**Raccomandazione onesta per la v1.0:**

1. **Soddisfare pienamente tutti i criteri WCAG 2.1 AA diversi da 1.2.4.** Sono raggiungibili, verificabili automaticamente (axe-core in CI) e manualmente, e coprono la grande maggioranza delle barriere reali.
2. **Su 1.2.4, non dichiarare conformità piena senza averla.** Dichiarare una **non-conformità parziale documentata** con la misura alternativa adottata. Questo è precisamente ciò che la **dichiarazione di accessibilità** prevista da EN 301 549 e dalla normativa italiana richiede: onestà sui limiti, non silenzio.
3. **Implementare il percorso "interprete come terzo partecipante"** con supporto esplicito nella UI (etichetta di ruolo, layout che privilegia il video dell'interprete, ordine di focus corretto). È la misura alternativa più efficace, ed è già supportata dalla topologia mesh a 3.
4. **Progettare l'architettura del sottotitolaggio** in modo che si possa innestare in seguito: un `RTCDataChannel` dedicato al trasporto dei sottotitoli, con un formato messaggio versionato, in modo che qualunque motore ASR (client-side o interprete umano che digita) possa alimentarlo senza cambiare l'applicazione.

**Nota su EN 301 549 e sull'European Accessibility Act**: per il settore pubblico (ASL/USL, telemedicina regionale - caso d'uso dichiarato) la conformità non è opzionale ed è soggetta a verifica. La dichiarazione di accessibilità va prodotta, non improvvisata.

---

## 13. Raccomandazioni architetturali per Telemedic

**R1 - Mantenere P2P come topologia primaria e dichiarare il limite di 3 partecipanti.**
P2P per 1:1, mesh per il terzo partecipante (interprete, caregiver, secondo specialista). Nessun SFU nella v1.0. Il limite va **scritto** nella documentazione e **applicato** dal codice, con un errore chiaro al quarto partecipante. Un limite dichiarato è una scelta di ingegneria; un degrado silenzioso è un difetto.

**R2 - Riformulare i tre claim pubblici problematici.**
- *End-to-end*: corretto in P2P **e** attraverso il TURN, ma **condizionato all'integrità del signaling**. Aggiungere la verifica SAS fuori banda (R3) per renderlo verificabile.
- *FIPS 140-2*: **rimuovere**. Sostituire con l'elenco degli algoritmi effettivamente negoziati, riferimenti ETSI/SOG-IS, e la capacità di **registrare e mostrare** la cipher suite di ogni sessione.
- *< 200 ms*: **disambiguare**. Dichiarare la metrica (glass-to-glass o mouth-to-ear), ancorarla a ITU-T G.114, e sostituire la promessa con una **capacità di misura e notifica**.

**R3 - Implementare la Short Authentication String.**
Derivare dalle due fingerprint DTLS una stringa breve o un pattern visivo, mostrarla a entrambi i partecipanti, chiedere loro di confrontarla a voce. È l'unica contromisura al MITM del server di signaling (§5.3) che non dipenda da API browser dal supporto incerto. Costo di implementazione basso; è la differenza fra "sostenere" e "dimostrare" l'end-to-end. Progettare con l'agente accessibilità (leggibile da screen reader, non basata sul colore).

**R4 - Credenziali TURN effimere, sempre. Nessuna credenziale statica, mai.**
`use-auth-secret` + `static-auth-secret` da secret manager, TTL 300–3600 s, endpoint di emissione autenticato con JWT Keycloak, autorizzato sulla partecipazione al consulto, rate-limited. Il `subject` nella credenziale è un identificativo **opaco** di sessione, mai un identificativo di paziente. Documentare che il meccanismo deriva da un Internet-Draft scaduto, non da uno standard.

**R5 - Hardening del TURN come requisito di sicurezza di primo livello, non di configurazione.**
`denied-peer-ip` in default-deny includendo le forme IPv4-mapped IPv6; `no-multicast-peers`; `no-tcp-relay`; quote; **isolamento di rete della DMZ senza rotte verso l'interno**; nessun servizio co-locato; metadata cloud disabilitato. **Test automatico in CI** che tenta il relay verso loopback/RFC1918/metadata e fallisce la build se una qualunque richiesta ha successo. Tracciare come misura di controllo del rischio ISO 14971.

**R6 - Cluster TURN senza stato: N nodi indipendenti, stesso segreto HMAC, tutti in `iceServers`.**
La ridondanza la fa ICE. Nessun database condiviso di allocazioni, nessun load balancer con affinità, nessun anycast.

**R7 - Registrazione client-side con cifratura applicativa nel browser.**
Preserva l'E2E, riduce il perimetro GDPR e MDR. Verificare il supporto del contenitore MP4 con `MediaRecorder.isTypeSupported()` e, se assente, **correggere il claim pubblico** o risolvere la questione del remux (§10.4). Indicatore di registrazione persistente, accessibile e non occultabile.

**R8 - Signaling WebSocket nativo, senza STOMP e senza SockJS, con routing deterministico della sessione.**
La macchina a stati della sessione vive in un unico processo, determinato da hashing consistente sul `sessionId`. Elimina il backplane dal percorso critico e soddisfa il requisito di ordinamento di RFC 8838 §9. Se il tempo impone lo sticky session, registrarlo come debito tecnico in un ADR con la strategia di uscita.

**R9 - Ruoli polite/impolite assegnati dal server: paziente polite, professionista impolite.**
In mesh a 3, ordinamento lessicografico deterministico dei `participantId`. Perfect negotiation come da §2.3, con `setLocalDescription()` senza argomenti.

**R10 - Trasformare le metriche di qualità in un controllo di rischio clinico.**
Non limitarsi a graficare. Al superamento delle soglie "inadeguato" (§8.5), **informare il professionista** che le condizioni tecniche potrebbero non essere adatte alla valutazione in corso, offrire il rinvio, e **registrare l'evento nell'audit trail**. Registrare in ogni sessione `srtpCipher`, `dtlsCipher`, `tlsVersion`, `candidateType` come prova documentale.

**R11 - `degradationPreference` derivata dalla specialità clinica.**
`maintain-resolution` per dermatologia e lettura di documenti; `maintain-framerate` per neurologia, fisiatria e psichiatria. Esporre la scelta all'utente. **Verificare con l'agente compliance** che l'esposizione della preferenza come scelta dell'utente, e non come adattamento automatico guidato dal contenuto, resti fuori dalla regola 11 MDR.

**R12 - Opus con `useinbandfec=1` e `usedtx=0`.**
FEC in-band raccomandato da RFC 8854 §4.1 e funzionalmente critico per l'intelligibilità. DTX disattivato perché in un consulto i suoni non vocali possono avere valore. Documentare la scelta come clinica.

**R13 - Non forzare la preferenza dei codec nella v1.0.**
Lasciare negoziare, misurare l'uso reale via `RTCCodecStats.mimeType`, decidere sui dati. Valutare `scalabilityMode: "L1T2"` o `"L1

T3"` per la resilienza temporale a costo marginale, misurandone l'effetto su `freezeCount`.

**R14 - Ancorare il testing WebRTC a fixture deterministiche.**
File Y4M con timecode leggibile a schermo per la misura automatica della latenza glass-to-glass in CI; profili `netem` costanti e condivisi (§11.2); doppio `BrowserContext` Playwright; test di fallback TURN sia forzato (`iceTransportPolicy: "relay"`) sia realistico (isolamento di rete Docker). Documentare che il throttling di Chrome DevTools **non** agisce sul traffico UDP di WebRTC.

**R15 - WCAG 2.1 AA pieno tranne 1.2.4, con non-conformità dichiarata e misura alternativa.**
Interprete come terzo partecipante supportato nativamente; `RTCDataChannel` dedicato ai sottotitoli con formato messaggio versionato, per innestare in futuro un ASR self-hosted UE senza riprogettare. **Escludere esplicitamente** la Web Speech API dei browser Chromium: inoltra l'audio a un servizio remoto, violando E2E e sovranità in modo non evidente all'utente.

---

## 14. Rischi tecnici identificati

Classificazione: **CRITICO** (blocca il rilascio o compromette il posizionamento), **ALTO** (richiede mitigazione prima della v1.0), **MEDIO** (da tracciare e documentare).

| # | Rischio | Sev. | Descrizione e mitigazione |
|---|---|---|---|
| **T1** | **Relay TURN verso loopback / rete interna (SSRF di trasporto)** | **CRITICO** | Ogni paziente autenticato riceve, per progetto, una credenziale TURN valida. Senza restrizioni, quella credenziale è un proxy UDP verso qualunque destinazione, incluso `127.0.0.1` del TURN server, la rete interna e i metadata cloud. Precedente confermato: CVE-2020-26262 (`XOR-PEER-ADDRESS = 0.0.0.0`); pattern di bypass tramite `::ffff:127.0.0.1` per canonicalizzazione insufficiente. RFC 8656 **non** impone difese: §21.2.2 delega all'operatore. **Mitigazione: R5, a più strati - configurazione + isolamento di rete + test in CI.** Il solo `denied-peer-ip` non basta, perché è precisamente ciò che i bypass storici hanno aggirato. |
| **T2** | **Il server di signaling può eseguire un MITM sul media** | **CRITICO** | RFC 8827 §9.1: *"Even if HTTPS is used, the signaling server can potentially mount a man-in-the-middle attack unless implementations have some mechanism for independently verifying keys."* RFC 8122 §7 conferma che la sicurezza del fingerprint dipende dall'integrità del canale di segnalazione. **Il claim di end-to-end, senza verifica indipendente, è un'asserzione di fiducia nell'operatore, non una proprietà crittografica dimostrabile.** Mitigazione: R3 (SAS). Senza R3, il claim va formulato con la condizione esplicita. |
| **T3** | **Claim "FIPS 140-2" obsoleto due mesi prima della v1.0** | **CRITICO** (reputazionale/documentale) | Il 21 settembre 2026 il CMVP dichiara *historical* tutti i certificati FIPS 140-2 residui; le sottomissioni 140-2 sono chiuse da aprile 2022. La v1.0 è prevista per il 30 novembre 2026. Il claim è inoltre errato di categoria (FIPS valida moduli, non cipher), non verificabile (la cifratura avviene nel browser dell'utente, su moduli fuori dal controllo di Telemedic) e incoerente col posizionamento di sovranità europea. Mitigazione: R2 - rimozione e sostituzione. |
| **T4** | **Il claim "< 200 ms" non è verificabile né difendibile così com'è** | **ALTO** | Metrica non specificata; se riferita all'RTT di rete è banale, se riferita al glass-to-glass non è garantibile perché dipende da telecamera, CPU, display, rete e jitter buffer - quasi tutti fuori dal controllo del progetto. Il jitter buffer, contributo dominante, **cresce deliberatamente** quando la rete peggiora: un target rigido di latenza è in tensione diretta con la qualità audio. Mitigazione: R2 + R10 (misurare e notificare invece di promettere). |
| **T5** | **Il claim "peer-to-peer" è topologicamente falso per una quota delle sessioni** | **ALTO** | Con NAT endpoint-dependent su entrambi i lati - scenario ordinario su CGNAT mobile e reti ospedaliere - nessuna coppia diretta è valida e il relay è obbligatorio (RFC 8835 §3.4). La cifratura resta end-to-end (il TURN non ha le chiavi), ma la topologia non è P2P. Mitigazione: riformulare in "cifrato end-to-end, instradato direttamente quando la rete lo consente"; misurare la quota reale via `candidateType` (§8.4) invece di stimarla. |
| **T6** | **Il TURN tratta metadati che sono dati relativi alla salute** | **ALTO** | Chi ha parlato con chi, quando, per quanto, da quale IP. In ambito sanitario, il solo fatto del consulto con uno specialista è un dato relativo alla salute (GDPR art. 9). Mitigazione: logging minimizzato, `subject` opaco nella credenziale (R4), retention breve documentata, collocazione UE (V1), inserimento nel registro dei trattamenti e nella DPIA. |
| **T7** | **"Key rotation per sessione": affermazione ambigua** | **MEDIO** | Vero che ogni sessione ha materiale nuovo; **non verificato** che esista rotazione intra-sessione. La rinegoziazione DTLS 1.2 non è supportata dai browser; il comportamento di `KeyUpdate` DTLS 1.3 rispetto alle chiavi SRTP estratte via exporter (RFC 5764 §4.2) non è verificato. L'ICE restart **non** rifà l'handshake DTLS. RFC 3711 §9.2 mostra comunque che i limiti di vita chiave non sono avvicinabili in un consulto. Mitigazione: riformulare come "materiale crittografico generato ex novo per ogni sessione, senza riuso". |
| **T8** | **Contenitore MP4 non garantito da `MediaRecorder`** | **MEDIO** | La feature 6 dichiara MP4. `video/webm` è il formato ampiamente supportato; MP4 va verificato per browser con `isTypeSupported()`. Un remux server-side contraddirebbe la scelta di cifrare nel browser (non si rimuxa contenuto cifrato senza decifrarlo). Mitigazione: verificare, e correggere il claim o risolvere l'architettura di remux prima della v1.0. **Questione aperta.** |
| **T9** | **Il carico CPU della registrazione client-side può degradare la chiamata** | **MEDIO** | Comporre due flussi (`canvas.captureStream()` + `AudioContext`) e codificarli in parallelo a encode/decode della sessione è oneroso su hardware modesto. Rischio di causare proprio il degrado di qualità che il sistema deve evitare. Mitigazione: misurare su hardware di riferimento basso; disattivare la registrazione se `qualityLimitationReason === "cpu"` persiste, informando l'utente. |
| **T10** | **mDNS penalizza lo scenario "medico e paziente sulla stessa LAN"** | **MEDIO** | Con mDNS bloccato dagli AP Wi-Fi enterprise (client isolation), la coppia host-host non si forma e si finisce sul relay per una connessione che poteva restare su switch locale. Mitigazione: documentare il requisito di rete (mDNS UDP 5353 multicast consentito) nella guida di deployment on-premise; misurare l'incidenza. |
| **T11** | **Congestion control e bitrate adattivo non sono codice di Telemedic** | **MEDIO** | GCC è nel browser; transport-cc è un Internet-Draft **scaduto nel 2016**, mai adottato dalla IETF, standardizzato di fatto dall'implementazione. RFC 8834 conferma che non esiste un algoritmo standard. Il progetto configura e osserva, non implementa. Mitigazione: riformulare la feature 1 di conseguenza; evitare di rivendicare lavoro non svolto. |
| **T12** | **HMAC-SHA1 nella credenziale TURN contraddice la narrativa "solo algoritmi moderni"** | **MEDIO** | Imposto da coturn e dal long-term credential mechanism di STUN (RFC 8489 §9.2), non scelto da Telemedic. Non è una vulnerabilità (HMAC-SHA1 resta robusto), ma è un fatto che va dichiarato preventivamente, prima che lo trovi un auditor. |
| **T13** | **Nessun clustering nativo in coturn: la caduta di un nodo termina le allocazioni** | **MEDIO** | Non esiste stato condiviso fra nodi. Mitigazione: R6 - N nodi indipendenti tutti in `iceServers`, ridondanza affidata a ICE; ICE restart come recupero. |
| **T14** | **WCAG 1.2.4 (Captions Live, AA) non è realisticamente soddisfabile in v1.0 nel rispetto di V1** | **MEDIO** | Le opzioni ASR mature sono cloud US-based (incompatibili con V1 e con l'E2E); la Web Speech API dei browser Chromium inoltra l'audio a un servizio remoto in modo non evidente all'utente. Mitigazione: R15 - conformità piena su tutto il resto, non-conformità dichiarata su 1.2.4, interprete come misura alternativa, architettura predisposta. |
| **T15** | **coturn è un servizio esposto a Internet: la cadenza di patching è un obbligo, non una buona pratica** | **MEDIO** | Il progetto ha rilasciato numerose versioni nel 2026 correggendo fra l'altro bypass dei controlli sui peer. Mitigazione: canale di aggiornamento tracciato con SLA definito nel piano PMS (D6); coturn come SOUP censito ai sensi di IEC 62304 §8.1.2. |
| **T16** | **La versione di coturn e diverse direttive di configurazione non sono state verificate** | **MEDIO** (di processo) | Le fonti secondarie hanno restituito numeri di versione e di CVE non confermabili su fonte primaria in questa ricerca; alcune direttive citate nel mandato non compaiono nella man page upstream (§4.3). Mitigazione: **nessuna direttiva e nessun numero di CVE va pubblicato senza verifica su `turnserver --help` della versione deployata e su NVD/GHSA.** |

---

## 15. Questioni aperte per gli altri agenti

### Per l'agente Architettura (`docs/02_architecture/`, `docs/adr/`)

1. **Scalabilità del signaling**: routing deterministico per `sessionId` (raccomandato) o sticky session? Serve un **ADR** con la strategia di uscita se si sceglie la seconda. Vincolo tecnico da rispettare: RFC 8838 §9 richiede consegna dei candidati **esattamente una volta e in ordine** - Redis Pub/Sub semplice non lo garantisce.
2. **Topologia mesh a 3**: dove vive la logica di orchestrazione delle N-1 PeerConnection? Come si assegnano deterministicamente i ruoli polite/impolite? Come si divide il budget di upload fra i peer?
3. **Boundary architetturale del recording**: se client-side (R7), come si gestisce il fallimento dell'upload a chiamata conclusa? Serve una coda di upload resiliente lato browser?
4. **Numero e collocazione dei nodi TURN**: quanti, in quali regioni UE, con quale strategia di annuncio al client? Il dimensionamento di §3.6 va convertito in una capacity plan.

### Per l'agente Protocolli (`docs/04_protocols/`)

5. **Definizione formale del protocollo di signaling di Telemedic**: schema JSON versionato dei messaggi, macchina a stati della sessione, mappatura fra `onicecandidate(null)` e l'indicazione `end-of-candidates` di RFC 8838 §13, semantica del riavvio ICE. È il deliverable protocollare centrale e questa ricerca ne fornisce i vincoli, non il contenuto.
6. **Formato del canale sottotitoli** su `RTCDataChannel` (R15): messaggio versionato, con timestamp, marcatore di finalità (interim/final) e identificativo del parlante.
7. **Verifica delle direttive coturn non confermate** (§4.3, T16) e produzione della configurazione di riferimento definitiva.

### Per l'agente Sicurezza (`docs/06_security/`)

8. **Threat model STRIDE del piano media e del signaling**, con T1 e T2 come voci di primo livello. T2 in particolare va modellato come minaccia *dall'operatore stesso*, non solo verso l'operatore.
9. **Progettazione della Short Authentication String** (R3): derivazione dalle fingerprint, rappresentazione (parole? emoji? pattern?), flusso di verifica, comportamento in caso di mancata corrispondenza. Coordinare con l'agente accessibilità.
10. **Riscrittura completa della sezione crittografica** eliminando ogni riferimento a FIPS 140-2 (T3) e sostituendolo con ETSI TS 119 312 / SOG-IS / linee guida AgID-ACN, più la capacità di registrare `srtpCipher`/`dtlsCipher`/`tlsVersion` per sessione.
11. **Verifica su fonte primaria** dei CVE coturn e delle versioni corrette (T16), prima di qualunque citazione pubblica.
12. **Stato dell'API Identity Provider di RFC 8827 §7** nei browser target: è utilizzabile oggi o è di fatto abbandonata? Determina se R3 è l'unica strada o una fra due.

### Per l'agente Compliance / MDR (`docs/08_compliance/`)

13. **Le soglie di qualità e la notifica al professionista (R10) come controllo di rischio ISO 14971**: è la misura con maggiore rilevanza per il fascicolo tecnico emersa da questa ricerca. Va formalizzata come requisito tracciabile.
14. **`degradationPreference` per specialità (R11)**: esporla come preferenza dell'utente resta fuori dalla regola 11 MDR, o l'associazione esplicita a una specialità clinica costituisce già "informazione usata per decisioni diagnostiche"? Serve una posizione argomentata.
15. **Disattivazione di AEC/NS/AGC per specialità** (§7.2): se il suono viene usato per una valutazione semeiologica (respiro, tosse, sibili), si entra nel perimetro diagnostico? Stessa domanda di forma diversa.
16. **Esistono requisiti tecnici minimi nelle indicazioni nazionali italiane per l'erogazione di prestazioni in telemedicina** (risoluzione, frame rate, latenza)? Questa ricerca non li ha verificati e le soglie di §8.5 sono una proposta ingegneristica, non normativa. Se esistono, prevalgono.
17. **coturn come SOUP ai sensi di IEC 62304 §8.1.2**: censimento, giustificazione dell'uso, piano di sorveglianza delle vulnerabilità (T15).
18. **DPIA del trattamento di metadati sul TURN** (T6): finalità, base giuridica, retention, minimizzazione.

### Per l'agente Frontend / Angular (`docs/01_technical/`)

19. **Verifica del supporto `MediaRecorder` per `video/mp4`** sui browser target (T8) e decisione sul contenitore.
20. **Misura del carico CPU della registrazione client-side** su hardware di riferimento basso (T9), con la soglia di disattivazione automatica.
21. **Implementazione di `getStats()` con differenziazione corretta dei contatori cumulativi** (§8.3) - errore comune che produce grafici privi di senso.
22. **Esposizione controllata della `RTCPeerConnection` alle build di test** (§11.3) senza esporla in produzione.

### Per l'agente Accessibilità

23. **Progettazione della SAS accessibile** (R3, punto 9): leggibile da screen reader, non veicolata dal colore, comprensibile a un paziente anziano.
24. **Indicatore di registrazione** (R7): persistente, non occultabile, annunciato via `aria-live`, non basato sul solo colore (WCAG 1.4.1).
25. **Dichiarazione di accessibilità** con la non-conformità su 1.2.4 e la misura alternativa (R15, T14). Formulazione conforme a EN 301 549.
26. **Layout e ordine di focus per il terzo partecipante interprete** nella mesh a 3.

### Per l'agente Testing (`docs/01_technical/`, CI)

27. **Produzione delle fixture Y4M con timecode** e dell'infrastruttura OCR per la misura automatica della latenza glass-to-glass (R14) - è ciò che rende verificabile il target di §9.
28. **Profili `netem` come costanti condivise** (§11.2) e loro applicazione in Docker Compose di test.
29. **Implementazione dei tre test TURN**: fallback forzato, fallback realistico, e il test di sicurezza sul relay verso indirizzi interni (§11.4) - quest'ultimo va collegato al file di gestione rischi.
30. **Verifica dei flag Chrome non confermati** (`--use-file-for-fake-audio-capture` e altri, §11.1) sulla versione in uso in CI.

---

## Appendice A - Indice dei riferimenti normativi citati

**IETF - architettura WebRTC**: RFC 8825 (overview), 8826 (security considerations), 8827 (security architecture), 8829 (JSEP), 8831 (data channels), 8832 (DCEP), 8834 (RTP), 8835 (transports), 8836 (congestion control requirements), 8837 (DSCP), 8854 (FEC requirements), 8864 (data channel in SDP).

**IETF - SDP e negoziazione**: RFC 3264 (offer/answer), 8866 (SDP), 8839 (SDP per ICE), 8840 (SIP trickle), 8842 (SDP per DTLS-SRTP), 8843 (BUNDLE), 8851/8852 (RID e simulcast), 8285 (header extension).

**IETF - NAT traversal**: RFC 8445 (ICE), 8489 (STUN), 8656 (TURN), 8838 (Trickle ICE), 6062 (TURN TCP), 6544 (ICE-TCP), 7635 (STUN third-party auth), 4787 (NAT behavior). Obsoleti: 5245, 5389, 5766, 6156, 6336.

**IETF - sicurezza media**: RFC 3711 (SRTP), 5764 (DTLS-SRTP), 7714 (AES-GCM per SRTP), 6347 (DTLS 1.2), 9147 (DTLS 1.3), 8122 (fingerprint SDP), 5763 (framework SRTP/DTLS), 7983 e 9443 (multiplexing), 9605 (SFrame), 8723 (Double SRTP), 8870 (EKT).

**IETF - RTP e resilienza**: RFC 3550 (RTP), 3611 (RTCP XR), 4585 (AVPF, NACK, PLI), 5104 (CCM, FIR, TMMBR), 4588 (RTX), 2198 (RED), 5109 (ULPFEC), 8627 (FlexFEC), 5506 (RTCP ridotto), 5761 (rtcp-mux), 4961 (RTP simmetrico), 5124 (SAVPF), 8083 (circuit breaker), 8888 (CCFB), 6464 (audio level).

**IETF - codec**: RFC 6716 (Opus), 7587 (payload Opus), 7742 (codec video WebRTC), 7874 (codec audio WebRTC), 6386 (VP8), 7741 (payload VP8), 6184 (payload H.264).

**Internet-Draft non normativi citati come tali**: `draft-holmer-rmcat-transport-wide-cc-extensions` (scaduto 2016), `draft-ietf-rmcat-gcc`, `draft-ietf-mmusic-mdns-ice-candidates` (scaduto 2022), `draft-uberti-behave-turn-rest` (scaduto).

**W3C**: *WebRTC: Real-Time Communication in Browsers* (Recommendation, 13 marzo 2025); *Identifiers for WebRTC's Statistics API* (Candidate Recommendation Draft, 25 settembre 2025); *Scalable Video Coding (SVC) Extension for WebRTC* (Working Draft, 17 agosto 2024); *WebRTC Encoded Transform* (Working Draft, 25 giugno 2026); *Media Capture and Streams*; *MediaStream Recording*; *Web Cryptography API*; *WCAG 2.1*.

**ITU-T**: G.114 (one-way transmission time), G.107 / G.107.1 / G.107.2 (E-model), G.113 App. I (fattori Ie), P.1203 / P.1204 (QoE streaming, **non applicabili** al real-time).

**Altri**: FIPS 140-2 / 140-3 e programma CMVP (sunset 140-2: **21 settembre 2026**); ETSI TS 119 312; SOG-IS Agreed Cryptographic Mechanisms; EN 301 549; ISO 14971; IEC 62304; MDR 2017/745.

---

## Appendice B - Elenco delle affermazioni NON verificate

Da ripetere in verifica prima di qualunque pubblicazione:

1. Versione più recente di coturn e cronologia delle release 2026.
2. Numeri di CVE coturn del 2026 e versioni corrette corrispondenti.
3. Presenza/assenza delle direttive coturn: `no-rfc5780`, `no-stun-backward-compatibility`, `response-origin-only-with-rfc5780`, `no-tlsv1`, `no-tlsv1_1`, `dh2066`, `no-cli`, `no-udp`, `no-software-attribute`, `unauthorized-ratelimit`, `keep-address-family`.
4. Elenco esatto delle metriche esposte dall'exporter Prometheus di coturn.
5. Stato del supporto DTLS 1.3 e versioni/date del cambio di default in libwebrtc.
6. Comportamento di `KeyUpdate` DTLS 1.3 rispetto alle chiavi SRTP estratte via exporter (T7).
7. Supporto browser dell'API Identity Provider di RFC 8827 §7.
8. Licenze upstream di Jitsi Videobridge, LiveKit, ion-sfu, Pion; stato di manutenzione di ion-sfu.
9. Supporto AV1 in WebRTC per browser e piattaforma; cifre di adozione.
10. Flag Chrome `--use-file-for-fake-audio-capture`, `--auto-accept-camera-and-microphone-capture` e requisiti di formato audio; preferenze Firefox `media.navigator.streams.fake`, `media.navigator.permission.disabled`.
11. Valore `"maintain-framerate-and-resolution"` di `RTCDegradationPreference` (riportato da MDN, non confermato sulla Recommendation W3C).
12. Membro `RTCRtpReceiver.jitterBufferTarget`: stato di specifica e supporto.
13. Presenza di coefficienti `Ie-eff` per Opus in ITU-T G.113 App. I e copertura di Opus in G.107.2.
14. Supporto di RTCP XR (RFC 3611) nei browser.
15. Soglie GCC di perdita per incremento/riduzione del bitrate.
16. Esistenza di requisiti tecnici minimi nelle indicazioni nazionali italiane per la telemedicina.
17. Supporto di `video/mp4` in `MediaRecorder` per browser target.
18. Tutte le cifre marcate `[ordine di grandezza]`: budget di latenza (§9.2), overhead FEC Opus, costo relativo dei keyframe, efficienza relativa VP9/VP8, throughput coturn per core, quota di sessioni relayed.

---

**Fonti primarie consultate**: [RFC 8825](https://datatracker.ietf.org/doc/html/rfc8825), [RFC 8827](https://datatracker.ietf.org/doc/html/rfc8827), [RFC 8829](https://datatracker.ietf.org/doc/html/rfc8829), [RFC 8834](https://datatracker.ietf.org/doc/html/rfc8834), [RFC 8835](https://datatracker.ietf.org/doc/html/rfc8835), [RFC 8843](https://datatracker.ietf.org/doc/html/rfc8843), [RFC 8838](https://datatracker.ietf.org/doc/html/rfc8838), [RFC 8839](https://datatracker.ietf.org/doc/html/rfc8839), [RFC 8445](https://datatracker.ietf.org/doc/html/rfc8445), [RFC 8656](https://datatracker.ietf.org/doc/html/rfc8656), [RFC 5764](https://datatracker.ietf.org/doc/html/rfc5764), [RFC 7714](https://datatracker.ietf.org/doc/html/rfc7714), [RFC 8122](https://datatracker.ietf.org/doc/html/rfc8122), [RFC 8723](https://datatracker.ietf.org/doc/html/rfc8723), [RFC 9605](https://datatracker.ietf.org/doc/html/rfc9605), [RFC 8854](https://datatracker.ietf.org/doc/html/rfc8854), [RFC 8888](https://datatracker.ietf.org/doc/html/rfc8888), [RFC 3611](https://datatracker.ietf.org/doc/html/rfc3611), [RFC 7742](https://datatracker.ietf.org/doc/html/rfc7742), [RFC 7587](https://datatracker.ietf.org/doc/html/rfc7587), [W3C WebRTC](https://www.w3.org/TR/webrtc/), [W3C WebRTC Statistics](https://www.w3.org/TR/webrtc-stats/), [W3C WebRTC SVC](https://www.w3.org/TR/webrtc-svc/), [W3C WebRTC Encoded Transform](https://www.w3.org/TR/webrtc-encoded-transform/), [MDN Perfect Negotiation](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API/Perfect_negotiation), [coturn turnserver.conf](https://raw.githubusercontent.com/coturn/coturn/master/examples/etc/turnserver.conf), [coturn turnserver.1](https://raw.githubusercontent.com/coturn/coturn/master/man/man1/turnserver.1), [mediasoup LICENSE](https://raw.githubusercontent.com/versatica/mediasoup/v3/LICENSE), [Janus COPYING](https://raw.githubusercontent.com/meetecho/janus-gateway/master/COPYING), [BoringSSL FIPS.md](https://boringssl.googlesource.com/boringssl/+/master/crypto/fipsmodule/FIPS.md), [webrtc.org testing](https://webrtc.github.io/webrtc-org/testing/), [NIST CSRC FIPS 140-3 Transition](https://csrc.nist.gov/projects/fips-140-3-transition-effort), [ITU-T G.114](https://www.itu.int/rec/dologin_pub.asp?lang=e&id=T-REC-G.114-200305-I%21%21PDF-E), [Enable Security - coturn hardening](https://www.enablesecurity.com/blog/coturn-security-configuration-guide/), [CVE-2020-26262](https://app.opencve.io/cve/CVE-2020-26262).