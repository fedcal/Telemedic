---
title: "ADR-0020 - Serie temporali in archivio dedicato; le metriche del canale non sono osservazioni cliniche"
sidebar_position: 20
description: Perché parametri clinici e metriche di canale sono due serie con regimi opposti, perché non stanno in tabelle relazionali generiche e perché una metrica di rete non deve entrare nella cartella clinica.
---

# ADR-0020 - Serie temporali in archivio dedicato; le metriche del canale non sono osservazioni cliniche

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Vincoli di riferimento**: [V2](../11_registri/03-vincoli-fondanti.md#v2); [V-155](../11_registri/01-vincoli-in-vigore.md#v-155) dell'area sicurezza

## Contesto

Il sistema produce due famiglie di dati a serie temporale: i **parametri clinici** - misure di
telemonitoraggio e risposte a questionari - e le **metriche del canale** - ritardo, perdita,
variazione del ritardo, ritmo di trasmissione, tipo di percorso di rete.

Superficialmente si assomigliano: numeri con un istante, prodotti a ritmo elevato, consultati per
intervallo. Hanno però **regimi giuridici opposti** e una differenza di natura che non ammette
confusione.

## Alternative valutate

### Alternativa 1 - Entrambe come osservazioni cliniche nel formato di scambio, persistite in tabelle relazionali

*Vantaggi*: un solo meccanismo; le metriche diventano immediatamente esponibili nel piano clinico;
nessun archivio aggiuntivo.

*Compromessi decisivi*:

- **Una metrica del canale modellata come osservazione clinica finisce nella cartella di una
  persona.** Il ritardo di trasmissione di un pacchetto non è un dato clinico. È un problema di
  qualità del dato e, dato il confine fra registrazione e interpretazione, potenzialmente di
  qualificazione.
- Il regime di conservazione delle due famiglie è incompatibile: applicando quello clinico alle
  metriche si costruisce **un archivio di dati di traffico sanitario che nessuno ha chiesto**;
  applicando quello tecnico ai parametri **si perde documentazione sanitaria**.
- Una tabella relazionale generica non offre aggregazione su finestre mobili, riduzione della
  risoluzione dei dati storici e scadenza automatica, che sono le operazioni tipiche su una serie.
- La rappresentazione di una singola misura nel formato di scambio è di uno o due ordini di
  grandezza più voluminosa del dato che trasporta.

**Scartata.**

### Alternativa 2 - Entrambe in archivio a serie temporali, con lo stesso regime

*Vantaggi*: un solo archivio; operazioni native adeguate.

*Compromessi*: resta il problema del regime unico. **Scartata.**

### Alternativa 3 - Due serie con regimi distinti, entrambe in strutture dedicate a serie temporali,
rappresentazione clinica come proiezione costruita su richiesta

*Vantaggi*: ciascuna famiglia ha il proprio regime; le operazioni sono native; la cartella clinica
non è inquinata.

*Compromessi*: un archivio in più rispetto al solo relazionale; una proiezione da costruire.

## Decisione

**Si adotta l'alternativa 3.**

| Serie | Natura | Regime |
|---|---|---|
| **Parametri clinici** | Dato relativo alla salute | Conservazione lunga; accesso clinico; ogni lettura tracciata; **riduzione della risoluzione vietata**, perché sono documentazione |
| **Metriche del canale** | **Non clinico** | Conservazione breve; accesso tecnico; nessun identificativo diretto dell'assistito; riduzione della risoluzione ammessa |

Sei invarianti:

1. La misura è **immutabile**; una correzione produce una nuova misura che sostituisce la
   precedente, con il riferimento a quella sostituita.
2. Ogni punto porta **i due istanti**: rilevazione e ricezione.
3. Ogni punto porta il proprio contesto di produzione: strumento, metodo, soggetto inseritore.
4. I campioni del canale **non portano identificativi diretti dell'assistito**, e nessuna metrica
   infrastrutturale del relay è etichettata con l'identificativo di sessione.
5. **L'assenza di un punto atteso è rappresentabile.** Una serie che contiene solo ciò che è
   arrivato non consente di distinguere «tutto regolare» da «nessun dato», ed è la traduzione
   operativa del principio per cui il silenzio non è mai normalità.
6. **La rappresentazione nel formato di scambio è una proiezione costruita su richiesta**, per
   l'intervallo richiesto, mai la forma persistita.

## Conseguenze

**Positive**

- La cartella clinica non contiene dati di rete.
- I due regimi di conservazione sono applicabili senza compromessi.
- Le operazioni tipiche sulle serie sono native, quindi economiche.
- La distinzione fra qualità misurata del canale e qualità dell'atto resta netta: il sistema misura
  e informa il professionista, che decide. Il sistema non decide se la qualità è sufficiente.

**Negative, accettate**

- Un archivio in più da installare, sorvegliare e mettere in sicurezza anche presso il cliente.
- Una proiezione da costruire per l'esposizione clinica dei parametri, con la propria prova di
  equivalenza.
- Il divieto di riduzione della risoluzione sui parametri clinici comporta un costo di
  archiviazione crescente nel tempo, dichiarato e dimensionato.

## Riferimenti

[04 - Modello dati](../02_architecture/04-modello-dati.md#4-le-serie-temporali) ·
[03 - Modello di dominio](../02_architecture/03-modello-di-dominio.md#47-contesto-telemonitoraggio) ·
ADR-0006
