---
title: "Procedura di controllo dei documenti"
sidebar_position: 14
description: "La procedura operativa di controllo dei documenti del progetto: elenco nominale dei documenti sottoposti a controllo con il proprio stato, regola di identificazione e di versione, revisore nominato per ciascuna categoria, forma dell'approvazione, regola di ritiro. È essa stessa un documento sottoposto a controllo e compare nel proprio elenco. Non è un capitolo divulgativo: dice chi fa che cosa, quando, e quale traccia resta."
---

# Procedura di controllo dei documenti

> **Che cosa è questo documento.** È una **procedura**, non un capitolo. Un capitolo spiega perché
> una cosa va fatta; una procedura dice **chi la fa, quando, con quale atto e quale traccia resta**.
> Chi la esegue non deve averla scritta: se una riga richiede di sapere che cosa aveva in mente
> l'autore, quella riga è difettosa e va segnalata.
>
> **Rapporto con il capitolo divulgativo.** Il ragionamento, la norma di riferimento, la ripartizione
> fra le funzioni del fabbricante e quelle di chi installa, e - punto più importante di tutti - la
> lacuna per cui redattore e approvatore coincidono stanno in
> [08/10 - Controllo dei documenti](/08_compliance/10-controllo-dei-documenti.md). Questa procedura
> **vi rinvia e non lo ricopia**: due testi che dicono la stessa cosa in due luoghi divergono al
> primo aggiornamento, e in materia regolatoria una divergenza è una dichiarazione doppia. I quattro
> strumenti su cui poggia la registrazione dell'approvazione sono **git** (versionamento distribuito),
> **GitHub** (piattaforma di ospitalità), **controlli automatici di costruzione** (linter, sintassi,
> link checker, identificativi) e **firma crittografica dei commit** (adottata il 26 agosto 2026,
> firma obbligatoria sul ramo in sospeso); la loro **validazione** è descritta al § 8 del capitolo 10.
>
> **Questo documento non dichiara alcuna conformità.** Non afferma che il progetto sia conforme a
> ISO 13485 né ad altro. Non può: la lacuna dichiarata al § 10 lo impedisce, e resta.

---

## 1. Scheda della procedura

