---
title: Come usare questa guida
sidebar_position: 1
description: Guida formativa che parte da zero per chiunque voglia contribuire a Telemedic — contesto medico-sanitario, protocolli, conoscenze informatiche e cliniche.
---

# Come usare questa guida

Telemedic sta al confine fra due mondi che parlano lingue diverse. Chi arriva
dall'informatica sa costruire un sistema distribuito ma non sa cosa distingue un
teleconsulto da una televisita, né perché quella distinzione cambi il modello dati. Chi
arriva dalla sanità sa cosa succede in un ambulatorio ma non sa perché una videochiamata
attraverso due NAT simmetrici richieda un server di relay.

Questa guida non dà per scontato **nulla** di nessuno dei due mondi.

## Cosa trovi qui

### Blocco A · Il contesto sanitario e normativo

| Modulo | Contenuto |
|---|---|
| [01 — Il sistema sanitario italiano](01-sistema-sanitario-italiano.md) | Come è organizzata la sanità in Italia, chi fa cosa, con quali soldi e con quali regole |
| [02 — Le prestazioni di telemedicina](02-prestazioni-di-telemedicina.md) | Televisita, teleconsulto, teleconsulenza, teleassistenza, telemonitoraggio: definizioni normative, non commerciali |
| [03 — Il dato clinico](03-il-dato-clinico.md) | Cos'è un dato sanitario, perché è una categoria particolare, cosa comporta trattarlo |
| [04 — Identità e anagrafiche](04-identita-e-anagrafiche.md) | Come si identifica un assistito e come si identifica un professionista |

### Blocco B · Standard, dati e trasporto

| Modulo | Contenuto |
|---|---|
| [05 — Gli standard di interoperabilità](05-standard-di-interoperabilita.md) | Perché esistono, chi li scrive, come si leggono |
| [06 — FHIR da zero](06-fhir-da-zero.md) | Lo standard su cui poggia il modello dati del progetto |
| [07 — FSE e infrastrutture nazionali](07-fse-e-infrastrutture-nazionali.md) | Dove finiscono i documenti e con quali intermediari si dialoga |
| [08 — WebRTC da zero](08-webrtc-da-zero.md) | Perché una videochiamata è un problema difficile |

### Blocco C · I fondamenti clinici

| Modulo | Contenuto |
|---|---|
| [09 — Il corpo, i parametri, il ragionamento clinico](09-fondamenti-clinici.md) | Anatomia e fisiologia essenziali, parametri vitali e cosa significano, come ragiona un clinico, cosa si perde a distanza |
| [10 — Percorsi di cura e sicurezza del paziente](10-percorsi-di-cura-e-sicurezza.md) | Cronicità e PDTA, scale e punteggi, triage e segnali d'allarme, rischio clinico ed errore d'uso |

### Blocco D · I fondamenti informatici e i flussi

| Modulo | Contenuto |
|---|---|
| [11 — Fondamenti informatici](11-fondamenti-informatici.md) | Sistemi distribuiti, dati, concorrenza, tempo, consistenza: la teoria che regge l'architettura |
| [12 — Crittografia e sicurezza](12-crittografia-e-sicurezza.md) | Cifratura, firma, PKI, catene di hash, identità e autorizzazione: la teoria prima delle misure |
| [13 — I protocolli, uno per uno](13-protocolli.md) | Catalogo ragionato di ogni protocollo che il progetto parla, con il perché di ciascuno |
| [14 — I flussi funzionali](14-flussi-funzionali.md) | I percorsi end-to-end, dalla prenotazione al fascicolo, allarmi e ripieghi compresi |

### Blocco E · Il quadro di lavoro

| Modulo | Contenuto |
|---|---|
| [15 — Il quadro regolatorio da zero](15-regolatorio-da-zero.md) | Perché il codice di questo progetto ha vincoli che altrove non esistono |
| [16 — L'architettura del progetto](16-architettura-del-progetto.md) | La mappa mentale: dove sta cosa e perché |
| [17 — L'ambiente di sviluppo](17-ambiente-di-sviluppo.md) | Come si mette in piedi tutto, dati sintetici compresi |
| [18 — Cosa sapere per contribuire](18-come-contribuire-per-area.md) | Matrice area del codice → conoscenze richieste |
| [19 — Glossario](19-glossario.md) | Ogni sigla, ogni termine, in italiano e in inglese |
| [20 — Fonti primarie](20-fonti-primarie.md) | Dove leggere i testi originali, non le sintesi |

Il **blocco C** è quello che chi arriva dall'informatica è più tentato di saltare, ed è
quello che paga di più: senza sapere cosa misura una saturazione e perché un valore isolato
non significa nulla, si scrive codice che tratta un parametro vitale come un numero
qualsiasi. Il **blocco D** è il simmetrico per chi arriva dalla clinica.

## Percorsi di lettura

Nessuno legge tutto. Scegli il percorso del tuo profilo.

**Sviluppatore senza background sanitario** — 01, 02, 03, **09**, 04, poi 11 per fissare
il vocabolario architetturale, quindi il modulo dell'area che vuoi toccare (06, 08, 12 o 13),
poi 14 per vedere come si incastra tutto, infine 18. Il modulo 10 diventa obbligatorio se
tocchi telemonitoraggio o allarmi. Il glossario (19) si consulta, non si legge.

**Clinico o professionista sanitario senza background informatico** — 14 per primo, perché
descrive percorsi che riconosci; poi 05, 06 fino alla sezione sulle risorse, 08 fino alla
sezione sulla qualità, 16 e 19. I moduli 09 e 10 falli leggere a noi: il tuo compito è dirci
dove sbagliamo. Il tuo contributo più
prezioso è sui moduli 02 e 03: se leggendoli trovi un'imprecisione, aprire una issue vale
più di dieci righe di codice.

**Integratore che deve collegare un sistema esistente** — 02, 05, 06, 07, 13 e 14, poi
`docs/07_integration/`. I moduli 04 e 12 contano se l'integrazione coinvolge identità,
delega fra organizzazioni o firma dei messaggi.

**Chi si occupa di qualità, conformità o regolatorio** — 02, 03, **10**, 15, poi
`docs/08_compliance/`. I moduli 12 e 14 spiegano rispettivamente le misure tecniche da
verificare e i flussi su cui ricade la gestione del rischio.

## Le regole di questa guida

1. **Ogni sigla è sciolta alla prima occorrenza.** Nessuna eccezione, nemmeno per le più
   note. Chi arriva da un altro paese non sa cosa sia una ASL.
2. **Ogni concetto sanitario è spiegato a un informatico, ogni concetto informatico a un
   clinico.** Se una spiegazione presuppone l'altro mondo, è un difetto: segnalalo.
3. **Ogni affermazione normativa cita la fonte.** Articolo, comma, decreto, RFC, sezione
   dello standard. Le sintesi senza fonte invecchiano male e non sono verificabili.
4. **Ciò che non è verificato è dichiarato tale.** «Il decreto stabilisce» e «è prassi
   diffusa» sono affermazioni di natura diversa e vanno distinte.
5. **Nessun dato reale.** In questa guida, nel codice, nei test, negli esempi e negli
   screenshot compaiono esclusivamente dati sintetici.

## Prima di contribuire

Questa guida è **prerequisito dichiarato** di [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md).
Non è un adempimento burocratico: un sistema che tratta dati sanitari e che ricade nella
disciplina dei dispositivi medici accumula danni silenziosi quando viene modificato da chi
non conosce il contesto. Il modulo [18](18-come-contribuire-per-area.md) dice, area per
area, cosa devi sapere prima di toccarla.
