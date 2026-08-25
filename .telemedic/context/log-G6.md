# Log agente G6 — modulo 12 «Crittografia e sicurezza»

**Data**: 25 agosto 2026
**Deliverable**: `docs/10_fondamenti/12-crittografia-e-sicurezza.md`
**Decisione di riferimento**: D35 (guida dei fondamenti), blocco D

---

## 1. Conteggio e struttura

| Metrica | Valore |
|---|---|
| Parole | **28.964** (mandato: ≥ 9.000 — superato di 3,2×) |
| Byte | 195.765 |
| Righe | 2.869 |
| Sezioni di primo livello | 12 + «Cosa devi ricordare» + «Termini introdotti» |
| Sottosezioni | 71 |
| Diagrammi Mermaid | 5 |
| Tabelle | 19 |
| Termini a glossario | 55 |
| Punti `[NV]` | 9 (più 1 occorrenza metodologica in premessa) |

**Frontmatter**: `title: Crittografia e sicurezza`, `sidebar_position: 13`, `description` estesa.
Coerente con la convenzione dei moduli adiacenti (11 → `sidebar_position: 12`, 13 → `14`).

**Copertura del mandato**: tutti e dodici i punti richiesti sono coperti, nell'ordine indicato.

| § | Contenuto | Punto del mandato |
|---|---|---|
| 1 | Sei proprietà (riservatezza, integrità, disponibilità, autenticità, non ripudio, tracciabilità) + tre esigenze che nessuna copre | 1 |
| 2 | Modello di minaccia, STRIDE, attore/capacità/motivazione, **nove avversari realistici A1–A9**, superficie di attacco, confini di fiducia, catena minaccia→requisito→test | 2 |
| 3 | Simmetrica: Kerckhoffs, blocchi/flusso, modalità, AEAD, nonce e riuso, gestione delle chiavi | 3 |
| 4 | Asimmetrica: cifrare vs firmare, cifratura ibrida, scambio di chiavi e segretezza in avanti, curve ellittiche, obsolescenza, minaccia quantistica | 4 |
| 5 | Hash: proprietà, collisioni, password, sale/pepe, HMAC, **catene di hash** | 5 |
| 6 | Firma, X.509, CA, catena di fiducia, revoca, marca temporale, FES/FEA/FEQ e valore probatorio del referto | 6 |
| 7 | Transito vs riposo, tre livelli di cifratura a riposo, punti in chiaro, E2E e cosa comporta rinunciarvi | 7 |
| 8 | Identificazione/autenticazione/autorizzazione, fattori, sessioni, RBAC/ABAC, relazione di cura, privilegio minimo, separazione dei compiti, **rottura del vetro** | 8 |
| 9 | Registro degli accessi: cosa registrare/non registrare, **perché Envers non è un registro immutabile (D42)**, costruzione, dimostrazione all'autorità, rilevazione | 9 |
| 10 | GDPR art. 32, NIS2 (termine soggettivo, D39), CRA (esclusione per prodotto, D41), conflitto MDR/NIS2 (D43), **tabella «chi ha quale obbligo»** | 10 |
| 11 | SOUP, SBOM come obbligo normativo, VEX, gestione vulnerabilità e disclosure, segreti, catena di fornitura, firma degli artefatti, verifica in CI | 11 |
| 12 | **36 regole operative** per chi contribuisce, in sei gruppi | 12 |

---

## 2. Rinvii, non duplicazioni

Rispettato il vincolo di non ripetere ciò che altri moduli coprono:

- **[03 — Il dato clinico]** — rinvio esplicito in premessa e in 6 punti nel corpo: art. 9 GDPR e
  categoria particolare, base giuridica/consenso, ruoli privacy, amministratore di sistema
  (§ 3.4), regola sui log (§ 4.4), tabella FES/FEA/FEQ (§ 7.1), firma/validazione/marca
  temporale (§ 7.2), conservazione (§ 7.3), oscuramento e oscuramento dell'oscuramento (§ 8),
  regola sui dati sintetici (§ 10). **Nulla è ripetuto: solo richiamato con la conseguenza
  tecnica.**
