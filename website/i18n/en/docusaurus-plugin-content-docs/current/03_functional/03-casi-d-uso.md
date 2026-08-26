---
title: "Use cases"
sidebar_position: 4
description: "Twenty-four use cases of Telemedic with preconditions, main flow, alternative flows, error flows and postconditions; typed outcomes of synchronous service delivery and remote monitoring with traceability to requirements, business rules and flows."
---

# Use cases

## 1. Structure and conventions

Every use case is described with the same structure, and sections **are not optional**:

- **Primary actor** and secondary actors;
- **Scope**: which system boundary is involved;
- **Preconditions**: what must be true beforehand, verifiable by the system;
- **Trigger**;
- **Main flow**: the nominal path, numbered;
- **Alternative flows**: legitimate paths different from the nominal, which are not errors;
- **Error flows**: paths where something fails, each with the recordable outcome;
- **Postconditions**: what is true afterwards, distinguished by success and by failure;
- **Requirements and rules**: traceability to the matrix.

**On error flows.** They are half the domain, not an appendix. In telemedicine the majority of non-nominal cases determine the perception of service reliability, and in remote monitoring some error paths - data absence, ingestion chain failure - are **clinical pathways in their own right**, not exception management. An error flow without a recordable outcome is not designed: it is a `catch` that writes to a register.

**Typed outcomes.** Synchronous service delivery uses frozen outcome codes (`EX-NOSHOW`, `EX-TECH-PATIENT`, `EX-TECH-DROP`, `EX-TECH-FAIL`, `EX-QOS`, `EX-CLIN-STOP`, `EX-ESCALATE`, `EX-EMERGENCY`, `EX-IDENT-FAIL`, `EX-CAPACITY`, `EX-THIRD-PARTY`, `EX-ABUSE`). Remote monitoring introduces its own family here, henceforth frozen:

| Code | Event | Automatic detectability | Natural recipient |
|---|---|---|---|
| `EX-TM-NOSIGNAL` | expected measurement not received within the window | yes | clinician |
| `EX-TM-DEVICE` | device failure or depletion | yes, if the source reports the status | technician |
| `EX-TM-LINK` | loss of connectivity in the home chain | yes, with presence signal | technician |
| `EX-TM-INGEST` | ingestion chain failure, collective silence | yes, with expected volume monitoring | technician, with communication to the clinician |
| `EX-TM-USEERR` | measurement initiation started and not completed | yes, if attempts are recorded | technician and clinician |
| `EX-TM-DECLARED` | absence declared by the patient or carer | no, it is declared | clinician, reduced severity |
| `EX-TM-ADMIN` | absence explained by a known administrative event | yes, through integration | clinician |
| `EX-TM-UNEXPLAINED` | residual silence after exclusion of every known cause | by exclusion | clinician, with human contact |
| `EX-TM-DROPOUT` | abandonment of the pathway by the person | by exclusion | clinician |
| `EX-TM-IMPLAUS` | value outside the technically possible range | yes | technician |
| `EX-TM-LATE` | data received after the window deadline | yes | clinician, with lateness marking |
| `EX-TM-CORRECTED` | measurement corrected or declared invalid | no, it is declared | clinician |
| `EX-TM-OUTOFHOURS` | event generated outside declared coverage | yes | according to the coverage policy |
| `EX-TM-NOACK` | response deadline expired without acknowledgement | yes | next link in the chain |
| `EX-TM-ESCFAIL` | escalation chain exhausted without management | yes | service manager |
| `EX-TM-EXIT` | channel exit for item marked by the clinician | yes, by comparison on the marker | patient, with notification to the team |
| `EX-TM-PLANSTALE` | plan version not acknowledged from the patient side | yes | clinician and technician |

## 2. Synchronous service delivery use cases

### UC-01 - Booking a remote service from an external system

**Primary actor**: integrator (`ATT-15`). **Secondary**: front-office (`ATT-10`), patient (`ATT-01`).
**Scope**: schedule and clinical service.

**Preconditions.** The application principal is authenticated and authorised for the tenant; the patient's demographic reference is resolvable or creatable by external identifier; the service is present in the tenant's catalogue and is marked as deliverable in the requested channel; the tenant has a valid and reachable relay configuration for the service area.

**Trigger.** The external system sends a booking request.

**Main flow.**

1. The system resolves the external demographic reference or creates the local demographic record by reference.
2. It verifies that the service admits the requested channel and that the professional is authorised.
3. It verifies the admissibility of the channel with respect to the care relationship, according to the tenant configuration.
4. It assigns the slot atomically.
5. It generates access links for each participant, single-use and with expiry.
6. It returns the contact identifier and links to the system of origin.
7. It notifies the patient with confirmation, instructions and a reminder to verify technical readiness.

**Alternative flows.**

- **A1 - Service requiring a diagnosis already made and assisted person lacking an active episode.** The system requires a derogation motivated by a professional; if the derogation is recorded the booking proceeds and generates a high-severity audit event (`RF-346`).
- **A2 - Schedule owned by the external system.** Any local modification is rejected with an indication of the authoritative system (`RF-040`).
- **A3 - Multi-professional contact.** The system verifies the simultaneous availability of all involved schedules and proposes only the common intervals (`RF-049`).

**Error flows.**

- **E1 - Slot occupied by concurrent request.** One request obtains confirmation, the other an explicit conflict with proposal of alternatives. There do not exist two confirmations (`BR-020`).
- **E2 - Relay configuration absent or unreachable.** The booking is rejected: booking what you cannot deliver is a domain defect (`BR-021`).
- **E3 - Request marked as urgent.** Rejected with indication of the correct channel: there are no urgent televideo pathways (`RF-347`).
- **E4 - Service not admitted in the channel.** Rejected indicating the admitted channels (`RF-030`).

**Postconditions.** *Success*: a contact exists in booked state, with valid links and notification sent. *Failure*: no partial resource has been created; the reason for rejection is returned in structured form and recorded.

**Requirements and rules**: `RF-020`, `RF-038`, `RF-039`, `RF-041`, `RF-052`, `RF-346`, `RF-347`, `BR-001`, `BR-002`, `BR-020`, `BR-021`, `BR-028`.

### UC-02 - Verification of executability and registration of deliverability conditions

**Primary actor**: physician (`ATT-04`). **Secondary**: front-office, nurse.
**Scope**: clinical service.

**Preconditions.** A contact exists booked in televideo.

**Main flow.**

