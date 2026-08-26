# Glossario di traduzione IT→EN - rese aggiunte dopo la prima ondata

> **Base vincolante**: `.telemedic/context/log-TRAD-1.md` §3 (rese sistematiche della prima ondata) e
> §7 (asimmetrie fra le due lingue). Questo file **non la sostituisce**: la estende.
> **Mandato operativo**: `.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`.

Ogni agente di traduzione legge questo file **prima** di aprire il sorgente e vi riversa **dopo** le
rese nuove che ha dovuto introdurre. Una resa che compare qui è vincolante come quelle di
`log-TRAD-1.md`: su un sito bilingue due traduzioni dello stesso termine in due aree diverse sono
l'equivalente inglese del problema Q-06.

> **Convenzione di numerazione, fissata il 26 agosto 2026.** Le sezioni **da 1 a 8** sono la base
> comune, scritta dall'orchestrazione. I blocchi successivi sono contributi di singoli agenti e si
> intitolano **`Modulo NN - …`**, senza numero progressivo: il blocco si identifica **dalla fonte,
> non dalla posizione**. La ragione è pratica: più agenti scrivono in parallelo su questo file e la
> numerazione progressiva collide - è già accaduto, con tre sezioni `## 9` e due `## 10`. Chi
> aggiunge un blocco usa il numero del modulo che ha tradotto e non tocca i blocchi altrui.

Convenzione: dove una resa è stata **scelta contro** un'alternativa plausibile, l'alternativa
scartata è indicata. Serve a impedire che un agente successivo la reintroduca credendo di migliorare.

---

## 1. Clinica - ragionamento, esame, decorso

*Fonte: `TRAD-3b`, `10_fondamenti/09-fondamenti-clinici.md` §9 e glossario di modulo.*

| Italiano | Inglese | Nota |
|---|---|---|
| omeostasi | homeostasis | |
| compenso / scompenso | compensation / decompensation | |
| segno / sintomo | sign / symptom | distinzione portante del modulo |
| sindrome | syndrome | |
| anamnesi | history taking | |
| anamnesi patologica remota / prossima | past medical history / history of the present complaint | |
| esame obiettivo | physical examination | |
| ispezione, palpazione, percussione, auscultazione | inspection, palpation, percussion, auscultation | |
| sospetto diagnostico / quesito diagnostico | suspected diagnosis / diagnostic question | |
| diagnosi differenziale | differential diagnosis | |
| prognosi | prognosis | |
| follow-up | follow-up | invariato |
| tendenza | trend | |
| variabilità circadiana | circadian variability | |
| intervallo di riferimento | reference range | |
| valore critico | critical value | |
| prevalenza / sensibilità / specificità | prevalence / sensitivity / specificity | |
| valore predittivo positivo / negativo | positive / negative predictive value | |
| rapporto di verosimiglianza | likelihood ratio | |
| quota a priori | prior odds | |
| desensibilizzazione all'allarme | alarm desensitisation | |

## 2. Clinica - parametri, farmaci, misure

| Italiano | Inglese |
|---|---|
| portata cardiaca / gittata sistolica | cardiac output / stroke volume |
| pressione arteriosa media | mean arterial pressure |
| pressione differenziale | pulse pressure |
| deficit di polso | pulse deficit |
| indice di perfusione | perfusion index |
| curva di dissociazione dell'emoglobina | haemoglobin dissociation curve |
| peso secco | dry weight |
| ipoglicemia / iperglicemia | hypoglycaemia / hyperglycaemia |
| glicemia a digiuno / post-prandiale | fasting / post-prandial blood glucose |
| emoglobina glicata | glycated haemoglobin |
| principio attivo / medicinale | active substance / medicinal product |
| posologia | dosage |
| aderenza terapeutica | treatment adherence |
| riconciliazione terapeutica | medication reconciliation |

## 3. Sigle italiane - pattern obbligatorio

**Sigla italiana invariata + scioglimento italiano + glossa inglese fra parentesi.** La sigla è
spesso l'oggetto stesso della spiegazione: tradurla distrugge il passaggio. Il pattern è già in uso
nel glossario tradotto di `01-sistema-sanitario-italiano.md` (`MMG` → *Medico di medicina generale,
the general practitioner*) e va riusato ovunque.

| Sigla | Reso come |
|---|---|
| PA / FC / FR | Pressione arteriosa (arterial blood pressure) / Frequenza cardiaca (heart rate) / Frequenza respiratoria (respiratory rate) |
| TC | Temperatura corporea (body temperature); e, nell'altra accezione, tomografia computerizzata (computed tomography) |
| EO / DD / ECG | Esame obiettivo (physical examination) / Diagnosi differenziale (differential diagnosis) / Elettrocardiogramma (electrocardiogram) |
| APR / APP | Anamnesi patologica remota / prossima (past medical history / history of the present complaint) |
| BPCO | Broncopneumopatia cronica ostruttiva (chronic obstructive pulmonary disease) |
| IMA / FA / TAO | Infarto miocardico acuto (acute myocardial infarction) / Fibrillazione atriale (atrial fibrillation) / Terapia anticoagulante orale (oral anticoagulant therapy) |
| PRI | Progetto riabilitativo individuale (individual rehabilitation plan) |
| PAI / PDTA / MMG / PLS / UDI | rese già fissate nei moduli 01 e 02: **riusare identiche** |
| SpO₂ / SaO₂ | peripheral / arterial oxygen saturation - sigle internazionali, nessuna glossa italiana |

## 4. Morfemi medici - termine tecnico inglese, mai il calco

`-ite→-itis`, `-osi→-osis`, `-patia→-pathy`, `-emia→-aemia`, `-megalia→-megaly`, `-scopia→-scopy`,
`-grafia→-graphy`, `-gramma→-gram`, `-metria→-metry`, `-tomia→-tomy`, `-ectomia→-ectomy`,
`-stomia→-stomy`, `-plastica→-plasty`, `-genesi→-genesis`, `-lisi→-lysis`, `-citosi→-cytosis`,
`-paresi→-paresis`, `-fagia→-phagia`, `-stasi→-stasis`, `-pnea→-pnoea`.

**Ortografia britannica sistematica**, coerente con `htmlLang: en-GB`: `anaemia`, `haematoma`,
`haemostasis`, `haemolysis`, `bacteraemia`, `haematuria`, `dyspnoea`, `apnoea`, `eupnoea`,
`tachypnoea`, `leucopenia`, `leucocytosis`, `oesophag-`, `appendicectomy`.

`ecografia` → **ultrasonography**, non *ultrasound*: serve la desinenza `-graphy` a reggere
l'esempio morfologico.

## 5. Regolatorio - valutazione clinica ed evidenza

*Fonte: `TRAD-5b`, `08_compliance/07-valutazione-clinica.md` §4–§9.*

| Italiano | Inglese | Nota |
|---|---|---|
| valutazione clinica | clinical evaluation | |
| dati clinici / evidenza clinica / beneficio clinico | clinical data / clinical evidence / clinical benefit | terna MDR, **mai intercambiabili** |
| dossier dello stato dell'arte | state-of-the-art dossier | attributivo con trattini; predicativo `state of the art` |
| ricerca sistematica (della letteratura) | systematic (literature) search | |
| valutazione critica | critical appraisal | termine di metodo, **non** *critical evaluation* |
| criteri di inclusione ed esclusione | inclusion and exclusion criteria | |
| diagramma di selezione | selection diagram | |
| valutatore qualificato | qualified assessor | distinto da `redattore` → *writer* |
| dichiarazione di assenza di conflitto di interessi | declaration of absence of conflict of interests | |
| seguito clinico post-commercializzazione | post-market clinical follow-up | `piano di seguito clinico` → *clinical follow-up plan* |
| dispositivo di confronto | comparator device | resa R0-sicura: non identifica nessuno |
| rivendicazione di equivalenza | claim of equivalence | |
| parti applicate | applied parts | |
| modalità di erogazione | mode of delivery | |
| ciclo di non conformità / ciclo di quesiti | non-conformity cycle / round of questions | due cose diverse, **non unificare** |
| requisiti generali di sicurezza e prestazione | general safety and performance requirements | |
| via d'uscita apparente | apparent way out | |
| grandezza (metrica del seguito) | quantity | **non** *metric*, **non** *magnitude* |
| **rapporto periodico di aggiornamento sulla sicurezza** | **periodic safety update report** | **Decisione del 26 agosto 2026 (difetto C-7)**: la forma lunga è l'unica ammessa, in entrambe le lingue. Allineati `08_compliance/07`, `08` - testo e `description` del frontmatter - e `09 §8.4`. La forma breve `rapporto periodico sulla sicurezza` non è più nel corpus |
| conferenza permanente / atti nazionali | the standing conference / national instruments | resa deliberatamente generica: l'originale non nomina l'organo per esteso e la traduzione non lo introduce |

