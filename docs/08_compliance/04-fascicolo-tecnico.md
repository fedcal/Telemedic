---
title: Fascicolo tecnico
sidebar_position: 5
description: "Che cosa contiene il fascicolo tecnico dell'Allegato II e dell'Allegato III, voce per voce, e quale documento di questo repository alimenta ciascuna voce. Che cosa manca oggi, che cosa solo chi assume il ruolo di fabbricante può aggiungere, e perché l'organismo notificato è il fattore che determina il calendario."
---

# Fascicolo tecnico

> **Presupposto di lettura.** Che cosa sia un fascicolo tecnico, perché esista, che rapporto abbia
> con la marcatura CE e con l'organismo notificato è spiegato da zero in
> [10 §15 — Il quadro regolatorio da zero, §4](../10_fondamenti/15-regolatorio-da-zero.md).
> **Qui non si ripete: si mappa.** Questo capitolo risponde a una sola domanda, ripetuta per ogni
> voce dell'Allegato II e dell'Allegato III: *quale documento la soddisfa, esiste già, e chi può
> produrlo*.
>
> **Avvertenza di perimetro, che governa ogni riga.** Il progetto **non è fabbricante** (`D28`,
> `D49`) e **non appone la marcatura CE**. Ciò che segue non è il fascicolo tecnico di un
> dispositivo: è **la mappa del fascicolo che chi certifica dovrà comporre**, con l'indicazione di
> quali tessere il progetto fornisce già, quali si impegna a produrre e quali **non può fornire in
> nessun caso**, perché presuppongono un soggetto giuridico, una firma e una responsabilità che il
> progetto non ha.
>
> **Avvertenza di metodo.** Questo capitolo è analisi tecnica di conformità, non consulenza
> regolatoria. I numeri di sezione dell'Allegato II qui usati derivano dalla ricerca interna del
> progetto e **vanno riverificati sul testo consolidato** prima di comparire in un documento
> controllato: dove la verifica non è stata compiuta, la voce è marcata `[NV]`.

## 1. Che cosa è il fascicolo tecnico, e che cosa non è

Il fascicolo tecnico è l'insieme documentale con cui il fabbricante dimostra che il dispositivo
soddisfa i requisiti generali di sicurezza e prestazione. La sua struttura è imposta
dall'**Allegato II** del Regolamento (UE) 2017/745, integrata dall'**Allegato III** per la parte
di sorveglianza post-commercializzazione. L'**art. 10, paragrafo 4** impone di redigerlo e di
**tenerlo aggiornato**: non è un adempimento di consegna, è un obbligo continuativo che dura
quanto il dispositivo. Il regolamento impone inoltre di tenerlo a disposizione delle autorità per
un periodo di anni successivo all'immissione sul mercato dell'ultimo dispositivo `[NV]` — la
durata esatta e il paragrafo che la stabilisce vanno riverificati sul testo consolidato.

Tre equivoci vanno tolti di mezzo subito, perché tutti e tre sono frequenti in un gruppo di
sviluppo che si affaccia per la prima volta a questo materiale.

**Primo equivoco: il fascicolo tecnico non è «la documentazione del prodotto».** Una
documentazione tecnica eccellente, come quella che questo repository produce, **non è** un
fascicolo tecnico e non lo diventa per accumulo. La differenza non sta nella qualità del
contenuto ma in tre proprietà formali che il contenuto non possiede da solo:

1. **è controllato** — ogni documento ha un identificativo, una revisione, un autore, un
   approvatore, una data di approvazione e una procedura che governa la sua modifica;
2. **è navigabile** — esiste un punto d'ingresso, la matrice dei requisiti generali di sicurezza e
   prestazione, da cui si raggiunge ogni evidenza con un riferimento a una revisione **esatta**;
3. **è attribuito** — ha un soggetto che se ne assume la responsabilità, e quel soggetto è il
   fabbricante.

Nessuna delle tre proprietà appartiene alla documentazione pubblicata in queste pagine. È il
vincolo `V-174`, istituito da [03 §4.1](./03-sistema-di-gestione-della-qualita.md): **nessun
capitolo di questa documentazione è un documento del fascicolo, e nessuna area può presentarlo
come tale.** I capitoli sono **ingressi**: contengono l'analisi da cui il documento del fascicolo
si scrive, non il documento.

**Secondo equivoco: il fascicolo non è un archivio, è una dimostrazione.** L'organismo notificato
non legge il fascicolo dall'inizio alla fine. Entra dalla matrice dei requisiti generali (sezione
4 dell'Allegato II), sceglie alcune righe e le percorre fino all'evidenza. Se il percorso si
interrompe — riferimento a un documento senza revisione, revisione che non corrisponde, evidenza
che dimostra qualcosa di diverso da ciò che la riga afferma — il rilievo non riguarda la riga:
riguarda **l'affidabilità dell'intero fascicolo**, perché il campione era casuale. Un fascicolo
completo e non navigabile produce più rilievi di un fascicolo più magro e coerente.

**Terzo equivoco: la parte software del fascicolo non è «il codice».** Il codice non entra nel
fascicolo. Entrano il piano di sviluppo, la specifica dei requisiti, l'architettura, i criteri di
accettazione, gli esiti di verifica riferiti a una versione, la matrice di tracciabilità, la
distinta dei materiali, la gestione dei componenti di terze parti e le anomalie residue con la
loro valutazione. È materiale che si produce **mentre** si sviluppa e che, come dimostra
[03 §7](./03-sistema-di-gestione-della-qualita.md), non si ricostruisce dopo.

## 2. La struttura, in quattro insiemi

| Insieme | Contenuto | Base | Chi lo può comporre |
|---|---|---|---|
| **A** | Documentazione tecnica del dispositivo, sezioni 1–6 | Allegato II | Fabbricante, con materiale del progetto |
| **B** | Documentazione tecnica sulla sorveglianza post-commercializzazione | Allegato III | Fabbricante, con capacità di prodotto del progetto |
| **C** | Documenti che **non appartengono** al fascicolo ma che l'organismo notificato richiede con la domanda | Allegato IX, artt. 15, 19; ISO 13485 | **Solo** il fabbricante |
| **D** | Materiale che il progetto produce e che **non è** un documento del fascicolo, ma da cui i documenti del fascicolo si redigono | — | Progetto |

L'insieme D è la ragione per cui questo capitolo esiste. Se il progetto pubblicasse solo codice,
chi volesse certificare dovrebbe **ricostruire per inferenza** il ragionamento di progetto, di
rischio e di verifica — operazione interpretativa che un organismo notificato non ha motivo di
accettare. Se invece il progetto pubblica l'analisi, chi certifica **la riesamina, la corregge, la
approva e la firma**: è un'operazione di ordini di grandezza più breve e, soprattutto, è
un'operazione ammissibile.

## 3. Legenda della mappatura

Le tabelle dei §§ 4–10 usano tre colonne stabili.

**Documento regolatorio.** L'identificativo del documento del fascicolo, nello spazio di
identificativi istituito da [03 §5](./03-sistema-di-gestione-della-qualita.md) e reso vincolante
come `V-172`. Un identificativo qui elencato **non implica che il documento esista**: implica che,
quando esisterà, si chiamerà così.

