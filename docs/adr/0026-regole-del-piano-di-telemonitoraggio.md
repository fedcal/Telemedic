---
title: "ADR-0026 - Rappresentazione ed esecuzione delle regole del piano di telemonitoraggio"
sidebar_position: 26
description: Perché le regole del piano sono un linguaggio dichiarativo ristretto e versionato, valutato in modo deterministico contro la versione vigente all'istante di misura, e perché non sono codice né un motore di regole generico.
---

# ADR-0026 - Rappresentazione ed esecuzione delle regole del piano di telemonitoraggio

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta dall'area funzionale a quest'area e all'area di conformità
**Vincoli di riferimento**: V2; V-02, V-144 e V-147 di bacheca; V-121, V-123, V-124 dell'area funzionale

## Contesto

Il piano individuale di telemonitoraggio contiene le regole con cui le misure vengono valutate. I
requisiti funzionali impongono che le misure siano valutate contro le regole del **piano
individuale vigente all'istante di misura**, che la versione della regola sia registrata
sull'allarme, e che il determinismo sia verificabile con vettori di prova.

Il linguaggio deve essere abbastanza espressivo da coprire soglia, andamento, persistenza,
isteresi, finestra e condizioni di applicabilità; e abbastanza **ristretto** da non diventare un
modo per introdurre logica clinica arbitraria - che è precisamente ciò che il perimetro del
progetto esclude.

## Alternative valutate

### Alternativa 1 - Regole come codice

Ogni regola è una classe, e aggiungere una regola è un rilascio.

*Vantaggi*: espressività massima; nessun interprete da scrivere; prove ordinarie.

*Compromessi*: **contraddice il vincolo per cui nessun percorso di cura è codificato nel
software**; rende l'aggiunta di un piano una modifica del prodotto; e soprattutto **rende la
regola non versionabile con il piano**, perché il codice ha la versione del rilascio e non quella
del piano individuale. Con il codice, «quale regola era vigente all'istante di quella misura» non
ha risposta. **Scartata.**

### Alternativa 2 - Motore di regole generico o linguaggio di espressione clinica

*Vantaggi*: espressività alta; standard esistenti; la piattaforma nazionale prevede il consumo di
protocolli con logica espressa in un linguaggio di espressione clinica.

*Compromessi decisivi*: **un esecutore di logica clinica generica è esattamente il componente che
il perimetro esclude**. Il progetto distingue le due capacità - consumare terminologie e
consumare logica eseguibile - e progetta perché l'esecutore **sia assente per costruzione, non
disattivato per configurazione**. Un motore generale, anche se usato per soglie semplici, è un
esecutore presente. **Scartata.**

### Alternativa 3 - Linguaggio dichiarativo ristretto, chiuso e versionato

Un insieme **chiuso** di costrutti - soglia, intervallo di normalità, andamento su finestra,
persistenza oltre una durata, isteresi di rientro, condizione di applicabilità - combinabili ma non
estendibili dall'utente.

*Vantaggi*: copre i casi richiesti; è versionabile con il piano; è deterministico e verificabile
con vettori di prova; **non è un esecutore di logica arbitraria**, perché l'insieme dei costrutti è
chiuso e ciascuno ha una semantica dichiarata.

*Compromessi*: un caso non previsto richiede l'aggiunta di un costrutto, quindi un rilascio; serve
un interprete da scrivere e da provare.

## Decisione

**Si adotta l'alternativa 3.**

1. **Insieme chiuso di costrutti**, ciascuno con semantica dichiarata e prove proprie. L'insieme si
   estende con un rilascio e una decisione esplicita, mai con configurazione.
2. **La regola è parte del piano ed è versionata con esso.** Il piano è un artefatto versionato con
   validità temporale.
3. **La valutazione usa la versione vigente all'istante di misura**, non quella corrente, e opera
   **sull'istante di misura** e non su quello di ricezione.
4. **La versione della regola applicata è registrata sull'allarme**, insieme alle misure che
   l'hanno prodotto e alla soglia vigente: il calcolo deve essere ricostruibile a distanza di anni.
5. **Determinismo verificabile**: a parità di vettore di ingresso l'esito è sempre lo stesso, ed è
   provato con vettori di prova versionati insieme ai costrutti.
6. **Nessuna soglia predefinita, nessuna precompilazione.** Il campo parte vuoto e obbligatorio,
   anche rispetto ai valori del percorso o dell'ultimo piano; i riferimenti si mostrano attribuiti,
   in sola lettura, con azione esplicita di copia.
7. **Nessuna deduzione**: il linguaggio non contiene costrutti che ricavino soglie da popolazione o
   storico, né che interpolino o riempiano i buchi delle serie.

## Conseguenze

**Positive**

- Aggiungere un piano è configurazione, non un rilascio.
- La ricostruzione del calcolo che ha prodotto un allarme è possibile e completa.
- L'insieme chiuso dei costrutti è la garanzia strutturale che il sistema non esegua logica clinica
  arbitraria: è verificabile leggendo l'elenco, non ispezionando i piani caricati.

**Negative, accettate**

- Un interprete da scrivere, provare e mantenere.
- Un caso clinico non previsto richiede un rilascio: è un attrito reale per chi configura, ed è la
  contropartita del confine.
- L'insieme dei costrutti diventerà oggetto di pressione per essere ampliato: ogni ampliamento è
  una decisione con implicazioni di perimetro e va trattata come tale, non come richiesta di
  funzionalità.

**Rinviato all'area di conformità**: la conferma che l'insieme dei costrutti adottati resti dentro
la destinazione d'uso congelata.

## Riferimenti

[03 - Modello di dominio](../02_architecture/03-modello-di-dominio.md#47-contesto-telemonitoraggio) ·
ADR-0024 · ADR-0030
