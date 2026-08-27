---
title: Il dominio sanitario
sidebar_position: 1
description: Come il dominio reale della telemedicina italiana diventa modello - linguaggio ubiquo, prestazioni e macchine a stati, soggetti e ruoli, documenti clinici, parametri, consenso, terminologie, percorsi di cura e glossario.
---

# Il dominio sanitario

Questa area risponde a una sola domanda: **come si trasforma il dominio sanitario reale in un
modello eseguibile senza tradirlo.**

Non è la ripetizione dei fondamenti. I moduli di
[`docs/10_fondamenti/`](../10_fondamenti/00-come-usare-questa-guida.md) spiegano *che cosa
esiste* nel mondo - che cos'è una televisita, che cos'è un referto, che cos'è la pressione
arteriosa, che cos'è un piano di cura. Questa area stabilisce *come si rappresenta*: quali
aggregati, quali stati, quali transizioni ammesse, quali invarianti, quali attributi
obbligatori, quali confini fra concetti che il linguaggio corrente confonde.

Il criterio che governa ogni scelta qui contenuta è uno solo, e va enunciato prima di tutto il
resto: **il modello deve poter dire la verità su ciò che è accaduto.** Un modello che non sa
distinguere un paziente che non si è presentato da un paziente che ha tentato e non è riuscito
a collegarsi non è impreciso: è falso, e produce addebiti ingiusti. Un modello che non sa
distinguere una bozza da un referto firmato non è incompleto: è pericoloso, perché un
documento non validato può acquisire valore che non ha. Un modello che tratta il consenso come
un booleano non semplifica: rende indimostrabile ciò che il titolare del trattamento è tenuto
a dimostrare.

## Che cosa è vincolante e che cosa è proposta

Ogni enunciato di quest'area è classificato in modo esplicito:

| Marcatura | Significato |
|---|---|
| **[NORM]** | La norma o l'atto amministrativo lo stabilisce. Segue sempre la fonte esatta: atto, articolo, comma, allegato, paragrafo |
| **[BASE]** | Discende da [`04_BASELINE_ARCHITETTURALE.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/04_BASELINE_ARCHITETTURALE.md) o da una decisione `D1`-`D52` del brief. Non è negoziabile in quest'area |
| **[MOD]** | È una **decisione di modellazione di quest'area**, identificata con `DM-nn`. Adottabile o rigettabile, ma dichiarata come proposta e non come obbligo |
| **[NV]** | Non verificato. Indica sempre a chi va chiesta la verifica e che cosa cambia se la risposta è diversa |

Le regole di dominio già catalogate in `R6` (identificativi `BR-nnn`), i requisiti funzionali
(`RF-nnn`) e non funzionali (`RNF-nnn`) **non vengono rinumerati né riscritti**: quest'area li
cita e ne deriva la struttura dati, come impone `D45` sul congelamento degli identificativi di
requisito.

## I capitoli

| # | Capitolo | Che cosa vi si decide |
|---|---|---|
| 01 | [Il linguaggio ubiquo](01-linguaggio-ubiquo.md) | Il vocabolario condiviso fra clinici e sviluppatori: definizione normativa dove esiste, operativa dove non esiste, e i termini che sembrano sinonimi e non lo sono |
| 02 | [Le prestazioni modellate](02-le-prestazioni-modellate.md) | Televisita, teleconsulto, teleconsulenza, teleassistenza, telemonitoraggio: attori, ciclo di vita, stati, transizioni ammesse, esiti, cosa produce e cosa annulla ciascuna |
| 03 | [Assistito, professionista, organizzazione](03-assistito-professionista-organizzazione.md) | Persone, ruoli con validità temporale, relazioni, deleghe, rappresentanza. Perché il ruolo non è un attributo |
| 04 | [I documenti clinici](04-documenti-clinici.md) | Tipologie, redazione, validazione, firma, versione, rettifica, oscuramento. Il dataset canonico e le dieci tipologie documentali nazionali |
| 05 | [Parametri e osservazioni](05-parametri-e-osservazioni.md) | La misura e il suo contesto obbligatorio, unità, provenienza, affidabilità, dato mancante, serie temporali |
| 06 | [Consenso e riservatezza](06-consenso-e-riservatezza.md) | Il consenso come fatto con validità temporale, revoca, oscuramento, accesso d'emergenza tracciato |
| 07 | [Le terminologie nel dominio](07-terminologie-nel-dominio.md) | Quali codifiche per quali concetti, il regime di licenza e le sue conseguenze sul modello, il comportamento senza terminology server |
| 08 | [Percorsi e piani di cura](08-percorsi-e-piani-di-cura.md) | Presa in carico, piano, aderenza, esiti. Come si supportano più percorsi senza cablarne nessuno |
| 09 | [Glossario del dominio](09-glossario-del-dominio.md) | Glossario esteso italiano/inglese con rinvii incrociati e collisioni terminologiche presidiate |

## I sette vincoli che attraversano tutta l'area

Sono in vigore per decisione dell'orchestrazione e non sono derogabili da questa area.

1. **[`V-01`](../11_registri/01-vincoli-in-vigore.md#v-01) - `Encounter` e `MediaSession` sono aggregati distinti.** La prestazione clinica e
   la sessione media hanno cicli di vita indipendenti. Il capitolo 02 ne fa la spina dorsale.
2. **[`V-02`](../11_registri/01-vincoli-in-vigore.md#v-02) - nessuna soglia clinica cablata.** Le soglie sono configurazione per assistito,
   mai costanti del codice. Il capitolo 05 e il capitolo 08 lo rendono operativo.
3. **[`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03) - il sistema è pienamente funzionale senza SNOMED CT.** Nessun percorso principale
   può richiederlo. Il capitolo 07 dichiara il costo esatto di questa scelta.