**Alimentato da.** Il materiale già presente in questo repository che fornisce il contenuto
sostanziale del documento. È il valore aggiunto del progetto ed è verificabile: sono percorsi
reali di file esistenti.

**Attribuzione.** Chi può produrre l'elemento:

| Simbolo | Significato |
|:-:|---|
| **P** | Il **progetto** lo produce integralmente. Chi certifica lo riesamina e lo approva |
| **P/F** | Il progetto produce il contenuto tecnico; **il fabbricante** lo compila con dati che solo lui possiede, lo approva e lo firma |
| **F** | **Solo il fabbricante.** Il progetto non può produrlo, né in bozza, senza compiere un atto che non gli compete |

**Stato**, alla data di questo capitolo: `☑` disponibile · `◐` parzialmente coperto · `☐` da
produrre.

> **Una precisazione che evita un errore di lettura ricorrente.** Uno stato `☑` significa che il
> **contenuto** esiste in forma verificabile, non che esista il documento controllato. Nessun
> documento del fascicolo esiste oggi come documento controllato, per la ragione dichiarata al
> § 1: il progetto non ha un sistema di controllo dei documenti di un fabbricante, e non può
> averlo senza essere un fabbricante.

## 4. Allegato II, sezione 1 — Descrizione e specifica del dispositivo

È la sezione che definisce **di che cosa si sta parlando**. Ogni errore commesso qui si propaga a
tutto il resto: la destinazione d'uso determina la classe, la classe determina la procedura, la
procedura determina i tempi e i costi.

| Voce | Contenuto richiesto | Documento regolatorio | Alimentato da | Attr. | Stato |
|---|---|---|---|:-:|:-:|
| 1.1 a | Denominazione del prodotto e descrizione generale, con destinazione d'uso e utilizzatori previsti | `MDR-IU-001` | [02 §5.1](./02-qualificazione-e-classificazione.md) (struttura della traccia), [03_functional/01](../03_functional/01-attori-e-ruoli.md) | P/F | ◐ |
| 1.1 b | **UDI-DI di base** attribuito dal fabbricante | `UDI-001` | — | **F** | ☐ |
| 1.1 c | Popolazione di pazienti, condizioni cliniche, indicazioni, controindicazioni, avvertenze | `MDR-IU-001` §§ 3, 5, 9 | [05_domain/02](../05_domain/02-le-prestazioni-modellate.md), [05_domain/08](../05_domain/08-percorsi-e-piani-di-cura.md), [03_functional/07](../03_functional/07-fuori-perimetro.md) | P/F | ◐ |
| 1.1 d | Principio di funzionamento e modo d'azione | `MDR-IU-001` § 7 | [02_architecture/01](../02_architecture/01-visione-architetturale.md), [02_architecture/02](../02_architecture/02-contesti-delimitati.md) | P | ◐ |
| 1.1 e | **Motivazione della qualificazione** come dispositivo medico | `MDR-CLS-001` § 2 | [02 §§1–3](./02-qualificazione-e-classificazione.md) | P | ☑ |
| 1.1 f | **Classe di rischio e motivazione delle regole applicate** | `MDR-CLS-001` §§ 4–7 | [02 §4](./02-qualificazione-e-classificazione.md) | P | ☑ |
| 1.1 g | Spiegazione delle caratteristiche nuove | `MDR-CLS-001` § 8 | [adr/](../adr/0001-separazione-prestazione-sessione-media.md) e l'insieme dei documenti di decisione architetturale | P | ◐ |
| 1.1 h | Accessori, altri dispositivi e prodotti non-dispositivi usati in combinazione | `MDR-COMB-001` | [05_domain/05](../05_domain/05-parametri-e-osservazioni.md), [07_integration/01](../07_integration/01-modalita-di-integrazione.md) | P/F | ☐ |
| 1.1 i | Elenco completo di **configurazioni e varianti** | `MDR-CONF-001` | [02_architecture/08](../02_architecture/08-viste-di-deployment.md), [07_integration/08](../07_integration/08-moduli-sostituibili.md) | P/F | ◐ |
| 1.1 j | Elementi funzionali chiave, con rappresentazioni figurate | `SW-SAD-001` | [02_architecture/01](../02_architecture/01-visione-architetturale.md)…[06](../02_architecture/06-eventi-e-integrazione-interna.md), [01_technical/02](../01_technical/02-backend.md), [01_technical/04](../01_technical/04-frontend.md), [01_technical/05](../01_technical/05-media-e-tempo-reale.md) | P | ◐ |
| 1.1 k | Materie prime a contatto con il corpo | **Non applicabile** | — | P/F | ☐ |
| 1.1 l | **Specifiche tecniche**: caratteristiche, prestazioni, varianti | `MDR-SPEC-001`, `MDR-ENV-001` | [01_technical/07](../01_technical/07-prestazioni-e-capacita.md), [01_technical/04](../01_technical/04-frontend.md) | P | ◐ |
| 1.2 | Generazioni precedenti e dispositivi analoghi del fabbricante | `MDR-TD-001` § 1.2 | — | **F** | ☐ |

**Tre righe meritano una nota, perché sono quelle in cui il modello duale del progetto (`D17`)
produce conseguenze concrete.**

**La riga 1.1 b.** L'identificativo unico di base non è un numero che si sceglie: presuppone un
fabbricante registrato, un ente di attribuzione e una struttura di versionamento della
**distribuzione identificata**. Il progetto non lo può attribuire e non deve fingere di poterlo
fare. Ma la scelta del progetto su **come si versiona la distribuzione** condiziona ciò che quel
codice identificherà, ed è una scelta che va presa consapevolmente e non per prassi: è la
questione `Q-172` del § 17.

**La riga 1.1 k.** «Non applicabile» non è una risposta: è una **motivazione da scrivere**. Un
fascicolo che salta le voci non applicabili è un fascicolo incompleto, non un fascicolo snello.
La forma corretta è la voce presente, con la dichiarazione di non applicabilità e la ragione —
software privo di parti applicate, nessun contatto con il corpo, nessuna azione fisica o chimica —
in una riga di testo.

