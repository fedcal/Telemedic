# Verifiche empiriche - `T-04`

Questa cartella contiene il materiale del traguardo `T-04`, *verifiche empiriche sul percorso
critico del perimetro ridotto*. Il piano di esecuzione è
[`.telemedic/piani/T-04-verifiche-empiriche.md`](../.telemedic/piani/T-04-verifiche-empiriche.md).

## Perché esiste una cartella separata

Il vincolo `V-182` dice che **nessuna riga di codice applicativo precede la catena di costruzione**
che genera la distinta dei materiali e il registro degli identificativi di requisito, e ammette una
sola eccezione: il **codice usa-e-getta delle verifiche empiriche**, che è dichiarato tale, vive in
un'area separata e **non entra in alcun artefatto distribuito**. Questa è quell'area.

Ne discendono tre regole che valgono su tutto ciò che sta qui dentro, senza eccezioni.

**Niente di ciò che sta qui è distribuito.** Non entra nel sito, non entra in un pacchetto, non è
citato da un artefatto firmato. Se un giorno qualcosa di qui dovesse essere distribuito, non si
sposta: si riscrive dove va, sotto le regole di quel posto.

**Una verifica riuscita autorizza a progettare; non è progettazione.** Il piano lo dice del gateway
del criterio 1 e vale per tutti: **il codice usa-e-getta non diventa il componente di `T-08`**. Chi
lo riusasse porterebbe in produzione codice scritto per rispondere a una domanda, non per reggere un
carico, e lo farebbe senza che nessuno lo abbia rivisto - la revisione esterna indipendente del
codice di sicurezza critico è un'attività a sé, e queste verifiche **non la sostituiscono**.

**Ciò che è qui è una domanda con la sua risposta, non una raccomandazione.** Ogni verifica ha un
esito registrato in [`P8-registro-degli-esiti.tsv`](P8-registro-degli-esiti.tsv) e, accanto
all'esito, **la conseguenza sulla progettazione**. Un esito senza conseguenza scritta non chiude il
criterio: è il criterio di completamento del traguardo nella sua lettera.

## Che cosa contiene

Il piano elenca nove artefatti preparatori `P1`-`P9`, **nessuno dei quali è codice**. Esistono
prima della finestra di esecuzione perché la loro assenza è la ragione più probabile per cui `T-04`
non chiuderebbe in tempo: sono massa che altrimenti si sottrarrebbe ai sette giorni.

| | Artefatto | Serve al criterio |
|---|---|---|
| `P1` | Enumerazione versionata delle configurazioni supportate del confine di autorizzazione | 1 |
| `P2` | Protocollo della validazione del token, con i cinque controlli e il loro ordine | 1 |
| `P3` | Elenco dei sette casi di abuso | 1 |
| `P4` | Protocollo del token d'ingresso a uso singolo | 2 |
| `P5` | Configurazione di riferimento del prodotto di federazione, con i tre difetti chiusi | 3 |
| `P6` | Elenco dei sei tentativi di allocazione | 4 |
| `P7` | Configurazione di riferimento del nodo di relay, con i corollari applicati | 4 |
| `P8` | Registro degli esiti, con la conseguenza sulla progettazione accanto a ciascuno | tutti |
| `P9` | Testo dei rinvii, ciascuno con la regola che resta in vigore | 5 |

## La finestra, e perché l'ordine non è quello dell'importanza

I sette giorni vanno dal **26 settembre al 3 ottobre 2026**, e sono interamente consumati da
`T-04`: `T-08` non comincia prima del suo esito, perché `T-04` ne è l'innesco. L'ordine delle
verifiche è determinato dalle **dipendenze**: prima il criterio 5, che non richiede nulla e che se
scivola scivola per sempre - nessuno ha un innesco per riprenderlo -; poi le due che sono
configurazione e non sviluppo, criterio 3 e criterio 4; poi il criterio 1, che è il più costoso e il
più consequenziale; infine il criterio 2, che riusa l'impianto del primo e ne è la controparte.

**Che cosa è parallelizzabile: con un contributore unico, nulla in senso stretto.** L'unica cosa che
non si contende risorse è la scrittura del registro degli esiti, che si compila **mentre** le
verifiche girano e non dopo - un esito registrato il giorno dopo è un esito ricostruito.

## Vincoli che valgono qui come altrove

Nessun dato reale di paziente. Nessun segreto: soli segnaposto `${VARIABILE_AMBIENTE}`. Nessuna
soglia clinica o di sicurezza cablata: i valori sono configurazione con un valore predefinito
dichiarato. Nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale partner.
Ciò che non è verificato su fonte primaria porta la marcatura `[NV]` con l'indicazione di chi deve
chiuderlo.
