# log-B7 — Identità digitale italiana (SPID, CIE, TS-CNS, IT-Wallet)

- **Agente**: B7 (seconda ondata)
- **Data**: 25 agosto 2026
- **Output**: `.telemedic/research/B7-identita-digitale-italiana.md`
- **Mandato**: completare la parte italiana del §3 di `R5-pattern-integrazione.md` e quantificare
  il rischio di pianificazione della decisione **D9** (SPID e CIE dentro la v1.0, scadenza
  30 novembre 2026).
- **File non toccati**: `R2-*`, `log-R2.md` (in lavorazione da altro agente).

---

## 1. La risposta principale: il rischio di pianificazione

**I tempi dell'accreditamento SPID come Service Provider non sono dichiarati pubblicamente in
nessuna fonte primaria.** Non li fissa il DPCM 24 ottobre 2014, non il Regolamento modalità
attuative (v.2), non lo schema di Convenzione per i fornitori privati, non la procedura tecnica
pubblicata su `spid.gov.it`. Gli unici termini esistenti sono **a valle** della firma:

- iscrizione nel Registro SPID **entro 10 giorni** dalla stipula (Convenzione, art. 1, c. 4);
- iscrizione degli **aggregatori entro 5 giorni** (Reg. aggregatori, Det. AgID 75/2023, art. 10, c. 2);
- caricamento delle configurazioni presso gli IdP **entro ~1 giorno lavorativo** (procedura AgID).

Tutto ciò che sta a monte — verifica del metadata, iterazioni, rilascio del certificato della PKI
di AgID (Avviso n. 23), **controfirma del Direttore di AgID** — è **senza termine dichiarato**.

**Secondo elemento, dirimente: un progetto software open source non può essere accreditato.**
Il *fornitore di servizi* ex art. 1, c. 1, lett. i) del DPCM è chi **eroga servizi in rete**; la
Convenzione impegna a comunicare ad AgID l'**elenco dei servizi attivi**, il livello di sicurezza
di ciascuno e gli attributi richiesti (Convenzione, art. 2, c. 1, lett. a-c). **Il Service Provider
è il deployer** (ASL, clinica, operatore SaaS, integratore), non Telemedic.

### Giudizio esplicito sul 30 novembre 2026

| Lettura di D9 | Giudizio |
|---|---|
| **A** — «esiste un'installazione accreditata e operativa su SPID» | **NON COMPATIBILE in modo affidabile.** Rischio alto, non quantificabile né mitigabile dal progetto: nessun termine dichiarato, due atti esterni in sequenza per i privati (certificato PKI + controfirma), fase tecnica iterativa per costruzione, nessun deployer di riferimento individuato |
| **B** — «Telemedic è SPID-ready, CIE-ready e TS-CNS-ready, con conformità verificata in CI» | **COMPATIBILE e verificabile oggettivamente** (`spid_sp_test`, `spid-saml-check`, pre-produzione CIE con carte di test) |

**Raccomandazione al committente: riformulare D9 nella lettura B**, spostando l'accreditamento
fuori dal perimetro v1.0. Testo proposto in §11.1 e §9.4 del documento. Se la riformulazione non
è accettata, l'unica mitigazione reale è **avviare oggi il procedimento presso un deployer già
individuato**, accettando che l'esito non è nelle mani del progetto.

---

## 2. Correzione vincolante al context pack

**D9 va corretta**: TS-CNS non è «da considerare», è **obbligatorio**. R3 lo ha accertato
(DM 19 novembre 2025 All. 4; DM 7 settembre 2023 art. 11, c. 1) e questo documento lo conferma:
l'art. 64 CAD elenca tre canali, non due.

Testo proposto per D9 (rev.) in §11.1 del documento.

---

## 3. Risultati verificati su fonte primaria

### 3.1 Questione Q4 di R5 — RISOLTA

I valori `acr` / `AuthnContextClassRef` sono:

