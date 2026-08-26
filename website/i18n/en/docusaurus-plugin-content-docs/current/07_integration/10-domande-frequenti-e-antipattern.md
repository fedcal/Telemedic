---
title: Frequently asked questions and antipatterns
sidebar_position: 11
description: "The questions that actually arrive, with direct answers. And the catalogue of errors we expect, ordered by severity, with symptom, cause and remedy."
---

# Frequently asked questions and antipatterns

The chapter is divided in two. **Frequently asked questions** answer what is asked before and during integration. **Antipatterns** describe the errors we expect: they have a name, a recognisable symptom and a remedy.

It is worth reading **before** opening an issue. Not to discourage issues, but because most blockers have a known cause, and recognising it saves days.

---

## Part one - frequently asked questions

### 1. Before starting

**Can I use it to deliver services to real patients?**
No, until a marking exists for the distribution you are using. The project does not place one and states so in every artefact. Whoever puts into service assumes the obligations of manufacturer. See [09 §1](09-obblighi-di-chi-integra.md).

**Is the code certified?**
Source code is not a medical device, so it is not certifiable as such. What can be certified is an **identified distribution**, produced by reproducible build, with a specific manufacturer. The two artefacts have different names, versions and lifecycles, and it is a substantial distinction, not formal.

**How much time does a first integration take?**
The sequence of chapter [02](02-primo-avvio.md) - token, service, verified notification, embedded component, document retrieval - is doable in days by a back-end and front-end developer, **provided the prerequisites of §1 of that chapter are met before starting**. Time that is lost is almost always there: not in integration, in waiting for a domain, a certificate or an organisational decision.

**Must I know the clinical standard to integrate?**
For the application mode, no: the application plane is designed to be used by whoever does not know the clinical model. You must know it if you must **consume** the clinical documentation produced, and in that case module [10 §06](../10_fondamenti/06-fhir-da-zero.md) starts from zero.

**Can we test without installing anything?**
Yes, but testing must be done with **synthetic data**. Testing with real people's data in a test environment is processing without production safeguards, and is anyway excluded by the previous point on marking.

### 2. Identity and access

**Do our users really need a second login?**
No, if you have an identity issuer that publishes its own key material. Identity is delivered **between back-ends**, with delegation. See [06 §3](06-identita-e-delega.md).

**Can we pass our user's token from the browser?**
No. It would be manipulable and end up in logs: it is not an identity assertion, it is a browser claim. Propagation occurs between back-ends, without exception.

**Why don't you give us a token that lasts all day?**
Because a long-lived token defeats revocation and widens the window where a leak is exploitable. Getting a new one is a back-end call, not a user session: if the cost of that call is a problem, the problem is elsewhere.

**Is revocation immediate?**
No, and it must be stated: a token validated locally remains valid until its expiry even after being revoked. It is why clinical tokens last five minutes. Where immediacy is needed there is an additional mechanism, which must be activated knowingly ([03 §2.4](03-integrazione-per-api.md)).

**Does the authentication assurance level we do count as if you did it?**
No, and the distinction is explicit in the token. An assurance level **asserted** by an integrator is marked as such and **does not satisfy** the strong authentication requirements that regulations impose on certain operations. See [06 §5.2](06-identita-e-delega.md).

**What is an "attribution domain" and why do you ask for it on every call?**
Because an identifier without a domain is a string. `PZ-889231` identifies no one; `PZ-889231` in your namespace does. Without it, two different integrators with the same numbering scheme would produce collisions between different people.

### 3. Interfaces

**Why are there two interfaces and not one?**
Because they answer different questions. The clinical plane serves to be read by healthcare systems that do not know Telemedic; the application plane serves to use the product's capabilities. Merging them produces either an interface unreadable to third parties or a clinical model polluted by technical concepts. See [03 §1](03-integrazione-per-api.md).

**Is the idempotence key a standard?**
No, and it is stated: the reference draft **expired and archived**, and never became an RFC. The field name is maintained because it is the most widespread convention, but must be presented as **project convention**.

**Why do you refuse a modification without conditional validator?**
Because allowing a blind update on clinical documentation is an untracid data loss. It is a risk to record in a risk analysis, not a convenience to grant.

**Are traffic limitation headers standard?**
No. The three-header form many cite was never standard **and is also outdated**: the current draft revision defines only two fields. The project emits both forms during the transition and declares that neither is normative.

**How do we know if a change will break our integration?**
Non-compatible changes go through a twelve-month process with announcement, deprecation headers and scheduled interruption windows. **Compatible** changes - field addition, endpoint addition, enumerated value addition, event type addition - happen without notice, and your client must tolerate them. See [03 §9.3](03-integrazione-per-api.md).

### 4. Events

