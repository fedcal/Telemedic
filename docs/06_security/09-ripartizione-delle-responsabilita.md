---
title: Ripartizione delle responsabilità
sidebar_position: 10
description: Misura per misura, che cosa è del progetto, che cosa è di chi installa e che cosa è condiviso. Il documento che evita a un cliente di credersi coperto quando non lo è.
---

# Ripartizione delle responsabilità

> ## Avvertimento, in testa e non in nota
>
> **Nessuno degli adempimenti verso l'autorità è del fornitore.**
>
> Non la registrazione sul portale. Non la dichiarazione annuale. Non la designazione del punto
> di contatto, del suo sostituto e del referente per il coordinamento con la struttura nazionale
> di risposta agli incidenti. Non la dichiarazione dei fornitori rilevanti. Non l'approvazione
> degli undici documenti da parte degli organi di amministrazione e direttivi. Non l'adozione
> documentalmente dimostrabile delle misure di sicurezza di base. **Non la notifica degli
> incidenti.**
>
> Il fornitore **non può adempierli, non può attestarli, e nessuna clausola contrattuale li
> sposta.** Ciò che il fornitore può fare - e che questo capitolo elenca - è **produrre le
> evidenze** che il soggetto obbligato incorpora nei propri piani, e **fornire le capacità
> tecniche** senza le quali quegli adempimenti non sono materialmente eseguibili.
>
> Questo capitolo esiste per una ragione sola: **evitare che un cliente si creda coperto dove
> non lo è.** È il documento da leggere prima di firmare, non dopo un'ispezione.

## 1. Le tre categorie, e che cosa significano davvero

| Sigla | Significato | Che cosa comporta per l'altra parte |
|---|---|---|
| **P** | **Progetto**: la misura è attuata dal prodotto o dalla sua documentazione. Chi installa la eredita | Chi installa deve **verificare** che la configurazione distribuita non l'abbia disattivata, e conservare l'evidenza |
| **D** | **Chi installa**: la misura riguarda l'organizzazione, i processi, le persone o l'infrastruttura del soggetto obbligato. Il prodotto non può attuarla | Il progetto può fornire **procedure, modelli e capacità tecniche**; non può sostituirsi |
| **P+D** | **Condivisa**: entrambe le parti hanno una porzione, e **la porzione dell'una non copre quella dell'altra** | È la categoria in cui nascono i fraintendimenti: va letta riga per riga |

Una responsabilità marcata **P** non significa che il cliente non debba fare nulla: significa
che ciò che deve fare è **verificare e documentare**, non implementare. Una responsabilità
marcata **D** non significa che il progetto si disinteressi: significa che il suo contributo è
documentale.

## 2. Avvertenza sulla forma di questa tabella

**Questione Q-151.** Gli allegati di dettaglio della determinazione dell'autorità nazionale non
sono stati letti riga per riga. Ne discende che questa tabella:

- riporta i **codici** delle 43 misure, che sono verificati, e la loro ripartizione fra soggetti
  importanti ed essenziali, che è verificata;
- riporta una **descrizione tematica** di ciascuna misura, che segue la categoria del quadro
  nazionale di riferimento da cui i codici derivano;
- **non riporta il testo dei singoli requisiti**: `[NV]`. La colonna «contributo del progetto»
  descrive che cosa il prodotto fornisce, non che cosa il requisito prescrive.

Prima della pubblicazione della matrice di conformità definitiva, la tabella va completata con
il testo dei 116 requisiti. Fino ad allora è **una ripartizione tematica affidabile e una
citazione normativa incompleta**, e va usata come tale.

Legenda della colonna «Ambito»: **I+E** misura prevista per soggetti importanti ed essenziali ·
**E** misura prevista **solo** per i soggetti essenziali · **I+E\*** misura comune con requisiti
**aggiuntivi** per i soli essenziali.

## 3. Governo e organizzazione

