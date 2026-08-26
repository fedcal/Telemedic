---
title: Area tecnica - indice
sidebar_position: 1
description: Come è realizzato il sistema. Indice dell'area tecnica, percorsi di lettura per profilo, confini rispetto alle altre aree, vincoli posti e questioni lasciate aperte.
---

# Area tecnica

Questa area descrive **come il sistema è realizzato**: quali tecnologie, con quale struttura, con
quali vincoli di esecuzione, con quali limiti misurati o dichiarati. Non descrive **che cosa fa**
il sistema - quello è `docs/03_functional/` - né **perché i confini sono quelli** - quello è
`docs/02_architecture/`.

Il criterio redazionale è uno solo: **ogni scelta è motivata e ogni limite è dichiarato**. Dove
un'informazione non è stata verificata, è marcata `[NV]` e si dice a chi va chiesta. Dove una
decisione non spetta a quest'area, è aperta in bacheca invece di essere inventata.

---

## I dieci capitoli

| # | Capitolo | Che cosa risolve |
|---|---|---|
| 1 | [Stack tecnologico e motivazioni](./01-stack-e-motivazioni.md) | Ogni tecnologia: quale problema risolve, quali alternative sono state scartate e perché, versione minima e sua ragione, classificazione come componente di terze parti, strategia di sostituzione |
| 2 | [Backend](./02-backend.md) | Struttura dei moduli e regole di dipendenza verificate, confini transazionali, concorrenza sui thread virtuali con le sue trappole reali, validazione ai quattro confini, forma degli errori, configurazione tipizzata, profili |
| 3 | [Persistenza](./03-persistenza.md) | Schema per tenant e per contesto, isolamento applicato dal motore, migrazioni versionate e non bloccanti su N tenant, serie temporali, indici e loro costo, registro immutabile a catena di impronte, salvataggio e ripristino |
| 4 | [Frontend](./04-frontend.md) | Architettura a componenti autonomi, tre categorie di stato, macchina a stati della sessione, resilienza di rete, **mobile first e accessibilità come criteri di accettazione verificabili**, internazionalizzazione e separazione dalle etichette di codifica |
| 5 | [Media e tempo reale](./05-media-e-tempo-reale.md) | Segnalazione, negoziazione, relay e sua messa in sicurezza, sicurezza del flusso verificata a runtime, misura della qualità, leve realmente disponibili, registrazione con contenitore negoziato a runtime, prove in rete degradata |
| 6 | [Osservabilità](./06-osservabilita.md) | **Che cosa non si può registrare quando i dati sono sanitari**, registri strutturati, metriche, tracce, correlazione, livelli di severità con criteri operativi, indagine post-incidente |
| 7 | [Prestazioni e capacità](./07-prestazioni-e-capacita.md) | Bilancio di latenza per stadio, percentili invece di medie, unità di dimensionamento, contropressione a quattro livelli, **limiti dichiarati**. Nessuna soglia è presentata come conformità |
| 8 | [Qualità e test](./08-qualita-e-test.md) | Piramide delle prove, prove a contratto, dati sintetici, accessibilità automatica e manuale, prove di carico, copertura minima e differenziata, tracciabilità requisito → prova |
| 9 | [Integrazione continua e rilascio](./09-integrazione-continua-e-rilascio.md) | Pipeline a quattro fasce, tredici controlli obbligatori, versionamento a due cicli di vita, costruzione riproducibile, artefatti firmati, distinta dei materiali, periodo di supporto |
| 10 | [Verifica del sito di documentazione](./10-verifica-sito-di-documentazione.md) | Criterio 6 di `T-07`: la procedura eseguibile e ripetibile che accerta navigazione, ricerca e avviso di traduzione in corso del sito pubblicato, e il registro datato delle sue esecuzioni |

---

## Percorsi di lettura

**Chi deve contribuire al codice del servizio.** Capitoli 1, 2, 3, poi 8. Il capitolo 2 §1 e il
capitolo 3 §2 contengono le regole che una modifica non può violare senza far fallire la
costruzione.

**Chi deve contribuire all'interfaccia.** Capitoli 1 §6, 4, poi 8 §6. I criteri M1-M8 e A1-A10 del
capitolo 4 sono criteri di accettazione, non raccomandazioni.

**Chi deve toccare il piano media.** Prima
[`docs/10_fondamenti/08-webrtc-da-zero.md`](../10_fondamenti/08-webrtc-da-zero.md) per intero, poi
il capitolo 5, poi il capitolo 7 §2. Il capitolo 5 §1 è la prima cosa da leggere: distingue ciò
che il progetto realizza da ciò che appartiene al protocollo e al navigatore.

**Chi deve installare o mandare in esercizio.** Capitoli 1 §14, 3 §9, 6, 7, 9 §§7–11.

