# log-B5 - Licenze delle terminologie cliniche e compatibilità Apache-2.0

- **Agente**: B5 (seconda ondata di ricerca)
- **Data**: 25 agosto 2026
- **Output**: [`.telemedic/research/B5-licenze-terminologie.md`](../research/B5-licenze-terminologie.md)
- **Input letti**: `00_PROJECT_BRIEF.md` (regola R0 rispettata), `R1-standard-sanitari.md` §8 e §10.3
- **File non toccati** (in scrittura da altro agente): `R2-normativa-mdr-gdpr-licenze.md`, `log-R2.md`

---

## 1. Mandato e come è stato eseguito

Produrre la policy terminologica giuridicamente fondata del progetto, verificando su fonti primarie il regime di licenza di SNOMED CT, LOINC, ICD-9-CM italiana, ICD-10/11, ATC/DDD, nomenclatore nazionale, CVX, UCUM, HL7 Terminology, IG HL7 Italia, specifiche HL7 e IHE, e stabilendo per ciascuna la compatibilità con Apache-2.0.

Due documenti contrattuali sono stati **letti integralmente**, non riassunti da fonti secondarie:

1. **SNOMED CT Affiliate License Agreement**, versione in vigore dal 31 luglio 2023 (19 pagine, 15 clausole + Appendix A *Defined Terms* + Appendix B *License Fees in Non-Member Territories*), reperito su mirror istituzionale dell'autorità competente tedesca.
2. **OMS - ICD/ICF/ICHI Digital Version, Terms of Use and License Agreement**, © WHO 2020 (5 pagine).

È la base che permette di citare clausole numerate anziché parafrasi.

---

## 2. I dodici fatti che cambiano le decisioni del progetto

1. **La clausola 2.7 dell'Affiliate License chiude la questione SNOMED da sola.** Il Licensee deve garantire che l'International Release *"cannot be accessed or downloaded from the Licensee's systems except by authorised users"*. Un repository GitHub pubblico è l'esatto contrario. Non esiste modo di pubblicare contenuto SNOMED CT in un repo open source pubblico rispettando la licenza.

2. **La clausola 2.2.5 è la base giuridica esatta dell'uso "per riferimento"** - trasmettere messaggi clinici il cui contenuto SNOMED consiste *"solely of SNOMED CT Identifiers and descriptions of SNOMED CT concepts"*. È precisamente un `Coding` FHIR. **Ma la cl. 2.2 si apre con "The Licensee may only use..."**: non esiste franchigia per chi non ha licenza.

3. **L'accordo si perfeziona per fatto concludente, scaricando o accedendo al contenuto.** Corollario decisivo: **se il progetto non scarica mai SNOMED CT, non diventa mai Licensee e l'accordo non lo vincola mai.** È la linea di difesa più solida disponibile, ed è fragile: basta un manutentore che scarichi i file RF2 "per provare" per perderla. → Regola in `CONTRIBUTING.md` + *terminology guard* in CI.

4. **Interrogare un terminology server esterno NON esonera il deployer.** Un'installazione che crea o analizza record codificati con SNOMED CT è un *Data Processing System* (Appendix A), e Appendix B par. 2.1 lega la fee proprio a questo. Il server esterno risolve il problema **della distribuzione** (che è del progetto), non quello **della licenza d'uso** (che è del deployer). Presentarlo come soluzione completa sarebbe fuorviante.

5. **Chi distribuisce Telemedic distribuisce un "Licensee Product".** La definizione di Appendix A include i prodotti che *"read or write records or other data that is encoded using SNOMED CT"* - **anche se non contengono un solo concetto SNOMED**. L'integratore che commercializza Telemedic deve quindi essere Affiliate, concedere sub-licenze conformi (cl. 2.5) e mantenerne il registro ispezionabile (cl. 8.8).

6. **La catena di sub-licenza SNOMED è strutturalmente incompatibile con Apache-2.0 §2.** Apache concede `sublicense` in modo irrevocabile e senza tracciamento; la cl. 2.5.3 lo nega al sub-licenziatario, la cl. 2.5.4 lo rende revocabile a cascata, la cl. 8.8 lo rende tracciato. Incompatibilità per costruzione, non per formulazione.

