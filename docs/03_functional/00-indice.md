---
title: Area funzionale - indice
sidebar_position: 1
description: "Mappa dell'`FUNZ` di Telemedic: attori e ruoli, catalogo dei requisiti con identificativi congelati, casi d'uso con flussi alternativi e di errore, regole di business, gestione degli allarmi, accessibilità e usabilità verificabili, perimetro escluso."
---

# Area funzionale

Quest'area descrive **che cosa il sistema fa**, per chi, a quali condizioni e con quali
conseguenze quando le cose vanno diversamente da come dovrebbero. Non descrive come è
costruito: quello è compito di `docs/02_architecture/`. Non ripete i fondamenti clinici,
normativi e organizzativi: quelli stanno nella guida in `docs/10_fondamenti/` e qui si
rinviano, non si riassumono.

## 1. A chi serve e come si legge

| Se sei… | Leggi in quest'ordine | Perché |
|---|---|---|
| Sviluppatore che deve implementare una storia | [02 - Catalogo dei requisiti](02-catalogo-dei-requisiti.md) → [03 - Casi d'uso](03-casi-d-uso.md) → [04 - Regole di business](04-regole-di-business.md) | il requisito dice *cosa*, il caso d'uso dice *in che ordine*, la regola dice *cosa non è mai lecito* |
| Analista o product owner | [01 - Attori e ruoli](01-attori-e-ruoli.md) → [03](03-casi-d-uso.md) → [07 - Fuori perimetro](07-fuori-perimetro.md) | prima di aggiungere qualcosa, sapere chi la userà e perché qualcosa è stato deliberatamente escluso |
| Responsabile qualità o valutatore di conformità | [02](02-catalogo-dei-requisiti.md) §§ 12-13 (tracciabilità e mappatura) → [04](04-regole-di-business.md) → [05 - Allarmi](05-gestione-degli-allarmi.md) → [06 - Accessibilità e usabilità](06-accessibilita-e-usabilita.md) | è la catena requisito → regola → criterio di accettazione → prova |
| Integratore | [01](01-attori-e-ruoli.md) § 6 (attori non umani) → [02](02-catalogo-dei-requisiti.md) § 12 → [07](07-fuori-perimetro.md) | quali capacità sono esposte, quali limiti non sono aggirabili per configurazione |
| Clinico o direzione sanitaria | [05](05-gestione-degli-allarmi.md) → [04](04-regole-di-business.md) → [07](07-fuori-perimetro.md) | il perimetro di ciò che il sistema decide e di ciò che resta atto professionale |

Chi non ha mai lavorato in sanità digitale deve leggere **prima** i moduli
[02 - Le prestazioni di telemedicina](../10_fondamenti/02-prestazioni-di-telemedicina.md) e
[10 - Percorsi di cura e sicurezza del paziente](../10_fondamenti/10-percorsi-di-cura-e-sicurezza.md)
della guida dei fondamenti. Senza quei due moduli, metà delle scelte documentate qui sembra
arbitraria: in particolare tutto ciò che riguarda soglie, allarmi, silenzio del paziente e
copertura oraria del servizio. Il percorso end-to-end dei processi, con i diagrammi dei flussi
principali e di ripiego, è nel modulo
[14 - Flussi funzionali](../10_fondamenti/14-flussi-funzionali.md).

## 2. I documenti

| File | Contenuto | Identificativi introdotti |
|---|---|---|
| [01 - Attori e ruoli](01-attori-e-ruoli.md) | chi usa il sistema, con quale obiettivo, in quale veste, con quali vincoli reali di tempo, competenza digitale, dispositivo e rete; matrice attore × capacità | `ATT-20` … `ATT-26` |
| [02 - Catalogo dei requisiti](02-catalogo-dei-requisiti.md) | requisiti funzionali e non funzionali con criteri di accettazione verificabili, priorità MoSCoW, tracciabilità verso casi d'uso e regole; mappatura delle 58 conseguenze progettuali del modulo 10 | `RF-230` … `RF-352`, `RNF-090` … `RNF-110` |
| [03 - Casi d'uso](03-casi-d-uso.md) | casi d'uso con precondizioni, flusso principale, flussi alternativi, flussi di errore, postcondizioni, esiti tipizzati | `UC-01` … `UC-24`, `EX-TM-*` |
| [04 - Regole di business](04-regole-di-business.md) | regole con fonte normativa dove esiste e conseguenza della violazione | `BR-100` … `BR-185` |
| [05 - Gestione degli allarmi](05-gestione-degli-allarmi.md) | soglie come configurazione per assistito, ciclo di vita dell'allarme, presa in carico, mancato riscontro, escalation, silenzio del paziente, guasto sistemico | rinvia a `RF-269` … `RF-306` |
| [06 - Accessibilità e usabilità](06-accessibilita-e-usabilita.md) | requisiti verificabili con metodo di verifica e criterio di accettazione operativo; profili di utente reali | rinvia a `RNF-044` … `RNF-054`, `RNF-105` … `RNF-107` |
| [07 - Fuori perimetro](07-fuori-perimetro.md) | ciò che il sistema non fa, perché, e il collegamento alla destinazione d'uso | `OUT-01` … `OUT-24` |

## 3. Che cosa continua a valere dalla fase di ricerca

Il catalogo di quest'area **non riparte da zero**. Gli identificativi `RF-001` … `RF-223`,
`RNF-001` … `RNF-083`, `BR-001` … `BR-096`, `ATT-01` … `ATT-19`, `PRM-*`, `BC-01` … `BC-13` e
`KPI-01` … `KPI-18` sono stati assegnati nella fase di ricerca e **sono congelati**: non
vengono rinumerati, non vengono riassegnati, non cambiano significato. La decisione D45 del
progetto li qualifica come attività retroattivamente irrecuperabile: la tracciabilità richiesta
da IEC 62304 §5.1.1 non si ricostruisce a posteriori, e un identificativo riusato per un
requisito diverso rende inservibile l'intera matrice.

Quest'area **estende** quel catalogo su sei aree che erano dichiarate scoperte e che riguardano
la parte più delicata del dominio - il telemonitoraggio e la sicurezza del paziente:

1. il **piano di telemonitoraggio versionato** e il suo rapporto con il percorso di popolazione;
2. la **finestra di attesa** di una misura e il trattamento della sua scadenza;
3. l'**escalation che termina in un fallimento dichiarato** invece che in una chiusura silenziosa;
4. la **sorveglianza del volume atteso** di misure, che è l'unico modo per accorgersi di un guasto
   che ammutolisce contemporaneamente tutti i pazienti;
5. la **copertura oraria dichiarata** del servizio, trattata come requisito di sicurezza e non
   come parametro commerciale;
6. la **tracciabilità del calcolo** di qualunque punteggio derivato da dati clinici.

Gli intervalli di numerazione nuovi partono da `RF-230`, `RNF-090`, `BR-100` e `ATT-20`
proprio per non intaccare gli intervalli riservati della fase di ricerca, che restano
disponibili per inserimenti nelle aree già coperte.

## 4. Le regole redazionali che quest'area si impone

**Un requisito che non sai come verificare non è un requisito.** Ogni voce del catalogo ha un
criterio di accettazione nella forma *dato / quando / allora*, e ogni requisito non funzionale
ha metrica, soglia, condizione di misura e metodo di verifica. Le formulazioni del tipo «il
sistema deve essere affidabile» sono state escluse per costruzione: non perché siano false, ma
perché non producono un test che possa fallire.

**Nessuna soglia clinica compare in questi documenti.** Non per prudenza redazionale: perché la
soglia è contenuto di un documento sanitario individuale, redatto e firmato da un professionista
(vincolo [V-02](../11_registri/01-vincoli-in-vigore.md#v-02) e decisione D21). Un valore numerico clinico scritto in un documento tecnico
finisce, prima o poi, in una costante. Dove serve un esempio, si usa una lettera o un simbolo.

**Ogni affermazione normativa cita la fonte** con l'atto, l'articolo o l'allegato. Ciò che non è
stato verificato su fonte primaria è marcato `[NV]` con l'indicazione di a chi va chiesto. Ciò
che è una proposta di modellazione del progetto è dichiarato tale e distinto da ciò che la norma
impone.

**Solo dati sintetici.** Nessun esempio contiene dati riferibili a persone reali, nessun codice
fiscale plausibile, nessun nome di struttura esistente. Nessun documento nomina aziende, marchi,
prodotti commerciali o domini di potenziali partner: si usano sempre formule generiche
(regola R0).

## 5. Che cosa questa documentazione non è

Non è una specifica di interfaccia utente: descrive obblighi e vincoli funzionali, non layout.
Non è un manuale d'uso: quello si scrive sul prodotto finito e ha obblighi propri di lingua e
contenuto ai sensi dell'Allegato I MDR. Non è la destinazione d'uso: la dichiarazione formale
di destinazione d'uso e di limiti d'uso è un artefatto autonomo del pacchetto regolatorio
(`MDR-IU-001`), ed è il documento da cui questa area **discende**, non il contrario. Il
capitolo [07 - Fuori perimetro](07-fuori-perimetro.md) è il punto di raccordo fra i due.

> **Avvertenza che vale su tutta l'area.** Il repository non è un dispositivo medico e oggi il
> progetto non appone marcatura CE (decisioni D28, D49, vincolo [V-06](../11_registri/01-vincoli-in-vigore.md#v-06)). Con la decisione D63
> del 26 agosto 2026 il progetto intende assumere il ruolo di fabbricante, ancora da costituire
> come soggetto giuridico: il percorso è avviato e la marcatura è un requisito di prodotto.
> Nessun requisito di questo catalogo può essere letto come attestazione di conformità: sono
> specifiche di prodotto, verificabili, prodotte per l'intero percorso di sviluppo e
> certificazione.