**Why does the notification not contain the report?**
Minimisation, reduction of harm if destination is misconfigured, and traceability: if you retrieve content, access ends up in the log with your name. See [04 §3.2](04-integrazione-per-eventi.md).

**Why is the signature asymmetric instead of with a shared secret?**
Because with a shared secret **you could forge** notifications indistinguishable from real ones. Facing a challenge, you could not prove to a third party that a notification came from us. And because rotating a shared secret requires coordination with every integrator.

**We receive the same event twice. Is it a defect?**
No, it is the declared guarantee: delivery **at least once**. "Exactly once" exists only as joint effect with your deduplication.

**Do events arrive in order?**
No, not between different subjects. Use the sequence number per aggregate and discard those lower than what you have already applied ([04 §7.2](04-integrazione-per-eventi.md)). An ordered mode exists, but has real cost and is advised against as default.

**We have not received events for two days. How do we know?**
By monitoring the **periodic signal**. A broken channel and a period without activity produce the same silence: without the signal they are indistinguishable.

**We cannot expose an address to the Internet.**
It is not a problem: use polling the events list, with the same completeness guarantees ([04 §11](04-integrazione-per-eventi.md)).

### 5. Embedded component

**The camera will not turn on inside the frame.**
In 90% of cases the permissions policy header is missing **on your page**. The frame's attribute restricts, does not grant. See [05 §2](05-componente-incorporabile.md).

**Video and audio work, screen sharing does not.**
Screen capture is a function of its own and must be listed separately.

**Can we serve the component from our origin with a reverse proxy?**
Technically yes, and the project **does not support it**: the isolation between your code and the clinical session would cease to exist. If you do it, it is a configuration to declare, with the consequences.

**Can we hide the recording indicator because it disturbs the layout?**
No. It is an insurmountable limit, and the attempt is refused and traced. The reason is in [05 §7.2](05-componente-incorporabile.md).

**Our company colour is being rejected.**
Because it produces insufficient contrast. The refusal is deliberate and happens server-side: accessibility is a functional requirement, and an integrator must not be able to degrade it. The error indicates the ratio measured and the one required.

**Can we pass our own stylesheet?**
No. Permitting it would allow hiding consent warnings, altering clinical labels and overlaying elements. Theme properties are a closed set.

**The entry token expires too fast.**
It lives forty-sixty seconds and is single-use, by construction. If your page takes longer to mount, the problem is when you request it: request it **at mount time**, not at the previous screen's load time.

### 6. Data

**Do you become our demographic archive?**
No. The project conserves a minimal projection linked to your identifiers. Your reference data remains yours. See [07 §1](07-dati-e-sincronizzazione.md).

**We have two patients for the same person.**
You sent the identifier without domain, or with two different domains. The rejoining procedure exists, is traced and **is not automatic**, because an erroneous merger is an adverse event.

**Why don't you automatically merge two records with the same fiscal code?**
We do, if correspondence is exact on a strong identifier **and** demographic data are coherent. In every other case a candidate is generated for human review. The asymmetry between the two possible errors imposes caution: a missed merger is corrected, an erroneous merger leaves traces in signed clinical documentation, which is immutable.

**We updated a document and you created a new one.**
The signed clinical document is **immutable**: it is not modified, it is replaced maintaining the chain. Your system must be able to represent a replacement.

**Can we put the fiscal code in the opaque data field?**
No. That field is not encrypted field-by-field, appears in notifications and may appear in diagnostics. The prohibition is verified with heuristics.

### 7. Modules and personalisation

**Can we replace reporting with ours?**
Yes, it is a disactivable module. But the document remains **persistence of content written by the professional**: if your module generates clinical content, you have changed the nature of the product and the conformity evaluation must be redone on your perimeter.

**Can we load our own module inside the process?**
Only in installations dedicated to a single customer. In shared installations among multiple tenants it is an admissibility condition that is not satisfied.

**Can we have an extension point for our case?**
If you are the first to ask for it, almost certainly the form would be wrong. Open a question describing the problem, not the interface you would like: two concrete implementations and then the abstraction, not speculative abstraction to maintain for years.

### 8. Conformity and responsibility

**If we use your code, what are we responsible for?**
The answer is the table of [09 §9](09-obblighi-di-chi-integra.md), row by row. In short: whoever puts into service assumes the obligations of manufacturer, and the licence's limitation of liability clauses apply between the parties, **not towards the patient**.

**Our customer is an insurance company that wants to see the reports of their insured.**
It is not possible, and it is not a product choice: insurance companies are **always** excluded from access to the electronic health record. The payer can obtain the administrative outcome, not the clinical content. See [09 §5](09-obblighi-di-chi-integra.md).

