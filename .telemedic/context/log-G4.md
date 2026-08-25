# log-G4 — Modulo 13 «I protocolli, uno per uno»

> **Agente**: G4 · **Data**: 25 agosto 2026 · **Decisione di riferimento**: D35, blocco D della
> guida dei fondamenti.
> **Deliverable unico**: `docs/10_fondamenti/13-protocolli.md`
> (frontmatter `title: I protocolli, uno per uno`, `sidebar_position: 14`, `description`).

---

## 1. Conteggio

| Metrica | Valore |
|---|---|
| Righe non vuote | **2.787** |
| Parole (stima) | **≈ 25.000** — ampiamente oltre il minimo di 9.000 richiesto dal mandato |
| Schede di protocollo | **48** voci di catalogo |
| Diagrammi Mermaid | **6** (stretta di mano TLS 1.3; concorrenza ottimistica con `If-Match`; flusso Authorization Code + PKCE; token exchange RFC 8693; kick-off e polling di FHIR Bulk Data; outbox transazionale verso il broker) |
| Diagrammi ASCII | 3 (pila di protocolli; pila del media; rotazione delle chiavi) |
| Esempi di richiesta/risposta | 21, **tutti con dati sintetici**, nessun segreto reale |
| Tabelle | 34, di cui 4 di riepilogo finale e 1 di termini introdotti |

