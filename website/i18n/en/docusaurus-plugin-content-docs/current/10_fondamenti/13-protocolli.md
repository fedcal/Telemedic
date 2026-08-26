---
title: The protocols, one by one
sidebar_position: 14
description: A reasoned catalogue of every protocol Telemedic speaks - transport, web, application interfaces, identity, healthcare integration, events, real time - with the problem solved, the mechanism, the use in the project, the typical errors and the alternatives rejected.
---

# The protocols, one by one

A telemedicine system is not an application: it is a **conversation between machines that do
not know one another**. A third-party healthcare management system creates an appointment; a
browser downloads a page; two devices exchange audio and video across networks that do not
want to let them through; an end-of-session event reaches a system that might be switched off
at that moment; a report ends up in a national infrastructure. Each of these conversations
has rules of its own, and those rules are called protocols.

This module is the catalogue of **all** the protocols the project speaks. It is not a list of
acronyms: for each one it says what problem it solves, how it works in its essential
mechanisms, where the project uses it, what errors are made regularly and what alternatives
were rejected and why. It can be read straight through, but it is designed above all to be
consulted: every entry has the same structure, always.

---

## 0. How to read this module

### 0.1 The structure of each entry

Every protocol is dealt with under six headings, always in the same order:

| Heading | What it contains |
|---|---|
| **Problem** | The concrete difficulty the protocol exists to solve. If you cannot state it, you have not understood the protocol |
| **Mechanism** | How it works: the messages, the states, the guarantees. Only the essentials, not the specification rewritten |
| **In the project** | Where Telemedic uses it, in which component and for which flow |
| **Specification** | Normative document, number, maturity status. **If a specification is expired, in draft or superseded, it is said here** |
| **Typical errors** | What really goes wrong, not what could theoretically go wrong |
| **Alternatives rejected** | What could have been used instead, and the reason why it is not |

### 0.2 Key to the markers

| Marker | Meaning |
|---|---|
| *(none)* | Reference to a published normative document: the number identifies the text stably and it can be found on `rfc-editor.org`, on `w3.org`, on `hl7.org` or on the site of the body indicated |
| **`[B6]` `[B7]` `[R5]`** | Verified against a primary source during the project's research phase, in the document indicated. These are the statements on which the project has already done the checking work |
| **`[NV]`** | **Not verified** against a primary source while this module was being written. It does not mean «false»: it means «check before implementing» |
| **«project proposal»** | It is not a standard: it is a choice of Telemedic's. Header names, scope names, claim names and endpoint names marked this way **must never be presented as standards** |

This discipline is not pedantry. A good part of integration errors comes from somebody who
wrote «standard header» next to a name no body has ever standardised, and from somebody else
who believed it.

### 0.3 What this module does not cover

- **The detail of real time.** ICE, STUN, TURN, DTLS-SRTP, RTP and the data channel have a
  module of their own: [08 - WebRTC from scratch](08-webrtc-da-zero.md). Here you will find a
  summary entry (§7) that serves to place them in the general picture, not to replace it.
- **The healthcare content standards.** HL7 version 2, CDA release 2, the IHE profiles, DICOM
  and the clinical terminologies are dealt with in
  [05 - The interoperability standards](05-standard-di-interoperabilita.md). Here they appear
  **only as transport or interface protocols** (MLLP, DICOMweb, FHIR REST), with an explicit
  cross-reference.
- **The FHIR data model.** It is in [06 - FHIR from scratch](06-fhir-da-zero.md).
- **Cryptographic theory.** Symmetric and asymmetric encryption, signature, PKI, hash
  functions: [12 - Cryptography and security](12-crittografia-e-sicurezza.md). Here it is
  taken as read that you know what a digital signature is, and what is discussed is how the
  protocols use it.

---

## 1. What a protocol really is

### 1.1 The minimal definition

A **protocol** is an agreement between two or more parties on:

1. **which messages** may be exchanged;
2. **in what order** (the state machine of the conversation);
3. **how the bytes** of each message are represented;
4. **what** each message **means**;
5. **what happens when something goes wrong** - messages lost, duplicated, out of order, a
   counterparty that stays silent, a hostile counterparty.

The fifth point is the one that distinguishes a serious protocol from an agreement between
friends. It is also the one the tutorials skip and that costs in production. A protocol with
no error semantics is a protocol that works only when everything works - that is, when it is
not needed.

A minimal example, to fix the idea. Imagine two processes exchanging numbers:

```text
A → B :  HELLO 1
B → A :  HELLO-OK 1
A → B :  SOMMA 3 4
B → A :  RISULTATO 7
A → B :  BYE
```

This is already a protocol. It has a vocabulary (`HELLO`, `SOMMA`, `BYE`), a compulsory
sequence (`HELLO` before everything else), a representation (ASCII text, fields separated by
a space, one message per line), a semantics. The fifth point is missing: what does `A` do if
`B` does not answer within a second? What does `B` do if it receives `SOMMA` without having
seen `HELLO`? If `RISULTATO` arrives twice, is the second an error or a retransmission? Until
you answer, you do not have a usable protocol.

### 1.2 Protocol, format, standard: the most frequent confusion

They are three different things, and they are swapped for one another continually - in
professional documentation too.

| | What it is | Question it answers | Examples |
|---|---|---|---|
| **Format** (or *serialisation*) | A way of representing structured data as a sequence of bytes | *How do I write this datum?* | JSON, XML, ndjson, Protocol Buffers, CSV |
| **Protocol** | An agreement on messages, order, semantics and errors | *How do we talk?* | TCP, HTTP, WebSocket, MLLP, STUN |
| **Standard** | A document published by a recognised body, describing a format, a protocol, a data model or a profile | *Who says so, and with what authority?* | RFC 9110, ISO/IEC 29115, OASIS SAML 2.0 |

Three corollaries that clear up most of the confusions:

- **JSON is not a protocol.** It tells nobody when to speak, in what order, nor what to do if
  the message gets lost. It is only a way of writing a tree of values. «Our APIs speak JSON»
  does not describe an interface: it describes a typographical preference.
- **REST is not a protocol.** It is an *architectural style* that constrains the use of a
  protocol (HTTP). We discuss it in §3.1, where the point is exactly this.
- **FHIR is neither the one nor the other.** It is a standard comprising a **data model** (the
  resources), **two formats** (JSON and XML) and **an application protocol** (the REST API
  described in [06 §7](06-fhir-da-zero.md)). Saying «we use FHIR» without saying which of the
  three layers is being used is one of the most expensive ambiguities in integration
  negotiations.

Another distinction worth fixing: **standard** and **published specification** do not
coincide with **de facto standard**. `Idempotency-Key` (§3.7) is used everywhere and is
standardised by nobody. The form of the three headers
`RateLimit-Limit`/`Remaining`/`Reset` (§3.8) is extremely widespread and has never been a
standard, besides being by now superseded by the draft that has replaced it `[B6]`. A
widespread protocol is not a regulated protocol, and the difference counts when somebody
writes «conformant with» in a tender specification.

### 1.3 The protocol stack and the layered models

No protocol works alone. Each one **presupposes** a service provided by the one below and
**offers** a service to the one above. The whole is called a **stack**.

The key idea is called **encapsulation**: every layer takes the message of the layer above,
treats it as an opaque block of bytes (*payload*) and adds its own header to it. The receiver
does the reverse journey.

```text
┌──────────────────────────────────────────────────────────────┐
│  Application:  { "resourceType": "Encounter", ... }          │  ← meaning
├──────────────────────────────────────────────────────────────┤
│  HTTP:  POST /fhir/Encounter  +  headers  +  body            │  ← request/response
├──────────────────────────────────────────────────────────────┤
│  TLS:   encrypted and authenticated record                   │  ← confidentiality, integrity
├──────────────────────────────────────────────────────────────┤
│  TCP:   segment  (ports, sequence numbers, acknowledgements) │  ← reliable ordered stream
├──────────────────────────────────────────────────────────────┤
│  IP:    datagram  (source and destination address)           │  ← global routing
├──────────────────────────────────────────────────────────────┤
│  Ethernet / Wi-Fi / mobile network: frame                    │  ← one physical hop
└──────────────────────────────────────────────────────────────┘
```

A **layered model** is the conceptual map of this structure. The two you will meet:

- **The OSI model** (ISO/IEC 7498-1), with seven layers: physical, data link, network,
  transport, session, presentation, application. It is the reference vocabulary - when
  somebody says «a layer 7 balancer» they mean «one that reads HTTP», and «layer 4» means
  «one that sees only TCP/UDP and ports». It is a descriptive model: no real stack
  corresponds to it exactly.
- **The Internet model**, with four layers (link, internet, transport, application), which is
  the one actually implemented. TLS, formally, has no layer of its own: it sits between
  transport and application, and this is already a first crack in the model's purity.

Two practical warnings, because layering is a conceptual convenience and not a law of
physics:

1. **The layers are violated continually, out of necessity.** NAT (described in
   [08 §2.3](08-webrtc-da-zero.md)) is a layer 3 device that rewrites layer 4 ports. QUIC
   (§2.4) moves inside the transport functions that belonged to TLS and to HTTP. These are
   not defects: they are conscious trade-offs.
2. **A problem solved at one layer is not solved for the others.** TLS guarantees that nobody
   has read or altered the bytes *in transit*: it says nothing about who wrote them nor about
   what happens after termination. It is the reason why webhook signing (§6.3) exists on TLS
   channels too, and it is the reason why server-side recording breaks end-to-end (decision
   D23) even though everything remains encrypted in transit.

### 1.4 Interface contract

The **interface contract** is the machine-verifiable description of what one party promises
the other: which operations exist, which parameters they accept, which representations they
return, which errors they may emit, which guarantees hold.

The difference between a contract and documentation is that the contract is **executable**: a
client can be generated from it, a response can be validated against it, a continuous
integration pipeline can be made to fail when the code diverges from the contract.

In the project the contracts are three, and they are of different natures:

| Contract | Formalism | Covers |
|---|---|---|
| Application API | **OpenAPI 3.1** (§3.2) | sessions, consents, configuration, administration |
| Clinical API | **FHIR `CapabilityStatement`** + `StructureDefinition` profiles | clinical resources, searches, operations |
| Events | **CloudEvents schema** + registry of the payload schemas (§6.2) | what the system publishes towards the outside |

The project's constraint **V3** («no functionality accessible only from the UI») has a direct
and often underestimated consequence: **if a capability does not appear in one of the three
contracts, it does not exist**. The contract is not the documentation of the function: it is
the function.

### 1.5 Serialisation

**Serialising** means turning a structure in memory into a transmissible or storable sequence
of bytes; **deserialising** is the reverse. It looks trivial, and it produces three families
of recurring bugs:

- **Loss of precision.** A JSON number is, per RFC 8259 §6, a decimal number with no
  precision constraints, but almost all parsers map it onto a 64-bit `double`. A numeric
  identifier beyond 2^53 is silently corrupted. Project rule: **identifiers are strings,
  always**, even when they look like numbers. FHIR already imposes this for the `id` type.
- **Loss of time zone and of temporal precision.** An instant serialised with no indication of
  time zone is an ambiguous datum. Project rule: **every instant is in UTC, in RFC 3339 form,
  with at least milliseconds**. See also §8.1 on clock synchronisation.
- **Ambiguity of absence.** In JSON, `null`, an absent field and an empty string are three
  different things, and the three are confused constantly. In FHIR the difference is
  normative: an absent element means «I do not know», not «no». Module
  [06](06-fhir-da-zero.md) insists on this point for a good reason.

The concrete formats and the criteria for choosing among them are in §8.3.

### 1.6 Cross-cutting concepts that come back in every entry

They are worth fixing once and for all, because they recur throughout the catalogue.

**Synchronous and asynchronous.** In a *synchronous* interaction the caller waits for the
response and the response contains the outcome of the operation. In an *asynchronous* one the
response confirms only acceptance, and the outcome arrives later, by another channel
(polling, webhook, event). The choice is not a matter of taste: an operation lasting more
than a few seconds **cannot** be synchronous over HTTP without exposing itself to
intermediate timeouts from proxies and balancers you do not control. FHIR Bulk Data (§5.2) is
the canonical case of regulated asynchrony.

**State.** A protocol is *stateful* if the meaning of a message depends on the previous ones
on the same connection. TCP is (the sequence numbers), HTTP in itself is not (every request
is self-sufficient), WebSocket is. Statelessness has an enormous merit: it allows N instances
of the server to be put behind a balancer with no coordination. Every time server-side session
state is introduced, you buy a feature and you sell scalability.

**Idempotency.** An operation is **idempotent** if executing it once or N times produces the
same final state. RFC 9110 §9.2.2 declares `GET`, `HEAD`, `PUT`, `DELETE`, `OPTIONS`, `TRACE`
idempotent, and `POST` and `PATCH` **not** idempotent. Idempotency is what makes the retry
safe, and it is therefore the concept that holds up webhooks, event queues and resilient
clients. It is not the same thing as *safe*: a safe request does not modify the server's state
(RFC 9110 §9.2.1); an idempotent one may modify it, provided it always does so in the same
way.

**At-most-once, at-least-once, exactly-once.** The three delivery guarantees. The third, taken
literally, **is not obtainable** over an unreliable channel between two independent parties:
what is obtained is «at least once» plus deduplication on the receiving side, which is an
**observable** «exactly once», not a real one. Anybody promising the third without naming
deduplication is describing badly what they have built. See §6.4.

### 1.7 How to read an IETF specification, and what it is worth

The RFCs are not all alike, and the number says nothing about authoritativeness. What counts
is the **status**:

| Status | Meaning | How to treat it |
|---|---|---|
| **Internet-Draft** | Working document. **It expires after six months** if not renewed | It is not a standard. Citing it as one is incorrect |
| **Proposed Standard** | Standards Track: stable, implementable specification | It is the status in which the vast majority of the protocols you use every day live |
| **Internet Standard** | Mature Standards Track, with multiple interoperating implementations | Rare |
| **Best Current Practice (BCP)** | Operational recommendation, not a protocol definition | As binding in practice as a standard |
| **Informational** | Descriptive, with no normative claim | Useful, not citable as conformance |
| **Experimental** | Under trial | Not production |
| **Historic** | Superseded | If you find it in a tender specification, the tender specification is old |

Two points of method:

1. **An RFC may be «obsoleted by» another.** HTTP/1.1 is no longer cited with RFC 2616: that
   text was replaced first by RFC 7230–7235 and then by the 2022 revision (RFC 9110–9114).
   Citing an obsolete RFC is the quickest way to make it clear that the documentation is not
   maintained.
2. **The words in capitals have normative value.** `MUST`, `MUST NOT`, `SHOULD`, `SHOULD NOT`,
   `MAY` are defined in RFC 2119 and made precise in RFC 8174 (which clarifies that they hold
   **only** when they are in capitals). A `SHOULD` is not a polite `MUST`: it means that you
   may depart from it if you have understood the consequences and have documented them. Module
   [05 §9.3](05-standard-di-interoperabilita.md) deals with the equivalents in the healthcare
   world (`SHALL`, `SHOULD`, `MAY` of HL7 and IHE).

---

## 2. Transport and web

### 2.1 IP - Internet Protocol

**Problem.** Delivering a block of bytes from any machine on the planet to another, across a
sequence of networks run by different parties that do not coordinate with one another.

**Mechanism.** IP defines a **datagram**: a header with a source address, a destination
address, a counter of remaining hops (*TTL*, or *hop limit* in IPv6) and an indication of the
protocol carried, followed by the payload. Every router reads the destination address,
consults its own routing table and passes the datagram to the next hop. No router keeps any
memory of the conversation.

The service offered is deliberately poor, and it is important to understand how poor:

- **no delivery guarantee** - a datagram may be discarded at any point, typically because a
  queue is full;
- **no ordering guarantee** - two datagrams may follow different paths and arrive reversed;
- **no uniqueness guarantee** - a datagram may be duplicated;
- **no confidentiality, no authentication** - the source address is a field written by the
  sender, and lying about that field (*spoofing*) is trivial.

Everything above it - reliability, ordering, encryption, identity - is rebuilt by other
protocols on this deliberately minimal basis. Two versions coexist: **IPv4** (RFC 791, 32-bit
addresses, exhausted) and **IPv6** (RFC 8200, 128 bits). The exhaustion of the IPv4 addresses
is the historical cause of NAT, which is in turn the reason why a video call is a hard
problem: see [08 §2.3](08-webrtc-da-zero.md).

**In the project.** Everywhere, implicitly. It becomes explicit at two points: the network
configuration of the TURN nodes, where reachable public addresses are needed, and the use of
the source address in the audit trail, where it must be recorded in the knowledge that it is
**indicative, not probative** information, because an address may be shared by thousands of
users behind a CGNAT or forged.

**Specification.** RFC 791 (IPv4, Internet Standard, 1981); RFC 8200 (IPv6, Internet
Standard, 2017).

**Typical errors.** Treating the IP address as an identifier of the user, for authorisation or
for rate limiting: behind a CGNAT it is shared by a whole neighbourhood. Assuming that two
requests from the same address are the same user and that two different addresses are
different users: both implications are false, and on a mobile network the address may change
halfway through a session.

### 2.2 UDP - User Datagram Protocol

**Problem.** Adding to IP the bare minimum needed to distinguish the applications on the same
machine, without adding anything else.

**Mechanism.** Eight bytes of header: source port, destination port, length, checksum.
Nothing else. No connection, no acknowledgement, no retransmission, no reordering, no
congestion control. A datagram sent is a datagram forgotten.

This poverty is exactly the merit when the data have a **value that decays over time**. In an
audio conversation, a packet arriving 400 ms late is useless even if it is intact: the moment
at which it should have been played back has passed. Retransmitting it makes the situation
worse, because it takes up bandwidth and delays what comes after. Better to lose it and mask
the hole.

**In the project.** It is the transport of real-time media: RTP over UDP, inside DTLS-SRTP.
It is also the transport of STUN and TURN, and of QUIC (hence of HTTP/3). The full treatment
is in [08 §2.2](08-webrtc-da-zero.md).

**Specification.** RFC 768 (Internet Standard, 1980). Eighty lines: it is worth reading it in
full at least once, to understand how little it takes to be a standard that holds up for
fifty years.

**Typical errors.** Building yourself «a home-made TCP» over UDP with naive retransmissions
and no congestion control: what you get is a protocol that under load makes congestion worse
instead of adapting to it, damaging other people's traffic too. If reliability over UDP is
needed, QUIC or SCTP are used, since they have already done that work.

**Alternatives rejected.** For the media, TCP: rejected because its ordering guarantee
produces the head-of-line blocking described in §2.3, which is precisely the unacceptable
defect in real time.

### 2.3 TCP - Transmission Control Protocol

**Problem.** Offering the application the illusion of a **reliable, ordered stream of bytes**
between two processes, built on top of a service that guarantees neither delivery nor
ordering.

**Mechanism.** Four pillars:

1. **Connection.** A three-way handshake (`SYN` → `SYN-ACK` → `ACK`) establishes the initial
   sequence numbers. It costs one round-trip time (*RTT*) before the first useful byte
   departs.
2. **Numbering and acknowledgement.** Every byte has a sequence number; the receiver confirms
   what it has received. What is not confirmed within a timeout is retransmitted.
3. **Reordering.** The receiver delivers the bytes to the application in order, always.
4. **Flow control and congestion control.** The first avoids swamping the receiver
   (advertised window); the second avoids swamping the network, reducing the rate when it
   detects losses.

Point 3 has a heavy consequence that must be well understood: **head-of-line blocking**. If
segment number 5 is lost, segments 6, 7, 8 that have already arrived stay put in the
receiver's buffer until 5 is retransmitted and received. For a file transfer this is
irrelevant; for audio it is the difference between a conversation and a disaster.

**In the project.** It is the transport of everything that is not media: HTTP in every version
except the third, WebSocket, MLLP, the event broker's protocol, the database connections.
And, in fallback mode, of the media too, when TURN has to use TCP or TLS because the network
blocks UDP - with the loss of quality that follows
([08 §5.9](08-webrtc-da-zero.md)).

**Specification.** RFC 9293 (2022), which replaces and consolidates RFC 793 and the long
series of later updates. **If you find RFC 793 cited in a recent document, that document is
not up to date.**

**Typical errors.** Believing that «the message has arrived» because the `write` has returned:
TCP guarantees delivery to the counterparty's *operating system*, not to the application, and
still less its processing. Only an application-level acknowledgement proves processing - it is
exactly the reason why HL7 version 2 has application `ACK`s
([05 §4.5](05-standard-di-interoperabilita.md)). Second error: forgetting that TCP does not
delimit the messages. The stream is one of bytes, not of messages; without explicit framing
you do not know where one ends and the next begins. MLLP (§5.3) exists solely for this.

### 2.4 QUIC

**Problem.** TCP has two structural defects that cannot be corrected without breaking
compatibility: head-of-line blocking on all the streams multiplexed over the same connection,
and the fact that the connection is identified by the five-tuple (addresses and ports), and
therefore dies when the client's address changes - which happens at every switch from Wi-Fi to
a mobile network.

**Mechanism.** QUIC is a transport built **on top of UDP**, in user space, which
reimplements reliability, ordering and congestion control, but with three substantial
differences:

- **Independent streams.** A QUIC connection contains many streams; the loss of a packet
  blocks only the stream it belonged to.
- **Built-in, non-optional encryption.** TLS 1.3 does not sit *above* QUIC: it is
  incorporated in its handshake. There is no such thing as QUIC in the clear.
- **Connection identifier.** The connection is identified by a *connection ID*, not by the
  five-tuple: if the client changes address, the connection **migrates** instead of dying.

The unified handshake brings the connection down to a single RTT in the normal case, and to
zero RTT in the case of resumption - with the not negligible caveat that data sent at zero RTT
are exposed to replay and must not therefore carry non-idempotent operations.