| Misura | Tema | Ambito | Resp. | Contributo del progetto |
|---|---|---|:-:|---|
| `GV.OC-04` | Individuazione ed elenco dei sistemi rilevanti | I+E | **D** | Descrizione dei componenti, dei flussi e delle interfacce, perché il cliente possa perimetrare correttamente ciò che il prodotto introduce |
| `GV.RM-03` | Integrazione della gestione del rischio informatico nei processi | I+E | **D** | Registro dei rischi del prodotto e modello delle minacce ([01](./01-modello-di-minaccia.md)), riusabili come ingresso |
| `GV.RR-02` | Organizzazione per la sicurezza informatica, con ruoli e responsabilità | I+E | **D** | Questa tabella, come ingresso alla ripartizione fornitore/cliente |
| `GV.RR-04` | Sicurezza e affidabilità del personale | I+E\* | **D** | - |
| `GV.PO-01` | Politiche di sicurezza informatica | I+E | **D** | Configurazione di riferimento e vincoli tecnici che le politiche devono riflettere |
| `GV.PO-02` | Riesame e aggiornamento delle politiche | I+E\* | **D** | Avvisi di sicurezza e note di rilascio come evento che innesca il riesame |

## 4. Catena di approvvigionamento

| Misura | Tema | Ambito | Resp. | Contributo del progetto |
|---|---|---|:-:|---|
| `GV.SC-01` | Programma e processi di gestione del rischio della catena di fornitura | I+E\* | **P+D** | **Il progetto è il fornitore valutato.** Fornisce distinta dei materiali, dichiarazione di esposizione, politica di divulgazione, documentazione di sviluppo sicuro, periodo di supporto dichiarato ([07](./07-catena-di-fornitura.md)) |
| `GV.SC-02` | Ruoli e responsabilità verso fornitori e terze parti | I+E | **D** | Ripartizione documentale (questo capitolo) |
| `GV.SC-04` | Individuazione e prioritizzazione dei fornitori | I+E | **D** | Dati identificativi, Paese della sede legale e codici della nomenclatura degli appalti, in forma riutilizzabile ([07 §3](./07-catena-di-fornitura.md)) |
| `GV.SC-05` | Requisiti di sicurezza nei contratti con i fornitori | I+E | **P+D** | Modello di accordo sul trattamento **negoziabile** nelle clausole di responsabilità; clausole tecniche di notifica e di rapporto ([10](./10-risposta-agli-incidenti.md)) |
| `GV.SC-07` | Monitoraggio del rischio dei fornitori nel tempo | I+E | **D** | Avvisi di sicurezza, dichiarazione di esposizione aggiornata, registro delle manutenzioni |

## 5. Inventario e valutazione del rischio

| Misura | Tema | Ambito | Resp. | Contributo del progetto |
|---|---|---|:-:|---|
| `ID.AM-01` | Inventario degli apparati fisici | I+E | **D** | Requisiti minimi di hardware e di rete, come impone l'Allegato I § 17.4 della disciplina dei dispositivi |
| `ID.AM-02` | Inventario dei sistemi e delle applicazioni software | I+E | **P+D** | **Distinta dei materiali generata dalla pipeline e firmata**: è la parte che il cliente non può ricostruire ([07 §2](./07-catena-di-fornitura.md)) |
| `ID.AM-03` | Inventario dei flussi di rete | **E** | **P+D** | **Elenco dei flussi verso l'esterno** con i cinque attributi richiesti: indirizzo sorgente, indirizzo destinazione, protocollo di trasporto, porta di destinazione, protocollo applicativo. È parte del fascicolo di conformità |
| `ID.AM-04` | Inventario dei servizi erogati dai fornitori | I+E | **P+D** | Descrizione dei servizi erogati, in forma incorporabile nell'inventario del cliente |
| `ID.RA-01` | Individuazione e registrazione delle vulnerabilità | I+E\* | **P+D** | Dichiarazione di esposizione; avvisi; monitoraggio delle correzioni con valutazione **entro il giorno successivo** al rilascio |
| `ID.RA-05` | Valutazione del rischio, approvata dagli organi direttivi | I+E\* | **D** | Modello delle minacce e registro dei rischi come ingresso |
| `ID.RA-06` | Piano di trattamento del rischio | I+E | **D** | **Dichiarazione tecnica di deroga** con le misure compensative, senza la quale la deroga sugli endpoint non è chiudibile ([08 §6](./08-quadro-normativo-e-misure.md)) |
| `ID.RA-08` | Piano di gestione delle vulnerabilità, approvato dagli organi direttivi | I+E\* | **P+D** | **È uno dei due documenti non redigibili senza il fornitore**: il piano deve tenere conto delle vulnerabilità delle dipendenze del prodotto |
| `ID.IM-01` | Valutazione dell'efficacia delle misure e piano di adeguamento | I+E\* | **D** | Esiti delle verifiche automatiche, delle prove di ripristino e dell'audit di terza parte |
| `ID.IM-04` | Piani di continuità operativa, ripristino e gestione delle crisi | I+E | **P+D** | Procedura completa di copia e ripristino - sistema, applicazione, base dati, configurazioni, **materiale di chiave** - con obiettivi dichiarati e almeno una esecuzione documentata in collaudo |