7. **Costi effettivi in Italia** (non-Membro, presumibilmente Banda A - allocazione da confermare per iscritto): **USD 1.954/anno per Hospital, USD 652 per Practice**, moltiplicati per sito fisico (Appendix B par. 1.5), dovuti **anche in ambienti non di produzione** (par. 1.8). App mobile e servizi internet che consentono estrazione ricadono in regime negoziato caso per caso (par. 1.7). **Nessuna delle quattro esenzioni** (basso reddito, sviluppo, ricerca qualificata, uso umanitario) **è applicabile al progetto**: la ricerca qualificata richiede un progetto a termine, peer-reviewed e non commerciale, e D1 destina espressamente Telemedic all'integrazione commerciale.

8. **LOINC è confermato ridistribuibile**: *"Permission is hereby granted in perpetuity, without payment of license fees or royalties, to use, copy, or **distribute** the Licensed Materials for **any commercial or non-commercial purpose**"*. La raccomandazione di R1 §10.3 punto 1 regge. **Trappola non ovvia**: le **traduzioni sono opere derivate assegnate a Regenstrief**, previa notifica email obbligatoria. Un file con i nomi italiani dei codici LOINC sarebbe un'opera di cui il progetto non è titolare → serve un ADR che separi le stringhe i18n del progetto dal `Coding.display` ufficiale.

9. **Chiusa la questione Q4 di R1 (ATC).** Termini WHOCC accertati e verbatim: *"Copying and distribution for **commercial purposes is not allowed**"* e *"Changing or manipulating the material is not allowed"*. **Frontalmente incompatibile con Apache-2.0 e con la decisione D1.** → ATC escluso in ogni forma. Mitigazione a costo zero: in Italia la codifica operativa del farmaco è l'**AIC**, non l'ATC. Nota: il dominio è migrato da `whocc.no` a `atcddd.fhi.no` (HTTP 301); l'URI canonico FHIR resta `http://www.whocc.no/atc` e **non va aggiornato** (è un identificatore, non un indirizzo).

10. **ICD-11 è CC BY-ND 3.0 IGO** - i derivati sono vietati, il §4.5 impone una **manleva a favore dell'OMS** e il §4.7 prevede terminazione automatica: tre incompatibilità con Apache-2.0. Il §1.2.2 chiarisce però che **l'incorporazione in un software non è un'"adaptation"**, purché non si riproduca il contenuto senza codici o senza URI; il §1.2.3 impone che trasmissione e memorizzazione includano **codice, titolo e URI**; il §1.2.4 sottopone **mappature e traduzioni ad accordo scritto separato con l'OMS**. Confermato che **`http://hl7.org/fhir/sid/icd-11` è errato**: l'URI canonico è `http://id.who.int/icd/release/11/mms`.

11. **ICD-9-CM italiano e nomenclatore nazionale sono riusabili**, in base all'**art. 5 L. 633/1941** (i testi degli atti ufficiali dello Stato sono esclusi dall'ambito di applicazione del diritto d'autore) combinato con l'**art. 52, c. 2, CAD** (open data by default) e il **d.lgs. 36/2006**. Vanno però collocati in `third-party/` con attribuzione propria, perché non sono opera del progetto.

12. **Principio generale che vale oltre il caso italiano: una dichiarazione CC0 apposta su un Implementation Guide non dispone dei diritti di terzi sul contenuto ricompreso.** `hl7.fhir.it.terminology` è CC0-1.0 e contiene code system **AIFA/ATC** e value set **SNOMED CT**: la dichiarazione CC0 non li libera. Simmetricamente, HL7 dichiara THO CC0 **avvertendo** che SNOMED/DICOM/CPT non lo sono. → verifica **artefatto per artefatto** della titolarità del contenuto, non della licenza del contenitore.

**Fatto aggiuntivo con impatto pratico immediato**: l'IG HL7 Italia **Televisita 0.2.0** dichiara `license: "CC0-1.0"` ma con `publisher = "Example Publisher"` e `contact.url = "http://example.org/example-publisher"` - **i segnaposto del template dell'IG Publisher, mai sostituiti**. La dichiarazione di licenza esiste ma **non è attribuibile a un soggetto identificato**, mentre il sito `hl7.it` riserva tutti i diritti. Il pacchetto dichiara inoltre la dipendenza `hl7.fhir.it.terminology: current`, **versione flottante** - difetto di gestione della configurazione ai sensi di IEC 62304, oltre che ostacolo alla riproducibilità.

