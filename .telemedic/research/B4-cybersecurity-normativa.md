---
title: "Cybersecurity normativa: NIS2, ACN, L. 90/2024, CRA, AgID"
sidebar_position: 10
description: "Determinazioni ACN 379907/2025, 379887/2025, 127434/2026, 127437/2026; d.lgs. 138/2024; legge 90/2024; Regolamento (UE) 2024/2847 (CRA); Circolare AgID 2/2017; linee guida AgID sul procurement ICT. Catalogo SEC-001…SEC-058 e matrice di sovrapposizione."
---

# Cybersecurity normativa applicabile a Telemedic

**Ricerca di riferimento - agente B4, seconda ondata**
**Data di redazione: 25 agosto 2026 - stato normativo accertato alla data**

> **Disclaimer.** Questo documento è un'**analisi tecnica di conformità** redatta per orientare scelte
> di architettura e di prodotto. **Non è un parere legale** e non sostituisce la consulenza di un
> professionista abilitato. Le qualificazioni giuridiche di un soggetto come «essenziale» o
> «importante» ai sensi del d.lgs. 138/2024, l'inclusione nel Perimetro di sicurezza nazionale
> cibernetica e la qualificazione di un software come dispositivo medico dipendono da elementi di
> fatto che vanno accertati caso per caso.

---

## 0. Nota metodologica: che cosa è stato letto e che cosa no

Questo documento risponde alla **questione Q10** lasciata aperta dall'agente R3 (§ 9.3 di
`R3-normativa-italiana.md`), che aveva dichiarato di non aver letto le determinazioni ACN su fonte
primaria.

**Letto integralmente su fonte primaria (PDF firmati digitalmente, sito ACN):**

| Documento | Esito |
|---|---|
| **Determinazione ACN n. 379907 del 19 dicembre 2025** (9 articoli) | ✅ letta integralmente |
| **Determinazione ACN n. 127434 del 13 aprile 2026** (5 articoli) | ✅ letta integralmente |
| **«Linee Guida NIS – Specifiche di base – Guida alla lettura», v. 2.1, aprile 2026** (26 pp., ACN) | ✅ letta integralmente |
| **Circolare AgID 18 aprile 2017, n. 2/2017**, testo in GU n. 103 del 5 maggio 2017 | ✅ letta (tabelle ABSC 1–13) |
| **AgID, «Linee guida sulla sicurezza nel procurement ICT», versione finale aprile 2020** (32 pp.) | ✅ letta (azioni AG1–AG7, AP1–AP4, A1–A13, cap. 5, Appendice A tabelle 8–11) |

**Non letto su fonte primaria - dichiarato esplicitamente:**

1. **Allegati 1, 2, 3 e 4 alla Determinazione ACN n. 379907/2025** (le *specifiche di base* vere e
   proprie: 43 misure e 116 requisiti). Il contenuto è qui ricostruito dalla **Guida alla lettura**
   ufficiale ACN, che è fonte primaria di secondo grado (documento ACN che descrive e commenta i
   propri allegati, riportandone struttura, conteggi, codici identificativi e tre misure per esteso).
   **Come procurarseli**: sono pubblicati in PDF e in **formato `.xlsx`** (versione «soggetti
   importanti» e versione «soggetti essenziali») nella sezione NIS del portale ACN,
   [acn.gov.it/portale/nis/modalita-specifiche-base](https://www.acn.gov.it/portale/nis/modalita-specifiche-base).
   **Prima di derivarne requisiti implementativi vincolanti vanno scaricati e letti riga per riga.**
2. **Determinazione ACN n. 379887/2025** («Portale ACN e Servizi NIS») e **Determinazione ACN
   n. 127437 del 13 aprile 2026** (che la modifica introducendo l'art. 18 sui *fornitori rilevanti*).
   Ricostruite da fonti secondarie qualificate e dalla comunicazione istituzionale ACN. **Gli
   estremi dell'art. 18 vanno verificati sul testo.**
3. **DPCM 30 aprile 2025** sugli elementi essenziali di cybersicurezza nei contratti pubblici
   (art. 14 L. 90/2024) e il **DPCM 2 ottobre 2025** che lo modifica: letti solo tramite fonte
   secondaria qualificata.
4. **Regolamento (UE) 2024/2847 (CRA)**: articoli 2, 14, 24, 25, 71 e Allegato I verificati su
   riproduzioni integrali del testo; i **considerando 15–19** sul software libero sono ricostruiti da
   fonti secondarie qualificate. Testo autentico:
   [EUR-Lex, OJ L 2024/2847 del 20 novembre 2024](https://eur-lex.europa.eu/eli/reg/2024/2847/oj).

Convenzioni: **[VINCOLANTE]**, **[TECNICO-VINCOLANTE]**, **[RACCOMANDATO]**, **[NON VERIFICATO]**
come in `R3-normativa-italiana.md` § 0.

---

## 1. Il problema in una riga

**Telemedic quasi certamente non è soggetto NIS2 in proprio.** Lo sono i suoi utilizzatori - ASL,
aziende ospedaliere, cliniche accreditate di dimensioni medie, gestionali sanitari cloud - e questi
**riversano contrattualmente sul fornitore** una parte consistente dei propri obblighi, per effetto
di tre meccanismi distinti e cumulativi:

1. **art. 24, comma 2, lett. d) e comma 3 del d.lgs. 138/2024** - la sicurezza della catena di
   approvvigionamento è una misura obbligatoria del *cliente*, che deve valutare «le specifiche
   vulnerabilità di ciascun fornitore diretto» e «la qualità complessiva dei prodotti e le pratiche
   di cybersicurezza dei fornitori, comprese le procedure di sviluppo sicuro»;
2. **misure GV.SC-01, GV.SC-02, GV.SC-04, GV.SC-05, GV.SC-07 delle specifiche di base ACN** - che
   traducono quell'obbligo in requisiti documentali e contrattuali verificabili;
3. **art. 18 della Determinazione ACN n. 127437/2026** - che obbliga il soggetto NIS a **dichiarare
   nominativamente ad ACN i propri «fornitori rilevanti»**, con ragione sociale, codice fiscale,
   **Paese della sede legale**, codici CPV e criterio di rilevanza applicato.

Il fornitore che arriva alla gara o alla *due diligence* senza SBOM, senza politica di *disclosure*,
senza *export* forense e senza documentazione di sviluppo sicuro non è «meno competitivo»: è
**inutilizzabile**, perché impedisce al cliente di chiudere le proprie evidenze documentali.

---

## 2. Mappa delle fonti e dei destinatari

| Fonte | Destinatario diretto | Effetto su Telemedic |
|---|---|---|
| **D.lgs. 4 settembre 2024, n. 138** (NIS2) | Soggetti NIS essenziali/importanti (ASL, AO, IRCCS, cliniche accreditate sopra soglia; fornitori di servizi cloud e di servizi TIC gestiti B2B sopra soglia) | Indiretto via catena di fornitura; **diretto** se l'operatore del SaaS Telemedic supera le soglie dimensionali come *cloud service provider* |
| **Determinazioni ACN 379907/2025, 127434/2026, 379887/2025, 127437/2026** | Soggetti NIS | Definiscono le clausole che il cliente inserirà nei contratti e i dati che comunicherà ad ACN sul fornitore |
| **Legge 28 giugno 2024, n. 90** | PA centrali, Regioni, Province autonome, Città metropolitane, Comuni > 100.000 ab. o capoluogo, **aziende sanitarie locali**, società di trasporto pubblico | Il cliente pubblico deve segnalare entro 24 h: serve capacità di rilevazione e ricostruzione |
| **Art. 14 L. 90/2024 + DPCM 30 aprile 2025** | Stazioni appaltanti pubbliche e soggetti PSNC | Requisiti tecnici e criteri di premialità nelle gare ICT |
| **Regolamento (UE) 2024/2847 (CRA)** | Fabbricanti, importatori, distributori di prodotti con elementi digitali; *open-source software steward* | **Escluso** per ciò che ricade sotto MDR (art. 2, par. 2); rilevante per componenti non-MDR e per gli integratori commerciali |
| **Circolare AgID 2/2017 (ABSC)** | Pubbliche amministrazioni | Il cliente PA deve poter dimostrare gli ABSC *anche* sulla componente Telemedic |
| **Linee guida AgID sul procurement ICT (aprile 2020)** | PA acquirenti e centrali di committenza; **rese obbligatorie per le IRT dal DM 21 settembre 2022** | Determinano il capitolato: le azioni AP2–AP4 e il cap. 5 producono requisiti contrattuali diretti |
| **Regolamento (UE) 2016/679, art. 32** | Titolare e responsabile del trattamento | Telemedic è tipicamente **responsabile** ex art. 28: misure tecniche e organizzative adeguate |
| **Regolamento (UE) 2017/745 (MDR), All. I §§ 17.2 e 17.4** + MDCG 2019-16 rev. 1 + EN IEC 81001-5-1:2022 | Fabbricante del dispositivo medico | **Diretto** su Telemedic per effetto della decisione D6 |
| **D.L. 105/2019 conv. L. 133/2019 (PSNC)** | Soggetti puntualmente individuati con atto riservato | Solo eventuale; va verificato con il singolo cliente |

---

## 3. NIS2 in Italia: d.lgs. 4 settembre 2024, n. 138

**Estremi**: decreto legislativo 4 settembre 2024, n. 138, «Recepimento della direttiva (UE)
2022/2555 relativa a misure per un livello comune elevato di cibersicurezza nell'Unione, recante
modifica del regolamento (UE) n. 910/2014 e della direttiva (UE) 2018/1972 e che abroga la direttiva
(UE) 2016/1148». Pubblicato in **GU Serie generale n. 230 del 1° ottobre 2024**, atto 24G00155.
**In vigore dal 16 ottobre 2024.**
[Scheda GU](https://www.gazzettaufficiale.it/eli/id/2024/10/01/24G00155/sg) ·
[Normattiva](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2024-09-04;138)

### 3.1 Ambito soggettivo: la sanità

L'**Allegato I** («settori ad alta criticità») include il **settore sanitario**, insieme a
**infrastrutture digitali** (punto 8) e **gestione dei servizi TIC - *business-to-business***
(punto 9). Nel settore sanitario rientrano, fra gli altri, i **prestatori di assistenza sanitaria**
ai sensi della direttiva 2011/24/UE, i laboratori di riferimento UE, i soggetti che svolgono
attività di ricerca e sviluppo di medicinali, i fabbricanti di dispositivi medici considerati
critici durante un'emergenza sanitaria pubblica.

**Tre implicazioni pratiche per Telemedic:**

1. **L'ASL o l'azienda ospedaliera cliente è soggetto NIS** - quasi sempre **essenziale**, sia come
   prestatore di assistenza sanitaria di grandi dimensioni sia, cumulativamente, come pubblica
   amministrazione. Le strutture private accreditate rientrano se superano le soglie dimensionali.
2. **L'integratore - il gestionale sanitario cloud - è a sua volta candidato soggetto NIS**, non come
   sanità ma come **fornitore di servizi di cloud computing** (Allegato I, punto 8, «infrastrutture
   digitali») o come **fornitore di servizi TIC gestiti B2B** (punto 9), se raggiunge la soglia della
   media impresa (≥ 50 addetti *oppure* fatturato e bilancio annuo > 10 M€). Un gestionale con
   «alcune migliaia di professionisti sanitari attivi» supera quasi certamente quella soglia.
3. **Anche l'eventuale operatore del SaaS multi-tenant di Telemedic** (decisione D8) può diventare
   soggetto NIS come *cloud service provider*, se supera le soglie. **Questo è il caso in cui
   Telemedic smette di essere solo fornitore e diventa soggetto obbligato in proprio.** Va deciso
   consapevolmente: l'offerta on-premise single-tenant lascia l'obbligo interamente al deployer,
   l'offerta SaaS può attrarlo sull'operatore.

### 3.2 Essenziali e importanti (art. 6)

La distinzione dipende dal **livello di criticità intrinseca del settore e della tipologia di
soggetto** e dal **dimensionamento**. Le conseguenze pratiche rilevanti:

| | Soggetti **importanti** | Soggetti **essenziali** |
|---|---|---|
| Misure di sicurezza di base | **Allegato 1** Det. 379907/2025 - **37 misure, 87 requisiti** | **Allegato 2** Det. 379907/2025 - **43 misure, 116 requisiti** |
| Incidenti significativi di base | **Allegato 3** - 3 tipologie (IS-1, IS-2, IS-3) | **Allegato 4** - 4 tipologie (IS-1, IS-2, IS-3, **IS-4**) |
| Vigilanza | *ex post* | *ex ante* ed *ex post* |
| Sanzioni | fino a **7 M€ o 1,4%** del fatturato mondiale annuo | fino a **10 M€ o 2%** del fatturato mondiale annuo |

**Verifica del dato riportato da R3.** R3 riportava «da 37 a 43 misure» da fonte secondaria.
**Il dato è confermato su fonte ACN**: la *Guida alla lettura*, § 2.1, afferma testualmente che
«nel complesso sono state definite **37** misure di sicurezza con **87** requisiti per i soggetti
importanti e **43** misure di sicurezza con **116** requisiti per i soggetti essenziali».

### 3.3 Gli obblighi sostanziali: artt. 23, 24, 25

- **Art. 23** - obblighi in capo agli **organi di amministrazione e direttivi**: approvazione delle
  misure, vigilanza sull'attuazione, formazione obbligatoria, responsabilità per le violazioni.
- **Art. 24** - **misure di gestione dei rischi**. Il comma 2 elenca **dieci elementi** che le misure
  devono coprire (riportati testualmente al § 4.3 di questo documento). Il comma 3 impone di tenere
  conto, nella valutazione dell'adeguatezza, delle **specifiche vulnerabilità di ciascun fornitore
  diretto** e della **qualità complessiva dei prodotti e delle pratiche di cybersicurezza dei
  fornitori, comprese le procedure di sviluppo sicuro**.
- **Art. 25** - **notifica di incidente significativo** al **CSIRT Italia**: pre-notifica entro
  **24 ore**, notifica entro **72 ore**, relazione finale entro **un mese**.

### 3.4 La catena di fornitura: che cosa ricade su Telemedic

L'art. 24, comma 2, lett. d) impone al soggetto NIS di adottare misure sulla
«**sicurezza della catena di approvvigionamento, ivi compresi gli aspetti relativi alla sicurezza
riguardanti i rapporti tra ciascun soggetto e i suoi diretti fornitori o fornitori di servizi**».

Le specifiche di base ACN declinano questo elemento in **cinque misure**: `GV.SC-01`, `GV.SC-02`,
`GV.SC-04`, `GV.SC-05`, `GV.SC-07`. Tre di esse (`GV.SC-01` punto 1, `GV.SC-04` punto 1, `GV.SC-05`
punto 1) sono le uniche a portare la clausola risk-based «**forniture con potenziali impatti sulla
sicurezza dei sistemi informativi e di rete**», il che significa che il soggetto NIS può limitarne
l'ambito alle forniture la cui compromissione può determinare effetti sulla sicurezza - categoria
in cui una piattaforma di televisita ricade con certezza.

Secondo le **FAQ ufficiali ACN**, il processo di sicurezza della catena di approvvigionamento si
articola in **quattro fasi**: (a) valutazione del rischio delle forniture; (b) individuazione dei
requisiti di sicurezza; (c) **enforcement contrattuale**; (d) verifica periodica della conformità.
Le stesse FAQ chiariscono un punto operativamente decisivo: i soggetti **non sono tenuti a
rinegoziare i contratti in essere**, ma devono inserire i requisiti di sicurezza «**nei contratti
nuovi, rinnovati o prorogati a partire dal termine per l'adozione delle misure**».

**Conseguenza per la pianificazione di Telemedic.** Il rilascio della v1.0 (30 novembre 2026) cade
**esattamente nella finestra** in cui i soggetti NIS della prima ondata cominciano a scrivere quelle
clausole nei contratti nuovi. Un prodotto che nasce con la documentazione già pronta entra nel
mercato con un vantaggio strutturale; un prodotto che la costruisce dopo arriva a valle della prima
tornata di rinnovi.

---

## 4. Le determinazioni ACN: estremi verificati e contenuto

### 4.1 Verifica degli estremi (correzione e integrazione di R3 § 9.3)

| Determinazione | Estremi verificati | Applicabile da | Rapporto con le altre |
|---|---|---|---|
| **n. 164179 del 14 aprile 2025** | Prima versione delle *specifiche di base* per gli obblighi di cui agli artt. 23, 24, 25, 29 e 32 | 14 aprile 2025 | **Sostituita** dalla 379907/2025 |
| **n. 379907 del 19 dicembre 2025** | Firmata digitalmente il 18 dicembre 2025, protocollo 19 dicembre 2025, pubblicata il 24 dicembre 2025. Titolo: determinazione ex art. 31, commi 1 e 2, d.lgs. 138/2024, adottata ex art. 40, comma 5, lett. l), che ai sensi dell'art. 42, comma 1, lett. c), **in fase di prima applicazione stabilisce le modalità e le specifiche di base per l'adempimento agli obblighi di cui agli articoli 23, 24, 25, 29 e 32** | **15 gennaio 2026** (art. 9, c. 3) | Art. 9, c. 1: «**aggiorna e sostituisce la determinazione ACN n. 164179 del 14 aprile 2025**» |
| **n. 379887/2025** «Portale ACN e Servizi NIS» | **[NON VERIFICATO sul testo]** - estremi da fonte secondaria; sostituisce la Det. ACN n. 333017/2025 | **31 dicembre 2025** | Modificata dalla 127437/2026 |
| **n. 127434 del 13 aprile 2026** | Firmata digitalmente il 13 aprile 2026, ore 12:12. Stabilisce i **termini** per l'adempimento agli obblighi di cui agli artt. 23, 24, 25, 29 e 32 **per i soggetti inseriti per la prima volta nell'elenco nell'anno solare 2026** | **30 aprile 2026** (art. 5, c. 2) | Integra la 379907/2025, che resta la fonte sostanziale (art. 5, c. 1) |
| **n. 127437 del 13 aprile 2026** | **[NON VERIFICATO sul testo]** - aggiorna la disciplina del Portale ACN e Servizi NIS; introduce l'**art. 18, «elencazione dei fornitori rilevanti»** | aprile 2026 | Modifica la 379887/2025 |

**Esito della verifica richiesta dal mandato:**

- ✅ Il numero **379907/2025** riportato da R3 è **corretto**; va integrato con la data: **19 dicembre 2025**.
- ✅ L'efficacia dal **15 gennaio 2026** è **confermata** (art. 9, c. 3).
- ✅ La sostituzione di una «versione precedente dell'aprile 2025» è **confermata e precisata**:
  Determinazione ACN **n. 164179 del 14 aprile 2025** (art. 9, c. 1).
- ✅ Il numero **379887/2025** per il Portale NIS e l'efficacia dal **31 dicembre 2025** sono
  coerenti con tutte le fonti secondarie consultate ma **non sono stati verificati sul testo**.
- ⚠️ **R3 non poteva conoscere** le determinazioni **n. 127434/2026 e n. 127437/2026 del 13 aprile
  2026**, che modificano il quadro. La seconda, in particolare, introduce l'obbligo che tocca più da
  vicino Telemedic (§ 5.2).

### 4.2 Struttura delle specifiche di base

La Determinazione 379907/2025, **art. 2**, adotta quattro allegati tecnici che «costituiscono parte
integrante» della determinazione:

| Allegato | Contenuto | Destinatario |
|---|---|---|
| **Allegato 1** | Misure di sicurezza di base | Soggetti **importanti** |
| **Allegato 2** | Misure di sicurezza di base | Soggetti **essenziali** |
| **Allegato 3** | Incidenti significativi di base | Soggetti **importanti** |
| **Allegato 4** | Incidenti significativi di base | Soggetti **essenziali** |

Le misure sono state sviluppate **in accordo al «Framework Nazionale per la Cybersecurity e la Data
Protection» (FNCS), edizione 2025**, realizzato dal CIS della Sapienza e dal CINI in collaborazione
con ACN ([cybersecurityframework.it](https://www.cybersecurityframework.it/)). Ogni misura è
composta da:

- un **codice identificativo** nella forma `XX.YY-NN`, dove `XX` è la **funzione**, `YY` la
  **categoria**, `NN` la **sottocategoria** del Framework nazionale;
- una **descrizione** (che riprende la sottocategoria del Framework);
- uno o più **requisiti** numerati, con due colonne booleane `S_I` (soggetto importante) e `S_E`
  (soggetto essenziale) che indicano a chi si applica ciascun requisito.

Esempio testuale riportato dalla Guida alla lettura ACN (misura `PR.DS-11`, «I backup dei dati sono
creati, protetti, mantenuti e verificati»): 2 requisiti per i soggetti importanti, **5 requisiti per
i soggetti essenziali**, di cui 3 riservati ai soli essenziali - fra questi «è assicurata la
riservatezza e l'integrità delle informazioni contenute nei backup mediante adeguata protezione
fisica dei supporti ovvero mediante cifratura» e «è verificata periodicamente l'utilizzabilità dei
backup effettuati mediante test di ripristino».

**Aritmetica interna verificata** (Guida alla lettura, § 2.1 e nota 20):

- **27 misure** hanno requisiti identici per entrambe le tipologie di soggetto;
- **10 misure** hanno requisiti aggiuntivi per i soli essenziali - `GV.RR-04`, `GV.PO-02`,
  `GV.SC-01`, `ID.RA-01`, `ID.RA-05`, `ID.RA-08`, `ID.IM-01`, `PR.DS-11`, `PR.PS-02`, `DE.CM-01`;
- **6 misure** sono previste **per i soli soggetti essenziali** - `ID.AM-03`, `PR.AT-02`, `PR.PS-01`,
  `PR.PS-03`, `PR.IR-03`, `RC.CO-03`.

27 + 10 + 6 = **43** misure per gli essenziali; 43 − 6 = **37** per gli importanti. Dei 29 requisiti
differenziali, 10 afferiscono alle 6 misure riservate agli essenziali e 19 alle 10 misure comuni
con requisiti aggiuntivi.

### 4.3 Il catalogo completo delle 43 misure, mappato sugli elementi dell'art. 24, c. 2

Ricostruito integralmente dall'**Appendice A** della Guida alla lettura ACN («corrispondenza
elementi misure»). Le lettere degli elementi seguono la numerazione italiana (a…i, l).

| Elemento art. 24, c. 2, d.lgs. 138/2024 | Misure di sicurezza |
|---|---|
| **a)** Politiche di analisi dei rischi e di sicurezza dei sistemi informativi e di rete | `GV.OC-04`, `GV.RM-03`, `GV.RR-02`, `GV.PO-01`, `GV.PO-02`, `ID.RA-05`, `ID.RA-06` |
| **b)** Gestione degli incidenti, ivi incluse le procedure e gli strumenti per eseguire le notifiche di cui agli artt. 25 e 26 | `PR.PS-04`, `DE.CM-01`, `DE.CM-09`, `RS.MA-01`, `RS.CO-02`, `RC.RP-01`, `RC.CO-03` |
| **c)** Continuità operativa, ivi inclusa la gestione di backup, il ripristino in caso di disastro, ove applicabile, e gestione delle crisi | `ID.IM-04`, `PR.DS-11` |
| **d)** **Sicurezza della catena di approvvigionamento**, ivi compresi gli aspetti relativi alla sicurezza riguardanti i rapporti tra ciascun soggetto e i suoi diretti fornitori o fornitori di servizi | `GV.SC-01`, `GV.SC-02`, `GV.SC-04`, `GV.SC-05`, `GV.SC-07` |
| **e)** Sicurezza dell'acquisizione, dello sviluppo e della manutenzione dei sistemi informativi e di rete, ivi comprese la gestione e la divulgazione delle vulnerabilità | `GV.SC-05`, `ID.RA-01`, `ID.RA-08`, `PR.PS-01`, `PR.PS-02`, `PR.PS-03`, `PR.PS-06` |
| **f)** Politiche e procedure per valutare l'efficacia delle misure di gestione dei rischi di cybersicurezza | `ID.IM-01` |
| **g)** Pratiche di igiene di base e di formazione in materia di sicurezza informatica | `PR.AT-01`, `PR.AT-02` |
| **h)** Politiche e procedure relative all'uso della crittografia e, ove opportuno, della cifratura | `PR.DS-01`, `PR.DS-02` |
| **i)** Sicurezza e affidabilità del personale, politiche di controllo dell'accesso e gestione dei beni e degli assetti | `GV.RR-04`, `ID.AM-01`, `ID.AM-02`, `ID.AM-03`, `ID.AM-04`, `PR.AA-01`, `PR.AA-03`, `PR.AA-05`, `PR.AA-06`, `PR.IR-01` |
| **l)** Uso di soluzioni di autenticazione a più fattori o di autenticazione continua, di comunicazioni vocali, video e testuali protette, e di sistemi di comunicazione di emergenza protetti da parte del soggetto al proprio interno, ove opportuno | `PR.AA-03`, `PR.DS-02`, `PR.IR-03` |

