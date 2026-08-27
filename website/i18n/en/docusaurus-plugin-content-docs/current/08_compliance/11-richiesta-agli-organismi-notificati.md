---
title: Request to the notified bodies
sidebar_position: 12
description: "The versioned text of the request for information to the notified bodies, in Italian and in English, with the fields to be filled in at the moment of sending: the five questions on the calculation, on the timing of the individual phases, on the preliminary review, on the combined audit and on comparing the total. With the survey of the designated bodies, the source consulted and the date of consultation, the designation code declared not verified, and the register of what has been sent with its format."
---

# Request to the notified bodies

> **State of fact, in first position because it is the only line that changes a reader's
> decisions.** The product **does not bear CE marking**, **is not covered by any declaration of
> conformity** and **is not usable for the delivery of healthcare services to real patients**. The
> project **intends** to take on the manufacturer role and **the legal entity that would exercise
> it is not established**. Nothing that follows softens these lines: a request for information is
> not an engagement, an engagement is not an assessment, an assessment is not an outcome. Anyone
> who reads «they have written to the notified bodies» and concludes «then I can use it» draws a
> **wrong** conclusion: the intention covers nobody and transfers no obligation to whoever
> installs, integrates or puts the software into service.
>
> **Warning on the genre of this chapter.** It is not a quality management system procedure and
> cannot be presented as one ([`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174)). It is an **input**: it contains the text that the
> manufacturer entity, still to be established, will reissue under its own document control before
> using it in a negotiation.

## 1. What this chapter demonstrates

Milestone `T-14` of the [roadmap, §02 - Milestones](../09_roadmap/02-traguardi.md) requires, in the third
of its criteria, that the request for information has been sent to each notified body designated
for the relevant device category, with a date and a versioned text. The criterion is binary: it is
demonstrated by three things that must **coexist**, and nine elements out of ten leave it
unsatisfied.

The three things are the **text** of the request, versioned and free of the formulas forbidden by
[01 §11](./01-inquadramento-normativo.md); the **survey** of the bodies designated for the
relevant category, with the source consulted and the date of consultation; and a **register** with
one row per body on the list, each with the date of sending and the channel. This chapter produces
the first and the second. The third is the file
[`registro/organismi-notificati.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/organismi-notificati.tsv),
whose format is described in § 8 and in
[`registro/README.md`](https://github.com/fedcal/Telemedic/blob/main/registro/README.md).

**The criterion is not satisfied today, and this has to be said here rather than at the end.** The
survey in § 4 stopped short of the list of addressees, for a reason that § 4.2 sets out at length
and that is not an oversight: the relevant designation category is not documented in any chapter
of this area, and the published list has not been read. The register of what has been sent exists
with its own header and **no data row**, which is the correct way of declaring zero sendings: an
absent register is indistinguishable from a register not yet populated, an empty one is not.

## 2. Why the request goes out before the entity exists, and why the text says so

The request for information **does not require the entity to be established**; the contract does.
That is why this work precedes the corporate act instead of waiting for it, and the reason is
arithmetic before it is organisational: the effective constraint of the path is not the writing of
the text, it is the body's **queue**. [09 §2](./09-percorso-e-calendario.md) measures that queue
with figures the project declares to be from secondary sources and not verified against the
original publications, and draws from them a finding that must be repeated here without softening:
in a market with shrinking staff and applications in excess of certificates issued, **a new
manufacturer, of micro size, at its first conformity assessment, is not a priority client**. The
profile described is ours. Entering the queue earlier is the only lever the project has, and it
has no others.

From this follows an editorial obligation that is the most delicate point of the whole chapter. A
body that discovers **after** replying that the requester is not an established legal entity has
received a misleading request, and the harm is not repaired by a later clarification: someone's
time has already been spent on a wrong assumption. The text in § 5 therefore states the
requester's condition **in the first paragraph**, before any question, and not in a footnote. The
rule of form governing that statement is the one in [01 §11](./01-inquadramento-normativo.md): the
intention is expressed with the verb «intends» and never with a future indicative, and the absence
of the legal entity is repeated **in the same sentence** in which the intention appears.

There is a second reason, which belongs to the medical device regime and not to courtesy. **The
intended purpose is also derived from the material one sends**: Article 2(12) of Regulation (EU)
2017/745 derives it from the information supplied «on the label, in the instructions for use, or
in promotional or sales materials or statements», and Article 7 forbids misleading claims even in
the absence of marking. A letter that described the product as ready, or that let an outcome be
inferred, would be regulatory material against the project itself. The text in § 5 is written to
hold even when read by someone with an interest in reading it differently, and that is why it
contains an explicit clause declaring its nature instead of leaving it to be inferred from the
tone.

## 3. The five questions, and the reason for each

The content of the request is not decided here: it is decided in
[09 §8.3](./09-percorso-e-calendario.md), which lists five rules for requesting quotations. This
paragraph gives the reason for each, because a question asked without knowing what it protects is
dropped at the first evasive answer.

**The calculation and not the price.** Notified bodies' fees are subject to a publication
obligation under Annex VII, section 1.2.8, of Regulation (EU) 2017/745, and the project adopts the
rule of **not estimating what has a primary public source**
([09 §8.2](./09-percorso-e-calendario.md)). A price communicated without the calculation is
therefore information worth less than what is already published: asking for the days envisaged for
each activity and the method by which they are calculated, with reference to the published fee, is
the only way to make two answers comparable with each other.

**Commitments on the timing of the individual phases, and the remedies in case of deviation.** An
offer without commitments on timing is an offer on a single axis, and the missing axis is the one
that decides. Three phases matter in particular, because they are the three in which the queue is
the body's and not the requester's: the **completeness check**, the **first cycle of questions**
and the **response time to the replies**. The third is the least asked about and the most costly:
the non-conformity response cycles are classified among the **non-estimable** items of
[09 §8.2](./09-percorso-e-calendario.md), because two cycles or four are the same plan with a cost
differing by a factor of two.

**The paid preliminary review, where it is offered.** It reduces the non-conformity cycles, that
is, it reduces precisely the heaviest non-estimable item. It is the most effective form of
front-loaded spending on this path, and asking for commitments on timing without also asking for
the preliminary review is the most common form of apparent saving.

**The combined audit.** ISO 13485 certification and the certificates issued under Annex IX **are
not the same thing and do not substitute for each other**
([09 §1](./09-percorso-e-calendario.md)): the first is issued by an accredited certification body,
the second by the notified body. Where the same party can issue both, the combined audit is the
single most effective optimisation of the whole path, and it is a question to be asked before
rather than after, because it conditions the choice.

**Comparing the total and not the rate.** The body that is cheapest per day may be the most
expensive overall if it generates more cycles or has longer queues. Comparing hourly rates is
**misleading**, and the rule requires saying so to whoever proposes it: it is the only one of the
five that is addressed not to the body but to whoever reads the answers.

## 4. The survey of the designated bodies

### 4.1 What was consulted, and when

The survey is recorded here with the source and the date, because «we contacted them all» is not a
verifiable statement, and a list of addressees not traceable to a recorded survey leaves the
criterion unsatisfied even if the letters have gone out.

| Source consulted | Date | Outcome of the consultation |
|---|---|---|
| European Commission page on notified bodies for medical devices, `https://health.ec.europa.eu/medical-devices-topics-interest/notified-bodies-medical-devices_en` | 27 August 2026 | **Read.** It states that the Commission publishes the list of designated notified bodies in the NANDO information system and refers, for Regulation (EU) 2017/745, to the address in the following row |
| Filtered NANDO list, `https://webgate.ec.europa.eu/single-market-compliance-space/notified-bodies/notified-body-list?filter=legislationId:34,notificationStatusId:1` | 27 August 2026 | **Not read.** The address returns the shell of a client-side application: no body name, no identification number, no country was obtained. The filter criterion is the one proposed by the page in the previous row and was not modified |
| Text of the implementing act establishing the designation codes, on EUR-Lex, in the English and Italian versions | 27 August 2026 | **Not read.** The requests did not return the content of the act. The reference given by a secondary source is in § 4.2 and remains `[NV]` to be asked of the European Commission |
| Commission Implementing Regulation (EU) 2017/2185 on EUR-Lex, `https://eur-lex.europa.eu/legal-content/IT/TXT/HTML/?uri=CELEX:32017R2185` and its English counterpart | 27 August 2026, second attempt | **Not read.** Both forms of the address returned a page with no textual content. What this yields is not information about the act but about the instrument: **the primary source is not reachable by the means used so far**, and completing § 4.3 requires different access - the Official Journal of the Union as a downloadable document, or a consultation with the competent authority. Recording this prevents the same attempt from being repeated identically a third time |

**What this table says, literally.** It says that the official list exists, that the place where it
is published was identified on an institutional source and not inferred, and that **its content
was not read**. It does not say how many bodies are designated, it names none of them and it gives
no contact point. It is the most that could be recorded without inventing, and it is less than
what the criterion requires.

**Why no name appears here.** A list of bodies reconstructed from secondary sources, from memory or
from a search engine looks exactly like a verified list, and that resemblance is the defect: a
reader has no way of telling the difference, and whoever uses it sends letters to parties that
might not be designated for the relevant category, or might no longer be. **An invented list is a
worse outcome than an absent list**, because an absent list is visible. The rule of this area is
already written and applies here without discount: sources are cited, not remembered, and the
memory of whoever writes is not a source ([00 §8](./00-indice.md)).

### 4.2 What is missing, and it is more than the criterion suggests

What is missing is the relevant **designation code**, and without it the list of addressees is not
determinable even with the complete list in front of you. A notified body is not designated «for
medical devices»: it is designated for a set of codes, and the designation has conditions and
limitations of its own. Filtering the list without the code means choosing the addressees for
convenience.

Chapter [02](./02-qualificazione-e-classificazione.md) determines **class IIa** under Rule 11 and
the Annex IX procedure, and its § 1 shows the designation codes as descending from the
classification; **it declares no code**, and the matter is recorded among the unverified entries of
its § 12 and among what this area does not close ([00 §6](./00-indice.md), point 8). Determining
the class does not produce the code by deduction: they are two distinct outcomes of two distinct
acts.

**`[NV]` - the relevant designation code.** Two independent secondary sources, consulted on 27
August 2026, indicate Commission Implementing Regulation (EU) 2017/2185 - of 23 November 2017 - as
the act establishing the codes and
the corresponding types of devices for the purpose of designating notified bodies, and report the
existence of code families with the prefixes `MDA`, `MDN`, `MDT` and `MDS`. **Agreement between two
secondary sources does not make a primary one**, and this must be said because it is how a belief
consolidates without being verified: the two sources may derive one from the other, or both from a
third. **The text of the act
was not read on a primary source**, no code is therefore reported in this chapter, and the
reference to the act itself is to be confirmed before it appears in a document intended for a
negotiation. It is the same caution that [01 §9](./01-inquadramento-normativo.md) imposes for the
Italian sources and that [09 §2](./09-percorso-e-calendario.md) imposes for the market figures: a
secondary source does not become primary because it is convenient.

### 4.3 How the survey is completed, and in what order

The remaining work is three steps, and the order is not indifferent. **First**, the text of the
implementing act on the codes is read on a primary source and the code or codes corresponding to
the frozen intended purpose and to the class determination of chapter
[02](./02-qualificazione-e-classificazione.md) are identified, with the identification reasoned for
each code discarded and not only for those chosen. **Second**, the list published in the European
database is read with that code as the filter criterion, the name, identification number, country
and published institutional contact point are recorded for each body, and the date on which the
list was read is recorded, because the list changes and an undated snapshot is not a survey.
**Third**, the register of § 8 is populated with one row per body, and the row is created without
the date of sending: that is written when the letter goes out, not when it is planned to go out.

**Should the code not be determinable**, the list is built all the same, but on an explicit
criterion declared in the register, and the `[NV]` stays written. What is not admissible is the
third way, that is, sending to a set chosen for convenience without declaring how it was built: it
is the form in which a binary criterion becomes a percentage.

## 5. The text of the request - Italian version

> **Text version: `1`.** The version number appears in the register of what has been sent, column
> `revisione_del_testo`, because two letters sent at different moments may have different texts and
> the difference has to be reconstructible later. Every substantive change to the text below
> increments the number and must be carried, **in the same change**, into the English twin of § 6:
> two letters that diverge in two languages are two different requests presented as one.

The fields between double square brackets are filled in at the moment of sending and are listed in
§ 7. None of them may be left in the form in which it appears here. The Italian letter is
reproduced here in its original language and is not translated: what a body receives is the text
below, and a translation of it in this chapter would be a third text.

---

Oggetto: richiesta di informazioni sulla valutazione della conformità di un software dispositivo
medico - **non è una domanda e non è una richiesta di offerta contrattuale**

Alla cortese attenzione di [[ORGANISMO]], numero di identificazione [[NUMERO]], [[PAESE]].

**Premessa che determina il senso di tutta la lettera, e che chi scrive chiede di leggere prima
delle domande.** Il prodotto a cui questa richiesta si riferisce **non reca marcatura CE** e
**non è coperto da alcuna dichiarazione di conformità**. Chi scrive è un progetto di software
libero che **intende** costituire il soggetto giuridico che assumerebbe il ruolo di fabbricante,
e **quel soggetto non è oggi costituito**: non esiste quindi un fabbricante che possa
sottoscrivere una domanda, firmare un contratto o assumere gli obblighi dell'art. 10 del
Regolamento (UE) 2017/745. La presente è **una richiesta di informazioni**, e chi scrive
preferisce dichiararlo ora piuttosto che lasciarlo scoprire a Voi dopo che avrete speso tempo su
un presupposto sbagliato.

**Natura di questo documento.** La presente non costituisce offerta, proposta contrattuale,
ordine, impegno a contrarre, né domanda di valutazione della conformità ai sensi di alcuno degli
allegati del Regolamento (UE) 2017/745. Non contiene alcuna dichiarazione di prontezza del
prodotto, alcuna data e alcuna affermazione da cui si possa ricavare un esito della valutazione
della conformità. Nessuna risposta che vorrete dare produce obblighi in capo a Voi o a chi
scrive.

**Che cosa il progetto è, in tre righe.** È una piattaforma di telemedicina rilasciata sotto
licenza libera, il cui perimetro funzionale comprende la raccolta differita di parametri per la
revisione periodica del professionista sanitario. La determinazione di classificazione del
progetto, riferita alla destinazione d'uso nella revisione [[REVISIONE DELLA DESTINAZIONE D'USO]],
conclude per la **classe IIa** in applicazione della Regola 11 dell'Allegato VIII, con la
procedura di valutazione della conformità dell'**Allegato IX**. Tale determinazione è un
documento di lavoro del progetto, **non** una determinazione formale sottoscritta da una persona
responsabile del rispetto della normativa presso un fabbricante, per la ragione già detta: quel
soggetto non è costituito. Il sistema di gestione della qualità è impostato secondo ISO 13485 e
**non è certificato**.