```
https://www.spid.gov.it/SpidL1   ->  ISO/IEC 29115 LoA2
https://www.spid.gov.it/SpidL2   ->  ISO/IEC 29115 LoA3
https://www.spid.gov.it/SpidL3   ->  ISO/IEC 29115 LoA4
```

Fonte: *Regolamento recante le modalità attuative per la realizzazione dello SPID*, versione 2,
p. 3. **Gli stessi tre URI sono usati anche da CIE id.**

### 3.2 Quale livello per i dati sanitari

L'**Appendice A** del Regolamento modalità attuative colloca i «dati sensibili» al **livello 3**
(tabella «Classificazione dato / Tipo di accesso»), mentre la prassi FSE usa **SPID L2**.
Non è una contraddizione: l'Appendice A è **esemplificativa** («a titolo esemplificativo») e
riconosce la facoltà di criteri diversi. **Il documento AgID che associa il LoA alle categorie di
servizi omogenee non è stato reperito e va chiesto ad AgID.**

Posizione raccomandata (stima di progetto): **SpidL2** per il paziente, **L2 minimo con L3
configurabile** per il professionista che accede a dati di terzi, **L3** per l'amministrazione di
tenant. Configurabile per tenant e operazione.

### 3.3 SPID: OIDC non è utilizzabile

Le Linee Guida «OpenID Connect in SPID» e l'**Avviso n. 41 v.2 del 23/03/2023** esistono, ma sul
forum ufficiale `forum.italia.it` (cat. SPID) la transizione è descritta come «ferma al palo» e,
alla domanda su quali IdP supportino OIDC in produzione, la risposta è «**No, ufficialmente
nessuno**»; la raccomandazione è **usare SAML per SPID**. **Per CIE OIDC è invece già
utilizzabile.** Fonte pubblica non normativa, consultata il 25/08/2026: **da riverificare**.

### 3.4 Costi SPID (dato reale)

Allegato 4 alla **Determinazione AgID DT 166** (2019), modello *pay per user*, IVA esclusa:

| Utenti unici/anno/IdP | Autenticazione L1-L2 | Registrazione L1-L2 | Autenticazione L3 | Registrazione L3 |
|---|---|---|---|---|
| 0 – 1000 | 0 € | 3,5 € | 0 € | 7 € |
| > 1000 | 0,4 € | 3,5 € | 7 € | 7 € |

Franchigia dei 1000 utenti **per coppia SP/IdP**. **Chiedere un solo attributo extra-anagrafica
(es. `email`) porta ogni accesso da 0,4 € a 3,5 €**: è il più forte argomento economico per la
minimizzazione degli attributi. **Vigenza da verificare** dopo il rinnovo delle convenzioni IdP
dell'8 ottobre 2025.

### 3.5 CIE: percorso a minor attrito

- **Un solo identity provider** (contro una decina per SPID);
- **SAML2 e OIDC entrambi in produzione**;
- onboarding **interamente digitale** su `federazione.servizicie.interno.gov.it`, con **referente
  tecnico anche esterno** all'organizzazione;
- **ambiente di pre-produzione con carte di test** + SDK Android/iOS;
- attributi limitati al **Minimum eIDAS Dataset** (`name`, `familyName`, `dateOfBirth`,
  `fiscalNumber`);
- chi è già SP SPID **non ripresenta** le dichiarazioni sostitutive di onorabilità;
- **corrispettivi non dichiarati pubblicamente** (indizio strutturale a favore dell'assenza:
  manca il `ContactPerson contactType="billing"` obbligatorio invece in SPID).

**Criticità individuata**: le Regole Tecniche CIE eID SAML affermano che
l'`AuthnContextClassRef` dell'`AuthnStatement` è **sempre `https://www.spid.gov.it/SpidL3`**.
Se confermato, **il SP non può dedurre dalla risposta il livello effettivo**. Conseguenza di
design: derivare il LoA **dal livello richiesto** e registrare in audit sia `acr_requested` sia
`acr_asserted`. **Verifica empirica in pre-produzione da mettere sul percorso critico.**