> **La lettera l) merita attenzione particolare.** È l'unica che nomina espressamente le
> «**comunicazioni vocali, video e testuali protette**». Telemedic - piattaforma di consulto video
> con DTLS-SRTP e chat - è, per un soggetto NIS sanitario, **il mezzo con cui quella misura viene
> attuata**. La misura `PR.IR-03`, riservata ai soli soggetti essenziali, è quella su cui la
> proposta di valore del progetto è più direttamente agganciabile a un obbligo di legge.

### 4.4 Le quattro clausole risk-based

Le specifiche di base non impongono tutto a tutti. L'art. 31 del decreto NIS impone la
proporzionalità, e ACN l'ha declinata con **quattro clausole** che compaiono nei singoli requisiti e
che, **quando compaiono insieme, si applicano in cascata**:

| Clausola | Effetto | Requisiti interessati |
|---|---|---|
| «**per almeno i sistemi informativi e di rete rilevanti**» | Il soggetto può limitare l'**ambito di applicazione** ai sistemi la cui compromissione comporterebbe un impatto significativo sulle attività e sui servizi NIS | 13 requisiti (importanti), **22** (essenziali) |
| «**in accordo agli esiti della valutazione del rischio di cui alla misura `ID.RA-05`**» | Modalità e ambito di attuazione definiti dagli esiti del *risk assessment* | 6 (importanti), **10** (essenziali) |
| «**fatte salve motivate e documentate ragioni normative o tecniche**» | Deroga ammessa, ma con obbligo di **misure di mitigazione compensative** e di descrizione del rischio residuo nel **piano di trattamento del rischio** (`ID.RA-06` punto 2) | 8 (importanti), **10** (essenziali) |
| «**forniture con potenziali impatti sulla sicurezza dei sistemi informativi e di rete**» | Il soggetto limita l'ambito alle forniture la cui compromissione può determinare effetti sulla sicurezza | 3 requisiti (entrambe le tipologie): `GV.SC-01` p. 1, `GV.SC-04` p. 1, `GV.SC-05` p. 1 |

**«Sistemi informativi e di rete rilevanti»** sono definiti dall'art. 1 della Determinazione
379907/2025 come i sistemi «la cui compromissione comporterebbe un impatto significativo sulla
riservatezza, integrità e disponibilità delle attività e dei servizi per i quali il soggetto NIS
rientra nell'ambito di applicazione del decreto NIS». La misura `GV.OC-04` richiede di mantenerne un
**elenco**. Il procedimento di individuazione, secondo la Guida alla lettura, è: (1) identificare
attività e servizi NIS; (2) valutare l'impatto di una compromissione su riservatezza, integrità e
disponibilità; (3) individuare come rilevanti quelli con impatto significativo. **Non è prescritta
una metodologia specifica.**

> **Assunzione di lavoro per Telemedic**: una piattaforma che eroga televisita e teleconsulto per un
> soggetto sanitario essenziale **sarà classificata come sistema rilevante**. La documentazione di
> prodotto deve quindi presumere l'applicazione del profilo più severo - MFA, cifratura dei backup,
> test di ripristino, monitoraggio di rete, protezione degli *endpoint* - e non del profilo minimo.

### 4.5 Il conflitto MDR/NIS2 riconosciuto da ACN

La Guida alla lettura, § 2.3.3, illustra la clausola «fatte salve motivate e documentate ragioni
normative o tecniche» con un esempio che riguarda **direttamente** i dispositivi medici. A proposito
del requisito 1 della misura `DE.CM-09` (presenza di sistemi di protezione degli *endpoint* per il
rilevamento del codice malevolo), ACN scrive:

> «Tale requisito potrebbe tuttavia non essere applicabile nel caso di *endpoint* come, ad esempio,
> **i dispositivi medici per i quali un'eventuale installazione dei sistemi di protezione ne potrebbe
> invalidare la certificazione**.»

**Questo è il punto di raccordo esplicito fra i due regimi.** Un soggetto NIS che utilizza Telemedic
come dispositivo medico marcato CE (decisione D6) può derogare a `DE.CM-09` - ma deve
**motivare e documentare** la ragione normativa e adottare **misure compensative** iscritte nel
piano di trattamento del rischio.

**Requisito di prodotto che ne discende**: Telemedic deve fornire al deployer una **dichiarazione
tecnica** che (a) individui i componenti la cui alterazione invaliderebbe la marcatura CE,
(b) elenchi le misure compensative disponibili nativamente - *hardening* del container, *read-only
filesystem*, verifica dell'integrità delle immagini, monitoraggio esterno del comportamento del
processo, segmentazione di rete - e (c) definisca la configurazione supportata di
anti-malware/EDR sull'host. Senza questo documento il cliente non può chiudere la deroga.

### 4.6 Evidenze documentali: il modello di «dimostrabilità»

**Non esiste un modello di attestazione né una certificazione NIS rilasciata da ACN.** La
dimostrabilità è **documentale e organizzativa**. La Guida alla lettura, § 2.5, elenca le tipologie
di evidenza richieste (in *corsivo* quelle previste per i soli soggetti essenziali):

| Tipologia | Contenuto |
|---|---|
| **Elenchi** | personale dell'organizzazione di sicurezza informatica, *configurazioni di riferimento*, sistemi ai quali è possibile accedere da remoto |
| **Inventari** | apparati fisici, servizi, sistemi e applicazioni software, *flussi di rete*, **servizi erogati dai fornitori**, **fornitori** |
| **Piani** | valutazione dei rischi, continuità operativa, ripristino in caso di disastro, trattamento dei rischi, gestione delle vulnerabilità, adeguamento, *valutazione dell'efficacia delle misure di gestione del rischio*, formazione, risposta agli incidenti |
| **Politiche di sicurezza informatica** | per almeno i requisiti riportati nella tabella 1 in appendice agli allegati 1 e 2 |
| **Procedure** | in relazione agli specifici requisiti per i quali sono richieste |
| **Registri** | esiti del riesame delle politiche, attività di formazione dei dipendenti, *manutenzioni effettuate* |

I documenti «possono essere resi disponibili in formato cartaceo o digitale, purché facilmente
fruibili da chi ha la necessità di conoscerlo e consultarlo». Il soggetto è libero di raggruppare o
distribuire i contenuti fra più documenti.

**Undici documenti richiedono l'approvazione degli organi di amministrazione e direttivi**
(Appendice C della Guida alla lettura):

| Documento | Requisito che ne impone l'approvazione |
|---|---|
| Organizzazione per la sicurezza informatica | `GV.RR-02` punto 1 |
| Politiche di sicurezza informatica | `GV.PO-01` punto 3 |
| Valutazione del rischio posto alla sicurezza dei sistemi informativi e di rete | `ID.RA-05` punto 3 |
| Piano di trattamento del rischio | `ID.RA-06` punto 3 |
| Piano di gestione delle vulnerabilità | `ID.RA-08` punto 4 |
| Piano di adeguamento | `ID.IM-01` punto 1 |
| Piano di continuità operativa | `ID.IM-04` punto 4 |
| Piano di ripristino in caso di disastro | `ID.IM-04` punto 4 |
| Piano di gestione delle crisi | `ID.IM-04` punto 4 |
| Piano di formazione | `PR.AT-01` punto 2 |
| Piano per la gestione degli incidenti di sicurezza informatica | `RS.MA-01` punto 2 |

**Traduzione per Telemedic**: il fornitore non approva nulla di tutto questo - è il consiglio di
amministrazione del cliente a farlo. Ma **due di quegli undici documenti non sono redigibili senza
il fornitore**: l'inventario dei servizi erogati dai fornitori e il piano di gestione delle
vulnerabilità (che deve tenere conto delle vulnerabilità delle dipendenze del prodotto). Il
*deliverable* naturale del progetto è quindi un **fascicolo di conformità NIS pre-compilato** che il
cliente possa incorporare: SBOM, elenco dei flussi di rete, configurazioni di riferimento, RACI
delle responsabilità di sicurezza, procedura di *disclosure*.

---

## 5. Il Portale NIS e l'obbligo sui fornitori rilevanti

### 5.1 Registrazione e finestre annuali (Det. 379887/2025)

**[NON VERIFICATO sul testo - ricostruito da fonti secondarie qualificate e comunicazione ACN]**

- La Determinazione **n. 379887/2025** aggiorna e sostituisce la Determinazione **n. 333017/2025** ed
  è **applicabile dal 31 dicembre 2025**.
- **Art. 11**: finestra annuale **1° gennaio – 28 febbraio** per la **registrazione** sulla
  piattaforma ACN e per la **dichiarazione** («NIS/Dichiarazione»). I soggetti già registrati
  confermano o aggiornano i dati; i nuovi completano la registrazione iniziale.
- Finestra **15 aprile – 31 maggio**: **aggiornamento annuale delle informazioni**.
- Nella funzionalità «Aggiornamento dati» è stata introdotta una sezione per i dati del **referente
  CSIRT** (codice fiscale e indirizzo email), che si affianca al **punto di contatto** (art. 7,
  c. 1, lett. c) del decreto NIS) e al **sostituto del punto di contatto** (art. 7, c. 4, lett. d).
- Nel 2026 ACN ha inoltre previsto una **finestra di categorizzazione 1° maggio – 30 giugno 2026** e
  attività di *business impact analysis* nei mesi di maggio e giugno 2026, con guide semplificate
  per settore prodotte dai tavoli settoriali.

**Alla data di redazione (25 agosto 2026) entrambe le finestre 2026 sono chiuse.** La prossima
scadenza rilevante per i soggetti della prima ondata è il **31 ottobre 2026**.

### 5.2 L'art. 18 della Det. 127437/2026: l'elenco dei fornitori rilevanti

**[NON VERIFICATO sul testo - ricostruito da fonti secondarie qualificate concordanti e dalla
comunicazione istituzionale ACN del 13 aprile 2026]**