## 6. Identità, accessi e formazione

| Misura | Tema | Ambito | Resp. | Contributo del progetto |
|---|---|---|:-:|---|
| `PR.AA-01` | Gestione delle identità e delle credenziali | I+E | **P+D** | Utenze individuali e censite; nessuna utenza anonima o condivisa; blocco dopo tentativi falliti con registrazione di ciascuno; cambio obbligatorio della credenziale iniziale ([02 §11](./02-identita-e-accessi.md)) |
| `PR.AA-03` | Autenticazione, anche a più fattori | I+E | **P+D** | **Secondo fattore imposto** sulle utenze amministrative e sull'accesso remoto; federazione sui tre canali nazionali; livello configurabile per tenant e per operazione |
| `PR.AA-05` | Definizione e applicazione dei permessi di accesso | I+E | **P+D** | **Autorizzazione fondata sulla relazione di cura**, non sul solo ruolo; separazione completa fra utenze privilegiate e non; revoca al variare del rapporto ([02 §9](./02-identita-e-accessi.md)) |
| `PR.AA-06` | Controllo dell'accesso fisico | I+E | **D** | - |
| `PR.AT-01` | Formazione del personale, con piano approvato | I+E | **D** | Documentazione operativa, materiale sull'uso corretto dell'accesso d'emergenza e sull'interpretazione degli allarmi |
| `PR.AT-02` | Formazione specialistica per ruoli con responsabilità di sicurezza | **E** | **D** | Documentazione tecnica di configurazione e di risposta |

## 7. Protezione dei dati, dei sistemi e delle infrastrutture

| Misura | Tema | Ambito | Resp. | Contributo del progetto |
|---|---|---|:-:|---|
| `PR.DS-01` | Protezione dei dati a riposo | I+E | **P+D** | Cifratura a riposo dei contenuti e delle registrazioni, **chiavi per tenant separabili dal dato**; gerarchia a tre livelli con cancellazione crittografica ([03 §§3, 4](./03-protezione-dei-dati.md)). **La custodia della chiave radice è di chi installa** |
| `PR.DS-02` | Protezione dei dati in transito | I+E | **P** | Copertura totale delle quattro categorie imposte dall'Accordo Stato-Regioni; declassamento impedito; **versione negoziata misurata e registrata**, non dichiarata ([03 §2](./03-protezione-dei-dati.md)) |
| `PR.DS-11` | Copie di sicurezza create, protette, mantenute e verificate | I+E\* | **P+D** | Procedura documentata, obiettivi di ripristino dichiarati, capacità di cifratura. **L'esecuzione, la copia non raggiungibile in permanenza dal sistema e la prova periodica di ripristino sono di chi installa** |
| `PR.PS-01` | Configurazioni sicure di riferimento | **E** | **P+D** | Configurazione di riferimento per ciascun componente; **sicurezza per impostazione predefinita**; rilevazione delle deviazioni; ripristino alla configurazione di riferimento |
| `PR.PS-02` | Manutenzione e aggiornamento del software | I+E\* | **P+D** | Rilascio degli aggiornamenti su canale autenticato, **a titolo gratuito**; ambiente e procedura di collaudo; **l'applicazione è di chi installa** |
| `PR.PS-03` | Manutenzione e aggiornamento dell'hardware | **E** | **D** | - |
| `PR.PS-04` | Generazione e conservazione dei registri | I+E | **P** | **Registro a sola aggiunta con catena di impronte e conservazione separata**, esportazione in formato aperto con impronta, 24 e 12 mesi ([04](./04-tracciamento.md)) |
| `PR.PS-06` | Sicurezza nel ciclo di vita dello sviluppo software | I+E | **P** | Ciclo di vita documentato, modello delle minacce tracciabile, verifiche automatiche a ogni proposta di modifica ([07 §5](./07-catena-di-fornitura.md)) |
| `PR.IR-01` | Protezione delle reti e degli ambienti | I+E | **P+D** | Configurazione di riferimento della segmentazione; **isolamento di rete in uscita del relay** e **negazione di rotta ai componenti applicativi** ([05 §4](./05-sicurezza-del-tempo-reale.md), [06 §8](./06-sicurezza-applicativa.md)). **Le regole di rete sono di chi installa** |
| `PR.IR-03` | Resilienza e comunicazioni protette | **E** | **P** | **È la misura che questo prodotto attua per il cliente**: comunicazioni vocali, video e testuali protette ([08 §4.2](./08-quadro-normativo-e-misure.md)) |