- **[08 — WebRTC da zero]** — DTLS-SRTP, handshake, impronta del certificato, SAS, rotazione
  delle chiavi, credenziali temporanee TURN, formulazione onesta del claim E2E (§ 6.9),
  conflitto registrazione/E2E (§ 10.4). Trattati **solo come esempio applicativo**.
- **[13 — I protocolli]** — TLS/mTLS, OAuth/OIDC/SAML2, RFC di trasporto. Il modulo 13 dichiara
  già in § 0.3 che la teoria crittografica sta qui: il rinvio è reciproco e coerente.
- **[04 — Identità e anagrafiche]** — un rinvio, per l'anagrafica dell'identità.

---

## 3. Punti marcati `[NV]`

| # | Riga ca. | Oggetto | Perché non verificato | Chi dovrebbe chiuderlo |
|---|---|---|---|---|
| 1 | 322 | Stato di armonizzazione di **EN IEC 81001-5-1:2022** sotto MDR | B4 § 11.1 lo dichiara non accertato su fonte primaria (V-B4-1); la Decisione di esecuzione (UE) 2026/193 è nota solo da fonte secondaria | Agente MDR / conformità |
| 2 | 716 | **Limiti numerici di messaggi cifrabili sotto una singola chiave** per le costruzioni AEAD | Non ricavabile dalle fonti di progetto; dipende dalla costruzione adottata | Chi redige la politica crittografica |
| 3 | 781 | **Periodicità raccomandata di rotazione delle chiavi** | Nessuna fonte di progetto la fornisce; va fissata con motivazione nella politica di gestione delle chiavi | Chi redige la politica crittografica |
| 4 | 960 | **Date, algoritmi e scadenze della migrazione post-quantistica** | Nessuna fonte di progetto; va letta su documenti primari aggiornati al momento della decisione | Agente sicurezza / ADR |
| 5 | 1039 | **Valori dei parametri di costo** per l'hash delle password (Argon2 e simili) | Dipendono dall'hardware del verificatore; vanno misurati | Chi implementa l'IAM locale |
| 6 | 1390 | **Livello di firma richiesto dall'ordinamento per ciascuna tipologia documentale sanitaria** | Ereditato da 03 § 7.1, che già lo marca `[NV]` | Agente regolatorio / FSE |
| 7 | 2236 | **Estremi dell'art. 18 della Det. ACN n. 127437/2026** (fornitori rilevanti) | B4 § 5.2 lo dichiara ricostruito da fonti secondarie, non letto sul testo | Agente conformità |
| 8 | 2313 | **Numerazione 17.1–17.4 dell'Allegato I MDR** | R2 § 2.6 la dichiara non confermata su testo primario | Agente MDR |
| 9 | 31 | (metodologico) Dichiarazione che il modulo non pubblica ricette crittografiche e che i parametri seguono ETSI TS 119 312 / SOG-IS / AgID-ACN | — | — |

**Nessun numero di CVE è citato nel modulo.** La scelta è esplicitata in una nota di metodo
(§ 11.3): gli identificativi di vulnerabilità vivono negli advisory e nel VEX, non in una guida
formativa.

**Nessuna ricetta crittografica inventata.** Dove compare un algoritmo o una costruzione, la
fonte è dichiarata (RFC 5116, 5764, 5869, 6960, 5280, 3161, 6962, 9162, 9106, 2104, 7714, 8693;
ETSI TS 119 312, SOG-IS, AgID-ACN per parametri e dimensioni, ai sensi di D19).

---

## 4. Rispetto dei vincoli

- **R0** — verificato per grep: **nessun nome di azienda, marchio, prodotto commerciale o
  dominio**. Anche le tecnologie dello stack sono nominate per categoria («componente di
  gestione delle identità adottato», «sistema EHR di terze parti», «custode delle chiavi»,
  «sistema di gestione degli eventi di sicurezza»). Il difetto noto di Keycloak citato da D37 è
  reso come «nella configurazione predefinita del componente di gestione delle identità
  adottato».
- **Nessun segreto reale negli esempi**: solo `<CHIAVE-API>` e `${SECRET_DA_CONFIGURARE}`,
  entrambi in codice inline.
