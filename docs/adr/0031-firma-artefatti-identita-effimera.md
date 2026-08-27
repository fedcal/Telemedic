---
title: "ADR-0031 - Firma degli artefatti con identità effimera della pipeline"
sidebar_position: 31
description: Perché gli artefatti sono firmati con una chiave derivata dall'identità dell'esecuzione di GitHub Actions invece che da una chiave custodita, quali alternative erano disponibili e quale costo si accetta.
---

# ADR-0031 - Firma degli artefatti con identità effimera della pipeline

**Stato**: accettata · **Data**: 26 agosto 2026 · **Area**: TECH
**Vincoli di riferimento**: D54, [Q-287](../11_registri/02-questioni-aperte.md#q-287) di bacheca, criteri 7-8 di T-03

## Contesto

La norma D17 sulla tracciabilità e la norma D18 sulla revisione indipendente richiedono che ogni
artefatto distribuibile porti una firma digitale e un'attestazione di provenienza verificabile:
quale sorgente, quale revisione, quale catena di costruzione, quale esecutore, quali parametri di
ingresso. È ciò che consente a un integratore di rispondere alla domanda «da dove viene questo
artefatto» senza fidarsi di un'affermazione.

La firma richiede una chiave privata. Il luogo e la custodia di quella chiave determinano la forma
della verifica e il costo ricorrente di protezione, rotazione e revoca.

## Alternative valutate

### Alternativa 1 - Firma con chiave persistente in custodia dichiarata

Una chiave privata viene generata una sola volta, custodita in un servizio di gestione chiavi
esterno al repository (servizio di vault aziendale, HSM, o AWS KMS) e importata nella pipeline di
costruzione su richiesta. L'esecuzione della firma è tracciata nel registro di accesso del servizio
di custodia.

*Vantaggi*:
- La forma della verifica rimane identica nel tempo anche se il servizio di hosting della pipeline
  cambia.
- La firma è verificabile offline, confrontando la chiave pubblica custodita nel repository.
- Non dipende da un servizio esterno di trasparenza per la verifica.

*Compromessi accertati*:
- **Onere ricorrente di protezione.** Una chiave privata in custodia richiede protezione fisica e
  crittografica, rotazione periodica, revoca in caso di compromissione, continuità di custodia fra
  contributori e fra ricambi di infrastruttura. È un onere permanente e non circoscritto. Under
  D54 - una persona a tempo parziale - **non è sostenibile**.
- **Onere di rotazione.** Se la chiave è compromessa, la firma di tutti gli artefatti precedenti
  perde validità, perché il verificatore non sa distinguere fra artefatti firmati legittimamente e
  artefatti falsificati con la stessa chiave. La rotazione di una chiave di firma ha un costo
  legale e reputazionale.
- **Fallimento a cascata.** Se il servizio di custodia è irraggiungibile, la pipeline non può
  costruire. Sotto D54 questa dipendenza dall'infrastruttura di terze parti introduce un rischio di
  fermo non controllabile.

### Alternativa 2 - Firma con identità effimera della pipeline

Una coppia di chiavi viene generata al volo nel corso dell'esecuzione della pipeline, la firma
viene prodotta, la chiave privata è scartata e non è mai salvata, e la firma viene attestata in un
registro di trasparenza pubblico (Rekor, parte di Sigstore). La verifica successiva, a cura di chi
installa, legge l'attestazione dal registro pubblico e la confronta con l'artefatto.

Tecnicamente: **OIDC + Sigstore/cosign**. GitHub Actions emette un token OIDC che identifica
l'esecuzione (job ID, repository, ramo, revisione del codice, timestamp); `cosign` usa quel token
per ottenere una coppia di chiavi dai servizi pubblici di Sigstore (Fulcio); la firma viene
registrata in Rekor; dopo la firma, la chiave privata non esiste più.

*Vantaggi*:
- **Nessuna custodia di chiave.** Non esiste una chiave privata da proteggere, ruotare o revoke.
  L'onere ricorrente di custodia è spostato al servizio di Sigstore (terze parti).
- **Traccia di provenienza precisa.** Il token OIDC identifica univocamente l'esecuzione: quale
  repository, quale ramo, quale revisione, quale istante, quale job. È impossibile falsificare una
  firma dicendo che viene da una versione diversa del codice.
- **Nessuna dipendenza critica dalla pipeline.** Se il servizio di custodia esterno è
  irraggiungibile, non accade nulla: la pipeline non firma, ma continua a costruire. La firma è
  uno step opzionale, non un prerequisito.
- **Forma della firma standardizzata.** Sigstore/cosign è lo standard di fatto per le pipeline di
  terze parti, usato da Google, Red Hat, GitHub, CNCF. La firma generata è verificabile con gli
  strumenti standard.

*Compromessi accettati*:
- **Verificabilità legata a un registro esterno.** Chi installa non verifica la firma offline. La
  verifica richiede accesso a Internet e al registro di trasparenza di Rekor (un servizio pubblico
  e gratuito di Sigstore, parte della Linux Foundation). Se Rekor è irraggiungibile, la verifica
  è impossibile. Per un dispositivo medico l'orizzonte di conservazione è lungo - anni dopo
  l'ultimo esemplare immesso sul mercato - e questo registra un rischio: **che cosa accade se il
  servizio di Rekor non è raggiungibile al momento della verifica?** La procedura di verifica a
  cura di chi installa (criterio 8 di T-03) deve dichiarare la risposta, ed è un debito che va
  estinto quando il fabbricante è costituito.
- **Verificabilità legata a una piattaforma di terze parti.** Se il progetto migra a una pipeline
  diversa da GitHub Actions, la forma della firma cambia. Le firme storiche rimangono valide
  (Rekor le conserva), ma i nuovi artefatti non potranno essere firmati con lo stesso meccanismo.
  È una dipendenza nota e controllabile: una migrazione di pipeline è un evento raro e pianificato.

## Decisione

Firma con **identità effimera della pipeline, usando OIDC + Sigstore/cosign**. Nessuna chiave
privata è custodita nel progetto o in alcun servizio controllato dal progetto.

La ragione decisiva è **D54**: la custodia di una chiave privata è un onere ricorrente, e la
capacità dichiarata del progetto è un contributore unico a tempo parziale. Un onere ricorrente che
nessuno ha il tempo di esercitare non è una misura di sicurezza: è una chiave abbandonata, peggio
di nessuna chiave.

## Conseguenze

### Come si firma

1. A ogni esecuzione della pipeline (su ogni push a `main` o su richiesta esplicita), gli step di
   firma invocano `cosign sign-blob` con il token OIDC di GitHub.
2. `cosign` contatta Fulcio (parte di Sigstore), verifica il token OIDC, genera una coppia di
   chiavi, la scarta dopo la firma, e registra l'attestazione in Rekor.
3. L'attestazione è salvata come file accanto all'artefatto firmato.

### Come si verifica

Chi installa scarica l'artefatto e l'attestazione, e esegue `cosign verify-blob` con la chiave
pubblica di Fulcio. `cosign` contatta Rekor e verifica che l'attestazione sia nel registro e che
corrisponda all'artefatto.

**Requisito di rete**: la verifica richiede accesso a Internet e a Rekor. Se la rete non è
disponibile al momento della verifica, è impossibile verificare. La procedura di verifica deve
dichiarare che cosa fare in questo caso.

### Quando il registro di trasparenza non è raggiungibile

Questo è il compromesso documentato. Il §7.3 di [`docs/01_technical/09-integrazione-continua-e-rilascio.md`](../01_technical/09-integrazione-continua-e-rilascio.md)
deve dichiarare una procedura fallback - tipicamente, il confronto offline della firma con la chiave
pubblica di Fulcio conservata localmente, che è possibile ma richiede una preparazione anticipata.

Quando il soggetto fabbricante sarà costituito (D63), il vincolo sul conservazione sarà
riesaminato: un'organizzazione costituita ha accesso a servizi di custodia di chiavi e a risorse
per la loro protezione, cambiando il calcolo economico della custodia rispetto a una fase di
prototipazione con risorse limitate.

### Attestazioni di provenienza

Oltre alla firma, ogni artefatto porta un'attestazione di provenienza in formato SLSA (Supply
chain Levels for Software Artifacts):
- Sorgente: URL del repository
- Revisione: hash della commit, ramo
- Definizione della pipeline: percorso e versione del workflow
- Esecutore: GitHub Actions + ID dell'esecuzione
- Parametri di ingresso: ramo, tag, trigger

L'attestazione è generata automaticamente da `cosign attest` e conservata come artefatto.

### Estensibilità

Quando il progetto produrrà altri artefatti (immagini di contenitori, pacchetti, chart Helm),
il medesimo meccanismo si applica: il workflow di rilascio invoca `cosign sign-blob` per ogni
artefatto dell'elenco che sarà allora dichiarato in `pipeline/artefatti.tsv`, file che oggi non esiste.

---