**Che cosa Vi si chiede.** Cinque informazioni, nell'ordine in cui incidono sulla decisione di
chi scrive.

1. **Il calcolo, non il prezzo.** Per la procedura dell'Allegato IX applicata a un software
   dispositivo medico della classe indicata: quante **giornate** prevedete per ciascuna attività
   distinta - valutazione del sistema di gestione della qualità, audit in sito, valutazione della
   documentazione tecnica, valutazione clinica - e con quale **metodo** quelle giornate sono
   calcolate, con riferimento alla Vostra tariffa pubblicata ai sensi dell'Allegato VII, sezione
   1.2.8. Chi scrive non chiede uno sconto e non intende negoziare la tariffa: chiede il calcolo,
   perché è l'unica forma in cui due risposte diverse sono confrontabili.

2. **Gli impegni sui tempi delle singole fasi, e i rimedi.** Quali termini indicativi o
   contrattuali applicate alla **verifica di completezza** della domanda, al **primo ciclo di
   quesiti** e al **tempo di risposta alle repliche** del fabbricante; e quali **rimedi** sono
   previsti in caso di scostamento da quei termini. Se non applicate termini a una di queste tre
   fasi, chi scrive Vi chiede di dirlo esplicitamente: un'informazione negativa esplicita è
   utilizzabile, un silenzio no.