**In the project.** It is the transport of HTTP/3 (§2.9). It is relevant above all for
constraint **V6**: the typical patient is on a smartphone on a mobile network, and connection
migration is the function that saves them from losing the application session as they leave
the house. The media does not use QUIC: it uses RTP over UDP as described in
[08](08-webrtc-da-zero.md).

**Specification.** RFC 9000 (transport), RFC 9001 (use of TLS 1.3 in QUIC), RFC 9002 (loss
detection and congestion control), all of May 2021.

**Typical errors.** Assuming it is available. QUIC runs over UDP, and **hospital and
corporate networks block UDP with considerable frequency**. Every client must know how to fall
back to HTTP/2 over TCP with no user intervention and no long waits. Second error: expecting
the middleboxes to understand it - to a layer 4 firewall, QUIC is opaque UDP traffic, and this
changes both the rules to be configured and what can be seen in the diagnostic tools.

### 2.5 TLS - Transport Layer Security

**Problem.** On a network anybody can listen to and alter, guaranteeing three things
together: that the data are not readable by third parties (**confidentiality**), that they are
not modifiable without this being noticed (**integrity**), and that the counterparty is who it
says it is (**authentication**).

**Mechanism.** TLS inserts itself between transport and application. It is made up of a
**negotiation** phase (*handshake*) and a phase of transporting encrypted **records**.

In the TLS 1.3 handshake, simplified:

```mermaid
sequenceDiagram
    autonumber
    participant C as Client
    participant S as Server

    C->>S: ClientHello<br/>supported versions, cipher suites, groups,<br/>key_share (ephemeral public key), SNI, ALPN
    S->>S: chooses cipher suite and group,<br/>generates its own ephemeral key
    S->>C: ServerHello (server's key_share)
    Note over C,S: from here on everything is encrypted:<br/>the shared secret is already derivable by both
    S->>C: EncryptedExtensions, Certificate,<br/>CertificateVerify (signature over the handshake), Finished
    C->>C: validates the certificate chain,<br/>verifies the name, checks revocation,<br/>verifies the handshake signature
    C->>S: (optional: client's Certificate + CertificateVerify)
    C->>S: Finished
    Note over C,S: channel established - a single RTT
```

Three points that explain why the handshake is made this way:

- **The secret never travels.** Client and server exchange ephemeral public keys and each
  computes the same shared secret on its own (Diffie-Hellman exchange over elliptic curves).
  An eavesdropper who records the whole exchange cannot derive it. And since the keys are
  ephemeral and destroyed at the end of the session, a future compromise of the server's
  private key **does not allow past sessions to be decrypted**: this is *forward secrecy*,
  mandatory in TLS 1.3.
- **The certificate serves to bind a key to a name.** `CertificateVerify` is the proof that
  the server possesses the private key corresponding to the certificate; validation of the
  chain up to a trusted authority is the proof that that certificate was issued to whoever
  declares that name. They are two distinct checks and both are needed.
- **`SNI` and `ALPN` are negotiated in the clear in the `ClientHello`.** The first says which
  virtual name is being contacted (necessary when many services share an address), the second
  which application protocol is to be spoken (`h2`, `http/1.1`, `h3`). A confidentiality
  consequence to be aware of: **an observer sees which service you are contacting**, even if
  they do not see what you say to it.

**mTLS - mutual authentication.** In common use only the server presents a certificate. In
**mTLS** the client presents one too, and the server validates it in the same way. The result
is that the client's identity is proved **by the channel**, not by a secret carried inside the
channel. It is qualitatively different from an API key: a stolen token is reusable anywhere, a
private key protected by a device is not.

**In the project.** TLS is everywhere, as an absolute minimum. mTLS at four precise points:

1. **MLLP** towards the hospital integration engines (§5.3): it is the only way of making a
   protocol born without security acceptable;
2. **TS-CNS**, where the citizen's certificate on a smart card authenticates the user at
   transport level `[B7]` - it is the only channel under art. 64 CAD (Codice
   dell'Amministrazione Digitale, the Italian Digital Administration Code) free of external
   dependencies;
3. **internal traffic** between components in the deployment profiles that require it;
4. **optionally**, to bind an integrator's tokens to their client certificate (RFC 8705, mTLS
   *token binding*), as a hardening of the profile in §4.

**Specification.** TLS 1.3: **RFC 8446** (2018). TLS 1.2: RFC 5246, still admitted but to be
considered on its way out. TLS 1.0 and 1.1 are **formally deprecated by RFC 8996** (BCP 195):
they must not be enabled, in any profile, not even for compatibility. Project policy: **TLS
1.3 preferred, TLS 1.2 admitted only with cipher suites offering forward secrecy and only
where a legacy counterparty imposes it, with the derogation documented**. The choice of cipher
suites and key sizes follows ETSI TS 119 312 and the AgID-ACN indications (decision D19), not
lists copied from configuration guides.

**Typical errors.**

- **Switching off certificate verification** to «make the acceptance test work». A client that
  accepts any certificate has the encryption but not the authentication: it is defenceless
  against an active intermediary, and that line of configuration then reaches production. The
  same holds for MLLP: [05 §4.6](05-standard-di-interoperabilita.md) says so in the same
  terms.
- **Verifying the chain but not the name.** They are two separate checks and the second is
  forgotten in many low-level libraries.
- **Ignoring revocation.** A compromised and revoked certificate remains cryptographically
  valid until expiry. OCSP (RFC 6960) or the revocation lists (RFC 5280) are needed, and it is
  necessary to decide **what to do when the revocation service does not answer** - a decision
  to be taken consciously, because both answers have a cost.
- **Considering TLS sufficient for non-repudiation.** TLS protects the channel; it produces no
  evidence that can be held against a third party as to who sent what. For that, message
  signatures (§6.3) and a hash chain over the audit trail (decision D42) are needed.

**Alternatives rejected.** Encrypting at application level and leaving the transport in the
clear: rejected because it exposes headers and metadata and because nobody correctly
implements a cryptographic negotiation of their own. IPsec: adequate for linking two networks,
but it does not offer the *per-service* identity that is needed here.

### 2.6 HTTP: the model common to the three versions

Before distinguishing the versions, it is worth fixing what **does not change**. Since 2022
the revision of the specifications has explicitly separated the two planes:

- **The semantics** - methods, status codes, header fields, content negotiation, conditional
  requests, authentication - is defined **once only** in **RFC 9110**, and holds identically
  for HTTP/1.1, HTTP/2 and HTTP/3.
- **The syntax and the transport** change from version to version: RFC 9112 (HTTP/1.1),
  RFC 9113 (HTTP/2), RFC 9114 (HTTP/3). Caching has a specification of its own, RFC 9111.

This separation is the reason why **moving from HTTP/1.1 to HTTP/2 does not change a line of
application code**: what changes is how the bytes travel, not what they mean. And it is also
the reason why discussions of the «let us migrate the APIs to HTTP/2» sort are often badly
posed: there is nothing to migrate in the application, there is infrastructure to configure.

**The interaction model** is invariant: the client sends a **request** (method, target,
headers, optional body); the server sends a **response** (status code, headers, optional
body). The server does not speak first. This asymmetry is the problem that WebSocket and SSE
solve in two different ways (§2.10 and §2.11).

### 2.7 HTTP/1.1

**Problem.** Transferring representations of resources over a TCP connection, in a way that
anybody can read and implement.

**Mechanism.** Text, line by line. A request is an initial line, a block of `Name: value`
headers, an empty line, and a body whose length is given by `Content-Length` or by chunked
encoding (`Transfer-Encoding: chunked`).

```http
GET /v1/sessions/9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d HTTP/1.1
Host: api.telemedic.example
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

The structural limit is that **one connection serves one request at a time**. The *pipelining*
provided for by the specification has never worked in practice because of the obligation to
answer in order, and the browsers solved the problem by opening six connections in parallel
per origin - a remedy that multiplies TCP and TLS handshakes.

**In the project.** It is the guaranteed lowest common denominator: every integrator speaks
it. It is the version in which all the examples in the documentation are written, because it
is the only one readable by eye.

**Specification.** RFC 9112 (2022), with the semantics in RFC 9110. It replaces RFC 7230 and,
before that, RFC 2616.

**Typical errors.** Building headers by string concatenation with user input inside them: an
unfiltered line break produces *response splitting*. Assuming that header names are
case-sensitive: they are not. Assuming that a header appears only once: many are repeatable,
and the joining happens by comma.

### 2.8 HTTP/2

**Problem.** Removing the one-request-per-connection limit without changing the semantics.

**Mechanism.** HTTP/2 is **binary** and introduces three concepts:

- **Frames**: the elementary unit. Distinct types for headers, data, control.
- **Streams**: every request/response pair is a numbered stream; the frames of different
  streams alternate freely on the same TCP connection. This is **multiplexing**.
- **Header compression** (HPACK, RFC 7541): headers repeated between requests on the same
  connection are not retransmitted in full, but referenced in a shared dynamic table.

The real gain, in a modern web application, comes more from header compression and from the
use of a single TLS connection than from multiplexing as such.

**The limit that remains.** The multiplexing is at HTTP level, but **underneath there is still
a single TCP connection**: if a segment is lost, TCP blocks the delivery of *all* the streams
until it retransmits it. Head-of-line blocking has been moved, not eliminated. It is exactly
the problem that HTTP/3 solves.

**In the project.** It is the default version for application traffic between the gateway and
modern clients, and for internal traffic between services. Negotiation happens with ALPN
(RFC 7301) during the TLS handshake, so it is transparent to the application.

**Specification.** RFC 9113 (2022), which replaces RFC 7540; HPACK in RFC 7541.

**Typical errors.** Keeping the *domain sharding* (spreading the resources over several
hostnames) inherited from HTTP/1.1: with HTTP/2 it is counterproductive, because it prevents
the single connection from being exploited. Forgetting that *server push*, much publicised at
the start, has been **abandoned in practice** by the browsers: nothing that depends on it
should be designed `[NV]`.

### 2.9 HTTP/3

**Problem.** Eliminating HTTP/2's residual head-of-line blocking and surviving the client's
change of network.

**Mechanism.** Same semantics, same stream model, but over **QUIC** (§2.4) instead of over
TCP+TLS. The loss of a packet blocks only the stream concerned; the change of the client's IP
address does not bring the connection down. Header compression uses QPACK (RFC 9204), a
variant of HPACK designed so as not to introduce ordering dependencies between streams in its
turn.

**In the project.** Enabled on the public gateway, with **mandatory automatic fallback** to
HTTP/2 when UDP is blocked. The benefit is concentrated where the project needs it most:
patient on a smartphone, mobile network, variable quality - that is, constraint **V6**.

**Specification.** RFC 9114 (2022); QPACK in RFC 9204.

**Typical errors.** Considering it a requirement. It is not, and it cannot be: many healthcare
networks block outbound UDP. The project cannot have a feature that exists only over HTTP/3.
Second error: forgetting that the metrics and the logs change shape, because there is no
longer a TCP connection to which the statistics can be referred.

### 2.10 WebSocket

**Problem.** HTTP is at the client's initiative. What is needed is a channel in which **the
server too can speak first**, with low delay and without the cost of a new request for every
message.

**Mechanism.** The client opens an ordinary HTTP request with `Upgrade: websocket`, a random
`Sec-WebSocket-Key` and the version. If the server accepts, it answers `101 Switching
Protocols` and from that moment **the TCP connection stops speaking HTTP**: it becomes a
bidirectional message channel, with a binary framing of its own, supporting text, binary,
ping/pong and orderly closure with a code.

```http
GET /ws/signaling HTTP/1.1
Host: api.telemedic.example
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: x3JJHMbDL1EzLkh9GBhXDw==
Sec-WebSocket-Version: 13
Sec-WebSocket-Protocol: telemedic.signaling.v1
Origin: https://app.telemedic.example
```

```http
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: HSmrc0sMlYUkAGmm5OPpG2HaGWk=
Sec-WebSocket-Protocol: telemedic.signaling.v1
```

Three things WebSocket does **not** give and that one always ends up implementing:

1. **No application semantics.** On top of it there is a stream of opaque messages: the
   message protocol you write yourself, including correlation, errors and versioning. The
   `Sec-WebSocket-Protocol` parameter exists precisely to negotiate its name and version -
   using it is good hygiene, not a detail.
2. **No reconnection.** If the connection drops - and on a mobile network it does drop -
   reconnecting and **recovering the messages lost in the meantime** is an application
   problem. A sequence number for the messages and a resumption from a known point are needed,
   otherwise events are lost in silence.
3. **No continuing authorisation.** Authorisation happens at the initial handshake. If the
   token expires after ten minutes and the connection lasts an hour, the connection stays open
   with a dead authorisation, unless the application protocol provides for a periodic
   re-presentation of the token and closure in the event of revocation.

**In the project.** It is the WebRTC **signalling** channel (exchange of offer, answer and ICE
candidates: see [08 §4](08-webrtc-da-zero.md)), and it is the channel for interactive
notifications towards the clinical UI. It is the use case in which bidirectionality is really
needed, because both parties generate events independently and unpredictably.

**Specification.** **RFC 6455** (2011). Operation over HTTP/2 as a multiplexed stream is
defined by **RFC 8441** and is not universally supported: the project does not rely on it
`[NV]`. The browser-side `WebSocket API` is defined by the WHATWG's HTML standard, not by the
IETF: they are two different documents for two different layers.

**Typical errors.**

- **Putting the token in the URL** (`wss://…?token=…`) because the browser's API does not
  allow custom headers in the handshake. The URL ends up in the logs of every intermediary.
  The project's solution - *project proposal* - is a **single-use entry token, with a very
  short expiry, issued back-channel** and spent as the first application message after the
  opening, consistently with decision D18.
- **Not validating `Origin`.** The opening of a WebSocket **is not subject to the same-origin
  policy** in the same way as `fetch` requests, and cookies are sent: without server-side
  validation of `Origin` what you get is the WebSocket variant of CSRF, known as *cross-site
  WebSocket hijacking*.
- **Neglecting the pings.** Without periodic ping/pong, NATs and balancers close inactive
  connections after a few minutes, and the client notices only when it tries to write.
- **Using it for data that must survive disconnection.** A clinical event delivered only over
  WebSocket to a disconnected client is a lost event. Durable events go through the broker and
  the webhooks (§6), not through the interactive channel.

**Alternatives rejected.** For signalling: HTTP *long polling*, rejected for the additional
delay and for the cost of one request per message; SSE, rejected because it is
unidirectional and signalling is intrinsically bidirectional.

### 2.11 Server-Sent Events

**Problem.** The server must be able to push updates to the browser, but the conversation is
**one-way** and does not justify the cost and the risks of a bidirectional channel.

**Mechanism.** An ordinary HTTP response with `Content-Type: text/event-stream` that **does
not close**. The server writes events in a line-based textual format; the client receives them
as they come.

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

The least known and most important merit is **built-in resumption**: the client remembers the
last `id` received and, on automatic reconnection, sends it back in the `Last-Event-ID`
header. The server resumes from there. It is the feature that with WebSocket you have to write
yourself, and that almost nobody writes correctly.

**In the project.** One-way notifications towards the interface: changes of session state,
progress of a long operation, remote monitoring alerts to be shown to the professional,
outcome of an asynchronous processing task. In the FHIR world it is also one of the
notification channels of subscriptions.

**Specification.** **It is not an RFC.** It is defined in the WHATWG's *HTML Living Standard*,
section *Server-sent events*, together with the `EventSource` interface. It is a living
standard, that is to say one with no version number: it is cited by section, not by revision.
The `text/event-stream` content type is registered with IANA.

**Typical errors.**

- **Not switching off the intermediaries' buffering.** A reverse proxy that accumulates the
  response before forwarding it completely nullifies the point of SSE: the events arrive in
  blocks, or they do not arrive. It must be configured explicitly, and it must be verified
  with a test, not with trust.
- **Not sending heartbeat comments** (the lines beginning with `:`): with no traffic, the
  intermediaries close the inactive connection.
- **Using it with HTTP/1.1 and many tabs open.** The limit of six connections per origin is
  exhausted with six SSE streams. Over HTTP/2 and HTTP/3 the problem does not exist, because
  the streams are multiplexed: **SSE is to be paired with HTTP/2**, and this is the case in
  which the protocol version has a real application consequence.
- **Sending binary data over it.** The format is line-based text: binary has to be encoded,
  with the increase in size that entails.

### 2.12 How to choose between polling, SSE and WebSocket

It is one of the questions in which the wrong answer costs months. The criterion is not
«which is more modern», but **how many parties are speaking, how often, and what happens if
the client is not there**.

| Criterion | Polling | SSE | WebSocket |
|---|---|---|---|
| Direction | client → server | server → client | bidirectional |
| Typical delay | half the polling interval | close to the network's | close to the network's |
| Cost per message | high (a full request) | low | very low |
| Resumption after a drop | native (it is already stateless) | **native** (`Last-Event-ID`) | **to be implemented** |
| Traverses proxies and firewalls | always | almost always | often, not always |
| Authorisation | per request, always fresh | at the opening | at the opening |
| Operational complexity | minimal | low | medium |
| Suited to many inactive clients | yes | no (one connection each) | no |

**The project's rules** (*project proposal*, derived from the real use cases):

1. **If the server has nothing to say until the client asks, an ordinary request is used.**
   Nothing else is needed. Most of what gets built with persistent channels did not need
   them.
2. **If the flow is one-way towards the browser, SSE is used.** Built-in resumption and the
   absence of an application protocol to be invented are worth more than the bidirectionality
   you would not use.
3. **WebSocket is used when both parties generate independent events and the delay counts.**
   In the project this is, in substance, signalling alone.
4. **Polling remains the correct choice for long asynchronous operations between systems**,
   where there is no human being waiting and the counterparty may be switched off. It is the
   model of FHIR Bulk Data (§5.2), and it is not a fallback: it is the right answer to that
   problem.
5. **No event that has to survive disconnection travels over an interactive channel alone.**
   The interactive channel is an optimisation of perceived latency, never the source of truth.
   The source of truth is the broker (§6.1) and, towards the outside, the webhook with
   retries (§6.3).

On polling, a last note that avoids damage: **if a client has to poll, the server must tell it
how often**. The `Retry-After` header (RFC 9110 §10.2.3) exists for this, and it is the
difference between a thousand courteous clients and a thousand clients that act as a
distributed attack on you every time the service slows down.

---

## 3. Application interfaces

### 3.1 REST, and its real constraints

**Problem.** Defining an interface between systems that survives the independent evolution of
the two parties, that is understandable without proprietary documentation and that exploits
the web's existing infrastructure (caches, proxies, balancers) instead of going round it.

**Mechanism.** REST - *REpresentational State Transfer* - is neither a protocol nor a
standard: it is an **architectural style** described in 2000 in the doctoral thesis of Roy
Fielding, who is also one of the authors of the HTTP specifications. It imposes six
constraints: client-server architecture; **absence of session state on the server**; the
possibility of caching responses; a uniform interface; a layered system; *code on demand*
(optional and practically unused).

The constraint that carries almost all the value is the **uniform interface**, articulated in
turn into four sub-constraints: identification of resources through URIs, manipulation through
representations, self-descriptive messages, and hypermedia as the engine of application state
(*HATEOAS*).

**What this means in practice, and what it does not.** It is worth being explicit, because the
term is abused:

- **An API is not REST because it uses JSON over HTTP.** The vast majority of the «REST APIs»
  in circulation - including, in part, this project's - are *HTTP-JSON with a resource
  orientation*. It is a legitimate choice; calling it REST without qualification is imprecise
  and must be avoided in public documentation.
- **HATEOAS is the constraint almost nobody respects**, and it is the one that ought to allow
  the client to discover the possible transitions from the links in the representation instead
  of from the documentation. The project adopts it **partially**: paginated collections expose
  the navigation links with the `Link` header (RFC 8288) and the FHIR `Bundle`s expose them in
  `Bundle.link`, as the standard requires. The state transitions of a session, on the other
  hand, are documented in the OpenAPI contract, not discovered at runtime: it is a conscious
  deviation, and this sentence is its documentation.
- **Statelessness is the constraint that is violated first and that costs most.** Every
  request must contain everything needed to interpret it: identity, tenant, context. No
  server-side «session» tying successive requests together. It is what makes it possible to
  add gateway instances with no shared sessions, and it is the reason why identity travels in
  a token per request (§4).

**Resource design - the project's rules** (*project proposal*):

| Rule | Correct example | Example to avoid |
|---|---|---|
| Nouns, not verbs, in the URIs | `POST /v1/sessions` | `POST /v1/createSession` |
| Plural for collections | `/v1/sessions/{id}` | `/v1/session/{id}` |
| Relations are sub-resources | `/v1/sessions/{id}/participants` | `/v1/getParticipantsBySession?id=` |
| The verb is in the HTTP method | `DELETE /v1/sessions/{id}` | `POST /v1/sessions/{id}/delete` |
| Identifiers are opaque | `9f1c2b3d-4e5f-…` | an incrementing integer |
| The major version is in the path | `/v1/…` | only in a custom header |

On the last row the debate is an old one and has no objectively superior answer. The project
chooses the version in the path for a practical reason: it is visible in the logs, in the
charts and in the support tickets, and an integrator can say «I am using v1» without having to
inspect the headers.

One last rule, which follows from constraint **V4** and §6.2.3 of the integration profile:
**external identifiers never become internal identifiers**. The patient is identified by the
integrator; Telemedic references them with the pair (identification system, value), as FHIR
does with `Patient.identifier`. The project is not the master data and must not become it.

**Typical errors.** One endpoint per use case, which reproduces the remote procedure call in
HTTP and inherits its defects. The `GET` that modifies state: it violates RFC 9110 §9.2.1, and
it will be repeated by any cache, browser prefetch, crawler or automatic retry. The `POST`
used to read, which makes any caching impossible.

**Alternatives rejected.**