### 3.6 TS-CNS: l'unico canale senza dipendenze esterne

Nessun accreditamento, nessuna convenzione, nessun metadata da far approvare: **PKI pubblica +
mutua autenticazione TLS**. Riferimento: `github.com/italia/cie-cns-apache-docker` (MIT),
Apache 2.4 + `mod_ssl`, trust store alimentato dalla **Trusted Service Status List** AgID filtrata
per `ServiceTypeIdentifier` = `http://uri.etsi.org/TrstSvc/Svctype/IdV`, aggiornamento cron
giornaliero, OCSP stapling.

**È l'unico canale ex art. 64 CAD dichiarabile completo nella v1.0 senza dipendere da terzi.**

Due trappole documentate nel documento: (a) l'host mTLS va **separato** per non imporre il prompt
del certificato a tutti gli utenti; (b) il proxy **deve azzerare** gli header `X-SSL-Client-*` in
ingresso prima di riscriverli, altrimenti chiunque può impersonare qualunque cittadino.

### 3.7 Aggregatori (Det. AgID 75/2023)

- **`light`**: l'aggregatore opera **tramite l'infrastruttura dell'aggregato** → compatibile con
  V1 e V4; **è il modello architetturalmente affine a Telemedic**;
- **`full`**: autenticazione sull'infrastruttura dell'aggregatore → **impatto su V1, materia da
  DPIA**;
- requisiti per diventare aggregatore: onorabilità di tipo bancario (art. 26 d.lgs. 385/1993) e
  **copertura assicurativa di 500.000 €/anno e 50.000 € per sinistro**. **Non è un percorso di
  prodotto**; il prodotto deve però essere *usabile* da un aggregatore in modalità `light`.
- **Per il deployer piccolo, aderire come soggetto aggregato azzera il procedimento AgID a proprio
  carico**: è la mitigazione più efficace del rischio dominante.

### 3.8 Keycloak: stato reale dell'ecosistema

| Progetto | Licenza | Stato |
|---|---|---|
| `italia/spid-keycloak-provider` | **Apache-2.0** | in produzione; `spid_sp_test` 1.2.17 **tutti i test superati** (metadata, AuthnRequest, **111 casi di Response** inclusi XSW1-XSW8) |
| `lscorcia/keycloak-cieid-provider` | **Apache-2.0** | in produzione |

Licenze **compatibili con D1** (Apache-2.0). Accoppiamento **stretto** alle versioni di Keycloak
(KC 26.x → plugin 26.7.1; il provider ID è cambiato da `spid` a `spid-saml` dalla serie 24.x).

**Tre rischi che sono di Keycloak, non del plugin** (wiki *Open issues and limitations*), da
tracciare in ISO 14971:
1. l'utente SPID **può modificare i propri dati** via `/account` o via REST;
2. le **modifiche di email non sono verificate**;
3. l'utente federato **può impostarsi una password locale**.

Contromisure obbligatorie in §7.6.4 del documento (account console disabilitata, user profile in
sola lettura, divieto di credenziali locali, mapper su `identity_provider`, test di sicurezza in CI).

### 3.9 Le 18 deviazioni SPID rispetto al SAML2 di Keycloak

Elenco completo in §7.2. Le più significative: `NameQualifier` sull'`Issuer`; divieto di
`AllowCreate`; `AttributeConsumingServiceIndex` obbligatorio; metadata con `Extensions` nel
namespace `spid` e `ContactPerson contactType="billing"` in formato FatturaPA; metadata **SP
aggregato** con un ACS per IdP e `index="0"`/`isDefault="true"`; **stabilità degli indici**
(un rinumeramento provoca `ErrorCode nr18` su tutte le autenticazioni); `SessionIndex` assente per
L2/L3; identificazione su attributo **`fiscalNumber`** e non su `NameID` (che è `transient`);
gestione dei **25 codici di anomalia** `ErrorCode nrNN` con messaggi prescritti; **ordine casuale
degli identity provider** (Linee guida interfacce, cap. 3) e pulsante ufficiale in 4 dimensioni;
certificato dalla **PKI di AgID** per i SP privati.