4. **[`V-04`](../11_registri/01-vincoli-in-vigore.md#v-04) - il registro immutabile è a catena di impronte e conservazione separata.** Il
   versionamento delle entità non lo sostituisce. Ricade sui capitoli 04 e 06.
5. **[`V-07`](../11_registri/01-vincoli-in-vigore.md#v-07) - il contenuto dei documenti per il fascicolo si modella come dataset canonico**;
   le serializzazioni sono sostituibili. È l'architrave del capitolo 04.
6. **[`V-09`](../11_registri/01-vincoli-in-vigore.md#v-09) - l'assenza di dato è informazione clinica.** Il silenzio non è mai trattato come
   normalità. È l'architrave del capitolo 05, § sul dato mancante.
7. **`R0` - riservatezza.** Nessun nome di azienda, marchio, prodotto commerciale o dominio di
   potenziale partner compare in quest'area. Si usano soltanto formule generiche: «un
   gestionale sanitario cloud», «un sistema EHR di terze parti», «l'integratore», «il
   repository documentale nazionale o regionale».

## I dodici errori di modellazione che quest'area esiste per impedire

Ognuno è stato osservato in sistemi reali di questo dominio ed è la ragione per cui il
capitolo corrispondente è scritto come è scritto.

| # | Errore | Conseguenza concreta | Dove si risolve |
|---|---|---|---|
| 1 | Un solo tipo di «prestazione» che copre richiesta, esecuzione e addebito | Campi nulli, regole condizionali fragili, rendicontazione impossibile | [01](01-linguaggio-ubiquo.md), [02](02-le-prestazioni-modellate.md) |
| 2 | `Encounter` e sessione media fusi | Ogni disconnessione crea un contatto fantasma; la caduta di rete chiude l'atto clinico | [02](02-le-prestazioni-modellate.md) |
| 3 | Il ruolo come attributo della persona | Lo stesso professionista non può operare in due organizzazioni; la storia dei ruoli si perde | [03](03-assistito-professionista-organizzazione.md) |
| 4 | Caregiver e rappresentante legale trattati come la stessa figura | Consensi raccolti da chi non ha titolo per prestarli | [03](03-assistito-professionista-organizzazione.md), [06](06-consenso-e-riservatezza.md) |
| 5 | La bozza di referto trattata come referto | Un documento non validato acquisisce valore probatorio che non ha | [04](04-documenti-clinici.md) |
| 6 | Il documento firmato modificato in luogo | Perdita di integrità, catena di rettifica non ricostruibile | [04](04-documenti-clinici.md) |
| 7 | Il template di serializzazione cablato nel modello dati | Una revisione delle specifiche nazionali impone la riscrittura del dominio | [04](04-documenti-clinici.md) |
| 8 | La misura ridotta a valore più istante | Nessun modo di sapere chi ha misurato, con che strumento, in quali condizioni | [05](05-parametri-e-osservazioni.md) |
| 9 | Il silenzio del telemonitoraggio interpretato come stabilità | Il peggioramento clinico che impedisce la misura resta invisibile | [05](05-parametri-e-osservazioni.md), [08](08-percorsi-e-piani-di-cura.md) |
| 10 | Il consenso come booleano | Revoca senza effetto, consenso non riferibile a un testo, oscuramento inferibile | [06](06-consenso-e-riservatezza.md) |
| 11 | Le stringhe di interfaccia confuse con `Coding.display` | Traduzioni che diventano derivati di terzi e contaminano la licenza | [07](07-terminologie-nel-dominio.md) |
| 12 | Il percorso di cura cablato nel codice | Ventuno cicli regionali indipendenti diventano ventuno rami di codice | [08](08-percorsi-e-piani-di-cura.md) |

## Come si legge quest'area

- **Chi progetta il modello dati** legge nell'ordine 01 → 03 → 02 → 04 → 05 → 06, che è
  l'ordine di dipendenza reale: prima il vocabolario, poi i soggetti, poi gli atti, poi ciò
  che gli atti producono.
- **Chi implementa un contesto delimitato** legge il capitolo che gli compete e il capitolo 01,
  che contiene le regole di denominazione applicabili a ogni contesto.
- **Chi integra un sistema terzo** legge 01, 03 e 04: il vocabolario, il modello per
  riferimento delle anagrafiche e il dataset canonico dei documenti sono ciò che attraversa il
  confine.
- **Chi lavora sulla conformità** legge 04, 06 e 07: sono i tre capitoli in cui il modello
  incontra obblighi normativi puntuali e ne porta la traccia.

## Avvertenza sullo stato del prodotto

Coerentemente con `D16` e `D51`, nulla di quanto descritto in quest'area implica che il
software sia marcato CE. Il modello di dominio è progettato **perché sia certificabile da chi
intende certificarlo**, non perché sia certificato. Nessun capitolo di quest'area può essere
letto come dichiarazione di conformità a un regolamento sui dispositivi medici.

## Dati negli esempi

Tutti gli esempi, gli identificativi, i codici e i valori riportati in quest'area sono
**sintetici**. Nessun dato reale, nemmeno parziale, nemmeno pseudonimizzato, compare in alcun
capitolo, in alcun diagramma e in alcun blocco di codice. È la regola assoluta enunciata dal
modulo [03 dei fondamenti](../10_fondamenti/03-il-dato-clinico.md), § 10, e vale qui senza
eccezioni.