| Alternative | Why rejected |
|---|---|
| **GraphQL** | The project already exposes FHIR, which has a rich, regulated search language of its own. Adding a second query model means duplicating authorisation and audit over two different layers - and per-field authorisation in a healthcare context is the point at which mistakes are made. Out of the v1.0 perimeter |
| **gRPC** | Excellent between one's own services, but it requires HTTP/2 with no intermediaries degrading it and tools that the typical integrator's profile does not have. It remains worth assessing for internal traffic, never as a public interface |
| **SOAP** | Outside the project's technology landscape. It appears only as an external constraint when a national infrastructure imposes it; in that case it is spoken in a dedicated adapter, and it does not contaminate the internal model |
| **Remote procedure call over HTTP** | It is what you get by inertia when you do not design. It is not a choice, it is an outcome |

### 3.2 OpenAPI 3.1

**Problem.** Making the contract of the application API (§1.4) **machine-verifiable**, so that
clients, documentation, contract tests and runtime validation all derive from the same source
instead of diverging.

**Mechanism.** A YAML or JSON document describes paths, operations, parameters, bodies,
responses, schemas and security schemes. The decisive novelty of **3.1** with respect to 3.0
is that the schemas are **full JSON Schema** (the 2020-12 dialect), no longer a divergent
subset: the long series of incompatibilities that made it impossible to reuse the same schemas
for validation and for documentation falls away. 3.1 moreover supports `webhooks` as a
top-level element - that is, it allows **the requests the server sends** to be described, not
just those it receives.

```yaml
openapi: 3.1.0
info:
  title: Telemedic Session API
  version: 1.4.0
paths:
  /v1/sessions:
    post:
      operationId: createSession
      summary: Creates a remote consultation (televisita) session from an existing appointment
      parameters:
        - name: Idempotency-Key
          in: header
          required: true
          schema: { type: string, format: uuid }
          description: >
            Project convention, not an IETF standard: see §3.7 of module 13.
      requestBody:
        required: true
        content:
          application/json:
            schema: { $ref: '#/components/schemas/SessionCreateRequest' }
      responses:
        '201':
          description: Session created
          headers:
            Location: { schema: { type: string, format: uri } }
            ETag:     { schema: { type: string } }
          content:
            application/json:
              schema: { $ref: '#/components/schemas/Session' }
        '409':
          description: Conflict - a session already exists for this appointment
          content:
            application/problem+json:
              schema: { $ref: '#/components/schemas/Problem' }
      security:
        - oauth2: ['https://telemedic.example/scopes/session.start']
webhooks:
  sessionCompleted:
    post:
      summary: Notification of a concluded session
      requestBody:
        content:
          application/cloudevents+json:
            schema: { $ref: '#/components/schemas/SessionCompletedEvent' }
      responses:
        '204': { description: Accepted }
```

**In the project.** OpenAPI 3.1 is the contract of the application API (sessions, consents,
configuration, administration, webhooks). **It does not describe the FHIR API**: that has its
own conformance formalism (`CapabilityStatement` and profiles), and generating an OpenAPI
document from FHIR produces an enormous, impoverished document that describes the syntactic
shape and loses the constraints that really count. They are two contracts, for two different
interfaces.

Project policy, in three points:

1. **The contract is the source, not the derivative.** The OpenAPI document is written and
   from it clients and contract tests are generated; the code is verified against the contract
   in continuous integration. The alternative - generating the specification from the code's
   annotations - means that any accidental change to the code automatically becomes a change
   to the contract, which is precisely what the contract ought to prevent.
2. **Compatibility is verified automatically.** A change that removes a field, narrows a type
   or adds an obligation makes the pipeline fail if the major version does not change.
3. **Every example in the document is validated** against its own schema. An example that does
   not validate is a defect, not a detail: the examples are what the integrators copy.

**Specification.** OpenAPI Specification 3.1, published by the OpenAPI Initiative (Linux
Foundation), on `spec.openapis.org`. **It is not an RFC.** The JSON Schema dialect is
`2020-12`. Versions later than 3.1 exist `[NV]`: before adopting one, the support of the tools
actually in use must be verified, which historically arrives with a great deal of delay.

**Typical errors.** A single unnavigable file of six thousand lines: it is broken up by domain
and composed with `$ref`. Describing only the happy case and no errors: the integrator will
discover the error codes in production. Using `additionalProperties: true` everywhere, which
makes the schema incapable of detecting any error at all. Documenting an operation without
declaring its scopes: the integrator cannot know which authorisation to ask for.

### 3.3 The semantics of the status codes

**Problem.** Communicating the outcome of an operation in such a way that a generic client - a
proxy, a cache, a retry library that knows nothing of your domain - can behave correctly
without reading the response body.

**Mechanism.** RFC 9110 §15 defines five classes. The first digit is what counts for the
infrastructure; the precise code is what counts for the application client.

| Class | Meaning | What a generic client must do |
|---|---|---|
| `1xx` | Informational | Wait for the real response |
| `2xx` | Success | Proceed |
| `3xx` | Further action required | Follow the redirection (with a hop limit) |
| `4xx` | Client error | **Do not retry as it stands**: the request is wrong |
| `5xx` | Server error | **Retry** with increasing backoff and a random component |

The distinction between `4xx` and `5xx` **is not cosmetic**: it is the line of code that
decides whether a client retries. Returning `500` for invalid input produces clients that
retry indefinitely a request that can never succeed. Returning `400` for a temporary internal
fault produces clients that give up on an operation that would have succeeded a second later.
It is one of the commonest and most expensive errors.

The codes the project uses and their exact semantics:

| Code | When | Notes for the project |
|---|---|---|
| `200 OK` | Successful read, or modification with a response body | |
| `201 Created` | Resource created | **`Location` mandatory** with the URI of the resource created |
| `202 Accepted` | Accepted, outcome to follow | **`Content-Location`** with the status URI; it is the model of FHIR Bulk Data (§5.2) |
| `204 No Content` | Successful, no body | Typical for a deletion or for the acceptance of a webhook |
| `303 See Other` | The outcome is elsewhere | Used to have a `POST` followed by a `GET` |
| `304 Not Modified` | The conditional validator matches | See §3.5. It has no body |
| `400 Bad Request` | Invalid syntax or schema | Error of form, not of domain rule |
| `401 Unauthorized` | Credential absent, expired or invalid | Historically misnamed: it means *not authenticated*. It obliges `WWW-Authenticate` |
| `403 Forbidden` | Authenticated but not authorised | Careful: `403` confirms the existence of the resource. See below |
| `404 Not Found` | It does not exist, or you are not authorised to know | |
| `405 Method Not Allowed` | Wrong method on the resource | It obliges `Allow` |
| `406 Not Acceptable` | No representation satisfies `Accept` | |
| `409 Conflict` | The current state prevents the operation | Double creation, illicit state transition |
| `410 Gone` | It existed, it has been removed definitively | Semantically different from `404`: it is useful information |
| `412 Precondition Failed` | The `If-Match` validator does not correspond | Optimistic concurrency: §3.6 |
| `415 Unsupported Media Type` | `Content-Type` not handled | |
| `422 Unprocessable Content` | Syntactically valid, semantically not | Domain rule violated |
| `428 Precondition Required` | `If-Match` is missing where it is mandatory | RFC 6585. It prevents the blind update |
| `429 Too Many Requests` | Traffic limit exceeded | RFC 6585. **`Retry-After` mandatory** in the project |
| `500 Internal Server Error` | Unforeseen fault | Never with internal details in the body |
| `503 Service Unavailable` | Temporary unavailability | `Retry-After` |

**The `403` versus `404` case.** In a healthcare system the choice is not one of style.
Answering `403` to someone asking for a resource that exists but is not theirs to see
**confirms that that resource exists**: if the identifier is the tax code (codice fiscale) or
an episode identifier, this is already information about the person. The project's rule:
**outside one's own authorisation perimeter the answer is `404`**, and `403` is used only when
the requester is entitled in any case to know that the resource exists (for example, it
belongs to their tenant but requires a higher scope). The distinction must be documented to
the integrator, otherwise they will interpret it as a bug.

**One error deserves a line of its own:** answering `200 OK` with a body containing
`{"error": "..."}`. Every cache, every proxy, every retry library and every monitoring
dashboard will see a success. The measured error rate will be zero while the service is out of
action.

### 3.4 Content negotiation

**Problem.** The same resource may have different representations - JSON or XML, Italian or
English, compressed or not. How do client and server come to an agreement without multiplying
the URIs?

**Mechanism.** The client declares its preferences with the `Accept`, `Accept-Language`,
`Accept-Encoding` headers, each with quality weights `q` between 0 and 1; the server chooses
and declares the choice in `Content-Type`, `Content-Language`, `Content-Encoding`, and signals
with `Vary` which headers had an influence - information indispensable to the caches, which
would otherwise serve the wrong representation to another client.

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

**In the project.** Three concrete uses:

1. **FHIR** requires the types `application/fhir+json` and `application/fhir+xml`. The project
   serves JSON as the primary representation and XML where an integrator requires it.
2. **`application/problem+json`** for the errors (§3.9): it is a distinct type, and the client
   recognises it without knowing anything about the API.
3. **Language.** It is worth being precise on a point that has legal substance: language
   negotiation concerns the **interface messages**, never the **clinical content**. A report
   drafted in Italian stays in Italian. And - the project's terminological rule, decision D34
   - the Italian translation of a code's `display` is not an interface string to be
   negotiated: it is material with an ownership of its own, kept architecturally separate. See
   [05 §8.5](05-standard-di-interoperabilita.md).

**Specification.** RFC 9110 §12 (negotiation), §8.3-8.5 (`Content-Type`, `Content-Encoding`,
`Content-Language`), §12.5.5 (`Vary`).

**Typical errors.** Forgetting `Vary` and serving an English-speaking user the response cached
for an Italian-speaking one. Ignoring `Accept` and always returning JSON with `200`: the
correct answer to an unsatisfiable preference is `406`. Using extensions in the URI
(`/risorsa.json`) instead of negotiation: it is admitted and widespread, but it multiplies the
URIs for the same resource and complicates caching. The project uses negotiation.

### 3.5 Caching and validators

**Problem.** Not sending back what the client already has, and not making the server redo work
whose result has not changed.

**Mechanism.** Two complementary models, defined in RFC 9111.

**Freshness.** The server declares for how long a response may be considered valid without
asking. `Cache-Control: max-age=300` authorises a cache to serve it for five minutes. The
directives that count:

| Directive | Meaning |
|---|---|
| `no-store` | **Do not store at all**, in any form, not even on disk |
| `no-cache` | Storable, but **always revalidate** before serving |
| `private` | Only the individual user's cache, never a shared cache |
| `public` | Storable by shared caches too |
| `max-age=N` | Fresh for N seconds |
| `must-revalidate` | Once the time is up, do not serve the old one: revalidate |

`no-cache` and `no-store` are the two directives most often swapped for one another.
`no-cache` does **not** prevent storage: it prevents use without revalidation. For a
healthcare datum, `no-store` is what is needed.

**Validation.** The server attaches to the response a **validator** - an `ETag` (an opaque
identifier of the representation) or a `Last-Modified` - and the client, at the next request,
puts it forward again in `If-None-Match` or `If-Modified-Since`. If nothing has changed, the
server answers `304 Not Modified` with no body.

```http
GET /v1/tenants/asl-nord-01/branding HTTP/1.1
If-None-Match: "a3f1c9e2"
```

```http
HTTP/1.1 304 Not Modified
ETag: "a3f1c9e2"
Cache-Control: private, max-age=60
```

An `ETag` may be **strong** (`"a3f1c9e2"`) or **weak** (`W/"a3f1c9e2"`). The strong one
guarantees byte-for-byte identity; the weak one only semantic equivalence. FHIR uses weak
`ETag`s, with the resource's version number as the value
([06 §7.7](06-fhir-da-zero.md)).

**In the project - the binding rule.** The project handles data belonging to the special
categories of art. 9 GDPR. The policy is clear-cut and is not negotiable for convenience:

- **every response containing a clinical datum or a personal datum carries
  `Cache-Control: no-store`**;
- the `ETag`s remain all the same, because they are needed for **optimistic concurrency**
  (§3.6), which is a mechanism distinct from caching even though it uses the same field;
- what is public or configuration is cached: discovery metadata, `CapabilityStatement`, JWKS,
  profile definitions, branding resources, terminologies;
- **a shared cache must never be able to serve one user a response computed for another**:
  `private` on personalised responses and a correct `Vary` on `Authorization` are the minimum,
  but the reliable minimum is `no-store`.

**Typical errors.** `Cache-Control: no-cache` believed equivalent to `no-store`. An `ETag`
computed on the object in memory rather than on the serialised bytes, which changes at every
request because the order of the keys is not stable - a validator that is not stable is not a
validator. No cache headers at all: the intermediaries' default behaviour is defined by the
specification but it is not what most people expect, and it is not a good idea to discover it
in production with healthcare data.

### 3.6 ETag and optimistic concurrency

**Problem.** Two professionals open the same report, both modify it, both save. With no
countermeasures, the second save overwrites the first and nobody notices. It is called the
**lost update**, and it is a silent defect: it does not produce errors, it produces wrong
data.

**Mechanism.** The *pessimistic* strategy consists in locking the resource: it works badly in
a distributed context, because a client that disconnects leaves a lock hanging and an expiry
mechanism is needed, which reopens the problem. The **optimistic** strategy locks nothing: it
allows everybody to try, and makes whoever arrives with a superseded version fail.

The mechanism over HTTP is the **conditional request** with `If-Match`:

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
    Note over B: the client reloads, shows the conflict<br/>and asks the user how to proceed
```

The decisive step is the last one, and it is not technical: **what the interface shows when
the `412` arrives**. A message «error 412» is unacceptable under constraint **V6**; silently
discarding the user's work is worse. The required behaviour is: keep what the user has
written, show what has changed in the meantime and who changed it, ask for an explicit
decision.

**In the project.** Mandatory on every modifiable clinical resource: a report being drafted, a
monitoring plan, a consent, a tenant's configuration. On these resources a `PUT` or a `PATCH`
**without `If-Match` is refused with `428 Precondition Required`** (RFC 6585) - a *project
proposal*, but with a justification that goes beyond the technical: allowing a blind update on
a clinical document is a risk to be recorded in the analysis under ISO 14971, not a
convenience to be granted.

In FHIR the mechanism is the same, with weak `ETag`s aligned to `meta.versionId`
([06 §7.7](06-fhir-da-zero.md)).

**Specification.** RFC 9110 §8.8.3 (`ETag`), §13.1.1 (`If-Match`), §13.1.2 (`If-None-Match`),
§15.5.13 (`412`); RFC 6585 §3 (`428`).

**Typical errors.** Using `Last-Modified` instead of `ETag` as the validator for concurrency:
the resolution is to the second, and two modifications within the same second become
indistinguishable. Generating the `ETag` from a timestamp, with the same defect. Accepting
`If-Match: *` believing that it means «any version whatsoever»: it means «provided the
resource exists», which switches the protection off completely.

### 3.7 `Idempotency-Key` - and its specification status

**Problem.** A client sends `POST /v1/sessions`. The network drops before the response comes
back. The client does not know whether the session has been created. If it retries, it risks
creating two; if it does not retry, it risks having none. `POST` is not idempotent by
definition (RFC 9110 §9.2.2), so the retry is not safe.

**Mechanism.** The client generates a unique identifier **for the logical attempt** and sends
it in a header. The server, on the first request with that key, performs the operation and
**stores the response** associated with the key. At every subsequent request with the same
key, it re-executes nothing: it returns the stored response.

```http
POST /v1/sessions HTTP/1.1
Host: api.telemedic.example
Content-Type: application/json
Idempotency-Key: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f
Authorization: Bearer eyJhbGciOiJFUzM4NCI...

{
  "appointmentRef": "Appointment/789",
  "tenant": "asl-nord-01",
  "scheduledStart": "2026-09-01T09:00:00.000Z"
}
```

Four decisions that must be taken and documented, because the header alone is not enough:

1. **Who generates the key.** The client, always. A key generated by the server solves
   nothing, because the problem is precisely that the client does not know whether the server
   has seen the request.
2. **For how long it is remembered.** *Project proposal:* 24 hours. Beyond that, the key
   expires and a new request is executed as new.
3. **What happens if the same key arrives with a different body.** It must be an error, not a
   silent substitution: the project answers `422` with a `Problem Details` declaring the
   improper reuse. The check is made on a digest of the body, stored together with the key.
4. **What happens if the second request arrives while the first is still in progress.**
   *Project proposal:* `409 Conflict` with `Retry-After`, which is more honest than keeping
   the client waiting on an open connection.

**In the project.** Mandatory on all non-idempotent operations that create clinical state or
have external effects: creation of a session, sending of a report towards the system of
origin, recording of a consent, publication of a document. It is moreover the mechanism the
project **asks the recipients of its own webhooks** to implement (§6.4).

**Specification - this is the point that must be stated without ambiguity.**

> **`Idempotency-Key` is not an IETF standard.** The document is
> `draft-ietf-httpapi-idempotency-key-header`, of the *httpapi* working group; the latest
> revision is **-07 of 15 October 2025**, and it is shown as **expired and archived** on the
> datatracker: it is no longer an active document and **it has never been published as an
> RFC** `[B6]`.

A binding editorial consequence: in public documentation, in integration contracts and in
tender specifications, `Idempotency-Key` must be presented as a **project convention inspired
by an expired Internet-Draft**, never as conformance with a standard. The field name is kept
precisely because it is the most widespread industry convention and the integrators recognise
it: changing it would produce friction with no gain at all.

**Typical errors.** Confusing the idempotency key with the resource identifier: the first
identifies the *attempt*, the second the *result*. Recording the key **after** execution
rather than in the same transaction: two simultaneous requests both get through. Reusing the
same key for logically different operations. Omitting it in the client library's automatic
retries, which is the point at which the mechanism is most needed.

**Alternatives rejected.** Server-side deduplication on a digest of the body, with no explicit
key: rejected because two legitimate and identical creations (two identical sessions scheduled
for the same moment) would be indistinguishable from a duplicate. FHIR's conditional creation
(`If-None-Exist`) solves a related problem inside the FHIR perimeter, but it does not cover
the application operations.

### 3.8 Rate limiting: the form that is correct today

**Problem.** Telling a client how much traffic it has left, **before** it is refused, so that
it can slow down of its own accord instead of being blocked.

**Mechanism and status of the specification.** Here there is a widespread error to be
corrected explicitly, because it is repeated in a very great deal of professional
documentation.

> The trio `RateLimit-Limit` / `RateLimit-Remaining` / `RateLimit-Reset` **has never been a
> standard**, and today it is also **superseded**. The reference document is
> `draft-ietf-httpapi-ratelimit-headers`, revision **-11 of 23 May 2026**, which is an
> **active Internet-Draft** with *intended status* Standards Track but **is not an RFC**. The
> current revision defines **two fields only**, both *Structured Fields*: **`RateLimit`** and
> **`RateLimit-Policy`** `[B6]`.

The parameters, as ascertained in the research phase `[B6]`:

| Field | Parameter | Meaning |
|---|---|---|
| `RateLimit-Policy` | `q` | overall quota |
| | `w` | width of the window, in seconds |
| | `qu` | quota unit (`requests`, `content-bytes`, `concurrent-requests`) |
| | `pk` | partition key: what the quota applies to |
| `RateLimit` | `r` | remaining quota |
| | `t` | seconds to the reset of the window |
| | `pk` | partition key |

The draft moreover registers three problem types with IANA (`quota-exceeded`,
`temporary-reduced-capacity`, `abnormal-usage-detected`) usable as the `type` of a
`Problem Details` (§3.9).

An example conformant with the current revision:

```http
HTTP/1.1 200 OK
RateLimit-Policy: "sessions";q=1000;w=3600;qu="requests";pk=:dGVuYW50OmFzbC1ub3JkLTAx:
RateLimit: "sessions";r=417;t=1832
```

And the response when the quota is exhausted:

```http
HTTP/1.1 429 Too Many Requests
Content-Type: application/problem+json
Retry-After: 1832
RateLimit: "sessions";r=0;t=1832