Tabella completa dei codici di anomalia riportata verbatim in §3.7 del documento (**il codice 24 è
"riservato"**: la tabella salta dal 23 al 25).

### 3.10 Propagazione del LoA e identity chaining

Keycloak: mappatura **ACR → LoA** in *Realm settings → Login* (attributo di realm, ACR stringa e
LoA numerico), sovrascrivibile per client ma **la mappatura di realm è la buona pratica
raccomandata**; parametro `acr_values`; claim `acr` in access token e ID token; il LoA numerico
alimenta le condizioni del flusso di autenticazione.

**Il claim `act` (RFC 8693 §4.1) NON porta il livello e non deve portarlo**: esprime la delega
(chi agisce per conto di chi). Il livello sta in `acr`, ma la sua semantica cambia con la
direzione della catena:

- **cittadino autenticato da Telemedic** → `acr` autoritativo;
- **professionista autenticato dall'IdP dell'integratore** (token exchange / JWT grant, R5 §3.3)
  → `acr` **riferito, non verificato**. Copiarlo senza qualificarlo farebbe apparire come
  verificata da Telemedic un'autenticazione mai eseguita.

*Proposta di progetto*: claim `auth_source` con `kind`, `acr_requested`, `acr_asserted`,
`verified_by_telemedic`. Regola: **le operazioni per cui la norma impone l'autenticazione forte
ex art. 64 CAD richiedono `verified_by_telemedic = true`**. Esempi di token in §7.7.3.

### 3.11 Modello a due realm → tre realm

Gli IdP in Keycloak sono **per realm**: federare sia `clinic` sia `patient` significherebbe **due
`entityID`, due metadata, due accreditamenti, due certificati**.

**Raccomandazione (ADR)**: terzo realm **`citizen-idp`** come **unico Service Provider** verso la
federazione nazionale; `clinic` e `patient` vi si federano internamente via OIDC. Dimezza la
superficie di accreditamento, concentra la conformità in un punto, ed è sostituibile con l'IdP di
un aggregatore senza toccare l'applicazione. Costo: la propagazione di `acr` attraverso il
brokering **non è automatica** e va implementata e testata.

### 3.12 IT-Wallet / eIDAS 2.0

Regolamento (UE) 2024/1183 in vigore dal 20 maggio 2024; wallet certificato in ogni Stato membro
**entro il 24 dicembre 2026**. In Italia: art. 64-quater CAD (d.l. 19/2024 conv. l. 56/2024);
PagoPA gestisce il wallet pubblico via app IO, IPZS fornisce le attestazioni, AgID accredita i
wallet provider privati, ACN definisce i requisiti di sicurezza. **I decreti attuativi risultano
pendenti** (fonte secondaria, da verificare).