| Voce | Valore |
|---|---|
| **Identificativo** | Il percorso assoluto nel repository: [`docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`](../08_compliance/PROCEDURA-controllo-dei-documenti.md). È la regola di identificazione del § 4, applicata a questo stesso documento |
| **Gemello inglese** | [`website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/PROCEDURA-controllo-dei-documenti.md`](https://github.com/fedcal/Telemedic/blob/main/website/i18n/en/docusaurus-plugin-content-docs/current/08_compliance/PROCEDURA-controllo-dei-documenti.md). Le due versioni sono **lo stesso documento controllato in due lingue**, non due documenti |
| **Identificativo `QMS-*`** | **Nessuno assegnato.** La ragione, che è una lacuna e non una dimenticanza, è al § 10, voce `c` |
| **Categoria** | Procedure del sistema di gestione della qualità che il progetto esercita su sé stesso |
| **Versione** | L'impronta del commit che ha modificato per ultimo il file, leggibile con `git log -1 --format=%H -- docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`. **Non è trascritta in questo campo**: un'impronta scritta qui sarebbe falsa dal commit successivo, e un campo di versione che mente è peggio di un campo assente |
| **Revisore nominato** | Federico Calò (`@fedcal`), per la riga `/docs/08_compliance/` di [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) |
| **Chi deve approvarla** | Il **Committente**. Non è una scelta di questa procedura: è il titolare dell'approvazione dichiarato da `T-01` in [09/02 - I traguardi](/09_roadmap/02-traguardi.md), che assegna al contributore unico la produzione e al Committente l'approvazione della procedura |
| **Forma dell'approvazione** | Revisione favorevole («Approved») sulla proposta di modifica che introduce questo file, secondo il § 6 |
| **Data di approvazione** | **27 agosto 2026.** Approvazione della lacuna dichiarata senza attenuazione, registrata come prima voce di [`Q-189`](../11_registri/02-questioni-aperte.md#q-189): redattore e approvatore coincidono. La lacuna resta aperta |
| **Stato** | **In vigore.** Il documento è approvato dal Committente il 27 agosto 2026 con la lacuna dichiarata, che resta aperta come prima voce di [`Q-189`](../11_registri/02-questioni-aperte.md#q-189) |
| **Riesame** | Alle condizioni del § 12 |

**Come si legge il campo «Stato», e perché conta.** «In attesa di approvazione» non significa «bozza
provvisoria»: significa che il testo è quello proposto al Committente e che l'atto che manca è
l'approvazione, non la scrittura. Quando l'approvazione avviene, cambiano **due** caselle in questa
scheda - la data e lo stato - e una riga del § 3, con la stessa proposta di modifica che le porta
entrambe. Chi trova questo campo ancora «in attesa» dopo l'approvazione ha trovato un difetto della
procedura, non una svista di trascrizione.

---

## 2. Scopo, perimetro e rapporto con il capitolo 10

**Scopo.** Stabilire quali documenti del repository sono sottoposti a controllo, come si identificano
e si versionano, chi li rivede, con quale atto si approvano e come si ritirano. È la procedura che il
criterio 1 di `T-01` esige, e la ragione per cui esiste come documento separato è al § 8.

**Che cosa governa.** Gli artefatti elencati al § 3, nelle **due lingue** in cui esistono. Una
modifica che tocchi un documento controllato e ne lasci indietro la versione nell'altra lingua non è
una traduzione mancante: è una divergenza fra due testi che dichiarano lo stesso obbligo, ed è già
accaduta due volte in questo repository.

**Che cosa non governa.** Il codice applicativo, che oggi non esiste; le procedure del sistema di
gestione della qualità del soggetto fabbricante, che sarà costituito e che le scriverà nel proprio
sistema documentale; le questioni e le proposte di modifica, la cui immutabilità per costruzione
**è** il loro controllo; la documentazione interna di lavoro in `.telemedic/`.

**Rapporto con [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174), che va detto per esteso perché è il punto in cui questa procedura e il resto
del corpus sembrano contraddirsi.** Il vincolo [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174), istituito in
[08/03 § 4.1](/08_compliance/03-sistema-di-gestione-della-qualita.md), dice che **nessun capitolo**
di questa documentazione è una procedura del sistema di gestione della qualità e che nessuna area può
presentare un proprio capitolo come tale: i capitoli sono ingressi, contengono l'analisi da cui una
procedura si scrive, non la procedura. **Quel vincolo resta valido e non è emendato da questo
documento**, perché questo documento non è un capitolo. È un artefatto di natura diversa, collocato
nella stessa cartella per comodità di lettura e distinto dal nome: i capitoli portano un numero
d'ordine, questo porta il prefisso `PROCEDURA-`. La conseguenza pratica, e serve saperla prima di
modificare qualunque cosa: i capitoli di `docs/08_compliance/` restano divulgativi e sono documenti
controllati **in quanto contenuto pubblico**, non in quanto procedure; questo documento è controllato
**in quanto procedura**, e il § 8 dice che cosa ne discende.

---

## 3. Elenco dei documenti sottoposti a controllo

Questa tabella è **anche il registro dello stato** dei documenti controllati. Il capitolo 10, al
§ 2 punto 4, prescrive che lo stato (in vigore / ritirato) sia dichiarato esplicitamente in un
registro e non dedotto dall'assenza del file. Quel registro, per i documenti, **non esisteva**:
`registro/` contiene il registro degli identificativi di requisito e nient'altro. La colonna «Stato»
che segue lo istituisce, e il § 7 dice come vi si scrive un ritiro.

**Documenti pubblici alla radice del repository.** Ciascuno è stato verificato presente sul disco
prima di essere elencato.

| Documento | Revisore nominato | Stato | Quando si riesamina |
|---|---|---|---|
| [`README.md`](https://github.com/fedcal/Telemedic/blob/main/README.md) | `@fedcal` (riga `*`) | In vigore | Ogni modifica. Porta il richiamo in evidenza che il criterio 8 di `T-01` esige riallineato |
| [`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md) | `@fedcal` | In vigore | Ogni modifica |
| [`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md) | `@fedcal` | In vigore | Ogni modifica |
| [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | `@fedcal` | In vigore | Ogni modifica |
| [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) | `@fedcal` | In vigore | Ogni modifica, e con periodo di commento di quattordici giorni imposto dal documento stesso |
| [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md) | `@fedcal` | In vigore | Ogni modifica |
| [`SUPPORT.md`](https://github.com/fedcal/Telemedic/blob/main/SUPPORT.md) | `@fedcal` | In vigore | Ogni modifica |
| [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md) | `@fedcal` | In vigore | Ogni modifica |
| [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) | `@fedcal` | In vigore | Ogni modifica |
| [`publiccode.yml`](https://github.com/fedcal/Telemedic/blob/main/publiccode.yml) | `@fedcal` | In vigore | Ogni modifica. Le voci di conformità restano `false` finché la prova corrispondente non è pubblicata ed eseguita |
| [`LICENSE`](https://github.com/fedcal/Telemedic/blob/main/LICENSE) | `@fedcal` | In vigore | **Non si modifica.** È il testo della Apache-2.0 alla lettera; una modifica del suo contenuto è un difetto, e un cambio di licenza è una decisione da registrare come tale, non una modifica di questo file |
| [`NOTICE`](https://github.com/fedcal/Telemedic/blob/main/NOTICE) | `@fedcal` | In vigore | Ogni modifica. È richiesto dalla sezione 4(d) della Apache-2.0 e ogni ridistribuzione deve portarne il contenuto |
| [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) | `@fedcal` | In vigore | Ogni modifica, e obbligatoriamente all'ingresso di un secondo manutentore. **È l'unico luogo del repository in cui i revisori sono nominativi**: se non fosse controllato, la nomina dei revisori non sarebbe controllata |
| [`VERIFICA-DELL-ARTEFATTO.md`](https://github.com/fedcal/Telemedic/blob/main/VERIFICA-DELL-ARTEFATTO.md) | `@fedcal` | In vigore | Ogni modifica. È la procedura di verifica a cura di chi installa, esigita dal criterio 8 di `T-03`: se cambia il modo in cui gli artefatti sono firmati, cambia qui |
| [`.gitleaks.toml`](https://github.com/fedcal/Telemedic/blob/main/.gitleaks.toml) | `@fedcal` | In vigore | Ogni modifica, **e ogni voce aggiunta all'elenco di ammissione è un'attenuazione di `G1`**: va motivata nel file stesso, voce per voce, perché una riga in più qui è una forma di segreto che il controllo smette di vedere |

Gli otto documenti bilingui alla radice - le tre avvertenze pubbliche e le cinque altre dichiarazioni
di `D51` - sono **bilingui in un file solo**, con il blocco italiano, un separatore e il blocco
inglese. Non esistono file `.en.md` separati e non devono esistere: due file significherebbero due
testi che divergono in silenzio esattamente dove la divergenza costa di più.

**Questa procedura.**

| Documento | Revisore nominato | Stato | Quando si riesamina |
|---|---|---|---|
| [`docs/08_compliance/PROCEDURA-controllo-dei-documenti.md`](../08_compliance/PROCEDURA-controllo-dei-documenti.md) e il suo gemello inglese | `@fedcal` | **In vigore** | Alle condizioni del § 12 |

**Documentazione pubblicata.** Ogni area compare per intero, **nelle due lingue**. La versione
inglese di un documento controllato è lo stesso documento controllato, non un artefatto accessorio:
risiede in `website/i18n/en/docusaurus-plugin-content-docs/current/<area>/` con **percorso e nome
identici** all'originale italiano, ed è la condizione perché il sito la riconosca come traduzione
invece di pubblicarla come pagina orfana.

| Area | Revisore nominato | Stato | Quando si riesamina |
|---|---|---|---|
| `docs/00_overview/` | `@fedcal` (riga `*`) | In vigore | A completamento di un traguardo che modifica ciò che il progetto dichiara di essere |
| `docs/01_technical/` | `@fedcal` | In vigore | A completamento di un traguardo che modifica le decisioni tecniche |
| `docs/02_architecture/` | `@fedcal` | In vigore | A completamento di un traguardo che modifica le decisioni architetturali |
| `docs/03_functional/` | `@fedcal` | In vigore | A completamento di un traguardo che modifica il perimetro funzionale |
| `docs/04_protocols/` | `@fedcal` | In vigore | A completamento di un traguardo che modifica le interfacce o le prove di conformità |
| `docs/05_domain/` | `@fedcal` | In vigore | A completamento di un modulo che modifica il linguaggio ubiquo |
| `docs/06_security/` | `@fedcal` | In vigore | A completamento di un traguardo che modifica il modello di minaccia o le misure |
| `docs/07_integration/` | `@fedcal` | In vigore | A completamento di un traguardo che modifica il contratto verso i terzi |
| `docs/08_compliance/` | `@fedcal` | In vigore | A completamento di un traguardo che modifica il perimetro regolativo |
| `docs/09_roadmap/` | `@fedcal` | In vigore | A ogni variazione di traguardo, criterio, data o rischio |
| `docs/10_fondamenti/` | `@fedcal` | In vigore | A completamento di un modulo che modifica il linguaggio o il quadro di riferimento |
| `docs/adr/` | `@fedcal` | In vigore | A completamento di una decisione |

**Registri e catena dei controlli.**

| Artefatto | Revisore nominato | Stato | Quando si riesamina |
|---|---|---|---|
| [`registro/identificativi-requisiti.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/identificativi-requisiti.tsv) e [`registro/README.md`](https://github.com/fedcal/Telemedic/blob/main/registro/README.md) | `@fedcal` | In vigore | A ogni evento registrato. Il file è **in sola aggiunta**: nessuna riga esistente si modifica, nemmeno per correggere un errore di trascrizione |
| `scripts/`, `pipeline/`, `.github/workflows/` | `@fedcal` | In vigore | A ogni modifica di un controllo, della sua collocazione o del suo caso di prova. Sono elementi di configurazione prima che documenti: la regola che li governa è che un controllo senza un caso che lo veda fallire non è un controllo |

**Che cosa resta fuori, e perché.**

- Le questioni e le proposte di modifica in GitHub: tracciate, versionate e immutabili per
  costruzione. L'immutabilità **è** il controllo, e aggiungervene un altro non aggiungerebbe nulla.
- La documentazione interna di lavoro in `.telemedic/`: brief, bacheca inter-agenti, registri di
  sessione, ricerche. Non è pubblicata e non dichiara obblighi verso nessuno.
- [`CLAUDE.md`](https://github.com/fedcal/Telemedic/blob/main/CLAUDE.md): sono istruzioni operative per chi lavora nel repository. **La tensione va detta invece
  di essere risolta d'ufficio**: quel file enuncia le regole non negoziabili del progetto, che
  compaiono anche in [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), che è controllato. Una divergenza fra i due non sarebbe
  intercettata da nulla. È registrata al § 10, voce `h`.
- `.editorconfig`, `.gitignore` e la configurazione del sito: non dichiarano obblighi e non
  contengono affermazioni normative.

Un file `CHANGELOG.md` **non esiste** in questo repository, verificato alla data odierna. Il
capitolo 10 lo elenca fra i documenti non controllati: l'elenco è corretto nella sostanza e cita un
artefatto inesistente.

---

## 4. Regola di identificazione e di versione

Questa è la regola del capitolo 10, §§ 2 e 3, resa eseguibile. Non è una regola nuova.

**Identificazione.** Un documento controllato è identificato dal **percorso assoluto nel
repository**. Da qui discendono quattro obblighi operativi:

1. **Non esistono due documenti controllati con lo stesso percorso**, e il percorso non si riusa dopo
   un ritiro. Un percorso liberato da un ritiro resta liberato.
2. **Il gemello inglese porta percorso e nome identici** sotto
   `website/i18n/en/docusaurus-plugin-content-docs/current/`. Tradurre il nome del file produce una
   pagina orfana: il sito la pubblica sotto `/en/` mentre la pagina vera continua a mostrare
   l'italiano, e nessuno se ne accorge dal lato italiano perché un file che nessuno cerca non manca a
   nessuno. È già accaduto con tre file di `docs/09_roadmap/`.
3. **Una citazione di un documento controllato porta il percorso**, e porta anche l'impronta del
   commit quando serve a disambiguare una versione storica. Un rinvio che non ha né l'uno né l'altra
   è incompleto.
4. **La forma del rinvio non è indifferente.** Fra documenti della documentazione si usa la forma
   assoluta `](/area/file.md)`, che si risolve identica nelle due lingue; la forma relativa non si
   risolve nei file tradotti. Verso i file alla radice del repository si usa l'URL assoluto verso
   GitHub: un percorso relativo che esce da `docs/` funziona su GitHub e produce un 404 silenzioso
   sul sito pubblicato.

**Versione.** La versione di un documento è **l'impronta del commit** in cui è stato modificato per
l'ultima volta. Non esiste un numero di versione scritto dentro il documento, e non deve esistere:
sarebbe un secondo luogo dove la stessa informazione può divergere dal primo.

Da questa scelta discende ciò che va saputo prima di dire «qual è la versione approvata»:

- La cronologia è immutabile senza traccia: ogni modifica produce una nuova impronta.
- La data e l'autore di ogni modifica sono nel commit stesso, non in un campo che qualcuno aggiorna.
- Il messaggio di commit dichiara **tipo, ambito e descrizione** della modifica, ed è la risposta
  alla domanda «che cosa è entrato in questa versione». Non è alterabile dopo l'unione.
- Un rilascio distribuito porta un proprio numero di versione e **cita l'impronta del commit** cui
  corrisponde: è così che si risale dalla versione distribuita alla versione esatta di ogni documento
  che contiene.

**Identificativi dei documenti regolatori.** Gli spazi `MDR-*`, `QMS-*`, `SW-*`, `RM-*`, `UE-*`,
`CE-*`, `PMS-*`, `ON-*` sono dichiarati e congelati in
[08/03 § 5](/08_compliance/03-sistema-di-gestione-della-qualita.md) e valgono come vincolo [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172):
nessuna area vi conia un identificativo senza dichiararlo. Non si rinumerano e non si riusano dopo un
ritiro. Lo stesso vale per gli identificativi di requisito, congelati da [`V-120`](../11_registri/01-vincoli-in-vigore.md#v-120) e registrati in
[`registro/identificativi-requisiti.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/identificativi-requisiti.tsv).

---

## 5. Revisori nominati per categoria

**Il revisore nominato per ogni categoria è Federico Calò (`@fedcal`).** Non c'è un secondo nome da
scrivere, e scriverne uno sarebbe un'invenzione.

Questa frase merita di essere motivata invece che asserita, perché il criterio che la esige parla di
«revisori nominati» al plurale e perché il capitolo 10, al § 4, presenta una tabella la cui colonna
si intitola «Revisore nominato» e contiene **funzioni** - «Committente», «Autore dell'area»,
«Architetto del dominio», e per le decisioni architetturali un «Revisore tecnico designato nella
decisione», cioè un revisore ancora da designare. Una funzione non è una nomina: è la descrizione del
posto che un nome dovrebbe occupare. L'unico luogo del repository in cui i revisori sono nominativi è
[`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS), e ogni sua
riga assegna `@fedcal`, perché il progetto ha un solo manutentore
([`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), «Stato attuale»).

| Categoria | Revisore nominato | Riga di `CODEOWNERS` che lo assegna | Competenza richiesta |
|---|---|---|---|
| Dichiarazioni pubbliche e avvertenze | Federico Calò (`@fedcal`) | `/NOT-A-MEDICAL-DEVICE.md`, `/DISTRIBUTION-POLICY.md`, `/THIRD-PARTY-TERMINOLOGY.md`, `/publiccode.yml`, `/CONTRIBUTING.md`, `/CODE_OF_CONDUCT.md`, `/GOVERNANCE.md`; [`README.md`](https://github.com/fedcal/Telemedic/blob/main/README.md), [`SUPPORT.md`](https://github.com/fedcal/Telemedic/blob/main/SUPPORT.md), `LICENSE` e `NOTICE` per la riga di riserva `*` | Autorità sulla rappresentazione pubblica del progetto e sulle avvertenze regolative |
| Specifiche regolatorie | Federico Calò (`@fedcal`) | `/docs/08_compliance/` | Conoscenza della norma applicabile e capacità di mapparla sulla soluzione tecnica |
| Sicurezza | Federico Calò (`@fedcal`) | `/docs/06_security/`, `/SECURITY.md` | Modello di minaccia, identità, protezione dei dati, risposta agli incidenti |
| Requisiti e traguardi | Federico Calò (`@fedcal`) | `/docs/03_functional/`, `/docs/09_roadmap/` | Destinazione d'uso, perimetro funzionale, pianificazione e capacità dichiarata |
| Architettura, dominio e decisioni | Federico Calò (`@fedcal`) | `/docs/02_architecture/`, `/docs/05_domain/`, `/docs/adr/` | Architettura, contesti delimitati, linguaggio ubiquo |
| Protocolli e integrazione | Federico Calò (`@fedcal`) | `/docs/04_protocols/`, `/docs/07_integration/` | FHIR, documenti clinici, IHE, contratto verso i terzi |
| Tecnica, rilascio e catena dei controlli | Federico Calò (`@fedcal`) | `/docs/01_technical/`, `/pipeline/`, `/scripts/`, `/.github/workflows/` | Catena di costruzione, gestione della configurazione, prova dei controlli |
| Fondamenti | Federico Calò (`@fedcal`) | `/docs/10_fondamenti/` | Contesto sanitario, standard, quadro regolatorio |
| Sito di documentazione | Federico Calò (`@fedcal`) | `/website/` | Costruzione del sito, divergenza fra le lingue |
| Panoramica | Federico Calò (`@fedcal`) | Riga di riserva `*`; **`CODEOWNERS` non ha una riga propria per `/docs/00_overview/`** | Coerenza fra ciò che il progetto dichiara di essere e ciò che le altre aree descrivono |
| Questa procedura | Federico Calò (`@fedcal`) | `/docs/08_compliance/` | Le regole del presente documento |

**La conseguenza, dichiarata e non attenuata.** Che il revisore nominato coincida per ogni categoria
con l'unica persona che redige **è esattamente la lacuna** descritta in
[08/10 § 9](/08_compliance/10-controllo-dei-documenti.md), prima voce di [`Q-189`](../11_registri/02-questioni-aperte.md#q-189). Questa procedura
non la risolve e non pretende di risolverla: la rende **nominale invece che astratta**, perché un
revisore che ha un nome è un revisore di cui si può dire che cosa non poteva fare. Non è detto che la
redazione sia di bassa qualità; è detto che nessun terzo lo accerta.

**Il dossier di competenza non esiste.** La forma con cui ISO 13485 § 6.2 chiede di documentare la
competenza di un revisore è un dossier per ciascuno, e nel repository non c'è alcun file che lo
contenga. La competenza dichiarata nella colonna di destra è quindi **asserita da questo documento e
non provata da una registrazione**. La circostanza è già dichiarata in
[08/10 § 4](/08_compliance/10-controllo-dei-documenti.md) e vale come lacuna, non come conformità.

**Che cosa cambia all'ingresso di un secondo manutentore**, e va scritto ora perché è il momento in
cui una procedura scritta per un solo revisore diventa pericolosa: si aggiorna
[`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS), si aggiorna
questa tabella, si riconsidera `require_code_owner_reviews` secondo il § 6, e la regola di
[`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) che impone l'approvazione di un manutentore diverso dall'autore torna applicabile
**senza bisogno di alcuna nuova decisione**.

---

## 6. Forma dell'approvazione

L'approvazione di un documento controllato è una **revisione favorevole («Approved») su una proposta
di modifica**. Non esiste un modulo firmato, non esiste un registro di approvazione separato: la
registrazione è la storia di git e la sequenza di eventi in GitHub. Il ragionamento su perché questa
forma sia più forte di una firma su un modulo - immutabilità, granularità, tracciabilità,
distribuzione - è in [08/10 § 7](/08_compliance/10-controllo-dei-documenti.md) e non si ripete qui.

**Che cosa deve risultare, per ogni approvazione.** Sono cinque elementi, e chi verifica li cerca in
cinque posti diversi:

| Elemento | Dove si trova |
|---|---|
| Identità del revisore | Profilo GitHub di chi ha lasciato la revisione favorevole |
| Testo esatto approvato | Contenuto della proposta al momento dell'approvazione, ricostruibile dal commit citato |
| Data e ora | Marcatura temporale della revisione, assegnata dal server |
| Commit di unione | Impronta calcolata dal contenuto, immutabile e univoca |
| Dichiarazione di modifica | Messaggio di commit nel ramo principale, non alterabile dopo l'unione |

**Che cosa impone la macchina, e che cosa impone soltanto questa procedura.** La distinzione non è
una sfumatura: è la differenza fra un presidio e una buona intenzione, e va tenuta ferma ogni volta
che qualcuno chiede «e chi lo garantisce?».

- **La macchina impone una revisione favorevole** su ogni proposta prima dell'unione. La protezione
  del ramo `main` è attuata dal 26 agosto 2026, e senza quella revisione l'unione è bloccata per
  chiunque non sia amministratore del repository.
- **La macchina non impone che la revisione venga dal revisore nominato per la categoria.** La voce
  `require_code_owner_reviews` è deliberatamente a `false` - misurato il 26 agosto 2026 - e
  [`.github/CODEOWNERS`](https://github.com/fedcal/Telemedic/blob/main/.github/CODEOWNERS) ne dà la
  ragione: con un solo manutentore, portarla a `true` renderebbe ogni proposta impossibile da unire
  senza il bypass da amministratore, cioè renderebbe obbligatorio proprio l'atto che dovrebbe
  evitare. Un cancello impossibile non è un cancello: è un cancello che qualcuno aggirerà.
- **La macchina non si applica agli amministratori.** Il proprietario del repository può approvare
  sé stesso e unire il proprio lavoro. È dichiarato, non nascosto, ed è la forma tecnica della lacuna
  del § 10, voce `a`.
- **Questa procedura prescrive** che la revisione venga dal revisore nominato per la categoria del
  documento. Oggi la prescrizione è soddisfatta per costruzione, perché il revisore nominato è uno
  solo; domani, con due manutentori, sarà una prescrizione **affidata alla disciplina** finché
  `require_code_owner_reviews` non sarà riconsiderata, e un'approvazione data dalla persona sbagliata
  verrebbe accettata dal sistema senza alcuna segnalazione.

**La regola di [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), e perché oggi non è applicabile.**
[`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), «Come entrano le
modifiche», prescrive l'approvazione di **almeno un manutentore che non sia l'autore**. Sotto la
capacità dichiarata da `D54` quella regola non è rispettabile da nessuno: i manutentori sono uno, e
un insieme di uno non contiene un elemento diverso dall'autore. La regola **non è sospesa e non è
emendata**: è inapplicabile per una condizione di fatto, e torna vincolante nel momento esatto in cui
il secondo manutentore entra, senza che nessuno debba deliberare di nuovo. Fino a quel momento
l'approvazione che la procedura registra è quella dell'autore su sé stesso, dichiarata come tale.

**Forma del messaggio di commit.** Tipo (`feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`,
`ci`), ambito (quale area, quale documento), descrizione sintetica in italiano. Ogni commit porta il
`Signed-off-by` del *Developer Certificate of Origin*. Il messaggio è parte obbligatoria della
registrazione: è dove chi verifica trova la risposta alla domanda «che cosa è entrato».

---

## 7. Regola di ritiro

Un documento controllato si ritira - si porta a uno stato che lo esclude dagli atti attuali - per
tre ragioni, e per nessun'altra:

1. **Abrogazione.** Il documento esaurisce il proprio scopo, è sostituito da una versione nuova, o
   cade perché il requisito che lo giustificava è stato scartato.
2. **Errore normativo grave.** Il documento contiene un'affermazione che, verificata sul testo
   primario, risulta falsa. Si ritira, si corregge, si ripubblica come versione nuova.
3. **Esaurimento temporale.** Una bozza o un piano interno scade quando il traguardo cui era legato è
   chiuso.

**Come si esegue un ritiro.**

1. Si apre una proposta di modifica che **dichiara il ritiro nel messaggio di commit**, citando quale
   delle tre ragioni si applica.
2. La proposta riceve la revisione favorevole del revisore nominato per la categoria del documento
   ritirato, secondo il § 6.
3. Si porta a `Ritirato` la casella «Stato» della riga corrispondente nella tabella del § 3,
   aggiungendo la data e la ragione. **Se il documento non ha una riga in quella tabella, non è un
   documento controllato e questa procedura non lo governa**: prima lo si aggiunge, poi lo si ritira.
4. Si applica lo stesso ritiro al **gemello nell'altra lingua**, nella stessa proposta di modifica.
   Un ritiro compiuto in una lingua sola non è un ritiro: è una divergenza.
5. **Il file non si cancella dal sistema di versione.** Il ritiro è un cambio di stato, non una
   sparizione: un documento cancellato non è ritirabile a posteriori e la sua storia diventa
   irrecuperabile per chi la cercherà.

**Divieto di riuso.** Un identificativo di requisito o un percorso di documento ritirato **non si
riusa mai**. Se un lavoro successivo affronta lo stesso argomento, riceve un identificativo e un
percorso nuovi. La ragione è la sola che conta: chi consulta un rilascio vecchio e vede un
identificativo non deve poter essere tratto in inganno da una riassegnazione avvenuta dopo.

---

## 8. Questa procedura è sotto il proprio controllo

**È la clausola per cui questo documento esiste.** Il criterio 1 di `T-01` non chiede soltanto che
esista una procedura di controllo dei documenti: chiede che la procedura sia versionata nel
repository **ed essa stessa sotto controllo**. Un documento che prescrive un controllo e se ne
esclude non è una procedura: è un'opinione con un titolo autorevole, e la sua esclusione è il primo
posto da cui l'erosione comincia.

Che questo documento sia sotto il proprio controllo significa quattro cose, tutte verificabili senza
credere a questa frase:

1. **Compare nel proprio elenco.** La riga è al § 3, nella tabella «Questa procedura», con lo stesso
   formato di ogni altra riga e con lo stato corrente.
2. **Ha un revisore nominato.** È al § 5, ultima riga: Federico Calò (`@fedcal`), per la riga
   `/docs/08_compliance/` di `CODEOWNERS`. Lo stesso revisore, e la stessa lacuna, di ogni altro
   documento della categoria.
3. **La propria versione si legge con la regola del § 4**, cioè dall'impronta del commit, e non da un
   numero scritto dentro il testo.
4. **Si ritira con la regola del § 7.** Se un giorno una procedura migliore la sostituisce, questa
   non si cancella: si porta a `Ritirato` la sua riga al § 3, con la data e la ragione, in entrambe
   le lingue.

Va detto anche che cosa questa clausola **non** produce. Non produce indipendenza: chi approva questa
procedura è la stessa persona che l'ha proposta, e nessuna clausola di autoriferimento può creare un
secondo revisore. La lacuna resta intera ed è al § 10.

---

## 9. Esecuzione: la sequenza dei passi

Questa è la procedura da eseguire per modificare un documento controllato. Vale per chi non l'ha
scritta.

1. **Stabilire se il documento è controllato.** Si cerca nella tabella del § 3. Se non c'è, o è una
   modifica che questa procedura non governa, oppure il documento andava elencato e non lo era: nel
   secondo caso si aggiunge la riga **nella stessa proposta**, e la si fa approvare insieme alla
   modifica.
2. **Identificare il revisore nominato.** Si legge la categoria al § 5 e si verifica la riga
   corrispondente in `CODEOWNERS`. Se le due fonti divergono, **la divergenza si segnala prima di
   procedere**: è un difetto della nomina, non un dettaglio da aggirare scegliendo la fonte più
   comoda.
3. **Lavorare su un ramo dedicato, partendo da `main`.** Nessuno scrive direttamente sul ramo
   principale, proprietario compreso.
4. **Modificare le due lingue nello stesso atto.** Un documento controllato che esiste in inglese si
   modifica in entrambe le versioni nella stessa proposta. La struttura dei titoli di secondo livello
   deve restare la stessa nelle due lingue, e le àncore dei rinvii si ricavano dal titolo del
   documento bersaglio **nella lingua di quel documento**: un'àncora ricavata dal titolo italiano non
   esiste nella pagina inglese.
5. **Aprire la proposta di modifica** compilando il modello. Il messaggio di commit porta tipo,
   ambito, descrizione e `Signed-off-by`.
6. **Attendere i controlli automatici.** Sono bloccanti: se falliscono, la proposta non procede. Un
   controllo che fallisce a torto si corregge, non si aggira.
7. **Ottenere la revisione favorevole** del revisore nominato, secondo il § 6.
8. **Unire nel ramo principale.** La protezione del ramo impedisce l'unione senza almeno una
   revisione favorevole. Il documento entra in vigore all'unione, perché il sito e gli artefatti
   distribuiti sono generati dalla versione corrente di `main`.
9. **Se la modifica è un ritiro**, si esegue il § 7 invece di questo elenco dal passo 4 in avanti.

**Il ciclo accelerato.** Entro 48 ore dalla scoperta di un errore normativo grave, il revisore
nominato può approvare e unire la correzione senza attendere il ciclo ordinario, purché il commit sia
marcato `fix` e la ragione sia scritta nel messaggio. Non è un modo per aggirare il controllo: è il
modo per non lasciare in linea un'affermazione falsa in materia regolatoria. Presuppone che il
revisore sia disponibile, il che sotto `D54` non è garantito da nulla.

---

## 10. Lacune dichiarate

Questa procedura è eseguibile e incompleta, e le due cose non si escludono. Ciò che manca si elenca
qui invece di essere lasciato dedurre da un silenzio.

| | Lacuna | Stato |
|---|---|---|
| `a` | **Redattore e approvatore coincidono.** Sotto `D54` chi redige è chi approva, e il controllo che solo l'indipendenza garantisce non esiste. Non è risolvibile con più ore: serve una seconda persona. Il testo integrale è in [08/10 § 9](/08_compliance/10-controllo-dei-documenti.md) | Prima voce di [`Q-189`](../11_registri/02-questioni-aperte.md#q-189). **Lacuna dichiarata, non conformità** |
| `b` | **Il dossier di competenza dei revisori non esiste.** La competenza dichiarata al § 5 è asserita, non provata da una registrazione | Dichiarata in [08/10 § 4](/08_compliance/10-controllo-dei-documenti.md). Legata alla costituzione del soggetto fabbricante (`T-14`) |
| `c` | **Nessun identificativo `QMS-*` è assegnato a questa procedura.** Lo spazio è congelato da [`V-172`](../11_registri/01-vincoli-in-vigore.md#v-172), che impone di dichiarare in bacheca ogni identificativo coniato; coniarlo qui senza quella dichiarazione violerebbe il vincolo che questa procedura dovrebbe far rispettare. L'identificazione resta quindi il percorso assoluto, secondo il § 4 | Aperta. Da chiudere con la dichiarazione, non con l'assegnazione unilaterale |
| `d` | **La corrispondenza fra revisore effettivo e revisore nominato non è presidiata.** `require_code_owner_reviews` è a `false` per la ragione del § 6 | Dichiarata. Da riconsiderare all'ingresso del secondo manutentore, non prima |
| `e` | **La firma crittografica obbligatoria sul ramo non è attuata.** La configurazione locale è adottata dal 26 agosto 2026; l'obbligo sul ramo attende il caricamento della chiave pubblica. Il `Signed-off-by` resta obbligatorio e attivo | [`Q-284`](../11_registri/02-questioni-aperte.md#q-284), con innesco dichiarato e nessuna data |
| `f` | **Gli strumenti su cui poggia la registrazione di approvazione non sono stati validati formalmente.** Finché la validazione non esiste, i controlli sono asserzioni di funzionamento e non prove. **`[NV]`** - la validazione è prerequisito dei criteri 5 e 7 di `T-01` e di `T-03`, da compiere da `TECH` |  |
| `g` | **I documenti prodotti prima di questa procedura non sono stati riemessi sotto controllo.** Il volume da riemettere cresce ogni giorno | Lacuna dichiarata, non pianificata. È la ragione per cui `T-01` è il primo traguardo |
| `h` | **Nessun controllo automatico verifica che l'elenco del § 3 corrisponda ai file che esistono davvero.** Un documento aggiunto alla radice e non elencato qui resterebbe fuori controllo senza che nulla lo segnali; lo stesso vale per una divergenza fra [`CLAUDE.md`](https://github.com/fedcal/Telemedic/blob/main/CLAUDE.md) e [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md). Una tabella che asserisce un fatto sul repository va confrontata con il repository, e oggi il confronto è manuale | Debito dichiarato. È la lacuna più facile da chiudere e la più facile da dimenticare |
| `i` | **La procedura è approvata il 27 agosto 2026.** Lo stato è al § 1 e nella riga del § 3. La lacuna di cui alla voce `a` non è chiusa dall'approvazione | Approvazione registrata, lacuna dichiarata non attenuata |

---

## 11. Divergenze accertate e non risolte da questa procedura

Sono state trovate leggendo i documenti esistenti mentre questa procedura veniva scritta. Si
registrano qui perché chi le incontrerà sappia che sono note, e perché la scelta fra allineare il
corpus e emendare la regola non appartiene a chi redige.

1. **L'elenco del capitolo 10, § 1, è incompleto.** Fra le dichiarazioni pubbliche cita tre file su
   tredici: mancano [`README.md`](https://github.com/fedcal/Telemedic/blob/main/README.md), [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md), [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md), [`SUPPORT.md`](https://github.com/fedcal/Telemedic/blob/main/SUPPORT.md),
   [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), [`CODE_OF_CONDUCT.md`](https://github.com/fedcal/Telemedic/blob/main/CODE_OF_CONDUCT.md), [`publiccode.yml`](https://github.com/fedcal/Telemedic/blob/main/publiccode.yml), `LICENSE`, `NOTICE` e
   `.github/CODEOWNERS`. Il § 3 di questa procedura li elenca tutti. La divergenza è **sanata
   nell'elenco operativo e non nel capitolo**, che resta come è.
2. **Tre aree della documentazione non compaiono nell'elenco del capitolo 10**: `docs/00_overview/`,
   `docs/06_security/` e `docs/07_integration/`. Le ultime due hanno una riga propria in `CODEOWNERS`
   e sono aree di cui il progetto esige la traduzione integrale: non erano fuori perimetro, erano
   omesse.
3. **Le versioni inglesi non compaiono nell'elenco del capitolo 10.** Un documento controllato che
   esiste in due lingue è controllato in due lingue; il capitolo elenca solo i percorsi italiani.
4. **`CODEOWNERS` non ha una riga per `/docs/00_overview/`**, che ricade quindi sulla riga di riserva
   `*`. Non è un difetto grave finché il proprietario è uno solo; lo diventa quando i proprietari
   sono due.
5. **La colonna «Revisore nominato» del capitolo 10, § 4, contiene funzioni e non nomi**, e una delle
   sue righe rinvia a un revisore ancora da designare. Il § 5 di questa procedura sostituisce quelle
   funzioni con l'unico nome che il repository conosce.
6. **Il capitolo 10, § 2 punto 4, postula un registro dello stato dei documenti che non esisteva.**
   `registro/` contiene soltanto il registro degli identificativi di requisito. La tabella del § 3 di
   questa procedura è quel registro, ed è la ragione per cui porta una colonna «Stato».
7. **[`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) prescrive una regola che sotto `D54` nessuno può rispettare.** Trattata al § 6.
8. **Il capitolo 10 elenca `CHANGELOG.md` fra i documenti non controllati, e quel file non esiste.**
9. **[`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174) e il criterio 1 di `T-01` si toccano.** Il vincolo dice che questa documentazione non è
   un documento controllato; il criterio esige una procedura che lo sia. La composizione è al § 2:
   [`V-174`](../11_registri/01-vincoli-in-vigore.md#v-174) vale per i **capitoli**, che restano divulgativi; questa procedura non è un capitolo. La
   composizione è dichiarata, non nascosta in una riformulazione.

---

## 12. Riesame di questa procedura

Questa procedura si riesamina in quattro occasioni, e in nessuna di esse il riesame è facoltativo:

1. **Quando cambia l'insieme dei documenti controllati.** Un file nuovo alla radice, un'area nuova
   nella documentazione, un registro nuovo: la riga si aggiunge qui, nella stessa proposta di
   modifica che introduce l'artefatto.
2. **Quando cambia l'insieme dei manutentori.** È il riesame più importante, perché è il momento in
   cui una procedura scritta per un revisore unico smette di essere adeguata: si aggiornano il § 5,
   `CODEOWNERS`, la voce `require_code_owner_reviews` e le lacune `a` e `d` del § 10.
3. **Quando una lacuna del § 10 si chiude.** Si toglie la riga e si dichiara con che cosa è stata
   chiusa. Una lacuna che sparisce senza che nulla dica come sia stata chiusa è un difetto peggiore
   della lacuna.
4. **Ogni sei mesi in ogni caso**, insieme al riesame degli accessi e delle deleghe di controllo del
   ramo principale, che [08/10 § 10](/08_compliance/10-controllo-dei-documenti.md) prescrive con la
   stessa cadenza. È il punto in cui un ampliamento informale della capacità rischia di diventare
   permanente senza che nessuno lo abbia deciso.

Ogni riesame è una proposta di modifica a questo file e segue il § 9, compreso il passo che impone di
toccare le due lingue nello stesso atto.
