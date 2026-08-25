# Verifica di fonte primaria — Appendice B della ricerca R4 (agente B3)

**Data della verifica**: 25 agosto 2026. Ogni voce riporta l'esito, il dato accertato e la fonte. Le fonti sono classificate come **[UPSTREAM]** (repository o documentazione del progetto stesso), **[NORMATIVA]** (IETF/W3C), **[VENDOR]** (bug tracker o blog del produttore del browser), **[DB VULN]** (NVD / GitHub Security Advisories). Nessun numero di CVE, nome di direttiva, flag o valore di API compare in questo documento senza essere stato letto su una di queste fonti.

---

## 1. coturn — verifica su fonte primaria

### 1.1 Versione corrente e cronologia delle release

**Esito: CONFERMATA (con correzione di merito).**

Versione corrente al 25 agosto 2026: **4.17.2**, pubblicata l'**8 agosto 2026**.

Cronologia completa delle release non-Docker ricavata dall'API GitHub del repository upstream:

| Versione | Data di pubblicazione |
|---|---|
| **4.17.2** | 2026-08-08 |
| 4.17.1 | 2026-08-07 |
| 4.17.0 | 2026-08-05 |
| 4.16.0 | 2026-07-31 |
| 4.15.0 | 2026-07-22 |
| 4.14.0 | 2026-06-21 |
| 4.13.1 | 2026-06-15 |
| 4.13.0 | 2026-06-13 |
| 4.12.0 | 2026-05-26 |
| 4.11.0 | 2026-05-08 |
| 4.10.0 | 2026-04-14 |
| 4.9.0 | 2026-02-24 |
| 4.8.0 | 2026-01-06 |
| 4.7.0 | 2025-05-30 |

L'affermazione di R4 «la versione 4.7.0 è di maggio 2025» è **esatta** (30 maggio 2025). L'affermazione «il progetto ha successivamente accelerato la cadenza di rilascio con una serie di minor release nel 2026» è **ampiamente confermata**: **quattordici** release in poco più di sette mesi, di cui **cinque nel solo mese di agosto 2026**.

Fonte [UPSTREAM]: `https://api.github.com/repos/coturn/coturn/releases`

#### Tre cambi di default introdotti in 4.17.0 che impattano direttamente la configurazione di R4

Testo verbatim dalle note di rilascio 4.17.0 [UPSTREAM]:

