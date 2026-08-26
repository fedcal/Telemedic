# Terminologie cliniche di terze parti

*[English version below](#third-party-clinical-terminologies)*

> **Leggi questa pagina prima di aggiungere contenuto terminologico al repository, e prima di
> installare Telemedic in un contesto reale.** Le licenze delle terminologie cliniche non
> seguono la licenza del progetto, e alcune sono incompatibili con la sua stessa esistenza
> come progetto open source pubblico.

## Terminologie cliniche: che cosa questo progetto fa e che cosa non fa

Telemedic è rilasciato sotto licenza **Apache-2.0**. La licenza Apache-2.0 si applica **esclusivamente** al codice sorgente, alla documentazione e agli artefatti prodotti dal progetto Telemedic.

**Apache-2.0 non si applica, e non può applicarsi, ai contenuti terminologici di terzi.** Il progetto non detiene i diritti su tali contenuti e non è nella condizione di concederli.

### Che cosa il progetto NON distribuisce

Il repository di Telemedic **non contiene** e **non distribuisce**, in nessuna forma:

- contenuti di **SNOMED CT** (concetti, descrizioni, relazioni, reference set, file di release RF2, value set espansi, sottoinsiemi, cross-map, gerarchie precalcolate);
- contenuti di **ATC/DDD** del WHO Collaborating Centre for Drug Statistics Methodology;
- contenuti di **ICD-10** o **ICD-11** dell'Organizzazione Mondiale della Sanità;
- contenuti di **CPT** dell'American Medical Association;
- i documenti degli standard **HL7 v2.x**, i **Technical Framework IHE** o lo **standard DICOM**.

### In che modo il progetto vi fa riferimento

Telemedic fa riferimento a queste terminologie **soltanto** tramite:

- l'**URI canonico del sistema di codifica** (per esempio `http://snomed.info/sct`), che è un identificatore definito dalla specifica HL7 FHIR, rilasciata sotto Creative Commons Zero;
- i **codici** che l'utilizzatore, il professionista sanitario o il sistema chiamante immettono o trasmettono;
- **operazioni terminologiche** (`$expand`, `$lookup`, `$validate-code`, `$translate`, `$subsumes`) rivolte a un **servizio terminologico esterno**, che il soggetto che installa il sistema configura e la cui licenza è **sua responsabilità esclusiva**.

### Obblighi a carico di chi installa ed esercisce il sistema

Chi installa, configura, esercisce, distribuisce o commercializza Telemedic - o un prodotto che lo incorpora - è **l'unico responsabile** dell'ottenimento e del mantenimento delle licenze necessarie per le terminologie cliniche che intende utilizzare, secondo la giurisdizione in cui opera.

**In particolare, per SNOMED CT**: l'**Italia non è un paese Membro di SNOMED International**. Non esiste una licenza nazionale italiana gratuita. Ogni utilizzatore in Italia deve procurarsi autonomamente una **Affiliate License** a titolo oneroso, tramite il *Member Licensing & Distribution Service* (<https://mlds.ihtsdotools.org/>), con rinnovo e dichiarazione d'uso annuali. **Il fatto di interrogare un servizio terminologico esterno gestito da terzi non esonera dall'obbligo di licenza**, perché un sistema che crea o analizza dati codificati con SNOMED CT è un *Data Processing System* ai sensi dell'accordo di licenza.

### Nessuna garanzia di conformità

Il progetto Telemedic **non rilascia alcuna garanzia** circa la sussistenza, la validità, l'estensione o la sufficienza di alcuna licenza terminologica in capo a chi utilizza il software, e **non risponde** dell'uso che ne viene fatto, coerentemente con le sezioni 7 e 8 della licenza Apache-2.0.

Il presente documento è una descrizione tecnica e **non costituisce consulenza legale**.
---

## Il quadro per terminologia

Ogni terminologia è collocata in uno di quattro regimi, verificati sul testo della licenza e
non su fonti secondarie:

| Regime | Significato | Terminologie |
|---|---|---|
| **A** | Coesistenza piena nei sorgenti sotto Apache-2.0 | LOINC (con attribuzione), HL7 Terminology, code system FHIR core |
| **B** | Directory `third-party/` con licenza e attribuzione proprie | ICD-9-CM italiano, nomenclatore e catalogo nazionale, UCUM |
| **C** | Acquisizione o interrogazione a runtime, a cura di chi installa | SNOMED CT, pacchetti delle guide italiane, interfaccia OMS |
| **D** | Esclusione totale: solo URI del sistema e codice | ATC/DDD, ICD-10, ICD-11, CVX in v1.0, terminologia DICOM, documenti HL7 v2, Technical Framework IHE |

Legenda della colonna "Ridistribuibile nel repository": **Sì** = regime A; **Condizionata** = regime B; **No (runtime)** = regime C; **No** = regime D.

| Terminologia | Titolare dei diritti | Costo | Ridistribuibile nel repository | Uso per riferimento URI + codice | Obblighi di attribuzione | Rischio residuo |
|---|---|---|---|---|---|---|
| **SNOMED CT** | SNOMED International (IHTSDO), Londra | **A pagamento in Italia** (non-Membro): baseline USD 1.954/anno per Hospital in Banda A, USD 652 per Practice; gratuito nei paesi Membri **[V]** | **No (runtime)** - cl. 2.7 esclude il repository pubblico | **Sì**, cl. 2.2.5 (identificativi + descrizioni nei messaggi clinici) - **ma solo per chi ha la licenza** | A carico del **deployer**: avviso cl. 8.3.1 su tutti i media di distribuzione + versione e data della release (cl. 8.3.2) | **Alto se violato** (risoluzione della licenza, fee arretrate, danno reputazionale). **Basso se la disciplina §2.4 è rispettata** |
| **LOINC** | Regenstrief Institute, Inc. + LOINC Committee | **Gratuito**, commerciale e non commerciale, in perpetuo **[V-sec]**. Registrazione gratuita per il download | **Sì** (regime A) | Sì | **Sì**: notice §3.3 in `NOTICE` e nell'elemento `copyright` di ogni ValueSet/CodeSystem | **Basso**. Attenzione a: traduzioni (derivati assegnati a Regenstrief) e codici con copyright di terzi |
| **ICD-9-CM versione italiana 2007** | Traduzione: Ministero della salute / IPZS. A monte: NCHS-CMS (USA), OMS | **Gratuito**; download dal portale ministeriale | **Condizionata** (regime B, `third-party/icd9cm-it/`) | Sì | Citazione del DM 18 dicembre 2008 e del Ministero della salute; data di estrazione | **Basso**: art. 5 L. 633/1941 + art. 52 CAD. Non nullo sulla catena a monte (OMS/NCHS) **[NV]** |
| **ICD-10** | Organizzazione Mondiale della Sanità | Regime **[NV]** - da accertare con `licensing@who.int` | **No** | Sì, `http://hl7.org/fhir/sid/icd-10` | Citazione OMS | **Medio** finché il regime non è accertato |
| **ICD-11 MMS** | Organizzazione Mondiale della Sanità | **Gratuito** sotto CC BY-ND 3.0 IGO **[V]** | **No** - ND vieta i derivati; §4.5 impone manleva | Sì, **`http://id.who.int/icd/release/11/mms`** (mai `hl7.org/fhir/sid/icd-11`) | Citazione §1.3; in trasmissione e storage: **codice + titolo + URI** (§1.2.3) | **Medio**: mapping e traduzioni richiedono accordo scritto separato con OMS (§1.2.4) |
| **ATC / DDD** | WHO Collaborating Centre for Drug Statistics Methodology, Oslo (`atcddd.fhi.no`) | Indice online gratuito; **file elettronici a pagamento**, ~200 EUR **[V-sec]** | **No** - *"Copying and distribution for commercial purposes is not allowed"* **[V]** | Sì (**[NV]** - non confermato dal titolare) | *"Use of all or parts of the material requires reference to the WHO Collaborating Centre for Drug Statistics Methodology"* **[V]** | **Alto se ridistribuito**; **basso** se si adotta AIC come codifica primaria (§6.6) |
| **Nomenclatore / catalogo nazionale prestazioni** | Repubblica Italiana (DM 23 giugno 2023, DM 26 novembre 2024) | **Gratuito** | **Condizionata** (regime B, `third-party/nomenclatore-it/`) | Sì | Citazione del decreto, della GU e della data di estrazione | **Molto basso** |
| **Cataloghi regionali** | Regioni (delibere di giunta, BUR) | **Gratuito** | **Sconsigliata** - accettare per riferimento dal tenant | Sì | Citazione della delibera | **Molto basso** (giuridico); **alto** in manutenzione: 21 cicli indipendenti |
| **UCUM** | Regenstrief Institute + UCUM Organization | **Gratuito** **[V]** | **Condizionata** (regime B) - o dipendenza esterna, preferibile | Sì | Copyright notice + riferimento alla licenza + disclaimer + testo o URL della licenza **[V]** | **Basso**. Da notare: licenza **revocabile** e derivati vietati |
| **HL7 Terminology (THO)** | HL7 International | **Gratuito** | **Sì** (regime A) - **CC0** **[V]** | Sì | Nessuno (CC0) | **Molto basso**. Verificare l'origine dei concetti veicolati (§9.4) |
| **Code system FHIR core** | HL7 International | **Gratuito** | **Sì** (regime A) - **CC0** **[V]** | Sì | Nessuno. **Vincoli di marchio** su FHIR®/HL7® **[V]** | **Molto basso**. Rischio marchio se usato nel naming |
| **CVX** | CDC / NCIRD (USA) | Presumibilmente gratuito | **No** in v1.0 - licenza **[NV]** | n/a in v1.0 | **[NV]** | **Indeterminato**; azzerato escludendolo dal perimetro v1.0 |
| **DICOM controlled terminology** | NEMA | Standard pubblicato gratuitamente | **No** - solo i codici usati per riferimento | Sì, `http://dicom.nema.org/resources/ontology/DCM` | Marchio DICOM® di NEMA **[V]** | **Basso** con uso per riferimento |
| **Specifica FHIR (core)** | HL7 International | **Gratuito** | **Sì** - **CC0** **[V]** | n/a | Vincoli di marchio (§10.1) | **Molto basso** |
| **Standard HL7 v2.x** | HL7 International | Gratuito con registrazione | **No** - *"You may not... copy or distribute HL7's publication Product"* **[V-sec]** | n/a | - | **Basso** se si usano le tabelle v2 da THO |
| **Technical Framework IHE** | IHE International | **Gratuito** | **No** - licenza `non-sublicensable` **[V]** | n/a | Citazione per URL e revisione | **Basso** con citazione per URL |
| **IG e pacchetti HL7 Italia** | HL7 Italia (publisher segnaposto su *Televisita*) | **Gratuito** | **No (runtime)** - dipendenza risolta a build time | Sì (canonical URL) | Da definire con HL7 Italia (§9.3) | **Medio**: licenza non pienamente attribuibile + contenuti di terzi ricompresi |

---

---

## Regole per chi contribuisce

Sono vincolanti e verificate da un controllo automatico in integrazione continua.

1. **Non aggiungere file di release SNOMED CT** al repository, in nessun formato, nemmeno in
   directory ignorate, nemmeno «solo per provare in locale». L'accordo di licenza si perfeziona
   **scaricando o accedendo** al contenuto: finché nessuno lo scarica, il progetto non ne è
   vincolato.
2. **Non incorporare descrizioni di concetti SNOMED** in esempi, test o value set. Codice e URI
   del sistema sono ammessi: sono l'uso per riferimento.
3. **Non aggiungere contenuti ATC/DDD, ICD-10 o ICD-11** in nessuna forma.
4. **Non creare file di traduzione dei nomi LOINC.** Le traduzioni sono opere derivate assegnate
   a Regenstrief: le stringhe italiane dell'interfaccia del progetto devono restare separate
   architetturalmente dal contenuto di `Coding.display`.
5. **Ogni `CodeableConcept` porta `system` esplicito.** Ometterlo è un difetto tecnico e, per
   alcune terminologie, una violazione della licenza.
6. **Se il controllo automatico segnala un falso positivo, non aggirarlo**: aprine discussione
   nella pull request.

## Se il controllo blocca la tua pull request

Non è un errore di configurazione da disattivare. Significa che il contributo introduce
contenuto la cui provenienza contraddice la licenza dichiarata dal progetto - la cosa esatta
che un integratore commerciale verifica in fase di *due diligence*, e che se trovata fa
saltare l'adozione. Il costo di rimuoverlo ora è una modifica; il costo di rimuoverlo dopo è
una riscrittura della cronologia e una comunicazione a chi ha già installato.

---

# Third-party clinical terminologies

## Clinical terminologies: what this project does and does not do

Telemedic is released under the **Apache-2.0** licence. Apache-2.0 applies **exclusively** to the source code, documentation and artefacts produced by the Telemedic project.

**Apache-2.0 does not, and cannot, apply to third-party terminology content.** The project does not hold rights in such content and is not in a position to grant them.

### What the project does NOT distribute

The Telemedic repository **does not contain** and **does not distribute**, in any form:

- **SNOMED CT** content (concepts, descriptions, relationships, reference sets, RF2 release files, expanded value sets, sub-sets, cross-maps, pre-computed hierarchies);
- **ATC/DDD** content of the WHO Collaborating Centre for Drug Statistics Methodology;
- **ICD-10** or **ICD-11** content of the World Health Organization;
- **CPT** content of the American Medical Association;
- the **HL7 v2.x** standard documents, the **IHE Technical Frameworks** or the **DICOM** standard.

### How the project references them

Telemedic references these terminologies **only** through:

- the **canonical code system URI** (for example `http://snomed.info/sct`), which is an identifier defined by the HL7 FHIR specification, released under Creative Commons Zero;
- the **codes** entered or transmitted by the user, the healthcare professional or the calling system;
- **terminology operations** (`$expand`, `$lookup`, `$validate-code`, `$translate`, `$subsumes`) addressed to an **external terminology service**, which the deploying party configures and for whose licence that party is **solely responsible**.

### Obligations of the party installing and operating the system

Any party that installs, configures, operates, distributes or commercialises Telemedic - or a product incorporating it - is **solely responsible** for obtaining and maintaining the licences required for the clinical terminologies it intends to use, according to the jurisdiction in which it operates.

**For SNOMED CT in particular**: **Italy is not a Member country of SNOMED International.** No free Italian national licence exists. Every user in Italy must independently obtain a paid **Affiliate License** through the *Member Licensing & Distribution Service* (<https://mlds.ihtsdotools.org/>), with annual renewal and usage reporting. **Querying an externally operated terminology service does not remove the licensing obligation**, because a system that creates or analyses data encoded using SNOMED CT is a *Data Processing System* within the meaning of the licence agreement.

### No warranty of compliance

The Telemedic project makes **no warranty** as to the existence, validity, scope or sufficiency of any terminology licence held by any user of the software, and **accepts no liability** for the use made of it, consistently with sections 7 and 8 of the Apache-2.0 licence.

This document is a technical description and **does not constitute legal advice**.

---

*Questo documento sintetizza un'analisi condotta sul testo delle licenze. L'accordo di licenza
SNOMED CT è regolato dal diritto inglese con giurisdizione esclusiva delle corti inglesi; i
termini d'uso dell'Organizzazione Mondiale della Sanità sono regolati dal diritto svizzero con
arbitrato. L'interpretazione di clausole contrattuali estere richiede competenze che esulano da
un'analisi documentale: prima del rilascio v1.0 il documento va sottoposto a un legale
abilitato.*

*This document summarises an analysis conducted on the text of the licences. The SNOMED CT
licence agreement is governed by English law with exclusive jurisdiction of the English courts;
the World Health Organization terms of use are governed by Swiss law with arbitration.
Interpreting foreign contractual clauses requires expertise beyond documentary analysis: before
the v1.0 release this document must be reviewed by a qualified lawyer.*