1. The system presents the deliverability conditions expected for the service type.
2. The physician declares whether the service requires completeness of physical examination.
3. The physician selects at least one of the applicable deliverability conditions.
4. The physician or the front-office register the outcome of the executability verification on three dimensions: clinical utility, clinical safety, capacity for digital interaction.
5. The system records the declaration with author and instant and renders it immutable.

**Alternative flows.**

- **A1 - Capacity for digital interaction insufficient but carer available.** The dimension remains negative, the pathway proceeds with formal involvement of the carer and generation of a dedicated access link (`RF-345`).
- **A2 - Negative outcome on clinical utility or safety.** The contact is routed to the in-person service; the negative outcome remains consultable and is not confused with an administrative rejection.

**Error flows.**

- **E1 - Attempt to initiate the act without recorded declaration.** Initiation prevented with indication of the missing declaration (`RF-343`).
- **E2 - Attempt to modify the declaration after the act.** Rejected; any correction is a new declaration that does not cancel the previous one.

**Postconditions.** *Success*: the contact carries the declaration of deliverability and the outcome of the executability verification, both immutable. *Failure*: the contact remains booked and not deliverable.

**Requirements and rules**: `RF-343`, `RF-344`, `RF-345`, `BR-180`, `BR-181`, `BR-182`.

### UC-03 - Patient's technical pre-check

**Primary actor**: patient (`ATT-01`) or carer (`ATT-02`). **Secondary**: front-office.
**Scope**: media session and waiting room.

**Preconditions.** A contact exists booked with a valid link.

**Main flow.**

1. The patient opens the verification link at any time before the appointment.
2. The system verifies camera, microphone, speaker, bandwidth, latency and reachability of the relay.
3. It presents the outcome with traffic light and explanation in plain language.
4. It associates the outcome with the appointment and makes it available to the front-office.

**Alternative flows.**

- **A1 - Device permission not granted.** The system shows browser- and operating system-specific instructions, with the image of the actual request, and allows test re-execution without starting from the beginning (`RF-055`, `RF-060`).
- **A2 - Unsupported device or browser.** Early detection with indication of the concrete alternative and useful time to change device before the appointment.
- **A3 - Diagnostics assisted by the front-office.** With user consent, the operator initiates remote diagnostics that returns only technical information (`RF-168`).

**Error flows.**

- **E1 - Persistent negative outcome close to the appointment.** The contact appears in the risk view of the day; the front-office intervenes proactively, proposes phone fallback or reschedules.
- **E2 - Verification never performed.** Reminders recall it; the absence of verification is visible to the front-office and produces no administrative effect on the patient by itself.

**Postconditions.** The outcome and its date are associated with the contact; the front-office has the updated risk view.

**Requirements and rules**: `RF-055`, `RF-060`, `RF-161`, `RF-162`, `RF-168`, `BR-024`.

### UC-04 - Gathering expressions of will

**Primary actor**: patient (`ATT-01`) or legal representative (`ATT-03`).
**Scope**: consent.

**Preconditions.** The current privacy notices are published and versioned; the service type declares which expressions are mandatory.

**Main flow.**

1. The system presents the privacy notice in the current version.
2. It presents separately each required expression: informed consent to remote service delivery, legal basis of processing where consent is applicable, consent to recording where provided, consent to the presence of third parties where provided.
3. No option is pre-selected; confirmation is enabled only after complete scrolling of the text.
4. For each, it records: identity of the declarant and the interested party, version of the text, instant, channel, outcome.

**Alternative flows.**

- **A1 - Expression made by a legal representative.** The system verifies that the registered scope of powers covers the act; it records the title, particulars of the order and temporal validity (`RF-117`).
- **A2 - Collection in session.** Collection occurs with text reading and explicit expression during the session, before the act begins (`RF-113`).
- **A3 - Revocation.** It has immediate effect on future processing, requires no motivation and does not affect other expressions (`RF-115`).

**Error flows.**

- **E1 - Mandatory expression missing at admission.** The system signals it to the professional and proposes immediate collection before the act begins (`RF-114`).
- **E2 - Carer attempting to consent for a capable patient.** Rejected in every configuration, with a message that distinguishes assistance and representation (`BR-062`).
- **E3 - Scope of powers not covering the healthcare act.** Rejected with signal to the front-office (`RF-117`).

**Postconditions.** For each expression, there exists evidence referring to an immutable version of text, consultable by the patient and the data protection officer.

**Requirements and rules**: `RF-110` … `RF-117`, `RF-237`, `BR-060` … `BR-063`.

### UC-05 - Entry into waiting room and admission

**Primary actor**: patient. **Secondary**: physician, front-office.
**Scope**: waiting room and clinical service.

**Preconditions.** The contact is booked; the waiting room window is open.

**Main flow.**

1. The patient opens the link; the system performs the technical check and displays the outcome.
2. The patient enters the waiting room; the professional sees scheduled time, arrival time, technical outcome, presence of declared third parties.
3. The professional explicitly admits the patient. No automatic entry exists.

**Alternative flows.**

- **A1 - Professional delay beyond the threshold.** The patient automatically receives in the waiting room the estimated delay, updated periodically (`RF-058`).
- **A2 - Exit and re-entry within the window.** The queue position and technical outcome are preserved (`RF-061`).
- **A3 - Multi-professional contact.** The consultant waits in a separate professional area, not visible to the patient until the shared session begins (`RF-063`).

**Error flows.**

- **E1 - Access outside the window.** Rejected with a message indicating the correct time, never with a generic error (`BR-029`).
- **E2 - Patient never connected within tolerance.** Outcome `EX-NOSHOW`, but **only** if telemetry records no connection attempts whatsoever (`BR-024`).
- **E3 - Patient connected, technically blocked.** Outcome `EX-TECH-PATIENT`: it is not a no-show, produces no administrative effects and opens the rescheduling pathway.
- **E4 - Patient entered and exited without being admitted.** Outcome of abandonment in waiting, with recorded instants; distinct from no-show (`RF-062`).
- **E5 - Window closure with patient still present.** Explanatory message with front-office reference and reschedule proposal, never a silent disconnection (`RF-064`).

**Postconditions.** *Success*: the contact is in progress. *Failure*: the contact carries a typed outcome that distinguishes responsibility and produces no improper charges.

**Requirements and rules**: `RF-055` … `RF-064`, `BR-024`, `BR-029`.

### UC-06 - Patient identification