## 8. Rilevazione

| Misura | Tema | Ambito | Resp. | Contributo del progetto |
|---|---|---|:-:|---|
| `DE.CM-01` | Monitoraggio continuo di reti e servizi, con parametri di rilevazione | I+E\* | **P+D** | Indicatori quantitativi e qualitativi sugli accessi, **misurazione e storicizzazione della disponibilità** per tenant e servizio, esportazione degli eventi verso il sistema di correlazione ([04 §7](./04-tracciamento.md)). **La definizione dei livelli di servizio attesi e la correlazione sono di chi installa** |
| `DE.CM-09` | Monitoraggio di dispositivi e software per il rilevamento di codice malevolo | I+E | **P+D** | **È la misura del conflitto riconosciuto.** Il progetto fornisce la dichiarazione tecnica di deroga, l'elenco delle misure compensative native e la configurazione supportata di protezione sull'host ([08 §6](./08-quadro-normativo-e-misure.md)) |

## 9. Risposta e ripristino

| Misura | Tema | Ambito | Resp. | Contributo del progetto |
|---|---|---|:-:|---|
| `RS.MA-01` | Piano per la gestione degli incidenti, approvato dagli organi direttivi | I+E | **P+D** | Procedura di risposta del fornitore raccordata con quella del cliente, canale e termini di notifica, modello di rapporto ([10](./10-risposta-agli-incidenti.md)) |
| `RS.CO-02` | Comunicazione durante l'incidente | I+E | **P+D** | **Notifica al cliente sotto le 24 ore** e immediata per gli incidenti di gravità elevata; **rapporto entro il giorno successivo** con la sequenza temporale degli eventi |
| `RC.RP-01` | Ripristino a seguito di incidente | I+E | **P+D** | Procedura di ripristino e assunzione di responsabilità sulle bonifiche conseguenti a una vulnerabilità del prodotto |
| `RC.CO-03` | Comunicazione del ripristino | **E** | **D** | Evidenze tecniche del ripristino avvenuto |

## 10. Riepilogo: come si distribuiscono le 43 misure

| Categoria | Numero | Che cosa significa in pratica |
|---|:-:|---|
| **P** - attuate dal prodotto | **5** | `PR.DS-02`, `PR.PS-04`, `PR.PS-06`, `PR.IR-03`, e - per la sola parte di produzione dell'artefatto - la distinta dei materiali dentro `ID.AM-02`. Il cliente verifica e documenta |
| **P+D** - condivise | **20** | La maggioranza. Sono le righe in cui il fraintendimento è più costoso, perché **la porzione del fornitore non copre quella del cliente** |
| **D** - di chi installa | **18** | Governo, personale, formazione, sicurezza fisica, valutazione del rischio, continuità, correlazione degli eventi, e **tutti gli adempimenti verso l'autorità** |

**Nessuna misura è a carico del solo fornitore in senso liberatorio per il cliente.** Anche le
cinque marcate **P** richiedono al cliente di verificare che la configurazione distribuita non
sia stata alterata e di conservarne l'evidenza: la misura è del cliente, l'attuazione tecnica è
del prodotto.

## 11. Gli adempimenti che restano interamente di chi installa

Vanno elencati separatamente, perché la loro assenza dalla tabella delle misure li rende
invisibili.

