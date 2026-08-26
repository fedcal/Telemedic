# Log agente R1 - Standard e terminologie sanitarie

**Output**: `.telemedic/research/R1-standard-sanitari.md` (~18.570 parole, 11 sezioni + 2 appendici)

## Fatti chiave accertati (VINCOLANTI per gli agenti a valle)

1. **FHIR R4 = versione 4.0.1** (2019-10-30). Da citare sempre con la patch.
2. **Esiste già l'Implementation Guide HL7 Italia "Televisita" v0.2.0 su FHIR R4.** Modella il referto come **`Composition`** (LOINC **75496-0**), **non** come `DiagnosticReport`. Il posizionamento pubblico del progetto va corretto di conseguenza. Stato: draft / trial-use - da valutare se dichiarare conformità a uno standard non ancora stabile.
3. **La televisita si modella con `Encounter.class = VR`** (CodeSystem `http://terminology.hl7.org/CodeSystem/v3-ActCode`). R4 **non** ha elementi per la sessione virtuale: `virtualService` esiste solo in R5.
4. **`Media` è rimossa in R5** → le registrazioni vanno modellate su **`DocumentReference`**, mai su `Media`.
5. **`Encounter.participant.individual` non può referenziare `Patient`** in R4. Errore di modellazione frequente.
6. **L'Italia non è Membro di SNOMED International**: nessun contenuto SNOMED CT va distribuito nel repository. Solo riferimento URI+codice, con espansione delegata a un terminology server esterno configurabile.
7. **La televisita nel nomenclatore italiano usa la stessa codifica della prestazione in presenza**: la modalità di erogazione è un asse separato dalla prestazione. Non esiste un codice "televisita" distinto.
8. **Conformità It-Core 0.2.0** per le anagrafiche, con `identifier` su `http://hl7.it/fhir/itcore/CodeSystem/cs-codicefiscale` e slice per gli identificativi proprietari dell'integratore.
9. **`Prefer: handling=strict` come default del server**: deviazione consapevole dal SHOULD della specifica, motivata dal rischio di over-disclosure in multi-tenant.
10. **ATNA ITI-20 su syslog over TLS (RFC 5425)**; UDP (RFC 5426) solo come fallback documentato, con l'avvertenza del troncamento a 1024 byte. Prerequisito: **CT Time Client (ITI-1)** con NTP e verifica in startup check.
11. **MHD ITI-65** come transazione di restituzione del referto al sistema di origine. **XDS.b da evitare** come interfaccia primaria (SOAP/ebXML).
12. **`Subscription` R4 non copre le cancellazioni né l'uscita dai criteri**: limite strutturale. Serve un canale di eventi proprietario affiancato, oppure l'IG Subscriptions R5 Backport 1.1.0.
13. **`$validate` restituisce HTTP 200 con `OperationOutcome` di errore**: gli SDK devono gestirlo correttamente.
14. **HL7 v2**: ingestione **ADT^A04/A08** (non A01, che è il ricovero), **SIU^S12-S26** per la schedulazione, emissione **MDM^T02** con `TXA-17 = LA`. **MLLP sempre su TLS** con mutua autenticazione X.509.
15. **IHE ITI TF rev. 20.2** (2025-11-11). MHD, PIXm, PDQm, IUA sono tutti su FHIR R4 ma in stato trial implementation o ballot: serve una policy di pinning delle versioni.
16. **SMART e IUA non sono equivalenti**: vanno supportati entrambi come profili alternativi su Keycloak, con matrice di decisione.

## Anti-pattern da evitare esplicitamente

`Media` per le registrazioni · `XDS.b` come interfaccia primaria · openEHR in v1.0 · metriche WebRTC come `Observation` con `subject = Patient` (è dato tecnico, non clinico) · distribuzione di contenuto SNOMED CT · `Encounter.participant.individual` → `Patient` · codice di prestazione "televisita" distinto · URI `http://hl7.org/fhir/sid/icd-11` (errato).

## Roadmap tecnica proposta in 6 fasi

P0 fondamenta FHIR (sett. 1-4) → P0 audit/consenso/tempo (3-6) → P0 referto e restituzione (5-9) → P1 integrazione e autorizzazione (7-11) → P1/P2 HL7 v2 e profili (9-12) → P2/P3 imaging e capacità avanzate (11-14).

## Questioni aperte

A1-A5 architettura · S1-S7 sicurezza · Q1-Q5 conformità · D1-D4 documentazione · R1-R3 roadmap. Vedi §11 del documento.

**Avvertenza R3 (roadmap)**: la fase 6 cade nelle ultime tre settimane prima del 30 novembre e dipende da specifiche in stato *ballot* o *snapshot pre-release*. Da verificare la compatibilità con la decisione D5 ("v1.0 completo, senza tagli").
