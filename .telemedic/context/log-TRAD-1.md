# log-TRAD-1 — Traduzione integrale in inglese: sicurezza e protocolli

> **Agente**: `TRAD-1` (traduzione assistita, decisione **D56**)
> **Data**: 25 agosto 2026
> **Mandato**: `docs/06_security/` e `docs/04_protocols/` →
> `website/i18n/en/docusaurus-plugin-content-docs/current/{06_security,04_protocols}/`
> **Nomi dei file**: identici all'originale, come richiede l'accoppiamento per percorso relativo di
> Docusaurus. Le due cartelle di destinazione sono state create da questo agente: prima di questo
> lavoro `website/i18n/en/docusaurus-plugin-content-docs/current/` non conteneva alcun `.md`.
> **Inglese britannico** (`organisation`, `recognised`, `behaviour`, `minimisation`,
> `authorisation`), coerente con `htmlLang: en-GB`.

---

## 1. File tradotti

I conteggi sono quelli dell'**originale italiano**, ripresi da `log-SEC` e `log-PROTO`, che restano
la misura autoritativa: la resa inglese è, riga per riga, di ampiezza equivalente (scarto stimato
entro il ±5%, in genere leggermente in difetto perché l'inglese perde le perifrasi con «di» e
«che»). Nessun paragrafo è stato omesso, accorpato o aggiunto.

### 1.1 Area sicurezza — `06_security/`

| File | Parole (IT) |
|---|---:|
| `00-indice.md` | 1.879 |
| `01-modello-di-minaccia.md` | 4.015 |
| `02-identita-e-accessi.md` | 4.616 |
| `03-protezione-dei-dati.md` | 4.049 |
| `04-tracciamento.md` | 3.230 |
| `05-sicurezza-del-tempo-reale.md` | 3.776 |
| `06-sicurezza-applicativa.md` | 3.597 |
| `07-catena-di-fornitura.md` | 3.057 |
| `08-quadro-normativo-e-misure.md` | 3.993 |
| `09-ripartizione-delle-responsabilita.md` | 3.012 |
| `10-risposta-agli-incidenti.md` | 3.224 |
| **Totale area** | **38.448** |

### 1.2 Area protocolli — `04_protocols/`

| File | Parole (IT) |
|---|---:|
| `00-indice.md` | 865 |
| `01-principi-di-interoperabilita.md` | 4.417 |
| `02-fhir.md` | 6.472 |
| `03-documenti-clinici.md` | 4.635 |
| `04-hl7-v2.md` | 3.453 |
| `05-ihe.md` | 2.985 |
| `06-api-di-progetto.md` | 4.724 |
| `07-eventi-e-webhook.md` | 3.784 |
| `08-identita-e-autorizzazione.md` | 4.976 |
| `09-tempo-reale.md` | 2.899 |
| `10-conformita-e-prove.md` | 3.203 |
| **Totale area** | **42.413** |

**Complessivo: 80.861 parole di originale tradotte, 22 file.**

---

## 2. Frontmatter

- `title` e `description` tradotti; `sidebar_position` **mai toccato**.
- I file di `04_protocols/` avevano già `title` e `description` fra virgolette doppie: le virgolette
  sono state mantenute.
- I file di `06_security/` non avevano virgolette e **non ne hanno bisogno**: nessun valore tradotto
  contiene due punti seguiti da spazio. Verificato uno per uno. Dove il titolo italiano usava un
  trattino lungo (`Sicurezza — indice e orientamento`) l'inglese lo conserva
  (`Security — index and orientation`): l'em dash non richiede quotatura.
- Nessun altro campo di frontmatter era presente in questi 22 file.

---

## 3. Scelte terminologiche vincolanti per gli altri agenti di traduzione

Queste rese sono state adottate in modo **sistematico** e vanno riusate: una divergenza fra aree
produrrebbe, su un sito bilingue, l'equivalente inglese del problema Q-06.

