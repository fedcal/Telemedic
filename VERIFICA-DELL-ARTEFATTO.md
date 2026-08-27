*[English version below](#verifying-artifacts---procedure-for-installers)*

# Verifica degli artefatti - Procedura per chi installa

**Data di ultimo aggiornamento**: 26 agosto 2026 · **Stato**: gli artefatti sono oggi il solo sito di documentazione; quando usciranno altri artefatti (servizio, interfaccia, immagini), i comandi di verifica resteranno identici.

Questa procedura consente a chi installa Telemedic di verificare che un artefatto distribuito non è stato alterato e proviene effettivamente dalla catena di costruzione dichiarata. La verifica è possibile da chiunque abbia accesso ai comandi standard e a Internet.

---

## Requisiti

- **`cosign`** (cli di Sigstore): scaricabile da https://github.com/sigstore/cosign/releases
- **Accesso a Internet**: per consultare il registro di trasparenza di Rekor (https://rekor.sigstore.dev)
- **L'artefatto scaricato** e il suo file di attestazione di provenienza
- **Accesso alla distinta dei materiali** (inclusa con l'artefatto nel medesimo percorso)

---

## 1. Preparazione

Scaricare l'artefatto dalla distribuzione ufficiale. Ogni artefatto è accompagnato da tre file, e
**servono tutti e tre**:

| File | Che cos'è | Perché serve |
|---|---|---|
| `<nome>.tar.gz` | **L'archivio che è stato firmato** | La firma è su questi byte esatti. Non è la cartella: ricomprimerla da sé produce byte diversi e la verifica fallisce, senza che nulla sia stato alterato |
| `<nome>.sig` | La firma, registrata nel registro di trasparenza pubblico | È ciò che si confronta con l'archivio |
| `<nome>.crt` | **Il certificato effimero** emesso al momento della firma | La firma keyless non ha una chiave pubblica da distribuire: l'identità che ha firmato vive qui, e senza questo file la verifica non è possibile - non «meno robusta»: **impossibile** |
| `<nome>.att` | L'attestazione di provenienza in formato SLSA | Dice da quale sorgente, revisione ed esecuzione l'archivio proviene |

A questi si aggiunge la **distinta dei materiali** `sbom-website.json`, pubblicata dalla stessa
esecuzione, che elenca i componenti di terze parti con licenze e impronte.

**Perché l'archivio si scarica invece di ricostruirlo.** Il sito costruito è una cartella di
migliaia di file, e una firma si appone su una sequenza di byte, non su un albero di directory. La
catena comprime quindi la cartella in un archivio **deterministico** - ordine dei nomi fissato, tempi
e proprietari azzerati, compressione senza nome né istante nell'intestazione - e firma quello. Il
determinismo serve a chi vuole ricostruire l'archivio dal contenuto e ottenere la stessa impronta;
non serve, e non è richiesto, per verificare la firma: per quello basta scaricare l'archivio
pubblicato.

**Dove si trovano, oggi.** Gli artefatti sono pubblicati dalla corsia di rilascio come artefatti di
esecuzione di GitHub Actions, con conservazione di novanta giorni. Con la riga di comando `gh`:

```bash
# l'ultima esecuzione riuscita della corsia di rilascio
gh run list --repo fedcal/Telemedic --workflow=fascia-di-rilascio.yml --status=success --limit 1

# gli artefatti firmati e la distinta di quell'esecuzione
gh run download <ID-ESECUZIONE> --repo fedcal/Telemedic --name artefatti-firmati
gh run download <ID-ESECUZIONE> --repo fedcal/Telemedic --name distinta-dei-materiali-rilascio
```

Si ottengono `build.tar.gz`, `build.sig`, `build.crt`, `build.att` per il sito italiano, i quattro
corrispondenti `en.tar.gz`, `build-en.sig`, `build-en.crt`, `build-en.att` per quello inglese, e
`sbom-website.json`.

**Che cosa questo non è.** Non è ancora una distribuzione con versioni: non esiste un rilascio
etichettato, e gli artefatti di esecuzione scadono. Quando esisterà una distribuzione con etichetta
di versione, **i comandi di verifica di questo documento resteranno identici** - cambierà soltanto il
modo di procurarsi i file.

---

## 2. Verificare la firma dell'artefatto

La firma attesta che l'artefatto non è stato alterato dopo la costruzione. Eseguire:

```bash
cosign verify-blob \
  --certificate build.crt \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature build.sig \
  build.tar.gz
```

**Spiegazione dei parametri**:
- `--certificate-identity-regexp`: il repository GitHub da cui deve provenire la firma
- `--certificate-oidc-issuer`: l'autorità di emissione del token OIDC (sempre GitHub Actions)
- `--certificate`: **il certificato effimero**. Ometterlo non produce un avviso ma un errore -
  «provide a key with `--key` or `--sk`, a certificate to verify against with `--certificate`, or a
  bundle» - perché senza di esso `cosign` non sa contro quale identità confrontare la firma
- `--signature`: il file di firma
- L'ultimo parametro è **l'archivio scaricato**, non la cartella che se ne estrae

**Esito atteso**: nessun errore, e un messaggio che conferma la verifica. Se la firma non corrisponde, `cosign` esce con codice diverso da zero e stampa un errore.

**Se il comando fallisce**: l'artefatto è stato alterato dopo la firma oppure la firma è corrotta. Non usare l'artefatto.

---

## 3. Verificare la provenienza da Rekor

La firma è registrata nel registro pubblico di trasparenza di Rekor. Eseguire:

```bash
cosign verify-blob \
  --certificate build.crt \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature build.sig \
  --offline \
  build.tar.gz
```

Nel caso di falllimento con errore **offline mode**, il registro di Rekor non è raggiungibile. Saltare al §5.

L'output di un'esecuzione riuscita include:
- **Il ramo e la revisione** da cui proviene l'artefatto
- **L'istante di costruzione**
- **L'ID dell'esecuzione** della pipeline che l'ha generato

Documentare questi dettagli nel rapporto di installazione, insieme alla data della verifica.

---

## 4. Controllare il contenuto della distinta

La distinta è il registro dei componenti di terze parti inclusi nell'artefatto, con licenze e impronte.
L'integratore è responsabile di verificare che tutte le licenze siano compatibili con la sua catena di
fornitura.

```bash
cat sbom.json | jq '.components[] | "\(.name)@\(.version) - \(.licenses[0].license.name)"'
```

Almeno un componente deve avere una licenza dichiarata, e nessun componente deve risultare con
licenza sconosciuta (campo `unknown`). Per la distinta stessa non è richiesta una firma separata:
è part dell'artefatto costruito e la sua integrità è garantita dalla verifica della firma
dell'artefatto.

---

## 5. Se il registro di Rekor non è raggiungibile

Questo caso accade quando:
- La rete non è disponibile al momento della verifica.
- Il servizio di Rekor è irraggiungibile (raro, è gestito da CNCF con SLA).
- L'integratore vuole verificare offline, senza dipendenze di rete.

### Procedura fallback: verifica offline con la chiave pubblica

Conservare in anticipo la chiave pubblica di Fulcio (il servizio di Sigstore che emette i certificati).
La chiave è disponibile da:

```bash
curl https://fulcio.sigstore.dev/api/v1/rootCA
```

Salvarla in un file e usarla per verificare offline:

```bash
cosign verify-blob \
  --certificate build.crt \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature build.sig \
  --offline \
  --public-key ./fulcio-root.crt \
  build.tar.gz
```

**Limitazione nota**: la verifica offline non consulta Rekor, quindi non accerta quale revisione
esatta del codice ha prodotto l'artefatto - accerta solo che la firma è valida. La provenienza non
è verificabile offline, ma l'integrità sì.

### Procedura fallback se il certificato non è disponibile

Se nemmeno il certificato di Fulcio è raggiungibile, la verifica è impossibile. In questo caso:

1. **Contattare il fabbricante** (quando sarà costituito) per ottenere il certificato offline.
2. **Documentare il fallimento** nel rapporto di installazione: data, tentativo, motivo dell'errore,
   e decisione presa (es. «installazione rinviata fino a disponibilità di rete», oppure «accettato
   rischio di non verificabilità»).
3. **Non procedere all'istallazione su pazienti reali** finché la verificabilità non è stata
   accertata.

---

## 6. Rapporto di installazione

Documentare il risultato di questa procedura in un rapporto che includa:

| Elemento | Valore |
|---|---|
| Artefatto | Nome, versione, hash dell'artefatto scaricato |
| Data di verifica | Quando è stata eseguita questa procedura |
| Esito firma | `✓ Verificato` oppure `✗ Fallito - [motivo]` |
| Provenienza | Ramo, revisione, istante di costruzione (se verificabili) |
| Licenze | Numero di componenti, numero di componenti con licenza non compatibile |
| Risultato | `✓ Artefatto idoneo per l'installazione` oppure `✗ Artefatto rifiutato` |
| Note | Eventuali fallback o limitazioni riscontrate |

Questo rapporto è conservato come parte della documentazione di installazione ed è allegato
a qualunque rapporto di ispezione successivo.

---

## 7. Risoluzione dei problemi

| Errore | Causa probabile | Soluzione |
|---|---|---|
| `error: failed to verify signature` | L'artefatto è stato alterato oppure la firma è corrotta | Scaricare di nuovo l'artefatto dalla fonte ufficiale |
| `error: no certificate found in Rekor` | Rekor non contiene la firma (costruzione eseguita offline o errore) | Verificare che il flusso di rilascio abbia eseguito correttamente |
| `Connection timeout` | Rekor non è raggiungibile | Verificare la connessione di rete oppure aspettare |
| `offline mode: certificate not provided` | La verifica offline richiede il certificato pubblico | Fornire il certificato con `--public-key` |

---

**Nota**: Questa procedura fa riferimento agli strumenti e ai servizi disponibili a partire da agosto 2026.
Se cambiasse la piattaforma di hosting della pipeline (oggi GitHub Actions), la procedura sarà aggiornata.
I vecchi artefatti rimangono verificabili tramite Rekor, che conserva il registro delle firme per
sempre.

---

# Verifying Artifacts - Procedure for Installers

*[Versione italiana sopra](#verifica-degli-artefatti---procedura-per-chi-installa)*

**Last updated**: August 26, 2026 · **Status**: artifacts today are only the documentation site; when other artifacts arrive (service, interface, images), the verification commands will remain identical.

This procedure allows anyone installing Telemedic to verify that a distributed artifact has not been altered and actually comes from the declared build pipeline. Verification is possible for anyone with access to standard commands and Internet.

---

## Requirements

- **`cosign`** (Sigstore CLI): downloadable from https://github.com/sigstore/cosign/releases
- **Internet access**: to consult the Rekor transparency registry (https://rekor.sigstore.dev)
- **The downloaded artifact** and its provenance attestation file
- **Access to the Software Bill of Materials** (included with the artifact in the same location)

---

## 1. Preparation

Download the artifact from the official distribution. Every artifact comes with four files, and
**all four are needed**:

| File | What it is | Why it is needed |
|---|---|---|
| `<name>.tar.gz` | **The archive that was signed** | The signature is over these exact bytes. It is not the directory: recompressing it yourself yields different bytes and verification fails, with nothing having been altered |
| `<name>.sig` | The signature, recorded in the public transparency log | This is what is compared against the archive |
| `<name>.crt` | **The ephemeral certificate** issued at signing time | Keyless signing has no public key to distribute: the signing identity lives here, and without this file verification is not possible - not «weaker»: **impossible** |
| `<name>.att` | The provenance attestation in SLSA format | It states the source, revision and run the archive comes from |

Alongside these, the same run publishes the **Software Bill of Materials** `sbom-website.json`,
listing third-party components with licences and digests.

**Why the archive is downloaded rather than rebuilt.** The built site is a directory of thousands of
files, and a signature is applied to a byte sequence, not to a directory tree. The chain therefore
compresses the directory into a **deterministic** archive - fixed name ordering, zeroed times and
owners, compression carrying neither name nor timestamp in its header - and signs that. Determinism
serves whoever wants to rebuild the archive from its contents and obtain the same digest; it is
neither needed nor required to verify the signature, for which downloading the published archive is
enough.

**Where they are today.** Artifacts are published by the release lane as GitHub Actions run
artifacts, retained for ninety days. With the `gh` command line:

```bash
# the latest successful run of the release lane
gh run list --repo fedcal/Telemedic --workflow=fascia-di-rilascio.yml --status=success --limit 1

# the signed artifacts and the bill of materials of that run
gh run download <RUN-ID> --repo fedcal/Telemedic --name artefatti-firmati
gh run download <RUN-ID> --repo fedcal/Telemedic --name distinta-dei-materiali-rilascio
```

You obtain `build.tar.gz`, `build.sig`, `build.crt`, `build.att` for the Italian site, the four
matching `en.tar.gz`, `build-en.sig`, `build-en.crt`, `build-en.att` for the English one, and
`sbom-website.json`.

**What this is not.** It is not yet a versioned distribution: there is no tagged release, and run
artifacts expire. When a tagged distribution exists, **the verification commands in this document
will stay identical** - only the way of obtaining the files will change.

---

## 2. Verify the Artifact Signature

The signature attests that the artifact has not been altered since construction. Run:

```bash
cosign verify-blob \
  --certificate build.crt \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature build.sig \
  build.tar.gz
```

**Parameter explanation**:
- `--certificate-identity-regexp`: the GitHub repository from which the signature must originate
- `--certificate-oidc-issuer`: the OIDC token issuer (always GitHub Actions)
- `--certificate`: **the ephemeral certificate**. Omitting it produces not a warning but an error -
  «provide a key with `--key` or `--sk`, a certificate to verify against with `--certificate`, or a
  bundle» - because without it `cosign` has no identity to check the signature against
- `--signature`: the signature file
- The last parameter is the artifact to verify

**Expected outcome**: no error, and a message confirming verification. If the signature does not match, `cosign` exits with a non-zero code and prints an error.

**If the command fails**: the artifact was altered after signing, or the signature is corrupted. Do not use the artifact.

---

## 3. Verify Provenance from Rekor

The signature is registered in Rekor's public transparency registry. Run:

```bash
cosign verify-blob \
  --certificate build.crt \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature build.sig \
  --offline \
  build.tar.gz
```

If the command fails with **offline mode** error, Rekor is not reachable. Skip to §5.

Output from a successful execution includes:
- **The branch and revision** from which the artifact originates
- **The build timestamp**
- **The pipeline execution ID**

Document these details in the installation report, along with the verification date.

---

## 4. Check the Bill of Materials Content

The BOM is the registry of third-party components included in the artifact, with licenses and digests.
The integrator is responsible for verifying that all licenses are compatible with their supply chain.

```bash
cat sbom.json | jq '.components[] | "\(.name)@\(.version) - \(.licenses[0].license.name)"'
```

At least one component must have a license declared, and no component should be listed as `unknown`. 
The BOM itself does not require a separate signature: it is part of the constructed artifact, and its 
integrity is guaranteed by verifying the artifact signature.

---

## 5. If Rekor Registry is Not Reachable

This occurs when:
- Network is unavailable at verification time
- Rekor service is unreachable (rare; managed by CNCF with SLA)
- The installer wants to verify offline, without network dependencies

### Fallback procedure: offline verification with public key

Preserve in advance the Fulcio public key (the Sigstore service that issues certificates).
The key is available from:

```bash
curl https://fulcio.sigstore.dev/api/v1/rootCA
```

Save it to a file and use it for offline verification:

```bash
cosign verify-blob \
  --certificate build.crt \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature build.sig \
  --offline \
  --public-key ./fulcio-root.crt \
  build.tar.gz
```

**Known limitation**: offline verification does not consult Rekor, so it does not verify which exact 
code revision produced the artifact - it only verifies that the signature is valid. Provenance is not 
verifiable offline, but integrity is.

### Fallback procedure if certificate is unavailable

If even the Fulcio certificate is not reachable, verification is impossible. In this case:

1. **Contact the vendor** (once constituted) to obtain the certificate offline.
2. **Document the failure** in the installation report: date, attempt, error reason, and decision 
   taken (e.g., "installation deferred until network availability", or "risk of non-verifiability accepted").
3. **Do not proceed with installation on real patients** until verifiability has been confirmed.

---

## 6. Installation Report

Document the result of this procedure in a report that includes:

| Element | Value |
|---|---|
| Artifact | Name, version, hash of downloaded artifact |
| Verification date | When this procedure was executed |
| Signature outcome | `✓ Verified` or `✗ Failed - [reason]` |
| Provenance | Branch, revision, build timestamp (if verifiable) |
| Licenses | Number of components, number with incompatible license |
| Result | `✓ Artifact suitable for installation` or `✗ Artifact rejected` |
| Notes | Any fallback procedures or limitations encountered |

This report is retained as part of the installation documentation and attached to any 
inspection report that follows.

---

## 7. Troubleshooting

| Error | Probable cause | Solution |
|---|---|---|
| `error: failed to verify signature` | Artifact was altered or signature is corrupted | Download artifact again from official source |
| `error: no certificate found in Rekor` | Rekor does not contain the signature (offline build or error) | Verify that release workflow executed successfully |
| `Connection timeout` | Rekor is unreachable | Verify network connection or wait |
| `offline mode: certificate not provided` | Offline verification requires public certificate | Provide certificate with `--public-key` |

---

**Note**: This procedure refers to tools and services available as of August 2026.
If the pipeline hosting platform changes (currently GitHub Actions), this procedure will be updated.
Old artifacts remain verifiable through Rekor, which preserves the signature registry forever.
