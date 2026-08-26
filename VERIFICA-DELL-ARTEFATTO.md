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

Scaricare l'artefatto dalla distribuzione ufficiale. L'artefatto è accompagnato da:
- **`sbom.json`** - la distinta dei materiali (Software Bill of Materials) in formato CycloneDX
- **`.sig`** - la firma dell'artefatto, registrata in Rekor
- **`.att`** - l'attestazione di provenienza in formato SLSA

Esempio per il sito di documentazione (quando sarà distribuito):
```bash
wget https://releases.example.com/telemedic-website-v1.0.0/index.html
wget https://releases.example.com/telemedic-website-v1.0.0/index.html.sig
wget https://releases.example.com/telemedic-website-v1.0.0/sbom.json
wget https://releases.example.com/telemedic-website-v1.0.0/sbom.json.att
```

---

## 2. Verificare la firma dell'artefatto

La firma attesta che l'artefatto non è stato alterato dopo la costruzione. Eseguire:

```bash
cosign verify-blob \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature index.html.sig \
  index.html
```

**Spiegazione dei parametri**:
- `--certificate-identity-regexp`: il repository GitHub da cui deve provenire la firma
- `--certificate-oidc-issuer`: l'autorità di emissione del token OIDC (sempre GitHub Actions)
- `--signature`: il file di firma
- L'ultimo parametro è l'artefatto da verificare

**Esito atteso**: nessun errore, e un messaggio che conferma la verifica. Se la firma non corrisponde, `cosign` esce con codice diverso da zero e stampa un errore.

**Se il comando fallisce**: l'artefatto è stato alterato dopo la firma oppure la firma è corrotta. Non usare l'artefatto.

---

## 3. Verificare la provenienza da Rekor

La firma è registrata nel registro pubblico di trasparenza di Rekor. Eseguire:

```bash
cosign verify-blob \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature index.html.sig \
  --offline \
  index.html
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
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature index.html.sig \
  --offline \
  --public-key ./fulcio-root.crt \
  index.html
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

Download the artifact from the official distribution. The artifact is accompanied by:
- **`sbom.json`** - Software Bill of Materials in CycloneDX format
- **`.sig`** - the artifact signature, registered in Rekor
- **`.att`** - the provenance attestation in SLSA format

Example for the documentation site (when distributed):
```bash
wget https://releases.example.com/telemedic-website-v1.0.0/index.html
wget https://releases.example.com/telemedic-website-v1.0.0/index.html.sig
wget https://releases.example.com/telemedic-website-v1.0.0/sbom.json
wget https://releases.example.com/telemedic-website-v1.0.0/sbom.json.att
```

---

## 2. Verify the Artifact Signature

The signature attests that the artifact has not been altered since construction. Run:

```bash
cosign verify-blob \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature index.html.sig \
  index.html
```

**Parameter explanation**:
- `--certificate-identity-regexp`: the GitHub repository from which the signature must originate
- `--certificate-oidc-issuer`: the OIDC token issuer (always GitHub Actions)
- `--signature`: the signature file
- The last parameter is the artifact to verify

**Expected outcome**: no error, and a message confirming verification. If the signature does not match, `cosign` exits with a non-zero code and prints an error.

**If the command fails**: the artifact was altered after signing, or the signature is corrupted. Do not use the artifact.

---

## 3. Verify Provenance from Rekor

The signature is registered in Rekor's public transparency registry. Run:

```bash
cosign verify-blob \
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature index.html.sig \
  --offline \
  index.html
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
  --certificate-identity-regexp "https://github.com/fedcal/Telemedic" \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  --signature index.html.sig \
  --offline \
  --public-key ./fulcio-root.crt \
  index.html
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