### 3.1 Regolatorio e dispositivi medici

| Italiano | Inglese adottato |
|---|---|
| dispositivo medico | medical device |
| marcatura CE / appone la marcatura | CE marking / affixes the marking |
| Organismo Notificato | Notified Body |
| fabbricante | manufacturer |
| destinazione d'uso | **intended purpose** (termine MDR, non *intended use*) |
| immissione sul mercato | placing on the market |
| messa in servizio | putting into service |
| sorveglianza post-commercializzazione | post-market surveillance |
| fascicolo di gestione del rischio | risk management file |
| registro dei rischi del dispositivo | the device's risk register |
| rischio residuo | residual risk |
| controllo di rischio | risk control |
| fascicolo tecnico | technical file |

### 3.2 Sanità, ruoli, protezione dei dati

| Italiano | Inglese adottato |
|---|---|
| assistito | **patient**; *person receiving care* solo dove il testo distingue deliberatamente (una sola occorrenza, in `02-fhir.md §11`) |
| professionista sanitario | healthcare professional |
| struttura sanitaria | care provider organisation |
| azienda sanitaria locale | local health authority |
| azienda ospedaliera | hospital trust |
| presidio / unità operativa | site / operating unit |
| struttura erogante | providing organisation |
| titolare del trattamento | data controller |
| responsabile del trattamento | data processor |
| interessato | data subject |
| informativa | privacy notice |
| accordo sul trattamento | data processing agreement |
| valutazione d'impatto sulla protezione dei dati | data protection impact assessment |
| dati relativi alla salute | data concerning health (formula dell'art. 4(15) GDPR) |
| presa in carico | episode of care / taking the case on |
| équipe | care team |
| relazione di cura | care relationship |
| accesso d'emergenza | emergency access (`rottura del vetro` → break-glass, solo nei rinvii ai fondamenti) |
| caregiver | carer |

### 3.3 Fascicolo e istituti di telemedicina

- **Fascicolo Sanitario Elettronico** → *electronic health record (Fascicolo Sanitario Elettronico)*
  alla prima occorrenza per documento, poi *health record*. Usato in `06_security/02 §3.1`,
  `04_protocols/03 §1`.
- **Le quattro prestazioni**, secondo le rese già in `website/i18n/en/code.json` (`home.lead`), con
  il termine italiano fra parentesi alla prima occorrenza per documento:

| Italiano | Inglese |
|---|---|
| televisita | remote consultation (televisita) |
| teleconsulto | specialist-to-specialist consultation (teleconsulto) |
| teleassistenza | remote assistance (teleassistenza) |
| telemonitoraggio | remote monitoring (telemonitoraggio) |

> **Eccezione motivata.** In `04_protocols/` i termini compaiono spesso come **nomi propri di guide
> di implementazione HL7 Italia** (*Televisita*, *Teleconsulto*, *Teleassistenza*,
> *Telemonitoraggio*) e come **denominazioni di tipologie documentali del DM**. In quei casi il nome
> resta italiano e non corsivizzato diversamente dall'originale, con la glossa inglese in parentesi
> alla prima occorrenza della tabella (`04_protocols/01 §2`). Tradurre il nome di una guida
> pubblicata produrrebbe un riferimento non risolvibile. Lo stesso vale per `IT-Core`.
> Analogamente, in `03-documenti-clinici.md §2` i nomi delle dieci tipologie documentali conservano
> il termine italiano dove esso è **il nome della tipologia**, non una descrizione.

### 3.4 Norme, decreti e accordi italiani — regola applicata

Gli **estremi non si traducono mai**; alla prima occorrenza per documento segue una glossa inglese
fra parentesi. Forme adottate:

- `DM 19 novembre 2025` → *DM 19 novembre 2025 (the Ministerial Decree of 19 November 2025)*
- `DM 7 settembre 2023`, `DM 21 settembre 2022` → idem
- `DPCM 24 ottobre 2014` → *(the Prime Ministerial Decree of 24 October 2014)*
- `d.lgs. 4 settembre 2024, n. 138` → *(Legislative Decree no. 138 of 4 September 2024)*
- `legge 28 giugno 2024, n. 90` → *(Law no. 90 of 28 June 2024)*
- `Accordo Stato-Regioni del 17 dicembre 2020, rep. atti n. 215/CSR` →
  *(the State-Regions Agreement of 17 December 2020, act no. 215/CSR)*
- `Codice dell'Amministrazione Digitale` / `CAD` → *Codice dell'Amministrazione Digitale (the
  Italian Digital Administration Code)*, poi `CAD`