**Primary actor**: physician. **Scope**: clinical service.

**Preconditions.** The session is initiated. Authentication has occurred, but **it is not identification**: it certifies who possesses the credential, not who is in front of the camera.

**Main flow.**

1. The professional asks the patient to identify themselves with the configured method.
2. He records the identification with the method actually used, the outcome and the instant.
3. The system unlocks opening of the report draft.

**Alternative flows.**

- **A1 - Alternative configured method.** Recognition by the treating clinician who knows the patient, access with high-level digital identity, presence of an operator at the point of delivery. The method actually used is recorded nominally and reported in the document (`RF-080`).
- **A2 - Unexpected third party present.** The professional declares it, the system asks the patient for explicit confirmation, entry and exit are recorded with times. The system **does not** perform automatic face detection.

**Error flows.**

- **E1 - Document illegible or minor discrepancy.** The system proposes the alternative configured method; the outcome is recorded.
- **E2 - Substantial discrepancy.** Outcome `EX-IDENT-FAIL`: the act is not performable, the contact is cancelled without charge, the motivation is recorded.
- **E3 - Opening of the draft without recorded identification.** Prevented (`RF-077`).
- **E4 - Minor or incapacitated person without valid title.** Outcome `EX-CAPACITY`: contact suspended pending the title, without charge.

**Postconditions.** The identification act exists as an autonomous fact, distinct from authentication, with method, outcome, author and instant.

**Requirements and rules**: `RF-077`, `RF-080`, `BR-031`.

### UC-07 - Remote service delivery

**Primary actor**: physician. **Secondary**: patient, carer, interpreter, consultant.
**Scope**: clinical service and media session.

**Preconditions.** Consents verified, identification recorded, location of delivery confirmed.

**Main flow.**

1. The system asks the patient to confirm or correct the address where they are located and preserves it for the contact duration.
2. Participants are listed with name and qualification, visible to all for the entire duration.
3. The professional conducts the act, takes notes, shares documents, requests attachments.
4. The system samples quality metrics at fixed intervals.
5. The professional closes the session by selecting a typed outcome from the list.

**Alternative flows.**

- **A1 - Extension beyond planned duration.** The system displays the induced delay and informs the next waiting patient (`RF-085`).
- **A2 - Side meeting between professionals.** Always announced to the patient with explicit message and recorded; no silent mode exists (`BR-068`).
- **A3 - Transfer to another professional.** The patient is informed with name and qualification of the successor; the contact records both with their respective intervals (`RF-086`).

**Error flows.**

- **E1 - Clinical emergency.** See `UC-09`, dedicated flow.
- **E2 - Closure without outcome.** Prevented: the contact remains suspended and is signalled; the system does not attribute clinical outcomes (`BR-032`).
- **E3 - Administrative deactivation of the user during the session.** The media session is terminated within the expected time, participants receive a notification of administrative interruption and the contact remains suspended (`RF-011`).

**Postconditions.** The contact is concluded with an outcome declared by a professional; the technical session report is available.

**Requirements and rules**: `RF-078` … `RF-086`, `RF-352`, `BR-032`, `BR-038`, `BR-039`.

### UC-08 - Channel degradation, fallback and reconnection

**Primary actor**: system. **Secondary**: physician, patient.
**Scope**: media session, with effects on clinical service.

**Preconditions.** Session in progress; quality thresholds configured for the service type.

**Main flow.**

1. The system detects exceeding of the threshold for the configured duration.
2. It notifies both participants indicating the probable cause and suggested actions, **without formulating clinical assessments**.
3. It reduces the video profile preserving audio.
4. If degradation persists, it switches flow to relay.
5. The decision to proceed, degrade or interrupt remains with the professional.

**Alternative flows.**

- **A1 - Degradation resolved.** Restoration of the nominal profile, with the change recorded.
- **A2 - Voice only.** The video is suspended, audio continues without perceptible interruption, both participants are notified (`RF-073`).
- **A3 - Fallback to telephone channel.** The channel change and motivation are recorded and reported in the document: an act performed without visual component may not satisfy the requirements of the intended service (`BR-006`, `RF-076`).

**Error flows.**

- **E1 - Loss of connectivity.** The contact **does not change state**: the media session moves to reconnection, the patient sees a countdown with available actions, the professional sees the remaining wait time (`BR-030`, `RF-074`, `RF-075`).
- **E2 - Successful reconnection within the window.** Outcome `EX-TECH-DROP`: same clinical session, interruption and duration noted in the contact.
- **E3 - Reconnection unsuccessful.** Outcome `EX-TECH-FAIL`: phone fallback or rescheduling with priority is proposed.
- **E4 - Quality below the clinically acceptable threshold for that service type.** Outcome `EX-QOS`: the act is suspended or degraded by professional decision.

**Postconditions.** Every channel change, interruption and resumption is recorded with instants and durations, and is available for the document and complaint management.

**Requirements and rules**: `RF-072` … `RF-076`, `RF-166`, `RF-167`, `RF-172`, `BR-006`, `BR-030`, `BR-033`, `BR-034`.

### UC-09 - Clinical emergency and interruption with in-person rescheduling

**Primary actor**: physician. **Secondary**: front-office, carer.
**Scope**: clinical service.

**Preconditions.** Session in progress; location of delivery confirmed at initiation.

**Main flow (emergency).**

1. The professional activates the procedure with an always-visible command.
2. The system immediately displays the declared location, phone numbers and emergency contact.
3. It alerts the front-office with priority that overrides notification preferences.
4. The professional records activation time, actions taken and outcome.
5. The session cannot be closed without recording the outcome.

**The system does not call emergency services and does not assess severity.** It makes available to the physician the logistical information they lack because the patient is not in the same room. It is logistical support, not clinical decision support.

**Main flow (interruption for channel inadequacy).**

1. The professional interrupts the service.
2. He selects the typed outcome with the cause.
3. The system generates the in-person service request linked to the interrupted contact.
4. It proposes available appointments to the patient, without further charge.

**Alternative flows.**

- **A1 - Clinical escalation decided by the professional.** Outcome `EX-ESCALATE`: the service is delivered and concluded, and a new request is created. It is a legitimate outcome, to be measured as an indicator and not minimised.
- **A2 - Carer present.** The professional gives operational instructions; the presence is recorded.

**Error flows.**