{
  "type": "https://iana.org/assignments/http-problem-types#quota-exceeded",
  "title": "Quota exceeded",
  "status": 429,
  "detail": "The limit of 1000 session creations per hour on tenant asl-nord-01 has been exceeded.",
  "instance": "/v1/sessions"
}
```

**In the project.** The limit is **per tenant and per scope**, not per IP address (§2.1
explains why the address identifies nobody), and it is configurable per integrator, as the
multi-integrator requirement §6.2.6 of the profile requires. The policy adopted:

- **emit `RateLimit` and `RateLimit-Policy`** conformant with the current revision of the
  draft;
- **emit the three legacy fields too**, for compatibility with existing clients that look for
  them;
- **declare in the documentation that both are non-normative**, with the revision number of
  the draft the project has aligned itself to and the date;
- `429` **always with `Retry-After`**, because it is the only field of this family that is
  actually regulated (RFC 9110 §10.2.3) and that generic libraries respect.

**Typical errors.** Returning `429` with no `Retry-After`, leaving the client to guess -
typically retrying at once and making the situation worse. Applying the limit after
authentication rather than before, so that a brute-force attack consumes cryptographic
validation resources all the same. Counting the requests and not the cost: a thousand light
reads and a thousand bulk exports are not the same load, and it is the reason why the draft
provides for quota units other than requests.

### 3.9 `Deprecation` and `Sunset`

**Problem.** An API changes. The integrators must be warned in such a way that a program can
notice it, not only a human being reading a newsletter.

**Mechanism and status.** Here too the research phase corrected a widespread piece of
information:

> **`Deprecation` is an RFC.** It is **RFC 9745**, *The Deprecation HTTP Response Header
> Field*, **Standards Track, March 2025**, entered as a permanent field in the IANA registry
> of HTTP field names, of structured type *Item* `[B6]`. Anyone still describing it as an
> Internet-Draft is citing superseded information.

The value is a *Structured Fields* **Date**, that is to say an integer preceded by `@`
expressing the seconds since the Unix epoch (RFC 9651 §3.3.7) `[B6]`:

```http
HTTP/1.1 200 OK
Deprecation: @1688169599
Sunset: Sat, 31 Oct 2026 23:59:59 GMT
Link: <https://docs.telemedic.example/api/v1-deprecation>; rel="deprecation"; type="text/html"
Link: <https://api.telemedic.example/v2/sessions>; rel="successor-version"
```

The three parts have distinct and complementary roles:

| Field | Role | Specification |
|---|---|---|
| `Deprecation` | **From when** the endpoint is deprecated. A date in the past means «already deprecated»; in the future, «it will be» | RFC 9745 |
| `Sunset` | **When it will stop working** | RFC 8594 |
| `Link; rel="deprecation"` | Documentation **for a human being** explaining what to do | RFC 9745, with the relations registry of RFC 8288 |

An explicit normative constraint, cited in the research phase: *«the timestamp given in the
Sunset HTTP header field MUST NOT be earlier than the one given in the Deprecation header
field»* `[B6]`. `Sunset` before `Deprecation` is a violation, not an oversight.

**In the project.** The deprecation policy (*project proposal*) is:

1. No endpoint is removed without having been deprecated **at least twelve months
   beforehand**, with `Deprecation` and `Sunset` emitted on every response for the whole
   period.
2. Deprecation is **measured**: a record is kept of which integrators still call the
   deprecated endpoint and with what volume. Without this measure, the decommissioning date is
   a gamble.
3. The deprecation appears **in the OpenAPI contract too** (`deprecated: true` on the
   operation) and in the documentation, not only in the header at runtime.
4. In a healthcare setting a constraint is added that does not exist elsewhere: if an
   integrator uses the deprecated endpoint in a pathway that touches patient safety, its
   decommissioning is a **change subject to change control** under IEC 62304, not a product
   choice.

**Typical errors.** Deprecating with no `Sunset`, which communicates «one day» and produces no
movement at all. Removing before the declared date. Deprecating without indicating the
successor: `Link; rel="successor-version"` exists for exactly that. Emitting the header only
in the documentation and not on the responses, where the automatic systems would see it.

### 3.10 `Problem Details` - errors in machine-readable form

**Problem.** Every API invents its own error format. A client integrating five of them writes
five parsers. None of those formats is understandable to a generic tool.

**Mechanism.** RFC 9457 defines a content type - `application/problem+json` - and a set of
fields:

| Field | Obligation | Content |
|---|---|---|
| `type` | recommended | URI that **identifies the problem type**. It is the stable key on which the client branches |
| `title` | recommended | Readable summary, **constant per type** |
| `status` | optional | The HTTP status code, repeated for convenience |
| `detail` | optional | Explanation **specific to this occurrence** |
| `instance` | optional | URI identifying the specific occurrence |

The document is extensible: fields of one's own can be added, and that is where the structured
domain information goes.

```http
HTTP/1.1 422 Unprocessable Content
Content-Type: application/problem+json
```

```json
{
  "type": "https://docs.telemedic.example/problems/consenso-registrazione-mancante",
  "title": "Consent to recording not obtained",
  "status": 422,
  "detail": "Session ses-9f1c2b3d requires the patient's explicit consent before server-side recording can be activated.",
  "instance": "/v1/sessions/ses-9f1c2b3d/recording",
  "traceId": "0f5b1c2d9a8e4b7f",
  "tenant": "asl-nord-01",
  "violations": [
    { "field": "recording.enabled", "rule": "requires-explicit-consent" }
  ]
}
```

The actual response also carries `Content-Language`, which declares the language of the strings
intended for a person - `title` and `detail`. The value depends on the language negotiated with
the client, and for that reason it does not appear in the example: fixing one here would make
the example false in every other language in which the same response is legitimate.

**In the project.** It is the **single** error format of the application API. With three rules
of its own:

1. **`type` is a stable and resolvable URI**, pointing to a documentation page with the cause,
   the consequences and the remedy. It is the link that reduces support tickets, and it must
   be treated as part of the contract: changing it is a breaking change.
2. **`detail` never contains a clinical datum or a personal datum.** An error message ends up
   in the client's logs, in those of the intermediaries and in the monitoring tools. «Patient
   RSSMRA80A01H501Z has no active consent» is a breach packaged as a courteous message. An
   internal identifier is used, and the correspondence is resolved in the authorised systems.
3. **`traceId` is always present** and corresponds to the distributed trace identifier: it is
   what allows support to find the event without asking the integrator to reproduce the
   problem.

**The relationship with FHIR.** The FHIR API does **not** use `Problem Details`: it uses the
`OperationOutcome` resource, which is the mechanism regulated by the standard
([06 §6.22](06-fhir-da-zero.md)). It is not an inconsistency to be remedied: they are two
interfaces with two different contracts, and in each the formalism proper to it is used. The
project maintains a **mapping table** between its own `type` values and the
`OperationOutcome.issue.code` codes, so that the same domain problem is recognisable on both
surfaces.

**Specification.** **RFC 9457** (2023), which **replaces RFC 7807**. The main difference is
that the new text clarifies extensibility and introduces the IANA registry of problem types.
If you find RFC 7807 cited, the reference must be updated.

**Typical errors.** Using `Content-Type: application/json` instead of
`application/problem+json`: the generic client does not recognise the document. Making `title`
vary with the occurrence - `title` is constant per type, the variable part goes in `detail`.
Using as `type` a URI that does not exist. Returning a stack trace in `detail`: it is a gift
to whoever is looking for the system's internal structure.

---

## 4. Identity and authorisation

A premise that removes half the confusions. **Authentication** and **authorisation** are two
distinct questions:

- *who are you?* → **authentication**. OpenID Connect answers it, SAML 2.0 answers it, SPID,
  CIE and TS-CNS answer it.
- *what are you allowed to do?* → **authorisation**. OAuth 2.0 answers it, the scopes and the
  domain rules answer it.

OAuth 2.0 **is not an authentication protocol**, and using it as one is the historical
vulnerability of this family. OpenID Connect exists precisely because OAuth did not answer the
first question. The framework of Italian digital identity - SPID, CIE, TS-CNS, the levels of
assurance, who the service provider is - is in
[04 - Identity and demographic registries](04-identita-e-anagrafiche.md); here the protocols
are dealt with.

### 4.1 OAuth 2.0

**Problem.** An application must access a resource on a user's behalf **without knowing their
password**. Before OAuth the usual solution was to ask the user for the credentials of the
destination service and use them in their place: no limitation of scope, no expiry, no
selective revocation.

**Mechanism.** OAuth introduces four roles and one object:

| Role | Who it is |
|---|---|
| **Resource Owner** | The user, who owns the datum |
| **Client** | The application that wants to access it |
| **Authorization Server** | Whoever authenticates the user and issues the tokens |
| **Resource Server** | The API that exposes the datum and validates the token |

The object is the **access token**: a short-lived credential, limited to specific scopes
(**scope**) and to specific recipients (**audience**). The client presents it as a *bearer
token* (RFC 6750) in the `Authorization: Bearer …` header.

«*Bearer*» means literally «to the holder»: **anybody who possesses it can use it**. That is
all one needs to know in order to understand why the lifetimes are short, why it must never
appear in a URL and why the mechanisms binding a token to its holder exist (§4.4).

**The flows, and which are still admissible.**

| Flow | When | Status |
|---|---|---|
| **Authorization Code + PKCE** | There is a human being in front of a browser | **The only interactive flow admitted in the project** |
| **Client Credentials** | No user: system calling system | Admitted, with asymmetric authentication (§4.3) |
| **Refresh Token** | Renewing access without interacting again | Admitted, with rotation |
| **Device Authorization Grant** (RFC 8628) | Device with no browser | Out of the v1.0 perimeter `[NV]` |
| **Implicit** | - | **Forbidden.** RFC 9700 §2.1.2: clients «SHOULD NOT use the implicit grant» `[R5]` |
| **Resource Owner Password Credentials** | - | **Forbidden.** RFC 9700 §2.4: «MUST NOT be used» `[R5]` |

The prohibition of the last two is not a hardening on the project's part: the implicit flow
delivered the token in the URL fragment, where it ends up in the history and in the logs; the
password flow reintroduces exactly the problem OAuth exists to solve, that is to say making
the user's password pass through the application.

**In the project.** OAuth 2.0 is the foundation of all authorisation: on the application API,
on the FHIR API (where SMART on FHIR is a profile of OAuth, §5.4), on the embeddable component
and in the calls between Telemedic and the integrators' systems. The authorization server is
Keycloak.

**Specification.** RFC 6749 (framework, 2012); RFC 6750 (use of the bearer token); **RFC
9700**, *Best Current Practice for OAuth 2.0 Security*, which is the operationally binding
document and from which the prohibitions above follow `[R5]`. Supporting documents the project
uses: RFC 8414 (authorization server metadata), RFC 8252 / BCP 212 (native apps), RFC 8707
(resource indicators), RFC 9207 (identification of the issuer in the response, against the
*mix-up* attack) `[R5]`.

**Typical errors.** Treating the access token as proof of the user's identity (it is an
authorisation, not an assertion of identity: for that the OIDC `id_token` is needed). Issuing
tokens with no `aud`, which can thus be turned round towards another resource server - RFC
9700 §2.3 prescribes audience restriction `[R5]`. Coarse scopes of the `read`/`write` sort,
which make it impossible to apply least privilege. Long-lived tokens «for the integrator's
convenience».

### 4.2 PKCE

**Problem.** In the Authorization Code flow, the authorization server sends the browser back
to the client with an authorisation **code**, which the client then exchanges for a token. On
a mobile device or in a single-page application that redirection may be intercepted - for
example by a hostile application registered on the same URL scheme. Whoever captures the code
and knows the `client_id` (which is public) obtains the token.

**Mechanism.** **PKCE** - *Proof Key for Code Exchange* - binds the code to a secret generated
by the client for that single request.

```text
code_verifier   = 43..128 random characters from [A-Z][a-z][0-9]-._~   (RFC 7636 §4.1)
code_challenge  = BASE64URL( SHA-256( ASCII(code_verifier) ) )         (RFC 7636 §4.2, S256)
```

The client sends the `code_challenge` in the authorisation request and the `code_verifier` in
the token request. The server recomputes the hash and compares. Whoever intercepted the code
does not have the verifier, and the code is useless to them.

```mermaid
sequenceDiagram
    autonumber
    participant U as User (browser)
    participant C as Client
    participant AS as Authorization Server
    participant RS as Resource Server

    C->>C: generates a random code_verifier<br/>code_challenge = S256(code_verifier)
    C->>U: redirect to /authorize?response_type=code&client_id=…<br/>&redirect_uri=…&scope=…&state=…<br/>&code_challenge=…&code_challenge_method=S256
    U->>AS: authorisation request
    AS->>U: authentication (SPID / CIE / TS-CNS / local credentials)
    AS->>U: consent screen, where provided for
    AS->>C: redirect to redirect_uri?code=…&state=…&iss=…
    C->>C: verifies that state matches<br/>and that iss is the expected one (RFC 9207)
    C->>AS: POST /token  grant_type=authorization_code<br/>code, redirect_uri, code_verifier, client_id
    AS->>AS: SHA-256(code_verifier) == code_challenge ?
    AS-->>C: access_token, id_token, refresh_token
    C->>RS: GET /risorsa  Authorization: Bearer «access_token»
    RS->>RS: validates signature, iss, aud, exp, scope, tenant
    RS-->>C: 200 OK
