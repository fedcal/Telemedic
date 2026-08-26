---
title: "ADR-0011 - Eventi magri: nessun contenuto clinico nei messaggi verso l'esterno"
sidebar_position: 11
description: Perché gli eventi trasportano identificativi e riferimenti e non contenuto clinico, e perché il contenuto si rilegge con una chiamata autenticata sotto l'autorizzazione del ricevente.
---

# ADR-0011 - Eventi magri: nessun contenuto clinico nei messaggi verso l'esterno

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Vincoli di riferimento**: V-161 posto dall'area di integrazione; V-135 posto dall'area dei protocolli

## Contesto

Un evento che notifica la firma di un referto può portare con sé il referto, oppure portare solo
l'informazione che esiste, lasciando al destinatario il compito di leggerlo. La prima forma
risparmia una chiamata; la seconda ne aggiunge una.

La scelta sembra un'ottimizzazione ed è invece una decisione sul modello di autorizzazione.

## Alternative valutate

### Alternativa 1 - Evento con contenuto integrale

*Vantaggi*: il destinatario ha tutto subito; una chiamata in meno; funziona anche se il destinatario
non è in grado di richiamare.

*Compromessi*:

- **L'autorizzazione è valutata al momento della produzione**, non dell'accesso. Se fra la
  produzione e la lettura il soggetto revoca un consenso o oscura un documento, la busta già
  consegnata non lo sa. Il contenuto è uscito con un'autorizzazione che non è più vera.
- **Superficie di esposizione moltiplicata.** Una busta con contenuto clinico attraversa code,
  registri di diagnostica, sistemi di sorveglianza, archivi di ritentativo e code di messaggi non
  elaborabili. Ogni transito è una copia in un luogo con regime di protezione diverso.
- **Il contratto è meno stabile**, perché la busta segue l'evoluzione della forma del contenuto.
- Il contenuto finisce nella coda dei messaggi non elaborabili, che è ispezionabile
  dall'amministratore del tenant.

### Alternativa 2 - Evento con solo l'identificativo

*Vantaggi*: superficie minima; contratto stabilissimo.

*Compromessi*: il destinatario non può nemmeno decidere se l'evento lo interessa senza richiamare,
il che produce una chiamata per ogni evento, inclusi quelli irrilevanti.

### Alternativa 3 - Evento magro: identificativi, riferimenti e i pochi attributi che servono a
decidere se interessa

*Vantaggi*: il destinatario filtra senza richiamare e legge solo ciò che gli serve; superficie
contenuta; contratto stabile.

*Compromessi*: il destinatario deve saper richiamare, quindi deve avere credenziali e
autorizzazioni proprie: è un requisito di integrazione in più.

## Decisione

**Si adotta l'alternativa 3 per i messaggi verso sistemi terzi.**

- L'evento trasporta identificativi, riferimenti e attributi di discriminazione; **non trasporta
  contenuto clinico**.
- Il contenuto si rilegge con una **chiamata autenticata sotto l'autorizzazione del ricevente**.
- Vale per i messaggi in uscita, per le notifiche del piano clinico - con la forma a soli
  identificativi come impostazione predefinita e la forma con contenuto integrale disabilitata sui
  canali verso Internet - e per ogni canale futuro.

Per gli eventi **interni** fra contesti la regola è più permissiva ma non assente: si trasporta ciò
che serve al consumatore per decidere, non l'aggregato intero. Un evento che trasporta l'intero
stato dell'aggregato accoppia il consumatore alla forma interna del produttore, che è precisamente
ciò che i confini dovevano evitare.

## Conseguenze

**Positive**

- L'autorizzazione è valutata al momento dell'accesso, con gli attributi vigenti allora: una revoca
  o un oscuramento sopravvenuti sono rispettati.
- Il contenuto clinico non transita per code, registri e archivi di ritentativo.
- La coda dei messaggi non elaborabili è ispezionabile senza esporre contenuto sanitario.
- Il contratto degli eventi cambia meno spesso.

**Negative, accettate**

- Una chiamata in più per il destinatario che ha bisogno del contenuto.
- Il destinatario deve avere credenziali e autorizzazioni proprie: è un requisito di integrazione da
  documentare, e per un integratore piccolo è attrito reale.
- In caso di indisponibilità temporanea del sistema al momento della rilettura, il destinatario deve
  ritentare: la responsabilità del ritentativo si sposta in parte su di lui.

**Verifica automatica**: nessun evento verso l'esterno contiene contenuto clinico, verificato con
un elenco chiuso di forme rilevabili.

## Riferimenti

[06 - Eventi e integrazione interna](../02_architecture/06-eventi-e-integrazione-interna.md#33-il-contenuto-del-dato) ·
ADR-0010
