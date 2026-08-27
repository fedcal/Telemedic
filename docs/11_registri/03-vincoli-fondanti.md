---
title: Vincoli fondanti
sidebar_position: 4
description: "I sei vincoli architetturali che definiscono Telemedic: sovranità del dato, separazione dal perimetro del dispositivo medico, integrabilità totale, consapevolezza del tenant, auditabilità immutabile, usabilità e accessibilità."
---

# Vincoli fondanti

> **Sei vincoli, e nessuno di essi è negoziabile.**
> Sono citati duecento volte in questa documentazione, in ogni area, come ragione ultima di una
> scelta tecnica. Fino al 27 agosto 2026 erano dichiarati **soltanto nel contesto di lavoro
> interno del progetto**, che non viene pubblicato: chi leggeva «per il vincolo `V1`» non aveva
> alcun modo di sapere che cosa `V1` dicesse. Questo capitolo chiude quella lacuna.

## 1. In che cosa differiscono dai vincoli fra aree

Si scrivono **senza trattino**: `V1`, `V2`, e così via, mai nella forma con il trattino che
contraddistingue le sigle del registro fra aree. La differenza non è ortografica.

I vincoli fra aree, registrati in [Vincoli in vigore](./01-vincoli-in-vigore.md), nascono dal
lavoro: un'area ne emette uno perché ha scoperto qualcosa che le altre devono rispettare, e il
loro numero cresce. I sei vincoli fondanti sono **anteriori a quel lavoro**: derivano dalle
decisioni di indirizzo del progetto, sono in numero chiuso e non si aggiungono. Un vincolo fra
aree può essere emendato dall'area che l'ha emesso; questi no.

Molti vincoli fra aree sono **corollari** di uno di questi sei, e lo dichiarano: `V-164` è il
corollario operativo di `V3`, `V-166` lo è di `V-08`. Quando un corollario e il vincolo fondante
sembrano dire cose diverse, è il fondante a prevalere.

## 2. I sei vincoli

### V1

**Sovranità del dato.** Nessun componente obbligatorio del percorso principale è ospitato fuori
dall'Unione europea, e nessuna dipendenza a tempo di esercizio da servizi stabiliti fuori
dall'Unione può impedire il profilo di dispiegamento più restrittivo. Il flusso media è da pari a
pari; il server di attraversamento è ospitato dal progetto e non da un terzo.

Non è una preferenza politica: è la proprietà che rende dispiegabile il sistema nei tre profili
documentati - Unione europea, territorio italiano, cloud qualificato nazionale - senza riscriverlo.
Il seguito operativo sta in [Sovranità del dato](../00_overview/01-visione-e-obiettivi.md).

### V2

**Separazione dal perimetro del dispositivo medico.** Il confine fra **veicolo di comunicazione**,
che sta fuori dal perimetro diagnostico, e **supporto alla decisione clinica**, che vi sta dentro,
deve essere esplicito nell'architettura e non affidato all'interpretazione di chi legge.

La ragione è puntuale e ha un costo: la **regola 11** dell'allegato VIII del regolamento (UE)
2017/745 classificherebbe in **classe IIa**, con intervento di un organismo notificato, il software
che fornisce informazioni usate per decisioni diagnostiche o terapeutiche. La produzione di un
`DiagnosticReport` è quindi progettata come **persistenza di contenuto redatto dal medico**, mai
come generazione autonoma di informazione clinica. Un solo componente che generasse informazione
clinica sposterebbe l'intero sistema di classe.

### V3

**Integrabilità totale.** Ogni capacità del sistema deve essere raggiungibile da un sistema terzo
tramite interfaccia documentata. **Nessuna funzionalità è accessibile soltanto dall'interfaccia
utente.**

Il corollario operativo è [`V-164`](./01-vincoli-in-vigore.md#v-164): l'area che introduce una
capacità introduce anche il suo contratto, e finché il contratto non esiste la capacità non è
completa. L'interfaccia utente del progetto è un consumatore delle stesse interfacce offerte agli
integratori, non un percorso privilegiato.

### V4

**Consapevolezza del tenant.** Ogni entità di dominio, ogni evento e ogni riga del registro degli
accessi portano l'identificativo di tenant.

Il vincolo è sulla **struttura del dato**, non sul controllo di accesso: un identificativo assente
non si ricostruisce a posteriori, e un evento pubblicato senza di esso non è attribuibile a nessuno.

### V5

**Auditabilità immutabile.** Ogni accesso a dato sanitario è tracciato in modo **non ripudiabile e
non alterabile**.

«Non alterabile» esclude il versionamento delle entità come mezzo sufficiente: chi ha accesso in
scrittura alla base dati può alterare anche le tabelle di versione. Il progetto usa una catena di
impronte con conservazione separata, come stabilisce
[ADR-0013](../adr/0013-registro-immutabile-a-quattro-strati.md).

### V6

**Usabilità, accessibilità, progettazione a partire dal dispositivo mobile.** È un requisito
trasversale a tutto il sistema, non una fase finale.

Ha tre componenti distinte e tutte e tre sono obbligatorie: le WCAG 2.1 AA e la norma EN 301 549
come **requisiti funzionali**, quindi verificabili e non opinabili; la progettazione a partire dal
dispositivo mobile come **metodo**; l'ingegneria dell'usabilità ai sensi della IEC 62366-1 come
**obbligo regolatorio**, perché un errore d'uso in un sistema sanitario è un rischio clinico e non
un fastidio.

## 3. Da dove viene questo testo

La formulazione dei sei vincoli è trascritta dal documento di indirizzo del progetto,
`.telemedic/context/00_PROJECT_BRIEF.md` §7, che resta la fonte. Questo capitolo la **pubblica**,
con le motivazioni già presenti nel corpus, e non la modifica: dove il documento di indirizzo usa
una forma abbreviata, qui si usa la forma per esteso adottata dal resto della documentazione, senza
cambiare ciò che il vincolo impone.