3. **Il riesame preliminare a pagamento.** Se offrite un riesame preliminare della documentazione
   a pagamento, prima della domanda formale: in che cosa consiste, quali documenti esamina, in
   quale forma restituisce i rilievi, e se i suoi esiti sono utilizzabili nella successiva
   valutazione o restano privi di effetto su di essa.

4. **L'audit combinato.** Se il Vostro gruppo può rilasciare **anche** la certificazione
   ISO 13485 tramite un organismo di certificazione accreditato, e se in tal caso è praticabile
   un **audit combinato** con la valutazione del sistema di gestione della qualità ai sensi
   dell'Allegato IX: a quali condizioni, con quale risparmio di giornate rispetto ai due percorsi
   separati, e con quali limiti di indipendenza che il combinato comporta.

5. **Il totale.** Sulla base delle risposte precedenti, quale **totale** di giornate e di oneri
   deriva dal Vostro calcolo per il percorso completo, distinto per fase, comprensivo degli oneri
   ricorrenti di sorveglianza. Chi scrive confronterà i totali e non le tariffe per giornata, e Vi
   chiede di indicare le voci che il totale non comprende.

**Due informazioni che Vi si chiedono e che non riguardano il preventivo.** La prima: per quali
**codici di designazione** siete designati ai sensi del Regolamento (UE) 2017/745, e se un
software con la destinazione d'uso sopra descritta rientra nel Vostro perimetro di designazione,
comprese le eventuali condizioni e limitazioni. La seconda: se accettate **nuovi fabbricanti alla
prima valutazione di conformità**, e in caso affermativo quale procedura di accettazione
applicate. Chi scrive preferisce una risposta negativa immediata a una trattativa che si
interrompa più avanti per questa ragione.