## 6. Rese allineate ad aree già tradotte - vincolanti

Non sono nuove: sono rese già presenti nei file inglesi di `01_technical`, `05`, `06_security` e
`04_protocols`, che un agente disattento reintrodurrebbe diversamente.

| Italiano | Inglese |
|---|---|
| esito tipizzato / mancata presentazione | typed outcome / non-attendance |
| ripiego in presenza | fallback to attendance in person |
| valutazione di eseguibilità | executability assessment |
| attesa di rilevazione | measurement expectation |
| copertura oraria | service hours |
| errore di associazione | association error |
| sistema di origine | system of origin |
| installazione (presso terzi) | deployment (at third parties) |

---

## 7. Perdite di traduzione dichiarate

Casi in cui un'ambiguità o una distinzione dell'italiano **non è conservabile** in inglese. Si
registrano perché sono perdite reali, non sviste, e perché un revisore che le incontri non deve
riaprirle come difetti.

| Dove | Che cosa si perde |
|---|---|
| `10_fondamenti/09` §9.3, voce `oss(i)-` | In italiano la radice dell'ossigeno, `oss(i)-`, è graficamente vicina a `osseo` e alla radice `oste(o)-` che la stessa tabella registra per l'osso: chi legge deve disambiguare dal contesto. L'inglese `ox(y)-` non ha quella vicinanza. È un fatto della lingua italiana e sparisce necessariamente. **Nota aggiornata il 26 agosto 2026**: la voce italiana era `osse-, ossi-` e la perdita dichiarata era la collisione di due radici in una; ora le due tabelle hanno la stessa struttura e resta la sola vicinanza grafica |
| `10_fondamenti/09` §9.2, coppia `sub-, sotto-` | Esiste solo perché l'italiano ha la forma dotta e quella volgare. Reso `**sub-** (in Italian also *sotto-*)`: non si inventa un `under-` che in inglese medico non esiste, e non si sopprime il secondo elemento |
| `10_fondamenti/10`, ovunque | **`sicurezza` copre sia *safety* sia *security*.** L'italiano usa una parola sola dove l'inglese ne ha due, e il modulo 10 sfrutta la sovrapposizione senza mai dichiararla: «requisito di sicurezza», «evento di sicurezza», «indicatore di sicurezza» sono tutti *safety*, ma il lettore italiano non ha modo di saperlo dal solo termine. La resa inglese **disambigua obbligatoriamente**, e con ciò rende esplicita una scelta che l'originale lascia implicita. È una perdita di ambiguità inevitabile: la traduzione non può scrivere una parola che significhi entrambe le cose. Criterio applicato in §10 qui sotto |

## 8. Convenzioni di forma stabilizzate

- **Separatore decimale**: le cifre italiane con la virgola si rendono con il punto (`15,4%` →
  `15.4%`), coerentemente con quanto già fatto nei moduli tradotti. **È l'unica conversione
  numerica ammessa**: le unità di misura non si convertono mai e i valori non si arrotondano.
- **Ordine dei glossari di modulo**: resta l'ordine alfabetico **italiano** dell'originale, come nei
  moduli 03, 04 e 15 già tradotti. Riordinare alfabeticamente in inglese romperebbe il confronto
  riga a riga fra le due lingue.
- **Conteggi strutturali**: prima di consegnare, si verifica che il numero di righe di tabella, di
  voci di elenco e di titoli coincida con l'originale. È il controllo che intercetta il riassunto
  involontario.

---

## Modulo 12 - Crittografia: primitive, chiavi, firma, PKI

*Fonte: `TRAD-14`, `10_fondamenti/12-crittografia-e-sicurezza.md`. Il modulo è il gemello didattico
di `06_security/`: le rese qui elencate **estendono** `log-TRAD-1.md §3.5` e non la contraddicono.*

| Italiano | Inglese | Nota |
|---|---|---|
| testo in chiaro / testo cifrato | plaintext / ciphertext | la glossa inglese dell'originale si assorbe |
| cifrario | cipher | |
| cifrario a blocchi / a flusso | block cipher / stream cipher | |
| flusso di chiave | keystream | |
| or esclusivo | exclusive or | |
| modalità operativa | mode of operation | |
| cifratura autenticata con dati associati | authenticated encryption with associated data | AEAD invariato |
| dati associati | associated data | |
| vettore di inizializzazione | initialisation vector | ortografia britannica; la sigla **IV** resta |
| nonce | nonce | invariato |
| costruzioni resistenti al riuso del nonce | nonce-misuse-resistant constructions | |
| funzione di derivazione di chiave | key derivation function | |
| separazione dei domini | domain separation | |
| chiave di cifratura dei dati / delle chiavi | data encryption key / key encryption key | |
| avvolgimento e svolgimento | wrapping and unwrapping | operazioni sulle chiavi |
| **deposito delle chiavi** | **key vault** | Il componente che detiene il materiale di chiave ed esegue avvolgimento e svolgimento senza mai esporre la chiave. **Decisione del 26 agosto 2026 (difetto V-2)**: `custode delle chiavi` era un secondo nome per lo stesso componente ed è stato ritirato dal corpus. La distinzione da conservare è un'altra - quella fra **il componente e la persona**: dove il referente è umano (separazione dei compiti, amministratore della base dati) l'italiano dice `chi custodisce le chiavi` → *whoever holds the keys*, mai `deposito` |
| prodotto di federazione | identity federation product | Perifrasi vincolante R0 per il componente che emette e valida i token: mai un nome di prodotto. Forma breve ammessa dopo la prima occorrenza: *federation product*. Ritirati `servizio di identità` e `componente di gestione delle identità` come nomi del prodotto; `servizio di identità` resta ammesso per il **ruolo architetturale** nelle mappe dei confini di fiducia |
| custode di segreti | secrets custodian | |
| generatore di numeri pseudocasuali crittograficamente sicuro | cryptographically secure pseudorandom number generator | |
| **impronta** (valore di hash) | **digest** | coerente con `06_security/04` EN («export with a digest») |
| **impronta** (di certificato) | **fingerprint** | coerente con `10_fondamenti/08` EN; **non unificare con il precedente** |
| catena di impronte | hash chain | già fissato in log-TRAD-1 §3.5 |
| anello della catena | link of the chain | |
| ancora (iniziale) | (initial) anchor | `ancoraggio` → *anchoring* resta |
| sigillo periodico | periodic seal | |
| incatenare a lotti | chaining in batches | |
| effetto valanga | avalanche effect | |
| resistenza alla preimmagine / seconda preimmagine / collisioni | preimage / second preimage / collision resistance | |
| sale / pepe | salt / pepper | |
| codice di autenticazione del messaggio | message authentication code | HMAC invariato |
| a tempo costante | constant-time | |
| scambio di chiavi | key exchange | |
| segretezza in avanti | forward secrecy | |
| attacco dell'intermediario | man-in-the-middle attack | resa già usata in `10_fondamenti/08` EN |
| cifratura ibrida | hybrid encryption | |
| attacchi a canale laterale | side-channel attacks | |
| agilità crittografica | cryptographic agility | |
| «raccogli ora, decifra dopo» | «harvest now, decrypt later» | |
| catena di fiducia | chain of trust | |
| radice di fiducia | trust anchor | |
| archivio dei certificati fidati / archivio di fiducia | trusted certificate store / trust store | |
| certificato finale | leaf certificate | l'id di nodo `LEAF` del diagramma conferma la lettura |
| autorità di certificazione | certification authority | |
| infrastruttura a chiave pubblica | public key infrastructure | |
| trasparenza dei certificati | certificate transparency | |
| liste di revoca | revocation lists | |
| pinzatura (della risposta di revoca) | stapling | |
| **fallire in chiusura / in apertura** | **failing closed / failing open** | forma verbale; l'attributo resta `a fallimento chiuso` → *fail-closed* |
| marca temporale | timestamp | coerente con `06_security/04` EN |
| prestatore di servizi fiduciari | trust service provider | |
| dispositivo qualificato di creazione della firma | qualified signature creation device | |
| firma elettronica semplice / avanzata / qualificata | simple / advanced / qualified electronic signature | sigle **FES/FEA/FEQ** invariate, con scioglimento italiano in corsivo fra parentesi (pattern §3) |
| querela di falso | action alleging forgery | il termine italiano si conserva in corsivo fra parentesi |
| cifratura di volume o di disco | volume or disk encryption | |
| cifratura a livello di campo | field-level encryption | |
| deposito fiduciario (delle chiavi) | escrow | |

## Modulo 12 - Sicurezza: minacce, identità, processo