**Questa è la disposizione che tocca Telemedic più da vicino di qualsiasi altra.**

La Determinazione ACN **n. 127437 del 13 aprile 2026** introduce nella disciplina del Portale un
**art. 18, «elencazione dei fornitori rilevanti»**: ogni soggetto NIS deve **comunicare ad ACN,
attraverso la piattaforma, l'elenco nominativo dei propri fornitori rilevanti**, nella finestra
**15 aprile – 31 maggio** di ciascun anno. Prima scadenza: **31 maggio 2026**.

**Definizione.** Un fornitore è «rilevante» se fornisce servizi o prodotti a un soggetto NIS e
soddisfa **almeno uno** dei due criteri:

- **Criterio A - fornitura TIC**: la fornitura è riconducibile alle attività o ai servizi di cui
  all'**Allegato I, punti 8 e 9**, del decreto NIS (infrastrutture digitali; gestione dei servizi TIC
  *business-to-business*). Esempi indicati: servizi cloud, *data center*, servizi DNS, CDN, servizi
  di sicurezza gestiti (MSSP), prestatori di servizi fiduciari.
- **Criterio B - fornitura non fungibile**: l'interruzione o la compromissione della fornitura ha un
  impatto significativo sulla capacità del soggetto NIS di erogare le attività o i servizi per cui
  rientra nell'ambito del decreto, in assenza di alternative prontamente disponibili. Esempi
  indicati: connettività dati/voce non ridondata, fornitura di energia elettrica.

**Dati da trasmettere per ciascun fornitore rilevante** (cinque campi):

1. ragione sociale;
2. codice fiscale / identificativo fiscale;
3. **Paese della sede legale**;
4. **codici CPV** delle forniture utilizzate, ai sensi del Regolamento (CE) n. 2195/2002;
5. **criterio di rilevanza applicato** (A, B, o entrambi).

**Chiarimenti ACN rilevanti** (FAQ FRN.8 e FRN.9):

- **fornitura intermediata**: se il fornitore A contrattualizza ma il fornitore B eroga
  effettivamente, va dichiarato **B**; A va dichiarato solo se contribuisce funzionalmente
  all'erogazione, non se è mero *broker* o rivenditore;
- **fornitori infragruppo**: l'appartenenza allo stesso gruppo **non abbassa** le soglie di
  valutazione; entrambi i soggetti vanno dichiarati se i criteri di impatto sono soddisfatti.

L'inadempimento espone il soggetto NIS alle sanzioni amministrative dell'**art. 38 del d.lgs.
138/2024**, proporzionali al fatturato mondiale annuo.

**Quattro conseguenze operative dirette per Telemedic:**

1. **Chi eroga Telemedic in SaaS a un soggetto NIS sarà dichiarato ad ACN come fornitore rilevante**
   con ogni probabilità sotto **entrambi** i criteri: A perché eroga un servizio cloud/TIC gestito,
   B perché la sospensione della piattaforma di televisita interrompe un servizio sanitario.
   Nell'**installazione on-premise** il criterio A può non applicarsi, ma il criterio B resta:
   la manutenzione e il supporto restano forniture non fungibili.
2. **Il «Paese della sede legale» è un campo obbligatorio della dichiarazione ad ACN.** La filosofia
   di *sovereign telemedicine* del progetto (vincolo V1) cessa di essere un argomento di marketing e
   diventa **un dato che il cliente deve trasmettere all'autorità nazionale**. Un fornitore con sede
   in Italia o nell'UE riduce l'esposizione del cliente; una dipendenza *runtime* da un servizio
   US-based la aumenta, e il cliente lo scoprirà nel momento in cui compila la dichiarazione.
3. **Servono i codici CPV.** Il progetto deve pubblicare, nella documentazione commerciale e di
   conformità, i codici CPV pertinenti alla fornitura, per evitare che ogni cliente li ricostruisca
   in modo diverso. Riferimento: Regolamento (CE) n. 2195/2002 e successive modifiche; le famiglie
   pertinenti sono quelle 48xxxxxx (pacchetti software e sistemi di informazione), 72xxxxxx (servizi
   informatici) e 85xxxxxx (servizi sanitari) - **la selezione puntuale va concordata con un
   consulente di appalti e verificata sul vocabolario vigente**.
4. **La catena di fornitura di Telemedic diventa visibile.** Se Telemedic si appoggia a un provider
   TURN gestito, a un servizio di *push notification*, a un fornitore di firma digitale remota o a
   un CDN, quei soggetti diventano potenzialmente fornitori rilevanti «di secondo livello» per il
   cliente. Il vincolo V1 (nessuna dipendenza *runtime* da servizi cloud US-based) ha quindi anche
   una motivazione regolatoria, non solo etica: **riduce la superficie dichiarativa del cliente**.

---

## 6. Notifica degli incidenti: che cosa deve saper fare il prodotto

### 6.1 I due regimi e le loro tempistiche

| | **NIS2 - art. 25 d.lgs. 138/2024** | **Legge 28 giugno 2024, n. 90 - art. 1** |
|---|---|---|
| Destinatario dell'obbligo | Soggetti NIS essenziali e importanti | PA centrali, Regioni, PA, Città metropolitane, Comuni > 100.000 ab. o capoluogo, **aziende sanitarie locali**, società di trasporto pubblico |
| Destinatario della notifica | **CSIRT Italia** presso ACN | **ACN** |
| Primo adempimento | **Pre-notifica entro 24 ore** dalla conoscenza dell'incidente significativo | **Segnalazione** «senza ritardo e comunque entro il termine massimo di **ventiquattro ore**» dalla conoscenza |
| Secondo adempimento | **Notifica entro 72 ore** | **Notifica completa entro 72 ore** |
| Terzo adempimento | **Relazione finale entro un mese** | - |
| Tassonomia | **IS-1…IS-4** (allegati 3 e 4 Det. 379907/2025) | Tassonomia degli incidenti definita da ACN ai sensi della normativa PSNC/L. 90 |
| Sanzione | artt. 37-38 d.lgs. 138/2024 | Reiterazione entro cinque anni: sanzione amministrativa **25.000–125.000 €** e responsabilità disciplinare |