- **E1 - No slots available for the in-person service.** The case enters a front-office intervention queue with priority, and does not close as "rescheduling proposed".
- **E2 - Phone numbers absent or not verified.** The system signals it **before** session initiation, in the risk view, because in an emergency it is too late.

**Postconditions.** A complete trace of the event exists with instants and actions; in case of interruption a linked in-person service request exists.

**Requirements and rules**: `RF-081`, `RF-082`, `RF-156`, `RF-348`, `BR-039`, `BR-183`.

### UC-10 - Reporting, signature and delivery

**Primary actor**: physician. **Secondary**: patient, integrator.
**Scope**: clinical documentation.

**Preconditions.** Contact concluded with outcome; identification recorded; document template associated with the service type.

**Main flow.**

1. The professional opens the draft, which is not visible to the patient or transmissible.
2. The system precompiles **only** demographic, administrative and temporal data; no clinical evaluation field contains generated text.
3. The document automatically reports the identity and qualification of the reporting person, facility, point of delivery, date and time of the act, service type, channel, identification method, attestation of connection quality and any technical limitations encountered.
4. The professional completes the clinical content and confirms the suitability of the connection.
5. He apposes the signature with the configured level; the system verifies the validity and status of the certificate.
6. The document becomes unmodifiable and is made available to the patient in an authenticated area, with a notification devoid of clinical content.
7. The document and metadata are transmitted to the system of origin and, if enabled and consented, to the documentary repository.

**Alternative flows.**

- **A1 - Delivery by the primary care physician.** Prescription not necessary and digital note in place of the report (`RF-349`).
- **A2 - Deferred delivery with justification.** The patient sees the indication that the outcome will be discussed in a scheduled meeting; the deferment is recorded with the identity of whoever ordered it (`RF-132`).
- **A3 - Heightened confidentiality.** The document is excluded from automatic sharing and external notifications; transmission requires an explicit motivated action (`RF-135`).
- **A4 - Teleconsult with multiple documents.** Consultant's report and treating clinician's document remain distinct, with different authors, linked to the same contact (`RF-133`).
- **A5 - Difficulty accessing the health record declared by the assisted person.** Delivery on secure channel with double authentication, on recorded request (`RF-351`).

**Error flows.**

- **E1 - Mandatory section not completed.** Signature prevented with indication of the missing section (`RF-125`).
- **E2 - Expired or revoked certificate.** Signature rejected with specific message; the document remains draft (`RF-127`).
- **E3 - Consent to transmission absent.** Transmission does not start; the fact is recorded as a known condition and communicated to the professional, not as a technical error (`RF-120`).
- **E4 - Failure of transmission to the system of origin.** The case enters the visible reconciliation queue, with cause, number of attempts and possibility to retry; it is not a silent error (`RF-215`, `BR-048`).
- **E5 - Reporting deadline exceeded.** Prompt to the professional and signal to the service manager (`RF-130`).

**Postconditions.** *Success*: a signed, unmodifiable document exists, available to the patient and returned to the system of origin. *Failure*: a draft exists, and the reason for the impediment is explicit and traced.

**Requirements and rules**: `RF-124` … `RF-136`, `RF-215`, `RF-349` … `RF-351`, `BR-040` … `BR-049`.

### UC-11 - Corrective reissue of a signed document

**Primary actor**: physician. **Scope**: clinical documentation.

**Preconditions.** A signed document exists and has been made available.

**Main flow.**

1. The professional requests the corrective reissue indicating the motivation.
2. The system creates a new version that annuls and replaces the previous one.
3. Both versions remain consultable; the previous is marked as annulled and the new reports the reference and motivation.
4. The new version follows the same signature, delivery and transmission path.

**Alternative flows.**

- **A1 - Corrective reissue of an already transmitted document.** Transmission of the new version includes the reference to the one it replaces, and the outcome of replacement at the recipient is traced.

**Error flows.**

- **E1 - Attempt to modify in place of reissue.** Rejected: a signed document is immutable (`BR-044`).
- **E2 - Reissue without motivation.** Rejected.
- **E3 - Notification to the patient that reveals the content of the correction.** Prevented by the rule on minimum content of external notifications (`BR-050`).

**Postconditions.** The documentary chain is intact and reconstructible; no version has been lost.

**Requirements and rules**: `RF-128`, `BR-044`, `BR-050`.

### UC-12 - Teleconsult between professionals

**Primary actor**: requesting physician (`ATT-04`, `ATT-05`). **Secondary**: consultant (`ATT-06`).
**Scope**: clinical service and documentation.

**Preconditions.** The requester has a care relationship with the assisted person; the material to attach is selectable.

**Main flow.**

1. The requester opens the request with clinical question, urgency and selected attachments.
2. The system verifies the care relationship and creates a **limited access scope** to the attachments only.
3. It notifies the consultant with the deadline.
4. The consultant accepts, consults exclusively the material in the scope, drafts and signs the response.
5. The system notifies the requester, **revokes the scope** and returns the response to the system of origin.

**Alternative flows.**

- **A1 - Synchronous teleconsult with patient present.** The patient is informed of the presence of the third professional and provides consent; the list of participants with name and qualification is visible for the entire duration; there is an identified moderator with moderation powers.
- **A2 - Second opinion requested by the assisted person.** It is not a *specialist-to-specialist consultation*: the requester is the patient and the consultant does not enter the care relationship. The pathway is distinct and the documentary circumstance is different.

**Error flows.**

- **E1 - Refusal or deadline expiry.** The scope is revoked immediately; the requester is notified with the motivation.
- **E2 - Consultant attempting to access outside the scope.** Rejected and recorded as an unauthorised access attempt (`BR-014`).
- **E3 - Scope still active beyond the deadline.** Anomaly detected and automatically closed, with a security event.

**Postconditions.** A request and a report linked to it exist, with distinct authors; the consultant's access scope is closed.

**Requirements and rules**: `RF-133`, `BR-007`, `BR-014`, `BR-049`, `BR-184`.

## 3. Remote monitoring use cases

### UC-13 - Publication of a care pathway

**Primary actor**: pathway author and approver (`ATT-25`).
**Scope**: care pathway.

**Preconditions.** The actor operates in an organisational scope of the tenant for which they are enabled.

**Main flow.**

1. The actor uploads the pathway as structured data: population, inclusion and exclusion criteria, nodes, decision points, responsibilities, timings and windows, transition and exit criteria, indicators.
2. The system validates the pathway entirely.
3. The actor publishes the version with scope and effective date.
4. The version becomes immutable and available for instantiation.

