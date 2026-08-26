# log-R5 - Pattern di integrazione

**Agente**: R5
**Data**: 2026-08-25
**Mandato**: ricerca di riferimento sui pattern di integrazione richiesti dalla decisione **D4**
(REST+FHIR+webhook, embed white-label, SDK Java/TS, HL7 v2 + SMART on FHIR + IHE).

## 1. Output prodotto

| File | Contenuto |
|---|---|
| `/home/federicocalo/Scrivania/prj/Telemedic/.telemedic/research/R5-pattern-integrazione.md` | Documento di ricerca completo, 13 sezioni, in italiano, con esempi di codice e payload, sezioni «quando NON usarlo» per ogni pattern, matrice decisionale e riferimenti normativi |
| `/home/federicocalo/Scrivania/prj/Telemedic/.telemedic/context/log-R5.md` | Questo riepilogo |

Struttura del documento: 1 panorama · 2 SMART on FHIR · 3 OAuth 2.x/OIDC (focus RFC 8693) ·
4 webhook e `Subscription` · 5 REST+FHIR affiancate · 6 embed white-label · 7 SDK ·
8 HL7 v2 · 9 IHE · 10 estensibilità · 11 matrice decisionale · 12 riferimenti · 13 questioni aperte.

Regola **R0** rispettata: nessun nome di azienda, marchio, prodotto commerciale o dominio di
potenziale partner. Sono citati solo progetti open source e standard come dipendenze tecniche.

## 2. Fatti chiave accertati su fonte primaria

### SMART on FHIR
- **PKCE `S256` è obbligatorio** e `plain` è vietato per specifica (più stringente di RFC 7636);
  allineato a RFC 9700 §2.1.1.