**Can a doctor affiliated with the insurance company access on their behalf?**
No. A professional's enablement for access is functional to care; using it to feed an insurance evaluation is a different purpose, and difference of purpose is not remedied by the identity of who accesses.

**Who pays for terminology licences?**
Whoever installs and whoever puts into service. And with three traps: the external service does not exempt you; whoever distributes distributes a product subject to the licence even without containing a single concept; tariffs apply **also in non-production environments**. See [09 §6](09-obblighi-di-chi-integra.md).

**Does the system work if we don't buy them?**
Yes, fully. No main path requires them. The cost is declared: some code validations do not execute.

---

## Part two - antipattern catalogue

Every entry has a name, because having a name for an error makes discussion possible. The level indicates how much it costs to discover it late.

### Level 1 - irreversible or nearly

| # | Name | Symptom | Why it is serious | Remedy |
|---|---|---|---|---|
| A1 | **The domain that changes** | After months, someone "cleans" the domain identifier: removes a slash, changes subdomain | History splits in two and reconciliation becomes manual, record by record | The domain never changes **ever**. Register it, freeze it, verify it in continuous integration |
| A2 | **Convenient impersonation** | Token carries only the user's identity, without the actor | The log loses forever the information about which system acted. Cannot be reconstructed | Delegation, always |
| A3 | **Asserted level passed off as verified** | Level from external assertion copied into issued token without qualifying it | Log states the false: declares verified by project an authentication by others | Explicit marker, two distinct values |
| A4 | **Requirement identifiers renumbered** | Your process remaps identifiers to your numbering | Traceability breaks and **cannot be reconstructed afterwards** | Frozen identifiers, additive mapping if truly needed |
| A5 | **Intended purpose written by marketing** | Commercial material promises real-time monitoring | It is a statement of intended purpose even if not called that, and shifts classification | Freeze intended purpose, then align material, never the reverse |
| A6 | **Generous automatic merging** | Two records merge on approximate match | Erroneous merger: one person's clinical documentation enters another's history, immutable | Candidate and human review above exact correspondence |

### Level 2 - costly to correct in production

| # | Name | Symptom | Why it is serious | Remedy |
|---|---|---|---|---|
| B1 | **The naive receiver** | No deduplication, no signature verification, slow response | Two reports published, notifications accepted by anyone knowing the address, retries that multiply load | Deduplicate, verify, respond quickly and work asynchronously |
| B2 | **Random idempotence key** | Generated new on every retry, or omitted in automatic library retry | Duplicates by construction, exactly when they must not be | Derive from logical retry and reuse in retries |
| B3 | **Token in the address** | Entry token appears in the frame address | Ends up in history, proxy logs, referrer header, screenshots, error monitoring | Delivery between back-ends, then messaging |
| B4 | **Overwriting archived document** | New version replaces the one archived | Information is lost about what was reported and when: what is needed in a challenge | Represent replacement, maintain chain |
| B5 | **Eternal role** | Role starts are notified, cessations never | Who changes facility keeps legitimate access from system's perspective | Notify the end, not just the start |
| B6 | **Single client for all environments** | Same credentials in testing and production | An incident in testing becomes an incident in production | One client, one key, one tenant, one origin list per environment |
| B7 | **Silence interpreted as normality** | No events arriving, no alarm | Broken channel is indistinguishable from a period without activity. Missing reports are discovered after weeks | Monitor the periodic signal and expected volume |
| B8 | **Total sync "for safety"** | Entire demographic record dumped | Treat data of people with no service. Excessive processing without benefit | Reference on occasion |
| B9 | **Log of bodies** | HTTP layer logs requests and responses by default | Health data in your application logs, with obligations you did not plan | Log metadata, not bodies. Never tokens |
| B10 | **Versioning mistaken for immutability** | Declared immutable log that is entity versioning | Whoever has write access can alter versioning tables too: the declared property does not exist | Hash chain and separate preservation |

### Level 3 - friction and support tickets

