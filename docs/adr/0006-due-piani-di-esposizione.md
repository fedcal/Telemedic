---
title: "ADR-0006 - Due piani di esposizione sopra un unico modello di dominio"
sidebar_position: 6
description: Perché Telemedic espone una facciata clinica nel formato di scambio e un piano applicativo descritto in un contratto proprio, con una regola di partizione che non ammette eccezioni.
---

# ADR-0006 - Due piani di esposizione sopra un unico modello di dominio

**Stato**: accettata · **Data**: 25 agosto 2026 · **Area**: ARCH
**Vincoli di riferimento**: V3; V-160 e V-164 di bacheca

## Contesto

Telemedic ha due pubblici con esigenze incompatibili.

Il **pubblico clinico** - sistemi sanitari terzi, motori di integrazione, autorità - ha bisogno di
una grammatica che conosce già e che non è stata inventata dal progetto.

Il **pubblico applicativo** - chi realizza l'integrazione nel gestionale - ha bisogno di esprimere
azioni: avviare una sessione, emettere un riferimento di accesso, ruotare una chiave, configurare
una destinazione per i messaggi in uscita, leggere le metriche di una sessione.

Il formato di scambio clinico modella **stati clinici persistenti**, non azioni. Le sue risorse
sono larghe, con decine di elementi facoltativi; la sua semantica di ricerca è potente e fonte
costante di malintesi; la sua forma di invocazione delle operazioni è penalizzante per
un'integrazione applicativa. Un'interfaccia applicativa ben progettata è ergonomica ma nessun
sistema sanitario terzo la conosce.

## Alternative valutate

### Alternativa 1 - Solo la facciata clinica

Tutto è modellato come risorsa del formato di scambio, comprese le capacità di prodotto.

*Vantaggi*: una sola superficie, un solo contratto, un solo modello di autorizzazione.

*Compromessi*: costringerebbe a modellare la stanza virtuale, le metriche del canale e la
configurazione come risorse cliniche. Una metrica del canale modellata come osservazione **finisce
nella cartella clinica di una persona**: è un problema di qualità del dato e, dato il confine fra
registrazione e interpretazione, potenzialmente di qualificazione. **Scartata.**

### Alternativa 2 - Solo il piano applicativo

*Vantaggi*: ergonomia massima; un solo contratto.

*Compromessi*: nessun sistema sanitario terzo lo conosce; ogni integrazione richiederebbe un
adattatore scritto dall'integratore. Contraddice la ragione stessa per cui il progetto esiste.
**Scartata.**

### Alternativa 3 - Due piani sopra un solo modello di dominio

*Vantaggi*: ciascun pubblico riceve la grammatica adatta; nessuna forzatura semantica.

*Compromessi*: due contratti, due insiemi di prove, il rischio di divergenza semantica fra le due
rappresentazioni dello stesso concetto.

## Decisione

**Si adotta l'alternativa 3**, con una regola di partizione che non ammette eccezioni:

> Se il concetto ha un equivalente clinico riconosciuto e deve poter essere consumato da un sistema
> sanitario terzo che non conosce Telemedic → **piano clinico**.
> Se il concetto è una capacità del prodotto → **piano applicativo**.

| | Piano clinico | Piano applicativo |
|---|---|---|
| Contratto | Profili e documento di capacità | Documento di interfaccia applicativa |
| Versionamento | È la versione del formato di scambio, dichiarata; non si versiona con un numero proprio | Versione maggiore nel percorso |
| Esiti di errore | Nella forma prevista dal formato clinico | Nella forma dei dettagli di problema |
| Pubblico | Sistemi sanitari terzi, autorità | Sviluppatori dell'integrazione |

Vincoli aggiuntivi:

1. **Un solo modello di dominio sotto entrambi.** Nessuna logica di dominio nei piani di
   esposizione: sono adattatori sottili.
2. **Nessuna capacità esiste su un solo piano se appartiene a entrambi i pubblici.** Dove un
   concetto è di interesse per entrambi, esiste su entrambi con prove di equivalenza semantica.
3. **Nessuna capacità raggiungibile solo dall'interfaccia utente**, corollario del vincolo di
   integrabilità totale: l'area che introduce una capacità introduce anche il contratto.
4. **Le metriche del canale non sono osservazioni cliniche** e vivono solo sul piano applicativo.

## Conseguenze

**Positive**

- La cartella clinica non viene inquinata da artefatti tecnici.
- L'integratore usa la grammatica adatta al proprio compito senza pagare la complessità dell'altra.
- La superficie clinica resta piccola e conforme, quindi validabile contro i profili.

**Negative, accettate**

- Due contratti da mantenere e da documentare.
- Due modelli di autorizzazione da tenere coerenti: gli ambiti del piano clinico seguono la forma
  del formato di scambio, quelli del piano applicativo sono ambiti propri. Le capacità applicative
  **non vanno mascherate** da ambiti clinici: sarebbe un abuso semantico e renderebbe impossibile
  revocare l'una senza l'altra.
- Serve una regola di partizione applicata con disciplina, perché ogni caso limite invita a
  duplicare.

**Casi limite già risolti**

| Concetto | Piano |
|---|---|
| L'atto clinico | Clinico |
| La sessione media e i suoi stati | Applicativo |
| Il referto | Clinico |
| Il consenso come stato | Clinico; il flusso di raccolta è applicativo |
| Le metriche del canale | Applicativo |
| Configurazione, aspetto, quote, chiavi | Applicativo |
| Il materiale registrato | Applicativo, con eventuale indicizzazione documentale nel piano clinico |

## Riferimenti

[04 - Modello dati](../02_architecture/04-modello-dati.md#22-che-cosa-passa-da-fhir-e-che-cosa-no) ·
ADR-0003 · ADR-0021