- **Nessun file della guida diverso dal proprio è stato modificato.**
- **Accenti e diacritici** verificati.
- **Compatibilità MDX/Docusaurus**: nessun `<` o `{` fuori da blocchi di codice; i tag `<i>` e i
  blocchi `classDef` sono stati rimossi dai diagrammi per uniformità con gli altri moduli (che
  non li usano) e per non forzare colori incompatibili con il tema scuro; caratteri Unicode
  esotici (`‖`, pedici) rimossi dai label Mermaid.
- **Diagrammi**: 5 Mermaid — confini di fiducia (§ 2.6), catena di hash (§ 5.6), catena di
  certificazione con i sei controlli di validazione (§ 6.3), flusso di rottura del vetro
  (§ 8.7), architettura del registro con conservazione separata (§ 9.4).

---

## 5. Decisioni e requisiti richiamati

**Decisioni**: D10, D17, D18, D19, D21, D22, D23, D25, D27, D28, D35, D36, D37, D38, D39, D40,
D41, D42, D43, D45, D49, D51.
**Vincoli**: V1, V2, V3, V4, V5, V6.
**Requisiti SEC di B4 § 13** richiamati puntualmente: SEC-001, 002, 005, 006, 007, 008, 010,
011, 012, 014, 017, 018, 020, 023, 024, 025, 029, 030, 031, 032, 033, 034, 035, 036, 037, 038,
041, 043, 044, 045, 046, 047, 049, 050, 051, 052, 055.

---

## 6. Questioni per gli altri agenti

**Q-G6-1 — Il collegamento a `04-identita-e-anagrafiche.md` punta a un modulo non ancora
scritto.** Ammesso durante la stesura, **bloccante prima del primo deploy** (D52). Il rinvio è
in § 8.2, sull'anagrafica dell'identità digitale. → agente che scrive il modulo 04.

**Q-G6-2 — Il registro immutabile va tradotto in ADR e in requisiti implementativi.** Il § 9.4
descrive quattro elementi (sola aggiunta, catena per tenant, conservazione separata, sigillo
firmato e marcato) e tre strategie alternative per la **concorrenza** delle scritture
(serializzazione, partizionamento, incatenamento a lotti). **La scelta non è fatta e va fatta
in un ADR**, perché ha effetti su prestazioni e granularità della rilevazione. → agente
architettura / `docs/adr/`.

**Q-G6-3 — Chi custodisce le ancore e i sigilli?** Il § 9.5 chiarisce che una catena
tecnicamente perfetta le cui ancore sono custodite dallo stesso amministratore che potrebbe
alterare i dati **non dimostra nulla**. Serve definire il modello organizzativo per i tre
profili di deployment di D24 (UE, territorio italiano, cloud qualificato). → agente sicurezza /
conformità.

**Q-G6-4 — La rottura del vetro va coordinata con l'oscuramento e con i dati a maggiore tutela
dell'anonimato.** Il § 8.7, requisito 7, rinvia a 03 § 8.3, ma **non esiste ancora una regola
esplicita** su quali categorie di dati siano invocabili in rottura del vetro e quali no. È una
decisione con rilevanza sia clinica sia giuridica. → agente dominio sanitario + regolatorio.

**Q-G6-5 — Il modulo 15 (regolatorio da zero) e il § 10 di questo modulo si sovrappongono.**
Qui il taglio è «quale norma impone quale misura tecnica e a chi»; là dovrebbe essere «perché
esiste questo quadro e come si legge una norma». **Verificare che non si duplichino** GDPR
art. 32, NIS2 e CRA. Proposta: il modulo 15 rinvia a 12 § 10 per le misure di sicurezza. →
agente modulo 15.

**Q-G6-6 — Il § 12 (36 regole per chi contribuisce) è candidato a diventare una checklist di
`CONTRIBUTING.md` e un template di pull request.** Le regole 14, 15, 21, 24 e 34 sono
verificabili automaticamente. → agente `CONTRIBUTING.md` / agente CI.

**Q-G6-7 — Serve un ADR sulla tabella artefatto → regime CRA/MDR** (D41, requisito SEC-006). Il
§ 10.3 la richiama e ne dà la forma, ma la compilazione richiede l'elenco definitivo degli
artefatti distribuiti. → agente conformità.