- Determinazioni dell'autorità nazionale (`n. 379907 del 19 dicembre 2025`, `n. 127437 del 13 aprile
  2026`, `n. 127434 del 13 aprile 2026`) → numero e data in inglese, con la qualifica dell'ente:
  *determination no. … of … of the national cybersecurity authority*. L'originale non nomina l'ente
  per esteso e la traduzione non lo introduce.
- `codice fiscale` → *tax code (codice fiscale)* alla prima occorrenza, poi *tax code*;
  `posta elettronica certificata` → *certified email address (posta elettronica certificata)*;
  `Tessera Sanitaria` → *national health card (Tessera Sanitaria)*;
  `Carta d'Identità Elettronica` → *electronic identity card (Carta d'Identità Elettronica, CIE)*.

### 3.5 Sicurezza — lessico tecnico stabilizzato

| Italiano | Inglese |
|---|---|
| registro immutabile | immutable audit trail |
| tracciamento (titolo cap. 04) | audit trail |
| log di tracciabilità | traceability logs |
| catena di hash / ancoraggio | hash chain / anchoring |
| conservazione separata | separate retention |
| a sola aggiunta | append-only |
| cancellazione crittografica | cryptographic erasure |
| deposito delle chiavi | key vault |
| distinta dei materiali / distinta base del software | bill of materials / software bill of materials |
| dichiarazione di esposizione | exploitability statement |
| divulgazione coordinata | coordinated disclosure |
| componenti di origine ignota | software of unknown provenance |
| mediatore unico di uscita | **single egress broker** |
| elenco consentito / lista di indirizzi vietati | allow-list / list of forbidden addresses |
| a fallimento chiuso | fail-closed |
| interfaccia di ritorno | loopback interface |
| stringa di autenticazione breve / stringa breve di verifica | short authentication string / short verification string |
| cifratura fino agli estremi | end-to-end encryption |
| segreto di esportazione | exporter secret |
| profilo sicuro (SRTP) | secure profile |
| protocollo di trasporto per il datagramma | datagram transport protocol |
| limitazione del traffico | rate limiting |
| innalzamento di livello | step-up |
| livello di garanzia | level of assurance |
| autenticazione **eseguita** vs **riferita** | authentication **performed** vs **reported** |
| livello **asserito** (V-25) | level **asserted** |
| chi installa (`D` nella tabella 09) | **the deployer** (l'iniziale `D` resta valida) |
| committente | project owner |
| capitolato / procedura di gara | tender specification / procurement procedure |
| soggetti essenziali / importanti | essential / important entities |
| misure minime PA | PA minimum measures |
| amministratore fiduciario di software libero | open-source software steward (termine del CRA) |
| struttura nazionale di risposta agli incidenti | national incident response body |
| sistema di correlazione | correlation system |
| coda di scarto / rigioco | dead-letter queue / replay |

### 3.6 Protocolli e interoperabilità

| Italiano | Inglese |
|---|---|
| documento di capacità | capability statement |
| contatto assistenziale | encounter |
| insieme di valori / sistema di codifica | value set / code system |
| legame (terminologico) | binding |
| viste complete (StructureDefinition) | snapshots |
| costruzione continua | continuous build |
| gestione stretta / permissiva | strict / lenient handling |
| raccolta (Bundle) | Bundle |
| lotto vs transazione | batch vs transaction |
| validatore debole | weak validator |
| concorrenza ottimistica | optimistic concurrency |
| dominio di attribuzione | **assigning authority** |
| riconoscimento (HL7 v2) | acknowledgement |
| presa in carico (MSH-15 / MSA CA) | accept acknowledgement |
| protocollo di incapsulamento | wrapping protocol |
| dichiarazione di integrazione | integration statement |
| descrittore dell'interfaccia applicativa | API descriptor |
| registro di uscita transazionale | transactional outbox |
| busta (CloudEvents) | envelope |
| attesa esponenziale con variazione casuale | exponential backoff with jitter |
| sfida / verificatore (PKCE) | challenge / verifier |
| area di lavoro (SMART Web Messaging) | **scratchpad** |
| suggerimento sull'intestazione dell'assistito | patient banner hint |
| documento di stile | style document |
| elenco di negazione | deny-list |
| prova di possesso applicativa / autenticazione mutua di trasporto | application-level proof of possession / mutual transport authentication |
| token portatore | bearer token |
| oscuramento programmato | scheduled brownout |
| cancelli della catena di costruzione | gates of the build chain |
| file di riferimento (test) | golden files |
| finestre di oscuramento, non-garanzie | brownout windows, non-guarantees |

### 3.7 Regole redazionali applicate

- **Identificativi mai tradotti**: `V-04`…`V-157`, `Q-04`…`Q-163`, `D19`…`D56`, `P-01`…`P-10`,
  `R-IAM-01`…`R-IAM-03`, `M-01`…`M-15`, `C-02`, `C-03`, `R13`/`R14`/`R24`/`R30`/`R33`/`R36`/`R42`…`R45`,
  `ABSC 3.5.1`, `GV.*`/`ID.*`/`PR.*`/`DE.*`/`RS.*`/`RC.*`, `ITI-1`…`ITI-106`, codici LOINC, codici v2
  (`SIU^S12`, `ADT^A04`, `MDM^T02`, `NNITA`, `100`…`207`), nomi di risorse e profili FHIR, URI, RFC.
- **`[NV]` resta `[NV]`**, con la nota tradotta.
- **Collegamenti relativi invariati** (`./01-modello-di-minaccia.md`, `../10_fondamenti/…`): il testo
  di ancoraggio è tradotto, il percorso no. Docusaurus risolve nella locale corretta.
- **Mermaid**: tradotte solo le etichette. Sintassi, frecce, `subgraph`, id dei nodi intatti. Negli
  `stateDiagram-v2` gli id di stato erano in italiano e sono anche l'etichetta visualizzata: sono
  stati tradotti (`attesa→waiting`, `negoziazione→negotiation`, `verifica→verification`,
  `attiva→active`, `ripristino→recovery`, `interrotta→aborted`, `conclusa→completed`); gli id già
  inglesi di `02-fhir.md` (`planned`, `arrived`, `in_progress`, `onleave`, `finished`, `cancelled`)
  sono **valori di codice FHIR** e restano invariati.
- **Blocchi di codice**: JSON, HTTP, YAML, HL7 v2 e i loro identificatori restano invariati. Sono
  state tradotte **solo** le stringhe destinate a un lettore umano: `title`/`detail`/`message` nei
  corpi `problem+json`, `text` negli `OperationOutcome`, `display` in una `Coding` d'esempio,
  `summary`/`description` nel frammento OpenAPI, i commenti nelle richieste HTTP d'esempio, i
  segnaposto `<…>`. **Non tradotto** il payload d'esempio HL7 v2 di `04-hl7-v2.md §4.2` e la riga
  `ERR` di `§6.3`: sono trascrizioni di un messaggio reale su rete italiana, e tradurle
  falsificherebbe l'esempio.
- **Tabelle**: intestazioni e contenuto tradotti, allineamento delle colonne (`:-:`, `---:`)
  preservato ovunque compaia.
- **Citazioni testuali di specifiche inglesi** (CloudEvents, IUA, RFC 8838) lasciate verbatim, come
  nell'originale. Le citazioni di **fonti italiane** rese in inglese fra virgolette caporali, con la
  stessa marcatura dell'originale.
- **Parole chiave normative** (`SHALL`, `SHOULD`, `MUST NOT`, `MAY`) in maiuscolo e non tradotte,
  come prescrive `04_protocols/00-indice.md`.

---

## 4. Verifica R0 e dati sintetici

- **Nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale partner** trovato
  negli originali. L'italiano usa perifrasi descrittive («il prodotto di federazione», «i tre motori
  di riferimento», «il servizio esterno di terminologia», «la terminologia clinica internazionale»,
  «uno standard statunitense di validazione dei moduli crittografici»): la traduzione le ha
  **mantenute perifrastiche**, senza mai risolverle in un nome proprio, anche dove il referente è
  ovvio a un lettore tecnico. Questo è il punto in cui una traduzione «utile» avrebbe violato R0, ed
  è stato evitato deliberatamente.
