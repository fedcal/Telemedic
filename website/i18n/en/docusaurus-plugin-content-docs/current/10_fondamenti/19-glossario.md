---
title: Glossary
sidebar_position: 20
description: "Glossary of the foundations guide: every term and every acronym introduced by the twenty modules, in Italian and in English, with the nature of the definition, the pointer to the module that deals with it, the false synonyms, the terms not to be used and the words that change meaning with the context."
---

# Glossary

This is the glossary of the **foundations guide**. It is not a dictionary of telemedicine and it
is not the glossary of the domain model: it is the consultable index of **what the twenty modules
of this guide have actually introduced**, gathered in a single place because nobody reads the
guide in order and almost everybody interrupts it half-way to look up a word.

Every entry listed here appears in at least one module of the guide or in at least one area of the
documentation. There are no entries added for encyclopaedic completeness: a glossary that defines
terms the project does not use is noise, and noise makes people lose confidence precisely in the
entries that matter.

## 1. How this glossary is used

**It is consulted, not read.** It is the only module of the guide for which this recommendation is
literal. Look up the word, read two lines, follow the pointer if you need the context, go back to
what you were doing.

**The glossary points, it does not repeat.** Every entry contains the minimum definition sufficient
not to go wrong, and the pointer to the module or to the area in which the concept is dealt with in
full. If the entry seems too short to you, it is because it is short on purpose: the treatment is
elsewhere, and duplicating it here would only guarantee that the two copies diverge.

**The traps are the useful part.** Many terms in this domain have a common use and a technical use
that do not coincide, and the confusion between the two produces a substantial share of the errors
this guide exists to prevent. Where the trap exists, the entry declares it. If you read only one
part of an entry, read that one.

### 1.1 What this glossary does not contain

1. **It does not contain the modelling detail.** To know whether a term is an entity, a value
   object, a domain event or an attribute, and with which invariants, the source is the
   [domain glossary](/05_domain/09-glossario-del-dominio.md), which declares for each entry the
   nature of the definition and the chapters in which it is modelled. This glossary **absorbs**
   that source for the entries the guide introduces and **points** to it for everything else.
2. **It does not contain clinical thresholds.** No numerical reference value for any parameter
   appears on this page, in any form. Thresholds are clinical configuration for each individual
   patient, decided by the professional, and a glossary is not the place where they are laid down.
3. **It does not contain content of terminologies under licence.** In particular **no SNOMED CT
   code and no SNOMED CT description**, in any form. The entry «SNOMED CT» describes the regime of
   the terminology; it does not report a single concept from it.
4. **It does not contain real data.** No example on this page refers to existing people; the
   identifiers cited are described in their structure, never instantiated.
5. **It does not contain names of companies, commercial products, trade marks or domains of
   potential partners.** Integration counterparties are named by category: «the integrator», «a
   cloud healthcare management system», «a third-party EHR system».
6. **It does not contain invented regulatory definitions.** Where a term has a definition in law,
   the entry reports that one and cites the precise reference. Where it does not have one, the
   entry declares that the definition is **the project's**. What has not been verified is marked
   `[NV]`.

### 1.2 How an entry is read

Every entry has four elements.

| Element | Content |
|---|---|
| **Term** | The Italian form, followed by the English equivalent in parentheses where one exists. Where the English equivalent **is not exact** - because the Italian term designates a national legal institution with no counterpart - the entry says so expressly |
| **Nat.** | The nature of the definition, according to the key that follows |
| **Definition** | One or two sentences comprehensible to somebody who does not know the domain; where it exists, the **trap** in bold |
| **Where** | The module of the guide or the area of documentation that introduces the term, with a link |

Key to the **Nat.** column, taken over from the rule of precedence between sources defined in the
[ubiquitous language](/05_domain/01-linguaggio-ubiquo.md):

| Letter | Meaning |
|---|---|
| **N** | **Normative** - the definition is given by a normative or administrative act, Italian or of the Union, cited in the entry. The project cannot narrow it, widen it or rename it |
| **G** | **National guide** - the definition is given by an implementation guide or by a national technical specification; it prevails over the generic international model |
| **S** | **Standard or consolidated technical vocabulary** - the definition is given by an international specification (HL7, IETF, ISO, IEC, W3C, CEN) or by current technical vocabulary. It fixes the structure, not the clinical meaning |
| **P** | **Project** - an operational definition adopted by Telemedic, admissible because the higher levels are silent. It is a choice, and as such it is debatable and versioned |

`[NV]` marks an element **not verified** against a primary source. Where it appears, it is not a
defect of drafting: it is the honest declaration that the information must be confirmed before any
decision is derived from it.

### 1.3 Key to the pointers

The codes `F00`-`F20` indicate the modules of this guide; the codes in letters indicate the areas
of documentation. In the entries the code is always a link.

| Code | Destination |
|---|---|
| F00 | [How to use this guide](00-come-usare-questa-guida.md) |
| F01 | [The Italian healthcare system](01-sistema-sanitario-italiano.md) |
| F02 | [Telemedicine services](02-prestazioni-di-telemedicina.md) |
| F03 | [The clinical datum](03-il-dato-clinico.md) |
| F04 | [Identity and demographic registries](04-identita-e-anagrafiche.md) |
| F05 | [Interoperability standards](05-standard-di-interoperabilita.md) |
| F06 | [FHIR from scratch](06-fhir-da-zero.md) |
| F07 | [The FSE and national infrastructures](07-fse-e-infrastrutture-nazionali.md) |
| F08 | [WebRTC from scratch](08-webrtc-da-zero.md) |
| F09 | [Clinical fundamentals](09-fondamenti-clinici.md) |
| F10 | [Care pathways and patient safety](10-percorsi-di-cura-e-sicurezza.md) |
| F11 | [Computing fundamentals](11-fondamenti-informatici.md) |
| F12 | [Cryptography and security](12-crittografia-e-sicurezza.md) |
| F13 | [The protocols, one by one](13-protocolli.md) |
| F14 | [Functional flows](14-flussi-funzionali.md) |
| F15 | [The regulatory framework from scratch](15-regolatorio-da-zero.md) |
| F16 | [The architecture of the project](16-architettura-del-progetto.md) |
| F17 | [The development environment](17-ambiente-di-sviluppo.md) |
| F18 | [Contributing, area by area](18-contribuire-per-area.md) |
| F20 | [Primary sources](20-fonti-primarie.md) |
| TEC | [Technical area](/01_technical/00-indice.md) |
| ARC | [Architecture area](/02_architecture/00-indice.md) |
| FUN | [Functional area](/03_functional/00-indice.md) |
| PRO | [Protocols area](/04_protocols/00-indice.md) |
| DOM | [Domain area](/05_domain/00-indice.md) |
| SEC | [Security area](/06_security/00-indice.md) |
| INT | [Integration area](/07_integration/00-indice.md) |
| CMP | [Compliance area](/08_compliance/00-indice.md) |
| RDM | [Roadmap area](/09_roadmap/00-indice.md) |

### 1.4 A clarification that holds for all the regulatory entries

The project **intends to assume the role of manufacturer** within the meaning of Regulation (EU)
2017/745; the legal entity that will exercise it **is still to be constituted** and its constitution
is an internal prerequisite with a timescale of its own. The entries of this glossary that describe
obligations of the manufacturer are to be read in this light: they do not describe the path of an
undefined third party, they describe a path of the project.

**What does not change, and what this glossary repeats every time it is needed: today the product
does not bear CE marking** and is not covered by any declaration of conformity. Whoever installs,
integrates or puts the software into service assumes the obligations that follow from it. No entry
on this page - and no other document of the project - states that the product will be marked by a
given date.

---

## 2. Alphabetical list