Riferimenti: [L. 90/2024 su Normattiva](https://www.normattiva.it/atto/caricaDettaglioAtto?atto.dataPubblicazioneGazzetta=2024-07-02&atto.codiceRedazionale=24G00108)
(GU Serie generale n. 153 del 2 luglio 2024; in vigore dal 17 luglio 2024).

**Chi notifica.** L'obbligo è **del soggetto NIS**, non del fornitore. Ma il fornitore è, quasi
sempre, **l'unico che dispone dell'evidenza**. Le FAQ ACN chiariscono che negli incidenti di catena
di fornitura la responsabilità dipende dal ruolo (cliente o fornitore) e che per i servizi cloud
valgono regole specifiche di allocazione; l'**oggetto della compromissione** può essere costituito
anche da «dati digitali sui quali il soggetto esercita il controllo anche parziale», categoria che
comprende espressamente «i dati per i quali non si detiene la proprietà, ma si dispone di una
responsabilità, anche parziale, per il loro trattamento, in forza di contratti, accordi o della
normativa vigente, come, ad esempio, nel caso di un fornitore di servizi *cloud* che gestisce i dati
di un cliente tramite i propri sistemi informativi e di rete».

### 6.2 La tassonomia IS-1…IS-4 (Allegati 3 e 4, Det. 379907/2025)

Modello a tre elementi: **condizione** (circostanza che determina l'obbligo), **compromissione**
(evento di sicurezza), **oggetto della compromissione** (risorsa impattata).

| Codice | Condizione | Compromissione | Oggetto | Importanti | Essenziali |
|---|---|---|---|:-:|:-:|
| **IS-1** | Il soggetto ha evidenza | Perdita di riservatezza, verso l'esterno | Dati digitali | ● | ● |
| **IS-2** | Il soggetto ha evidenza | Perdita di integrità, con impatto verso l'esterno | Dati digitali | ● | ● |
| **IS-3** | Il soggetto ha evidenza | Violazione dei livelli di servizio attesi | Servizi e/o attività | ● | ● |
| **IS-4** | Il soggetto ha evidenza | Accesso non autorizzato o con abuso dei privilegi concessi | Dati digitali | - | ● |

**Quattro punti tecnici decisivi che discendono dal modello:**

1. **Il *dies a quo* è l'acquisizione dell'evidenza, non l'occorrenza dell'incidente.** ACN è
   esplicita: «l'acquisizione dell'evidenza è tipicamente successiva al verificarsi dell'incidente e
   definisce il momento dal quale decorre il termine per la trasmissione della pre-notifica (24 ore)
   e della notifica (72 ore)». Il prodotto che rileva prima accorcia il ritardo, non il termine.
2. **L'evidenza si acquisisce in tre modi**: segnalazioni di attori esterni (tipicamente il CSIRT
   Italia), segnalazioni di attori interni (l'utente che chiama l'*help desk*), **analisi degli
   eventi di sicurezza rilevati dai sistemi di monitoraggio**. Solo la terza è automatizzabile.
3. **IS-3 dipende dai «livelli di servizio attesi» (SL) definiti dal soggetto ai sensi della misura
   `DE.CM-01`**, che ACN distingue nettamente dagli SLA contrattuali. Esempio ufficiale ACN: se il
   livello di servizio atteso è «disponibile almeno il 99% del tempo su base giornaliera», una
   indisponibilità superiore a **14 minuti e 24 secondi** in un giorno costituisce violazione e
   quindi incidente significativo notificabile. Altro esempio: «indisponibilità del sito *web* per
   oltre 30 minuti consecutivi» o «limitata disponibilità di un servizio *online* per oltre il 5%
   degli utenti».
   > **Conseguenza per Telemedic**: gli SLA del **DM 21 settembre 2022, Tabella 3** (risoluzione in
   > 60 minuti per la priorità Critica, H24 7/7) e i livelli di servizio attesi ai sensi di
   > `DE.CM-01` **non sono la stessa cosa**, ma il cliente li tarerà l'uno sull'altro. Il prodotto
   > deve **misurare e storicizzare la propria disponibilità con granularità sufficiente a
   > riconoscere il superamento di una soglia del 99% su base giornaliera**, per tenant e per
   > servizio. Le metriche già previste su TimescaleDB (RTT, *packet loss*, *jitter*, *bitrate*)
   > sono necessarie ma non sufficienti: serve un indicatore di **disponibilità del servizio**,
   > distinto dalla qualità della singola sessione.
4. **IS-4 richiede «parametri quali-quantitativi» definiti ai sensi di `DE.CM-01`.** ACN ne dà due
   esempi: indicatore quantitativo - «il superamento di una soglia per le interrogazioni di una banca
   dati da parte di un singolo utente»; indicatore qualitativo - «l'accesso di un amministratore di
   sistema al di fuori dell'orario di servizio».
   > **Conseguenza per Telemedic**: l'audit log Envers (vincolo V5) deve essere **interrogabile per
   > soglie e pattern**, non solo consultabile. Servono contatori per attore e per unità di tempo
   > sugli accessi a dato sanitario e la marcatura temporale coerente per riconoscere gli accessi
   > fuori orario. Questo è un requisito funzionale, non una feature di osservabilità.

**«Abuso dei privilegi concessi»** è definito da ACN come la fattispecie in cui l'utente «ha
l'autorizzazione tecnica (disponibilità di credenziali che sono configurate per accedere ai dati)
per accedere a determinati dati ma utilizza tale accesso in modo illecito», in violazione delle
politiche o per scopi estranei alle necessità funzionali. **È esattamente lo scenario dell'accesso
indebito alla cartella clinica da parte di personale autorizzato** - il caso più frequente nei
provvedimenti del Garante in ambito sanitario. Il prodotto deve renderlo rilevabile.

### 6.3 Le capacità tecniche che il prodotto deve fornire

Perché il cliente rispetti le 24 ore, il prodotto deve garantire, **come funzionalità documentate e
testate**, non come sottoprodotto dei log applicativi:

| Capacità | Perché | Requisito |
|---|---|---|
| **Rilevazione** di accessi anomali e superamenti di soglia, con notifica *push* verso il SIEM del deployer | L'evidenza deve arrivare in ore, non in giorni | `SEC-031`, `SEC-032` |
| **Ricostruzione della sequenza temporale** degli eventi di una sessione e di un account, con orologio sincronizzato e *timestamp* monotoni | La notifica delle 72 ore richiede la cronologia | `SEC-034`, `SEC-035` |
| **Esportazione forense** in formato aperto, con *hash* di integrità del pacchetto esportato | L'export deve reggere in sede ispettiva e giudiziaria | `SEC-036` |
| **Integrità e non alterabilità dei log** (append-only, *hash chain*, conservazione separata dai dati applicativi) | Un log alterabile non prova nulla | `SEC-033` |
| **Misurazione della disponibilità** per tenant e servizio, con soglie configurabili e allarme al superamento | IS-3 dipende dai livelli di servizio attesi | `SEC-037` |
| **Notifica al cliente entro un termine contrattuale inferiore alle 24 ore** | Il cliente ha 24 ore dal *proprio* momento di conoscenza; se lo conosce alla 23ª ora ha fallito | `SEC-038` |
| **Registro delle manutenzioni e degli aggiornamenti** applicati all'installazione | Evidenza documentale richiesta dalle specifiche di base (registri) e dall'Accordo 215/CSR 2020 | `SEC-039` |

> **Nota sulla conservazione.** Il **DM 19 novembre 2025, Allegato 4** impone la tracciabilità
> mediante file di log protetti con conservazione a **24 mesi** e la conservazione dei dati di
> accesso/autenticazione a **12 mesi** (cfr. `R3-normativa-italiana.md` § 9.5). Le misure ACN non
> fissano una durata: la fissa il regime italiano della telemedicina. **Prevale il termine più
> lungo applicabile**: 24 mesi per i log di tracciabilità.

### 6.4 Il processo di gestione degli incidenti secondo ACN

ACN ha pubblicato il **31 dicembre 2025** le «**Linee guida NIS – Specifiche di base – Definizione
del processo di gestione degli incidenti di sicurezza informatica**», che propongono un modello di
processo e collegano ciascuna fase alle misure di sicurezza di base. Il documento contiene due
appendici (specifiche di base e misure NIS rilevanti) ed è pubblicato nella sezione NIS del portale
ACN, [acn.gov.it/portale/nis/modalita-specifiche-base](https://www.acn.gov.it/portale/nis/modalita-specifiche-base).
**[Non letto integralmente: da acquisire prima di progettare la procedura di risposta agli incidenti
di Telemedic.]** Le misure di riferimento sono `RS.MA-01` (piano per la gestione degli incidenti,
approvato dagli organi direttivi), `RS.CO-02` (comunicazione), `RC.RP-01` (ripristino) e `RC.CO-03`
(comunicazione di ripristino, solo essenziali).

---

## 7. Cyber Resilience Act - Regolamento (UE) 2024/2847

**Estremi**: Regolamento (UE) 2024/2847 del Parlamento europeo e del Consiglio del 23 ottobre 2024
relativo a requisiti orizzontali di cibersicurezza per i prodotti con elementi digitali e che
modifica i regolamenti (UE) n. 168/2013 e (UE) 2019/1020 e la direttiva (UE) 2020/1828 («regolamento
sulla ciberresilienza»). Pubblicato in **GU UE L, 2024/2847, del 20 novembre 2024**.
**Entrato in vigore il 10 dicembre 2024.**
[EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/2847/oj)

### 7.1 Date di applicazione scaglionate (art. 71)

| Data | Che cosa si applica | Stato al 25 agosto 2026 |
|---|---|---|
| **10 dicembre 2024** | Entrata in vigore | vigente |
| **11 giugno 2026** | **Capo IV (artt. 35–51)** - notifica degli organismi di valutazione della conformità | **già applicabile** |
| **11 settembre 2026** | **Art. 14** - obblighi di **segnalazione delle vulnerabilità attivamente sfruttate e degli incidenti gravi** | **fra 17 giorni** |
| **11 dicembre 2027** | **Il resto del regolamento** - requisiti essenziali, valutazione della conformità, marcatura CE, obblighi degli operatori economici | futuro |

> ⚠️ **L'11 settembre 2026 cade prima del rilascio della v1.0 di Telemedic (30 novembre 2026).**
> L'obbligo di segnalazione dell'art. 14 riguarda i **fabbricanti** e, nei limiti dell'art. 24,
> par. 3, gli *open-source software steward*. Va stabilito con chiarezza se e a chi si applica
> (§ 7.3-7.4). **Esiste un dibattito interpretativo** su come l'art. 14 operi su prodotti immessi
> sul mercato prima dell'11 dicembre 2027: il testo dell'art. 71 è però univoco nel fissare la
> decorrenza al **11 settembre 2026**.

### 7.2 L'esclusione dei dispositivi medici (art. 2, par. 2) - il punto decisivo

L'**art. 2, par. 2** stabilisce che il regolamento **non si applica** ai prodotti con elementi
digitali cui si applicano i seguenti atti:

- **Regolamento (UE) 2017/745 (MDR)**;
- Regolamento (UE) 2017/746 (IVDR);
- Regolamento (UE) 2019/2144 (veicoli a motore).

I paragrafi successivi escludono i prodotti certificati ai sensi del Regolamento (UE) 2018/1139
(aviazione civile) e gli equipaggiamenti disciplinati dalla direttiva 2014/90/UE (equipaggiamento
marittimo).

**Conseguenza per Telemedic, articolata in tre casi distinti:**

| Caso | CRA si applica? | Perché |
|---|---|---|
| **Telemedic come dispositivo medico Classe I marcato CE** (decisione D6), immesso sul mercato come tale | **No** | Art. 2, par. 2: si applica l'MDR. I requisiti di cibersicurezza arrivano dall'**Allegato I, §§ 17.2 e 17.4 MDR** |
| **Componenti distribuiti separatamente e non coperti dalla marcatura CE** - SDK Java, SDK TypeScript, Web Component white-label, chart Helm, immagini container | **Potenzialmente sì** dall'11 dicembre 2027, **se** immessi sul mercato nel corso di un'attività commerciale | L'esclusione è **per prodotto**, non per progetto. Un SDK che non è il dispositivo medico non è coperto dall'esclusione |
| **Il prodotto commerciale dell'integratore che incorpora Telemedic** | **Sì**, salvo che sia esso stesso un dispositivo medico | L'integratore è **fabbricante** ai sensi del CRA per ciò che immette sul mercato |

> **Questa asimmetria va documentata esplicitamente.** Il confine MDR/CRA passa dentro il perimetro
> di Telemedic e coincide in larga parte con il confine già tracciato dal vincolo **V2** («veicolo di
> comunicazione» *vs* «supporto alla decisione clinica»). Ma non coincide del tutto: un SDK di
> integrazione può stare **fuori** dal dispositivo medico e **dentro** il CRA. Serve un ADR che
> stabilisca, per ciascun artefatto distribuito, se è coperto dalla marcatura CE.

### 7.3 Il regime dell'open source

Il CRA non esenta «l'open source» in quanto tale. Esenta **ciò che non è immesso sul mercato nel
corso di un'attività commerciale**. Il perno è la nozione di **attività commerciale**, chiarita dai
considerando (in particolare **15** e **18**).

**Che cosa NON costituisce, di per sé, attività commerciale:**

- lo sviluppo e la messa a disposizione di software libero senza corrispettivo;
- l'accettazione di **donazioni**, purché non eccedano «i costi associati alla progettazione, allo
  sviluppo e alla fornitura» del prodotto;
- il recupero dei costi o il reinvestimento degli utili in attività non commerciali;
- il contributo occasionale a progetti altrui.

**Che cosa costituisce attività commerciale:**

- **richiedere un prezzo** per il prodotto;
- **richiedere un prezzo per servizi di supporto tecnico** (quando non si limita al recupero dei
  costi effettivi);
- fornire una **piattaforma software attraverso cui il fabbricante monetizza altri servizi**;
- l'**uso di dati personali** per ragioni diverse dal solo miglioramento della sicurezza, della
  compatibilità o dell'interoperabilità del software.

**La figura dell'*open-source software steward* (art. 3, punto 14 e art. 24).** È una **persona
giuridica**, diversa dal fabbricante, «che ha lo scopo o l'obiettivo di fornire sistematicamente
sostegno su base continuativa» allo sviluppo di prodotti open source specifici destinati ad attività
commerciali, e di assicurarne la sostenibilità. **Una persona fisica non può essere uno *steward***.

Gli obblighi dello *steward* (art. 24) sono **volutamente più leggeri** di quelli del fabbricante:

1. **attuare e documentare una politica di cibersicurezza** che favorisca lo sviluppo di un prodotto
   sicuro e l'efficace trattamento delle vulnerabilità, e che promuova la segnalazione volontaria
   delle vulnerabilità e la condivisione delle informazioni nella comunità open source;
2. **cooperare con le autorità di vigilanza del mercato** su richiesta motivata, fornendo la
   documentazione in una lingua comprensibile;
3. **applicare l'art. 14** (segnalazione di vulnerabilità attivamente sfruttate e di incidenti gravi)
   nella misura in cui sono coinvolti nello sviluppo dei prodotti e limitatamente agli incidenti che
   colpiscono i sistemi utilizzati per lo sviluppo.

Lo *steward* **non è soggetto alle sanzioni** previste per le violazioni del regolamento e **non
appone la marcatura CE**. L'**art. 25** autorizza inoltre la Commissione ad adottare atti delegati
per istituire **programmi volontari di attestazione della sicurezza** dei prodotti open source,
destinati a facilitare la *due diligence* degli integratori.

### 7.4 Che cosa cambia per Telemedic e per chi lo integra

**Situazione attuale del progetto** (repository di titolarità di una persona fisica, licenza
Apache-2.0, nessun corrispettivo):

- Telemedic **non è un prodotto immesso sul mercato nel corso di un'attività commerciale**;
- il titolare, in quanto **persona fisica**, non può essere qualificato come *open-source software
  steward*;
- **nessun obbligo CRA sorge oggi in capo al progetto.**

**Le tre soglie che cambiano il quadro, in ordine di probabilità:**

| Soglia | Effetto | Chi diventa obbligato |
|---|---|---|
| **Il progetto passa a una persona giuridica** (fondazione, associazione, srl) che fornisce sostegno sistematico e continuativo, e il software è destinato ad attività commerciali di terzi | Nascono gli obblighi **dell'art. 24** (politica di cibersicurezza documentata, cooperazione, segnalazione ex art. 14 nei limiti indicati) | La persona giuridica, come *steward* |
| **Il progetto monetizza**: supporto a pagamento con SLA, *hosting* gestito, licenza commerciale duale, edizione *enterprise* | Il monetizzatore diventa **fabbricante** per ciò che immette sul mercato: requisiti essenziali dell'Allegato I, valutazione della conformità, **marcatura CE**, documentazione tecnica (Allegato VII), periodo di supporto (minimo 5 anni), obblighi di segnalazione dell'art. 14 | Chi monetizza |
| **Un integratore incorpora Telemedic nel proprio prodotto commerciale** | L'integratore è **fabbricante del prodotto risultante** e risponde dell'intero, componenti open source compresi. Deve esercitare **due diligence** sui componenti di terzi integrati | L'integratore |

> **Punto da mettere per iscritto nella documentazione e nel NOTICE.** La licenza Apache-2.0 **non
> trasferisce** obblighi regolatori: nessuna clausola di *disclaimer* di garanzia sposta sul
> ricevente la responsabilità del CRA, dell'MDR o del GDPR. Chi integra Telemedic in un prodotto
> commerciale è fabbricante *ex lege*, indipendentemente da quanto scritto nella licenza. La
> documentazione deve dirlo con chiarezza, perché è la domanda che ogni integratore porrà.

**Strategia raccomandata - «essere un buon componente».** Anche in assenza di obbligo, il progetto
dovrebbe adottare volontariamente il *set* minimo che l'integratore-fabbricante gli chiederà comunque
per adempiere alla propria *due diligence*, e che coincide in larga parte con quanto già richiesto da
NIS2, dagli ABSC e dall'MDR:

1. **SBOM** in formato **CycloneDX** (già previsto dalla decisione D10), pubblicata per ogni rilascio
   e firmata;
2. **VEX** (*Vulnerability Exploitability eXchange*) per dichiarare quali CVE delle dipendenze sono
   effettivamente sfruttabili nel contesto del prodotto - è ciò che evita all'integratore di dover
   rimediare vulnerabilità irrilevanti;
3. **`SECURITY.md`** con **politica di divulgazione coordinata** delle vulnerabilità, canale di
   contatto, tempi di riscontro e di rimedio dichiarati;
4. **dichiarazione del periodo di supporto** per ciascuna *release* (il CRA impone al fabbricante un
   minimo di 5 anni; un progetto che dichiara meno rende il proprio integratore non conforme);
5. **attestazione di assenza di vulnerabilità note sfruttabili** al momento del rilascio, sostenuta
   dalla *pipeline* SAST/DAST/SCA già prevista da D10;
6. **firma degli artefatti** e **provenance** verificabile (SLSA), perché la *due diligence*
   dell'integratore include la verifica dell'origine.

### 7.5 SBOM: che cosa chiede esattamente il CRA

L'**Allegato I, Parte II, punto 1** impone al fabbricante di identificare e documentare le
vulnerabilità e i componenti contenuti nel prodotto, **elaborando una distinta base del software
(SBOM) in un formato comunemente utilizzato e leggibile automaticamente, che copra almeno le
dipendenze di primo livello del prodotto**.

Tre precisazioni operative, spesso fraintese:

1. **Il minimo di legge sono le dipendenze di primo livello**, non l'albero transitivo completo. Una
   SBOM CycloneDX generata dal *build* Maven e dal *build* npm soddisfa e supera il minimo.
2. **La SBOM non deve necessariamente essere pubblicata**: il CRA la richiede come parte della
   documentazione tecnica, da rendere disponibile alle autorità di vigilanza su richiesta motivata.
   La pubblicazione è però la scelta razionale per un progetto open source che vuole essere
   integrabile.
3. Gli **altri obblighi della Parte II** dell'Allegato I sono: affrontare senza indugio le
   vulnerabilità mediante aggiornamenti di sicurezza; effettuare test e riesami periodici della
   sicurezza; **divulgare pubblicamente le informazioni sulle vulnerabilità corrette** una volta reso
   disponibile l'aggiornamento; attuare una **politica di divulgazione coordinata**; adottare misure
   per facilitare la condivisione delle informazioni sulle vulnerabilità potenziali; garantire
   **meccanismi sicuri di distribuzione degli aggiornamenti**; distribuire le *patch* senza indugio e
   a titolo gratuito.

I requisiti della **Parte I** (proprietà del prodotto) più direttamente rilevanti per Telemedic:
immissione sul mercato **senza vulnerabilità note sfruttabili**; **configurazione sicura per
impostazione predefinita**, con possibilità di ripristino allo stato di fabbrica; **aggiornamenti di
sicurezza automatici** con meccanismo di rinuncia chiaro; protezione dell'accesso mediante
autenticazione e gestione delle identità; **protezione della riservatezza dei dati mediante cifratura
in transito e a riposo secondo lo stato dell'arte**; **minimizzazione dei dati**; resilienza agli
attacchi di *denial of service*; **registrazione e monitoraggio delle attività rilevanti per la
sicurezza**, con meccanismo di rinuncia; possibilità per gli utenti di **rimuovere in modo sicuro e
permanente** dati e impostazioni.

---

## 8. Misure minime AgID: la Circolare 2/2017 (ABSC)

**Estremi**: Circolare AgID 18 aprile 2017, n. 2/2017, «Sostituzione della circolare n. 1/2017 del
17 marzo 2017, recante: *Misure minime di sicurezza ICT per le pubbliche amministrazioni*
(Direttiva del Presidente del Consiglio dei ministri 1° agosto 2015)». Pubblicata in **GU Serie
generale n. 103 del 5 maggio 2017**. Termine di adeguamento originario: **31 dicembre 2017**.
**[VINCOLANTE per le PA]** ·
[Scheda GU](https://www.gazzettaufficiale.it/eli/id/2017/05/05/17A03060/sg) ·
[Testo PDF, CERT-AgID](https://cert-agid.gov.it/download/CircolareAgID_170418_n_2_2017_Mis_minime_sicurezza_ICT_PA-GU-103-050517-2.pdf)

### 8.1 Struttura

Gli **ABSC - *AgID Basic Security Control(s)*** derivano dai **CIS Critical Security Controls**
versione 6.0 (ottobre 2015), confrontata con la 5.1. Ogni ABSC è identificato da un codice
gerarchico a tre livelli `x.y.z`, dove `x` è la famiglia (che corrisponde al CSC), `y` il controllo
di secondo livello, `z` il controllo di terzo livello. Ogni riga della tabella riporta la
corrispondenza con la *subcategory* del **Framework Nazionale di Sicurezza Cibernetica (FNSC)** e tre
colonne booleane: **Minimo** (obbligatorio: nessuna amministrazione può scendere sotto), **Standard**
(riferimento per la generalità delle PA), **Alto** (obiettivo per le realtà più esposte). Le
amministrazioni che gestiscono infrastrutture NSC dovrebbero collocarsi almeno a livello «standard».

**Le otto famiglie adottate** (delle 20 dei CSC, AgID ne ha selezionate otto):

| ABSC | Titolo | Traduzione in requisito di prodotto |
|---|---|---|
| **ABSC 1** (CSC 1) | Inventario dei dispositivi autorizzati e non autorizzati | Inventario dei nodi dell'installazione; identificazione dei client che accedono |
| **ABSC 2** (CSC 2) | Inventario dei software autorizzati e non autorizzati | **SBOM**; elenco delle immagini container e delle versioni; verifica dell'integrità dei file eseguibili |
| **ABSC 3** (CSC 3) | Proteggere le configurazioni di hardware e software sui dispositivi mobili, laptop, workstation e server | **Configurazioni sicure standard documentate** (*hardening baseline*); immagini di installazione conservate in modalità protetta; **amministrazione remota su protocolli sicuri**; strumenti di gestione della configurazione |
| **ABSC 4** (CSC 4) | Valutazione e correzione continua della vulnerabilità | Scansione periodica; **SCAP/CVE/CCE**; correlazione dei log di sistema con le scansioni; piano di gestione del rischio delle vulnerabilità; patch con priorità basata sul rischio; **ambiente di test per le patch dei prodotti non standard** |
| **ABSC 5** (CSC 5) | Uso appropriato dei privilegi di amministratore | Inventario delle utenze amministrative; **distinzione completa fra utenze privilegiate e non privilegiate**; utenze amministrative nominative; **MFA per tutti gli accessi amministrativi**; tracciamento dei tentativi falliti; alert su aggiunta di utenza amministrativa |
| **ABSC 8** (CSC 8) | Difese contro i malware | Anti-malware con aggiornamento automatico; **log inviati a un repository centrale (syslog) stabilmente archiviati**; disattivazione dell'esecuzione automatica dei contenuti dinamici; procedura di risposta agli incidenti con trasmissione dei campioni al provider |
| **ABSC 10** (CSC 10) | Copie di sicurezza | **Backup settimanale almeno delle informazioni strettamente necessarie al ripristino**; capacità di recupero di SO, applicazioni e dati; backup multipli con strumenti diversi; **verifica periodica mediante test di ripristino**; **cifratura dei backup**; **copie non accessibili in modo permanente dal sistema** (protezione contro il ransomware) |
| **ABSC 13** (CSC 13) | Protezione dei dati | Analisi dei dati per individuare quelli con particolari requisiti di riservatezza cui va applicata la protezione crittografica; **cifratura dei dispositivi portatili**; DLP; monitoraggio del traffico uscente; **limitazione degli accessi ai dati in modo autorizzato dalla sorgente** (ACL); blocco del traffico verso URL in *blacklist* |

**Perché rilevano per Telemedic anche se il destinatario è la PA.** Il cliente PA deve poter
**dimostrare** gli ABSC di livello minimo **anche sulla componente Telemedic**. Se il prodotto non
espone l'inventario software, non documenta la *baseline* di *hardening*, non consente il backup
cifrato e il test di ripristino, non centralizza i log e non separa le utenze amministrative, il
cliente non può chiudere i controlli. Sono quindi requisiti di prodotto, non di deployment.

---

## 9. Linee guida AgID sulla sicurezza nel procurement ICT

**Estremi**: AgID, «Linee guida - Sicurezza nel *Procurement* ICT», versione finale **aprile 2020**
(prima versione luglio 2019). Prodotto finale di un tavolo di lavoro promosso dal **Nucleo per la
Sicurezza Cibernetica (NSC)** del DIS presso la Presidenza del Consiglio, operativo da novembre 2018
a febbraio 2019, con DIS, Protezione Civile, MAECI, Interno, Giustizia, Difesa, MEF, MISE, AgID e
Consip.
[Testo, portale trasparenza AgID](https://trasparenza.agid.gov.it/download/4514.html) ·
[Versione in consultazione su docs.italia.it](https://docs.italia.it/AgID/documenti-in-consultazione/lg-procurement-ict/it/bozza/index.html)

**Perché sono obbligatorie per Telemedic.** Il **DM 21 settembre 2022, Allegato A, Sezione 2, driver
«Sicurezza»** dispone testualmente che, «ritenendo l'infrastruttura regionale di telemedicina una
**fornitura critica per la PA** e classificarla a criteri di sicurezza delle linee guida,
**l'applicazione dei dettami di tali linee guida (azioni AP2, AP3 e AP4 e cap. 5 "Protezione dei dati
personali") sono da ritenersi obbligatori**» **[TECNICO-VINCOLANTE]**.

### 9.1 Struttura del documento (verificata sull'indice)

| Capitolo | Contenuto |
|---|---|
| 1 | Premessa, definizioni, acronimi, documenti di riferimento |
| 2 | **Indicazioni per le amministrazioni**: AG1–AG7 (prima del *procurement*), **AP1–AP4** (durante), A1–A13 (dopo la stipula) |
| 3 | Indicazioni per AgID |
| 4 | Indicazioni per le centrali di committenza |
| **5** | **Protezione dei dati personali** (p. 30) |
| **Appendice A** | **Requisiti di sicurezza eleggibili** (p. 31) - tabelle 8, 9, 10, 11 |

### 9.2 AP1: il presupposto (la Tabella 3 «Calcolo criticità dell'acquisizione»)

Benché il DM non lo richiami espressamente, **AP2 presuppone AP1**: l'amministrazione determina il
**livello di criticità complessiva (LCC)** della fornitura mediante una tabella a quattro domande
pesate, con risposte Sì (1) / No (0) / Parzialmente (0,5):

1. L'acquisizione impatta su beni e/o servizi critici dell'amministrazione? *(peso di esempio: 5)*
2. L'importo, o più in generale l'investimento complessivo, supera la soglia minima di criticità?
   *(peso: 2)*
3. La durata del contratto da stipulare supera la soglia minima di criticità? *(peso: 1)*
4. La sede ove verranno erogate le prestazioni da acquisire è critica? *(peso: 3)*

Il risultato si riporta su una scala **alta / media / bassa**. È la stessa tabella che il DM 21
settembre 2022 riprende come «Tabella 4» per il calcolo della criticità del sistema di telemedicina.

> **Un sistema di telemedicina risponde «Sì» alla prima domanda per definizione** (impatta su servizi
> sanitari), e il DM lo qualifica *ex ante* come «fornitura critica per la PA». **Il LCC sarà quindi
> sistematicamente alto**, e ne discendono le conseguenze di AP2.

### 9.3 AP2 - «Scegliere lo strumento di acquisizione più adeguato, tenendo conto della sicurezza»

L'amministrazione sceglie lo strumento di acquisizione (MEPA, accordo quadro, gara autonoma) sulla
base del LCC. Il testo è esplicito sulla conseguenza per le acquisizioni di **alta criticità**:
l'amministrazione deve verificare che gli accordi quadro disponibili prevedano «requisiti di
sicurezza adeguati per quel grado di criticità» e, **in caso di verifica negativa, scartare l'opzione
dell'accordo quadro**. Il documento avverte che gli accordi quadro, «per la loro stessa natura, sono
strumenti di tipo "generalista", pertanto potrebbero contenere requisiti di sicurezza adeguati alla
maggioranza dei casi ma non per specifiche iniziative dell'amministrazione».

**Conseguenza per Telemedic**: l'acquisizione di una piattaforma di telemedicina ad alta criticità
tende a **gara dedicata con capitolato specifico**, non ad adesione a strumenti generalisti. Ciò
significa che il capitolato conterrà requisiti scritti *ad hoc*, e che il fornitore che sa quali
sono li anticipa.

### 9.4 AP3 - «Scegliere i requisiti di sicurezza da inserire nel capitolato»

L'amministrazione inserisce nel capitolato i requisiti di sicurezza, **distinguendo i mandatori dagli
opzionali** (questi ultimi «determinano eventualmente un premio nel punteggio tecnico»), e deve
tenerne conto anche nella scelta degli **indicatori di qualità** e delle **penali** contrattuali.

Il testo identifica quattro categorie di requisiti indipendenti dalla tipologia di acquisizione:

- gli aspetti «minimi» di sicurezza del bene e/o servizio da acquisire;
- le obbligazioni cui i fornitori devono attenersi per operare all'interno del perimetro di sicurezza
  dell'amministrazione (standard di riservatezza per la gestione delle informazioni; **specifici
  standard sul trattamento dei dati personali ai sensi del GDPR**);
- le obbligazioni per rendere possibile ed efficace il **monitoraggio della fornitura**;
- le obbligazioni per rendere possibile ed efficace l'attività di **audit**.

Per il resto l'amministrazione è **raccomandata di attingere dall'Appendice A** «piuttosto che
scrivere *ex-novo* il testo dei propri requisiti di sicurezza, anche per omogeneizzare i vari
capitolati pubblici e favorire un lessico comune tra committenti e fornitori».

> **Questa è l'informazione operativamente più preziosa dell'intero capitolo.** L'Appendice A è, di
> fatto, **il capitolato di sicurezza che Telemedic si troverà davanti**. Il § 9.6 la analizza.

### 9.5 AP4 - «Garantire competenze di sicurezza nella commissione di valutazione»

Almeno un commissario deve avere competenze in materia di sicurezza, «soprattutto» per le
acquisizioni classificate critiche. Il documento aggiunge un'osservazione che ha un effetto diretto
sulla forma dei requisiti: «la necessità che la commissione abbia competenze specifiche sulla
sicurezza, comunque, può essere mitigata **scrivendo i requisiti di sicurezza in maniera chiara,
oggettiva e quanto più possibile "chiusa"**, vale a dire lasciando meno spazio possibile all'offerta
tecnica del fornitore e - di conseguenza - alla valutazione soggettiva della commissione».

> **Conseguenza per Telemedic**: le risposte del fornitore saranno valutate contro requisiti
> **chiusi** (sì/no, con evidenza), non contro narrazioni. La documentazione di conformità deve
> quindi essere strutturata come **matrice requisito → evidenza → riferimento puntuale**, non come
> prosa descrittiva. È lo stesso formato richiesto dalla tracciabilità requisiti↔test di IEC 62304
> (decisione D10): un unico artefatto può servire entrambi gli scopi.

### 9.6 Appendice A - i requisiti che finiranno nel capitolato

Quattro tabelle. Le più rilevanti per Telemedic, con i requisiti che **il prodotto** (non il
processo aziendale del fornitore) deve poter soddisfare:

**Tabella 8 - Requisiti generali (indipendenti dalla tipologia di fornitura), R1–R19.** Fra i più
significativi: **R2** certificazione **ISO/IEC 27001** mantenuta per tutta la durata della fornitura,
o in alternativa **R3** un SGSI aggiornato nel tempo e/o un piano di qualità secondo **ISO 10005**;
**R4** audit annuale sul proprio sistema di sicurezza a proprie spese, condotto da società
specializzata scelta previa approvazione della stazione appaltante; **R5** ulteriori audit su
preavviso di 20 giorni solari; **R8** struttura per la prevenzione e gestione degli incidenti
informatici, con il compito di interfacciarsi con le strutture dell'amministrazione e con le
strutture centrali a livello governativo; **R11** misure tecniche e organizzative GDPR-adeguate;
**R12** dispositivi di sicurezza perimetrale (firewall, NIDS, *Event & Log Monitoring*, SIEM) in
grado di gestire gli **IoC**; **R13** protocolli cifrati e meccanismi di autenticazione nei servizi
erogati; **R14** in caso di attacco che comprometta i sistemi del committente, **il fornitore si fa
carico delle bonifiche e del ripristino a stato di assenza di vulnerabilità**; **R15** trattamento,
trasferimento e conservazione delle repliche dei dati **sempre all'interno del territorio dell'UE**;
**R18** NDA; **R19** aggiornamento tecnologico delle soluzioni di sicurezza **nel corso del
contratto, senza oneri aggiuntivi**.

**Tabella 9 - Forniture di servizi di sviluppo applicativo, R20–R23.** **R21** in fase di analisi il
fornitore definisce le **specifiche di sicurezza (non funzionali)** a partire dai requisiti espressi
dall'amministrazione; **R22** in fase di progettazione e codifica implementa le specifiche di
sicurezza **nel codice e nella struttura della base dati**; **R23** al termine del progetto rilascia
tutta la documentazione necessaria a gestire correttamente quanto rilasciato **anche sotto l'aspetto
della sicurezza**.

**Tabella 10 - Forniture di oggetti connessi in rete, R24–R33.** **R24** supporto di protocolli
sicuri e cifrati; **R26** supporto di protocolli di autenticazione (RADIUS, IEEE 802.1X); **R27**
gestione di più profili con privilegi diversi; **R28** richiesta di creazione o cambio della password
al primo accesso; **R29** blocco dell'utenza dopo un numero definito di tentativi falliti; **R30**
«gli accessi degli utenti devono essere registrati su un archivio (log) **non cancellabile con il
reset**»; **R31** gestione dei log di sistema (accessi, allarmi); **R32** processi, unità
organizzative e strumenti dedicati alla gestione delle vulnerabilità scoperte sui prodotti oggetto
della fornitura; **R33** documentazione tecnica sulla corretta configurazione e gestione degli
aspetti di sicurezza.

**Tabella 11 - Forniture di servizi di gestione remota, R34–R45.** È la tabella che si applica al
modello SaaS. **R34** meccanismi di autenticazione basati su **crittografia asimmetrica a chiave
pubblica**, con lunghezza delle chiavi «impostata sulla base della criticità della comunicazione da
cifrare (ad esempio 256 bit per le meno critiche, 512 bit per le più critiche)»; **R35**
autorizzazione basata sulle credenziali fornite dall'utente, con accesso limitato alle risorse
autorizzate; **R36** comunicazioni cifrate fra componente remota centralizzata e componente locale;
**R37** meccanismi di integrità di quanto trasmesso (*hashing*); **R38** descrizione dettagliata
delle soluzioni tecniche impiegate; **R40** politiche di sicurezza del committente per ruoli e
utenze; **R41** proxy centralizzato per gli accessi a Internet degli operatori;
**R42** «in caso di rilevazione di un incidente di gravità elevata […] **il fornitore deve dare
immediata notifica**, tramite canali concordati con l'amministrazione, dell'incidente rilevato e
delle azioni da intraprendere»; **R43** «per ogni incidente di sicurezza, il fornitore si impegna a
consegnare all'amministrazione, **entro il giorno successivo**, un *report* che descriva la tipologia
di attacco subito, le vulnerabilità sfruttate, **la sequenza temporale degli eventi** e le
contromisure adottate»; **R44** su richiesta, consegna dei **log di sistema in formato CSV o TXT**
entro il giorno successivo a quello della richiesta; **R45** monitoraggio della pubblicazione di
*upgrade*/*patch*/*hotfix*, con valutazione avviata **entro il giorno successivo al rilascio** e
propedeutica all'installazione.

> **R42, R43 e R44 sono, letteralmente, la specifica funzionale delle capacità di notifica descritte
> al § 6.3.** Un'amministrazione che attinga all'Appendice A - come AgID le raccomanda di fare -
> scriverà nel capitolato «sequenza temporale degli eventi» ed «export dei log in CSV o TXT entro il
> giorno successivo». Telemedic deve poterlo fare **da API**, non con un intervento manuale del
> supporto.

### 9.7 Capitolo 5 - Protezione dei dati personali

Il capitolo è breve ma prescrittivo. Contenuti verificati sul testo:

- richiamo al principio di **responsabilizzazione** (artt. 5, par. 2, e 24 GDPR), da rispettare
  «sia nella fase preliminare al *procurement* sia in quella successiva alla stipula contrattuale»;
- **protezione dei dati fin dalla progettazione e per impostazione predefinita (art. 25 GDPR)**:
  «centrali nel contesto degli appalti pubblici», devono essere attuati «sin dalle fasi prodromiche»;
- **art. 28 GDPR**: la PA può ricorrere unicamente a fornitori che «presentino garanzie sufficienti
  per mettere in atto misure tecniche e organizzative adeguate»; l'individuazione avviene tenendo
  conto di natura, ambito, contesto e finalità del trattamento e dei rischi per i diritti e le
  libertà;
- nel capitolato «devono essere adeguatamente individuate le **misure di sicurezza sia organizzative
  sia tecniche** da applicare ai singoli trattamenti di dati personali, ai sensi dell'**art. 32
  GDPR**, e la corretta ripartizione delle relative responsabilità», **evitando in particolare «la
  previsione di sproporzionati esoneri di responsabilità specialmente in caso di contratti standard
  con margini di negoziazione pressoché nulli in capo al titolare del trattamento»**;
- nomina del fornitore a **responsabile del trattamento** ex artt. 4, n. 8, e 28 GDPR;
- **«il quadro di garanzie […] si applica anche alle acquisizioni di *Software as a Service* (SaaS),
  di *Product as a Service* (PaaS) e di *Internet as a Service* (IaaS)»**.

> **Due conseguenze precise per Telemedic.**
> (a) L'avvertimento sugli «sproporzionati esoneri di responsabilità» in contratti standard è
> rivolto proprio ai modelli SaaS con DPA non negoziabile. Il **DPA di Telemedic deve essere
> negoziabile** nelle clausole di responsabilità, o sarà contestato in sede di gara.
> (b) La *privacy by design* dell'art. 25 va **documentata come processo**, non asserita: serve un
> artefatto tracciabile che colleghi ciascuna scelta architetturale (P2P per il media, nessuna
> decifratura intermedia, riferimento anziché duplicazione dell'anagrafica, RLS per tenant) alla
> misura di minimizzazione che realizza.

---

## 10. Contratti pubblici ICT: art. 14 L. 90/2024 e DPCM 30 aprile 2025

**[NON VERIFICATO sul testo dei DPCM - ricostruito da fonte secondaria qualificata]**

L'**art. 14 della legge 28 giugno 2024, n. 90** disciplina i contratti pubblici di beni e servizi
informatici «impiegati in un contesto connesso alla tutela degli interessi nazionali strategici»,
imponendo di tenere conto degli **elementi essenziali di cybersicurezza**. Il **DPCM 30 aprile 2025**
(pubblicato in **GU del 5 maggio 2025**), come modificato dal **DPCM 2 ottobre 2025**, li individua.

| Elemento | Contenuto |
|---|---|
| **Ambito** | Contratti pubblici per beni e servizi informatici essenziali in settori sensibili; si applica sia ai soggetti della PA sia agli operatori privati nel **PSNC** |
| **Allegato 1 - elementi essenziali di cybersicurezza** | Progettazione sicura e priva di vulnerabilità note; aggiornamenti di sicurezza automatici; autenticazione e controllo degli accessi; cifratura per la protezione dei dati; **gestione trasparente delle vulnerabilità da parte dei fornitori**; **valutazione della catena di approvvigionamento** |
| **Allegato 2 - categorie tecnologiche** | Sistemi di gestione identità e accessi, antivirus/antimalware, VPN, SIEM, infrastrutture PKI, router, firewall, dispositivi biometrici, smart card, storage e backup, videosorveglianza, **servizi cloud**, componenti SCADA, software per droni |
| **Art. 4 - criteri di premialità** | Punteggio aggiuntivo per tecnologie di operatori stabiliti in Italia, UE, NATO e sei Paesi terzi (Australia, Svizzera, Corea del Sud, Giappone, Israele, Nuova Zelanda) |

ACN ha adottato **Linee guida per l'applicazione dei criteri di premialità di cui all'articolo 14
della legge 90/2024**
([documento ACN](https://www.acn.gov.it/portale/documents/20119/1067494/Linee+guida_Criteri_Premialita%CC%80.pdf)).
**[Non lette integralmente.]**

> **Rilevanza per Telemedic.** L'elenco delle categorie tecnologiche dell'Allegato 2 **non nomina il
> software sanitario**, ma comprende i **servizi cloud**: un'offerta SaaS può quindi ricadervi. Gli
> elementi essenziali dell'Allegato 1 coincidono in larga misura con i requisiti dell'Allegato I
> del CRA - **un unico insieme di controlli tecnici li soddisfa entrambi**. Il criterio di premialità
> geografica è un ulteriore argomento a favore del vincolo V1: un fornitore stabilito in Italia
> ottiene punteggio aggiuntivo, un componente *runtime* US-based non lo ottiene.

---

## 11. Cybersecurity nel regime MDR

Poiché la decisione **D6** impone il percorso MDR Classe I completo, i requisiti di cibersicurezza
arrivano a Telemedic **anche** - e per il prodotto marcato CE, **esclusivamente** (art. 2, par. 2
CRA) - dal regime dei dispositivi medici.

### 11.1 Le fonti

| Fonte | Natura | Contenuto |
|---|---|---|
| **Reg. (UE) 2017/745, Allegato I, § 17.2** | **[VINCOLANTE]** | Il software è sviluppato e fabbricato **conformemente allo stato dell'arte**, tenendo conto dei principi del ciclo di vita dello sviluppo, della gestione dei rischi, **compresa la sicurezza delle informazioni**, della verifica e della convalida |
| **Reg. (UE) 2017/745, Allegato I, § 17.4** | **[VINCOLANTE]** | I fabbricanti stabiliscono **requisiti minimi relativi all'hardware, alle caratteristiche delle reti informatiche e alle misure di sicurezza informatica**, compresa la protezione contro l'accesso non autorizzato, necessari per far funzionare il software come previsto |
| **MDCG 2019-16**, «Guidance on Cybersecurity for medical devices», **rev. 1** | **[RACCOMANDATO]** - *soft law* MDCG | Pubblicata nel dicembre 2019, revisione 1 nel luglio 2020. Copre aspetti *pre-market* e *post-market*; impone un processo di gestione del rischio di cibersicurezza distinto ma raccordato con ISO 14971; richiede *security by design* e *security by default*; distingue IT-security, *operation security* e *information security*. [Testo, Commissione europea](https://health.ec.europa.eu/system/files/2022-01/md_cybersecurity_en.pdf) |
| **EN IEC 81001-5-1:2022** | Norma tecnica | «*Health software and health IT systems safety, effectiveness and security - Part 5-1: Security - Activities in the product life cycle*». Trasposizione europea di IEC 81001-5-1:2021. **Orientata al processo**: non prescrive soluzioni tecniche, richiede un **ciclo di vita di sviluppo sicuro (SDLC)** integrato nel sistema di gestione della qualità. Nel dicembre 2025 IEC ha pubblicato l'*Interpretation Sheet* **ISH1:2025**, che chiarisce la gestione dei componenti software e il trasferimento del rischio |

> ⚠️ **Verifica aperta (V-B4-1).** Lo **stato di armonizzazione di EN IEC 81001-5-1:2022 sotto MDR**
> non è stato accertato su fonte primaria. La norma figura dal 14 aprile 2021 nell'elenco degli
> standard destinati all'armonizzazione; la Decisione di esecuzione (UE) 2021/1182 è stata modificata
> più volte, da ultimo - secondo fonte secondaria - dalla **Decisione di esecuzione (UE) 2026/193 del
> 30 gennaio 2026**. **Prima di dichiarare presunzione di conformità occorre verificare la
> pubblicazione del riferimento nella Gazzetta ufficiale dell'Unione europea.** Se la norma non è
> armonizzata, resta comunque il riferimento tecnico di elezione per dimostrare lo «stato dell'arte»
> ex All. I § 17.2. → **questione da girare all'agente MDR.**

### 11.2 Il raccordo pratico

`EN IEC 81001-5-1` chiede al fabbricante ciò che il CRA chiede al fabbricante di prodotti digitali e
che le misure `PR.PS-01`, `PR.PS-02`, `PR.PS-03`, `PR.PS-06`, `ID.RA-08` chiedono al soggetto NIS:
gestione delle configurazioni, requisiti di sicurezza, progettazione sicura, implementazione,
verifica, **gestione del software di terze parti (SOUP)**, gestione delle vulnerabilità post-rilascio
e comunicazione agli utilizzatori.

**Un solo processo li soddisfa tutti**: un SDLC documentato nel sistema di gestione della qualità
ISO 13485, con SBOM, analisi delle dipendenze, *threat model* STRIDE (decisione D10), *security
testing* in CI e procedura di *disclosure* coordinata. Progettarli separatamente sarebbe l'errore che
la matrice del § 12 serve a evitare.

---

## 12. Matrice di sovrapposizione fra le fonti

Legenda: **●** obbligo diretto; **○** obbligo indiretto (ricade sul progetto per via contrattuale);
**-** non applicabile.

| Controllo tecnico | NIS2 / Det. ACN 379907 | L. 90/2024 | CRA 2024/2847 | GDPR art. 32 | MDR + 81001-5-1 | ABSC 2/2017 | AgID procurement | DM 21 set. 2022 / DM 19 nov. 2025 | Destinatario primario |
|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|---|
| **Inventario asset e software / SBOM** | ● `ID.AM-01/02/03/04` | - | ● All. I P. II.1 | ○ | ● SOUP | ● ABSC 1, 2 | ● R33 | - | **Progetto** produce, deployer mantiene |
| **Configurazioni sicure di riferimento (*hardening*)** | ● `PR.PS-01` (ess.) | ● DPCM All. 1 | ● All. I P. I «*secure by default*» | ● | ● | ● ABSC 3 | ● R38 | ● | **Progetto** documenta, deployer applica |
| **Gestione e divulgazione delle vulnerabilità** | ● `ID.RA-08`, `PR.PS-02` | ● DPCM All. 1 | ● All. I P. II.2/3/4/5 + art. 14 | ○ | ● | ● ABSC 4 | ● R32, R45 | - | **Entrambi** |
| **Aggiornamenti di sicurezza e patch** | ● `PR.PS-02`, `PR.PS-06` | ● DPCM All. 1 | ● All. I P. I e II.7/8 | ● | ● | ● ABSC 4 | ● R19, R45 | ● | **Progetto** rilascia, deployer applica |
| **Controllo degli accessi e privilegi amministrativi** | ● `PR.AA-01/05/06`, `ID.AM-03` | ● DPCM All. 1 | ● All. I P. I | ● | ● | ● ABSC 5 | ● R27, R35, R40 | ● | **Entrambi** |
| **Autenticazione a più fattori** | ● `PR.AA-03` p. 2 (rilevanti) | ● DPCM All. 1 | ● All. I P. I | ● | ● | ● ABSC 5.6.1 | ● R26 | ● art. 64 CAD (SPID/CIE/TS-CNS) | **Progetto** abilita, deployer configura |
| **Cifratura in transito** | ● `PR.DS-02` | ● DPCM All. 1 | ● All. I P. I | ● | ● | ● ABSC 13 | ● R13, R24, R36 | ● (Accordo 215/CSR: tutti i trasferimenti) | **Progetto** |
| **Cifratura a riposo** | ● `PR.DS-01` | ● DPCM All. 1 | ● All. I P. I | ● | ● | ● ABSC 13 | ● R13 | ● | **Progetto** abilita, deployer gestisce chiavi |
| **Backup cifrati, offline, con test di ripristino** | ● `PR.DS-11` (5 req. per essenziali) | - | - | ● | ● | ● ABSC 10 | - | ● | **Deployer**, con supporto documentale del progetto |
| **Continuità operativa e *disaster recovery*** | ● `ID.IM-04` | - | - | ● | ● | ● ABSC 10 | - | ● art. 51 CAD | **Deployer** |
| **Log immutabili e tracciabilità** | ● `DE.CM-01`, `PR.PS-04` | ● | ● All. I P. I | ● | ● | ● ABSC 8.3, 5.5 | ● R30, R31, R44 | ● 24 mesi (DM 19 nov. 2025) | **Progetto** |
| **Rilevazione e monitoraggio (SIEM/IPS)** | ● `DE.CM-01`, `DE.CM-09` | ● | ● | ● | ● | ● ABSC 8 | ● R12 | ● IPS + SIEM/SOAR | **Deployer**, con integrazione fornita dal progetto |
| **Notifica incidenti 24 h / 72 h** | ● art. 25 | ● art. 1 | ● art. 14 (24 h/72 h/14 gg) | ● art. 33 (72 h al Garante) | ● PMS/vigilanza | - | ● R42, R43 | ● | **Deployer** notifica; **progetto** fornisce l'evidenza |
| ***Export* forense e cronologia degli eventi** | ○ (presupposto di art. 25) | ○ | ○ | ○ | ○ | - | ● R43, R44 | - | **Progetto** |
| **Sicurezza della catena di fornitura** | ● `GV.SC-01/02/04/05/07` | ● DPCM All. 1 | ● *due diligence* del fabbricante | ● art. 28 | ● SOUP | - | ● AG6, R2/R3/R4 | - | **Deployer** obbligato; **progetto** oggetto della verifica |
| **Dichiarazione dei fornitori rilevanti ad ACN** | ● art. 18 Det. 127437/2026 | - | - | - | - | - | - | - | **Deployer**; il progetto ne è il soggetto dichiarato |
| **Ciclo di vita di sviluppo sicuro (SDLC)** | ● art. 24 c. 3 (in capo al cliente, verso il fornitore) | ● DPCM All. 1 | ● All. I P. I e II | ● art. 25 | ● **EN IEC 81001-5-1** | - | ● R21, R22 | - | **Progetto** |
| **Formazione del personale** | ● `PR.AT-01`, `PR.AT-02` | ● | - | ● | ● | - | ● AG1 | ● | **Deployer** |
| **Governance e approvazione dei piani** | ● art. 23, 11 documenti | ● referente cyber | - | ● accountability | ● SGQ ISO 13485 | - | ● AG3 | - | **Deployer**; progetto per il proprio SGQ |
| **Comunicazioni video/vocali/testuali protette** | ● `PR.IR-03` (essenziali) | - | ● All. I P. I | ● | ● | - | ● R36 | ● | **Progetto** |
| **Residenza dei dati** | ○ (dichiarazione del Paese del fornitore) | ● criteri di premialità | - | ● Capo V | - | - | ● **R15 (UE)** | ● territorio nazionale + qualificazione ACN | **Entrambi** |
| **Certificazione ISO/IEC 27001 o SGSI equivalente** | ○ | - | - | ○ | ○ | - | ● **R2 / R3** | - | **Progetto** (organizzazione) |

### 12.1 I sette controlli a massimo rendimento

Sette controlli tecnici, se implementati una volta e documentati bene, soddisfano **cinque o più
fonti ciascuno**. Sono la priorità assoluta di implementazione:

1. **SBOM CycloneDX firmata + VEX** → CRA All. I P. II.1; ABSC 2; `ID.AM-02`, `ID.RA-08`; SOUP di
   EN IEC 81001-5-1; DPCM 30 aprile 2025 All. 1; *due diligence* dell'integratore.
2. **Log append-only con catena di *hash*, conservazione 24 mesi, *export* CSV/JSON firmato** →
   art. 25 NIS2; art. 1 L. 90/2024; R30/R43/R44 AgID; ABSC 8.3; `DE.CM-01`; DM 19 novembre 2025;
   art. 32 GDPR; vincolo V5.
3. **MFA + federazione OIDC/SAML2 con SPID, CIE e TS-CNS** → `PR.AA-03`; ABSC 5.6.1; CRA All. I P. I;
   art. 64 CAD; DM 19 novembre 2025; R26 AgID; decisione D9.
4. **Cifratura end-to-end del media (DTLS-SRTP) e TLS per la segnalazione** → `PR.DS-02`, `PR.IR-03`;
   Accordo 215/CSR 2020 («tutti i trasferimenti di voce, video, immagini, *files* devono essere
   crittografati»); CRA All. I P. I; art. 32 GDPR; R13/R24/R36 AgID.
5. **SDLC documentato con *threat model* STRIDE, SAST/DAST/SCA in CI e *disclosure* coordinata** →
   EN IEC 81001-5-1; CRA All. I P. II; art. 24 c. 3 NIS2 («procedure di sviluppo sicuro»); ABSC 4;
   R21/R22/R32 AgID; MDCG 2019-16.
6. **Misurazione della disponibilità per tenant e per servizio, con soglie e allarmi** → IS-3 delle
   specifiche di base; SLA della Tabella 3 del DM 21 settembre 2022; `DE.CM-01`; monitoraggio ex R17
   AgID.
7. ***Baseline* di *hardening* documentata, immagini container firmate, configurazione sicura per
   impostazione predefinita** → ABSC 3; `PR.PS-01`; CRA All. I P. I; DPCM 30 aprile 2025 All. 1;
   R38 AgID; driver «containerizzazione» del DM 21 settembre 2022.

---

## 13. Catalogo dei requisiti di sicurezza verificabili

Destinatario: **P** = progetto (Telemedic, come fornitore/fabbricante); **D** = *deployer*
(utilizzatore: ASL, clinica, integratore); **P+D** = entrambi, con responsabilità distinte.

### 13.1 Governance, documentazione ed evidenze

| ID | Enunciato | Fonte | Dest. | Verifica |
|---|---|---|:-:|---|
| **SEC-001** | Il progetto pubblica, per ogni *release*, un **fascicolo di conformità NIS** che raccoglie: inventario dei componenti software (SBOM), elenco dei flussi di rete verso l'esterno con i cinque attributi richiesti (IP sorgente, IP destinazione, protocollo di trasporto, porta di destinazione, protocollo applicativo), elenco dei sistemi accessibili da remoto, configurazioni di riferimento. | Det. ACN 379907/2025, All. 1-2, evidenze documentali «elenchi» e «inventari»; Guida alla lettura ACN § 2.5, Appendice D | P | Presenza del fascicolo nell'artefatto di *release*; completezza dei cinque attributi per ciascun flusso |
| **SEC-002** | Il progetto pubblica una **matrice RACI** che, per ciascuna delle 43 misure di sicurezza di base, indica se l'attuazione è a carico del fornitore, del deployer o condivisa, con il riferimento puntuale alla funzionalità o al documento che la realizza. | Det. ACN 379907/2025, All. 1-2; art. 24 c. 3 d.lgs. 138/2024 | P | La matrice copre tutte e 43 le misure senza celle vuote |
| **SEC-003** | Il progetto mantiene un **SGSI documentato** (politiche, procedure, riesame periodico) e persegue la certificazione **ISO/IEC 27001**; in alternativa documenta un SGSI aggiornato nel tempo e/o un piano di qualità secondo ISO 10005. | AgID, procurement ICT, Appendice A, **R2** e **R3** | P | Certificato in corso di validità, oppure manuale del SGSI con evidenza di riesame nell'ultimo anno |
| **SEC-004** | Il progetto si sottopone a un **audit di sicurezza annuale** condotto da terza parte indipendente e ne rende disponibili le risultanze al deployer che ne faccia richiesta. | AgID, procurement ICT, **R4**, **R5** | P | Rapporto di audit datato nell'ultimo esercizio; procedura di richiesta documentata |
| **SEC-005** | Il progetto rende disponibile un modello di **DPA ex art. 28 GDPR negoziabile nelle clausole di responsabilità**, con allegato tecnico delle misure ex art. 32 e ripartizione esplicita delle responsabilità titolare/responsabile. | AgID, procurement ICT, **cap. 5**; artt. 28 e 32 GDPR | P | Il DPA esiste, è pubblico e non contiene esoneri generali di responsabilità |
| **SEC-006** | Il progetto documenta, per ciascun artefatto distribuito (applicazione, SDK Java, SDK TypeScript, Web Component, immagini container, chart Helm), **se è coperto dalla marcatura CE MDR** e quindi escluso dal CRA ai sensi dell'art. 2, par. 2. | Reg. (UE) 2024/2847, art. 2, par. 2; Reg. (UE) 2017/745 | P | Tabella artefatto → regime applicabile, approvata dal PRRC, presente nel fascicolo tecnico |
| **SEC-007** | Il progetto pubblica i **codici CPV** pertinenti alla fornitura e il **Paese della sede legale** del soggetto che eroga il servizio, in forma direttamente riutilizzabile nella dichiarazione dei fornitori rilevanti. | Det. ACN 127437/2026, art. 18; Reg. (CE) 2195/2002 | P | I dati sono presenti nella documentazione pubblica e aggiornati |
| **SEC-008** | Il progetto dichiara, per ciascuna *release* maggiore, il **periodo di supporto** con data di fine, non inferiore a **5 anni** dalla data di rilascio. | Reg. (UE) 2024/2847, art. 13 e All. I P. II; *due diligence* dell'integratore | P | *Support policy* pubblicata; ciascuna *release* riporta la data di fine supporto |
| **SEC-009** | Il progetto mantiene un **registro delle manutenzioni, dei collaudi e dei controlli di sicurezza** effettuati sull'installazione, con rapporti tecnici di dettaglio esportabili. | Accordo Stato-Regioni 17 dic. 2020, rep. 215/CSR; Det. ACN 379907/2025, evidenze «registri» | P+D | Il registro è interrogabile per periodo e per installazione |
| **SEC-010** | Il progetto fornisce una **dichiarazione tecnica di deroga a `DE.CM-09`** che individua i componenti la cui alterazione invaliderebbe la marcatura CE, elenca le misure compensative disponibili e definisce la configurazione anti-malware/EDR supportata sull'host. | Guida alla lettura ACN § 2.3.3; Det. ACN 379907/2025, misura `DE.CM-09`; Reg. (UE) 2017/745 | P | Il documento esiste, è firmato dal PRRC e cita la clausola «fatte salve motivate e documentate ragioni normative o tecniche» |

### 13.2 Identità, autenticazione, controllo degli accessi

| ID | Enunciato | Fonte | Dest. | Verifica |
|---|---|---|:-:|---|
| **SEC-011** | Tutte le utenze, incluse quelle con privilegi amministrativi e quelle usate per l'accesso remoto, sono **censite, approvate e individuali**; non esistono utenze anonime o condivise. | Det. ACN 379907/2025, `PR.AA-01` p. 1; ABSC 5.10.1, 5.10.3 | P+D | Nessuna utenza priva di titolare nominativo nell'elenco esportato |
| **SEC-012** | Il sistema supporta l'**autenticazione a più fattori** su tutte le utenze e la impone **obbligatoriamente** per le utenze con privilegi amministrativi e per l'accesso remoto. | Det. ACN 379907/2025, `PR.AA-03` p. 2; ABSC 5.6.1; art. 24 c. 2 lett. l) d.lgs. 138/2024; CRA All. I P. I | P | Test funzionale: impossibile completare un accesso amministrativo senza secondo fattore |
| **SEC-013** | Il sistema accetta **identità federate** via OIDC e SAML2 e supporta **SPID, CIE e TS-CNS** come meccanismi di autenticazione forte del paziente e del professionista. | Art. 64 CAD; DM 19 nov. 2025, All. 4; DM 7 set. 2023, art. 11; decisione D9 | P | Test di integrazione contro gli ambienti di collaudo dei rispettivi *provider* |
| **SEC-014** | Il sistema mantiene la **separazione completa fra utenze privilegiate e non privilegiate**: nessuna operazione ordinaria è eseguibile con un'utenza amministrativa e viceversa. | ABSC 5.10.1; Det. ACN 379907/2025, `PR.AA-05` | P | Revisione del modello dei ruoli; test di *privilege escalation* |
| **SEC-015** | Il sistema **blocca l'utenza** dopo un numero configurabile di tentativi di accesso falliti e **registra** ogni tentativo fallito. | AgID **R29**; ABSC 5.5.1; Det. ACN 379907/2025, `PR.AA-01` | P | Test funzionale con soglia configurata; verifica della presenza dell'evento nel log |
| **SEC-016** | Il sistema impone il **cambio della credenziale al primo accesso** e supporta politiche di robustezza e rotazione configurabili dal deployer. | AgID **R28**; ABSC 5.7; Det. ACN 379907/2025, `PR.AA-01` p. 2 | P | Test funzionale sul primo accesso |
| **SEC-017** | Il sistema supporta la **gestione di più profili con privilegi diversi** e la revoca o l'aggiornamento delle autorizzazioni al variare del rapporto (trasferimento, cessazione). | AgID **R27**, **R35**; Det. ACN 379907/2025, `PR.AA-01` p. 3, `PR.AA-05` | P | Test di revoca: l'accesso cessa entro il termine dichiarato |
| **SEC-018** | Ogni entità di dominio, evento e riga di audit porta l'**identificativo di tenant**, e l'isolamento fra tenant è imposto a livello di persistenza (RLS o schema dedicato), non solo applicativo. | Vincolo V4; DM 21 set. 2022, All. A, driver «Cloud Native» («corretta segregazione e isolamento dei dati e degli utenti a livello applicativo»); art. 32 GDPR | P | Test di *cross-tenant access* negativo su ogni endpoint API |
| **SEC-019** | Le operazioni di **amministrazione remota** avvengono esclusivamente su **protocolli e canali sicuri**, tramite account nominativi e, ove previsto, VPN dedicata. | ABSC 3.4.1; AgID **R41**, **A3** | P+D | Configurazione di riferimento; scansione delle porte esposte |
| **SEC-020** | Il sistema registra e rende interrogabili gli **accessi a dato sanitario per attore e per unità di tempo**, con marcatura temporale che consenta di riconoscere gli accessi fuori dall'orario di servizio. | Det. ACN 379907/2025, incidente **IS-4** e misura `DE.CM-01` (parametri quali-quantitativi); vincolo V5; provvedimenti del Garante in ambito sanitario | P | Query di verifica: conteggio accessi per utente/giorno; elenco accessi fuori fascia oraria configurata |

### 13.3 Crittografia, protezione e conservazione dei dati

| ID | Enunciato | Fonte | Dest. | Verifica |
|---|---|---|:-:|---|
| **SEC-021** | **Tutti** i trasferimenti di voce, video, immagini e file sono cifrati; il media peer-to-peer usa **DTLS-SRTP** senza decifratura intermedia, con rotazione delle chiavi per sessione. | Accordo 215/CSR 2020; Det. ACN 379907/2025, `PR.DS-02`, `PR.IR-03`; AgID **R13**, **R24**, **R36**; CRA All. I P. I | P | Cattura di traffico su sessione di test; assenza di RTP in chiaro; verifica della rotazione delle chiavi |
| **SEC-022** | Tutti i canali di segnalazione e le API espongono **esclusivamente TLS** con suite conformi allo stato dell'arte; il *downgrade* è impedito. | Det. ACN 379907/2025, `PR.DS-02`; ABSC 13.3.1; CRA All. I P. I | P | Scansione TLS automatizzata in CI con soglia di conformità |
| **SEC-023** | I dati sanitari e le registrazioni sono **cifrati a riposo**; la gestione delle chiavi è documentata e le chiavi sono separabili dal dato. | Det. ACN 379907/2025, `PR.DS-01`; ABSC 13.1.1, 13.2.1; DM 19 nov. 2025 All. 4; art. 32 GDPR | P | Ispezione dello storage: nessun contenuto clinico leggibile senza chiave |
| **SEC-024** | Le registrazioni delle sessioni sono create **solo previo consenso esplicito** documentato, sono cifrate a riposo e hanno **retention configurabile** con cancellazione automatica alla scadenza. | Accordo 215/CSR 2020; art. 9 GDPR; CRA All. I P. I (minimizzazione, rimozione sicura dei dati) | P | Test: assenza di registrazione senza consenso; cancellazione effettiva a scadenza |
| **SEC-025** | Il sistema espone una funzione di **rimozione sicura e permanente** dei dati e delle impostazioni di un tenant, con attestazione dell'avvenuta cancellazione. | CRA All. I P. I; art. 17 GDPR; ABSC 13 | P | Test di cancellazione con verifica su backup e repliche |
| **SEC-026** | I **backup** sono cifrati, conservati anche in copia **offline o comunque non accessibile in modo permanente dal sistema**, e la loro utilizzabilità è **verificata periodicamente mediante test di ripristino**. | Det. ACN 379907/2025, `PR.DS-11` p. 1, 3, 4 (profilo essenziali); ABSC 10.1.1, 10.3.1, 10.4.1, 10.2.1 | D, con procedura fornita da P | Esito documentato dell'ultimo test di ripristino; verifica che la copia offline esista |
| **SEC-027** | Il progetto documenta la **procedura di backup e ripristino** completa (SO, applicazione, base dati, configurazioni, chiavi) e ne dichiara gli **RPO/RTO** raggiungibili. | Det. ACN 379907/2025, `ID.IM-04`; ABSC 10.1.2; art. 51 CAD | P | La procedura esiste ed è stata eseguita con esito positivo almeno una volta in ambiente di collaudo |
| **SEC-028** | I dati e le loro repliche sono trattati, trasferiti e conservati **all'interno del territorio dell'UE**; il profilo di *deployment* per la PA sanitaria italiana consente la residenza sul **territorio nazionale** su infrastruttura qualificata ACN o PSN. | AgID **R15**; DM 21 set. 2022, All. A, modelli di *deployment*; Determinazioni ACN 306 e 307/2022, DD ACN 21007/24; vincolo V1 | P+D | Documentazione dei tre profili di *deployment*; assenza di dipendenze *runtime* fuori UE nella SBOM e nella configurazione |
| **SEC-029** | Il sistema **non duplica l'anagrafica** del paziente e del professionista: lavora per riferimento tramite identificatori esterni. | Art. 5, par. 1, lett. c) GDPR (minimizzazione); art. 25 GDPR; vincolo di integrazione 6.2.3 del brief | P | Ispezione del modello dati: assenza di attributi anagrafici non necessari |
| **SEC-030** | Il progetto documenta come le scelte architetturali realizzano la **protezione dei dati fin dalla progettazione e per impostazione predefinita**, con collegamento puntuale scelta → rischio mitigato. | Art. 25 GDPR; AgID procurement ICT **cap. 5** | P | Esistenza del documento e sua tracciabilità verso il registro dei rischi |

### 13.4 Rilevazione, tracciabilità, notifica degli incidenti

| ID | Enunciato | Fonte | Dest. | Verifica |
|---|---|---|:-:|---|
| **SEC-031** | Il sistema **rileva e segnala** automaticamente: tentativi di accesso falliti oltre soglia, accessi fuori orario da utenze amministrative, superamento di soglie di interrogazione dei dati clinici per singolo utente, variazioni non autorizzate della configurazione. | Det. ACN 379907/2025, `DE.CM-01` (parametri quali-quantitativi), incidente **IS-4**; ABSC 3.5.3, 5.4.2 | P | Test con superamento indotto di ciascuna soglia; verifica dell'emissione dell'allarme |
| **SEC-032** | Il sistema **esporta gli eventi di sicurezza verso un SIEM esterno** in formato standard (syslog/CEF o OpenTelemetry), in modalità *push*, senza necessità di accesso diretto alla base dati. | Det. ACN 379907/2025, `DE.CM-01`; ABSC 8.1.3; AgID **R12**; DM 19 nov. 2025, All. 4 (SIEM/SOAR) | P | Test di integrazione con un SIEM di riferimento |
| **SEC-033** | I log di audit sono **append-only e non alterabili**: incatenati con *hash*, conservati separatamente dai dati applicativi, e la loro integrità è verificabile con uno strumento fornito dal progetto. | Vincolo V5; AgID **R30**; ABSC 3.5.1; Det. ACN 379907/2025, `PR.PS-04`; DM 19 nov. 2025, All. 4 | P | Tentativo di alterazione di una riga: lo strumento di verifica rileva la rottura della catena |
| **SEC-034** | Tutti i componenti usano un **orologio sincronizzato** (NTP) e producono *timestamp* con fuso e precisione dichiarati, sufficienti a ordinare gli eventi fra componenti diversi. | Presupposto di art. 25 d.lgs. 138/2024; AgID **R43** («sequenza temporale degli eventi») | P | Verifica dello scarto massimo fra i *timestamp* di componenti diversi su un evento correlato |
| **SEC-035** | Il sistema ricostruisce, **da API**, la **cronologia completa degli eventi** relativi a una sessione, a un utente o a un tenant su un intervallo temporale arbitrario. | Art. 25 d.lgs. 138/2024; AgID **R43** | P | Chiamata API su un caso di test: la cronologia è completa e ordinata |
| **SEC-036** | Il sistema esporta i log in **formato aperto (CSV, TXT, JSON)**, con ***hash* di integrità del pacchetto esportato**, entro un termine documentato e comunque **entro il giorno successivo alla richiesta**. | AgID **R44**; art. 25 d.lgs. 138/2024; art. 1 L. 90/2024 | P | Esecuzione dell'*export* su un volume rappresentativo; misurazione del tempo; verifica dell'*hash* |
| **SEC-037** | Il sistema **misura e storicizza la disponibilità** del servizio per tenant e per servizio minimo, con soglie configurabili e allarme al superamento, con granularità sufficiente a rilevare una violazione del 99% su base giornaliera. | Det. ACN 379907/2025, incidente **IS-3** e misura `DE.CM-01`; DM 21 set. 2022, All. A, Tab. 3 | P | Simulazione di indisponibilità superiore alla soglia; verifica dell'allarme |
| **SEC-038** | Il fornitore notifica al deployer ogni incidente di sicurezza rilevato **entro un termine contrattuale inferiore alle 24 ore** e comunque **immediatamente** per gli incidenti di gravità elevata, tramite canali concordati. | AgID **R42**; art. 25 d.lgs. 138/2024 (24 h in capo al deployer); art. 1 L. 90/2024 | P | Clausola contrattuale presente; esercitazione di notifica documentata |
| **SEC-039** | Il fornitore consegna al deployer, **entro il giorno successivo** a ogni incidente di sicurezza, un *report* che descrive tipologia di attacco, vulnerabilità sfruttate, **sequenza temporale degli eventi** e contromisure adottate. | AgID **R43** | P | Modello di *report* predisposto; esercitazione documentata |
| **SEC-040** | Il progetto mantiene una **procedura documentata di risposta agli incidenti**, raccordata con il modello di processo delle Linee guida ACN del 31 dicembre 2025, e la esercita almeno annualmente. | Det. ACN 379907/2025, `RS.MA-01`, `RS.CO-02`, `RC.RP-01`; AgID **R8** | P | Verbale dell'ultima esercitazione |
| **SEC-041** | I log di tracciabilità sono conservati **24 mesi**; i dati di accesso e autenticazione **12 mesi**. | DM 19 nov. 2025, All. 4; parere del Garante n. 2 del 16 gennaio 2025 | P+D | Configurazione della retention; verifica che i dati più vecchi siano cancellati |
| **SEC-042** | Il sistema registra la **qualità del collegamento** di ogni sessione di televisita e la rende disponibile per l'inserimento nel referto, con conferma esplicita del medico. | Accordo 215/CSR 2020 (obblighi documentali della televisita) | P | Presenza del campo nel referto generato; test di conferma medica |

### 13.5 Catena di fornitura, vulnerabilità, sviluppo sicuro

| ID | Enunciato | Fonte | Dest. | Verifica |
|---|---|---|:-:|---|
| **SEC-043** | Il progetto genera e pubblica per ogni *release* una **SBOM in formato CycloneDX**, leggibile automaticamente, che copre almeno le dipendenze di primo livello e, di fatto, l'albero transitivo di Maven e npm. | CRA All. I P. II.1; ABSC 2.1.1; Det. ACN 379907/2025, `ID.AM-02`; decisione D10 | P | La SBOM è presente fra gli artefatti di *release* ed è validabile contro lo schema CycloneDX |
| **SEC-044** | Il progetto pubblica un documento **VEX** che dichiara, per le CVE note delle dipendenze, se sono effettivamente sfruttabili nel contesto del prodotto. | CRA All. I P. II.1 e II.5; art. 24 c. 3 d.lgs. 138/2024 (*due diligence* del cliente) | P | Il VEX esiste, è aggiornato all'ultima *release* e copre tutte le CVE aperte della SBOM |
| **SEC-045** | Il progetto mantiene un file **`SECURITY.md`** con **politica di divulgazione coordinata delle vulnerabilità**, canale di contatto dedicato, tempi di riscontro e di rimedio dichiarati. | CRA All. I P. II.5 e art. 24, par. 1 (steward); Det. ACN 379907/2025, `ID.RA-08`; AgID **R32** | P | Il file esiste; test di invio su un caso simulato con misurazione del tempo di riscontro |
| **SEC-046** | Il progetto **divulga pubblicamente** le informazioni sulle vulnerabilità corrette, una volta reso disponibile l'aggiornamento, tramite *security advisory* con identificativo CVE ove applicabile. | CRA All. I P. II.4; MDCG 2019-16 (*post-market*) | P | Presenza di *advisory* pubblicati per le vulnerabilità corrette nelle ultime *release* |
| **SEC-047** | La *pipeline* di CI esegue **SAST, DAST, SCA e analisi dei segreti** a ogni *pull request* e blocca il *merge* al superamento delle soglie definite. | Decisione D10; CRA All. I P. II.3; EN IEC 81001-5-1; ABSC 4 | P | Configurazione della *pipeline*; evidenza di almeno un blocco effettivo |
| **SEC-048** | Il prodotto è **immesso in distribuzione senza vulnerabilità note sfruttabili**; il rilascio è bloccato in presenza di CVE aperte oltre la soglia di gravità definita e non coperte da VEX. | CRA All. I P. I; DPCM 30 apr. 2025, All. 1 | P | *Gate* di rilascio configurato; evidenza sul *changelog* |
| **SEC-049** | Il progetto mantiene un **modello delle minacce STRIDE** aggiornato, tracciabile verso i requisiti di sicurezza e verso i test che li verificano. | Decisione D10; EN IEC 81001-5-1; MDCG 2019-16; ISO 14971 | P | Il modello esiste, è datato, e ogni minaccia rilevante ha almeno un requisito e un test associati |
| **SEC-050** | Gli **artefatti sono firmati** e la loro **provenance** è verificabile; le immagini container sono firmate e la firma è verificabile dal deployer. | CRA All. I P. II.7 (meccanismi sicuri di distribuzione); ABSC 2.3.3; *due diligence* dell'integratore | P | Verifica della firma su un artefatto scaricato dal canale ufficiale |
| **SEC-051** | Il progetto documenta la **gestione del software di terze parti (SOUP)**: elenco, versione, motivo dell'inclusione, valutazione del rischio, criteri di aggiornamento. | EN IEC 81001-5-1; IEC 62304; art. 24 c. 3 d.lgs. 138/2024; ABSC 2 | P | Elenco SOUP presente nel fascicolo tecnico e coerente con la SBOM |
| **SEC-052** | Il progetto **monitora la pubblicazione di *upgrade*, *patch* e *hotfix*** relativi alle proprie dipendenze e avvia la valutazione **entro il giorno successivo al rilascio**, dichiarando il termine di rilascio della correzione in funzione della gravità. | AgID **R45**; ABSC 4.7.1, 4.8.1, 4.8.2; CRA All. I P. II.2 | P | Automazione documentata (*dependency bot*); registro delle valutazioni |
| **SEC-053** | Il progetto si impegna a **farsi carico delle bonifiche e del ripristino** dei sistemi del committente compromessi in conseguenza di una vulnerabilità dei propri prodotti, riportandoli in uno stato di assenza di vulnerabilità. | AgID, procurement ICT, Appendice A, **R14** | P | Clausola contrattuale presente nel modello di contratto |
| **SEC-054** | L'aggiornamento tecnologico delle componenti di sicurezza avviene **nel corso del contratto e senza oneri aggiuntivi** per il committente. | AgID **R19** | P | Clausola contrattuale presente |

### 13.6 Configurazioni, aggiornamenti, continuità

| ID | Enunciato | Fonte | Dest. | Verifica |
|---|---|---|:-:|---|
| **SEC-055** | Il progetto pubblica una ***baseline* di *hardening* documentata** (configurazione sicura standard) per ciascun componente distribuito, e il prodotto è **sicuro per impostazione predefinita**: nessun account di default attivo, nessun servizio non necessario esposto, nessuna credenziale predefinita. | ABSC 3.1.1, 3.1.2, 3.2.1; CRA All. I P. I; Det. ACN 379907/2025, `PR.PS-01`; AgID **R38** | P | Scansione di conformità della configurazione di default contro la *baseline* |
| **SEC-056** | Il sistema consente il **ripristino alla configurazione di riferimento** e la rilevazione delle deviazioni non autorizzate rispetto ad essa. | ABSC 3.2.2, 3.5.4, 3.6.1; CRA All. I P. I | P | Test di deviazione indotta e rilevazione |
| **SEC-057** | Gli aggiornamenti di sicurezza sono **distribuiti tempestivamente e a titolo gratuito** attraverso un canale sicuro e autenticato, con possibilità per il deployer di applicarli in modo automatizzato. | CRA All. I P. I e P. II.7/8; ABSC 4.5.1; AgID **R19** | P | Il canale esiste, è autenticato; test di aggiornamento automatizzato |
| **SEC-058** | Il progetto fornisce un **ambiente e una procedura di collaudo delle patch** prima dell'installazione in esercizio, in particolare per le componenti non standard. | ABSC 4.10.1; AgID **R45**; Accordo 215/CSR 2020 (prove di idoneità all'uso clinico e prove di funzionamento dopo ogni aggiornamento rilevante) | P | Esistenza dell'ambiente di collaudo e della procedura documentata |

---

## 14. Che cosa deve fare il progetto entro il 31 ottobre 2026

### 14.1 Che cosa significa esattamente «31 ottobre 2026»

**Il termine non è scritto in nessun atto.** È il risultato del combinato disposto di due elementi:

1. **Art. 3, comma 1, della Determinazione ACN n. 379907 del 19 dicembre 2025**: «il termine per
   l'adozione delle misure di sicurezza di base di cui agli allegati 1 e 2 è fissato in **diciotto
   mesi dalla ricezione, da parte del soggetto NIS, della comunicazione di inserimento nell'elenco
   dei soggetti NIS**». Il termine per l'obbligo di notifica degli incidenti significativi di base è
   fissato in **nove mesi** dalla stessa data.
2. **ACN ha iniziato a inviare le comunicazioni di inserimento il 12 aprile 2025** (Guida alla
   lettura, nota 6) e nelle settimane successive. Per i soggetti che l'hanno ricevuta entro il
   30 aprile 2025 - la larga maggioranza della prima ondata - i diciotto mesi maturano **entro il
   31 ottobre 2026**.

**Il termine è quindi soggettivo, non generale.** Ciascun cliente ha la propria data. Il 31 ottobre
2026 è **il limite esterno della prima ondata**, ed è la data oltre la quale ACN passa dalla fase di
accompagnamento a quella ispettiva e sanzionatoria.

**Per i soggetti inseriti per la prima volta nell'elenco nell'anno solare 2026 il quadro è diverso**
(Determinazione ACN n. 127434 del 13 aprile 2026, art. 1):

- misure di sicurezza di base: termine **31 luglio 2027**;
- obbligo di notifica degli incidenti significativi di base: decorre dal **1° gennaio 2027**.

> **Correzione a R3.** L'affermazione di R3 secondo cui le misure di base vanno «implementate in
> modo dimostrabile entro il 31 ottobre 2026» è **sostanzialmente corretta per la prima ondata** ma
> **imprecisa come regola**: la regola è «18 mesi dalla ricezione della comunicazione», e per la
> seconda ondata la data è il 31 luglio 2027.

### 14.2 Obblighi dell'**utilizzatore** (deployer) - non del progetto

Va detto con chiarezza, perché è la fonte più frequente di confusione commerciale: **nessuno dei
seguenti obblighi è del fornitore.** Il progetto non può adempierli né attestarli.

| Adempimento | Termine | Fonte |
|---|---|---|
| Registrazione e dichiarazione annuale sul Portale NIS | 1° gennaio – 28 febbraio di ogni anno | Det. ACN 379887/2025, art. 11 |
| Aggiornamento annuale delle informazioni | 15 aprile – 31 maggio di ogni anno | Det. ACN 379887/2025 |
| **Dichiarazione dei fornitori rilevanti** ad ACN | 15 aprile – 31 maggio; prima scadenza 31 maggio 2026 | Det. ACN 127437/2026, art. 18 |
| Designazione del punto di contatto, del sostituto e del referente CSIRT | secondo le finestre del Portale | Art. 7 d.lgs. 138/2024; Det. ACN 379887/2025 |
| Nomina del referente per la cybersicurezza (per le PA e le ASL) | vigente | Art. 8 L. 90/2024 |
| Approvazione degli **11 documenti** da parte degli organi di amministrazione e direttivi | entro il termine per le misure | Art. 23 d.lgs. 138/2024; Appendice C Guida ACN |
| Adozione delle **37 o 43 misure di sicurezza di base** in modo documentalmente dimostrabile | **18 mesi dalla comunicazione** (prima ondata: entro il 31 ottobre 2026) | Det. ACN 379907/2025, art. 3 c. 1 |
| Notifica degli incidenti significativi al CSIRT Italia (24 h / 72 h / 1 mese) | operativo dal **15 gennaio 2026** per la prima ondata | Art. 25 d.lgs. 138/2024; Det. ACN 379907/2025, art. 3 c. 2 |
| Segnalazione ad ACN entro 24 h e notifica entro 72 h (ASL e PA) | vigente | Art. 1 L. 90/2024 |

**Che cosa il progetto può fare per il deployer, senza sostituirsi a lui**: fornire le evidenze
documentali che il deployer deve incorporare nei propri piani. È il contenuto di `SEC-001` e
`SEC-002`.

### 14.3 Obblighi e opportunità del **fornitore** - che cosa deve fare Telemedic

**Nessuno degli obblighi NIS2 è, oggi, in capo al progetto Telemedic.** Ma tre effetti sono
ineludibili e cadono tutti nella finestra che precede il rilascio della v1.0:

- dal **31 ottobre 2026** i clienti della prima ondata inseriranno requisiti di sicurezza nei
  **contratti nuovi, rinnovati o prorogati** (FAQ ACN);
- dal **31 maggio 2026** - già trascorso - i clienti dichiarano nominativamente i fornitori
  rilevanti ad ACN;
- dall'**11 settembre 2026** gli obblighi di segnalazione dell'art. 14 CRA sono applicabili ai
  fabbricanti; gli integratori commerciali di Telemedic ne sono destinatari.

**Piano di lavoro, ordinato per priorità e con l'orizzonte del 31 ottobre 2026 (≈ 10 settimane dalla
data di redazione):**

#### Priorità 1 - deve esistere prima della v1.0, altrimenti il prodotto non è vendibile a un soggetto NIS

| # | Deliverable | Requisiti coperti | Sforzo |
|---|---|---|---|
| 1 | **SBOM CycloneDX** generata in CI, firmata, pubblicata con ogni *release* | SEC-043, SEC-050, SEC-051 | Basso - è già nella decisione D10 |
| 2 | **`SECURITY.md`** con politica di *disclosure* coordinata, canale di contatto e tempi dichiarati | SEC-045, SEC-046 | Basso |
| 3 | **Audit log append-only con catena di *hash* ed *export* firmato in CSV/JSON** | SEC-033, SEC-034, SEC-035, SEC-036 | **Alto** - richiede una scelta architetturale che Hibernate Envers da solo non risolve: Envers versiona, non rende immutabile |
| 4 | **Matrice RACI delle 43 misure** fornitore/deployer | SEC-002 | Medio - richiede la lettura riga per riga degli allegati 1 e 2 |
| 5 | **Fascicolo di conformità NIS**: inventario dei flussi di rete con i cinque attributi, elenco dei sistemi accessibili da remoto, configurazioni di riferimento | SEC-001, SEC-055 | Medio |
| 6 | **MFA obbligatoria sulle utenze amministrative** e federazione SPID/CIE/TS-CNS | SEC-012, SEC-013 | Medio - Keycloak la fornisce; va imposta per default |
| 7 | **Misurazione della disponibilità per tenant e servizio**, con soglie e allarmi | SEC-037 | Medio - estensione dello schema TimescaleDB già previsto |

#### Priorità 2 - deve esistere entro la v1.0

| # | Deliverable | Requisiti coperti |
|---|---|---|
| 8 | **VEX** pubblicato accanto alla SBOM | SEC-044 |
| 9 | **Dichiarazione tecnica di deroga a `DE.CM-09`** con misure compensative | SEC-010 |
| 10 | **Tabella artefatto → regime MDR/CRA** approvata dal PRRC | SEC-006 |
| 11 | **Modello di DPA negoziabile** con allegato tecnico ex art. 32 | SEC-005 |
| 12 | **Rilevazione IS-4**: soglie di interrogazione per utente, accessi fuori orario | SEC-020, SEC-031 |
| 13 | ***Export* SIEM** in syslog/CEF o OpenTelemetry | SEC-032 |
| 14 | ***Baseline* di *hardening*** e configurazione sicura per impostazione predefinita | SEC-055, SEC-056 |
| 15 | **Dichiarazione del periodo di supporto** (≥ 5 anni) per ciascuna *release* maggiore | SEC-008 |
| 16 | **Codici CPV e Paese della sede legale** pubblicati | SEC-007 |
| 17 | **Modello di *report* di incidente** conforme a R43, con sequenza temporale | SEC-039 |

#### Priorità 3 - dopo la v1.0, ma con impegno pubblico datato

| # | Deliverable | Requisiti coperti |
|---|---|---|
| 18 | **Certificazione ISO/IEC 27001** dell'organizzazione, o SGSI documentato con piano di certificazione | SEC-003 |
| 19 | **Audit di sicurezza annuale di terza parte** | SEC-004 |
| 20 | **Esercitazione di risposta agli incidenti** documentata | SEC-040 |
| 21 | **Ambiente di collaudo delle patch** | SEC-058 |
| 22 | Valutazione della costituzione di una **persona giuridica** che assuma il ruolo di *open-source software steward* ex art. 3, punto 14, e art. 24 CRA | § 7.4 |

### 14.4 Tre decisioni da prendere, non da rimandare

1. **L'audit log immutabile non è Envers.** Hibernate Envers produce tabelle `_aud` che sono
   **modificabili da chiunque abbia privilegi sulla base dati**. Il vincolo V5 («non ripudiabile e
   non alterabile») e i requisiti `SEC-033`, R30 AgID, ABSC 3.5.1 richiedono qualcosa di più: catena
   di *hash*, conservazione separata, verifica indipendente. **Serve un ADR.** È il singolo elemento
   di maggior sforzo dell'intero catalogo.
2. **Il modello di erogazione determina chi è soggetto NIS.** Se il progetto (o una società collegata)
   eroga Telemedic in SaaS multi-tenant e supera le soglie della media impresa, **diventa soggetto
   NIS in proprio** come fornitore di servizi cloud, con tutti gli obblighi del § 14.2. Se distribuisce
   solo software installabile, resta fornitore. **La decisione D8 (doppio modello) va accompagnata da
   una valutazione esplicita di questo effetto.**
3. **La monetizzazione attiva il CRA.** Il momento in cui il progetto vende supporto con SLA o una
   edizione *enterprise* è il momento in cui il venditore diventa **fabbricante** ai sensi del CRA per
   ciò che immette sul mercato - salvo che quel prodotto sia coperto dalla marcatura CE MDR. Va
   deciso prima, non dopo, perché determina la documentazione tecnica da costruire.

---

## 15. Questioni aperte per gli altri agenti

| # | Questione | Destinatario |
|---|---|---|
| **QB4-1** | Scaricare e leggere riga per riga gli **allegati 1 e 2 alla Det. ACN 379907/2025** (formato `.xlsx`) e completare la matrice RACI delle 43 misure con il testo dei 116 requisiti. **Nessun requisito puntuale delle misure va citato in documentazione pubblica prima di questa lettura.** | Agente sicurezza / documentazione |
| **QB4-2** | Verificare sul testo la **Determinazione ACN n. 379887/2025** e la **n. 127437/2026**, in particolare l'art. 18 e i codici CPV richiesti. | Agente conformità |
| **QB4-3** | Verificare lo **stato di armonizzazione di EN IEC 81001-5-1:2022 sotto MDR** nella Gazzetta ufficiale dell'Unione europea (Decisione di esecuzione (UE) 2021/1182 e successive modifiche, da ultimo - da confermare - 2026/193). | Agente MDR |
| **QB4-4** | Acquisire le **Linee guida NIS ACN sul processo di gestione degli incidenti** (31 dicembre 2025) e allinearvi la procedura di risposta agli incidenti di Telemedic. | Agente sicurezza |
| **QB4-5** | Verificare il **DPCM 30 aprile 2025** e il **DPCM 2 ottobre 2025** sul testo in GU e accertare se la fornitura di una piattaforma di telemedicina ricade in una delle categorie tecnologiche dell'Allegato 2. | Agente conformità / appalti |
| **QB4-6** | **ADR sull'audit log immutabile**: valutare catena di *hash* applicativa, *append-only* a livello di storage, *write-once* su oggetto, o firma periodica con marca temporale. Envers da solo non soddisfa V5. | Agente architettura |
| **QB4-7** | Valutare l'impatto della **classificazione come soggetto NIS in proprio** dell'operatore SaaS, alla luce della decisione D8. | Committente |
| **QB4-8** | Selezionare i **codici CPV** pertinenti con un consulente di appalti pubblici e verificarli sul vocabolario vigente. | Agente conformità / appalti |
| **QB4-9** | Definire i **livelli di servizio attesi (SL)** ai sensi di `DE.CM-01` da proporre come valori di riferimento nella documentazione, distinguendoli dagli SLA contrattuali della Tabella 3 del DM 21 settembre 2022. | Agente architettura / prodotto |

---

## 16. Fonti

**Fonti primarie lette integralmente**

- [ACN - Determinazione n. 379907 del 19 dicembre 2025 (specifiche di base)](https://www.acn.gov.it/portale/documents/d/guest/detacn_obblighi_2511-v3_signed)
- [ACN - Determinazione n. 127434 del 13 aprile 2026 (termini per i soggetti inseriti nel 2026)](https://www.acn.gov.it/portale/documents/d/guest/detacn_misuresicurezza-v4_post)
- [ACN - «Linee Guida NIS – Specifiche di base – Guida alla lettura», v. 2.1, aprile 2026](https://www.acn.gov.it/portale/documents/d/guest/guida-alla-lettura-specifiche-di-base)
- [ACN - Determinazione n. 164179 del 14 aprile 2025 (sostituita)](https://www.acn.gov.it/portale/documents/d/guest/detacn_nis_specifiche_2025_164179_signed)
- [Circolare AgID 18 aprile 2017, n. 2/2017 - testo in GU n. 103 del 5 maggio 2017](https://cert-agid.gov.it/download/CircolareAgID_170418_n_2_2017_Mis_minime_sicurezza_ICT_PA-GU-103-050517-2.pdf) · [scheda GU](https://www.gazzettaufficiale.it/eli/id/2017/05/05/17A03060/sg)
- [AgID - «Linee guida - Sicurezza nel Procurement ICT», aprile 2020](https://trasparenza.agid.gov.it/download/4514.html)

**Fonti primarie consultate parzialmente**

- [D.lgs. 4 settembre 2024, n. 138 - GU n. 230 del 1° ottobre 2024](https://www.gazzettaufficiale.it/eli/id/2024/10/01/24G00155/sg) · [Normattiva](https://www.normattiva.it/uri-res/N2Ls?urn:nir:stato:decreto.legislativo:2024-09-04;138)
- [Legge 28 giugno 2024, n. 90 - Normattiva](https://www.normattiva.it/atto/caricaDettaglioAtto?atto.dataPubblicazioneGazzetta=2024-07-02&atto.codiceRedazionale=24G00108)
- [Regolamento (UE) 2024/2847 (Cyber Resilience Act) - EUR-Lex](https://eur-lex.europa.eu/eli/reg/2024/2847/oj)
- [MDCG 2019-16 rev. 1 - Guidance on Cybersecurity for medical devices](https://health.ec.europa.eu/system/files/2022-01/md_cybersecurity_en.pdf)
- [ACN - FAQ NIS, «Misure di sicurezza e notifica di incidenti»](https://www.acn.gov.it/portale/en/faq/nis/misure-di-sicurezza-e-notifica-di-incidenti)
- [ACN - sezione NIS, modalità e specifiche di base](https://www.acn.gov.it/portale/nis/modalita-specifiche-base)
- [ACN - «NIS: online le determine sugli adempimenti per i nuovi soggetti e sulle modalità di accesso alla piattaforma»](https://www.acn.gov.it/portale/w/nis-online-le-determine-sugli-adempimenti-per-i-nuovi-soggetti-e-sulle-modalita-di-accesso-alla-piattaforma-acn)
- [ACN - «NIS2, Linee Guida sul processo di gestione degli incidenti di sicurezza informatica»](https://www.acn.gov.it/portale/en/w/nis2-linee-guida-sul-processo-di-gestione-degli-incidenti-di-sicurezza-informatica)
- [ACN - Linee guida sui criteri di premialità ex art. 14 L. 90/2024](https://www.acn.gov.it/portale/documents/20119/1067494/Linee+guida_Criteri_Premialita%CC%80.pdf)
- [Framework Nazionale per la Cybersecurity e la Data Protection](https://www.cybersecurityframework.it/)

**Fonti secondarie qualificate (usate per gli elementi marcati [NON VERIFICATO])**

- [CMS - «ACN pubblica le nuove Determinazioni n. 379907/2025 e n. 379887/2025»](https://cms.law/it/ita/publication/acn-pubblica-le-nuove-determinazioni-n.-379907-2025-obblighi-di-base-e-n.-379887-2025-portale-acn-e-servizi-nis)
- [Assolombarda - «ACN pubblica due nuove Determinazioni NIS2»](https://www.assolombarda.it/servizi/industria-innovazione-e-qualita/informazioni/direttiva-nis2-acn-pubblica-le-determinazioni-379887-e-379907)
- [ICT Security Magazine - «NIS2: la mappa completa degli adempimenti da qui a ottobre 2026»](https://www.ictsecuritymagazine.com/notizie/nis2-adempimenti/)
- [Cyberness - «NIS 2, supply chain: la Determinazione ACN 127437/2026 introduce l'obbligo di elencare i fornitori rilevanti»](https://www.cyberness.it/nis2-fornitori-rilevanti-determinazione-acn-127437-2026/)
- [iSimply - «Fornitori rilevanti NIS2: tutti i chiarimenti ACN»](https://www.isimply.it/news/fornitori-rilevanti-nis2-tutti-i-chiarimenti-acn/)
- [Piselli & Partners - «Elementi essenziali di cybersicurezza nei contratti pubblici: il DPCM 30 aprile 2025 e l'art. 14 della L. 90/2024»](https://www.piselliandpartners.com/innovation/elementi-essenziali-di-cybersicurezza-nei-contratti-pubblici-il-dpcm-30-aprile-2025-e-lart-14-della-l-90-2024/)
- [Cybersecurity360 - «ACN aggiorna le "specifiche di base" NIS2»](https://www.cybersecurity360.it/legal/acn-aggiorna-le-specifiche-di-base-nis2-cosa-devono-fare-i-soggetti-interessati/)

---

> **Disclaimer, ribadito.** Analisi tecnica di conformità, non consulenza legale. Le qualificazioni
> giuridiche vanno confermate da un professionista abilitato sulla base degli elementi di fatto del
> singolo caso.