- `04_protocols/00-indice.md` dichiara che, dove una specifica internazionale contiene identificativi
  di codice coincidenti con marchi di piattaforme di videoconferenza, il fatto è riportato ma gli
  identificativi non sono trascritti. La traduzione **conserva la reticenza**
  (`02-fhir.md §4`: *«whose identifiers correspond to the names of third-party commercial
  videoconferencing platforms»*).
- Domini negli esempi: `telemedic.example`, `gestionale.integratore.example`, `ehr.example`,
  `idp.integratore.example` — invariati, sono segnaposto `.example` riservati.
- Dati di persona negli esempi (`VERDI^GIULIA`, `BIANCHI^ANNA`, `PZ-4471`, `MED-0007`) invariati e
  sintetici. Nessun segreto, nessuna chiave, nessun valore utilizzabile introdotto.

---

## 5. Ambiguità dell'originale mantenute e non risolte

Tradotte conservando l'ambiguità, come da mandato. Nessuna è stata sciolta d'iniziativa.

| # | Dove | Ambiguità | Resa scelta e perché |
|---|---|---|---|
| A-1 | `06_security/07 §7.1(a)` | «una parte dei **codici di un legame** non si valida» — `legame` può essere il *binding* terminologico FHIR o, genericamente, un collegamento | Reso `binding`, che è la lettura tecnicamente coerente con il resto del paragrafo (validazione terminologica). **Se l'autore intendeva altro, la traduzione va corretta.** |
| A-2 | `04_protocols/06 §8.3` | «identificatore pieno di una **voce di raccolta**» — `raccolta` traduce `Bundle` altrove, ma qui `voce di raccolta` potrebbe essere *collection entry* generico o *Bundle entry* FHIR | Reso *«the full identifier of a collection entry»*, che conserva l'ambiguità. Non è stato scritto `Bundle entry` perché avrebbe deciso al posto dell'autore. |
| A-3 | `06_security/05 §7.1` | «una rappresentazione del traffico costruita su di esse mostra **scalini**» | Reso *step changes*. `scalini` è metafora visiva non tecnica; l'inglese la mantiene descrittiva. |
| A-4 | `06_security/03 §5` | «architettura con **concentratore**» — non è chiarito se si intende SFU o MCU | Reso *concentrator*, letterale. Il paragrafo successivo («ricombina i flussi») suggerisce MCU ma non lo dice: la traduzione non lo dice nemmeno. |
| A-5 | `06_security/02 §3.1` | «nessun **trattamento dispositivo** su terzi» — l'aggettivo `dispositivo` in senso giuridico (che dispone di diritti) | Reso *«no operation with legal effect on third parties»*. Perifrasi necessaria: l'inglese non ha l'aggettivo, e *dispositive processing* sarebbe incomprensibile. |
| A-6 | `06_security/05 §2.3` | «per il **rimanente** lo stato non è verificabile», dopo aver enumerato «due motori su tre» e «il terzo» — l'aritmetica lascia aperto quale sia il motore residuo | Reso letteralmente (*«for the remaining one»*), ambiguità inclusa. Vedi anche §6 punto D-6. |
| A-7 | `04_protocols/09 §10`, ultima riga | «L'**ultima riga della quarta voce**» — la tabella non ha righe multiple per voce | Reso letteralmente. Probabile refuso per «l'ultima voce» o «la quarta riga»; non corretto. |