**Chi verifica o certifica.** Capitoli 1 §14, 8 §9, 9. Il rapporto di tracciabilità e le
attestazioni sono artefatti di rilascio, non documenti prodotti su richiesta.

**Chi integra dall'esterno.** Questa area non è il punto di ingresso: lo è `docs/07_integration/`.
Qui interessano il capitolo 2 §7 (forma degli errori), il capitolo 8 §3 (prove a contratto) e il
capitolo 9 §5 (versionamento e dismissione).

---

## Confini con le altre aree

| Domanda | Area competente |
|---|---|
| Perché i contesti sono quelli e non altri | `docs/02_architecture/` e la base architetturale §1 |
| Che cosa fa una funzionalità, per chi, con quali regole cliniche | `docs/03_functional/` |
| Come si scrive un messaggio verso un sistema terzo | `docs/04_protocols/` e `docs/07_integration/` |
| Che cosa significa clinicamente un dato | `docs/05_domain/` |
| Modello di minaccia, politiche, gestione delle chiavi | `docs/06_security/` |
| Che cosa richiede la norma e chi risponde | `docs/08_compliance/` |
| Quando accade che cosa | `docs/09_roadmap/` |
| Che cos'è un aggregato, un outbox, un percentile | `docs/10_fondamenti/` |

I rinvii sono espliciti nel testo. Nessun fondamento è ripetuto: se un concetto serve e non è
spiegato, il rinvio porta al modulo che lo spiega da zero.

---

## Vincoli che quest'area impone alle altre

Sono scritti in bacheca e qui riassunti perché condizionano il lavoro altrui.

1. **Due sole rappresentazioni dell'errore** su interfaccia pubblica: rappresentazione del
   problema sul piano applicativo, esito dell'operazione sul piano di interoperabilità. Nessuna
   terza forma. Nessun contenuto clinico né identificativo diretto nel messaggio.
2. **Espandi e contrai su ogni migrazione**: due versioni consecutive devono poter convivere sulla
   stessa base dati. È la condizione dell'aggiornamento senza interruzione e del ritorno a una
   versione precedente.
3. **Contesto di tenant impostato dentro la transazione**, prima di qualunque interrogazione, con
   negazione predefinita in sua assenza.
4. **Nessun contatore cumulativo grezzo** può essere citato come indicatore di qualità: si
   differenziano fra campioni consecutivi.
5. **L'indice di qualità della sessione è proprietario** e va dichiarato tale: non è un punteggio
   di opinione media secondo alcuna raccomandazione internazionale.
6. **Il contenitore di registrazione si negozia a runtime e si registra nei metadati**, anche
   nella registrazione lato server, dove dipende dai codec effettivamente negoziati.

---

## Questioni che quest'area non decide

| Questione | A chi spetta |
|---|---|
| Topologia del segnale a più istanze: instradamento deterministico o affinità di sessione | `ARCH`, con decisione architetturale registrata |
| Limite dichiarato di partecipanti alla sessione media | `ARCH` |
| Regime di licenza dell'estensione per serie temporali, verificato sul testo primario | `COMP` |
| Livello di servizio di aggiornamento dei componenti di terze parti e durata del periodo di supporto | `COMP` e `ROAD` |
| Soglie di qualità come controllo di rischio nel file di gestione del rischio | `COMP` |
| Preferenza di degrado e obiettivo del buffer di jitter come compromessi clinici | `COMP` |
| Quale identificatore di sistema adottare per gli identificativi anagrafici divergenti | `ARCH` e `DOM` |
| Dispositivo di riferimento per le soglie di prestazione dell'interfaccia | `PROD`, con misura a carico di quest'area |

Il registro completo, con lo stato aggiornato, è in
`.telemedic/context/05_BACHECA_INTERAGENTI.md`; il riepilogo del lavoro di quest'area è in
`.telemedic/context/log-TECH.md`.

---

## Avvertenze permanenti

- **Il repository è codice sorgente, non un dispositivo medico**, e lo dichiara. La distribuzione
  è un artefatto distinto, con nome, versione e ciclo di vita propri (D17, capitolo 9 §1).
- **Nessun artefatto è marcato CE**, e ogni artefatto distribuito lo dichiara esplicitamente
  (D16, D49).
- **Nessuna soglia tecnica di quest'area è conformità.** Sono specifiche di prodotto e limiti
  dichiarati (vincolo V-12, capitolo 7 §0).
- **Nessun dato reale** compare in codice, prove, esempi, registri o documentazione. Tutti i
  frammenti di codice e di configurazione sono **illustrativi**, con linguaggio dichiarato, solo
  segnaposto per i segreti e solo dati sintetici.
