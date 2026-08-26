# Governance del progetto

*[English version below](#project-governance)*

Telemedic è un progetto open source con licenza Apache-2.0. Questo documento dice chi
decide cosa, come si diventa manutentore e come si risolvono i disaccordi. È scritto perché
chi valuta di costruirci sopra un prodotto sappia in anticipo come funziona.

## Stato attuale

Il progetto è in fase iniziale e ha un unico manutentore, **Federico Calò**, che ne è il
promotore. Non è una posizione permanente: questo documento descrive fin d'ora il modello a
cui il progetto tende, e i criteri per estenderlo.

Fino a quando i manutentori sono meno di tre, le decisioni sono del manutentore, con
l'obbligo di motivarle pubblicamente nelle issue o negli ADR.

## Ruoli

**Utilizzatore** - chi installa o integra Telemedic. Non ha obblighi verso il progetto, ma
le sue segnalazioni sono la fonte principale delle priorità.

**Contributore** - chiunque abbia una modifica accolta, di codice, documentazione,
traduzione, test o revisione. Non serve alcuna formalità.

**Manutentore** - ha diritto di scrittura sul repository e responsabilità di revisione su
una o più aree. Si diventa manutentori per invito dei manutentori esistenti, sulla base di
contributi continuativi e di qualità, non di un conteggio.

**Responsabile di area** - un manutentore con competenza riconosciuta su un'area (media in
tempo reale, interoperabilità, sicurezza, conformità, interfaccia). La sua revisione è
richiesta per le modifiche a quell'area.

**Responsabile della conformità** - figura distinta, non necessariamente uno sviluppatore.
Presidia il materiale regolatorio, la gestione del rischio e la tracciabilità dei requisiti.
Ha diritto di veto motivato sulle modifiche che incidono sulla qualificazione del prodotto.

## Come si decide

Le decisioni si prendono per **consenso ricercato, non per voto**: si discute finché non
resta un'obiezione sostanziale non risolta. Il voto è l'eccezione, non il metodo.

Le decisioni architetturali si registrano come **ADR** in `docs/adr/`. Un ADR dice il
contesto, le alternative considerate, la decisione e le conseguenze. Le decisioni non
scritte non esistono: sei mesi dopo nessuno ricorda perché.

Le decisioni che incidono sulla **qualificazione regolatoria** - logica di soglia e allarmi,
contenuto dei documenti clinici, consenso e identificazione, tracciamento degli accessi,
cifratura del media - seguono il controllo delle modifiche descritto in
`docs/08_compliance/`. Non possono essere prese solo su base tecnica.

### Disaccordi

1. Si discute nella issue o nella pull request, con argomenti riferiti a fonti verificabili.
2. Se il disaccordo persiste, si scrive un ADR con le alternative e si chiede il parere dei
   responsabili di area interessati.
3. Se persiste ancora, decide il gruppo dei manutentori; in caso di parità, il promotore.
4. Ogni decisione presa in questo modo è pubblica e motivata.

## Come entrano le modifiche

- Ogni modifica passa da una pull request. Nessuno scrive direttamente su `main`, promotore
  compreso.
- Serve l'approvazione di almeno un manutentore che non sia l'autore. Per le aree a rischio
  clinico serve anche quella del responsabile di area.
- I controlli automatici devono essere verdi. Il controllo sulle terminologie e quello sui
  segreti non si aggirano: se falliscono a torto, si corregge il controllo, non lo si salta.

**La seconda regola oggi non è applicabile, e va detto qui invece di lasciarlo scoprire.** Il
progetto ha un solo manutentore: un insieme di uno non contiene un elemento diverso dall'autore,
quindi l'approvazione di «almeno un manutentore che non sia l'autore» non è rispettabile da
nessuno. La regola **non è sospesa e non è emendata**: è inapplicabile per una condizione di
fatto, e torna vincolante nel momento esatto in cui entra il secondo manutentore, senza che
nessuno debba deliberare di nuovo. Fino ad allora l'approvazione che resta registrata è quella
dell'autore su sé stesso, ed è una **lacuna dichiarata, non una conformità**: è la prima voce
della questione aperta `Q-189`. La procedura che la registra e ne descrive la forma è
`docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`; la ragione per esteso, con ciò che la
norma presuppone e che qui manca, è in `docs/08_compliance/10-controllo-dei-documenti.md`.

## Rilasci

Versionamento semantico. Ogni rilascio pubblica: note di rilascio, distinta dei materiali
software, esito dei test, dichiarazione del periodo di supporto e - quando la modifica
tocca aree qualificanti - la documentazione di gestione delle modifiche.

Il progetto **non appone marcatura CE e non sottoscrive dichiarazioni di conformità**. Chi
immette sul mercato o mette in servizio assume il ruolo di fabbricante e le relative
responsabilità. Il materiale regolatorio è prodotto e reso disponibile per rendere questo
percorso praticabile, non per sostituirlo.