---

## 6. Difetti trovati nell'originale italiano — **segnalati, non corretti**

Tradurre è la revisione più severa che un testo riceva. Questi sono difetti **reali**, non
divergenze di gusto. La traduzione li **riproduce fedelmente**: correggerli avrebbe creato una
divergenza silenziosa fra italiano e inglese, che è peggio del difetto.

### 6.1 Rinvii incrociati sbagliati (sette occorrenze)

| # | File | Testo | Bersaglio corretto |
|---|---|---|---|
| D-1 | `06_security/00-indice.md`, riga V-153 | rinvia a `[02 §8]` per l'accesso d'emergenza | in `02-identita-e-accessi.md` l'accesso d'emergenza è **§10**; §8 è la revoca a fallimento chiuso |
| D-2 | `06_security/01 §3.1`, ultimo punto | idem: `[02 §8]` per l'accesso d'emergenza | **§10** |
| D-3 | `04_protocols/02 §6`, riga `$validate` | «Vedi **§7** per la trappola del codice di stato» | la trappola è in **§6.1**; §7 è il documento di capacità |
| D-4 | `04_protocols/03 §2`, riga `s)` | «Sì, con il limite di **§7**» per il tesserino dispositivi | il limite è in **§8.3**; §7 è versionamento e rettifica |
| D-5 | `04_protocols/08 §3`, riga «Federazione dinamica a certificati» | «Fuori perimetro v1.0, **§8**» | è trattata in **§11**; §8 sono i token |
| D-5b | `04_protocols/08 §3`, riga «Autorizzazione in contesto IHE» | «Corrispondenza documentale, **§7**» | la corrispondenza è in **§10**; §7 è l'avvio applicativo |
| D-5c | `04_protocols/08 §4.2` | «attiva l'introspezione obbligatoria di **§6**» | l'introspezione è in **§8.3** (P-10); §6 è il livello di garanzia |