**Che cosa chi scrive può fornire, e in quale stato.** Il progetto pubblica come materiale aperto
la documentazione di ciclo di vita del software, la gestione del rischio, il fascicolo di
usabilità e la mappa del fascicolo tecnico. Questo materiale è **preparatorio**: non è emesso
sotto un controllo dei documenti in esercizio, non è approvato e non è firmato, e non viene
presentato come completo né come pronto per una valutazione. È indicato qui perché la quantità di
lavoro che un organismo prevede dipende da che cosa il richiedente porta già scritto, e chi
scrive preferisce che quella previsione sia fatta su ciò che esiste davvero.

**Trattamento dei dati e riservatezza.** Questa lettera non contiene dati personali di terzi né
dati relativi alla salute. Chi scrive chiede che l'eventuale risposta sia indirizzata al solo
recapito indicato di seguito e non contenga dati personali diversi da quelli necessari alla
corrispondenza.

Recapito per la risposta: [[RECAPITO DEL RICHIEDENTE]].
Riferimento di questa richiesta: [[RIFERIMENTO]], versione del testo `1`.
Luogo e data: [[LUOGO]], [[DATA DI INVIO]].
Firma: [[SOTTOSCRITTORE]], nella qualità dichiarata in premessa.

---

## 6. The text of the request - English version

