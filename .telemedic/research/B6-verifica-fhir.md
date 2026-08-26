# B6 - Verifica su fonte primaria dei punti `[NV]` di R1 e delle questioni aperte di R5

> **Agente**: B6 (seconda ondata di ricerca - chiusura dei non verificati)
> **Data**: 25 agosto 2026
> **Regola R0 applicata**: nessun nome di azienda, prodotto commerciale o dominio di potenziale partner. Dove uno standard include codici il cui identificatore coincide con un marchio commerciale di videoconferenza, si segue la disciplina già adottata da R1: il fatto è riportato, gli identificatori-marchio non sono trascritti.
> **Legenda esiti**: `VERIFICATA` = confermata su fonte primaria; `SMENTITA` = la fonte primaria contraddice quanto scritto in R1/R5; `PARZIALE` = confermata solo in parte, con residui espressamente delimitati; `NON VERIFICABILE` = la fonte primaria non espone il dato (assenza accertata) o non è stata raggiungibile.

---

## 1. URL canonico della cross-version extension per `VirtualServiceDetail`

**Esito: VERIFICATA** (l'URL ipotizzato da R1 è corretto) - **con due correzioni collaterali**.

### 1.1 Il pacchetto e la sua versione

| Dato | Valore accertato |
|---|---|
| Titolo IG | *Extensions for Using Data Elements from FHIR R5 in FHIR R4* |
| Versione | **0.1.0** |
| Stato | STU - *maturity level 0* |
| Package id | `hl7.fhir.uv.xver-r5.r4` |
| Canonical dell'IG | `http://hl7.org/fhir/uv/xver/ImplementationGuide/hl7.fhir.uv.xver-r5.r4` |
| Home | <http://hl7.org/fhir/uv/xver-r5.r4/0.1.0/> |

**Correzione a R1 §2.10.1**: R1 riporta come unica versione rilevata `0.0.1-snapshot-2` e ne deduce l'inutilizzabilità in produzione. Esiste oggi una **0.1.0 pubblicata come STU**. Resta vero che il *maturity level* dichiarato è 0 e che il pinning esplicito della versione rimane obbligatorio, ma l'affermazione «solo snapshot pre-release» non è più esatta.

### 1.2 L'URL canonico

Verificato sulla `StructureDefinition` pubblicata (<http://hl7.org/fhir/uv/xver-r5.r4/0.1.0/StructureDefinition-ext-R5-Encounter.virtualService.html>):

| Attributo | Valore esatto |
|---|---|
| **Canonical URL** | `http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.virtualService` |
| **id** | `ext-R5-Encounter.virtualService` |
| **Title** | `ExtensionEncounter_VirtualService` |
| Contesto d'uso | elemento `Encounter` in FHIR R4 |
| `value[x]` | 0..0 (estensione complessa) |

Esiste l'analoga per `Appointment` (<http://hl7.org/fhir/uv/xver-r5.r4/0.1.0/StructureDefinition-ext-R5-Appointment.virtualService.html>):

| Attributo | Valore esatto |
|---|---|
| **Canonical URL** | `http://hl7.org/fhir/5.0/StructureDefinition/extension-Appointment.virtualService` |
| **id** | `ext-R5-Appointment.virtualService` |

> Nota sul pattern: la home dell'IG documenta anche una forma `http://hl7.org/fhir/uv/xver/StructureDefinition/ext-R5-[Resource].[element]`. Il valore **effettivamente presente nell'elemento `url` della `StructureDefinition` pubblicata** è quello della tabella qui sopra (`http://hl7.org/fhir/5.0/StructureDefinition/…`). È quello da scrivere nelle istanze.

### 1.3 Struttura delle sotto-estensioni

Sotto-estensioni definite dall'estensione `extension-Encounter.virtualService`:

| Sotto-estensione | Card. | Tipo | Note |
|---|---|---|---|
| `_datatype` | 1..1 | `string` | valore fisso `VirtualServiceDetail` - **marcatore obbligatorio**, assente nell'esempio di R1 |
| `channelType` | 0..1 | `Coding` | - |
| `address` | 0..1 | complessa | contiene a sua volta `_datatype` = `ExtendedContactDetail` e le sotto-estensioni `purpose`, `name`, `telecom`, `address`, `organization`, `period` |
| `additionalInfo` | 0..* | `url` | - |
| `maxParticipants` | 0..1 | `positiveInt` | - |
| `sessionKey` | 0..1 | `string` | - |

**Rilievo sull'esempio JSON di R1 §2.10.4**: manca la sotto-estensione obbligatoria `_datatype` (1..1); inoltre la forma `{ "url": "address", "valueUrl": "…" }` non è stata riscontrata nella `StructureDefinition` pubblicata, che presenta `address` come **estensione complessa** su `ExtendedContactDetail`. Prima di pubblicare quell'esempio va risolto il pacchetto `hl7.fhir.uv.xver-r5.r4#0.1.0` e validata l'istanza. **Questo punto specifico resta `PARZIALE`.**

### 1.4 Utilizzabilità in un progetto che dichiara R4

Sì: l'estensione è definita **per il contesto R4** (l'IG si intitola letteralmente «for Using Data Elements from FHIR R5 in FHIR R4») e ha come contesto d'uso l'elemento `Encounter` di R4. Una risorsa che la usa resta un `Encounter` R4 valido, purché il validatore disponga del pacchetto. Il vincolo pratico è il *maturity level 0*: va pinnata la versione e va documentato che l'estensione può cambiare.

### 1.5 Struttura reale di `VirtualServiceDetail` in R5 - **R1 contiene tre errori**

Fonte: <https://hl7.org/fhir/R5/metadatatypes-definitions.html> e <https://hl7.org/fhir/R5/valueset-virtual-service-type.html>.

| Elemento | Card. | Tipo | Definizione verbatim |
|---|---|---|---|
| `channelType` | 0..1 | `Coding` | *"The type of virtual service to connect to (i.e. Teams, Zoom, Specific VMR technology, WhatsApp)."* |
| `address[x]` | 0..1 | **`url` \| `string` \| `ContactPoint` \| `ExtendedContactDetail`** | *"What address or number needs to be used for a user to connect to the virtual service to join. The channelType informs as to which datatype is appropriate to use (requires knowledge of the specific type)."* |
| `additionalInfo` | 0..* | **`url`** | *"Address to see alternative connection details."* |
| `maxParticipants` | 0..1 | `positiveInt` | *"Maximum number of participants supported by the virtual service."* |
| `sessionKey` | 0..1 | `string` | *"Session Key required by the virtual service."* |

Errori nella tabella di R1 §2.10.1:

1. `additionalInfo` è di tipo **`url`**, non `ExtendedContactDetail`.
2. `address[x]` ammette **quattro** tipi, non tre: manca `ExtendedContactDetail`.
3. Il binding di `channelType` al ValueSet `http://hl7.org/fhir/ValueSet/virtual-service-type` ha forza **`Example`**, **non `required`**. Cade quindi l'intero ragionamento di R1 secondo cui «il binding di `channelType` è required ma il value set è composto da marchi commerciali»: non c'è alcun obbligo di conformarsi a quei tre codici, e una piattaforma sovrana può usare il proprio code system senza processo UTG.

Confermato invece: il ValueSet contiene **esattamente tre codici**, i cui identificatori corrispondono a nomi di piattaforme commerciali di videoconferenza di terze parti (non trascritti, R0), ed **è confermato l'errore redazionale** segnalato da R1: la definizione del primo codice recita *"the amount is the base price used for calculating the total price before applying surcharges, discount or taxes."*, testo evidentemente importato da un altro code system. Il ValueSet è marcato `experimental`, `immutable`, `draft`, maturity 1, con l'avvertenza *"not yet ready for production use"*.

---

## 2. Codici di `v3-ParticipationType` rilevanti per un consulto

**Esito: VERIFICATA.**

Code system: `http://terminology.hl7.org/CodeSystem/v3-ParticipationType`.
Fonte primaria: <https://hl7.org/fhir/R4/v3/ParticipationType/cs.html>.

| Code | Display esatto | Definizione verbatim |
|---|---|---|
| `PPRF` | `primary performer` | *"The principal or primary performer of the act."* |
| `SPRF` | `secondary performer` | *"A person assisting in an act through his substantial presence and involvement. This includes: assistants, technicians, associates, or whatever the job titles may be."* |
| `ATND` | `attender` | *"The practitioner that has responsibility for overseeing a patient's care during a patient encounter."* |
| `CON` | `consultant` | *"An advisor participating in the service by performing evaluations and making recommendations."* |
| `REF` | `referrer` | *"A person having referred the subject of the service to the performer (referring physician). Typically, a referring physician will receive a report."* |
| `PRF` | `performer` | *"A person, non-person living subject, organization or device that actually and principally carries out the action."* |
| `AUT` | `author (originator)` | *"A party that originates the Act and therefore has responsibility for the information given in the Act and ownership of this Act."* |

### 2.1 Ammissibilità nel value set di `Encounter.participant.type`

ValueSet: `http://hl7.org/fhir/ValueSet/encounter-participant-type` (<https://hl7.org/fhir/R4/valueset-encounter-participant-type.html>). Composizione accertata:

- da `http://terminology.hl7.org/CodeSystem/v3-ParticipationType`: tutti i discendenti di `_ParticipationAncillary`;
- **più i codici espliciti `SPRF`, `PPRF`, `PART`**;
- più tutti i codici di `http://terminology.hl7.org/CodeSystem/participant-type`;
- **meno** `_ParticipationAncillary` stesso.

Espansione: **12 concetti**, che includono `PPRF`, `SPRF`, `ATND`, `CON`, `REF`, oltre a `ADM` (admitter), `DIS` (discharger), `CALLBCK` (callback contact), `ESC` (escort), `PART` (Participation), `translator`, `emergency`.

**Conseguenza operativa**: `PPRF` per il medico che eroga la televisita e `SPRF` per un secondo professionista sono entrambi nel value set; `CON` è il codice corretto per un consulente in teleconsulto; `REF` per il medico inviante. Nessuna estensione del binding è necessaria.

---

## 3. Tabelle HL7 v2 0004 e 0357, e struttura del segmento `ERR` in v2.5

**Esito: VERIFICATA per le due tabelle; PARZIALE per il segmento `ERR`.**

### 3.1 Tabella 0004 - Patient Class

Fonte: <https://terminology.hl7.org/6.0.2/CodeSystem-v2-0004.html>.
Canonical: `http://terminology.hl7.org/CodeSystem/v2-0004` - OID `2.16.840.1.113883.18.5`.
Descrizione: *"concepts used by systems to categorize patients by site in HL7 Version 2.x interfaces in the PV1 segment"*.

| Code | Display |
|---|---|
| `E` | Emergency |
| `I` | Inpatient |
| `O` | **Outpatient** |
| `P` | Preadmit |
| `R` | Recurring patient |
| `B` | Obstetrics |
| `C` | Commercial Account |
| `N` | Not Applicable |
| `U` | Unknown |

→ **`PV1-2 = O` è corretto** per una prestazione ambulatoriale/televisita. Il `[NV]` di R1 riga 1352 si chiude come **VERIFICATA**.

### 3.2 Tabella 0357 - Message Error Condition Codes

Fonte: <https://terminology.hl7.org/6.0.2/CodeSystem-v2-0357.html>.
Canonical: `http://terminology.hl7.org/CodeSystem/v2-0357` - OID `2.16.840.1.113883.18.217`.

| Code | Display | Definizione |
|---|---|---|
| `0` | Message accepted | *"Success. Optional, as the AA conveys success. Used for systems that must always return a status code."* |
| `100` | Segment sequence error | *"Error: The message segments were not in the proper order, or required segments are missing."* |
| `101` | Required field missing | *"Error: A required field is missing from a segment"* |
| `102` | Data type error | *"Error: The field contained data of the wrong data type, e.g., an NM field contained \"FOO\"."* |
| `103` | Table value not found | *"Error: A field of data type ID or IS was compared against the corresponding table, and no match was found."* |
| `104` | Value too long | *"Error: a value exceeded the normative length, or the length that the application is able to safely handle."* |
| `198` | Non-Conformant Cardinality | *"An error related to HL7 message content not conformant with applicable specifications' cardinality."* |
| `199` | Other HL7 Error | *"Any other error with the HL7 syntax not captured in other error codes."* |
| `200` | Unsupported message type | *"Rejection: The Message Type is not supported."* |
| `201` | Unsupported event code | *"Rejection: The Event Code is not supported."* |
| `202` | Unsupported processing id | *"Rejection: The Processing ID is not supported."* |
| `203` | Unsupported version id | *"Rejection: The Version ID is not supported."* |
| `204` | Unknown key identifier | *"Rejection: The ID of the patient, order, etc., was not found."* |
| `205` | Duplicate key identifier | *"Rejection: The ID of the patient, order, etc., already exists."* |
| `206` | Application record locked | *"Rejection: The transaction could not be performed at the application storage level."* |
| `207` | Application error | *"Rejection: A catchall for internal errors not explicitly covered by other codes."* |

→ Il codice `207` citato da R1 §5 esiste ed è corretto (**VERIFICATA**).

### 3.3 Tabelle correlate al segmento `ERR` (tutte accertate su THO 6.0.2)

| Tabella | Nome | Canonical | OID | Codici |
|---|---|---|---|---|
| 0516 | **Error severity** (`errorSeverity`) | `http://terminology.hl7.org/CodeSystem/v2-0516` | `2.16.840.1.113883.18.337` | `W` Warning; `I` Information; `E` Error; `F` Fatal Error |
| 0517 | **Inform person code** (`informInstructions`) | `http://terminology.hl7.org/CodeSystem/v2-0517` | `2.16.840.1.113883.18.338` | `PAT` Inform patient; `NPAT` Do NOT inform patient; `USR` Inform User; `HD` Inform help desk |
| 0518 | **Override type** (`overrideType`) | `http://terminology.hl7.org/CodeSystem/v2-0518` | `2.16.840.1.113883.18.339` | `EXTN` Extension Override; `INLV` Interval Override; `EQV` Equivalence Override |

La descrizione di 0516 dichiara esplicitamente l'uso *"in the ERR segment"*; quella di 0518 *"in the ERR and OVR segments"*.

### 3.4 Struttura del segmento `ERR` in v2.5

Fonte: <https://www.hl7.eu/HL7v2x/v25/std25/ch02.html>, sezione *ERR - error segment*.

**Verificato con certezza** (concordante su tre estrazioni indipendenti della stessa pagina): sequenza, nome elemento, tipo di dato e item number.

| SEQ | DT | ITEM# | Element name | Tabella referenziata |
|---|---|---|---|---|
| ERR-1 | `ELD` | 00024 | Error Code and Location | - (campo **mantenuto per retro-compatibilità**) |
| ERR-2 | `ERL` | 01812 | Error Location | - |
| ERR-3 | `CWE` | 01813 | HL7 Error Code | **0357** |
| ERR-4 | `ID` | 01814 | Severity | **0516** |
| ERR-5 | `CWE` | 01815 | Application Error Code | tabella user-defined, numero **non verificato** |
| ERR-6 | `ST` | 01816 | Application Error Parameter | - |
| ERR-7 | `TX` | 01817 | Diagnostic Information | - |
| ERR-8 | `TX` | 01818 | User Message | - |
| ERR-9 | `IS` | 01819 | Inform Person Indicator | **0517** |
| ERR-10 | `CWE` | 01820 | Override Type | **0518** |
| ERR-11 | `CWE` | 01821 | Override Reason Code | 0519 (*dedotto per esclusione, tabella non raggiunta*) |
| ERR-12 | `XTN` | 01822 | Help Desk Contact Point | - |

**Residuo non verificabile con questo strumento**: le colonne **LEN** e **OPT** (obbligatorietà `R`/`O`/`B`) e **RP/#** (ripetibilità). Tre estrazioni della stessa pagina hanno prodotto valori LEN e OPT mutuamente incompatibili (per ERR-1: 250 / 256; per ERR-3 e ERR-4: `O` in un caso e non riportato negli altri). **Non sono pubblicabili.** Vanno letti sul PDF normativo HL7 v2.5, capitolo 2, tabella attributi ERR, oppure sul database ufficiale delle tabelle HL7. Il fatto rilevante per l'implementazione - che ERR in v2.5 **differisce radicalmente da v2.3**, dove `ERR-1` di tipo `CM` era l'unico campo - è **confermato**: in v2.5 `ERR-1` è marcato come mantenuto per retro-compatibilità e i campi utili sono `ERR-2` (`ERL`, posizione strutturata) e `ERR-3` (`CWE` su tabella 0357).

---

## 4. Codice fiscale: identifier type in PID-3 e `system` canonico nei profili FHIR italiani

### 4.1 PID-3 - identifier type code - **Esito: SMENTITA (il codice `NN` non esiste) + NON VERIFICABILE (nessuna convenzione italiana normativa)**

Fonte: <https://terminology.hl7.org/6.0.2/CodeSystem-v2-0203.html> (HL7 Table 0203 - Identifier Type).

Il concetto realmente presente ha come codice, carattere per carattere:

```
NNxxx
```

con display e definizione identici: *"National Person Identifier where the xxx is the ISO table 3166 3-character (alphabetic) country code"*.

Conseguenze:
1. **`NN` da solo non è un codice della tabella 0203.** L'affermazione di R1 riga 1351 va corretta.
2. Il codice per l'Italia si costruisce sostituendo `xxx` con il codice ISO 3166 alpha-3, cioè **`NNITA`**. `NNITA` **non è enumerato** come concetto in HL7 Terminology: è un valore generato dalla regola di formazione.
3. Altri codici della tabella astrattamente candidabili e verificati come esistenti: `TAX` ("Tax ID number"), `SS` ("Social Security number"), `NI` ("National unique individual identifier"), `PI`, `PN`, `MR`, `PPN`, `NPI`.
4. **Nessun profilo HL7 Italia pubblicato fissa il valore per il codice fiscale.** Il ValueSet `http://hl7.it/fhir/itcore/ValueSet/vs-tipoIdentificatore` (IT-Core 0.2.0) **include l'intero code system `v2-0203` con 147 concetti** e non ne seleziona alcuno come "codice fiscale". La scelta resta quindi **contrattuale con l'integratore**, esattamente come R1 aveva prudentemente scritto. Raccomandazione: `NNITA` (conforme alla regola di formazione di 0203), documentato nel profilo d'interfaccia; `TAX` è la seconda scelta più diffusa ma semanticamente più debole.

### 4.2 `system` canonico del codice fiscale in FHIR - **Esito: VERIFICATA, ma con una divergenza fra IG italiane che R5 non aveva rilevato**

Esistono **due** URI canonici diversi in uso, entrambi su fonte primaria hl7.it:

| IG | Versione | `Patient.identifier:codiceFiscale.system` |
|---|---|---|
| **IT Base** (`Patient-it-base`) | 0.1.0 | `http://hl7.it/sid/codiceFiscale` |
| **Televisita** (`PatientTelevisita`) | 0.2.0 | `http://hl7.it/sid/codiceFiscale` |
| **IT-Core** (`patient-it-core`) | 0.2.0 | **`http://hl7.it/fhir/itcore/CodeSystem/cs-codicefiscale`** |

Fonti:
- <https://www.hl7.it/fhir/base/StructureDefinition-Patient-it-base.html> e l'esempio <https://www.hl7.it/fhir/base/Patient-esempio-CF-residenza.json.html>;
- <https://www.hl7.it/fhir/televisita/StructureDefinition-PatientTelevisita.html>;
- <https://www.hl7.it/fhir/core/0.2.0/StructureDefinition-patient-it-core.html> (valore fisso verificato due volte con richiesta di trascrizione letterale).

Esempio reale, verbatim da IT Base:

```json
"identifier": [
  {
    "extension": [
      {
        "url": "http://hl7.it/fhir/StructureDefinition/recordCertification",
        "extension": [
          { "url": "when", "valueDateTime": "2020-04-06" },
          {
            "url": "who",
            "valueCodeableConcept": {
              "coding": [
                {
                  "system": "http://terminology.hl7.it/CodeSystem/it-tipoEntita",
                  "code": "mef",
                  "display": "Ministero Economia e Finanze"
                }
              ]
            }
          }
        ]
      }
    ],
    "system": "http://hl7.it/sid/codiceFiscale",
    "value": "TSTPSN80A01D612Z"
  }
]
```

Altri slice verificati (`PatientTelevisita`): `anpr` → `http://hl7.it/sid/anpr`; `codiceANA` → `urn:oid:2.16.840.1.113883.2.9.4.3.15`; `tesseraTEAM` → `urn:oid:2.16.840.1.113883.2.9.4.3.7`; `idRegionale`, `codiceENI`, `codiceSTP` con `system` vincolato da value set. In IT-Core 0.2.0 gli slice sono `codiceFiscale`, `anpr`, `codiceENI`, `codiceANA`, `tesseraTEAM`, `codiceSTP`, `altro`, tutti con `system` fisso su URI del namespace `http://hl7.it/fhir/itcore/CodeSystem/…`, slicing `Unordered, Open by value:$this.system`, `Patient.identifier` 1..*.

**Raccomandazione per Telemedic**: poiché il progetto dichiara conformità alla famiglia *Televisita*, l'URI da usare è **`http://hl7.it/sid/codiceFiscale`**. La divergenza con IT-Core 0.2.0 va però resa esplicita nella documentazione di integrazione e nel mapping, perché un consumatore allineato a IT-Core non riconoscerà l'identificatore. È un punto da sollevare con HL7 Italia (analogo alla questione D3).

---

## 5. Message map disponibili nell'IG HL7 v2-to-FHIR

**Esito: VERIFICATA.**

| Dato | Valore |
|---|---|
| Titolo | *HL7 Version 2 to FHIR* |
| Versione | **1.0.0** |
| Stato | Trial-use (STU 1) |
| Generazione | 2025-10-07 |
| Package id | `hl7.fhir.uv.v2mappings#1.0.0` |
| Canonical | `http://hl7.org/fhir/uv/v2mappings/ImplementationGuide/hl7.fhir.uv.v2mappings` |
| Indice message map | <http://hl7.org/fhir/uv/v2mappings/message_maps.html> |
| Indice segment map | <http://hl7.org/fhir/uv/v2mappings/segment_maps.html> |

### 5.1 Message map (13, tutte con *standards status* **Informative**)

| Capitolo | Messaggio | Descrizione |
|---|---|---|
| 3 - Patient Administration | `ADT_A01` | Admit/Visit Notification |
| 3 | `ADT_A02` | Transfer a Patient |
| 3 | `ADT_A05` | Pre-Admit a Patient |
| 3 | `ADT_A06` | Change an Outpatient to an Inpatient |
| 3 | `ADT_A09` | Patient Departing - Tracking |
| 3 | `ADT_A11` | Cancel Admit / Visit Notification |
| 3 | `ADT_A17` | Swap Patients |
| 4 - Order Entry | `OML_O21` | Laboratory order |
| 4 | `ORM_O01` | General Order Message |
| 4 | `VXU_V04` | Vaccine Record Update |
| 7 - Observation Reporting | `ORU_R01` | Unsolicited Report |
| 9 - Medical Records / IM | `MDM_T02` | Document status change notification and content |
| 10 - Scheduling | **`SIU_S12`** | SIU/ACK |

Ogni mappa è pubblicata come `ConceptMap`, con nomenclatura di file `ConceptMap-message-<msg>-to-bundle.html` (es. `ConceptMap-message-siu-s12-to-bundle.html`).

### 5.2 Segment map rilevanti per la televisita

Sono definite **77 segment map**, tutte *Informative*. Quelle pertinenti al caso d'uso Telemedic:

| Segmento | Target FHIR |
|---|---|
| `SCH` | `Appointment`, `Provenance`, `ServiceRequest` |
| `AIS` | `Appointment`, `ServiceRequest` |
| `AIG`, `AIL`, `AIP` | `Appointment` |
| `NTE[Comment]` | `Appointment` |
| `PID` | `Patient`, `Account`, `Appointment` |
| `PV1` | `Encounter`, `Coverage`, `Patient` |
| `PV2` | `Encounter` |
| `TXA` | `DocumentReference`, `Provenance` |
| `OBX` | `Observation`, `DocumentReference` |
| `MSH` | `Bundle`, `MessageHeader`, `Encounter` |
| `MSA` | `MessageHeader` |
| `ROL[PractitionerRole]` | `Encounter` |

**Fatto rilevante per il design**: **non esiste una segment map `ERR` → `OperationOutcome`** nell'IG v1.0.0. La traduzione degli errori v2 in `OperationOutcome` è quindi a carico dell'implementazione, senza copertura normativa.

**Maturità**: **tutte** le mappe sono classificate *Informative*. Non sono normative e non possono essere dichiarate come conformità.

---

## 6. Subscriptions R5 Backport IG

**Esito: VERIFICATA** - con **due errori sostanziali in R1 §6** da correggere.

### 6.1 Identità della versione

| Dato | Valore |
|---|---|
| Titolo | *Subscriptions R5 Backport* |
| Versione corrente pubblicata | **1.1.0** |
| Stato | STU |
| Data | **2023-01-11** |
| Package id | `hl7.fhir.uv.subscriptions-backport#1.1.0` |
| Canonical | `http://hl7.org/fhir/uv/subscriptions-backport/ImplementationGuide/hl7.fhir.uv.subscriptions-backport` |

### 6.2 Estensioni definite - elenco completo e canonical verificati uno per uno

| Titolo | Canonical URL | Contesto | Tipo valore |
|---|---|---|---|
| Backported R5 Additional Channel Types | `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-channel-type` | `Subscription.channel.type` | `Coding` |
| Backported R5 FilterBy Criteria | `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria` | `Subscription.criteria` | `string` |
| Backport R5 Subscription Heartbeat Period | `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-heartbeat-period` | `Subscription.channel` | `unsignedInt` |
| Backported R5 Subscription MaxCount | `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-max-count` | `Subscription.channel` | `positiveInt` |
| Backport R5 Subscription Payload Content Information | `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content` | `Subscription.channel.payload` | `code` (binding **required**) |
| Backport R5 Subscription Timeout | `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-timeout` | `Subscription.channel` | `unsignedInt` |
| CapabilityStatement SubscriptionTopic Canonical | `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/capabilitystatement-subscriptiontopic-canonical` | `CapabilityStatement.rest.resource` | `canonical` |

**Correzione a R1 riga 1030**: R1 ipotizzava un'estensione `backport-topic`. **Non esiste.** Il collegamento al `SubscriptionTopic` **non** avviene tramite estensione: in R4 il canonical del topic si scrive **direttamente in `Subscription.criteria`** (fonte: pagina *Topic-Based Subscription Components* dell'IG - *"the link to a `SubscriptionTopic` is specified in the `Subscription.criteria` field"*). R1 non menzionava invece `backport-channel-type`, che esiste.

### 6.3 Valori ammessi di `payload-content`

CodeSystem: `http://hl7.org/fhir/uv/subscriptions-backport/CodeSystem/backport-content-code-system`.

| Code | Display | Definizione verbatim |
|---|---|---|
| `empty` | Empty | *"No resource content is transacted in the notification payload."* |
| `id-only` | Id Only | *"Only the resource id is transacted in the notification payload."* |
| `full-resource` | Full Resource | *"The entire resource is transacted in the notification payload."* |

### 6.4 Operazioni

| Operazione | Canonical URL | Invocazione | Parametri IN | Parametri OUT |
|---|---|---|---|---|
| `$status` | `…/OperationDefinition/backport-subscription-status` | `[base]/Subscription/$status`, `[base]/Subscription/[id]/$status` | `id` 0..* (`id`); `status` 0..* (`code`) | Bundle di notifica |
| `$events` | `…/OperationDefinition/backport-subscription-events` | `[base]/Subscription/[id]/$events` | `eventsSinceNumber` 0..1 (`string`); `eventsUntilNumber` 0..1 (`string`); `content` 0..1 (`code`) | Bundle |
| `$get-ws-binding-token` | `…/OperationDefinition/backport-subscription-get-ws-binding-token` | `[base]/Subscription/$get-ws-binding-token`, `[base]/Subscription/[id]/$get-ws-binding-token` | `id` 0..* | `token` 1..1 (`string`); `expiration` 1..1 (`dateTime`); `subscription` 0..* (`string`); `websocket-url` 1..1 (`url`) |

Definizioni verbatim di `$events`: `eventsSinceNumber` = *"The starting event number, inclusive of this event (lower bound)."*; `eventsUntilNumber` = *"The ending event number, inclusive of this event (upper bound)."*
Definizione verbatim di `token` in `$get-ws-binding-token`: *"An access token that a client may use to show authorization during a websocket connection"*.

### 6.5 `eventNumber` in R4

**Correzione terminologica**: in R4 non esiste una risorsa `SubscriptionStatus`. Lo stato viaggia come **`Parameters`** conforme al profilo:

`http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription-status-r4`

I nomi dei parametri sono in **kebab-case**, non in camelCase:

| `Parameters.parameter.name` | Card. |
|---|---|
| `subscription` | 1..1 |
| `topic` | 0..1 |
| `status` | 1..1 |
| `type` | 1..1 |
| `events-since-subscription-start` | 0..1 |
| `notification-event` | 0..* |
| `notification-event.event-number` | 1..1 |
| `notification-event.timestamp` | 0..1 |
| `notification-event.focus` | 0..1 |
| `notification-event.additional-context` | 0..* |
| `error` | 0..* |

Quindi il nome corretto dell'elemento è **`event-number`** (parte annidata `notification-event`), non `eventNumber`. Il nome `eventNumber` appartiene alla risorsa `SubscriptionStatus` di R4B/R5.

Ogni notifica è un `Bundle` con `type = history`, il cui **primo entry** contiene la risorsa di stato; ogni `Bundle.entry` deve avere `Bundle.entry.request` (invarianti `bdl-3` e `bdl-4`), e l'entry di stato referenzia una richiesta all'operazione `$status`.

### 6.6 Dichiarazione nel `CapabilityStatement`

Per un server **R4**:

- `CapabilityStatement.instantiates` ← `http://hl7.org/fhir/uv/subscriptions-backport/CapabilityStatement/backport-subscription-server-r4` (nome: `BackportSubscriptionCapabilityStatementR4`);
- `CapabilityStatement.rest.resource.supportedProfile` ← `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-subscription`;
- topic discovery tramite l'estensione `capabilitystatement-subscriptiontopic-canonical` su `CapabilityStatement.rest.resource`.

Requisiti del CapabilityStatement R4 verificati: `read` su `Subscription` obbligatoria; `create`/`update`/`delete`/`search` raccomandate; **operazione `$status` obbligatoria**; `$events` e `$get-ws-binding-token` opzionali; search parameter `url` (uri) e `status` (token) raccomandati.

Per un server **R4B** l'URL da mettere in `instantiates` è invece `http://hl7.org/fhir/uv/subscriptions-backport/CapabilityStatement/CapabilitySubscriptionServer`.

---

## 7. Search parameter di PDQm (ITI-78) e operazione `$ihe-pix` di PIXm (ITI-83)

**Esito: VERIFICATA.**

### 7.1 PDQm - Mobile Patient Demographics Query [ITI-78]

Fonte: <https://profiles.ihe.net/ITI/PDQm/ITI-78.html>. **PDQm 3.2.0 - Trial-Implementation, generata 2025-11-04.**

Search parameter su `Patient` (elenco esatto, 14):

| Parametro | Tipo |
|---|---|
| `_id` | string |
| `active` | token |
| `family` | string |
| `given` | string |
| `identifier` | token (ripetibile) |
| `telecom` | token |
| `birthdate` | date |
| `address` | string |
| `address-city` | string |
| `address-country` | string |
| `address-postalcode` | string |
| `address-state` | string |
| `gender` | token |
| `mothersMaidenName` | string |

Regola di conformità: il *Patient Demographics Consumer* **MAY** fornire i parametri; il *Patient Demographics Supplier* **SHALL** essere capace di processarli tutti. Il Supplier deve inoltre supportare almeno le combinazioni `family` + `gender` e `birthdate` + `family`.

> Nota: `mothersMaidenName` è scritto in camelCase - è l'unico parametro non in kebab-case dell'elenco. Va copiato esattamente.

### 7.2 PIXm - Mobile Patient Identifier Cross-reference Query [ITI-83]

Fonte: <https://profiles.ihe.net/ITI/PIXm/ITI-83.html>. **PIXm 3.1.0 - Trial-Implementation, generata 2025-11-04.**

Operazione: **`$ihe-pix`**, endpoint `[base]/Patient/$ihe-pix`.

| Direzione | Parametro | Card. | Tipo | Descrizione verbatim |
|---|---|---|---|---|
| IN | `sourceIdentifier` | 1..1 | token | *"The Patient Identifier that will be used by the Patient Identifier Cross-reference Manager to find cross matching identifiers"* (dominio e valore separati da `\|`) |
| IN | `targetSystem` | 0..* | uri | *"The Assigning Authorities for the Patient Identifier Domains from which the returned identifiers shall be selected"* |
| IN | `_format` | 0..1 | token | *"The requested format of the response from the mime-type value set"* |
| OUT | `targetIdentifier` | 0..* | Identifier | *"The business identifier found. Shall include the assigning authority"* |
| OUT | `targetId` | 0..* | Reference(Patient) | *"The URL of the Patient Resource"* |

---

## 8. Edizione di ICD-9-CM del code system italiano e contenuto di `vs-tipo-ricetta`

### 8.1 ICD-9-CM - **Esito: NON VERIFICABILE (assenza accertata)**

Fonte: <https://www.hl7.it/fhir/televisita/CodeSystem-diagnosi-icd9cm.html>.

| Dato | Valore |
|---|---|
| Canonical | `http://hl7.it/fhir/televisita/CodeSystem/diagnosi-icd9cm` |
| Versione | 0.2.0 |
| Publisher | HL7 Italy (HL7IT) |
| Stato | experimental / trial-use, draft al 2025-09-17 |
| Descrizione | *"Definisce il sistema di terminologie da usare per le diagnosi secondo ICD-9-CM"* |
| **Edizione ICD-9-CM rappresentata** | **non dichiarata sulla pagina** |
| Copyright | non presente sulla pagina |

L'assenza è **accertata**, non presunta: la pagina del CodeSystem non contiene alcun riferimento a un anno di edizione, a un decreto ministeriale di adozione o a una versione della classificazione. Poiché in Italia la SDO adotta l'edizione ICD-9-CM **2007** recepita con decreto, e poiché il code system enumera concetti (`content` enumerativo, ordine di 1.400+ codici verificato dall'ispezione della pagina) senza dichiarare la fonte, **il code system non è tracciabile a un'edizione**. Questa è una lacuna reale dell'IG, da segnalare formalmente a HL7 Italia. **Non dichiarare un'edizione nella documentazione di Telemedic.**

### 8.2 `vs-tipo-ricetta` - **Esito: VERIFICATA, con un rilievo di coerenza**

Fonte: <https://www.hl7.it/fhir/televisita/ValueSet-vs-tipo-ricetta.html>.

| Dato | Valore |
|---|---|
| Canonical ValueSet | `http://hl7.it/fhir/televisita/ValueSet/vs-tipo-ricetta` |
| Versione | 0.2.0 |
| CodeSystem sorgente | `http://hl7.it/fhir/televisita/CodeSystem/cs-tipo-ricetta` |
| **Titolo mostrato** | **«Codici Assistenza Stranieri»** |

Espansione completa (7 concetti):

| Code | Display |
|---|---|
| `EE` | Assicurati extra-europei in temporaneo soggiorno |
| `UE` | Assicurati europei in temporaneo soggiorno |
| `NA` | Assistiti SASN con visita ambulatoriale |
| `ND` | Assistiti SASN con visita domiciliare |
| `NE` | Assistiti da istituzioni europee |
| `NX` | Assistiti SASN extraeuropei |
| `ST` | Stranieri in temporaneo soggiorno |

**Rilievo**: il ValueSet si chiama `vs-tipo-ricetta` ma il suo titolo e il suo contenuto riguardano i **codici di assistenza per stranieri**, non i tipi di ricetta. Chi implementa aspettandosi una tassonomia di tipologie di prescrizione (rossa/bianca/dematerializzata) troverà tutt'altro. È una discrepanza nome/contenuto che va documentata e, se possibile, segnalata a HL7 Italia. Nessun codice ha una definizione formale: solo il display.

---

## 9. `Encounter.class` nel profilo `EncounterTelevisita`

**Esito: VERIFICATA - R1 aveva ragione, il profilo non fissa `class`.**

Fonte: <https://www.hl7.it/fhir/televisita/StructureDefinition-EncounterTelevisita.html>.

| Dato | Valore |
|---|---|
| Canonical del profilo | `http://hl7.it/fhir/televisita/StructureDefinition/EncounterTelevisita` |
| Versione IG | 0.2.0 (trial-use) |
| `Encounter.class` cardinalità | 1..1 |
| `Encounter.class` binding | `http://terminology.hl7.org/ValueSet/v3-ActEncounterCode`, forza **extensible** |
| `Encounter.class` valore fisso / pattern | **assente** |

Elementi resi obbligatori dal profilo: `identifier:codiceNosologico` (1..1), `status` (1..1), `class` (1..1). Lo slice `identifier:codiceNosologico.system` ha valore fisso `http://hl7.it/fhir/televisita/sid/codiceNosologico`.

**Conclusione operativa sulla questione D3 di R1**: il profilo italiano **non impone `VR`**. Poiché il binding è *extensible* verso `v3-ActEncounterCode` e `VR` è l'unico codice di quel value set che denoti la modalità non-compresente, `VR` è la scelta conforme e difendibile - ma è una **decisione di progetto di Telemedic**, non una prescrizione dell'IG. Va formalizzata in un ADR e, se si desidera certezza, sollevata come issue verso HL7 Italia. La frase di R1 §2.10.3 («`class` è valorizzato a `VR`, che il profilo italiano lascia libero») è **corretta**.

---

## 10. FHIR Bulk Data Access - operazione `$export`

**Esito: VERIFICATA** - e la versione da citare **non è quella indicata da R1**.

### 10.1 Identità della versione

| Dato | Valore |
|---|---|
| Titolo | *FHIR Bulk Data Access (Flat FHIR)* |
| **Versione corrente pubblicata** | **3.0.0** |
| Stato | **Trial-use, Active as of 2025-12-11** |
| Package id | `hl7.fhir.uv.bulkdata#3.0.0` |
| Canonical | `http://hl7.org/fhir/uv/bulkdata/ImplementationGuide/hl7.fhir.uv.bulkdata` |
| Home permanente | <https://hl7.org/fhir/uv/bulkdata/STU3/> |
| Base FHIR | R4 |

R1 (Appendice A) cita ancora `https://hl7.org/fhir/uv/bulkdata/STU2/export.html`. **STU2 (v2.0.0) è superata.** Sotto sono riportate entrambe, perché le differenze del manifest sono rilevanti per chi ha già implementato.

### 10.2 Endpoint

| Livello | URL |
|---|---|
| Tutti i pazienti | `[fhir base]/Patient/$export` |
| Gruppo di pazienti | `[fhir base]/Group/[id]/$export` |
| Sistema | `[fhir base]/$export` |

### 10.3 Header della richiesta di kick-off

| Header | Valore |
|---|---|
| `Accept` | `application/fhir+json` - specifica il formato della `OperationOutcome` opzionale di risposta al kick-off |
| `Prefer` | **`respond-async`**; in STU3 è ammesso il secondo valore `separate-export-status`, nella forma `Prefer: respond-async,separate-export-status` |

In STU2 il testo è tassativo: *"Currently, only a value of `respond-async` is supported."*

### 10.4 Parametri di query (STU3 v3.0.0)

| Parametro | Optionality server | Optionality client | Card. | Tipo | Contenuto |
|---|---|---|---|---|---|
| `_outputFormat` | required | optional | 0..1 | string | formato dei file generati; default `application/fhir+ndjson` |
| `_since` | required | optional | 0..1 | instant | risorse il cui stato è cambiato dopo l'istante indicato, su `Resource.meta.lastUpdated` |
| `_until` | optional | optional | 0..1 | instant | **nuovo in STU3** - risorse modificate prima dell'istante indicato |
| `_type` | optional | optional | 0..* | string (lista separata da virgole) | *"The response SHALL be filtered to only include resources of the specified resource types"* |
| `_elements` | optional, **experimental** | optional | 0..* | string | il server SHOULD omettere gli elementi non obbligatori non elencati |
| `patient` | optional | optional | 0..* | Reference | **solo POST**; il server SHALL NOT restituire risorse di pazienti fuori dall'elenco |
| `includeAssociatedData` | optional, **experimental** | optional | 0..* | string | insiemi predefiniti di risorse associate |
| `_typeFilter` | optional | optional | 0..* | string (query REST FHIR) | filtro fine sui tipi referenziati |
| `organizeOutputBy` | optional | optional | 0..1 | string (resource type) | **nuovo in STU3** - organizza i file per istanze del tipo indicato |
| `allowPartialManifests` | optional | optional | 0..1 | boolean | **nuovo in STU3** - abilita manifest parziali e paginati |

In **STU2** i parametri erano: `_outputFormat`, `_since`, `_type`, `_elements` (experimental), `patient` (POST), `includeAssociatedData` (experimental), `_typeFilter` (experimental). Non esistevano `_until`, `organizeOutputBy`, `allowPartialManifests`.

### 10.5 Risposta al kick-off

- **HTTP `202 Accepted`**;
- header **`Content-Location`** contenente l'URL assoluto dell'endpoint di stato (polling location);
- opzionalmente una `OperationOutcome` in JSON nel body;
- in STU3, se il server supporta `separate-export-status`, restituisce l'header **`Preference-Applied`** con i valori `respond-async` e `separate-export-status`.

### 10.6 Polling (Bulk Data Status Request)

| Elemento | Comportamento |
|---|---|
| `Accept` (richiesta di stato) | `application/json` |
| `Retry-After` (risposta) | il server SHOULD fornirlo: ritardo in secondi (es. `120`) o in formato http-date |
| `X-Progress` (risposta) | opzionale, descrizione testuale sotto i 100 caratteri (percentuale o stato generico) |
| `202 Accepted` | export in corso (comportamento base) |
| `200 OK` + `X-Export-Status: 202 Accepted` | export in corso, **solo** quando è stato negoziato `separate-export-status` (STU3) |
| `200 OK` | export completato - il body è il manifest |
| `4XX` / `5XX` | errore |

### 10.7 Manifest di completamento - **versione pubblicata STU3 (3.0.0)**

| Campo | Optionality | Tipo | Descrizione |
|---|---|---|---|
| `transactionTime` | required | instant | istante in cui la query è stata eseguita dal server |
| `request` | required | string | URL completo della richiesta di kick-off originale |
| `requiresAccessToken` | required | boolean | se il download dei file richiede il bearer token |
| `outputOrganizedBy` | required *quando valorizzato* | string | valore del parametro `organizeOutputBy` del kick-off |
| `output` | required | array | file generati |
| `deleted` | optional | array | file con puntatori a risorse cancellate |
| `error` | required | array | file contenenti `OperationOutcome` |
| `link` | optional | array | link di paginazione al manifest successivo |
| `extension` | optional | object | estensioni proprietarie |

Campi degli item di `output` (e, con la stessa struttura, di `deleted` ed `error`):

| Campo | Contenuto |
|---|---|
| `type` | tipo di risorsa FHIR contenuto nel file - **omesso quando è stato usato `organizeOutputBy`** |
| `url` | percorso assoluto del file |
| `count` | numero di risorse nel file (opzionale, JSON number) |
| `continuesInFile` | URL del file di continuazione, quando un blocco si estende su più file (solo `output`, solo con `organizeOutputBy`) |

Esempio verbatim (STU2/STU3, forma base):

```json
{
  "transactionTime": "2021-01-01T00:00:00Z",
  "request" : "https://example.com/fhir/Patient/$export?_type=Patient,Observation",
  "requiresAccessToken" : true,
  "output" : [{
    "type" : "Patient",
    "url" : "https://example.com/output/patient_file_1.ndjson"
  },{
    "type" : "Patient",
    "url" : "https://example.com/output/patient_file_2.ndjson"
  },{
    "type" : "Observation",
    "url" : "https://example.com/output/observation_file_1.ndjson"
  }],
  "deleted": [{
    "type" : "Bundle",
    "url" : "https://example.com/output/del_file_1.ndjson"      
  }],
  "error" : [{
    "type" : "OperationOutcome",
    "url" : "https://example.com/output/err_file_1.ndjson"
  }],
  "extension":{"https://example.com/extra-property": true}
}
```

### 10.8 Avvertenza sul continuous build

Il *continuous build* dell'IG (<https://build.fhir.org/ig/HL7/bulk-data/en/export.html>) presenta un manifest **strutturalmente diverso** da quello pubblicato: rinomina `error` in `outcome`, aggiunge `manifestType`, `outputFormat`, `outputOrganizedByDetail`, `fileSize`, `countSeverity`, e rimuove `request`. **Non è materiale su cui implementare**: la versione normativa alla data è la 3.0.0. Questo va scritto esplicitamente nella documentazione di Telemedic, perché è esattamente il genere di divergenza che genera implementazioni non interoperabili.

---

## 11. Mappatura dei valori `acr` per SPID L1/L2/L3

**Esito: VERIFICATA per SAML e per OIDC SPID; NON VERIFICABILE per CIE id.**

### 11.1 SAML2 (SPID)

Fonte primaria: *Regole tecniche SPID*, sezione **Single Sign-On**, sottosezione *AuthnRequest* - <https://docs.italia.it/italia/spid/spid-regole-tecniche/it/stabile/single-sign-on.html>.

I valori vanno in `<saml:AuthnContextClassRef>` dentro `<samlp:RequestedAuthnContext>`:

| Livello | Valore esatto |
|---|---|
| SPID Livello 1 | `https://www.spid.gov.it/SpidL1` |
| SPID Livello 2 | `https://www.spid.gov.it/SpidL2` |
| SPID Livello 3 | `https://www.spid.gov.it/SpidL3` |

Le *authentication context class* sono presentate come livelli di robustezza della credenziale, ordinati per preferenza.

### 11.2 OIDC (SPID)

Fonte: *Linee Guida OpenID Connect in SPID*, sezione 5 *Authorization Endpoint (Authentication Request)* - <https://docs.italia.it/AgID/documenti-in-consultazione/lg-openidconnect-spid-docs/it/bozza/authorization-endpoint-authentication-request.html>.

Il parametro è **`acr_values`** e assume **gli stessi identici URI** del profilo SAML (`https://www.spid.gov.it/SpidL1|SpidL2|SpidL3`). Testo verbatim sulla sintassi:

> *"Stringa separata da uno spazio, che specifica i valori "acr" richiesti al server di autorizzazione per l'elaborazione della richiesta di autenticazione, con i valori visualizzati in ordine di preferenza."*

Quindi: **valori separati da spazio, in ordine di preferenza decrescente**.

### 11.3 CIE id - non chiuso

Le *Regole tecniche SPID/CIE OpenID Connect* (<https://docs.italia.it/italia/spid/spid-cie-oidc-docs/it/versione-corrente/>) descrivono `acr_values` come *"Valori di riferimento della classe di contesto dell'Authentication Request. DEVE essere una stringa separata da uno spazio, che specifica i valori "acr" richiesti in ordine di preferenza"* e **rimandano al parametro `acr_values_supported` dei metadata dell'OP** per l'elenco effettivo. La pagina *Differenze SPID e CIE id* non contiene una sezione di confronto sugli `acr`.

**Conclusione onesta**: i valori `acr` accettati da CIE id **vanno letti a runtime dai metadata dell'OpenID Provider** (`acr_values_supported`), non hardcodati. Per Keycloak questo significa configurare l'`acr-to-loa-map` a partire dai metadata del provider, non da una costante nel codice. Se serve un elenco statico, va richiesto al gestore dell'identità e citato con il documento contrattuale, non con una fonte tecnica pubblica.

---

## 12. Struttura del messaggio `SIU^S12` in HL7 v2.5.1

**Esito: VERIFICATA.**

Fonte: <https://www.hl7.eu/HL7v2x/v251/std251/ch10.html>, capitolo 10 *Scheduling*.

L'intestazione della struttura è `SIU^S12-S24, S26^SIU_S12`: **la stessa struttura vale per i trigger da S12 a S24 e per S26**. Segmenti e ordine:

```
MSH          Message Header                                 2
SCH          Schedule Activity Information                 10
[ { TQ1 } ]  Timing/Quantity                                4
[ { NTE } ]  Notes and Comments for the SCH                 2
[{
--- PATIENT begin
PID          Patient Identification                         3
[ PD1 ]      Additional Demographics                        3
[ PV1 ]      Patient Visit                                  3
[ PV2 ]      Patient Visit - Additional Info                3
[ { OBX } ]  Observation/Result                             4
[ { DG1 } ]  Diagnosis                                      6
}]
--- PATIENT end
{
--- RESOURCES begin
RGS          Resource Group Segment                        10
[{
--- SERVICE begin
AIS          Appointment Information - Service             10
[ { NTE } ]  Notes and Comments for the AIS                 2
}]
--- SERVICE end
[{
--- GENERAL_RESOURCE begin
AIG          Appointment Information - General Resource    10
[ { NTE } ]  Notes and Comments for the AIG                 2
}]
--- GENERAL_RESOURCE end
[{
--- LOCATION_RESOURCE begin
AIL          Appointment Information - Location Resource   10
[ { NTE } ]  Notes and Comments for the AIL                 2
}]
--- LOCATION_RESOURCE end
[{
--- PERSONNEL_RESOURCE begin
AIP          Appointment Information - Personnel Resource  10
[ { NTE } ]  Notes and Comments for the AIP                 2
}]
--- PERSONNEL_RESOURCE end
}
--- RESOURCE end
```

Punti che vincolano l'implementazione:

1. **`SCH` è obbligatorio e non ripetibile**; `MSH` e `SCH` sono i soli segmenti a cardinalità 1..1 fuori dai gruppi.
2. **Il gruppo `PATIENT` è opzionale e ripetibile** (`[{ … }]`): un `SIU^S12` valido può non contenere `PID`. Un consumatore che assume la presenza del paziente è non conforme.
3. **Il gruppo `RESOURCES` è obbligatorio e ripetibile** (`{ … }`) e inizia obbligatoriamente con `RGS`. Dentro di esso, `AIS`, `AIG`, `AIL`, `AIP` sono tutti gruppi opzionali e ripetibili.
4. **`TQ1` è presente in v2.5.1** (era assente nelle versioni precedenti a 2.5): un parser scritto su v2.3 lo scarterebbe.
5. `NTE` compare in cinque posizioni distinte con semantica diversa (note della `SCH` e note di ciascuna risorsa): il parsing posizionale è obbligatorio, non si può fare un `getAll("NTE")`.

Il messaggio è coperto dall'IG v2-to-FHIR come `SIU_S12` (`ConceptMap-message-siu-s12-to-bundle`, stato *Informative*) e le corrispondenti segment map `SCH`→`Appointment|Provenance|ServiceRequest`, `AIS`→`Appointment|ServiceRequest`, `AIG`/`AIL`/`AIP`→`Appointment`, `NTE[Comment]`→`Appointment` esistono.

---

## 13. Stato normativo degli header `Deprecation`, `Idempotency-Key`, `RateLimit-*`

### 13.1 `Deprecation` - **Esito: VERIFICATA - è diventato RFC**

| Dato | Valore |
|---|---|
| Documento | **RFC 9745**, *The Deprecation HTTP Response Header Field* |
| Categoria | **Standards Track** |
| Pubblicazione | **marzo 2025** |
| Autori | S. Dalal, E. Wilde |
| Registro | inserito come campo permanente nello *Hypertext Transfer Protocol (HTTP) Field Name Registry*, Structured Type **Item** |

Sintassi verbatim: *"Deprecation is an Item Structured Header Field; its value MUST be a Date as per Section 3.3.7 of RFC9651."*

Esempio verbatim:

```
Deprecation: @1688169599
```

Relazione con `Sunset` (RFC 8594): *"the timestamp given in the Sunset HTTP header field MUST NOT be earlier than the one given in the Deprecation header field."*

Link relation `deprecation`, che punta a documentazione destinata a lettori umani:

```
Link: <https://developer.example.com/deprecation>;
      rel="deprecation"; type="text/html"
```

Fonte: <https://www.rfc-editor.org/rfc/rfc9745.html>.

### 13.2 `Idempotency-Key` - **Esito: VERIFICATA - NON è un RFC, ed è un draft scaduto**

| Dato | Valore |
|---|---|
| Documento | `draft-ietf-httpapi-idempotency-key-header` |
| Working group | IETF httpapi |
| Ultima revisione | **-07**, 2025-10-15 |
| Stato datatracker | **Expired / archiviato**, non più attivo |
| Pubblicato come RFC | **No** |
| Nome esatto del campo | `Idempotency-Key` |

Fonte: <https://datatracker.ietf.org/doc/draft-ietf-httpapi-idempotency-key-header/>.

**Implicazione per Telemedic**: `Idempotency-Key` è una **convenzione di settore**, non uno standard. Se lo si adotta (ed è opportuno per i webhook e per le POST verso l'integratore), va documentato come *convenzione di progetto ispirata all'Internet-Draft scaduto*, non come conformità a uno standard IETF.

### 13.3 `RateLimit-*` - **Esito: VERIFICATA - non è RFC, e la forma a tre header è superata**

| Dato | Valore |
|---|---|
| Documento | `draft-ietf-httpapi-ratelimit-headers` |
| Ultima revisione | **-11**, 2026-05-23 |
| Stato | **Internet-Draft attivo**, intended status Standards Track |
| Pubblicato come RFC | **No** |
| Campi definiti nella revisione corrente | **`RateLimit`** e **`RateLimit-Policy`** |

La revisione corrente **sostituisce** i tre header `RateLimit-Limit`, `RateLimit-Remaining`, `RateLimit-Reset` delle prime versioni con due Structured Fields: `RateLimit-Policy` (parametri `q` = quota, `w` = finestra, `qu` = unità di quota, `pk` = partition key) e `RateLimit` (`r` = quota residua, `t` = finestra effettiva, `pk`). Il draft registra inoltre tre problem type IANA (`quota-exceeded`, `temporary-reduced-capacity`, `abnormal-usage-detected`) e un registro di unità di quota (`requests`, `content-bytes`, `concurrent-requests`).

Fonte: <https://datatracker.ietf.org/doc/draft-ietf-httpapi-ratelimit-headers/>.

**Implicazione per Telemedic**: se la documentazione di R5 (o quella pubblica) menziona `RateLimit-Limit` / `RateLimit-Remaining` / `RateLimit-Reset` come "header standard", **è doppiamente errato**: non sono standard e non sono la forma corrente del draft. Scelta consigliata: emettere `RateLimit` e `RateLimit-Policy` conformi al draft-11, ed emettere in aggiunta i tre header legacy per compatibilità con i client esistenti, dichiarando esplicitamente lo stato non normativo di entrambi.

---

## 14. Header `ce-*` del binding HTTP di CloudEvents in modalità *binary*

**Esito: VERIFICATA.**

Fonte primaria: *HTTP Protocol Binding for CloudEvents* v1.0.2 - <https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/http-protocol-binding.md>.

Regola di formazione verbatim:

> *"all CloudEvents context attributes, including extensions, MUST be mapped to HTTP headers with the same name as the attribute name but prefixed with `ce-`."*

| Attributo CloudEvents | Header HTTP in binary mode |
|---|---|
| `id` | `ce-id` |
| `source` | `ce-source` |
| `specversion` | `ce-specversion` |
| `type` | `ce-type` |
| `subject` | `ce-subject` |
| `time` | `ce-time` |
| `dataschema` | `ce-dataschema` |
| `datacontenttype` | **nessun header `ce-`** - vedi sotto |

Trattamento speciale di `datacontenttype`, verbatim:

> *"the HTTP `Content-Type` header value corresponds to (MUST be populated from or written to) the CloudEvents `datacontenttype` attribute. Note that a `ce-datacontenttype` HTTP header MUST NOT also be present in the message."*

Esempio verbatim dalla specifica:

```http
POST /someresource HTTP/1.1
Host: webhook.example.com
ce-specversion: 1.0
ce-type: com.example.someevent
ce-time: 2018-04-05T03:56:24Z
ce-id: 1234-1234-1234
ce-source: /mycontext/subcontext
Content-Type: application/json; charset=utf-8
Content-Length: nnnn

{
    ... application data ...
}
```

**Trappola da codificare nei test di Telemedic**: emettere `ce-datacontenttype` è una **violazione MUST NOT**. Il content type dell'evento va scritto **solo** in `Content-Type`.

---

## 15. `scratchpad.read` e i `messageType` di SMART Web Messaging

**Esito: VERIFICATA - `scratchpad.read` esiste ed è un `messageType` valido.**

| Dato | Valore |
|---|---|
| IG | *SMART Web Messaging* |
| Versione | **1.0.0 - STU1** |
| Data | **2022-05-06** |
| Base | FHIR R4 |
| Publisher | HL7 International - FHIR Infrastructure WG |

Pagine: `index.html`, `activity-catalog.html`, **`smart-web-messaging.html`** (pagina tecnica normativa), `artifacts.html`, `CodeSystem-launch-status-code-system.html`.

### 15.1 Busta del messaggio

Richiesta (`window.postMessage`):

| Campo | Obbligatorietà | Tipo | Descrizione verbatim |
|---|---|---|---|
| `messagingHandle` | REQUIRED | string | *"The content of the `smart_web_messaging_handle` property of the OAuth access token response JSON payload"* |
| `messageId` | REQUIRED | string | *"A unique ID for this message generated by the application"* |
| `messageType` | REQUIRED | string | *"The type of this message (e.g., `ui.done`, `scratchpad.update`, `status.handshake`, etc)"* |
| `payload` | REQUIRED | object | *"The message content as specified by the `messageType`"* |

Risposta:

| Campo | Obbligatorietà | Tipo |
|---|---|---|
| `messageId` | REQUIRED | string |
| `responseToMessageId` | REQUIRED | string |
| `additionalResponsesExpected` | OPTIONAL | boolean |
| `payload` | REQUIRED | object |

> Attenzione al plurale: il campo è `additionalResponsesExpected` (con la *s*).

### 15.2 `messageType` realmente definiti

Le famiglie sono organizzate in quattro sezioni della pagina tecnica: `status.*`, `ui.*`, `scratchpad.*`, `fhir.http`.

| `messageType` | Payload richiesta | Payload risposta |
|---|---|---|
| `status.handshake` | `{}` | `{}` (eventuale `error` come `Coding` FHIR) |
| `ui.done` | `{}` | `status` (code), `statusDetail` (CodeableConcept, opz.) |
| `ui.launchActivity` | `activityType` (string), `activityParameters` (object) | `status` (code), `statusDetail` (opz.) |
| `scratchpad.create` | `resource` (object) | `status`, `location`, `outcome` (OperationOutcome, opz.) |
| **`scratchpad.read`** | `location` (string, **opzionale**) | `resource` **oppure** `scratchpad` (array), `outcome` (opz.) |
| `scratchpad.update` | `resource` (con `resourceType` e `id`) | `status`, `outcome` (opz.) |
| `scratchpad.delete` | `location` (string) | `status`, `outcome` (opz.) |
| `fhir.http` | `bundle` (Bundle FHIR) | `bundle` **oppure** `outcome` |

Testo normativo verbatim su `scratchpad.read`:

> *"The `scratchpad.read` operation allows for selection of either a single resource from the scratchpad by requesting its `location` handle, or for selection of the entire contents of the scratchpad by omitting `location` from the operation parameter list."*

> *"All resources returned from a `scratchpad.read` operation SHALL include both `resourceType` and `id` values."*

### 15.3 Activity Catalog (valori di `activityType` per `ui.launchActivity`)

Da non confondere con i `messageType`: l'*Activity Catalog* definisce **tre** attività, ciascuna con i propri parametri:

| `activityType` | Parametro REQUIRED |
|---|---|
| `appointment-book` | `appointmentLocations` - *"FHIR Bundle of FHIR Appointment resource locations in draft status"* |
| `order-review` | `draftOrderLocations` - *"array of draft order locations (references to) already existing in the scratchpad"* |
| `problem-review` | `problemLocation` - riferimento a una `Condition` preesistente usata dall'EHR per precompilare la maschera |

Fonti: <https://hl7.org/fhir/uv/smart-web-messaging/smart-web-messaging.html>, <https://hl7.org/fhir/uv/smart-web-messaging/activity-catalog.html>.

---

## 16. Stato di `fhir.js` e panoramica delle librerie FHIR per TypeScript/JavaScript

**Esito: VERIFICATA per lo stato di `fhir.js`; PARZIALE per le date di rilascio delle alternative.**

### 16.1 `fhir.js`

| Dato | Valore |
|---|---|
| Repository | <https://github.com/FHIR/fhir.js> |
| **Stato** | **Archiviato dal proprietario l'8 ottobre 2024. Read-only.** |
| Avviso di deprecazione nel README | **assente** |
| Libreria alternativa raccomandata | **nessuna indicata dal progetto** |

**Conclusione**: `fhir.js` è **non manutenuta**. Non va usata in Telemedic e non va citata nella documentazione se non come nota storica. In ottica IEC 62304 sarebbe SOUP senza manutentore: inaccettabile.

### 16.2 Librerie effettivamente mantenute (stato al 25 agosto 2026)

| Pacchetto npm | Versione corrente | Licenza | Repository | Stato | Ruolo |
|---|---|---|---|---|---|
| `fhirclient` | **2.6.3** | Apache-2.0 | `smart-on-fhir/client-js` - **non archiviato** | attivo (release recenti fino a v2.6.3) | Client **SMART on FHIR** per browser e Node. Descritto dal README come *"a JavaScript library for connecting SMART apps to Fhir servers"*. **Prima scelta** per il launch SMART. |
| `fhir-kit-client` | **2.0.3** | MIT | `Vermonster/fhir-kit-client` - **non archiviato** | attivo | Client FHIR generico. v2 richiede Node 18+, usa `fetch`/`AbortController`/`URLSearchParams` nativi; **CommonJS (`require`) non supportato**. |
| `@types/fhir` | **0.0.44** | MIT | DefinitelyTyped | attivo | Definizioni TypeScript delle risorse FHIR (namespace per release). Solo tipi, zero runtime: **opzione a rischio nullo** per l'SDK TypeScript. |
| `fhirpath` | **5.1.1** | vedi `LICENSE.md` | `HL7/fhirpath.js` - **repository HL7 ufficiale** | attivo | Motore FHIRPath. Necessario per valutare invarianti e `_typeFilter`/filtri di subscription lato client. |
| `@medplum/fhirtypes` | **5.1.31** | Apache-2.0 | `medplum/medplum` | attivo | Tipi FHIR generati; parte di una piattaforma più ampia. Utile se si vuole tipizzazione aggiornata con cadenza rapida. |
| `fhir` | 4.12.0 | ISC | `lantanagroup/FHIR.js` | **DEPRECATO su npm** | Campo `deprecated` presente: *"This package has been renamed to fhir-tool. Please install and use fhir-tool instead."* Serializzazione JSON↔XML, validazione, FHIRPath. **Se serve, installare `fhir-tool`.** |

**Residuo non verificato**: le date esatte dell'ultimo commit e dell'ultima pubblicazione npm di `fhirclient` e `fhir-kit-client` non sono state estratte (le pagine npm rispondono 403 al fetch automatico e le pagine GitHub non riportano l'anno nei metadati resi). Prima di fissare le dipendenze dell'SDK TypeScript va eseguito `npm view <pkg> time.modified` e verificata l'attività del repository. Il dato certo è che **nessuna delle librerie in tabella, tranne `fhir`, riporta il campo `deprecated` nel registry**, e che nessuno dei relativi repository risulta archiviato.

**Raccomandazione per l'SDK TypeScript di Telemedic (D4c)**: dipendere solo da `@types/fhir` (tipi, zero runtime) e implementare il trasporto internamente; usare `fhirclient` solo nel modulo opzionale di launch SMART; usare `fhirpath` solo se serve valutazione FHIRPath lato client. Questo minimizza la superficie SOUP da qualificare ai sensi di IEC 62304.

---

## 17. BALP - Basic Audit Log Patterns

**Esito: VERIFICATA - esiste come Implementation Guide IHE.**

| Dato | Valore |
|---|---|
| Titolo | **Basic Audit Log Patterns (BALP)** |
| Ente | IHE ITI |
| **Versione** | **1.1.4** |
| Stato | **Trial-Implementation** (pubblicata) |
| Data di pubblicazione | **2025-10-31** |
| Canonical | `https://profiles.ihe.net/ITI/BALP/ImplementationGuide/ihe.iti.balp` |
| Package id | `ihe.iti.balp#1.1.4` |
| Base FHIR | **R4** |
| Home | <https://profiles.ihe.net/ITI/BALP/index.html> |

È un **Content Profile**: definisce pattern riusabili di `AuditEvent`, con enfasi sul logging *privacy-centric* che identifica in modo esplicito il paziente come soggetto dell'attività registrata. La guida dichiara che audit event più specifici *"should be derived off of these basic patterns"*.

### 17.1 Profili `AuditEvent` definiti (elenco completo verificato)

**Pattern RESTful** - per ciascuna operazione esistono **due** varianti, una senza paziente e una con paziente identificato:

| # | Profilo |
|---|---|
| 1 | Basic AuditEvent for a successful **Create** not related to a Patient |
| 2 | Basic AuditEvent for a successful **Create** with known Patient subject |
| 3 | Basic AuditEvent for a successful **Read** |
| 4 | Basic AuditEvent for a successful **Read** with a Patient |
| 5 | Basic AuditEvent for a successful **Update** |
| 6 | Basic AuditEvent for a successful **Update** with a Patient subject |
| 7 | Basic AuditEvent for a successful **Delete** |
| 8 | Basic AuditEvent for a successful **Delete** with Patient |
| 9 | Basic AuditEvent for a successful **Query** |
| 10 | Basic AuditEvent for a successful **Query** with Patient |

**Pattern di disclosure e di autorizzazione:**

| # | Profilo |
|---|---|
| 11 | Audit Event for Privacy Disclosure at Source |
| 12 | Audit Event for a Privacy Disclosure as recorded by a Recipient |
| 13 | Basic AuditEvent pattern for oAuth Opaque |
| 14 | Basic AuditEvent pattern for oAuth Opaque (variante minimale) |
| 15 | Basic AuditEvent pattern for when an Authorization permit is decided |
| 16 | Basic AuditEvent pattern for when an activity was authorized by an IUA access token |
| 17 | Basic AuditEvent pattern for when an activity was authorized by an SAML access token - Comprehensive |
| 18 | Basic AuditEvent pattern for when an activity was authorized by an SAML access token - Minimal |
| 19 | IHE IUA ITI-71 AuditEvent for a successful Get Access Token |

### 17.2 Altri artefatti

| Categoria | Artefatti |
|---|---|
| **Extension** | *AuditEvent.agent Assurance Level*; *AuditEvent.agent other identifiers* |
| **ValueSet** | *Agent types holding User-Agent*; *Authorization subType events valueset*; *Entity Types used by IHE BasicAudit*; *Other Id Types ValueSet*; *RESTful objects role in the event*; *all Reads*; *all Searches*; *all Updates*; *participant source types for RESTful create* |
| **CodeSystem** | *Authorization subType events*; *Entity Types that are defined in IHE BasicAudit*; *OtherId Identifier Types*; *The code used to identifiy a User Agent* (refuso presente nella fonte) |
| **CapabilityStatement** | *IHE ATNA Audit Record Repository supporting BALP Content*; *IHE BALP Audit Consumer*; *IHE BALP Audit Creator* |

**Rilevanza per Telemedic (vincolo V5)**: BALP è la specifica corretta da citare per la forma degli `AuditEvent` esportabili verso un Audit Record Repository ATNA, e i due pattern *Privacy Disclosure at Source* / *as recorded by a Recipient* sono esattamente i pattern necessari quando il referto viene restituito al sistema di origine dell'integratore. Va però pinnata la versione `1.1.4`: è *Trial-Implementation*, non *Final Text*.

---

## Correzioni da apportare alle ricerche R1 e R5

### R1 - `.telemedic/research/R1-standard-sanitari.md`

| # | Sezione | Correzione |
|---|---|---|
| C1 | §2.10.1, tabella `VirtualServiceDetail` | **`additionalInfo` è di tipo `url` (0..*)**, non `ExtendedContactDetail`. Correggere la riga. |
| C2 | §2.10.1, tabella `VirtualServiceDetail` | **`address[x]` ammette `url \| string \| ContactPoint \| ExtendedContactDetail`** (quattro tipi). Aggiungere `ExtendedContactDetail`. |
| C3 | §2.10.1 | **Il binding di `channelType` è `Example`, non `required`.** Va riscritto l'intero capoverso che argomenta «binding required su un value set di marchi commerciali»: la premessa è falsa e la conclusione (necessità del processo UTG) cade. Rimane vero e va conservato: il ValueSet ha tre soli codici corrispondenti a piattaforme commerciali di terze parti, è `draft`/`experimental`/`immutable` con avvertenza *"not yet ready for production use"*, e contiene un errore redazionale nella definizione di uno dei tre codici (testo sui prezzi). |
| C4 | §2.10.1 | Il pacchetto cross-version ha una **versione 0.1.0 pubblicata come STU** (`hl7.fhir.uv.xver-r5.r4`), non solo `0.0.1-snapshot-2`. Aggiornare, mantenendo l'avvertenza sul *maturity level 0* e sull'obbligo di pinning. |
| C5 | §2.10.4 e riga 813 | **L'URL `http://hl7.org/fhir/5.0/StructureDefinition/extension-Encounter.virtualService` è confermato corretto.** Rimuovere il marcatore `[NV]` e l'avvertenza «non verificata carattere per carattere». Aggiungere però nell'esempio JSON la sotto-estensione obbligatoria **`_datatype` con valore `"VirtualServiceDetail"` (1..1)**, oggi assente. Segnalare che la forma `{"url":"address","valueUrl":…}` non è stata confermata sulla `StructureDefinition` (che espone `address` come estensione complessa su `ExtendedContactDetail`) e va validata contro il pacchetto pinnato. |
| C6 | §2.10.3, riga 776 | Rimuovere il `[NV]`: **`PPRF` / display `primary performer` è verificato**, ed è esplicitamente incluso nel ValueSet `encounter-participant-type` (12 concetti). Aggiungere che `SPRF`, `ATND`, `CON`, `REF` sono anch'essi nell'espansione. |
| C7 | riga 1351 | **`NN` non è un codice della tabella HL7 0203.** Il concetto esistente ha codice letterale **`NNxxx`**, con `xxx` = ISO 3166 alpha-3 → per l'Italia **`NNITA`**, valore generato dalla regola e non enumerato in HL7 Terminology. Nessun profilo HL7 Italia lo fissa: il ValueSet `vs-tipoIdentificatore` di IT-Core include l'intero `v2-0203` (147 concetti) senza selezione. Mantenere quindi «da concordare con l'integratore», ma citare `NNITA` come raccomandazione motivata e `TAX`/`NI` come alternative. |
| C8 | riga 1352 | Rimuovere il `[NV]`: **`PV1-2 = O` = Outpatient è verificato** su `http://terminology.hl7.org/CodeSystem/v2-0004` (OID `2.16.840.1.113883.18.5`). |
| C9 | riga 1370 | Sostituire il `[NV]` con la struttura verificata del segmento `ERR` v2.5 (12 campi, tipi `ELD`/`ERL`/`CWE`/`ID`/`CWE`/`ST`/`TX`/`TX`/`IS`/`CWE`/`CWE`/`XTN`, item 00024 e 01812–01822, `ERR-1` mantenuto per retro-compatibilità, tabelle 0357/0516/0517/0518). **Il codice `207` è verificato** ("Application error", *"Rejection: A catchall for internal errors not explicitly covered by other codes."*). **Restano non verificabili LEN, OPT e RP/#**: non pubblicarli. |
| C10 | riga 1470 | Sostituire il `[NV]` con l'elenco verificato: **13 message map** nell'IG *HL7 Version 2 to FHIR* **v1.0.0** (trial-use, generata 2025-10-07): `ADT_A01`, `ADT_A02`, `ADT_A05`, `ADT_A06`, `ADT_A09`, `ADT_A11`, `ADT_A17`, `OML_O21`, `ORM_O01`, `VXU_V04`, `ORU_R01`, `MDM_T02`, `SIU_S12`. **Tutte con standards status `Informative`.** Aggiungere che esistono 77 segment map, anch'esse *Informative*, e che **non esiste una segment map `ERR`**. |
| C11 | riga 1030 | Sostituire il `[NV]`. **L'estensione `backport-topic` NON esiste**: in R4 il canonical del `SubscriptionTopic` va in `Subscription.criteria`. Le estensioni realmente definite sono sette (`backport-channel-type`, `backport-filter-criteria`, `backport-heartbeat-period`, `backport-max-count`, `backport-payload-content`, `backport-timeout`, `capabilitystatement-subscriptiontopic-canonical`), tutte sotto `http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/`. Le operazioni sono **tre**: `$status` (obbligatoria), `$events`, `$get-ws-binding-token`. L'IG è alla **1.1.0 del 2023-01-11**. |
| C12 | riga 1585 | Rimuovere il `[NV]` sui search parameter di ITI-78: elenco verificato di 14 parametri su PDQm **3.2.0 Trial-Implementation (2025-11-04)**, con `mothersMaidenName` in camelCase e l'obbligo per il Supplier di supportare le combinazioni `family`+`gender` e `birthdate`+`family`. (L'operazione `$match` di ITI-119 resta non verificata: fuori dal mandato B6.) |
| C13 | riga 1917 | Il `[NV]` si chiude in senso negativo: **è accertato che il CodeSystem `http://hl7.it/fhir/televisita/CodeSystem/diagnosi-icd9cm` (v0.2.0) non dichiara alcuna edizione di ICD-9-CM**, né copyright, né fonte. Riformulare da «non verificato» a «assenza accertata - lacuna dell'IG da segnalare a HL7 Italia». |
| C14 | riga 1970 | Sostituire il `[NV]` con il contenuto verificato di `vs-tipo-ricetta` (7 codici: `EE`, `UE`, `NA`, `ND`, `NE`, `NX`, `ST`) e **segnalare la discrepanza nome/contenuto**: il ValueSet è intitolato «Codici Assistenza Stranieri» e non contiene tipologie di ricetta. |
| C15 | §11.4 D3 | La questione si chiude: **verificato che `EncounterTelevisita` non fissa `Encounter.class`** (1..1, binding *extensible* a `v3-ActEncounterCode`, nessun fixed/pattern). Riformulare D3 da «va chiarito con HL7 Italia se `VR` è il valore atteso» a «il profilo lascia la scelta all'implementatore; `VR` è la sola opzione semanticamente corretta nel value set e va formalizzata in ADR; resta opportuno un chiarimento con HL7 Italia». |
| C16 | Appendice A | Aggiornare il riferimento Bulk Data da `https://hl7.org/fhir/uv/bulkdata/STU2/export.html` a **`https://hl7.org/fhir/uv/bulkdata/STU3/`** (v3.0.0, trial-use attiva dal 2025-12-11). |
| C17 | Appendice A / §5 | Aggiungere alle fonti primarie: `https://hl7.org/fhir/uv/xver-r5.r4/0.1.0/`, `https://profiles.ihe.net/ITI/BALP/`, `https://terminology.hl7.org/6.0.2/CodeSystem-v2-0004|0203|0357|0516|0517|0518.html`, `https://www.hl7.eu/HL7v2x/v251/std251/ch10.html`, `https://www.hl7.it/fhir/core/0.2.0/`. |

### R5 - questioni non verificate

| # | Questione | Correzione / chiusura |
|---|---|---|
| C18 | **Q3 - `system` del codice fiscale** | Chiusa. Il valore da usare per la famiglia *Televisita* è **`http://hl7.it/sid/codiceFiscale`** (identico in IT Base 0.1.0 e in `PatientTelevisita` 0.2.0). **Va però documentato che IT-Core 0.2.0 usa un URI diverso**, `http://hl7.it/fhir/itcore/CodeSystem/cs-codicefiscale`: la divergenza è reale e va gestita nel mapping verso consumatori IT-Core. Aggiungere questa divergenza all'elenco delle questioni aperte verso HL7 Italia, accanto a D3. |
| C19 | **Bulk Data `$export`** | Chiusa integralmente (voce 10). Se R5 cita STU2, aggiornare a **v3.0.0**; se cita l'insieme di parametri `{_outputFormat, _since, _type, _typeFilter, _elements}` come completo, **aggiungere `_until`, `patient`, `includeAssociatedData`, `organizeOutputBy`, `allowPartialManifests`**. Se descrive il manifest, aggiungere `outputOrganizedBy` e `link` e i campi `continuesInFile` degli item. **Non usare i nomi del continuous build** (`outcome`, `manifestType`, `fileSize`, `countSeverity`): non sono pubblicati. |
| C20 | **`acr` SPID** | Chiusa per SAML e OIDC SPID: `https://www.spid.gov.it/SpidL1|SpidL2|SpidL3`, in `AuthnContextClassRef` (SAML) e in `acr_values` separati da spazio e in ordine di preferenza (OIDC). **Non chiusa per CIE id**: le regole tecniche rinviano a `acr_values_supported` dei metadata dell'OP. Se R5 elenca valori `acr` per CIE, vanno rimossi o marcati come da confermare col gestore d'identità. |
| C21 | **`SIU^S12` in v2.5.1** | Chiusa (voce 12). Se R5 descrive la struttura, verificare che riporti: `TQ1` presente in 2.5.1, gruppo `PATIENT` **opzionale**, gruppo `RESOURCES` **obbligatorio e ripetibile** con `RGS` in testa, `NTE` in cinque posizioni distinte, e che la stessa struttura copre S12–S24 e S26. |
| C22 | **Header `Deprecation`** | **È RFC 9745, Standards Track, marzo 2025.** Se R5 lo descrive come Internet-Draft, correggere. Valore = Item Structured Header di tipo Date (`Deprecation: @1688169599`); usare `Sunset` (RFC 8594) con timestamp mai anteriore, e la link relation `deprecation`. |
| C23 | **Header `Idempotency-Key`** | **Non è RFC.** `draft-ietf-httpapi-idempotency-key-header-07` (2025-10-15) risulta **scaduto e archiviato**. Qualsiasi affermazione di conformità a uno standard va rimossa: si tratta di una convenzione di progetto. |
| C24 | **Header `RateLimit-*`** | **Non è RFC** (`draft-ietf-httpapi-ratelimit-headers-11`, 2026-05-23, Internet-Draft attivo). **La forma a tre header `RateLimit-Limit` / `RateLimit-Remaining` / `RateLimit-Reset` è superata**: la revisione corrente definisce solo **`RateLimit`** e **`RateLimit-Policy`**. Se R5 cita i tre header legacy come standard, va corretto su entrambi i piani. |
| C25 | **CloudEvents `ce-*`** | Chiusa (voce 14). Aggiungere il vincolo verbatim: **`ce-datacontenttype` MUST NOT essere presente**; il content type va solo in `Content-Type`. Se R5 elenca `ce-datacontenttype` fra gli header binary, è un errore da rimuovere. |
| C26 | **`scratchpad.read`** | **Esiste ed è valido** in SMART Web Messaging 1.0.0 (STU1, 2022-05-06). L'elenco completo dei `messageType` è: `status.handshake`, `ui.done`, `ui.launchActivity`, `scratchpad.create`, `scratchpad.read`, `scratchpad.update`, `scratchpad.delete`, `fhir.http`. Nota redazionale: il campo di risposta è `additionalResponsesExpected` (plurale). Gli `activityType` dell'Activity Catalog (`appointment-book`, `order-review`, `problem-review`) non sono `messageType` e non vanno mescolati. |
| C27 | **`fhir.js`** | **Archiviata l'8 ottobre 2024, read-only, nessun successore indicato.** Va rimossa da qualunque elenco di dipendenze candidate. Sostituire con la tabella della voce 16. Segnalare inoltre che il pacchetto npm **`fhir` è deprecato e rinominato in `fhir-tool`**. |
| C28 | **BALP** | **Esiste**: IHE ITI *Basic Audit Log Patterns*, **v1.1.4, Trial-Implementation, 2025-10-31**, package `ihe.iti.balp#1.1.4`, su FHIR R4. Definisce 10 profili `AuditEvent` per le operazioni RESTful (create/read/update/delete/query, ciascuna in variante con e senza paziente), 2 pattern di privacy disclosure (at Source / as recorded by a Recipient), 6 pattern di autorizzazione (oAuth opaco, IUA, SAML comprehensive/minimal, authorization permit), più ITI-71. Va pinnata la versione: è Trial-Implementation, non Final Text. |

---

## Appendice - Fonti primarie consultate in questa verifica

| Ambito | URL |
|---|---|
| FHIR R4 core | <https://hl7.org/fhir/R4/v3/ParticipationType/cs.html>, <https://hl7.org/fhir/R4/valueset-encounter-participant-type.html> |
| FHIR R5 core | <https://hl7.org/fhir/R5/metadatatypes-definitions.html>, <https://hl7.org/fhir/R5/valueset-virtual-service-type.html> |
| Cross-version extensions | <http://hl7.org/fhir/uv/xver-r5.r4/0.1.0/>, <http://hl7.org/fhir/uv/xver-r5.r4/0.1.0/StructureDefinition-ext-R5-Encounter.virtualService.html>, <http://hl7.org/fhir/uv/xver-r5.r4/0.1.0/StructureDefinition-ext-R5-Appointment.virtualService.html> |
| Bulk Data Access | <https://hl7.org/fhir/uv/bulkdata/STU3/en/index.html>, <https://hl7.org/fhir/uv/bulkdata/STU3/en/export.html>, <https://hl7.org/fhir/uv/bulkdata/STU2/export.html>, <https://build.fhir.org/ig/HL7/bulk-data/en/export.html> |
| Subscriptions R5 Backport | <https://hl7.org/fhir/uv/subscriptions-backport/> (index, components, notifications, conformance, artifacts, `StructureDefinition-backport-*`, `OperationDefinition-backport-*`, `CodeSystem-backport-content-code-system`, `CapabilityStatement-backport-subscription-server-r4`) |
| SMART Web Messaging | <https://hl7.org/fhir/uv/smart-web-messaging/>, `/smart-web-messaging.html`, `/activity-catalog.html`, `/toc.html` |
| v2-to-FHIR | <https://hl7.org/fhir/uv/v2mappings/>, `/message_maps.html`, `/segment_maps.html` |
| HL7 Terminology | <https://terminology.hl7.org/6.0.2/CodeSystem-v2-0004.html>, `-v2-0203`, `-v2-0357`, `-v2-0516`, `-v2-0517`, `-v2-0518` |
| HL7 v2 (mirror HL7 Europe) | <https://www.hl7.eu/HL7v2x/v25/std25/ch02.html>, <https://www.hl7.eu/HL7v2x/v25/std25/ch03.html>, <https://www.hl7.eu/HL7v2x/v251/std251/ch10.html> |
| HL7 Italia | <https://www.hl7.it/fhir/>, <https://www.hl7.it/fhir/televisita/StructureDefinition-EncounterTelevisita.html>, `-PatientTelevisita.html`, <https://www.hl7.it/fhir/televisita/CodeSystem-diagnosi-icd9cm.html>, <https://www.hl7.it/fhir/televisita/ValueSet-vs-tipo-ricetta.html>, <https://www.hl7.it/fhir/base/StructureDefinition-Patient-it-base.html>, <https://www.hl7.it/fhir/base/Patient-esempio-CF-residenza.json.html>, <https://www.hl7.it/fhir/core/0.2.0/artifacts.html>, <https://www.hl7.it/fhir/core/0.2.0/StructureDefinition-patient-it-core.html>, <https://www.hl7.it/fhir/core/0.2.0/ValueSet-vs-tipoIdentificatore.html> |
| IHE | <https://profiles.ihe.net/ITI/PDQm/ITI-78.html>, <https://profiles.ihe.net/ITI/PIXm/ITI-83.html>, <https://profiles.ihe.net/ITI/BALP/index.html>, <https://profiles.ihe.net/ITI/BALP/artifacts.html> |
| IETF | <https://www.rfc-editor.org/rfc/rfc9745.html>, <https://datatracker.ietf.org/doc/draft-ietf-httpapi-idempotency-key-header/>, <https://datatracker.ietf.org/doc/draft-ietf-httpapi-ratelimit-headers/> |
| CloudEvents | <https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/http-protocol-binding.md> |
| SPID / AgID | <https://docs.italia.it/italia/spid/spid-regole-tecniche/it/stabile/single-sign-on.html>, <https://docs.italia.it/AgID/documenti-in-consultazione/lg-openidconnect-spid-docs/it/bozza/authorization-endpoint-authentication-request.html>, <https://docs.italia.it/italia/spid/spid-cie-oidc-docs/it/versione-corrente/authorization_endpoint.html> |
| Librerie JS/TS | <https://github.com/FHIR/fhir.js>, <https://github.com/smart-on-fhir/client-js>, <https://github.com/Vermonster/fhir-kit-client>, <https://registry.npmjs.org/fhirclient/latest>, <https://registry.npmjs.org/fhir-kit-client/latest>, <https://registry.npmjs.org/@types/fhir/latest>, <https://registry.npmjs.org/fhirpath/latest>, <https://registry.npmjs.org/@medplum/fhirtypes/latest>, <https://registry.npmjs.org/fhir/latest> |

---

**File di riferimento del progetto** (non modificati da questo agente, che non ha permesso di scrittura):
- `/home/federicocalo/Scrivania/prj/Telemedic/.telemedic/context/00_PROJECT_BRIEF.md`
- `/home/federicocalo/Scrivania/prj/Telemedic/.telemedic/research/R1-standard-sanitari.md` - le correzioni C1–C17 vanno applicate a questo file, in particolare alle righe 396, 612–626, 776–778, 786–813, 1030, 1351–1353, 1370, 1470, 1585, 1917, 1970, 2205–2208, 2224–2235.