**La riga 1.2.** È l'unico punto della sezione 1 in cui va dichiarato per iscritto il rapporto fra
il repository e la distribuzione. La formulazione corretta non è «il dispositivo deriva da un
progetto open source»: è che il dispositivo è **la distribuzione identificata prodotta da chi
certifica**, che il codice sorgente pubblicato **non è il dispositivo**, e che il legame fra i due
è garantito da costruzione riproducibile e firma degli artefatti (§ 6). Il testo pubblico che
sostiene questa posizione è
[`NOT-A-MEDICAL-DEVICE.md`](https://github.com/fedcal/Telemedic/blob/main/NOT-A-MEDICAL-DEVICE.md)
e
[`DISTRIBUTION-POLICY.md`](https://github.com/fedcal/Telemedic/blob/main/DISTRIBUTION-POLICY.md).

## 5. Allegato II, sezione 2 — Informazioni fornite dal fabbricante

| Voce | Contenuto | Documento | Alimentato da | Attr. | Stato |
|---|---|---|---|:-:|:-:|
| 2 | **Etichette** sul dispositivo e sull'imballaggio, nelle lingue accettate negli Stati membri di commercializzazione | `MDR-LBL-001` | — | **F** | ☐ |
| 2 | **Istruzioni per l'uso**, nelle lingue accettate | `MDR-IFU-001` | [03_functional/06](../03_functional/06-accessibilita-e-usabilita.md), [07_integration/02](../07_integration/02-primo-avvio.md), [07_integration/09](../07_integration/09-obblighi-di-chi-integra.md) | P/F | ☐ |

**Per un software, l'etichetta è una schermata.** L'insieme di informazioni che per un dispositivo
fisico sta sulla confezione — nome e indirizzo del fabbricante, identificativo unico, versione,
marcatura CE con il numero dell'organismo notificato, simboli normalizzati — per un software vive
in una schermata «Informazioni sul dispositivo» raggiungibile senza autenticazione e senza
percorsi profondi. Le norme di riferimento sono **EN ISO 20417** per le informazioni fornite dal
fabbricante ed **EN ISO 15223-1** per i simboli `[NV]` — la loro presenza nell'elenco consolidato
delle norme armonizzate va verificata alla data d'uso.

**Che cosa il progetto può e deve fare, pur non essendo fabbricante.** Predisporre lo **spazio**:
la schermata esiste, è raggiungibile, è accessibile, e i campi che dovrà contenere sono
configurabili per distribuzione invece che scritti nel codice. Un prodotto che non ha previsto
quella schermata costringe chi certifica a una modifica dell'interfaccia in fase avanzata, quando
ogni modifica dell'interfaccia riapre la valutazione dell'usabilità. È l'esempio più chiaro di un
costo che il progetto può azzerare per chi certifica **oggi** e che diventa caro dopo.

**La lingua non è una scelta editoriale.** Le istruzioni per l'uso destinate al mercato italiano
devono essere in italiano `[NV]` — l'obbligo discende dal decreto legislativo di adeguamento
nazionale, e il riferimento puntuale all'articolo va verificato sul testo pubblicato prima di
comparire in un documento controllato. Il progetto adotta comunque italiano e inglese integrali
(`D50`), il che copre la condizione minima ma non esaurisce l'obbligo: gli Stati membri in cui la
distribuzione sarà commercializzata li conosce solo il fabbricante, e con essi le lingue richieste.

**Un vincolo che nasce qui e vale per tutta l'interfaccia.** Le istruzioni per l'uso di un
dispositivo software non sono un manuale separato che nessuno apre: sono **la somma dei testi che
l'utilizzatore incontra**, comprese le avvertenze persistenti, i testi di consenso, i messaggi di
errore e le dichiarazioni di non idoneità all'emergenza (`BR-168`, questione `Q-126`). Ne discende
che ogni modifica a quei testi è una modifica alle informazioni fornite dal fabbricante, cioè una
modifica al fascicolo. È la stessa ragione per cui esiste il vincolo `V-171` sulle formule vietate
([01 §11](./01-inquadramento-normativo.md)) e per cui `V-163` di `INTEG` rende quei testi **non
tematizzabili né occultabili** dall'integratore.

## 6. Allegato II, sezione 3 — Informazioni su progettazione e fabbricazione

| Voce | Contenuto | Documento | Alimentato da | Attr. | Stato |
|---|---|---|---|:-:|:-:|
| 3 a | Informazioni che consentano di comprendere le **fasi di progettazione** | `SW-DEV-PLAN-001`, `SW-SRS-001`, `SW-SAD-001` | [03_functional/02](../03_functional/02-catalogo-dei-requisiti.md), [02_architecture/](../02_architecture/00-indice.md), [adr/](../adr/0003-dominio-indipendente-dallo-standard.md) | P | ◐ |
| 3 b | **Processi di fabbricazione** e loro convalida, controlli in corso, prova del prodotto finito | `SW-BUILD-001`, `QMS-VAL-001` | [01_technical/09](../01_technical/09-integrazione-continua-e-rilascio.md), [06_security/07](../06_security/07-catena-di-fornitura.md) | P | ◐ |
| 3 | **Identificazione dei siti** di progettazione e fabbricazione, fornitori e subappaltatori | `MDR-SITE-001` | [06_security/07](../06_security/07-catena-di-fornitura.md) per il metodo | **F** | ☐ |

**Per un software, «fabbricazione» significa costruzione e rilascio.** L'affermazione non è
metaforica e ha conseguenze precise: i «locali» che l'organismo notificato ispeziona sono
l'ambiente di sviluppo e l'infrastruttura di costruzione; i «controlli in corso di processo» sono
i controlli bloccanti della catena di integrazione continua; la «prova del prodotto finito» è
l'insieme delle verifiche eseguite sull'artefatto costruito, non sul sorgente.

**Il punto che l'organismo notificato solleverà per primo, in questo progetto, è il modello
duale.** La domanda è prevedibile e va preparata prima di sentirsela porre: *come si garantisce
che l'artefatto certificato corrisponda esattamente a un sorgente controllato, dato che il
repository accetta contributi da persone su cui il fabbricante non ha alcun potere di direzione?*

La risposta documentale è composta da cinque elementi, tutti già esistenti come pratica in questo
repository e nessuno dei quali, oggi, esiste come procedura controllata:

| Elemento | Dove vive oggi | Che cosa dimostra |
|---|---|---|
| **Costruzione riproducibile** e firma degli artefatti | [01_technical/09](../01_technical/09-integrazione-continua-e-rilascio.md) | Che il binario distribuito discende dal sorgente dichiarato |
| **Elenco esatto delle modifiche incluse** nel rilascio | [03 §8](./03-sistema-di-gestione-della-qualita.md), record 1 e 2 | Che la composizione del rilascio è nota e non ricostruita |
| **Revisione obbligatoria da revisori nominati e qualificati** | [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md), [`GOVERNANCE.md`](https://github.com/fedcal/Telemedic/blob/main/GOVERNANCE.md) | Che l'**accettazione** è l'atto di progettazione, non la scrittura ([03 §1](./03-sistema-di-gestione-della-qualita.md)) |
| **Attestazione di origine** su ogni contributo | [`CONTRIBUTING.md`](https://github.com/fedcal/Telemedic/blob/main/CONTRIBUTING.md) | Catena di provenienza dei diritti e tracciabilità nominativa dell'autore |
| **Distinta dei materiali** generata dalla catena di costruzione | [01_technical/09](../01_technical/09-integrazione-continua-e-rilascio.md), registro dei componenti in [01_technical/01 §14](../01_technical/01-stack-e-motivazioni.md) | Che ogni elemento di configurazione è identificato per titolo, produttore e versione |

**Ciò che manca è il documento che spiega perché questi cinque elementi soddisfano la clausola.**
È esattamente la differenza fra una buona pratica di ingegneria e una prova regolatoria, ed è il
lavoro che [03](./03-sistema-di-gestione-della-qualita.md) descrive e che questo capitolo non
duplica.

**La riga sui siti è integralmente del fabbricante**, e non per formalismo. Comprende
l'identificazione degli esecutori della catena di costruzione, del registro delle immagini, del
servizio di firma e di ogni fornitore critico, con la sede legale e il Paese: sono dati che
dipendono da dove il fabbricante ospita la propria infrastruttura, non da dove il progetto ospita
la propria. Il progetto fornisce il **metodo** e i requisiti che quei fornitori devono soddisfare
— sovranità del dato (`V1`), assenza di dipendenze di runtime fuori dall'Unione, dichiarabilità
del fornitore rilevante all'autorità (`D40`) — e nulla più.

## 7. Allegato II, sezione 4 — Requisiti generali di sicurezza e prestazione

| Voce | Contenuto | Documento | Alimentato da | Attr. | Stato |
|---|---|---|---|:-:|:-:|
| 4 | **Elenco dei requisiti generali dell'Allegato I**, con applicabilità motivata, metodo di dimostrazione, norme applicate e **identificazione precisa dei documenti controllati** che offrono la prova | `MDR-GSPR-001` | Tutta la documentazione tecnica del progetto | P/F | ☐ |

**È la spina dorsale del fascicolo, ed è il documento che l'organismo notificato legge per primo.**
Va costruito come tabella con riferimenti a documenti versionati e a revisione esatta, mai come
prosa: una matrice discorsiva è illeggibile per chi deve campionare, e produce il tipo di rilievo
descritto al § 1.

**Per un software le righe più onerose sono due famiglie.** La prima è quella dei **sistemi
elettronici programmabili**: ripetibilità, affidabilità e prestazioni conformi all'uso previsto;
sviluppo secondo lo stato dell'arte con ciclo di vita, gestione del rischio, verifica e
validazione; requisiti minimi di hardware e di rete; misure di sicurezza informatica compresa la
protezione contro l'accesso non autorizzato. La seconda è quella della **riduzione dei rischi
legati all'errore d'uso**. `[NV]` — la numerazione puntuale delle sezioni dell'Allegato I va
riletta sul testo consolidato prima di comparire nella matrice.

**Il limite strutturale del contributo del progetto, e va detto senza attenuazioni.** La colonna
«identificazione precisa dei documenti controllati» **non è compilabile dal progetto**, perché
presuppone documenti controllati, che il progetto non ha (`V-174`). Il progetto può quindi
produrre la matrice fino alla penultima colonna: requisito, applicabilità con motivazione, metodo
di dimostrazione, norma applicata, e **rinvio all'analisi** di questo repository. L'ultima colonna
la compila chi certifica, sostituendo il rinvio all'analisi con il riferimento al proprio
documento approvato.

Questa non è una limitazione secondaria: è **il punto di giunzione dell'intero modello di `D49`**.
Il progetto costruisce l'impalcatura completa e verificabile di un fascicolo; l'atto che la
trasforma in fascicolo è l'inserimento di ciascun rinvio dentro un sistema di controllo dei
documenti, e quell'atto è un atto del fabbricante. Chi legge questa documentazione sperando di
trovarvi un fascicolo pronto all'uso troverà invece **tutto ciò che serve per scriverne uno in
mesi invece che in anni**, che è una cosa diversa e va detta com'è.

## 8. Allegato II, sezione 5 — Analisi benefici-rischi e gestione del rischio

| Voce | Contenuto | Documento | Alimentato da | Attr. | Stato |
|---|---|---|---|:-:|:-:|
| 5.1 | **Analisi benefici-rischi** | `RM-REP-001`, `CE-REP-001` | [05 §8](./05-gestione-del-rischio.md) | **F** | ☐ |
| 5.2 | Soluzioni adottate e **risultati della gestione del rischio** | `RM-PLAN-001`, `RM-FILE-001`, `RM-REP-001` | [05](./05-gestione-del-rischio.md) integrale | P/F | ◐ |

Il contenuto sostanziale di questa sezione è nel capitolo
[05 — Gestione del rischio](./05-gestione-del-rischio.md) e **non si duplica qui**. Ai fini della
mappatura del fascicolo contano tre fatti, che quel capitolo stabilisce e che qui si registrano.

**Primo.** Il file di rischio non esiste ancora come documento: esistono le sue **voci
identificate**, gli ingressi registrati e il metodo proposto. La stima di gravità e probabilità
richiede i criteri di accettabilità del piano, e i criteri di accettabilità sono una **scelta del
fabbricante**, non un dato tecnico.

**Secondo.** L'analisi benefici-rischi non è redigibile dal solo gruppo tecnico e non è firmabile
da esso: presuppone una valutazione clinica e una determinazione di accettabilità che l'MDR
attribuisce al fabbricante. È l'unica riga della sezione 5 marcata **F** senza attenuazioni.

**Terzo, ed è il legame che si perde più spesso.** La sezione 5 e la sezione 4 devono essere
coerenti: ogni misura di controllo del rischio che compare nel file di rischio deve comparire come
prova di una riga della matrice dei requisiti generali, e viceversa. Due documenti costruiti
separatamente divergono al secondo aggiornamento. Il presidio è che la matrice sia **generata** a
partire dagli stessi identificativi, non redatta a mano — la stessa regola che
[03 §7.3](./03-sistema-di-gestione-della-qualita.md) applica alla tracciabilità.

## 9. Allegato II, sezione 6 — Verifica e convalida del prodotto

È la sezione più voluminosa per un software e quella in cui il progetto contribuisce di più.

| Voce | Contenuto | Documento | Alimentato da | Attr. | Stato |
|---|---|---|---|:-:|:-:|
| 6.1 | Risultati e analisi critica di **verifiche e prove** e delle prove di convalida | `SW-VVP-001`, `SW-VVR-001`, `SW-TRACE-001` | [01_technical/08](../01_technical/08-qualita-e-test.md), [01_technical/09](../01_technical/09-integrazione-continua-e-rilascio.md) | P | ◐ |
| 6.1 b | **Verifica e convalida del software** prima del rilascio definitivo, su tutte le configurazioni e i sistemi operativi dichiarati | `SW-VVR-001`, `MDR-ENV-001` | [01_technical/08](../01_technical/08-qualita-e-test.md), [01_technical/04](../01_technical/04-frontend.md), [01_technical/05](../01_technical/05-media-e-tempo-reale.md) | P | ◐ |
| 6.1 | **Stabilità e durata di vita** | `MDR-LIFE-001` | [03 §9.4](./03-sistema-di-gestione-della-qualita.md) | P/F | ☐ |
| 6.1 | Biocompatibilità, sterilità, sostanze, radiazioni | **Non applicabili** | — | P/F | ☐ |
| 6.1 | **Dati clinici**: piano e rapporto di valutazione clinica, seguito clinico post-commercializzazione | `CE-PLAN-001`, `CE-REP-001`, `PMCF-PLAN-001` | [07 — Valutazione clinica](./07-valutazione-clinica.md) | **F** | ☐ |
| 6.2 | Casi specifici, fra cui i dispositivi con **funzione di misura** | `MDR-TD-001` § 6.2 | [02 §12](./02-qualificazione-e-classificazione.md), questione `Q-173` | P/F | ☐ |
| — | **Sicurezza informatica**: modello di minaccia, requisiti, prove, gestione delle vulnerabilità, divulgazione coordinata, distinta dei materiali | `SEC-TM-001`, `SEC-RMF-001`, `SEC-PT-001`, `SEC-LC-001` | [06_security/01](../06_security/01-modello-di-minaccia.md), [06](../06_security/06-sicurezza-applicativa.md), [07](../06_security/07-catena-di-fornitura.md), [10](../06_security/10-risposta-agli-incidenti.md), [`SECURITY.md`](https://github.com/fedcal/Telemedic/blob/main/SECURITY.md) | P | ◐ |
| — | **File di ingegneria dell'usabilità** | `UEF-001` e i documenti collegati | [06 — Usabilità e accessibilità](./06-usabilita-e-accessibilita.md), [03_functional/06](../03_functional/06-accessibilita-e-usabilita.md) | P/F | ☐ |
| — | **Documentazione di ciclo di vita del software** completa | `SW-*` | [03 §§6–8](./03-sistema-di-gestione-della-qualita.md) | P | ◐ |

**Quattro avvertenze su questa sezione, tutte nate da fatti di questo progetto.**

**Prima — «prima del rilascio definitivo» è una condizione temporale, non una formula.** La norma
chiede la sintesi dei risultati di tutte le verifiche eseguite **prima** del rilascio. Un rapporto
prodotto dopo, che descrive prove eseguite prima, è ammissibile solo se le prove erano
tracciabili alla versione rilasciata. È la ragione per cui il record 4 di
[03 §8](./03-sistema-di-gestione-della-qualita.md) impone che ogni esito di verifica porti la
**versione dell'oggetto verificato**: senza quel campo, un esito di verifica automatica non è
attribuibile a un rilascio e vale zero nel fascicolo.

**Seconda — la matrice degli ambienti supportati non esiste e non è inventabile.** La voce 6.1 b
richiede la verifica su tutte le configurazioni dichiarate. Le configurazioni dichiarate
discendono da `MDR-ENV-001`, che a sua volta discende dalle soglie dell'ambiente operativo — banda
minima, latenza, perdita, variazione del ritardo — e dal **dispositivo di riferimento** su cui i
criteri mobile first si verificano. Nessuna di queste grandezze è oggi misurata: è la questione
`Q-115`, aperta dall'area tecnica verso prodotto e funzionale. Finché resta aperta, la sezione 10
della destinazione d'uso non è compilabile ([02 §5.1](./02-qualificazione-e-classificazione.md)) e
**la voce 6.1 b non ha un perimetro di prova definito**. Non è un ritardo documentale: è
l'impossibilità di sapere che cosa si deve provare.

**Terza — i dati clinici sono marcati F, e la marcatura è sostanziale.** Il progetto può produrre
il metodo, la strategia di ricerca della letteratura e la struttura del piano; non può condurre la
valutazione clinica, che presuppone un valutatore qualificato e una responsabilità che
appartengono al fabbricante (`D49`). Il capitolo [07](./07-valutazione-clinica.md) tratta
l'argomento; qui si registra solo che è, insieme all'organismo notificato, il secondo percorso a
tempo lungo del calendario.

**Quarta — la voce 6.2 è aperta e la sua chiusura non dipende da quest'area.** Se la presentazione
di parametri misurati costituisca «funzione di misura» ai sensi dell'MDR dipende da un fatto:
se il sistema converta unità, arrotondi o trasformi i valori ricevuti, oppure li presenti come
ricevuti. È la questione `Q-173`, indirizzata alle aree di dominio e funzionale. La risposta
determina l'applicabilità di un blocco di requisiti metrologici dell'Allegato I, e quindi righe
intere della matrice della sezione 4.

## 10. Allegato III — Documentazione tecnica sulla sorveglianza post-commercializzazione

| Voce | Contenuto | Documento | Alimentato da | Attr. | Stato |
|---|---|---|---|:-:|:-:|
| 1.1 | **Piano di sorveglianza post-commercializzazione** ai sensi dell'art. 84: raccolta dei dati, indicatori e valori soglia per la rivalutazione dei rischi, indagine sui reclami, gestione degli eventi soggetti a rapporto di andamento, comunicazione con utilizzatori e distributori, verifica delle azioni preventive e correttive, strumenti di tracciabilità, piano di seguito clinico o motivazione della sua non applicabilità | `PMS-PLAN-001` | [08 — Sorveglianza post-commercializzazione](./08-sorveglianza-post-commercializzazione.md), [06_security/10](../06_security/10-risposta-agli-incidenti.md) | P/F | ☐ |
| 1.2 | **Rapporto periodico di aggiornamento sulla sicurezza** e rapporto sulla sorveglianza | `PSUR-00n` | [08](./08-sorveglianza-post-commercializzazione.md) | **F** | ☐ |

**L'Allegato III è la parte del fascicolo che si dimentica sistematicamente**, per una ragione
comprensibile: descrive che cosa accadrà dopo l'immissione sul mercato, e prima
dell'immissione sul mercato sembra prematuro. Non lo è, per due motivi verificabili.

Il primo è formale: il piano di sorveglianza è **parte della domanda** all'organismo notificato
(§ 12), non un adempimento successivo al certificato. Presentarsi senza piano significa presentare
una domanda incompleta, e una domanda incompleta rimette in coda.

Il secondo è tecnico e riguarda il prodotto, non i documenti. Il piano dichiara **indicatori,
soglie e finestre di raccolta**; se il sistema non produce quei dati, il piano dichiara qualcosa
che nessuno potrà eseguire. La conseguenza operativa è una domanda che va posta ora e che è la
questione `Q-116` dell'area tecnica: **per quanto tempo si conservano i segnali di osservabilità?**
Se un incidente può emergere a distanza di settimane e i registri di diagnostica durano giorni, la
ricostruzione è impossibile e l'obbligo di vigilanza non è soddisfacibile. Il termine dipende dagli
obblighi di vigilanza sui dispositivi e da quelli di segnalazione in materia di sicurezza
informatica: appartiene a quest'area, si tratta nel capitolo
[08](./08-sorveglianza-post-commercializzazione.md), ed è distinto dai termini già fissati da
`V-152` per la tracciabilità e i dati di accesso.

## 11. Che cosa manca oggi

Questa sezione è la ragione principale del capitolo, e va letta come inventario delle assenze, non
come piano di lavoro. Nessuna riga è consolatoria.

| # | Che cosa manca | Perché non c'è | Da chi dipende | Recuperabile dopo? |
|---|---|---|---|:-:|
| 1 | **Bozza di destinazione d'uso** `MDR-IU-001` come documento | La struttura esiste ([02 §5.1](./02-qualificazione-e-classificazione.md)); manca il testo, e la sezione 10 non è compilabile finché le soglie non sono misurate (`Q-115`) | Progetto, con dipendenza tecnica | Sì, ma cambiarla dopo l'ingaggio dell'organismo costa una rivalutazione (`D46`) |
| 2 | **Determinazione di qualificazione e classificazione** `MDR-CLS-001` come documento | Il contenuto è integralmente in [02](./02-qualificazione-e-classificazione.md); manca la forma di documento con revisione e riferimenti verificati | Progetto | Sì |
| 3 | **Matrice dei requisiti generali** `MDR-GSPR-001` | Non è mai stata compilata. È il documento più lungo del fascicolo e quello che richiede la lettura riga per riga dell'Allegato I | Progetto fino alla penultima colonna, poi fabbricante | Sì, ma è il lotto di lavoro più sottovalutato |
| 4 | **File di rischio** `RM-FILE-001` | Esistono le voci e il metodo ([05](./05-gestione-del-rischio.md)); manca il piano con i criteri di accettabilità, che è una scelta del fabbricante | Fabbricante per il piano, progetto per il contenuto | Parzialmente: le voci sì, la cronologia delle decisioni no |
| 5 | **File di ingegneria dell'usabilità** `UEF-001` | La valutazione formativa va svolta **durante** lo sviluppo; una valutazione formativa ricostruita dopo non è una valutazione formativa | Progetto | **No** per la parte formativa |
| 6 | **Piano e rapporto di valutazione clinica** | Percorso autonomo di 6–9 mesi che non è stato avviato | Fabbricante | Sì, ma allunga il calendario di pari misura |
| 7 | **Piano di sorveglianza post-commercializzazione** `PMS-PLAN-001` | Non redatto; e alcuni indicatori richiedono capacità di prodotto non ancora dichiarate (`Q-116`) | Progetto per le capacità, fabbricante per il piano | Sì per il documento, **no** per i dati non raccolti |
| 8 | **Etichetta e istruzioni per l'uso** | Non esiste la schermata di informazioni sul dispositivo, né il documento | Progetto per lo spazio, fabbricante per il contenuto | Sì, ma una modifica tardiva dell'interfaccia riapre la valutazione dell'usabilità |
| 9 | **Registro dei componenti di terze parti** completo con le annotazioni | Il meccanismo è definito ([01_technical/01 §14](../01_technical/01-stack-e-motivazioni.md), [01_technical/09](../01_technical/09-integrazione-continua-e-rilascio.md)); l'inventario completo si popola con la prima catena di costruzione | Progetto | **No a costo pieno**: censire i componenti a posteriori costa 3–5 volte tanto (`D45`) |
| 10 | **Matrice di tracciabilità** come artefatto di rilascio | Gli identificativi sono congelati (`V-120`), la generazione non è ancora in esercizio | Progetto | **No**: è l'elemento retroattivamente irrecuperabile per eccellenza |
| 11 | **Requisiti dell'ambiente operativo** `MDR-ENV-001` | Nessuna soglia è stata misurata; nessun dispositivo di riferimento è dichiarato (`Q-115`) | Tecnica e prodotto | Sì |
| 12 | **Determinazione della funzione di misura** | Questione `Q-173` aperta | Dominio e funzionale | Sì, ma condiziona righe intere della matrice |
| 13 | **Modelli documentali per le tipologie del fascicolo sanitario** | Template, codici e metadati non risultano pubblicamente disponibili: questione `Q-07` | Esterno al progetto | Sì, con dipendenza da un ente terzo |
| 14 | **Periodo di supporto dichiarato** e data di fine supporto | Questione `Q-155`, decisione del committente | Committente | Sì, ma è elemento obbligatorio della documentazione al cliente |

**Le righe 5, 9 e 10 sono di natura diversa dalle altre e vanno lette insieme.** Sono le tre voci
in cui il tempo non è recuperabile con denaro: una valutazione formativa dell'usabilità non si
esegue a posteriori su un'interfaccia già congelata; un inventario dei componenti ricostruito su
un progetto maturo è un'operazione archeologica; una matrice di tracciabilità ricostruita
leggendo il codice è un'operazione **interpretativa**, e un organismo notificato non ha motivo di
crederle. Sono precisamente le attività che `D45` colloca fra quelle da avviare subito **a
prescindere da chi certificherà**, e la ragione per cui il progetto le assume pur non essendo
fabbricante.

## 12. Che cosa solo chi certifica può aggiungere

L'elenco che segue è chiuso e va letto come tale: **nessuna di queste voci è ottenibile dal
progetto**, in nessuna forma, nemmeno in bozza, nemmeno con l'aiuto di un consulente. Ciascuna
presuppone un soggetto giuridico, un atto di volontà o una responsabilità che il progetto non ha e
che ha deciso di non assumere (`D28`, `D49`, `V-06`).

| # | Elemento | Perché è irriducibile |
|---|---|---|
| 1 | **Esistenza del fabbricante**: soggetto giuridico con sede nell'Unione e identificativo fiscale | Nessun organismo notificato apre un fascicolo senza un fabbricante identificato. La costituzione richiede settimane ed è il vincolo più a monte |
| 2 | **Numero di registrazione dell'operatore economico** e registrazioni nella banca dati europea | Discendono dagli artt. 27, 29 e 31 dell'MDR e presuppongono il soggetto della riga 1 |
| 3 | **Identificativo unico di base** e sua struttura | Attribuito dal fabbricante presso un ente di attribuzione. Voce 1.1 b dell'Allegato II |
| 4 | **Controllo dei documenti** e approvazione formale di ogni documento del fascicolo | È la proprietà che trasforma un'analisi in un documento del fascicolo (§ 1). Richiede il sistema di gestione della qualità di un fabbricante |
| 5 | **Nomina della persona responsabile del rispetto della normativa**, con dossier di qualifica | Art. 15 MDR. È una posizione personale, con requisiti di qualifica documentabili |
| 6 | **Determinazione dei criteri di accettabilità del rischio** e del rischio residuo complessivo | [05 §8](./05-gestione-del-rischio.md): non è delegabile né a un fornitore, né a un consulente, né a una tabella |
| 7 | **Valutazione clinica** condotta e firmata da valutatore qualificato, e analisi benefici-rischi | Artt. 61 e Allegato XIV. Presuppone accesso, competenza e responsabilità clinica |
| 8 | **Valutazione sommativa dell'usabilità** con utenti rappresentativi | Richiede reclutamento, protocollo approvato e un prodotto congelato: è un'attività del fabbricante, non del progetto |
| 9 | **Dichiarazione di conformità UE** | Art. 19 e Allegato IV. È l'atto con cui una persona assume la responsabilità del prodotto |
| 10 | **Apposizione della marcatura CE** con il numero dell'organismo notificato | Artt. 20 e 52(6) |
| 11 | **Domanda all'organismo notificato**, comprensiva della dichiarazione che la stessa domanda non è stata presentata ad altro organismo | Requisito espresso dell'Allegato IX. È una dichiarazione, non un documento tecnico |
| 12 | **Manuale e procedure del sistema di gestione della qualità**, con le evidenze del ciclo: audit interno, riesame della direzione, azioni correttive | Art. 10, par. 9; Allegato IX, sez. 2. Presuppone un'organizzazione che eserciti il sistema per almeno un ciclo completo |
| 13 | **Elenco dei siti, dei fornitori e dei subappaltatori critici**, e i relativi contratti | Allegato IX, sez. 2.2; art. 10, par. 9, lett. d) `[NV]` sui riferimenti puntuali |
| 14 | **Copertura assicurativa** per la responsabilità da prodotto difettoso | Art. 10, par. 16 `[NV]`. È un contratto, e nessun documento tecnico lo sostituisce |
| 15 | **Sottoposizione all'audit in sito** dei propri locali e della propria infrastruttura | L'organismo ispeziona l'ambiente di sviluppo e la catena di costruzione **del fabbricante**, non quelli di un repository pubblico |

**La riga 15 merita di essere sviluppata, perché è quella che sorprende.** Un organismo notificato
non ispeziona un repository: ispeziona **un'organizzazione**. Verifica in loco chi ha accesso in
scrittura, come si autorizza un rilascio, chi firma gli artefatti, dove sono le chiavi, come si
dimostra che la procedura scritta corrisponde alla prassi. Un progetto aperto può rendere questa
verifica facile — pubblicando la catena di costruzione, i controlli bloccanti, le regole di
revisione e la loro applicazione effettiva — ma non può sostituirvisi. **La differenza fra rendere
facile e sostituirsi è l'intera distanza fra `D49` e la marcatura CE.**

## 13. L'organismo notificato: che cosa fa, e che cosa non fa

Nella procedura applicabile alla Classe IIa — valutazione basata sul sistema di gestione della
qualità, **Allegato IX, Capi I e III**, con la valutazione della documentazione tecnica della
**sezione 4** per almeno un dispositivo rappresentativo per categoria (art. 52, par. 6) —
l'organismo svolge quattro attività distinte.

| # | Attività | Base | Che cosa significa per un software |
|---|---|---|---|
| 1 | **Valutazione del sistema di gestione della qualità**, con audit in sito | All. IX, sez. 2 | I «locali» sono l'ambiente di sviluppo e l'infrastruttura di costruzione e rilascio |
| 2 | **Valutazione della documentazione tecnica** | All. IX, sez. 4 | Con un solo prodotto significa: il fascicolo è esaminato integralmente |
| 3 | **Sorveglianza** almeno annuale, con audit anche senza preavviso | All. IX, sez. 3 | Verifica dell'attuazione, dei dati di sorveglianza, delle azioni correttive e dell'aggiornamento del fascicolo |
| 4 | **Approvazione preventiva delle modifiche sostanziali** al sistema e al dispositivo | All. IX, sez. 2.4 e 4.10 `[NV]` | È il punto in cui il ciclo di rilascio del software e il regime regolatorio entrano in conflitto |

**Il certificato ha durata massima di cinque anni** `[NV]` sul riferimento puntuale di sezione, con
rinnovo su nuova valutazione.

**Ciò che l'organismo non fa, e che va saputo prima di cercarne uno.** Non redige, non corregge e
non consiglia: i requisiti di imparzialità dell'**Allegato VII** vietano all'organismo che valuta
di fornire consulenza al fabbricante valutato. Consulenza e valutazione sono soggetti diversi. Chi
offre entrambe le cose sta violando il regime di imparzialità oppure non è un organismo notificato:
in entrambi i casi la sua offerta è un segnale di allarme, non un vantaggio.

**Come si individua un organismo designato.** La banca dati ufficiale della Commissione elenca gli
organismi per legislazione, Stato membro e **ambito di designazione**, ed è oggi raggiungibile
attraverso il portale unico di conformità del mercato interno. Per ciascun candidato vanno lette
due sezioni distinte e indipendenti: le **procedure di valutazione della conformità** per cui è
designato — deve comparire l'Allegato IX, Capi I e III — e i **codici di designazione** relativi
ai tipi di dispositivo, stabiliti dal **Regolamento di esecuzione (UE) 2017/2185**. Un software
dispositivo medico autonomo è un dispositivo attivo e ricade in un codice della famiglia `MDA`
corrispondente alla funzione clinica, affiancato da un codice orizzontale della famiglia `MDS`
relativo ai dispositivi che incorporano software.

> **`[NV]` — I codici esatti non sono stati confermati su fonte primaria.** Il numero del codice
> `MDA` applicabile a un software di telemedicina e telemonitoraggio e la formulazione letterale
> del codice orizzontale vanno ricavati dall'allegato al regolamento di esecuzione. In ogni caso,
> e indipendentemente da quella verifica, la strada affidabile è **chiedere a ciascun organismo
> candidato di dichiarare per iscritto sotto quali codici tratterebbe il dispositivo**: è prassi
> accettata ed è più solida di qualunque ricostruzione documentale.

**Tre verifiche separate, che si confondono sempre.** La presenza nella banca dati indica soltanto
l'ambito di designazione. Non dice se l'organismo **accetta nuovi clienti**, quale sia la sua coda,
né se abbia competenza reale sul software. Sono tre domande distinte, vanno poste per iscritto e
le risposte vanno conservate. Non va inoltre ristretta la ricerca agli organismi nazionali: la
designazione ha effetto in tutta l'Unione e la lingua di lavoro è negoziabile. Il criterio corretto
è **codici più competenza sul software più disponibilità reale**, non la nazionalità.

**Sui costi il progetto non produce stime, e la ragione è che esiste una fonte primaria.**
L'**Allegato VII, sezione 1.2.8**, obbliga gli organismi notificati a rendere pubblicamente
disponibile l'elenco delle proprie tariffe standard, e la Commissione mantiene l'elenco dei
collegamenti alle tariffe pubblicate. Stimare in presenza di una fonte pubblica sarebbe un errore
di metodo. Ciò che si può dire è la **struttura** del costo — quota di apertura del fascicolo,
valutazione della documentazione, audit iniziale in due fasi, cicli di riesame delle risposte alle
non conformità, canone di mantenimento, sorveglianza annuale, audit senza preavviso, valutazione
delle modifiche sostanziali — e un'avvertenza sul confronto delle offerte: **confrontare le tariffe
giornaliere è fuorviante**, perché l'organismo più economico per giornata può risultare il più
costoso in totale se genera più cicli di non conformità o se ha code più lunghe.

## 14. Perché l'organismo notificato è il fattore limitante del calendario

È il punto in cui questo capitolo dice la cosa più scomoda, e la dice perché è aritmetica e non
opinione.

**I dati.** Il 51% degli organismi impiega **13–18 mesi** dalla firma dell'accordo al certificato e
il 31% impiega **19–24 mesi**. A fine 2025 il divario fra domande e certificati era di **25.978
domande contro 13.953 certificati**. L'organico degli organismi è in **contrazione**: −8% di
personale interno e −21% di subappaltatori fra 2024 e 2025, per la prima volta in oltre un
decennio. Il tempo fra offerta e contratto è inferiore a due mesi in due terzi dei casi, ma **il
tempo che precede l'accettazione non è misurato da nessuno**, ed è quello pericoloso.

**La conseguenza.** Nessuna quantità di lavoro sul software accorcia questa coda. Un fascicolo
perfetto consegnato in anticipo non produce un certificato in anticipo: produce un posto in coda
in anticipo, che è cosa diversa e vale comunque la pena, ma va chiamata con il suo nome. Ne discende
la regola di pianificazione che governa l'intera area:

> **Lo sviluppo e la certificazione sono due percorsi con orologi indipendenti.** Il primo è
> controllato dal progetto; il secondo è controllato da un terzo con code non misurate. Trattarli
> come un unico piano produce una data che non dipende da chi la promette.

**Il fattore aggravante, che va messo in conto nella negoziazione e non scoperto dopo.** Un
fabbricante nuovo, di dimensioni micro, alla prima certificazione, con un prodotto software e un
modello di sviluppo aperto **non è un cliente prioritario** per un organismo con la coda piena. È
un fatto di mercato, non un giudizio: la contromisura è contattare cinque o sei organismi
contemporaneamente e presentarsi con la determinazione di classificazione, la bozza di destinazione
d'uso e l'indice del fascicolo già pronti. Un fabbricante che sa che cosa sta chiedendo viene
accettato più facilmente, ed è precisamente il materiale che questo capitolo mappa.

**Le date non stanno qui.** Gli scenari temporali, il calcolo all'indietro, i punti di decisione
irreversibili e il calendario delle fasi sono nel capitolo
[09 — Percorso e calendario](./09-percorso-e-calendario.md), che è la sede unica in cui questa
documentazione colloca le date. Ripeterle qui produrrebbe due calendari destinati a divergere, che
è il difetto documentale che [03](./03-sistema-di-gestione-della-qualita.md) chiama per nome. Il
solo termine che questo capitolo ribadisce è quello del progetto: **al 30 novembre 2026 il
traguardo è software completo, testato e documentato, con fascicolo tecnico avviato** (`D5`,
`D16`), e nessun artefatto può lasciare intendere che a quella data esista una marcatura.

## 15. Come si tiene aggiornato un fascicolo, e perché è il vero costo

L'art. 10, par. 4, impone di **tenere aggiornata** la documentazione tecnica. Per un software con
un ciclo di rilascio frequente questa formula, letta insieme all'attività 4 del § 13, produce il
conflitto strutturale fra il ritmo del software e il ritmo regolatorio.

**La domanda che governa ogni rilascio, dopo il certificato, è una sola:** questa modifica incide
su sicurezza, prestazioni o condizioni d'uso approvate? Se sì, richiede l'approvazione preventiva
dell'organismo notificato prima di essere distribuita; se no, richiede comunque l'aggiornamento del
fascicolo e la sua tracciabilità. **La risposta non può essere improvvisata rilascio per rilascio**:
richiede una procedura di valutazione dell'impatto, con criteri scritti prima, applicata da persone
identificate e verbalizzata. Il capitolo [08](./08-sorveglianza-post-commercializzazione.md)
tratta la disciplina delle modifiche; qui si registrano tre conseguenze che ricadono sul fascicolo
e sul modo di lavorare del progetto.

**Prima.** Una correzione di sicurezza urgente e una modifica funzionale hanno regimi diversi, e la
catena di rilascio deve poterle distinguere **prima** di costruire l'artefatto, non dopo. Una
catena che produce un solo tipo di rilascio costringe a trattare tutto come sostanziale.

**Seconda.** La distinta dei materiali e il registro dello stato di configurazione di ogni rilascio
sono documenti del fascicolo, non sottoprodotti della catena di costruzione. Ne discende che vanno
conservati con la stessa disciplina del resto, per tutta la durata dell'obbligo di conservazione, e
non fino alla scadenza dell'archiviazione degli artefatti di una piattaforma di integrazione
continua. **È un errore ricorrente e ha una forma banale: il fascicolo rinvia a un artefatto che è
stato eliminato automaticamente novanta giorni dopo.**

**Terza, e riguarda direttamente il progetto.** Ogni modifica ai testi rivolti all'utilizzatore è
una modifica alle informazioni fornite dal fabbricante (§ 5), e ogni modifica alla comunicazione
pubblica può essere una modifica non controllata della destinazione d'uso
([02 §10](./02-qualificazione-e-classificazione.md)). Il presidio è il passaggio di revisione
regolatoria dei testi pubblici, questione `Q-174`. È l'unico presidio dell'intera area che non
passa da una verifica automatica e che nessun controllo di integrazione continua intercetta.

## 16. Lista di autocontrollo prima di consegnare un fascicolo

Le voci che seguono sono i rilievi che si producono da soli, indipendentemente dalla qualità
tecnica del prodotto. Vanno verificate prima della consegna, e la verifica costa ore.

1. **Ogni riferimento porta una revisione esatta**, e la revisione citata esiste.
2. **La matrice dei requisiti generali non contiene rinvii generici** a una cartella, a un sito o a
   «la documentazione tecnica»: rinvia a un documento e a una sezione.
3. **Le voci non applicabili sono presenti con la loro motivazione**, non assenti.
4. **Ogni esito di verifica porta la versione dell'oggetto verificato** e la data.
5. **Le anomalie residue sono elencate e valutate**, non omesse: un rilascio senza elenco di
   anomalie residue non è un rilascio pulito, è un rilascio non documentato.
6. **Il file di rischio e la matrice dei requisiti generali si citano a vicenda** e non divergono.
7. **La destinazione d'uso citata nel fascicolo, quella dell'interfaccia e quella del materiale
   pubblico sono la stessa**, parola per parola dove sono citate.
8. **Nessun documento del fascicolo usa una formula vietata** dal vincolo `V-171`.
9. **La distinta dei materiali del rilascio corrisponde a ciò che una nuova costruzione
   produrrebbe**: nessuna etichetta mobile, per la ragione della clausola 8.1.2 e non per
   preferenza operativa (`V-173`).
10. **Il piano di sorveglianza dichiara indicatori che il sistema produce davvero.**

## 17. Che cosa questo capitolo lascia aperto

| Riferimento | Questione | A chi |
|---|---|---|
| `Q-172` | **Struttura di versionamento della distribuzione identificata e suo rapporto con l'identificativo unico.** Il progetto non attribuisce l'identificativo (voce 1.1 b), ma la sua scelta su come si numera e si compone una distribuzione determina che cosa quell'identificativo identificherà, quali modifiche sono nuove versioni e quali sono nuovi dispositivi. Va decisa **prima** del primo rilascio della distribuzione, perché una rinumerazione successiva è una discontinuità di identificazione | → Committente, con architettura |
| `Q-115` | Soglie dell'ambiente operativo e dispositivo di riferimento: senza di essi la voce 6.1 b non ha un perimetro di prova e `MDR-ENV-001` non è redigibile (§ 9) | Tecnica, prodotto |
| `Q-173` | Se la presentazione di parametri costituisca **funzione di misura**: determina l'applicabilità di un blocco di requisiti dell'Allegato I (§ 9) | Dominio, funzionale |
| `Q-116` | Conservazione dei segnali di osservabilità e finestra di ricostruibilità di un incidente: condiziona l'eseguibilità del piano di sorveglianza (§ 10) | Conformità, tecnica |
| `Q-155` | Periodo di supporto dichiarato e data di fine supporto, elemento di `MDR-LIFE-001` (§ 9) | → Committente |
| `Q-07` | Modelli documentali, codici di tipologia e metadati delle tipologie del fascicolo sanitario: non pubblicamente disponibili. Condiziona la voce 6.1 per la parte documentale | Conformità, con ente terzo |
| `Q-24` | Adozione formale come documento di decisione architetturale della tabella artefatto → regime ([01 §5.1](./01-inquadramento-normativo.md)): incide sul perimetro del fascicolo, perché stabilisce quali artefatti sono coperti dalla marcatura e quali no | → Committente, con architettura |
| `[NV]` | Numerazione puntuale delle sezioni dell'Allegato I e dell'Allegato IX citate ai §§ 7 e 13, e durata dell'obbligo di conservazione al § 1: da riverificare sul testo consolidato prima di comparire in un documento controllato | Conformità |
| `[NV]` | Codici di designazione applicabili al dispositivo (§ 13) e stato di armonizzazione delle norme sulle informazioni fornite dal fabbricante e sui simboli (§ 5) | Conformità |