**Q-G6-8 — La politica crittografica del progetto non esiste ancora.** Il modulo rinvia
sistematicamente a ETSI TS 119 312 / SOG-IS / AgID-ACN (D19) e **rifiuta deliberatamente di
pubblicare parametri**. Serve però un documento operativo, in `docs/06_security/`, che fissi le
scelte con data e orizzonte, e che chiuda i punti `[NV]` 2, 3, 4 e 5 di questa tabella. →
agente sicurezza.

**Q-G6-9 — Verificare che il modulo 08 non contraddica il § 7.5.** Qui si afferma che nella
modalità con registrazione la sessione **non è da estremo a estremo**, coerentemente con D23 e
con 08 § 10.4. Se il modulo 08 evolve, i due testi vanno riallineati nella stessa PR.

**Q-G6-10 — Il § 11.8 elenca dodici deliverable di sicurezza.** Vanno agganciati alla roadmap
con una data e un responsabile, altrimenti restano un elenco. → agente roadmap.

---

## 7. Termini introdotti — per il glossario (modulo 19)

Cinquantacinque voci, tutte definite in tabella a fine modulo. Elenco per l'aggregazione
bilingue:

ABAC · AEAD · Agilità crittografica · Attestazione di provenienza · Autenticazione · Autorità di
certificazione · Autorizzazione · Catena di fiducia · Catena di hash · Certificato X.509 ·
Cifrario a blocchi · Cifrario a flusso · Cifratura a riposo · Cifratura da estremo a estremo ·
Cifratura ibrida · Cifratura in transito · Confine di fiducia · CRA · Custode di software open
source · Digest · Disponibilità · Distinta dei materiali software (SBOM) · Divulgazione
coordinata · eIDAS · Fattore di autenticazione · HKDF · HMAC · Integrità · Marca temporale ·
Modello di minaccia · Nonce · Non ripudio · OCSP · Pepe · PKI · Preimmagine · Privilegio minimo ·
RBAC · Registro degli accessi · Relazione di cura · Revoca · Riservatezza · Rottura del vetro ·
Sale · Segretezza in avanti · Separazione dei compiti · Separazione dei domini · Sigillo
periodico · SOUP · STRIDE · Superficie di attacco · Tracciabilità · Trasparenza dei certificati ·
Vettore di inizializzazione · VEX

**Nota per il glossario bilingue**: le voci con traducente non ovvio sono
*rottura del vetro* → **break-glass**, *segretezza in avanti* → **forward secrecy**,
*separazione dei domini* → **domain separation**, *sale* → **salt**, *pepe* → **pepper**,
*sigillo periodico* → **periodic seal / checkpoint**, *distinta dei materiali software* →
**software bill of materials**, *confine di fiducia* → **trust boundary**,
*relazione di cura* → **care relationship / treatment relationship**,
*attestazione di provenienza* → **provenance attestation**.

**Sigle sciolte alla prima occorrenza nel modulo**: GDPR, AEAD, IV, KDF, HKDF, HMAC, MAC, PKI,
CA, FES, FEA, FEQ, CAD, SBOM, VEX, SOUP, STRIDE, RBAC, ABAC, CRA, NIS2, OCSP, MDR.

---

## 8. Note redazionali

- Il modulo è scritto per essere leggibile **sia da uno sviluppatore sia da un clinico**: ogni
  concetto crittografico ha un esempio del dominio, e ogni concetto sanitario (relazione di
  cura, rottura del vetro, oscuramento, referto) è spiegato a chi non l'ha mai visto.
- La tesi portante — **in sanità integrità e tracciabilità pesano quanto la riservatezza** — è
  argomentata al § 1.2 con l'ancoraggio alla severità ISO 14971 (scenario S4 «decisione clinica
  presa su informazione errata») e ripresa al § 1.6 e al § 9.
- Il § 10.6 («chi ha quale obbligo») è la tabella che il mandato chiedeva esplicitamente e che
  probabilmente è la parte più riutilizzabile del modulo per la documentazione commerciale e di
  conformità: mostra che **il progetto non ha quasi mai l'obbligo e ha quasi sempre il monopolio
  dell'informazione necessaria ad adempierlo**.