**Alternative flows.**

- **A1 - Replacement of a version in force.** The new version takes effect on the declared date; the instances in progress remain attached to the previous version and their migration is an explicit act of a professional (`RF-232`).
- **A2 - Withdrawal of a version.** The version is no longer instantiable; existing instances continue and are listed for migration evaluation.

**Error flows.**

- **E1 - Incoherent pathway.** Publication rejected with precise list of invalid elements, in language intelligible to whoever drafted it; no partial version is created (`RF-231`).
- **E2 - Pathway containing individual thresholds.** Rejected: the pathway may indicate attributed references, not establish the threshold of an assisted person (`BR-130`, `BR-131`).
- **E3 - Attempt to publish in a scope outside competence.** Rejected and recorded.

**Postconditions.** An immutable pathway version exists, with scope and effective date, available only to its own tenant.

**Requirements and rules**: `RF-230` … `RF-232`, `BR-100`, `BR-101`, `BR-104`, `BR-105`.

### UC-14 - Enrolment and drafting of the remote monitoring plan

**Primary actor**: professional responsible for the plan (`ATT-20`). **Secondary**: patient, carer, case manager, service centre, trainer.
**Scope**: care pathway, consent, demographics.

**Preconditions.** A care relationship exists; a version of applicable pathway exists; service coverage is declared and in force.

**Main flow.**

1. Enrolment proposal, originated from an existing care relationship, from a discharge or from an ambulatory evaluation.
2. Eligibility assessment on four dimensions: clinical, technological, autonomy and competence, context. Each with recorded outcome.
3. Gathering of expressions of will for enrolment (`UC-04`).
4. Instantiation of the plan from the applicable pathway version, with the version reference.
5. Plan drafting: parameters, coded frequencies, time bands, type of measurement, duration, alarm recipients, channel exit items.
6. **Configuration of individual thresholds**, with mandatory empty fields and pathway references shown alongside, attributed and read-only.
7. Device assignment with technical verification and issuance of a signed assignment document.
8. Patient and carer training, with recorded outcome.
9. Plan signature.

**Alternative flows.**

- **A1 - Not eligible.** The pathway closes with recorded motivation and indication of the alternative pathway; the negative outcome remains consultable.
- **A2 - Eligible with carer.** Insufficient autonomy is compensated by the carer, who becomes part of the plan with their own access link and their own instructions.
- **A3 - Deviation from the pathway.** The professional sets frequencies or parameters different from those of the pathway, recording the motivation; the operation is not blocked (`RF-234`).

**Error flows.**

- **E1 - Attempt at self-activation by the patient.** The function does not exist in the interface and the application call is rejected (`RF-236`).
- **E2 - Threshold outside the limits of admissibility.** Rejected with indication of the interval; the attempt is recorded as a near miss (`RF-241`).
- **E3 - Device assignment document incomplete.** Generation rejected with indication of the missing field (`RF-238`).
- **E4 - Eligibility dimension not assessed.** The step to plan drafting is prevented (`RF-235`).

**Postconditions.** *Success*: a signed plan exists, not yet active, complete with thresholds, recipients, assigned devices and recorded training. *Failure*: an eligibility assessment exists with outcome and motivation, and no active plan.

**Requirements and rules**: `RF-233` … `RF-241`, `BR-102`, `BR-103`, `BR-106`, `BR-131`, `BR-132`.

### UC-15 - Plan activation

**Primary actor**: responsible professional. **Scope**: care pathway.

**Preconditions.** Signed plan; thresholds configured for all parameters that generate alarm; coverage declared and in force; alarm recipients identified; assigned devices with positive verification; training recorded.

**Main flow.**

1. The professional requests activation.
2. The system verifies all activation conditions.
3. It records the activation instant.
4. From that instant the expectation windows for each parameter begin to run.
5. The patient and carer receive confirmation with the service coverage, the alternative channel and operating instructions.

**Alternative flows.**

- **A1 - Deferred activation.** Activation is scheduled for a future date; until then the plan generates no absences and appears among the signed and non-active plans.

**Error flows.**

- **E1 - Activation condition not satisfied.** Activation rejected with precise list; no configuration allows the check to be bypassed (`RF-243`).
- **E2 - Coverage not declared.** Special case of the previous one, and the most important: a service that promises monitoring without declaring when it exercises it is more dangerous than the absence of the service (`BR-160`).
- **E3 - Signed and never activated plan beyond the expected time.** Appears in a dedicated queue with indication of elapsed time; does not lapse by itself (`RF-242`).

**Postconditions.** The plan is active with a precise instant; monitoring has begun; the patient knows the coverage and the alternative channel.

**Requirements and rules**: `RF-242`, `RF-243`, `RF-309`, `RF-310`, `BR-107`, `BR-160`, `BR-161`.

### UC-16 - Measurement detection and acquisition

**Primary actor**: patient (`ATT-01`), carer (`ATT-02`) or gateway (`ATT-24`).
**Scope**: remote monitoring.

**Preconditions.** Plan active; parameter expected; measurement window open according to the plan.

**Main flow (manual entry).**

1. The interface shows the expected parameter, the unit of measurement and the measurement conditions provided by the plan.
2. The user enters the value; the system applies the correct local format and the appropriate keyboard.
3. The system verifies plausibility and, if necessary, asks for explicit confirmation that repeats the value in discursive form with the unit.
4. It records the measurement with measurement instant, reception instant, source, unit, conditions and reliability indicator.
5. The measurement enters the series and is evaluated against the plan's rules current at the measurement instant.

**Main flow (gateway ingestion).**

1. The gateway transmits the batch authenticating itself as an application principal.
2. The system verifies the subject's belonging to the tenant, conformity with the schema, unit, identity criterion for idempotency.
3. It acquires compliant measurements, rejects non-compliant ones pointwise and returns the outcome.

**Alternative flows.**

- **A1 - Carer assisting multiple persons.** The current subject is indicated permanently; the change requires a confirmation that names the target subject (`RF-264`).
- **A2 - Measurement outside the provided conditions.** Acquired and marked as incomplete with respect to the protocol; the incompleteness is visible to whoever evaluates it.
- **A3 - Connectivity absent during entry.** The measurement is preserved locally and transmitted on restoration, with measurement instant preserved (`RNF-107`).
- **A4 - Late data.** It contributes to the series of the measurement day, not the reception day; if an absence alarm exists for that window, it is reconciled with outcome `EX-TM-LATE` (`RF-254`, `RF-304`).
- **A5 - Out-of-order data.** Triggers re-evaluation of the affected window; an alarm generated is marked as late with the age of the data (`RF-262`, `RF-263`).