| Italiano | Inglese | Nota |
|---|---|---|
| modello di minaccia | threat model | |
| superficie di attacco | attack surface | |
| confine di fiducia | trust boundary | |
| alberi di attacco | attack trees | |
| analisi centrata sugli asset | asset-centred analysis | |
| privilegio minimo | least privilege | |
| separazione dei compiti | separation of duties | |
| controllo duale | dual control | |
| **rottura del vetro** | **break-glass** | conferma di log-TRAD-1 §3.2; qui è anche **titolo di paragrafo** e resta *break-glass*, non *emergency access* |
| identificazione / autenticazione / autorizzazione | identification / authentication / authorisation | terna, mai intercambiabili |
| fattore di autenticazione | authentication factor | |
| affaticamento da notifiche | notification fatigue | |
| artefatto di sessione | session artefact | |
| token autoconsistenti | self-contained tokens | |
| controllo degli accessi basato sui ruoli / sugli attributi | role-based / attribute-based access control | RBAC/ABAC invariati |
| **oscuramento** | **data suppression** | allineato a `10_fondamenti/03` EN; **non** *obscuring*, **non** *masking* |
| bilanciatore | load balancer | |
| estensione di indicazione del nome del server | server name indication extension | perifrasi dell'originale: **non** si scioglie in *SNI* |
| inventario dei flussi | inventory of flows | |
| irrobustimento (del contenitore) | (container) hardening | |
| costruzione riproducibile | reproducible build | |
| attestazione di provenienza | provenance attestation | |
| file di blocco delle versioni | version lock file | |
| **dichiarazione di esposizione** | **exploitability statement** | VEX. **Decisione del 26 agosto 2026 (difetto V-1)**: la divergenza fra gli originali italiani è chiusa allineando `10_fondamenti/12` alla forma già usata da `06_security/07`, `08` e `09`. `documento di sfruttabilità` non è più nel corpus |
| porto sicuro | safe harbour | clausola di `SECURITY.md` |
| avvisi di sicurezza | security advisories | |
| analisi statica / dinamica / della composizione | static / dynamic / composition analysis | |
| ricerca di segreti | secret scanning | |
| test di abuso | abuse tests | |
| test di penetrazione | penetration tests | |
| custode di software open source | open-source software steward | termine del CRA; `06_security` rende `amministratore fiduciario di software libero` allo stesso modo |
| periodo di supporto | support period | |
| matrice RACI | RACI matrix | |
| consulente tecnico d'ufficio | court-appointed technical expert | termine italiano in corsivo fra parentesi |
| telerefertazione | telerefertazione (remote reporting) | il nome resta italiano come in `10_fondamenti/02` EN; glossa alla prima occorrenza |
| sfigmomanometro | sphygmomanometer | |

## Modulo 12 - Enti e atti italiani

Il modulo 12 **nomina esplicitamente** enti e norme che l'area `06_security/` designa per perifrasi.
Non è una divergenza di traduzione: è una differenza fra i due **originali italiani**, e la
traduzione la rispecchia in entrambe le direzioni.

| Dove | Originale italiano | Resa inglese |
|---|---|---|
| `06_security/03 §1` | «l'istituto europeo di normazione delle telecomunicazioni», «l'agenzia nazionale per l'Italia digitale» | perifrasi mantenuta |
| `10_fondamenti/12 §1`, §4.5, §12.1 | **ETSI TS 119 312**, **SOG-IS**, **AgID-ACN** | sigle e riferimenti **invariati**: l'originale li nomina |
| ovunque | `specifiche di base ACN` | *the national authority's baseline specifications* (resa di `06_security`) |
| citazioni formali | `Determinazione ACN n. 379907 del 19 dicembre 2025`, `Circolare AgID 2/2017`, `DM 19 novembre 2025` | estremi **invariati**, glossa inglese alla prima occorrenza per documento |
| `10_fondamenti/12 §9.5` | `Garante per la protezione dei dati personali` | nome italiano invariato + glossa *(the Italian data protection authority)* |
| `10_fondamenti/12 §6.7` | `Codice dell'amministrazione digitale`, `codice civile` | nomi italiani invariati + glossa; poi la sola sigla `CAD` |

---

## Modulo 18 - Contribuzione, revisione, processo

> **Nota sulla numerazione.** Le ondate di traduzione appendono in parallelo e i numeri di sezione
> di questo file si sono duplicati. Questo blocco è numerato **18** come il modulo di origine, non
> come progressivo: si identifica dalla fonte, non dalla posizione.

*Fonte: `TRAD-10`, `10_fondamenti/18-contribuire-per-area.md` (documento intero).*

### 18.1 Lessico di contribuzione, revisione e processo

Questa è l'area lessicale con il maggior rischio di divergenza fra agenti, perché ricorre in ogni
documento che parli di come si lavora sul progetto. Le rese sono vincolanti.

