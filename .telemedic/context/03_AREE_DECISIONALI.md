# Aree decisionali e mandati di approfondimento

Classificazione delle ~108 questioni aperte emerse dalla fase di ricerca.
Distingue ciò che deve decidere il committente da ciò che va approfondito da altri agenti.

## A - DECISIONI DEL COMMITTENTE (bloccanti)

| # | Area | Questione | Origine |
|---|---|---|---|
| A1 | **Perimetro MDR** | La v1.0 include un `viewer` di dati clinici e/o il telemonitoraggio? Il DM 21 set. 2022 imporrebbe in tal caso una classe superiore alla I, con Organismo Notificato. | R3-Q1, R4-13/14/15 |
| A2 | **Chi è il fabbricante** | In un progetto open source con contributori esterni, chi assume la responsabilità di fabbricante ai sensi dell'MDR? Persona fisica, entità giuridica da costituire, o l'integratore? | R2 (atteso) |
| A3 | **Conformità IG italiane** | Conformità piena alle IG di HL7 Italia come profilo di default, oppure FHIR R4 base con profile pack italiano opzionale? Impatta modello dati, validazione, test, packaging. | R3-Q3, R1-A1 |
| A4 | **`Composition` vs `DiagnosticReport`** | Il sito dichiara `DiagnosticReport`; le IG nazionali usano `Composition` + `Bundle`. Sostituire o affiancare come vista di compatibilità? | R1-A1, R3-Q2 |
| A5 | **Perimetro funzionale** | Refertazione/firma, viewer clinico, booking, billing: il DM impone di **integrare** invece di costruire. Si accetta la riduzione di perimetro? | R3-Q5 |
| A6 | **Ruolo nell'architettura nazionale** | Telemedic è una IRT, una componente di IRT, o resta agnostico? Determina se implementa un client verso il Gateway FHIR o lascia l'onere all'integratore. | R3-Q4 |
| A7 | **Event broker** | Il DM impone architettura event-driven con broker. Quale, e come si concilia con Docker Compose on-premise? | R3-Q7 |
| A8 | **Rischio Keycloak** | L'SSO senza secondo login poggia sul JWT Authorization Grant, in *preview*. Si accetta il rischio, si prototipa subito, o si progetta un ripiego? | R5-Q1 |
| A9 | **Claim pubblici da correggere** | FIPS 140-2, "end-to-end", "peer-to-peer", "<200 ms", "key rotation": riformulazioni proposte da approvare. | R4-T3/T4/T5/T7 |
| A10 | **Verifica indipendente delle chiavi (SAS)** | Si introduce la Short Authentication String in v1.0? È ciò che rende difendibile il claim end-to-end. | R4-R3 |
| A11 | **Topologia futura** | Solo 1:1 in v1.0, o mesh a 3 per interprete/caregiver/secondo specialista? Cambia il progetto del media layer. | R4-2 |
| A12 | **Registrazione: dove** | Client-side (preserva E2E, costa CPU) o server-side (richiede terminare la cifratura). E contenitore MP4 o WebM. | R4-3/19/T8 |
| A13 | **Profili di deployment** | Tre profili (UE / Italia / PSN-cloud qualificato ACN): si documentano tutti e tre come supportati? | R3-Q6 |
| A14 | **WCAG 1.2.4** | Non-conformità dichiarata sui sottotitoli live con interprete come misura alternativa: si accetta? | R4-T14 |

## B - MANDATI DI RICERCA APPROFONDITA (agenti dedicati)

| # | Mandato | Contenuto | Agente proposto |
|---|---|---|---|
| B1 | **Verifiche documentali italiane** | V1-V10 di R3: testo integrale DM 19 nov. 2025 (all. 2 e 4), legge di bilancio 2026, contraddizione tariffe 2026, tipologia documentale FSE per il referto di televisita, valore `T` nel flusso art. 50, riprogrammazione PNRR, stato reale IRT, allegato B al DM 30 set. 2022, indicazioni metodologiche AGENAS. | research-analyst |
| B2 | **Requisiti tecnici minimi normativi** | Esistono soglie normative di risoluzione, frame rate, latenza per la telemedicina in Italia? Se esistono prevalgono sulle proposte ingegneristiche. | research-analyst |
| B3 | **Verifica coturn e CVE** | Versione corrente, direttive di configurazione non confermate, CVE reali su fonte primaria. 16 voci non verificate. | security-engineer |
| B4 | **Determinazione ACN 379907/2025** | Specifiche di base NIS2, efficaci dal 15 gen. 2026, attuazione dimostrabile entro il 31 ott. 2026. Mappatura su STRIDE. | security-auditor |
| B5 | **Licenze terminologiche** | SNOMED CT e Apache-2.0, LOINC, ATC/WHOCC, ICD-9-CM italiano. Formulazione del disclaimer nel NOTICE. | legal-advisor |
| B6 | **Dettagli FHIR non verificati** | 9 voci di R1-D1, più Bulk Data `$export`, `system` del codice fiscale, mappatura `acr` per SPID L1/L2/L3, Subscriptions Backport. | data-researcher |
| B7 | **Identità digitale italiana** | SPID (accreditamento SP presso AgID e tempi), CIE ID, TS-CNS, livelli di garanzia, integrazione Keycloak. | api-documenter |
| B8 | **Stato API Identity Provider RFC 8827 §7** | Utilizzabile nei browser target o di fatto abbandonata? Determina se la SAS è l'unica strada. | search-specialist |

## C - SPIKE TECNICI (da schedulare in roadmap, non ricerca documentale)

| # | Spike | Perché è bloccante |
|---|---|---|
| C1 | Token exchange external-to-internal su Keycloak | Blocca la modalità primaria di integrazione |
| C2 | `MediaRecorder` con `video/mp4` sui browser target | Il claim pubblico dichiara MP4 |
| C3 | Carico CPU della registrazione client-side su hardware modesto | Rischio di degradare la sessione che deve tutelare |
| C4 | Embed senza cookie con tutti i cookie di terze parti bloccati | Safari e Firefox bloccano già |
| C5 | Relay TURN verso loopback e rete interna | Rischio critico T1, va testato in CI |
| C6 | Misura glass-to-glass con fixture Y4M e timecode | Rende verificabile il target di latenza |

## D - QUESTIONI TECNICHE RISOLVIBILI IN SEDE DI ARCHITETTURA
Non richiedono decisione del committente né ricerca: le risolve l'agente architetto negli ADR.
R1-A2/A3/A4/A5 · R1-S1/S2/S3/S5 · R3-Q8 · R4-1/4/5/6 · R5-Q2/Q12 · R6-11.3