| Adempimento | Quando | Chi |
|---|---|---|
| Registrazione e dichiarazione annuale sul portale dell'autorità | Finestra annuale di inizio anno | **Chi installa** |
| Aggiornamento annuale delle informazioni | Finestra annuale di primavera | **Chi installa** |
| **Dichiarazione dei fornitori rilevanti**, con Paese della sede legale e codici della nomenclatura degli appalti | Finestra annuale di primavera | **Chi installa**; il progetto ne è il **soggetto dichiarato** e fornisce i dati |
| Designazione del punto di contatto, del sostituto e del referente per il coordinamento con la struttura nazionale di risposta | Secondo le finestre | **Chi installa** |
| Nomina del referente per la cybersicurezza, per le amministrazioni e le aziende sanitarie | Vigente | **Chi installa** |
| Approvazione degli **undici documenti** da parte degli organi di amministrazione e direttivi | Entro il termine per le misure | **Chi installa** |
| Adozione documentalmente dimostrabile delle 37 o 43 misure | **Diciotto mesi dalla comunicazione di inserimento** | **Chi installa** |
| **Notifica degli incidenti significativi** | 24 h / 72 h / un mese | **Chi installa**; il progetto fornisce l'evidenza e notifica **al cliente** sotto le 24 ore |
| Segnalazione ai sensi della legge nazionale, per le amministrazioni e le aziende sanitarie | 24 h / 72 h | **Chi installa** |
| **Valutazione d'impatto sulla protezione dei dati** | Prima del trattamento | **Chi installa**, come titolare. Il progetto fornisce il materiale strutturale ([03](./03-protezione-dei-dati.md)) |
| **Determinazione dei termini di conservazione** della documentazione sanitaria | Vigente | **Chi installa**; il prodotto li rende configurabili, non li decide |
| **Definizione dei livelli di servizio attesi** ai fini della rilevazione | Entro il termine per le misure | **Chi installa**; il prodotto li misura ([10 §5](./10-risposta-agli-incidenti.md)) |
| **Scelta del livello di garanzia** per i propri servizi e sua motivazione in sede di convenzione | All'adesione | **Chi installa**, che è il fornitore di servizi (V-05) |
| Applicazione degli aggiornamenti rilasciati | Secondo la propria politica | **Chi installa** |
| Esecuzione delle copie di sicurezza e **prova periodica di ripristino** | Programmata | **Chi installa** |
| **Regole di rete** che negano l'uscita ai componenti applicativi e isolano il relay | All'installazione | **Chi installa**; il prodotto le documenta e le verifica all'avvio, **rifiutando l'avvio** se un componente applicativo scopre di avere rotta verso l'esterno; dove la verifica non è tecnicamente possibile, l'omissione si dichiara e non vale come verifica superata ([06 §8.5](./06-sicurezza-applicativa.md)) |

## 12. Ciò che il progetto consegna, in un elenco

Perché la tabella sia utilizzabile, gli artefatti a cui rinvia devono esistere. Sono questi, e
sono la traduzione operativa delle colonne «contributo del progetto»:

1. **Fascicolo di conformità** per rilascio: distinta dei materiali firmata, dichiarazione di
   esposizione, elenco dei flussi di rete verso l'esterno con i cinque attributi, elenco dei
   sistemi accessibili da remoto, configurazioni di riferimento.
2. **Questa tabella**, completata con il testo dei requisiti dopo la chiusura di Q-151.
3. **Dichiarazione tecnica di deroga** sulla protezione degli endpoint, con le misure
   compensative native e la configurazione supportata.
4. **Modello di accordo sul trattamento negoziabile**, con allegato tecnico delle misure.
5. **Dati per la dichiarazione dei fornitori rilevanti**: denominazione, identificativo fiscale,
   Paese della sede legale, codici della nomenclatura degli appalti, criterio di rilevanza.
6. **Periodo di supporto dichiarato** per ciascun rilascio maggiore, con data di fine.
7. **Politica di divulgazione coordinata** e avvisi di sicurezza pubblicati.
8. **Procedura di copia e ripristino** completa, materiale di chiave compreso, con obiettivi
   dichiarati.
9. **Modello di rapporto di incidente** conforme al requisito sulla sequenza temporale degli
   eventi, e canale di notifica concordato.
10. **Registro delle manutenzioni, dei collaudi e dei controlli** effettuati, esportabile.
11. **Tabella artefatto → regime applicabile**, quando Q-10 sarà chiusa.
12. **Documentazione di sviluppo sicuro**: ciclo di vita, modello delle minacce, esiti delle
    verifiche automatiche, esito dell'audit di terza parte.

## 13. Che cosa quest'area lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| Q-151 | Completamento della tabella con il testo dei 116 requisiti, dopo la lettura degli allegati di dettaglio (§2) | Conformità |
| Q-20 | Revisione della ripartizione dei ruoli fra titolare, responsabile, fabbricante, fornitore di servizi di identità e soggetto obbligato, prima della pubblicazione | Conformità |
| Q-154 | Se l'operatore del servizio gestito diventa soggetto obbligato in proprio, **le righe marcate D della tabella diventano sue**. È il cambiamento di perimetro più significativo che il progetto possa subire | → Committente |