**Fuori dalla v1.0.** Non è un nuovo identity provider ma un **cambio di paradigma** verso il
modello *issuer/holder/verifier*: si anticipano i requisiti (astrazione dell'identità nel nucleo,
campo di audit sull'attestazione, tolleranza a set di attributi variabili) senza implementare
nulla. ADR di predisposizione.

**Contesto strategico (comunicato AgID 8 ottobre 2025):** 96 milioni di identità (55 mln CIE,
41 mln SPID), 9 mln di credenziali CIE attivate, 6,4 mln di utenti IT-Wallet. **Le convenzioni
SPID sono state rinnovate per 2 anni, prorogabili fino a 36 mesi**, come misura di continuità nel
percorso di consolidamento verso CIE e IT-Wallet. → **investire su CIE con priorità superiore a
SPID.**

---

## 4. Raccomandazione sull'ordine di implementazione

**Criterio d'ordine: non il valore per l'utente, ma il rischio esterno assunto e la capacità di
falsificare presto le ipotesi sbagliate.**

**Fase 0 — dal giorno 1, in parallelo**: inviare ad AgID e al Ministero le richieste sui dati non
dichiarati (§9.2 del documento); avviare, se esiste un deployer, la richiesta di adesione CIE;
**verificare empiricamente** che l'`AuthnContextClassRef` di ritorno CIE sia sempre `SpidL3`;
verificare se Keycloak inoltri `acr_values` attraverso il brokering OIDC.

**Fase 1 — fondamenta**: L1 realm broker `citizen-idp` → L6 contromisure ai difetti di Keycloak
(**prima** di collegare un IdP reale) → L4 **TS-CNS** (parallelizzabile, competenze diverse, unico
canale completabile al 100%).

**Fase 2**: L2 **CIE id** (un solo IdP, OIDC, pre-produzione con carte di test) → L5
**propagazione del LoA** (il lotto sistematicamente sottovalutato: se il `RequestedAuthnContext`
del provider SPID è statico per IdP, servono **due istanze di IdP per ciascun IdP SPID**, una per
livello).

**Fase 3**: L3 **SPID** — il lotto più oneroso (N IdP dal Registro, metadata aggregato con indici
stabili verificati in CI, 25 codici di anomalia, ordine casuale degli IdP, pulsante ufficiale,
validazione con `spid-saml-check` e `spid_sp_test`).

**Fase 4**: L7 documentazione di accreditamento per i tre percorsi (diretto / aggregato /
aggregatore) + ADR IT-Wallet.

**14 criteri di accettazione** verificabili (A1-A14) in §11.4 del documento. I più facili da
omettere e più dannosi: **A7** (header injection sul percorso mTLS), **A8** (utente federato non
modificabile né dotabile di password locale), **A11** (diff del metadata in CI).

---

## 5. Questioni aperte prodotte

**Da chiedere alle autorità (B7-1 … B7-8)**: tempi SPID e CIE; vigenza della tabella dei
corrispettivi DT 166; periodo di adesione minima verso gli IdP; documento AgID sul LoA per
categoria di servizi; esistenza di corrispettivi CIE; conferma sull'`AuthnContextClassRef` CIE.

**Da verificare tecnicamente (B7-9 … B7-17)**: inoltro di `acr_values` nel brokering Keycloak;
`RequestedAuthnContext` dinamico o statico; nomi esatti delle chiavi di configurazione dei
provider; URL corrente della Trusted List; formato del `fiscalNumber` (prefisso `TINIT-`?);
Single Logout CIE; stato di `redhat-italy/keycloak-spid-provider`; elenco corrente degli IdP SPID
(**da leggere dal Registro, mai cablare**); date del Regolamento 2024/1183 sul testo.

**Per gli altri agenti**: architettura (ADR realm broker; astrazione dell'identità; la versione di
Keycloak è **la stessa decisione** della questione Q1 di R5), sicurezza (threat model dei tre
canali; DPIA su OCSP e su aggregatore `full`; retention 24 mesi), conformità (SOUP IEC 62304 per
i due provider e il template Apache, con sorveglianza **anche degli avvisi AgID**; i tre difetti
Keycloak in ISO 14971), roadmap (i 7 lotti; **la riformulazione di D9 è input al piano, non suo
esito**), documentazione funzionale (i due percorsi di identità vanno tenuti separati;
configurabilità per tenant come requisito funzionale), accessibilità (prompt del certificato;
messaggi delle anomalie da rendere accessibili **senza alterarne il testo**).

---

## 6. Nota di metodo

Tutti i tempi e i costi riportati provengono da fonte primaria citata con estremi. **Dove il dato
non esiste, il documento scrive «non dichiarato pubblicamente» e indica il destinatario della
richiesta.** Nessun tempo burocratico è stato stimato: la conclusione operativa è che **un
procedimento privo di termine dichiarato non è pianificabile**, e che la mitigazione corretta è
strutturale (togliere l'accreditamento dal percorso critico), non numerica.