### 6.2 Riferimenti a identificativi di proposta sbagliati

| # | File | Testo | Corretto |
|---|---|---|---|
| D-6 | `04_protocols/06 §4.1` | «ritenzione ventiquattro ore (proposta **P-01**…)» | la ritenzione delle chiavi di idempotenza è **P-04**; `P-01` è la posizione della versione. Il §7.1 dello stesso file cita correttamente `P-01` per la versione nel percorso |

### 6.3 Enumerazioni che non tornano

| # | File | Difetto |
|---|---|---|
| D-7 | `06_security/01 §7` | La regola dichiarata è *«ogni riga del §5 abbia almeno un requisito e almeno una prova automatica»*, ma la tabella delle prove **omette M-09** (copertura oraria dichiarata in modo difforme). Sono presenti M-01…M-08, M-10…M-15. O la riga manca, o la regola va temperata per le minacce non tecniche |
| D-8 | `04_protocols/05 §9.2` | «Ha **due** opzioni rilevanti — ruolo del soggetto, riferimento al consenso, finalità d'uso —»: annuncia due e ne elenca **tre** |

### 6.4 Coerenza terminologica interna

| # | File | Difetto |
|---|---|---|
| D-9 | `04_protocols/04 §6.3` | Il titolo dice «Un **rifiuto** applicativo» ma l'esempio usa `MSA|AE`, che è *Application Error*. Il rifiuto è `AR`. Tradotto letteralmente (*«An application rejection»* con `MSA|AE`), difetto incluso |
| D-10 | `06_security/02 §6`, elenco dei costi | «senza alcun effetto **sul obiettivo** di latenza» — errore di elisione (`sull'obiettivo`). Puramente ortografico, invisibile in traduzione, segnalato per la revisione dell'italiano |