> **Same text version as § 5: `1`.** Many notified bodies are not established in Italy, and the
> English letter is not a courtesy translation: it is the version that will actually be read. The
> two texts say the same thing and are modified in the same change; if they diverge, they are two
> different requests presented as one.

Fields between double square brackets are filled in at the moment of sending and are listed in
§ 7. None of them may be left in the form in which it appears here.

---

Subject: request for information on the conformity assessment of medical device software - **this
is not an application and is not a request for a contractual offer**

To the attention of [[BODY]], identification number [[NUMBER]], [[COUNTRY]].

**Preliminary statement that determines the meaning of this whole letter, and which the sender
asks you to read before the questions.** The product to which this request refers **does not bear
CE marking** and **is not covered by any declaration of conformity**. The sender is a free
software project that **intends** to establish the legal entity that would take on the
manufacturer role, and **that entity is not established today**: there is therefore no
manufacturer able to sign an application, sign a contract or take on the obligations of Article 10
of Regulation (EU) 2017/745. This is **a request for information**, and the sender prefers to
state it now rather than let you discover it after you have spent time on a wrong assumption.

**Nature of this document.** This is not an offer, a contractual proposal, an order, an
undertaking to contract, nor an application for conformity assessment under any of the annexes to
Regulation (EU) 2017/745. It contains no statement of product readiness, no date and no assertion
from which an outcome of a conformity assessment could be inferred. No answer you may give
creates obligations for you or for the sender.