**Error flows.**

- **E1 - Technically impossible value.** Outcome `EX-TM-IMPLAUS`: technical alarm, the measurement does not enter the clinical series (`RF-259`).
- **E2 - Absent measurement unit or undefined conversion.** Measurement rejected rather than acquired with presumed unit; rejection returned to the gateway and generated as a technical alarm (`RF-256`).
- **E3 - Duplicate.** No second point in the series, no second alarm; the duplicate is counted in technical telemetry (`RF-260`).
- **E4 - Measurement initiation started and not completed.** Outcome `EX-TM-USEERR`: the attempt is recorded with the interruption phase and contributes to qualify the silence (`RF-266`).
- **E5 - Device with insufficient charge or expired calibration.** Outcome `EX-TM-DEVICE`: technical alarm generated **before** measurements stop (`RF-265`).

**Postconditions.** *Success*: the series contains an immutable measurement with its complete context, and has been evaluated. *Failure*: a technical alarm exists with precise cause, and the clinical series has not been contaminated.

**Requirements and rules**: `RF-251` … `RF-266`, `BR-110` … `BR-115`.

### UC-17 - Questionnaire administration and score calculation

**Primary actor**: patient or carer; in hetero-administration, professional.
**Scope**: remote monitoring and scores.

**Preconditions.** The plan provides for the questionnaire; the scale is registered with version, population, calculation rule, handling of missing items, interpretative rule and licence.

**Main flow.**

1. The system administers the items in the version provided by the plan.
2. It records each response with item, value, who responded and administration mode.
3. It calculates the score according to the versioned rule.
4. It persists the score with full traceability of the calculation.
5. It presents the score to the professional **as a proposal to validate**, with detail of the items that compose it.
6. The professional validates; the score is attributed to him.

**Alternative flows.**

- **A1 - Item marked as channel exit.** The flow interrupts and moves to `UC-20` before any other interaction; responses already provided are preserved.
- **A2 - Administration by carer.** The mode is recorded and remains distinguishable: a value reported by the person and one estimated by a third party are not the same data.
- **A3 - Scale that admits imputation of missing items.** The score is calculated and **marked as partial**, and is not compared with full scores without declaring it.

**Error flows.**

- **E1 - Missing item with scale that does not admit imputation.** No score is produced; the system shows which items are missing (`RF-326`).
- **E2 - Scale lacking reference to licence.** Not enabled (`RF-323`).
- **E3 - Discrepancy between two presentations of the same score.** It must be impossible: exact arithmetic and absence of divergent roundings are verified automatically (`RF-328`).
- **E4 - Non-validated score used in a signed document.** Prevented (`RF-331`).

**Postconditions.** A score exists with eight traceability elements and an identified validator, or no score exists and the reason is explicit.

**Requirements and rules**: `RF-253`, `RF-323` … `RF-332`, `BR-120` … `BR-127`.

### UC-18 - Alarm generation, delivery and acknowledgement

**Primary actor**: system. **Secondary**: case manager (`ATT-21`), responsible professional (`ATT-20`), service centre (`ATT-22`), delivery centre (`ATT-23`).
**Scope**: alarms.

**Preconditions.** Active plan with rules and thresholds; coverage declared; recipients configured by time band and severity.

**Main flow.**

1. The engine evaluates the measurement against the plan's rules current **at the measurement instant**.
2. On satisfaction of a condition it generates an immutable alarm event containing: condition, precise references to the data that produced it, rule version, technical or clinical nature, severity, recipient, response deadline.
3. It delivers the notification on the configured channels and records, for each, outcome and instant of confirmation.
4. The recipient acknowledges with a deliberate action, distinct from viewing.
5. He performs the clinical evaluation and records it.
6. He closes the alarm with a typed outcome and action taken.

**Alternative flows.**

- **A1 - No condition satisfied.** Evaluation closes without alarm, and the fact of evaluation remains recorded.
- **A2 - Grouping.** Multiple correlated alarms are notified together; the group inherits the **maximum severity** and the deadline of the most severe alarm (`RF-286`).
- **A3 - Temporary suspension.** Attributed, motivated, with coded maximum duration and automatic reactivation; on reactivation the condition if persistent is re-presented (`RF-287`).
- **A4 - Technical alarm.** Routed to the service centre, which does not access clinical content.

**Error flows.**

- **E1 - Delivery not confirmed within the expected time for the channel.** Unconfirmed delivery event, attempt of the next channel, episode visible in the history (`RF-277`).
- **E2 - No active recipient in that time band.** The alarm is marked `EX-TM-OUTOFHOURS` and treated according to the coverage policy; it does not result in any state that suggests an acknowledgement has occurred (`RF-312`).
- **E3 - Acknowledgement without resolution beyond maximum time.** The alarm enters the queue of assumed and unclosed alarms, visible to the service manager (`RF-279`, `RF-280`).
- **E4 - Technical alarm not resolved within the defined time.** Generates a **clinical** alarm of absence of monitoring, linked to the first (`RF-288`).
- **E5 - Attempt to close without a typed outcome.** Rejected: without an outcome one cannot measure the proportion of alarms that produce action (`RF-289`).

**Postconditions.** *Success*: the alarm is closed with outcome and action, and its history is fully reconstructible. *Failure*: the alarm is open, with the exact state of the chain and without any implicit closure.

**Requirements and rules**: `RF-269` … `RF-290`, `BR-133` … `BR-143`.

### UC-19 - Failure to respond and escalation

**Primary actor**: system. **Secondary**: recipient chain, service manager.
**Scope**: alarms.

**Preconditions.** An alarm exists delivered with a response deadline; an escalation chain exists configured for tenant, pathway and severity, conscious of time bands.

**Main flow.**

1. The deadline runs without acknowledgement: outcome `EX-TM-NOACK`, generated as an event.
2. The system identifies the next link, verifying that it is **actually covered** at that moment.
3. It delivers on the channel provided for that link, possibly different from the previous one.
4. It records instant, recipient, channel, outcome of delivery and reason for the step.
5. It repeats until a link acknowledges.

**Alternative flows.**

- **A1 - Increase in severity.** Escalation can move along severity, recipient, channel and perimeter: the four dimensions are orthogonal and configurable.
- **A2 - Link out of coverage.** Skipped with recording of the reason; the chain proceeds towards an active recipient (`RF-281`).