### 6.5 Osservazione non bloccante

`06_security/09 §4.3` dichiara «**Undici** documenti richiedono l'approvazione degli organi di
amministrazione e direttivi» e l'elenco che segue ne contiene esattamente undici: **verificato,
nessun difetto**. Lo si annota perché è il tipo di enumerazione che di norma non torna, e qui torna.

---

## 7. Punti in cui la traduzione ha dovuto scegliere, e come

Non sono ambiguità dell'originale ma **asimmetrie fra le due lingue**: l'italiano ha una distinzione
che l'inglese non ha, o viceversa. Registrate perché gli altri agenti di traduzione le incontreranno.

1. **`riferito` vs `asserito`.** L'italiano li usa come termini distinti e opposti in V-154 e V-25.
   L'inglese renderebbe entrambi *asserted*, perdendo la distinzione che è il cuore del capitolo 02.
   Adottato: `riferito` → **reported**, `asserito` → **asserted**. La coppia è vincolante.
2. **`prestazione` vs `sessione`.** Vincolo V-01 separa i due aggregati. `prestazione` → **service**
   (e *service provided* dove serve disambiguare da *service* informatico); `sessione` → **session**.
   Dove `prestazione` significa l'atto singolo si è usato *episode of care* solo nel contesto
   clinico di `06_security/01 §5` (*«a missed episode of care on a care pathway»*).
3. **`chi installa`.** Reso **the deployer**, che conserva l'iniziale `D` della legenda di
   `09-ripartizione-delle-responsabilita.md` senza rifare la tabella. *Implementer* sarebbe stato
   sbagliato: chi installa non implementa.
4. **`prova`.** Copre *test*, *evidence* e *proof*. Disambiguato dal contesto: *test* per le suite
   automatiche, *evidence* per gli artefatti documentali di conformità, *proof* mai usato.
5. **`registro`.** Copre *audit trail*, *log*, *registry* e *register*. Resa: `registro immutabile`
   → *immutable audit trail*; `registro di fiducia` → *trust registry*; `registro delle immagini` →
   *image registry*; `registro delle manutenzioni` → *maintenance register*; `registri` del chiamante
   → *logs*.
6. **`rilevazione`.** In telemonitoraggio è *measurement*; in sicurezza è *detection*. Due termini
   diversi per la stessa parola italiana, disambiguati per area.

---

## 8. Che cosa questo agente **non** ha fatto

- Non ha tradotto `website/i18n/en/code.json`, `current.json`, `navbar.json`, `footer.json`: erano
  già tradotti e sono stati **usati come fonte** per le rese delle quattro prestazioni.
- Non ha toccato alcun file in `docs/`. Il lavoro è interamente additivo su
  `website/i18n/en/docusaurus-plugin-content-docs/current/`.
- Non ha eseguito la costruzione del sito: **la verifica che `docusaurus build` accetti i 22 file
  resta da fare**. I punti a rischio sono, in ordine: il frontmatter non quotato di `06_security/`
  (verificato a mano, nessun `: ` nei valori), i blocchi Mermaid con etichette riscritte, e i
  collegamenti relativi verso `../10_fondamenti/`, che **puntano a file non ancora tradotti**:
  Docusaurus ricadrà sull'originale italiano finché quell'area non sarà tradotta. È il
  comportamento atteso, non un errore, ma va conosciuto prima della pubblicazione.
- Non ha creato `_category_.json` per le due cartelle: le etichette di categoria della sidebar sono
  già tradotte in `current.json` e non richiedono file per area.