| Italiano | Inglese | Nota |
|---|---|---|
| informatica gestionale | enterprise IT | scartati *business software* e *management IT*: il primo indica il prodotto, non il mestiere; il secondo non è idiomatico. La coppia portante del modulo è **enterprise IT** / **healthcare** |
| «Chi arriva dall'informatica gestionale» / «dalla sanità» | «Those coming from enterprise IT» / «from healthcare» | intestazioni ricorrenti: **identiche in tutte e dieci le sezioni** |
| gestionale (sostantivo) | management system | «un gestionale sanitario cloud» → *a cloud healthcare management system* |
| segnalazione | issue | mai *report* né *notification*; `segnalazione` in contesto WebRTC è **signalling** (vedi §11) |
| proposta di modifica / proposta | change proposal / proposal | resa già in uso in `08_compliance` |
| bacheca (inter-agenti) | (inter-agent) noticeboard | resa già in uso in `04_protocols` e `06_security` |
| vincolo `V-…` | constraint `V-…` | |
| questione `Q-…` | question `Q-…` | |
| controllo `G…` | check `G…` | mai *control*: `G…` è un gate di catena di costruzione |
| controlli obbligatori | mandatory checks | |
| controllo bloccante | blocking check | |
| condizione di ammissibilità | admissibility condition | contrapposta a *quality judgement* |
| catena di costruzione | build chain | |
| scheda (di un componente di terze parti) | record | *the record for a third-party component* |
| etichetta di versione mobile | floating version tag | resa già in uso in `08_compliance/00` |
| formule vietate / ammesse | prohibited / permitted formulations | |
| perimetro | scope | `fuori perimetro` → *out of scope*; `perimetro contrattuale` → *contractual scope* |
| politica di perimetro | scope policy | |
| rifiuto di perimetro | scope rejection | |
| rifiuto di competenza | rejection for lack of competence | |
| rifiuto di forma regolatoria | rejection on regulatory form | |
| documento di decisione (architetturale) | (architecture) decision record | |
| decisioni rinviate | deferred decisions | |
| compromessi accettati / rifiutati | trade-offs accepted / rejected | |
| matrice di tracciabilità | traceability matrix | |
| retroattivamente irrecuperabile | retroactively unrecoverable | attributo delle attività di `D45` |
| criterio di accettazione | acceptance criterion | |
| *dato / quando / allora* | *given / when / then* | forma canonica del criterio |
| requisito non falsificabile | unfalsifiable requirement | |
| flusso principale / alternativo / di errore | main / alternative / error flow | |
| categoria di riapribilità | reopenability category | |
| prova negativa | negative test | `prova di abuso` → *abuse test* |
| prova manuale con tecnologia assistiva | manual test with assistive technology | `lettore di schermo` → *screen reader* |
| dati di collaudo | test data | |
| primo avvio (dell'integratore) | first setup | |
| esempio eseguibile | runnable example | «gli esempi si eseguono» → *examples are run* |
| firma di origine (DCO) | sign-off of origin | |
| prova del lettore che parte da zero | test of the reader who starts from zero | |
| chi rivede | whoever reviews / the reviewer | |
| prosa (contrapposta al codice) | prose | «esiste solo nella prosa» → *exists only in the prose* |

### 18.2 Dominio, clinica e regolatorio - rese aggiunte dal modulo 18

| Italiano | Inglese | Nota |
|---|---|---|
| oscuramento | obscuring | resa già in uso in `08_compliance/05` e `10_fondamenti/20` |
| canali di inferenza | inference channels | i sei canali di `V-149` |
| tracciato (informativo) cogente | binding (information) record layout | `tracciato` → *record layout*, come in `10_fondamenti/07` |
| dataset canonico | canonical dataset | |
| analisi degli scostamenti | gap analysis | |
| glossario nazionale | national glossary | |
| linguaggio ubiquo | ubiquitous language | |
| contatto fantasma | phantom encounter | `contatto` resta *encounter* |
| catalogo delle prestazioni | service catalogue | |
| percorso di cura | care pathway | |
| misura di controllo del rischio | risk control measure | |
| classe di rischio / classe di sicurezza del software | risk class / software safety class | |
| pericolo / situazione pericolosa / errore d'uso | hazard / hazardous situation / use error | |
| norma armonizzata | harmonised standard | |
| documento controllato | controlled document | contrapposto a *input* |
| rettifica (di documento firmato) | corrective reissue | resa già in uso in `10_fondamenti/16` |
| bozza di referto | draft report | `referto` → *report*, `refertazione` → *reporting* |
| rappresentante legale | legal representative | `caregiver` resta *carer* |
| pagatore / consultatore | payer / consulting party | `il pagatore non è un consultatore` → *the payer is not a consulting party* |
| terminologia clinica onerosa | costly clinical terminology | perifrasi R0: **non si risolve** in un nome di terminologia |
| scala clinica | clinical scale | |

### 18.3 Disambiguazioni obbligatorie introdotte dal modulo 18

Casi in cui la stessa parola italiana ha due rese e sbagliarne una cambia il senso.

| Italiano | Resa A | Resa B | Come si sceglie |
|---|---|---|---|
| `segnalazione` | **issue** (traccia aperta sul repository) | **signalling** (piano di controllo WebRTC) | contesto: contribuzione vs tempo reale. Nel §1 del modulo 18 le due accezioni compaiono a due righe di distanza |
| `prestazione` | **service** (l'istituto di telemedicina) | **service level** solo in `livello di servizio commerciale` | mai *performance* |
| `perimetro` | **scope** (che cosa il progetto fa) | **perimeter** (frontiera di rete, `06_security`) | dominio del capitolo |
| `controllo` | **check** (`G…`, verifica automatica) | **control** (`risk control`, `configuration control`) | se ha un identificativo `G…` è sempre *check* |
| `prova` | **test** (suite automatica) | **evidence** (artefatto documentale) | come in `log-TRAD-1 §7.4`; nel modulo 18 prevale *test* |
| `navigatore` | **browser** | - | mai *navigator* |

### 18.4 Ancore interne alla pagina - convenzione

Un documento con indice interno (`[§4](#4-area-tecnica)`) pone un problema che i collegamenti fra
file non pongono: lo slug è generato dal titolo, quindi tradurre il titolo **cambia l'ancora**. La
convenzione stabilita, coerente con `20-fonti-primarie.md` già tradotto:

- **I titoli si traducono e le ancore si riscrivono sullo slug inglese** (`#4-area-tecnica` →
  `#4-technical-area`). Il collegamento e il bersaglio si spostano insieme.
- **Un'ancora esplicita `{#…}` presente nell'originale si copia invariata**: è un identificativo, e
  l'originale l'ha scritta perché lo slug automatico non andava bene (in `18` è
  `## 11. Area conformità {#11-area-conformita}`, per via dell'accento). Riscriverla creerebbe una
  divergenza fra le due lingue su un identificativo, che è esattamente ciò che il runbook vieta.
- **Prima di consegnare si verifica che l'elenco delle ancore usate e quello dei titoli coincidano**,
  e che il conteggio delle ancore sia identico all'originale riga per riga.

### 18.5 Rinvii che escono da `docs/` - stato verificato

Il modulo 18 è il documento con il maggior numero di rinvii del progetto. **Tutti** i rinvii che
escono da `docs/` verso la radice del repository sono già scritti come URL assoluti verso GitHub
nell'originale italiano (`CONTRIBUTING.md` ×2, `THIRD-PARTY-TERMINOLOGY.md` ×2, `SECURITY.md`,
`GOVERNANCE.md`): sono stati copiati invariati. **Nessun percorso relativo che esce da `docs/`
è stato trovato in questo file.**

---

## Modulo 17 - Ambiente di sviluppo: costruzione, esecuzione, prova

*Fonte: `TRAD-11`, `10_fondamenti/17-ambiente-di-sviluppo.md` (integrale).*

### 9.1 Costruzione e dipendenze

| Italiano | Inglese | Nota |
|---|---|---|
| costruzione / catena di costruzione | build / build chain | coerente con `gates of the build chain` di §6 |
| costruzione riproducibile | reproducible build | |
| costruttore (del progetto) | build tool | **non** *builder*; `strumento di avvio del costruttore` → *launcher of the build tool* |
| costruttore incapsulato nel repository | build tool embedded in the repository | il `(wrapper)` dell'originale resta invariato |
| file di blocco / manifesto | lock file / manifest | |
| installazione riproducibile | reproducible installation | |
| artefatto di costruzione | build artefact |  |
| identificativo di costruzione | build identifier | |
| distinta dei materiali | bill of materials | già in `log-TRAD-1` §3.5, riusata |
| file di annotazioni / scheda del componente | annotations file / component record | G5 |
| dipendenze non fissate | unpinned dependencies | `profili fissati` → *pinned profiles* |

### 9.2 Contenitori, servizi, ambiente locale

| Italiano | Inglese | Nota |
|---|---|---|
| motore di contenitori | container engine | |
| contenitore effimero / ambiente effimero | ephemeral container / ephemeral environment | |
| composizione (file di, specifica di) | composition | resa periferica mantenuta: l'originale non nomina il prodotto |
| nodo di relay | relay node | già in `08_compliance/03`, vincolante |
| prodotto di federazione (delle identità) | (identity) federation product | già in `04_protocols/08`, vincolante |
| broker di eventi | event broker | |
| base dati | database | `motore` della base dati → *engine* |
| registro delle migrazioni | migration register | coerente con `registro delle manutenzioni` → *maintenance register* |
| impronta (della migrazione) | fingerprint | stessa parola delle impronte dei certificati: l'omonimia è dell'italiano ed è conservata |
| espandi e contrai | expand and contract | |
| sicurezza a livello di riga | row-level security | |
| ordinale opaco di tenant | opaque tenant ordinal | |
| ripartire da zero / azzerare | start again from scratch / wipe | |

### 9.3 Prove, controlli, pipeline

| Italiano | Inglese | Nota |
|---|---|---|
| fascia (della pipeline) | tier | **non** *band*: `band` è già impegnato da `fascia oraria` → *time band* |
| fascia pianificata | scheduled tier | dove l'originale dicesse `notturna`, *nightly* (vedi `10_fondamenti/08`) |
| controllo obbligatorio | mandatory check | `blocca` → *blocks*; `condizione di ammissibilità` → *condition of admissibility* |
| prova a contratto | contract test | |
| prova da estremo a estremo | end-to-end test | |
| prova di componente | component test | |
| doppio di prova | test double | |
| fabbrica di dati di prova | test data factory | |
| copertura per mutazione / copertura dei rami | mutation coverage / branch coverage | |
| attesa a tempo fisso | fixed-time waiting | |
| orologio iniettato | injected clock | |
| prova instabile | unstable test | **non** *flaky*: l'originale non usa il gergo |
| prova che verifica un divieto | test that verifies a prohibition | |
| matrice di tracciabilità | traceability matrix | |
| assuefazione all'allarme | alarm habituation | distinto da `desensibilizzazione all'allarme` → *alarm desensitisation* (§1): sono due parole diverse in italiano e restano due in inglese |
| carico e resistenza | load and endurance | |
| esecuzione senza finestra | windowless execution | |

### 9.4 Ambienti e igiene

| Italiano | Inglese | Nota |
|---|---|---|
| esercizio | live / live operation | `in esercizio` → *in live operation*, coerente con `06_security/03` (*live archive*) |
| produzione | production | **Aggiornato dopo la chiusura di `T-2` (26 agosto 2026).** L'ambiente di erogazione si chiama `esercizio` → *live* in tutto il modulo 17: `profilo di esercizio` → *live profile*, `costruzione per l'esercizio` → *the build for live operation*. `produzione` → *production* sopravvive nelle sole due locuzioni citate alla lettera da `01_technical` - `codice di produzione` → *production code* (contrapposto al codice di prova, non a un ambiente) e `mai esportazioni di produzione` → *never production exports*. Il modulo dichiara esso stesso la convenzione in §11.2 |
| collaudo | acceptance | scelto contro *test environment* (usato una volta in `06_security/01` in senso generico): qui i quattro ambienti sono contrapposti e *test* si confonderebbe con `prove` |
| promozione dell'artefatto | promotion of the artefact | |
| scorciatoia di sviluppo | development shortcut | |
| rotazione del segreto | secret rotation | |
| segnalazione (difetto) | issue report | `segnalazione riservata` → *confidential reporting* |
| proposta di modifica | proposed change | già in `06_security/07`, vincolante |
| ripulire | clean up | |
| fini riga | line endings | |

### 9.5 Dati sintetici

| Italiano | Inglese | Nota |
|---|---|---|
| dato sintetico | synthetic datum / synthetic data | |
| generatore / seme | generator / seed | |
| marcatore di sinteticità | synthetic marker | |
| non attribuibile | non-attributable | |
| profilo di dimensione / profilo avverso | size profile / adverse profile | `dati avversi` → *adverse data* |
| anagrafica | demographic record / demographic data | coerente con `10_fondamenti/04` (*demographic registry*) |
| codice del comune non assegnato | unassigned municipality code | `codice catastale` → *cadastral code* |
| anagrafiche temporanee | temporary demographic registrations | stranieri temporaneamente presenti → *foreign nationals temporarily present*; europei non iscritti → *non-registered EU citizens* |
| aderenza incompleta | incomplete adherence | |
| deriva lenta / artefatti di misura | slow drift / measurement artefacts | |
| valore di base per soggetto | baseline value per subject | |
| ritardo di sincronizzazione | synchronisation delay | |

### 9.6 Media, in aggiunta a quanto già fissato dal modulo 08

| Italiano | Inglese | Nota |
|---|---|---|
| candidati di tipo locale | candidates of the local type | l'originale evita `host`: la reticenza è conservata |
| politica di trasporto della negoziazione | transport policy of the negotiation | l'originale evita `ICE` |
| percorso instradato / sessione instradata | relayed path / relayed session | |
| regola di ammissione / di diniego | allow rule / deny rule | `interruttore globale di diniego` → *global deny switch* |
| lista di indirizzi vietati | list of forbidden addresses | già in `log-TRAD-1` §3.5 |
| isolamento di rete in uscita | egress network isolation | |
| contenitore di registrazione | recording container | `senza ricodifica` → *without transcoding* |
| parco installato | installed base | |
| limitazione di qualità | quality limitation | |
| congelamenti | freezes | |
| suite di cifratura | cipher suite | `non degenere` → *not degenerate* |
| profilo degradato limite | worst-case degraded profile | |

### 9.7 Blocchi di codice - che cosa `TRAD-11` ha lasciato invariato, e perché

Il modulo 17 è il file con più codice del progetto. La regola applicata è stata la più stretta
possibile: **si traducono solo i commenti destinati a un lettore umano e i segnaposto `<…>`.**

- **Invariati**: ogni comando (`git`, `docker compose`, `npm ci`, `./mvnw`, `openssl`, `psql`,
  `curl`, `rm -rf`), ogni percorso e nome di file (`.env`, `.env.example`, `.editorconfig`,
  `target/`, `dist/`, `node_modules/`), ogni identificatore SQL italiano (`platform.outbox`,
  `t0001_monitoring.misura`, `tipo`, `chiave`, `creato_il`, `pubblicato_il`, `tentativi`,
  `ultimo_errore`, `parametro_code`, `valore`, `unita_ucum`, `stato`, `origine`, `soggetto_id`,
  `prestazione`), i nomi di schema (`t0001_identity`…), le variabili (`app.tenant_id`), i nomi di
  directory dell'albero del repository, le annotazioni e il nome di metodo del frammento Java
  (`@Requisito`, `@ControlloDiRischio`,
  `avvisa_il_professionista_quando_la_qualita_scende_sotto_la_soglia_di_inidoneita`).
- **Invariato anche il messaggio di commit d'esempio** `docs: correggere il refuso nel modulo sui
  prerequisiti`: i messaggi di commit di questo progetto sono in italiano per convenzione, e
  tradurlo avrebbe dato un esempio contrario alla convenzione.
- **Invariati** `git config user.name "Nome Cognome"` e `git config user.email
  "indirizzo@esempio.invalid"`: sono valori di argomento, non commenti né segnaposto `<…>`, e il
  secondo è un dominio d'esempio.
- **Tradotti**: tutti i commenti (`# then, on every commit:`, `-- Manual check, pending the project
  command.`, `# stops the services AND DELETES the volumes`, …) e tutti i segnaposto `<…>`
  (`<servizio>`→`<service>`, `<porta>`→`<port>`, `<utente>`→`<user>`,
  `<servizio-base-dati>`→`<database-service>`, `<uuid-del-tenant-sintetico>`→
  `<synthetic-tenant-uuid>`, `<uuid-sintetico>`→`<synthetic-uuid>`, `<contesto>`→`<context>`).
- **Nessun segnaposto di segreto sostituito con un valore**: `openssl rand -base64 32` resta un
  comando di generazione, e la regola «i valori del file di esempio sono segnaposto, non valori» è
  resa con la stessa forza dell'originale.

---

## Modulo 06 - FHIR da zero

*Fonte: `TRAD-9`, `10_fondamenti/06-fhir-da-zero.md`. Complementari alle rese di
`log-TRAD-1.md §3.6`, che restano la base: qui ci sono solo i termini che quel file non copre.*

| Italiano | Inglese | Nota |
|---|---|---|
| criterio dell'ottanta per cento | the eighty per cent rule | principio FHIR; **non** *eighty per cent criterion* |
| identificatore logico / di business | logical identifier / business identifier | la coppia `id` / `identifier`, portante del modulo |
| vocabolario (di un elemento vincolato) | value set | reso come in `04_protocols/02-fhir.md`; **non** *vocabulary* |
| forza del legame | binding strength | |
| elemento a scelta di tipo (`[x]`) | element with a choice of type | |
| risorsa contenuta | contained resource | |
| riferimento relativo / assoluto / logico | relative / absolute / logical reference | |
| discriminatore (slicing) | discriminator | tipi: by value, by existence, by pattern, by type, by profile |
| per schema (tipo di discriminatore) | by pattern | **non** *by schema* |
| viste complete popolate | snapshot populated | coerente con *snapshots* di `log-TRAD-1 §3.6` |
| storicizzazione (tabelle di) | historicisation | |
| versione flottante / dipendenza flottante | moving version / moving dependency | allineato a *moving reference* di `04_protocols/02-fhir.md §2` |
| fissare la versione | to pin the version | il sostantivo resta *pinning*, come in `10_fondamenti/05` |
| registro (dei pacchetti FHIR) | registry | distinto da *audit trail* e da *register* |
| modalità a distanza / non compresente | remote mode / non-co-present mode | la seconda è già in `04_protocols/02-fhir.md §3.2` |
| stanza virtuale | virtual room | |
| sala d'attesa virtuale | virtual waiting room | già in `04_protocols/02-fhir.md` |
| registro di riferimento delle anagrafiche | the principal demographic registry | già in `10_fondamenti/04`; **non** *master patient index*, riservato al testo che usa quella locuzione |
| gateway di terze parti | third-party gateway | perifrasi dell'originale: **non si risolve** in un nome di prodotto |
| tempo di andata e ritorno | round-trip time | `RTT` resta sigla |
| perdita di pacchetti / variazione del ritardo | packet loss / delay variation | |
| direttive anticipate (ambito di `Consent`) | advance directives | |
| riservatezza (ambito di `Consent`) | privacy | il codice `Consent.scope`, non la riservatezza in generale |
| attestatore / custode (`Composition`) | attester / custodian | |
| segnalazione (`OperationOutcome.issue`) | issue | |
| gravità | severity | |
| espressione (che localizza l'errore) | expression | |
| entità non elaborabile (422) | unprocessable entity | |
| precondizione fallita (412) | precondition failed | |
| interazione condizionale | conditional interaction | `creazione/aggiornamento/cancellazione/modifica condizionale` → *conditional create / update / delete / patch* |
| prefisso (ricerca) | prefix | `sa` starts after, `eb` ends before, `ap` approximately |
| collegamenti opachi (paginazione) | opaque links | |
| cancello (in integrazione continua) | gate | |
| ricerca insensibile a maiuscole e diacritici | search insensitive to case and diacritics | |

**Nomi di guide HL7 Italia**: `Televisita`, `Teleconsulto`, `Teleassistenza`, `Telemonitoraggio`,
`IT-Core`, `Laboratory Report`, `Taccuino personale dell'assistito` restano **invariati** anche
quando il nome è italiano e descrittivo: sono nomi di pubblicazioni.

**Sezioni del referto di televisita** (tabella `§8.1`) - rese allineate a
`10_fondamenti/05-standard-di-interoperabilita.md §8.2`, dove i medesimi codici LOINC sono già
glossati: *diagnostic question*, *initial clinical assessment*, *history taking*, *allergies*,
*ongoing medication therapy*, *physical examination*, *previous tests performed*, *comparison with
previous tests*, *report*.

---

## Modulo 10 - Percorsi di cura e sicurezza del paziente

*Fonte: `TRAD-12`, `10_fondamenti/10-percorsi-di-cura-e-sicurezza.md` (integrale).*

> **Avvertenza di numerazione.** Questo file contiene **due sezioni numerate `## 9`** (ambiente di
> sviluppo, di `TRAD-11`, e FHIR, di `TRAD-9`): collisione preesistente, non introdotta qui. La
> presente sezione prende il numero 10 per non aggiungerne una terza. Va risolta rinumerando.

### 10.1 `sicurezza` → *safety* o *security* - criterio vincolante

Nel modulo 10 `sicurezza` è **quasi sempre *patient safety***. La regola applicata, riusabile
ovunque il dominio clinico e quello di sicurezza informatica si tocchino:

- *safety* dove il referente è **il danno alla persona**: `sicurezza del paziente`, `sicurezza
  delle cure`, `requisito di sicurezza`, `evento di sicurezza`, `indicatore di sicurezza`,
  `difetto di sicurezza`, `elemento di sicurezza`, `comportamento di sicurezza del dispositivo`,
  `funzioni correlate alla sicurezza`, `sicurezza intrinseca`, `informazioni per la sicurezza`,
  `classe di sicurezza del software` (IEC 62304 → *software safety class*), `sicurezza
  organizzativa`, `sicurezza in aviazione`, `sicurezza degli allarmi`;
- *security* dove il referente è **la minaccia, l'attaccante o il controllo di accesso**:
  `superficie di attacco` → *attack surface*, `controlli di accesso` → *access controls*.

Nel modulo 10 le occorrenze *security* sono **due**. Tutte le altre sono *safety*. Un agente che
trovi `evento di sicurezza` in un file clinico e lo renda *security event* introduce un errore di
dominio, non una variante stilistica.

### 10.2 Sicurezza del paziente e gestione del rischio

| Italiano | Inglese | Nota |
|---|---|---|
| sicurezza del paziente | patient safety | |
| rischio clinico / gestione del rischio clinico | clinical risk / clinical risk management | |
| sicurezza delle cure | safety of care | |
| evento avverso / evento avverso prevenibile | adverse event / preventable adverse event | |
| quasi evento | near miss | l'originale glossa già `(*near miss*)` |
| evento sentinella | sentinel event | |
| errore attivo / condizione latente | active error / latent condition | coppia portante di §9.3 |
| cultura giusta | just culture | l'originale glossa già `(*just culture*)` |
| analisi delle cause profonde | root cause analysis | |
| analisi dei modi di guasto e dei loro effetti | failure modes and effects analysis | l'originale non usa la sigla, la traduzione nemmeno |
| falsa rassicurazione | false reassurance | già in `08_compliance/06`, vincolante |

### 10.3 ISO 14971 e IEC 62366-1 - termini di norma

Si usa **il termine ufficiale inglese della norma**, non il calco dell'italiano, esattamente come
per `destinazione d'uso` → *intended purpose* in `log-TRAD-1 §3.1`.

| Italiano | Inglese | Nota |
|---|---|---|
| pericolo | hazard | |
| sequenza di eventi | sequence of events | |
| situazione pericolosa | hazardous situation | **non** *dangerous situation* |
| danno | harm | **non** *damage* |
| gravità / probabilità | severity / probability | |
| misura di controllo (del rischio) | (risk) control measure | |
| rischio residuo | residual risk | già in `log-TRAD-1 §3.1` |
| ponderazione (del rischio) | risk evaluation | fase della norma, distinta da `analisi` → *analysis* |
| sicurezza intrinseca per progettazione | inherent safety by design | |
| misure di protezione | protective measures | |
| informazioni per la sicurezza | information for safety | |
| file di rischio | risk file | **resa deliberatamente letterale**: l'originale usa questa forma abbreviata accanto a `fascicolo di gestione del rischio` → *risk management file* (`log-TRAD-1 §3.1`). Non unificare: sono due locuzioni dell'italiano |
| errore d'uso | use error | l'originale spiega esso stesso perché **non** *user error* |
| uso anomalo | abnormal use | |
| specifica d'uso | use specification | |
| funzioni correlate alla sicurezza | safety-related functions | |
| pericoli legati all'uso | use-related hazards | |
| scenari d'uso pericolosi | hazard-related use scenarios | termine della norma; **non** *dangerous use scenarios* |
| valutazione formativa / validazione sommativa | formative evaluation / summative validation | |
| utenti rappresentativi | representative users | |
| file di ingegneria dell'usabilità / file di usabilità | usability engineering file / usability file | |

### 10.4 Allarmi, soglie, silenzio

| Italiano | Inglese | Nota |
|---|---|---|
| allarme | **alarm** | vedi §10.5: divergenza aperta con `10_fondamenti/14` |
| alert (prestito nel DM: `alert sanitari`/`alert tecnici`) | alert | resta il prestito: `clinical alerts` / `technical alerts`, come nel glossario di `10_fondamenti/02` |
| allarme clinico / allarme tecnico | clinical alarm / technical alarm | |
| soglia di allarme | alarm threshold | già in `04_protocols/03` e `10_fondamenti/02` |
| affaticamento da allarme | alarm fatigue | l'originale glossa già `(*alarm fatigue*)`; distinto da `desensibilizzazione all'allarme` → *alarm desensitisation* di §1 |
| segnale d'allarme | alarm signal (*red flag*) | l'originale fornisce la glossa; vedi §10.5 |
| presa in carico (di un allarme) | acknowledgement | l'originale lo dichiara esplicitamente in §7.6 |
| mancato riscontro / tasso di mancato riscontro | failure to respond / rate of failure to respond | `tempo di riscontro atteso` → *expected response time* |
| scadenza (dell'allarme) | deadline | |
| fallimento dichiarato | declared failure | |
| conferma di consegna | delivery confirmation | |
| esito tipizzato | typed outcome | già in §6, riusato |
| isteresi / persistenza / raggruppamento | hysteresis / persistence / grouping | |
| soppressione dei duplicati | duplicate suppression | |
| sospensione temporanea / silenziamento | temporary suspension / silencing | |
| finestra di silenzio notturno | night-time silence window | |
| finestra di attesa | expectation window | coerente con `attesa di rilevazione` → *measurement expectation* di §6 |
| misura non pervenuta / non attesa | measurement not received / not expected | |
| segnale di presenza periodico | periodic presence signal | il `(heartbeat)` dell'originale resta invariato |
| guasto sistemico | systemic failure | |
| catena di ingestione | ingestion chain | |
| sorveglianza del volume atteso | monitoring of the expected volume | già in `10_fondamenti/14` |
| copertura / copertura oraria | coverage / service hours | `fuori copertura` → *outside coverage*; `copertura oraria` resta *service hours* come da §6 |

### 10.5 Divergenza aperta - `allarme`: *alarm* o *alert*

`10_fondamenti/14-flussi-funzionali.md` rende sistematicamente `allarme` → **alert**. Questo modulo
lo rende **alarm**, e la scelta non è arbitraria:

1. l'originale glossa esso stesso `affaticamento da allarme` come *alarm fatigue*: rendere
   `allarme` con *alert* produrrebbe `alert fatigue`, che **contraddice la glossa dell'autore**;
2. `soglia di allarme` è già *alarm threshold* in `04_protocols/03` e `10_fondamenti/02`;
3. `M-08` in `06_security/01` è già *Loss of an alarm*, e `10_fondamenti/09` usa *false alarms* e
   *alarm desensitisation*;
4. l'italiano tiene distinti `allarme` e il prestito `alert` (i due dell'`alert sanitario`/`alert
   tecnico` del DM): unificarli in *alert* cancella una distinzione dell'originale.

**Resa adottata e proposta come vincolante: `allarme` → *alarm*, `alert` → *alert*.** Il modulo 14
va allineato, non questo. Fino all'allineamento la divergenza è nota e dichiarata.

### 10.6 Percorsi, piani, presa in carico

| Italiano | Inglese | Nota |
|---|---|---|
| percorso di cura / PDTA | care pathway / PDTA | `PDTA` sciolto alla prima occorrenza: *percorso diagnostico terapeutico assistenziale, the diagnostic-therapeutic care pathway*, come in `10_fondamenti/01` |
| piano di cura | care plan | |
| PAI | Piano assistenziale individuale (individual care plan) | già fissato nei moduli 01, 02, 09 |
| PRI | Progetto riabilitativo individuale (individual rehabilitation plan) | idem |
| piano di telemonitoraggio | remote monitoring plan | già in `10_fondamenti/02` |
| presa in carico | taking the case on | **non** *enrolment into care* in questo file: l'originale distingue `presa in carico` da `arruolamento`, e `enrolment` è occupato |
| arruolamento | enrolment | |
| eleggibilità | eligibility | distinto da `diritto amministrativo alla prestazione` → *administrative entitlement to the service* |
| adesione informata | informed acceptance | già in `10_fondamenti/02` |
| tesserino dispositivi | device card | già in `10_fondamenti/02` e `04_protocols/03` |
| compliance digitale dell'assistito | the patient's digital readiness | perifrasi già in `10_fondamenti/02`; il termine italiano resta accanto |
| centro erogatore / centro servizi | Centro erogatore (delivering centre) / Centro servizi (service centre) | rese già in `10_fondamenti/02` e `08_compliance`: **il nome italiano resta**, la glossa inglese segue |
| nodo del percorso / punto di decisione | node of the pathway / decision point | |
| deviazione motivata | reasoned deviation | `scostamento` → *departure* dove l'originale alterna i due |
| criteri di transizione e di uscita | transition and exit criteria | |
| uscita dal canale | exit from the channel | l'item marcato nel piano |
| instradamento (vs valutazione) | routing (vs assessment) | coppia portante di §6.6 |

### 10.7 Clinica della cronicità

| Italiano | Inglese | Nota |
|---|---|---|
| acuto / cronico | acute / chronic | |
| riacutizzazione / esacerbazione | exacerbation / flare-up | `scompensi` come sinonimo → *episodes of decompensation* |
| multimorbilità / fragilità | multimorbidity / frailty | |
| complessità assistenziale | care complexity | |
| autogestione / educazione terapeutica | self-management / therapeutic education | l'originale glossa già `(*self-management*)` |
| scompenso cardiaco | heart failure | `scompenso acuto` → *acute decompensation* |
| broncopneumopatia cronica ostruttiva | chronic obstructive pulmonary disease | |
| insufficienza renale cronica | chronic renal failure | |
| insufficienza respiratoria cronica ipercapnica | chronic hypercapnic respiratory failure | |
| potassiemia | serum potassium | **non** *kalaemia*: qui l'italiano indica la grandezza di laboratorio |
| diuresi | urine output | |
| farmaco al bisogno / di soccorso | as-needed medicine / rescue medicine | |
| ricovero / riammissione / dimissione | admission / readmission / discharge | |
| scala clinica / punteggio | clinical scale / score | |
| scala di allerta precoce | early warning score | l'originale glossa già `(*early warning scores*)` |
| autosomministrata / eterosomministrata | self-administered / administered by a third party | l'inglese non ha un aggettivo per la seconda: perifrasi necessaria |
| attività di base / strumentali della vita quotidiana | basic / instrumental activities of daily living | `ADL`/`IADL` restano sigle |
| cruscotto | dashboard | |

**Stringhe italiane dentro i blocchi JSON - regola applicata.** Si traducono quando sono contenuto
libero destinato a un lettore (`Attachment.title`, `DocumentReference` della registrazione,
`Observation.code.text`, `OperationOutcome.details.text`, `Device.deviceName.name`). **Restano in
italiano** quando la loro italianità è il punto dimostrato: il `display` «italianizzato» dell'esempio
sbagliato di `§3.2` regola 2, il `text` che porta il testo clinico italiano nell'esempio corretto
della stessa regola, e il `title` «Referto di Televisita» di `§9.5`, che è il **pattern fissato dal
profilo italiano**. Tradurre questi tre distruggerebbe l'esempio.

---

## Modulo 19 - Il glossario della guida dei fondamenti

> **Nota sulla numerazione.** Questo blocco è numerato **19** come il modulo di origine, non come
> progressivo. Il file contiene già due sezioni `## 9` per collisione preesistente: si identificano
> i blocchi dalla fonte dichiarata, non dalla posizione.

*Fonte: `TRAD-16`, `10_fondamenti/19-glossario.md` (documento integrale, 38.343 parole).*

### 19.1 La struttura della voce - convenzione vincolante per ogni glossario bilingue

Il glossario italiano ha la forma **«termine italiano (equivalente inglese fra parentesi)»**, e la
§1.2 del documento la dichiara esplicitamente. Nella resa inglese **il lemma resta italiano** e la
glossa inglese resta fra parentesi. Le ragioni sono tre e valgono per qualunque glossario futuro:

1. l'ordinamento alfabetico è **italiano** (regola §8 di questo file): tradurre i lemmi produrrebbe
   un elenco inglese ordinato secondo parole invisibili;
2. la §1.2 descrive la struttura della voce e resta vera solo se il lemma è italiano;
3. la §7 è un **indice inverso inglese → italiano**, che senza i lemmi italiani non ha bersaglio.

Sotto-convenzioni applicate:

| Caso nell'originale | Resa inglese |
|---|---|
| `**Termine** (*english*)` | invariato |
| `**Termine** (*english*; nota esplicativa italiana)` | nota tradotta, resto invariato |
| `**SIGLA/Parola inglese** (*espansione inglese*, glossa italiana)` | `(*espansione inglese*, in Italian *glossa italiana*)` - pattern già usato in §7 per `sub-, sotto-` |
| Lemma senza glossa inglese nell'originale | **nessuna glossa aggiunta**: l'omissione è dell'originale e si segnala, non si colma |
| `Vedi *Altro lemma*` | `See *Altro lemma*` - il rinvio punta al lemma italiano |

Intestazioni di colonna: `Termine → Term`, `Nat. → Nat.` (l'abbreviazione regge in entrambe le
lingue), `Definizione → Definition`, `Dove → Where`. Le lettere della colonna `Nat.` - **N**
normativa, **G** guida nazionale, **S** standard, **P** progetto - **si conservano**: le iniziali
inglesi coincidono (*Normative, National guide, Standard, Project*).

`**Trappola:** → **Trap:**`, coerente con `10_fondamenti/06` già tradotto.

### 19.2 Rese nuove introdotte dal modulo 19

| Italiano | Inglese | Nota |
|---|---|---|
| falsi sinonimi | false synonyms | titolo della §3 |
| termini da non usare | terms not to be used | titolo della §4 |
| indice inverso | reverse index | titolo della §7 |
| natura della definizione | nature of the definition | |
| aggiornamento perduto | lost update | |
| annullamento del documento | document voiding | distinto da `rettifica` → *corrective reissue* |
| anagrafica per riferimento | reference-based demographics | |
| attesa di rilevazione | expected observation | glossa dell'originale; **non** *measurement expectation* di §6, che resta la resa in prosa |
| bozza | draft | `documento in bozza` → *document in draft* |
| catena di sostituzione | substitution chain | già in `10_fondamenti/14` |
| cinquina | five-tuple | |
| coerenza finale | eventual consistency | vedi difetto D-4 in §19.5 |
| collisione delle offerte | glare | |
| consegna differita | deferred delivery | |
| coreografia / orchestrazione | choreography / orchestration | coppia portante della §2 |
| corsa critica | race condition | |
| dati avversi | adversarial test data | glossa dell'originale; in `10_fondamenti/17` è *adverse data* |
| deviazione dal percorso | pathway deviation | |
| esito del contatto / stato del contatto | encounter outcome / encounter state | coppia da non fondere |
| falsificazione di richieste a livello di trasporto | transport-level request forgery | resa **non introdotta nel file**: l'originale non porta glossa e non se ne è aggiunta una |
| finestra di refertazione | reporting window | |
| fusione anagrafica | record merge | |
| gate di appropriatezza | appropriateness gate | già in `10_fondamenti/02` |
| grandezza (osservabile) | observable quantity | coerente con `quantity` di §5, qui con il complemento |
| indirizzo di svolgimento | session location address | |
| istante di rilevazione / di ricezione / di inserimento | observation / reception / entry timestamp | terna da non collassare |
| livello di provenienza | provenance level | |
| livello di riservatezza | sensitivity label | |
| marcatore di sinteticità | synthetic flag | glossa dell'originale; in `10_fondamenti/17` è *synthetic marker* |
| modalità con registrazione | recording mode | |
| modello canonico di scambio | canonical exchange model | |
| non alterabile | tamper-evident | |
| non conferibile | non-transmissible | |
| ondata sincronizzata | thundering herd | |
| piano applicativo / piano clinico | application plane / clinical plane | superfici di esposizione, **non** *plan* |
| pre-verifica tecnica | technical pre-check | |
| prestazione fantasma | phantom service | forma clinica del difetto di idempotenza |
| profilo di dimensione del dataset | dataset size profile | |
| prontezza e vivacità | readiness and liveness | già in `10_fondamenti/17` |
| punto di erogazione | point of delivery | distinto da `indirizzo di svolgimento` |
| rapporto tecnico di sessione | session technical report | |
| ripristino selettivo | selective restore | |
| setting di erogazione | care setting | |
| sigillo periodico | periodic seal | già in `10_fondamenti/12` |
| soglia clinica / soglia tecnica | clinical threshold / technical threshold | coppia portante, **mai unificare** |
| stanza laterale | breakout room | glossa dell'originale; in `10_fondamenti/14` è *side room* |
| stato di risoluzione | resolution status | i quattro esiti del gateway terminologico |
| terzo in sessione | third party in session | |
| valore aggregato | aggregated value | |
| veste professionale | professional capacity | `i permessi seguono la veste` → *permissions follow the capacity* |

### 19.3 Divergenze fra moduli già tradotti - risolte in questo file

Sono i casi in cui due moduli inglesi già consegnati rendono lo stesso termine italiano in due modi.
La resa adottata qui è quella che l'evidenza sostiene meglio; il modulo indicato va allineato.

| Italiano | Resa adottata | Resa divergente | Modulo da allineare |
|---|---|---|---|
| allarme | **alarm** (`allarme clinico` → *clinical alarm*, `allarme tecnico` → *technical alarm*) | *alert* | `10_fondamenti/14`, **e l'originale italiano di `19` stesso**, che nelle voci «Allarme clinico» e «Allarme tecnico» e nelle righe §7 glossa *clinical alert* / *technical alert* contraddicendo la propria glossa *alarm fatigue* |
| presa in carico | **taking the case on** (`log-TRAD-1 §3.2`, `10_fondamenti/10`) | *enrolment into care* | `10_fondamenti/01` (tre occorrenze: COT, IFoC, PAI) e la voce «Presa in carico» dell'originale italiano di `19`. `enrolment` è occupato da `arruolamento` |
| rettifica | **corrective reissue** (`10_fondamenti/14`, `16`, `18`) | *amendment* | la voce «Rettifica» dell'originale italiano di `19` |
| cartella clinica | **inpatient medical record** (glossa dell'originale di `19`, più precisa) | *clinical record* | `10_fondamenti/03`, glossario di modulo |
| controllo di consenso (ICE) | **consent freshness** (glossa dell'originale di `19`) | *consent check* | `10_fondamenti/08`, glossario di modulo |
| modifica sostanziale | **significant change** (glossa dell'originale di `19`) | *substantial change* | `10_fondamenti/15`, glossario di modulo |

**Normalizzazione ortografica britannica**: l'originale scrive `Segnalazione (*signaling*)` e
`Signaling` nella §7. Reso **signalling** in entrambi i punti, coerente con `htmlLang: en-GB` e con
`10_fondamenti/08`. È l'unica correzione ortografica applicata a un termine inglese già presente
nell'originale italiano.

### 19.4 Che cosa **non** si è toccato

- **I nomi delle otto prestazioni di telemedicina.** L'avvertenza in testa alla lettera T
  dell'originale enumera i traducenti inglesi correnti - *video visit*, *teleconsultation*,
  *tele-advice*, *tele-care*, *remote patient monitoring* - **per dichiararli inesatti**. Sono
  contenuto argomentativo, non rese: restano verbatim, anche dove divergono da `log-TRAD-1 §3.3`
  (*remote consultation*, *specialist-to-specialist consultation*, *remote assistance*, *remote
  monitoring*), che resta la resa da usare **in prosa**.
- **La §7, indice inverso.** Le chiavi inglesi sono punti di ingresso dalla letteratura tecnica
  internazionale, non le rese del progetto: restano invariate, ordinamento alfabetico inglese
  compreso. Cambiarle avrebbe rotto l'ordinamento del file.
- **Le perifrasi R0.** «un gestionale sanitario cloud», «un sistema EHR di terze parti»,
  «l'integratore», «terminologia sotto licenza restrittiva», «uno dei due canali di identità
  pubblica italiani», «sigle di conformità crittografica di ordinamenti extra-UE»: tutte mantenute
  perifrastiche. La voce «SNOMED CT» descrive il regime della terminologia e **non riporta un solo
  concetto**; nulla è stato aggiunto.

### 19.5 Difetti dell'originale italiano riprodotti e segnalati

| # | Punto | Difetto |
|---|---|---|
| D-1 | §2, voci «Allarme clinico» e «Allarme tecnico»; §7 righe `Clinical alert` e `Technical alert` | Glossano `allarme` con *alert*, mentre la voce «Affaticamento da allarme» glossa *alarm fatigue*: l'originale si contraddice al proprio interno |
| D-2 | §2, voce «Presa in carico» | Glossa *enrolment into care*, che collide con la voce «Arruolamento» → *enrolment* |
| D-3 | §2, voce «Rettifica» | Glossa *amendment*, mentre i moduli 14, 16 e 18 usano sistematicamente *corrective reissue* |
| D-4 | §2, voce «Coerenza finale» | Il lemma italiano è `Coerenza finale`, ma `10_fondamenti/11` usa `Consistenza finale` per lo stesso concetto. Due lemmi italiani per un concetto, in due documenti della stessa guida |
| D-5 | §3.1 punto 2 e §2 | La terna è enunciata come `richiesta / eseguita / addebitata` in §3.1 e come `richiesta / erogata / rendicontata` nelle voci di §2. Tre nomi per il terzo elemento |
| D-6 | §7, riga `Transactional outbox → Outbox transazionale` | Il lemma `Outbox transazionale` **non esiste** nell'elenco alfabetico §2: l'indice inverso rimanda a una voce assente |
| D-7 | §7, riga `Technical pre-check → Pre-verifica tecnica` | Idem: `Pre-verifica tecnica` compare solo in §6.11 come forma da usare, non come voce di §2 |
| D-8 | §2, voce «Falsificazione di richieste a livello di trasporto» | Unica voce dell'elenco priva di glossa inglese, in violazione della regola §8 punto 2 dello stesso documento («una voce italiana senza traducente non è una voce») |
| D-9 | §2, lettera A | «ATNA» è collocata **dopo** «Attività strumentali» e **prima** di «Attore»: fuori ordine alfabetico italiano (`ATN` < `ATT`). Conservata nella posizione dell'originale |
| D-10 | §2, lettera C | «Consegna almeno una volta» è collocata **dopo** «`Consent`» e prima di «Conservazione a norma»: fuori ordine (`Consegna` < `Consenso` < `Consent`). Conservata |
| D-11 | §2, lettera F | «FSE 2.0» è collocata sotto la lettera F fra «Fascicolo sanitario elettronico» e «Fascicolo tecnico», cioè ordinata sulla sigla sciolta e non sul lemma. Conservata |
| D-12 | §5.10 | La riga `WCAG` non ha voce corrispondente in §2, a differenza di tutte le altre sigle delle sezioni §5 |
| D-13 | §5.1 e §5.6 | `ACN` compare in due sezioni con due scioglimenti diversi. È **voluto** e dichiarato in §6.20: annotato per evitare che una revisione successiva lo «corregga» |

---

## Modulo 20 - Fonti primarie: come si nominano gli enti

*Fonte: `FIX-C`, chiusura di `T-15` del registro dei difetti, 26 agosto 2026.*

Il modulo 20 nominava `ACN` e `AgID` in alcuni punti (§5.4, §5.5) e li designava per perifrasi in
altri (§2, §5.1, §5.3, §5.6, §6.2). **Decisione: nel modulo 20 gli enti normatori si nominano**, e
la convenzione è dichiarata in §1. Le ragioni, nell'ordine in cui pesano:

1. il modulo esiste perché un lettore possa **reperire l'atto alla fonte primaria**, e l'autorità
   emanante è parte degli estremi quanto il numero e la data: una perifrasi rende l'atto meno
   reperibile, cioè lavora contro la funzione del modulo;
2. la reticenza di progetto (runbook §4) protegge **prodotti, aziende e terminologie sotto
   licenza**. Un ente pubblico normatore non è nessuna delle tre, e nominarlo non pubblica alcun
   parametro proprietario;
3. `10_fondamenti/12` nomina sistematicamente `ACN` e `AgID` **sugli stessi identici atti** che il
   modulo 20 designava per perifrasi: la perifrasi era quindi anche una divergenza fra due moduli
   della stessa guida sulla stessa citazione.

| Prima (perifrasi) | Dopo | Forma attestata in |
|---|---|---|
| «linee guida dell'agenzia nazionale» | **linee guida AgID** | `10_fondamenti/12`, `02` |
| «avviso dell'agenzia nazionale n. 41…» | **Avviso AgID n. 41, versione 2, del 23 marzo 2023** | `10_fondamenti/07 §glossario` |
| «Determinazione dell'autorità nazionale per la cybersicurezza n. 379907…» | **Determinazione ACN n. 379907 del 19 dicembre 2025** | `10_fondamenti/12` |
| «Circolare dell'agenzia nazionale 18 aprile 2017, n. 2/2017» | **Circolare AgID 18 aprile 2017, n. 2/2017** | `10_fondamenti/12` |
| «determinazioni dell'autorità nazionale» | **determinazioni ACN** | `10_fondamenti/12` |
| «dichiarare nominativamente all'autorità» | **dichiarare nominativamente ad ACN** | `10_fondamenti/12` |

**Resa inglese**: la sigla resta invariata e lo scioglimento italiano è seguito dalla glossa inglese
alla prima occorrenza, secondo il pattern §3 - *AgID, Agenzia per l'Italia digitale, the Italian
agency for digital government*; *ACN, Agenzia per la cybersicurezza nazionale, the national
cybersecurity agency*. Le rese perifrastiche già fissate per `06_security` (*the national
authority's baseline specifications*) **non cambiano**: lì la perifrasi è dell'originale italiano.

**Che cosa la decisione non tocca.** Gli estremi restano quelli dell'originale: la
`Determinazione n. 127437 del 2026` **resta senza il giorno** (`N-3` del registro), e le due
determinazioni del 2026 restano prive della sigla dell'ente, perché l'originale non ne designava
alcuno e aggiungerlo sarebbe completare un estremo, non uniformare una designazione.
