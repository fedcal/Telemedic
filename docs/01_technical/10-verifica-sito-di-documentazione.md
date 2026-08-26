---
title: Verifica del sito di documentazione
sidebar_position: 10
description: Come si accerta, in modo eseguibile e ripetibile, che la navigazione, la ricerca e l'avviso di traduzione in corso del sito funzionino davvero - criterio 6 di T-07.
---

# Verifica del sito di documentazione

Il traguardo `T-07` della roadmap (`docs/09_roadmap/02-traguardi.md`) accerta che il sito
pubblicato funzioni davvero, non solo che esista. Tre dei suoi criteri - la navigazione, la
ricerca, l'avviso di traduzione in corso - non si verificano a occhio: il criterio 6 dello stesso
traguardo esige che la loro verifica sia **una procedura eseguibile e ripetibile**, con l'esito
dell'ultima esecuzione **registrato e datato**. Questo capitolo è quella procedura, scritta in
chiaro perché sia leggibile anche da chi non esegue lo script che la automatizza; lo script è
`scripts/esegui-verifica-sito.sh`, e descrive la stessa procedura nel proprio commento di testa,
per la stessa ragione per cui `pipeline/README-COMPONENTI.md` non si limita a rimandare al
controllo che descrive.

## 1. Che cosa la procedura accerta

| Passo | Che cosa verifica | Strumento |
|---|---|---|
| 1 | La costruzione del sito non fallisce: nessun collegamento e nessuna ancora rotti (i quattro parametri `onBroken*` di `website/docusaurus.config.mjs` sono a `'throw'`) | `npm run build` in `website/` |
| 2 | Ogni voce di navigazione (`to:` nella barra di navigazione e nel piè di pagina) porta a una pagina realmente pubblicata - la metà del criterio 1 che il controllo sui collegamenti **non copre**, perché una voce di menu è configurazione del tema, non prosa attraversata dal plugin dei documenti | `scripts/verifica-voci-di-menu.sh` |
| 3 | La ricerca è raggiungibile da ogni pagina di entrambe le locali e restituisce risultati **nella lingua attiva**, senza contaminazione fra le due | `scripts/verifica-ricerca.sh` |
| 4 | Ogni pagina della locale inglese il cui documento non ha ancora una traduzione reca l'avviso «traduzione in corso» e il rinvio alla pagina italiana - mai un errore, mai il silenzio sulla radice | `scripts/verifica-avviso-traduzione.sh` |

I criteri 4 e 5 di `T-07` - il collegamento alla dichiarazione di non dispositivo medico e
l'avvertenza su ogni pagina - sono verificati da uno script distinto,
`scripts/verifica-dichiarazione-non-marcatura.sh`, già in esercizio come controllo bloccante
della pubblicazione (criterio 7 di `T-01`) e non ripetuto qui: il criterio 6 di `T-07` chiede la
procedura per i soli criteri 1, 2 e 3.

## 2. Come si esegue

```bash
cd /percorso/del/repository
bash scripts/esegui-verifica-sito.sh
```

Lo script costruisce il sito da zero, esegue i quattro accertamenti della tabella sopra, stampa
l'esito di ciascuno e **aggiunge una riga** a
[`registro/verifiche-sito-di-documentazione.tsv`](https://github.com/fedcal/Telemedic/blob/main/registro/verifiche-sito-di-documentazione.tsv)
con la data, il commit esaminato, l'esito per ciascun criterio, chi ha eseguito la verifica, e una
nota. Il registro è **in sola aggiunta**: nessuna riga esistente viene mai modificata, per la
stessa ragione già scritta in `registro/README.md` per il registro degli identificativi di
requisito - uno stato che si sovrascrive non è più verificabile a posteriori.

Con `SALTA_COSTRUZIONE=1` lo script riusa un artefatto già presente in `website/build` invece di
ricostruirlo: utile per non pagare due volte il costo di una costruzione completa nella stessa
sessione di lavoro, ma allora il criterio 1 (collegamenti) non viene ri-accertato da
quell'esecuzione, e la riga di registro lo dichiara.

## 3. Perché la registrazione non è l'artefatto della pipeline

Un'alternativa più ovvia sarebbe registrare l'esito nel lavoro di costruzione continua che già
esiste (`.github/workflows/docs.yml`). Non è stata scelta perché **non è una registrazione**: i
registri di esecuzione di una pipeline non sono versionati, non sono consultabili senza
credenziali sulla piattaforma, e l'unico artefatto oggi conservato da un lavoro imparentato
(`distinta-dei-materiali`) scade in novanta giorni - prima del rilascio del 30 novembre 2026. Il
progetto ha già una posizione su questo, nel criterio 2 di `T-01`: la registrazione di
approvazione è la corrispondenza fra revisione, revisore e approvazione **nel repository**. Questo
registro segue la stessa disciplina.

## 4. La lacuna dichiarata: chi esegue la verifica è chi ha costruito il sito

Il criterio 6 di `T-07` dice esplicitamente: *«che sia eseguita da una persona che non ha
costruito il sito non è un criterio, perché sotto `D54` non è producibile: è una lacuna
dichiarata.»* Ogni riga del registro lo ripete nella colonna `esecutore`, invece di tacerlo: un
registro che non lo dicesse affermerebbe implicitamente, letto fra un anno da chi verifica,
un'indipendenza fra chi ha costruito il sito e chi lo ha verificato che non c'è mai stata.

## 5. Ripetibilità

Rieseguire la procedura sullo stesso commit, senza modifiche fra le due esecuzioni, deve produrre
lo stesso esito per ciascun criterio: è la sola prova che questa sia davvero una procedura e non
un verbale scritto una volta e creduto per sempre. Il registro conserva ogni esecuzione proprio
per rendere quel confronto possibile a chiunque, non solo a chi lo ha eseguito.