> Il conteggio parole è una stima derivata dalle righe non vuote (nessun tool di conteggio
> disponibile all'agente in questa sessione). Il margine rispetto alla soglia è tale da rendere
> la stima non critica.

---

## 2. Struttura del modulo

| § | Contenuto |
|---|---|
| 0 | Come si legge: schema fisso a sei voci per ogni scheda, legenda dei marcatori, che cosa il modulo **non** copre (rinvii a 05, 06, 08, 12) |
| 1 | Che cos'è un protocollo: definizione minima, **protocollo / formato / standard**, pila e modelli a livelli, incapsulamento, contratto di interfaccia, serializzazione, concetti trasversali (sincrono/asincrono, stato, idempotenza, garanzie di consegna), come si legge una specifica IETF |
| 2 | Trasporto e web: IP, UDP, TCP, QUIC, TLS + mTLS, modello HTTP comune, HTTP/1.1, HTTP/2, HTTP/3, WebSocket, SSE, **criteri di scelta polling / SSE / WebSocket** |
| 3 | Interfacce applicative: REST, OpenAPI 3.1, codici di stato, negoziazione del contenuto, cache e validatori, `ETag` e concorrenza ottimistica, `Idempotency-Key`, `RateLimit`, `Deprecation`/`Sunset`, `Problem Details` |
| 4 | Identità e autorizzazione: OAuth 2.0, PKCE, OIDC, JWT/JWS e i tranelli, JWKS e rotazione, introspezione e revoca, Token Exchange e delega, SAML 2.0, livelli di garanzia e propagazione |
| 5 | Integrazione sanitaria: FHIR REST, Bulk Data, MLLP su TLS, DICOMweb, SMART App Launch e Backend Services |
| 6 | Eventi: protocollo del broker + outbox, CloudEvents, webhook e firma, consegna/ritentativi/ordine |
| 7 | Tempo reale: **scheda sintetica** ICE/STUN/TURN/DTLS/SRTP/RTP/RTCP/SCTP/SDP, con rinvio esplicito al modulo 08 |
| 8 | Trasversali: NTP/NTS, DNS, formati (JSON, XML, ndjson, Protocol Buffers) con tabella di scelta |
| 9 | **Tabella riassuntiva** in 4 blocchi: protocollo → problema → dove nel progetto → specifica → stato |
| 10 | **Come si sceglie un protocollo**: 8 criteri nell'ordine di applicazione |
| 11 | **Errori tipici** per chi non ha mai lavorato con protocolli: 12 voci |
| — | «Cosa devi ricordare» (25 punti) e «Termini introdotti in questo modulo» (66 voci) |

---

## 3. Vincoli del mandato — verifica di adempimento

| Vincolo | Esito |
|---|---|
| Un solo file, frontmatter YAML con `title`, `sidebar_position: 14`, `description` | Rispettato |
| ≥ 9.000 parole | Rispettato con ampio margine (≈ 25.000) |
| Schema uniforme per ogni voce (problema / meccanismo / nel progetto / specifica / errori / alternative) | Rispettato; le alternative scartate compaiono dove esistono davvero, non forzate |
| Sezione introduttiva da zero (protocollo, pila, modello a livelli, serializzazione, contratto di interfaccia, differenza protocollo/formato/standard) | §1, con tabella di confronto a tre colonne e tre corollari espliciti |
| Rinvio al modulo 08 per il tempo reale, senza duplicarne la trattazione | §7 è una scheda tabellare di 8 righe + 3 punti; il modulo 08 **non** è stato letto oltre l'indice, per non duplicarne il contenuto |
| Rinvio al modulo 05 per HL7 v2, CDA2, IHE, DICOM, terminologie | §0.3 e rinvii puntuali in §5.3, §5.4, §5.5; MLLP e DICOMweb trattati **solo come protocolli** |
| Nessun tocco a `08-webrtc-da-zero.md` e `11-fondamenti-informatici.md` | Rispettato: nessuna scrittura fuori dai due file assegnati |
| Regola R0 | Rispettata. Nessuna azienda, marchio, prodotto commerciale o dominio di partner. Nominati solo progetti open source dichiarati nel brief (Apache Kafka, Keycloak, PostgreSQL, coturn, TimescaleDB) e standard. I domini negli esempi sono `telemedic.esempio.it`, `integratore.example`, `gestionale.integratore.example` |
| Ogni protocollo con RFC o specifica, numero e sezione | Rispettato; sezioni citate solo dove l'agente ne è certo, altrimenti si cita il solo documento |
| Stato dichiarato dove la specifica è scaduta / in bozza / superata | 7 casi trattati esplicitamente, vedi §5 di questo log |
| Diagrammi Mermaid dove aiutano | 6, sui quattro casi richiesti dal mandato (TLS, PKCE, token exchange, webhook/consegna → reso come outbox + ritentativi) più 2 utili |
| Esempi realistici, soli dati sintetici | Rispettato; nessuna chiave, nessun token reale, firme e chiavi troncate |
| `[NV]` su ciò che non è verificato | 9 marcature, elencate al §6 |
| Chiusura con «Cosa devi ricordare» e «Termini introdotti» | Rispettato |

---

## 4. Fonti del progetto recepite

| Fonte | Che cosa è stato preso |
|---|---|
| `00_PROJECT_BRIEF.md` | D4, D12, D13, D15, D18, D19, D22, D23, D24, D27, D30, D34, D36, D37, D38, D40, D42, D45; vincoli V1–V6; profilo dell'integratore §6.1–6.2; regola R0 |
| `R5-pattern-integrazione.md` | SMART App Launch e Backend Services (scope v1/v2, `aud`, PKCE `S256`, `.well-known/smart-configuration`, JWT di autenticazione, `jku`/JWKS, due ruoli SMART, tabella «quando NON usarlo»); RFC 9700 e la postura di default; Token Exchange RFC 8693 con trust anchor per tenant e claim `act`; stato di Keycloak 26.2 / 26.5; durate dei token |
| `B6-verifica-fhir.md` — **prevale** | `Deprecation` = **RFC 9745**, Standards Track, marzo 2025, valore Date di RFC 9651 §3.3.7; `Idempotency-Key` = **draft scaduto e archiviato** (-07, 2025-10-15), non RFC; `RateLimit-*` = draft attivo -11 (2026-05-23), **forma a tre header superata**, oggi `RateLimit` + `RateLimit-Policy` con `q/w/qu/pk` e `r/t/pk`; CloudEvents binding HTTP 1.0.2 con il `MUST NOT` su `ce-datacontenttype`; Bulk Data **3.0.0** con `_until`/`organizeOutputBy`/`allowPartialManifests` e l'avvertenza sul continuous build; Subscriptions Backport 1.1.0 con l'inesistenza di `backport-topic` e l'assenza di `SubscriptionStatus` in R4; SMART Web Messaging 1.0.0 STU1 come materiale a maturità inferiore; raccomandazione SDK TypeScript a superficie SOUP minima |
| `B7-identita-digitale-italiana.md` | SPID in SAML2 e non in OIDC; deviazioni del profilo italiano (`NameQualifier` sull'`Issuer`, `AllowCreate` da non emettere, `SessionIndex` per SpidL1 e non per L2/L3 con la conseguenza «niente SSO federato in L2»); codici `ErrorCode nrNN` e la loro natura non-di-errore; livelli `SpidL1|L2|L3` = ISO/IEC 29115 LoA2/3/4; **CIE: l'asserzione di ritorno è sempre `SpidL3`** e il livello va imposto in richiesta; `acr_requested` vs `acr_asserted`; il livello **non** viaggia in `act`; `acr` autoritativo vs riferito con `auth_source`/`verified_by_telemedic`; due istanze di IdP per livello; costo 0,4 € → 3,5 € per attributo extra; XSW1–XSW8 in `spid_sp_test` |
| `docs/10_fondamenti/05-standard-di-interoperabilita.md` | MLLP e il suo incorniciamento, il divieto di MLLP nudo, il divieto di immagini diagnostiche sul canale video, la disciplina delle versioni e degli stati di maturità. **Rinviato, non ripetuto** |
| `docs/10_fondamenti/00-come-usare-questa-guida.md` | Convenzioni redazionali, elenco dei moduli e collegamenti relativi |

---

## 5. Correzioni di informazione diffusa messe per iscritto nel modulo

Sono il valore aggiunto specifico di questo modulo: informazioni che altrove mancano o sono
sbagliate.

1. **`Deprecation` è una RFC** (9745, Standards Track, marzo 2025), non un Internet-Draft.
2. **`Idempotency-Key` non è uno standard**: bozza IETF **scaduta e archiviata**.
3. **`RateLimit-Limit`/`Remaining`/`Reset` non sono mai stati standard e sono superati**: la
   forma corrente ha due soli campi.
4. **`Problem Details` è RFC 9457**, che sostituisce RFC 7807.
5. **TCP si cita con RFC 9293**, non RFC 793; **HTTP/1.1 con RFC 9112**, non 2616 né 7230.
6. **RFC 9421 non definisce `Content-Digest`**: lo definisce RFC 9530. Punto verificato sulla
   fonte primaria durante la stesura.
7. **`ce-datacontenttype` è vietato** dal binding HTTP di CloudEvents (`MUST NOT`).
8. **Bulk Data: la versione normativa è la 3.0.0**, e il *continuous build* diverge
   strutturalmente — non è materiale su cui implementare.
9. **In R4 non esiste `SubscriptionStatus`** né l'estensione `backport-topic`.
10. **SPID non è utilizzabile in OIDC in produzione**; **con CIE l'`AuthnContextClassRef` di
    ritorno è sempre `SpidL3`**.
11. **SSE non è una RFC**: è nello HTML Living Standard del WHATWG, senza numero di versione.
12. **OpenAPI non è una RFC**; il protocollo del broker adottato è la specifica di
    un'implementazione, non di un ente di normazione.

---

## 6. Punti marcati `[NV]`

| # | Punto | Sezione | Che cosa va verificato, e da chi |
|---|---|---|---|
| NV-1 | Abbandono in pratica del *server push* di HTTP/2 da parte dei browser | §2.8 | Verifica su fonte primaria (note di rilascio dei motori) prima di riportarlo in documentazione pubblica. Non ha impatti implementativi: il progetto non lo usa |
| NV-2 | Supporto reale di **RFC 8441** (WebSocket su HTTP/2) negli intermediari | §2.10, §9.1 | Da verificare empiricamente sul gateway adottato. Impatto: se non supportato, ogni WebSocket consuma una connessione TCP dedicata |
| NV-3 | Necessità del **Device Authorization Grant (RFC 8628)** nel perimetro v1.0 | §4.1 | Ereditato da R5. Decisione di perimetro: serve solo se compaiono totem o dispositivi senza browser. **Da chiudere con l'agente di roadmap** |
| NV-4 | Profilo dell'access token in forma JWT e valore `typ: at+jwt` | §4.4 | Numero di RFC non citato perché non verificato. Da confermare prima di scriverlo nel contratto |
| NV-5 | **DPoP (RFC 9449)** e **token vincolati a mTLS (RFC 8705)** come irrobustimenti per tenant e non requisiti v1.0 | §4.4, §9.3 | I numeri di RFC sono citati; **è la scelta di perimetro** a essere non verificata. Da confermare con l'agente di sicurezza |
| NV-6 | Porta 6660 per MLLP **non** registrata | §5.3 | Ereditato da `05-standard-di-interoperabilita.md`. Nessuna azione: la porta si concorda comunque fra le parti |
| NV-7 | Necessità di una **marca temporale qualificata** per l'audit conservato a lungo termine | §8.1 | Decisione aperta, con impatto su D42 (catena di hash e conservazione separata). **Da chiudere con l'agente di compliance** |
| NV-8 | Adozione di **Protocol Buffers** per il traffico interno ad alto volume (metriche verso TimescaleDB) | §8.3 | Valutazione aperta. Il modulo dichiara che **non** è usato nelle interfacce pubbliche, il che è una decisione ferma |
| NV-9 | Versioni di **OpenAPI successive alla 3.1** e supporto degli strumenti | §3.2 | Da verificare prima di adottarne una: storicamente gli strumenti arrivano con forte ritardo |

**Verificato durante la stesura** (non `[NV]`): RFC 9421 — titolo *HTTP Message Signatures*,
Standards Track, febbraio 2024 — e il fatto che **non** definisca `Content-Digest`, definito
invece da RFC 9530. Fonte: `rfc-editor.org/rfc/rfc9421.html`.

---

## 7. Questioni per gli altri agenti

### Per l'agente che scrive il modulo 08 (WebRTC)

- Il §7 di questo modulo è **volutamente una scheda di orientamento** e rinvia al modulo 08 per
  NAT, segnalazione, candidati, stretta di mano DTLS, SAS, codec, congestione e metriche.
  Se il modulo 08 cambia titolo alle sezioni, i rinvii `[08 §2.3]`, `[08 §4]`, `[08 §5.9]`,
  `[08 §2.2]` vanno riallineati.
- **Punto di confine da non duplicare**: la WebSocket di segnalazione è trattata **qui** come
  protocollo (§2.10), con i suoi quattro errori tipici; il modulo 08 dovrebbe rinviare qui per
  il trasporto e concentrarsi sul contenuto SDP e sulla macchina a stati.

### Per l'agente che scrive il modulo 11 (Fondamenti informatici)

- Questo modulo rinvia a 11 per **l'ordine degli eventi in un sistema distribuito** (§8.1) e
  usa senza definirli i concetti di transazione, atomicità e proiezione. Se 11 tratta gli
  orologi logici (Lamport, vettoriali), il rinvio da §8.1 va reso puntuale.
- **Sovrapposizione da coordinare**: idempotenza e garanzie di consegna sono introdotte qui in
  §1.6 in forma operativa. Se 11 le tratta in forma teorica, conviene che 11 rinvii qui per
  l'applicazione ai protocolli, e non viceversa.

### Per l'agente che scrive il modulo 12 (Crittografia e sicurezza)

- Questo modulo **dà per acquisita** la teoria: firma digitale, PKI, funzioni di hash, cifratura
  simmetrica e asimmetrica. Tratta invece **come i protocolli le usano**: stretta di mano TLS,
  JWS, JWKS e rotazione, firma dei messaggi HTTP, DTLS-SRTP.
- **Da coordinare**: revoca dei certificati (OCSP/CRL) è nominata qui in §2.5 come errore
  tipico; la trattazione sostanziale — incluso *che cosa fare quando il servizio di revoca non
  risponde* — conviene stia in 12.
- **Da coordinare**: la catena di hash dell'audit (D42) è nominata due volte qui come «ciò che
  TLS non dà»; la trattazione sta in 12.

### Per l'agente che scrive il modulo 14 (Flussi funzionali)

- Le regole di §2.12 (polling / SSE / WebSocket), §6.4 (consegna, ritentativi, ordine) e §3.7
  (`Idempotency-Key`) sono **presupposte** dai flussi. 14 dovrebbe rinviare qui invece di
  riesporle.
- Il caso di interfaccia del **`412` sul conflitto di aggiornamento** (§3.6) è un flusso
  utente a tutti gli effetti e va progettato in 14 con i vincoli di V6.

### Per l'agente di architettura / ADR

Il modulo enuncia come *proposte di progetto* alcune scelte che **meritano un ADR formale**,
perché sono citate come contratto verso gli integratori:

1. **Versione maggiore nel percorso** (`/v1/…`) invece che in un'intestazione.
2. **`428 Precondition Required`** su ogni modifica di risorsa clinica senza `If-Match`.
3. **`404` invece di `403`** fuori dal perimetro autorizzativo, con l'eccezione dichiarata.
4. **Ritenzione di 24 ore** delle chiavi di idempotenza e comportamento su riuso improprio.
5. **Doppia emissione** degli header di limitazione del traffico (forma corrente + legacy).
6. **Dodici mesi** di preavviso fra `Deprecation` e `Sunset`.
7. **Payload magro nei webhook** (riferimenti, non contenuto clinico) e finestra di firma di
   cinque minuti.
8. **Politica di ritentativo** dei webhook e coda di scarto con recupero via API.
9. **`type` degli eventi versionato** nella forma `it.telemedic.<dominio>.<fatto>.v<N>`.
10. **Introspezione obbligatoria** sulle operazioni ad alto impatto (esportazione massiva,
    amministrazione del tenant, attivazione della registrazione).

### Per l'agente di sicurezza

- §4.4 elenca sette tranelli di validazione JWT e §6.3 quattro errori sulla firma dei webhook:
  sono **casi di test** da tradurre in una suite di abuso, non solo raccomandazioni.
- Il controllo di **SSRF sugli URL forniti dagli integratori** compare in tre punti (§4.4
  `jku`, §6.3 destinazione del webhook, §8.2 risoluzione DNS). Va implementato **una volta
  sola**, in un componente condiviso, con il controllo eseguito sull'indirizzo effettivamente
  usato per la connessione.

### Per l'agente di compliance

- Il modulo dichiara che **ogni protocollo implementato con libreria di terze parti è SOUP**
  ai sensi di IEC 62304 (§10, criterio 7) e che la SBOM va generata dalla prima pipeline
  (D45). L'elenco dei protocolli del §9 è di fatto un **inventario di partenza** per il censimento
  SOUP: 48 voci, di cui circa 20 richiedono una libreria.
- NV-7 (marca temporale qualificata) è una questione aperta con impatto su D42.

---

## 8. Termini per il glossario (modulo 19)

66 voci, tutte già definite nella tabella «Termini introdotti in questo modulo». Elenco per
l'agente del glossario, raggruppato per famiglia. **Nessuna collide con i termini già introdotti
dal modulo 05**, che sono stati verificati per evitare doppioni.

**Fondamenti** — protocollo · formato (serializzazione) · standard · standard di fatto · pila di
protocolli · modello a livelli · incapsulamento · contratto di interfaccia.

**Trasporto e web** — blocco in testa alla coda (*head-of-line blocking*) · RTT · ALPN · SNI ·
forward secrecy · mTLS · validatore (HTTP) · negoziazione del contenuto · `Vary` ·
Structured Fields.

**Semantica applicativa** — idempotenza · sicura (*safe*) · almeno una volta / a-lo-più-una-volta
/ esattamente una volta · deduplicazione · concorrenza ottimistica · aggiornamento perduto
(*lost update*) · Problem Details.

**Identità e autorizzazione** — bearer token · scope · audience · claim · JWT · JWS · JWE · JWK ·
JWKS · `kid` · rotazione delle chiavi · PKCE · introspezione · revoca · Token Exchange ·
delega contro impersonificazione · trust anchor · `acr` · livello di garanzia (LoA) ·
Service Provider · Identity Provider · asserzione (SAML) · metadata (SAML) ·
XML Signature Wrapping.

**Eventi** — outbox transazionale · offset · partizione · coda di scarto (*dead letter*) ·
ondata sincronizzata (*thundering herd*) · CloudEvents · webhook · HTTP Message Signatures.

**Sanitario** — MLLP · DICOMweb · SMART on FHIR · contesto di lancio · Bulk Data · ndjson.

**Tempo reale** — SDP · ICE · STUN · TURN · DTLS-SRTP · canale dati.

**Trasversali** — NTP · NTS · orologio monotono · SSRF · SOUP.

### Nota per il glossario bilingue

I termini che nel modulo compaiono **tradotti in italiano con l'originale fra parentesi**
richiedono entrambe le forme nel glossario bilingue: blocco in testa alla coda /
*head-of-line blocking*; aggiornamento perduto / *lost update*; coda di scarto / *dead letter*;
ondata sincronizzata / *thundering herd*; formato / *serialization*; pila / *stack*.

---

## 9. File toccati

| File | Azione |
|---|---|
| `docs/10_fondamenti/13-protocolli.md` | **Creato** |
| `.telemedic/context/log-G4.md` | **Creato** (questo file) |

Nessun altro file è stato modificato. In particolare **non** sono stati toccati
`docs/10_fondamenti/08-webrtc-da-zero.md` né `docs/10_fondamenti/11-fondamenti-informatici.md`,
come da mandato.