1. **I listener DTLS sono ora opt-in** (PR #2026): *"The server no longer starts DTLS listeners unless `--dtls` is given."* Le grafie deprecate `--no-dtls` / `--no-dtls=false` restano funzionanti con warning.
2. **Il nonce stateless è attivo per default** (PR #2036): i nonce di challenge sono cookie temporali autenticati anziché valori casuali per sessione. Due conseguenze dichiarate: il `NONCE` passa da 16 a 24 caratteri; **la chiave di firma è generata per processo**, quindi ogni riavvio e ogni richiesta che atterra su un'istanza diversa dietro load balancer costa al client un round-trip di ri-autenticazione `438`. Rimedio documentato: impostare `--stateless-nonce-secret` in modo coerente su tutti i nodi.
3. **Il formato di log di default è cambiato**: timestamp ISO-8601 con precisione al millisecondo, niente thread id, delimitatore spazio singolo, un record per riga. `--new-log-timestamp=false` ripristina il vecchio contatore.

Fonte [UPSTREAM]: `https://api.github.com/repos/coturn/coturn/releases/tags/4.17.0`

> **Implicazione operativa per Telemedic**: i punti 2 e 3 sono requisiti di deployment, non dettagli. Il punto 2 rende obbligatorio `stateless-nonce-secret` condiviso nell'architettura a N nodi indipendenti raccomandata da R4 §4.6. Il punto 3 invalida qualunque parser di log scritto contro versioni precedenti.

---

### 1.2 CVE reali a carico di coturn

**Esito: CONFERMATA e ampiamente estesa.** R4 aveva ragione a non citare numeri: le fonti secondarie erano vaghe. I numeri esistono, sono verificabili su NVD, e sono **molti più** di quanti R4 sospettasse.

#### 1.2.1 CVE-2020-26262 — verificata

**Esito: CONFERMATA.**

Descrizione NVD: *"Coturn before version 4.5.2 had a loopback address bypass vulnerability. Sending a CONNECT request with the XOR-PEER-ADDRESS value of 0.0.0.0 would receive a successful response, allowing packet relay to loopback interfaces."* I sistemi IPv6 erano parimenti vulnerabili tramite `[::1]` o `[::]`.

- CVSS v3.1: **7.2 HIGH** — `AV:N/AC:L/PR:N/UI:N/S:C/C:L/I:L/A:N`
- Versioni affette: **tutte < 4.5.2**; corretta in **4.5.2**
- Advisory: GHSA-6g6j-r9rf-cm7p

Fonte [DB VULN]: `https://nvd.nist.gov/vuln/detail/CVE-2020-26262`

> Correzione di dettaglio a R4: R4 scrive «affette le versioni fino a 4.5.1.3». NVD dice «prior to 4.5.2» senza limite inferiore. Usare la formulazione NVD.

#### 1.2.2 Elenco completo delle CVE coturn su NVD

Fonte [DB VULN]: NVD API v2.0, `keywordSearch=coturn`.

| CVE | Pubblicata | Sintesi | CVSS v3.1 | Corretta in |
|---|---|---|---|---|
| CVE-2018-4056 | 2019-02-05 | SQL injection nel portale di amministrazione, bypass di autenticazione | 9.8 CRITICAL | 4.5.0.9 |
| **CVE-2018-4058** | 2019-03-21 | *"unsafe default configuration… By default, the TURN server allows relaying external traffic to the loopback interface of its own host."* | 7.7 HIGH | 4.5.0.9 |
| CVE-2018-4059 | 2019-03-21 | Portale telnet di amministrazione non autenticato su loopback | 9.8 CRITICAL | 4.5.0.9 |
| CVE-2020-6061 | 2020-02-19 | Heap OOB read nel parsing di richieste POST | 9.8 CRITICAL | > 4.5.1.1 |
| CVE-2020-6062 | 2020-02-19 | DoS via POST malformata | 7.5 HIGH | > 4.5.1.1 |
| CVE-2020-4067 | 2020-06-29 | Buffer STUN/TURN non inizializzato, information leak | 7.5 HIGH | 4.5.1.3 |
| **CVE-2020-26262** | 2021-01-13 | Bypass loopback via peer `0.0.0.0` | 7.2 HIGH | 4.5.2 |
| CVE-2025-69217 | 2025-12-30 | Generazione di numeri casuali debole per nonce e porte | 7.7 HIGH | > 4.7.0-r4 |
| **CVE-2026-27624** | 2026-02-25 | Bypass di `denied-peer-ip` via IPv4-mapped IPv6 | 6.5 MED (NVD) / 7.2 HIGH (CNA) | **4.9.0** |
| CVE-2026-40613 | 2026-04-21 | Letture disallineate: crash su ARM64 | 7.5 HIGH | 4.10.0 |
| **CVE-2026-43994** | 2026-06-18 | **Stack buffer overflow nella decodifica del token OAuth** | **9.8 CRITICAL** | 4.10.0 |
| CVE-2026-43915 | 2026-06-18 | Stored XSS nell'interfaccia web-admin | 5.4 MED | 4.11.0 |
| CVE-2026-53448 | 2026-07-10 | SQL injection nelle operazioni di cancellazione del pannello admin | 7.2 HIGH | 4.12.0 |
| CVE-2026-53449 | 2026-07-10 | Sovrascrittura arbitraria di file via comando di session dump | 6.0 MED | 4.13.0 |
| **CVE-2026-53450** | 2026-07-10 | Bypass della guardia loopback di default via `::ffff:127.0.0.1` | 7.4 HIGH | **4.13.0** |
| **CVE-2026-73212** | 2026-08-11 | Bypass ACL peer-IP per canonicalizzazione IPv6 sul path CONNECT RFC 6062 | 5.8 MED | **4.13.1** |
| CVE-2026-68553 | 2026-08-19 | Format string injection via `USERNAME`/`REALM` verso hiredis | 7.1 HIGH | 4.13.0 (GHSA: 4.15.0) |
| CVE-2026-62959 | 2026-07-31 | Divulgazione di memoria heap pre-autenticazione via redirect ACME | 8.2 HIGH | 4.15.0 |
| CVE-2026-65981 | 2026-07-31 | Bypass di autorizzazione `MOBILITY-TICKET`, takeover di allocazione | 7.1 HIGH | 4.15.0 |
| CVE-2026-68552 | 2026-08-19 | Troncamento `uint16_t` della lunghezza STUN, desincronizzazione stream TCP/TLS | 5.3 MED | 4.15.0 |
| CVE-2026-68554 | 2026-08-19 | Attributi dopo `MESSAGE-INTEGRITY` processati: manomissione on-path | 2.3 LOW | 4.15.0 |
| **CVE-2026-73213** | 2026-08-11 | Confronto IPv6 component-wise: bypass di range `denied-peer-ip` non prefix-aligned | 5.8 MED | **4.16.0** |
| CVE-2026-73214 | 2026-08-11 | Esaurimento di stato DTLS via ClientHello frammentato pre-cookie | 8.2 HIGH | 4.16.0 |
| CVE-2026-68555 | 2026-08-21 | Ritenzione illimitata di sessione via resume di mobility concatenati | 6.5 MED | 4.16.0 |
| CVE-2026-73215 | 2026-08-11 | `EVEN-PORT` esaurisce il pool di porte relay | 7.1 HIGH | 4.17.0 |
| CVE-2026-73216 | 2026-08-11 | Bypass della quota allocazioni via disconnessione mobility | 6.5 MED | 4.17.0 |

Advisory senza CVE assegnata [DB VULN]: **GHSA-67c2-q5xv-f85p** — *"Authenticated client grows multiplex-peer demux table without bounds"*, ≤ 4.15.0, corretta in 4.16.0.

Fonte [DB VULN]: `https://api.github.com/repos/coturn/coturn/security-advisories`, `https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=coturn`

#### 1.2.3 La famiglia SSRF-di-trasporto: sei CVE, non una

Questo è il risultato più importante della verifica. Il pattern che R4 §4.5 descriveva come «rischio più grave e più sottovalutato» ha **sei CVE distinte in otto anni**, di cui **quattro nei soli ultimi otto mesi**:

| CVE | Meccanismo | Corretta in |
|---|---|---|
| CVE-2018-4058 | Default non sicuro: relay verso loopback consentito di default | 4.5.0.9 |
| CVE-2020-26262 | `XOR-PEER-ADDRESS = 0.0.0.0` / `[::]` / `[::1]` | 4.5.2 |
| CVE-2026-27624 | `::ffff:<ipv4>` bypassa **le regole `denied-peer-ip` esplicite** (tre funzioni in `src/client/ns_turn_ioaddr.c` non gestiscono `IN6_IS_ADDR_V4MAPPED`) | 4.9.0 |
| CVE-2026-53450 | `::ffff:127.0.0.1` bypassa **la guardia loopback di default** (distinta dalla precedente) | 4.13.0 |
| CVE-2026-73212 | Forme IPv6 alternative instradabili verso IPv4 (6to4, NAT64, IPv4-compatible) non normalizzate in `good_peer_addr()`, sul path CONNECT di RFC 6062 | 4.13.1 |
| CVE-2026-73213 | `addr_less_eq()` confronta gli indirizzi IPv6 byte per byte anziché numericamente: un range `denied-peer-ip` **non allineato a un prefisso** viene aggirato | 4.16.0 |

Testo verbatim da CVE-2026-53450 [DB VULN]: *"Prior to 4.13.0, coturn rejects loopback peers by default unless allow-loopback-peers is enabled, but the default loopback guard can be bypassed by using the IPv4-mapped IPv6 peer address ::ffff:127.0.0.1 in a TURN XOR-PEER-ADDRESS attribute."* CWE-918 (SSRF).

Testo verbatim dal workaround di CVE-2026-27624 [DB VULN/GHSA-j8mm-mpf8-gvjg]: la mitigazione ufficiale è esattamente `denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255`.

Testo verbatim dalla mitigazione di CVE-2026-73213 [DB VULN/GHSA-4v97-rxjj-4f99]: *"avoid arbitrary IPv6 min-max boundaries. Instead, rely on exact address specifications or prefix-aligned ranges, and enforce relay egress restrictions through external mechanisms."*

Fonti [DB VULN]:
- `https://github.com/coturn/coturn/security/advisories/GHSA-j8mm-mpf8-gvjg`
- `https://github.com/coturn/coturn/security/advisories/GHSA-4v97-rxjj-4f99`
- `https://github.com/coturn/coturn/security/advisories/GHSA-2x4g-wx24-48m4`
- `https://nvd.nist.gov/vuln/detail/CVE-2026-53450`
- `https://nvd.nist.gov/vuln/detail/CVE-2018-4058`

> **Conclusione da portare in documentazione**: la tesi di R4 §4.5 non solo regge, ma va **rafforzata**. La difesa `denied-peer-ip` è stata aggirata **quattro volte in otto mesi** da bug di canonicalizzazione e di confronto. L'unica difesa che ha retto a tutte e sei è l'**isolamento di rete in uscita** (punto 2 della difesa a strati di R4). Va scritto esplicitamente: *`denied-peer-ip` è una difesa in profondità, non la difesa primaria.*
>
> **Versione minima non negoziabile per Telemedic: 4.17.2.** Una 4.16.0 è ancora esposta a CVE-2026-73215 e CVE-2026-73216; una 4.13.1 a CVE-2026-73213; una 4.9.0 a CVE-2026-43994 (CRITICAL 9.8).

---

### 1.3 Esistenza e semantica delle direttive contestate

Metodo: incrocio fra tre fonti upstream — la man page `man/man1/turnserver.1`, la tabella `long_options[]` in `src/apps/relay/mainrelay.c` (che è ciò che il binario accetta davvero) e `examples/etc/turnserver.conf`. Dove le tre divergono, prevale `mainrelay.c`.

| Direttiva del mandato R4 | Esito | Accertamento |
|---|---|---|
| `no-rfc5780` | **CONFERMATA, deprecata** | Presente in `mainrelay.c` (`NO_RFC5780`) e in man page: *"DEPRECATED and now the default behaviour. See --rfc5780."* Il default è stato invertito in 4.7.0 (*"Invert RFC5780 option to default off (#1688)"*). **Non va scritta**: non serve più. |
| `no-stun-backward-compatibility` | **SMENTITA — RIMOSSA** | **Assente** sia dalla man page sia da `mainrelay.c`. Introdotta in 4.6.0, invertita a default-on in 4.7.0 (*"Invert no-stun-backward-compatibility to be default on (#1689)"*), poi rimossa. Il sostituto è l'opzione **positiva** `--stun-backward-compatibility`: *"Add the deprecated MAPPED-ADDRESS attribute to STUN Binding responses, in addition to the XOR-MAPPED-ADDRESS attribute that is always sent."* Non impostarla è già il comportamento sicuro. |
| `response-origin-only-with-rfc5780` | **CONFERMATA, deprecata** | Presente in `mainrelay.c`; **assente** dalla man page. Deprecata in 4.7.0. Non va scritta. |
| `no-tlsv1` | **SMENTITA — RIMOSSA** | Assente da man page e `mainrelay.c`. Introdotta in 3.2.1.1 (2014), rimossa. |
| `no-tlsv1_1` | **SMENTITA — RIMOSSA** | Idem. |
| `no-tlsv1_2` | **ESISTE, con semantica diversa da quella attesa** | Presente in `mainrelay.c` e man page: *"Set TLSv1.3/DTLSv1.2 as a minimum supported protocol version."* Non è «disabilita TLS 1.2»: è «alza il minimo a TLS 1.3 (per TLS) e a DTLS 1.2 (per DTLS)». |
| `dh2066` | **SMENTITA — NON ESISTE** | Assente da man page e `mainrelay.c`. Esistono solo `dh566` e `dh1066`, entrambe **abbassano** la dimensione: *"Use 1066 bits predefined DH TLS key. **Default size of the key is 2066.**"* 2066 bit è già il default: la direttiva non serve e non esiste. |
| `no-cli` | **CONFERMATA** | Presente. *"Turn OFF the CLI support. Since the CLI is OFF by default, this flag is only useful to override a 'cli' setting from the configuration file."* |
| `no-udp` | **CONFERMATA** | *"Do not start UDP client listeners."* (Da **non** usare in WebRTC.) |
| `no-software-attribute` | **CONFERMATA, deprecata** | Presente in `mainrelay.c` come `DEPRECATED_NO_SOFTWARE_ATTRIBUTE_OPT`; man page: *"DEPRECATED. See '--software-attribute'."* L'opzione viva è `--software-attribute`: *"Send SOFTWARE_ATTRIBUTE on messages that can have it. **Disabled by default.** Equals to deprecated option `--no-software-attribute false`."* **Il non-disclosure della versione è già il default**: non scrivere nulla. |
| `unauthorized-ratelimit` | **CONFERMATA** | *"Enable per-source rate limiting of UDP 401 Unauthorized responses. This mitigates reflection and amplification attacks that spoof a victim's source address to receive authentication challenges."* Accompagnata da `--unauthorized-ratelimit-rps` (*"Maximum number of UDP 401 Unauthorized responses sent per source IP per second. Default is 10."*). **Da attivare.** |
| `keep-address-family` | **CONFERMATA, deprecata** | Presente in `mainrelay.c` (opzione corta `'K'`); man page: *"Deprecated and will be removed in favor of --allocation-default-address-family!!"* Sostituta: `--allocation-default-address-family` (*"Default is IPv4."*). |
| `no-loopback-peers` | **SMENTITA — NON ESISTE** | Assente. R4 aveva ragione: esiste solo il flag **permissivo** `allow-loopback-peers` — *"Allow peers on the loopback addresses (127.x.x.x and ::1). **Allow it only for testing in a development environment!**"* Il diniego dei peer loopback è il **default** dal 4.5.0.9 (confermato indipendentemente dal testo di CVE-2026-53450). |

Direttive rilevanti scoperte in questa verifica e **non presenti** nella configurazione di R4:

| Direttiva | Testo upstream |
|---|---|
| `dtls` | Presente in `mainrelay.c` (`DTLS_OPT`) e in `examples/etc/turnserver.conf` come `#dtls`; **non ancora documentata nella man page** (lag della documentazione). Dal 4.17.0 è **obbligatoria** per avviare i listener DTLS. |
| `stateless-nonce` | *"Issue 401/438 challenge nonces as authenticated timestamp cookies (issue time plus an HMAC over the client address, keyed by a per-process secret) instead of storing a random nonce in per-client session state."* Default **on** dal 4.17.0. |
| `stateless-nonce-secret` | *"Derive the stateless-nonce signing key from this secret instead of a random per-process key (implies --stateless-nonce). Servers sharing the secret validate each other's nonces."* |
| `rfc3489-compatibility` | *"Enable handling of obsolete RFC 3489 ('classic' STUN) Binding requests, which carry no magic cookie."* Off di default. Non attivare. |
| `prometheus-address` | *"Prometheus listening address (Default: any)."* Assente dall'example conf ma presente in man page. |
| `prometheus-path` | *"Prometheus serve path (Default: /metrics)."* |
| `prometheus-username-labels` | *"Enable labeling prometheus traffic metrics with client usernames."* |
| `alternate-server` / `tls-alternate-server` | Meccanismo di redirezione `300 ALTERNATE-SERVER`, vedi §1.7. |

Fonti [UPSTREAM]:
- `https://raw.githubusercontent.com/coturn/coturn/master/man/man1/turnserver.1`
- `https://raw.githubusercontent.com/coturn/coturn/master/src/apps/relay/mainrelay.c`
- `https://raw.githubusercontent.com/coturn/coturn/master/examples/etc/turnserver.conf`
- `https://raw.githubusercontent.com/coturn/coturn/master/ChangeLog`

#### Errore di unità di misura nella configurazione di R4

**Esito: R4 SMENTITA su questo punto.**

Man page verbatim [UPSTREAM]:
- `--max-bps`: *"Max **bytes-per-second** bandwidth a TURN session is allowed to handle (input and output network streams are treated separately)."*
- `--bps-capacity`: *"Maximum server capacity. Total **bytes-per-second** bandwidth the TURN server is allowed to allocate for the sessions, combined (input and output network streams are treated separately)."*

Nonostante il nome `bps`, l'unità è **byte** al secondo. Di conseguenza, nella configurazione di R4 §4.3:
- `max-bps=2000000  # ~2 Mbit/s per sessione TURN` → in realtà **16 Mbit/s**, otto volte il valore inteso;
- `bps-capacity=800000000  # capacità aggregata` → in realtà **6,4 Gbit/s**, non 800 Mbit/s.

Nota ulteriore: *"input and output network streams are treated separately"*, quindi il limite si applica per direzione, non all'aggregato.

---

### 1.4 Direttive di hardening realmente disponibili contro il relay verso rete interna e loopback

**Esito: CONFERMATE, con precisazioni di sintassi.**

`denied-peer-ip` / `allowed-peer-ip` — testo verbatim della man page [UPSTREAM], che chiarisce la **precedenza** delle regole e va citato in documentazione:

> *"Options to ban or allow specific ip addresses or ranges of ip addresses. If an ip address is specified as both allowed and denied, then the ip address is considered to be allowed. This is useful when you wish to ban a range of ip addresses, except for a few specific ips within that range. This can be used when you do not want users of the turn server to be able to access machines reachable by the turn server, but would otherwise be unreachable from the internet. The allowed/denied addresses (white/black lists) rules are very simple: (1) If there is no rule for an address, then it is allowed; (2) If there is an 'allowed' rule that fits the address then it is allowed — no matter what; (3) If there is no 'allowed' rule that fits the address, and if there is a 'denied' rule that fits the address, then it is denied."*

Tre fatti che discendono da questo testo e che vanno resi espliciti:

1. **Il default è `allow`.** Regola (1). Un `denied-peer-ip` dimenticato significa relay consentito. Non esiste un interruttore «default-deny» globale: il default-deny va costruito enumerando i range.
2. **`allowed-peer-ip` prevale sempre su `denied-peer-ip`.** Regola (2). Usare `allowed-peer-ip` in un deployment sanitario è quindi un rischio: una singola riga permissiva annulla qualunque diniego. **La configurazione di riferimento non lo usa.**
3. **La sintassi verificata è `<indirizzo>` o `<min>-<max>`.** L'esempio upstream è `denied-peer-ip=83.166.64.0-83.166.95.255`. La notazione CIDR con `/` **non è stata verificata** su fonte primaria: esito `NON VERIFICABILE`, quindi la configurazione di riferimento usa esclusivamente la forma con trattino, che è documentata. E per il monito di CVE-2026-73213, tutti i range IPv6 usati sono **allineati a un prefisso**.

Altre direttive di hardening del relay verificate:

| Direttiva | Testo upstream | Uso |
|---|---|---|
| `no-multicast-peers` | *"Disallow peers on well-known broadcast addresses (224.0.0.0 and above, and FFXX:*)."* | **Attivare** |
| `no-tcp-relay` | *"Do not allow TCP relay endpoints defined in RFC 6062, use only UDP relay endpoints as defined in RFC 5766."* | **Attivare** — è il path su cui è avvenuto il bypass di CVE-2026-73212 |
| `allow-loopback-peers` | *"Allow it only for testing in a development environment!"* | **Non impostare mai** |
| `no-udp-relay` | *"Do not allow UDP relay endpoints defined in RFC 5766, use only TCP relay endpoints as defined in RFC 6062."* | **Non impostare** — WebRTC ne ha bisogno |
| `server-relay` | *"Server relay. NON-STANDARD AND DANGEROUS OPTION."* | **Non impostare mai** |
| `unauthorized-ratelimit` (+ `-rps`) | vedi §1.3 | **Attivare** |
| `secure-stun` | *"Require authentication of the STUN Binding request. By default, clients are allowed anonymous access."* | Valutare con cautela: rompe l'uso STUN anonimo |
| `stale-nonce` | *"Use extra security with nonce value having limited lifetime, in seconds (default 600 secs). Set it to 0 for unlimited nonce lifetime."* | **Attivare** (il default 600 è già corretto) |
| `fingerprint` | *"Use fingerprints in the TURN messages. If an incoming request contains a fingerprint, then TURN server will always add fingerprints to the messages in this session, regardless of the per-server setting."* | Attivare |

La configurazione completa è in fondo al documento.

---

### 1.5 Metriche esposte dall'exporter Prometheus

**Esito: CONFERMATA — elenco reale estratto da `src/apps/relay/prom_server.c`.**

Endpoint di default: porta **9641**, path **`/metrics`** (man page: *"Would listen on port 9641 under the path /metrics"*), indirizzo di ascolto configurabile con `--prometheus-address` (default: **any** — da restringere).

| Metrica | Tipo | Descrizione upstream | Label |
|---|---|---|---|
| `stun_binding_request` | counter | Incoming STUN Binding requests | — |
| `stun_binding_response` | counter | Outgoing STUN Binding responses | — |
| `stun_binding_error` | counter | STUN Binding errors | — |
| `turn_unauthenticated_401_requests` | counter | UDP requests requiring a 401 Unauthorized response | — |
| `turn_unauthenticated_401_responses` | counter | UDP 401 Unauthorized responses emitted | — |
| `turn_unauthenticated_401_dropped_responses` | counter | UDP 401 responses suppressed by DDoS mitigation | — |
| `turn_ratelimit_hash_collisions` | counter | 401 rate-limit hash-bucket collisions | — |
| `turn_ratelimit_occupied_buckets` | gauge | 401 rate-limit buckets currently tracking a live window | — |
| `turn_ratelimit_total_buckets` | gauge | 401 rate-limit hash table capacity in buckets | — |
| `turn_traffic_rcvp` / `_rcvb` / `_sentp` / `_sentb` | counter | Pacchetti/byte ricevuti e inviati, **sessioni concluse** | `realm`, `user` (opzionale) |
| `turn_traffic_peer_rcvp` / `_rcvb` / `_sentp` / `_sentb` | counter | Idem, lato peer | `realm`, `user` (opzionale) |
| `turn_total_traffic_rcvp` / `_rcvb` / `_sentp` / `_sentb` | counter | Totali aggregati, sessioni concluse | — |
| `turn_total_traffic_peer_rcvp` / `_rcvb` / `_sentp` / `_sentb` | counter | Idem, lato peer | — |
| `turn_total_allocations` | **gauge** | Allocazioni correnti | `type` |
| `turn_packet_processed` | counter | Incoming packet processed | — |
| `turn_packet_dropped` | counter | Incoming packet dropped | — |
| `turn_udp_recvmmsg_calls` | counter | `recvmmsg()` syscalls returning ≥1 datagram | — |
| `turn_udp_recvmmsg_packets` | counter | Datagrammi ricevuti via `recvmmsg()` | — |
| `turn_udp_sendmmsg_flushes` | counter | Egress batch flushes (sendmmsg/UDP-GSO) | — |
| `turn_udp_sendmmsg_datagrams` | counter | Datagrammi inviati via batch di egress | — |
| `turn_udp_sendmmsg_gso_datagrams` | counter | Datagrammi coalescenti in un singolo sendmsg UDP-GSO | — |

Fonte [UPSTREAM]: `https://raw.githubusercontent.com/coturn/coturn/master/src/apps/relay/prom_server.c`

**Tre osservazioni operative per Telemedic:**

1. **Le metriche di traffico contano solo le sessioni concluse** (*"finished sessions"*). Non esiste un contatore di byte per sessione in corso. Qualunque dashboard di traffico «live» costruita su `turn_traffic_*` mostrerà scalini al termine delle sessioni, non un flusso continuo. Il traffico istantaneo va derivato da `turn_udp_sendmmsg_datagrams` / `turn_udp_recvmmsg_packets`, che sono per-pacchetto e continui.
2. **`turn_total_allocations{type=...}` è l'unico gauge di stato.** È la metrica su cui costruire l'alert di saturazione (`total-quota`).
3. **`prometheus-username-labels` va lasciato disattivato.** Il `username` della credenziale TURN contiene, per il disegno di R4 §4.2, l'identificativo opaco di sessione. Etichettare le metriche con esso significa (a) esplodere la cardinalità e (b) trasferire un identificativo di sessione clinica nel sistema di metriche infrastrutturali, rompendo la separazione che R4 §4.7 stabilisce fra «metriche TURN = nessun dato personale» e «metriche `getStats()` = perimetro GDPR». Non attivarlo è un requisito di minimizzazione, non una preferenza.

Nota: **non esiste** una metrica di permessi negati (`CreatePermission` respinte per `denied-peer-ip`). Il segnale d'attacco che R4 §4.7 auspicava («un picco di `CreatePermission` respinte è un tentativo di scansione interna») **non è ricavabile dall'exporter Prometheus**: va estratto dai log applicativi. Questa è una correzione sostanziale a R4 §4.7.

---

### 1.6 Autenticazione a credenziali effimere

**Esito: CONFERMATA nel meccanismo, NON VERIFICABILE sull'algoritmo HMAC dalla sola man page.**

Testo verbatim della man page per `--use-auth-secret` [UPSTREAM]:

> *"TURN REST API flag. Flag that sets a special WebRTC authorization option that is based upon authentication secret. The feature purpose is to support 'TURN Server REST API'… This option uses timestamp as part of combined username: usercombo → 'timestamp:username', turn user → usercombo, turn password → base64(hmac(input_buffer = usercombo, key = shared-secret))."*

Per `--static-auth-secret`:

> *"Static authentication secret value (a string) for TURN REST API only. If not set, then the turn server will try to use the dynamic value in turn_secret table in user database (if present)… Multiple shared secrets can be used (both in the database and in the 'static' fashion)."*

Accertamenti:

- **Formato `timestamp:username`**: **CONFERMATO**, verbatim.
- **Password = `base64(hmac(usercombo, shared-secret))`**: **CONFERMATO**, verbatim.
- **Algoritmo di hash sottostante = SHA-1**: **NON VERIFICABILE dalla man page**, che scrive genericamente `hmac(...)`. Il codice sorgente non è stato ispezionato su questo punto specifico in questa verifica. **L'affermazione «HMAC-SHA1» di R4 §4.2 va quindi marcata come da confermare sul sorgente della versione deployata**, oppure — soluzione migliore e a costo zero — **validata empiricamente in un test di integrazione**: emettere una credenziale con l'implementazione Java, tentare un'`Allocate` contro il coturn deployato, e far fallire la build se l'autenticazione non riesce. Questo test è più solido di qualunque citazione documentale, perché verifica il comportamento della versione effettivamente in produzione.
- **Il rilievo di R4 sul rotolamento delle credenziali resta valido**, ma va aggiunto un fatto nuovo emerso dalla verifica: `--static-auth-secret` supporta **segreti multipli** (*"Multiple shared secrets can be used"*). Questo abilita la **rotazione senza downtime** del segreto condiviso: si configurano due segreti, si fa emettere al backend credenziali con il nuovo, si rimuove il vecchio dopo la scadenza del TTL massimo. R4 non lo menziona; è una capacità operativa rilevante per il piano di Post-Market Surveillance (D6).

Onestà normativa di R4 (il «TURN REST API» deriva da `draft-uberti-behave-turn-rest-00`, Internet-Draft individuale scaduto, e non è uno standard IETF; lo standard è RFC 7635): **non contestata, nessun elemento contrario trovato**.

---

### 1.7 Alta disponibilità e clustering

**Esito: CONFERMATA nella sostanza, da riformulare nella forma.**

Il README upstream [UPSTREAM] è la fonte diretta e dichiara, verbatim:

> *"When used as a part of an ICE solution, for VoIP connectivity, this TURN server can handle thousands simultaneous calls per CPU (when TURN protocol is used) or tens of thousands calls when only STUN protocol is used. For virtually unlimited scalability a load balancing scheme can be used."*

Gli schemi di load balancing elencati dal README sono **tre**, e sono tutti di **distribuzione**, non di **replica dello stato**:

1. *"DNS SRV based load balancing"*
2. *"built-in 300 ALTERNATE-SERVER mechanism (requires 300 response support by the TURN client)"*
3. *"network load-balancer server"*

Il meccanismo (2) è documentato in man page sotto `--alternate-server`: *"Option to set the 'redirection' mode… Server will send this value in attribute ALTERNATE-SERVER, with error 300, on ALLOCATE request… If more than one option provided, then functionality can be described as 'load-balancing'… Multiple alternate servers used in round-robin manner."* Esiste la variante `--tls-alternate-server`.

Accertamenti:

- **Assenza di clustering nativo con stato condiviso**: **CONFERMATA**, ma per **assenza documentale**, non per dichiarazione esplicita. Il README non nomina né clustering, né replica di allocazioni, né stato condiviso; i soli tre meccanismi di scala offerti sono di distribuzione delle *nuove* richieste. Formulazione corretta da usare in documentazione: *«coturn non documenta alcun meccanismo di replica dello stato delle allocazioni fra nodi; i soli schemi di scalabilità offerti upstream — DNS SRV, redirezione 300 ALTERNATE-SERVER, load balancer di rete — distribuiscono le nuove richieste e non preservano le allocazioni esistenti alla caduta di un nodo.»* Evitare «coturn non ha clustering», che è una negazione non ancorabile.
- **Comportamento alla caduta di un nodo**: coerente con quanto sopra — un'allocazione vive nello stato del processo che l'ha creata e non è ricostruibile altrove. Nessuna fonte upstream suggerisce il contrario.
- **La raccomandazione di R4 §4.6** (N nodi indipendenti, stessa `realm`, stesso `static-auth-secret`, tutti annunciati in `iceServers`, ridondanza affidata a ICE) resta **corretta e preferibile**, con **un'aggiunta obbligatoria emersa dalla verifica**: dal 4.17.0 va configurato anche **`stateless-nonce-secret` identico su tutti i nodi**, altrimenti ogni richiesta che atterra su un nodo diverso paga un round-trip `438` di ri-autenticazione. È il rimedio dichiarato dalle note di rilascio 4.17.0.
- **`alternate-server` come alternativa**: sconsigliato per Telemedic. Richiede il supporto del codice `300` da parte del client TURN (i browser lo implementano in modo disomogeneo e non verificato in questa ricerca) e sposta la logica di bilanciamento nel server invece che in ICE, che è già ottimizzato per farlo.

Fonti [UPSTREAM]: `https://raw.githubusercontent.com/coturn/coturn/master/README.md`, man page `turnserver.1`.

---

## 2. L'API Identity Provider di RFC 8827 §7 — questione aperta n. 12

**Esito: SMENTITA come tecnologia utilizzabile. La Short Authentication String è, oggi, l'unica strada praticabile.**

### 2.1 Stato della specifica

Il documento W3C è ***Identity for WebRTC 1.0*, Candidate Recommendation del 27 settembre 2018** [NORMATIVA]. Lo status banner dichiarava l'attesa di avanzamento a Proposed Recommendation *"no earlier than 31 December 2018"*. **Non è mai avvenuto.** Il documento è fermo allo stadio di CR da quasi otto anni.

Fonte [NORMATIVA]: `https://www.w3.org/TR/webrtc-identity/`

L'attività del repository di specifica conferma lo stallo. Ultimi commit [UPSTREAM]:

| Data | Commit |
|---|---|
| 2025-07-28 | *"Editorial: Align with Web IDL specification"* |
| 2023-12-12 | *"Upgrade action checkout"* |
| 2022-06-09 | *"Small editorial fixes"* / *"Fix reference to WebIDL"* / *"Improve markup for tables"* |
| 2022-02-03 | *"Give Global an identifier list as required by Web IDL"* |
| 2021-07-15 | *"Upgrade respec version…"* |

**Dal 2021 non esiste un solo commit sostanziale.** Tutto è manutenzione di toolchain e allineamento editoriale a Web IDL.

Fonte [UPSTREAM]: `https://api.github.com/repos/w3c/webrtc-identity/commits`

### 2.2 Stato di implementazione nei browser target

Dati da MDN `browser-compat-data`, che è la fonte strutturata di riferimento:

| Membro | Chrome | Chrome Android | Edge | Firefox | Safari | Safari iOS |
|---|---|---|---|---|---|---|
| `setIdentityProvider()` | **no** | **no** | ≤18, **rimosso in 79** | **40+** | **no** | **no** |
| `getIdentityAssertion()` | **no** | **no** | ≤18, **rimosso in 79** | **40+** | **no** | **no** |
| `peerIdentity` | **no** | **no** | ≤18, **rimosso in 79** | **40+** | **no** | **no** |
| `idpLoginUrl` | **no** | **no** | **no** | **40+** | **no** | **no** |

Fonte [VENDOR/UPSTREAM]: `https://raw.githubusercontent.com/mdn/browser-compat-data/main/api/RTCPeerConnection.json`

Lettura precisa di questi numeri:

- **Chrome e Safari non l'hanno mai implementata.** Non è una rimozione: è un rifiuto di adozione durato dieci anni.
- **Edge l'aveva** nella versione EdgeHTML (≤18) e **l'ha persa nel 2020 passando a Chromium** (rimosso in 79). Questo è il dato più eloquente: l'unico secondo implementatore l'ha abbandonata cambiando motore.
- **Firefox è l'unico implementatore rimasto**, dal 2015 (FF 40).

Sul lato Firefox, il bug **1842328** — *"Remove media.peerconnection.identity.enabled pref"*, RESOLVED FIXED, target **Firefox 117** — è spesso frainteso: **non ha rimosso la funzionalità**, ha rimosso il *preference switch* perché, testualmente, *"RTCPeerConnection.setIdentityProvider() has been enabled for about 8 years now"*. La funzionalità resta attiva e permanente in Firefox.

Fonte [VENDOR]: `https://bugzilla.mozilla.org/show_bug.cgi?id=1842328`

### 2.3 Conclusione per Telemedic

L'Identity Provider API è **funzionalmente monobrowser**. Una verifica indipendente delle chiavi che vi si appoggiasse funzionerebbe solo quando **entrambi** i partecipanti — medico e paziente — usano Firefox. In un contesto di telemedicina rivolta al pubblico, dove il paziente usa il browser che ha, questo è equivalente a non funzionare.

Aggiunta rispetto al mandato: anche ammesso il supporto universale, l'API richiederebbe un **Identity Provider terzo** che ospita lo script di proxy IdP. Introdurlo significherebbe (a) creare una nuova dipendenza runtime da un terzo, in tensione diretta con il **vincolo V1** di sovranità, e (b) spostare il trust anchor dal server di signaling all'IdP — senza eliminarlo, solo cambiandolo di posto. Anche in uno scenario ipotetico di supporto pieno, non è una soluzione evidentemente superiore.

> **Risposta alla domanda posta da R4 §15 punto 12: la Short Authentication String non è una fra due strade. È l'unica.** La raccomandazione R3 di R4 va promossa da «raccomandazione forte» a **requisito**, e il rischio T2 va ri-classificato: non esiste un'alternativa standard di mitigazione.

---

## 3. Altre verifiche dall'Appendice B

### 3.1 DTLS 1.3 — stato del supporto e cambio di default

**Esito: CONFERMATA per Firefox (con versione esatta) e per il default della libreria di Chromium. NON VERIFICABILE il milestone Chrome esatto e lo stato Safari.**

**BoringSSL** (la libreria TLS/DTLS di Chromium e libwebrtc) — verifica diretta sul sorgente `ssl/ssl_versions.cc` [UPSTREAM]:

```c
static const uint16_t kDTLSVersions[] = {
    DTLS1_3_VERSION,
    DTLS1_2_VERSION,
    DTLS1_VERSION,
};
```

e nella logica della versione massima di default:

```c
if (version == 0) {
    *out = method->is_dtls ? DTLS1_3_VERSION : TLS1_3_VERSION;
    return true;
}
```

**`DTLS1_3_VERSION` è la versione massima di default per i metodi DTLS su BoringSSL main.** Questo è il fatto primario: qualunque consumer di BoringSSL che non forzi `SSL_set_max_proto_version(DTLS1_2_VERSION)` negozierà DTLS 1.3.

Fonte [UPSTREAM]: `https://raw.githubusercontent.com/google/boringssl/main/ssl/ssl_versions.cc`

**Firefox** — bug **1884140**, *"Enable DTLS1.3 in WebRTC for Firefox Release"*, RESOLVED FIXED, target milestone **Firefox 127**. Commento del contributore: *"Allow the use of DTLS 1.3 on release/beta."*

Fonte [VENDOR]: `https://bugzilla.mozilla.org/show_bug.cgi?id=1884140`

**Chrome** — il milestone esatto **non è stato verificabile su fonte primaria**: l'issue tracker Chromium (382915276, *"Enable DTLS 1.3 by default"*) e quello WebRTC (383141571) richiedono autenticazione, e non esiste una voce su Chrome Platform Status, perché il cambiamento non è una feature Blink ma un cambio di default nella libreria crittografica. Esito: **`NON VERIFICABILE`** sul milestone; **`CONFERMATO`** sul fatto che il default della libreria sia DTLS 1.3. Esiste inoltre il field trial `WebRTC-ForceDtls13` per forzare o rendere esclusivo DTLS 1.3 — utile in CI, il cui nome esatto è però da confermare sul sorgente libwebrtc della versione in uso prima di essere pubblicato.

**Safari / WebKit** — **`NON VERIFICABILE`** in questa ricerca.

> **La raccomandazione di R4 resta la sola difendibile**: non dichiarare la versione DTLS, **misurarla** per sessione via `RTCTransportStats.tlsVersion` e registrarla nell'audit trail. Con il quadro attuale (default DTLS 1.3 su due dei tre motori, fallback DTLS 1.2 sempre attivo per compatibilità), qualunque affermazione statica in documentazione sarebbe falsa per una parte del parco installato.

---

### 3.2 `KeyUpdate` DTLS 1.3 e le chiavi SRTP estratte via exporter

**Esito: SMENTITA. Non esiste rotazione intra-sessione delle chiavi SRTP.**

Questa è la verifica più netta del documento, ed è ancorata a una fonte primaria IETF che affronta esattamente il problema.

`draft-ietf-tls-extended-key-update`, Internet-Draft attivo del TLS Working Group (versione **-13**, **4 luglio 2026**, Proposed Standard track), esiste *precisamente perché* il `KeyUpdate` di TLS/DTLS 1.3 non risolve il problema. Testo dalla motivazione [NORMATIVA]:

> *"The TLS 1.3 Key Schedule derives the exporter_secret from the main secret. This exporter_secret is static for the lifetime of the connection and **is not updated by a standard key update**."*

Il draft prosegue spiegando che, poiché il segreto exporter resta invariato per tutta la connessione, la sua compromissione in qualunque momento permette di ricalcolare retroattivamente **tutto** il keying material esportato, negando la post-compromise security. Il documento cita DTLS-SRTP come protocollo affetto, e descrive il comportamento che gli sarebbe richiesto **una volta adottato il nuovo meccanismo**: usare il nuovo exporter secret per generare EKM, mantenendo il precedente finché la replay window non rifiuta più i pacchetti protetti con le vecchie chiavi.

Fonte [NORMATIVA]: `https://datatracker.ietf.org/doc/html/draft-ietf-tls-extended-key-update`

**Accertamenti conclusivi:**

| Affermazione | Esito |
|---|---|
| Il `KeyUpdate` di DTLS 1.3 rideriva le chiavi SRTP estratte via exporter (RFC 5764 §4.2) | **SMENTITA.** Il `KeyUpdate` standard aggiorna le traffic key del record layer, **non** l'`exporter_secret`. Le chiavi SRTP, estratte una sola volta con l'etichetta `"EXTRACTOR-dtls_srtp"`, restano invariate per l'intera sessione. |
| Esiste rotazione intra-sessione delle chiavi SRTP in WebRTC | **SMENTITA.** Non con DTLS 1.2 (nessuna rinegoziazione nei browser), non con DTLS 1.3 (`KeyUpdate` non tocca l'exporter). Il meccanismo che la renderebbe possibile è un **Internet-Draft in corso di lavorazione**, non uno standard, e non è implementato in alcun browser. |
| L'analisi di R4 §5.4 e il rischio T7 | **CONFERMATI** e ora **ancorati a fonte primaria**. La formulazione onesta proposta da R4 — *«Ogni sessione utilizza materiale crittografico generato ex novo tramite handshake DTLS, con certificati effimeri per connessione. Non avviene riutilizzo di chiavi fra sessioni.»* — è corretta e **va adottata verbatim**. Il termine «key rotation» va eliminato dal materiale pubblico. |

Il rilievo di R4 su RFC 3711 §9.2 (i limiti di vita della master key, dell'ordine di 2^48 pacchetti SRTP, non sono avvicinabili in un consulto medico) resta valido: **l'assenza di rekeying intra-sessione non è una debolezza crittografica**, è solo una funzionalità che non esiste e che quindi non va rivendicata.

---

### 3.3 Supporto di `video/mp4` in `MediaRecorder`

**Esito: PARZIALMENTE CONFERMATA. Il claim MP4 del progetto è insostenibile su Firefox.**

| Browser | `video/mp4` in `MediaRecorder` | Fonte |
|---|---|---|
| **Chrome / Edge / Chrome Android / WebView** | **Sì**, dal **milestone 126**, abilitato per default. Codec: **H.264 video + AAC audio**. | Chrome Platform Status, feature 5163469011943424, *"MP4 container support for MediaRecorder"* — *"Adds support for muxing audio/video into MP4 containers with MediaRecorder."* Status: Enabled by default. [VENDOR] |
| **Chrome iOS** | **No** (la feature dichiara iOS non supportato) | idem |
| **Safari / Safari iOS** | **Sì.** Safari registra nativamente in MP4 (H.264 + AAC) dall'introduzione di `MediaRecorder` (Safari 14.1 / iOS 14). | WebKit, *MediaRecorder API* [VENDOR] |
| **Firefox / Firefox Android** | **NO.** | Bug **1631143**, *"The 'video/mp4' mime type is not supported in MediaRecorder"*, stato **NEW**, **nessuna risoluzione**. Commento di Mozilla: *"We don't support an mp4 muxer. Something we could add but not a huge priority."* [VENDOR] |

Fonti: `https://chromestatus.com/feature/5163469011943424`, `https://groups.google.com/a/chromium.org/g/blink-dev/c/p1OMVj1FrMI`, `https://bugzilla.mozilla.org/show_bug.cgi?id=1631143`

Dati collaterali verificati sulla stessa fonte: **Safari 18.4** (marzo 2025) ha aggiunto la **registrazione WebM** (Opus + VP8/VP9); prima di allora Safari poteva produrre solo MP4/AAC.

> **Conclusione per il rischio T8.** Il quadro è **rovesciato** rispetto all'assunto di R4 (che dava per scontato WebM come formato ampiamente supportato e MP4 come incerto). Nel 2026:
> - **MP4 è supportato da Chrome, Edge e Safari; non da Firefox.**
> - **WebM è supportato da Chrome, Edge, Firefox e — solo dal 18.4 — Safari.**
>
> Nessuno dei due contenitori è universale. Le opzioni per Telemedic sono tre, in ordine di preferenza:
> 1. **Negoziare il contenitore a runtime** con `MediaRecorder.isTypeSupported()` e **registrare il contenitore effettivo nei metadati della registrazione**, esattamente come R4 propone di fare per `srtpCipher`. Il claim pubblico diventa «registrazione in contenitore standard (MP4 o WebM secondo il browser), cifrata a riposo», che è verificabile.
> 2. Dichiarare MP4 e **restringere la registrazione ai browser che lo supportano**, disabilitandola su Firefox con messaggio esplicito. Peggiora l'esperienza e crea una disparità funzionale difficile da giustificare in un dispositivo medico.
> 3. Remux server-side. **Da escludere**: contraddice la cifratura nel browser, come R4 aveva già correttamente rilevato.
>
> **La feature 6 del sito, che dichiara MP4 senza qualificazioni, va corretta.** L'opzione 1 è quella da adottare.

---

### 3.4 Flag Chrome per il testing e preferenze Firefox equivalenti

**Esito: TUTTI CONFERMATI, con una scoperta rilevante.**

Verifica diretta sui sorgenti Chromium: `media/base/media_switches.cc` e `content/public/common/content_switches.cc` [UPSTREAM].

| Flag | Esito | Commento upstream verbatim |
|---|---|---|
| `--use-fake-device-for-media-stream` | **CONFERMATO** | *"Use fake device for Media Stream to replace actual camera and microphone. For the list of allowed parameters, see `FakeVideoCaptureDeviceFactory::ParseFakeDevicesConfigFromOptionsString()`."* |
| `--use-file-for-fake-video-capture` | **CONFERMATO** | *"Use an **.y4m** file to play as the webcam. See the comments in `media/capture/video/file_video_capture_device.h` for more details."* |
| `--use-file-for-fake-audio-capture` | **CONFERMATO** | *"Play a **.wav** file as the microphone. Note that for WebRTC calls we'll treat the bits as if they came from the microphone, which means **you should disable audio processing** (lest your audio file will play back distorted). The input file is converted to suit Chrome's audio buses if necessary, so most sane .wav files should work. You can pass either `<path>` to play the file looping or **`<path>%noloop`** to stop after playing the file to completion. **Must also be used with `kDisableAudioInput` or `kUseFakeDeviceForMediaStream`.**"* |
| `--use-fake-ui-for-media-stream` | **CONFERMATO ma SCONSIGLIATO DALL'UPSTREAM** | *"Bypass the media stream infobar by selecting the default device for media streams (e.g. WebRTC). Works with --use-fake-device-for-media-stream. **Prefer --auto-accept-camera-and-microphone-capture which does not interact with screen/tab capture.**"* |
| `--auto-accept-camera-and-microphone-capture` | **CONFERMATO** | *"Bypasses the dialog prompting the user for permission to capture cameras and microphones. Useful in automatic tests of video-conferencing Web applications. **This is nearly identical to `kUseFakeUIForMediaStream`, with the exception being that this flag does NOT affect screen-capture.**"* |
| `--use-fake-mjpeg-decode-accelerator` | **CONFERMATO** (non richiesto dal mandato, ma pertinente) | *"Use a fake device for accelerated decoding of MJPEG…"* |

Fonti [UPSTREAM]: `https://raw.githubusercontent.com/chromium/chromium/main/media/base/media_switches.cc`, `https://raw.githubusercontent.com/chromium/chromium/main/content/public/common/content_switches.cc`

**Tre fatti operativi per la CI di Telemedic che R4 non poteva conoscere:**

1. **`--auto-accept-camera-and-microphone-capture` è il flag corretto**, non `--use-fake-ui-for-media-stream`. La raccomandazione è **nel commento del sorgente Chromium stesso**. La differenza è sostanziale: `--use-fake-ui-for-media-stream` auto-accetta anche lo **screen capture**, il che significa che un test E2E che verifica il flusso di consenso allo screen sharing («mostro il referto al paziente») darebbe **falsi positivi**. Telemedic ha esattamente questo caso d'uso (R4 §2.3).
2. **Formati confermati: Y4M per il video, WAV per l'audio.** La sintassi `<path>%noloop` è documentata ed è ciò che serve per le fixture con timecode previste dalla raccomandazione R14 di R4 (misura automatica della latenza glass-to-glass): un video in loop rende ambigua la lettura OCR del timecode.
3. **`--use-file-for-fake-audio-capture` richiede la disattivazione dell'audio processing** (AEC/NS/AGC), altrimenti il file viene riprodotto distorto — e richiede di essere combinato con `--use-fake-device-for-media-stream`. Entrambi i vincoli sono dichiarati nel commento upstream e vanno codificati nella configurazione Playwright, non scoperti in debugging.

**Preferenze Firefox** — verifica su `modules/libpref/init/all.js` [UPSTREAM]:

```
pref("media.navigator.streams.fake", false);
pref("media.navigator.permission.disabled", false);
```

Entrambe **CONFERMATE**: booleane, default `false`. Da impostare a `true` nella configurazione di test.

Preferenze contigue verificate nello stesso file, utili al testing di qualità: `media.navigator.video.default_fps` (30), `media.navigator.video.max_fs` (12288), `media.navigator.video.max_fr` (60), `media.navigator.audio.fake_frequency` (1000), `media.navigator.video.use_transport_cc` (true), `media.navigator.audio.use_fec` (true), `media.navigator.video.red_ulpfec_enabled` (true).

Fonte [UPSTREAM]: `https://raw.githubusercontent.com/mozilla/gecko-dev/master/modules/libpref/init/all.js`

> **Asimmetria da documentare**: Firefox **non ha un equivalente** di `--use-file-for-fake-video-capture` / `--use-file-for-fake-audio-capture`. `media.navigator.streams.fake` produce uno stream **sintetico** generato dal browser (video a barre, audio a `media.navigator.audio.fake_frequency` Hz), non riproduce un file dell'utente. **Nessuna preferenza di riproduzione da file è stata trovata.** Conseguenza concreta: **la misura automatica della latenza glass-to-glass basata su fixture Y4M con timecode (R14) è realizzabile solo su Chromium.** Su Firefox va usata una strategia diversa — per esempio il rendering del timecode su `<canvas>` con `canvas.captureStream()` — oppure la copertura va limitata dichiarandolo. Questo è un vincolo di progettazione della suite di test, da segnalare all'agente Testing (questione aperta n. 30 di R4).

---

### 3.5 `RTCDegradationPreference`

**Esito: R4 SMENTITA nella diagnosi, MDN CONFERMATA. La spiegazione è che l'enum non vive dove R4 lo cercava.**

R4 segnala che «MDN riporta un valore non presente nella Recommendation». La verifica mostra che il problema è più radicale e insieme più semplice:

**`RTCDegradationPreference` non compare affatto nella W3C Recommendation *WebRTC: Real-Time Communication in Browsers*.** L'enumerazione esaustiva degli enum estratti dall'IDL della versione TR pubblicata (fonte: `w3c/webref`, `tr/idl/webrtc.idl`) ne conta **21**, e nessuno è `RTCDegradationPreference`; il token `Degradation` è **assente dall'intero file**, così come il membro `degradationPreference`.

Fonte [NORMATIVA]: `https://raw.githubusercontent.com/w3c/webref/main/tr/idl/webrtc.idl`

L'enum è definito da una **specifica diversa**: ***MediaStreamTrack Content Hints*, W3C Working Draft del 19 settembre 2025**, che lo introduce insieme a una `partial dictionary`. IDL verbatim [NORMATIVA]:

```webidl
enum RTCDegradationPreference {
  "maintain-framerate",
  "maintain-resolution",
  "balanced",
  "maintain-framerate-and-resolution"
};

partial dictionary RTCRtpSendParameters {
  RTCDegradationPreference degradationPreference;
};
```

Descrizioni normative dei quattro valori:

| Valore | Definizione verbatim |
|---|---|
| `maintain-framerate` | *"Degrade resolution in order to maintain framerate. The user agent SHOULD prefer reducing the resolution in order to optimize for video quality and performance within network constraints."* |
| `maintain-resolution` | *"Degrade framerate in order to maintain resolution. The user agent SHOULD prefer reducing the framerate in order to optimize for video quality and performance within network constraints."* |
| `balanced` | *"Degrade a balance of framerate and resolution. The user agent SHOULD prefer reducing a balance of framerate and resolution in order to optimize for video quality and performance within network constraints."* |
| `maintain-framerate-and-resolution` | *"Maintain framerate and resolution regardless of video quality. The user agent SHOULD NOT prefer reducing the framerate or resolution for quality and performance reasons, but MAY drop frames before encoding if necessary not to overuse network and encoder resources."* |

Fonte [NORMATIVA]: `https://www.w3.org/TR/mst-content-hint/`

**Accertamenti:**

- Il valore `"maintain-framerate-and-resolution"` riportato da MDN è **legittimo e normativo**: MDN non ha un errore. Il sospetto di R4 va ritirato.
- **Il riferimento normativo usato da R4 è però sbagliato**: `degradationPreference` **non** è parte della Recommendation WebRTC. Va citata *MediaStreamTrack Content Hints* (W3C **Working Draft**, 19 settembre 2025).
- **Conseguenza per il rischio della raccomandazione R11 e per la questione aperta n. 14** (esporre `degradationPreference` per specialità clinica): la maturità normativa è **inferiore** a quanto R4 assumeva. Un Working Draft è materia instabile per definizione. La documentazione di conformità (D6) deve dichiararlo come tale, e il codice deve trattare l'attributo come **best-effort**: impostarlo dentro un `try`/verifica di supporto, non assumerne l'esistenza.
- **`maintain-framerate-and-resolution` è, semanticamente, il valore più interessante per la telemedicina** — «non degradare né risoluzione né frame rate, semmai scarta frame» —, cioè il comportamento adatto a una dermatologia o a una valutazione del movimento, dove un fotogramma nitido vale più di un flusso fluido. È anche il valore **meno probabilmente implementato**, essendo il più recente. Va verificato a runtime leggendo indietro il parametro con `getParameters()` dopo averlo impostato, non assunto.

---

### 3.6 `RTCRtpReceiver.jitterBufferTarget`

**Esito: CONFERMATA. Specifica stabile e supporto ampio.**

Il membro **è** nell'IDL della W3C Recommendation, nella dichiarazione **principale** dell'interfaccia (non in una `partial interface`):

```webidl
[Exposed=Window]
interface RTCRtpReceiver {
  readonly attribute MediaStreamTrack track;
  readonly attribute RTCDtlsTransport? transport;
  static RTCRtpCapabilities? getCapabilities(DOMString kind);
  RTCRtpReceiveParameters getParameters();
  sequence<RTCRtpContributingSource> getContributingSources();
  sequence<RTCRtpSynchronizationSource> getSynchronizationSources();
  Promise<RTCStatsReport> getStats();
  attribute DOMHighResTimeStamp? jitterBufferTarget;
};
```

Fonte [NORMATIVA]: `https://raw.githubusercontent.com/w3c/webref/main/tr/idl/webrtc.idl`

Supporto browser (MDN `browser-compat-data`) [VENDOR/UPSTREAM]:

| Browser | Versione |
|---|---|
| Chrome / Chrome Android / Edge | **124** |
| Firefox / Firefox Android | **115** |
| Safari / Safari iOS | **27** |

Status: `standard_track: true`, `experimental: false`, `deprecated: false`.

Fonte: `https://raw.githubusercontent.com/mdn/browser-compat-data/main/api/RTCRtpReceiver.json`

> **Rilevanza diretta per il rischio T4** («il claim < 200 ms non è verificabile né difendibile»). R4 identifica correttamente il jitter buffer come contributo dominante alla latenza glass-to-glass e come elemento che *cresce deliberatamente* quando la rete peggiora. `jitterBufferTarget` è **l'unica leva che l'applicazione ha su quel contributo**, ed è disponibile su tutti e tre i motori. Questo cambia la natura di T4: la latenza non è più soltanto «da misurare e non promettere», ma **parzialmente governabile** — a costo, esplicito e documentabile, di un aumento della perdita di pacchetti audio sotto jitter elevato. È un trade-off clinico che può essere esposto come scelta motivata nel file di gestione dei rischi ISO 14971, e va segnalato all'agente Compliance accanto a `degradationPreference`.

---

### 3.7 Supporto AV1 in WebRTC

**Esito: CONFERMATA. Chrome dal 2021, Firefox dal 2025. Safari da verificare.**

| Motore | Stato | Fonte |
|---|---|---|
| **Chrome / Edge** | Encoder AV1 per WebRTC in **M90** (2021), annunciato dal Chromium Blog come *"AV1 Encoder for WebRTC"*, ottimizzato per la videoconferenza. | Chromium Blog, *"Chrome 90 Beta: AV1 Encoder for WebRTC, New Origin Trials, and More"*, marzo 2021 [VENDOR] |
| **Firefox** | Supporto iniziale in **Firefox 135**, disattivato in beta e release dietro il pref `media.webrtc.codec.video.av1.enabled`. **Attivato per default in Firefox 136** (bug 1944878, RESOLVED FIXED, target milestone *Firefox 136 Branch*). Invio e ricezione, **singlecast e simulcast** in trasmissione. | `https://bugzilla.mozilla.org/show_bug.cgi?id=1944878`, `https://bugzilla.mozilla.org/show_bug.cgi?id=1921154` [VENDOR] |
| **Safari / iOS** | **`NON VERIFICABILE`** su fonte primaria in questa ricerca. Le fonti secondarie concordano sulla dipendenza dall'hardware (Apple silicon serie M3 e A17 Pro o successivi), ma **non è stata trovata una nota di rilascio WebKit che lo dichiari per WebRTC**. Non citare cifre né versioni. |

**Il giudizio di R4 §7.1 resta corretto e va conservato**: il divario fra supporto *decoder* e supporto *encoder*, e il costo CPU dell'encoding software real-time, restano i fattori decisivi. Nessuna cifra di adozione è stata verificabile su fonte primaria: le stime di settore trovate provengono tutte da blog commerciali e **non vanno citate**.

**La raccomandazione operativa di R4 è quella giusta e va rafforzata**: non forzare la preferenza dei codec nella v1.0; misurare con `getStats()` (`RTCInboundRtpStreamStats.codecId` → `RTCCodecStats.mimeType`) quale codec viene realmente negoziato nel parco installato; decidere sui dati. Con Chrome e Firefox entrambi capaci di AV1 per default, la quota di sessioni AV1 nel traffico reale diventa un dato **osservabile** già dalla v1.0 — e quindi la base per una decisione informata nella v1.1, invece di una scommessa oggi.

---

### 3.8 Licenze e stato di manutenzione dei progetti SFU

**Esito: TUTTE CONFERMATE. Una conferma è decisiva.**

Dati dall'API GitHub, campo `license.spdx_id` (che deriva dal file di licenza upstream) e `pushed_at` al 25 agosto 2026 [UPSTREAM]:

| Progetto | Licenza | Ultimo push | Archiviato | Stelle | Esito |
|---|---|---|---|---|---|
| **mediasoup** (`versatica/mediasoup`) | **ISC** | 2026-08-18 | no | 7 342 | **CONFERMATA.** Permissiva, compatibile con Apache-2.0. Manutenzione attiva. |
| **Janus** (`meetecho/janus-gateway`) | **GPLv3** (già verificata da R4 sul `COPYING` upstream, con eccezione OpenSSL) | — | no | — | **CONFERMATA.** Il giudizio di esclusione per incompatibilità con D1 resta. |
| **Jitsi Videobridge** (`jitsi/jitsi-videobridge`) | **Apache-2.0** — verificata sul file `LICENSE` upstream: *"Apache License, Version 2.0, January 2004"* | 2026-08-22 | no | 3 100 | **CONFERMATA.** Il `[da verificare]` di R4 si scioglie in positivo. Manutenzione attiva. |
| **LiveKit** (`livekit/livekit`) | **Apache-2.0** | 2026-08-25 | no | 20 511 | **CONFERMATA.** Manutenzione molto attiva. |
| **ion-sfu** (`ionorg/ion-sfu`) | **MIT** | **2023-07-21** | no | 1 097 | **Licenza CONFERMATA. Sospetto di abbandono CONFERMATO**: nessun commit da **oltre tre anni**, 50 issue aperte, repository non archiviato ma inattivo. |
| **Pion** (`pion/webrtc`) | **MIT** | 2026-08-25 | no | 16 738 | **CONFERMATA.** Manutenzione molto attiva. |

Fonti [UPSTREAM]: API GitHub `repos/{owner}/{repo}` per ciascun progetto; `https://raw.githubusercontent.com/jitsi/jitsi-videobridge/master/LICENSE`

> **Conseguenza per la valutazione di R4 §6.3.** L'esclusione di **ion-sfu** non è più prudenziale, è **documentata**: tre anni senza commit rendono l'adozione insostenibile sotto **IEC 62304 §8.1.2** (gestione dei SOUP), che richiede un piano di sorveglianza delle vulnerabilità su una componente che nessuno mantiene. Va scritto così, con la data dell'ultimo commit come evidenza oggettiva.
>
> La preferenza di R4 per **Jitsi Videobridge** come primo candidato — per omogeneità di stack JVM — è ora **priva di riserve di licenza**: Apache-2.0 verificata sul file upstream, manutenzione attiva a tre giorni dalla verifica.

---

## Configurazione coturn di riferimento

Profilo: **deployment sanitario, produzione, coturn ≥ 4.17.2, N nodi indipendenti**, credenziali effimere, nessun database utenti, nessun SFU.

Ogni direttiva presente in questo file è stata verificata su almeno una delle tre fonti upstream (man page `turnserver.1`, `src/apps/relay/mainrelay.c`, `examples/etc/turnserver.conf`). **Le direttive dichiarate inesistenti in §1.3 non compaiono.** Le mitigazioni derivano dagli advisory citati in §1.2.

```ini
# =============================================================================
# /etc/turnserver.conf — Telemedic, profilo produzione sanitaria
# Versione coturn minima richiesta: 4.17.2 (2026-08-08)
#
# Motivo della versione minima: CVE-2026-73215 e CVE-2026-73216 sono corrette
# solo in 4.17.0; CVE-2026-73213 (bypass denied-peer-ip su range IPv6) in
# 4.16.0; CVE-2026-43994 (CVSS 9.8, stack overflow nel decoder OAuth) in 4.10.0.
# Ogni direttiva è verificata sulla man page turnserver(1) upstream o sulla
# tabella long_options[] di src/apps/relay/mainrelay.c.
# =============================================================================

# -----------------------------------------------------------------------------
# Listener — vincolare esplicitamente, mai 0.0.0.0
# -----------------------------------------------------------------------------
# Enumerare gli indirizzi su cui ascoltare. 0.0.0.0 lega anche le interfacce
# di management e di rete interna: superficie inutile su un servizio che, per
# progetto, accetta traffico non autenticato sulla 3478.
listening-ip=203.0.113.10
listening-port=3478
tls-listening-port=5349

# Indirizzo locale usato per inoltrare i pacchetti verso il peer.
relay-ip=10.0.10.20

# Mappatura privato -> pubblico quando il server è dietro NAT (IP elastico
# cloud, Docker con port mapping). Sintassi: external-ip=<pubblico>/<privato>.
# Con dual-stack o multi-homing servono più direttive external-ip.
external-ip=203.0.113.10/10.0.10.20

# Range delle porte di relay. 16384 porte: sovrabbondante per sessioni 1:1
# con BUNDLE + rtcp-mux (una porta per allocazione).
min-port=49152
max-port=65535

# NOTA 4.17.0 — I listener DTLS sono ora OPT-IN: senza --dtls non vengono
# avviati. Per Telemedic questa e' la configurazione voluta: i browser usano
# turns: su TCP/TLS, non TURN-over-DTLS, e non attivare DTLS elimina l'intera
# superficie di CVE-2026-73214 (esaurimento di stato via ClientHello
# frammentati pre-cookie). NON scommentare senza un requisito misurato.
#dtls

# -----------------------------------------------------------------------------
# Autenticazione — credenziali effimere HMAC, nessun utente statico
# -----------------------------------------------------------------------------
realm=turn.telemedic.example
use-auth-secret
static-auth-secret=${TURN_STATIC_AUTH_SECRET}   # iniettato da secret manager

# coturn accetta piu' segreti condivisi contemporaneamente ("Multiple shared
# secrets can be used"): e' il meccanismo per ruotare il segreto senza
# downtime. Aggiungere il nuovo, far emettere al backend con il nuovo,
# rimuovere il vecchio dopo la scadenza del TTL massimo.

# Nonce a vita limitata (default 600). Mitiga il replay delle credenziali.
stale-nonce=600

# NOTA 4.17.0 — stateless-nonce e' attivo per DEFAULT. La chiave di firma e'
# generata PER PROCESSO: senza un segreto condiviso, ogni riavvio e ogni
# richiesta che atterra su un nodo diverso costa al client un round-trip 438.
# In un'architettura a N nodi indipendenti questo segreto e' OBBLIGATORIO.
stateless-nonce-secret=${TURN_STATELESS_NONCE_SECRET}

# Fingerprint nei messaggi TURN.
fingerprint

# secure-stun richiede autenticazione anche sulle Binding request. I client
# WebRTC si aspettano STUN anonimo: attivarlo rompe l'uso del nodo come
# STUN server. Lasciare disattivo salvo che il nodo faccia solo TURN.
#secure-stun

# -----------------------------------------------------------------------------
# TLS
# -----------------------------------------------------------------------------
cert=/etc/coturn/certs/fullchain.pem
pkey=/etc/coturn/certs/privkey.pem

# Il cipher-list si applica a TLS/DTLS fino alla 1.2; per TLS 1.3 valgono le
# ciphersuite di default della libreria (man page verbatim).
cipher-list="ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384"
ec-curve-name=prime256v1

# La chiave DH predefinita e' gia' di 2066 bit. Le uniche direttive esistenti
# (dh566, dh1066) la ABBASSANO: non usarle. "dh2066" NON esiste.
# Per una chiave propria: dh-file=/etc/coturn/dh.pem

# --no-tlsv1_2 alza il minimo a TLSv1.3 (per TLS) e a DTLSv1.2 (per DTLS).
# Desiderabile in ambito sanitario; tutti i browser target supportano TLS 1.3.
# Attivare solo dopo aver verificato che nessun client legacy usi turns: TLS 1.2.
#no-tlsv1_2

# -----------------------------------------------------------------------------
# HARDENING DEL RELAY
#
# ATTENZIONE — LEGGERE PRIMA DI MODIFICARE.
# Il default di coturn per i peer e' ALLOW: "If there is no rule for an
# address, then it is allowed" (man page). Il default-deny non esiste come
# interruttore: va costruito enumerando i range.
# Inoltre allowed-peer-ip PREVALE SEMPRE su denied-peer-ip ("no matter what"):
# in questo profilo non e' usato, e non va aggiunto.
#
# Questa lista e' una DIFESA IN PROFONDITA', NON la difesa primaria. E' stata
# aggirata quattro volte in otto mesi: CVE-2026-27624 (4.9.0),
# CVE-2026-53450 (4.13.0), CVE-2026-73212 (4.13.1), CVE-2026-73213 (4.16.0).
# La difesa che ha retto a tutte e sei le CVE della famiglia SSRF-di-trasporto
# e' l'ISOLAMENTO DI RETE IN USCITA. Vedi le note in fondo.
#
# Tutti i range IPv6 qui sotto sono ALLINEATI A UN PREFISSO: e' la mitigazione
# raccomandata dall'advisory di CVE-2026-73213 contro i confini min-max
# arbitrari, che il confronto component-wise di addr_less_eq() sbagliava.
# -----------------------------------------------------------------------------

# --- IPv4: spazi non instradabili pubblicamente -----------------------------
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
denied-peer-ip=224.0.0.0-239.255.255.255
denied-peer-ip=240.0.0.0-255.255.255.255

# --- L'IP PUBBLICO DEL NODO STESSO ------------------------------------------
# Senza questa riga il relay puo' raggiungere i servizi del nodo passando dal
# suo indirizzo pubblico invece che da loopback, aggirando l'intera logica di
# protezione del loopback. Va aggiornata a ogni cambio di indirizzo.
denied-peer-ip=203.0.113.10

# --- IPv4-mapped IPv6 (::ffff:0:0/96) ---------------------------------------
# Mitigazione dichiarata testualmente nell'advisory di CVE-2026-27624.
# Corretta upstream in 4.9.0/4.13.0, mantenuta come difesa in profondita'.
denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255

# --- IPv6: prefissi speciali, tutti prefix-aligned --------------------------
denied-peer-ip=::
denied-peer-ip=::1
denied-peer-ip=64:ff9b::-64:ff9b:0:ffff:ffff:ffff:ffff:ffff          # NAT64 (64:ff9b::/96 esteso)
denied-peer-ip=100::-100:0:0:ffff:ffff:ffff:ffff:ffff                # discard-only (100::/64)
denied-peer-ip=2001:db8::-2001:db8:ffff:ffff:ffff:ffff:ffff:ffff     # documentazione
denied-peer-ip=2002::-2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff        # 6to4
denied-peer-ip=fc00::-fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff        # ULA (fc00::/7)
denied-peer-ip=fe80::-febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff        # link-local (fe80::/10)
denied-peer-ip=ff00::-ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff        # multicast (ff00::/8)

# --- Interruttori di superficie ---------------------------------------------
# Vieta i peer su indirizzi broadcast/multicast noti.
no-multicast-peers

# Nessun relay verso peer TCP (RFC 6062): WebRTC non ne ha bisogno, ed e'
# esattamente il path CONNECT su cui e' avvenuto il bypass di CVE-2026-73212.
no-tcp-relay

# NON impostare mai:
#   allow-loopback-peers  -> man page: "Allow it only for testing in a
#                            development environment!". Il diniego e' il default.
#   server-relay          -> man page: "NON-STANDARD AND DANGEROUS OPTION."
#   mobility              -> tre CVE nel solo luglio-agosto 2026
#                            (CVE-2026-65981 takeover di allocazione,
#                             CVE-2026-68555, CVE-2026-73216 bypass di quota).
#                            Nessun beneficio per una televisita 1:1.
#   rfc5780               -> NAT behavior discovery: aumenta il fattore di
#                            amplificazione. Off di default dal 4.7.0.
#   rfc3489-compatibility -> STUN "classico" senza magic cookie. Off di default.
#   stun-backward-compatibility -> aggiunge MAPPED-ADDRESS alle risposte,
#                            aumentando il gain factor. Off di default.
#   software-attribute    -> divulga versione. Disabilitato di DEFAULT: non
#                            serve alcuna direttiva per sopprimerlo.

# -----------------------------------------------------------------------------
# Anti-amplificazione e anti-riflessione
# -----------------------------------------------------------------------------
# "Mitigates reflection and amplification attacks that spoof a victim's source
# address to receive authentication challenges" (man page verbatim).
unauthorized-ratelimit
unauthorized-ratelimit-rps=10

# -----------------------------------------------------------------------------
# Quote e limiti
#
# ATTENZIONE ALL'UNITA' DI MISURA: nonostante il nome "bps", max-bps e
# bps-capacity sono espressi in BYTE al secondo, non in bit, e si applicano
# per direzione ("input and output network streams are treated separately").
# -----------------------------------------------------------------------------
user-quota=6              # allocazioni concorrenti per credenziale
total-quota=1200          # allocazioni concorrenti totali sul nodo

max-bps=400000            # 400 000 B/s = ~3,2 Mbit/s per sessione, per direzione
bps-capacity=125000000    # 125 MB/s = ~1 Gbit/s, capacita' aggregata del nodo

max-allocate-lifetime=3600
channel-lifetime=600
permission-lifetime=300

# Famiglia di indirizzi di default per le allocazioni. Sostituisce la
# deprecata keep-address-family.
allocation-default-address-family="ipv4"

# -----------------------------------------------------------------------------
# Osservabilita'
# -----------------------------------------------------------------------------
prometheus
prometheus-port=9641
prometheus-path=/metrics
# Il default di prometheus-address e' "any": vincolarlo all'interfaccia di
# management. L'endpoint /metrics non deve essere raggiungibile da Internet.
prometheus-address=10.0.10.20

# NON attivare prometheus-username-labels: il username della credenziale
# effimera contiene l'identificativo opaco di sessione. Etichettare le metriche
# infrastrutturali con esso esplode la cardinalita' e trasferisce un
# identificativo di sessione clinica fuori dal perimetro previsto. Requisito
# di minimizzazione GDPR, non preferenza.

# NOTA: l'exporter NON espone alcun contatore di permessi negati. Il segnale
# di scansione della rete interna (picco di CreatePermission respinte) va
# estratto dai LOG, non dalle metriche. Vedi la regola di alerting in fondo.

# -----------------------------------------------------------------------------
# Amministrazione — disattivata per intero
# -----------------------------------------------------------------------------
# La CLI e' OFF di default; no-cli e' esplicito e serve a impedire che una
# direttiva 'cli' introdotta per errore la riattivi.
no-cli

# NON attivare web-admin: interfaccia con precedenti di stored XSS
# (CVE-2026-43915) e di SQL injection (CVE-2026-53448).
# NON configurare acme-redirect: CVE-2026-62959, divulgazione di memoria heap
# PRE-AUTENTICAZIONE. La gestione dei certificati va fatta fuori da coturn.

# -----------------------------------------------------------------------------
# Processo
# -----------------------------------------------------------------------------
proc-user=turnserver
proc-group=turnserver
pidfile=/var/run/turnserver.pid
log-file=/var/log/coturn/turnserver.log

# NOTA 4.17.0 — Il formato di log e' CAMBIATO per default: timestamp ISO-8601
# al millisecondo, niente thread id, delimitatore spazio singolo, un record
# per riga. Ogni parser scritto per versioni precedenti va aggiornato.
# --new-log-timestamp=false ripristina il vecchio formato.
```

### Misure che questa configurazione NON può fornire e che restano obbligatorie

Il file sopra è la componente più debole della difesa. Le quattro misure che seguono non sono opzionali e derivano direttamente dal fatto che `denied-peer-ip` è stato aggirato quattro volte in otto mesi:

1. **Isolamento di rete in uscita.** Il nodo TURN in DMZ, **senza alcuna rotta verso la rete interna**. Regole di egress a livello di security group o netfilter: consentito solo UDP verso Internet pubblico; negato tutto il resto, incluso il traffico verso se stesso e verso il proprio indirizzo pubblico. **Questa è la sola difesa che ha retto a tutte e sei le CVE della famiglia SSRF-di-trasporto**, perché non dipende dalla correttezza del parsing di coturn.
2. **Nessun servizio co-locato.** Nessun database, nessun agente di gestione in ascolto su loopback, nessun endpoint di metadata raggiungibile (su cloud: IMDSv2 obbligatorio, o metadata disabilitato).
3. **Test di sicurezza in CI/CD.** Con una credenziale valida, tentare `CreatePermission` verso `127.0.0.1`, `::ffff:127.0.0.1`, `169.254.169.254`, `10.0.0.1`, l'IP pubblico del nodo stesso, **e un indirizzo dentro un range IPv6 non prefix-aligned**; far fallire la build se una qualunque riceve risposta di successo. L'ultimo caso è il regression test di CVE-2026-73213 e non era previsto da R4. Misura di controllo del rischio tracciabile ISO 14971.
4. **Alerting sui log, non sulle metriche.** Poiché l'exporter Prometheus non espone i permessi negati, la regola che rileva la scansione della rete interna va costruita sul log applicativo. Le metriche utili in affiancamento sono `turn_total_allocations{type=...}` per la saturazione e `turn_unauthenticated_401_dropped_responses` per l'attività di riflessione.

---

## Correzioni da apportare alla ricerca R4

Elenco puntuale, ordinato per sezione del documento esistente.

### §4.1 — Versioni e postura di aggiornamento
1. **Sostituire** il blocco `[la versione esatta più recente va verificata al momento del deploy…]` con la cronologia verificata (§1.1 di questo documento) e la versione corrente **4.17.2 del 2026-08-08**.
2. **Aggiungere** una versione minima vincolante: **4.17.2**, con la motivazione per CVE.
3. **Aggiungere** un paragrafo sui **tre cambi di default di 4.17.0** (DTLS opt-in, stateless nonce, formato di log), perché due di essi rompono la configurazione proposta in §4.3.

### §4.2 — Autenticazione
4. **Declassare** l'affermazione «HMAC-SHA1 non è negoziabile» da fatto verificato a **da confermare sul sorgente della versione deployata**: la man page scrive genericamente `hmac(...)`. Sostituire la verifica documentale con un **test di integrazione** che emette una credenziale e tenta un'`Allocate` reale.
5. **Aggiungere** la capacità di **segreti condivisi multipli** (*"Multiple shared secrets can be used"*) e il conseguente procedimento di rotazione senza downtime.
6. **Conservare** invariato il rilievo T12 (HMAC-SHA1 contraddice la narrativa «solo algoritmi moderni»), ma condizionarlo all'esito del test del punto 4.

### §4.3 — Configurazione di riferimento
7. **Sostituire integralmente** il blocco `ini` con la configurazione verificata in fondo a questo documento.
8. **Correggere l'errore di unità**: `max-bps` e `bps-capacity` sono in **byte** al secondo e si applicano **per direzione**. I valori attuali sono otto volte quelli intesi.
9. **Rimuovere** `cli-password=${TURN_CLI_PASSWORD}`: impostare la password non abilita la CLI (che è off di default) e non la protegge. Sostituire con `no-cli`.
10. **Sostituire** `listening-ip=0.0.0.0` con l'enumerazione esplicita degli indirizzi.
11. **Aggiungere** le direttive mancanti e verificate: `unauthorized-ratelimit` + `unauthorized-ratelimit-rps`, `stateless-nonce-secret`, `prometheus-address`, `prometheus-path`, `allocation-default-address-family`, `pidfile`, `ec-curve-name`.
12. **Aggiungere** il diniego dell'**IP pubblico del nodo stesso**, assente dall'elenco di R4 e necessario contro l'hairpin.
13. **Aggiungere** il diniego dei prefissi IPv6 **6to4 (2002::/16)** e **NAT64 (64:ff9b::/96)**, che CVE-2026-73212 dimostra essere vettori reali.
14. **Aggiungere** la citazione verbatim della regola di precedenza allow/deny della man page e il divieto d'uso di `allowed-peer-ip` in questo profilo.
15. **Riscrivere** il blocco `[non verificate]` di fine sezione con la tabella di esiti di §1.3: `no-loopback-peers` e `dh2066` **non esistono**; `no-stun-backward-compatibility`, `no-tlsv1`, `no-tlsv1_1` sono state **rimosse**; `no-rfc5780`, `response-origin-only-with-rfc5780`, `no-software-attribute`, `keep-address-family` esistono ma sono **deprecate e superflue**; `no-cli`, `no-udp`, `unauthorized-ratelimit` esistono e sono **utilizzabili**; `no-tlsv1_2` esiste con **semantica diversa** da quella supposta.

### §4.4 — `external-ip` dietro NAT
16. Nessuna correzione. Il contenuto regge.

### §4.5 — Relay verso loopback e reti interne
17. **Sostituire** il blocco `[i numeri di CVE e le versioni esatte riportati dalle fonti secondarie non sono stati confermati…]` con la **tabella delle sei CVE della famiglia SSRF-di-trasporto** (§1.2.3), completa di numeri, versioni corrette e citazioni verbatim.
18. **Aggiungere CVE-2018-4058** come precedente più antico: *"By default, the TURN server allows relaying external traffic to the loopback interface of its own host"* — dimostra che il default insicuro era il punto di partenza storico del progetto.
19. **Riformulare la difesa a strati**: aggiungere esplicitamente che **`denied-peer-ip` è difesa in profondità, non difesa primaria**, perché è stata aggirata quattro volte in otto mesi; la difesa primaria è l'**isolamento di rete in uscita**.
20. **Estendere il test di sicurezza in CI** (punto 5 della difesa) con due casi nuovi: l'IP pubblico del nodo stesso e un indirizzo dentro un range IPv6 non prefix-aligned (regression di CVE-2026-73213).
21. **Aggiungere** la raccomandazione di **non attivare `mobility`** (tre CVE in due mesi) e di **non attivare `web-admin` né `acme-redirect`** (rispettivamente XSS + SQLi, e divulgazione di memoria pre-autenticazione).

### §4.6 — Alta disponibilità
22. **Riformulare** «coturn non ha un clustering nativo con stato condiviso» in una negazione ancorabile: *«il README upstream offre tre soli schemi di scalabilità — DNS SRV, redirezione 300 ALTERNATE-SERVER, load balancer di rete — tutti di distribuzione delle nuove richieste; nessuna fonte upstream documenta replica dello stato delle allocazioni»*, citando il README.
23. **Aggiungere** l'esistenza di `alternate-server` / `tls-alternate-server` e la ragione per cui **non** è la scelta giusta per Telemedic (dipendenza dal supporto client del codice 300; ICE fa già il lavoro meglio).
24. **Aggiungere alla raccomandazione finale** il requisito di **`stateless-nonce-secret` identico su tutti i nodi**, senza il quale l'architettura a N nodi indipendenti paga un round-trip `438` per ogni riassegnazione di nodo.

### §4.7 — Osservabilità
25. **Sostituire** il blocco `[l'elenco esatto delle metriche esposte non è stato verificato…]` con l'elenco reale di §1.5.
26. **Correggere l'affermazione sui permessi negati**: l'exporter **non espone** alcun contatore di `CreatePermission` respinte. Il segnale d'attacco va estratto dai log. Questa è una correzione sostanziale, perché R4 la presentava come metrica disponibile.
27. **Aggiungere** l'avvertenza che le metriche `turn_traffic_*` contano **solo le sessioni concluse**, e indicare `turn_udp_sendmmsg_datagrams` / `turn_udp_recvmmsg_packets` come sorgenti del traffico istantaneo.
28. **Aggiungere** il divieto di `prometheus-username-labels` come requisito di minimizzazione GDPR, e la restrizione di `prometheus-address` all'interfaccia di management.

### §5.2 — DTLS 1.3
29. **Sostituire** `[versioni e date non confermate su fonte primaria]` con: BoringSSL `main` ha **DTLS 1.3 come versione massima di default** (sorgente `ssl/ssl_versions.cc`); **Firefox 127** ha abilitato DTLS 1.3 in WebRTC su release e beta (bug 1884140). Dichiarare **`NON VERIFICABILE`** il milestone Chrome esatto e lo stato Safari. Conservare la raccomandazione di misurare `RTCTransportStats.tlsVersion` anziché dichiararla.

### §5.3 — Fingerprint e catena di fiducia
30. **Sostituire** `[il supporto browser dell'API IdP è stato storicamente scarso e in parte rimosso — va verificato…]` con il dato accertato: **implementata solo da Firefox (40+); mai da Chrome né da Safari; presente in Edge fino a EdgeHTML 18 e rimossa nel passaggio a Chromium (79); specifica ferma a Candidate Recommendation del 27 settembre 2018 senza commit sostanziali dal 2021**.
31. **Promuovere la contromisura (2) — Short Authentication String — da «raccomandazione forte» a requisito**, motivandola con il fatto che l'alternativa standard **non esiste in pratica**.
32. **Aggiungere** l'argomento di sovranità: anche in uno scenario ipotetico di supporto pieno, l'IdP API richiederebbe un Identity Provider terzo, in tensione con il vincolo V1, e sposterebbe il trust anchor senza eliminarlo.

### §5.4 — Rekeying
33. **Sostituire** `[il comportamento esatto in presenza di DTLS 1.3 + use_srtp non è stato verificato…]` con l'accertamento definitivo: *"This exporter_secret is static for the lifetime of the connection and is not updated by a standard key update"* (`draft-ietf-tls-extended-key-update-13`, 4 luglio 2026). **Non esiste rotazione intra-sessione delle chiavi SRTP.** Citare il draft come prova del fatto che il problema è **noto, aperto e non ancora standardizzato**.
34. **Confermare senza riserve** la formulazione onesta proposta da R4 e adottarla verbatim nel materiale pubblico.

### §6.3 — SFU open source
35. **Sciogliere in positivo** tutti i `[da verificare]`: Jitsi Videobridge **Apache-2.0** (file `LICENSE` upstream), LiveKit **Apache-2.0**, ion-sfu **MIT**, Pion **MIT**.
36. **Sostituire** «stato di manutenzione incerta» per ion-sfu con il dato oggettivo: **ultimo commit 21 luglio 2023**, 50 issue aperte. Motivare l'esclusione su **IEC 62304 §8.1.2** con l'evidenza della data, non con un sospetto.
37. **Aggiungere** le date di ultimo commit degli altri candidati come prova di manutenzione attiva (mediasoup 2026-08-18, Jitsi Videobridge 2026-08-22, LiveKit e Pion 2026-08-25).

### §7.1 — Codec video
38. **Aggiornare la riga AV1**: encoder AV1 per WebRTC in **Chrome M90** (Chromium Blog, marzo 2021); **Firefox 136** lo attiva per default, con invio/ricezione e simulcast (bug 1944878); Safari **`NON VERIFICABILE`**. **Rimuovere** ogni cifra di adozione: nessuna è verificabile su fonte primaria.
39. **Conservare** la raccomandazione di non forzare i codec e di misurare, rafforzandola: con due motori su tre che supportano AV1 per default, la quota reale è ora **osservabile** dalla v1.0.

### §8 e §11 — `getStats()` e testing
40. **Correggere il riferimento normativo di `degradationPreference`**: non è nella Recommendation WebRTC, è in ***MediaStreamTrack Content Hints*, W3C Working Draft del 19 settembre 2025**. **Ritirare** il sospetto sul valore `"maintain-framerate-and-resolution"`, che è **normativo e corretto**; MDN non sbaglia. Segnalare la minore maturità della specifica (WD, non REC) all'agente Compliance per la questione aperta n. 14.
41. **Confermare `jitterBufferTarget`**: presente nell'interfaccia principale di `RTCRtpReceiver` nella Recommendation; Chrome 124, Firefox 115, Safari 27. **Collegarlo esplicitamente al rischio T4**: è l'unica leva applicativa sul contributo dominante alla latenza glass-to-glass, e trasforma T4 da rischio non governabile in trade-off documentabile.
42. **Sostituire `--use-fake-ui-for-media-stream` con `--auto-accept-camera-and-microphone-capture`** in tutta la configurazione di CI, citando il commento upstream: il primo auto-accetta anche lo screen capture e produrrebbe falsi positivi sui test del flusso di consenso allo screen sharing.
43. **Aggiungere** la sintassi verificata `<path>%noloop` per `--use-file-for-fake-audio-capture` e i suoi due vincoli documentati (disattivare l'audio processing; combinare con `--use-fake-device-for-media-stream`).
44. **Confermare** le preferenze Firefox `media.navigator.streams.fake` e `media.navigator.permission.disabled` (booleane, default `false`, in `modules/libpref/init/all.js`).
45. **Aggiungere un vincolo nuovo alla strategia di test**: Firefox **non ha** alcun equivalente di riproduzione da file. **La misura automatica della latenza glass-to-glass con fixture Y4M (raccomandazione R14) è realizzabile solo su Chromium.** Su Firefox serve una strategia alternativa o una copertura dichiaratamente ridotta.

### §10 e §14 — Registrazione e rischio T8
46. **Riscrivere T8 con il quadro reale, che è rovesciato**: MP4 è supportato da **Chrome 126+, Edge e Safari**; **non** da Firefox (bug 1631143, stato NEW, *"We don't support an mp4 muxer"*). WebM è supportato da Chrome, Edge, Firefox e — solo dal **18.4** — Safari. **Nessuno dei due contenitori è universale.**
47. **Adottare la soluzione 1** di §3.3: negoziare il contenitore a runtime con `isTypeSupported()` e registrarlo nei metadati della registrazione, coerentemente con la scelta già fatta per `srtpCipher`. **Correggere la feature 6 del sito**, che dichiara MP4 senza qualificazioni.

### §14 — Tabella dei rischi
48. **T1** — aggiornare con le sei CVE verificate; aggiungere che `denied-peer-ip` è stato aggirato quattro volte in otto mesi e che la difesa primaria è l'isolamento di rete.
49. **T2** — elevare la severità dell'assenza di alternative: l'IdP API di RFC 8827 §7 **non è una mitigazione disponibile**. La SAS è l'unica.
50. **T7** — rimuovere il «non verificato»: è **verificato che non esiste** rotazione intra-sessione, con fonte IETF primaria.
51. **T8** — riscrivere secondo il punto 46.
52. **T13** — riformulare secondo il punto 22 e aggiungere il requisito `stateless-nonce-secret`.
53. **T15** — sostituire «numerose versioni nel 2026» con **quattordici release in sette mesi e ventisette CVE su NVD**, di cui una CRITICAL 9.8 (CVE-2026-43994). La cadenza di patching non è un obbligo generico: è un obbligo **quantificato**, e va tradotto in uno SLA numerico nel piano PMS.
54. **T16** — **chiudere il rischio**. Era un rischio di processo; il processo è stato eseguito. Sostituirlo con una regola permanente: *«la configurazione coturn e l'elenco CVE vanno ri-verificati su NVD/GHSA e su `turnserver --help` della versione deployata a ogni aggiornamento di minor version, e l'esito registrato nel fascicolo PMS.»*

### §15 — Questioni aperte
55. **Chiudere il punto 7** (verifica delle direttive coturn) e il **punto 11** (verifica dei CVE): fatti, esiti in §1.2 e §1.3.
56. **Chiudere il punto 12** (IdP API): la risposta è **no**, la SAS è l'unica strada.
57. **Chiudere il punto 19** (`MediaRecorder` MP4) con il quadro di §3.3, lasciando aperta la sola **decisione** sul contenitore.
58. **Chiudere il punto 30** (flag Chrome), aggiungendo però la **questione nuova** del punto 45: quale strategia di misura della latenza su Firefox.

### Appendice A e Appendice B
59. **Appendice A** — aggiungere ai riferimenti: *MediaStreamTrack Content Hints* (W3C WD, 19 settembre 2025); *Identity for WebRTC 1.0* (W3C CR, 27 settembre 2018, **fermo**); `draft-ietf-tls-extended-key-update` (Internet-Draft attivo, versione -13 del 4 luglio 2026, citato **come tale**).
60. **Appendice B** — sostituire integralmente le voci **1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 17** con gli esiti di questo documento. Le voci **13, 14, 15, 16, 18** restano aperte e fuori dal mandato di questa verifica.

---

### Voci dell'Appendice B rimaste NON VERIFICATE

Fuori dal mandato di questa verifica e ancora aperte: **13** (coefficienti `Ie-eff` per Opus in ITU-T G.113 App. I e copertura di Opus in G.107.2), **14** (supporto di RTCP XR / RFC 3611 nei browser), **15** (soglie GCC di perdita per incremento e riduzione del bitrate), **16** (requisiti tecnici minimi nelle indicazioni nazionali italiane per la telemedicina), **18** (tutte le cifre marcate `[ordine di grandezza]`).

Dentro il mandato ma non risolvibili su fonte primaria: il **milestone Chrome esatto** del passaggio a DTLS 1.3 di default e lo **stato Safari/WebKit** di DTLS 1.3; lo **stato AV1 in WebRTC su Safari**; l'**algoritmo di hash** sottostante all'HMAC del TURN REST API; il **supporto della notazione CIDR** in `denied-peer-ip` / `allowed-peer-ip`; il nome esatto del field trial `WebRTC-ForceDtls13` sul sorgente libwebrtc.

---

## Fonti primarie consultate

**Upstream coturn**: [releases](https://api.github.com/repos/coturn/coturn/releases) · [security advisories](https://api.github.com/repos/coturn/coturn/security-advisories) · [turnserver.1](https://raw.githubusercontent.com/coturn/coturn/master/man/man1/turnserver.1) · [mainrelay.c](https://raw.githubusercontent.com/coturn/coturn/master/src/apps/relay/mainrelay.c) · [prom_server.c](https://raw.githubusercontent.com/coturn/coturn/master/src/apps/relay/prom_server.c) · [examples/etc/turnserver.conf](https://raw.githubusercontent.com/coturn/coturn/master/examples/etc/turnserver.conf) · [ChangeLog](https://raw.githubusercontent.com/coturn/coturn/master/ChangeLog) · [README.md](https://raw.githubusercontent.com/coturn/coturn/master/README.md)

**Database di vulnerabilità**: [NVD API v2.0 — coturn](https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch=coturn) · [CVE-2020-26262](https://nvd.nist.gov/vuln/detail/CVE-2020-26262) · [CVE-2026-27624](https://nvd.nist.gov/vuln/detail/CVE-2026-27624) · [CVE-2026-53450](https://nvd.nist.gov/vuln/detail/CVE-2026-53450) · [CVE-2018-4058](https://nvd.nist.gov/vuln/detail/CVE-2018-4058) · [GHSA-j8mm-mpf8-gvjg](https://github.com/coturn/coturn/security/advisories/GHSA-j8mm-mpf8-gvjg) · [GHSA-4v97-rxjj-4f99](https://github.com/coturn/coturn/security/advisories/GHSA-4v97-rxjj-4f99) · [GHSA-2x4g-wx24-48m4](https://github.com/coturn/coturn/security/advisories/GHSA-2x4g-wx24-48m4)

**Normativa W3C / IETF**: [Identity for WebRTC 1.0 (CR 2018-09-27)](https://www.w3.org/TR/webrtc-identity/) · [MediaStreamTrack Content Hints (WD 2025-09-19)](https://www.w3.org/TR/mst-content-hint/) · [webref — tr/idl/webrtc.idl](https://raw.githubusercontent.com/w3c/webref/main/tr/idl/webrtc.idl) · [draft-ietf-tls-extended-key-update](https://datatracker.ietf.org/doc/html/draft-ietf-tls-extended-key-update) · [w3c/webrtc-identity commits](https://api.github.com/repos/w3c/webrtc-identity/commits)

**Vendor browser**: [MDN browser-compat-data — RTCPeerConnection](https://raw.githubusercontent.com/mdn/browser-compat-data/main/api/RTCPeerConnection.json) · [MDN BCD — RTCRtpReceiver](https://raw.githubusercontent.com/mdn/browser-compat-data/main/api/RTCRtpReceiver.json) · [Bugzilla 1842328](https://bugzilla.mozilla.org/show_bug.cgi?id=1842328) · [Bugzilla 1884140](https://bugzilla.mozilla.org/show_bug.cgi?id=1884140) · [Bugzilla 1944878](https://bugzilla.mozilla.org/show_bug.cgi?id=1944878) · [Bugzilla 1631143](https://bugzilla.mozilla.org/show_bug.cgi?id=1631143) · [BoringSSL ssl_versions.cc](https://raw.githubusercontent.com/google/boringssl/main/ssl/ssl_versions.cc) · [Chromium media_switches.cc](https://raw.githubusercontent.com/chromium/chromium/main/media/base/media_switches.cc) · [Chromium content_switches.cc](https://raw.githubusercontent.com/chromium/chromium/main/content/public/common/content_switches.cc) · [gecko-dev all.js](https://raw.githubusercontent.com/mozilla/gecko-dev/master/modules/libpref/init/all.js) · [Chrome Platform Status — MP4 container support for MediaRecorder](https://chromestatus.com/feature/5163469011943424) · [blink-dev — Intent to ship: MP4 container support for MediaRecorder](https://groups.google.com/a/chromium.org/g/blink-dev/c/p1OMVj1FrMI) · [Chromium Blog — Chrome 90 Beta: AV1 Encoder for WebRTC](https://blog.chromium.org/2021/03/chrome-90-beta-av1-encoder-for-webrtc.html) · [WebKit — MediaRecorder API](https://webkit.org/blog/11353/mediarecorder-api/)

**Licenze e manutenzione SFU**: [jitsi-videobridge LICENSE](https://raw.githubusercontent.com/jitsi/jitsi-videobridge/master/LICENSE) · [livekit/livekit](https://api.github.com/repos/livekit/livekit) · [ionorg/ion-sfu](https://api.github.com/repos/ionorg/ion-sfu) · [pion/webrtc](https://api.github.com/repos/pion/webrtc) · [versatica/mediasoup](https://api.github.com/repos/versatica/mediasoup)