**What the project is, in three lines.** It is a telemedicine platform released under a free
licence, whose functional perimeter includes the deferred collection of parameters for the
healthcare professional's periodic review. The project's classification determination, referred
to the intended purpose in revision [[INTENDED PURPOSE REVISION]], concludes for **class IIa**
under Rule 11 of Annex VIII, with the conformity assessment procedure of **Annex IX**. That
determination is a working document of the project, **not** a formal determination signed by a
person responsible for regulatory compliance at a manufacturer, for the reason already given:
that entity is not established. The quality management system is set up according to ISO 13485
and is **not certified**.

**What you are being asked.** Five pieces of information, in the order in which they bear on the
sender's decision.

1. **The calculation, not the price.** For the Annex IX procedure applied to medical device
   software of the class indicated: how many **days** you envisage for each distinct activity -
   quality management system assessment, on-site audit, technical documentation assessment,
   clinical evaluation - and by what **method** those days are calculated, with reference to your
   fee published under Annex VII, section 1.2.8. The sender is not asking for a discount and does
   not intend to negotiate the rate: it asks for the calculation, because it is the only form in
   which two different answers are comparable.

2. **Commitments on the timing of the individual phases, and the remedies.** What indicative or
   contractual time limits you apply to the **completeness check** of the application, to the
   **first cycle of questions** and to the **response time to the manufacturer's replies**; and
   what **remedies** are provided in the event of deviation from those limits. If you apply no
   time limit to one of these three phases, the sender asks you to say so explicitly: an explicit
   negative answer is usable, silence is not.

3. **The paid preliminary review.** Whether you offer a paid preliminary review of the
   documentation ahead of the formal application: what it consists of, which documents it
   examines, in what form it returns the findings, and whether its outcomes are usable in the
   subsequent assessment or have no effect on it.

4. **The combined audit.** Whether your group can **also** issue ISO 13485 certification through
   an accredited certification body, and if so whether a **combined audit** with the quality
   management system assessment under Annex IX is practicable: on what conditions, with what
   saving in days compared with the two separate paths, and with what limits of independence the
   combination entails.

5. **The total.** On the basis of the previous answers, what **total** of days and charges
   follows from your calculation for the complete path, broken down by phase, including the
   recurring surveillance charges. The sender will compare totals and not per-day rates, and asks
   you to indicate the items the total does not include.

**Two pieces of information requested that do not concern the quotation.** First: for which
**designation codes** you are designated under Regulation (EU) 2017/745, and whether software
with the intended purpose described above falls within your designation scope, including any
conditions and limitations. Second: whether you accept **new manufacturers at their first
conformity assessment**, and if so what acceptance procedure you apply. The sender prefers an
immediate negative answer to a discussion that breaks off later for this reason.

**What the sender can supply, and in what state.** The project publishes as open material the
software life cycle documentation, the risk management, the usability file and the map of the
technical documentation. This material is **preparatory**: it is not issued under a document
control system in operation, it is not approved and not signed, and it is not presented as
complete or as ready for assessment. It is mentioned here because the amount of work a body
foresees depends on what the requester already has written, and the sender prefers that forecast
to be made on what actually exists.

**Data processing and confidentiality.** This letter contains no personal data of third parties
and no health data. The sender asks that any reply be addressed solely to the contact point given
below and contain no personal data other than what is necessary for the correspondence.

Contact point for the reply: [[REQUESTER CONTACT POINT]].
Reference of this request: [[REFERENCE]], text version `1`.
Place and date: [[PLACE]], [[DATE OF SENDING]].
Signature: [[SIGNATORY]], in the capacity stated in the preliminary statement.

---

## 7. The fields to be filled in at the moment of sending

The fields are marked so that none can be left unfilled through inattention: double square
brackets and text in capitals, a form that appears nowhere else in the corpus and that a trivial
text search finds. **A letter still containing a double square bracket is not sent**, and the check
is on whoever sends it, not on the text.