### A

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **ABAC** (*attribute-based access control*, in Italian *controllo degli accessi basato sugli attributi*) | S | Authorisation model in which the decision evaluates attributes of the subject, of the resource, of the action and of the context, and not a single role. **Trap:** in healthcare the role is almost never enough, because the permission depends on the existence of a care relationship with that individual patient | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/00-indice.md) |
| **Accessorio** (*accessory*) | N | An article which, whilst not being itself a device, is intended by the manufacturer to be used with specific medical devices to enable their use or to assist their medical functionality (Reg. (EU) 2017/745, Art. 2, point 2) | [F15](15-regolatorio-da-zero.md) |
| **Accreditamento istituzionale** (*institutional accreditation*; approximate English equivalent: it is an institution of Italian healthcare law) | N | Regional recognition that enables an organisation to deliver services on behalf of the health service. **Trap:** it presupposes the healthcare authorisation but does not coincide with it, and it is not equivalent to the contract: they are three distinct steps, and an organisation may have the first two without the third | [F01](01-sistema-sanitario-italiano.md) |
| **ACK / NACK** (*acknowledgement / negative acknowledgement*) | S | Confirmation or rejection messages in HL7 v2, available in original and enhanced mode. **Trap:** an ACK does not mean that the content has been accepted by the clinical system, but only that the message has been received or processed in the sense declared by the mode | [F05](05-standard-di-interoperabilita.md), [PRO](/04_protocols/00-indice.md) |
| **ACN - Accordo collettivo nazionale** (*national collective agreement for contracted physicians*; an Italian institution with no direct equivalent) | N | The contract of agreement-based medicine: general practitioners, freely chosen paediatricians, outpatient specialists. **Trap:** the same acronym designates the Agenzia per la cybersicurezza nazionale. In the project's documentation it must always be spelled out | [F01](01-sistema-sanitario-italiano.md) |
| **ACN - Agenzia per la cybersicurezza nazionale** (*National Cybersecurity Agency*) | N | The authority that qualifies cloud services and infrastructures for public administration, issues the security measures implementing the NIS rules and hosts CSIRT Italia. **Trap:** see the previous entry | [F07](07-fse-e-infrastrutture-nazionali.md), [SEC](/06_security/00-indice.md) |
| **`acr`** (*Authentication Context Class Reference*) | S | The claim that declares the context, and hence the level, of the authentication actually performed. **Trap:** the level of assurance is here, not in the `act` claim, which expresses delegation and not the robustness of the authentication | [F13](13-protocolli.md), [PRO](/04_protocols/00-indice.md) |
| **Acuto** (*acute*) | S | Said of an event or of a disease with an identifiable beginning, a short course and a defined outcome; it corresponds to an episodic model of care. **Trap:** the data model built on the acute does not hold for chronicity, which has neither a beginning nor an end and requires containers for the taking on of care | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **ADI - Assistenza domiciliare integrata** (*integrated home care*) | N | Delivery of health and health-and-social care services at the patient's home, articulated by levels of intensity | [F01](01-sistema-sanitario-italiano.md) |
| **ADT** | S | The family of HL7 v2 messages dedicated to demographics and to encounters: admission, discharge, transfer, demographic update | [F05](05-standard-di-interoperabilita.md), [PRO](/04_protocols/00-indice.md) |
| **Aderenza** (*adherence*) | P | The ratio between the expectations satisfied and the expectations generated by the plan, in a declared window and with explicit exclusions. **Trap:** it is not obedience, and its absence is not the patient's fault but a clinical datum that requires interpretation | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Aderenza terapeutica** (*treatment adherence*) | P | The correspondence between the person's real behaviour and the agreed therapeutic regimen. **Trap:** it is not observable by the system except by the data subject's declaration or by third-party data; every measure of it is a declared approximation | [F09](09-fondamenti-clinici.md) |
| **Adesione informata** (*informed acceptance of the remote channel*) | N | The prior expression of will by which the person accepts to receive that service **through that channel**. **Trap:** it is a clinical act distinct both from consent to treatment and from consent to data processing; merging them makes revocation ungovernable | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/06-consenso-e-riservatezza.md) |
| **AEAD** (*authenticated encryption with associated data*) | S | Authenticated encryption with associated data: it provides confidentiality and integrity together and binds data in the clear to the ciphertext (RFC 5116) | [F12](12-crittografia-e-sicurezza.md) |
| **Affaticamento da allarme** (*alarm fatigue*) | S | The progressive desensitisation of an operator exposed to a high number of non-actionable alarms. **Trap:** it is a documented mechanism for producing harm, not a problem of staff discipline; it must be treated as a risk in the sense of ISO 14971 | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Affiliata nazionale** (*national affiliate*) | S | An organisation that adapts the standards of an international body to the legal context of a country. For healthcare standards, in Italy, it is HL7 Italia | [F05](05-standard-di-interoperabilita.md) |
| **Affinity Domain Italia** | G | A document of national technical specifications for interoperability between the regional systems of the electronic health record (Fascicolo Sanitario Elettronico) | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **AGENAS** (*National Agency for Regional Healthcare Services*) | N | The national agency for regional health services, also the national agency for digital health. It manages the national telemedicine infrastructure and the health data ecosystem, and carries out the Validation Process for third-party solutions | [F01](01-sistema-sanitario-italiano.md), [F02](02-prestazioni-di-telemedicina.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **AgID - Agenzia per l'Italia digitale** (*Agency for Digital Italy*) | N | The authority for the technical rules cutting across public administration under Art. 71 of the Codice dell'Amministrazione Digitale (the Italian Digital Administration Code): interoperability model, data platform, accessibility, reuse. It manages the federation and the register of digital identity | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Aggiornamento perduto** (*lost update*) | S | An anomaly whereby a modification is overwritten by another without anybody noticing. It is prevented with optimistic concurrency | [F13](13-protocolli.md), [F11](11-fondamenti-informatici.md) |
| **Aggregato** (*aggregate*) | S | A group of entities and value objects treated as a single unit of consistency, which changes together in a single transaction so that a rule remains true. **Trap:** the aggregate is not a grouping of convenience: it is the boundary within which an invariant is guaranteed, and choosing it badly produces race conditions that no functional test intercepts | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](/02_architecture/03-modello-di-dominio.md) |
| **Agilità crittografica** (*cryptographic agility*) | S | The ability to replace algorithms and key sizes without rewriting the system, thanks to the identifier of the algorithm stored next to the encrypted datum | [F12](12-crittografia-e-sicurezza.md) |
| **AIC - Autorizzazione all'immissione in commercio** (*marketing authorisation number*) | N | The Italian code that identifies a medicinal product on the market. **Trap:** it identifies the commercial pack, not the active substance; they are two different levels and they serve different questions | [F05](05-standard-di-interoperabilita.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Alimentazione del fascicolo** (*EHR feeding*) | N | The conferral of data and documents to the health record by the obliged parties, within the deadlines fixed by Arts. 12–13 of DM 7 settembre 2023 (the Ministerial Decree of 7 September 2023) | [F07](07-fse-e-infrastrutture-nazionali.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Allarme clinico** (*clinical alarm*) | P | A signal communicating that a person's condition requires attention within a defined time. It requires four elements: condition, recipient, deadline, escalation. **Trap:** its recipient is the Centro erogatore (delivering centre), never the Centro servizi (service centre) | [F10](10-percorsi-di-cura-e-sicurezza.md), [FUN](/03_functional/05-gestione-degli-allarmi.md) |
| **Allarme tecnico** (*technical alarm*) | P | A signal that the measurement or transmission system is not working. The recipient is technical and **has no access to the clinical content**. **Trap:** a single queue of notifications produces the technician who receives a clinical alarm and the clinician habituated to technical alarms | [F10](10-percorsi-di-cura-e-sicurezza.md), [FUN](/03_functional/05-gestione-degli-allarmi.md) |
| **Almeno una volta** (*at-least-once*) | S | The delivery guarantee whereby a message arrives once or more. **Trap:** it requires an idempotent receiver; without idempotency «at least once» means «duplicates in production» | [F11](11-fondamenti-informatici.md), [F13](13-protocolli.md) |
| **ALPN** (*Application-Layer Protocol Negotiation*) | S | The negotiation, inside the TLS handshake, of the application protocol that will be used on the connection | [F13](13-protocolli.md) |
| **Al più una volta** (*at-most-once*) | S | The delivery guarantee without retries: the message arrives zero times or once | [F11](11-fondamenti-informatici.md) |
| **Ambiente effimero** (*ephemeral environment*) | P | A service started in a container for the duration of a test suite and destroyed at the end, with the state recreated from scratch at every execution | [F17](17-ambiente-di-sviluppo.md), [TEC](/01_technical/08-qualita-e-test.md) |
| **Ambito di accesso effimero** (*ephemeral access scope*) | P | A closed set of resources accessible to a consulting party for as long as the answer requires, distinct from access to the dossier. **Trap:** without a mandatory expiry it is not an ephemeral scope, it is a permanent access with a reassuring name | [F14](14-flussi-funzionali.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Amministratore di sistema** (*system administrator*, in the sense of the Italian data protection rules) | N | Whoever holds elevated technical privileges over systems that process personal data. Subject to individual designation, tracing of accesses and periodic review of what they have done | [F03](03-il-dato-clinico.md) |
| **Amministratore di sostegno** (*support administrator*; an institution of Italian civil law, with no exact equivalent) | N | A protective figure whose powers are **delimited by the decree of appointment** and may not include healthcare decisions. **Trap:** treating them as a guardian is a recurrent error; the scope must be recorded and verified act by act | [F03](03-il-dato-clinico.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Anagrafe consensi e revoche** (*consent and revocation registry*) | N | The component of the national interoperability infrastructure that records the consents to consultation of the health record and their revocations | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Anagrafica per riferimento** (*reference-based demographics*) | P | The model in which demographic data remain with the system of origin and the project works on qualified external identifiers. **Trap:** it is an architectural decision, not a fallback: duplicating the demographic record means becoming a second master data holder and having to reconcile for ever | [DOM](/05_domain/03-assistito-professionista-organizzazione.md), [INT](/07_integration/07-dati-e-sincronizzazione.md) |
| **Anamnesi** (*medical history taking*) | S | The guided gathering of the person's clinical history, articulated into family, physiological, past and present. **Trap:** it is the part of the medical act that the remote channel degrades least; this is why the televisita works for follow-up and not for the first assessment | [F09](09-fondamenti-clinici.md) |
| **ANA - Anagrafe nazionale degli assistiti** (*national registry of healthcare beneficiaries*) | N | The health registry provided for by Art. 62-*ter* of the Codice dell'Amministrazione Digitale: who is entitled to care, from which Region, with which trusted doctor and with which exemptions | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Ancoraggio** (*anchoring*) | P | The fingerprint of the head of a register chain, signed, timestamped and retained separately. **Trap:** it is what makes any later rewriting of history contradictable; without external anchoring a chain of fingerprints protects only against naive alterations | [F16](16-architettura-del-progetto.md), [ARC](/02_architecture/07-tracciamento-e-registro-immutabile.md) |
| **Annotazione digitale** (*digital note*; a documentary type of Italian law, with no equivalent) | N | The document that replaces the report in the televisita scheduled and delivered by the primary care doctor (DM 30 settembre 2022, Annex B) | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Annullamento del documento** (*document voiding*) | P | The cessation of effect of a signed document **without** the issue of a replacement version. **Trap:** it is not the corrective reissue, which instead replaces; confusing them produces holes in the documentary chain | [DOM](/05_domain/04-documenti-clinici.md) |
| **Anonimizzazione** (*anonymisation*) | N | Processing that renders the data subject no longer identifiable by reasonably available means; it takes the datum out of the scope of Regulation (EU) 2016/679. **Trap:** it is different from pseudonymisation, which takes nothing out of the scope | [F03](03-il-dato-clinico.md) |
| **ANPR - Anagrafe nazionale della popolazione residente** (*national resident population registry*) | N | The civil registry under Art. 62 of the Codice dell'Amministrazione Digitale and D.P.C.M. 194/2014, which took over from the municipal registries. Authoritative source of personal particulars, residence, civil status and death | [F04](04-identita-e-anagrafiche.md) |
| **AO / AOU - Azienda ospedaliera / Azienda ospedaliero-universitaria** (*hospital trust*) | N | Hospitals constituted as autonomous corporate bodies, dependent on the Region and not on the local health authority | [F01](01-sistema-sanitario-italiano.md) |
| **Append-only** (in Italian *archivio a sola aggiunta*) | S | An archive in which one can only add: no modification and no deletion, for any role, including whoever administers the system | [F16](16-architettura-del-progetto.md), [SEC](/06_security/04-tracciamento.md) |
| **`Appointment` / `AppointmentResponse`** | S | The FHIR resources that represent the appointment and the response of an individual participant. **Trap:** the appointment is not the slot, and it is not the encounter | [F06](06-fhir-da-zero.md) |
| **Arruolamento** (*enrolment*) | P | The formal insertion of the person into a structured telemedicine service, typical of remote monitoring. **Trap:** it is a professional act and it **precedes the diary**; treating it as a booking loses the moment at which clinical responsibility is assumed | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Asserzione** (*assertion*) | S | A document signed by the identity provider declaring who the user is, when and how they were authenticated and with which attributes. In SAML it is a signed XML document | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **ASL - Azienda sanitaria locale** (*local health authority*; an Italian institution, the English equivalent is approximate) | N | The public body that guarantees the essential levels of care to a territory. **Trap:** it is both commissioner and provider, which explains a good part of its procedures. The designation varies by Region: AUSL, ASP, AST, APSS, ATS, ASST | [F01](01-sistema-sanitario-italiano.md) |
| **Assistito** (*beneficiary*, *enrollee*) | N | The person holding the right to care. **Trap:** it is an **administrative** status and does not coincide with «patient», which is a clinical status; the same person is a beneficiary without being a patient for years | [F01](01-sistema-sanitario-italiano.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Attacco dell'intermediario** (*man in the middle*) | S | The substitution of the fingerprints by the signalling server, which inserts itself between the two ends of a media session. **Trap:** it is precisely what the independent verification of the keys serves to make detectable; without that verification, «encrypted end to end» is an undemonstrable assertion | [F08](08-webrtc-da-zero.md), [SEC](/06_security/05-sicurezza-del-tempo-reale.md) |
| **`Attachment`** | S | FHIR data type: binary content or a reference to it, with type, size, fingerprint and title | [F06](06-fhir-da-zero.md) |
| **Attesa di rilevazione** (*expected observation*) | P | An entity generated by the plan that declares the expected quantity, the window and the tolerance. **Trap:** the absence of the measurement is not a non-event: it is the transition of this entity to the «missed» state, and it is a clinical fact | [F16](16-architettura-del-progetto.md), [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **Attesa esponenziale** (*exponential backoff*) | S | The retry strategy in which the interval doubles at every attempt up to a cap. **Trap:** without a random component it produces synchronised waves that prevent the service from recovering | [F11](11-fondamenti-informatici.md) |
| **Attestazione di origine del contributo** (*developer certificate of origin*) | P | The declaration attached to every commit by which the contributor states that they have the right to confer it under the project's licence. **Trap:** it is not an assignment of copyright, and it must not be presented as such | [F17](17-ambiente-di-sviluppo.md) |
| **Attestazione di provenienza** (*provenance attestation*) | S | A verifiable declaration of which source, which process and which environment produced an artefact | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/07-catena-di-fornitura.md) |
| **Attività di base della vita quotidiana (ADL)** (*activities of daily living*) | S | The functions whose loss makes direct assistance necessary: hygiene, dressing, transferring, feeding, continence | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Attività strumentali della vita quotidiana (IADL)** (*instrumental activities of daily living*) | S | More complex functions, which are lost first: telephone, shopping, preparing meals, transport, **managing medicines**, managing money. **Trap:** managing medicines is among them, and its loss often precedes every measurable clinical signal | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **ATNA** (*Audit Trail and Node Authentication*) | S | The IHE profile for the tracing of events and for node authentication | [F05](05-standard-di-interoperabilita.md), [PRO](/04_protocols/05-ihe.md) |
| **Attore** (*actor*, IHE) | S | The functional role a system takes on within an integration profile. **Trap:** it is a role, not a product: the same system may implement several actors | [F05](05-standard-di-interoperabilita.md) |
| **Attributo** (*attribute*) | S | Information that describes an identity without singling it out. **Trap:** distinct from the identifier, which instead singles out; confusing them is the way an attribute becomes a key by mistake | [F04](04-identita-e-anagrafiche.md) |
| **`aud` - Audience** | S | The recipient for which a token is valid. **Trap:** a resource server must **refuse** tokens not intended for it; omitting that check is one of the most common and most exploitable defects | [F13](13-protocolli.md) |
| **`AuditEvent`** | S | The FHIR resource that records who did what, when and with what outcome | [F06](06-fhir-da-zero.md) |
| **Auscultazione** (*auscultation*) | S | Listening to the internal sounds of the body with the stethoscope. **Trap:** it is not transferable through the ordinary audio channel of a video call, which is designed and compressed for the voice | [F09](09-fondamenti-clinici.md) |
| **Autenticazione** (*authentication*) | S | Proof that whoever presents themselves controls the credential associated with an identity. **Trap:** it does **not** ascertain who is physically present. The ascertainment of the person is identification, and it is an act of the professional | [F04](04-identita-e-anagrafiche.md), [F12](12-crittografia-e-sicurezza.md) |
| **Autenticazione bilaterale TLS** (*mutual TLS*, mTLS) | S | The variant of TLS in which the client too presents a certificate: identity is proved by the channel. It is the mechanism by which login with the health card fitted with a microchip is implemented | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **Autorità di certificazione** (*certification authority*) | S | The entity that issues certificates attesting the link between a public key and an identity | [F12](12-crittografia-e-sicurezza.md) |
| **Autorizzazione** (*authorisation*) | S | The determination of what a subject **already authenticated** may do on a specific resource in a specific context | [F12](12-crittografia-e-sicurezza.md) |
| **Autorizzazione sanitaria** (*healthcare facility licence*) | N | The entitlement that enables an organisation to operate. **Trap:** it is the precondition of institutional accreditation and is not equivalent to it | [F01](01-sistema-sanitario-italiano.md) |

### B

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **BALP** (*Basic Audit Log Patterns*) | S | The IHE guide that defines reusable patterns for audit events | [F05](05-standard-di-interoperabilita.md) |
| **Ballot / public comment** | S | The phase in which a specification is submitted to the community for observations before publication. **Trap:** a specification in ballot is not published, and building on it means accepting that it will change | [F05](05-standard-di-interoperabilita.md) |
| **Base giuridica** (*legal basis*) | N | The ground of lawfulness of the processing of personal data. **Trap:** it is an attribute of the **processing** - the combination of purpose, category of datum and party - not of the person and not of the document. Looking for «the patient's legal basis» is the wrong question | [F03](03-il-dato-clinico.md), [DOM](/05_domain/06-consenso-e-riservatezza.md) |
| **Basic UDI-DI** | N | The primary identifier of a device model; the access key to the technical documentation, the declaration of conformity and the registrations. **Trap:** it does not appear on the label, and it is not to be confused with the UDI-DI | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/04-fascicolo-tecnico.md) |
| **Bearer token** (in Italian *credenziale al portatore*) | S | A credential that anybody who possesses it can use. **Trap:** the name says everything and is ignored: an intercepted bearer token is a stolen identity, and no subsequent check detects it | [F13](13-protocolli.md) |
| **Binding** | S | The declaration that an element of a profile takes its values from a given value set | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Binding, forza del** (*binding strength*) | S | The degree of obligation of the binding, in increasing order: `example`, `preferred`, `extensible`, `required`. **Trap:** a `required` binding towards a terminology the project cannot distribute is a cost, not a detail | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Bitemporalità** (*bitemporality*) | S | Modelling with two independent temporal axes: when the fact is true in the world and when the system came to know it. **Trap:** without the second axis it is impossible to answer the question «what did we know on that day», which is exactly the question that is asked after an adverse event | [F11](11-fondamenti-informatici.md), [ARC](/02_architecture/04-modello-dati.md) |
| **Blocco in testa alla coda** (*head-of-line blocking*) | S | Delay of all the subsequent data caused by waiting for a lost datum that precedes them. **Trap:** it is the reason why TCP's guarantees are harmful for real-time media | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **Bozza** (*draft*) | P | Unsigned working material. **Trap:** **it is not a clinical document**: it is not visible to the patient, it is not transmissible, it is not retained as such. The model that follows current language and creates a report «in draft status» sooner or later exposes it in an unfiltered list | [DOM](/05_domain/04-documenti-clinici.md) |
| **Branca specialistica** (*clinical specialty*) | N | The disciplinary area of the service. **Trap:** it is an attribute of the **service offered**, not of the professional in the absolute: the same professional may deliver in different specialties at different organisations | [F01](01-sistema-sanitario-italiano.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Bulk Data** | S | Asynchronous bulk extraction of FHIR data, with kick-off, periodic polling of the status, manifest and files in ndjson format | [F13](13-protocolli.md), [PRO](/04_protocols/02-fhir.md) |
| **BUNDLE** (SDP) | S | The mechanism that makes audio, video and the data channel share a single connection, a single handshake and a single relay allocation (RFC 8843) | [F08](08-webrtc-da-zero.md) |
| **`Bundle`** (FHIR) | S | A container of resources; the type declared determines its semantics. The **document bundle** has the `Composition` as its first entry and is immutable and signable | [F06](06-fhir-da-zero.md) |
| **Business Glossary** | N | The component of the national telemedicine infrastructure that comprises a terminology server, an authoring tool, a repository and guidance, and publishes the national telemedicine glossary | [F02](02-prestazioni-di-telemedicina.md) |

### C

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **CAD - Codice dell'amministrazione digitale** (*Digital Administration Code*) | N | D.lgs. 7 marzo 2005, n. 82 (Legislative Decree no. 82 of 7 March 2005). It contains, among other things, Art. 50-*ter* on the national data platform, Art. 62 and Art. 62-*ter* on the registries, Art. 64 on digital identity, Arts. 68–69 on reuse and Art. 71 on the technical rules | [F07](07-fse-e-infrastrutture-nazionali.md), [F20](20-fonti-primarie.md) |
| **CAdES / PAdES / XAdES** | N | Standardised electronic signature formats, respectively for generic files, for PDF documents and for XML documents | [F03](03-il-dato-clinico.md), [PRO](/04_protocols/03-documenti-clinici.md) |
| **Cache non persistita** (*non-persistent cache*) | P | Working memory that does not write to disk. **Trap:** it is a requirement, not an optimisation: for the code systems whose licence does not allow derivatives, a persistent cache of the responses would constitute a derived subset | [F17](17-ambiente-di-sviluppo.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Campo, componente, sottocomponente** (*field, component, subcomponent*) | S | The three levels of internal subdivision of an HL7 v2 segment | [F05](05-standard-di-interoperabilita.md) |
| **Candidato** (*candidate*, ICE) | S | An address-and-port pair at which one end of a media session can be reached | [F08](08-webrtc-da-zero.md) |
| **Candidato host** | S | A candidate corresponding to the address of a local interface of the device | [F08](08-webrtc-da-zero.md) |
| **Candidato server-reflexive** (`srflx`) | S | The public address of the device, discovered by querying a STUN server | [F08](08-webrtc-da-zero.md) |
| **Candidato peer-reflexive** (`prflx`) | S | An address discovered during the connectivity checks and not announced in advance | [F08](08-webrtc-da-zero.md) |
| **Candidato relayed** (`relay`) | S | An address lent by a TURN server. **Trap:** it has type preference **zero**, that is, it is the last choice; to verify that the relayed path really works it must be forced explicitly in the tests | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **`CapabilityStatement`** | S | The FHIR resource, processable by a machine, that describes what a server can do | [F06](06-fhir-da-zero.md) |
| **Cardinalità** (*cardinality*) | S | The minimum and maximum number of occurrences admitted for an element, in the form `min..max` | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Caregiver** (*caregiver*) | N | A person who assists the patient on a stable basis. **Trap:** **assisting is not representing**. The carer accompanies, helps, may be present in the session, but cannot give consent in place of a person with capacity, in any configuration | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Cartella clinica** (*inpatient medical record*) | N | Documentation formed during an admission episode at an organisation. **Trap:** it is not the outpatient electronic clinical record, it is not the organisational health record and it is not the national health record: four containers with four regimes of access | [F03](03-il-dato-clinico.md) |
| **Cartella clinica elettronica** (*local electronic health record*) | P | The clinical repository of the individual providing party. **Trap:** in the project's integration model it **stays with the integrator's system**; Telemedic is not the clinical master data holder | [F03](03-il-dato-clinico.md), [DOM](/05_domain/01-linguaggio-ubiquo.md) |
| **Case manager** (*case manager*) | P | The figure who coordinates the taking of the case on continuously and is the patient's point of contact; an essential micro-service of remote monitoring | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Catalogo delle prestazioni** (*service catalogue*) | P | The set of service types with code, admitted channels, authorised professions, mandatory artefacts and temporal validity | [DOM](/05_domain/02-le-prestazioni-modellate.md), [FUN](/03_functional/02-catalogo-dei-requisiti.md) |
| **Catena di fiducia** (*chain of trust*) | S | The sequence of certificates which, from the end certificate, goes back up to a root present in the trust store | [F12](12-crittografia-e-sicurezza.md) |
| **Catena di hash / catena di impronte** (*hash chain*) | S | A sequence in which every entry carries the fingerprint of its own content and that of the previous entry, so that every alteration or removal is detectable. **Trap:** it is what the versioning of entities does **not** provide; see the entry «Registro degli accessi» | [F12](12-crittografia-e-sicurezza.md), [F16](16-architettura-del-progetto.md) |
| **Catena di sostituzione** (*substitution chain*) | P | The link between rescheduled appointments that preserves the date of the original request for the purposes of waiting times. **Trap:** losing this link means resetting the wait at every move, and it produces a false indicator | [F14](14-flussi-funzionali.md) |
| **Categorie particolari di dati** (*special categories of personal data*) | N | The categories of Art. 9(1) of Regulation (EU) 2016/679, among them data concerning health. Processing is prohibited save for exhaustive derogations | [F03](03-il-dato-clinico.md) |
| **Categorie prioritarie** (*priority categories*, EHDS) | N | Sets of health data that must circulate in the European Health Data Space: patient summary, electronic prescription, laboratory and diagnostic imaging reports, discharge letters | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Cattura delle modifiche** (*change data capture*) | S | Extraction of a database's changes starting from its replication log | [F11](11-fondamenti-informatici.md) |
| **CdC - Casa della comunità** (*community health centre*; an Italian institution introduced by DM 77/2022) | N | An open-access physical structure in which a multi-professional territorial team works | [F01](01-sistema-sanitario-italiano.md) |
| **CDA - Clinical Document Architecture** | S | The HL7 standard for clinical documents, in XML, articulated into header and body | [F05](05-standard-di-interoperabilita.md), [PRO](/04_protocols/03-documenti-clinici.md) |
| **CDA2** | G | Release 2 of CDA, the national documentary standard of the health record, carried inside a digitally signed PDF. **Trap:** until the national templates for telemedicine are acquired, the project models a **canonical dataset** and treats the serialisation as replaceable, so as not to hard-wire a template that might change | [F07](07-fse-e-infrastrutture-nazionali.md), [PRO](/04_protocols/03-documenti-clinici.md) |
| **Centro erogatore** (*delivering centre*) | N | An organisation with strictly health tasks, which delivers the services and **manages the clinical alarms** (DM 21 settembre 2022, Annex A) | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Centro servizi** (*service centre*) | N | An organisation with strictly technical tasks: maintenance, management of accounts, user support, devices at home, **technical alarms** (DM 21 settembre 2022, Annex A). **Trap:** the distinction between the two centres is not organisational, it is normative, and it determines to whom each type of alarm is to be routed | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Certificato X.509** | S | An electronic document that binds a public key to an identity, signed by a certification authority (RFC 5280) | [F12](12-crittografia-e-sicurezza.md) |
| **CGNAT** (*Carrier-Grade NAT*) | S | A second level of address translation, applied inside the operator's network, with addresses in the space reserved by RFC 6598. **Trap:** it is common on the Italian mobile networks, and it is one of the reasons why the direct path fails with patients who use a smartphone | [F08](08-webrtc-da-zero.md) |
| **Chaining / reverse chaining** | S | Traversal of the references between FHIR resources, forwards or backwards, inside the search criteria | [F06](06-fhir-da-zero.md) |
| **Chiave di deduplicazione** (*deduplication key*) | S | The identifier with which a consumer recognises that it has already handled a message. **Trap:** it must be retained **for longer** than the maximum retry window, otherwise the duplicate arrives after the key has expired | [F16](16-architettura-del-progetto.md) |
| **Chiave di idempotenza** (*idempotency key*) | S | An identifier generated by the caller that identifies **the intention, not the attempt**, and allows the receiver to recognise retries | [F11](11-fondamenti-informatici.md), [PRO](/04_protocols/06-api-di-progetto.md) |
| **Chiave di partizionamento** (*partition key*) | S | The value that determines which partition of a log an event ends up in, and hence its relative ordering. **Trap:** ordering is guaranteed only within the partition; choosing the key badly means losing the ordering between events that must have one | [F11](11-fondamenti-informatici.md) |
| **CIE - Carta d'identità elettronica** (*Italian electronic identity card*) | N | A digital identity channel under Art. 64 of the Codice dell'Amministrazione Digitale; the identity provider is the Ministry of the Interior. Available both in SAML 2.0 and in OpenID Connect. **Trap:** the technical rules declare that the level reported in the returning assertion is always the maximum, so the level actually performed **is not derivable from the assertion** | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Cifrario a blocchi** (*block cipher*) | S | An algorithm that transforms fixed-size blocks under the control of a key | [F12](12-crittografia-e-sicurezza.md) |
| **Cifrario a flusso** (*stream cipher*) | S | An algorithm that generates a keystream combined bit by bit with the plaintext | [F12](12-crittografia-e-sicurezza.md) |
| **Cifratura a riposo** (*encryption at rest*) | S | Protection of stored data. **Trap:** it protects against theft of the medium, **not** against access obtained through the system; declaring it as a measure against improper access is a recurrent error | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/03-protezione-dei-dati.md) |
| **Cifratura da estremo a estremo** (*end-to-end encryption*) | S | Encryption in which no intermediate component, including the service's server, possesses the keys. **Trap:** the assertion is demonstrable only with the independent verification of the keys by the two interlocutors, and **it lapses when server-side recording is active** | [F08](08-webrtc-da-zero.md), [F12](12-crittografia-e-sicurezza.md) |
| **Cifratura ibrida** (*hybrid encryption*) | S | A combination of asymmetric encryption for the key and symmetric encryption for the content | [F12](12-crittografia-e-sicurezza.md) |
| **Cifratura in transito** (*encryption in transit*) | S | Protection of data crossing a network. **Trap:** it is interrupted at every termination point; a chain of encrypted legs is not end-to-end encryption | [F12](12-crittografia-e-sicurezza.md) |
| **Cinquina** (*five-tuple*) | S | Protocol, source address and port, destination address and port: the set that identifies a communication | [F08](08-webrtc-da-zero.md) |
| **CIPESS** | N | The inter-ministerial committee for economic planning and sustainable development; it resolves the allocation of the healthcare funding requirement among the Regions | [F01](01-sistema-sanitario-italiano.md) |
| **Claim** (*an assertion contained in a token*) | S | An assertion contained in a token. **Trap:** a claim is true only as far as whoever issued it is reliable: its presence is not a verification | [F13](13-protocolli.md) |
| **Classe di sicurezza software (A / B / C)** (*software safety classification*) | N | The IEC 62304 classification founded on the harm possible **after** the control measures external to the software system; it determines which life-cycle processes are mandatory. The intended purpose frozen by the project keeps the class at **B** | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/02-qualificazione-e-classificazione.md) |
| **Classi di rischio (I, IIa, IIb, III)** (*risk classes*) | N | The classification of medical devices under Annex VIII of Regulation (EU) 2017/745; it determines the applicable conformity assessment procedure. The project places itself in **Class IIa** | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/02-qualificazione-e-classificazione.md) |
| **CloudEvents** | S | The specification that defines a common envelope for events and its bindings onto the transport protocols | [F13](13-protocolli.md), [PRO](/04_protocols/07-eventi-e-webhook.md) |
| **Code system** (in Italian *sistema di codifica*) | S | The set of possible codes with their meaning, identified by a canonical URI | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **`CodeableConcept`** | S | FHIR data type: a concept expressed by zero or more codings, plus a text intended for the human being | [F06](06-fhir-da-zero.md) |
| **Codec** | S | An algorithm for compressing and decompressing the audio or video signal | [F08](08-webrtc-da-zero.md) |
| **Codice ANA** | N | The patient's identifier in the national registry of people entitled to care, with its own declared assigning authority | [F04](04-identita-e-anagrafiche.md) |
| **Codice Belfiore** (*municipality cadastral code*) | N | The four-character code of the municipality or country of birth, contained in positions 12–15 of the tax code | [F04](04-identita-e-anagrafiche.md) |
| **Codice di priorità** (*priority class*) | N | The urgency class that fixes the maximum time within which the service requested is to be delivered. **Trap:** it is not the person's clinical severity, and it is a property of the **request**, not of the patient | [F01](01-sistema-sanitario-italiano.md) |
| **Codice fiscale** (*Italian tax code*) | N | The **fiscal** identifier of the natural person, provided for by D.P.R. 605/1973 and by D.M. 23 dicembre 1976, adopted by healthcare as a correlation key. **Trap:** it is calculable from demographic data, mutable, non-universal and **not secret**: using it as a credential or as proof of identity is a security defect | [F04](04-identita-e-anagrafiche.md) |
| **`Coding`** | S | FHIR data type: a single coding, with system, version, code and official description | [F06](06-fhir-da-zero.md) |
| **Coda di riconciliazione** (*reconciliation queue*) | P | A visible list of the failed transmissions towards external systems, with cause, number of attempts and the possibility of a resend. **Trap:** without a queue visible to a human being, a failure to transmit to the health record becomes silent and is discovered months later | [F14](14-flussi-funzionali.md) |
| **Coda di scarto** (*dead letter queue*) | S | The destination of the messages that have exhausted their retries. **Trap:** a dead-letter queue that nobody looks at is equivalent to loss of the message | [F13](13-protocolli.md) |
| **Coerenza finale** (*eventual consistency*) | S | The property whereby, once writing has ceased, all the copies converge, with no declared limit on when. **Trap:** «eventual» does not mean «quick»; in a clinical flow it must be declared what the user sees in the meantime | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Collisione delle offerte** (*glare*) | S | The situation in which the two ends emit an offer simultaneously; it is resolved by assigning a polite role and an impolite one | [F08](08-webrtc-da-zero.md) |
| **Commit a due fasi** (*two-phase commit*, 2PC) | S | A distributed transaction protocol with a prepare phase and a commit phase. **Trap:** the project avoids it: it locks resources and turns a partial failure into a total block | [F11](11-fondamenti-informatici.md) |
| **Compensazione** (*compensating transaction*) | S | A transaction that counteracts the effects of an earlier step of a saga. **Trap:** in the clinical sphere it is not an undo: it is a **traced corrective reissue**, because the fact happened and cannot be erased from history | [F11](11-fondamenti-informatici.md) |
| **Compenso** (*compensation*, in the physiological sense) | S | The set of physiological responses that keep a regulated quantity within the useful range despite a perturbation. **Trap:** a «normal» parameter under compensation does not mean the absence of a problem: it means that the problem is still contained | [F09](09-fondamenti-clinici.md) |
| **Complessità assistenziale** (*care complexity*) | P | The set of non-clinical dimensions - social, housing, cognitive, of literacy - that determine the concrete achievability of a remote pathway | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Compliance digitale dell'assistito** (*patient digital readiness*) | P | The person's ability to interact with digital systems. **Trap:** it is a dimension of the executability assessment distinct from the technical check of the device: a perfectly functioning tablet in the hands of somebody who cannot use it does not make the service executable | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **`Composition`** | S | The FHIR resource that represents a clinical document structured in sections. In the project **it is the report**; `DiagnosticReport` is only a read-only projection for the integrators that expect it | [F06](06-fhir-da-zero.md), [PRO](/04_protocols/03-documenti-clinici.md) |
| **Composizione** (*MCU*, *multipoint control unit*) | S | A server that decodes the streams, composes them and re-encodes them. **Trap:** maximum latency and maximum computing cost, and like every intermediate server it terminates the encryption | [F08](08-webrtc-da-zero.md) |
| **Concetto codificato** (*coded concept*) | S | A value qualified by code system, version and code, with an original text where present | [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Concorrenza ottimistica** (*optimistic concurrency*) | S | The strategy in which the resource is not locked: whoever saves starting from a superseded version is made to fail | [F13](13-protocolli.md), [F06](06-fhir-da-zero.md) |
| **`Condition`** | S | The FHIR resource that represents a problem or a diagnosis, with clinical status and verification status. **Trap:** the two statuses are distinct, and a suspected diagnosis is not a confirmed diagnosis | [F06](06-fhir-da-zero.md) |
| **Condizione latente** (*latent condition*) | S | A hole introduced upstream by decisions of design or of organisation, harmless until it meets the circumstance that activates it. **Trap:** software produces latent conditions, not active errors: whoever writes the code does not commit the error, they build the environment in which it becomes possible | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Conferenza Stato-Regioni** | N | The body of coordination between State and Regions. It produces **Intese**, which are binding, and **Accordi**, which become binding once transposed regionally. **Trap:** an Accordo not transposed by a Region is not applicable in that Region | [F01](01-sistema-sanitario-italiano.md), [F20](20-fonti-primarie.md) |
| **Confine di fiducia** (*trust boundary*) | S | The line that separates zones with different security assumptions; every crossing requires validation inbound and authorisation outbound | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/01-modello-di-minaccia.md) |
| **Consegna differita** (*deferred delivery*) | P | The reasoned deferral of making a document available to the patient, with the expected date recorded. **Trap:** it is a legitimate clinical choice and must be distinguished from non-performance; the model that does not separate them allows neither the one nor the other to be measured | [DOM](/05_domain/04-documenti-clinici.md) |
| **Consenso all'atto sanitario** (*informed consent to treatment*) | N | The expression of will regarding the performance of the act, preceded by adequate information (L. 219/2017, Law no. 219 of 2017) | [F03](03-il-dato-clinico.md), [DOM](/05_domain/06-consenso-e-riservatezza.md) |
| **Consenso alla consultazione** (*consent to access*) | N | Authorisation for third parties to consult the health record (DM 7 settembre 2023, Art. 8) | [DOM](/05_domain/06-consenso-e-riservatezza.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Consenso alla registrazione** (*consent to record*) | P | Specific consent, for each individual session, to audio-video capture. **Trap:** **it is not inheritable** from a general consent, and the privacy notice accompanying it must declare that with recording active the session is no longer encrypted end to end | [DOM](/05_domain/06-consenso-e-riservatezza.md), [SEC](/06_security/05-sicurezza-del-tempo-reale.md) |
| **Consenso al trattamento dei dati** (*data processing consent*) | N | The expression of will regarding the processing of data, where consent is the applicable legal basis. **Trap:** for the purpose of care, consent is **not typically** the legal basis of the processing; assuming so produces a model that asks for consents that are not due and omits ones that are | [F03](03-il-dato-clinico.md), [DOM](/05_domain/06-consenso-e-riservatezza.md) |
| **`Consent`** | S | The FHIR resource that records a consent, with scope, period, permitted actions and exceptions | [F06](06-fhir-da-zero.md) |
| **Consegna almeno una volta** | S | See *Almeno una volta* | [F16](16-architettura-del-progetto.md) |
| **Conservazione a norma** (*compliant digital preservation*) | N | The process that guarantees over time the authenticity, integrity, legibility and retrievability of the electronic document. **Trap:** **it is not the backup**, and no backup policy satisfies it | [F03](03-il-dato-clinico.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Consistenza forte** (*strong consistency*) | S | The model in which every read subsequent to a committed write observes that write | [F11](11-fondamenti-informatici.md) |
| **Contatto** (*encounter*) | S | A single interaction between the patient and the delivery system, in a place that may also be virtual, with a beginning and an end. **Trap:** in the code it is called `Encounter`, **never** `Contact`, which in the standard designates the contact detail. And it is an aggregate distinct from the media session | [F14](14-flussi-funzionali.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **`contained`** | S | A FHIR resource that lives inside another, with no autonomous existence; it is referenced with the `#` character | [F06](06-fhir-da-zero.md) |
| **Contenitore** (*container*, media format) | S | A file format that interleaves the audio and video streams. **Trap:** support **diverges between browsers** and no format is universal: it must be negotiated at runtime and recorded in the metadata, never assumed | [F08](08-webrtc-da-zero.md) |
| **Contenitori effimeri** | P | See *Ambiente effimero* | [F17](17-ambiente-di-sviluppo.md) |
| **Contesto delimitato** (*bounded context*) | S | The explicit boundary within which a model and its language are coherent and valid, and within which a term has a single meaning. **Trap:** the model is **private** to the context; translation happens at the boundary and not inside it | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](/02_architecture/02-contesti-delimitati.md) |
| **Contesto di lancio** (*launch context*) | S | Patient, encounter and other resources delivered to a clinical application at start-up, without asking the user for them | [F13](13-protocolli.md), [INT](/07_integration/03-integrazione-per-api.md) |
| **Contesto sicuro** (*secure context*) | S | The condition required by the browser without which the acquisition of camera, microphone and screen does not work. In local development it is satisfied by the loopback origin | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **Contitolarità** (*joint controllership*) | N | The joint determination of purposes and means by several controllers, with a transparent arrangement under Art. 26 of Regulation (EU) 2016/679 | [F03](03-il-dato-clinico.md) |
| **Contratto di interfaccia** (*interface contract*) | S | The description of the promise between two parties, verifiable by a machine | [F13](13-protocolli.md), [PRO](/04_protocols/06-api-di-progetto.md) |
| **Contropressione** (*backpressure*) | S | The mechanism by which a slow component tells whoever is feeding it to slow down | [F11](11-fondamenti-informatici.md) |
| **Controllo della congestione** (*congestion control*) | S | Adaptation of the bitrate to network conditions. **Trap:** it is not project code: it is in the browser, and it is to be measured, not rewritten | [F08](08-webrtc-da-zero.md) |
| **Controllo di connettività** (*connectivity check*) | S | An authenticated STUN request sent on a candidate pair to verify that it works | [F08](08-webrtc-da-zero.md) |
| **Controllo di consenso** (*consent freshness*) | S | Periodic verification that the other end of a media session is still present and still consenting to receive traffic | [F08](08-webrtc-da-zero.md) |
| **Controllo obbligatorio di pipeline** (*required check*) | P | A verification that **blocks** integration instead of issuing a warning. **Trap:** it is a condition of admissibility, not a judgement of quality, and it is not to be circumvented: if it legitimately blocks legitimate work, the check is corrected through the review provided for | [F17](17-ambiente-di-sviluppo.md), [TEC](/01_technical/09-integrazione-continua-e-rilascio.md) |
| **Copertura oraria dichiarata** (*declared service coverage*) | P | Days, time bands, type of response guaranteed, expected time to acknowledgement and behaviour outside coverage. **Trap:** it is a **safety requirement**, not a commercial parameter: an alarm generated outside coverage without a declared rule is an alarm that nobody receives | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Copertura per mutazione** (*mutation coverage*) | S | A measure that introduces automatic changes to the code and verifies that the tests detect them. **Trap:** it is what distinguishes a suite that **verifies** from one that merely **executes**; line coverage does not make this distinction | [F17](17-ambiente-di-sviluppo.md), [TEC](/01_technical/08-qualita-e-test.md) |
| **Coreografia** (*choreography*) | S | Coordination in which every component reacts to the events of the others and nobody knows the process as a whole. **Trap:** it makes the process unqueryable: no component can answer the question «where has it got to» | [F16](16-architettura-del-progetto.md) |
| **Correlazione** (*correlation*) | S | The propagation of a common identifier through all the components involved in a request | [F11](11-fondamenti-informatici.md), [TEC](/01_technical/06-osservabilita.md) |
| **Correzione d'errore in avanti** (*forward error correction*, FEC) | S | Redundancy sent pre-emptively: it always costs bandwidth, but it does not cost a network round trip (RFC 8854) | [F08](08-webrtc-da-zero.md) |
| **Correzione d'errore incorporata** (`useinbandfec`) | S | The mechanism of the Opus audio codec that includes in the packet a low-fidelity copy of the previous packet | [F08](08-webrtc-da-zero.md) |
| **Corrispondenza deterministica / probabilistica** (*deterministic / probabilistic matching*) | S | The two families of demographic reconciliation technique: an exact rule on an identifier, or a similarity score over several attributes with thresholds. **Trap:** the second never produces a certainty, and the merging of demographic records cannot be automatic | [F04](04-identita-e-anagrafiche.md) |
| **Costruzione riproducibile** (*reproducible build*) | S | The property whereby two builds of the same revision, on different machines and at different times, produce artefacts identical byte for byte | [F17](17-ambiente-di-sviluppo.md), [SEC](/06_security/07-catena-di-fornitura.md) |
| **COT - Centrale operativa territoriale** (*territorial operations centre*; an Italian institution of DM 77/2022) | N | The service that coordinates the taking on of care across the various care settings; the natural node of territorial telemedicine | [F01](01-sistema-sanitario-italiano.md) |
| **CRA - Cyber Resilience Act** | N | Regulation (EU) 2024/2847 on the horizontal cybersecurity requirements of products with digital elements. **Trap:** the exclusion of medical devices operates **per product, not per project**: the artefacts not covered by a marking fall within the regulation all the same | [F12](12-crittografia-e-sicurezza.md), [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/01-inquadramento-normativo.md) |
| **Credenziale temporanea** (*ephemeral credential*) | S | A relay server credential with a short expiry, derived via HMAC from a shared secret. **Trap:** it replaces static credentials, which in a web client are by construction public | [F08](08-webrtc-da-zero.md) |
| **Criterio dell'ottanta per cento** (*80% rule*) | S | The principle of FHIR whereby resources contain the elements needed by most implementations; the rest is added with extensions | [F06](06-fhir-da-zero.md) |
| **Cronico** (*chronic*) | S | Said of a condition that does not resolve and that accompanies the person: it is controlled, not cured. **Trap:** it requires containers for the taking on of care and not episodes; the model built on the acute does not represent it | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **CT - Consistent Time** | S | The IHE profile for time synchronisation; it is a prerequisite of the audit trail profile | [F05](05-standard-di-interoperabilita.md) |
| **Cultura giusta** (*just culture*) | S | The model that distinguishes human error, at-risk behaviour and deliberate violation, separating learning from sanction | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **CUP - Centro unico di prenotazione** (*central booking service*) | N | The service that centralises bookings for several providing parties. **Trap:** it is a **channel**, not a diary; assuming that it is the owner of the availability leads to a wrong model | [F01](01-sistema-sanitario-italiano.md) |
| **Curva di dissociazione dell'emoglobina** (*oxyhaemoglobin dissociation curve*) | S | The S-shaped relationship between oxygen dissolved in the blood and saturation of haemoglobin. **Trap:** it makes saturation little sensitive in the upper zone, that is, precisely where one would want to catch early worsening | [F09](09-fondamenti-clinici.md) |
| **Custode di software open source** (*open-source software steward*) | N | A legal person that systematically supports an open source project, with reduced obligations under Art. 24 of Regulation (EU) 2024/2847 (definition in Art. 3, point 14) | [F12](12-crittografia-e-sicurezza.md), [CMP](/08_compliance/01-inquadramento-normativo.md) |

### D

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Danno** (*harm*) | N | Physical injury or damage to the health of people, in the definition of ISO 14971. **Trap:** in current language «danno» also covers economic or reputational damage; in the risk management of the device it does not | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/05-gestione-del-rischio.md) |
| **Dataset canonico** (*canonical dataset*) | P | The versioned definition of the informational content of a document, independent of the form in which it travels. **Trap:** it exists for a precise reason - without a term of its own one ends up saying «the CDA», and in three months the model depends on a template that might change | [F07](07-fse-e-infrastrutture-nazionali.md), [F16](16-architettura-del-progetto.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Dati a maggiore tutela dell'anonimato** (*highly protected health data*; a category of Italian law, with no exact equivalent) | N | A closed category defined by Art. 6 of DM 7 settembre 2023, visible to third parties only upon explicit consent given to the providing party. **Trap:** it is a **closed** category: it is not extended by analogy and it is not narrowed for implementation convenience | [F03](03-il-dato-clinico.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Dati avversi** (*adversarial test data*) | P | A set of deliberately difficult synthetic data - names with diacritics, series with gaps, measurements out of order - used in the tests as ordinary equipment and not as a curiosity | [F17](17-ambiente-di-sviluppo.md) |
| **Dato relativo alla salute** (*data concerning health*) | N | Personal data revealing information about past, present or future health status, **independently of its source**. **Trap:** the last words are the ones that count: an exemption by condition reveals the condition even if the field is called «administrative code» | [F03](03-il-dato-clinico.md) |
| **Dato sintetico** (*synthetic data*) | P | A datum generated by the project, not derived from real people. **Trap:** it is the **only** one admitted in every artefact and in every non-live environment, without exceptions; the investment goes into the generator, not into the derogations | [F17](17-ambiente-di-sviluppo.md), [F00](00-come-usare-questa-guida.md) |
| **Deduplicazione** (*deduplication*) | S | The discarding, on the receiving side, of what has already been processed, recognised from an identifier | [F13](13-protocolli.md) |
| **Deficit di polso** (*pulse deficit*) | S | The difference between heart rate and pulse rate, when some contractions do not generate a perceptible pulse wave. **Trap:** a device that measures the pulse may therefore report a rate lower than the heart's real one | [F09](09-fondamenti-clinici.md) |
| **Delega esplicita** (*explicit delegation*) | S | The representation in which the authorisation context carries together the subject on whose behalf one acts **and** the actor who acts, with the `act` claim of RFC 8693. **Trap:** it is the opposite of impersonation, in which the actor disappears and the audit trail becomes unusable | [F13](13-protocolli.md), [F16](16-architettura-del-progetto.md), [INT](/07_integration/06-identita-e-delega.md) |
| **Delegato** (*delegate*) | P | A party authorised by a patient with capacity to access the documents or to act on their behalf, with a scope and a mandatory expiry. **Trap:** it is not the legal representative and it is not the carer: they are three different titles with three different sources | [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **DEMA** | N | The flow of the dematerialised prescription towards the Sistema Tessera Sanitaria | [F01](01-sistema-sanitario-italiano.md) |
| **Desensibilizzazione all'allarme** | S | See *Affaticamento da allarme* | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Destinazione d'uso** (*intended purpose*) | N | The use for which the manufacturer intends the device according to the label, the instructions for use, promotional material and the clinical evaluation (Reg. (EU) 2017/745, Art. 2, point 12). **Trap:** it is the most costly document to get wrong, because a single sentence shifts the classification. The formulation frozen by the project is «**deferred collection of parameters for the professional's periodic review**» | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/02-qualificazione-e-classificazione.md) |
| **Determinismo del generatore** (*generator determinism*) | P | The property whereby, given the same seed, the synthetic dataset produced is identical. **Trap:** it is what makes an issue report reproducible; without it, the case does not reproduce and the correction is not verified | [F17](17-ambiente-di-sviluppo.md) |
| **Deviazione dal percorso** (*pathway deviation*) | P | A reasoned departure of the instance from the definition of the pathway. **Trap:** it is a **recorded fact**, not a validation error: a system that prevents deviation prevents medicine | [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **`Device`** | S | The FHIR resource that represents the device that originates a measurement | [F06](06-fhir-da-zero.md) |
| **Diagnosi** (*diagnosis*) | S | The reasoned conclusion as to which condition explains the clinical picture. **Trap:** it has an author, a date and a degree of certainty; representing it as a string without these three attributes makes it unusable and potentially dangerous | [F09](09-fondamenti-clinici.md) |
| **Diagnosi differenziale** (*differential diagnosis*) | S | The systematic comparison of the hypotheses, ordered not only by probability but also by the **seriousness of the consequences if they are missed** | [F09](09-fondamenti-clinici.md) |
| **`DiagnosticReport`** | S | The FHIR resource for the report of a diagnostic service. **Trap:** in the project it is a **read-only projection** for the integrators that expect it, never the primary artefact, which is the `Composition` inside a document bundle | [F06](06-fhir-da-zero.md), [PRO](/04_protocols/02-fhir.md) |
| **Diario clinico** (*progress notes*) | P | Chronological notes on the course of care. **Trap:** it is not the report, it is not intended for the patient and it is not transmitted to external systems automatically | [F03](03-il-dato-clinico.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Dichiarazione di conformità UE** (*EU declaration of conformity*) | N | The act by which the manufacturer assumes responsibility for the conformity of the device (Reg. (EU) 2017/745, Art. 19 and Annex IV). **Trap:** today the product is not covered by any declaration of conformity | [F15](15-regolatorio-da-zero.md) |
| **DICOM** | S | The standard for biomedical images: file format and network services | [F05](05-standard-di-interoperabilita.md) |
| **DICOMweb** | S | The set of RESTful services defined by DICOM for search, retrieval and storage | [F05](05-standard-di-interoperabilita.md), [F13](13-protocolli.md) |
| **`differential` / `snapshot`** | S | In a FHIR profile: the differences alone relative to the base structure, or the complete resulting structure | [F06](06-fhir-da-zero.md) |
| **Digest** (in Italian *impronta*, *riassunto*) | S | The fixed-length output of a hash function | [F12](12-crittografia-e-sicurezza.md) |
| **Disciplina di coda** (*queueing discipline*, network emulation) | S | The kernel mechanism that introduces delay, variability, loss and a bandwidth limit; the tool with which degraded networks are simulated in the tests | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **Discriminatore** (*discriminator*) | S | The rule by which it is established which slice of a repeated element an individual occurrence belongs to | [F06](06-fhir-da-zero.md) |
| **Display ufficiale** (*official display*) | S | The descriptive string of the concept supplied by the owner of the terminology. **Trap:** **it is not** the interface label, and it is architecturally separated from it, because for some terminologies the translations are derivatives belonging to the owner | [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Disponibilità** (*availability*) | S | The accessibility of information and of the service when they are needed. **Trap:** its breach is a notifiable incident, not a simple disruption of service | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/10-risposta-agli-incidenti.md) |
| **Dispositivo attivo** (*active device*) | N | A device whose operation depends on a source of energy other than that generated by the human body. Software is **by definition** an active device (Reg. (EU) 2017/745, Art. 2, point 4) | [F15](15-regolatorio-da-zero.md) |
| **Dispositivo medico** (*medical device*) | N | An object - software included - intended by the manufacturer for one of the exhaustive medical purposes of Art. 2, point 1, of Reg. (EU) 2017/745. **Trap:** qualification depends on the **declared purpose**, not on the technology employed | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/02-qualificazione-e-classificazione.md) |
| **Distinta dei materiali software** (*software bill of materials*, SBOM) | N | A machine-readable list of all the components of an artefact, with version, licence and fingerprint, generated at every build. **Trap:** taking stock of the components after the fact costs many times as much: it is one of the retroactively unrecoverable activities | [F12](12-crittografia-e-sicurezza.md), [F17](17-ambiente-di-sviluppo.md), [SEC](/06_security/07-catena-di-fornitura.md) |
| **Distretto** (*health district*) | N | The territorial subdivision of the local health authority that organises primary care and basic specialist care | [F01](01-sistema-sanitario-italiano.md) |
| **Divulgazione coordinata** (*coordinated vulnerability disclosure*) | S | The procedure by which a vulnerability is communicated to whoever can correct it, with an agreed window before publication | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/10-risposta-agli-incidenti.md) |
| **Documento clinico** (*clinical document*) | P | An artefact with an identified author, validated, immutable, with a recipient and a retention regime of its own. **Trap:** immutability is the characteristic that distinguishes it from everything else; what is modifiable is not a clinical document | [DOM](/05_domain/04-documenti-clinici.md) |
| **`DocumentReference`** | S | The FHIR resource that carries the metadata of a document, distinct from the content; it is the bridge towards document indexing | [F06](06-fhir-da-zero.md) |
| **Dominio di attribuzione** (*assigning authority*) | S | The party that assigns identifiers and guarantees their uniqueness within its own namespace; in the standard it is named by the URI of the `system` field. **Trap:** an identifier without its domain is a string, not an identifier | [F04](04-identita-e-anagrafiche.md) |
| **Doppia scrittura** (*dual write*) | S | The defect whereby one writes to two systems without atomicity, producing lost events or phantom events. It is avoided with the transactional outbox | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Doppio di prova** (*test double*) | S | A substitute for an external system used in the tests. **Trap:** in the project it is built **on the published specification**, not on empirical observation of the real system, otherwise that system's defect is encoded for ever | [F17](17-ambiente-di-sviluppo.md) |
| **Dossier sanitario** (*organisational health record*) | P | The set of the patient's data at a single organisation, for internal continuity of care. **Trap:** distinct from the national health record, which is national and under the patient's control | [F03](03-il-dato-clinico.md), [DOM](/05_domain/01-linguaggio-ubiquo.md) |
| **DPIA - Valutazione d'impatto sulla protezione dei dati** (*data protection impact assessment*) | N | An assessment mandatory **before** the processing when the risk is high (Art. 35 of Regulation (EU) 2016/679) | [F03](03-il-dato-clinico.md), [SEC](/06_security/03-protezione-dei-dati.md) |
| **DTLS** (*Datagram Transport Layer Security*) | S | TLS adapted to a transport that loses and reorders packets (RFC 6347, RFC 9147) | [F08](08-webrtc-da-zero.md) |
| **DTLS-SRTP** | S | The mechanism that extracts the SRTP keys from the secret established with the DTLS handshake between the two ends (RFC 5764) | [F08](08-webrtc-da-zero.md), [SEC](/06_security/05-sicurezza-del-tempo-reale.md) |

### E

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **EDS - Ecosistema dati sanitari** (*health data ecosystem*) | N | The central repository established by DM 31 dicembre 2024; controllership of the Ministry of Health, management by AGENAS. It operates on pseudonyms and feeds the purposes of governance, research and health technology assessment | [F02](02-prestazioni-di-telemedicina.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **EHDS - Spazio europeo dei dati sanitari** (*European Health Data Space*) | N | Regulation (EU) 2025/327 on primary and secondary use of health data; Chapter III governs electronic health record systems. **Trap:** the project might fall within it even though it is not a medical device: it is a declared assessment, not a certainty, and it must be verified against the text | [F07](07-fse-e-infrastrutture-nazionali.md), [F15](15-regolatorio-da-zero.md) |
| **eIDAS** | N | Regulation (EU) 910/2014 on electronic identification and trust services, as amended by Regulation (EU) 2024/1183 | [F03](03-il-dato-clinico.md), [F12](12-crittografia-e-sicurezza.md) |
| **Eleggibilità** (*eligibility*) | P | The verification that the person may receive that service **on that channel**. **Trap:** it is a different thing from the right to exemption and from the right to the service itself | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Elemento a scelta di tipo** (`[x]`) | S | A FHIR element that admits several alternative types; in instances the name concatenates the type chosen | [F06](06-fhir-da-zero.md) |
| **Elenco di fiducia** (*trusted list*) | S | The list of qualified trust services from which the trust store for verifying certificates is fed, filtering only those authorities authorised for identity verification | [F04](04-identita-e-anagrafiche.md) |
| **Emulatore di rete** (*network emulator*) | S | A tool that introduces delay, variability, loss and reordering of packets in tests. **Trap:** the test with two tabs of the same browser on the same computer demonstrates almost nothing | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **`Encounter`** | S | See *Contatto*. It is the name of the resource in the standard and in the project's code | [F06](06-fhir-da-zero.md), [F14](14-flussi-funzionali.md) |
| **ENI - Europeo Non Iscritto** (*EU citizen not registered with the national health service*; a code of Italian law) | N | A code of entitlement to care for Union citizens present in Italy who lack the requirements for registration with the health service; sixteen characters, assigned locally | [F04](04-identita-e-anagrafiche.md) |
| **Ente erogatore / ente fruitore** (*provider / consumer entity*, in the national data platform) | N | Whoever publishes an application service and whoever requests to consume it. **Trap:** they are **legal persons**, not software: the authorisation concerns the entity, not the application instance | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Entità** (*entity*) | S | An object with an identity that persists across the changes of its attributes | [F11](11-fondamenti-informatici.md) |
| **Episodio di cura** (*episode of care*) | S | The temporal container of the taking on of care for a health problem; the root of the aggregate of the taking on of care | [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Erogazione** (*delivery of care*) | P | The material act of supplying the service. **Trap:** it implies neither the reporting nor the accounting: they are four successive states, and none automatically implies the next | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Errore d'uso** (*use error*) | N | An act or omission of the user that produces a result different from the one intended (IEC 62366-1). **Trap:** **it does not imply fault on the part of the user**: it is a defect in the design of the interface, and that is how it is to be treated in risk management | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/06-usabilita-e-accessibilita.md) |
| **Esame obiettivo** (*physical examination*) | S | The direct detection of signs by the professional, articulated into inspection, palpation, percussion and auscultation. **Trap:** of these four manoeuvres only inspection is partly transferable at a distance, and even then degraded: it is the structural reason why the televisita is limited to follow-up | [F09](09-fondamenti-clinici.md) |
| **Esattamente una volta** (*exactly-once*) | S | The delivery guarantee that **is not obtainable end to end**; it is approximated with «at least once» plus idempotency of the receiver | [F11](11-fondamenti-informatici.md), [F13](13-protocolli.md) |
| **Escalation** (*escalation*) | P | The rule that establishes what happens when an alarm is not acknowledged within the deadline. **Trap:** it must be **finite and terminate in a declared failure**; a chain that does not terminate is a chain in which the alarm is lost without anybody knowing | [F10](10-percorsi-di-cura-e-sicurezza.md), [F14](14-flussi-funzionali.md) |
| **Esenzione** (*co-payment exemption*) | N | The right not to pay all or part of the share of the cost. **Trap:** an exemption **by condition reveals the condition** and is therefore data concerning health, however administrative the field may appear | [F01](01-sistema-sanitario-italiano.md), [F03](03-il-dato-clinico.md) |
| **Esito del contatto** (*encounter outcome*) | P | The structured code that declares how the act ended. **Trap:** it is distinct from the **status** of the encounter, which instead says where it is in its life cycle | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Esito tipizzato** (*typed outcome*) | P | A value taken from a domain enumeration with which an encounter or an alarm is closed, **never free text**. **Trap:** free text makes every subsequent measurement impossible, and that measurement is a safety requirement | [F14](14-flussi-funzionali.md) |
| **Espandi e contrai** (*expand and contract*) | S | The rule for schema evolution in three releases - add, migrate the read, remove - which allows two versions of the application to coexist | [F17](17-ambiente-di-sviluppo.md), [TEC](/01_technical/03-persistenza.md) |
| **Espansione** (*expansion*) | S | The operation that turns a value set's selection into the actual list of codes | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Estensione** (*extension*) | S | The mechanism provided by the base specification for adding information not provided for without breaking conformance, identified by a canonical URL | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Estensione cross-version** | S | An official extension that exposes, in one version of the standard, an element defined in a later version | [F06](06-fhir-da-zero.md) |
| **ETag / `If-Match` / 412** | S | The optimistic concurrency control mechanism and the precondition-failed response code | [F06](06-fhir-da-zero.md), [F13](13-protocolli.md) |
| **Etichetta di interfaccia** (*UI label*) | P | A string of the project, per language, linked to the code. **Trap:** it is architecturally separated from the official display of the terminology, and the separation is not stylistic: it is a consequence of the licensing regime of some terminologies | [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **EUDAMED** | N | The European database on medical devices: registration of actors, of devices and of certificates, vigilance and surveillance | [F15](15-regolatorio-da-zero.md) |
| **Evento avverso** (*adverse event*) | S | Harm suffered by the patient caused by the **healthcare management** and not by their clinical condition | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Evento di dominio** (*domain event*) | S | A fact relevant to the domain, already happened, immutable, named in the past tense in the ubiquitous language, which other contexts can observe. **Trap:** an event is not refusable: if the fact has happened, the event exists, and the reaction to the fact is a problem for whoever receives it | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](/02_architecture/06-eventi-e-integrazione-interna.md) |
| **Evento fantasma** (*phantom event*) | S | A message delivered that refers to a fact whose transaction then failed | [F16](16-architettura-del-progetto.md) |
| **Evento perso** (*lost event*) | S | A fact that occurred for which the corresponding message was never published, **with nothing signalling it**. It is the more insidious of the two defects of the dual write, because it is silent | [F16](16-architettura-del-progetto.md) |
| **Evento sentinella** (*sentinel event*) | S | An adverse event of particular seriousness, indicative of a malfunction of the system, requiring immediate investigation | [F10](10-percorsi-di-cura-e-sicurezza.md) |

### F

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Fabbrica di dati di prova** (*test data factory*) | P | A versioned component that builds test objects with sensible default values and explicit substitution of the single element the test verifies | [F17](17-ambiente-di-sviluppo.md) |
| **Fabbricante** (*manufacturer*) | N | Whoever manufactures or has manufactured a device **and** markets it under their own name or trade mark (Reg. (EU) 2017/745, Art. 2, point 30). **In the project:** the role will be assumed by the project itself, with the legal entity **still to be constituted**; its constitution is an internal prerequisite with a timescale of its own. **Trap:** this does not change the state of fact - **today the product does not bear CE marking**, and whoever installs it or puts it into service assumes the obligations that follow | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/00-indice.md) |
| **Fallacie del calcolo distribuito** (*fallacies of distributed computing*) | S | The eight implicit and false assumptions about network, latency, bandwidth, security, topology, administration, cost of transport and homogeneity | [F11](11-fondamenti-informatici.md) |
| **Fallimento dichiarato** (*declared failure*) | P | The outcome the system produces when the escalation chain is exhausted without anybody having taken the alarm on. **Trap:** it is preferable to silence in every circumstance: an alarm that switches itself off is indistinguishable from an alarm resolved | [F14](14-flussi-funzionali.md) |
| **Falsa rassicurazione** (*false reassurance*) | P | The reduction of the person's vigilance induced by the existence of a service that they perceive as continuous surveillance. **Trap:** it is a risk produced by the service itself, and it must be managed as such in the documentation intended for the user | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Falsificazione di richieste a livello di trasporto** | S | Improper use of a relay server to reach internal destinations. **Trap:** the primary defence is **egress network isolation**, not the lists of forbidden addresses, which have been repeatedly bypassed | [F08](08-webrtc-da-zero.md), [SEC](/06_security/05-sicurezza-del-tempo-reale.md) |
| **Fascia della pipeline** (*pipeline tier*) | P | The grouping of the verifications by execution time: quick at every push, complete at every change proposal, extended on a schedule, release-level on a procedure | [F17](17-ambiente-di-sviluppo.md) |
| **Fascicolo sanitario elettronico (FSE)** (*national electronic health record*; an institution of Italian law, the English equivalent is approximate) | N | The set of health and health-and-social data and documents generated by clinical events concerning the patient, under their control, fed by the organisations (Art. 12 of D.L. 179/2012 and implementing acts). **Trap:** it is not an archive at the project's disposal: it is a public system that is fed and consulted on conditions defined by others | [F07](07-fse-e-infrastrutture-nazionali.md), [F03](03-il-dato-clinico.md) |
| **FSE 2.0** | N | The current designation of the reform introduced by Art. 21 of D.L. 4/2022: feeding by law, distinct purposes, national components, health data ecosystem, AGENAS technological solutions | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Fascicolo tecnico** (*technical documentation*) | N | The complete documentation of the device according to Annexes II and III of Reg. (EU) 2017/745 | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/04-fascicolo-tecnico.md) |
| **Fattore di autenticazione** (*authentication factor*) | S | A category of proof: something you know, something you have, something you are. **Trap:** two elements of the **same** category are not two factors, however much they may be two steps | [F12](12-crittografia-e-sicurezza.md) |
| **FEA / FEQ / FES** (*advanced / qualified / simple electronic signature*) | N | Advanced, qualified and simple electronic signature: three levels with different legal effects. **Trap:** only the qualified signature is equivalent to a handwritten signature | [F03](03-il-dato-clinico.md) |
| **File di blocco delle dipendenze** (*lock file*) | S | The versioned file that pins the exact versions, direct and transitive, of the dependencies. **Trap:** without it, the build is not reproducible, and what has been verified is not what is distributed | [F17](17-ambiente-di-sviluppo.md) |
| **Finalità dichiarata** (*declared purpose of use*) | P | The purpose for which an access to a clinical datum is requested; it enters into the authorisation decision and into the audit trail | [DOM](/05_domain/06-consenso-e-riservatezza.md), [SEC](/06_security/02-identita-e-accessi.md) |
| **Finalità** (*purpose*, in the national data platform) | N | The declared reason for accessing an application service; it is the element on which the providing entity approves and on which the chain remains verifiable after the fact | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Finestra di attesa** (*expectation window*) | P | The interval, derived from the plan, within which a measurement is expected. **Trap:** its elapsing **without** a measurement is a clinical event, not the absence of an event | [F10](10-percorsi-di-cura-e-sicurezza.md), [F14](14-flussi-funzionali.md) |
| **Finestra di refertazione** (*reporting window*) | P | The interval between the conclusion of the encounter and the deadline by which the document must be signed | [DOM](/05_domain/04-documenti-clinici.md) |
| **Firma del documento** (*document signature*) | N | A subscription with evidential value, of a level determined per documentary type. **Trap:** it is a different thing from the cryptographic signature of an envelope or of a message, which has no value as a subscription | [F03](03-il-dato-clinico.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Flusso ex art. 50** | N | Transmission to the Sistema Tessera Sanitaria of prescribing and delivery data, under Art. 50 of D.L. 269/2003, converted by L. 326/2003 | [F01](01-sistema-sanitario-italiano.md) |
| **Follow-up** (*follow-up*) | S | Checking over time the evolution of the condition and the effect of the treatment | [F09](09-fondamenti-clinici.md) |
| **Fondazione** (*foundation*, ICE) | S | A label shared by homogeneous candidates, which governs the order of the connectivity checks | [F08](08-webrtc-da-zero.md) |
| **Formato** (*serialisation format*) | S | A way of representing structured data as a sequence of bytes. **Trap:** it says nothing about **when** and **how** communication happens: that is the protocol | [F13](13-protocolli.md) |
| **Fotogramma completo** (*keyframe*) | S | A self-sufficient frame, far heavier than a differential one. **Trap:** a burst of requests for a keyframe can trigger a congestion spiral, that is, worsen exactly what it meant to correct | [F08](08-webrtc-da-zero.md) |
| **Fragilità** (*frailty*) | S | Reduced functional reserve: a disproportionate and often irreversible response to a modest stressor. **Trap:** it is not a synonym for advanced age nor for multimorbidity | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Fusione anagrafica** (*record merge*) | P | The controlled union of two duplicate demographic records in the same tenant. **Trap:** **never automatic**; probabilistic matching produces scores, not certainties, and an erroneous merge is almost impossible to undo | [F04](04-identita-e-anagrafiche.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |

### G

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **G.711** | S | The mandatory telephone audio codec; it is needed for interoperability with the non-browser world | [F08](08-webrtc-da-zero.md) |
| **Gate di appropriatezza** (*appropriateness gate*) | P | The recording, prior to the act, of the declaration that the conditions for delivering the service remotely obtain. **Trap:** it is a recorded precondition, not a warning to the operator: if it is not recorded, it is not demonstrable | [F02](02-prestazioni-di-telemedicina.md), [F14](14-flussi-funzionali.md) |
| **Gateway terminologico** (*terminology gateway*) | P | The single point of resolution, validation and expansion of codes, with a policy declared for each code system. **Trap:** it is a single point precisely because the licensing policy is applied in a single place and not scattered through the code | [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Glicemia a digiuno / post-prandiale** (*fasting / postprandial blood glucose*) | S | Distinct variants of the blood glucose parameter, with codes and reference ranges of their own. **Trap:** **they are not the same quantity measured at different moments**: they are two quantities, and treating them as one produces time series without meaning | [F09](09-fondamenti-clinici.md) |
| **Grandezza** (*observable quantity*) | S | What the measurement measures, identified by a code. **Trap:** it is the quantity that distinguishes parameters sharing a unit of measure; the unit alone identifies nothing | [DOM](/05_domain/05-parametri-e-osservazioni.md), [F09](09-fondamenti-clinici.md) |
| **Gruppo di consumatori** (*consumer group*) | S | The set of processes that share out the partitions of a stream, so that every event is processed by a single member | [F11](11-fondamenti-informatici.md) |
| **GSPR** (*general safety and performance requirements*) | N | The general safety and performance requirements of Annex I of Reg. (EU) 2017/745 | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/04-fascicolo-tecnico.md) |
| **GST - Gestore Soluzioni di Telemedicina** | N | The micro-service of the national telemedicine infrastructure that assists the Validation Process for third-party solutions | [F02](02-prestazioni-di-telemedicina.md) |
| **Guasto parziale** (*partial failure*) | S | The situation in which a part of the system is broken and the rest **may not know it**. It is the essential difference between a distributed system and a local program | [F11](11-fondamenti-informatici.md) |
| **Guida di implementazione nazionale** (*national implementation guide*) | G | A guide produced by a national affiliate for its own legal order; it prevails over the generic international model in its own context | [F05](05-standard-di-interoperabilita.md) |

### H

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **HKDF** | S | A key derivation function based on HMAC (RFC 5869), with domain separation by means of a context label | [F12](12-crittografia-e-sicurezza.md) |
| **HL7 International** | S | The organisation that produces the standards for exchanging health information: HL7 v2, CDA, FHIR | [F05](05-standard-di-interoperabilita.md) |
| **HL7 Terminology** | S | HL7's shared vocabulary, in the public domain. **Trap:** it does, however, contain third-party concepts that are not in the public domain: a licence declaration affixed to a container does not dispose of other people's rights over the content | [F05](05-standard-di-interoperabilita.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **HMAC** | S | A message authentication code based on a hash function and a shared key (RFC 2104). **Trap:** it gives integrity and authenticity, **not** non-repudiation: both parties know the key and therefore either of them could have produced it | [F12](12-crittografia-e-sicurezza.md) |
| **HTTP Message Signatures** | S | The signing of selected components of an HTTP message (RFC 9421); the fingerprint of the body is carried with `Content-Digest` (RFC 9530) | [F13](13-protocolli.md), [PRO](/04_protocols/07-eventi-e-webhook.md) |
| **`HumanName`** | S | FHIR data type: a person's name, with composed form and decomposition into parts | [F06](06-fhir-da-zero.md) |

### I

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **ICD-9-CM** | N | The classification of diseases used in Italy for coding the clinical information of an admission | [F05](05-standard-di-interoperabilita.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **ICE** (*Interactive Connectivity Establishment*) | S | The procedure that gathers all the plausible paths between two ends, tries them and chooses the best (RFC 8445) | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **`id`** (logical identifier) | S | It identifies a FHIR resource **on that server**. **Trap:** it has neither clinical meaning nor portability: using it as a correlation key between systems is a structural defect | [F06](06-fhir-da-zero.md) |
| **`identifier`** (business identifier) | S | It identifies the entity **in the real world**, with its own namespace declared in the `system` field | [F06](06-fhir-da-zero.md) |
| **Identificativo di costruzione** (*build identifier*) | P | The marking that includes version, exact revision of the code and a normalised instant; it links an observed behaviour to a precise artefact | [F17](17-ambiente-di-sviluppo.md) |
| **Identificatore** (*identifier*) | S | A value that singles out an identity **inside a declared domain**. **Trap:** without the domain it is a string; two identical identifiers in different domains do not single out the same entity | [F04](04-identita-e-anagrafiche.md) |
| **Identificatore esterno** (*external identifier*) | P | The pair formed by the assigning authority and the value with which a third-party system identifies the subject; it is the working key of the reference-based model | [DOM](/05_domain/03-assistito-professionista-organizzazione.md), [INT](/07_integration/07-dati-e-sincronizzazione.md) |
| **Identificazione** (*patient identification*) | N | The professional's ascertainment that the person present at the other end of the connection is the expected one. **Trap:** it is an **act of the professional**, distinct from authentication, it is performed at every service and it is recorded with method and outcome | [F04](04-identita-e-anagrafiche.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Identità** (*identity*) | S | The representation of an entity inside a domain. **Trap:** an entity has as many identities as there are domains in which it is represented; there is no «the identity» in the absolute | [F04](04-identita-e-anagrafiche.md) |
| **Idempotenza** (*idempotency*) | S | The property of an operation which, repeated with the same arguments, adds no effects. **Trap:** in the clinical sphere the absence of idempotency produces the phantom service, that is, the same act recorded twice | [F11](11-fondamenti-informatici.md), [F13](13-protocolli.md), [F16](16-architettura-del-progetto.md) |
| **`If-None-Exist`** | S | The header of conditional create in FHIR; it is the idempotency mechanism of ingestion | [F06](06-fhir-da-zero.md) |
| **IFoC - Infermiere di famiglia o di comunità** (*family and community nurse*) | N | The reference professional for the proactive taking on of care of the population of a territorial area | [F01](01-sistema-sanitario-italiano.md) |
| **IHE** (*Integrating the Healthcare Enterprise*) | S | An initiative that **does not write standards**: it defines integration profiles by combining existing standards | [F05](05-standard-di-interoperabilita.md), [PRO](/04_protocols/05-ihe.md) |
| **Immissione sul mercato** (*placing on the market*) | N | The first making available of a device on the Union market (Reg. (EU) 2017/745, Art. 2, point 28) | [F15](15-regolatorio-da-zero.md) |
| **Impegnativa** (*NHS prescription form*; an Italian institution with no exact equivalent) | N | A prescription on the health service pad that confers entitlement to the service at public expense. **Trap:** it is a prescription **plus** an entitlement of access: two functions in a single document, and the model that represents only one of them loses the other | [F01](01-sistema-sanitario-italiano.md) |
| **Implementation Guide (IG)** | S | A published package that gathers profiles, terminologies, extensions, examples and conformance rules | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Impronta della migrazione** (*migration checksum*) | P | The checksum of an applied migration, verified at every execution; it makes retroactive modification of a migration already executed impossible | [F17](17-ambiente-di-sviluppo.md) |
| **Incapsulamento** (*encapsulation*) | S | The property whereby every layer of a protocol stack treats the message of the layer above as opaque content and adds its own header to it | [F13](13-protocolli.md) |
| **Indice di perfusione** (*perfusion index*) | S | A signal-quality indicator exposed by some oximeters; it measures the amplitude of the pulsatile component. **Trap:** it is an indicator of the **quality of the measurement**, not a clinical parameter | [F09](09-fondamenti-clinici.md) |
| **Indice nazionale FSE** | N | The component of the national interoperability infrastructure that indexes the documents' metadata and transfers them to the index of the Region of entitlement when one is associated | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Indice principale del paziente** (*master patient index*) | S | The component that reconciles the representations of the same person coming from different systems | [F04](04-identita-e-anagrafiche.md) |
| **Indirizzo di svolgimento** (*session location address*) | P | The place in which the patient is during the session. **Trap:** it must be requested and **confirmed at every session**, because it is the information needed in the event of an emergency and it changes without notice | [DOM](/05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **INI - Infrastruttura nazionale per l'interoperabilità** | N | The national component of the health record system, realised through the Sistema Tessera Sanitaria; it comprises the index, the register of consents and the national portal | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Inoltro selettivo** (*selective forwarding unit*, SFU) | S | A server that receives one stream from each participant and forwards it to the others. **Trap:** **it terminates the encryption**: a session that passes through a selective forwarding unit is not encrypted end to end | [F08](08-webrtc-da-zero.md) |
| **Informativa** (*privacy notice*) | N | The informative document that precedes and founds the consent. **Trap:** it is versioned, and the previous versions must be retained: without them it is impossible to demonstrate which text a person adhered to | [DOM](/05_domain/06-consenso-e-riservatezza.md) |
| **INT - Infrastruttura nazionale di telemedicina** | N | The national component under AGENAS's controllership that provides enabling services. **Trap:** **it is not a clinical repository**: it does not retain the documents produced by the services | [F02](02-prestazioni-di-telemedicina.md) |
| **Integratore** (*integrator*) | P | A third party that incorporates the system into its own. **Trap:** it is an **application principal**, not a user, and it must be distinguished from the person on whose behalf it acts in every entry of the audit trail | [DOM](/05_domain/03-assistito-professionista-organizzazione.md), [INT](/07_integration/01-modalita-di-integrazione.md) |
| **Integrità** (*integrity*) | S | The absence of unauthorised alterations **and the detectability** of those that occur. The second part is the one that gets forgotten | [F12](12-crittografia-e-sicurezza.md) |
| **Interazione** (*interaction*, FHIR) | S | One of the REST operations provided for by the standard: read, vread, update, patch, delete, create, search, history, capabilities, transaction | [F06](06-fhir-da-zero.md) |
| **Interazione condizionale** | S | A create, update, delete or patch selected by search criteria instead of by identifier | [F06](06-fhir-da-zero.md) |
| **Interoperabilità tecnica** | S | The systems manage to exchange bits: network, transport, encryption | [F05](05-standard-di-interoperabilita.md) |
| **Interoperabilità sintattica** | S | The systems manage to decode the structure of what they exchange | [F05](05-standard-di-interoperabilita.md) |
| **Interoperabilità semantica** | S | The systems attribute **the same meaning** to the values exchanged. **Trap:** it is the level at which almost every project stops, believing it has reached it | [F05](05-standard-di-interoperabilita.md) |
| **Interoperabilità organizzativa** | S | The organisations have compatible rules on authorisations, consents and responsibilities. It is the level no standard can resolve on its own | [F05](05-standard-di-interoperabilita.md) |
| **Interruttore automatico** (*circuit breaker*) | S | The component that stops calling a service that is continuously failing and retries cautiously | [F11](11-fondamenti-informatici.md) |
| **Intervallo di riferimento** (*reference interval*) | S | The range of values expected in a reference population, with a given method and in a given context. **Trap:** it belongs to the **measurement**, not to the quantity: it changes with the method, with the laboratory and with the population | [F09](09-fondamenti-clinici.md) |
| **Intramoenia** (an institution of Italian law, with no equivalent) | N | Private practice carried out for a fee by a doctor employed by the health service inside the public facility | [F01](01-sistema-sanitario-italiano.md) |
| **Introspezione** (*token introspection*) | S | A query to the authorization server about a token's current validity | [F13](13-protocolli.md) |
| **Invariante** (*invariant*) | S | A condition that must be true at every observable instant. **Trap:** in the domain model an invariant must be made **impossible to violate**, not merely discouraged by a validation | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Ipoglicemia** (*hypoglycaemia*) | S | Glucose in the blood below the useful level. **Trap:** it is an acute event on a time scale of minutes, **asymmetrical** with respect to hyperglycaemia: the two conditions are not handled with the same alarm logic | [F09](09-fondamenti-clinici.md) |
| **IRCCS** | N | Istituto di ricovero e cura a carattere scientifico: a body recognised for clinical excellence and research activity (D.lgs. 288/2003) | [F01](01-sistema-sanitario-italiano.md) |
| **IRT - Infrastruttura regionale di telemedicina** | N | The component under regional controllership that concretely delivers the services. **Trap:** **it does not retain** the documents generated: retention is elsewhere | [F02](02-prestazioni-di-telemedicina.md) |
| **Isolamento dei client** (*client isolation*) | S | The Wi-Fi access point policy that prevents two devices on the same network from talking to each other directly. It is one of the causes of failure of the direct path that nobody foresees | [F08](08-webrtc-da-zero.md) |
| **Isolamento di rete in uscita** (*egress isolation*) | S | The absence of routes from the relay node towards the internal network and towards itself. **Trap:** it is **the primary defence** against improper use of the relay, not the lists of forbidden addresses | [F08](08-webrtc-da-zero.md), [SEC](/06_security/05-sicurezza-del-tempo-reale.md) |
| **Isolamento fra tenant, prove di** | P | Tests that **actively** attempt illegitimate access to another tenant's data, for every context and for every interface. **Trap:** a test that passes because it did not try demonstrates nothing; this is the shape of the negative test | [F17](17-ambiente-di-sviluppo.md), [ARC](/02_architecture/05-multi-tenancy.md) |
| **ISO/IEC 29115** | S | The international standard on identity levels of assurance. The three Italian levels correspond to levels LoA2, LoA3 and LoA4 of the standard | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **Ispezione** (*inspection*) | S | Visual observation of the patient. **Trap:** it is the only manoeuvre of the physical examination partly transferable at a distance, and even then degraded by lighting, compression and framing | [F09](09-fondamenti-clinici.md) |
| **Istante di inserimento** (*entry timestamp*) | P | When the datum was entered into the system by a party | [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **Istante di ricezione** (*reception timestamp*) | P | When the system received the datum from an external source | [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **Istante di rilevazione** (*observation timestamp*) | S | When the measured fact happened. **Trap:** it is the **only** axis of the clinical series; ordering a series on the reception instant produces false graphs and non-existent trends | [DOM](/05_domain/05-parametri-e-osservazioni.md), [F09](09-fondamenti-clinici.md) |
| **Isteresi** (*hysteresis*, of an alarm) | S | The use of different thresholds for the activation and for the return of an alarm, in order to avoid oscillation around the activation value | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **IUA** (*Internet User Authorization*) | S | The IHE profile for authorisation based on OAuth | [F05](05-standard-di-interoperabilita.md) |

### J-K

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Jitter** (network) | S | Variability of the delay between consecutive packets | [F08](08-webrtc-da-zero.md) |
| **Jitter** (retries) | S | A random term added to the waiting interval between retries in order to avoid synchronised bursts. **Trap:** the same word, two meanings; see the section on context-dependent terms | [F11](11-fondamenti-informatici.md) |
| **Jitter buffer** | S | The receiving queue that absorbs the variability of the delay by adding latency. **Trap:** it is the **dominant** contributor to perceived delay, and it is not in the project's code | [F08](08-webrtc-da-zero.md) |
| **JSEP** (*JavaScript Session Establishment Protocol*) | S | RFC 8829: how offer and answer appear to the browser's programming interface | [F08](08-webrtc-da-zero.md) |
| **JWT / JWS / JWE / JWK** | S | Respectively: token, signed token, encrypted token, representation of a key | [F13](13-protocolli.md) |
| **JWKS** (*JWK Set*) | S | A document that publishes a set of public keys with their respective identifiers | [F13](13-protocolli.md) |
| **`KeyUpdate`** | S | The DTLS 1.3 message that updates the record-layer keys. **Trap:** it does **not** update the exporter secret, and therefore it does not regenerate the media keys | [F08](08-webrtc-da-zero.md) |
| **`kid`** (*key identifier*) | S | The identifier of the key used to sign, which makes rotation without interruption of service possible | [F13](13-protocolli.md) |

### L

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Latenza** (*latency*) | S | The time between the request and the response of a single operation. **Trap:** it is always declared with a percentile, never with an average; and in the project it is a **metric measured, recorded and notified**, not a promise | [F11](11-fondamenti-informatici.md), [TEC](/01_technical/07-prestazioni-e-capacita.md) |
| **LEA - Livelli essenziali di assistenza** (*essential levels of care*; an institution of Italian law) | N | The services the health service must guarantee throughout the territory (D.P.C.M. 12 gennaio 2017) | [F01](01-sistema-sanitario-italiano.md) |
| **Legame di canale** (*channel bind*) | S | The association between a channel number and an address on a relay server, which reduces the header of the packets | [F08](08-webrtc-da-zero.md) |
| **Legge di Little** (*Little's law*) | S | `L = λ × W`: the number of items in a system equals the arrival rate multiplied by the time spent in it | [F11](11-fondamenti-informatici.md) |
| **Lettera di dimissione ospedaliera** (*hospital discharge letter*) | N | The document concluding an admission, addressed to the treating clinician. **Trap:** not to be confused with the hospital discharge record, which is an administrative information flow | [F03](03-il-dato-clinico.md) |
| **Linguaggio ubiquo** (*ubiquitous language*) | P | The vocabulary shared between those who know the domain and those who write the code, used identically in conversation, in the code and in the interface. **Trap:** it holds **inside a bounded context**; insisting that it be single across the whole system produces a vocabulary that means nothing anywhere | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [DOM](/05_domain/01-linguaggio-ubiquo.md) |
| **Lista di ammissione** (*allowlist*, of the terminology check) | P | The versioned list of what the automatic check permits. **Trap:** modifying it requires the review provided for compliance material, not a simple change proposal | [F17](17-ambiente-di-sviluppo.md) |
| **Livello anticorruzione** (*anti-corruption layer*) | S | The layer of translation at the boundary that prevents an external model from penetrating the internal one | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Livello di garanzia (LoA)** (*level of assurance*) | N | A measure of trust in the statement «this person is who they say they are»; it depends on the verification carried out at the moment the identity was issued and on the factors used at login. **Trap:** it travels in the `acr` claim, not in the delegation claim, and for one of the Italian channels the level declared in the assertion is always the maximum | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **Livello di isolamento** (*isolation level*) | S | The degree of separation between concurrent transactions, defined by the anomalies it excludes | [F11](11-fondamenti-informatici.md) |
| **Livello di provenienza** (*provenance level*) | P | The description of the chain through which a measurement reached the system. **Trap:** **it is not a judgement of reliability** applied by the system: it is a recorded fact that the professional interprets | [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **Livello di riservatezza** (*sensitivity label*) | P | The attribute of the document that governs its automatic sharing and the notifications | [DOM](/05_domain/04-documenti-clinici.md) |
| **Livello richiesto / livello dichiarato** | S | The level of assurance demanded in the authentication request and the one reported in the returning assertion. **Trap:** **both** must be recorded, because for one of the Italian channels the second is not informative | [F04](04-identita-e-anagrafiche.md) |
| **LOINC** | S | The terminology for observations, measurements, document types and sections; redistributable with attribution. **Trap:** the translations are derivatives assigned to the owner of the terminology: the project's interface strings must be kept architecturally separate from the official display | [F05](05-standard-di-interoperabilita.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Log degli eventi** (*event log*) | S | An ordered, immutable and append-only sequence of records, with a progressive position | [F11](11-fondamenti-informatici.md) |
| **Loopback** | S | The machine's local network interface; the only origin treated as a secure context in development without a certificate | [F17](17-ambiente-di-sviluppo.md) |

### M

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Mancata presentazione** (*no-show*) | P | The absence of the patient without any attempt to connect within the window provided. **Trap:** it is **distinct** from technical failure, and confusing them produces statistics that blame the patient for defects of the infrastructure | [DOM](/05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Mandatario** (*authorised representative*) | N | A person established in the Union appointed in writing by a manufacturer established outside the Union (Reg. (EU) 2017/745, Art. 11) | [F15](15-regolatorio-da-zero.md) |
| **Mappa dei contesti** (*context map*) | S | The description of the relations and of the balances of power between bounded contexts | [F11](11-fondamenti-informatici.md), [ARC](/02_architecture/02-contesti-delimitati.md) |
| **Marca temporale** (*timestamp token*) | N | An attestation enforceable against third parties, issued by a trust service provider, that a document or a fingerprint existed in that form at that instant (RFC 3161) | [F03](03-il-dato-clinico.md), [F12](12-crittografia-e-sicurezza.md) |
| **Marcatore di sinteticità** (*synthetic flag*) | P | An attribute persisted in the datum that declares the record as generated. **Trap:** it serves to verify with **a single query** that an environment contains no real data; without it, the verification is a statement of trust | [F17](17-ambiente-di-sviluppo.md) |
| **Marcatura CE** (*CE marking*) | N | The mark by which the manufacturer declares conformity with the applicable Union legislation; for devices requiring a Notified Body it is followed by that body's number (Reg. (EU) 2017/745, Art. 20). **Trap: today the product does not bear CE marking**, and no document of the project states that it will bear it by a given date | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/00-indice.md) |
| **Matrice di visibilità documentale** (*document visibility matrix*) | N | The correspondence between documentary type and role, defined by DM 19 novembre 2025 (the Ministerial Decree of 19 November 2025), Annex 3, § 5.2 | [DOM](/05_domain/04-documenti-clinici.md) |
| **MDCG** (*Medical Device Coordination Group*) | N | The coordination group for medical devices; it publishes guidance that is **non-binding but followed in practice** by the notified bodies | [F15](15-regolatorio-da-zero.md) |
| **MDM** | S | The family of HL7 v2 messages for document notification | [F05](05-standard-di-interoperabilita.md) |
| **MDR** | N | Regulation (EU) 2017/745 on medical devices | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/01-inquadramento-normativo.md) |
| **MDSW** (*medical device software*) | N | Software that is itself a medical device, and not a component of one | [F15](15-regolatorio-da-zero.md) |
| **mDNS** (*multicast DNS*) | S | Name resolution on the local network, used by browsers to obfuscate private addresses in the ICE candidates | [F08](08-webrtc-da-zero.md) |
| **Mesh** | S | The topology in which every participant sends to every other. **Trap:** it preserves end-to-end encryption but it does not scale beyond very few participants | [F08](08-webrtc-da-zero.md) |
| **Messa in servizio** (*putting into service*) | N | The stage at which the device is made available to the final user as being **ready for use** (Reg. (EU) 2017/745, Art. 2, point 29) | [F15](15-regolatorio-da-zero.md) |
| **`meta`** | S | Technical metadata of a FHIR resource: version, last update, declared profiles, labels | [F06](06-fhir-da-zero.md) |
| **Metadata** (*federation metadata*) | S | A document that describes a participant in an identity federation: entity identifier, response addresses, public keys, requested attributes | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **MHD** (*Mobile access to Health Documents*) | S | The IHE profile for publishing and retrieving clinical documents over FHIR REST | [F05](05-standard-di-interoperabilita.md) |
| **Misura** (*observation*) | S | A value, plus the context in which it was obtained. **Trap:** it is **immutable**: it is not corrected by modifying it, it is corrected by issuing a new version, and the previous one remains | [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **MLLP** (*Minimal Lower Layer Protocol*) | S | The framing protocol for HL7 v2 messages over TCP. **Trap:** it is in the clear by construction, and protection must be added underneath, not presupposed | [F05](05-standard-di-interoperabilita.md), [F13](13-protocolli.md) |
| **MMG - Medico di medicina generale** (*general practitioner*) | N | The adult's trusted doctor, **under agreement and not employment**, remunerated by capitation. **Trap:** they are not an employee of the health authority, and this changes who is the controller of the data they produce | [F01](01-sistema-sanitario-italiano.md) |
| **Mobilità sanitaria** (*inter-regional patient mobility*) | N | Settlement of credits between Regions for services delivered to patients from another Region | [F01](01-sistema-sanitario-italiano.md) |
| **Modalità con registrazione** (*recording mode*) | P | The session mode in which the stream passes through the recording component. **Trap: in this mode the session is no longer encrypted end to end**, the privacy notice must say so explicitly and the status indicator must be persistent and impossible to conceal | [DOM](/05_domain/06-consenso-e-riservatezza.md), [SEC](/06_security/05-sicurezza-del-tempo-reale.md) |
| **Modalità degradata** (of the terminology gateway) | P | The behaviour of the system when a code system is switched off: the main paths work, the validation of those codes is not performed **and the failure to validate is declared** | [F17](17-ambiente-di-sviluppo.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Modalità di guasto** (*failure mode*) | S | The specific way in which a component may stop working | [F11](11-fondamenti-informatici.md) |
| **Modello a livelli** (*layered model*) | S | The conceptual map of a protocol stack: the OSI model with seven layers, the Internet model with four | [F13](13-protocolli.md) |
| **Modello canonico di scambio** (*canonical exchange model*) | P | The representation with which clinical facts leave and enter the system. **Trap:** it is a **projection**, never a source: the internal model does not bend to the shape of the exchange | [F16](16-architettura-del-progetto.md) |
| **Modello di minaccia** (*threat model*) | S | A structured description of what the system defends itself against, with actors, surface, controls and residual risk | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/01-modello-di-minaccia.md) |
| **ModI - Modello di Interoperabilità** | N | AgID's technical rules on the interaction, security and audit patterns of public administrations' application interfaces | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Modificatore / prefisso** (FHIR search) | S | A qualifier of the behaviour of a search parameter / a comparison operator on ordered types | [F06](06-fhir-da-zero.md) |
| **`modifierExtension`** | S | An extension that **changes the meaning** of the rest of the resource. **Trap:** whoever does not recognise it **must refuse** the resource; ignoring it silently is a serious defect | [F06](06-fhir-da-zero.md) |
| **Modifica sostanziale** (*significant change*) | N | A change to the quality management system or to the approved device that affects safety, performance or conditions of use; it requires prior approval by the Notified Body | [F15](15-regolatorio-da-zero.md) |
| **Multimorbilità** (*multimorbidity*) | S | The coexistence of two or more chronic conditions. **Trap:** it is a condition in its own right, not the sum of the individual diseases: pathways built on a single condition do not govern it | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Must support** | S | The marking of an element in a profile whose meaning **must be defined by the profile itself**. **Trap:** it does not mean «mandatory», and reading it that way produces wrong implementations in both directions | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |

### N

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **`NACK` / `RTX`** | S | Retransmission request and retransmission stream in real-time media (RFC 4585, RFC 4588) | [F08](08-webrtc-da-zero.md) |
| **NANDO / SMCS** | N | The Commission database and portal listing the notified bodies by legislation, Member State and scope of designation | [F15](15-regolatorio-da-zero.md) |
| **NAT** (*Network Address Translation*) | S | Address translation that allows several devices to share a public address; it makes internal hosts unreachable from outside | [F08](08-webrtc-da-zero.md) |
| **NAT simmetrico** (*symmetric NAT*) | S | Translation with a mapping dependent on the destination address and port (RFC 4787). **Trap:** if present on both sides it makes the direct path **impossible**: the relay is not a fallback, it is the only road | [F08](08-webrtc-da-zero.md) |
| **ndjson** | S | One JSON document per line; readable as a stream with constant memory | [F13](13-protocolli.md) |
| **Negoziazione del contenuto** (*content negotiation*) | S | Agreement on representation, language and encoding through the `Accept*` and `Content-*` headers | [F13](13-protocolli.md) |
| **Negoziazione perfetta** (*perfect negotiation*) | S | The scheme that resolves the collision of offers without race conditions | [F08](08-webrtc-da-zero.md) |
| **NIT - Nodo di interoperabilità della telemedicina** | N | The inter-regional interoperability component, **without persistence**, with mutual certificate authentication | [F02](02-prestazioni-di-telemedicina.md) |
| **Nomenclatore** (*fee schedule*) | N | The coded catalogue of services with the relevant maximum tariff. **Trap:** it is **versioned over time and variable by regime**; hard-wiring one version of it means producing wrong amounts at the first revision | [F01](01-sistema-sanitario-italiano.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Nomina** (*nomination*, ICE) | S | The designation of the definitive candidate pair by the controlling agent | [F08](08-webrtc-da-zero.md) |
| **Nonce** | S | A value used **only once per key**. **Trap:** its reuse annihilates confidentiality and integrity together in counter-based constructions; it is not an implementation detail | [F12](12-crittografia-e-sicurezza.md) |
| **Non alterabile** (*tamper-evident*) | P | The property whereby nobody, including whoever administers the system, can modify an entry without the alteration being detectable | [F16](16-architettura-del-progetto.md), [SEC](/06_security/04-tracciamento.md) |
| **Non conferibile** (*non-transmissible*) | P | The status of a document which, for regulatory reasons, cannot be conferred to the health record. **Trap:** distinct from «not yet conferred», which is a transitory and not a definitive state | [DOM](/05_domain/04-documenti-clinici.md) |
| **Non ripudio** (*non-repudiation*) | S | The impossibility, for whoever has performed an act, of denying it before a third party. **Trap:** it requires an **asymmetric** signature; no shared-key authentication code provides it | [F12](12-crittografia-e-sicurezza.md), [F16](16-architettura-del-progetto.md) |
| **Norma armonizzata** (*harmonised standard*) | N | A technical standard whose reference is published in the Official Journal of the Union in support of a piece of legislation; applying it confers a presumption of conformity (Reg. (EU) 2017/745, Art. 8) | [F15](15-regolatorio-da-zero.md) |
| **NRE - Numero di ricetta elettronica** | N | The nationally unique identifier of the dematerialised prescription. **Trap:** it identifies **the prescription**, not the patient | [F01](01-sistema-sanitario-italiano.md) |
| **NSG - Nuovo sistema di garanzia** | N | The system of indicators with which the Ministry assesses the Regions' delivery of the essential levels of care | [F01](01-sistema-sanitario-italiano.md) |
| **NTP / NTS** | S | Clock synchronisation; the second authenticates its source. **Trap:** an audit trail with clocks that are not synchronised and not authenticated is a contestable audit trail | [F13](13-protocolli.md) |

### O

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **`Observation`** | S | The FHIR resource that represents an observation: a measurement, a finding, a value | [F06](06-fhir-da-zero.md) |
| **OCSP** | S | The protocol for point-in-time querying of the revocation status of a certificate (RFC 6960) | [F12](12-crittografia-e-sicurezza.md) |
| **OdC - Ospedale di comunità** (*community hospital*; an Italian institution of DM 77/2022) | N | A predominantly nurse-led inpatient facility for low clinical intensity | [F01](01-sistema-sanitario-italiano.md) |
| **Offerta / risposta** (*offer/answer*) | S | The negotiation model in which one end proposes everything it can do and the other accepts, restricts or refuses (RFC 3264) | [F08](08-webrtc-da-zero.md) |
| **Offset** (*offset*, broker) | S | The consumer's position in the event log; it is what makes rereading possible | [F13](13-protocolli.md) |
| **Oggetto valore** (*value object*) | S | An immutable object without identity, defined entirely by its attributes | [F11](11-fondamenti-informatici.md) |
| **Omeostasi** (*homeostasis*) | S | The active maintenance of certain physiological quantities within narrow ranges by negative feedback. **Trap:** it explains why a stable value does not amount to a system in equilibrium: it may be a system that is working very hard to stay stable | [F09](09-fondamenti-clinici.md) |
| **Omissione coordinata** (*coordinated omission*) | S | The measurement defect whereby a load generator stops generating when the system slows down, drastically underestimating the waits observed | [F11](11-fondamenti-informatici.md), [TEC](/01_technical/07-prestazioni-e-capacita.md) |
| **Omocodia** (*tax code collision*; a phenomenon of the Italian legal order alone) | N | The coincidence of the tax code between two people; it is resolved by progressively substituting digits with letters according to a fixed table and recalculating the check character. **Trap:** it demonstrates that the tax code is not a unique identifier by construction | [F04](04-identita-e-anagrafiche.md) |
| **Ondata sincronizzata** (*thundering herd*) | S | Retries that converge on the same instant and prevent the service from recovering; it is avoided with a random component in the waiting interval | [F13](13-protocolli.md) |
| **OpenID Connect** | S | An identity layer on top of OAuth 2.0, based on signed JSON tokens. **Trap:** in Italy it is available in production for one of the public identity channels and **not** for the other | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **`OperationOutcome`** | S | The FHIR resource that carries errors, warnings and diagnostic information | [F06](06-fhir-da-zero.md) |
| **Operazione (`$`)** | S | A FHIR action that cannot be expressed with the REST interactions; invocable at system, type or instance level | [F06](06-fhir-da-zero.md) |
| **Opus** | S | The reference audio codec for WebRTC (RFC 6716; transport RFC 7587) | [F08](08-webrtc-da-zero.md) |
| **Orchestrazione** (*orchestration*) | S | Coordination in which one component knows the sequence of the steps, manages the compensations and keeps the state of the process, which thereby becomes **queryable**. It is the opposite of choreography | [F16](16-architettura-del-progetto.md) |
| **Ordinale opaco di tenant** (*opaque tenant ordinal*) | P | The sequential number used in the schema names in place of the tenant's name, which may itself be personal data | [F17](17-ambiente-di-sviluppo.md), [ARC](/02_architecture/05-multi-tenancy.md) |
| **Organismo Notificato** (*notified body*) | N | A third-party entity designated under Annex VII of Reg. (EU) 2017/745 that assesses the conformity of devices in the higher classes. **Trap:** it may not provide consultancy to those it assesses, and the waiting times are the limiting factor of the whole path, not the development of the software | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/09-percorso-e-calendario.md) |
| **Orologio logico** (*logical clock*) | S | A counter that captures causal precedence between events, independent of the physical clock | [F11](11-fondamenti-informatici.md) |
| **Orologio monotono** (*monotonic clock*) | S | A time source that does not go backwards. **Trap:** it is the only correct one for measuring durations; using the system clock produces negative durations when the clock is corrected | [F13](13-protocolli.md) |
| **ORU** | S | The HL7 v2 message for transmitting results | [F05](05-standard-di-interoperabilita.md) |
| **Oscuramento** (*data suppression*; an institution of Italian law) | N | The patient's right to make particular documents invisible to particular parties (DM 7 settembre 2023, Art. 9). **Trap:** **it does not delete** the document and it does not withdraw it from whoever produced it, who continues to see it | [F03](03-il-dato-clinico.md), [DOM](/05_domain/06-consenso-e-riservatezza.md) |
| **Oscuramento dell'oscuramento** | N | The requirement whereby **the very existence** of the suppressed document must not be inferable. **Trap:** it is the requirement that breaks naive implementations, because a list with a hole is a list that reveals the hole | [F03](03-il-dato-clinico.md) |
| **Osservabilità** (*observability*) | S | The ability to answer **unforeseen** questions starting from what the system emits. **Trap:** it is not the sum of metrics and logs prepared for the questions already known | [F11](11-fondamenti-informatici.md), [TEC](/01_technical/06-osservabilita.md) |
| **Overbooking** | P | The controlled assignment of several appointments to the same slot. **Trap:** if it emerges from a race condition it is not a feature, it is a defect; the difference lies in the recorded intention | [DOM](/05_domain/01-linguaggio-ubiquo.md) |

### P

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Pacchetto FHIR** (*FHIR package*) | S | The distribution unit of an implementation guide, identified by name and version and resolved from a registry | [F06](06-fhir-da-zero.md) |
| **PACELC** | S | The extension of the CAP theorem: in the presence of a partition one chooses between availability and consistency; otherwise between latency and consistency | [F11](11-fondamenti-informatici.md) |
| **Paginazione per cursore** (*cursor pagination*) | S | Pagination based on an opaque reference to the position reached, stable with respect to concurrent insertions | [F11](11-fondamenti-informatici.md) |
| **PAI - Piano assistenziale individuale** (*individual care plan*; an Italian institution) | N | The plan of integrated, multi-professional taking on of care, with a health **and social** dimension, drawn up by a care team | [F01](01-sistema-sanitario-italiano.md), [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Palpazione** (*palpation*) | S | Detection by means of touch. **Trap:** impossible for the professional at a distance, in every technical configuration | [F09](09-fondamenti-clinici.md) |
| **Paratia** (*bulkhead*) | S | The assignment of separate and limited resources to different categories of work, in order to contain the propagation of failures | [F11](11-fondamenti-informatici.md) |
| **Partecipante** (*participant*) | S | A party admitted to the session with a role, a declared capacity, an instant of entry and an instant of exit | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Partizione** (*partition*) | S | The unit of parallelism and of ordering of a broker. **Trap:** ordering is guaranteed **only within it** | [F13](13-protocolli.md) |
| **`Patient`** | S | The FHIR demographic resource for the patient. **Trap:** in the reference-based model the project works on the `identifier` with the integrator's domain, not on the local `id` | [F06](06-fhir-da-zero.md) |
| **Paziente** (*patient*) | S | The person to whom the health act is addressed. **Trap:** it is a **clinical** status, distinct from «assistito», which is administrative; the rules of access to the two sets of data have different domains | [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **PDND - Piattaforma Digitale Nazionale Dati** | N | The catalogue of application services and the authorisation authority under Art. 50-*ter* of the Codice dell'Amministrazione Digitale. **Trap:** it issues vouchers, **it does not carry the data** | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **PDQm** | S | The IHE profile for demographic query | [F05](05-standard-di-interoperabilita.md) |
| **PDTA - Percorso diagnostico-terapeutico assistenziale** (*care pathway*; an Italian organisational institution) | N | The expected sequence of acts for a condition, in a given organisation. **Trap:** it is the **model**, not the instance on the individual patient: the model is versioned, the instance is the care plan | [F01](01-sistema-sanitario-italiano.md), [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Pepe** (*pepper*) | S | A secret that is the same for everybody, kept outside the database, added to the password in addition to the salt | [F12](12-crittografia-e-sicurezza.md) |
| **Percentile** | S | The value below which a given fraction of the observations falls | [F11](11-fondamenti-informatici.md) |
| **Percussione** (*percussion*) | S | Detection by means of the sound produced by striking a body surface. **Trap:** impossible at a distance | [F09](09-fondamenti-clinici.md) |
| **Pericolo** (*hazard*) | N | A potential source of harm, in the definition of ISO 14971. The complete chain is **hazard → sequence of events → hazardous situation → harm** | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |
| **Permesso** (*permission*, TURN) | S | Authorisation, per address, to send traffic towards a relay allocation, with a limited lifetime | [F08](08-webrtc-da-zero.md) |
| **Peso secco** (*dry weight*) | S | The target weight of the person on dialysis after the removal of excess fluid; it is the reference against which the deviation is assessed | [F09](09-fondamenti-clinici.md) |
| **Piano applicativo** (*application plane*) | P | The exposure surface that represents the capabilities of the product, with a grammar of actions | [F16](16-architettura-del-progetto.md), [PRO](/04_protocols/06-api-di-progetto.md) |
| **Piano clinico** (*clinical plane*) | P | The exposure surface that represents clinical states in the grammar of the healthcare standard. **Trap:** the two planes do not merge: one is the product, the other is the domain | [F16](16-architettura-del-progetto.md), [PRO](/04_protocols/02-fhir.md) |
| **Piano di cura** (*care plan*) | S | The instance, on the individual patient, of what it has been decided to do, with objectives, activities and calendar | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Piano di rientro** (*regional deficit recovery plan*; an Italian institution) | N | A regime of spending constraints imposed on Regions with a healthcare deficit | [F01](01-sistema-sanitario-italiano.md) |
| **Piano di telemonitoraggio** (*remote monitoring plan*) | N | The individual document that defines operationally cycles, duration, frequencies, time bands, **thresholds and rules of behaviour** (DM 19 novembre 2025, Annex 1). It is signed and it is a documentary type of the health record. **Trap:** the thresholds are configured by the professional for that individual patient, never deduced by the system nor hard-wired | [F02](02-prestazioni-di-telemedicina.md), [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Pinning** (in Italian *fissaggio della versione*) | S | Fixing the exact version of a dependency so as to make the build reproducible. **Trap:** it holds for implementation guides and terminology packages too, not only for code libraries | [F05](05-standard-di-interoperabilita.md), [F17](17-ambiente-di-sviluppo.md) |
| **PIXm** | S | The IHE profile for cross-referencing patient identifiers across different domains | [F05](05-standard-di-interoperabilita.md) |
| **PKCE** | S | The mechanism that binds the authorisation code to a secret generated by the client for that specific request | [F13](13-protocolli.md) |
| **PKI** (*public key infrastructure*) | S | Public key infrastructure: authorities, policies, procedures and formats that make certificates operational | [F12](12-crittografia-e-sicurezza.md) |
| **`PLI` / `FIR`** | S | Picture loss indication and full-frame request (RFC 4585, RFC 5104) | [F08](08-webrtc-da-zero.md) |
| **PLS - Pediatra di libera scelta** (*family paediatrician*) | N | The equivalent of the general practitioner for the paediatric age band | [F01](01-sistema-sanitario-italiano.md) |
| **PN-DT - Piattaforma nazionale per la diffusione della telemedicina** | N | A portal for training, catalogue and communication on telemedicine | [F02](02-prestazioni-di-telemedicina.md) |
| **PNRR Missione 6** | N | The «Health» component of the National Recovery and Resilience Plan: the first sub-component concerns the territory and telemedicine, the second innovation and the electronic health record | [F01](01-sistema-sanitario-italiano.md) |
| **PNT - Piattaforma nazionale di telemedicina** | N | The combination of the national infrastructure and the regional infrastructures, established at AGENAS by DM 19 novembre 2025, Art. 2 | [F02](02-prestazioni-di-telemedicina.md) |
| **Politica di trasporto forzata al relay** (*relay-only transport policy*) | P | The configuration of the negotiation that discards non-relay candidates; it is the quick test that the relayed path really works | [F17](17-ambiente-di-sviluppo.md) |
| **Porta** (*port*) | S | The number that identifies the destination program on a machine | [F08](08-webrtc-da-zero.md) |
| **Portale nazionale FSE** | N | The component of the national interoperability infrastructure that exposes the health record online to the patient and to operators | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Portata cardiaca** (*cardiac output*) | S | The volume of blood ejected by the heart per minute; the product of stroke volume and heart rate | [F09](09-fondamenti-clinici.md) |
| **Posologia** (*dosage*) | S | The structured specification of dose, unit, frequency, route, timing, duration and conditions of taking. **Trap:** representing it as free text makes every subsequent check impossible | [F09](09-fondamenti-clinici.md) |
| **`Practitioner` / `PractitionerRole` / `Organization`** | S | The three resources that separate the natural person, the capacity in which they operate and the party on whose behalf they operate. **Trap:** the domain reference always points to the **role**, never to the person, because permissions follow the capacity | [F04](04-identita-e-anagrafiche.md), [F06](06-fhir-da-zero.md) |
| **`Prefer: handling=strict`** | S | The header that asks the server to signal an error on unrecognised search parameters, instead of ignoring them silently | [F06](06-fhir-da-zero.md) |
| **Preferenza di degrado** (*degradation preference*) | S | The choice between sacrificing resolution or fluidity when the bandwidth is not enough. **Trap:** in a clinical context the choice is not a matter of indifference and must be decided explicitly, not inherited from the default behaviour | [F08](08-webrtc-da-zero.md) |
| **Prefisso, radice, suffisso** (*prefix, root, suffix*) | S | The elements from which medical vocabulary is composed, which make it possible to decode the **literal** meaning of terms never seen before. **Trap:** the literal meaning is not the clinical definition, which remains another thing and has to be looked up | [F09](09-fondamenti-clinici.md) |
| **Preimmagine** (*preimage*) | S | The input that produces a given digest; preimage resistance is the basic property of a hash function | [F12](12-crittografia-e-sicurezza.md) |
| **Presa in carico** (*taking the case on*) | P | The formal assumption of continuous clinical responsibility for a health problem. **Trap:** **it does not coincide with «having an appointment»**, and it is the fact that founds the obligations to respond | [F10](10-percorsi-di-cura-e-sicurezza.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Prestazione erogata** (*delivered service*) | P | The act actually performed. **Trap:** distinct from the **requested** service and from the **accounted-for** one: three entities with different life cycles, authors and states | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Prestazione fantasma** (*phantom service*) | P | A health act recorded twice because the connection dropped and was re-established. It is the clinical form of the idempotency defect | [F16](16-architettura-del-progetto.md) |
| **Prestazione richiesta** (*requested service*) | S | The request or the question that may give rise to an act. It may never be performed | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Pressione arteriosa media** (*mean arterial pressure*) | S | The time average of the pressure over the cardiac cycle. **Trap:** in information systems it is **a declared formula**, not a measurement: it must be represented as a derived value with the formula made explicit | [F09](09-fondamenti-clinici.md) |
| **Pressione differenziale** (*pulse pressure*) | S | The difference between systolic and diastolic pressure; a derived value, not measured | [F09](09-fondamenti-clinici.md) |
| **Prevalenza** (*prevalence*) | S | The proportion of subjects with the condition in the population tested. **Trap:** it is a property of the **population**, not of the disease nor of the test, and it determines the predictive value of every alarm | [F09](09-fondamenti-clinici.md) |
| **PRI - Progetto riabilitativo individuale** (*individual rehabilitation project*; an Italian institution) | N | The mandatory container of rehabilitation services, telerehabilitation included | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Principale applicativo** (*application principal*) | P | The system that acts on behalf of a person. **Trap:** it must be distinguished from the person **in every entry of the trail**; merging them makes the trail unusable in the event of a dispute | [F16](16-architettura-del-progetto.md), [INT](/07_integration/06-identita-e-delega.md) |
| **Principio attivo** (*active substance*) | S | The substance responsible for the effect of the medicine. **Trap:** distinct from the name of the medicinal product on the market and from the code of the pack | [F09](09-fondamenti-clinici.md) |
| **Privilegio minimo** (*least privilege*) | S | The assignment of only the necessary permissions, for only the necessary time | [F12](12-crittografia-e-sicurezza.md) |
| **Problem Details** | S | The regulated format of HTTP errors, `application/problem+json` (RFC 9457) | [F13](13-protocolli.md), [PRO](/04_protocols/06-api-di-progetto.md) |
| **Processo di Validazione** | N | The AGENAS procedure for certifying technical standards for third-party solutions, provided for by DM 19 novembre 2025, Art. 3, para. 4. **Trap:** its operational content is not publicly documented `[NV]` `COMP` must verify: it is the project's door of entry and its indeterminacy is a declared risk | [F02](02-prestazioni-di-telemedicina.md) |
| **Profilazione** (*profiling*, of a standard) | S | The act of restricting a general standard so as to make it verifiable in a precise context | [F05](05-standard-di-interoperabilita.md) |
| **Profilo** (*profile*) | S | A restriction of a specification for a context of use. **Trap:** it may only **restrict**, never widen; a «profile» that adds freedom is not a profile | [F05](05-standard-di-interoperabilita.md), [F06](06-fhir-da-zero.md) |
| **Profilo di dimensione del dataset** | P | The selection of the quantity of synthetic data generated: minimum for the paths, demonstration for the interface, extended for the capacity tests | [F17](17-ambiente-di-sviluppo.md) |
| **Profilo di integrazione** (*integration profile*, IHE) | S | A composition of actors and transactions that solves a determinate integration problem | [F05](05-standard-di-interoperabilita.md) |
| **Profilo di protezione** (*protection profile*, SRTP) | S | The media cipher suite negotiated between the two ends. **Trap:** the null profiles **do not encrypt** and must be refused explicitly | [F08](08-webrtc-da-zero.md) |
| **Profilo sanitario sintetico** (*patient summary*) | N | A derived document, drafted and updated by the trusted doctor, that summarises the patient's relevant clinical history | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Prognosi** (*prognosis*) | S | The prediction of the course. **Trap:** it is a probability distribution, not a date; representing it as a date is clinically and legally wrong | [F09](09-fondamenti-clinici.md) |
| **Prontezza e vivacità** (*readiness and liveness*) | S | Two distinct indicators of a service's state: **alive** means that the process exists, **ready** that it can receive traffic | [F17](17-ambiente-di-sviluppo.md), [TEC](/01_technical/06-osservabilita.md) |
| **Protocollo** (*protocol*) | S | An agreement on which messages are exchanged, in what order, how they are represented, what they mean and what happens in the event of an error | [F13](13-protocolli.md) |
| **`Provenance`** | S | The FHIR resource that records where a datum comes from and who produced it | [F06](06-fhir-da-zero.md) |
| **Prova a contratto** (*contract test*) | S | A test that checks that producer and consumer agree on the contract, without running them together | [F11](11-fondamenti-informatici.md), [F17](17-ambiente-di-sviluppo.md) |
| **Prova che verifica un divieto** | P | A test whose expected outcome is the **failure of an attempt**: for example concealing the recording indicator or saving a theme that degrades contrast | [F17](17-ambiente-di-sviluppo.md) |
| **Prova negativa** (*negative test*) | P | A test that passes **only if an attempt fails**; it is the form in which isolation between organisations is demonstrated | [F16](16-architettura-del-progetto.md) |
| **PRRC** (*person responsible for regulatory compliance*) | N | The person responsible for regulatory compliance; qualification requirements and tasks laid down by Art. 15 of Reg. (EU) 2017/745 | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **Pseudonimizzazione** (*pseudonymisation*) | N | Processing that prevents attribution to a data subject without additional information kept separately. **Trap:** the datum remains **personal**, and it remains within the scope of the regulation | [F03](03-il-dato-clinico.md) |
| **Pseudonimo** (*pairwise pseudonymous identifier*) | S | An opaque identifier that singles out a person without revealing their identity. **Trap:** it is unique **per provider and per service provider**, and therefore **not shareable** between systems: using it as a correlation key is a structural error | [F04](04-identita-e-anagrafiche.md) |
| **PSN - Polo Strategico Nazionale** | N | The infrastructure that hosts critical and strategic data and services of public administrations on national data centres | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **PSUR** (*periodic safety update report*) | N | Periodic safety update report (Reg. (EU) 2017/745, Art. 86); provided for from Class IIa upwards | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Punto di erogazione** (*point of delivery*) | S | The place, which may also be virtual, in which the organisation delivers. **Trap:** distinct from the session location address, which is where the patient is | [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Punto di ripristino** (*recovery point objective*, RPO) | S | The maximum quantity of data one accepts losing, expressed in time | [F11](11-fondamenti-informatici.md) |

### Q

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **QC1-QC4 / QI1-QI4** | N | The qualification levels of the Agenzia per la cybersicurezza nazionale, respectively for cloud services and for the infrastructures that host them | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Qualità del collegamento** (*connection quality*) | N | The evidence that the televisita report must carry, together with the confirmation of suitability for execution (Accordo 215/CSR 2020). **Trap:** it is a **mandatory content of the document**, not an internal product metric | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **`Quantity`** | S | FHIR data type: a measurement with a value, a unit readable by the human being and a **code** for the unit for the machine | [F06](06-fhir-da-zero.md) |
| **Quasi evento** (*near miss*) | S | An event that could have caused harm and did not. **Trap:** it is the most valuable source of learning, and a system that does not record it wastes the only free information it receives | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Quesito diagnostico** (*diagnostic question*) | N | The coded reason for the request; it is a field of the record layout of the televisita report | [DOM](/05_domain/04-documenti-clinici.md) |
| **`Questionnaire` / `QuestionnaireResponse`** | S | The definition of a structured questionnaire and a set of completed answers | [F06](06-fhir-da-zero.md) |
| **Quota capitaria** (*capitation*) | N | Funding proportionate to the number of registered patients, as an alternative to remuneration per service | [F01](01-sistema-sanitario-italiano.md) |

### R

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Radice di aggregato** (*aggregate root*) | S | The entity that is the **sole** point of access to an aggregate from outside | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md) |
| **Rapporto di verosimiglianza** (*likelihood ratio*) | S | The factor by which a test result multiplies the prior odds of disease; a property of the test alone | [F09](09-fondamenti-clinici.md) |
| **Rapporto tecnico di sessione** (*session technical report*) | P | A reconstructable summary of the quality, interruptions, fallbacks and channel changes of a service, usable in the clinical document and in complaint handling | [F14](14-flussi-funzionali.md) |
| **RBAC** (*role-based access control*) | S | Role-based access control. **Trap:** effective for coarse permissions, **insufficient** for the individual clinical resource, where what counts is the existence of the care relationship | [F12](12-crittografia-e-sicurezza.md) |
| **RdA / RdE - Regione di assistenza / Regione di erogazione** | N | Where the person is registered and where the service is delivered. **Trap:** they do not always coincide, and **both** must be represented: they are two distinct attributes of every service | [F01](01-sistema-sanitario-italiano.md), [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Realm** (*the national context of a guide*) | S | The legal and organisational context to which an implementation guide refers | [F05](05-standard-di-interoperabilita.md) |
| **Referto** (*report*) | N | A signed health document with the outcome and conclusions of an act, addressed to the patient and to the requester. **Trap:** for the televisita there exists a **documentary type of its own**, created by DM 19 novembre 2025, Art. 7, which does not coincide with the outpatient specialist report | [F01](01-sistema-sanitario-italiano.md), [F03](03-il-dato-clinico.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **`Reference`** | S | FHIR data type: a pointer to another resource | [F06](06-fhir-da-zero.md) |
| **Registro degli accessi** (*access log*) | P | An append-only chain with fingerprints, retained separately, which records who did what on which subject. **Trap:** it is **distinct from the application log and from the versioning of entities**: versioning does not make anything immutable, because whoever has write access to the database can alter the history tables too | [F12](12-crittografia-e-sicurezza.md), [F16](16-architettura-del-progetto.md), [SEC](/06_security/04-tracciamento.md) |
| **Registro delle violazioni** (*breach register*) | N | Mandatory documentation of **every** breach, including those not notified (Art. 33(5) of Regulation (EU) 2016/679) | [F03](03-il-dato-clinico.md) |
| **Relay dell'outbox** (*outbox relay*) | S | The separate process that reads the outbox table and publishes the events to the broker | [F11](11-fondamenti-informatici.md) |
| **Relazione clinica** (*clinical letter*) | P | A discursive communication between professionals about a case. **Trap:** it does not certify a test and it is not necessarily addressed to the patient | [F03](03-il-dato-clinico.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Relazione collaborativa** (*collaborative report*; a documentary type of Italian law) | N | The document produced by the teleconsulto or the teleconsulenza, conferred to the health record **as an attachment** to the document of the principal event. **Trap:** it is not a report, and calling it «teleconsulto report» is an error the decree contradicts | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Relazione di cura** (*care relationship*) | P | The documented link between a professional and a patient; it is the materialised fact that **founds access** to clinical data, with a condition of existence, a period and a source | [F12](12-crittografia-e-sicurezza.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Rendicontazione** (*reporting for reimbursement*) | N | The transmission of delivery data to the information flows, with tracing of the remote mode | [F01](01-sistema-sanitario-italiano.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Responsabile del trattamento** (*processor*) | N | Whoever processes personal data on behalf of the controller on the basis of an act under Art. 28 of Regulation (EU) 2016/679 | [F03](03-il-dato-clinico.md) |
| **Retroazione sul trasporto** (`transport-cc`) | S | Reporting of arrival times for all the connection's packets. **Trap:** it derives from an expired draft, and it is in any case what the browsers use | [F08](08-webrtc-da-zero.md) |
| **Rettifica** (*corrective reissue*) | P | The issue of a later version that voids and replaces the previous one, with a reason. **Trap:** it does not delete the previous one, which remains in the chain | [DOM](/05_domain/04-documenti-clinici.md) |
| **Revoca** (*revocation*) | S | The declaration that a certificate or a token is no longer valid before its expiry. **Trap:** a revoked certificate remains **cryptographically valid**: without revocation checking, the revocation does not exist | [F12](12-crittografia-e-sicurezza.md), [F13](13-protocolli.md) |
| **Riacutizzazione / esacerbazione** (*exacerbation*) | S | The rapid worsening of a chronic condition; the principal determinant of admission, often preceded by measurable signals | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Riavvio di ICE** (*ICE restart*) | S | New gathering and selection of paths without redoing the session. **Trap: it does not regenerate the keys** of the media | [F08](08-webrtc-da-zero.md) |
| **Ricetta dematerializzata** (*dematerialised prescription*) | N | An electronic prescription identified by the electronic prescription number, replacing the paper medium (DM 2 novembre 2011) | [F01](01-sistema-sanitario-italiano.md) |
| **Riconciliazione terapeutica** (*medication reconciliation*) | S | The systematic comparison between what the person actually takes and what is recorded as prescribed | [F09](09-fondamenti-clinici.md) |
| **Riferimento relativo / assoluto / logico / contenuto** | S | The four forms of pointing between FHIR resources: same server, another server, by business identifier, internal fragment | [F06](06-fhir-da-zero.md) |
| **Ripiego** (*fallback*) | P | Alternative behaviour when the main route is not available. In the clinical sphere: continuation of the service on a degraded channel, recorded with the reason and reported in the document. **Trap:** **it is not the same service**, and the document must say so | [F11](11-fondamenti-informatici.md), [F14](14-flussi-funzionali.md) |
| **Ripiego di canale** (*channel fallback*) | P | A declared passage from one channel to another during the act, recorded because it may affect the **nature** of the act and hence its accountability for reimbursement | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Ripiego in presenza** (*in-person fallback*) | N | The obligation to complete or reschedule the service in person, **with no additional charge**, when the remote channel does not allow its substantive content to be maintained | [F02](02-prestazioni-di-telemedicina.md) |
| **Ripristino selettivo** (*selective restore*) | P | Bringing the data of a single organisation back to an earlier instant without touching the others. **Trap:** a restore never tried does not exist | [F16](16-architettura-del-progetto.md) |
| **Riprogrammazione** (*rescheduling*) | P | A move that preserves the link to the original request and the chain of the appointments substituted | [DOM](/05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Rischio** (*risk*) | N | The combination of the probability of occurrence of the harm and its severity (ISO 14971) | [F10](10-percorsi-di-cura-e-sicurezza.md), [CMP](/08_compliance/05-gestione-del-rischio.md) |
| **Rischio clinico** (*clinical risk*) | S | The probability that a person suffers harm as a consequence of the care received | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Rischio residuo** (*residual risk*) | N | The risk that remains after the application of the control measures. **Trap:** it must be evaluated individually **and overall**, declared and communicated: it is not a value that goes to zero | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |
| **Riservatezza** (*confidentiality*) | S | The accessibility of information only to those authorised | [F12](12-crittografia-e-sicurezza.md) |
| **Risorsa** (*resource*, FHIR) | S | FHIR's unit of exchange: a self-contained domain object, with an identity and an address of its own | [F06](06-fhir-da-zero.md) |
| **Ritardo del consumatore** (*consumer lag*) | S | The difference between the last record written and the position reached by the consumer | [F11](11-fondamenti-informatici.md) |
| **Rotazione del segreto** (*secret rotation*) | P | The replacement of an exposed credential. **Trap:** it is necessary **even after the removal** of the secret from the code, because the repository history and the copies remain | [F17](17-ambiente-di-sviluppo.md) |
| **Rotazione delle chiavi** (*key rotation*) | S | The replacement of a key, with a period in which the old and the new coexist | [F13](13-protocolli.md) |
| **Rottura del vetro** (*break the glass*) | S | Emergency access that overrides ordinary authorisation, with mandatory justification, reinforced tracing, notification and subsequent verification. **Trap:** without the subsequent verification it is merely an authorisation that grants itself | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/02-identita-e-accessi.md) |
| **RPD / DPO - Responsabile della protezione dei dati** (*data protection officer*) | N | A function of supervision and a point of contact; mandatory for large-scale processing of special categories of data | [F03](03-il-dato-clinico.md) |
| **RTT** (*round-trip time*) | S | The round-trip time between two ends. **Trap:** in the media statistics it is read in the block relating to the remote inbound stream, not in the outbound ones | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **Ruolo organizzativo** (*practitioner role*) | S | The relation between professional and organisation, with discipline, deliverable services and **temporal validity** | [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **Ruolo unico di assistenza primaria** (an Italian institution of agreement-based medicine) | N | The figure that unifies the previous subdivisions of agreement-based general practice | [F01](01-sistema-sanitario-italiano.md) |

### S

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Saga** | S | A sequence of local transactions with compensations, an alternative to the distributed transaction | [F11](11-fondamenti-informatici.md) |
| **Sala d'attesa virtuale** (*virtual waiting room*) | P | The state of the encounter in which the person is connected, technically checked and awaiting admission, plus the associated queue. **Trap:** **it is not a dedicated media room**: modelling it as such doubles the media sessions for no reason | [DOM](/05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Sale** (*salt*) | S | A random value, unique per password, not secret, which prevents the precomputation of reusable tables | [F12](12-crittografia-e-sicurezza.md) |
| **SAML 2.0** | S | The identity federation standard based on signed XML documents. **Trap:** it is the only protocol usable **in production** for one of the two Italian public identity channels | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| **SAS** (*short authentication string*, short key verification string) | P | A short code derived from the fingerprints of the certificates, compared **aloud** by the two interlocutors at the start of the session. **Trap:** it is the only independent verification mechanism available, and it is what makes end-to-end encryption demonstrable; it is mandatory by default and it must be readable by a screen reader and never conveyed by colour alone | [F08](08-webrtc-da-zero.md), [F17](17-ambiente-di-sviluppo.md), [SEC](/06_security/05-sicurezza-del-tempo-reale.md) |
| **Scala clinica** (*clinical scale*) | S | An instrument that transforms observations into a comparable value. **Trap:** it has a validation, a reference population, a version **and a licence**: none of the four is optional and the last is the one that gets forgotten | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Scala di allerta precoce** (*early warning score*) | S | A scale that aggregates vital signs into a score tied to a frequency of reassessment and to a level of response | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **`Schedule` / `Slot`** | S | The FHIR resources for the availability calendar and for the individual bookable window | [F06](06-fhir-da-zero.md) |
| **Scompenso** (*decompensation*) | S | The condition in which the compensation mechanisms are no longer enough and the regulated quantity leaves the useful range | [F09](09-fondamenti-clinici.md) |
| **Scope** (in Italian *ambito di autorizzazione*) | S | The scope requested and granted to a token | [F13](13-protocolli.md) |
| **Scrittura obliqua** (*write skew*) | S | The anomaly in which two transactions that are individually correct produce an invalid global state | [F11](11-fondamenti-informatici.md) |
| **SDO** (*standards development organization*) | S | A body that produces technical specifications through a process of consensus among stakeholders | [F05](05-standard-di-interoperabilita.md) |
| **SDP** (*Session Description Protocol*) | S | The textual format that describes a media session: codecs, parameters, addresses, fingerprints (RFC 8866). **Trap:** it is **carried**, it does not carry: it is not a signalling protocol | [F08](08-webrtc-da-zero.md), [F13](13-protocolli.md) |
| **Second opinion** | N | An independent assessment, which the patient may also request, by a professional who **does not enter into the taking of the case on** | [F02](02-prestazioni-di-telemedicina.md) |
| **Segmento** (*segment*, HL7 v2) | S | A line of the message, identified by a three-character name | [F05](05-standard-di-interoperabilita.md) |
| **Segnalazione** (*signalling*) | S | The preliminary exchange between the two ends of the session descriptions and the candidates. **Trap: it is not standardised by WebRTC**: it is entirely the application's responsibility, and it is the point at which the man-in-the-middle attack inserts itself | [F08](08-webrtc-da-zero.md) |
| **Segnale** (*sign*) | S | A manifestation detectable by the observer; its source is the professional. **Trap:** distinct from the symptom, whose source is the patient; the source is an attribute of the datum, not a detail | [F09](09-fondamenti-clinici.md) |
| **Segnale d'allarme** (*red flag*) | S | A clinical element whose presence requires leaving the remote channel. **Trap:** it is **highly sensitive and poorly specific by construction**: it will produce false positives, and this is the intended behaviour | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Segretezza in avanti** (*forward secrecy*) | S | The property whereby the future compromise of the long-term key does not expose past sessions | [F12](12-crittografia-e-sicurezza.md), [F13](13-protocolli.md) |
| **Seme del generatore** (*generator seed*) | P | The value that determines the synthetic dataset produced. **Trap:** it must be recorded in every issue report, because it is what makes the case reproducible | [F17](17-ambiente-di-sviluppo.md) |
| **Sensibilità** (*sensitivity*) | S | The proportion of really positive cases that the test or the rule identifies. **Trap:** it is a property of the test, **independent of the prevalence**; high sensitivity means few false negatives, not few false alarms | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Separazione dei compiti** (*separation of duties*) | S | No single subject can complete a critical operation alone. **Trap:** some records of the quality management system require **different** subjects, and no amount of individual work produces them | [F12](12-crittografia-e-sicurezza.md), [CMP](/08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **Separazione dei domini** (*domain separation*) | S | The derivation of distinct keys for distinct uses, so that the compromise of one use does not extend to the others | [F12](12-crittografia-e-sicurezza.md) |
| **Serie temporale** (*time series*) | S | A succession of measurements of the same phenomenon over time, with a usage profile of its own | [F11](11-fondamenti-informatici.md) |
| **Service Provider / Identity Provider** | S | Whoever provides the service and whoever authenticates the user asserting their identity. **Trap:** in a public federation the service provider is **the party that provides the service online**, that is, the deployer, not whoever writes the software | [F13](13-protocolli.md), [F04](04-identita-e-anagrafiche.md) |
| **Servizi minimi** (*minimum services*) | N | The four services the regional telemedicine infrastructure must deliver: televisita, teleconsulto and teleconsulenza, telemonitoraggio, teleassistenza (DM 21 settembre 2022) | [F02](02-prestazioni-di-telemedicina.md) |
| **Sessione applicativa** (*application session*) | P | A user's access session to the system. **Trap:** one of the three things Italian calls «sessione»; see the section on context-dependent terms | [DOM](/05_domain/01-linguaggio-ubiquo.md) |
| **Sessione media** (*media session*) | P | An instance of real-time connection between participants. **Trap:** it is an **aggregate distinct from the encounter**: an encounter may have several media sessions, and a dropped media session does not close the encounter | [F14](14-flussi-funzionali.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Sezione media** (`m=`) | S | The block of the SDP that describes a stream: type, codecs offered, direction, attributes | [F08](08-webrtc-da-zero.md) |
| **Setting di erogazione** (*care setting*) | P | The organisational context of delivery. **Trap: it discriminates rules** - obligation to produce a report, need for a prescription, regime of accounting - and it is therefore not a descriptive label | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **SFrame** | S | Authenticated encryption of frames on top of SRTP (RFC 9605). **Trap: it does not define key management**, which remains entirely the application's responsibility | [F08](08-webrtc-da-zero.md) |
| **Sicura** (*safe*, of an HTTP method) | S | Said of a method that does not modify the server's state | [F13](13-protocolli.md) |
| **Sicurezza a livello di riga** (*row level security*) | S | The filter applied by the database engine to every query, on the basis of the session context. **Trap:** in the project it is the **second** barrier, not the sole mechanism, and in the absence of context it **denies everything**, on purpose | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](/02_architecture/05-multi-tenancy.md) |
| **Sigillo periodico** (*periodic seal*) | P | The fingerprint of the chain, signed, timestamped and deposited with a distinct party | [F12](12-crittografia-e-sicurezza.md) |
| **Sindrome** (*syndrome*) | S | A set of signs and symptoms that recur together. **Trap:** it is not a diagnosis of cause | [F09](09-fondamenti-clinici.md) |
| **Sintomo** (*symptom*) | S | A manifestation reported by the patient and not directly observable. **Trap:** distinct from the sign; the source of the datum changes its clinical weight and must be represented | [F09](09-fondamenti-clinici.md) |
| **Sistema TS - Sistema Tessera Sanitaria** | N | The Ministry of Economy and Finance's infrastructure provided for by Art. 50 of D.L. 269/2003, on which the national interoperability infrastructure of the health record is built; it also manages the dematerialised prescription and health expenses | [F01](01-sistema-sanitario-italiano.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Situazione pericolosa** (*hazardous situation*) | N | The circumstance in which people, property or the environment are exposed to one or more hazards (ISO 14971) | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |
| **SIU** | S | The family of HL7 v2 messages for appointment scheduling | [F05](05-standard-di-interoperabilita.md) |
| **Slicing** | S | The partition of a repeated element of a profile into subsets with constraints of their own | [F06](06-fhir-da-zero.md) |
| **Slot** | S | The elementary time interval of a diary. **Trap:** an occupied slot **is not** an appointment: it is its projection onto the diary, and merging them makes controlled overbooking impossible and produces double booking under concurrency | [DOM](/05_domain/01-linguaggio-ubiquo.md) |
| **SMART on FHIR** | S | A profile of OAuth 2.0 that adds clinical context, FHIR scopes and standardised discovery | [F13](13-protocolli.md), [INT](/07_integration/03-integrazione-per-api.md) |
| **SNI** (*server name indication*) | S | The name of the service requested, sent **in the clear** in the first message of the TLS handshake | [F13](13-protocolli.md) |
| **SNOMED CT** | S | An extensive clinical terminology. **Trap:** in Italy it is subject to a costly licence and **the project does not distribute, does not download and does not report any of its content**; the system is fully functional without it, at the declared cost of not validating certain bindings | [F05](05-standard-di-interoperabilita.md), [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **Soggetto aggregatore / aggregato** | N | The scheme that allows a party to join the public identity federation through a third party already accredited, without going through the procedure itself | [F04](04-identita-e-anagrafiche.md) |
| **Soglia clinica** (*clinical threshold*) | P | The reference value for a parameter of a **single** patient, configured by the professional. **Trap: never hard-wired, never deduced by the system, never exposed to a tenant administrator.** It is an individual clinical decision | [DOM](/05_domain/05-parametri-e-osservazioni.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Soglia tecnica** (*technical threshold*) | P | A reference value on the quality of the channel. **Trap:** it is a **configurable product specification**, not a regulatory requirement: no technical threshold is imposed by Italian legislation | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/01-linguaggio-ubiquo.md) |
| **Soluzioni tecnologiche AGENAS** | N | Components for formal and semantic checking, conversion into the standard formats and sending to the health data ecosystem; they operate **without persistence** of the data processed | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **Sorgente sintetica di media** (*fake media device*) | P | A deterministic audio or video stream that replaces camera and microphone in the automated tests | [F17](17-ambiente-di-sviluppo.md) |
| **Sorveglianza del volume atteso** (*expected volume monitoring*) | P | The comparison between the measurements expected and those received in a window, in order to detect **collective silence** before the individual absences. **Trap:** it is distinct from monitoring per individual patient, and it intercepts failures that the latter does not see | [DOM](/05_domain/05-parametri-e-osservazioni.md), [F14](14-flussi-funzionali.md) |
| **Sorveglianza post-commercializzazione** (*post-market surveillance*) | N | The systematic collection and analysis of data on quality, performance and safety throughout the life of the device (Reg. (EU) 2017/745, Arts. 83–86) | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Sospetto diagnostico** (*suspected diagnosis*) | S | The hypothesis that motivates an investigation. **Trap:** it is an entity distinct from the diagnosis, with an author and a life cycle of its own; representing it in the same field as the diagnosis produces diagnoses that nobody has ever formulated | [F09](09-fondamenti-clinici.md) |
| **SOUP** (*software of unknown provenance*) | N | A software item already available, not developed for that device, or lacking adequate records of the development processes (IEC 62304 § 3.29). **Trap:** its management is a **formal obligation**, not a good practice, and taking stock of it after the fact costs many times as much | [F12](12-crittografia-e-sicurezza.md), [F13](13-protocolli.md), [F15](15-regolatorio-da-zero.md) |
| **Specialista ambulatoriale interno** (an Italian institution of agreement-based medicine) | N | A professional under an hourly agreement working in the health authority's clinics; distinct from the employed specialist doctor | [F01](01-sistema-sanitario-italiano.md) |
| **Specifica** (*base standard*) | S | The document that defines the general model, deliberately permissive so as to hold in every context. **Trap:** a base specification is not implementable without a profile: the permissiveness is intended and must be restricted | [F05](05-standard-di-interoperabilita.md) |
| **Specificità** (*specificity*) | S | The proportion of really negative cases correctly excluded. **Trap:** high specificity means few false positives, and it has nothing to do with sensitivity | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **SPID - Sistema pubblico di identità digitale** (an Italian institution) | N | A federation of several accredited identity providers. **Trap:** the order in which providers are presented is compulsorily random; with the higher levels there is no shared session; and **in production it is usable only in SAML 2.0** | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **SRN** (*single registration number*) | N | The unique registration number of the economic operator in the European database on medical devices | [F15](15-regolatorio-da-zero.md) |
| **SRTP** (*Secure Real-time Transport Protocol*) | S | The format that encrypts and authenticates the real-time media packets (RFC 3711) | [F08](08-webrtc-da-zero.md) |
| **SSN - Servizio sanitario nazionale** (*Italian National Health Service*) | N | The complex of functions, structures, services and activities intended for the health of the whole population (L. 833/1978) | [F01](01-sistema-sanitario-italiano.md) |
| **SSRF** (*server-side request forgery*) | S | Inducing a server to call a destination chosen by the attacker, typically an internal one | [F13](13-protocolli.md), [SEC](/06_security/06-sicurezza-applicativa.md) |
| **Standard** | S | A document published by a recognised body that describes a format, a protocol or a model | [F13](13-protocolli.md) |
| **Standard di fatto** (*de facto standard*) | S | A widespread convention that no body has regulated. **Trap:** widespread does not mean regulated, and citing it as a standard in a regulatory document is an error | [F13](13-protocolli.md) |
| **Stanza laterale** (*breakout room*) | P | A private discussion between professionals that temporarily excludes the patient. **Trap: always announced, never silent**, and recorded | [DOM](/05_domain/02-le-prestazioni-modellate.md), [F14](14-flussi-funzionali.md) |
| **Stato del contatto** (*encounter state*) | P | Where the encounter is in its life cycle. **Trap:** distinct from the **outcome**, which instead says how the act ended | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Stato di risoluzione** (*resolution status*) | P | The outcome of the attempt to resolve a code: resolved, system switched off, service unreachable, code not found. **Trap:** the four outcomes are different and must be distinguished, because three of them are not defects of the datum | [DOM](/05_domain/07-terminologie-nel-dominio.md) |
| **`statusHistory`** | S | The trajectory of the statuses of an encounter, with their respective periods | [F06](06-fhir-da-zero.md) |
| **STP - Straniero Temporaneamente Presente** (a code of Italian law) | N | The code of entitlement to care provided for by Art. 35 of d.lgs. 286/1998 for a foreign national not compliant with the rules on entry and residence; sixteen characters, assigned locally, with a temporal validity | [F04](04-identita-e-anagrafiche.md) |
| **STRIDE** | S | A threat modelling method in six categories, each the negation of a security property | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/01-modello-di-minaccia.md) |
| **`StructureDefinition`** | S | The FHIR resource that defines a structure: base resource, profile, extension or data type | [F06](06-fhir-da-zero.md) |
| **Structured Fields** | S | The regulated grammar for the values of HTTP headers (RFC 9651) | [F13](13-protocolli.md) |
| **Struttura erogante** (*delivering organisation*) | N | The legal person responsible for delivery. **Trap:** **it does not coincide with the tenant**, which is a boundary of technical isolation: a tenant may contain several delivering organisations | [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **STUN** (*Session Traversal Utilities for NAT*) | S | The protocol for discovering one's own public address (RFC 8489) | [F08](08-webrtc-da-zero.md) |
| **`Subscription`** | S | The FHIR resource for subscribing to event notifications; in the version adopted it has known structural limits | [F06](06-fhir-da-zero.md) |
| **Superficie di attacco** (*attack surface*) | S | The set of points at which an adversary can interact with the system; it is reduced by eliminating, restricting, hardening | [F12](12-crittografia-e-sicurezza.md) |

### T

> **A warning about the names of the telemedicine services.** Televisita, teleconsulto,
> teleconsulenza, teleassistenza, telemonitoraggio, telerefertazione, telecontrollo and
> teleriabilitazione **are institutions of Italian law**, defined by the State-Regions Agreement
> 215/CSR of 2020 and by the subsequent instruments. The current English translations -
> *video visit*, *teleconsultation*, *tele-advice*, *tele-care*, *remote patient monitoring* - **are
> not exact equivalents**: they designate organisational practices, not legal categories, and they
> do not carry with them either the limits on deliverability, or the documentary obligations, or
> the regime of accounting that the Italian definition entails. In the project's English
> documentation the Italian term remains in its original form, with the explanation following; in
> the code the translation is not used in place of the name of the legal category.

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Taccuino personale dell'assistito** (*patient's personal notebook*) | N | The section of the health record fed by the citizen. **Trap:** its contents **are not clinical data certified by a professional**, and treating them as such is an error of model even before it is an error of security | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **TEAM - Tessera europea di assicurazione malattia** (*European Health Insurance Card*) | N | The identifier, carried on the back of the health card, attesting entitlement to care in another Member State | [F04](04-identita-e-anagrafiche.md) |
| **Teleassistenza** (*tele-care*; **not an exact English equivalent**, see the warning) | N | A professional act pertaining to the **non-medical** health professions, with the patient or with the carer, predominantly scheduled and repeatable. **Trap:** in computing «teleassistenza» means remote technical support to the user: they are two different things and they must never be called by the same word | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Teleconsulenza medico-sanitaria** (*tele-advice*; **not an exact English equivalent**) | N | Remote support between health professionals **with different responsibilities**, always scheduled. **Trap:** it may **not** be used in place of rescue | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Teleconsulto** (*physician-to-physician teleconsultation*; **not an exact English equivalent**) | N | An act between two or more **doctors** on a person's clinical situation, synchronous or asynchronous. **Trap: it does not give rise to an autonomous report**; it produces a collaborative report conferred as an attachment to the document of the principal event | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Telecontrollo medico** (*medical tele-check*; **not an exact English equivalent**) | N | A medical service with scheduled contacts by video call and the sharing of data collected at the patient's home. **It is in the fee schedule**, and therefore tariffed | [F02](02-prestazioni-di-telemedicina.md) |
| **Telecooperazione sanitaria** (*tele-cooperation*; **not an exact English equivalent**) | N | Remote assistance to an operator engaged in an act in progress. **Trap:** it is outside the perimeter in the current version of the project | [F02](02-prestazioni-di-telemedicina.md) |
| **Telemedicina** (*telemedicine*) | N | A mode of delivering health services at a distance. **Trap:** it is a **channel**, not a specialty: there is no «telemedicine doctor», there is the doctor of a specialty who delivers at a distance | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/01-linguaggio-ubiquo.md) |
| **Telemonitoraggio** (*remote patient monitoring*; **not an exact English equivalent**) | N | The remote measurement and transmission of vital and clinical parameters through sensors, inside a plan and with thresholds configured by the professional. **Trap:** the intended purpose frozen by the project is **deferred collection for the professional's periodic review**; no function may move the system towards clinical real time, and the assessment must be made before the function is written | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **Telerefertazione** (*tele-reporting*; **not an exact English equivalent**) | N | An asynchronous report on an examination already acquired, with the validated digital signature of the responsible doctor. **Trap:** it is not the transport of the report from one place to another | [F02](02-prestazioni-di-telemedicina.md) |
| **Teleriabilitazione** (*telerehabilitation*; **not an exact English equivalent**) | N | Remote delivery of rehabilitation interventions, framed within the individual rehabilitation project, with a tariff equivalent to in person (Accordo 231/CSR 2021) | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/08-percorsi-e-piani-di-cura.md) |
| **Televisita** (*video visit*; **not an exact English equivalent**) | N | A **medical** act in real time with the patient, which closes with a report. **Trap:** it is limited to the follow-up of patients whose diagnosis has already been formulated in person, and it is not admitted in urgency or emergency; a video call between doctor and patient is not automatically a televisita | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Tempo di ripristino** (*recovery time objective*, RTO) | S | The maximum time within which the service must become available again | [F11](11-fondamenti-informatici.md) |
| **Tempo di sistema** (*transaction time*) | S | The instant at which the system came to know of a fact | [F11](11-fondamenti-informatici.md) |
| **Tempo di validità** (*valid time*) | S | The instant or interval in which a fact is true in the world | [F11](11-fondamenti-informatici.md) |
| **Tenant** | P | The boundary of logical isolation of data and configuration. **Trap:** **it does not coincide** with the organisation, nor with the delivering organisation, nor with the integrator: four concepts that coincide in the simple cases and diverge in the real ones | [F11](11-fondamenti-informatici.md), [F16](16-architettura-del-progetto.md), [ARC](/02_architecture/05-multi-tenancy.md) |
| **Tendenza** (*trend*) | S | A consistent variation in the same direction over a defined window, beyond the expected variability. **Trap:** it requires three parameters of clinical configuration and it is not deducible from the datum alone | [F09](09-fondamenti-clinici.md) |
| **Terminology guard** (in Italian *controllo terminologico*) | P | The automatic check in continuous integration that makes the build fail if forbidden terminological content comes back into the repository, on the basis of a versioned allow-list | [F05](05-standard-di-interoperabilita.md), [F17](17-ambiente-di-sviluppo.md) |
| **Terzo in sessione** (*third party in session*) | P | A party who accesses health content without being part of the care relationship: interpreter, trainee, carer. **Trap:** their presence is not an organisational detail, it is an access to health data and it must be traced as such | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Tessera sanitaria** (*Italian health insurance card*) | N | The physical medium provided for by Art. 50 of D.L. 269/2003 that exposes the tax code. **Trap: it does not introduce a new identifier**, and reading it with a barcode scanner **is not authenticating** | [F04](04-identita-e-anagrafiche.md) |
| **Tesserino dispositivi** (*device card*; a documentary type of Italian law) | N | The document signed by the professional who assigns a remote monitoring device, with unique identifier, manufacturer and technical parameters (DM 19 novembre 2025, Annex 1) | [F02](02-prestazioni-di-telemedicina.md), [DOM](/05_domain/04-documenti-clinici.md) |
| **Ticket** (*co-payment*) | N | The share of the cost borne by the patient. **Trap: it is not the price of the service**, and in computing the same word indicates a support request: it must always be qualified | [F01](01-sistema-sanitario-italiano.md) |
| **Timeout** | S | The time beyond which one stops waiting for a response | [F11](11-fondamenti-informatici.md) |
| **Titolare del trattamento** (*data controller*) | N | The party that determines the purposes and means of the processing and is answerable for it. **Trap:** for the purpose of care it is whoever draws up the data and the documents, not whoever supplies the infrastructure | [F03](03-il-dato-clinico.md), [DOM](/05_domain/06-consenso-e-riservatezza.md) |
| **Token Exchange** | S | The exchange of one token for another, valid in another domain (RFC 8693). **Trap:** in the project delegation is **always** represented with the `act` claim, never with impersonation | [F13](13-protocolli.md), [INT](/07_integration/06-identita-e-delega.md) |
| **Traccia** (*trace*) | S | The representation of the path of a single request through the components it traversed | [F11](11-fondamenti-informatici.md), [TEC](/01_technical/06-osservabilita.md) |
| **Tracciabilità** (*traceability*) | S | A chain walkable **in both directions** between domain rule, requirement, design, code, test and risk control measure. **Trap:** it is not reconstructable after the fact; its final addressee is not an assessor, it is the patient | [F11](11-fondamenti-informatici.md), [F15](15-regolatorio-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **Transazione** (*transaction*, IHE) | S | A specific exchange between two actors, with precise format, protocol and error rules | [F05](05-standard-di-interoperabilita.md) |
| **Transazione / lotto** (*transaction / batch*, FHIR) | S | An atomic set that fails entirely / a set processed entry by entry | [F06](06-fhir-da-zero.md) |
| **Trasmissione discontinua** (`usedtx`) | S | The suspension of audio sending during silence. **Trap:** the project disables it for clinical reasons: silence, in a remote assessment, may be information | [F08](08-webrtc-da-zero.md) |
| **Trasparenza dei certificati** (*certificate transparency*) | S | Public and verifiable registers of the certificates issued, which make anomalous issuance detectable (RFC 6962, RFC 9162) | [F12](12-crittografia-e-sicurezza.md) |
| **Triage** | S | The process of assigning temporal priority for assessment on the basis of the risk of deterioration while waiting. In Italy it is articulated on five levels `[NV]` `FUNZ` must verify | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Trickle ICE** | S | Sending the candidates as they are discovered, instead of waiting for the end of gathering (RFC 8838) | [F08](08-webrtc-da-zero.md) |
| **Trigger event** (in Italian *evento scatenante*) | S | The real-world fact that causes an HL7 v2 message to be sent | [F05](05-standard-di-interoperabilita.md) |
| **Trial use / STU / Trial Implementation** | S | The maturity status of a specification: published and usable, but **explicitly subject to change**. **Trap:** it must always be cited together with the status, and the versions must be pinned | [F05](05-standard-di-interoperabilita.md) |
| **Trust anchor** (in Italian *ancora di fiducia*) | S | An issuer recognised as trusted for a tenant, with identifier, keys and admitted algorithms | [F13](13-protocolli.md) |
| **TS-CNS** | N | The health card fitted with the national services card microchip; an identity under Art. 64 of the Codice dell'Amministrazione Digitale, implemented with mutual TLS authentication. **Trap:** it is the only channel free of external dependencies and with no cost per login, and for this reason it is mandatory in the project, not optional | [F04](04-identita-e-anagrafiche.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| **TURN** (*Traversal Using Relays around NAT*) | S | The protocol for borrowing an address from a server that forwards the packets (RFC 8656) | [F08](08-webrtc-da-zero.md) |

### U

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **UCA - Unità di continuità assistenziale** (*continuity of care unit*; an Italian institution of DM 77/2022) | N | A mobile team for situations of high clinical and care complexity | [F01](01-sistema-sanitario-italiano.md) |
| **UCUM** (*Unified Code for Units of Measure*) | S | The standard coding of units of measurement; it is the form in which the unit enters the data model. **Trap:** redistributable verbatim, but derivatives are forbidden and the licence is revocable | [F05](05-standard-di-interoperabilita.md), [F09](09-fondamenti-clinici.md) |
| **UDI / UDI-DI / UDI-PI** (*unique device identification*) | N | The system of unique identification of the device. **Trap:** for software the production part corresponds to the **version** | [F02](02-prestazioni-di-telemedicina.md), [F15](15-regolatorio-da-zero.md) |
| **UDP** (*User Datagram Protocol*) | S | The minimal transport protocol: no connection, no acknowledgement, no ordering. **Trap:** it is precisely what real time needs, and it looks like a defect only to those who come from transactional applications | [F08](08-webrtc-da-zero.md) |
| **Unità di misura codificata** (*coded unit*) | S | The code of the unit, **never a free string**; mandatory for every numerical value | [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **URI canonico** (*canonical URI*) | S | The global and stable identifier of an artefact or of a code system. **Trap: it is not an address to visit**, and it may remain unchanged even when the site that hosted it changes | [F05](05-standard-di-interoperabilita.md) |
| **Uso anomalo** (*abnormal use*) | N | Intentional and unjustifiable violation of the intended use (IEC 62366-1). **Trap:** it is outside the perimeter of the usability standard but **inside** that of risk management | [F10](10-percorsi-di-cura-e-sicurezza.md), [F15](15-regolatorio-da-zero.md) |

### V

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **Validatore** (*validator*, HTTP) | S | `ETag` or `Last-Modified`: they allow the server to answer that nothing has changed without retransmitting the content | [F13](13-protocolli.md) |
| **Validazione clinica** (*clinical validation of a document*) | N | The act by which the professional declares the content definitive and assumes responsibility for it. **Trap:** it is **distinct from the signature**, which is the legal act, and very distinct indeed from the formal validation of a resource | [F03](03-il-dato-clinico.md) |
| **Validazione formativa / sommativa** (*formative / summative evaluation*) | N | Usability evaluations respectively during development and before release, the latter with representative users under a protocol. **Trap:** representative users include older people and people with disabilities; they are not an edge case, they are the reference population | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/06-usabilita-e-accessibilita.md) |
| **Valore aggregato** (*aggregated value*) | P | An entity distinct from the measurement, with function, window, number of measurements included **and number of expectations not satisfied**. **Trap:** an average that does not declare how many measurements are missing is a number without clinical meaning | [DOM](/05_domain/05-parametri-e-osservazioni.md) |
| **Valore critico** (*critical value*) | S | A result indicating a potentially life-threatening condition and requiring immediate and verified communication. **Trap:** it is **defined by the source**, not deduced by the system | [F09](09-fondamenti-clinici.md) |
| **Valore predittivo positivo** (*positive predictive value*) | S | The probability that the condition is present given a positive result, or that the event is really in progress given an alarm. **Trap: it depends on the prevalence**, not on the sensitivity alone: it is the reason why a sensitive rule applied to a low-risk population produces mostly false alarms | [F09](09-fondamenti-clinici.md), [F10](10-percorsi-di-cura-e-sicurezza.md) |
| **Valore predittivo negativo** (*negative predictive value*) | S | The probability that the condition is absent given a negative result; it depends on the prevalence | [F09](09-fondamenti-clinici.md) |
| **`ValueSet` / `CodeSystem`** | S | A selection of codes for a specific use / the definition of the codes and of their meaning | [F06](06-fhir-da-zero.md) |
| **Valutazione clinica** (*clinical evaluation*) | N | The process that demonstrates performance and benefits on clinical data (Reg. (EU) 2017/745, Art. 61 and Annex XIV). **Trap:** Class IIa does not require a clinical investigation but it does require an autonomous documentary path with a timescale of its own, to be started in parallel with development and not downstream of it | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/07-valutazione-clinica.md) |
| **Valutazione della conformità** (*conformity assessment*) | N | The procedure by which compliance with the applicable requirements is demonstrated; for Class IIa, Annex IX Chapters I and III plus Section 4, or Annex XI | [F15](15-regolatorio-da-zero.md) |
| **Valutazione di eseguibilità** (*feasibility assessment*) | P | An act with **three independent outcomes**: clinical usefulness, clinical safety, digital readiness. **Trap:** the three outcomes do not add up into a single judgement, and a single negative outcome may be enough to exclude the remote channel | [DOM](/05_domain/02-le-prestazioni-modellate.md) |
| **Variabilità circadiana** (*circadian variability*) | S | The oscillation with an approximately daily period of many physiological quantities. **Trap:** it is **structure, not noise**: eliminating it with a filter eliminates clinical information | [F09](09-fondamenti-clinici.md) |
| **`Vary`** | S | The header that declares which headers of the request determined the response; indispensable to the caches | [F13](13-protocolli.md) |
| **Verbale di pronto soccorso** (*emergency department record*) | N | The document attesting attendance at the emergency department, the triage, the investigations, the diagnosis and the outcome | [F03](03-il-dato-clinico.md) |
| **Verifica della revoca** (*revocation checking*) | S | The check that a certificate has not been revoked, with lists downloaded periodically or online querying. **Trap:** in the event of unavailability of the service the project adopts **fail-closed**, that is, it denies access | [F04](04-identita-e-anagrafiche.md) |
| **Versionamento** (*versioning*) | S | The identified and retrievable succession of the states of an entity or of a contract. **Trap:** the versioning of entities **does not make immutable** what it versions; for immutability a chain of fingerprints retained separately is needed | [F11](11-fondamenti-informatici.md) |
| **Versione del documento** (*document version*) | P | An element of the immutable chain of a clinical document, with a reference to the previous version and a reason | [DOM](/05_domain/04-documenti-clinici.md) |
| **Versione flottante** (*floating version*) | S | A dependency declared without a version number. **Trap:** it makes the build non-reproducible, and in a regulated context it means that one does not know what has been verified | [F06](06-fhir-da-zero.md), [F17](17-ambiente-di-sviluppo.md) |
| **`versionId`** | S | The version number of the resource on the FHIR server; the basis of optimistic concurrency control | [F06](06-fhir-da-zero.md) |
| **Veste professionale** (*professional capacity*) | P | The relation between person, organisation and specialty, with temporal validity. **Trap:** permissions follow the capacity, **not the person**: the same person has different permissions in different capacities, and an expired capacity no longer authorises anything | [F16](16-architettura-del-progetto.md), [DOM](/05_domain/03-assistito-professionista-organizzazione.md) |
| **VEX** (*vulnerability exploitability exchange*) | S | The document that declares whether a known vulnerability of a dependency is actually exploitable in the product | [F12](12-crittografia-e-sicurezza.md), [SEC](/06_security/07-catena-di-fornitura.md) |
| **Vettore di inizializzazione** (*initialisation vector*) | S | A variable and public value that makes two encryptions of the same text with the same key different | [F12](12-crittografia-e-sicurezza.md) |
| **Vigilanza** (*vigilance*) | N | Reporting of serious incidents and field safety corrective actions (Reg. (EU) 2017/745, Arts. 87–92), with deadlines differentiated by seriousness | [F15](15-regolatorio-da-zero.md), [CMP](/08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Violazione dei dati personali** (*personal data breach*) | N | Unauthorised destruction, loss, alteration, disclosure or access. **Trap:** **it is not only data leakage**: the loss of availability is a breach to all intents and purposes | [F03](03-il-dato-clinico.md), [SEC](/06_security/10-risposta-agli-incidenti.md) |
| **Voucher** (in the national data platform) | N | The authorisation token issued to the consuming party, presented to the provider to demonstrate the authorisation | [F07](07-fse-e-infrastrutture-nazionali.md) |
| **VP8 / VP9 / H.264 / AV1** | S | Video codecs. **Trap:** only some of them are mandatory for interoperability (RFC 7742), and assuming the availability of the others produces sessions that do not establish on certain devices | [F08](08-webrtc-da-zero.md) |
| **`VR`** | S | The FHIR encounter class code that denotes the non-co-present mode | [F06](06-fhir-da-zero.md) |

### W-Z

| Term | Nat. | Definition | Where |
|---|---|---|---|
| **WebRTC** (*Web Real-Time Communication*) | S | The set of W3C and IETF specifications that allow a browser to establish an audio, video and data session in real time with another endpoint | [F08](08-webrtc-da-zero.md) |
| **Webhook** | S | An HTTP notification sent by the producer to an address supplied by the consumer | [F13](13-protocolli.md), [PRO](/04_protocols/07-eventi-e-webhook.md) |
| **XML Signature Wrapping** | S | An attack in which the signature stays valid but covers a fragment different from the one actually processed. **Trap:** it is the family of attacks that the Italian public identity conformance suite verifies specifically, and it must be passed in full | [F13](13-protocolli.md), [F04](04-identita-e-anagrafiche.md) |

---

## 3. False synonyms

These are pairs - or triples, or quadruples - of terms that current language swaps and that the
model cannot swap. It is not pedantry: each of these distinctions corresponds to an aggregate
boundary, to an authorisation constraint, to an accounting rule or to a safety requirement. For
each one, **why the two terms get confused** and **what breaks** when the confusion enters the code
are set out.

The first fourteen are already identified by the domain area, in the
[chapter on the ubiquitous language](/05_domain/01-linguaggio-ubiquo.md) § 5, and are taken up
here in summary form with the pointer. The ones that follow emerge from the other modules of this
guide.

### 3.1 The fourteen pairs of the domain area

**1. Assistito and paziente.**
*Why they get confused:* in everyday speech they designate the same person, and in many sentences
they are interchangeable without anybody noticing.
*What breaks:* the rules of access to administrative data - exemptions, contact details, choice of
doctor - and those of access to clinical data have different domains. A front-desk operator works
on the assistito and must not be able to work on the paziente. With a single entity and a single
set of permissions, the separation has to be rebuilt by hand on every field, and sooner or later a
field is forgotten.

**2. Prestazione richiesta, prestazione eseguita, prestazione addebitata.**
*Why they get confused:* Italian calls them all «prestazione».
*What breaks:* they are three entities with distinct life cycles, authors and states. The request
originates with the prescriber and may never be performed; the performance originates with the
provider and may occur without a request; the charge originates with the administration and may not
follow the performance, for example in *specialist-to-specialist consultation (teleconsulto)*, which is not tariffed. A single
«prestazione» entity makes it impossible to represent all three legitimate cases.

**3. Erogata, refertata, consegnata, rendicontata.**
*Why they get confused:* they look like automatic phases of the same thing.
*What breaks:* none implies the next. Delivered and not reported is a visible non-performance;
reported and not delivered to the patient may be a legitimate clinical choice; delivered to the
patient and not accounted for is an administrative problem, not a clinical one. A single `stato`
field with a value «completata» means four different things depending on who reads it.

**4. Autenticazione and identificazione.**
*Why they get confused:* both answer, apparently, the question «who is this person».
*What breaks:* authentication ascertains possession of a credential and is a check by the system;
identification ascertains that the person in front of the camera is the expected one and is **an
act of the professional**. A system that treats the first as the second has a defect that shows
itself the day a family member connects with the patient's credentials and the session comes out
duly identified.

**5. Consenso all'atto sanitario and consenso al trattamento dei dati.**
*Why they get confused:* they are often collected at the same moment and with the same gesture.
*What breaks:* they have a different legal nature, different effects and different revocability.
Merging them makes revocation ungovernable, because revoking consent to the act interrupts the
care, whereas revoking a consent to an ancillary processing must not.

**6. Caregiver and rappresentante legale.**
*Why they get confused:* both «take care» of the person and are often present together.
*What breaks:* **assisting is not representing.** The carer cannot give consent in place of a
person with capacity, in any configuration. An additional and subtler error: treating the
amministratore di sostegno as a guardian, when their powers are delimited by the decree of
appointment and may not include healthcare decisions.

**7. Bozza and referto.**
*Why they get confused:* current language says «the report is in draft».
*What breaks:* the model that follows the language creates a report with the status «draft», and
sooner or later somebody extracts documents from that list without filtering the status. A draft is
not visible to the patient, it is not transmissible, it is not retained as a health document.

**8. Oscuramento and cancellazione.**
*Why they get confused:* both «make something disappear» from view.
*What breaks:* suppression makes a document invisible to particular parties, it does not delete it
and it does not withdraw it from whoever produced it. Deletion is another thing and in the health
sector it meets the limits of the retention obligations. Implementing suppression as deletion
destroys health documentation; implementing deletion as suppression does not satisfy the right
exercised.

**9. Fascicolo, dossier, cartella.**
*Why they get confused:* all three are «where the patient's data are».
*What breaks:* they are three containers at three scales, with three regimes of access. The
national electronic health record is national-regional and under the patient's control; the
organisational health record is the set of data at a single organisation; the electronic clinical
record is the repository of the individual provider and, in the project's integration model, stays
with the integrator's system. Confusing them produces transmissions to the wrong place.

**10. Slot and appuntamento.**
*Why they get confused:* in the interface they occupy the same box.
*What breaks:* an occupied slot is the **projection** of the appointment onto the diary, not the
appointment. Merging them makes it impossible to represent controlled overbooking and produces,
under concurrency, double booking.

**11. Soglia tecnica and soglia clinica.**
*Why they get confused:* they are both called «soglia» and they end up in the same configuration
panel.
*What breaks:* the technical threshold concerns the channel and is a product specification
configurable per tenant; the clinical threshold concerns a parameter of the person and is
configuration **per patient**, decided by the professional. Calling them both «soglia» in a single
module is the error that leads to exposing to a tenant administrator a field that is an individual
clinical decision.

**12. Allarme tecnico and allarme clinico.**
*Why they get confused:* they are both notifications arriving from the same system.
*What breaks:* they have different recipients by law - the technical one to the Centro servizi, the
clinical one to the Centro erogatore. A single queue produces two effects, both serious: the
technician who receives a clinical alarm and the clinician habituated to technical alarms.

**13. Aderenza and trasmissione.**
*Why they get confused:* when the datum does not arrive, the most immediate explanation is that the
person has not taken a measurement.
*What breaks:* a datum that has not arrived may indicate a non-adherent patient, a broken device, an
interrupted ingestion chain **or a clinical worsening that prevents the measurement**. Treating the
absence of a datum as non-adherence loses the one case in which the absence is an emergency.

**14. Tenant, organizzazione, struttura erogante, integratore.**
*Why they get confused:* in the simple cases they coincide, and the first deployments are always
simple cases.
*What breaks:* the tenant is a boundary of isolation; the organisation is a legal person; the
delivering organisation is whoever answers for the delivery; the integrator is an application
principal, not a user. A tenant may contain several delivering organisations and an integrator may
operate on several tenants: the model that merges them represents neither of the two situations.

### 3.2 The pairs that emerge from the other modules

**15. Segno and sintomo.**
*Why they get confused:* both are «things the patient has».
*What breaks:* the sign is detected by the observer and its source is the professional; the symptom
is reported by the person and is not directly observable. The source is an attribute of the datum
and it changes the clinical weight of what is recorded. In telemedicine the distinction weighs
double, because at a distance the share of symptoms grows and that of signs shrinks.
See [F09](09-fondamenti-clinici.md).

**16. Sensibilità, specificità and valore predittivo.**
*Why they get confused:* they all look like «how reliable the test is».
*What breaks:* sensitivity and specificity are properties of the test, independent of the
population; predictive value depends on the **prevalence**. A very sensitive alarm rule applied to
a low-risk population produces mostly false positives, and this is not a defect of the rule: it is
arithmetic. Whoever designs alarms while ignoring it systematically builds alarm fatigue.
See [F09](09-fondamenti-clinici.md) and [F10](10-percorsi-di-cura-e-sicurezza.md).

**17. Autorizzazione sanitaria, accreditamento istituzionale and contratto.**
*Why they get confused:* in speech an organisation is generically «under agreement».
*What breaks:* they are three successive and distinct entitlements. The authorisation enables the
organisation to operate, the accreditation enables it to deliver on behalf of the health service,
the contract establishes how much and on what conditions. An organisation may have the first two
and not the third: its services are not at public expense. A model with a single boolean attribute
gets the invoicing wrong.
See [F01](01-sistema-sanitario-italiano.md).

**18. Cifratura in transito and cifratura da estremo a estremo.**
*Why they get confused:* both are described with the word «encrypted», and the padlock in the
interface is the same.
*What breaks:* encryption in transit is interrupted at every termination point; a chain of encrypted
legs is not end-to-end encryption. Declaring the second when one has the first is, besides being
technically false, a claim that has to be corrected in public communication: in the project the
assertion is admitted only conditional on the independent verification of the keys, and **it lapses
when server-side recording is active**.
See [F12](12-crittografia-e-sicurezza.md) and [F08](08-webrtc-da-zero.md).

**19. Registro degli accessi, registro di diagnostica and versionamento delle entità.**
*Why they get confused:* in Italian they are all called «log» or all called «audit».
*What breaks:* the versioning of entities **versions, it does not make immutable**: whoever has
write access to the database can alter the history tables too. The diagnostic log is an operational
artefact that is rotated and deleted. The audit trail requires a chain of fingerprints and retention
separate from the system that generates the events. Satisfying the requirement of immutable
auditability with a versioning scheme is the defect most costly to discover late, because it is
discovered when somebody disputes an access.
See [F12](12-crittografia-e-sicurezza.md) and [F16](16-architettura-del-progetto.md).

**20. Conservazione a norma and backup.**
*Why they get confused:* both «keep the data safe over time».
*What breaks:* the backup protects against loss; compliant digital preservation guarantees over time
the authenticity, integrity, legibility and retrievability of the electronic document, and it is a
process with rules and parties of its own. No backup policy, however rigorous, satisfies it.
See [F03](03-il-dato-clinico.md).

**21. Anonimizzazione and pseudonimizzazione.**
*Why they get confused:* in both cases the name does not appear.
*What breaks:* anonymisation takes the datum out of the scope of the data protection rules;
pseudonymisation does not, and the datum remains personal. Declaring a pseudonymised datum
anonymised means applying to it a regime that does not belong to it - transfers, retention,
communication to third parties - and each of those applications is a breach.
See [F03](03-il-dato-clinico.md).

**22. Diagnosi and sospetto diagnostico.**
*Why they get confused:* in the free text of a letter they appear in the same sentence.
*What breaks:* they are two entities with an author, a date, a degree of certainty and a life cycle
of their own. Representing them in the same field produces diagnoses that nobody has ever
formulated, which then travel to the health record, to the integrator's system and to the
statistics.
See [F09](09-fondamenti-clinici.md).

**23. Contatto and sessione media.**
*Why they get confused:* in the user's experience they are the same thing: you enter a room and the
visit begins.
*What breaks:* the encounter is the clinical and administrative act; the media session is an
instance of connection. An encounter may have several media sessions, and a dropped media session
**does not close the encounter**. A model that merges them closes health acts when the network
drops, with consequences for the report, the accounting and the waiting times.
See [F14](14-flussi-funzionali.md).

**24. Mancata presentazione and fallimento tecnico.**
*Why they get confused:* from the system's point of view, in both cases the person does not appear.
*What breaks:* non-attendance presupposes that **no attempt to connect** occurred within the window;
technical failure is an attempt that went wrong. Confusing them produces statistics that charge the
person with the defects of the infrastructure, and in some contexts it produces undue financial
charges.
See [F14](14-flussi-funzionali.md) and [DOM](/05_domain/02-le-prestazioni-modellate.md).

**25. Identificatore and attributo.**
*Why they get confused:* both are «fields that describe the person».
*What breaks:* the identifier singles out inside a declared domain; the attribute describes without
singling out. Treating an attribute as a key - the date of birth, the contact detail, the name -
produces silent collisions; treating an identifier without its domain produces matches between
different people.
See [F04](04-identita-e-anagrafiche.md).

**26. `id` and `identifier`.**
*Why they get confused:* the names resemble each other and in many resources they appear two lines
apart.
*What breaks:* the `id` identifies the resource **on that server** and has neither clinical meaning
nor portability; the `identifier` identifies the entity in the real world, with its own namespace.
Using the first as a correlation key between systems produces an integration that works until the
server is changed, and then stops working irreparably.
See [F06](06-fhir-da-zero.md).

**27. Conforme and marcato CE.**
*Why they get confused:* in commercial speech «compliant» covers both.
*What breaks:* conformity with a technical standard is a verifiable property of the product; CE
marking is a formal act of the manufacturer, which for the higher classes presupposes the
intervention of a Notified Body. **Today the product does not bear CE marking**, and every
formulation that lets the contrary be understood - even a formulation in the future tense with a
date - produces a regulatory effect that the intention to certify does not produce.
See [F15](15-regolatorio-da-zero.md).

**28. Errore d'uso and uso anomalo.**
*Why they get confused:* in both cases «the user did something they should not have».
*What breaks:* use error does not imply fault on the part of the user and is a defect in the design
of the interface, to be corrected in the product; abnormal use is an intentional and unjustifiable
violation, outside the perimeter of the usability standard but inside that of risk management.
Classifying a use error as abnormal use is the most effective way never to correct the interface.
See [F10](10-percorsi-di-cura-e-sicurezza.md) and [F15](15-regolatorio-da-zero.md).

**29. Specifica and profilo.**
*Why they get confused:* both are «the document of the standard».
*What breaks:* the base specification is deliberately permissive so as to hold in every context; the
profile restricts it for a context of use and may **only restrict**. Implementing the base
specification while believing oneself conformant to the profile produces instances that pass
structural validation and fail profile validation, typically in production and at the first serious
integrator.
See [F05](05-standard-di-interoperabilita.md).

**30. Standard and standard di fatto.**
*Why they get confused:* widespread adoption resembles authority.
*What breaks:* widespread does not mean regulated. Citing a de facto standard as a standard in a
regulatory document is an inaccuracy that an assessor picks up, and building on an expired draft
without declaring it produces dependencies that move under one's feet.
See [F13](13-protocolli.md).

**31. Ripiego di canale and ripiego in presenza.**
*Why they get confused:* they are both «what one does when the video call does not work».
*What breaks:* the channel fallback is the passage to a degraded channel during the act, which must
be recorded and reported in the document because it may affect the nature of the act; the in-person
fallback is the obligation to complete or reschedule the service in person, with no additional
charge. The first is a technical decision with clinical effects, the second is a regulatory
obligation towards the patient.
See [F02](02-prestazioni-di-telemedicina.md) and [F14](14-flussi-funzionali.md).

**32. Esattamente una volta and almeno una volta più idempotenza.**
*Why they get confused:* the observable result, when everything works, is identical.
*What breaks:* exactly-once delivery is not obtainable end to end; promising it means not
implementing idempotency on the receiving side. The day the network drops between the write and the
acknowledgement, the health act comes out recorded twice.
See [F11](11-fondamenti-informatici.md) and [F13](13-protocolli.md).

---

## 4. Terms not to be used

These are neither spelling mistakes nor questions of style. They are terms which, used in the model,
in the code, in the interface or in the documentation, introduce a wrong meaning or a commitment the
product cannot keep. The first eleven entries are those already established by the domain area; the
ones that follow derive from the public warnings and from the decisions on communication.

| Not to be used | Why | What is used instead |
|---|---|---|
| «Sessione» unqualified | Ambiguous between clinical act, media connection and application access session | *contatto*, *sessione media*, *sessione applicativa* |
| «Contact» in the code | It collides with the contact-details element of the standard, which has the same name and a different meaning | `Encounter` |
| «Real-time monitoring» | It shifts the regulatory classification from Class IIa to IIb and the software safety class from B to C | *deferred collection of parameters for the professional's periodic review* |
| «Immutable audit» referring to the versioning of entities | Versioning does not make anything immutable: whoever writes to the database can alter the history too | *registro degli accessi* as a chain of fingerprints, with separate retention |
| «Teleconsulto report» | The teleconsulto does not give rise to an autonomous report | *relazione collaborativa* |
| «Consent to the platform» | It does not exist: consents are distinct objects with different natures, effects and revocability | the specific type of consent, named in full |
| «Threshold laid down by law» referring to technical parameters | No technical threshold is imposed by Italian legislation | *configurable product specification* |
| «Clinical quality» as a claim | It has no verifiable definition | verifiable technical statements about resolution, continuity, outcome |
| «Automatic diagnosis», «clinical suggestion» | Outside the perimeter: it would move the system from recording decisions to producing them | *recording of the professional's decision* |
| «The authenticated patient is identified» | Authentication and identification are distinct acts, with different responsible parties | *identification recorded by the professional*, with method and outcome |
| Names of companies, products, trade marks or domains of potential partners | The project's confidentiality rule, which prevails over every other | *the integrator*, *a cloud healthcare management system*, *a third-party EHR system* |
| «It will be CE marked by *date*» | The intention to certify and the promise of a dated outcome are two different things, and the second produces a regulatory effect that the first does not | *the role of manufacturer is to be constituted and formalised*; *today the product does not bear CE marking* |
| «Whoever certifies», referring to an undefined third party | The role of manufacturer will be assumed by the project: attributing the path to an undefined third party is no longer correct | *the project in the role of manufacturer, a role still to be constituted* |
| «The calendar of a third party», «third-party milestones» | The roadmap and the dates are the project's internal planning | *the project's internal planning*, declared as such |
| «Peer-to-peer» as a permanent quality of the session | The direct path is not always possible, and the promise is not keepable on every network | *encrypted end to end, routed directly when the network allows it* |
| «Key rotation per session» | An ambiguous formulation: it suggests a rotation mechanism that is not the one adopted | *cryptographic material generated afresh for every session, with no reuse* |
| «Latency below *N* milliseconds» as a promise | Latency depends on networks the project does not control | *a metric measured, recorded and notified*, with the product thresholds declared |
| «SPID accredited», «accredited with the authority» | An open source project cannot be accredited: the service provider is whoever provides the service online, that is, the deployer | *conformant and verifiable in continuous integration*, with the conformance suite passed in full |
| Acronyms of cryptographic compliance from non-EU legal orders as a guarantee | They are not the applicable reference and they suggest a qualification the product does not have | the applicable European and national references, cited in full |
| Any code or description from terminologies under a restrictive licence, **SNOMED CT in particular** | The licensing constraint is perfected by access to the content and is incompatible with a public repository | the URI of the code system and the code received from outside, resolved at runtime by the terminology gateway |
| «Non-compliant patient» as a judgement | Adherence is not obedience, and its absence is a clinical datum to be interpreted, not a fault to be recorded | *aderenza*, measured as the ratio between expectations satisfied and expectations generated, with the exclusions declared |
| «The system detected a worsening» | The system does not deduce clinical alerts: it applies thresholds configured by the professional | *the value exceeded the configured threshold*, with the reference to whoever configured it |

---

## 5. Acronyms and abbreviations

Every acronym is expanded in Italian and in English. The acronyms of Italian normative instruments
remain in their original form in the English documentation too, with the explanation following:
translating the name of a decree makes it impossible to find.

### 5.1 Italian healthcare and organisation

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| ACN | Accordo collettivo nazionale (medicina convenzionata) | National collective agreement for contracted physicians | [F01](01-sistema-sanitario-italiano.md) |
| ADI | Assistenza domiciliare integrata | Integrated home care | [F01](01-sistema-sanitario-italiano.md) |
| AGENAS | Agenzia nazionale per i servizi sanitari regionali | National Agency for Regional Healthcare Services | [F01](01-sistema-sanitario-italiano.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| AO / AOU | Azienda ospedaliera / ospedaliero-universitaria | Hospital trust / university hospital trust | [F01](01-sistema-sanitario-italiano.md) |
| ASL | Azienda sanitaria locale | Local health authority | [F01](01-sistema-sanitario-italiano.md) |
| CdC | Casa della comunità | Community health centre | [F01](01-sistema-sanitario-italiano.md) |
| CIPESS | Comitato interministeriale per la programmazione economica e lo sviluppo sostenibile | Interministerial committee for economic planning and sustainable development | [F01](01-sistema-sanitario-italiano.md) |
| COT | Centrale operativa territoriale | Territorial operations centre | [F01](01-sistema-sanitario-italiano.md) |
| CUP | Centro unico di prenotazione | Central booking service | [F01](01-sistema-sanitario-italiano.md) |
| DEMA | Ricetta dematerializzata (flusso) | Dematerialised prescription flow | [F01](01-sistema-sanitario-italiano.md) |
| IFoC | Infermiere di famiglia o di comunità | Family and community nurse | [F01](01-sistema-sanitario-italiano.md) |
| IRCCS | Istituto di ricovero e cura a carattere scientifico | Scientific institute for research, hospitalisation and healthcare | [F01](01-sistema-sanitario-italiano.md) |
| LEA | Livelli essenziali di assistenza | Essential levels of care | [F01](01-sistema-sanitario-italiano.md) |
| MMG | Medico di medicina generale | General practitioner | [F01](01-sistema-sanitario-italiano.md) |
| NRE | Numero di ricetta elettronica | Electronic prescription number | [F01](01-sistema-sanitario-italiano.md) |
| NSG | Nuovo sistema di garanzia | New guarantee system (LEA monitoring) | [F01](01-sistema-sanitario-italiano.md) |
| OdC | Ospedale di comunità | Community hospital | [F01](01-sistema-sanitario-italiano.md) |
| PLS | Pediatra di libera scelta | Family paediatrician | [F01](01-sistema-sanitario-italiano.md) |
| PNRR | Piano nazionale di ripresa e resilienza | National recovery and resilience plan | [F01](01-sistema-sanitario-italiano.md) |
| RdA / RdE | Regione di assistenza / Regione di erogazione | Region of entitlement / region of delivery | [F01](01-sistema-sanitario-italiano.md), [F07](07-fse-e-infrastrutture-nazionali.md) |
| SSN | Servizio sanitario nazionale | Italian National Health Service | [F01](01-sistema-sanitario-italiano.md) |
| UCA | Unità di continuità assistenziale | Continuity of care unit | [F01](01-sistema-sanitario-italiano.md) |

### 5.2 Telemedicine, pathways and plans

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| GST | Gestore Soluzioni di Telemedicina | Telemedicine solutions manager | [F02](02-prestazioni-di-telemedicina.md) |
| INT | Infrastruttura nazionale di telemedicina | National telemedicine infrastructure | [F02](02-prestazioni-di-telemedicina.md) |
| IRT | Infrastruttura regionale di telemedicina | Regional telemedicine infrastructure | [F02](02-prestazioni-di-telemedicina.md) |
| NIT | Nodo di interoperabilità della telemedicina | Telemedicine interoperability node | [F02](02-prestazioni-di-telemedicina.md) |
| PAI | Piano assistenziale individuale | Individual care plan | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| PDTA | Percorso diagnostico-terapeutico assistenziale | Care pathway | [F10](10-percorsi-di-cura-e-sicurezza.md) |
| PN-DT | Piattaforma nazionale per la diffusione della telemedicina | National telemedicine dissemination platform | [F02](02-prestazioni-di-telemedicina.md) |
| PNT | Piattaforma nazionale di telemedicina | National telemedicine platform | [F02](02-prestazioni-di-telemedicina.md) |
| PRI | Progetto riabilitativo individuale | Individual rehabilitation project | [F02](02-prestazioni-di-telemedicina.md) |
| ADL / IADL | Attività di base / strumentali della vita quotidiana | Basic / instrumental activities of daily living | [F10](10-percorsi-di-cura-e-sicurezza.md) |

### 5.3 Clinical datum, data protection and documents

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| CAdES | Firma elettronica avanzata su file generici | CMS advanced electronic signature | [F03](03-il-dato-clinico.md) |
| DPIA | Valutazione d'impatto sulla protezione dei dati | Data protection impact assessment | [F03](03-il-dato-clinico.md) |
| FEA / FEQ / FES | Firma elettronica avanzata / qualificata / semplice | Advanced / qualified / simple electronic signature | [F03](03-il-dato-clinico.md) |
| PAdES | Firma elettronica avanzata su documenti PDF | PDF advanced electronic signature | [F03](03-il-dato-clinico.md) |
| RPD / DPO | Responsabile della protezione dei dati | Data protection officer | [F03](03-il-dato-clinico.md) |
| XAdES | Firma elettronica avanzata su documenti XML | XML advanced electronic signature | [F03](03-il-dato-clinico.md) |

### 5.4 Digital identity and registries

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| ANA | Anagrafe nazionale degli assistiti | National registry of healthcare beneficiaries | [F04](04-identita-e-anagrafiche.md) |
| ANPR | Anagrafe nazionale della popolazione residente | National resident population registry | [F04](04-identita-e-anagrafiche.md) |
| CIE | Carta d'identità elettronica | Italian electronic identity card | [F04](04-identita-e-anagrafiche.md) |
| ENI | Europeo Non Iscritto | EU citizen not registered with the health service | [F04](04-identita-e-anagrafiche.md) |
| LoA | Livello di garanzia | Level of assurance | [F04](04-identita-e-anagrafiche.md) |
| OIDC | Connessione a identità aperta | OpenID Connect | [F04](04-identita-e-anagrafiche.md), [F13](13-protocolli.md) |
| SAML | Linguaggio di marcatura per asserzioni di sicurezza | Security Assertion Markup Language | [F04](04-identita-e-anagrafiche.md) |
| SPID | Sistema pubblico di identità digitale | Italian public digital identity system | [F04](04-identita-e-anagrafiche.md) |
| STP | Straniero Temporaneamente Presente | Temporarily present foreign national | [F04](04-identita-e-anagrafiche.md) |
| TEAM | Tessera europea di assicurazione malattia | European Health Insurance Card | [F04](04-identita-e-anagrafiche.md) |
| TS-CNS | Tessera sanitaria - carta nazionale dei servizi | Health card with national services card chip | [F04](04-identita-e-anagrafiche.md) |

### 5.5 Standards, interoperability and terminologies

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| ADT | Messaggi di ammissione, dimissione e trasferimento | Admission, discharge, transfer messages | [F05](05-standard-di-interoperabilita.md) |
| AIC | Autorizzazione all'immissione in commercio | Marketing authorisation number | [F05](05-standard-di-interoperabilita.md) |
| ATNA | Tracciamento degli eventi e autenticazione di nodo | Audit Trail and Node Authentication | [F05](05-standard-di-interoperabilita.md) |
| BALP | Schemi di base per i registri di tracciamento | Basic Audit Log Patterns | [F05](05-standard-di-interoperabilita.md) |
| CDA | Architettura dei documenti clinici | Clinical Document Architecture | [F05](05-standard-di-interoperabilita.md) |
| CT | Tempo coerente (profilo di sincronizzazione oraria) | Consistent Time | [F05](05-standard-di-interoperabilita.md) |
| DICOM | Immagini e comunicazione digitale in medicina | Digital Imaging and Communications in Medicine | [F05](05-standard-di-interoperabilita.md) |
| FHIR | Risorse rapide per l'interoperabilità sanitaria | Fast Healthcare Interoperability Resources | [F06](06-fhir-da-zero.md) |
| HL7 | Livello sette della salute (organizzazione di standard) | Health Level Seven | [F05](05-standard-di-interoperabilita.md) |
| ICD-9-CM | Classificazione internazionale delle malattie, modifica clinica | International Classification of Diseases, Clinical Modification | [F05](05-standard-di-interoperabilita.md) |
| IG | Guida di implementazione | Implementation Guide | [F05](05-standard-di-interoperabilita.md) |
| IHE | Integrazione dell'impresa sanitaria | Integrating the Healthcare Enterprise | [F05](05-standard-di-interoperabilita.md) |
| IUA | Autorizzazione dell'utente Internet | Internet User Authorization | [F05](05-standard-di-interoperabilita.md) |
| LOINC | Nomi e codici degli identificatori logici delle osservazioni | Logical Observation Identifiers Names and Codes | [F05](05-standard-di-interoperabilita.md) |
| MDM | Messaggi di gestione dei documenti medici | Medical Document Management messages | [F05](05-standard-di-interoperabilita.md) |
| MHD | Accesso mobile ai documenti sanitari | Mobile access to Health Documents | [F05](05-standard-di-interoperabilita.md) |
| MLLP | Protocollo minimale di livello inferiore | Minimal Lower Layer Protocol | [F05](05-standard-di-interoperabilita.md) |
| ORU | Messaggio di trasmissione di risultati | Observation Result Unsolicited | [F05](05-standard-di-interoperabilita.md) |
| PDQm | Interrogazione demografica del paziente, versione mobile | Patient Demographics Query for Mobile | [F05](05-standard-di-interoperabilita.md) |
| PIXm | Correlazione degli identificativi del paziente, versione mobile | Patient Identifier Cross-referencing for Mobile | [F05](05-standard-di-interoperabilita.md) |
| SDO | Ente di sviluppo di standard | Standards Development Organization | [F05](05-standard-di-interoperabilita.md) |
| SIU | Messaggi di programmazione degli appuntamenti | Scheduling Information Unsolicited | [F05](05-standard-di-interoperabilita.md) |
| SNOMED CT | Nomenclatura sistematizzata della medicina, termini clinici | Systematized Nomenclature of Medicine - Clinical Terms | [F05](05-standard-di-interoperabilita.md) |
| STU | Uso di prova per standard | Standard for Trial Use | [F05](05-standard-di-interoperabilita.md) |
| UCUM | Codice unificato per le unità di misura | Unified Code for Units of Measure | [F05](05-standard-di-interoperabilita.md) |

### 5.6 Health record and national infrastructures

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| ACN | Agenzia per la cybersicurezza nazionale | National Cybersecurity Agency | [F07](07-fse-e-infrastrutture-nazionali.md) |
| AgID | Agenzia per l'Italia digitale | Agency for Digital Italy | [F07](07-fse-e-infrastrutture-nazionali.md) |
| CAD | Codice dell'amministrazione digitale | Digital Administration Code | [F07](07-fse-e-infrastrutture-nazionali.md) |
| EDS | Ecosistema dati sanitari | Health data ecosystem | [F07](07-fse-e-infrastrutture-nazionali.md) |
| EHDS | Spazio europeo dei dati sanitari | European Health Data Space | [F07](07-fse-e-infrastrutture-nazionali.md) |
| FSE | Fascicolo sanitario elettronico | National electronic health record | [F07](07-fse-e-infrastrutture-nazionali.md) |
| INI | Infrastruttura nazionale per l'interoperabilità | National interoperability infrastructure | [F07](07-fse-e-infrastrutture-nazionali.md) |
| ModI | Modello di Interoperabilità | Interoperability model | [F07](07-fse-e-infrastrutture-nazionali.md) |
| PDND | Piattaforma Digitale Nazionale Dati | National digital data platform | [F07](07-fse-e-infrastrutture-nazionali.md) |
| PSN | Polo Strategico Nazionale | National strategic hub | [F07](07-fse-e-infrastrutture-nazionali.md) |
| QC / QI | Qualificazione dei servizi cloud / delle infrastrutture | Cloud service / infrastructure qualification levels | [F07](07-fse-e-infrastrutture-nazionali.md) |
| Sistema TS | Sistema Tessera Sanitaria | Health card system | [F07](07-fse-e-infrastrutture-nazionali.md) |

### 5.7 Real time, network and media

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| CGNAT | Traduzione di indirizzi di livello operatore | Carrier-Grade NAT | [F08](08-webrtc-da-zero.md) |
| DTLS | Sicurezza del livello di trasporto a datagrammi | Datagram Transport Layer Security | [F08](08-webrtc-da-zero.md) |
| FEC | Correzione d'errore in avanti | Forward error correction | [F08](08-webrtc-da-zero.md) |
| FIR | Richiesta di fotogramma completo | Full Intra Request | [F08](08-webrtc-da-zero.md) |
| ICE | Stabilimento interattivo della connettività | Interactive Connectivity Establishment | [F08](08-webrtc-da-zero.md) |
| JSEP | Protocollo di stabilimento della sessione da JavaScript | JavaScript Session Establishment Protocol | [F08](08-webrtc-da-zero.md) |
| MCU | Unità di controllo multipunto (composizione) | Multipoint Control Unit | [F08](08-webrtc-da-zero.md) |
| mDNS | Risoluzione dei nomi in multicast | Multicast DNS | [F08](08-webrtc-da-zero.md) |
| NAT | Traduzione degli indirizzi di rete | Network Address Translation | [F08](08-webrtc-da-zero.md) |
| PLI | Indicazione di perdita d'immagine | Picture Loss Indication | [F08](08-webrtc-da-zero.md) |
| RTT | Tempo di andata e ritorno | Round-trip time | [F08](08-webrtc-da-zero.md) |
| SAS | Stringa breve di verifica delle chiavi | Short Authentication String | [F08](08-webrtc-da-zero.md) |
| SDP | Protocollo di descrizione della sessione | Session Description Protocol | [F08](08-webrtc-da-zero.md) |
| SFU | Unità di inoltro selettivo | Selective Forwarding Unit | [F08](08-webrtc-da-zero.md) |
| SRTP | Protocollo sicuro di trasporto in tempo reale | Secure Real-time Transport Protocol | [F08](08-webrtc-da-zero.md) |
| STUN | Utilità di attraversamento della sessione per NAT | Session Traversal Utilities for NAT | [F08](08-webrtc-da-zero.md) |
| TCP | Protocollo di controllo della trasmissione | Transmission Control Protocol | [F08](08-webrtc-da-zero.md) |
| TURN | Attraversamento tramite relay attorno al NAT | Traversal Using Relays around NAT | [F08](08-webrtc-da-zero.md) |
| UDP | Protocollo a datagrammi utente | User Datagram Protocol | [F08](08-webrtc-da-zero.md) |
| WebRTC | Comunicazione web in tempo reale | Web Real-Time Communication | [F08](08-webrtc-da-zero.md) |

### 5.8 Architecture, data and application protocols

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| 2PC | Commit a due fasi | Two-phase commit | [F11](11-fondamenti-informatici.md) |
| ALPN | Negoziazione del protocollo applicativo | Application-Layer Protocol Negotiation | [F13](13-protocolli.md) |
| JWT / JWS / JWE / JWK | Token web JSON / firmato / cifrato / chiave | JSON Web Token / Signature / Encryption / Key | [F13](13-protocolli.md) |
| JWKS | Insieme di chiavi web JSON | JSON Web Key Set | [F13](13-protocolli.md) |
| PACELC | Partizione: disponibilità o consistenza; altrimenti: latenza o consistenza | Partition: Availability or Consistency; Else: Latency or Consistency | [F11](11-fondamenti-informatici.md) |
| PKCE | Chiave di prova per lo scambio del codice pubblico | Proof Key for Code Exchange | [F13](13-protocolli.md) |
| RLS | Sicurezza a livello di riga | Row Level Security | [F11](11-fondamenti-informatici.md) |
| RPO | Obiettivo del punto di ripristino | Recovery Point Objective | [F11](11-fondamenti-informatici.md) |
| RTO | Obiettivo del tempo di ripristino | Recovery Time Objective | [F11](11-fondamenti-informatici.md) |
| SNI | Indicazione del nome del server | Server Name Indication | [F13](13-protocolli.md) |
| SSRF | Falsificazione di richieste lato server | Server-Side Request Forgery | [F13](13-protocolli.md) |

### 5.9 Security, cryptography and supply chain

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| ABAC | Controllo degli accessi basato sugli attributi | Attribute-Based Access Control | [F12](12-crittografia-e-sicurezza.md) |
| AEAD | Cifratura autenticata con dati associati | Authenticated Encryption with Associated Data | [F12](12-crittografia-e-sicurezza.md) |
| CRA | Regolamento sulla ciberresilienza | Cyber Resilience Act | [F12](12-crittografia-e-sicurezza.md) |
| HKDF | Funzione di derivazione di chiave basata su HMAC | HMAC-based Key Derivation Function | [F12](12-crittografia-e-sicurezza.md) |
| HMAC | Codice di autenticazione del messaggio basato su hash | Hash-based Message Authentication Code | [F12](12-crittografia-e-sicurezza.md) |
| mTLS | Sicurezza del livello di trasporto con mutua autenticazione | Mutual TLS | [F13](13-protocolli.md) |
| OCSP | Protocollo di stato del certificato in linea | Online Certificate Status Protocol | [F12](12-crittografia-e-sicurezza.md) |
| PKI | Infrastruttura a chiave pubblica | Public Key Infrastructure | [F12](12-crittografia-e-sicurezza.md) |
| RBAC | Controllo degli accessi basato sui ruoli | Role-Based Access Control | [F12](12-crittografia-e-sicurezza.md) |
| SBOM | Distinta dei materiali software | Software Bill of Materials | [F12](12-crittografia-e-sicurezza.md) |
| SOUP | Software di provenienza ignota | Software Of Unknown Provenance | [F12](12-crittografia-e-sicurezza.md) |
| STRIDE | Falsificazione, manomissione, ripudio, divulgazione, negazione di servizio, elevazione di privilegio | Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege | [F12](12-crittografia-e-sicurezza.md) |
| VEX | Scambio sulla sfruttabilità delle vulnerabilità | Vulnerability Exploitability eXchange | [F12](12-crittografia-e-sicurezza.md) |

### 5.10 Regulatory and quality

| Acronym | Italian expanded form | English | Where |
|---|---|---|---|
| CE | Conformità europea (marcatura) | European Conformity (marking) | [F15](15-regolatorio-da-zero.md) |
| EUDAMED | Banca dati europea dei dispositivi medici | European Database on Medical Devices | [F15](15-regolatorio-da-zero.md) |
| GSPR | Requisiti generali di sicurezza e prestazione | General Safety and Performance Requirements | [F15](15-regolatorio-da-zero.md) |
| MDCG | Gruppo di coordinamento per i dispositivi medici | Medical Device Coordination Group | [F15](15-regolatorio-da-zero.md) |
| MDR | Regolamento sui dispositivi medici | Medical Device Regulation | [F15](15-regolatorio-da-zero.md) |
| MDSW | Software che è dispositivo medico | Medical Device Software | [F15](15-regolatorio-da-zero.md) |
| NANDO | Nuovo approccio: organismi notificati e designati | New Approach Notified and Designated Organisations | [F15](15-regolatorio-da-zero.md) |
| PRRC | Persona responsabile del rispetto della normativa | Person Responsible for Regulatory Compliance | [F15](15-regolatorio-da-zero.md) |
| PSUR | Rapporto periodico di aggiornamento sulla sicurezza | Periodic Safety Update Report | [F15](15-regolatorio-da-zero.md) |
| SRN | Numero di registrazione unico | Single Registration Number | [F15](15-regolatorio-da-zero.md) |
| UDI / UDI-DI / UDI-PI | Identificazione unica del dispositivo / identificativo del dispositivo / della produzione | Unique Device Identification / Device Identifier / Production Identifier | [F15](15-regolatorio-da-zero.md) |
| WCAG | Linee guida per l'accessibilità dei contenuti web | Web Content Accessibility Guidelines | [F15](15-regolatorio-da-zero.md), [FUN](/03_functional/06-accessibilita-e-usabilita.md) |

---

## 6. Terms that mean different things depending on the context

This is the most insidious category of the glossary, and for a precise reason: **the reader believes
they have understood.** With a false synonym the reader perceives at least some friction - two words
for one thing. Here they do not: the word is one, the meaning is plausible, the sentence flows, and
the error shows itself many months later, at a point in the system that nobody connects to the
sentence read.

The project's rule is not to choose one meaning and expel the other - both would be legitimate, each
in its own context. The rule is **always to qualify**, and the check is automatable because the list
is closed: none of the words that follow appears alone in the name of a class, of a column, of an
endpoint, of an event or of an interface label.

### 6.1 Sessione

**Meanings.** (a) The clinical act, the unit accounted for. (b) The media connection between the
participants. (c) A user's application access session to the system.
**How it is recognised.** If the sentence speaks of billable duration, of a report or of an outcome,
it is (a). If it speaks of codecs, of a drop, of reconnection or of quality, it is (b). If it speaks
of expiry, of tokens or of disconnection for inactivity, it is (c).
**Form to use.** *contatto*, *sessione media*, *sessione applicativa*. Never «sessione» alone.

### 6.2 Contatto

**Meanings.** (a) The interaction between the patient and the delivery system. (b) The telephone or
email contact detail.
**How it is recognised.** If it has a beginning, an end, a status and an outcome, it is (a). If it
has a type, a use and a preference, it is (b).
**Form to use.** In the code `Encounter` for the first and *recapito* for the second. **Never**
`Contact`, which in the standard already designates the second and would produce a collision with an
existing element of the demographic resource.

### 6.3 Ticket

**Meanings.** (a) The share of the cost borne by the patient. (b) The support request opened with
the help desk.
**How it is recognised.** If an amount, an exemption or an accounting entry appears, it is (a). If a
processing status, an assignee or a priority of taking on appears, it is (b).
**Form to use.** *quota di compartecipazione* / *segnalazione di assistenza*.

### 6.4 Teleassistenza

**Meanings.** (a) The remote professional health act pertaining to the non-medical professions,
defined by the instruments on telemedicine. (b) Remote technical support to the user.
**How it is recognised.** If the subject is a health professional and the object is a patient or
their carer, it is (a). If the subject is a technician and the object is a device or an account, it
is (b).
**Form to use.** *teleassistenza* for the health service, *supporto tecnico* for the other. In the
code, two names that do not resemble each other.

### 6.5 Registro

**Meanings.** (a) The audit trail, non-repudiable, with a chain of fingerprints. (b) The application
diagnostic log. (c) The event log of a broker, with progressive positions and rereading.
**How it is recognised.** If it serves to answer «who saw what», it is (a). If it serves to
understand why a process behaved in a certain way, it is (b). If it has partitions, offsets and
consumers, it is (c).
**Form to use.** *registro degli accessi* / *registro di diagnostica* / *log degli eventi*. The three
artefacts have completely different regimes of retention, of access and of alterability, and
confusing them is the way the requirement of immutable auditability gets satisfied on paper and not
in fact.

### 6.6 Firma

**Meanings.** (a) The subscription of a document, with evidential value and a level determined per
documentary type. (b) The cryptographic signature of a message, of an envelope or of a token.
**How it is recognised.** If there is a signatory assuming a responsibility, it is (a). If there is a
key, an algorithm and an automatic verifier, it is (b).
**Form to use.** *firma del documento* / *firma della busta*. The first is a legal act, the second a
technical property; neither implies the other.

### 6.7 Priorità

**Meanings.** (a) The urgency class of the requested service, which fixes the maximum time to
delivery. (b) The processing or delivery priority of a message.
**How it is recognised.** If it determines a deadline towards the patient, it is (a). If it
determines the order in a technical queue, it is (b).
**Form to use.** *codice di priorità* / *priorità di consegna*.

### 6.8 Stato

**Meanings.** (a) The clinical condition of the person. (b) The state of a state machine: encounter,
document, alarm, message.
**How it is recognised.** If the value is interpreted by a clinician, it is (a). If the value governs
admitted transitions and validation constraints, it is (b).
**Form to use.** *condizione clinica* / *stato del contatto*, *stato del documento* and so on. Never
a `status` field without a qualifier in an interface addressed to a health professional.

### 6.9 Piano

**Meanings.** (a) In the clinical domain: care plan, individual care plan, remote monitoring plan,
individual rehabilitation project - four distinct objects. (b) In the technical domain: the
execution plan of a query, the release plan. (c) In the architecture of the project: application
plane and clinical plane as exposure surfaces.
**How it is recognised.** If it is signed by a professional, it is (a). If an engine produces it, it
is (b). If it describes an interface towards the outside, it is (c).
**Form to use.** Always qualified, without exception. It is the word with the greatest number of
legitimate meanings in the product.

### 6.10 Monitoraggio

**Meanings.** (a) The remote monitoring of the patient. (b) The technical monitoring of the platform.
**How it is recognised.** If the subject observed is a person, it is (a). If it is a process, a queue
or a service, it is (b).
**Form to use.** *telemonitoraggio* / *osservabilità*. They belong to two different bounded contexts
and they share neither entities nor vocabulary.

### 6.11 Verifica

**Meanings.** (a) The check of the clinical executability of the service at a distance. (b) The
technical pre-check of device, permissions, bandwidth and reachability.
**How it is recognised.** If the outcome concerns the clinical appropriateness of proceeding, it is
(a). If it concerns the working of the equipment, it is (b).
**Form to use.** *verifica di eseguibilità* / *pre-verifica tecnica*. A positive outcome of the
second says nothing about the first.

### 6.12 Validazione

**Meanings.** (a) The clinical validation of a document by the professional, who declares its
content definitive. (b) The formal validation of a resource against a schema or a profile.
**How it is recognised.** If it produces responsibility, it is (a). If it produces a list of errors
and warnings, it is (b).
**Form to use.** *validazione clinica* / *validazione formale*. A document formally valid and
clinically not validated is not a health document.

### 6.13 Jitter

**Meanings.** (a) In the network: the variability of the delay between consecutive packets. (b) In
retries: the random term added to the waiting interval in order to avoid synchronised bursts.
**How it is recognised.** If it appears next to packet loss and round-trip time, it is (a). If it
appears next to exponential backoff and dead-letter queue, it is (b).
**Form to use.** *variabilità del ritardo* for the first, *componente casuale dell'attesa* for the
second, when the context is not already evident.

### 6.14 Profilo

**Meanings.** (a) The restriction of a standard for a context of use. (b) The protection profile of
the media, that is, the negotiated cipher suite. (c) The distribution profile, that is, the
placement configuration of the deployment. (d) The size profile of the synthetic dataset. (e) The
patient summary, which is a clinical document.
**How it is recognised.** Case (e) is the only one that appears in a clinical context and the only
one that has an author; the other four are distinguished by the complement that accompanies them.
**Form to use.** Always with the complement: *profilo di conformità*, *profilo di protezione*,
*profilo di distribuzione*, *profilo di dataset*, *profilo sanitario sintetico*.

### 6.15 Risorsa

**Meanings.** (a) The unit of exchange of the healthcare standard. (b) The protected resource of an
authorisation system. (c) The computing resource - memory, connections, quotas.
**How it is recognised.** If it has a `resourceType`, it is (a). If it appears in an authorisation
decision together with subject and action, it is (b). If it appears in a limit or in a bulkhead, it
is (c).
**Form to use.** *risorsa FHIR* / *risorsa protetta* / *risorsa di sistema*.

### 6.16 Consenso

**Meanings.** At least four distinct objects: consent to the health act, consent to the processing of
data, consent to consultation of the health record, consent to the recording of the session.
Alongside these stands the informed acceptance of the remote channel, which is not a consent.
**How it is recognised.** From the question it answers: «may I treat you?», «may I process these
data?», «may that party see them?», «may I record?».
**Form to use.** Always the specific type, in full. «Consenso» alone, and all the more so «consenso
alla piattaforma», identifies no object of the model.

### 6.17 Livello

**Meanings.** (a) The level of assurance of the identity. (b) The sensitivity level of a document.
(c) The isolation level of transactions. (d) The layer of a protocol stack. (e) The software safety
class, which some improperly call a «level».
**How it is recognised.** From the complement, always present in a well-written sentence; its absence
is the signal that the sentence has to be rewritten.
**Form to use.** The complement is mandatory. For (e) one says *classe di sicurezza software*, never
«livello».

### 6.18 Segnale e segnalazione

**Meanings.** (a) In clinical practice, the **sign**: a manifestation detectable by the observer.
(b) In real time, **signalling**: the preliminary exchange of the session descriptions and of the
candidates. (c) In organisation, the report of an incident or of a vulnerability.
**How it is recognised.** If it has a human source and a clinical weight, it is (a). If it precedes
the establishment of a connection, it is (b). If it has an institutional addressee and a deadline,
it is (c).
**Form to use.** *segno* / *segnalazione di sessione* / *segnalazione di incidente*.

### 6.19 Revoca

**Meanings.** (a) The revocation of a certificate. (b) The revocation of a token. (c) The withdrawal
of a consent by the patient.
**How it is recognised.** The first two are technical acts with immediate and verifiable effects; the
third is an act of the person with effects the system must respect but does not produce by itself.
**Form to use.** The complement is mandatory. And it must be remembered that (a) and (b) have no
effect if nobody checks the revocation.

### 6.20 ACN

**Meanings.** (a) The Accordo collettivo nazionale of agreement-based medicine. (b) The Agenzia per
la cybersicurezza nazionale.
**How it is recognised.** The context is always perfectly clear - remuneration of doctors versus
security measures - and it is precisely for this reason that nobody expands the acronym, and the
reader coming from outside the domain stops.
**Form to use.** Always expanded at the first occurrence of every document, without exception. It is
the most frequent case of homonymy in this documentation.

---

## 7. Reverse index English → Italian

It serves whoever arrives from the international technical literature and is looking for the
corresponding Italian term. The entries marked with **≈** are those in which the equivalence **is
not exact**, typically because the Italian term designates a national legal institution or
organisational role: in those cases the pointer serves to find the entry, not to replace the term.

| English | Italian |
|---|---|
| Access log | Registro degli accessi |
| Accessory | Accessorio |
| Active device | Dispositivo attivo |
| Adherence | Aderenza |
| Adverse event | Evento avverso |
| Aggregate / aggregate root | Aggregato / radice di aggregato |
| Aggregated value | Valore aggregato |
| Alarm fatigue | Affaticamento da allarme |
| Amendment | Rettifica |
| Anonymisation | Anonimizzazione |
| Anti-corruption layer | Livello anticorruzione |
| Append-only store | Archivio a sola aggiunta |
| Application principal | Principale applicativo |
| Application session | Sessione applicativa |
| Assertion | Asserzione |
| Assigning authority | Dominio di attribuzione |
| At-least-once / at-most-once / exactly-once | Almeno una volta / al più una volta / esattamente una volta |
| Attack surface | Superficie di attacco |
| Attribute | Attributo |
| Auscultation | Auscultazione |
| Authentication | Autenticazione |
| Authentication factor | Fattore di autenticazione |
| Authorisation | Autorizzazione |
| Availability | Disponibilità |
| Backpressure | Contropressione |
| Beneficiary ≈ | Assistito |
| Bitemporality | Bitemporalità |
| Binding strength | Forza del binding |
| Bounded context | Contesto delimitato |
| Breach register | Registro delle violazioni |
| Break the glass | Rottura del vetro |
| Breakout room | Stanza laterale |
| Bulkhead | Paratia |
| Canonical dataset | Dataset canonico |
| Canonical exchange model | Modello canonico di scambio |
| Canonical URI | URI canonico |
| Capitation | Quota capitaria |
| Care complexity | Complessità assistenziale |
| Care pathway ≈ | Percorso diagnostico-terapeutico assistenziale |
| Care plan | Piano di cura |
| Care relationship | Relazione di cura |
| Care setting | Setting di erogazione |
| Caregiver | Caregiver |
| CE marking | Marcatura CE |
| Certification authority | Autorità di certificazione |
| Chain of trust | Catena di fiducia |
| Change data capture | Cattura delle modifiche |
| Channel fallback | Ripiego di canale |
| Choreography | Coreografia |
| Circuit breaker | Interruttore automatico |
| Clinical alert | Allarme clinico |
| Clinical document | Documento clinico |
| Clinical evaluation | Valutazione clinica |
| Clinical letter | Relazione clinica |
| Clinical scale | Scala clinica |
| Clinical specialty | Branca specialistica |
| Clinical threshold | Soglia clinica |
| Coded concept | Concetto codificato |
| Coded unit | Unità di misura codificata |
| Collaborative report ≈ | Relazione collaborativa |
| Community health centre ≈ | Casa della comunità |
| Compensating transaction | Compensazione |
| Compliant digital preservation ≈ | Conservazione a norma |
| Confidentiality | Riservatezza |
| Conformity assessment | Valutazione della conformità |
| Congestion control | Controllo della congestione |
| Connection quality | Qualità del collegamento |
| Consent to access | Consenso alla consultazione |
| Consent to record | Consenso alla registrazione |
| Consumer group | Gruppo di consumatori |
| Consumer lag | Ritardo del consumatore |
| Context map | Mappa dei contesti |
| Contract test | Prova a contratto |
| Co-payment ≈ | Ticket |
| Co-payment exemption ≈ | Esenzione |
| Coordinated omission | Omissione coordinata |
| Coordinated vulnerability disclosure | Divulgazione coordinata |
| Correlation | Correlazione |
| Critical value | Valore critico |
| Cryptographic agility | Agilità crittografica |
| Cursor pagination | Paginazione per cursore |
| Data concerning health | Dato relativo alla salute |
| Data controller | Titolare del trattamento |
| Data processing consent | Consenso al trattamento dei dati |
| Data protection impact assessment | Valutazione d'impatto sulla protezione dei dati |
| Data suppression ≈ | Oscuramento |
| Dead letter queue | Coda di scarto |
| Declared purpose of use | Finalità dichiarata |
| Declared service coverage | Copertura oraria dichiarata |
| Decompensation | Scompenso |
| Deduplication | Deduplicazione |
| Deferred delivery | Consegna differita |
| Delegate | Delegato |
| Delivered service | Prestazione erogata |
| Delivering centre ≈ | Centro erogatore |
| Delivering organisation | Struttura erogante |
| Delivery of care | Erogazione |
| Deterministic / probabilistic matching | Corrispondenza deterministica / probabilistica |
| Device card ≈ | Tesserino dispositivi |
| Diagnosis | Diagnosi |
| Diagnostic question | Quesito diagnostico |
| Differential diagnosis | Diagnosi differenziale |
| Digital note ≈ | Annotazione digitale |
| Document signature | Firma del documento |
| Document version | Versione del documento |
| Document visibility matrix | Matrice di visibilità documentale |
| Document voiding | Annullamento del documento |
| Domain event | Evento di dominio |
| Domain separation | Separazione dei domini |
| Draft | Bozza |
| Dry weight | Peso secco |
| Dual write | Doppia scrittura |
| Early warning score | Scala di allerta precoce |
| Egress isolation | Isolamento di rete in uscita |
| EHR feeding | Alimentazione del fascicolo |
| Eligibility | Eleggibilità |
| Encounter | Contatto |
| Encounter outcome | Esito del contatto |
| Encounter state | Stato del contatto |
| Encryption at rest / in transit | Cifratura a riposo / in transito |
| End-to-end encryption | Cifratura da estremo a estremo |
| Enrolment | Arruolamento |
| Enrolment into care | Presa in carico |
| Entity | Entità |
| Ephemeral credential | Credenziale temporanea |
| Ephemeral environment | Ambiente effimero |
| Episode of care | Episodio di cura |
| Escalation | Escalation |
| Eventual consistency | Coerenza finale |
| Exacerbation | Riacutizzazione |
| Expansion | Espansione |
| Expected observation | Attesa di rilevazione |
| Expected volume monitoring | Sorveglianza del volume atteso |
| Explicit delegation | Delega esplicita |
| Exponential backoff | Attesa esponenziale |
| Extension | Estensione |
| External identifier | Identificatore esterno |
| Fallback | Ripiego |
| Fallacies of distributed computing | Fallacie del calcolo distribuito |
| False reassurance | Falsa rassicurazione |
| Feasibility assessment | Valutazione di eseguibilità |
| Fee schedule ≈ | Nomenclatore |
| Five-tuple | Cinquina |
| Floating version | Versione flottante |
| Follow-up | Follow-up |
| Forward secrecy | Segretezza in avanti |
| Fragility / frailty | Fragilità |
| General practitioner ≈ | Medico di medicina generale |
| Generator seed | Seme del generatore |
| Glare | Collisione delle offerte |
| Harm | Danno |
| Hash chain | Catena di impronte |
| Hazard | Pericolo |
| Hazardous situation | Situazione pericolosa |
| Head-of-line blocking | Blocco in testa alla coda |
| Highly protected health data ≈ | Dati a maggiore tutela dell'anonimato |
| Homeostasis | Omeostasi |
| Hospital discharge letter | Lettera di dimissione ospedaliera |
| Hysteresis | Isteresi |
| Idempotency / idempotency key | Idempotenza / chiave di idempotenza |
| Identifier | Identificatore |
| Identity | Identità |
| Implementation guide | Guida di implementazione |
| Individual care plan ≈ | Piano assistenziale individuale |
| Individual rehabilitation project ≈ | Progetto riabilitativo individuale |
| Informed acceptance ≈ | Adesione informata |
| Informed consent to treatment | Consenso all'atto sanitario |
| Inspection | Ispezione |
| Integrator | Integratore |
| Integrity | Integrità |
| Intended purpose | Destinazione d'uso |
| Invariant | Invariante |
| Isolation level | Livello di isolamento |
| Joint controllership | Contitolarità |
| Just culture | Cultura giusta |
| Keyframe | Fotogramma completo |
| Latency | Latenza |
| Latent condition | Condizione latente |
| Least privilege | Privilegio minimo |
| Legal basis | Base giuridica |
| Level of assurance | Livello di garanzia |
| Likelihood ratio | Rapporto di verosimiglianza |
| Local electronic health record | Cartella clinica elettronica |
| Lock file | File di blocco delle dipendenze |
| Logical clock | Orologio logico |
| Lost event / lost update | Evento perso / aggiornamento perduto |
| Man in the middle | Attacco dell'intermediario |
| Manufacturer | Fabbricante |
| Master patient index | Indice principale del paziente |
| Media session | Sessione media |
| Medical device | Dispositivo medico |
| Medication reconciliation | Riconciliazione terapeutica |
| Minimum services ≈ | Servizi minimi |
| Monotonic clock | Orologio monotono |
| Multimorbidity | Multimorbilità |
| Mutual TLS | Autenticazione bilaterale TLS |
| National electronic health record ≈ | Fascicolo sanitario elettronico |
| Near miss | Quasi evento |
| Negative test | Prova negativa |
| Network emulator | Emulatore di rete |
| No-show | Mancata presentazione |
| Non-persistent cache | Cache non persistita |
| Non-repudiation | Non ripudio |
| Non-transmissible | Non conferibile |
| Notified body | Organismo Notificato |
| Observable quantity | Grandezza |
| Observation | Misura |
| Observation timestamp | Istante di rilevazione |
| Observability | Osservabilità |
| Official display | Display ufficiale |
| Optimistic concurrency | Concorrenza ottimistica |
| Orchestration | Orchestrazione |
| Organisational health record | Dossier sanitario |
| Outbox relay | Relay dell'outbox |
| Overbooking | Overbooking |
| Palpation | Palpazione |
| Partial failure | Guasto parziale |
| Participant | Partecipante |
| Partition key | Chiave di partizionamento |
| Pathway deviation | Deviazione dal percorso |
| Patient | Paziente |
| Patient digital readiness | Compliance digitale dell'assistito |
| Patient identification | Identificazione |
| Patient summary | Profilo sanitario sintetico |
| Percussion | Percussione |
| Perfect negotiation | Negoziazione perfetta |
| Perfusion index | Indice di perfusione |
| Periodic seal | Sigillo periodico |
| Personal data breach | Violazione dei dati personali |
| Phantom event / phantom service | Evento fantasma / prestazione fantasma |
| Physical examination | Esame obiettivo |
| Physician-to-physician teleconsultation ≈ | Teleconsulto |
| Pinning | Fissaggio della versione |
| Placing on the market | Immissione sul mercato |
| Point of delivery | Punto di erogazione |
| Positive / negative predictive value | Valore predittivo positivo / negativo |
| Post-market surveillance | Sorveglianza post-commercializzazione |
| Practitioner role | Ruolo organizzativo |
| Prevalence | Prevalenza |
| Priority class ≈ | Codice di priorità |
| Privacy notice | Informativa |
| Processor | Responsabile del trattamento |
| Profile | Profilo |
| Prognosis | Prognosi |
| Progress notes | Diario clinico |
| Protection profile | Profilo di protezione |
| Provenance attestation | Attestazione di provenienza |
| Provenance level | Livello di provenienza |
| Pseudonymisation | Pseudonimizzazione |
| Readiness and liveness | Prontezza e vivacità |
| Recording mode | Modalità con registrazione |
| Record merge | Fusione anagrafica |
| Recovery point / time objective | Punto / tempo di ripristino |
| Red flag | Segnale d'allarme |
| Reference-based demographics | Anagrafica per riferimento |
| Region of entitlement / delivery ≈ | Regione di assistenza / di erogazione |
| Remote monitoring plan ≈ | Piano di telemonitoraggio |
| Remote patient monitoring ≈ | Telemonitoraggio |
| Report ≈ | Referto |
| Reporting for reimbursement ≈ | Rendicontazione |
| Reporting window | Finestra di refertazione |
| Reproducible build | Costruzione riproducibile |
| Requested service | Prestazione richiesta |
| Rescheduling | Riprogrammazione |
| Residual risk | Rischio residuo |
| Resolution status | Stato di risoluzione |
| Resource | Risorsa |
| Revocation | Revoca |
| Revocation checking | Verifica della revoca |
| Risk | Rischio |
| Row level security | Sicurezza a livello di riga |
| Saga | Saga |
| Salt / pepper | Sale / pepe |
| Secret rotation | Rotazione del segreto |
| Secure context | Contesto sicuro |
| Selective forwarding | Inoltro selettivo |
| Selective restore | Ripristino selettivo |
| Sensitivity / specificity | Sensibilità / specificità |
| Sensitivity label | Livello di riservatezza |
| Sentinel event | Evento sentinella |
| Separation of duties | Separazione dei compiti |
| Service catalogue | Catalogo delle prestazioni |
| Service centre ≈ | Centro servizi |
| Session location address | Indirizzo di svolgimento |
| Session technical report | Rapporto tecnico di sessione |
| Sign / symptom | Segno / sintomo |
| Signalling | Segnalazione |
| Significant change | Modifica sostanziale |
| Slicing | Slicing |
| Slot | Slot |
| Software bill of materials | Distinta dei materiali software |
| Software safety classification | Classe di sicurezza software |
| Special categories of personal data | Categorie particolari di dati |
| Strong consistency | Consistenza forte |
| Substitution chain | Catena di sostituzione |
| Support administrator ≈ | Amministratore di sostegno |
| Suspected diagnosis | Sospetto diagnostico |
| Symmetric NAT | NAT simmetrico |
| Syndrome | Sindrome |
| Synthetic data / synthetic flag | Dato sintetico / marcatore di sinteticità |
| System administrator ≈ | Amministratore di sistema |
| Technical alert | Allarme tecnico |
| Technical documentation | Fascicolo tecnico |
| Technical pre-check | Pre-verifica tecnica |
| Technical threshold | Soglia tecnica |
| Tele-advice ≈ | Teleconsulenza medico-sanitaria |
| Tele-care ≈ | Teleassistenza |
| Telemedicine | Telemedicina |
| Telerehabilitation ≈ | Teleriabilitazione |
| Tele-reporting ≈ | Telerefertazione |
| Tenant | Tenant |
| Terminology gateway | Gateway terminologico |
| Test double | Doppio di prova |
| Third party in session | Terzo in sessione |
| Threat model | Modello di minaccia |
| Time series | Serie temporale |
| Timestamp token | Marca temporale |
| Trace / traceability | Traccia / tracciabilità |
| Transaction time / valid time | Tempo di sistema / tempo di validità |
| Transactional outbox | Outbox transazionale |
| Treatment adherence | Aderenza terapeutica |
| Trend | Tendenza |
| Triage | Triage |
| Trust anchor | Ancora di fiducia |
| Trust boundary | Confine di fiducia |
| Typed outcome | Esito tipizzato |
| Ubiquitous language | Linguaggio ubiquo |
| UI label | Etichetta di interfaccia |
| Unique device identification | Identificazione unica del dispositivo |
| Use error / abnormal use | Errore d'uso / uso anomalo |
| Value object | Oggetto valore |
| Versioning | Versionamento |
| Video visit ≈ | Televisita |
| Virtual waiting room | Sala d'attesa virtuale |
| Vigilance | Vigilanza |
| Write skew | Scrittura obliqua |

---

## 8. How an entry is added, corrected and withdrawn

A glossary without a maintenance process degrades within a few months, and it degrades in a
particularly damaging way: the wrong entries stay and continue to be cited. The rules that follow
are operational and hold for anybody proposing a change.

1. **An entry comes in with its source.** Nature N, G or S with the precise citation, or nature P
   with the reason why the project definition is necessary. An entry without a source and without
   necessity is rejected in review, however useful it may be.
2. **An Italian entry without an English rendering is not an entry.** The integrality of the two
   languages is a constraint of the project, and for the glossary the rule is stricter than
   elsewhere. Where the English equivalent is not exact, the rendering **and** the warning are
   written: omitting the rendering is not an admitted alternative.
3. **An entry this guide does not introduce does not come in.** The criterion of admission is not
   the abstract usefulness of the term: it is that at least one module or one area uses it. If a new
   entry is needed, the passage that introduces it is written first.
4. **Terms are not renamed: they are deprecated.** Renaming breaks the correspondence between code
   already written, data already recorded and events already published. The old entry stays, marked
   as deprecated, with the pointer to the new one and the date.
5. **Every new domain event passes through here.** The name of the event is a term of the language:
   if it is not in the glossary, the event does not yet exist.
6. **Traps are added when they are discovered.** If a confusion has produced a real defect, its
   description belongs to the corresponding entry. It is the only way in which an error solved once
   stops repeating itself.
7. **What is not verified is marked `[NV]`.** This holds for dates, for normative references, for
   the contents of unpublished documents. A plausible but unverified citation is worse than a
   declared absence, because it gets taken up by whoever reads it.
8. **No entry introduces a clinical threshold, content from a terminology under licence, a real
   datum or a commercial name.** The four prohibitions have no exceptions and admit no
   case-by-case derogations.

---

## 9. Where to continue

**If you are looking for the modelling detail of a domain term.** The
[domain glossary](/05_domain/09-glossario-del-dominio.md), which for each entry declares the
nature of the definition and the chapters in which it is modelled, and the
[chapter on the ubiquitous language](/05_domain/01-linguaggio-ubiquo.md), which establishes **how**
the vocabulary is governed instead of listing **what** it contains.

**If you are looking for the original text of a normative source cited here.** Module
[20 - Primary sources](20-fonti-primarie.md), which points to the texts and not to the summaries. A
glossary is by definition a summary, and summaries age.

**If you have found an entry that seems inaccurate to you.** Opening an issue is worth more than ten
lines of code, and it is worth all the more if you come from the clinical world: the inaccuracies
that whoever writes software does not see are precisely the ones the glossary exists to avoid. The
rules of contribution are in
[`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), which declares
this guide to be a prerequisite.

**If you are about to touch an area of the code.** Module
[18 - Contributing, area by area](18-contribuire-per-area.md), which says area by area what
knowledge is needed before modifying it, and what the typical errors are of whoever arrives from the
other domain.

**Before distributing, integrating or putting anything into service.** The warnings
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
and
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).
Today the product does not bear CE marking, and whoever installs it or places it on the market
assumes the obligations that follow from it.