---

## 3. Decisioni raccomandate

### 3.1 I quattro regimi

| Regime | Terminologie |
|---|---|
| **A - coesistenza piena** nei sorgenti Apache-2.0 | LOINC (con attribuzione), HL7 Terminology (CC0), code system FHIR core (CC0) |
| **B - directory `third-party/` con licenza propria** | ICD-9-CM italiano, nomenclatore/catalogo nazionale, UCUM (meglio ancora: dipendenza esterna) |
| **C - acquisizione/interrogazione a runtime dal deployer** | SNOMED CT (terminology server esterno), pacchetti IG HL7 Italia (dipendenza risolta a build time), ICD-API OMS installabile localmente |
| **D - esclusione totale, solo URI+codice** | ATC/DDD, ICD-10, ICD-11, CVX (in v1.0), terminologia DICOM, documenti standard HL7 v2, Technical Framework IHE |

### 3.2 Conferme e correzioni rispetto a R1 §10.3

| Punto R1 §10.3 | Esito |
|---|---|
| 1 - LOINC terminologia di riferimento | **Confermato**, con l'avvertenza aggiuntiva sulle traduzioni |
| 2 - ICD-9-CM italiana per le diagnosi | **Confermato**, con base giuridica esplicitata (art. 5 L. 633/1941 + art. 52 CAD) e collocazione in regime B |
| 3 - Catalogo nazionale prestazioni | **Confermato**; aggiunta: i cataloghi **regionali** vanno accettati per riferimento dal tenant, non incorporati (21 cicli indipendenti) |
| 4 - SNOMED solo per riferimento, espansione delegata | **Confermato e precisato**: il terminology server esterno **non esonera il deployer** dall'obbligo di licenza |
| 5 - ogni `CodeableConcept` con `system` esplicito | **Confermato**; rafforzato dal §1.2.2–1.2.3 dei ToU OMS, che rendono l'omissione dell'URI una violazione della licenza |
| 6 - `NOTICE` e documentazione di deployment | **Confermato**, con precisazione tecnica: il `NOTICE` di Apache-2.0 §4(d) va **breve**, con rinvio a `THIRD-PARTY-TERMINOLOGY.md`, perché un testo lungo e prescrittivo rischia di essere letto come modifica della licenza |

### 3.3 Costo funzionale della prudenza, dichiarato

Il costo più alto: **senza terminology server configurato, i binding SNOMED non si validano**. Il value set di `Encounter.reasonCode` conta circa 4.000 codici. In un'installazione appena avviata la validazione di quei binding fallisce o va disattivata. Mitigazione: il sistema deve essere **pienamente funzionale con `terminology.snomed.enabled=false`**, appoggiandosi a LOINC + ICD-9-CM + catalogo nazionale, che non costano nulla.

Costi minori: esempi FHIR meno leggibili; separazione architetturale fra i18n e `Coding.display`; build che richiede rete verso il registry dei pacchetti FHIR; documentazione che deve descrivere i profili IHE invece di citarli.

**Beneficio**: un integratore che faccia due diligence trova una catena di licenze coerente e priva di contenuti la cui provenienza contraddica la licenza dichiarata. Per un progetto che esiste per essere integrato in prodotti proprietari (D1), non è un costo di conformità: è il prodotto.

---

## 4. Deliverable contenuti nel documento

- **§11.2** - matrice di compatibilità Apache-2.0 per tutte le terminologie.
- **§13** - tabella riassuntiva completa: terminologia · titolare · costo · ridistribuibilità · uso per riferimento · attribuzione · rischio residuo.
- **§14** - testi **pronti all'uso**, in italiano e in inglese: file `NOTICE`, `THIRD-PARTY-TERMINOLOGY.md`, clausole per la documentazione di deployment, elemento `copyright` per i `ValueSet` LOINC, `LICENSE-NOTICE.md` per le directory in regime B, frase per la comunicazione pubblica.
- **§15** - procedura operativa per il deployer in 6 fasi (perimetro, SNOMED, terminology server, terminologie gratuite, evidenze, configurazione), con destinatari e tempi indicativi.
- **§16** - ripartizione degli obblighi: **11 obblighi del progetto** (P1-P11), **13 obblighi dell'utilizzatore** (U1-U13), **3 aree di responsabilità condivisa** da regolare contrattualmente.
- **§12** - traduzione in architettura: struttura del repository, checklist di revisione dei value set, ***terminology guard* in CI**, politica di contribuzione.
- **§17** - 9 rischi residui valutati, cadenze di manutenzione della policy, 11 questioni per gli altri agenti, **13 punti [NV] da chiudere prima del rilascio**.