**Error flows.**

- **E1 - Chain exhausted without acknowledgement.** Outcome `EX-TM-ESCFAIL`: a **declared management failure** is generated, with its own severity and notification to the service manager. The alarm **remains open**; it is not closed by deadline (`RF-282`).
- **E2 - Notification channel unavailable.** The absence of delivery is detected and treated: an escalation that stops silently when an external service falls reproduces exactly the problem it was meant to solve (`RF-277`).
- **E3 - Link pointing to the same recipient who has not responded.** Configuration rejected at definition, not tolerated at execution time.
- **E4 - Chain never tested cold within the declared periodicity.** Signalled as such: an untested chain is, statistically, a broken chain (`RF-284`, `RNF-097`).

**Postconditions.** Every step is persisted; any management failure is a recorded and visible fact, not a silence.

**Requirements and rules**: `RF-274`, `RF-281` … `RF-284`, `RNF-096`, `RNF-097`, `BR-133`, `BR-134`, `BR-141`, `BR-142`.

### UC-20 - Channel exit and routing

**Primary actor**: patient or carer. **Secondary**: clinical team.
**Scope**: remote monitoring, coverage, notifications.

**Preconditions.** The plan contains items marked by a clinician as channel exit, with the related routing instructions configured for territory and time.

**Main flow.**

1. The patient provides a response corresponding to a marked item.
2. The system **recognises the marker** by comparison on the structured item.
3. It immediately interrupts the flow in progress.
4. It displays the configured routing instruction: which channel, with which contact number, with which urgency. The text is configured, not generated.
5. It records what was shown, when, to whom, and what the user did after.
6. It notifies the team according to plan rules, **without making the instruction dependent on team response**.

**Alternative flows.**

- **A1 - Event outside coverage.** The instruction to the patient is identical and immediate; notification to the team is queued according to the declared policy (`RF-318`).
- **A2 - Detection from a different channel.** The exit can emerge from a questionnaire, from an entered value, from an in-session interaction: the system must intercept it from multiple entry points with the same consequence.

**Error flows.**

- **E1 - Routing text not configured for the territory or time.** The plan is not activable; if the anomaly emerges in operation, the system shows the configured higher-level text and generates a configuration alarm with high severity.
- **E2 - Message promising a callback in place of the instruction.** Prevented: the conformity verification of the message catalogue fails if an exit message does not contain channel, contact number and urgency (`RF-319`, `RNF-105`).
- **E3 - Attempt to infer the exit from free text or from undeclared combinations.** The architectural conformity verification fails: the system recognises, it does not infer (`RF-315`).

**Postconditions.** The patient has received an immediate and unambiguous operational instruction; the fact is documented and is at once clinical documentation and proof of fulfilment.

**Requirements and rules**: `RF-311`, `RF-313`, `RF-315` … `RF-320`, `BR-162` … `BR-165`.

### UC-21 - Patient silence

**Primary actor**: system. **Secondary**: case manager, service centre, patient.
**Scope**: remote monitoring and alarms.

**Preconditions.** Active plan with expectation windows derived from the coded frequency and time band.

**Main flow.**

1. The expectation window of a parameter runs without measurement.
2. The system generates the event `EX-TM-NOSIGNAL`, with recipient, deadline and escalation like any other alarm.
3. The system attempts to **explain** the silence, in order: device status, presence signal, recorded failed attempts, unavailability declaration, known administrative events.
4. It qualifies the alarm with the identified cause and routes it accordingly: to the service centre if technical, to the clinical team otherwise.
5. If no cause explains the silence, the outcome is `EX-TM-UNEXPLAINED` and the system opens a **human contact activity** assigned to a person, with its own deadline.
6. Closing of the contact activity, with outcome, resolves the alarm.

**Alternative flows.**

- **A1 - Measurement not expected.** No event is generated; the clinical view indicates that at that moment the measurement was not expected, and does not leave an ambiguous gap (`RF-295`).
- **A2 - Declared absence.** Outcome `EX-TM-DECLARED`: the event is generated with declared cause and severity reduced according to the plan, **not suppressed**; at the end of the period the severity returns to ordinary without any action (`RF-297`).
- **A3 - Absence explained by an administrative event.** Outcome `EX-TM-ADMIN`: the presumed cause and its source are reported, and the recipient confirms or disproves it recording the outcome.
- **A4 - Data arriving late.** The alarm is closed with `EX-TM-LATE` and the measurement is evaluated (`RF-304`).

**Error flows.**

- **E1 - Persistent silence without explanation or successful contact.** Outcome `EX-TM-DROPOUT` only after exhaustion of documented contact attempts and with professional decision; **never by passage of time** (`RF-247`).
- **E2 - Absence treated as normality by a clinical view.** Safety defect: every view exposes the age of the last data in evidence, and absence is represented as such in reports (`RF-248`, `RF-303`).
- **E3 - Suspension of monitoring to reduce noise.** Prohibited: noise reduction acts on severity and routing, never on generation of the absence event (`BR-150`).

**Postconditions.** Every window run without measurement has produced a recorded fact, qualified for cause, with a person responsible for its closure.

**Requirements and rules**: `RF-293` … `RF-299`, `RF-304`, `BR-150` … `BR-154`.

### UC-22 - Systemic ingestion failure

**Primary actor**: system. **Secondary**: system administrator, service centre, clinical service.
**Scope**: remote monitoring, platform.

**Preconditions.** The system knows the expected volume of measurements for window, tenant and source.

**Why this is the worst case.** It affects all patients together; it is invisible by construction if the system does not search for it actively, because "nothing arrives" is indistinguishable from normality in a poorly designed system; and generates, if not detected, a wave of individual alarms that saturates the service precisely when data are missing.

**Main flow.**

1. The volume received drops beyond the configured deviation threshold compared to the expected.
2. The system generates a **single** platform alarm `EX-TM-INGEST`, with maximum severity, technical recipient, list of affected sources and number of involved subjects.
3. It communicates the failure **also to the clinical service**, whilst it happens, with the monitoring perimeter suspended.
4. It qualifies the individual absence alarms generated in the period as **not evaluable due to source unavailability**, without cancelling them.
5. On restoration, it re-evaluates the data arrived in the meantime and reactivates the alarms that remain without explanation.

**Alternative flows.**

