---
title: "ADR-0001 - Separazione fra prestazione clinica e sessione media"
sidebar_position: 1
description: Perché l'atto clinico a distanza e la connessione in tempo reale sono due aggregati distinti in due contesti distinti, quali alternative sono state scartate e a quale prezzo.
---

# ADR-0001 - Separazione fra prestazione clinica e sessione media

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Vincoli di riferimento**: V-01 di bacheca; base architetturale §2

## Contesto

Dal punto di vista dell'utente, una prestazione a distanza è un evento solo: il professionista e
l'assistito si collegano, parlano, l'atto si conclude. Un modello che rappresenti quell'evento con
un unico oggetto è il più semplice da scrivere e da spiegare, ed è quello a cui si arriva
spontaneamente. Nel caso felice l'oggetto unico ha la stessa durata, gli stessi partecipanti e lo
stesso identificativo logico dell'atto clinico.

Il caso felice presuppone però che la rete funzioni. In un sistema di telemedicina il caso in cui
la rete non funziona non è un'eccezione: è una parte consistente del volume, ed è il caso su cui il
sistema si giudica.

Serviva quindi decidere se l'atto clinico e la connessione fossero la stessa entità.

## Alternative valutate

### Alternativa 1 - Un solo aggregato, con gli attributi di connessione

L'entità dell'atto porta lo stato del collegamento, il tipo di percorso di rete, l'istante di avvio
del flusso. La fine della connessione chiude l'atto.

*Vantaggi*: codice minimo; nessuna sincronizzazione; nessun riferimento da risolvere; il modello
corrisponde alla percezione dell'utente.

*Compromessi accertati*, ciascuno verificato come difetto reale e non ipotetico:

1. **Prestazione fantasma.** Una caduta e una riconnessione producono due connessioni, quindi due
   atti dove ce n'è stato uno. Il conteggio delle prestazioni erogate - che alimenta la
   rendicontazione - diventa il conteggio delle connessioni riuscite, che è una grandezza diversa.
   L'informazione che le due connessioni erano lo stesso atto non è mai esistita e non è
   ricostruibile a posteriori.
2. **Atto sanitario inesistente.** La verifica tecnica che precede l'appuntamento è una connessione
   senza atto. O si crea un atto fittizio, che finisce nei conteggi, oppure si introduce un ramo
   speciale che crea una connessione senza atto - cioè si ammette che le due cose sono separate,
   facendolo di nascosto.
3. **Prestazione erogata che risulta fallita.** Il video fallisce, il professionista prosegue in
   fonia, conclude e referta. La connessione video è fallita; l'atto è stato erogato. Il modello
   unificato registra un fallimento.
4. **Prestazione con più sessioni legittime.** L'ingresso di un interprete a metà, la ripresa dopo
   una pausa, il passaggio di consegne fra due professionisti producono più connessioni per
   progetto, non per guasto.
5. **Inquinamento del regime di conservazione.** I metadati tecnici hanno conservazione breve; la
   documentazione dell'atto ha conservazione lunga. Uniti, o si conservano i metadati per anni,
   costruendo un archivio di dati di traffico sanitario che nessuno ha chiesto, o si cancella la
   documentazione.
6. **Accoppiamento dei ritmi di rilascio.** Il trasporto cambia con i motori dei browser e i
   protocolli di rete; la documentazione dell'atto cambia con la normativa sanitaria. Uniti, ogni
   aggiornamento dell'uno tocca l'altro.

### Alternativa 2 - Due entità nello stesso aggregato

Due tipi, una sola radice, un solo confine transazionale.

*Vantaggi*: separazione concettuale con consistenza immediata fra i due.

*Compromessi*: la consistenza immediata è **esattamente ciò che non si vuole**. Se i due stanno
nello stesso confine transazionale, ogni cambio di stato della connessione - decine in una
prestazione - è una scrittura sull'aggregato dell'atto, con contesa e con il rischio permanente che
qualcuno colleghi i due stati «perché sono lì». Il regime di conservazione resta comune. Non
risolve i punti 1, 5 e 6.

### Alternativa 3 - Due aggregati in due contesti, collegati per identificativo

*Vantaggi*: risolve tutti e sei i compromessi.

*Compromessi accettati*: due identificativi da correlare; una sincronizzazione esplicita da
progettare; l'impossibilità di garantire in una transazione un'invariante che coinvolga entrambi -
il che è corretto, perché nessuna invariante clinica deve coinvolgerli entrambi.

## Decisione

**Si adotta l'alternativa 3.** La prestazione clinica e la sessione media sono due aggregati
distinti, radici di due contesti delimitati distinti, collegati **solo per identificativo**.

Regola operativa che ne discende, e che è la sostanza della decisione:

> **Nessun fatto della sessione media produce un cambio di stato dell'atto clinico.** La sessione
> può informare, mai decidere. Il verso inverso è di comando: l'atto chiede l'apertura, la chiusura,
> l'autorizzazione alla registrazione.

## Conseguenze

**Positive**

- Una caduta di rete non altera lo stato clinico: è lo scenario di qualità SQ-04, la cui misura è
  che il numero di prestazioni create per prestazione erogata sia sempre uno.
- Le verifiche tecniche esistono senza produrre atti sanitari.
- Una prestazione conclusa in fonia dopo il fallimento del video risulta erogata.
- I due regimi di conservazione sono indipendenti.
- Il piano media è sostituibile senza toccare il dominio clinico.

**Negative, accettate**

- Il modello non corrisponde alla percezione ingenua e va spiegato a ogni nuovo contributore.
- La correlazione fra i due richiede una risoluzione attraverso l'interfaccia del contesto
  proprietario, non un join.
- Esistono finestre in cui la connessione è terminata e l'atto è ancora aperto: è corretto, ma
  richiede che l'interfaccia lo rappresenti in modo comprensibile al professionista.

**Verifiche automatiche che ne discendono**

- Nessuna chiave esterna fra le tabelle dei due contesti.
- Nessun percorso in cui un evento della sessione media invochi una transizione di stato dell'atto.
- Prova che, dopo caduta e riconnessione, esista una sola prestazione.

**Chi altro è vincolato**: tutte le aree. È il vincolo V-01 di bacheca e nessuna area può unirli.

## Riferimenti

[03 - Modello di dominio](../02_architecture/03-modello-di-dominio.md#3-la-separazione-fra-prestazione-clinica-e-sessione-media) ·
[02 - Contesti delimitati](../02_architecture/02-contesti-delimitati.md)
