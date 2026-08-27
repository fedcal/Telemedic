---
title: Primary sources
sidebar_position: 21
description: "Reasoned list of every primary source the documentation rests on: Italian and European legislation, healthcare interoperability standards, technical standards, process standards and terminologies, with exact particulars, where they are to be found, the repository documents that use them, the recommended reading order, the method for checking that a source is still in force, and the sources deliberately excluded."
---

# Primary sources

This module is the inventory of what the whole documentation rests on. It contains no analysis:
the analysis sits in the modules and in the areas, and is cross-referred to from here. It contains
**particulars**, **where they are to be found**, **actual use in the repository** and, where it
matters, **the order in which to read**.

Three premises determine its shape.

**The first.** The list reflects what the repository **actually uses**. It is not a bibliography
aiming at completeness: it is the map of the sources actually cited in the documents, reconstructed
systematically from the content. A plausible but unused source would be an invitation to cite it
without having read it, which is the very defect this module exists to prevent.

**The second.** In this domain **the sources refer to one another**, and reading them in the wrong
order wastes time. An Italian ministerial decree refers to an agreement between the State and the
Regions for the definitions, to an implementation guide for the format, to a European regulation
for the qualification of the product and to a determination of an authority for the security
measures. The «how to read it» notes present in many entries serve this purpose and nothing else.