| # | Name | Symptom | Remedy |
|---|---|---|---|
| C1 | **Verification on reserialized body** | Signature never verifies | Read raw bytes, verify digest before signature |
| C2 | **Clock drift** | Intermittent rejections seeming like signature defects | Synchronise clock: the window is five minutes |
| C3 | **Assumed scope** | Rejections on endpoint that "should work" | Read the scope **granted** in token response, not the one requested |
| C4 | **Rigid client** | Breaks when a new field appears or unknown enumerated value | Ignore the unknown: it is a compatible change by definition |
| C5 | **Error on unknown event type** | New type fails the receiver | Ignore and respond successfully anyway |
| C6 | **Screen capture forgotten** | Video and audio yes, sharing no | It is a function of its own in the permissions policy |
| C7 | **Navigation inside the frame** | Permissions lost after load | The frame does not navigate to other origins: that is why token arrives between back-ends |
| C8 | **Approximate origin comparison** | Works, and accepts hostile origins too | **Exact** comparison, never suffix or containment |
| C9 | **Generic destination in messaging** | Works until frame is replaced | Explicit origin, always |
| C10 | **Instant without timezone** | Services scheduled with an hour skew, twice a year | Explicit timezone, always |
| C11 | **Synchronised burst** | Half the calls rejected at 7:00 sharp | Distribute, with a few-second random delay |
| C12 | **Immediate retry** | Quota rejection multiplies | Respect the "retry after" indication |
| C13 | **Certificate verification disabled "for testing"** | No symptom. Stays disabled | Insert proxy's certificate in trust chain, or exclude destination |
| C14 | **Cursor preserved too long** | Resume fails after days | Resume from instant after long interruption |
| C15 | **Persisted terminology service cache** | No technical symptom, a licence problem | Non-disk-persisted memory for systems whose licence does not permit derivatives |

### Level 4 - architectural, paid afterwards

| # | Name | Why it is an error | Alternative |
|---|---|---|---|
| D1 | **Component in process for clinical session** | Token ends up in your app's execution context: an injection vulnerability in your system becomes access to clinical sessions | Frame on separate origin |
| D2 | **Reverse proxy on your own origin** | Isolation ceases to exist, and frame restriction becomes illusory | Cross-origin frame, architecture without cookies |
| D3 | **Cookie-based session** | Intermittent and unreproducible: depends on browser, version and user configuration | No cookie, credentials in memory |
| D4 | **Network metrics modelled as clinical observations** | End up in patient's record, shift what the system asserts about the patient | Application plane |
| D5 | **Product capability forced into a clinical resource** | If most content is in proprietary extensions, it is not interoperability: it is proprietary format dressed as standard | Application plane |
| D6 | **Extension point tailored to one integrator** | Almost certainly wrong form, must be maintained for years | Two concrete implementations, then abstraction |
| D7 | **Preventive transformation of clinical data** | Makes source irrecoverable and erases the boundary between what the professional wrote and what the program wrote | Preventive decision that can only refuse |
| D8 | **Code bifurcation as first response** | Exits conformity evaluation perimeter, breaks security update flow, all process guarantees lapse | Ask for the missing extension point |
| D9 | **Consent as a checkbox** | Does not answer "was it valid at that moment?", which is the only question that matters in a challenge | Fact with temporal validity |
| D10 | **Payer treated as consultant** | Not configurable, and in commercial material it is a statement to correct | Administrative profile by construction |

---

## Part three - phrases that signal a problem

They are phrases heard in integration meetings. Each is, almost always, the symptom of a decision that must be revised.

1. **"For now we put the token in a variable, then we fix it."** It does not get fixed.
2. **"We will verify the signature afterwards."** The receiver goes to production without verification, and verification never arrives because "it works".
3. **"Just send us the report in the notification."** No, and the reason is not technical.
4. **"So the user clicks twice, it's fast anyway."** A second login is the most reliable way to fail a telemedicine project.
5. **"Our system is behind the firewall, authentication is not needed."** Authentication does not protect from the network: it protects against misattribution.
6. **"We copy all the demographics, it is simpler."** It is simpler until it diverges, and it always diverges.
7. **"We hide that warning, the user finds it annoying."** If a warning is annoying, either it is poorly written or the user is right to be warned. In either case you do not hide it.
8. **"If no notifications arrive it means there is nothing."** Or the channel is broken.
9. **"We will define the contract as we go."** A contract defined as we go is a contract that breaks as we go, and what breaks is always someone else's integration.
10. **"We will look at conformity at the end."** Some activities **are not recoverable afterwards**: requirement identifiers, third-party component inventory, document control. What is born outside control must be reissued.

---

## Part four - how to ask for help effectively

If after all this you are still stuck, this information greatly reduces response time.

| Information | Why it matters |
|---|---|
| **The trace identifier** present in every error response | Lets us find the exact request without asking you to reproduce it |
| **The problem type** - not the message, the identifier | It is the stable key; message changes with language |
| **The instant with timezone** | An instant without timezone costs an extra exchange of messages |
| **What you expected and what you got**, separated | Half the issues describe only the second |
| **The request**, with tokens **removed** | A token pasted in an issue is a token to revoke |
| **The environment and tenant** | Testing and production are distinct installations |
| **If it worked before**, and when it stopped | Narrows the field to one change, yours or ours |

And a request: **never paste real people's data in an issue.** An internal identifier is enough to find the case in authorised systems, and does not transform an issue into out-of-perimeter health data processing.
