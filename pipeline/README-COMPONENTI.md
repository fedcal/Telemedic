# Annotazioni dei componenti di terze parti

Questo documento dichiara il formato di `annotazioni-componenti.tsv`, letto dal controllo
`scripts/verifica-registro-componenti.sh` per implementare `G2` e `G5` del traguardo `T-03`.

## Perché esiste questo file

Quando la distinta dei materiali entra nella pipeline, il progetto acquista il diritto e il dovere
di dichiarare che cosa sa di ciascun componente di terze parti che pubblica. La dichiarazione
comprende:

- **Quale licenza il componente dichiara in `package.json`** (non una stima)
- **Che cosa il progetto sa della compatibilità** di quella licenza con la propria (Apache-2.0)
- **Perché il componente è nel progetto** - quale bisogno risolve

Tutto questo non è narrativo: è strutturato, collaudabile e verificabile alla costruzione. La
ragione è espressa nel controllo `G5` di `docs/10_fondamenti/17-ambiente-di-sviluppo.md` §9.2:
**«È il meccanismo che impedisce a una dipendenza di entrare senza essere stata valutata»**.

## Formato

Valori separati da tabulazione. Le righe che cominciano con `#` sono commenti. La prima riga non
commentata è l'intestazione e dichiara le sei colonne.

| Colonna | Contenuto |
|---|---|
| `componente` | Nome del componente npm (il valore di `"name"` in `package.json`) |
| `versione` | Intervallo di versione accettato (identico alla riga di `package.json`, ad es. `^3.7.0`) |
| `licenza_dichiarata` | La licenza dichiarata in `package.json` - non una valutazione, il valore letterale |
| `compatibilita_apache_2_0` | `compatibile` · `indeterminabile` · `incompatibile` |
| `motivo_inclusione` | Perché il componente è nel progetto: il bisogno che risolve, in una frase o due |
| `canale_di_avviso` | URL di una pagina dove si seguono gli aggiornamenti di sicurezza (ad es. pagina dei rilasci su GitHub) |

## Compatibilità con Apache-2.0

La colonna `compatibilita_apache_2_0` raccoglie tre valori binari di una domanda: che cosa sa il
progetto della compatibilità fra la licenza del componente e Apache-2.0?

### `compatibile`

La licenza del componente è permissiva e non pone vincoli sulla ridistribuzione. È il caso di MIT,
ISC, BSD-3-Clause e altre licenze permissive, dove il componente può essere incluso in un progetto
Apache-2.0 senza ulteriori vincoli. La dimostrazione è la compatibilità dichiarata fra le due
licenze in una fonte ufficiale - la matrice di compatibilità di SPDX (quando esiste) oppure un
parere legale pubblicato dal maintainer della licenza.

### `indeterminabile`

La licenza del componente non è in forma standard SPDX, oppure il componente non ha alcuna licenza
dichiarata, oppure il progetto non ha il bagaglio legale per valutare la compatibilità. In questo
caso il componente resta in segnalazione (non bloccante) finché qualcuno che ne ha l'autorità non
lo esamina: l'integratore che istalla il progetto non può sostenere che «era della pipeline e quindi
era stato controllato». L'iscrizione di `indeterminabile` trasferisce la responsabilità di
valutazione dall'autore a chi integra, che è esattamente il costo che il controllo `G2`
(`docs/10_fondamenti/17-ambiente-di-sviluppo.md` §9.2) esiste per impedire.

### `incompatibile`

La licenza del componente è copyleft forte (GPL-3.0 e simili) e pone vincoli sulla ridistribuzione
che Apache-2.0 non può accettare senza alterare i termini del progetto. Se il progetto decide
comunque di accettare il componente, la decisione va formalizzata come una deroga dichiarata: non
è una domanda di compatibilità tecnica, è una scelta legale.

## Che cosa il controllo fa

Il controllo `scripts/verifica-registro-componenti.sh`:

1. Legge questa tabella dai separatori di tabulazione.
2. Legge la distinta CycloneDX JSON dai file generati nella pipeline.
3. **Fallisce** (e blocca la costruzione) quando:
   - Un componente è nella distinta e assente da questa tabella (non è stato dichiarato)
   - Un componente ha `compatibilita_apache_2_0 = incompatibile` o `indeterminabile`
4. **Segnala** la riga che ha causato il fallimento e il motivo specifico.

La scelta di bloccare `indeterminabile` è una decisione di non rinviare la valutazione legale. Un
progetto che la vuole cambiare deve discuterla come una variazione di policy, non aggirarla con un
marcatore nel controllo.

## Come si aggiunge un componente

Quando `npm install` aggiunge una dipendenza nuova di primo livello:

1. Leggi il `package.json` del componente per ottenere nome, versione dichiarata e licenza.
2. Ricerca la licenza in una fonte affidabile: se il componente è su GitHub, il file `LICENSE` o
   la dichiarazione in `package.json` sono la fonte primaria.
3. Valuta la compatibilità:
   - Se è MIT, ISC, Apache-2.0, BSD-3-Clause o altra licenza chiaramente permissiva: scrivi
     `compatibile`.
   - Se la licenza è non standard, assente, o tu non sei sicuro: scrivi `indeterminabile`.
   - Se è GPL-3.0 o altra licenza copyleft forte: scrivi `incompatibile` e apri una decisione
     (rischio, discussione) sul perché il componente serve comunque.
4. Descrivi il motivo in una frase o due: che bisogno risolve? Dove viene usato nel sito?
5. Inserisci l'URL del canale di avvisi (pagina dei rilasci, pagina di sicurezza del progetto).
6. Aggiungi una riga alla tabella, in ordine alfabetico per nome di componente.
7. Il controllo non blocca finché la riga non è presente e la licenza non è `incompatibile` o
   `indeterminabile`.

## Nota sulla nomenclatura

La tabella chiama `licenza_dichiarata` la licenza che il componente dichiara in `package.json`.
Non è una valutazione: è il fatto nudo. La valutazione è in `compatibilita_apache_2_0`.