## Aziende e integratori

L'integrazione commerciale è un obiettivo dichiarato del progetto, non una tolleranza. La
licenza Apache-2.0 è stata scelta per questo.

Un'organizzazione che integra Telemedic è benvenuta come contributore alle stesse condizioni
di chiunque altro. Contribuire non conferisce diritti di indirizzo: **nessuna funzionalità
entra in `main` perché la chiede un integratore**, e nessuna viene rifiutata per la stessa
ragione. Il criterio è se serve al progetto e se qualcuno la manterrà.

Il progetto non accetta contributi che introducano dipendenze da servizi proprietari o non
sostituibili nel percorso principale.

## Cambiare questo documento

Con una pull request, con la stessa procedura di ogni altra modifica, e con un periodo di
commento di almeno quattordici giorni.

---

# Project governance

Telemedic is an open source project under Apache-2.0. This document states who decides what,
how one becomes a maintainer, and how disagreements are resolved. It exists so that anyone
considering building a product on top of it knows in advance how the project works.

## Current state

The project is in its early phase with a single maintainer, **Federico Calò**, who initiated
it. This is not a permanent arrangement: this document describes from the outset the model
the project is moving towards, and the criteria for extending it.

While there are fewer than three maintainers, decisions rest with the maintainer, with an
obligation to justify them publicly in issues or ADRs.

## Roles

**User** - anyone deploying or integrating Telemedic. No obligations towards the project,
but their reports are the primary source of priorities.

**Contributor** - anyone with an accepted change: code, documentation, translation, tests or
review. No formality required.

**Maintainer** - holds write access and review responsibility over one or more areas.
Maintainership comes by invitation from existing maintainers, based on sustained
high-quality contribution, not on a count.

**Area owner** - a maintainer with recognised expertise in an area (real-time media,
interoperability, security, compliance, user interface). Their review is required for
changes in that area.

**Compliance owner** - a distinct role, not necessarily a developer. Owns the regulatory
material, risk management and requirements traceability. Holds a reasoned veto over changes
affecting the product's qualification.

## How decisions are made

Decisions are made by **sought consensus, not by vote**: discussion continues until no
substantial unresolved objection remains. Voting is the exception, not the method.

Architectural decisions are recorded as **ADRs** in `docs/adr/`, stating context,
alternatives considered, decision and consequences. Unwritten decisions do not exist: six
months later nobody remembers why.

Decisions affecting **regulatory qualification** - threshold and alarm logic, clinical
document content, consent and identification, access logging, media encryption - follow the
change control described in `docs/08_compliance/`. They cannot be taken on technical grounds
alone.

### Disagreements

1. Discuss in the issue or pull request, with arguments grounded in verifiable sources.
2. If disagreement persists, write an ADR with the alternatives and ask the relevant area
   owners for an opinion.
3. If it still persists, the maintainer group decides; in a tie, the project initiator does.
4. Every decision taken this way is public and justified.

## How changes land

- Every change goes through a pull request. Nobody commits directly to `main`, initiator
  included.
- At least one maintainer other than the author must approve. Clinically sensitive areas
  also require the area owner's approval.
- Automated checks must pass. The terminology guard and the secret scan are not bypassed: if
  they fail wrongly, the check is fixed, not skipped.

**The second rule is not applicable today, and this must be stated here rather than left to be
discovered.** The project has a single maintainer: a set of one contains no element other than the
author, so approval by «at least one maintainer other than the author» cannot be met by anyone. The
rule **is not suspended and is not amended**: it is inapplicable by a condition of fact, and becomes
binding again the very moment a second maintainer arrives, without anyone having to decide anew.
Until then the approval that stands recorded is the author's own approval of themselves, and it is a
**declared gap, not conformance**: it is the first item of open question `Q-189`. The procedure that
records it and describes its form is `docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`; the
full reasoning, with what the standard presupposes and what is missing here, is in
`docs/08_compliance/10-controllo-dei-documenti.md`.

## Releases

Semantic versioning. Every release publishes: release notes, software bill of materials,
test results, declared support period and - where the change touches qualifying areas -
change management documentation.

The project **affixes no CE marking and signs no declaration of conformity**. Whoever places
the product on the market or puts it into service takes on the manufacturer role and its
responsibilities. The regulatory material is produced and made available to make that path
practicable, not to replace it.

## Companies and integrators

Commercial integration is a stated goal of the project, not something merely tolerated. The
Apache-2.0 licence was chosen for this.

An organisation integrating Telemedic is welcome as a contributor on the same terms as
anyone else. Contributing confers no steering rights: **no feature lands in `main` because
an integrator asks for it**, and none is refused for that reason either. The criterion is
whether it serves the project and whether someone will maintain it.

The project does not accept contributions introducing dependencies on proprietary or
non-substitutable services in the main path.

## Changing this document

By pull request, following the same procedure as any other change, with a comment period of
at least fourteen days.