```

**In the project.** Mandatory on **all** clients, public and confidential, with
`code_challenge_method=S256`. The `plain` method, although admitted by RFC 7636, is
**refused**: it does not protect against interception, which is the only threat PKCE exists
against. This aligns the project both with RFC 9700 §2.1.1 and with SMART App Launch, which is
categorical - «All SMART apps SHALL support PKCE», servers «SHALL support the `S256`
`code_challenge_method` and SHALL NOT support the `plain` method» `[R5]`.

Two checks that always accompany PKCE and that get forgotten:

- **`state`**, with at least 122 bits of entropy according to SMART `[R5]`, verified on the
  return: it is the defence against CSRF on the redirection;
- **exact correspondence of the `redirect_uri`**: RFC 9700 §2.1 imposes *exact string
  matching*, with the sole exception of the `localhost` port for native applications `[R5]`. A
  redirection with partial matching or with wildcards is a token leak waiting to happen.

**Specification.** RFC 7636 (2015). Made mandatory by RFC 9700 §2.1.1 `[R5]`.

**Typical errors.** Generating the `code_verifier` with a non-cryptographic pseudorandom
generator. Reusing the same verifier across sessions. Implementing PKCE on the client side and
not verifying it on the server side, which is like fitting a lock with no cylinder.

### 4.3 OpenID Connect

**Problem.** OAuth says that the client is authorised to access something, but it does not say
**who the user is**, nor in what way they were authenticated, nor when.

**Mechanism.** OIDC is a thin layer on top of OAuth 2.0 that adds:

- The **`id_token`**: a JWT signed by the authorization server asserting the user's identity.
  **It is the only authentication artefact**; the access token is not.
- The **`openid`** scope, which activates the OIDC behaviour.
- The **`userinfo`** endpoint, for obtaining further attributes.
- **Discovery** on `/.well-known/openid-configuration`, which publishes endpoints, supported
  algorithms and the location of the JWKS.

The claims of the `id_token` that must **always** be validated:

| Claim | Check |
|---|---|
| `iss` | Coincides exactly with the expected issuer |
| `aud` | Contains one's own `client_id` |
| `exp` / `iat` | Not expired, not issued in the future (with a minimal tolerance) |
| `nonce` | Coincides with the one sent in the request - defence against replay |
| `azp` | If present and there are several audiences, it is one's own `client_id` |
| `acr` | **The authentication level actually obtained** |
| `auth_time` | When the authentication took place, if freshness is needed |

The last point deserves attention: `acr` (*Authentication Context Class Reference*) is the
field in which the level of assurance travels, and in the Italian context it has regulated
values - §4.9.

**In the project.** OIDC is the authentication protocol towards Keycloak for the clinical UI,
for the patient UI and for the integrators' clients. It is also the protocol with which
Keycloak federates towards **CIE**, for which an OIDC profile is available `[B7]`.

**Specification.** *OpenID Connect Core 1.0* of the OpenID Foundation. **It is not an RFC**: it
is a standard of another organisation, and it must be cited as such. Discovery is defined by
*OpenID Connect Discovery 1.0*; the authorization server metadata document also has an IETF
form in RFC 8414.

**Typical errors.**

- **Using the access token as proof of identity.** It is the fundamental confusion. The access
  token is for the resource server; the `id_token` is for the client.
- **Not validating `nonce`.** Without it, an `id_token` captured elsewhere can be put forward
  again.
- **Trusting `email` as a stable identifier.** It changes, and in some providers it can be
  modified without verification. The project has a concrete case: among the defects of
  Keycloak reported in the research phase there is precisely that **a federated user can
  change their own email address without verification and assign themselves a local
  password**, defects to be treated as risks under ISO 14971 and not as configuration notes
  `[B7]`. The identifier is `iss` + `sub`, always.
- **Deriving the national identity from `sub`.** In the Italian context the patient's
  identifier is the tax code, with its own rules; see
  [04](04-identita-e-anagrafiche.md).

### 4.4 JWT and JWS: the validation pitfalls

**Problem.** Carrying a set of assertions (*claims*) between two parties in such a way that
the recipient can verify their origin and integrity **without querying the issuer at every
request**.

**Mechanism.** A **JWT** is a container of JSON claims. In the form used practically always -
**JWS Compact Serialization** - it is made up of three parts separated by dots, each encoded
in base64url:

```text
eyJhbGciOiJFUzM4NCIsImtpZCI6InRtLTIwMjYtMDgiLCJ0eXAiOiJhdCtqd3QifQ   ← header
.
eyJpc3MiOiJodHRwczovL3RlbGVtZWRpYy5lc2VtcGlvLml0L3JlYWxtcy9jbGluaWMi… ← payload
.
MEUCIQDf1sK9x0Rz…                                                    ← signature
```

**base64url is not encryption.** Anybody who has the token reads its content. A JWT protects
integrity and origin, not confidentiality. If the content must be secret, **JWE** (RFC 7516)
is needed, which is another thing and which the project does not use for access tokens.

A realistic payload of a project access token (synthetic values):

```json
{
  "iss": "https://telemedic.example/realms/clinic",
  "aud": "telemedic-api",
  "sub": "https://idp.integratore.example#prof-001",
  "act": { "sub": "b1f2c3d4-integratore-client-id",
           "iss": "https://telemedic.example/realms/clinic" },
  "acr": "urn:telemedic:acr:asserted-by-issuer",
  "scope": "https://telemedic.example/scopes/session.start system/Encounter.cu",
  "tenant": "asl-nord-01",
  "fhirUser": "https://telemedic.example/fhir/Practitioner/prc-8812",
  "exp": 1787654621,
  "iat": 1787654321,
  "jti": "0f5b1c2d-9a8e-4b7f-a1c2-3d4e5f6a7b8c"
}
```

> `tenant`, `fhirUser`, `auth_source` and `urn:telemedic:acr:asserted-by-issuer` are **project
> proposals**, not standard claims `[R5]` `[B7]`. `act`, on the other hand, is standard: RFC
> 8693 §4.1.

**The validation pitfalls.** They are known, documented and they keep coming back. RFC 8725
(*JSON Web Token Best Current Practices*) collects them; these are the ones that count:

1. **`alg: none`.** The JWA specification provides for a «none» algorithm. A library that
   accepts the header `{"alg":"none"}` accepts unsigned tokens. **The verifier must never
   deduce the algorithm from the token**: it must impose the set of admitted algorithms.
2. **Confusion between symmetric and asymmetric algorithms.** If the verifier accepts `HS256`
   and the key used as the secret is the server's RSA *public* key - which is public by
   definition - the attacker can sign valid tokens. Same countermeasure: an allow-list of the
   algorithms, per issuer.
3. **`kid` not sanitised.** The `kid` is often used to look up a key in a store or in a file:
   if it ends up in a query or in a path with no checks, what you get is *injection* or *path
   traversal*.
4. **`jku` followed blindly.** The header may contain the URL of the JWK Set. Following it
   means letting the token say where to get the key to verify it: it is a surface for
   *server-side request forgery* and for key confusion. Project rule: the header's `jku`
   **must be compared with the `jwks_uri` registered for that `client_id`**, and if it does not
   match the request is refused `[R5]`.
5. **`aud` not verified.** A token issued for another service is accepted. It is the attack
   that SMART's `aud` parameter exists to prevent - the specification justifies it in so many
   words: «This parameter prevents leaking a genuine bearer token to a counterfeit resource
   server» `[R5]`.
6. **`exp` verified with a generous tolerance.** A tolerance of minutes to compensate for
   badly synchronised clocks extends the replay window. The solution to the clock is NTP
   (§8.1), not the verifier's indulgence.
7. **No replay check on `jti`.** For client authentication assertions, `jti` must be stored
   until `exp` and duplicates must be refused.

**The JWT's fundamental trade-off.** A self-contained token is validated without the network,
but **it cannot be revoked**: until `exp` it is valid, full stop. The three possible answers
are: short tokens (the only one that really scales), introspection at every request (§4.6), a
revocation list (effective but it introduces the state the JWT was meant to eliminate).
Project policy: **short tokens**, with the lifetimes proposed in the research phase - 5-10
minutes for the user's access token in a clinical context, 300 seconds for system tokens,
aligning with the explicit recommendation of SMART Backend Services `[R5]`.

**Binding the token to its holder.** Since a stolen bearer token is usable by anybody, there
are mechanisms binding it to a key of the client's: **DPoP** (RFC 9449), which attaches a
signed proof to the request, and **mTLS-bound tokens** (RFC 8705). The project considers them
hardenings applicable per tenant, not general requirements of v1.0 `[NV]`.

**Specification.** RFC 7519 (JWT), RFC 7515 (JWS), RFC 7516 (JWE), RFC 7517 (JWK), RFC 7518
(JWA), **RFC 8725** (BCP on JWTs). For access tokens in JWT form there is a dedicated profile
defining among other things `typ: at+jwt` `[NV]`.

### 4.5 JWKS and key rotation

**Problem.** Whoever verifies a signature must know the public key of whoever signed, and must
go on working when that key changes - without a coordinated intervention by all the parties at
the same instant.

**Mechanism.** A **JWK Set** is a JSON document publishing a set of public keys, each with a
`kid` identifier. It is exposed at a stable URL, typically declared in the discovery metadata.

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

**Rotation** works because for a period **two keys coexist**:

```text
t0   publishes the new key in the JWKS (new kid); goes on signing with the old one
t1   starts signing with the new one; both remain published
t2   once all the tokens signed with the old one have expired, removes it from the JWKS
```

The period between `t0` and `t1` exists to give the verifiers time to update their cache.
**Skipping it means invalidating in one go all the tokens in circulation.**

**In the project.** The project is **on both sides**: it publishes its own JWKS for whoever
verifies its tokens and its signed webhooks, and it consumes the JWKSs of the integrators'
authorization servers and of the identity providers. The rules (*project proposal*, derived
from the research phase `[R5]`):

- an **allow-list of the hosts** admitted as `jwks_uri`/`jku`, per tenant;
- **a cache with a TTL** and a forced fetch only on an unknown `kid`, with a **rate limit on
  the fetches**, otherwise a random `kid` in a counterfeit token becomes a traffic amplifier
  towards a third party;
- **never a synchronous fetch in the critical path** of validation without a tight timeout;
- **the private key does not live in the container's filesystem**: it lives in a secrets
  manager or in a cryptographic module.

**Specification.** RFC 7517 (JWK and JWK Set), RFC 7518 (parameters per key type).

**Typical errors.** Rotation with no overlap. A cache with no expiry, which makes the rotation
invisible. No cache at all, which makes the authorization server a synchronous point of
failure for every request. Issuing tokens with no `kid`, forcing the verifier to try all the
keys - with the side effect of making it impossible to work out, during an incident, which key
signed what.

### 4.6 Introspection and revocation

**Introspection (RFC 7662).** The resource server asks the authorization server whether a
token is valid **at this moment**, and receives its metadata.

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

The field that counts is **`active`**: it is the only one that gives an answer *up to date at
that instant*, because it takes revocation into account. The cost is a synchronous network
call for every request, which must be mitigated with a cache of very short duration - and
every second of cache is a second in which a revocation has not yet taken effect.

**Revocation (RFC 7009).** The client declares to the authorization server that a token is no
longer to be honoured, typically at logout. A detail of the specification that comes as a
surprise: the endpoint answers `200` even for a token that does not exist, so as not to turn
itself into an oracle revealing which tokens exist.

**Project policy.** **Opaque** tokens towards the outside with introspection, or **JWT**s with
very short lifetimes: they are two coherent points of a trade-off, and mixing them badly gives
the worst of both. The reference choice:

| Surface | Format | Validation |
|---|---|---|
| The user's token for the application API and FHIR | Short JWT (5-10 min) | Local, signature + `aud` + `scope` + `tenant` |
| System token (integrator) | Short JWT (300 s) | Local |
| High-impact operations (bulk export, tenant administration, activation of recording) | JWT | **Local plus introspection**, because the revocation window must be minimal |

The **refresh token** is the longest-lived object in the system and is therefore the one to be
revoked first in an incident. RFC 9700 §2.2.2 requires the refresh tokens of public clients to
be sender-constrained **or** rotated at every use `[R5]`; SMART expressly provides for
rotation, with the obligation on the client to discard the previous one `[R5]`. The project
adopts rotation and grants `offline_access` **only** to confidential clients with asymmetric
authentication.

**Typical errors.** Introspection at every request with no cache: the authorization server
becomes the bottleneck of the whole system. An introspection cache that is too long, which
makes revocation decorative. Revoking the access token and not the refresh token, which
amounts to having revoked nothing.

### 4.7 Token Exchange and delegation between organisations

**Problem.** It is the central problem of the project's integration architecture. A doctor is
already authenticated in the integrator's system. They click «start specialist-to-specialist
consultation (*teleconsulto*)». The video room must appear **with no second login and no
visible redirections**. But Telemedic must know who the doctor is (for the non-repudiable
audit trail, constraint **V5**), which tenant (**V4**), what permissions they have, and it
must know it from a trusted source - not from the browser, which can be manipulated.

**Mechanism.** RFC 8693 defines a type of OAuth grant that exchanges one token for another
token. The caller presents the subject's token (`subject_token`), authenticates as a client,
and receives a token valid in the destination domain.

```mermaid
sequenceDiagram
    autonumber
    participant U as Doctor's browser
    participant IUI as Integrator's UI
    participant IBE as Integrator's backend
    participant TAS as Telemedic's Authorization Server
    participant TAPI as Telemedic's API

    U->>IUI: click "Start specialist-to-specialist consultation"
    IUI->>IBE: POST /consulti/{id}/avvia  (integrator's internal session)
    IBE->>TAS: POST /token<br/>grant_type=…:token-exchange<br/>subject_token=«the doctor's token»<br/>subject_token_type=…:access_token<br/>audience=telemedic-api<br/>+ client_assertion (private_key_jwt)
    TAS->>TAS: 1. authenticates the client<br/>2. traces the tenant back from the client_id<br/>3. validates the subject_token against the<br/>trust anchor OF THAT tenant<br/>4. maps the claims
    TAS-->>IBE: access_token with sub=doctor and act={integrator}
    IBE->>TAPI: POST /v1/sessions  Authorization: Bearer …
    TAPI-->>IBE: { sessionId, embedUrl, oneTimeToken }
    IBE-->>IUI: embedding URL + single-use token
    IUI->>U: mounts the embedded component
```

The decisive point is that **the doctor's token never reaches Telemedic's browser and never
appears in a URL**: the exchange happens from backend to backend.

**Main parameters** (RFC 8693 §2.1) `[R5]`:

| Parameter | Obligation | Content |
|---|---|---|
| `grant_type` | REQUIRED | `urn:ietf:params:oauth:grant-type:token-exchange` |
| `subject_token` | REQUIRED | Token representing the subject on whose behalf one acts |
| `subject_token_type` | REQUIRED | Type identifier (`…:token-type:access_token`, `…:jwt`, `…:saml2`, …) |
| `audience` / `resource` | OPTIONAL | Logical recipient or URI of the destination service |
| `scope` | OPTIONAL | Desired scopes |
| `actor_token` / `actor_token_type` | OPTIONAL / conditional | Token representing the acting party |

**Delegation, not impersonation - and why it is binding here.** RFC 8693 §1.1 distinguishes
two outcomes:

- **Impersonation**: only the `subject_token` is passed; the resulting token makes the caller
  indistinguishable from the user. The audit trail records «Dr Rossi did X», and **loses** the
  information «through system Y».
- **Delegation**: the token carries both identities, with the **`act`** claim (RFC 8693 §4.1).
  The audit trail can answer the question «which system acted on behalf of which person».

The project **always uses delegation, never impersonation** - this is decision D18, and it is
a direct consequence of the auditability constraints (**V5**) and of the traceability
obligations in an MDR and GDPR context `[R5]`. Nested chains are preserved: if the integrator
was in turn acting on behalf of a third party, the nested `act` records it.

**How trust comes about.** Validating the `subject_token`'s signature is not enough: one has
to know **that that token comes from the right issuer for that tenant**. The project's model
`[R5]`:

1. for every tenant a **trust anchor** is registered: the issuer of the integrator's IdP, the
   `jwks_uri`, the admitted algorithms, any expected `aud`;
2. the `client_id` presenting the request is tied to the tenant. **A `subject_token` whose
   `iss` is not the trust anchor of the calling client's tenant is not accepted** - without
   this check, integrator A can present a token from integrator B's IdP;
3. signature, `iss`, `exp`, `nbf`, `aud` are validated, with the algorithm on the allow-list;
4. the mapping of the claims towards the internal identity is **configurable per tenant**,
   never hard-coded: which claim carries the tax code, which the role, which the organisation.

**Implementation status - information relevant to planning.** Keycloak 26.2 made *Standard
Token Exchange* supported, declared conformant with RFC 8693, but with an initial
**internal-to-internal** perimeter (exchange between clients of the same realm); the
*external-to-internal* exchange was indicated as later work. Keycloak 26.5 introduced **in
preview** support for the *JWT Authorization Grant* of RFC 7523 §2.1 `[R5]`. Hence decision
D18: **token exchange is implemented in Telemedic's gateway**, not delegated to a function in
preview, with an independent fallback (single-use entry token, very short expiry, issued
back-channel, never in a URL), a verification spike in the first week of development and an
independent external review.

**Specification.** RFC 8693 (2020, Standards Track). Related: RFC 7523, which defines both the
JWT as a client authentication assertion (`private_key_jwt`) and the JWT as an authorisation
grant.

**Typical errors.** Accepting any `subject_token` with a valid signature without tying it to
the tenant. Using impersonation because it is simpler. Propagating the incoming token's `acr`
as if it were an authentication performed by oneself (§4.9). Issuing the resulting token
without restricting its audience, obtaining a token more powerful than the starting one - a
privilege escalation packaged as an integration.

### 4.8 SAML 2.0, and why it remains necessary in Italy

**Problem.** Federating authentication between different organisations, with signed
assertions, in a world that in 2005 was made of XML and server-side web applications.

**Mechanism.** Three roles: the **Service Provider** (whoever provides the service), the
**Identity Provider** (whoever authenticates), the user with their browser. The *SP-initiated*
flow:

1. the user asks the Service Provider for a protected resource;
2. the SP generates a signed XML **`AuthnRequest`** and has it delivered to the IdP through the
   browser (HTTP-Redirect or HTTP-POST binding);
3. the IdP authenticates the user;
4. the IdP returns a **`Response`** containing a signed **`Assertion`**, with the identity, the
   attributes and the authentication context (`AuthnContextClassRef`), again through the
   browser (HTTP-POST binding);
5. the SP validates signature, recipient, temporal validity, `Audience`, and opens the
   session.

Trust is established with the exchange of **metadata**: signed XML documents declaring
entityID, endpoints, certificates and required attributes.

**Why it has not been replaced by OIDC.** For a reason that is not technical but factual:

> **SPID is not usable over OpenID Connect.** The OIDC guidelines for SPID exist, but **no
> Identity Provider supports it in production**: for SPID, SAML 2.0 is adopted. For CIE, OIDC
> is available as well `[B7]`. This is decision D37.

It follows that the project **must** speak SAML 2.0, not as compatibility with the past but as
a current requirement for accessing national digital identity. And it must speak the Italian
variant, which **is not generic SAML**: the SPID technical rules introduce deviations that a
generic implementation does not satisfy. Four examples ascertained in the research phase
`[B7]`:

- the `Issuer` of the `AuthnRequest` must carry the **`NameQualifier`** attribute, which the
  SAML 2.0 core profile does not provide for the `entity` format;
- the `AllowCreate` attribute on `NameIDPolicy` **must not be emitted**, whereas Keycloak's
  native SAML emits it by default;
- the `AuthnStatement` carries `SessionIndex` **for SpidL1** and **not** for SpidL2 and
  SpidL3, because for levels 2 and 3 no shared authentication session is provided for. A direct
  and non-obvious consequence: **with SPID L2 there is no federated SSO**, Single Logout
  towards the IdP has no practical sense and the duration of the session is entirely the
  Service Provider's responsibility `[B7]`;
- the errors are not generic SAML errors: the IdP conveys the anomaly in `StatusMessage` as a
  structured string `ErrorCode nrNN`, and the Service Provider **is obliged** to translate it
  into the messages prescribed by AgID. Several of those codes (19, 20, 21, 22, 23, 25) **are
  not application errors**: they are normal outcomes of a user session, and recording them as
  errors produces false alarms `[B7]`.

**In the project.** SAML 2.0 is the protocol towards the SPID Identity Providers, through a
dedicated broker realm (`citizen-idp`) acting as the single Service Provider towards the
federation, so as not to multiply metadata and memberships between the `clinic` and `patient`
realms `[B7]`. It is worth repeating the point of substance fixed by decision D36: **the
Service Provider is whoever provides the service over the network, that is to say the deployer,
never the project**. Telemedic is «SPID/CIE/TS-CNS ready», verifiable in continuous
integration; it is not and cannot be «accredited».

**Specification.** *OASIS Security Assertion Markup Language (SAML) V2.0*, an OASIS standard
of 15 March 2005 (Core, Bindings, Profiles, Metadata are distinct documents). The Italian
profile is in AgID's *Regole tecniche SPID* (the SPID technical rules), supplemented by the
*avvisi* (the notices), which modify the base text and must be read together with it `[B7]`.

**Typical errors.** Using a generic SAML library assuming that it is enough. Not verifying the
`Assertion`'s signature **and** that the part signed is the one being read: it is the *XML
Signature Wrapping* family of attacks, and it is the reason why the project's acceptance
criterion includes passing `spid_sp_test` in full, **cases XSW1-XSW8 included** `[B7]`.
Allowing the expansion of external XML entities. Treating the AgID notices as accessory
material.

### 4.9 The levels of assurance and how they propagate

**Problem.** «The user is authenticated» is not sufficient information. Authenticated **how**?
With a password, with two factors, with a certificate on a device? The difference determines
which operations are lawful.

**Mechanism.** The level travels in the `acr` claim (OIDC) and in the `AuthnContextClassRef`
element (SAML). In the Italian context the values are regulated and - a non-obvious point -
**they are the same for SPID and for CIE** `[B7]`:

```text
https://www.spid.gov.it/SpidL1
https://www.spid.gov.it/SpidL2
https://www.spid.gov.it/SpidL3
```

They are URIs, with the `https` scheme and no trailing slash. The mapping towards the
international model is declared by the *Regolamento recante le modalità attuative per la
realizzazione dello SPID* (the regulation setting out the implementing arrangements for SPID)
`[B7]`:

| Level | ISO/IEC 29115 | Factors |
|---|---|---|
| SPID L1 | **LoA2** | One factor (password) |
| SPID L2 | **LoA3** | Two factors, **not** necessarily certificate-based |
| SPID L3 | **LoA4** | Two factors **based on digital certificates**, private keys on a device conformant with Annex II of Regulation (EU) 910/2014 |

**Three verified traps that change the design.**

1. **With CIE the level cannot be inferred from the response.** The technical rules declare
   that the `AuthnContextClassRef` returned is **always `SpidL3`**, because the CIE provides
   the maximum level of reliability. It follows that an access with a password alone (CIE L1)
   and one with card and PIN (CIE L3) produce **the same assertion**. The only lever is the
   *request*: the level must be imposed in `RequestedAuthnContext` `[B7]`. Hence the rule:
   **both `acr_requested` and `acr_asserted` are always recorded**, and it is the only way of
   respecting **V5** without asserting something false.
2. **The level does not travel in the `act` claim.** RFC 8693 §4.1 expresses delegation - *who
   is acting* - not the subject's authentication level. Putting it there is a semantic abuse.
   The level lives in `acr` `[B7]`.
3. **`acr` does not mean the same thing in the two directions.** If the citizen authenticated
   **on** Telemedic with SPID, `acr` is authoritative. If the identity arrives by token
   exchange from an integrator's IdP, `acr` is **reported**: Telemedic reports what the token
   asserts, not what it has verified. Copying the one into the other without qualifying it
   would make an authentication that Telemedic has not performed appear as verified by
   Telemedic `[B7]`.

The representation adopted (**project proposal** in every part of it except `acr` and `act`):

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

and, for the case of identity reported by an integrator:

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

The authorisation rules that follow from this `[B7]`: an operation that the legislation ties
to strong authentication under art. 64 CAD requires `verified_by_telemedic = true`; an
internal clinical operation may accept the reported identity, provided the tenant's trust
anchor allows it and the reported level reaches the configured threshold; **the configuration
of «which external `acr` values are accepted for which operation» is per tenant and forms part
of the integration contract, not of the code**; every audit entry records `acr`, `auth_source`
and `act` in full.

**An implementation cost that is systematically forgotten.** The SPID provider for Keycloak
configures the `RequestedAuthnContext` values **statically per identity provider**. If the
level has to be dynamic - L2 for the patient, L3 for the administrator - **two identity
provider instances are needed for each SPID IdP**, one per level `[B7]`. With ten or so IdPs
in the registry, the amount of work is not marginal.

**An economic constraint to be documented for the deployer**, not technical but decisive in
product choices: asking for **a single attribute beyond the demographic data** takes the cost
per access from €0.4 to €3.5 `[B7]`. It is the technical and economic reason why the minimum
set of attributes requested must be defended: asking for `address` or `idCard` for a remote
consultation is excessive, and it is also contestable when the agreement is negotiated.

---

## 5. Healthcare integration

This section deals with the four healthcare protocols **as protocols**: how one speaks, not
what one says. The content - resources, profiles, terminologies, templates - is in modules
[05](05-standard-di-interoperabilita.md) and [06](06-fhir-da-zero.md).

### 5.1 FHIR REST

**Problem.** Exchanging structured clinical data with an ordinary web interface, without the
weight of the document models and the messages of the earlier generations.

**Mechanism.** FHIR defines a REST API over HTTP in which **every resource is a URI** and the
operations are the HTTP methods:

| Interaction | Request |
|---|---|
| `read` | `GET [base]/Encounter/enc-4471` |
| `vread` | `GET [base]/Encounter/enc-4471/_history/3` |
| `create` | `POST [base]/Encounter` |
| `update` | `PUT [base]/Encounter/enc-4471` |
| `patch` | `PATCH [base]/Encounter/enc-4471` |
| `delete` | `DELETE [base]/Encounter/enc-4471` |
| `search` | `GET [base]/Encounter?patient=…&date=ge2026-08-01` |
| `transaction` | `POST [base]` with a `Bundle` of type `transaction` |
| `operation` | `POST [base]/Patient/$export` |

What makes FHIR REST a protocol and not just an application of HTTP:

- **A conformance formalism.** `GET [base]/metadata` returns a `CapabilityStatement` declaring
  what the server supports. It is the contract (§1.4), in FHIR form.
- **A regulated search language**, with modifiers, comparison prefixes, chaining and
  inclusions.
- **An error semantics of its own**, `OperationOutcome` (§3.10).
- **Regulated optimistic concurrency** with weak `ETag`s aligned to `meta.versionId` and
  `If-Match` mandatory for the safe update ([06 §7.7](06-fhir-da-zero.md)).
- **Content types of its own**: `application/fhir+json`, `application/fhir+xml`.

**In the project.** It is the clinical interface, **in both roles**: Telemedic is a **FHIR
server** for the integrators that read and write clinical content, and it is a **FHIR client**
towards the integrators' systems when it has to read a `Patient` or an `Appointment` that has
not been passed to it `[R5]`. The data model follows the HL7 Italia guides (decision D13),
with a `Composition` inside a `Bundle` as the primary artefact of the report and
`DiagnosticReport` kept only as a read-only projection.

**Specification.** FHIR release 4, version **4.0.1**, the *RESTful API* section of the
standard. Writing «FHIR R4» without `4.0.1` is already an imprecision, as
[05 §2.4](05-standard-di-interoperabilita.md) recalls.

**Typical errors.** Treating the search as SQL and asking the server for operations the search
language does not express. Ignoring the pagination of the `Bundle`s and assuming that the
first page is the complete result. Using `PUT` to create with a client-chosen identifier on a
server that does not allow it. Ignoring the `CapabilityStatement` and discovering in
production that an interaction is not supported.

### 5.2 FHIR Bulk Data - regulated asynchrony

**Problem.** Extracting hundreds of thousands of resources. A synchronous paginated search
does not hold up: the intermediate timeouts kill it, pagination over a dataset that changes
gives inconsistent results, and the server's memory blows up.

**Mechanism.** An asynchronous protocol in three phases, which is the canonical case study of
the `202 Accepted` + polling model of §2.12:

```mermaid
sequenceDiagram
    autonumber
    participant C as Client
    participant S as FHIR server
    participant F as File store

    C->>S: GET Group/«id»/$export?_type=Encounter,Observation<br/>Accept: application/fhir+json<br/>Prefer: respond-async
    S-->>C: 202 Accepted<br/>Content-Location: «status url»
    loop until it is ready
        C->>S: GET «status url»  (Accept: application/json)
        S-->>C: 202 Accepted + Retry-After: 120 + X-Progress
    end
    C->>S: GET «status url»
    S-->>C: 200 OK + JSON manifest
    C->>F: GET «url of each file» (ndjson)
    F-->>C: ndjson lines, one resource per line
```

The elements ascertained in the research phase `[B6]` and to be taken up without errors:

- **The current version is 3.0.0**, *trial-use*, in force from 11 December 2025. Anybody still
  citing STU2 is out of step.
- The **`Prefer: respond-async`** header is mandatory in the kick-off; 3.0.0 admits the second
  value `separate-export-status`.
- New parameters in 3.0.0 with respect to STU2: **`_until`**, **`organizeOutputBy`**,
  **`allowPartialManifests`**, besides `_outputFormat`, `_since`, `_type`, `_elements`,
  `patient` (POST only), `includeAssociatedData`, `_typeFilter`.
- The completion **manifest** contains `transactionTime`, `request`, `requiresAccessToken`,
  `output`, `error`, and - new in 3.0.0 - `outputOrganizedBy` and `link` for pagination.
- **Explicit warning**: the guide's *continuous build* presents a structurally different
  manifest (it renames `error` to `outcome`, adds `manifestType`, `fileSize`, removes
  `request`). **It is not material to implement against** `[B6]`. It is exactly the kind of
  divergence that produces non-interoperable implementations, and it is the reason why the
  project pins the versions of the guides.

**In the project.** Bulk extraction towards research, dashboards, migrations, portability of
the datum under art. 20 GDPR. With two constraints of its own: **the bulk export is a
high-impact operation**, and therefore requires token introspection (§4.6), is fully traced in
the audit trail and requires a dedicated scope; and **the output format is ndjson** (§8.3),
which is the technical reason why that format enters the project.

**Typical errors.** Polling at a fixed frequency ignoring `Retry-After`. Assuming that the
files' URL requires no authentication: the manifest has the `requiresAccessToken` field
precisely to say so. Loading a gigabyte-sized ndjson file into memory instead of processing it
line by line - the format exists to be read as a stream.

### 5.3 MLLP over TLS

**Problem.** HL7 version 2 defines the content of the message, not the transport. Over a TCP
connection the bytes arrive as a continuous stream (§2.3): one needs to know where a message
ends and the next begins.

**Mechanism.** **MLLP** - *Minimal Lower Layer Protocol* - frames every message between a
start byte and a pair of end bytes:

```text
0x0B   <HL7 v2 message>   0x1C 0x0D
```

Nothing else. No authentication, no encryption, no integrity check, no acknowledgement at
transport level - the acknowledgement is at **application** level, and it is the `ACK` message
described in [05 §4.5](05-standard-di-interoperabilita.md).

**The point that counts.**

> **Bare MLLP is plain text over TCP.** Anybody on the network path reads names, tax codes,
> diagnoses, and can modify them without either of the two parties noticing.

It is not a defect of the standard: MLLP was born for closed hospital networks of the
nineteen-eighties, where the threat model was a different one. It is a defect **of the
deployment** to use it that way today.

**In the project.** Binding rules, consistent with
[05 §4.6](05-standard-di-interoperabilita.md):

1. Every MLLP listener is exposed **exclusively** inside a TLS channel with **mutual
   authentication** (§2.5) - which is exactly what the IHE node authentication profile
   prescribes.
2. Never a listener reachable from an untrusted network, not even «temporarily for the
   acceptance test».
3. The counterparty's certificate must be **verified**, not merely presented.
4. The HL7 v2 adapter is a boundary component: it translates towards the internal canonical
   model and does not contaminate it.

**Specification.** *HL7 Transport Specification: MLLP*, an HL7 standard distinct from the
messaging standard. The hexadecimal values of the framing are confirmed by two independent
sources citing the official specification; the primary document was not read directly in the
research phase. `[NV]` Port 6660, often cited as conventional, does **not** appear to be
registered for MLLP: in practice it is agreed between the parties.

**Typical errors.** Looking for the framing bytes with a substring search without handling
messages fragmented over several TCP segments. Assuming that one connection serves one message
only: MLLP connections are persistent and serve continuous flows. Not implementing a timeout
on the wait for the `ACK`, with the result that a block on the counterparty's side blocks the
whole queue. Answering `ACK` before having persisted, which turns the confirmation into a lie.

**Alternatives rejected.** MLLP over HTTP: it exists as a practice, but it loses the
synchronous application acknowledgements on which the hospital integration engines are built.
The project supports it as an additional mode (decision D4), not as a replacement.

### 5.4 DICOMweb

**Problem.** Biomedical images have a standard of their own, DICOM, born with a network
protocol over TCP (`DIMSE`) that presupposes open ports, negotiated associations and
point-to-point configurations. In a web world, and across organisational boundaries, it does
not work.

**Mechanism.** **DICOMweb** is the set of RESTful services defined by the DICOM standard:

| Service | What it does | Method |
|---|---|---|
| **QIDO-RS** | *Query based on ID for DICOM Objects* - searches studies, series, instances | `GET` |
| **WADO-RS** | *Web Access to DICOM Objects* - retrieves the instances | `GET` |
| **STOW-RS** | *Store Over the Web* - stores | `POST` |
| **UPS-RS** | Management of the workflow steps | various |

The metadata are available in a JSON representation, and the binary data in `multipart` with
the DICOM transfer types.

**In the project - and here the constraint is architectural, not technical.** Telemedic **is
not an image archiving system**. Its relationship with DICOMweb is one of consultation only,
and a rule holds that module [05 §7.3](05-standard-di-interoperabilita.md) states as a
prohibition:

> **Diagnostic images do not travel over the video channel.** The lossy compression of the
> video means that what is seen **is not** the diagnostic datum. Sharing the screen with a
> radiological image on it is not reporting: it is a conversation about an image.

It follows that, where it is needed, the image is opened from a viewer that retrieves it over
DICOMweb from its authoritative source, with its own authorisation and its own audit trail.
The video channel remains a communication channel. It is also a boundary relevant to MDR
qualification (constraint **V2**).

**Specification.** DICOM PS3.18, *Web Services*. The DICOM standard is published in parts and
updated frequently: one cites the part, not «DICOM» in general.

**Typical errors.** Rerouting the pixels through one's own backend with no need, becoming
responsible for data one is not entitled to retain. Neglecting the fact that DICOM images
contain identifying data in the attributes, not only in the pixels: an image «anonymised» by
cutting off the visible header is not anonymised. Assuming that all systems implement
DICOMweb: many still speak only DIMSE, and a bridge is needed.

### 5.5 SMART App Launch and SMART Backend Services

**Problem.** OAuth 2.0 is not enough in a healthcare setting. Three things are missing: the
**clinical context** (which patient, which encounter), the **granular scopes on clinical
resources**, and a **standardised discovery** of a FHIR server's authorisation endpoints.

**Mechanism - App Launch.** It is a profile of OAuth 2.0 Authorization Code that adds:

- **the launch context**: the application receives the current patient and encounter
  **without asking the user for them**;
- **the FHIR scopes**, in the form `{patient|user|system}/{Resource}.{permissions}` - where the
  permissions of version 2 are the letters of `cruds` (create, read, update, delete, search),
  which **must appear in the order of that string**: `.cu` and `.rs` are valid, `.dus` is not
  `[R5]`;
- **discovery** at `{fhirBase}/.well-known/smart-configuration`, which has replaced the old
  mechanism based on the `CapabilityStatement`: the specification expressly declares that that
  mechanism «is now deprecated» `[R5]`.

Two modes: **EHR launch**, in which the clinical system starts the application passing it
`iss` (the FHIR endpoint) and `launch` (an **opaque** identifier the application must not
interpret); and **standalone launch**, in which the application starts on its own and asks for
the context with the `launch/patient` and `launch/encounter` scopes.

The **`aud`** parameter in the authorisation request is not cosmetic: it contains the URL of
the FHIR resource server, and the specification justifies it in so many words - «This parameter
prevents leaking a genuine bearer token to a counterfeit resource server» `[R5]`.

The token endpoint's response extends the OAuth one with the context. Four fields solve real
problems of the project without proprietary extensions `[R5]`:

| Field | What it is for in the project |
|---|---|
| `need_patient_banner` | Says whether the host system already displays the patient banner: it solves the problem of the double banner in the embeddable component |
| `smart_style_url` | It is the **standard white-label mechanism** for SMART applications: the host publishes colours and typefaces, the application applies them. It must be treated as untrusted input - it is a URL controlled by a third party |
| `tenant` | It maps directly onto constraint **V4** |
| `fhirContext` | It is the natural place for the reference to the `Appointment` that gave rise to the consultation |

**Mechanism - Backend Services.** It is the pattern for **a backend calling a backend, with no
user**: the case of the healthcare management system that creates a specialist-to-specialist
consultation session from a scheduling job. It requires the
*client-confidential-asymmetric* profile: the client authenticates with a **JWT signed with
its own private key** (RFC 7523), not with a shared secret `[R5]`.

```http
POST /realms/clinic/protocol/openid-connect/token HTTP/1.1
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials
&scope=system%2FEncounter.cu%20system%2FDiagnosticReport.c
&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer
&client_assertion=eyJhbGciOiJFUzM4NCIsImtpZCI6IjJmN2M5YTFlIn0...
```

Three advantages over the shared secret, all relevant for a multi-integrator system `[R5]`:
the secret never travels over the network, not even once; the server keeps only public keys,
so the compromise of its database does not allow the clients to be impersonated; rotation
requires no synchronous coordination, it is enough to publish the new key with a different
`kid` (§4.5).

Constraints on the authentication JWT, from the specification `[R5]`: `alg`, `kid`, `typ`
mandatory in the header; `iss` and `sub` both equal to the `client_id`; `aud` equal to the URL
of the token endpoint; `exp` **no more than five minutes in the future**; `jti` as an
anti-replay nonce. The `RS384` and `ES384` algorithms are mandatory. On the registration of
the key the specification has a clear preference: **a URL to the JWK Set** («strongly
preferred») over a JWK Set delivered at registration («strongly discouraged»).

**In the project.** The project has **two distinct SMART roles**, and the documentation must
keep them separate so as not to generate confusion `[R5]`:

- **as a SMART client**, it reads `Patient`, `Appointment`, `Practitioner` from the
  integrator's FHIR server, with App Launch or Backend Services *towards* them;
- **as a SMART server** (authorization server and resource server), it exposes its own FHIR
  API and accepts third-party applications.

Both are in the perimeter for v1.0 and must be estimated separately.

An integration detail that gives rise to recurring reports: **the `scope` returned may be
narrower than the one requested**. The client must read it, not assume it `[R5]`.

And a constraint of semantic hygiene: application capabilities that do **not** correspond to
FHIR resources - starting a video session, rotating a TURN key, managing consent to recording -
**must not be disguised as FHIR scopes**. Forcing «start a session» into
`patient/Encounter.cu` is a semantic abuse and makes it impossible to revoke the one without
the other. They must be expressed as scopes in URI form `[R5]`.

**Specification.** *SMART App Launch*, HL7, version 2.x; *SMART Backend Services* and *Client
Confidential Asymmetric* are pages of the same guide. *SMART Web Messaging* is a **separate
guide, at a lower maturity** (version 1.0.0, STU1, 2022-05-06) and must be documented as
experimental `[B6]`.

**When NOT to use SMART** `[R5]`:

| Situation | Why not | Alternative |
|---|---|---|
| The integrator has no FHIR server and has no intention of having one | SMART presupposes a FHIR resource server as `aud`; without one, it reduces to OAuth with strange names | OAuth + REST application API (§3) |
| All that is needed is to propagate identity, with no clinical context | The launch context is the added value: if it is not needed, complexity is paid for nothing | Token Exchange (§4.7) |
| Communication between systems with no FHIR semantics at all | The `system/{Resource}` scopes do not model non-FHIR capabilities | `client_credentials` with `private_key_jwt` and URI scopes |
| A system that speaks only HL7 v2 over MLLP | No HTTP, no OAuth | §5.3, v2 adapter with mTLS |

---

## 6. Events and messaging

### 6.1 The protocol of the broker adopted

**Problem.** Decoupling whoever produces a fact from whoever consumes it. The producer must not
have to know how many consumers exist, whether they are active, nor at what rate they process.
The consumer must be able to be switched off for an hour and find everything again on restart.

**Mechanism.** The project adopts **Apache Kafka** (decision D15). Its protocol is **binary
over TCP**, with typed and versioned requests and responses, and it is not an RFC: it is
documented by the project itself. The properties that count for the design:

- **A persistent log, ordered per partition.** Not a queue that empties: an append-only log.
  The consumer keeps an **offset**, and can reread from the beginning.
- **Ordering guaranteed only inside the partition.** It is the most misunderstood point.
  Global ordering between partitions **does not exist**. The message key determines the
  partition: putting the session identifier as the key guarantees the ordering **of that
  session's events**, which is the only ordering the domain really needs.
- **Consumer groups.** The partitions are distributed among the consumers of a group; the
  maximum parallelism is the number of partitions.
- **Retention by time or by size**, independent of consumption. Hence a consequence that must
  be said explicitly: **the broker is not an archive of clinical data**. The retention of the
  events is configured for operations, and legally compliant retention lives elsewhere.

**The transactional outbox - the part that does not belong to the broker but is
indispensable.** Decision D15 prescribes a **transactional outbox on PostgreSQL** in front of
Kafka:

```mermaid
flowchart LR
    A["Application transaction<br/>(PostgreSQL)"] -->|"same transaction"| B["outbox table"]
    A --> C["domain tables"]
    B -->|"relay"| D["Apache Kafka"]
    D --> E["internal consumers"]
    D --> F["webhook dispatcher"]
```

The reason is a classic and insidious problem: if you write to the database **and then**
publish to the broker, you have two non-atomic operations. A fault in between produces either
a **lost event** (datum written, event never published) or a **phantom event** (event
published for a transaction subsequently rolled back). By writing the event in the *same
transaction* as the datum, and publishing it with a relay process that reads the table, the
problem disappears: either both writes happen, or neither does.

The relay publishes **at least once**: an event may be published twice if the relay goes down
between publication and marking. It is accepted by construction, and deduplication is the
consumer's business (§6.4).

**In the project.** All the domain events: session created, started, concluded, cancelled;
report signed; consent obtained or withdrawn; remote monitoring threshold exceeded; document
published. The publication abstraction **stays behind a project interface**, so as not to wedge
the domain code into the broker (D15). For the deployment at the customer's premises the
**single-node KRaft mode** is adopted, so as to contain the operational weight.

**Specification.** *Apache Kafka protocol guide*, the project's documentation. It is not a
standard of a standardisation body: it is the specification of an implementation, and it is
correct to say so. The qualification as SOUP under IEC 62304 follows from this (decision D12).

**Typical errors.** Expecting global ordering. Using a low-cardinality key, creating an
overloaded partition. Confusing the broker with a database and querying it for current state.
Putting **clinical data in the payload** without considering that the broker keeps them for
the whole retention period, in the clear, on nodes that might not have the same protection
regime as the database - which is why the project prefers payloads **with references** and not
with complete clinical content (§6.4).

**Alternatives rejected.**

| Alternative | Why rejected |
|---|---|
| **An AMQP or MQTT queue** | Queue semantics (the message is consumed) rather than log semantics: rereading is lost, and it is needed for reconciliation and for rebuilding projections |
| **Direct HTTP calls between services** | Temporal coupling: if the recipient is switched off, the event is lost. It is exactly what one wants to avoid |
| **A queue table on the database** | It works at small scale, but high-frequency polling degrades the database, which is already the most precious component |

### 6.2 CloudEvents

**Problem.** Every system invents its own envelope for events. A consumer integrating three of
them writes three parsers and cannot build generic tools - routing, traces, archiving - that
work across all of them.

**Mechanism.** CloudEvents defines a minimal set of **context attributes** common to any
event, and the **bindings** that map them onto concrete protocols.

Mandatory attributes: `id`, `source`, `specversion`, `type`. Optional ones in common use:
`subject`, `time`, `datacontenttype`, `dataschema`. The specific content goes in `data`.

```json
{
  "specversion": "1.0",
  "type": "telemedic.session.completed.v1",
  "source": "https://telemedic.example/tenants/t0001",
  "subject": "ses-9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d",
  "id": "8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f",
  "time": "2026-08-25T09:47:12.004Z",
  "datacontenttype": "application/json",
  "dataschema": "https://docs.telemedic.example/schemas/session-completed-v1.json",
  "data": {
    "tenant": "t0001",
    "sessionId": "ses-9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d",
    "encounterRef": "Encounter/enc-4471",
    "outcome": "completed",
    "durationSeconds": 1284,
    "recorded": false
  }
}
```

**The two ways of carrying it over HTTP.** The HTTP binding defines two modes:

- **structured**: the whole event, envelope included, is in the body, with
  `Content-Type: application/cloudevents+json`;
- **binary**: the context attributes go in the HTTP headers with the `ce-` prefix, and the body
  contains only `data`.

The formation rule is verbatim in the specification: *«all CloudEvents context attributes,
including extensions, MUST be mapped to HTTP headers with the same name as the attribute name
but prefixed with `ce-`»* `[B6]`.

**With a verified trap that must be encoded in the tests.** The `datacontenttype` attribute
does **not** have a `ce-` header: its value corresponds to `Content-Type`, and the
specification is explicit - *«Note that a `ce-datacontenttype` HTTP header MUST NOT also be
present in the message»* `[B6]`. Emitting `ce-datacontenttype` is a violation of a `MUST NOT`.

```http
POST /webhooks/telemedic HTTP/1.1
Host: gestionale.integratore.example
ce-specversion: 1.0
ce-type: telemedic.session.completed.v1
ce-source: /tenants/t0001/sessions
ce-subject: ses-9f1c2b3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d
ce-id: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f
ce-time: 2026-08-25T09:47:12.004Z
Content-Type: application/json
Idempotency-Key: 8f3c1e02-77a1-4f77-9d1a-6a2b3c4d5e6f

{"tenant":"t0001","sessionId":"ses-9f1c2b3d…","outcome":"completed"}
```

**In the project.** CloudEvents is the envelope of **every** event published, both on the
internal broker and towards the outside in the webhooks. Project conventions:

- **a hierarchical and versioned `type`**: `telemedic.<domain>.<fact>.v<N>`. The version is
  part of the type, so that a consumer can ignore a version it does not know instead of
  failing on an unexpected field.
- **`source` contains the tenant**, consistently with **V4**.
- **`subject` is the entity the event refers to**, which allows filtering without deserialising
  `data`.
- **`dataschema` points to a published and versioned schema**: it is the third contract of
  §1.4.
- **`id` is the deduplication identifier**, reused as `Idempotency-Key` in the webhook.

**Specification.** *CloudEvents* v1.0, a CNCF specification; the HTTP binding is at version
**1.0.2** `[B6]`. It is not an RFC.

**Typical errors.** Putting a clinical datum in `data` without assessing where the event ends
up (§6.4). Changing the shape of `data` without changing the version in the `type`, breaking
all the consumers in silence. Using `time` as an identifier or as an ordering key across
different sources - they are different clocks, §8.1.

### 6.3 Webhooks and HTTP message signing

**Problem.** Notifying an external system that something has happened, without that system
having to poll. And, on the receiving side, being certain that the notification really comes
from Telemedic and not from anybody who knows the URL.

**Mechanism.** A **webhook** is an HTTP request the producer sends to a URL supplied by the
consumer. It is the inverse model with respect to the API: here the producer is the client.

The security problem is structural: **a webhook URL is public and anybody can call it**. The
confidentiality of the content is guaranteed by TLS, but the **authenticity of the sender** is
not: TLS authenticates the server towards the client, not the other way round. Three
countermeasures are needed, all three of them:

1. **Signing of the message**, so that the recipient can verify origin and integrity.
2. **A timestamp inside the signature**, with a tight acceptance window, against replay.
3. **A unique event identifier** allowing deduplication.

**The signing method, and its specification status.** The regulated method is **HTTP Message
Signatures**, which defines how to sign a chosen set of components of a request - method, path,
authority, selected headers, a digest of the body - with explicit parameters (key identifier,
algorithm, instant of creation, expiry, nonce). It is **RFC 9421, *HTTP Message Signatures*,
Standards Track, February 2024** - verified against the RFC registry while this module was
being drafted. It is the only regulated approach, and it replaces the proprietary signatures
every platform has invented on its own account.

A point that generates confusion: **RFC 9421 does not define the body digest**. The text
expressly declares that it does not directly cover the message content and that it relies on a
separate specification: `Content-Digest` is defined by **RFC 9530**, a companion document.
Whoever signs a body must therefore implement both.

```http
POST /webhooks/telemedic HTTP/1.1
Host: gestionale.integratore.example
Content-Type: application/json
Content-Digest: sha-256=:X48E9qOokqqrvdts8nOJRJN3OWDUoyWxBf7kbu9DBPE=:
Signature-Input: sig1=("@method" "@target-uri" "content-digest" "ce-id" "ce-type");\
  created=1787654321;keyid="tm-2026-08";alg="ecdsa-p384-sha384";expires=1787654621
Signature: sig1=:MEUCIQDf1sK9x0Rz…:
```

The recipient reconstructs the canonical string from the components listed in
`Signature-Input`, retrieves the public key from Telemedic's JWKS through the `keyid`, verifies
the signature and checks that `created` is inside the accepted window.

**In the project.** The webhooks are mode (a) of decision D4. The configuration is **per
integrator**: URL, key, filters on the event types, retry policy, traffic limits. The
project's rules:

- **always sign**, with an asymmetric key and a `keyid` resolvable from the public JWKS, so
  that rotation (§4.5) does not require coordination with each integrator;
- **an accepted time window of five minutes** (*project proposal*);
- **a lean payload**: identifiers and references, not clinical content. The recipient rereads
  from the API with their own authorisation. This reduces exposure, makes the notification
  independent of the evolution of the data model and - a point that is not secondary -
  prevents a badly configured webhook URL from becoming a leak of health data;
- **the recipient must answer `2xx` quickly** and do the work asynchronously: the response
  means «accepted», not «processed».

**The standard alternative in the FHIR world.** For notifications on clinical resources there
is the `Subscription` resource, and for FHIR R4 the *Subscriptions R5 Backport* guide (version
1.1.0, STU, 11 January 2023) `[B6]`. Two details the research phase corrected and that must be
taken on board: **there is no `backport-topic` extension at all** - in R4 the
`SubscriptionTopic`'s canonical is written **directly in `Subscription.criteria`**; and in R4
**there is no `SubscriptionStatus` resource**: the status travels as a `Parameters` resource
conformant to a profile, with the parameter names in kebab-case (`event-number`, not
`eventNumber`) `[B6]`. The project offers both channels: `Subscription` for the FHIR-native
integrators, CloudEvents webhooks for all the others.

**Typical errors.**

- **Signing with HMAC and a shared secret.** It works, it is widespread, and it has two
  defects: the recipient possesses the secret and can therefore **fabricate** notifications
  indistinguishable from the real ones, which destroys non-repudiation; and rotation requires
  coordination with every integrator.
- **Signing only the body.** With no method and URI in the signature, the same signed
  notification can be replayed towards another endpoint.
- **Comparing the signatures with a string comparison that is not constant-time.**
- **Not validating the destination URL supplied by the integrator.** A URL pointing to
  `127.0.0.1`, to `169.254.169.254` or to an internal network address turns the webhook
  dispatcher into an engine for *server-side request forgery* towards one's own
  infrastructure. Allow-lists, controlled DNS resolution and a prohibition on redirections are
  needed.
- **Delivering synchronously inside the domain transaction.** A slow integrator becomes the
  bottleneck of the clinical system.

### 6.4 Delivery, retries, ordering

Three properties that must be decided explicitly, because the default value is always the
worst one.

**Delivery.** The project guarantees **at least once**. It is the only honest guarantee over
an unreliable channel between two independent parties (§1.6). «Exactly once» is obtained
**only** as the joint effect of at-least-once plus deduplication on the receiving side, and it
must be described that way in the integration contract: it is a commitment that involves the
other party too.

Hence an explicit request to the integrator: **deduplicate on `ce-id`**, which the project
reuses as `Idempotency-Key` (§3.7). A recipient that does not deduplicate will process the
same event twice, and in a clinical context that means, for example, two reports published.

**Retries.** The project's policy (*project proposal*):

| Aspect | Choice |
|---|---|
| When a retry happens | `5xx`, `429`, timeout, connection error |
| When a retry does **not** happen | `4xx` other than `429`: the request is wrong, retrying it is pointless |
| Backoff | Exponential with a random component (*jitter*), from 1 s to 6 h |
| Attempts | Twelve, covering roughly seventy-two hours (`P-08`) |
| `Retry-After` | **Respected when present**, and it prevails over the computed backoff |
| After exhaustion | The event goes to the dead-letter queue, the integrator is notified through an out-of-band channel, the event remains **recoverable via the API** |

The random component is not a detail: without it, a thousand dispatchers retrying after a
fault converge on the same instant and produce a synchronised burst that prevents the
recipient from recovering. It is the phenomenon known as the *thundering herd*.

The last row of the table is the point that makes the system recoverable with no human
intervention: **a lost notification must not mean a lost datum**. The consumer must be able to
ask «give me all the events after identifier X», and this is an API endpoint, not a support
operation.

**Ordering.** The project guarantees ordering **per subject**, not globally:

- on the broker, ordering is guaranteed inside the partition, and the key is the session
  identifier (§6.1);
- on the webhooks, **ordering is not guaranteed at all**, and this must be said without
  softening: with retries and parallel deliveries, the event «session concluded» may arrive
  before «session started».

From this follows a rule of event design worth more than any reordering mechanism: **every
event carries its own sequence number per subject and a self-sufficient state**, so that the
consumer can discard whatever is older than what has already been processed. Designing events
that require ordering in order to be interpreted means building a system that will be
incorrect under every fault condition.

---

## 7. Real time - summary entry

> **This is an orientation entry, not the treatment.** Real time has a module of its own:
> [08 - WebRTC from scratch](08-webrtc-da-zero.md), which covers NAT and its types, signalling
> and the offer/answer model, candidate gathering and pairing, the DTLS handshake and what the
> certificate fingerprint really guarantees, the Short Authentication String, the codecs,
> congestion control and the measurement of quality. Here **only** which protocol solves which
> problem is said, so as to place them in the general picture.

### 7.1 The media stack, at a glance

```text
┌────────────────────────────────────────────────────────────┐
│  Encoded audio and video (Opus, VP8/VP9/H.264/AV1)         │
├────────────────────────────────────────────────────────────┤
│  RTP  (media transport)  +  RTCP  (control and quality)    │
├────────────────────────────────────────────────────────────┤
│  SRTP  (encryption and authentication of the media)        │
│  keys derived from the DTLS handshake (DTLS-SRTP)          │
├────────────────────────────────────────────────────────────┤
│  ICE  (path selection)  -  STUN  -  TURN if needed         │
├────────────────────────────────────────────────────────────┤
│  UDP  (or TCP/TLS only as a fallback through TURN)         │
├────────────────────────────────────────────────────────────┤
│  IP                                                        │
└────────────────────────────────────────────────────────────┘

data channel:  SCTP  over  DTLS  over  ICE/UDP
```

### 7.2 The catalogue

| Protocol | Problem it solves | Specification | In the project |
|---|---|---|---|
| **ICE** (*Interactive Connectivity Establishment*) | Two devices behind NAT do not know which path works between them. ICE does not choose: **it tries all the combinations** of candidates and keeps the one that works, with an order of priority | RFC 8445 | Every session. The ICE restart is the recovery mechanism when the network changes |
| **STUN** (*Session Traversal Utilities for NAT*) | A device behind NAT does not know its own public address. It asks an external server, which answers «I see you as this address and this port» | RFC 8489 | Its own `coturn` server, in the deployment profiles provided for (constraint **V1**) |
| **TURN** (*Traversal Using Relays around NAT*) | When no direct path works - symmetric NATs on both sides, restrictive firewall - a **relay** is needed to forward the traffic | RFC 8656 | The same server. It is the case in which the word «peer-to-peer» stops describing the path: see the reformulation of decision D19 |
| **DTLS** (*Datagram TLS*) | TLS presupposes a reliable, ordered transport. Over UDP there is none: DTLS brings the handshake and the encryption back over datagrams | RFC 6347 (1.2); RFC 9147 (1.3) | Negotiation of the media keys and transport of the data channel |
| **DTLS-SRTP** | Binding the DTLS handshake to the derivation of the SRTP keys, so that the media is encrypted with keys negotiated directly between the two ends | RFC 5764 | It is what allows the statement «end-to-end encrypted», **conditional on independent verification of the keys** (D19, D22) |
| **SRTP** (*Secure RTP*) | Encrypting and authenticating the RTP packets at low computational cost and without adding delay | RFC 3711 | The media of every session |
| **RTP / RTCP** | RTP carries the samples with a timestamp and a sequence number; RTCP reports loss, jitter and round-trip time | RFC 3550 | RTCP is the source of the session's quality metrics |
| **SCTP** and the **WebRTC data channel** | A message channel that is reliable or partially reliable, ordered or unordered, inside the same connection as the media | RFC 9260 (SCTP); RFC 8261 (SCTP over DTLS); RFC 8831 (data channels); RFC 8832 (opening protocol) | The captions channel - defined and versioned in the protocol even before a transcription engine exists (decision D24) - and ancillary low-latency exchanges |
| **SDP** (*Session Description Protocol*) | Describing in textual form the capabilities of a session: codecs, addresses, keys, fingerprints. **It is not a transport protocol**: it is a format carried by the signalling | RFC 8866; its use in WebRTC is defined by RFC 8829 (JSEP) | The body of the signalling messages, which travel over the WebSocket of §2.10 |

### 7.3 The three things to remember here

1. **Signalling is not WebRTC.** WebRTC does not specify how the two ends exchange offer,
   answer and candidates: it is deliberately left to the application. In the project it is the
   WebSocket of §2.10. It follows that **the security of the signalling is the project's
   responsibility**, not the standard's, and it is the point at which an intermediary could
   substitute the certificate fingerprints - the reason why the Short Authentication String is
   mandatory by default (decision D22).
2. **The fallback to a relay is not an operational detail.** It changes the path, the cost and
   the latency, and it changes what can be publicly stated about the path of the data.
3. **Server-side recording terminates the encryption on the server.** It is the inescapable
   consequence of decision D23, and it is not a defect to be hidden: it is a property to be
   declared in the consent notice and signalled persistently and unhideably in the interface.

---

## 8. Cross-cutting protocols and formats

### 8.1 NTP and clock synchronisation

**Problem.** Machines' clocks drift. An ordinary oscillator loses or gains seconds a day. In a
distributed system this produces three categories of fault, all of them insidious because they
generate no errors:

1. **Security.** A token with an `exp` evaluated against a slow clock stays accepted after
   expiry. A webhook signature with a five-minute window (§6.3) is systematically refused if
   the two clocks diverge by six.
2. **Ordering of events.** Reconstructing the order of two events coming from different
   machines by comparing their timestamps is **incorrect**, and module
   [11 - Computing foundations](11-fondamenti-informatici.md) explains why in general terms.
   This is why the project uses sequence numbers per subject (§6.4).
3. **Legal evidence.** The non-repudiable audit trail (**V5**, decision D42) has value only if
   its timestamps are reliable and their reliability is demonstrable.

**Mechanism.** **NTP** estimates the local clock's offset and the network delay together,
exchanging four timestamps for every query, and **corrects gradually** (*slewing*) instead of
jumping, because a backwards jump makes future events appear in the past and breaks any logic
based on monotonicity.

NTP's security problem is that the classic protocol is not authenticated: whoever controls the
network can move a system's clock - and with it the validity of the tokens. The answer is
**NTS** (*Network Time Security*), which authenticates the source.

**In the project.** Rules (*project proposal*):

- **every node is synchronised**, with the synchronisation **monitored**: a node whose offset
  exceeds a threshold generates an alarm, because it is already a security risk;
- **every instant in every message and in every audit line is in UTC**, in RFC 3339 form, with
  at least milliseconds. No local time in the data; local time is a presentation choice;
- **duration is measured with a monotonic clock**, never as the difference of two wall clocks:
  an NTP adjustment in between would produce negative durations;
- for audit trails retained over the long term, the internal timestamp **is not a qualified
  timestamp**: if enforceability against third parties is required, a time-stamping service is
  needed, and it is a decision to be taken explicitly `[NV]`.

**Specification.** NTP version 4: **RFC 5905**. NTS: **RFC 8915**. For much tighter
synchronisation there is PTP (IEEE 1588), which the project does not use: it is not needed,
and it requires hardware support in the network.

**Typical errors.** Using `System.currentTimeMillis()` - or the equivalent in any language - to
measure a duration. Comparing instants coming from different machines to infer their order.
Saving instants with no time zone and reconstructing it by convention. Allowing the clock to
jump backwards on a node that writes audit trails.

### 8.2 DNS, as much as is needed

**Problem.** People and configuration files use names; the network uses addresses. A
distributed map is needed, one that holds billions of entries and changes continually.

**Mechanism.** A hierarchical name space, resolved by successive delegation. The record types
one meets in the project:

| Record | Content |
|---|---|
| `A` / `AAAA` | IPv4 / IPv6 address |
| `CNAME` | Alias towards another name |
| `SRV` | Service, protocol, port, priority and weight: used by clients that know how to look for it |
| `TXT` | Arbitrary text, typically for domain ownership verification |
| `CAA` | Which certification authorities may issue certificates for the domain |
| `HTTPS` / `SVCB` | Service parameters (including the ALPN) retrievable **before** the connection |

Two properties with direct operational consequences:

- **The cache is governed by the TTL**, and the TTL is respected creatively by resolvers,
  operating systems and runtimes. A change of address is not instantaneous, and **lowering the
  TTL must be done before the change**, not during it.
- **Classic DNS is in the clear and not authenticated.** Whoever controls resolution controls
  the destination. The countermeasures are DNSSEC (signing of the records, RFC 4033-4035) and
  encrypted transport: DoT (RFC 7858) and DoH (RFC 8484).

**In the project.** Three points at which DNS is not invisible infrastructure but a design
decision:

1. **Resolution of the URLs supplied by the integrators** - webhooks, `jwks_uri`, `jku`. It is
   the *server-side request forgery* vector already cited in §4.4 and §6.3: resolution must be
   controlled, private and link-local addresses must be refused, and the check must be made
   **on the address actually used for the connection**, not on an earlier resolution -
   otherwise the window between the check and the use stays open.
2. **`CAA` records** on the project's domains, to limit who may issue certificates.
3. **Discovery of the TURN servers**, where names and priorities have a direct effect on
   quality.

**Specification.** RFC 1034 and RFC 1035 (base); RFC 4033-4035 (DNSSEC); RFC 7858 (DoT); RFC
8484 (DoH); RFC 9460 (`SVCB` and `HTTPS`).

**Typical errors.** Caching the resolution for ever inside the process, and not noticing a
change of address. At the opposite extreme, resolving at every request and making DNS a
synchronous point of failure. Verifying a URL and then resolving it again at the moment of
connection, opening the *rebinding* window.

### 8.3 The formats, and when each makes sense

#### JSON

**Problem.** A readable structured exchange, with a minimal data model, mappable onto any
language.

**Mechanism.** Six types: object, array, string, number, boolean, `null`. Nothing else. There
are no dates, there are no exact decimal numbers, there are no comments, there are no binary
data.

**In the project.** It is the primary format of everything: application API, FHIR JSON,
CloudEvents, JWT, configuration. With four project rules, all of them a consequence of the
absences just listed:

1. **Dates are RFC 3339 strings in UTC.** JSON has no date type; every system that invents one
   breaks interoperability.
2. **Identifiers are strings**, even when they look like numbers (§1.5).
3. **Amounts and decimal measurements are not floating-point numbers.** In FHIR the `decimal`
   type must be preserved in its representation, because the precision declared is clinical
   information: `36.5` and `36.50` do not say the same thing about how the measurement was
   made.
4. **Binaries are base64**, with the increase in size of about a third that this entails; if
   the binary is large, it does not go in the JSON but behind a reference.

**Specification.** RFC 8259 (which is at once Standards Track and Internet Standard) and
ECMA-404, which describe the same syntax from two perspectives. The schemas: **JSON Schema**,
dialect `2020-12`, used by OpenAPI 3.1 (§3.2). Partial modifications:
`application/json-patch+json` (RFC 6902) and `application/merge-patch+json` (RFC 7386).

#### XML

**Problem.** Documents with mixed structure, namespaces, validation by schema and - above all
- **signing of a part of the document**.

**Mechanism.** Trees of elements with attributes, namespaces, and an ecosystem of related
standards: XSD for validation, XPath and XSLT for navigation and transformation, XML Signature
for signing, XML Encryption for encryption.

**In the project.** It is not a choice but an external constraint, at three points:

- **SAML 2.0** (§4.8): assertions and metadata are signed XML;
- **CDA release 2**, where Italian clinical documents have a consolidated tradition
  ([05 §5](05-standard-di-interoperabilita.md));
- **FHIR XML**, where an integrator requires it.

XML does one thing JSON does not: it allows **a portion** of a document to be signed and it
allows verification that that portion is the one being read. It is the reason why SAML is XML,
and it is also the reason why the *XML Signature Wrapping* family of attacks exists (§4.8):
the signature is valid, but it covers a fragment different from the one the application
processes.

**Typical errors, which are almost all of them security errors.** Not disabling the resolution
of external entities (*XXE*), which allows file reading and requests from the machine doing
the processing. Not limiting entity expansion, which allows memory exhaustion with a few
kilobytes. Not canonicalising correctly before signing or verifying.

#### ndjson

**Problem.** Transferring millions of records without building a single gigantic document that
has to be read in full before it can be processed.

**Mechanism.** One complete JSON document per line, separated by a line feed. The file as a
whole is **not** a valid JSON document, and that is precisely the point: it is read line by
line, processed and discarded, with constant memory regardless of the size of the file. And a
corrupted line does not invalidate the rest.

**In the project.** It is the output format of FHIR Bulk Data (§5.2), with the type
`application/fhir+ndjson`, and the format of the bulk exports towards analytical tools.

**Specification.** It is not an RFC. It is a convention documented on `ndjson.org` and known
also as *JSON Lines*. The FHIR content type, on the other hand, is defined by the FHIR
standard.

**Typical errors.** Loading it into memory in full, nullifying the sole reason for its
existence. Expecting it to be a JSON array. Not handling the case of a final line with no line
feed.

#### Protocol Buffers

**Problem.** When volume and latency count, textual serialisation costs: in bytes over the
network and in CPU cycles for encoding and decoding.

**Mechanism.** A `.proto` schema defines the messages; a compiler generates the code; the
encoding is binary and compact, with the fields identified by **numbers** and not by names.
Hence the rule of evolution: **a field number is never reused**. Adding optional fields is
backward-compatible; changing the type or reusing a number breaks existing readers silently,
which is the worst way of breaking.

**In the project.** **Not used in the public interfaces**, and the reason is deliberate: the
archetypal integrator (§6.1 of the project profile) has neither the tools nor the skills to
consume a binary format with a compiled schema, and constraint **V3** requires every capability
to be reachable from a third-party system. A format requiring a compilation chain raises the
barrier to entry more than the performance lowers it.

It remains worth assessing for high-volume internal traffic - the session quality metrics
towards TimescaleDB are the natural candidate - where both parties are controlled by the
project `[NV]`.

**Specification.** *Protocol Buffers Language Guide*, published by the project itself. It is
not a standard of a standardisation body. The current version of the language is `proto3`.

#### The choice table

| If… | Format |
|---|---|
| It is a public API read by human beings too | **JSON** |
| It is a document that must be signed in part, or a standard imposes it | **XML** |
| It is a bulk export to be read as a stream | **ndjson** |
| It is very high volume internal traffic between controlled components | **Protocol Buffers** *(to be assessed)* |
| It is a large binary file (image, recording, attachment) | **None of the above**: a reference to a resource, never embedded content |

The last row is a binding rule and not a piece of advice: embedding a file of tens of
megabytes in base64 inside JSON multiplies memory and bandwidth, makes it impossible to resume
an interrupted transfer and turns every log line into a problem.

---

## 9. Summary table

In the «status» column only the information relevant to implementation appears: if a
specification is a draft, if it is expired or if it is superseded, it is said here.

### 9.1 Transport and web

| Protocol | Problem solved | Where in the project | Specification | Status |
|---|---|---|---|---|
| IP | Global routing | Everywhere | RFC 791 / RFC 8200 | Internet Standard |
| UDP | Minimal multiplexing, with no guarantees | Media, STUN/TURN, QUIC | RFC 768 | Internet Standard |
| TCP | Reliable, ordered byte stream | HTTP, WebSocket, MLLP, broker, database | **RFC 9293** | Standards Track; replaces RFC 793 |
| QUIC | Independent streams, connection migration | Transport of HTTP/3 | RFC 9000, 9001, 9002 | Standards Track |
| TLS | Confidentiality, integrity, authentication of the channel | Everywhere | **RFC 8446** (1.3) | Standards Track. **TLS 1.0/1.1 deprecated by RFC 8996** |
| mTLS | Client authentication at transport level | MLLP, TS-CNS, internal traffic | RFC 8446 | Standards Track |
| HTTP (semantics) | Methods, statuses, headers, caching | All the APIs | **RFC 9110**, RFC 9111 | Standards Track |
| HTTP/1.1 | Textual syntax | Universal compatibility | RFC 9112 | Standards Track; replaces RFC 7230 and RFC 2616 |
| HTTP/2 | Multiplexing, header compression | Default on the gateway and internal traffic | RFC 9113, RFC 7541 | Standards Track |
| HTTP/3 | No head-of-line blocking, migration | Public gateway, with mandatory fallback | RFC 9114, RFC 9204 | Standards Track |
| WebSocket | Bidirectional message channel | WebRTC signalling, interactive notifications | RFC 6455; over HTTP/2 RFC 8441 | Standards Track. RFC 8441 not universally supported `[NV]` |
| Server-Sent Events | One-way push towards the browser | State changes, progress, alerts | **WHATWG HTML Living Standard**, section *Server-sent events* | **It is not an RFC**: a living standard, with no version |

### 9.2 Application interfaces

| Protocol / mechanism | Problem solved | Where in the project | Specification | Status |
|---|---|---|---|---|
| REST | Uniform interface over resources | Application API | R. Fielding's thesis, 2000 | **Architectural style, not a standard** |
| OpenAPI 3.1 | Machine-verifiable contract | Application API and webhooks | OpenAPI Initiative | **It is not an RFC**. JSON Schema `2020-12` |
| Status codes | Outcome understandable to generic clients | Everywhere | RFC 9110 §15 | Standards Track |
| Content negotiation | Agreed representation and language | FHIR, errors, i18n | RFC 9110 §12 | Standards Track |
| Caching and validators | Not retransmitting what is unchanged | Metadata, JWKS, profiles, branding | RFC 9111; `ETag` RFC 9110 §8.8.3 | Standards Track |
| `ETag` + `If-Match` | Optimistic concurrency | Every modifiable clinical resource | RFC 9110 §13.1.1; `428` RFC 6585 | Standards Track |
| `Idempotency-Key` | Safe retry of non-idempotent operations | Creations, dispatches, consents, webhooks | `draft-ietf-httpapi-idempotency-key-header-07` | **NOT an RFC. Expired and archived draft (2025-10-15)** `[B6]` |
| `RateLimit`, `RateLimit-Policy` | Communicating the remaining quota | Gateway, per tenant and scope | `draft-ietf-httpapi-ratelimit-headers-11` | **NOT an RFC**. Active Internet-Draft (2026-05-23). **The three-field form is superseded** `[B6]` |
| `Retry-After` | Saying when to retry | `429`, `503`, polling | RFC 9110 §10.2.3 | Standards Track |
| `Deprecation` | From when an endpoint is deprecated | Decommissioning of API versions | **RFC 9745** | **Standards Track, March 2025** `[B6]` |
| `Sunset` | When it will stop working | Ditto | RFC 8594 | Standards Track. Never earlier than `Deprecation` `[B6]` |
| `Problem Details` | Machine-readable errors | All the errors of the application API | **RFC 9457** | Standards Track; **replaces RFC 7807** |

### 9.3 Identity and authorisation

| Protocol | Problem solved | Where in the project | Specification | Status |
|---|---|---|---|---|
| OAuth 2.0 | Delegated authorisation | All authorisation | RFC 6749, RFC 6750 | Standards Track |
| OAuth security | What is still admissible | Default posture | **RFC 9700** | **BCP**. Forbids implicit and password `[R5]` |
| PKCE | Binding the code to the client | All clients, `S256` | RFC 7636 | Standards Track; mandatory per RFC 9700 §2.1.1 |
| Issuer in the response | Defence against *mix-up* | Client towards several ASs | RFC 9207 | Standards Track `[R5]` |
| OpenID Connect | Authentication and identity | Clinical and patient UI, CIE | **OpenID Connect Core 1.0** | **It is not an RFC** (OpenID Foundation) |
| JWT / JWS / JWK | Claims verifiable without the network | Tokens, assertions, signatures | RFC 7519, 7515, 7517, 7518 | Standards Track |
| JWT best practices | Avoiding the known pitfalls | Every validation | **RFC 8725** | BCP |
| JWKS | Public keys and rotation | Towards and from every counterparty | RFC 7517 | Standards Track |
| `private_key_jwt` / JWT grant | Asymmetric client authentication | Backend Services, integrators | RFC 7523 | Standards Track |
| Introspection | Validity of the token now | High-impact operations | RFC 7662 | Standards Track |
| Revocation | Invalidating a token | Logout, incidents | RFC 7009 | Standards Track |
| Token Exchange | Delegation between organisations | Integrator's identity, `act` claim | **RFC 8693** | Standards Track. Delegation, never impersonation (D18) `[R5]` |
| Binding to the holder | Token not reusable if stolen | Hardening per tenant | RFC 9449 (DPoP), RFC 8705 (mTLS) | Standards Track. Outside the v1.0 minimum `[NV]` |
| SAML 2.0 | Federation with signed assertions | **SPID** | OASIS SAML V2.0, 15 March 2005 | OASIS standard. **Necessary: SPID is not operated over OIDC** `[B7]` |
| Levels of assurance | How strong the authentication is | `acr`, authorisation per operation | SPID / CIE technical rules; ISO/IEC 29115 | `SpidL1\|L2\|L3` = LoA2/3/4. **With CIE the assertion is always `SpidL3`** `[B7]` |

### 9.4 Healthcare integration, events, real time, cross-cutting

| Protocol | Problem solved | Where in the project | Specification | Status |
|---|---|---|---|---|
| FHIR REST | Structured clinical exchange over HTTP | Clinical API, in both roles | FHIR **4.0.1**, *RESTful API* section | Normative for the parts declared as such |
| FHIR Bulk Data | Asynchronous bulk extraction | Exports, migrations, portability | Guide **3.0.0** | **Trial-use, in force from 11-12-2025.** STU2 superseded. The *continuous build* diverges: do not implement against it `[B6]` |
| MLLP | Framing of HL7 v2 over TCP | Hospital integration engines | *HL7 Transport Specification: MLLP* | HL7 standard. **Bare, it is in the clear: always inside mTLS** |
| DICOMweb | RESTful services over images | Consultation only, never on the video channel | DICOM PS3.18 | DICOM standard |
| SMART App Launch | Clinical context and FHIR scopes over OAuth | SMART client and server | HL7 SMART App Launch 2.x | Published. PKCE `S256` mandatory, `plain` forbidden `[R5]` |
| SMART Backend Services | System calling system, with no user | Integrators, scheduling jobs | Same guide | Published. `expires_in` recommended 300 s `[R5]` |
| SMART Web Messaging | Dialogue between embedded application and host | Life cycle of the embedding | **Separate** guide, 1.0.0 STU1, 2022-05-06 | **Lower maturity: document as experimental** `[B6]` |
| FHIR `Subscription` (R4 backport) | Notifications on clinical resources | FHIR-native integrators | Guide **1.1.0**, 2023-01-11 | STU. **No `backport-topic` extension**; the topic lives in `Subscription.criteria` `[B6]` |
| The broker's protocol | Persistent log, decoupling | All the domain events | *Apache Kafka protocol guide* | Specification of an implementation, not of a body. SOUP under IEC 62304 |
| CloudEvents | Common envelope for events | Broker and webhooks | CloudEvents 1.0; HTTP binding **1.0.2** | CNCF specification. **`ce-datacontenttype` MUST NOT** `[B6]` |
| HTTP Message Signatures | Authenticity and integrity of the webhook | Every outbound webhook | **RFC 9421** | Standards Track, February 2024 |
| `Content-Digest` | Digest of the body to be signed | Webhooks | **RFC 9530** | Standards Track. **RFC 9421 does not define it** |
| ICE / STUN / TURN | Finding a path across the NATs | Every video session | RFC 8445 / 8489 / 8656 | Standards Track. Detail in module 08 |
| DTLS / DTLS-SRTP / SRTP | Encrypting the media with keys negotiated between the ends | The media of every session | RFC 6347 and 9147 / RFC 5764 / RFC 3711 | Standards Track. Detail in module 08 |
| RTP / RTCP | Media transport and measurement of quality | Media and metrics | RFC 3550 | Internet Standard |
| SCTP and data channel | Message channel inside the session | Captions, ancillary exchanges | RFC 9260, 8261, 8831, 8832 | Standards Track |
| SDP | Description of the session | Body of the signalling | RFC 8866; JSEP RFC 8829 | Standards Track. **It is a format, not a transport** |
| NTP / NTS | Aligned and authenticated clocks | Tokens, signatures, audit trail, metrics | RFC 5905 / RFC 8915 | Standards Track |
| DNS | Name resolution | Everywhere; checking of third-party URLs | RFC 1034/1035; RFC 4033-4035; 7858; 8484; 9460 | Standards Track |
| JSON | Primary serialisation | Everywhere | RFC 8259; ECMA-404 | Internet Standard |
| XML | Documents signable in part | SAML, CDA, FHIR XML | W3C Recommendations | External constraint, not a choice |
| ndjson | Streaming of many records | Bulk Data, exports | `ndjson.org` convention; FHIR type regulated | **It is not an RFC** |
| Protocol Buffers | Compact binary serialisation | Not in the public interfaces | *Language Guide*, `proto3` | Specification of a project, not of a body |

---

## 10. How a protocol is chosen

There is no best protocol: there is the one suited to a problem, in a context, with given
constraints. These are the criteria actually used in the project, **in the order in which they
are to be applied**. The order counts: the first three eliminate options, the others choose
among those that remain.

### Criterion 1 - Does a standard already exist for this problem?

If it does, it is used. Not because it is always technically superior, but because
**interoperability is the product**, not an attribute of the product. A proprietary format 20%
better and understandable to nobody is worth less than a mediocre standard the integrator
already speaks.

The corollary is less obvious: **the standard is used even when only a fraction of it is
used**. Adopting CloudEvents for an envelope of six fields looks oversized, until the second
consumer arrives and a generic routing tool is needed.

### Criterion 2 - Does data sovereignty allow it? (constraint V1)

No mandatory component hosted outside the European Union, no runtime dependency on services
that cannot be installed in the most restrictive profile (decision D24). This criterion
**eliminates options before any technical assessment**: a protocol that works only with a
service run by a supplier outside the perimeter is not a candidate to be compared, it is a
candidate excluded.

And from decision D40 it follows that it is no longer even a purely technical argument: the
NIS entity must **declare its relevant suppliers to the authority by name**, with the country
of their registered office. The choice of a protocol that ties one to a supplier is a datum the
customer will have to communicate.

### Criterion 3 - Does it pass through the users' real networks?

A protocol that works in the laboratory and does not traverse a hospital trust's firewall does
not work. In concrete terms: UDP is often blocked outbound, non-standard ports are often
closed, the proxies that inspect traffic break the protocols they do not recognise, mobile
networks change address.

Operational consequence: **every choice that depends on a network condition has a mandatory
fallback**, and the fallback is designed together with the main choice, not afterwards. HTTP/3
with a fallback to HTTP/2; direct media with a fallback to a relay; WebSocket with a fallback
to polling for the status function alone.

### Criterion 4 - Who is on the other side, and what can they do?

The profile of the archetypal integrator is a cloud healthcare management system in the SME
bracket, with a small development team and no specialisation in healthcare interoperability. A
protocol that requires a compilation chain, a specific library or a deep knowledge of a
standard is a protocol that **will not be adopted**, and constraint **V3** would come out of it
satisfied only on paper.

Hence three concrete choices already taken: JSON and not Protocol Buffers on the public
interfaces; accepting the SMART scopes in the v1 syntax by converting them, instead of refusing
them `[R5]`; offering the webhooks alongside the FHIR `Subscription`s instead of imposing the
latter.

### Criterion 5 - What happens when something goes wrong?

The question must be asked **before** adopting, not after the first incident:

- If the recipient is switched off for an hour, is the information lost?
- If the message arrives twice, what happens?
- If it arrives out of order?
- If the message is only half there, does the recipient notice?
- If somebody intercepts it and sends it again, is it accepted?
- If the counterparty is hostile, what is the maximum damage?

A protocol that has no answers to these six questions has not been chosen: it has been
suffered.

### Criterion 6 - Is it observable and diagnosable?

A protocol whose traffic cannot be seen without specialised tools costs in support every day
of its life. It is one of the serious, not aesthetic, reasons why the project uses textual
formats on the public interfaces: when an integrator opens a ticket, the difference between a
`curl` pasted into the ticket and a binary dump to be decoded is the difference between ten
minutes and two days.

Corollary: **every protocol in the project must be traceable**. A propagated correlation
identifier, a reliable timestamp (§8.1), recording of the outcomes. A protocol that cannot be
correlated to a distributed trace is a blind spot.

### Criterion 7 - What does it entail under a medical device regime?

A criterion that does not exist elsewhere and that here is binding. Every protocol implemented
with a third-party library is **SOUP** under IEC 62304 (decision D12): it must be recorded in
an inventory, justified, monitored for vulnerabilities and updated within the declared support
period, with the SBOM generated by the pipeline (decision D45). A protocol with ten transitive
dependencies costs ten times as much in qualification.

Hence a criterion rarely stated elsewhere: **for equal function, the protocol with the smaller
dependency surface is preferred**, even if it is a little less convenient. It is the same logic
by which the project's TypeScript SDK depends on the FHIR types alone and implements the
transport internally `[B6]`.

### Criterion 8 - Is it a reversible choice?

A protocol behind a project interface can be replaced; a protocol whose model has entered the
domain code cannot. It is exactly the reason why decision D15 prescribes that the event
publication abstraction stay behind an interface of its own, and why the content of the report
is modelled as a **canonical dataset** with the document serialisation treated as substitutable
(decision D30).

The operational question: *if in two years we had to replace it, how many lines of domain code
would change?* If the answer is «many», an adapter is needed before proceeding.

---

## 11. Typical errors, for those who have never worked with protocols

These are the errors that repeat themselves, in this order of frequency.

**1. Confusing «it works» with «it is correct».** An implementation that works against one
counterparty is not conformant: it is compatible with that counterparty. Conformance is
verified against the specification and against a validator, not against a courteous partner.
In the project this has a precise name: the acceptance criterion of v1.0 is passing
`spid_sp_test` in full, not «access works» `[B7]`.

**2. Treating the error conditions as rare cases.** In real operation they are not: the
network drops, the timeouts fire, the messages duplicate. The error path must be designed and
**tested** with the same care as the happy path. A retry never exercised in a test is a retry
that does not work.

**3. Ignoring idempotency.** It is the most expensive error in a healthcare setting, because
it produces duplicate data that nobody notices at once: two reports, two sessions, two alerts.
Every operation that modifies state must have an explicit answer to the question «what happens
if it arrives twice?».

**4. Trusting what arrives from the network.** Every byte coming from outside is hostile until
proved otherwise. That includes: the fields of a JSON document, the length of a string, the
URL of a webhook supplied by an integrator, the `kid` of a JWT, the `jku` in the header, the
`Origin` of a WebSocket, the content of an XML document. The project is held to this discipline
not only as good practice but because the CRA regime (decision D27) makes it a documentary
obligation.

**5. Putting secrets in URLs.** Tokens, keys, session identifiers. URLs end up in the logs of
every intermediary, in the browser's history, in the `Referer` header, in the monitoring
systems. It is the reason why the project uses a single-use entry token with a very short
expiry for opening the WebSocket, instead of the access token.

**6. Confusing encryption and encoding.** base64 is not encryption. URL encoding is not
encryption. A JWT is readable by anybody who possesses it.

**7. Assuming that the clocks are aligned.** Token expiries, signature windows, the ordering
of events: all of them depend on an assumption that must be guaranteed and monitored, not
taken for granted (§8.1).

**8. Ignoring the version of the specification.** «We use FHIR» says nothing: `4.0.1` says
something. «We use Bulk Data» says nothing: 3.0.0 has different parameters and a different
manifest from STU2 `[B6]`. Every reference to a standard with no version is a debt.

**9. Calling standard what is not.** `Idempotency-Key` is not a standard. The classic
`RateLimit-*` trio never was one and is also superseded. Proprietary scopes are not SMART
scopes. The `tenant` and `auth_source` claims are project proposals. Writing this down is the
difference between reliable documentation and documentation that generates unfounded
expectations.

**10. Designing for the happy case of the network.** Broadband, low latency, no loss. The real
patient is on a smartphone on a mobile network, in a corridor, with two bars of signal.
Constraint **V6** says that degrading in an understandable way - audio before video, clear
notices, resumption of the session - **is part of accessibility**, not an optimisation.

**11. Building a proprietary protocol where one exists.** It costs the design, the
documentation, the implementation on both sides, the interoperability tests and perpetual
maintenance. Now and then it is justified; almost never is it the right first hypothesis.

**12. Not reading the primary source.** Almost all the wrong statements about protocols and
standards come from summaries of summaries. The corrections collected in this module -
`Deprecation` having become an RFC, `Idempotency-Key` not being one, the form of `RateLimit`
having changed, the `backport-topic` extension not existing, `ce-datacontenttype` being
forbidden - are **all** the fruit of reading the original text `[B6]`. None of them would have
emerged from a superficial search.

---

## What you must remember

1. **Protocol, format and standard are three different things.** JSON is a format; REST is a
   style; FHIR is a standard containing a data model, two formats and a protocol. Saying which
   of the three is being used removes half the misunderstandings in integration.
2. **A protocol with no error semantics is not a usable protocol.** The behaviour in the event
   of loss, duplication, disorder and a hostile counterparty is part of the specification, not
   an implementation detail.
3. **The layers presuppose one another, they do not replace one another.** TLS protects the
   channel, it does not prove who wrote the content: for that, message signing and the hash
   chain over the audit trail are needed.
4. **The distinction between `4xx` and `5xx` decides whether a client retries.** It is the line
   of code that most often gets it wrong, and it produces either infinite loops or abandoned
   operations.
5. **Every response with a clinical datum carries `Cache-Control: no-store`.** `no-cache` is
   not equivalent: it allows storage, it only imposes revalidation.
6. **`ETag` and `If-Match` are the only defence against the lost update on a clinical
   document.** On modifiable clinical resources, an update without `If-Match` is refused with
   `428`, and the conflict is an interface case to be designed, not a technical error to be
   displayed.
7. **`Idempotency-Key` is not a standard**: the Internet-Draft is expired and archived. It must
   be adopted as a project convention and declared as such `[B6]`.
8. **The correct form of rate limiting today is `RateLimit` plus `RateLimit-Policy`**, not the
   three historical fields - which were never a standard and are also superseded. The document
   remains an active Internet-Draft, not an RFC `[B6]`.
9. **`Deprecation` has become RFC 9745, Standards Track, March 2025**, with a *Structured
   Fields* Date value; `Sunset` (RFC 8594) can never precede it `[B6]`.
10. **The errors of the application API are `Problem Details` (RFC 9457, which replaces 7807);
    those of the FHIR API are `OperationOutcome`.** They are two different contracts, with a
    mapping table between them.
11. **OAuth authorises, OIDC authenticates.** The access token is not proof of identity: the
    `id_token` is. Confusing them is the historical vulnerability of this family.
12. **PKCE with `S256` on all clients**, `plain` refused, `redirect_uri` with exact matching,
    `state` verified. There are four checks, and all four are needed.
13. **A JWT is validated by imposing the admitted algorithms, never by deducing them from the
    token**, and the header's `jku` is never followed blindly: it must be compared with the
    `jwks_uri` registered for that client.
14. **Delegation is not impersonation.** The `act` claim of RFC 8693 §4.1 records *which system
    acted on behalf of which person*: without it, the audit trail cannot answer that question.
    The project always uses delegation (D18).
15. **The level of assurance lives in `acr`, never in `act`**, and it must be distinguished
    between performed and reported. With CIE the assertion returned is **always `SpidL3`**: the
    actual level cannot be inferred from the response, so both the requested and the asserted
    one are recorded `[B7]`.
16. **SPID requires SAML 2.0**, not OIDC, and it requires its Italian variant with the
    deviations of the technical rules and of the notices. The Service Provider is the deployer,
    never the project (D36).
17. **Bare MLLP is plain text with no authentication.** Always inside TLS with mutual
    authentication, with no exceptions «for the acceptance test».
18. **Diagnostic images do not travel over the video channel**: they are retrieved over
    DICOMweb from their authoritative source, with their own authorisation and their own audit
    trail.
19. **The transactional outbox comes before the broker.** It is what eliminates lost events and
    phantom events together; the rest of the chain guarantees «at least once», and «exactly
    once» is an observable result obtained with deduplication on the receiving side.
20. **Ordering is guaranteed per subject, not globally**, and on the webhooks it is not
    guaranteed at all: every event must carry a sequence number and a self-sufficient state.
21. **Webhooks are signed with RFC 9421**, with an asymmetric key - never a shared HMAC, which
    would allow the recipient to fabricate indistinguishable notifications - and the body digest
    is `Content-Digest` of RFC 9530, which RFC 9421 does **not** define.
22. **`ce-datacontenttype` must never be emitted**: the content type of a CloudEvent in binary
    mode lives only in `Content-Type`. It is a `MUST NOT` of the specification `[B6]`.
23. **Clocks must be synchronised and monitored.** Durations are measured with a monotonic
    clock; instants are written in UTC; the order between different machines is not inferred
    from the timestamps.
24. **Every choice that depends on a network condition has a mandatory fallback**, designed
    together with the main choice: HTTP/3 → HTTP/2, direct media → relay, interactive channel →
    retrieval from the API.
25. **A specification is cited with its version and its status.** If it is a draft, if it is
    expired, if it is superseded, it must be said. It is the information missing almost
    everywhere, and it is the information that stops one building on ground that moves.

---

## Terms introduced in this module

| Term | Short definition |
|---|---|
| **Protocol** | An agreement on which messages are exchanged, in what order, how they are represented, what they mean and what happens in the event of an error. |
| **Format** (*serialisation*) | A way of representing structured data as a sequence of bytes. It says nothing about when and how communication happens. |
| **Standard** | A document published by a recognised body describing a format, a protocol or a model. |
| **De facto standard** | A widespread convention that no body has regulated. Widespread does not mean regulated. |
| **Protocol stack** | A set of superimposed protocols, each presupposing the service of the one below. |
| **Layered model** | The conceptual map of the stack; OSI with seven layers, the Internet model with four. |
| **Encapsulation** | Every layer treats the message of the one above as an opaque payload and adds its own header to it. |
| **Interface contract** | A description of the promise between two parties, verifiable by a machine. |
| **Head-of-line blocking** | A blocked element prevents the delivery of those that have already arrived behind it. |
| **RTT** (*round-trip time*) | The time out and back between two ends. |
| **Idempotency** | Executing an operation once or N times produces the same final state. |
| **Safe** (of an HTTP method) | It does not modify the server's state. |
| **At least once / at most once / exactly once** | The three delivery guarantees; the third is obtainable only as «at least once» plus deduplication. |
| **Deduplication** | Discarding on the receiving side what has already been processed, recognising it from an identifier. |
| **Bearer token** | A credential «to the holder»: anybody who possesses it can use it. |
| **Scope** | The scope of authorisation requested and granted to a token. |
| **Audience** (`aud`) | The recipient for which a token is valid; a resource server must refuse tokens not intended for it. |
| **Claim** | An assertion contained in a token. |
| **JWT / JWS / JWE / JWK** | Token; signed token; encrypted token; representation of a key. |
| **JWKS** (*JWK Set*) | A document publishing a set of public keys with their respective `kid` values. |
| **`kid`** | The identifier of the key used to sign, which makes rotation without interruption possible. |
| **Key rotation** | Replacement of a key with a period in which old and new coexist. |
| **PKCE** | The mechanism that binds the authorisation code to a secret generated by the client for that request. |
| **Introspection** | A query to the authorization server about a token's current validity. |
| **Revocation** | A declaration that a token is no longer to be honoured. |
| **Token Exchange** | The exchange of one token for another, valid in another domain (RFC 8693). |
| **Delegation versus impersonation** | In delegation the token carries both the subject and the actor (`act` claim); in impersonation the actor disappears. |
| **Trust anchor** | An issuer recognised as trusted for a tenant, with issuer, keys and admitted algorithms. |
| **`acr`** (*Authentication Context Class Reference*) | The claim declaring the context and hence the level of the authentication performed. |
| **Level of assurance** (*LoA*) | A measure of the robustness of the authentication; SPID L1/L2/L3 = ISO/IEC 29115 LoA2/LoA3/LoA4. |
| **Service Provider / Identity Provider** | Whoever provides the service; whoever authenticates the user and asserts their identity. |
| **Assertion** (SAML) | A signed XML document affirming the user's identity and attributes. |
| **Metadata** (SAML) | A document declaring the entityID, endpoints, certificates and attributes of an entity of the federation. |
| **XML Signature Wrapping** | An attack in which the signature stays valid but covers a fragment different from the one processed. |
| **mTLS** | TLS in which the client too presents a certificate: identity is proved by the channel. |
| **Forward secrecy** | The property whereby a future compromise of the private key does not allow past sessions to be decrypted. |
| **ALPN** | Negotiation, inside the TLS handshake, of the application protocol (`h2`, `http/1.1`, `h3`). |
| **SNI** | The name of the service requested, sent in the clear in the `ClientHello`. |
| **Validator** (HTTP) | `ETag` or `Last-Modified`: it allows the server to answer `304` if nothing has changed. |
| **Optimistic concurrency** | The resource is not locked: whoever saves with a superseded version is made to fail (`If-Match` → `412`). |
| **Lost update** | A modification overwritten by another without anybody noticing. |
| **Content negotiation** | Agreement on representation, language and encoding through `Accept*` and `Content-*`. |
| **`Vary`** | Declares which headers of the request determined the response; indispensable to the caches. |
| **Problem Details** | The regulated format of HTTP errors, `application/problem+json` (RFC 9457). |
| **Structured Fields** | The regulated grammar for the values of HTTP headers (RFC 9651). |
| **Transactional outbox** | The event is written in the same transaction as the datum and published by a relay: no lost or phantom events. |
| **Offset** (broker) | The consumer's position in the log; it makes rereading possible. |
| **Partition** | The broker's unit of parallelism and of ordering: ordering is guaranteed only within it. |
| **Dead-letter queue** | The destination of the messages that have exhausted their retries. |
| **Synchronised burst** (*thundering herd*) | Retries that converge on the same instant and prevent recovery; it is avoided with a random component in the backoff. |
| **CloudEvents** | The CNCF specification defining a common envelope for events and its bindings onto the protocols. |
| **Webhook** | An HTTP notification sent by the producer to a URL supplied by the consumer. |
| **HTTP Message Signatures** | The signing of selected components of an HTTP message (RFC 9421); the body digest is `Content-Digest` (RFC 9530). |
| **SSRF** (*server-side request forgery*) | Inducing a server to call a destination chosen by the attacker, typically an internal one. |
| **MLLP** | The minimal framing of HL7 v2 messages over TCP; in the clear by construction. |
| **DICOMweb** | DICOM's RESTful services: QIDO-RS, WADO-RS, STOW-RS, UPS-RS. |
| **SMART on FHIR** | A profile of OAuth 2.0 that adds clinical context, FHIR scopes and standardised discovery. |
| **Launch context** | Patient, encounter and other resources delivered to the application without asking the user for them. |
| **Bulk Data** | FHIR asynchronous bulk extraction, with kick-off, polling, manifest and ndjson files. |
| **ndjson** | One JSON document per line; readable as a stream with constant memory. |
| **SDP** | A textual format describing a multimedia session; it is carried, it does not carry. |
| **ICE / STUN / TURN** | Path selection across the NATs; discovery of one's own public address; a relay when the direct path is not possible. |
| **DTLS-SRTP** | Derivation of the SRTP keys from the DTLS handshake between the two ends. |
| **Data channel** | An SCTP message channel over DTLS inside the same WebRTC session. |
| **NTP / NTS** | Clock synchronisation; the second authenticates its source. |
| **Monotonic clock** | A time source that does not go backwards; the only correct one for measuring durations. |
| **SOUP** | *Software of unknown provenance*: a third-party component to be recorded in an inventory and monitored under IEC 62304. |

