---
title: "ADR-0025 - Formato dei token verso l'esterno"
sidebar_position: 25
description: Perché i token consegnati all'esterno sono opachi e tradotti in token autoportanti dal gateway, quale costo comporta e perché la finestra di revoca è il criterio decisivo in questo dominio.
---

# ADR-0025 - Formato dei token verso l'esterno

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Origine**: questione posta dall'area dei protocolli

## Contesto

Un token di accesso può essere **autoportante** - contiene i propri claim, firmati, e chi lo riceve
lo verifica senza interrogare nessuno - oppure **opaco**, cioè un riferimento privo di significato
che il destinatario risolve interrogando chi lo ha emesso.

La scelta ha una conseguenza che in questo dominio pesa più di tutte le altre: **la finestra di
revoca**. Un token autoportante resta valido finché non scade, perché la verifica non chiede
nulla a nessuno. Se un professionista perde il dispositivo, se un integratore viene sospeso, se un
consenso viene revocato, l'effetto della revoca arriva **al più presto alla scadenza del token già
emesso**.

## Alternative valutate

### Alternativa 1 - Token autoportanti verso l'esterno

*Vantaggi*: verifica locale, quindi nessuna chiamata aggiuntiva sul percorso critico e nessun punto
singolo di guasto; scala orizzontalmente senza stato condiviso; è il modello che ogni integratore
si aspetta.

*Compromessi*:

- **Finestra di revoca pari alla vita residua del token.** Mitigabile con durate brevi, ma le
  durate brevi spostano il costo sul rinnovo, e un rinnovo frequente su un percorso clinico è
  esso stesso un rischio di interruzione.
- **I claim sono leggibili da chiunque intercetti il token**, e in questo dominio i claim
  descrivono chi è il professionista, per quale organizzazione opera e su quale tenant. Non è
  contenuto clinico, ma è informazione che non c'è ragione di esporre.
- La dimensione dell'intestazione cresce con i claim e diventa variabile, con effetti sui limiti
  dei componenti intermedi.

### Alternativa 2 - Token opachi verso l'esterno, autoportanti all'interno

Il gateway riceve il riferimento opaco, lo risolve e lo traduce in un token autoportante che
circola **solo** dentro il perimetro.

*Vantaggi*: **revoca effettiva e immediata**; nessun claim esposto a chi intercetta; intestazioni di
dimensione costante; il perimetro interno conserva i vantaggi della verifica locale.

*Compromessi*: il gateway diventa componente critico da rendere ridondante; una risoluzione in più
sul percorso di ogni richiesta, con la sua latenza; l'integratore deve accettare un formato che non
può ispezionare.

### Alternativa 3 - Autoportanti, con introspezione su tutte le operazioni

*Compromesso*: paga il costo della risoluzione senza averne i vantaggi sulla riservatezza dei
claim, e su ogni operazione anziché su quelle che lo giustificano. **Scartata.**

## Decisione

**Si adotta l'alternativa 2: token opachi verso l'esterno, tradotti in token autoportanti dal
gateway; i token autoportanti non lasciano mai il perimetro.**

La motivazione decisiva è la **revoca effettiva**. In un sistema che tratta dati sanitari, la
domanda «da quando ha smesso di poter accedere?» deve avere come risposta un istante, non un
intervallo. Le tre situazioni che la pongono - dispositivo perduto, integratore sospeso, consenso
revocato - non sono ipotesi remote: sono eventi ordinari del ciclo di vita.

Quattro conseguenze operative:

1. **Il gateway è componente critico** e va reso ridondante, con la sua indisponibilità trattata
   come indisponibilità del sistema. Il costo è dichiarato, non nascosto.
2. **La risoluzione è memorizzata per una durata brevissima**, sufficiente ad assorbire le
   sequenze di chiamate della stessa interazione ma non a vanificare la revoca. La durata è
   dichiarata e configurabile con un massimo imposto.
3. **La revoca invalida la memorizzazione**, non attende la sua scadenza.
4. **L'introspezione sulle operazioni ad alto impatto resta obbligatoria** anche con i token
   opachi: è una verifica di secondo livello sullo stato del mandato, non una supplenza della
   revoca.

## Conseguenze

**Positive**

- La revoca ha effetto immediato.
- Nessun claim su chi è il professionista e su quale tenant opera è esposto a chi intercetta.
- Le intestazioni hanno dimensione costante.
- Il perimetro interno conserva la verifica locale e la sua scalabilità.

**Negative, accettate**

- Un componente critico in più da rendere ridondante e sorvegliare.
- Una risoluzione in più per richiesta, che entra nel budget di latenza delle operazioni.
- Gli integratori abituati al formato ispezionabile devono adattarsi: è attrito di integrazione da
  documentare con la motivazione, altrimenti viene letto come una limitazione arbitraria.
- Il gateway diventa un punto in cui transita ogni richiesta autenticata: la sua compromissione ha
  conseguenze proporzionate, e va trattato come codice di sicurezza critico.

## Riferimenti

ADR-0015 · ADR-0021 · ADR-0029