- **A1 - Deviation attributable to a single source.** The alarm is circumscribed to that source and its subjects, without suspending monitoring of the others.
- **A2 - Physiological volume variation.** The deviation threshold and observation window are configurable precisely to distinguish expected variation from failure.

**Error flows.**

- **E1 - Failure detected after the deadline of individual windows.** The requirement is violated: `RNF-092` imposes detection **before** the deadline of the first individual window of the tightest plan in operation.
- **E2 - Suppression of individual alarms instead of their qualification.** Prohibited: qualification preserves the information, suppression destroys it (`RF-302`).
- **E3 - Communication to the technical group alone.** Defect: it is the clinical service that must decide whether to activate an alternative channel for the most unstable patients, and can do so only if it knows (`RF-303`).

**Postconditions.** A single platform alarm exists with explicit perimeter; the clinical service is informed; no individual alarm has been lost.

**Requirements and rules**: `RF-300` … `RF-303`, `RNF-092`, `BR-155`.

### UC-23 - Plan review and conclusion

**Primary actor**: responsible professional. **Secondary**: patient, carer, service centre, treating clinician.
**Scope**: care pathway.

**Main flow (review).**

1. The professional modifies thresholds, frequencies, parameters or recipients.
2. The system creates a new version with author, motivation and effective instant.
3. It propagates the version to the patient side and awaits its acknowledgement.
4. The state of effectiveness is visible to both parties.

**Main flow (conclusion).**

1. The professional concludes the plan by selecting a typed motivation: objective reached, duration exhausted, consent revoked, persistent non-adherence, event that renders the pathway no longer applicable.
2. The system generates the final report in draft.
3. It notifies the patient and the treating clinician.
4. It opens the activity of retrieval of assigned devices.

**Alternative flows.**

- **A1 - Migration to a new version of pathway.** Explicit and traced act, which never occurs as an effect of the new version's publication (`RF-232`).
- **A2 - Temporary plan suspension.** With declared duration, motivation and automatic resumption; the patient is informed that during that period they are not monitored.

**Error flows.**

- **E1 - Version not acknowledged from the patient side.** Outcome `EX-TM-PLANSTALE`: the professional sees the state "awaiting acknowledgement" with the instant of the last attempt, and **not** a state that suggests the modification is operative (`RF-245`).
- **E2 - Attempt to modify in place.** Rejected: every modification is a new version (`RF-244`).
- **E3 - Plan that stops receiving data and nobody concludes it.** Not concluded, it is **abandoned**, which is the worst condition: it remains active with persistent anomaly evident (`RF-247`).
- **E4 - Conclusion without final report.** Conclusion is recorded but the pathway remains incomplete and appears among the service's documentary pending items.

**Postconditions.** A chain of plan versions exists fully reconstructible; on conclusion a typed motivation, a final report and a device retrieval activity exist.

**Requirements and rules**: `RF-244` … `RF-248`, `BR-102`, `BR-108`, `BR-109`.

### UC-24 - Measurement correction and alarm reconciliation

**Primary actor**: patient, carer or professional.
**Scope**: remote monitoring and alarms.

**Preconditions.** A measurement exists acquired, possibly already evaluated and at the origin of an alarm.

**Main flow.**

1. The user corrects the measurement or declares it invalid.
2. The system creates a new version, marking the previous as replaced; **nothing is deleted**.
3. It re-evaluates the affected window with the rules current at the measurement instant.
4. If an alarm had been generated on the original measurement, the alarm **does not disappear**: it is closed with outcome `EX-TM-CORRECTED` and remains in the history.
5. If re-evaluation produces a new condition, it generates a new alarm marked as deriving from re-evaluation.

**Alternative flows.**

- **A1 - Correction after alarm closure.** The closed alarm remains closed; the correction is linked and visible in its history.
- **A2 - Correction of data already merged into a periodic report.** The report is not rewritten: a subsequent version is issued that reports the correction.

**Error flows.**

- **E1 - Attempt to delete the measurement.** Rejected in every role (`RF-261`).
- **E2 - Correction that does not reconcile the alarms.** Defect: it is the dangerous scenario that leaves an incorrect value already evaluated in circulation.
- **E3 - Re-evaluation that generates an alarm on an old fact.** Allowed but **marked as late** with the age of the data, and closable with dedicated outcome without altering response statistics (`RF-263`).

**Postconditions.** The history contains both versions, what the system evaluated when it evaluated it, and alarms reconciled with explicit outcome.

**Requirements and rules**: `RF-258`, `RF-261` … `RF-263`, `RF-304`, `BR-110`, `BR-113`, `BR-115`.

## 4. Summary of outcomes and responsibility

The table summarises, for each outcome family, who decides the outcome and which administrative effect is allowed. This is the part that, if wrong, produces contention.

| Outcome family | Who decides the outcome | Allowed administrative effect |
|---|---|---|
| Clinical outcomes of service (`EX-CLIN-STOP`, `EX-ESCALATE`, `EX-EMERGENCY`) | exclusively the professional | according to the service type; escalation to in-person is a legitimate outcome, not a failure |
| Technical outcomes attributable to the service (`EX-TECH-FAIL`, `EX-QOS`) | the system detects, the professional qualifies | no charge to the patient; obligation to reschedule |
| Technical outcomes attributable to the patient side (`EX-TECH-PATIENT`) | the system detects with telemetric evidence | **not** a no-show; rescheduling without charge |
| No-show (`EX-NOSHOW`) | the system, only in absence of any recorded attempt | configurable effects by the tenant, only if communicated at booking time |
| Identification and capacity outcomes (`EX-IDENT-FAIL`, `EX-CAPACITY`) | the professional | contact cancelled or suspended without charge |
| Outcomes of data absence (`EX-TM-NOSIGNAL`, `EX-TM-UNEXPLAINED`, `EX-TM-DROPOUT`) | the system detects, the clinician qualifies and closes | none automatic; conclusion of the pathway always requires an act |
| Technical outcomes of remote monitoring (`EX-TM-DEVICE`, `EX-TM-LINK`, `EX-TM-INGEST`) | the service centre | none chargeable to the assisted person |
| Outcomes of alarm management (`EX-TM-NOACK`, `EX-TM-ESCFAIL`) | the system detects, the service manager responds | safety indicator; no effect on the assisted person |
| Channel exit (`EX-TM-EXIT`) | the system recognises a marker placed by a clinician | none; the fact is clinical documentation and proof of fulfilment |