**The third.** A source is not true for ever. A repealed act cited as being in force, a guide
superseded by a revision, a standard replaced by a successor: these are errors that propagate
throughout the documentation because they look precise and nobody re-checks them. The checking
method is at [§11](#11-how-to-check-that-a-source-is-still-in-force), and it is part of
contributing, not an optional nicety.

> **Binding rule that governs this module.** Whatever is not verifiable with certainty is marked
> `[NV]`, with the indication of the recipient in one of three permitted forms (area code in
> backticks, question identifier, or external party named according to the rules in
> `CONTRIBUTING.md`) and an indication of what is missing. **Numbers, dates and titles of
> legislation are never invented.** In a document that serves as a reference for all the others,
> an invented particular is the most damaging defect there is: it gets copied, and nobody goes
> back to the source because it already looks verified.

---

## 1. How an entry is read

Every entry has five elements. When one is missing, it is missing for a declared reason.

| Element | What it contains |
|---|---|
| **Name and particulars** | The form in which the source is to be cited in the project's documents. For Italian acts: type, date, number, official publication where verified. For European acts: the form «Regulation/Directive (EU) year/number». For standards: designation, number, **version or revision**, date |
| **What it establishes** | One sentence. Not a summary: the subject matter of the source, so that it can be recognised |
| **Where it is to be found** | The official publication channel, not a direct link: addresses change, channels do not |
| **Where it is used** | The repository documents that rest on it. It is the column that makes the list useful: it says what breaks if the source changes |
| **How it is read** | Present only where the reading order matters, that is, where the source refers to others or presupposes others |

**Markings.** `[NV]` flags a piece of information not verified against a primary source, with an
indication of what needs checking. The absence of a marking means that the particular has been
cross-checked in the project documents that cite it; it does **not** mean that the full text has
been read by whoever writes this module, and the difference is declared at
[§13](#13-what-this-list-does-not-guarantee).

**What is not here.** There are no direct links to the publication pages. It is a deliberate
choice: the addresses of legal databases and of the websites of standards bodies change more often
than this documentation is updated, and a list of dead links is worse than no links at all. What is
given is the channel - the official gazette, the body's register, the standards organisation's
catalogue - and the exact name under which to search.

**The bodies are named.** In this module the authority that issues an act is indicated by its own
name and its own acronym - **AgID**, *Agenzia per l'Italia digitale*, the Italian agency for digital
government, and **ACN**, *Agenzia per la cybersicurezza nazionale*, the national cybersecurity
agency - and not by periphrasis. The reticence the project maintains elsewhere exists so as not to
resolve into proper names **products, companies and licence-bound terminologies**: a public
standard-setting body is none of these, and the issuing authority is as much a part of the act's
particulars as its number and its date. A periphrasis would make the act less retrievable, which is
the opposite of this module's function. The homonymy flagged by module
[01](01-sistema-sanitario-italiano.md) remains: `ACN` also stands for *accordo collettivo
nazionale*, the collective agreement of contracted medicine, which has nothing to do with
cybersecurity.

---

## 2. The reading order, before the list

Anyone who arrives from scratch and starts with the first act in chronological order loses days.
The order that works is by **logical dependency**, and it runs through six questions.

**First: what, in law, is the service the system delivers?** The starting point is the **Accordo
Stato-Regioni 215/CSR del 2020** (the State-Regions Agreement 215/CSR of 2020), which contains the
canonical definitions. Everything else presupposes them: the later decrees do not redefine, they
specify.

**Second: what must the software that delivers it do?** The **DM 21 settembre 2022** (the
Ministerial Decree of 21 September 2022) is the most technically prescriptive act in the Italian
legal order on this subject. It is to be read after the definitions, because it uses the
Agreement's terms without redefining them.

**Third: where does what the software produces end up?** The **DM 7 settembre 2023** (the
Ministerial Decree of 7 September 2023) on the electronic health record (Fascicolo Sanitario
Elettronico) and the **DM 19 novembre 2025** (the Ministerial Decree of 19 November 2025) on the
national telemedicine platform. The second presupposes the first and extends its scheme: reading
them in the reverse order means failing to recognise the cross-references.

**Fourth: what is the product, from the European point of view?** **Regulation (EU) 2017/745**,
read **together with** the guidance **MDCG 2019-11 Rev.1**. The regulation on its own is not
enough: the software qualification tree is in the guidance, and without it Rule 11 of Annex VIII is
all but unreadable.

**Fifth: which obligations fall on whoever installs it?** **Regulation (EU) 2016/679**,
**Directive (EU) 2022/2555** with the decree that transposes it, and the **ACN determinations** that
set the measures. Here the order is the reverse of the intuitive one: the
determination, which is the lowest act in the hierarchy, is the one that is operationally decisive,
because it contains the catalogue of measures.

**Sixth: in what form is the data exchanged?** **FHIR 4.0.1**, then the **Italian implementation
guides** that profile it, then - only if needed - the interoperability profiles and hospital
messaging. The Italian guides are in draft status: reading them before the base standard produces
the mistaken conviction that whatever is missing from them does not exist.

One cross-cutting rule, which holds for the whole list: **the Italian source often refers to a
document not published in the gazette**. It happens at least twice in this subject matter, and it
is a traceability anomaly documented in
[07 §7.3](07-fse-e-infrastrutture-nazionali.md). It is not a misreading: it is the real picture,
and it is to be declared in the conformity documentation rather than concealed.

---

## 3. Italian legislation - the healthcare system

These are the sources that define **who does what** in the health service. They do not concern
software, and they are the premise without which it is impossible to understand who the software
addresses. The treatment is in [01 - The Italian healthcare
system](01-sistema-sanitario-italiano.md).

| Source | What it establishes | Where it is used |
|---|---|---|
| **Decreto legislativo 30 dicembre 1992, n. 502** (Legislative Decree no. 502 of 30 December 1992) | Reorganisation of healthcare legislation: corporatisation, levels of care, State-Regions relations | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 19 giugno 1999, n. 229** (Legislative Decree no. 229 of 19 June 1999) | Rationalisation of the national health service: it completes the scheme of no. 502 | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 21 dicembre 1999, n. 517** (Legislative Decree no. 517 of 21 December 1999) | Relations between the national health service and the universities | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 16 ottobre 2003, n. 288** (Legislative Decree no. 288 of 16 October 2003) | Scientific institutes for research, hospitalisation and healthcare | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 28 agosto 1997, n. 281** (Legislative Decree no. 281 of 28 August 1997) | Rules governing the standing State-Regions Conference and the unified Conference: it is the source that gives force to the **agreements** cited in §4 | [01](01-sistema-sanitario-italiano.md) |
| **Legge 26 febbraio 1999, n. 42** (Law no. 42 of 26 February 1999) | Healthcare professions: abolition of the schedule of permitted tasks and definition of each profession's own field of activity | [01](01-sistema-sanitario-italiano.md) |
| **Legge 8 marzo 2017, n. 24** (Law no. 24 of 8 March 2017) | Safety of care and professional liability | [04](04-identita-e-anagrafiche.md), [10](10-percorsi-di-cura-e-sicurezza.md) |
| **Legge 22 dicembre 2017, n. 219** (Law no. 219 of 22 December 2017) | Informed consent and advance treatment directives | [03](03-il-dato-clinico.md) |
| **Decreto legislativo 15 marzo 2024, n. 29** (Legislative Decree no. 29 of 15 March 2024) | Provisions on policies in favour of older people | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 31 marzo 2023, n. 36** (Legislative Decree no. 36 of 31 March 2023) | Codice dei contratti pubblici (the Public Contracts Code): it is the route of access to the public healthcare market | [01](01-sistema-sanitario-italiano.md) |
| **Legge 30 dicembre 2025, n. 199** (Law no. 199 of 30 December 2025) | Budget law for 2026. Two distinct provisions matter for the project: art. 1, **subsections 405-406**, funds the services for cross-border exchange of health documents; art. 1, **subsections 410-412**, allocates 20 million euro for 2026 to AGENAS for the strengthening of telemedicine services | [07 §10](07-fse-e-infrastrutture-nazionali.md) for subsections 405-406; [01 §9.4](01-sistema-sanitario-italiano.md) for subsections 410-412 |
| **D.L. 31 dicembre 2025, n. 200** (Decree-Law no. 200 of 31 December 2025), converted with amendments by **legge 27 febbraio 2026, n. 26** (Law no. 26 of 27 February 2026), the *Milleproroghe* | Defers the expiry of the previous tariff regime. `[NV]` on the article and the subsection, to be verified by `COMP` | [01](01-sistema-sanitario-italiano.md) |

**How this block is read.** Not in full. What is needed is the structure - who plans, who delivers,
who pays, who supervises - and that is in module 01, which is written so that they do not have to
be read. You go back to the source when you have to answer a specific question about a competence.

---

## 4. Italian legislation - telemedicine

This is the block from which the **definitions** and the **functional requirements** descend. No
project document may contradict it, and most of the domain rules refer to it.

### 4.1 Acts of the State-Regions Conference

**Accordo Stato-Regioni 17 dicembre 2020, rep. atti n. 215/CSR** (the State-Regions Agreement of
17 December 2020, act no. 215/CSR), Annex A.
It contains the **canonical definitions** of telemedicine services and the conditions under which
they may be delivered. It is the source that determines the domain model: televisita, teleconsulto,
teleconsulenza, teleassistenza and telemonitoraggio are defined here, and the differences between
them change the actors admitted and the mandatory artefacts. It further imposes the **obligation to
produce a report** for the televisita, with an indication of the collaborators taking part and of
the **quality of the connection with confirmation of its suitability**, the **encryption of all
transfers** of voice, video, images and files, the patient's prior adherence, the obligation to
complete the service in the traditional manner when the instrument does not allow its content to be
kept unaltered, and the certification of hardware and software as a medical device «suitable to the
type of service».
*Where it is to be found*: the register of acts of the standing Conference for relations between
the State, the Regions and the Autonomous Provinces.
*Where it is used*: [02](02-prestazioni-di-telemedicina.md),
[10](10-percorsi-di-cura-e-sicurezza.md),
[12](12-crittografia-e-sicurezza.md), [`docs/05_domain/`](/05_domain/00-indice.md) chapters
01, 02, 04 and 09, [`docs/03_functional/02`](/03_functional/02-catalogo-dei-requisiti.md) and
[`04`](/03_functional/04-regole-di-business.md),
[`docs/06_security/03`](/06_security/03-protezione-dei-dati.md),
[`docs/08_compliance/01 §9`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: **first, before any decree.** The later acts use these terms without redefining
them.

**Intesa Stato-Regioni 2014, rep. atti n. 16/CSR** (the State-Regions *Intesa* of 2014, act no.
16/CSR) - national guidance on telemedicine, **superseded in its operational content** by the 2020
Agreement. It is cited for historical reconstruction, never as a source of definitions in force.
*Where it is used*: [02 §2](02-prestazioni-di-telemedicina.md).

**Accordo Stato-Regioni 18 novembre 2021, rep. atti n. 231/CSR** (the State-Regions Agreement of 18
November 2021, act no. 231/CSR) - teleriabilitazione.
*Where it is used*: [02 §2](02-prestazioni-di-telemedicina.md).

*Note common to the force of these acts.* An agreement in the Conference **is perfected by regional
transposition**: its direct effect on the individual provider passes through an act of the Region.
It is the reason why a national project cannot assume uniformity of implementation, and it is one
of the foundations of the principle whereby catalogues and pathways are configuration content and
not code.

### 4.2 Ministerial decrees on telemedicine

**DM 23 maggio 2022, n. 77** (Ministerial Decree no. 77 of 23 May 2022) - models and standards for
the development of territorial care. It places telemedicine inside the territorial organisational
model. It does not lay down software requirements: it **determines the context** in which a service
at a distance is appropriate.
*Where it is used*: [01](01-sistema-sanitario-italiano.md),
[02](02-prestazioni-di-telemedicina.md),
[`docs/08_compliance/01 §9`](/08_compliance/01-inquadramento-normativo.md).

**DM 21 settembre 2022** - GU no. 256 of 2 November 2022, act 22A06184, Annex A.
It is **the most technically prescriptive act** of the Italian framework. It sets: the four minimum
telemedicine services; the micro-service and event-driven architecture; interoperability on the
FHIR model; containers; the distribution models **on national territory**; the **mobile first
paradigm**; multilingual support; conformity with the design guidelines for public digital services
and with those on accessibility; the mandatory organisational presence of a technical **Centro
servizi** (service centre) and a clinical **Centro erogatore** (delivery centre); the maintenance
service levels binding on suppliers; and the **obligation of certification as a medical device**
for telemonitoraggio and for visualisation and reporting in histopathological and radiological
teleconsulti.
*Where it is to be found*: the *Gazzetta Ufficiale della Repubblica Italiana* (the Italian Official
Journal).
*Where it is used*: [01](01-sistema-sanitario-italiano.md),
[02](02-prestazioni-di-telemedicina.md),
[07](07-fse-e-infrastrutture-nazionali.md), [10](10-percorsi-di-cura-e-sicurezza.md),
[15](15-regolatorio-da-zero.md), [`docs/05_domain/`](/05_domain/00-indice.md) chapters 01, 02,
03, 08, 09, [`docs/03_functional/01`](/03_functional/01-attori-e-ruoli.md) and
[`04`](/03_functional/04-regole-di-business.md),
[`docs/06_security/03`](/06_security/03-protezione-dei-dati.md) and
[`08`](/06_security/08-quadro-normativo-e-misure.md),
[`docs/08_compliance/01`](/08_compliance/01-inquadramento-normativo.md),
[`02`](/08_compliance/02-qualificazione-e-classificazione.md) and
[`03`](/08_compliance/03-sistema-di-gestione-della-qualita.md).
*How it is read*: after Accordo 215/CSR, and with the warning that it refers to **methodological
documents that have not been located**, a gap to be verified by `COMP` `[NV]`
([07 §7.3](07-fse-e-infrastrutture-nazionali.md)).

**DM 30 settembre 2022** (the Ministerial Decree of 30 September 2022) - GU no. 298 of 22 December
2022, act 22A07125.
It governs the selection of the solutions: regional operating plans, technical committee,
procurement **exclusively through the tenders of the lead Regions** within the perimeter of the
national plan. **Annex B** contains a rule with a direct effect on the model: a televisita planned
and delivered by a primary care doctor or a paediatrician **does not require a prescription** and
produces a **digital annotation in place of the report**.
*Where it is used*: [01](01-sistema-sanitario-italiano.md),
[02](02-prestazioni-di-telemedicina.md),
[`docs/03_functional/01`](/03_functional/01-attori-e-ruoli.md),
[`02`](/03_functional/02-catalogo-dei-requisiti.md) and
[`04`](/03_functional/04-regole-di-business.md),
[`docs/05_domain/02`](/05_domain/02-le-prestazioni-modellate.md),
[`docs/08_compliance/01 §9`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: Annex B is the part that whoever designs needs; the body of the decree is for
whoever deals with access to the public market.

### 4.3 The electronic health record and the national platforms

**Art. 12 of the D.L. 18 ottobre 2012, n. 179** (Decree-Law no. 179 of 18 October 2012), converted
with amendments by **L. 17 dicembre 2012, n. 221** (Law no. 221 of 17 December 2012), as amended by
**art. 21 of the D.L. 27 gennaio 2022, n. 4** (Decree-Law no. 4 of 27 January 2022), converted with
amendments by **L. 28 marzo 2022, n. 25** (Law no. 25 of 28 March 2022).
It is the **primary legislation** that establishes the electronic health record and gives its
definition; the 2022 amendment is what is commonly called «FSE 2.0».
*Where it is used*: [02 §3](02-prestazioni-di-telemedicina.md),
[07 §2](07-fse-e-infrastrutture-nazionali.md).
*How it is read*: **before the implementing decrees.** The legislative definition qualifies the
health record by its **content** and not by the infrastructure that realises it, and it is the
reason why the infrastructures can change without the legal object changing.

**DM 7 settembre 2023** - GU no. 249 of 24 October 2023.
The implementing framework of the health record: content, subjects, consents, feeding, consultation,
access profiles by role. Two provisions with a direct and non-negotiable effect on the project:
**art. 11, subsection 1**, which requires authentication through the national digital identity
channels; **art. 15, subsection 4**, which **always** excludes insurance companies, loss adjusters
and employers from access. **Art. 12, subsection 3** sets the feeding deadline; **arts. 6 and 9**
govern obscuring and the prohibition on its being inferable.
*Where it is used*: [01](01-sistema-sanitario-italiano.md),
[02](02-prestazioni-di-telemedicina.md),
[07](07-fse-e-infrastrutture-nazionali.md),
[`docs/03_functional/04`](/03_functional/04-regole-di-business.md),
[`docs/05_domain/06`](/05_domain/06-consenso-e-riservatezza.md),
[`docs/07_integration/00`](/07_integration/00-indice.md) and
[`09`](/07_integration/09-obblighi-di-chi-integra.md),
[`docs/08_compliance/01 §9`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: art. 15 must be read in full and not for subsection 4 alone: the list of the
subjects admitted and their conditions is the basis of the authorisation matrix.

**DM 31 dicembre 2024** (the Ministerial Decree of 31 December 2024) - GU no. 53 of 5 March 2025.
Establishment of the health data ecosystem.
*Where it is used*: [07](07-fse-e-infrastrutture-nazionali.md),
[`docs/08_compliance/01 §9`](/08_compliance/01-inquadramento-normativo.md).

**DM 19 novembre 2025** - GU no. 301 of 30 December 2025, act 25A06938.
It governs the processing of data in the national telemedicine platform. It is the most recent act
and the one with the largest number of product consequences. The provisions the project uses:
**art. 7**, which creates **ten new document types** of the health record dedicated to
telemedicine, with an information set published in the gazette - it is the source from which the
canonical dataset of the televisita report descends; **art. 12**, under which the regional
infrastructures **do not retain** the data and the documents generated; **arts. 14-15**, recording
of operations and security measures; **Annex 1, § 2.20**, the information set of the televisita
report; **Annex 3, §§ 5.1 and 5.2**, authentication and access profiles; **Annex 4**, which sets
the retention periods (twenty-four months for the traceability logs, twelve for access and
authentication data), the obligation of a second factor in addition to digital identity, the
prohibition on multiple simultaneous accesses, and the **obligation to keep an inventory of the
software components including third-party and open source libraries**.
*Where it is used*: twenty-eight documents of the repository, among them
[01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md),
[03](03-il-dato-clinico.md), [04](04-identita-e-anagrafiche.md),
[07](07-fse-e-infrastrutture-nazionali.md), [10](10-percorsi-di-cura-e-sicurezza.md),
[12](12-crittografia-e-sicurezza.md), the whole domain area,
[`docs/04_protocols/03`](/04_protocols/03-documenti-clinici.md),
[`docs/06_security/04`](/06_security/04-tracciamento.md) and
[`08`](/06_security/08-quadro-normativo-e-misure.md).
*How it is read*: **the annexes count for more than the body.** And Annex 4, § 7, **incorporates by
reference the chapter of a regional technical tender specification** and extends the measures laid
down there to all the regional infrastructures. `[NV]` - that chapter **has not been located**, a gap to be verified by `COMP`:
until it is read, no assertion of conformity with those measures is tenable.

### 4.4 How these acts fit together

The sources of §4 form a four-level chain, reconstructed in
[02 §3](02-prestazioni-di-telemedicina.md): **primary legislation** → **acts of the State-Regions
Conference** → **ministerial decrees** → **cross-cutting technical rules of the public
administration**. The binding force decreases as the level rises and operativeness increases: the
statute establishes, the agreement defines, the decree prescribes, the technical rule says how it is
done.

From this descends the citation rule adopted throughout the repository: **you cite the lowest level
that contains the prescription**, and you go back up only when you need to show that the
prescription has a foundation. Citing primary legislation for a format requirement is a
methodological error that makes the citation unverifiable.

---

## 5. Italian legislation - digital administration, identity, security

### 5.1 The digital administration code and identity

**Decreto legislativo 7 marzo 2005, n. 82** (Legislative Decree no. 82 of 7 March 2005) - Codice
dell'amministrazione digitale (the Italian Digital Administration Code).
The articles the project uses: **art. 64**, which governs the public system for the management of
digital identity and establishes, at subsection 2-*quater*, that access to the online services of
public administrations that require electronic identification takes place through the national
channels; **art. 50-*ter***, the legal basis of the national platform for data interoperability;
**art. 71**, the basis of the AgID guidelines; **art. 52, subsection 2**, on the
re-use of public administration data, used to place two terminologies in the conditional
redistribution regime.
*Where it is used*: [04](04-identita-e-anagrafiche.md),
[07](07-fse-e-infrastrutture-nazionali.md),
[12](12-crittografia-e-sicurezza.md),
[`docs/06_security/02`](/06_security/02-identita-e-accessi.md),
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md).

**DPCM 24 ottobre 2014** (the Prime Ministerial Decree of 24 October 2014), art. 1, subsection 1,
letter i).
It defines the **service provider** in the identity federation as whoever *delivers online
services*. It is the source from which the constraint descends whereby **the project cannot be
accredited**: the service provider is whoever installs.
*Where it is used*: [04](04-identita-e-anagrafiche.md), decision `D36`, constraint [`V-05`](../11_registri/01-vincoli-in-vigore.md#v-05),
[`docs/07_integration/06`](/07_integration/06-identita-e-delega.md).

**Technical rules of the national digital identity channels** and **Avviso AgID n. 41, versione 2,
del 23 marzo 2023** (AgID notice no. 41, version 2, of 23 March 2023) on the use of an alternative
authentication protocol.
The relevant and verified fact: **no identity provider of the public system supports that protocol
in production**, so the channel that can be used remains the signed assertion. The source is the
official forum overseen by the SPID working group, consulted on 25 August 2026, **to be re-verified**.
*Where they are used*: [04](04-identita-e-anagrafiche.md),
[07 §8](07-fse-e-infrastrutture-nazionali.md),
[`docs/06_security/02`](/06_security/02-identita-e-accessi.md),
[`docs/07_integration/06`](/07_integration/06-identita-e-delega.md).
*How they are read*: **the technical rules before the product profile.** The authentication context
demanded is configured statically per identity provider instance, and this fact has an
architectural consequence that is discovered late if one starts from the documentation of the
federation product.

**Legge 30 settembre 2003, n. 269** (Law no. 269 of 30 September 2003) and **Legge 24 novembre
2003, n. 326** (Law no. 326 of 24 November 2003), for the establishment and the rules governing the
tessera sanitaria (the national health card).
*Where they are used*: [04](04-identita-e-anagrafiche.md),
[07 §4](07-fse-e-infrastrutture-nazionali.md).

**Decreto legislativo 25 luglio 1998, n. 286** (Legislative Decree no. 286 of 25 July 1998) and
**decreto legislativo 9 aprile 2003, n. 70** (Legislative Decree no. 70 of 9 April 2003), cited in
[04](04-identita-e-anagrafiche.md) respectively for care for persons without an ordinary tax code
(codice fiscale) and for electronic commerce.

### 5.2 Data protection, the national side

**Decreto legislativo 30 giugno 2003, n. 196** (Legislative Decree no. 196 of 30 June 2003), as
amended by **decreto legislativo 10 agosto 2018, n. 101** (Legislative Decree no. 101 of 10 August
2018). Codice in materia di protezione dei dati personali (the Italian personal data protection
code), brought into line with the European regulation.
*Where it is used*: [03](03-il-dato-clinico.md), [04](04-identita-e-anagrafiche.md).
*How it is read*: **after** the European regulation, never before. The national code contains what
the regulation leaves to the member states, not a self-standing body of rules.

### 5.3 National cybersecurity

**Decreto legislativo 4 settembre 2024, n. 138** (Legislative Decree no. 138 of 4 September 2024) -
transposition of the European directive on the security of network and information systems. In
force since **16 October 2024**. It identifies the **essential** and **important** entities by
sector: **healthcare** is in Annex I, the **manufacture of medical devices** in Annex II.
**Art. 24, subsection 2, letter l)** and **subsection 3** bear directly on the relationship with
suppliers.
*Where it is used*: [03 §9](03-il-dato-clinico.md), [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/04`](/06_security/04-tracciamento.md),
[`07`](/06_security/07-catena-di-fornitura.md),
[`08`](/06_security/08-quadro-normativo-e-misure.md),
[`10`](/06_security/10-risposta-agli-incidenti.md),
[`docs/08_compliance/01 §4`](/08_compliance/01-inquadramento-normativo.md).

**Determinazione ACN n. 379907 del 19 dicembre 2025** (ACN determination no. 379907 of 19 December
2025).
It sets the baseline security specifications and, at **art. 3, subsection 1**, the rule on the
deadline: **eighteen months from receipt of the notice of inclusion** in the list. Applicable from
**15 January 2026** (art. 9, subsection 3); it replaces determination no. 164179 of 14 April 2025.
Confirmed catalogue: **37 measures and 87 requirements** for important entities, **43 measures and
116 requirements** for essential ones.
*Where it is used*: [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/01`](/06_security/01-modello-di-minaccia.md) and
[`08`](/06_security/08-quadro-normativo-e-misure.md),
[`docs/08_compliance/01 §4`](/08_compliance/01-inquadramento-normativo.md),
[`docs/09_roadmap/00 §9.1`](/09_roadmap/00-indice.md).
*How it is read*: **the deadline is not a date.** «31 October 2026» appears in no act: it is the
outer limit of the first wave. The deadline is subjective for each addressee, and this is the fact
that no roadmap can hard-code.
`[NV]` - the **detailed annexes have not been read line by line**, to be verified by `COMP`: no project document quotes a
specific requirement verbatim. What are cited are the codes of the measures, which are public and
verified.

**Determinazione n. 127434 del 13 aprile 2026** (determination no. 127434 of 13 April 2026) - for
the entities included in 2026: measures by **31 July 2027**, notifications from **1 January 2027**.
**Determinazione n. 127437 del 2026** (determination no. 127437 of 2026), **art. 18** - obligation
to declare to ACN, by name, the **relevant suppliers**, with company name, tax code,
**country of the registered office**, codes of the procurement nomenclature and criterion of
relevance.
*Where they are used*: [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/08`](/06_security/08-quadro-normativo-e-misure.md),
[`docs/08_compliance/01 §4`](/08_compliance/01-inquadramento-normativo.md),
[`docs/09_roadmap/00 §9.1`](/09_roadmap/00-indice.md).
*How they are read*: art. 18 of the second is what turns data sovereignty from a positioning
argument into **a datum the customer has to report to an authority**. It is the operational
foundation of the constraint on the absence of mandatory non-EU components.

**Legge 28 giugno 2024, n. 90** (Law no. 90 of 28 June 2024) - provisions on the strengthening of
national cybersecurity. It concerns public administrations, health authorities included. **Art.
1**: report within twenty-four hours and full notification within seventy-two. **Art. 8**:
cybersecurity officer. **Art. 14**: public contracts for IT goods and services in contexts
connected with the protection of strategic national interests.
*Where it is used*: [03 §9](03-il-dato-clinico.md),
[`docs/06_security/10`](/06_security/10-risposta-agli-incidenti.md),
[`docs/08_compliance/01 §4.1`](/08_compliance/01-inquadramento-normativo.md).

**DPCM 30 aprile 2025** (the Prime Ministerial Decree of 30 April 2025) (GU of 5 May 2025), as
amended by **DPCM 2 ottobre 2025** (the Prime Ministerial Decree of 2 October 2025) - essential
cybersecurity elements in public contracts, with award-premium criteria that are also geographical.
`[NV]` - **the texts have not been read on a primary source** in any of the project's research, and
it is not verified whether a telemedicine supply falls within the technological categories of the
annex. It must be checked by `COMP` in coordination with a procurement adviser before any use in a tender.
*Where it is used*: [`docs/08_compliance/01 §4.1`](/08_compliance/01-inquadramento-normativo.md).

**Circolare AgID 18 aprile 2017, n. 2/2017** (AgID circular no. 2/2017 of 18 April 2017) - minimum
security measures for public administrations, with the
classification of the measures. The project cites its **codes** (among them `ABSC 2.1.1`, `2.3.3`,
`3.5.1`, `4.7.1`, `4.8.1`, `4.8.2`, `5.6.1` and class 13), not the text of the individual
requirements.
*Where it is used*: [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/04`](/06_security/04-tracciamento.md).

**AgID guidelines on security in ICT procurement**, appendix on eligible security
requirements. The project uses requirements **R30** (recording of accesses on an archive that
cannot be erased by a reset), **R33** (inventory of components) and **R45**, and actions `AP2`,
`AP3`, `AP4` together with the chapter on personal data protection, which DM 21 settembre 2022
makes mandatory for the regional infrastructures.
*Where they are used*: [02 §appendix](02-prestazioni-di-telemedicina.md),
[12](12-crittografia-e-sicurezza.md),
[`docs/06_security/04`](/06_security/04-tracciamento.md) and
[`07`](/06_security/07-catena-di-fornitura.md).

### 5.4 Qualification of cloud services

Three distinct acts, with different authorities, subject matter and effects. Confusing them
produces false assertions of conformity, and it is the reason why
[07 §6](07-fse-e-infrastrutture-nazionali.md) separates them explicitly.

| Act | What it establishes |
|---|---|
| **Determinazione ACN n. 306 del 18 gennaio 2022** (ACN determination no. 306 of 18 January 2022) | Methodology for classifying the data and the services of public administrations as **strategic**, **critical** and **ordinary** |
| **Determinazione ACN n. 307 del 18 gennaio 2022** (ACN determination no. 307 of 18 January 2022) | Regulation on the qualification of cloud services |
| **Decreto direttoriale ACN n. 21007/24 del 27 giugno 2024** (ACN directorial decree no. 21007/24 of 27 June 2024) | New unified regulation, applicable from **1 August 2024**; levels **QC1-QC4** for the services and **QI1-QI4** for the infrastructures |

*Where they are used*: [01 §appendix](01-sistema-sanitario-italiano.md),
[07 §6](07-fse-e-infrastrutture-nazionali.md).
*How they are read*: **the object is not the application software.** They are the cloud services and
the infrastructures that host them, and qualification is obtained by a service provider, not by a
software project. DM 19 novembre 2025, Annex 4, expressly refers to the unified regulation.

### 5.5 Public administration interoperability

**Guidelines on the technical interoperability of public administrations** and guidelines
«**Tecnologie e standard per la sicurezza dell'interoperabilità tramite API dei sistemi
informatici**» (technologies and standards for the security of interoperability through the APIs of
computer systems), adopted with **Determinazione AgID n. 547 del 1° ottobre 2021** (AgID
determination no. 547 of 1 October 2021) pursuant to art. 71 of the Codice dell'amministrazione
digitale and in compliance with the notification procedure of **Directive (EU) 2015/1535**. They
define interaction, security and tracing patterns. **Binding on public administrations**, and
referred to by DM 21 settembre 2022 among the rules the regional infrastructures must comply with.
*Where they are used*: [07 §5.2](07-fse-e-infrastrutture-nazionali.md),
[`docs/04_protocols/01`](/04_protocols/01-principi-di-interoperabilita.md).

**Guidelines on the technological infrastructure of the national digital data platform**, adopted
with **Determinazione AgID n. 627/2021** (AgID determination no. 627/2021) and **updated in May
2025** (version 2). Legal basis: art. 50-*ter* of the Codice dell'amministrazione digitale.
*Where they are used*: [07 §5.3](07-fse-e-infrastrutture-nazionali.md).
*How they are read*: the misunderstanding to be avoided is documented in the module - the platform
**is not a proxy** and does not carry the data: it intervenes beforehand, to establish the
authorisation, and stays out of the flow.

### 5.6 Accessibility, the national side

**Legge 9 gennaio 2004, n. 4** (Law no. 4 of 9 January 2004) - provisions to promote and simplify
access by users and, in particular, by people with disabilities to IT tools. It is the **direct**
obligation when the customer is a public administration, that is, in the project's principal use
case.
**Decreto legislativo 27 maggio 2022, n. 82** (Legislative Decree no. 82 of 27 May 2022) -
transposition of the European directive on the accessibility of products and services.
**AgID guidelines on accessibility** and **model accessibility statement**.
*Where they are used*: [01 §appendix](01-sistema-sanitario-italiano.md),
[02 §appendix](02-prestazioni-di-telemedicina.md), [15 §8.5](15-regolatorio-da-zero.md),
[`docs/01_technical/04`](/01_technical/04-frontend.md),
[`docs/03_functional/06`](/03_functional/06-accessibilita-e-usabilita.md),
[`docs/08_compliance/01 §8`](/08_compliance/01-inquadramento-normativo.md) and
[`06`](/08_compliance/06-usabilita-e-accessibilita.md).
*How they are read*: **the direct route is the national law on the public customer**, not the
directive on the accessibility of products and services, whose scope *ratione personae* for
telemedicine is contested and to be verified by `COMP` `[NV]`.

### 5.7 National terminologies and catalogues

| Source | What it establishes | Where it is used |
|---|---|---|
| **DM 18 dicembre 2008** (the Ministerial Decree of 18 December 2008) | Adoption of the Italian 2007 version of the international classification of diseases, ninth revision, clinical modification | [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), [`docs/05_domain/07`](/05_domain/07-terminologie-nel-dominio.md) |
| **DM 23 giugno 2023** (the Ministerial Decree of 23 June 2023) and **DM 26 novembre 2024** (the Ministerial Decree of 26 November 2024) | National fee schedule (nomenclatore) and catalogue of services | as above |
| **Art. 5 of the L. 22 aprile 1941, n. 633** (Law no. 633 of 22 April 1941) | Exclusion of official acts of the State from copyright protection: it is the foundation of the conditional redistribution regime of the two preceding entries, together with art. 52, subsection 2, of the Codice dell'amministrazione digitale | decision `D31`, [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) |
| **Glossario nazionale di telemedicina, versione 1.0.0 del 29 gennaio 2026** (the national telemedicine glossary, version 1.0.0 of 29 January 2026) | National reference vocabulary | [`docs/05_domain/09`](/05_domain/09-glossario-del-dominio.md). **The entry-by-entry alignment has not been carried out** and must be done before the domain glossary is frozen and before translation ([`Q-146`](../11_registri/02-questioni-aperte.md#q-146)) |

---

## 6. European legislation

### 6.1 Medical devices

**Regulation (EU) 2017/745** of the European Parliament and of the Council, on medical devices.
Applicable from **26 May 2021**, replacing Directive 93/42/EEC.
It is the source on which the qualification of the whole product depends. The provisions actually
used in the repository:

| Reference | What it establishes | Where it is used |
|---|---|---|
| **Art. 2, point 12** | Definition of intended purpose, which can also be derived from promotional material | [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171), [`08_compliance/01 §11`](/08_compliance/01-inquadramento-normativo.md) |
| **Art. 2, point 29** | Putting into service | [15 §3](15-regolatorio-da-zero.md), [`08_compliance/01 §12`](/08_compliance/01-inquadramento-normativo.md) |
| **Art. 2, point 30** | Definition of manufacturer, with **two cumulative elements** | [15 §3](15-regolatorio-da-zero.md), [`08_compliance/01 §2`](/08_compliance/01-inquadramento-normativo.md) |
| **Art. 5, paragraph 5** | Exemption for devices manufactured and used within health institutions - cited **only in order to rule it out** | [`08_compliance/01 §2`](/08_compliance/01-inquadramento-normativo.md) |
| **Art. 7** | Prohibition on misleading claims: it applies **already today** and **does not presuppose the marking** | [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) |
| **Art. 8** | Presumption of conformity of harmonised standards | [15 §5.1](15-regolatorio-da-zero.md) |
| **Art. 10** | Obligations of the manufacturer | [`08_compliance/01 §2`](/08_compliance/01-inquadramento-normativo.md) |
| **Arts. 11, 13, 14, 16(1)(a)** | Authorised representative, importer, distributor, and the case of the **white-label product** | [`08_compliance/01 §2`](/08_compliance/01-inquadramento-normativo.md) |
| **Art. 61 and Annex XIV** | Clinical evaluation | [`08_compliance/07`](/08_compliance/07-valutazione-clinica.md) |
| **Arts. 86-87** | Periodic safety update report, reporting of serious incidents | [`08_compliance/08`](/08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Annex I** | General safety and performance requirements, including §§ 17.2 and 17.4 on cybersecurity and the language prescriptions | [`08_compliance/04`](/08_compliance/04-fascicolo-tecnico.md), [`06_security/08`](/06_security/08-quadro-normativo-e-misure.md) |
| **Annex II** | Content of the technical documentation; item 1.1 b) concerns the unique identifier | [`08_compliance/04`](/08_compliance/04-fascicolo-tecnico.md) |
| **Annex VII, section 1.2.8** | Obligation on notified bodies to **publish their standard tariffs** | [15](15-regolatorio-da-zero.md), [`08_compliance/09`](/08_compliance/09-percorso-e-calendario.md) |
| **Annex VIII, Rule 11** | Classification rule for software | [10 §appendix](10-percorsi-di-cura-e-sicurezza.md), [15 §4](15-regolatorio-da-zero.md), [`08_compliance/02`](/08_compliance/02-qualificazione-e-classificazione.md) |
| **Annex IX** and **Annex XI** | Conformity assessment procedures | [15 §6](15-regolatorio-da-zero.md), [`08_compliance/04`](/08_compliance/04-fascicolo-tecnico.md), [`09`](/08_compliance/09-percorso-e-calendario.md) |
| **Annex XVI** | Products without an intended medical purpose | [15 §2](15-regolatorio-da-zero.md) |

`[NV]` - the **precise numbering of some sections** of Annexes I, IX and XI, the designation codes
of the implementing regulation, the number of the point of art. 2 on the serious incident and the
division between the paragraphs of arts. 86 and 87 according to class **have not been verified
against the text**, to be verified by `COMP`.
*Where it is to be found*: the Official Journal of the European Union, Italian version.
*How it is read*: **not on its own.** Annex VIII, Rule 11, without the guidance that follows is all
but unreadable for a piece of software.

**Regulation (EU) 2017/746** - in vitro diagnostic medical devices. Cited for the boundary of scope
and for the parallel exclusion from the regulation on cyber resilience.
*Where it is used*: [15 §2](15-regolatorio-da-zero.md),
[`06_security/08`](/06_security/08-quadro-normativo-e-misure.md).

**Guidance of the Medical Device Coordination Group (MDCG).** They are not binding acts, but they
are the document on which the notified body builds its own assessment: departing from them requires
a written justification, and that makes them operationally decisive.

| Document | What it contains | Where it is used |
|---|---|---|
| **MDCG 2019-11**, *Qualification and classification of software in Regulation (EU) 2017/745 and Regulation (EU) 2017/746*, **revision 1 of June 2025** | The five-step qualification decision tree; the case material of Annex I; the breakdown of Rule 11 into three sub-rules at § 4.2.1; the **delimitation of modules** at § 7; the orientation matrix of Annex III | [10](10-percorsi-di-cura-e-sicurezza.md), [15](15-regolatorio-da-zero.md), [`08_compliance/01`](/08_compliance/01-inquadramento-normativo.md) and [`02`](/08_compliance/02-qualificazione-e-classificazione.md) |
| **MDCG 2019-16**, revision 1 | How to satisfy the Annex I requirements on cybersecurity | [12](12-crittografia-e-sicurezza.md), [15 §5.7](15-regolatorio-da-zero.md), [`08_compliance/03`](/08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **MDCG 2020-1** | Clinical evaluation of software: the **three components of the evidence** - validity of the scientific association, technical or analytical performance, clinical performance. `[NV]` on the current revision, to be verified by `COMP` | [15 §7](15-regolatorio-da-zero.md), [`08_compliance/07`](/08_compliance/07-valutazione-clinica.md) |
| **MDCG 2018-5** | Criterion of **major revision** and unique software identifiers | [15 §§7, 9](15-regolatorio-da-zero.md) |
| **MDCG 2020-3** | Significant changes. `[NV]` on scope and current revision, to be verified by `COMP`: the decision diagrams are widely used for devices certified under the regulation as well, and the transposition must be verified | [`08_compliance/08`](/08_compliance/08-sorveglianza-post-commercializzazione.md) |

**Documents of the *International Medical Device Regulators Forum*.** Used for the orientation
matrix referred to by Annex III of MDCG 2019-11 Rev.1, which crosses the significance of the
information with the healthcare situation. The relevant line, reported verbatim in the project's
documentation, is that the table **does not take class I software into account**.
*Where they are used*: [15 §§4, 10](15-regolatorio-da-zero.md).

### 6.2 Data protection

**Regulation (EU) 2016/679** - protection of natural persons with regard to the processing of
personal data. Applicable from **25 May 2018**.
Provisions used: **art. 4, points 7 and 8** (controller and processor), **point 15** (data
concerning health), **art. 9** (special categories), **art. 15, paragraph 4** (limit on the right
to obtain a copy where it adversely affects the rights of others), **arts. 24, 26, 28**
(responsibility, joint controllership, processor), **art. 25** (data protection by design,
addressed to the controller), **art. 32** (security, with the obligation of a **process for
regularly testing and assessing** the effectiveness of the measures), **art. 35, paragraph 3, point
(b)** (impact assessment).
*Where it is used*: [03](03-il-dato-clinico.md), [04](04-identita-e-anagrafiche.md),
[12](12-crittografia-e-sicurezza.md), the whole security area,
[`08_compliance/01 §3`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: **art. 4, point 15, before everything else.** The premise that governs the whole
security area - the mere fact that a person has a session with a specialist is data concerning
health - descends from there, not from a discretionary assessment.

### 6.3 Network security and product resilience

**Directive (EU) 2022/2555** - measures for a high common level of cybersecurity across the Union.
Transposed in Italy by decreto legislativo 4 settembre 2024, n. 138 (§5.3).
*Where it is used*: [`06_security/08`](/06_security/08-quadro-normativo-e-misure.md),
[`08_compliance/01 §4`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: **after the transposing decree and after the determinations**, not before. The
project works on the national implementation, and the directive serves only to reconstruct the
origin of a rule.

**Regulation (EU) 2024/2847** - horizontal cybersecurity requirements for products with digital
elements. In force since **10 December 2024**. Chapter on conformity assessment bodies from **11
June 2026**; **reporting obligations under art. 14 from 11 September 2026**; general application,
essential requirements and marking from **11 December 2027** (art. 71). Provisions used: **art. 2,
paragraph 2** (exclusion of products covered by the medical device rules, which **operates by
product and not by subject**); **art. 3, point 14, and art. 24** (open-source software steward,
which must be a **legal person**).
*Where it is used*: [12](12-crittografia-e-sicurezza.md), [15 §8](15-regolatorio-da-zero.md),
[`06_security/03`](/06_security/03-protezione-dei-dati.md),
[`07`](/06_security/07-catena-di-fornitura.md),
[`08`](/06_security/08-quadro-normativo-e-misure.md),
[`10`](/06_security/10-risposta-agli-incidenti.md),
[`08_compliance/01 §5`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: **art. 2, paragraph 2, first**, because it determines which artefacts of the
project fall under the regulation and which do not. The artefact → regime table that descends from
it is in [`08_compliance/01 §5.1`](/08_compliance/01-inquadramento-normativo.md).

### 6.4 Product liability

**Directive (EU) 2024/2853** - liability for damage caused by defective products. Transposition
deadline **9 December 2026**; it applies to products placed on the market or put into service
**after** that date. Provisions used: **art. 10** (presumption of defectiveness in the event of
non-compliance with mandatory safety requirements of Union law), **art. 11** (exemption of the
manufacturer of a component, which operates **only** if the component's instructions were correct
and complete), **art. 15** (prohibition on contractual exclusion of liability towards the injured
party).
*Where it is used*: decision `D28`,
[`08_compliance/01 §6`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: it is the **only source in the framework that operates towards the injured
party**, that is, towards a person who has accepted no licence. The warranty-disclaimer clauses of
the project's licence hold between the parties, not towards the patient.
`[NV]` - the literal wording of art. 4 and of the recitals on the notion of product, and the
numbering of the equivalent Italian provision after transposition, **are not verified** by `COMP`.

### 6.5 Accessibility

**Directive (EU) 2019/882** - accessibility requirements for products and services. Transposed by
decreto legislativo 27 maggio 2022, n. 82. It applies to products and services placed on the market
from **28 June 2025**.
`[NV]` - **telemedicine is not named** among the categories covered; the qualification of a video
consultation service as a number-independent interpersonal communication service is contested and
not ascertained by `COMP`.

**Directive (EU) 2016/2102** - accessibility of the websites and mobile applications of public
sector bodies. In Italy it operates through legge 9 gennaio 2004, n. 4, and the AgID guidelines.
When the customer is a public administration, **the obligation is direct**.
*Where they are used*: [15 §8.5](15-regolatorio-da-zero.md),
[`08_compliance/01 §8`](/08_compliance/01-inquadramento-normativo.md) and
[`06`](/08_compliance/06-usabilita-e-accessibilita.md).
*How they are read*: the chain is **directive → European technical standard → web content
accessibility criteria**, and it must be walked in that order. The technical standard is at §9.

### 6.6 The European Health Data Space

**Regulation (EU) 2025/327** - European health data space. In force since **26 March 2025**;
general application from **26 March 2027**; **Chapter III from 26 March 2029**, and from **26 March
2031** for the systems referred to in art. 26, paragraph 2. Chapter III introduces a conformity
regime - technical documentation, declaration of conformity, marking, as a rule **without a
notified body** - for **electronic health record systems**, defined by reference to the purpose of
storing, intermediating, exporting, importing, converting, editing or viewing personal electronic
health data belonging to the priority categories.
*Where it is used*: [07 §10](07-fse-e-infrastrutture-nazionali.md),
[15 §8.6](15-regolatorio-da-zero.md),
[`08_compliance/01 §7`](/08_compliance/01-inquadramento-normativo.md).
*How it is read*: **it is the least intuitive point of the whole framework**, because a product may
fall within it **while not being a medical device**.
The **exact mapping of the dates** for each provision and the definitions of art. 2 must
be confirmed against the text by `COMP`: the secondary sources consulted diverge `[NV]`. It is also an open question
whether the project should produce the Chapter III documentation package as well ([`Q-171`](../11_registri/02-questioni-aperte.md#q-171)).

### 6.7 Other European sources of context

| Source | What it establishes | Where it is used |
|---|---|---|
| **Regulation (EU) 2024/1689** | Artificial intelligence systems. **No current function falls within it**; a single addition would change the regime, and that is why the introduction of an artificial intelligence component is treated as a change of regulatory regime and not as a technical choice ([`V-170`](../11_registri/01-vincoli-in-vigore.md#v-170)) | [15 §§2.8, 8.6](15-regolatorio-da-zero.md), [`08_compliance/02`](/08_compliance/02-qualificazione-e-classificazione.md) |
| **Regulation (EU) 2023/2854** | Data generated by connected products; **switching cloud service provider**; interoperability | [15 §8.6](15-regolatorio-da-zero.md) |
| **Regulation (EU) 2024/1183** | European digital identity framework | [03](03-il-dato-clinico.md), [12](12-crittografia-e-sicurezza.md) |
| **Directive (EU) 2015/1535** | Information procedure in the field of technical regulations: it is the procedure followed for the adoption of the national guidelines on interoperability | [07 §5.2](07-fse-e-infrastrutture-nazionali.md) |
| **Directive 93/42/EEC** | Previous rules on medical devices; cited only for historical reconstruction | [15](15-regolatorio-da-zero.md) |

---

## 7. Healthcare interoperability standards

The module that explains them is [05 - The interoperability
standards](05-standard-di-interoperabilita.md); the one that says **how the project uses them** is
the [protocols area](/04_protocols/00-indice.md). Here are the particulars.

**Rule that governs this whole block:** a version not declared is a version not adopted. Every line
carries an exact number and a maturity status.

### 7.1 FHIR and implementation guides

| Specification | Version pinned | Status | Role |
|---|---|---|---|
| **HL7 FHIR** | **4.0.1** | Normative for the parts declared as such | Base standard of the interoperability model. The project declares `4.0.1`, not «R4»: `4.0.0` and `4.0.1` differ in the invariants and in the generated conformance resources |
| **Televisita** guide, HL7 Italia | **0.2.0** | *trial-use*, draft as at 17 September 2025 | Predefined profile for the service and for the report |
| **Teleconsulto** guide, HL7 Italia | **0.2.0** | *trial-use* | Consultation between professionals |
| **Teleassistenza** guide, HL7 Italia | **0.2.0** | *trial-use* | Care service at a distance |
| **Telemonitoraggio** guide, HL7 Italia | **0.2.0** | *trial-use* | Measurement plans and parameters |
| **IT-Core** guide, HL7 Italia | **0.2.0** | *trial-use*, draft as at 30 July 2026 | Italian demographic registries |
| **Subscriptions R5 Backport** | **1.1.0** (11 January 2023) | STU | Notifications on clinical resources |
| **Extensions for Using Data Elements from FHIR R5 in FHIR R4** | **0.1.0** | STU, *maturity level 0* | Details of the virtual service |
| **FHIR Bulk Data Access** | **3.0.0** | *trial-use*, in force since 11 December 2025 | Portability and exit of a tenant |
| **HL7 Version 2 to FHIR** | **1.0.0** | STU 1, **Informative** maps | Mapping reference, **never the basis of a declaration of conformity** |
| **SMART App Launch** | 2.x | Published | Clinical context and scopes over delegated authorisation |
| **SMART Web Messaging** | **1.0.0** STU1, 6 May 2022 | Lower maturity: **documented as experimental** | Dialogue between embedded application and host |

*Where they are to be found*: HL7 International's specification register for the international
guides and the base standard; HL7 Italia's register for the national guides.
*Where they are used*: [06](06-fhir-da-zero.md),
[`docs/04_protocols/02`](/04_protocols/02-fhir.md), the domain area for the model,
[`docs/07_integration/`](/07_integration/00-indice.md) for the contract towards third parties.
*How they are read*: **the base standard before the Italian guides.** The guides are in draft and
incomplete: reading them first produces the mistaken conviction that whatever is missing from them
does not exist. It must further be borne in mind that the **packages of the guides are not copied
into the repository**: the licence statement of a guide does not dispose of third-party rights over
the content included in it, and the check has to be made **artefact by artefact**.

### 7.2 Messaging and clinical documents

**HL7 version 2.5.1** - hospital messaging. The version is pinned at `2.5.1` because it is the one
in which the scheduling structure includes the structured timing segment, absent from the versions
prior to `2.5`.
**HL7 Transport Specification: MLLP** - framing of messages over a stream transport. Bare, it is in
the clear: the project **always** uses it with mutual authentication at transport level.
*Where they are used*: [05 §4](05-standard-di-interoperabilita.md),
[`docs/04_protocols/04`](/04_protocols/04-hl7-v2.md).

**HL7 CDA release 2** - clinical document architecture. In the project the document serialisation
is **replaceable** and the content is modelled as a canonical dataset ([`V-07`](../11_registri/01-vincoli-in-vigore.md#v-07)): no document
template is hard-coded.
*Where it is used*: [05 §5](05-standard-di-interoperabilita.md),
[`docs/04_protocols/03`](/04_protocols/03-documenti-clinici.md),
[`docs/05_domain/04`](/05_domain/04-documenti-clinici.md).
The **templates, the type codes and the indexing metadata** of the ten telemedicine
document types **are not publicly available**, a gap flagged in [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) calling for verification by `COMP` `[NV]`.

### 7.3 IHE interoperability profiles

| Profile | Revision pinned | Status |
|---|---|---|
| **ATNA** | Infrastructure Technical Framework rev. **20.2** (11 November 2025) | Final Text |
| **CT** | Infrastructure Technical Framework rev. **20.2** | Final Text |
| **MHD** | **4.2.5-comment** (16 June 2026) | *ballot*, **not** Final Text |
| **PIXm** | **3.1.0** (4 November 2025) | Trial Implementation |
| **PDQm** | **3.2.0** (4 November 2025) | Trial Implementation |
| **IUA** | rev. **2.5** (18 June 2026) | Trial Implementation |
| **BALP** | **1.1.4** (31 October 2025) | Trial Implementation |

*Where they are used*: [05 §6](05-standard-di-interoperabilita.md),
[`docs/04_protocols/05`](/04_protocols/05-ihe.md).
*How they are read*: **pinning the revision is not an optimisation**: it is the condition for two
installations of the same software to behave in the same way. Four profiles out of seven are in
trial implementation, and one is in public comment.

### 7.4 Images

**DICOM PS3.18** - web services over images. In the project it is used in consultation only and
never on the video channel.
*Where it is used*: [05 §7](05-standard-di-interoperabilita.md),
[`docs/04_protocols/05`](/04_protocols/05-ihe.md).

---

## 8. General technical standards

The **reasoned catalogue**, with the problem solved, the point of the project where each is used
and the maturity status, is in [13 §9 - The protocols, summary
table](13-protocolli.md). It is not repeated here. This section says **where the primary text is to
be found** and **how to check that a specification has not been superseded**, which is the part the
catalogue does not contain.

### 8.1 The Internet community's requests for comments

*Where they are to be found*: the official editor of the requests for comments and the document
tracker of the standardisation body. Every document carries, on its own page, the current status
and - where one exists - the indication of the document that **obsoletes** it or **updates** it.
*How currency is checked*: you open the document's page and look at two fields, *Obsoleted by* and
*Updated by*. It is a thirty-second check that the project requires before every citation, and one
that intercepts the most frequent errors: the semantics of the web protocol has been reorganised,
the specification of the reliable transport protocol has been replaced, the problem details format
has a successor, the older versions of the channel security protocol are deprecated.

The families actually used by the project, with the module that deals with them:

| Family | Reference module |
|---|---|
| Transport and web: routing, reliable and unreliable transport, multiplexed transport, channel security, semantics and syntax of the web protocol, bidirectional message channel | [13 §§2-3](13-protocolli.md) |
| Application interfaces: status codes, content negotiation, caches and validators, optimistic concurrency, indication of when to retry, deprecation and sunset, problem details | [13 §4](13-protocolli.md), [`04_protocols/06`](/04_protocols/06-api-di-progetto.md) |
| Identity and authorisation: delegated authorisation and its best practices, binding of the code to the client, defence against issuer swapping, verifiable assertions and keys, introspection, revocation, **token exchange with explicit delegation** | [13 §5](13-protocolli.md), [`04_protocols/08`](/04_protocols/08-identita-e-autorizzazione.md) |
| Message signatures and body digest | [13 §6](13-protocolli.md), [`04_protocols/07`](/04_protocols/07-eventi-e-webhook.md) |
| Real time: NAT traversal, address discovery, relay, datagram security, media encryption, media transport and its measurement, data channel, session description | [08](08-webrtc-da-zero.md), [13 §7](13-protocolli.md) |
| Cross-cutting: clock alignment and authentication, name resolution and its security extensions, serialisation, representation of instants, partial modifications of documents | [13 §8](13-protocolli.md) |

**Two references from this family that the project treats as constraints and not as citations.**
The first: the specification on the incremental gathering of connection candidates requires
delivery **exactly once and in the same order**, and this determines the architecture of the
signalling ([`V-131`](../11_registri/01-vincoli-in-vigore.md#v-131)). The second: the specification on token exchange defines the claim that
represents the delegation, and the project **never issues** a token that lacks it ([`V-132`](../11_registri/01-vincoli-in-vigore.md#v-132)).

### 8.2 Specifications of other bodies

| Specification | Body | Version | Role in the project |
|---|---|---|---|
| **SAML [V2](../11_registri/03-vincoli-fondanti.md#v2).0**, 15 March 2005 | OASIS | 2.0 | Federation with signed assertions: it is the protocol that is **necessary** for the most widespread national identity channel |
| **OpenID Connect Core 1.0** | OpenID Foundation | 1.0 | Authentication and identity. **It is not a request for comments** |
| **HTML Living Standard**, section on server-sent events | WHATWG | living standard, **without a version** | One-way push towards the browser |
| **OpenAPI** | OpenAPI Initiative | 3.1 | A contract verifiable by a machine. Data schema `2020-12` |
| **CloudEvents** | CNCF | 1.0; binding over the web protocol **1.0.2** | Common envelope of the events. It contains an **explicit negative obligation** on a header, encoded in the project as a negative test ([`V-134`](../11_registri/01-vincoli-in-vigore.md#v-134)) |
| **ECMA-404** | Ecma International | - | Data interchange syntax, in parallel with the corresponding request for comments |
| **Recommendations on the extensible markup language** | W3C | - | An external constraint, not a choice: documents that can be signed in part |
| **Web content accessibility criteria**, level AA | W3C | **2.1** | Incorporated into the European technical standard on accessibility. The project declares a single non-conformity, on criterion **1.2.4** |
| **Specifications of the event broker protocol** | upstream project | - | The specification of **an implementation**, not of a standards body: it is a third-party component to be qualified |
| **CycloneDX** | Format of the software bill of materials, published for every release and validatable against the schema. It is the format adopted by requirement `SEC-043`. `[NV]` on publishing body and reference version, to be verified by `COMP` | `COMP` | Software bill of materials |

*How this block is read*: the «body» column counts as much as the specification. A specification
from a project or from an implementation does not have the same value as a standard from a
recognised organisation, and the repository declares this explicitly instead of flattening them
together.

---

## 9. Technical process and product standards

These are the standards on which the regulatory material rests. **Their texts are paid for and not
reproducible**: the descriptions in the project's documentation are functional summaries based on
public sources, and to work seriously on any one of them you have to buy its text from the
catalogue of the national or international standards organisation.

| Standard | Subject matter | Question it answers | Where it is used |
|---|---|---|---|
| **ISO 13485:2016** | Quality management system for medical devices | *How is whoever produces the software organised?* | [15 §5.3](15-regolatorio-da-zero.md), [`08_compliance/03`](/08_compliance/03-sistema-di-gestione-della-qualita.md), [`09`](/08_compliance/09-percorso-e-calendario.md) |
| **IEC 62304:2006+A1:2015** | Life cycle of medical device software. Clause **8.1.2** requires every configuration item to be identified by title, producer and **version** - it is the foundation of the prohibition on floating version labels ([`V-173`](../11_registri/01-vincoli-in-vigore.md#v-173)); clause **5.1.1** concerns traceability | *How was it built and verified?* | [15 §5.4](15-regolatorio-da-zero.md), [`01_technical/01`](/01_technical/01-stack-e-motivazioni.md) and [`09`](/01_technical/09-integrazione-continua-e-rilascio.md), [`08_compliance/03`](/08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **ISO 14971:2019** | Risk management for medical devices | *What harms can it cause and what has been done to avoid them?* | [09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md), [12](12-crittografia-e-sicurezza.md), [15 §5.5](15-regolatorio-da-zero.md), [`08_compliance/05`](/08_compliance/05-gestione-del-rischio.md) |
| **IEC 62366-1:2015+A1:2020** | Usability engineering | *How was it designed so that it is not used badly?* | [04](04-identita-e-anagrafiche.md), [10](10-percorsi-di-cura-e-sicurezza.md), [15 §5.6](15-regolatorio-da-zero.md), [`01_technical/08`](/01_technical/08-qualita-e-test.md), [`08_compliance/06`](/08_compliance/06-usabilita-e-accessibilita.md) |
| **IEC 82304-1:2016** | Health software product | *In what environment does it work and with what limits?* | [15 §5.7](15-regolatorio-da-zero.md) |
| **ISO/IEC 81001-5-1:2021** | Security in the life cycle of health software | *How does it defend itself, and how are vulnerabilities managed?* | [12](12-crittografia-e-sicurezza.md), [15 §5.7](15-regolatorio-da-zero.md), [`08_compliance/01 §5`](/08_compliance/01-inquadramento-normativo.md) |
| **ISO 20417** | Information supplied by the manufacturer | *What the label has to say - which for software is a screen* | [`08_compliance/04`](/08_compliance/04-fascicolo-tecnico.md) |
| **ISO 15223-1** | Symbols to be used in the information supplied by the manufacturer | as above | [`08_compliance/04`](/08_compliance/04-fascicolo-tecnico.md) |
| **ISO/IEC 29115** | Entity authentication assurance framework | *How strong is the authentication?* The levels declared by the national channels correspond to **LoA2, LoA3 and LoA4** | [04](04-identita-e-anagrafiche.md), [07 §8.2](07-fse-e-infrastrutture-nazionali.md), [13](13-protocolli.md), [`06_security/02`](/06_security/02-identita-e-accessi.md) |
| **ISO 27799:2016** | Information security management in healthcare; healthcare interpretation of the **ISO/IEC 27002** controls. It expressly deals with the management of emergency access | *What does the healthcare sector add to the general controls?* | [12](12-crittografia-e-sicurezza.md) |
| **ISO 3166** | Country codes | Address fields and identifiers | [04](04-identita-e-anagrafiche.md), [`04_protocols/04`](/04_protocols/04-hl7-v2.md) |
| **ISO/IEC 7498-1** | Layered reference model for open systems interconnection | Vocabulary of the layers | [13 §1](13-protocolli.md) |
| **ISO/IEC 14496-10** | Advanced video coding | Codec of the media plane | [08](08-webrtc-da-zero.md) |
| **EN 301 549** | Accessibility requirements for ICT products and services; it incorporates the level AA web content accessibility criteria in clauses 9, 10 and 11. **Clause 6** imposes requirements of its own on two-way voice communication and on video communication - audio quality, real-time text communication, caller identification, resolution and frame rate and lip synchronisation sufficient for sign language | *What is needed beyond the web criteria?* | [01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md), [15 §8.5](15-regolatorio-da-zero.md), [`01_technical/04`](/01_technical/04-frontend.md), [`08_compliance/01 §8`](/08_compliance/01-inquadramento-normativo.md) and [`06`](/08_compliance/06-usabilita-e-accessibilita.md) |
| **ETSI TS 119 312** | Cryptographic suites | *Which mechanisms and which key sizes* | [08](08-webrtc-da-zero.md), [12](12-crittografia-e-sicurezza.md), [13](13-protocolli.md) |
| **Cryptographic mechanisms agreed within SOG-IS** | European reference on mechanisms | as above | [08](08-webrtc-da-zero.md), [12](12-crittografia-e-sicurezza.md) |

**Three warnings that count for more than the individual lines.**

**First, on harmonisation.** A **harmonised** standard confers a presumption of conformity with the
requirements it covers (art. 8 of the regulation on medical devices); a non-harmonised standard
remains usable as the state of the art but confers no presumption. The harmonisation
status of **EN IEC 62304, EN IEC 62366-1, EN IEC 82304-1 and EN ISO/IEC 81001-5-1** is not
unambiguously ascertained by `COMP`, because the secondary sources diverge `[NV]`. **EN ISO 13485:2016** and **EN ISO
14971:2019**, by contrast, are uncontroversially harmonised. Until the check has been carried out
against the most recent consolidated list published by the Commission, the correct formulation is
«applied as the state of the art», and presence in the list is to be **verified at the date of
use**, not once and for all. The same warning holds for **EN ISO 20417** and **EN ISO 15223-1**.

**Second, on the European version.** The same standard exists in an international version and in a
transposed European version, and the two references are not interchangeable in a regulatory
document. The repository uses both forms depending on the context, and the difference is
substantial when it comes to invoking the presumption of conformity.

**Third, on cryptographic parameters.** No parameter is chosen out of habit: the source is the
references in the table, and whatever has not been read on the text is marked `[NV]`. It is a
choice of substance and not of editorial caution: a crystallised cryptographic recipe produces
obsolete systems that believe themselves secure.

---

## 10. Terminologies and coding systems

The complete picture, with the rights holder, the cost, the redistributability, the attribution
obligations and the residual risk entry by entry, is in
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md).
Here there is the placing in the **four regimes** and the reason for it, because that is what
determines whether a source may sit in the repository.

| Regime | Meaning | Terminologies |
|---|---|---|
| **A** | Full coexistence in the sources under the project's licence | **LOINC** (with mandatory attribution), **HL7 Terminology**, **coding systems of the FHIR core** |
| **B** | Dedicated directory with its own licence and attribution | **Italian classification of diseases, 2007 version**, **national fee schedule and catalogue**, **unified coding of units of measure** |
| **C** | Acquisition or querying at runtime, at the deployer's own initiative | **SNOMED CT**, **packages of the Italian guides**, **programming interface of the World Health Organization** |
| **D** | Total exclusion: system identifier and code only | **ATC/DDD**, **ICD-10**, **ICD-11**, **CVX** in version 1.0, **DICOM terminology**, **documents of the hospital messaging standard**, **Technical Framework of the interoperability profiles** |

**The primary sources of the licences**, which are what determines the regime:

- **Affiliate licence agreement of SNOMED International**, with the clauses the project uses:
  **2.2.5** (use by reference in clinical messages), **2.5.3, 2.5.4 and 8.8** (sub-licence chain),
  **2.7** (content not accessible other than to authorised users, **incompatible with a public
  repository**), **8.3.1 and 8.3.2** (notices and indication of the version and date of the
  release), **Appendix A** (definition of data processing system). The agreement **is perfected by
  downloading or accessing** the content: the project's position holds as long as nobody downloads
  it. Governed by English law, with the exclusive jurisdiction of the English courts.
- **The Regenstrief Institute's LOINC licence**, with the notice obligation of **§ 3.3** and the
  warning that **translations are derivative works assigned to the rights holder**.
- **Terms of use of the collaborating centre for drug statistics methodology** for the anatomical
  therapeutic chemical classification, which prohibit copying and distribution for commercial
  purposes and any modification.
- **Terms of use of the World Health Organization** for the eleventh revision of the classification
  of diseases, with §§ **1.2.3**, **1.2.4**, **1.3** and **4.5**. Governed by Swiss law, with
  arbitration.
- **Licence of the unified coding of units of measure**, with the warning that it is **revocable**
  and that derivatives are prohibited.
- **Licence of the Technical Frameworks of the interoperability profiles**, not sub-licensable: the
  citation permitted is by address and revision.

*How this block is read.* **A licence statement affixed to a container does not dispose of
third-party rights over the content included in it.** It is the general principle the project
adopted after verifying that an implementation guide can declare a permissive licence and include
third-party content that the licence does not cover. The check has to be made **artefact by
artefact**, and not on the strength of the package's declaration.

*A warning that no documentation can soften.* **Querying an external terminology service run by
third parties does not exempt anyone from the licence obligation**, because a system that creates
or analyses coded data is itself a data processing system within the meaning of the agreement. The
system is in any case **fully functional** with the burdensome terminology switched off ([`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)),
and the cost of that choice is declared, not passed over in silence.

---

## 11. How to check that a source is still in force

A repealed act cited as being in force is an error that propagates throughout the documentation: it
gets copied into another chapter, then into an answer to a tender specification, then into a
document somebody signs. The method differs by family of source, and in every case it produces **a
date of consultation to be recorded**.

### 11.1 Italian legislative acts

You start from the **Gazzetta Ufficiale**, which is the source of publication, and move to the
**consolidated version** in the official legal database, which reports the later amendments. Three
checks, in order:

1. **Is the act still in force?** A consolidated database flags the repeal and the act that
   ordered it.
2. **Is the article you are citing still that one?** Amending acts renumber, insert *bis*
   subsections and move content around. Citing an article by the number it had before an amendment
   is the most frequent error and the hardest to spot, because the act exists and the number
   exists.
3. **Is there an implementing act that has replaced the applicable rules?** It is the typical case
   of the determinations of the authorities, which replace one another at short intervals: the
   determination on security specifications currently in force has **replaced** the previous year's
   one, and citing the earlier one produces no visible error.

**Additional rule for the acts of the State-Regions Conference:** check the **regional
transposition** as well, because the direct effect on the individual provider passes through it.

### 11.2 Acts of the European Union

You use the official database of Union law. Three checks:

1. **Consolidated version against the version as originally published.** The consolidated version
   is not the published version: if you cite an article that has been amended, declare which
   version you are citing.
2. **Deferred dates of application.** A regulation in force is not a regulation that applies, and
   many of those cited here have provisions with different commencement dates. The project treats
   this as first-class information, not as a footnote.
3. **Implementing and delegated acts.** They are the part that changes most often and that contains
   the operational detail.

### 11.3 Non-binding guidance

The guidance of the Medical Device Coordination Group and analogous documents are checked against
the **list published by the body that issues them**, and the check is on the **revision**: a new
revision may change the outcome of a qualification without the regulation having changed. It has
happened: the most recent revision of the guidance on software qualification rewrote the section on
the delimitation of modules.

### 11.4 Technical standards

Two distinct checks, which the project keeps apart.

**The first is on the edition:** the standards organisation publishes revisions and amendments, and
a standard cited without a year is an unverifiable citation. The project always cites the year, and
where an amendment exists it cites it in the full form.

**The second is on harmonisation**, and holds only in the medical device context: it is checked
against the **consolidated list published by the Commission**, and it is to be verified **at the
date of use**. Inclusion in that list is what confers the presumption of conformity: it is not a
permanent property of the standard, and it is the reason why the project's documentation uses the
formula «applied as the state of the art» until the check has been carried out.

### 11.5 Technical specifications

For the Internet community's requests for comments: the *Obsoleted by* and *Updated by* fields on
the document's page. For implementation guides and profiles: the **package version** in the body's
register, with the date and the maturity status. For living standards, which have no version: the
**date of consultation** is recorded, which is the only reference possible.

### 11.6 The rule that closes

**Every citation that depends on time carries with it, in the document that uses it, the indication
of the date at which it was verified.** It is the only way to distinguish a source checked recently
from one checked two years ago, and to know what has to be redone when something changes. The
repository applies it unevenly: **bringing it to uniformity is an open and useful contribution**
([18 §14.2](18-contribuire-per-area.md)).

---

## 12. The sources this project has decided not to use

The list exists because **the absence of a source is read as an oversight**, and in some cases it
is instead a decision with a precise justification.

### 12.1 Terminology content excluded

**Anatomical therapeutic chemical classification and defined daily doses.** Excluded in every form.
Reason: the rights holder's terms **prohibit copying and distribution for commercial purposes and
any modification**, and they are head-on incompatible with the project's permissive licence.
Zero-cost mitigation: in Italy the operational coding of a medicinal product is the marketing
authorisation. The canonical identifier of the system remains usable because **it is an identifier,
not an address**.

**Tenth and eleventh revisions of the international classification of diseases.** Excluded in every
form. For the eleventh, the prohibition descends from the clause that forbids derivatives and from
the indemnity imposed; for the tenth, the regime is not ascertained by `COMP`, and that is the
reason why caution prevails `[NV]`. Verified note on the identifier: the correct identifier of the
eleventh revision **is not** the one that many secondary sources report.

**SNOMED CT content.** Not downloaded, not included, not embedded in examples, tests or value sets.
Cumulative reasons: the clause requiring that the content not be accessible other than to
authorised users is **incompatible with a public repository**; the sub-licence chain is
incompatible by construction with the project's permissive licence; and the agreement is perfected
**by accessing** the content, so the position holds only as long as nobody accesses it.

**DICOM terminology, documents of the hospital messaging standard, Technical Framework of the
interoperability profiles, procedural terminology of the United States medical association.**
Excluded as content; use by reference through the system identifier and the code is admitted, as is
citation by address and revision.

**United States vaccination codes**, excluded in version 1.0 because the licence regime
is not ascertained and must be verified by `COMP` `[NV]`:
the risk is reduced to zero by excluding them from the perimeter.

### 12.2 Technical and methodological sources excluded

**Reference to a national programme for the validation of cryptographic modules.** Removed from the
public claims by an explicit decision and replaced by the European and national references in the
table at §9. Reason: it was an untenable statement, referring to a certification regime the project
does not have and which is not the pertinent one in the European context.

**International recommendations on the mean opinion score.** Not used as the basis of the session
quality index. Reason: the classic models are for **planning** narrowband networks, the factors for
modern audio coding are not standardised and for video there is nothing applicable to real time.
The project's index is **proprietary and declared to be so** ([`V-114`](../11_registri/01-vincoli-in-vigore.md#v-114)).

**Expired or non-standardised drafts presented as standards.** The header for the idempotency key is
an **expired and archived draft**; those for rate limiting are an **active draft**, and the
three-field form has never been a standard. The project uses them and declares them for what they
are ([`V-133`](../11_registri/01-vincoli-in-vigore.md#v-133)).

**Maps between hospital messaging and clinical resources as a basis of conformity.** They are
**informative** documents: they are used as a mapping reference, never to declare conformity.

### 12.3 Categories of source excluded on methodological grounds

**Secondary sources.** Summaries, popular articles, notes from professional firms, conference
presentations and answers from automated systems **are not sources** in this documentation. They
may serve to find the primary source; not to cite it. The rule is stated without softening in the
compliance area: *sources are cited, not remembered*; a reference either comes from the text or is
marked as unverified, and there is no third possibility.

**Vulnerability identifiers not read on the source that publishes them.** The project describes the
defects of components by **mechanism and version of the fix**, which is the form useful to whoever
has to decide the minimum version to distribute, and refers for the specific identifiers to the
documented check. Reason: identifiers change status and assessment over time, and a document that
hard-coded them would age worse than the description of the mechanism.

**The specific requirements of the national security measures, before the annexes have been read
line by line.** What are cited are the **codes**, which are public and verified, and the content of
the individual requirements is marked as unverified ([`Q-151`](../11_registri/02-questioni-aperte.md#q-151)).

**Tender documents and methodological documents not published**, where they have not been located.
They are cited as **an existing and unsatisfied cross-reference**, with the `[NV]` marking, and
never as the source of an assertion of conformity. It concerns at least two documented cases: the
chapter of a technical tender specification incorporated by reference from a ministerial annex, and
the methodological documents referred to by a decree of 2022.

**Estimates in place of a published source.** Where there is an obligation to publish - as for the
standard tariffs of notified bodies - the project **does not estimate** and refers to the primary
source. Where a source exists, estimating is a methodological error.

---

## 13. What this list does not guarantee

It has to be said explicitly, because a list of sources inspires more confidence than it deserves.

**It does not guarantee that the full text of each source has been read.** It guarantees that the
particular is the one actually used in the repository documents that cite it, and that the `[NV]`
markings flag what has not been verified.

**It does not guarantee that a source is in force at the date on which you are reading it.** The
dates in this list are those recorded in the documents that use them; the method for re-verifying
them is at §11 and the re-verification falls on whoever uses the source.

**It is not a bibliography aiming at completeness.** It does not contain the sources it would be
reasonable to consult: it contains those on which the repository rests. A source that is pertinent
and absent is a useful report, not a defect of this list.

**It is no substitute for reading.** No particular, however precise, is a substitute for the text.
This module says **where to look**, not **what the text says**: the latter is the business of the
modules and of the areas, which refer to it.

**The condition for it to remain true over time, posed as a constraint ([`V-195`](../11_registri/01-vincoli-in-vigore.md#v-195)).** An inventory of
sources degrades in one way only: a new source enters a chapter and does not enter here, and from
that moment the list is incomplete without anybody noticing. The rule that prevents it is simple
and verifiable: **no area introduces a new primary source into the documentation without entering
it in this module with its full particulars and with the date at which it was verified.** It is not
an editorial formality: it is what makes it possible, when a rule changes, to know in a single step
which documents depend on it. The mechanism for recording the date is question [`Q-199`](../11_registri/02-questioni-aperte.md#q-199).

---

## 14. Unverified points and open questions

| Reference | What is missing | Whose responsibility it is |
|---|---|---|
| `[NV]` | Chapter of a technical tender specification incorporated by reference from Annex 4 of DM 19 novembre 2025: **not located**. Until it is read, no assertion of conformity with those measures is tenable | `COMP` |
| `[NV]` | Methodological documents referred to by DM 21 settembre 2022 for the functional requirements of the micro-services: **not located** | `COMP` |
| `[NV]` | Detailed annexes of the determination on baseline security specifications: not read line by line, open question recorded in [`Q-151`](../11_registri/02-questioni-aperte.md#q-151) | `COMP` |
| `[NV]` | Texts of the two Prime Ministerial decrees on essential cybersecurity elements in public contracts, and verification of applicability to the technological categories | `COMP` with a procurement adviser |
| `[NV]` | Precise numbering of some sections of Annexes I, IX and XI of the regulation on medical devices; designation codes; number of the point on the serious incident; division between the paragraphs of arts. 86 and 87 according to the class | `COMP` |
| `[NV]` | Definitions and mapping of the dates of the regulation on the European health data space | `COMP` |
| `[NV]` | Harmonisation status of four technical process standards and of two standards on the information supplied by the manufacturer | `COMP` |
| `[NV]` | Version of the European technical standard on accessibility cited in support of the directive on products and services | `COMP` |
| `[NV]` | Literal wording of the notion of product in the directive on liability, and numbering of the Italian transposing provision | `COMP` |
| `[NV]` | Document templates, type codes and indexing metadata of the ten telemedicine types, open question recorded in [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) | `COMP` |
| `[NV]` | Licence regime of two terminology entries and regime of the tenth revision of the classification of diseases | `COMP` |
| [`Q-146`](../11_registri/02-questioni-aperte.md#q-146) | Entry-by-entry alignment with the national glossary, to be carried out **before** the domain glossary is frozen and before translation | Domain |
| [`Q-199`](../11_registri/02-questioni-aperte.md#q-199) | **Register of currency checks**: today the date of consultation is recorded unevenly across the documents. A single form and a periodic trigger are needed, otherwise §11 remains a method without verifiable application | → orchestration, with compliance |

---

## What you must remember

1. **The reading order counts for more than the list.** Definitions, then functional requirements,
   then the destination of the documents, then qualification of the product, then the obligations
   of whoever installs it, then the format of the exchange. Walking it backwards loses days.
2. **You cite the lowest level that contains the prescription.** Citing primary legislation for a
   format requirement makes the citation unverifiable.
3. **A version not declared is a version not adopted.** It holds for standards, for implementation
   guides and for profiles: without a number and a maturity status the citation cannot be used.
4. **The regulation on medical devices is not read on its own.** The software qualification tree is
   in the guidance, and a revision of the latter can change the outcome without the regulation
   having changed.
5. **The Italian source refers twice to documents not published in the gazette.** It is the real
   picture, and it is a traceability risk to be declared, not concealed.
6. **A licence statement on the container does not dispose of third-party rights over the content.**
   The check is artefact by artefact.
7. **Currency is verified at the date of use, not once and for all.** This holds in particular for
   the harmonisation status of a technical standard and for the determinations of the authorities,
   which replace one another at short intervals.
8. **Sources are cited, not remembered.** A reference either comes from the text or is marked as
   unverified. There is no third possibility, and the memory of whoever writes is not a source.