---

## 5. Questioni aperte per gli altri agenti

| # | Destinatario | Questione |
|---|---|---|
| B5-A1 | Architettura | *Terminology gateway* come punto unico di accesso, con cache **non persistita su disco** (una cache persistente di risposte SNOMED è un *Sub-Set* → *Derivative*) e disabilitazione per `system`. Risponde anche a **Q2** di R1. |
| B5-A2 | Architettura | ADR sulla separazione fra stringhe i18n del progetto e `Coding.display` ufficiale (vincolo LOINC sulle traduzioni). |
| B5-A3 | Architettura | Il catalogo prestazioni è dato di riferimento incluso o esclusivamente per riferimento dal tenant? |
| B5-C1 | Conformità MDR | **Chiude Q3 di R1**: la valutazione Apache-2.0 / Affiliate License è al §2 e §11, il disclaimer al §14. Da recepire nel fascicolo tecnico. |
| B5-C2 | Conformità MDR | **Chiude Q4 di R1**: termini ATC accertati, contenuto escluso. |
| B5-C3 | Conformità MDR | Classificare il terminology server come **SOUP** IEC 62304 e verificarne la compatibilità con il vincolo **V1** (nessun componente obbligatorio fuori UE). |
| B5-D1 | Documentazione | Recepire i testi del §14 in `NOTICE`, `THIRD-PARTY-TERMINOLOGY.md`, `CONTRIBUTING.md` e `docs/08_compliance/terminologie/`, bilingue (D3). |
| B5-D2 | Documentazione | Correggere la comunicazione pubblica con la formula del §14.6. |
| B5-S1 | Sicurezza / DevOps | Implementare il *terminology guard* in CI con allowlist versionata e motivata. |
| B5-R1 | Roadmap | Le pratiche MLDS richiedono **settimane**: se un deployer pilota richiede SNOMED CT, la pratica va aperta con largo anticipo rispetto al 30 novembre 2026. |
| B5-R2 | Relazioni esterne | Richiesta scritta a HL7 Italia: licenza dei pacchetti, campi `publisher` segnaposto, regime dei contenuti di terzi ricompresi. |

---

## 6. Limiti dichiarati

Fonti **non leggibili** con gli strumenti disponibili, elencate al §0.1 del documento e da chiudere prima del rilascio:

- `loinc.org/license` e `loinc.org/kb/license` → **HTTP 403** (protezione anti-bot). Le clausole LOINC sono **[V-sec]**, non **[V]**.
- `salute.gov.it` → schermata di verifica anti-DDoS: la pagina della pubblicazione ICD-9-CM 2007 e le note legali del portale non sono state lette direttamente.
- `orders.atcddd.fhi.no` → applicazione JavaScript: prezzo (~200 EUR, **[V-sec]**) e condizioni contrattuali non verificati in forma primaria.
- Regime dell'**ICD-10** distinto da ICD-11 → **[NV]**, da chiudere con `licensing@who.int`.
- Licenza esplicita di **CVX** → **[NV]**; azzerata escludendo CVX dal perimetro v1.0.
- Licenza dichiarata dai pacchetti *It-Core*, *Teleconsulto*, *Teleassistenza*, *Telemonitoraggio* → **[NV]**.

**Il documento contiene un disclaimer esplicito: è analisi tecnica, non consulenza legale.** L'Affiliate License Agreement SNOMED CT è regolato dal **diritto inglese** con giurisdizione esclusiva delle corti inglesi (cl. 15.1–15.2); i *Terms of Use* dell'OMS dal **diritto svizzero** con arbitrato UNCITRAL (§4.10). L'interpretazione di clausole contrattuali estere richiede competenze che esulano da un'analisi documentale. Va sottoposto a un legale abilitato prima del rilascio v1.0.

**Regola R0**: rispettata integralmente. Nessun nome di azienda, prodotto commerciale, marchio o dominio di potenziale partner compare nell'output.