| Italian field | English field | What it contains | Where it comes from |
|---|---|---|---|
| `[[ORGANISMO]]` | `[[BODY]]` | Name of the body as published in the list | List published in the European database, read and dated (§ 4) |
| `[[NUMERO]]` | `[[NUMBER]]` | Identification number of the body | Same |
| `[[PAESE]]` | `[[COUNTRY]]` | Country of establishment as published | Same |
| `[[REVISIONE DELLA DESTINAZIONE D'USO]]` | `[[INTENDED PURPOSE REVISION]]` | Exact revision identifier of the intended purpose outline to which the class determination refers | Intended purpose outline, [02 §5.1](./02-qualificazione-e-classificazione.md) |
| `[[RECAPITO DEL RICHIEDENTE]]` | `[[REQUESTER CONTACT POINT]]` | **Institutional** contact point of the project for correspondence, never a personal one | Project contact policy |
| `[[RIFERIMENTO]]` | `[[REFERENCE]]` | Unique reference of the individual letter, reported identically in the register | Register of what has been sent, § 8 |
| `[[LUOGO]]` | `[[PLACE]]` | Place of issue | - |
| `[[DATA DI INVIO]]` | `[[DATE OF SENDING]]` | Actual date of sending, in the form `YYYY-MM-DD` in the register | Register of what has been sent, § 8 |
| `[[SOTTOSCRITTORE]]` | `[[SIGNATORY]]` | Who signs, **in the capacity stated in the preliminary statement** and not in a capacity that presupposes the manufacturer entity | - |