- Il launch context della token response contiene `patient`, `encounter`, `fhirContext`,
  `need_patient_banner`, `intent`, `smart_style_url`, `tenant`. Tre di questi risolvono requisiti
  del brief senza estensioni proprietarie: `need_patient_banner` (doppia intestazione
  nell'embed), `smart_style_url` (**meccanismo standard di white-label**), `tenant` (vincolo V4).
- Scope v2 `.cruds` con ordine obbligatorio delle lettere; conversione v1→v2 definita dalla
  specifica (`.read`→`.rs`, `.write`→`.cud`, `.*`→`.cruds`). Estensioni proprietarie ammesse in
  forma URI o con prefisso `__`.
- **Il `CapabilityStatement` è deprecato come canale di scoperta degli endpoint OAuth**:
  la fonte è `/.well-known/smart-configuration`.
- Backend Services: `grant_type=client_credentials` +
  `client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer`,
  `expires_in` raccomandato **300 s**, algoritmi obbligatori **RS384/ES384**, `exp` del JWT
  ≤ 5 minuti, **JWKS via URL fortemente preferito** al JWK Set statico.

### OAuth / identità federata (il punto commercialmente più critico)
- RFC 8693: parametri, URN dei token type, claim **`act`** (§4.1) e distinzione normativa
  **delega vs impersonificazione** (§1.1). Raccomandazione: **sempre delega**, perché
  l'impersonificazione rende irrisolvibile la domanda «quale sistema ha agito per conto di chi»,
  incompatibile con V5 e con l'audit MDR.
- **RFC 7523 ha due usi distinti** con `grant_type` diversi (§2.1 authorization grant con
  `assertion`; §2.2 client authentication con `client_assertion`). Confonderli è l'errore di
  lettura più comune.
- **Stato Keycloak (rischio di pianificazione)**: la 26.2 ha reso GA lo Standard Token Exchange
  conforme a RFC 8693 ma **solo internal-internal**; l'external-to-internal era indicato come
  lavoro successivo. La 26.5 ha introdotto **in preview** il JWT Authorization Grant
  (RFC 7523 §2.1, `grant_type=…:jwt-bearer`, parametro `assertion`), che combinato col token
  exchange realizza l'**identity chaining** cross-dominio in due passi.
- RFC 9700: implicit e ROPC vietati, matching esatto dei redirect URI, refresh token dei client
  pubblici sender-constrained o a rotazione, `iss` di RFC 9207 contro il mix-up.
- DPoP (RFC 9449) e mTLS (RFC 8705) documentati con claim esatti (`htm`, `htu`, `ath`, `jti`,
  `cnf.jkt`; `cnf.x5t#S256`, `mtls_endpoint_aliases`).
- **UDAP è fuori perimetro v1.0** (richiesto nell'ecosistema US, non nel mercato di riferimento),
  ma il meccanismo va tenuto inseribile.

### Webhook
- **Il webhook è una richiesta uscente verso un URL fornito dall'utente**: 12 mitigazioni SSRF
  elencate, con l'avvertenza che **le mitigazioni applicative sono difesa in profondità e la
  difesa principale è di rete** (egress firewall/proxy).
- **RFC 9421 (HTTP Message Signatures, feb 2024)** esiste ed è l'alternativa standard all'HMAC
  proprietario. L'HMAC **non dà non-ripudio** (segreto condiviso): rilevante per il settore
  pubblico.
- `Idempotency-Key` e gli header `RateLimit`/`RateLimit-Policy` sono **Internet-Draft, non RFC**.
  Il draft ratelimit corrente definisce **due** campi, non i tre header legacy.
- **FHIR R4 `Subscription` classico ha limiti strutturali**: i criteri si applicano al *nuovo*
  valore, quindi delete e uscite dal criterio non notificano; nessun heartbeat, nessun
  rilevamento dei buchi, nessuna firma; HL7 dichiara aspetti irrisolti nella specifica stessa.
  → **Non implementarlo.** Usare il **backport topic-based** (`eventNumber`,
  `eventsSinceSubscriptionStart`, `$status`, `$events`, `payload-content` `empty`/`id-only`/
  `full-resource`).

### Embed
- **Regola delle due condizioni** per i permessi media in iframe cross-origin: la feature deve
  essere consentita **sia** nell'header `Permissions-Policy` del documento ospitante **sia**
  nell'attributo `allow` dell'iframe. L'`allow` restringe, non concede.
- `display-capture` è una feature **separata** da `camera`/`microphone`.
- `allow` senza allowlist equivale a `'src'`: **un redirect cross-origin dentro l'iframe fa
  perdere il permesso** → l'embed non deve mai fare redirect, il token va consegnato
  back-channel.
- `frame-ancestors` non ha fallback su `default-src`, non funziona nel `<meta>`, ed è verificato
  su **ogni antenato**. `X-Frame-Options` non può esprimere N origini → inadatto al multi-tenant.
- **Cookie di terze parti (rischio concreto)**: Chrome non ha completato la deprecazione
  (inversione 2024, ritiro Privacy Sandbox ott. 2025, rimozione API prevista ~Chrome 150 luglio
  2026); ma **Safari e Firefox bloccano/partizionano da anni** e CHIPS è Baseline solo da
  dicembre 2025. → **Progettare l'embed senza cookie** (strategia A), CHIPS solo per stato non
  essenziale, **Storage Access API esclusa dalla v1.0** (richiede gesto utente e prompt).

### SDK, HL7 v2, IHE
- HAPI FHIR: `FhirContext` costoso e thread-safe (una istanza per applicazione), client generico
  fluent vs annotato; `BearerTokenAuthInterceptor` prende un token **statico** → serve un
  interceptor proprio con refresh e serializzazione dei refresh concorrenti.
- MLLP: `0x0B` start, `0x1C 0x0D` end, segmenti separati da `<CR>` (non `\n`).
- v2-to-FHIR IG: v1.0.0 STU 1, maturity 1 → riferimento normativo, non implementazione.
- Transazioni IHE verificate: MHD ITI-65/66/67/68/105/106; PIXm ITI-83/104; PDQm ITI-78/119;
  ATNA ITI-19/20 (con TLS Syslog RFC 5424 e schema DICOM PS3.15 Annex A.5); XUA ITI-40;
  IUA ITI-71/72/102/103. **IUA dichiara di non basarsi su SMART**: stessa implementazione OAuth,
  documentazione di conformità diversa.

## 3. Raccomandazioni prioritarie

1. **Prototipare subito l'identità federata (blocco 6 della roadmap in §11.5).** È il requisito
   commercialmente decisivo (§6.2.2 del brief) e dipende da una feature Keycloak in preview.
   Un prototipo precoce evita una scoperta tardiva. **Non dichiarare GA una funzionalità che
   poggia su una feature in preview** (requisito IEC 62304).
2. **Usare sempre la delega (claim `act`), mai l'impersonificazione.**
3. **Architettura di embed senza cookie**, verificata da un test E2E dedicato in CI:
   «l'embed funziona con tutti i cookie di terze parti bloccati». Chiude strutturalmente una
   classe intera di difetti intermittenti.
4. **Due piani di API, un solo modello di dominio.** FHIR per il clinico, REST `/v1` per le
   capacità di prodotto. Regola di partizione esplicita. **Le metriche WebRTC non sono
   `Observation`** (inquinano la cartella clinica e spostano il confine MDR, vincolo V2).
5. **Design-first**: `openapi.yaml` 3.1 scritto a mano come fonte di verità, con gate CI di diff
   di compatibilità. Non generare lo spec dalle annotazioni.
6. **Webhook `id-only`**: nessun dato clinico nel payload, mai. Riferimenti + fetch autenticato.
7. **Mitigazioni SSRF di rete** (egress firewall/proxy dedicato) prima ancora di quelle
   applicative.
8. **Web Component solo come wrapper dell'iframe**, mai come applicazione in-process per la
   stanza clinica: il token non deve stare nel realm JS dell'integratore.
9. **Plugin in-process vietati nel SaaS multi-tenant**; ammessi solo on-premise single-tenant.
10. **Non implementare la `Subscription` R4 classica**; non implementare UDAP né XUA in v1.0.
11. **ATNA raccomandato** (mTLS ITI-19 + TLS Syslog ITI-20, mai UDP Syslog): rende l'audit non
    ripudiabile *rispetto al fornitore*, non solo verso l'utente.
12. **Policy di deprecazione pubblicata** con brownout programmati e ≥ 12 mesi di preavviso;
    elenco esplicito di ciò che NON è coperto dalla garanzia di stabilità.

## 4. Questioni aperte per gli altri agenti

| # | Questione | Destinatario |
|---|---|---|
| Q1 | Versione di Keycloak adottata; disponibilità reale dell'external-to-internal token exchange e stato GA del JWT Authorization Grant. **Blocca la modalità primaria dello scenario integratore-con-IAM** | Architettura, roadmap |
| Q2 | Token opachi + phantom token al gateway, o JWT autoportanti? Impatto su latenza e topologia | Architettura |
| Q3 | `system` canonico del codice fiscale nei profili FHIR italiani (usato `http://hl7.it/sid/codiceFiscale`, **non verificato**) | Dominio sanitario |
| Q4 | Mappatura `acr` ↔ livelli SPID L1/L2/L3 (**non verificata**) | Identità digitale |
| Q5 | Dettagli di FHIR Bulk Data `$export`: recupero della fonte primaria fallito in questa ricerca | Chi implementa l'export |
| Q6 | Conformità dell'esempio `SIU^S12` alla struttura v2.5.1 (**non verificata**) | Adapter HL7 v2 |
| Q7 | Header `Deprecation`: RFC o ancora draft? (`Sunset` è RFC 8594, verificato) | Policy di deprecazione |
| Q8 | Nomi esatti degli header `ce-*` del binding HTTP CloudEvents binary (**non verificati**) | Dispatcher eventi |
| Q9 | `scratchpad.read` è un `messageType` valido nella versione corrente di SMART Web Messaging? | Web Messaging |
| Q10 | Stato di manutenzione di `fhir.js` (**non verificato**) | SDK TypeScript |
| Q11 | Pattern IHE BALP per gli audit RESTful (**non verificati**) | Sicurezza / audit |
| Q12 | Il modello «senza cookie» è compatibile con tutti i requisiti di sessione della UI? | Frontend, architettura |
| Q13 | Versione esatta dell'IG Subscriptions Backport da citare nei profili | Subscription |

## 5. Dipendenze verso altri agenti

- **Architettura**: ADR richiesti su (a) formato dei token, (b) meccanismo primario di identità
  federata, (c) canale primario di notifica, (d) confine dei due piani API.
- **Sicurezza**: revisione delle mitigazioni SSRF (§4.4), della CSP dell'embed (§6.3) e della
  postura OAuth (§3.1); threat model STRIDE sul canale webhook e sull'embed.
- **Frontend**: fattibilità dell'embed senza cookie e del token handoff monouso via `postMessage`;
  contratto chiuso delle CSS custom properties e verifica server-side del contrasto WCAG.
- **Dominio sanitario**: `system` degli identificatori italiani; profili FHIR; mapping v2↔FHIR.
- **Compliance/MDR**: conferma che i punti di estensione non tocchino percorsi validati
  IEC 62366-1; gestione della dipendenza da feature in preview (IEC 62304).
- **Roadmap**: ordine di implementazione proposto in §11.5 del documento (12 blocchi).
