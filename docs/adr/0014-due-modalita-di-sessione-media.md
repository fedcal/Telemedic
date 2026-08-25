---
title: "ADR-0014 — Due modalità di sessione media e i loro effetti sul modello"
sidebar_position: 14
description: Perché la registrazione lato server e la cifratura fino agli estremi sono incompatibili, come si rappresenta l'incompatibilità nel modello e quali obblighi ne discendono.
---

# ADR-0014 — Due modalità di sessione media e i loro effetti sul modello

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Decisioni di riferimento**: D22, D23; vincolo V-11 di bacheca

## Contesto

Due requisiti del progetto sono in conflitto diretto e il conflitto non è risolvibile con una
soluzione tecnica.

Il primo: il media è **cifrato fino agli estremi**, e la verifica breve delle chiavi da parte dei
due interlocutori rende la proprietà dimostrabile invece che asserita.

Il secondo: la **registrazione della sessione avviene lato server**, per garantirne l'affidabilità
indipendentemente dal dispositivo dell'assistito e dal suo carico di elaborazione.

Sono incompatibili per costruzione: un componente che registra il flusso deve poterlo decifrare, e
un flusso decifrato in un punto intermedio non è cifrato fino agli estremi. Non esiste una
configurazione che soddisfi entrambi.

La domanda posta a quest'area è di confermare la soluzione a due modalità e di determinarne gli
effetti sul modello dati.

## Alternative valutate

### Alternativa 1 — Registrazione lato client

Il dispositivo del partecipante registra e cifra localmente, poi carica.

*Vantaggi*: preserva la cifratura fino agli estremi; riduce il perimetro del trattamento.

*Compromessi*: dipende dalla capacità di elaborazione del dispositivo dell'assistito, che è la
variabile meno controllabile del sistema; comporre e codificare i flussi in parallelo alla sessione
**rischia di causare proprio il degrado di qualità che il sistema deve evitare**; il caricamento
successivo può fallire su una rete mobile e richiede una coda resiliente nel browser; il contenitore
disponibile dipende dal motore del browser. **Scartata dal committente**, che ha scelto
l'affidabilità della registrazione.

### Alternativa 2 — Registrazione lato server, dichiarando comunque la cifratura fino agli estremi

*Compromesso*: sarebbe **falso**. Scartata senza discussione: un claim di sicurezza non veritiero è
il tipo di difetto che distrugge la credibilità dell'intero sistema.

### Alternativa 3 — Registrazione lato server, con due modalità distinte e dichiarate

*Vantaggi*: la registrazione è affidabile; la proprietà di sicurezza è dichiarata correttamente per
ciascuna modalità; l'assistito sa che cosa sta accettando.

*Compromessi*: il sistema ha due profili di sicurezza invece di uno, e questo è più difficile da
spiegare di una promessa uniforme.

## Decisione

**Si conferma l'alternativa 3.**

- **Modalità predefinita**: cifrata fino agli estremi, instradata direttamente quando la rete lo
  consente, con verifica breve delle chiavi **obbligatoria per impostazione predefinita**.
- **Modalità con registrazione**: attivabile solo con manifestazione di volontà esplicita e
  specifica dell'assistito. Il flusso attraversa il componente di registrazione e **la sessione non
  è cifrata fino agli estremi**.

### Effetti sul modello dati

1. **La modalità è uno stato dell'aggregato della sessione media**, non un attributo booleano del
   materiale registrato. I due stati sono mutuamente esclusivi e la transizione fra essi è un
   evento con ora e attribuzione.
2. **Il materiale registrato è un aggregato autonomo**, con: riferimento alla manifestazione di
   volontà che lo legittima, riferimento alla chiave, scadenza di conservazione **sempre
   valorizzata**, stato di conservazione. Non esiste materiale registrato senza consenso vigente e
   senza scadenza.
3. **Le chiavi di cifratura a riposo sono per tenant**, mai condivise.
4. **La revoca del consenso ha effetto immediato** sulla registrazione in corso: è una relazione di
   partnership fra il contesto del consenso e quello della sessione, non una relazione
   cliente-fornitore che può essere saltata.
5. **Il consenso alla registrazione è granulare per sessione** e non ereditabile da un consenso
   generale alla piattaforma.
6. **Il materiale registrato non è documentazione clinica**: è un artefatto proprio, con regime di
   accesso proprio, e non entra nel contesto della documentazione se non attraverso
   un'acquisizione esplicita decisa dal professionista e registrata come tale.
7. **La riproduzione del materiale è un'operazione tracciata** con severità propria.

### Obblighi che ne discendono

- L'**informativa di consenso dichiara esplicitamente** che la sessione non è più cifrata fino agli
  estremi. Non è un dettaglio tecnico da omettere: è l'oggetto stesso del consenso.
- L'interfaccia segnala lo stato di registrazione in modo **persistente e non occultabile** per
  tutta la durata. L'indicatore **non è tematizzabile né occultabile** da alcun integratore.
- Il passaggio fra le due modalità è tracciato.
- Il **contenitore è negoziato a runtime, mai assunto**: nessun documento del progetto può
  dichiarare un contenitore come garantito prima della verifica sui browser supportati.

## Conseguenze

**Positive**

- Il claim di sicurezza è veritiero in entrambe le modalità.
- L'assistito può prestare un consenso realmente informato, perché conosce la conseguenza.
- La modalità predefinita resta quella con la proprietà di sicurezza più forte.

**Negative, accettate**

- Due profili di sicurezza da documentare, provare e spiegare.
- La comunicazione pubblica deve rinunciare alla formula semplice e uniforme.
- Il componente di registrazione è un ulteriore punto in cui transita contenuto sanitario in chiaro,
  con le conseguenze che ne derivano per il registro dei trattamenti e per la valutazione d'impatto.

## Riferimenti

[03 — Modello di dominio](../02_architecture/03-modello-di-dominio.md#45-contesto-sessione-media) ·
[02 — Contesti delimitati](../02_architecture/02-contesti-delimitati.md#ctx-05--sessione-media) ·
ADR-0001