**Two fields that do not exist, and their absence is deliberate.** There is no field for a foreseen
date of any act of the conformity assessment path, and there is no field for a desired starting
date: they would be the simplest way of letting a forecast that
[`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) forbids in every artefact enter an external letter. A body that needs a temporal
placement in order to reply will ask for it, and at that point it will be a question of theirs to
be answered, not a statement of ours from which a commitment is derived.

## 8. The register of what has been sent

The register is the file
[`registro/organismi-notificati.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/organismi-notificati.tsv):
text separated by the tab character, UTF-8 encoding, comment lines beginning with `#`, then the
header row and one row per body. It is the same convention as the other registers in that folder,
and it is documented in
[`registro/README.md`](https://github.com/fedcal/Telemedic/blob/main/registro/README.md).

| Column | Content |
|---|---|
| `data_invio` | Actual date of sending, in ISO form `YYYY-MM-DD`. **Never a planned date**: the field is written when the letter has gone out |
| `organismo` | Name as published in the official list |
| `numero` | Identification number of the body |
| `paese` | Country of establishment as published |
| `codice_designazione` | Code or codes on the basis of which the body was included in the list of addressees; `NV` until the relevant code is determined (§ 4.2) |
| `canale` | How the letter went out: form published on the body's website, published institutional electronic mail contact, certified electronic mail, other, declared |
| `recapito` | **Institutional** contact point used, as published by the body. Never the name of a natural person, never a personal contact |
| `revisione_del_testo` | Version of the text of § 5 and § 6 actually sent |
| `lingua` | `it` or `en`, according to which of the two texts was sent |
| `nota` | Free text, may be empty; never contains a tab character |

**The register today contains zero data rows**, and that circumstance is declared in the comment
block at the head of the file rather than left to be inferred from a short file. Zero rows means
zero sendings, and zero sendings means that criterion 3 of `T-14` is **not satisfied**. It is the
way a register earns its place: making visible as an absent row what would otherwise be silence.

**A row without a date of sending leaves the criterion unsatisfied**, even if all the other columns
are filled in. This is not formal severity: a row without a date does not allow the indicator of
risk `R-06` to be measured, which is the number of bodies that reply with real availability within
a recorded time limit **counted from the date of sending**. Without that date the indicator does
not exist, and a risk without an observable indicator is not watched.

## 9. The formulas this text does not contain, and why

The text of § 5 and § 6 was written against the table of forbidden formulas in
[01 §11](./01-inquadramento-normativo.md), entry by entry. This paragraph declares the choices that
follow, because an undeclared caution is lost at the first rewrite.

**The words «medical device» do not appear referring to the repository.** They appear referring to
the category of software whose assessment is being asked about, which is the object of the question
put to the body, and the letter states in the same preliminary paragraph that the product does not
bear CE marking.

**No future indicative appears on the intention.** «The project intends to establish the legal
entity», never «the project will establish». The absence of the entity is repeated in the same
sentence in which the intention appears, and not deferred to a footnote.

**No date referring to the marking or to a declaration of conformity appears**, in any form:
neither a date, nor a month, nor a quarter, nor a year, nor «by», nor «from», nor «no later than». <!-- data-e-marcatura: statement of the prohibition, §11 rule 4 - the list of forbidden forms names them all in order to forbid them -->
The only dates in the letter are the date of sending and the revision of the intended purpose,
which are recorded facts and not forecasts. It is criterion 5 of `T-14` applied to what this
chapter produces, and it will be verified by the textual check that that criterion requires.

**No statement of readiness appears.** The project's material is described as preparatory, not
issued under document control, not approved and not signed. It is the finding already written in
[09 §5](./09-percorso-e-calendario.md) on retroactively unrecoverable activity no. 3, and repeating
it in an external letter costs nothing and protects a great deal.

**«ISO 13485 certified» does not appear.** What appears is «set up according to ISO 13485, not
certified», which is the admitted formula. The distinction is not pedantry towards the
correspondent: it is precisely the information they need in order to calculate the days.

**No name of a third party company, brand or commercial product appears**, and the integration
documentation remains agnostic as to measuring devices. The regulatory reason is the accessory trap
described in [02 §6.1](./02-qualificazione-e-classificazione.md), row 11: a single sentence can
import the class of somebody else's apparatus.

**No personal data appears.** No name of a natural person, no personal contact point, neither in
the text nor in the register. The signatory field is filled in with the capacity stated in the
preliminary paragraph, and the contact points are the published institutional ones.

## 10. What this chapter leaves open

| Reference | Question | To whom |
|---|---|---|
| `[NV]` | **The relevant designation code** and the text of the implementing act: to be verified on EUR-Lex of the Commission (§ 4.2). While it stays open, the list of addressees is not determinable and the register of § 8 stays without rows | a request to the Commission, EUR-Lex |
| `[NV]` | **The content of the list published** in the European NANDO database: to be verified at the date of use and not once and for all, because the list changes (§ 4.1) | a request to the Commission, NANDO |
| [`Q-280`](../11_registri/02-questioni-aperte.md#q-280) | **The decision on the legal form and the start of the incorporation procedure.** It does not block the sending of the requests, which does not presuppose the entity being established, and it blocks everything that follows: signing a contract is an act reserved to the role | → Client |
| [`Q-188`](../11_registri/02-questioni-aperte.md#q-188) | **The financial reserve for the paid preliminary review and for the non-conformity response cycles.** Questions 2 and 3 of § 5 exist to reduce that item, and asking them without the reserve means collecting information that cannot be used | → Client |
| [`Q-275`](../11_registri/02-questioni-aperte.md#q-275) | **The external review of the frozen intended purpose**, prescribed by `D46` and not carried out. It is feasible **without** the entity being established, and the letter of § 5 cites the revision of the intended purpose: an external review not carried out is a weakness the body will find | → Client |
| [`Q-179`](../11_registri/02-questioni-aperte.md#q-179) | **Form of publication of the internal schedule.** This chapter reproduces none of the dates of that schedule and derives none from it, but it refers to it for the content of the five questions: if the form of publication changed, the cross-references have to be redone | → Client |
| [`V-270`](../11_registri/01-vincoli-in-vigore.md#v-270) | The project intends to take on the manufacturer role and the entity that would exercise it is not established: while it is not, and while document control is not in operation, the letter of § 5 **cannot** be signed in a capacity that presupposes that role | Compliance, orchestration |
| [`V-281`](../11_registri/01-vincoli-in-vigore.md#v-281) | Nothing in this chapter plans an activity that cannot be produced today. Signing the contract, submitting the application and affixing the marking **are not activities of this chapter**: they are acts reserved to the role, and they appear here only as what the chapter does not cover | Compliance |
| [`V-06`](../11_registri/01-vincoli-in-vigore.md#v-06) | The state of fact repeated at the opening is not softened by any line of this chapter, and will not be softened by any reply received | All |
