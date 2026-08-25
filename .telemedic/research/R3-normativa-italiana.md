---
title: "Quadro istituzionale e normativo della telemedicina in Italia"
sidebar_position: 3
description: "Accordo 215/CSR 2020, DM 77/2022, DM 21 e 30 settembre 2022, DM 19 novembre 2025, FSE 2.0, PNRR M6, AgID, ACN, riuso e tariffe."
---

# Quadro istituzionale, normativo e organizzativo della telemedicina in Italia

**Ricerca di riferimento per il progetto Telemedic — agente R3**
**Data di redazione: 25 agosto 2026 — stato normativo accertato alla data**

---

## 0. Nota metodologica e avvertenze di affidabilità

Questa ricerca è stata condotta su fonti primarie ove disponibili: testi in *Gazzetta Ufficiale*, atti del repertorio della Conferenza permanente per i rapporti tra lo Stato, le Regioni e le Province autonome, provvedimenti del Garante per la protezione dei dati personali, documentazione AGENAS, AgID e ACN, Implementation Guide di HL7 Italia, rapporti dell'Istituto Superiore di Sanità.

Distinzioni terminologiche usate in tutto il documento:

- **[VINCOLANTE]** — norma di legge, regolamento, decreto ministeriale con efficacia normativa, o atto della Conferenza Stato‑Regioni recepito da atti regionali.
- **[TECNICO‑VINCOLANTE]** — allegato tecnico a un decreto, quindi parte integrante di un atto vincolante, ma la cui cogenza si dispiega sui destinatari specifici (in genere Regioni e loro fornitori nell'ambito PNRR).
- **[RACCOMANDATO]** — linee guida, indicazioni metodologiche, buone pratiche non sanzionate.
- **[NON VERIFICATO]** — informazione ricavata da fonte secondaria e non confermata su fonte primaria. **Va verificata prima di essere trasferita nella documentazione di progetto.**

**Avvertenze specifiche, dichiarate in apertura per onestà:**

1. **Non esiste — per quanto accertato — un decreto intitolato «requisiti funzionali minimi della Piattaforma Nazionale di Telemedicina».** Il mandato lo presupponeva. Ciò che esiste è descritto nel § 4.1: le funzioni della *Piattaforma nazionale* sono definite in parte dal DM 21 settembre 2022 (che però disciplina le *Infrastrutture regionali*), in parte da un documento AGENAS non normativo («Indicazioni metodologiche per la perimetrazione delle proposte di PPP per la Piattaforma nazionale di telemedicina»), in parte dal DM 19 novembre 2025. Se un agente successivo cita un «decreto sui requisiti funzionali minimi della PNT» sta citando un atto che non ho potuto reperire.
2. Il testo integrale del **DM 19 novembre 2025** (19 articoli, 5 allegati) non è stato letto per intero su fonte primaria: ne ho verificato titolo, data, estremi di GU e il contenuto degli artt. 2 e 17; il resto è ricostruito dal parere del Garante n. 2/2025 (fonte primaria) e da fonti secondarie qualificate. I singoli commi vanno riletti sul testo GU prima di derivarne requisiti implementativi.
3. Sulle **tariffe** esistono fonti secondarie in contraddizione tra loro (§ 10). Il punto è segnalato come questione aperta.

---

## 1. Architettura delle fonti: dove sta la norma

Il diritto italiano della telemedicina non è contenuto in una legge organica. È stratificato su quattro livelli, che è indispensabile tenere distinti perché hanno destinatari e cogenza diversi.

| Livello | Fonte | Cosa disciplina | Destinatario |
|---|---|---|---|
| **1. Legge primaria** | Art. 12 del D.L. 18 ottobre 2012, n. 179, conv. con mod. dalla L. 17 dicembre 2012, n. 221, come novellato dall'art. 21 del D.L. 27 gennaio 2022, n. 4, conv. con mod. dalla L. 28 marzo 2022, n. 25 | Fascicolo sanitario elettronico, governo della sanità digitale, ruolo di AGENAS quale **Agenzia nazionale per la sanità digitale (ASD)**, potestà di adottare linee guida tecniche vincolanti (comma 15‑*undecies*) | Stato, Regioni, strutture sanitarie |
| **2. Atti della Conferenza Stato‑Regioni** | Intesa 20 febbraio 2014, rep. atti n. 16/CSR; **Accordo 17 dicembre 2020, rep. atti n. 215/CSR**; Accordo 18 novembre 2021, rep. atti n. 231/CSR | Definizioni delle prestazioni, condizioni di erogazione, regole di remunerazione, consenso, responsabilità | Regioni e PA, che li recepiscono con atti regionali |
| **3. Decreti ministeriali** | DM 23 maggio 2022, n. 77; **DM 21 settembre 2022**; **DM 30 settembre 2022**; DM 28 settembre 2023; **DM 19 novembre 2025**; per il FSE: DM 20 maggio 2022, DM 7 settembre 2023, DM 30 dicembre 2024, DM 31 dicembre 2024 (EDS) | Modelli organizzativi, requisiti funzionali e tecnologici, architettura della piattaforma, trattamento dei dati | Regioni, AGENAS, fornitori di soluzioni |
| **4. Regole tecniche trasversali della PA** | CAD (D.lgs. 82/2005); Linee guida AgID ex art. 71 CAD; determinazioni ACN; Piano triennale per l'informatica nella PA | Interoperabilità, sicurezza, cloud, accessibilità, riuso del software | Tutte le PA e i loro fornitori |

A questi si aggiungono due corpi normativi **orizzontali e pienamente vincolanti**: il Regolamento (UE) 2016/679 (GDPR) con il D.lgs. 196/2003 come novellato, e il Regolamento (UE) 2017/745 (MDR) — quest'ultimo trattato qui solo nei punti in cui la normativa italiana della telemedicina **impone espressamente** la certificazione come dispositivo medico (§ 4.6), lasciando l'analisi MDR all'agente competente.

---

## 2. Cronologia degli atti: la successione normativa ricostruita

### 2.1 Tabella cronologica

| Data | Atto | Estremi e pubblicazione | Contenuto | Stato |
|---|---|---|---|---|
| 20 feb. 2014 | Intesa Stato‑Regioni | Rep. atti n. 16/CSR — «Telemedicina — Linee di indirizzo nazionali» | Primo inquadramento strategico, classificazione dei servizi | Superata nei contenuti operativi, ancora richiamata come fonte di principi |
| 22 gen. 2015 | Accordo Stato‑Regioni | — | Teleconsulenza per le reti regionali di malattia rara | Vigente, settoriale |
| 13 apr. 2020 | Rapporto ISS COVID‑19 n. 12/2020 | «Indicazioni ad interim per servizi assistenziali di telemedicina durante l'emergenza sanitaria COVID‑19» | Indicazioni emergenziali | Storico |
| 10 ott. 2020 | Rapporto ISS COVID‑19 n. 60/2020 | Telemedicina in pediatria | Indicazioni emergenziali | Storico |
| **17 dic. 2020** | **Accordo Stato‑Regioni** | **Rep. atti n. 215/CSR**, Allegato A «Indicazioni nazionali per l'erogazione di prestazioni in telemedicina», v. 4.4 del 27 ottobre 2020 — [testo](https://www.statoregioni.it/media/3221/p-3-csr-rep-n-215-17dic2020.pdf) | **Definizioni canoniche delle prestazioni**, condizioni di erogazione, adesione informata, responsabilità, standard di servizio | **Vigente. Fonte primaria delle definizioni** |
| 18 nov. 2021 | Accordo Stato‑Regioni | Rep. atti n. 231/CSR — «Indicazioni nazionali per l'erogazione di prestazioni e servizi di teleriabilitazione da parte delle professioni sanitarie» — [testo](https://www.statoregioni.it/media/4271/p-1-csr-atto-rep-n-231-18nov2021.pdf) | Teleriabilitazione, inquadramento nel PRI, tariffazione equivalente, accreditamento | Vigente |
| 1 apr. 2022 | DM Ministero della salute | Riparto analitico del sub‑investimento PNRR 1.2.3 | Sub‑codifica 1.2.3.1 «Piattaforma di telemedicina» 250 M€; 1.2.3.2 «Servizi di telemedicina» 750 M€ | Vigente |
| 29 apr. 2022 | DM Ministero della salute | GU Serie generale n. 120 del 24 maggio 2022 | Linee guida organizzative «Modello digitale per l'attuazione dell'assistenza domiciliare» (Milestone EU M6C1‑4) | Vigente |
| 20 mag. 2022 | DM Ministero della salute, di concerto MITD e MEF | GU Serie generale n. 160 dell'11 luglio 2022 — [scheda GU](https://www.gazzettaufficiale.it/eli/id/2022/07/11/22A03961/SG) | «Adozione delle Linee guida per l'attuazione del Fascicolo sanitario elettronico» (FSE 2.0) | Vigente |
| **23 mag. 2022** | **DM Ministero della salute n. 77** | Regolamento — GU Serie generale n. 144 del 22 giugno 2022 | Modelli e standard per lo sviluppo dell'assistenza territoriale; telemedicina come componente strutturale | **Vigente** |
| 28 mag. 2022 | Linee guida ex art. 12, c. 15‑*bis*, D.L. 179/2012 | Approvate in Conferenza Stato‑Regioni | Attuazione FSE | Vigenti |
| **21 set. 2022** | **DM Ministero della salute di concerto con il Ministro per l'innovazione tecnologica e la transizione digitale** | **GU Serie generale n. 256 del 2 novembre 2022, atto 22A06184** — [testo](https://www.gazzettaufficiale.it/eli/id/2022/11/02/22A06184/sg) | **«Approvazione delle linee guida per i servizi di telemedicina — Requisiti funzionali e livelli di servizio»**, Allegato A | **Vigente. Fonte primaria dei requisiti tecnici** |
| **30 set. 2022** | **DM Ministero della salute di concerto con il Ministro per l'innovazione tecnologica e la transizione digitale** | **GU Serie generale n. 298 del 22 dicembre 2022, atto 22A07125** — [testo](https://www.gazzettaufficiale.it/eli/id/2022/12/22/22A07125/sg) | Procedure di selezione delle soluzioni di telemedicina, Commissione tecnica di valutazione, Piani operativi regionali (All. A), **«Linee di indirizzo per i servizi di telemedicina» (All. B)**, Regioni capofila | **Vigente** |
| 7 set. 2023 | DM Ministero della salute | GU Serie generale n. 249 del 24 ottobre 2023, atto 23A05829 — [testo](https://www.gazzettaufficiale.it/eli/id/2023/10/24/23A05829/sg) | **Fascicolo sanitario elettronico 2.0**: contenuti, soggetti, consensi, alimentazione, consultazione, sicurezza | Vigente, come modificato |
| 28 set. 2023 | DM Ministero della salute | GU Serie generale n. 271 del 20 novembre 2023, atto 23A06323 — [scheda GU](https://www.gazzettaufficiale.it/eli/id/2023/11/20/23A06323/sg) | Riparto alle Regioni delle risorse M6C1‑1.2.3.2 «Servizi di telemedicina» | Vigente |
| 30 dic. 2024 | DM Ministero della salute | GU Serie generale n. 33 del 10 febbraio 2025, atto 25A00808 | Modifica il DM 7 settembre 2023: **fasi transitorie di attuazione del FSE 2.0** (art. 27‑*bis*) | Vigente |
| 31 dic. 2024 | DM Ministero della salute | GU Serie generale n. 53 del 5 marzo 2025, atto 25A01321 — [scheda GU](https://www.gazzettaufficiale.it/eli/id/2025/03/05/25A01321/SG) | **Istituzione dell'Ecosistema dati sanitari (EDS)** | Vigente |
| **19 nov. 2025** | **DM Ministero della salute** | **GU Serie generale n. 301 del 30 dicembre 2025, atto 25A06938** — [scheda GU](https://www.gazzettaufficiale.it/eli/id/2025/12/30/25A06938/SG) | **Disciplina del trattamento dei dati personali nell'ambito dell'infrastruttura della Piattaforma nazionale di telemedicina.** Istituisce formalmente PNT, INT, IRT; titolarità; sicurezza; interoperabilità con FSE/EDS | **Vigente** |
| dic. 2025 | Legge di bilancio 2026 | **[NON VERIFICATO]** — fonti secondarie concordi indicano l'**art. 85** | 20 M€ ad AGENAS come Agenzia nazionale per la sanità digitale; dotazioni tecnologiche per il telemonitoraggio; DM attuativo entro 6 mesi | Da verificare su Normattiva |

### 2.2 Cosa impone ciascun atto a una piattaforma software

**Accordo 17 dicembre 2020, rep. 215/CSR.** Non parla di software se non nella sezione «Prestazioni sanitarie a distanza: elementi e standard necessari». Ma è **la fonte delle definizioni** e quindi determina il modello di dominio. Impone al software: refertazione obbligatoria della televisita; registrazione nel referto della presenza di collaboratori e della **qualità del collegamento**; cifratura di *tutti* i trasferimenti di voce, video, immagini, file; identità verificata del paziente; conformità GDPR; certificazione come dispositivo medico dell'hardware e/o del software «idonea alla tipologia di prestazione che si intende effettuare in telemedicina».

**DM 77/2022.** Colloca la telemedicina dentro il modello organizzativo territoriale (Case della Comunità, Centrali Operative Territoriali, Ospedali di Comunità, assistenza domiciliare). Non detta requisiti software, ma **determina il contesto di adozione**: la telemedicina non è un canale alternativo, è una modalità di erogazione integrata nei percorsi (PAI/PDTA). Il DM 21 settembre 2022 dichiara espressamente di essere stato redatto «in coerenza con quanto previsto dal decreto ministeriale 23 maggio 2022, n. 77».

**DM 21 settembre 2022.** È **l'atto tecnicamente più prescrittivo**. Vedi § 4.2–4.7 per il dettaglio.

**DM 30 settembre 2022.** Disciplina il *procurement*: le Regioni presentano Piani operativi ad AGENAS; una Commissione tecnica li valuta entro 30 giorni; **le Regioni possono attivare le soluzioni selezionate esclusivamente attraverso le gare delle Regioni capofila (Lombardia e Puglia)** o aderendo ad accordi ex art. 15 L. 241/1990. Questo è determinante per la strategia di go‑to‑market pubblico: nel perimetro PNRR **non c'è spazio per acquisti diretti da parte della singola ASL**.

**DM 19 novembre 2025.** Formalizza l'architettura PNT/INT/IRT e la disciplina privacy. Impone: autenticazione forte, cifratura, tracciamento, non persistenza di dati personali nella INT, alimentazione di FSE/EDS.

---

## 3. Le prestazioni canoniche: definizioni ufficiali testuali

Le definizioni che seguono sono riportate **verbatim** dall'Allegato A all'Accordo Stato‑Regioni 17 dicembre 2020, rep. atti n. 215/CSR (versione 4.4 del 27 ottobre 2020), sezione «Definizione delle prestazioni di telemedicina trattate in questo documento e indicazioni delle condizioni per l'erogazione». Il DM 21 settembre 2022 le riprende nella propria Appendice «Definizioni» con lievi adattamenti, integrandole con telemonitoraggio e telecontrollo.

> **Nota terminologica critica.** L'Accordo 2020 elenca **cinque** attività ambulatoriali (televisita, teleconsulto, teleconsulenza, teleassistenza, telerefertazione) più telecontrollo e telemonitoraggio come «modalità operative». Il DM 21 settembre 2022 individua invece **quattro «servizi minimi»** che l'Infrastruttura regionale deve erogare: **televisita, teleconsulto/teleconsulenza, telemonitoraggio, teleassistenza**. Le due tassonomie **non coincidono**: nel DM il teleconsulto e la teleconsulenza sono unificati in un unico servizio minimo, la telerefertazione scompare come servizio autonomo (diventa il micro‑servizio trasversale «refertazione e firma digitale») e il telemonitoraggio è promosso a servizio minimo. **Il modello di dominio di Telemedic deve rappresentare entrambe le tassonomie e la loro mappatura.**

### 3.1 Televisita

> «È un atto medico in cui il professionista interagisce a distanza in tempo reale con il paziente, anche con il supporto di un *care‑giver*. Tuttavia, la televisita, come previsto anche dal codice di deontologia medica, non può essere mai considerata il mezzo per condurre la relazione medico‑paziente esclusivamente a distanza, né può essere considerata in modo automatico sostitutiva della prima visita medica in presenza. Il medico è deputato a decidere in quali situazioni e in che misura la televisita può essere impiegata in favore del paziente, utilizzando anche gli strumenti di telemedicina per le attività di rilevazione, o monitoraggio a distanza, dei parametri biologici e di sorveglianza clinica. **La televisita è da intendersi limitata alle attività di controllo di pazienti la cui diagnosi sia già stata formulata nel corso di visita in presenza.**»

**Attori.** Medico (l'atto è riservato al medico); paziente; facoltativamente *caregiver*; facoltativamente un operatore sanitario presso il paziente («Durante la televisita un operatore sanitario che si trovi vicino al paziente può assistere il medico e/o aiutare il paziente»).

**Il vincolo sulla prima visita — lettura esatta.** Il testo pone **due** affermazioni distinte, spesso confuse:

1. la televisita **non è automaticamente sostitutiva** della prima visita medica in presenza;
2. la televisita **è da intendersi limitata alle attività di controllo** di pazienti già diagnosticati in presenza.

La seconda è più restrittiva della prima. Non si tratta di un divieto assoluto ma di una **delimitazione dell'ambito ordinario**, temperata dalla clausola di responsabilità medica («il medico è deputato a decidere»). Alcune declinazioni regionali hanno esplicitamente ammesso l'uso in prima visita a valle di un teleconsulto tra MMG/PLS e specialista: ad esempio le Indicazioni regionali dell'Emilia‑Romagna (BUR n. 255 del 17 agosto 2021, Allegato 2) affermano che «non se ne esclude la possibilità di utilizzo anche nei casi in cui il paziente sia inviato per la prima volta ad uno specialista a seguito di teleconsulto tra il MMG/PLS e lo specialista». **Questa apertura è regionale, non nazionale: nella documentazione di prodotto va presentata come tale.**

**Condizioni tassative di erogabilità.** Sono erogabili in televisita le prestazioni ambulatoriali che **non richiedono la completezza dell'esame obiettivo** (tradizionalmente composto da ispezione, palpazione, percussione e auscultazione) **ed** in presenza di **almeno una** delle seguenti condizioni:

- il paziente necessita della prestazione nell'ambito di un **PAI/PDTA**;
- il paziente è inserito in un percorso di **follow‑up da patologia nota**;
- il paziente affetto da patologia nota necessita di **controllo o monitoraggio, conferma, aggiustamento o cambiamento della terapia in corso** (es. rinnovo o modifica del piano terapeutico);
- il paziente necessita di **valutazione anamnestica** per la prescrizione di esami di diagnosi, o di stadiazione di patologia nota o sospetta;
- il paziente necessita della **verifica da parte del medico degli esiti di esami effettuati**, cui può seguire la prescrizione di approfondimenti o di una terapia.

**Obblighi documentali.** «La televisita erogata nell'ambito dell'attività specialistica ambulatoriale **deve sempre concludersi con un referto**.» Nel referto, oltre alle consuete informazioni, devono essere registrati:

- indicazione di eventuali collaboratori partecipanti (presenza di *caregiver*, presenza di un medico);
- **qualità del collegamento e conferma dell'idoneità dello stesso all'esecuzione della prestazione**.

Il referto va sottoscritto digitalmente dal medico, reso disponibile al paziente nella modalità telematica preferita, e deve essere sempre possibile, su richiesta del paziente, condividerlo con altri sanitari in formato digitale, «anche attraverso il Fascicolo Sanitario Elettronico (FSE)».

**Clausola di fallback obbligatoria.** «Qualora lo strumento di Telemedicina non permetta di mantenere inalterato il contenuto sostanziale della prestazione da erogare, le Aziende e gli erogatori privati sono tenuti a **completare la prestazione in modalità tradizionale senza ulteriori oneri a carico del SSN e/o utente**.» Analogamente, in caso di insufficienza del risultato «per qualunque motivo (tecnico, legato alle condizioni riscontrate del paziente o altro)» scatta «**l'obbligo della riprogrammazione della prestazione in presenza**».

**Esiti tipizzati.** L'Accordo elenca gli esiti ammissibili: riscontro o meno di stabilità clinica nel quadro diagnostico noto; necessità o meno di accesso urgente a prestazioni diagnostico‑terapeutiche (con presa in carico da parte dello specialista); richiesta di approfondimento diagnostico (con indicazione del codice di priorità in ricetta); prescrizione o rinnovo di piano terapeutico; riprogrammazione in modalità ordinaria in caso di esito insoddisfacente.

**Prerequisito procedurale.** «L'attivazione del servizio di telemedicina richiede **l'adesione preventiva del paziente** o di familiare autorizzato.»

### 3.2 Teleconsulto medico

> «È un atto medico in cui il professionista interagisce a distanza con uno o più medici per dialogare, anche tramite una videochiamata, riguardo la situazione clinica di un paziente, basandosi primariamente sulla condivisione di tutti i dati clinici, i referti, le immagini, gli audio‑video riguardanti il caso specifico. Tutti i suddetti elementi devono essere condivisi per via telematica sotto forma di file digitali idonei per il lavoro che i medici in teleconsulto ritengono necessario per l'adeguato svolgimento di esso. Il teleconsulto tra professionisti **può svolgersi anche in modalità asincrona**, quando la situazione del paziente lo permette in sicurezza. **Quando il paziente è presente al teleconsulto, allora esso si svolge in tempo reale utilizzando le modalità operative analoghe a quelle di una televisita e si configura come una visita multidisciplinare.**»

**Attori.** Due o più **medici**. Il paziente può essere presente o assente.

**Scopo.** «Condividere le scelte mediche rispetto a un paziente da parte dei professionisti coinvolti» e fornire la ***second opinion* specialistica** ove richiesto.

**Obbligo documentale — distinzione cruciale.** «Il teleconsulto **contribuisce alla definizione del referto** che viene redatto al termine della visita erogata al paziente, **ma non dà luogo ad un referto a sé stante**.» Il teleconsulto **non è una prestazione specialistica autonoma**: non ha voce a nomenclatore, non prevede prescrizione SSN né compartecipazione alla spesa, e rientra nell'attività lavorativa del professionista.

**Differenza rispetto alla televisita.** L'asse è medico‑medico, non medico‑paziente; è ammessa l'asincronia; non produce referto autonomo; non è tariffato.

### 3.3 Teleconsulenza medico‑sanitaria

> «È un'attività sanitaria, **non necessariamente medica ma comunque specifica delle professioni sanitarie**, che si svolge a distanza ed è eseguita da due o più persone che hanno differenti responsabilità rispetto al caso specifico. Essa consiste nella richiesta di supporto durante lo svolgimento di attività sanitarie, a cui segue una videochiamata in cui il professionista sanitario interpellato fornisce all'altro, o agli altri, indicazioni per la presa di decisione e/o per la corretta esecuzione di azioni assistenziali rivolte al paziente. La teleconsulenza **può essere svolta in presenza del paziente, oppure in maniera differita**. In questa attività è preminente l'interazione diretta tramite la videochiamata, ma è sempre necessario garantire all'occorrenza la possibilità di condividere almeno tutti i dati clinici, i referti e le immagini riguardanti il caso specifico. **È un'attività su richiesta ma sempre programmata e non può essere utilizzata per surrogare le attività di soccorso.**»

**Differenze rispetto al teleconsulto.** (a) Gli attori non sono necessariamente medici: sono esercenti le professioni sanitarie con **responsabilità differenti** sul caso; (b) l'elemento preminente è la **videochiamata**, non la condivisione documentale; (c) è **sempre programmata**; (d) **divieto espresso** di uso in surroga del soccorso. Come il teleconsulto, non è prestazione specialistica con codifica a nomenclatore.

### 3.4 Teleassistenza da parte di professioni sanitarie

> «(infermiere/fisioterapista/logopedista/ecc): è **un atto professionale di pertinenza della relativa professione sanitaria** e si basa sull'interazione a distanza tra il professionista e paziente/*caregiver* per mezzo di una videochiamata, alla quale si può all'occorrenza aggiungere la condivisione di dati, referti o immagini. Il professionista che svolge l'attività di teleassistenza può anche utilizzare idonee app per somministrare questionari, condividere immagini o video tutorial su attività specifiche. Lo scopo della teleassistenza è quello di agevolare il corretto svolgimento di attività assistenziali, **eseguibili prevalentemente a domicilio**. La teleassistenza è **prevalentemente programmata e ripetibile** in base a specifici programmi di accompagnamento del paziente.»

**Attori.** Professionista sanitario **non medico**; paziente e/o *caregiver*.

**Differenza rispetto alla televisita.** Non è atto medico; non produce referto specialistico; è per definizione ripetitiva e programmata; ha finalità assistenziale e non diagnostica.

**Requisito funzionale specifico imposto dal DM 21 settembre 2022.** «È infatti necessario che il servizio di Teleassistenza sia in grado di rendere disponibile anche tutte le funzionalità presenti per la televisita e per il telemonitoraggio.» La teleassistenza è quindi, sul piano software, **un servizio ibrido** che riusa le capacità degli altri due.

### 3.5 Telerefertazione

> «È una relazione rilasciata dal medico che ha sottoposto un paziente a un esame clinico o strumentale il cui contenuto è quello tipico delle refertazioni eseguite in presenza e che viene scritta e trasmessa per mezzo di sistemi digitali e di telecomunicazione. Il medico esegue e invia il telereferto in tempi idonei alle necessità cliniche del paziente e in modo concorde con il medico che ha richiesto l'esame clinico o strumentale.»

Modalità previste: (a) telereferto rilasciato **successivamente** all'esecuzione tradizionale in presenza dell'esame; (b) telereferto rilasciato all'interno di un processo di **telegestione**, in cui il medico refertante è distante dal luogo di esecuzione dell'esame e si avvale della collaborazione del medico richiedente o di un sanitario presso il paziente, comunicando con essi in tempo reale.

Elementi vincolanti che ricadono direttamente sul software:

- «Il telereferto formalizza la telediagnosi **con firma digitale validata del medico responsabile dello stesso**»;
- le strutture sanitarie devono «**preventivamente effettuare prove di idoneità all'uso clinico delle attrezzature, dell'hardware e software e in esercizio prove di funzionamento a intervalli regolari e dopo ogni intervento rilevante di manutenzione o aggiornamento**»;
- devono «garantire la corretta archiviazione all'interno di **un sistema di interoperabilità** del materiale prodotto dall'esame e del referto correlato, che permetta al personale sanitario di richiamare e confrontare quanto eseguito in precedenza».

La telerefertazione **non è prestazione a sé stante** ai fini della tariffazione: «Il referto rappresenta l'attività di completamento della prestazione specialistica».

### 3.6 Telecontrollo medico e telemonitoraggio

**Telecontrollo medico** (Accordo 2020; definizione ripresa nell'Appendice al DM 21 settembre 2022): «modalità operativa della telemedicina che consente il controllo a distanza del paziente. Tale attività è caratterizzata da una serie cadenzata di contatti con il medico, che pone sotto controllo l'andamento del quadro clinico, per mezzo della videochiamata in associazione con la condivisione di dati clinici raccolti presso il paziente, sia prima che durante la videochiamata stessa.» Il telecontrollo è **prestazione medica**, annoverata tra le prestazioni del nomenclatore tariffario e rendicontata nei flussi della specialistica ambulatoriale.

**Telemonitoraggio**: «modalità operativa della telemedicina che permette il rilevamento e la trasmissione a distanza di parametri vitali e clinici in modo continuo, per mezzo di sensori che interagiscono con il paziente (tecnologie biomediche con o senza parti applicate).» Il *set* di tecnologie a domicilio «deve essere connesso costantemente al sistema *software* che raccoglie i dati dei sensori, li integra se necessario con altri dati sanitari e li mette a disposizione degli operatori del servizio di Telemedicina in base alle modalità organizzative stabilite».

Regola di afferenza: «il telemonitoraggio **non afferisce all'ambito di specialistica ambulatoriale, a meno che non sia affiancato dal telecontrollo medico, da una televisita o anche da una visita in presenza** in cui i dati registrati in continuo vengono analizzati, discussi e comunicati al paziente. I risultati del telemonitoraggio devono essere indicati nel referto della visita di controllo periodica.»

### 3.7 Teleriabilitazione

Disciplinata autonomamente dall'**Accordo Stato‑Regioni 18 novembre 2021, rep. atti n. 231/CSR**. Elementi chiave: le prestazioni devono essere inquadrate nel **Progetto Riabilitativo Individuale (PRI)**; la tariffazione è **equivalente** a quella delle prestazioni in presenza; le strutture che intendono erogare teleriabilitazione a carico del SSN devono essere **accreditate per le medesime attività in presenza**; è richiesto il consenso del paziente alle attività proposte e al trattamento dei dati.

### 3.8 Ciò che NON è telemedicina

L'Accordo 2020 è esplicito: «**Triage telefonico**: il triage o la consulenza telefonica effettuati da medici o operatori sanitari verso i pazienti allo scopo di indicare il percorso diagnostico/terapeutico più appropriato e la necessità di eseguire la visita in tempi rapidi in presenza o a distanza o la possibilità di rimandarla ad un momento successivo assegnando un nuovo appuntamento, **non rientra tra le attività riconducibili alla telemedicina**.»

### 3.9 Limiti clinici di applicazione a domicilio

L'Accordo 2020 **sconsiglia a titolo precauzionale** l'erogazione di prestazioni di telemedicina a domicilio nei confronti di:

- pazienti con patologie acute o riacutizzazioni di patologie croniche in atto;
- pazienti con patologie croniche e fragilità o con disabilità che rendano imprudente la permanenza a domicilio.

«Naturalmente, la valutazione finale degli strumenti idonei per il singolo paziente spetta al medico che ne ha la responsabilità.» **[RACCOMANDATO]**, non vincolante, ma rilevante per il *risk management* ex ISO 14971 e per la definizione della destinazione d'uso.

---

## 4. Piattaforma Nazionale di Telemedicina e architettura infrastrutturale

### 4.1 Chiarimento sulle fonti (avvertenza già anticipata)

Non risulta pubblicato un decreto denominato «requisiti funzionali minimi della Piattaforma Nazionale di Telemedicina». I requisiti sono distribuiti tra:

1. **DM 21 settembre 2022, Allegato A** — requisiti funzionali, tecnologici e livelli di servizio delle **Infrastrutture regionali di telemedicina (IRT)**, con indicazione dei punti di aggancio alla Infrastruttura nazionale;
2. **«Indicazioni metodologiche per la perimetrazione delle proposte di PPP per la Piattaforma nazionale di telemedicina»**, documento AGENAS pubblicato in allegato all'avviso di PPP il 18 marzo 2022 e aggiornato il 4 maggio 2022 — **[NON NORMATIVO]** ma richiamato *per relationem* dal DM 21 settembre 2022, che vi rinvia ripetutamente per i requisiti di *business* dei micro‑servizi;
3. **«Piattaforma di Telemedicina ed Ecosistema FSE: punti di contatto e raccordo tra i due progetti»**, documento predisposto dal Ministero della salute, dal Dipartimento per la trasformazione digitale e da AGENAS, pubblicato il 17 maggio 2022 — **[NON NORMATIVO]**;
4. **DM 30 settembre 2022, Allegato B** — «Linee di indirizzo per i servizi di telemedicina», che stabiliscono le **aree cliniche**;
5. **DM 19 novembre 2025** — istituzione formale della PNT e disciplina del trattamento dei dati.

Il rinvio del DM 21 settembre 2022 a documenti AGENAS non pubblicati in GU è una **debolezza formale nota** della catena normativa: crea requisiti sostanzialmente cogenti in sede di gara ma non reperibili in fonte ufficiale. **Va segnalato nella documentazione di conformità di Telemedic come rischio di tracciabilità dei requisiti.**

### 4.2 L'architettura PNT / INT / IRT

Il **DM 19 novembre 2025, art. 2** istituisce presso AGENAS la **Piattaforma nazionale di telemedicina (PNT)**, articolata in:

- **INT — Infrastruttura nazionale di telemedicina**: titolarità e gestione ad **AGENAS**, ai sensi dell'art. 12, comma 15‑*undecies*, lett. g), e comma 15‑*duodecies*, del D.L. 179/2012. Fornisce servizi abilitanti comuni, un modulo «Gestore soluzioni telemedicina», un «Glossario delle terminologie»/*Business Glossary*, raccolta dati, motore di *workflow*, funzioni di governo, *layer* dei servizi.
- **IRT — Infrastrutture regionali di telemedicina**: titolarità di **Regioni e Province autonome**. Sono le infrastrutture che **erogano concretamente** le prestazioni.

A queste si affianca la **PN‑DT — Piattaforma nazionale per la diffusione della telemedicina** (PNRR M6C2, sub‑investimento 1.3.2.4), portale di supporto alla diffusione e alla formazione, raggiungibile su [telemedicina.gov.it](https://www.telemedicina.gov.it/). Il DM 19 novembre 2025, art. 17, prevede il **trasferimento della gestione della PN‑DT ad AGENAS entro 90 giorni dal collaudo** **[NON VERIFICATO nel testo integrale]**.

**Regola privacy fondamentale — art. 2 DM 19 novembre 2025 e parere del Garante n. 2 del 16 gennaio 2025** ([doc‑web 10105743](https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/10105743)):

> «La INT non effettua altri trattamenti di dati personali oltre a quelli previsti nel comma 5.»

L'INT **non è un *repository* clinico**. Elabora dati aggregati e privi di identificativi diretti per finalità di monitoraggio, indicatori, *health technology assessment* e proposte di tariffazione. **I dati clinici confluiscono direttamente in FSE ed EDS, non nella INT**: il Garante ha imposto questa scelta proprio per evitare duplicazione e desincronizzazione. AGENAS è titolare dei soli trattamenti della INT; le Regioni sono titolari per le IRT; strutture sanitarie e professionisti sono titolari per la finalità di cura.

Vincoli aggiuntivi imposti dal parere del Garante e recepiti nel decreto: estrazione dei dati **al massimo una volta ogni 24 ore**, con cancellazione entro 24 ore dall'estrazione; pseudonimizzazione automatica senza intervento umano; conservazione dei *log* per **24 mesi**; conservazione dei dati di accesso/autenticazione per **12 mesi**; informativa integrata al primo accesso su modello standard predisposto da AGENAS previo parere del Garante; diritti di accesso, rettifica e oscuramento esercitabili **sui documenti FSE**, non sulla PNT.

**Sospensione transitoria (art. 17, c. 1).** I trattamenti della PNT per finalità **diverse** da diagnosi, cura e riabilitazione sono **sospesi fino all'aggiornamento delle linee guida** di cui al DM 21 settembre 2022, aggiornamento da adottarsi con successivo decreto previo parere del Garante.

### 4.3 I servizi minimi

**DM 21 settembre 2022, Allegato A, Sezione 1** — testo vincolante:

> «I servizi minimi che l'infrastruttura regionale di telemedicina deve erogare sono i seguenti: **televisita; teleconsulto/teleconsulenza; telemonitoraggio; teleassistenza**.»

> «In ogni caso le *suite* che comporranno l'Infrastruttura regionale di telemedicina dovranno includere almeno tutti e quattro i servizi minimi di telemedicina: televisita, teleconsulto/teleconsulenza, teleassistenza e telemonitoraggio.»

### 4.4 I micro‑servizi: la struttura logica imposta

Ciascun servizio minimo «è composto da un *set* di micro‑servizi logici che ne implementano il relativo perimetro funzionale». Ogni micro‑servizio è classificato in uno di tre *cluster*:

- **Specifici** — logico‑funzionali essenziali e propri dell'erogazione dei servizi di telemedicina. **Devono far parte dell'implementazione dell'IRT.** Devono «usufruire dei servizi abilitanti erogati dall'Infrastruttura nazionale di telemedicina, conferire i dati e gli eventi tramite il ***Gateway*** (di cui FSE 2.0) e integrarsi con i servizi trasversali di ogni regione».
- **Trasversali** — non specifici della telemedicina, ma necessari per l'integrazione con i servizi funzionali all'erogazione delle prestazioni sia in presenza sia in telemedicina (es. refertazione e firma digitale, *billing management*, *booking management system*, *viewer* dati clinici). «Devono essere obbligatoriamente inclusi nelle progettualità regionali afferenti alle Infrastrutture regionali di telemedicina.» Per `billing management` e `booking management system` è prevista in ogni caso «la sola integrazione per l'Infrastruttura regionale di telemedicina, in quanto di suo per sé moduli di integrazione verso i sistemi regionali che espongono i suddetti servizi».
- **Opzionali** — inclusi facoltativamente.

**Tabella 1 dell'Allegato A** («classifica micro servizi») elenca 28 micro‑servizi con la matrice di applicabilità ai quattro servizi minimi. I micro‑servizi rilevanti per una piattaforma di consulto video sono, per estratto:

| Micro‑servizio | Classe | Televisita | Teleconsulto | Telemonitoraggio | Teleassistenza |
|---|---|:-:|:-:|:-:|:-:|
| **VIDEOCONFERENCING** | Specifico | X | X | X | X |
| **PATIENT ONBOARDING** | Specifico | X | X | X | X |
| **MOTORE DI WORKFLOW** | Specifico | X | X | X | X |
| **SISTEMA DI GESTIONE EVENTI E NOTIFICHE** | Specifico | X | X | X | X |
| **CAREPLAN MANAGEMENT** | Specifico | X | X | X | X |
| **CHAT MESSAGING** | Specifico | X | X | | X |
| **CONDIVISIONE DI DOCUMENTI** | Specifico | X | X | | X |
| **REFERTAZIONE E FIRMA DIGITALE** | **Trasversale** | X | | | |
| **VIEWER DATI CLINICI** | **Trasversale** | X | X | X | X |
| **BOOKING MANAGEMENT SYSTEM** | **Trasversale** | X | X | | X |
| **BILLING MANAGEMENT** | **Trasversale** | X | | | X |
| SURVEY MANAGEMENT | Specifico | X | | X | |
| SUPPORTO CAREGIVER | Specifico | | | X | X |
| TASK PLANNER | Opzionale | X | X | X | X |
| DEFINIZIONE SECOND OPINION | Specifico | | X | | |
| SPEECH RECOGNITION / NLP / AI SMART SUGGESTION / MODELLI PREDITTIVI | Opzionali | varie | varie | varie | varie |

**Implicazione diretta per Telemedic.** Il perimetro minimo per candidarsi come componente di una IRT sui servizi «televisita» e «teleconsulto/teleconsulenza» comprende: videoconferencing, patient onboarding, motore di workflow, gestione eventi e notifiche, careplan management, chat, condivisione documenti, definizione second opinion, più **l'integrazione** (non necessariamente la reimplementazione) con refertazione/firma digitale, viewer dati clinici, booking e billing regionali. Il DM è esplicito: «il micro‑servizio "refertazione e firma digitale" **non si deve realizzare un modulo *ad hoc*** per la gestione della refertazione e della firma digitale di una prestazione in telemedicina ma si deve prevedere **l'integrazione con il modulo regionale**, se già presente».

### 4.5 Il Centro servizi e il Centro erogatore

**[TECNICO‑VINCOLANTE]** «Per ogni infrastruttura regionale di telemedicina deve essere prevista la presenza di **uno o più Centri servizi**, con compiti prettamente tecnici, ed **uno o più Centri erogatore**, con compiti prettamente sanitari.»

- **Centro servizi**: personale tecnico; manutenzione della piattaforma; gestione degli *account*; ***help desk* per tutti gli utenti** presi in carico dall'IRT; monitoraggio del corretto funzionamento (incluse gestione messaggi di *alert* di tipo tecnico, gestione dei dispositivi medici, formazione dei pazienti/*caregiver* sull'uso); distribuzione, installazione, manutenzione, ritiro e sanificazione dei dispositivi a domicilio.
- **Centro erogatore**: operatori sanitari; erogazione delle prestazioni; gestione degli *alert* di tipo sanitario.

Anche l'Accordo 2020 prevede un «centro di coordinamento tecnico che gestisca le attività di telemedicina», con «presidio continuo per assistere le videochiamate entranti dagli utenti ed instradarle».

### 4.6 Certificazione come dispositivo medico: le prescrizioni espresse

**Questo è il passaggio più critico del DM 21 settembre 2022 per l'architettura di Telemedic.** Testo dell'Allegato A, Sezione 2:

> «Per il teleconsulto/teleconsulenza può risultare per alcune specialità, ad es. teleconsulto/teleconsulenza istopatologico e teleconsulto/teleconsulenza radiologico, determinante il funzionamento sincrono ed equipollente tra i professionisti partecipanti al teleconsulto/teleconsulenza del micro‑servizio *«viewer»* dati clinici e in questi casi **questo micro‑servizio unitamente a quello di refertazione dovranno essere certificati come dispositivo medico** nell'ambito della infrastruttura regionale di telemedicina.
> Ove nel servizio di Televisita vengano usati dispositivi medici, anche in questo caso, come indicato sopra per il Teleconsulto/Teleconsulenza, **il *software* e l'*hardware* per l'erogazione del servizio dovrà essere certificato come dispositivo medico con adeguata classe di rischio** nell'ambito della infrastruttura regionale di telemedicina.»

E per il telemonitoraggio:

> «Si richiede altresì, in linea con quanto riportato all'interno della *«Guidance on Qualification and Classification of Software in Regulation (EU) 2017/745 – MDR and Regulation (EU) 2017/746»*, che **la Infrastruttura regionale di telemedicina per il servizio minimo di telemonitoraggio debba essere certificata come dispositivo medico**.»

E per il telemonitoraggio avanzato (livello 2): «la certificazione dovrebbe essere relativa alla soluzione di telemonitoraggio "esterna", questa configurazione del servizio **potrebbe essere richiesta una classe di rischio superiore alla IIa**».

Anche l'Accordo 2020 pone, tra le «caratteristiche di base» degli elementi minimi: «**Certificazione dell'*hardware* e/o del *software*, come dispositivo medico, idonea alla tipologia di prestazione che si intende effettuare in telemedicina.**»

**Lettura per Telemedic.** La strategia di classe I espressa nel *context pack* (D6, V2) regge **finché** il perimetro è limitato al «veicolo di comunicazione» e a `videoconferencing`, `patient onboarding`, `workflow`, `eventi/notifiche`, `chat`, `condivisione documenti`, e finché il `viewer` non è usato per refertazione diagnostica su immagini. Nel momento in cui la piattaforma include un *viewer* di dati clinici usato per decisioni diagnostiche in teleconsulto radiologico/istopatologico, o veicola dati di dispositivi medici in telemonitoraggio, **il DM italiano impone espressamente una certificazione di classe superiore**. La documentazione deve rendere esplicito questo confine e le condizioni sotto cui la classificazione cambia. **Questione da girare all'agente MDR.**

### 4.7 Requisiti tecnologici e architetturali imposti

**DM 21 settembre 2022, Allegato A, Sezione 2 — «Driver tecnologici».** Sono requisiti **[TECNICO‑VINCOLANTI]** per le IRT:

| Driver | Prescrizione testuale (sintesi fedele) |
|---|---|
| **Architettura a micro‑servizi** | «Le Piattaforme regionali di telemedicina dovranno essere implementate secondo il paradigma architetturale a micro‑servizi.» Comunicazione via orchestrazione e gestione di immagini *container*. |
| **Gestione degli eventi** | Architettura ***event‑driven***, con componente ***event broker***; condivisione di dati e documenti in modalità ***near real‑time*** verso sistemi esterni, nazionali e locali. Gli eventi «validati normalizzati e tradotti attraverso il comune modello dati interoperabile dal ***Gateway* FHIR**» confluiscono nell'EDS. |
| **Interoperabilità** | «L'introduzione di meccanismi per lo scambio dei *standard* tra i diversi contesti applicativi distribuiti sul territorio si basa sullo *standard* di modellazione delle informazioni basato su **FHIR**. Il modello dati FHIR che verrà adottato in maniera incrementale ed estendibile sia a livello nazionale che a livello regionale/locale, introducendo dapprima il ***subset* minimo di informazioni** necessario all'erogazione dei servizi di telemedicina per poi arricchirsi con ulteriori dati clinico/amministrativi. Componente tecnologica abilitante per l'introduzione di suddetti meccanismi è rappresentata dal ***Gateway* HL7/FHIR**.» |
| **Containerizzazione** | «La logica di *business* dei microservizi deve essere fornita e manutenuta su immagini *container* al fine di ottimizzare le attività di manutenzione e assicurare la massima portabilità sui diversi Cloud *provider*, tenendo conto della necessità di **prevenire il rischio di *lock‑in***.» |
| **Cloud Native** | «Gli ambienti di produzione delle Piattaforme di Telemedicina devono essere erogati in "Cloud" secondo il modello di servizio **SaaS** o **PaaS**. […] Ciascuna Piattaforma deve altresì rispondere ai requisiti della "***multi‑tenant application in Cloud***" basata su una architettura a micro‑servizi.» **Corretta segregazione e isolamento dei dati e degli utenti a livello applicativo**, con autenticazione, autorizzazione e mappatura delle *grant*. |
| **Modelli di *deployment* ammessi** | «*cloud* pubblico criptato (**su territorio nazionale**); privato/ibrido "su licenza" (**su territorio nazionale**); privato (**su territorio nazionale**)» — in continuità con la strategia Cloud Italia. |
| **Mobile oriented** | *Front end* progettato secondo il paradigma ***mobile first***; interfacce responsive; interazione tramite *mobile app* nativa marcate come dispositivo medico ove necessario; **accessibilità** su ogni canale; supporto a *device mobile* con Bluetooth e Bluetooth Low Energy, giroscopi e accelerometri. |
| **Usabilità e accessibilità** | Conformità alle **linee guida AgID di *design* per i servizi digitali della PA**; approccio di ***co‑design***; monitoraggio di *Customer Experience* e *Customer Satisfaction*; conformità alle **linee guida AgID sull'accessibilità degli strumenti informatici**, che «riportano quanto descritto nell'art. 1 della **legge n. 4/2004** e referenziano la norma **UNI EN 301549:2018**»; attenzione a pazienti anziani, con disabilità e fragili; multilingua. |
| **Sicurezza** | Conformità alle **«Linee guida sulla sicurezza nel *procurement* ICT» di AgID**. «Ritenendo l'infrastruttura regionale di telemedicina una **fornitura critica per la PA** e classificarla a criteri di sicurezza delle linee guida, **l'applicazione dei dettami di tali linee guida (azioni AP2, AP3 e AP4 e cap. 5 «Protezione dei dati personali») sono da ritenersi obbligatori**.» |
| **Continuità operativa** | Art. 51 CAD; linee guida AgID su Continuità operativa ICT e *Disaster Recovery*. |

**Normativa richiamata espressamente dal DM 21 settembre 2022** come vincolo per la realizzazione: regolamento per l'adozione di Linee guida per l'attuazione del CAD; **linee guida direttiva NIS** rilasciate da ENISA e CERT‑EU; linee guida AgID «SPID», «interoperabilità», «*Disaster Recovery* delle PA», «documenti informatici», «conservazione documentale», «Sicurezza informatica», «riuso», «accessibilità degli strumenti informatici»; **legge 9 gennaio 2004, n. 4**; **norma UNI EN 301549:2018**; **D.lgs. 7 marzo 2005, n. 82 (CAD)**; **Piano triennale per l'informatica nella PA**; **Regolamento (UE) 2016/679 (GDPR)**; **Regolamento (UE) 2017/745 (MDR)**; **Regolamento (UE) 2017/746 (IVDR)**.

### 4.8 Livelli di servizio (SLA) obbligatori

**DM 21 settembre 2022, Allegato A, Sezione 1.** Le progettualità devono definire, per ogni servizio minimo, gli SLA sulle pratiche ITIL di *incident management*, *change management* e *service request*.

> «L'Infrastruttura regionale di telemedicina dovrà consentire, da un punto di vista tecnico, **l'erogazione dei servizi H24 7 giorni su 7**.»

Matrice di priorità basata su **urgenza × impatto** (Tabella 2). SLA minimi di manutenzione correttiva (Tabella 3), **vincolanti per i fornitori dei servizi minimi**:

| Classe di priorità | Tempo di presa in carico | Tempo di risoluzione con ripristino |
|---|---|---|
| 1. Critica | **30 min** | **60 min** |
| 2. Alta | **30 min** | **90 min** |
| 3. Media | **60 min** | **8 h** |
| 4. Bassa | **60 min** | **24 h** |

«Quanto sopra riportato dovrà essere coerente ed armonizzato con le tempistiche raccomandate dalle case produttrici di dispositivi medici.»

### 4.9 I due scenari architetturali

L'Allegato A definisce due scenari:

- **Scenario A — integrazione nativa** (architettura di riferimento, Figura 2). Ambiente aziendale (LIS, RIS, PACS, *Data Repository* aziendale) → **Gateway FHIR** (con API REST e ingresso CDA2/FHIR) → FSE ed **EDS** (*Data Repository* centrale). L'IRT (servizi specifici, trasversali, opzionali + *Data Layer* IRT) dialoga con il Gateway FHIR e con l'INT; l'INT espone *Business Glossary*, gestione soluzioni di telemedicina, raccolta dati, motore di *workflow*, funzioni di governo, *layer* dei servizi; sopra, la Piattaforma nazionale per la diffusione della telemedicina (esposizione dati utilizzo, catalogo soluzioni, informazione e comunicazione, formazione, *onboarding*/mappatura soluzioni esistenti); l'**INI** indicizza.
- **Scenario B — assetto transitorio** (Figura 3), attivabile **solo e soltanto** in caso di indisponibilità temporanea dell'EDS: il *Gateway* alimenta direttamente il *Data Repository* regionale; l'IRT costituisce il *data repository* collettore di dati ed eventi, poi progressivamente sostituito dalle componenti dell'EDS.

**Regola di interoperabilità interregionale** (paragrafo «Telemedicina tra le regioni»):

> «A tal fine tutte le Infrastrutture regionali di telemedicina pubblicheranno servizi minimi di telemedicina (televisita, telemonitoraggio e teleassistenza) fruibili anche da parte di assistiti non appartenenti alla regione che eroga il servizio. Ne consegue che **le interfacce applicative (API) dei servizi minimi delle Infrastrutture regionali di telemedicina debbono essere uguali e direttamente accessibili alle varie infrastrutture regionali**.»

E per l'accesso del cittadino:

> «L'accesso ai servizi di telemedicina da parte dell'assistito dovrà avvenire attraverso **un portale *web* e dovrà essere integrato all'interno del portale FSE**, quando questo portale sarà disponibile. Pertanto, per garantire all'utente fluidità ed omogeneità durante la fruizione dei servizi di telemedicina, le interfacce e l'interazione con le funzionalità di questi saranno progettate in linea con i canoni di coerenza e *standard*izzazione delle interfacce, riportando in entrambe elementi riconoscitivi e dando all'utente la percezione di utilizzare un medesimo ambiente.»

### 4.10 Stato di avanzamento reale

**Accertato:**

- La PNT è stata realizzata mediante **concessione in partenariato pubblico‑privato** affidata a una società di progetto costituita da operatori economici privati (nomi omessi per la regola R0), su base ex art. 183, c. 15, del D.lgs. 50/2016.
- La Piattaforma è stata **presentata pubblicamente da AGENAS il 4 febbraio 2025**.
- Il DM 19 novembre 2025, che ne disciplina il trattamento dei dati, è entrato in vigore il **30 dicembre 2025**.
- **[NON VERIFICATO su fonte primaria]** La legge di bilancio 2026 fisserebbe al **30 giugno 2026** la piena operatività della piattaforma nazionale e la sua integrazione con il FSE 2.0.
- Ad **aprile 2026** la Società Italiana di Telemedicina ha pubblicato un comunicato di criticità sul decreto PNT, chiedendo una fase transitoria su dati e accesso ai servizi ([SIT, 14 aprile 2026](https://www.sitelemed.it/2026/04/14/telemedicina-la-sit-esprime-criticita-e-propone-una-fase-transitoria-sul-decreto-pnt-per-dati-e-accesso-ai-servizi/)).
- Alla data di questa ricerca **non ho reperito un dato ufficiale, verificabile e aggiornato ad agosto 2026 sul numero di IRT effettivamente in esercizio e agganciate alla INT**. Le fonti secondarie descrivono un'attivazione ancora disomogenea. **Questa è una lacuna della ricerca da colmare con una richiesta diretta ad AGENAS o con la relazione annuale ASD.**

---

## 5. PNRR Missione 6 Salute

### 5.1 Struttura

La **Missione 6 «Salute»** si articola in due componenti:

- **Componente 1 (M6C1)** — «Reti di prossimità, strutture intermedie e telemedicina per l'assistenza sanitaria territoriale», con:
  - Investimento 1.1 — Case della comunità e presa in carico della persona;
  - **Investimento 1.2 — «Casa come primo luogo di cura e telemedicina»**;
  - Investimento 1.3 — Rafforzamento dell'assistenza sanitaria intermedia (Ospedali di comunità).
- **Componente 2 (M6C2)** — «Innovazione, ricerca e digitalizzazione del servizio sanitario nazionale», che contiene l'investimento sul **FSE** e, al sub‑investimento **1.3.2.4**, la **Piattaforma nazionale per la diffusione della telemedicina (PN‑DT)**.

### 5.2 Il sub‑investimento 1.2.3 «Telemedicina per un migliore supporto ai pazienti cronici»

**Dati verificati sul testo in GU del DM 30 settembre 2022:**

- Importo complessivo: **1.000.000.000,00 euro**, a titolarità del **Ministero della salute**, con **AGENAS soggetto attuatore** e il MITD come altra amministrazione coinvolta. Base: DM MEF 23 novembre 2021 che modifica la «Tabella A ‑ PNRR ‑ Italia quadro finanziario per amministrazioni titolari».
- **DM 1° aprile 2022** ripartisce analiticamente:
  - **1.2.3.1 «Piattaforma di telemedicina» — 250.000.000 euro**;
  - **1.2.3.2 «Servizi di telemedicina» — 750.000.000 euro**.
- **DM 6 agosto 2021** nomina AGENAS soggetto attuatore.
- **Accordo di collaborazione AGENAS – Ministero della salute – PCM/DTD** sottoscritto il **31 dicembre 2021**.
- **Regioni capofila per il *procurement*: Lombardia e Puglia** (designate su proposta del Ministro per gli affari regionali del 2 marzo 2022, con concerto formale del 4 marzo 2022).
- **Commissione tecnica di valutazione** (art. 2 DM 30 settembre 2022): presieduta da un dirigente AGENAS in qualità di soggetto attuatore; sette componenti con diritto di voto (2 Ministero della salute, 2 PCM/struttura per l'innovazione, 3 AGENAS), più un rappresentante per ciascuna Regione capofila senza diritto di voto; valuta i piani entro **30 giorni** dalla ricezione.
- **Vincolo territoriale**: almeno il **40%** delle risorse allocabili territorialmente destinato alle Regioni del Mezzogiorno (art. 2, c. 6‑*bis*, D.L. 77/2021).
- **Vincolo procedurale**: «Per ottenere il finanziamento PNRR, le regioni e province autonome i cui piani sono stati approvati possono attivare le soluzioni selezionate **esclusivamente attraverso le gare delle regioni capofila**.»

### 5.3 Target quantitativi

- **Target EU M6C1‑8**: almeno **200.000 persone** assistite con strumenti di telemedicina — riferimento originario del PNRR.
- **Target rivisto**: almeno **300.000 pazienti** assistiti in telemedicina entro il **quarto trimestre 2025** (T4 2025), obiettivo attorno al quale AGENAS ha comunicato nel 2025.
- **Traiettoria a regime**: circa **790.000 pazienti**, come previsto dal **DM 28 settembre 2023** di riparto delle risorse M6C1‑1.2.3.2 (GU n. 271 del 20 novembre 2023). **[NON VERIFICATO nel testo integrale del decreto: la cifra proviene da comunicazione AGENAS.]**
- **Riprogrammazioni**: il PNRR italiano è stato oggetto di revisione approvata dal Consiglio ECOFIN nel dicembre 2023, che ha inciso su più misure della Missione 6. **Non ho verificato in questa ricerca l'esatta portata delle modifiche sul sub‑investimento 1.2.3: va accertata sui documenti ufficiali «Italia Domani» prima di qualsiasi affermazione.**

### 5.4 Perché conta per Telemedic

Tre implicazioni operative:

1. **Il canale di acquisto pubblico per le soluzioni PNRR è chiuso** e passa dalle gare delle Regioni capofila. Un progetto open source non entra in una IRT vendendo direttamente a una ASL: entra come **componente di una soluzione presentata da un aggiudicatario**, oppure come soluzione **presa in riuso** dalla PA ex art. 69 CAD fuori dal perimetro PNRR, oppure nel mercato non‑SSN (privato, assicurativo, intramoenia).
2. **Il finanziamento PNRR è in esaurimento.** Le risorse strutturali post‑PNRR sono a carico della legge di bilancio: **[NON VERIFICATO]** l'art. 85 della legge di bilancio 2026 assegnerebbe 20 M€ ad AGENAS. Altre fonti secondarie riportano un finanziamento stabile alla gestione della piattaforma a partire dal 2026 di 12,5 M€ per il primo anno e 25 M€ annui dal 2027. **Le due letture non coincidono: entrambe da verificare su Normattiva prima di essere citate.**
3. **La finestra di adozione si sposta dal 2022‑2025 (costruzione) al 2026‑2028 (consolidamento, sostituzione, estensione).** Un progetto che arriva a v1.0 a novembre 2026 arriva nella fase giusta, non in ritardo.

---

## 6. Fascicolo Sanitario Elettronico 2.0

### 6.1 Base legale e atti attuativi

- **Base legale**: art. 12 del D.L. 179/2012, conv. L. 221/2012, come profondamente novellato dall'art. 21 del D.L. 4/2022, conv. L. 25/2022; art. 11 del D.L. 34/2020, conv. L. 77/2020; D.P.C.M. 29 settembre 2015, n. 178, come modificato dal DM 18 maggio 2022.
- **DM 20 maggio 2022** (Ministero della salute, di concerto con MITD e MEF), GU Serie generale n. 160 dell'11 luglio 2022 — «Adozione delle Linee guida per l'attuazione del Fascicolo sanitario elettronico».
- **DM 18 maggio 2022**, stessa GU — «Integrazione dei dati essenziali che compongono i documenti del fascicolo sanitario elettronico».
- **DM 7 settembre 2023**, GU Serie generale n. 249 del 24 ottobre 2023 — decreto attuativo «FSE 2.0», adottato previo parere del Garante n. 256 dell'8 giugno 2023 e sentita la Conferenza Stato‑Regioni (seduta del 2 agosto 2023, rep. atti n. 187/CSR).
- **DM 30 dicembre 2024**, GU Serie generale n. 33 del 10 febbraio 2025 — introduce l'art. 27‑*bis* con la **disciplina transitoria a tre fasi**, previo parere del Garante n. 580 del 26 settembre 2024.
- **DM 31 dicembre 2024**, GU Serie generale n. 53 del 5 marzo 2025 — **istituzione dell'Ecosistema dati sanitari (EDS)**.
- **Parere del Garante del 23 giugno 2025, doc‑web 10161000** — parere favorevole su ulteriore schema di modifica: notifiche via app IO; **proroga delle fasi**.

### 6.2 Architettura

Dalle definizioni dell'art. 1 del DM 7 settembre 2023 (testo verificato):

| Componente | Definizione normativa |
|---|---|
| **INI** — Infrastruttura nazionale per l'interoperabilità | Istituita ai sensi del comma 15‑*ter* dell'art. 12 D.L. 179/2012, **realizzata dal MEF attraverso l'infrastruttura del Sistema Tessera Sanitaria** (art. 50 D.L. 269/2003). Parte del Sistema FSE. |
| **FSE‑INI** | Infrastruttura e servizi telematici dell'INI di cui regioni, province autonome e Ministero della salute si avvalgono in sussidiarietà |
| **Anagrafe consensi e revoche** | Parte di INI, ex comma 15‑*ter*, punto 4‑*bis* |
| **Indice nazionale FSE** | Indice nazionale dei metadati dei documenti, ex comma 15‑*ter*, punto 4‑*ter*. Per gli assistiti senza RdA gestisce direttamente l'indice; all'associazione di una RdA **trasferisce l'indice dei metadati all'indice della RdA** (art. 24) |
| **Portale nazionale FSE** | Accesso *online* al FSE per assistito e operatori, ex comma 15‑*ter*, punto 4‑*quater* |
| **ANA** | Anagrafe nazionale degli assistiti, ex art. 62‑*ter* CAD. Il FSE ne rileva i dati identificativi e amministrativi (art. 23) |
| **Soluzioni tecnologiche AGENAS** (comma 15‑*quater*) | Soluzioni rese disponibili da AGENAS a regioni e strutture, ex art. 69 CAD, con funzioni di: **(I) controllo formale e semantico** dei documenti e dei dati correlati prodotti per alimentare il FSE; **(II) conversione delle informazioni secondo i formati *standard*** di cui al comma 15‑*octies*; (III) invio dei dati verso l'**EDS** |
| **EDS** — Ecosistema dati sanitari | Istituito con DM 31 dicembre 2024; titolare il Ministero della salute, gestione operativa AGENAS; *Data Repository* centrale |
| **RdA / RdE** | Regione di assistenza / Regione di erogazione |
| **Repository** | «L'infrastruttura e i servizi informatici che consentono la memorizzazione e l'accesso ai documenti del FSE» |

### 6.3 Contenuti del FSE (art. 3 DM 7 settembre 2023)

Il FSE contiene, anche per prestazioni erogate **al di fuori del SSN**, i dati e documenti il cui contenuto è riportato nell'**Allegato A**:

a) dati identificativi e amministrativi dell'assistito (esenzioni per reddito e patologia, contatti, delegati);
b) **referti**, inclusi quelli consegnati ai sensi del D.P.C.M. 8 agosto 2013 (GU n. 243 del 16 ottobre 2013);
c) verbali di pronto soccorso;
d) lettere di dimissione;
e) **profilo sanitario sintetico** (*patient summary*, art. 4);
f) prescrizioni specialistiche e farmaceutiche;
g) cartelle cliniche;
h) erogazione farmaci a carico e non a carico SSN;
i) vaccinazioni;
j) erogazione di prestazioni di assistenza specialistica;
k) **taccuino personale dell'assistito** (art. 5);
l) dati delle tessere per i portatori di impianto;
m) lettera di invito per screening.

Al **31 dicembre 2025** il portale nazionale FSE dichiarava **29 tipologie documentali** e **33 tipologie di servizi al cittadino**, 26 milioni di consensi positivi alla consultazione, 5,9 milioni di utenti attivi negli ultimi 60 giorni, 140.000 medici specialisti abilitati ([fascicolosanitario.gov.it](https://www.fascicolosanitario.gov.it/)).

### 6.4 Regole di alimentazione (artt. 12–13)

- **Soggetti obbligati** (art. 12, c. 1): aziende sanitarie locali, strutture sanitarie pubbliche del SSN e dei servizi socio‑sanitari regionali e SASN; **strutture sanitarie accreditate**; **strutture sanitarie autorizzate**; **esercenti le professioni sanitarie, anche convenzionati con il SSN, quando operano in autonomia**.
- **Titolarità** (art. 12, c. 2): «I soggetti di cui al comma 1 che hanno in cura l'assistito o comunque gli prestano assistenza sanitaria, presso cui sono redatti i dati e i documenti sanitari che alimentano il FSE, **sono titolari del trattamento per finalità di cura**.»
- **Termine** (art. 12, c. 3): «I soggetti di cui al comma 1 alimentano il FSE con i contenuti di cui all'art. 3, **entro cinque giorni dall'erogazione della prestazione sanitaria** e sono responsabili della mancata, intempestiva o inesatta alimentazione.»
- **Flag di oscuramento** (art. 12, c. 4): all'atto dell'alimentazione va indicato se il dato rientra nei **dati a maggiore tutela dell'anonimato** (art. 6) o se su di esso è stato esercitato, al momento dell'erogazione, il diritto di oscuramento (art. 9).
- **Processo tecnico** (art. 13): le Regioni sono titolari dei trattamenti di **verifica formale e semantica** e devono contribuire all'alimentazione «utilizzando le soluzioni tecniche rese disponibili da AGENAS»; «**le soluzioni tecnologiche di cui al comma 1 non prevedono meccanismi di persistenza dei dati trattati**»; in caso di esito positivo del controllo formale e semantico, «il sistema consente di procedere alla **firma**, ove prevista, del documento per l'inserimento dello stesso nel FSE, mediante le soluzioni tecnologiche rese disponibili da AGENAS e successivamente attraverso **INI per l'indicizzazione del documento**».
- «Il processo di alimentazione del FSE **non pregiudica il diritto dell'assistito all'erogazione della prestazione sanitaria**» (art. 13, c. 4).

### 6.5 Consultazione, consensi, oscuramento, tracciamento

- **Informativa** (art. 7): fornita da Ministero della salute, regioni e province autonome; modello uniforme predisposto dal Ministero previo parere del Garante, pubblicato sull'area pubblica del Portale nazionale FSE.
- **Consensi** (art. 8): **la consultazione da parte di terzi è subordinata a consenso libero, specifico, informato, inequivocabile ed esplicito**, distinto per finalità di cura, prevenzione e profilassi internazionale. La finalità di **governo** e quella di **ricerca** operano su dati pseudonimizzati e non richiedono consenso alla consultazione nei termini dell'art. 8. Revoca sempre possibile; «i dati e i documenti presenti nel FSE **sono sempre consultabili, oltre che dall'assistito, dai soggetti che li hanno prodotti**» (art. 8, c. 7; art. 15, c. 5).
- **Profili di accesso per finalità di cura** (art. 15, c. 3): MMG/PLS per la durata dell'assistenza; il medico diverso «avente in cura l'assistito per visite o esami o per il ricovero, limitatamente al tempo in cui si articola il processo di cura, **previa dichiarazione che tale processo di cura è in atto al momento della consultazione del FSE e assunzione della relativa responsabilità ai sensi dell'art. 47 del D.P.R. 28 dicembre 2000, n. 445**»; infermiere/ostetrica e farmacista con perimetro documentale limitato (Allegato A, par. 4.1.1); personale amministrativo solo per le informazioni amministrative.
- **Esclusione tassativa** (art. 15, c. 4): «L'accesso al FSE è **sempre escluso** per i soggetti operanti in ambito sanitario che non perseguono finalità di cura quali **periti, compagnie di assicurazione, datori di lavoro**, associazioni o organizzazioni scientifiche, organismi amministrativi anche operanti in ambito sanitario, personale medico nell'esercizio di attività medico legale quale quella per l'accertamento dell'idoneità lavorativa o per il rilascio di certificazioni necessarie al conferimento di permessi o abilitazioni.»
- **Oscuramento** (art. 9): esercitabile al momento dell'erogazione, prima dell'alimentazione, o successivamente; deve essere «**garantito l'immediato oscuramento**» via funzionalità *online*; l'oscuramento avviene «con modalità tali da garantire che tutti i soggetti abilitati all'accesso **non possano venire automaticamente a conoscenza del fatto che l'assistito ha effettuato tale scelta**» (c. 6). L'oscuramento della prescrizione determina l'oscuramento automatico dei documenti di erogazione e dei referti correlati (c. 7).
- **Dati a maggiore tutela dell'anonimato** (art. 6): sieropositività, IVG, violenza sessuale e pedofilia, uso di stupefacenti/psicotrope/alcol, parto in anonimato, servizi dei consultori familiari. Visibili a terzi **solo previo consenso esplicito, informato e specifico reso al soggetto erogante**. In assenza di consenso, «l'erogatore della prestazione è responsabile dell'eventuale mancato oscuramento del dato o documento». In caso di prestazioni in anonimato, **l'alimentazione del FSE non è ammessa**.
- **Accesso in emergenza** (art. 20) e **registrazione delle operazioni** (art. 21): sono registrate alimentazione, oscuramento, revoca dell'oscuramento, consultazione da parte del soggetto produttore, dell'assistito o suo delegato, di altro soggetto, e consultazione in emergenza, con dato/documento, tipologia di operazione, categoria di soggetto, data e ora e — per le sole consultazioni — la finalità.
- **Conservazione** (art. 10): indice cancellato **decorsi trent'anni dalla data del decesso**, con periodicità annuale; stessa regola per dati e documenti, **fatta eccezione per la cartella clinica e i documenti afferenti**.

### 6.6 Fasi di attuazione

Dal DM 30 dicembre 2024 (art. 27‑*bis*), come prorogato dal decreto su cui il Garante si è espresso il 23 giugno 2025:

| Fase | Scadenza originaria | Scadenza prorogata |
|---|---|---|
| **Fase I** | 31 marzo 2025 | **30 giugno 2025** |
| **Fase II** (incl. piena realizzazione del Profilo sanitario sintetico e alimentazione dei dati a maggiore tutela già oscurati) | 30 settembre 2025 | **31 dicembre 2025** |
| **Fase III** (piena operatività: alimentazione entro 5 giorni, documenti erogati fuori SSN, abilitazione delle strutture private autorizzate) | 31 marzo 2026 | **31 marzo 2026** (invariata) |

Alla data di questa ricerca la Fase III è formalmente scaduta; l'avanzamento regionale effettivo resta disomogeneo.

### 6.7 Documenti nativi digitali e formati

**Stato accertato:**

- Lo *standard* documentale nazionale del FSE è **HL7 CDA Rel. 2 (CDA2)**, con il documento CDA2 veicolato dentro un **PDF firmato digitalmente** (comunemente PAdES) — impostazione confermata dalle specifiche nazionali «Specifiche tecniche per l'interoperabilità tra i sistemi regionali di FSE» pubblicate su [fascicolosanitario.gov.it](https://www.fascicolosanitario.gov.it/) (documento *Affinity Domain Italia*; versione **2.6.4** citata negli aggiornamenti 2026).
- Le cinque tipologie storiche di **documenti nativi digitali** sono: Lettera di dimissione ospedaliera (LDO), Referto di laboratorio (LAB), Referto di radiologia (RAD), **Referto di specialistica ambulatoriale (RSA)**, Referto di anatomia patologica (RAP). Le tipologie totali gestite sono oggi 29.
- **Percorso verso FHIR**: il DM 21 settembre 2022 impone il **Gateway HL7/FHIR** e l'adozione incrementale del modello dati **FHIR**; HL7 Italia ha pubblicato Implementation Guide FHIR nazionali (§ 6.9).

**Avvertenza di onestà.** Non ho reperito, alla data della ricerca, una tipologia documentale FSE dedicata e distinta denominata «referto di televisita» nelle specifiche CDA2 nazionali. L'ipotesi tecnica più solida — coerente con l'Accordo 2020 e con la prassi regionale — è che il referto di televisita sia veicolato **come Referto di Specialistica Ambulatoriale (RSA)**, con indicazione della modalità di erogazione a distanza. **Questo punto va verificato sulle specifiche di interoperabilità vigenti prima di scrivere codice.**

### 6.8 Come deve confluire nel FSE un referto di televisita

Ricostruzione del flusso obbligato, con la fonte di ciascun passaggio:

1. **Redazione.** La televisita in specialistica ambulatoriale «deve sempre concludersi con un referto» (Accordo 2020). Il referto contiene, oltre alle informazioni consuete, **l'indicazione dei collaboratori partecipanti** (*caregiver*, altro medico) e **la qualità del collegamento con conferma di idoneità** (Accordo 2020, § «Comunicazione dell'esito»).
2. **Firma.** Sottoscrizione digitale da parte del medico (Accordo 2020; per la telerefertazione, «firma digitale validata del medico responsabile»).
3. **Gestione nei sistemi dell'erogatore.** «La prestazione sanitaria erogata in modalità di televisita è regolarmente gestita e refertata sui sistemi informatici in uso presso l'erogatore, alla pari di una visita specialistica erogata in modalità tradizionale, **con l'aggiunta della specifica di erogazione in modalità a distanza**» (Accordo 2020).
4. **Rendicontazione.** Tracciamento della modalità di erogazione nei flussi informativi: flusso regionale, **flusso ex art. 50 L. 326/2003 (Sistema TS)** e flusso **DEMA** (ricetta dematerializzata). L'Accordo 2020 suggerisce esplicitamente l'estensione del campo «luogo di erogazione» (oggi A = ambulatorio, D = domicilio) con **T = telemedicina**, rimandando all'aggiornamento delle specifiche di flusso. **[Non ho verificato se e come tale estensione sia stata effettivamente recepita nelle specifiche tecniche vigenti del flusso art. 50: da accertare.]**
5. **Controllo e conversione.** Il documento passa attraverso le **soluzioni tecnologiche AGENAS** ex comma 15‑*quater*: controllo formale e semantico, conversione nei formati *standard* del comma 15‑*octies*, invio verso l'EDS (art. 1, lett. p, e art. 13 DM 7 settembre 2023).
6. **Indicizzazione.** Firma (ove prevista) e inserimento nel FSE, poi **indicizzazione tramite INI** (art. 13, c. 3). I metadati confluiscono nell'Indice della RdA o, se l'assistito non ha RdA, nell'Indice nazionale FSE (art. 24).
7. **Termine.** **Entro cinque giorni dall'erogazione** (art. 12, c. 3), con responsabilità del titolare in caso di alimentazione mancante, intempestiva o inesatta.
8. **Percorso dall'IRT.** Il DM 21 settembre 2022 stabilisce che i dati e gli eventi dell'IRT sono trasmessi **tramite il *Gateway* FHIR** verso FSE ed EDS; il DM 19 novembre 2025 conferma che **la INT non memorizza dati personali** e che i dati generati dalle IRT alimentano FSE 2.0 e l'EDS.
9. **Disponibilità al paziente.** Il referto «deve essere reso disponibile al paziente nella modalità telematica preferita» e «deve sempre essere possibile, su richiesta dello stesso paziente, condividerlo anche con altri sanitari in formato digitale […] anche attraverso il Fascicolo Sanitario Elettronico» (Accordo 2020).
10. **Rispetto dell'oscuramento.** Prima dell'invio, il sistema deve consentire di indicare se il documento rientra nei dati a maggiore tutela dell'anonimato (art. 6) o se il paziente ha esercitato l'oscuramento al momento dell'erogazione (art. 12, c. 4).

### 6.9 Le Implementation Guide FHIR nazionali — elemento decisivo per Telemedic

**HL7 Italia** ha pubblicato Implementation Guide FHIR nazionali dedicate proprio ai servizi di telemedicina, tutte su **FHIR R4 (4.0.1)** ([www.hl7.it/fhir](https://www.hl7.it/fhir/)):

| Implementation Guide | Versione | Data |
|---|---|---|
| **Televisita** | 0.2.0 | settembre 2025 |
| **Teleconsulto** | 0.2.0 | ottobre 2025 |
| **Teleassistenza** | 0.2.0 | dicembre 2025 |
| **Telemonitoraggio** | 0.2.0 | gennaio 2026 |
| **IT‑Core** (profili italiani di base) | 0.2.0 | maggio 2026 |
| Laboratory Report | 0.2.0 | marzo 2024 |
| Taccuino personale dell'assistito | 0.2.0 | maggio 2025 |
| Terminology / Dossier Farmaceutico / CDA‑to‑FHIR maps | *CI‑build* | 2024 |

La IG **Televisita v0.2.0** ([www.hl7.it/fhir/televisita/](https://www.hl7.it/fhir/televisita/)) dichiara come obiettivo la standardizzazione dello scambio dati «tra i vari sistemi sanitari e la Piattaforma di Telemedicina», definisce profili su **Patient (`PatientTelevisita`), Encounter (`EncounterTelemedicina`), Appointment, Composition (`CompositionRefertoTelevisita`), DocumentReference, ServiceRequest, Practitioner, Observation, AllergyIntolerance, MedicationStatement, MedicationRequest, Procedure**, e specifica un **Bundle `RefertoDiTelevisita`** di tipo *transaction*. Dipendenze terminologiche: HL7 Terminology, FHIR Extensions Pack, HL7 Italia Terminology, LOINC, SNOMED CT.

**Questa è la specifica più importante emersa da questa ricerca per il progetto.** Il *context pack* dichiara «FHIR R4» come layer di interoperabilità e cita `Encounter`, `DiagnosticReport`, `Practitioner`, `Patient`, `Observation`. La IG nazionale italiana usa `Composition` + `Bundle` per il referto, non `DiagnosticReport`, e profila `Encounter` come `EncounterTelemedicina`. **Se Telemedic vuole essere agganciabile a una IRT italiana deve conformarsi alle IG di HL7 Italia, non a FHIR R4 "vanilla".** Va aperta una decisione architetturale (ADR) su questo.

---

## 7. Interoperabilità e regole tecniche AgID

### 7.1 Modello di Interoperabilità (ModI)

- **Linee guida sull'interoperabilità tecnica delle Pubbliche Amministrazioni** e **Linee guida «Tecnologie e standard per la sicurezza dell'interoperabilità tramite API dei sistemi informatici»**: adottate con **Determinazione AgID n. 547 del 1° ottobre 2021**, ai sensi dell'**art. 71 CAD** e della Direttiva (UE) 2015/1535. **[VINCOLANTI]** per le PA. ([scheda](https://trasparenza.agid.gov.it/page/9/details/2372/), [testo](https://www.agid.gov.it/sites/agid/files/2024-05/linee_guida_interoperabilit_tecnica_pa.pdf))
- Le due linee guida concorrono a definire il **ModI**, coerente con lo European Interoperability Framework. Identificano **pattern e profili di interoperabilità**: modalità tecniche condivise che fruitore ed erogatore di un servizio implementano per raggiungere l'interoperabilità dei rispettivi sistemi informatici.
- **Rilevanza per Telemedic**: se il *deployment* è presso una PA italiana e le API sono esposte verso altre PA, esse devono essere descritte e implementate secondo i pattern ModI (interazione, sicurezza del messaggio, tracciatura). Il DM 21 settembre 2022 richiama espressamente le «linee guida interoperabilità» AgID.

### 7.2 PDND — Piattaforma Digitale Nazionale Dati

- **Base legale**: art. 50‑*ter* CAD.
- **Linee guida sull'infrastruttura tecnologica della Piattaforma Digitale Nazionale Dati per l'interoperabilità dei sistemi informativi e delle basi di dati**: adottate con **Determinazione AgID n. 627/2021**; **aggiornate a maggio 2025** (versione 2 — [testo](https://www.agid.gov.it/sites/agid/files/2025-06/Linee_guida_Infrastruttura_Interoperabilit%C3%A0_PDND_v2_maggio_2025.pdf)). **[VINCOLANTI]**
- **Meccanismo**: un ente **erogatore** pubblica su PDND un ***e‑service*** (una API); un ente **fruitore** richiede l'iscrizione all'e‑service; a fruizione approvata, il fruitore ottiene dalla PDND un **voucher** (token di autorizzazione) con cui invoca l'API direttamente presso l'erogatore. La PDND è un **catalogo e authority di autorizzazione**, non un *proxy* dei dati.
- «Un e‑service è un servizio erogato via Internet o attraverso una rete privata mediante un processo digitale che coinvolge erogatori e fruitori»; gli e‑service sono «una particolare categoria di servizi di rete basati su *application programming interface* (API)».
- **Rilevanza per Telemedic**: nel caso di installazione presso una PA che debba esporre dati verso altre PA (es. una ASL che espone un e‑service di prenotazione o di stato prestazione), la pubblicazione avviene su PDND. Non è un requisito per l'erogazione della prestazione in sé, ma **è un requisito per l'integrazione PA‑PA**.

### 7.3 Piano triennale per l'informatica nella PA

- **Vigente**: **Piano triennale per l'informatica nella PA 2024‑2026, aggiornamento 2026**, pubblicato da AgID nell'ottobre 2025 ([PDF](https://www.agid.gov.it/sites/agid/files/2025-10/Piano_Triennale_2024-2026_Aggiornamento_2026.pdf); [notizia AgID](https://www.agid.gov.it/it/notizie/online-laggiornamento-2026-del-piano-triennale-linformatica-nella-pa)).
- L'aggiornamento 2026 chiude il triennio corrente e pone le basi per il ciclo 2027‑2029; porta a 22 gli strumenti operativi a disposizione delle PA; rafforza IT Wallet e intelligenza artificiale.
- **[VINCOLANTE]** in quanto atto di indirizzo per le PA ex art. 14‑*bis* CAD; il DM 21 settembre 2022 lo richiama espressamente tra le norme da rispettare.

### 7.4 Accessibilità

- **Base legale**: **Legge 9 gennaio 2004, n. 4** («legge Stanca»), come modificata; **Direttiva (UE) 2016/2102**; per il settore privato, **art. 3‑*bis*** della L. 4/2004 e il **D.lgs. 27 maggio 2022, n. 82** (recepimento dello European Accessibility Act, Direttiva (UE) 2019/882).
- **Linee guida sull'accessibilità degli strumenti informatici** di AgID, adottate con **Determinazione n. 437/2019 del 20 dicembre 2019**, rettificate con **Determinazione n. 396/2020 del 10 settembre 2020** e ulteriormente rettificate con **Determinazione n. 354/2022 del 22 dicembre 2022** per adeguamento alla norma tecnica europea armonizzata sopravvenuta; **ultimo aggiornamento della versione pubblicata: 8 ottobre 2025** ([Designers Italia](https://designers.italia.it/normativa/linee-guida-accessibilita/), [docs.italia.it](https://docs.italia.it/AgID/documenti-in-consultazione/lg-accessibilita-docs/it/stabile/index.html)). **[VINCOLANTI]**
- **Norma tecnica di riferimento**: **EN 301 549** (versione armonizzata *pro tempore* vigente; il DM 21 settembre 2022 cita **UNI EN 301549:2018**, le linee guida AgID più recenti referenziano la v. 3.2.1, disponibile in traduzione italiana come UNI CEI EN 301549). EN 301 549 incorpora **WCAG 2.1 livello AA** per i contenuti web.
- **Obblighi procedurali per il soggetto erogatore**: pubblicazione della **dichiarazione di accessibilità** su modello AgID (Allegato 1 alle linee guida), tramite l'apposita piattaforma AgID; **riesame e validazione entro il 23 settembre di ogni anno**, con validità dal 24 settembre al 23 settembre successivo; pubblicazione degli **obiettivi annuali di accessibilità**; **meccanismo di feedback** per gli utenti. La mancata pubblicazione della dichiarazione «determina un inadempimento normativo, con la responsabilità prevista dall'**art. 9 della legge n. 4/2004**».
- **Rilevanza per Telemedic**: l'obiettivo WCAG 2.1 AA dichiarato nel *context pack* (V6) è **necessario ma non sufficiente**. Serve anche: (a) conformità EN 301 549 nelle parti non‑web (documenti, app native, hardware ove applicabile); (b) **capacità di produrre e mantenere la dichiarazione di accessibilità** — quindi report di conformità automatizzabili e datati; (c) allineamento alle **linee guida di *design* per i servizi digitali della PA** (Designers Italia) se il *front end* è rivolto a cittadini in contesto PA, come impone il DM 21 settembre 2022.

### 7.5 Riuso del software e Developers Italia — il punto centrale per un progetto open source

- **Base legale**: **artt. 68 e 69 del CAD** (D.lgs. 82/2005). L'art. 68 impone la **valutazione comparativa** preventiva alle PA nell'acquisizione di software, con priorità al riuso e all'open source; l'art. 69 impone alle PA titolari di soluzioni sviluppate su specifiche del committente pubblico di **rendere disponibile il codice sorgente** in repository pubblico con licenza aperta.
- **Linee guida su acquisizione e riuso di software per le pubbliche amministrazioni**: adottate con **Determinazione AgID n. 115 del 9 maggio 2019**, pubblicata in **GU Serie generale n. 119 del 23 maggio 2019** ([pagina AgID](https://www.agid.gov.it/it/design-servizi/riuso-open-source/linee-guida-acquisizione-riuso-software-pa), [scheda trasparenza](https://trasparenza.agid.gov.it/page/9/details/1351/)). **[VINCOLANTI]** Hanno sostituito la circolare del 2013.
- **Obblighi delle PA**: (1) condurre la valutazione comparativa tecnico‑economica; (2) sviluppare con licenza aperta; (3) pubblicare le soluzioni riusabili in repository pubblicamente accessibile con licenza open source e **registrarle nel catalogo Developers Italia**; (4) documentare secondo le guide allegate (guida alla pubblicazione, alla manutenzione, alla presa in riuso, alla modifica di software open source preso a riuso).
- **`publiccode.yml`**: «Ogni repository di codice dovrebbe includere un semplice file di metadati chiamato `publiccode.yml`, contenente informazioni descrittive: funzionalità del software, requisiti, ente proprietario, manutentore assegnato (e data di scadenza del contratto), aree di utilizzo, conformità normativa e altro.» È il meccanismo con cui il **crawler di Developers Italia** indicizza il software nel catalogo pubblico.
- **Meccanismo di adozione in riuso**: chi adotta un software rilasciato da una PA deve notificarlo aprendo una *issue* o una *pull request* nel repository dell'amministrazione titolare, che indicherà i riferimenti al riuso nell'apposita sezione del file `publiccode.yml`.

**Cosa serve concretamente a Telemedic per essere iscrivibile nel catalogo Developers Italia:**

1. Repository **pubblico** e accessibile senza autenticazione.
2. File **`publiccode.yml`** valido nella *root* del repository, conforme allo standard *publiccode.yml* (progetto internazionale, specifica gestita in ambito Developers Italia). I campi essenziali: `publiccodeYmlVersion`, `name`, `url`, `softwareVersion`, `releaseDate`, `platforms`, `categories`, `developmentStatus`, `softwareType`, `description` (per lingua: `it`, `en` — con `localisedName`, `shortDescription`, `longDescription`, `features`, `screenshots`, `documentation`), `legal.license` (**identificatore SPDX**, nel nostro caso `Apache-2.0`), `maintenance.type` e `maintenance.contacts`, `localisation.localisationReady` e `availableLanguages`.
3. Sezione **`it`** per il contesto italiano: `it.countryExtensionVersion`, `it.riuso.codiceIPA` (obbligatorio se il titolare è una PA — **per un progetto a titolarità di persona fisica/privata il campo non si applica**), `it.piattaforme` (dichiarazione di uso di SPID, CIE, PagoPA, ANPR, IO, ecc.), `it.conforme` (dichiarazioni di conformità a `lineeGuidaDesign`, `modelloInteroperabilita`, `misureMinimeSicurezza`, `gdpr`).
4. **LICENSE**, **NOTICE**, **README bilingue**, **documentazione pubblica**, **CHANGELOG**, versione semantica.

**Nota strategica.** Il catalogo Developers Italia è concepito primariamente per software **di titolarità di una PA**. Un progetto open source di titolarità privata può comunque essere pubblicato e indicizzato, ma **non produce automaticamente il diritto delle PA a "prenderlo in riuso" ex art. 69**: quella è una fattispecie riservata al software di cui la PA è titolare. Per Telemedic il percorso realistico è duplice: (a) pubblicazione nel catalogo come software open source disponibile alla PA, con `publiccode.yml` completo, che facilita la valutazione comparativa ex art. 68; (b) qualora una PA finanzi sviluppi specifici, tali sviluppi diventano di titolarità della PA e rientrano nell'art. 69 con `codiceIPA` proprio. **Va evitata l'affermazione, tecnicamente scorretta, che «Telemedic è riusabile ex art. 69 CAD».**

---

## 8. Acquisizione da parte della Pubblica Amministrazione

### 8.1 Qualificazione dei servizi cloud

- **Passaggio di competenza**: dal **19 gennaio 2023** la qualificazione dei servizi cloud per la PA è di competenza dell'**Agenzia per la Cybersicurezza Nazionale (ACN)**, che ha sostituito AgID ([ACN](https://www.acn.gov.it/portale/en/w/qualificazione-del-cloud-della-pa-al-via-la-gestione-acn), [Cloud Italia](https://cloud.italia.it/qualificazione-servizi-cloud/)).
- **Atti di riferimento**:
  - **Determinazione ACN n. 306 del 18 gennaio 2022** — metodologia di **classificazione dei dati e dei servizi** delle PA;
  - **Determinazione ACN n. 307 del 18 gennaio 2022** — **Regolamento di qualificazione** dei servizi cloud e delle infrastrutture cloud per la PA;
  - **Decreto direttoriale ACN n. 21007/24 del 27 giugno 2024** — **nuovo Regolamento unificato** per infrastrutture e servizi cloud per la PA, che definisce misure tecnico‑organizzative e procedure di qualificazione e adeguamento. **[Questo è l'atto vigente da verificare per primo in ogni analisi di conformità cloud.]**
  - Le **Circolari AgID n. 2 e n. 3 del 9 aprile 2018** (qualificazione SaaS e qualificazione CSP), superate dal regime ACN; le qualificazioni AgID rilasciate prima del 18 gennaio 2023 sono confluite nel nuovo modello e nel **Marketplace Cloud**.
- **Livelli di qualificazione**: **QC1–QC4** per i **servizi** cloud (SaaS, PaaS, IaaS) e **QI1–QI4** per le **infrastrutture** dei servizi cloud. Il livello richiesto discende dalla classificazione dei dati e servizi ex Determinazione 306/2022.
- **Classificazione dei dati e servizi** (Determinazione 306/2022): tre classi — **strategici** (compromissione con impatto sulla sicurezza nazionale), **critici** (compromissione con pregiudizio a funzioni rilevanti per la società, la salute, la sicurezza e il benessere economico e sociale), **ordinari**.

**Conclusione operativa: i dati sanitari trattati da una piattaforma di telemedicina di una ASL ricadono con altissima probabilità nella classe «critici».** Ne discende: obbligo di ricorso a **servizi cloud qualificati** al livello corrispondente, con vincoli di **residenza dei dati sul territorio nazionale** o comunque nel perimetro del **Polo Strategico Nazionale**.

### 8.2 Polo Strategico Nazionale (PSN)

- Infrastruttura ad alta affidabilità realizzata nell'ambito del PNRR (M1C1), destinata a ospitare in sicurezza **dati e servizi critici e strategici** delle PA italiane, con *data center* localizzati sul territorio nazionale ([Cloud Italia](https://cloud.italia.it/strategia-cloud-pa/polo-strategico-nazionale/), [innovazione.gov.it](https://innovazione.gov.it/dipartimento/focus/polo-strategico-nazionale/)).
- **[VINCOLANTE per le PA centrali e per le PA che classificano dati critici/strategici]**: la migrazione va verso PSN o verso infrastrutture qualificate al livello corrispondente.
- **Coerenza con il DM 21 settembre 2022**: i tre modelli di *deployment* ammessi per le piattaforme di telemedicina — *cloud* pubblico criptato, privato/ibrido su licenza, privato — sono tutti qualificati «**su territorio nazionale**».

**Implicazione per Telemedic.** Il vincolo V1 del *context pack* («nessun componente obbligatorio ospitato fuori dall'UE») è **più permissivo** del requisito italiano applicabile alla PA sanitaria, che è **residenza sul territorio nazionale** per i dati critici. La documentazione deve distinguere tre profili di *deployment*: (a) UE (requisito GDPR/sovranità minimo); (b) **Italia** (requisito PA sanitaria); (c) **PSN o cloud qualificato QC≥…** (requisito per dati classificati critici). E deve dichiarare che **l'architettura non impone alcun servizio gestito che impedisca il profilo (c)** — cioè: nessuna dipendenza runtime da SaaS esterni, TURN self‑hosted, database e object storage installabili on‑premise. Il modello «on‑premise single‑tenant Docker Compose + Helm» (D8) è esattamente ciò che rende praticabile il profilo (c).

### 8.3 Soglie e procedure di gara

- **Codice dei contratti pubblici**: **D.lgs. 31 marzo 2023, n. 36**, come modificato dal D.lgs. 209/2024. L'**art. 14** rinvia ai regolamenti delegati UE per i valori numerici delle soglie; l'**art. 50** disciplina il sotto soglia.
- **Soglie di rilevanza europea in vigore dal 1° gennaio 2026** (Regolamenti delegati (UE) **2025/2150**, **2025/2151** e **2025/2152** del 22 ottobre 2025):

| Fattispecie | Soglia |
|---|---|
| Forniture e servizi — amministrazioni aggiudicatrici **centrali** | **140.000 €** |
| Forniture e servizi — amministrazioni aggiudicatrici **sub‑centrali** (Regioni, ASL, enti locali) | **216.000 €** |
| Lavori pubblici | **5.404.000 €** |
| Settori speciali — forniture, servizi, concorsi di progettazione | **432.000 €** |
| Concessioni | **5.404.000 €** |

- **Rilevanza pratica**: una ASL è amministrazione aggiudicatrice **sub‑centrale**; la soglia europea è **216.000 €**. Sotto soglia si applica l'art. 50 (affidamento diretto fino a 140.000 € per servizi e forniture, procedura negoziata oltre), con obbligo di **qualificazione della stazione appaltante** per importi superiori alle soglie di qualificazione. **La maggior parte degli acquisti di moduli software sanitari da parte di una singola ASL si colloca sotto soglia europea.**
- **Vincolo aggiuntivo per il perimetro PNRR M6C1‑1.2.3**: come detto al § 5.2, **le Regioni finanziate possono attivare le soluzioni esclusivamente tramite le gare delle Regioni capofila**. Fuori dal PNRR, la ASL è libera di procedere autonomamente, ma resta obbligata alla valutazione comparativa ex art. 68 CAD.

### 8.4 Cosa deve avere Telemedic per essere legittimamente acquisibile da una ASL

Sintesi delle condizioni di ammissibilità, ciascuna con la fonte:

1. **Licenza open source con identificatore SPDX** e codice pubblicamente accessibile — favorisce la valutazione comparativa ex art. 68 CAD (Determinazione AgID 115/2019).
2. **`publiccode.yml` valido** e presenza nel catalogo Developers Italia.
3. **Conformità alle linee guida AgID sull'accessibilità** con dichiarazione di accessibilità producibile (L. 4/2004, Determinazione AgID 437/2019 e ss.mm.).
4. **Conformità al ModI** per le API esposte verso altre PA (Determinazione AgID 547/2021).
5. **Deployabilità su infrastruttura cloud qualificata ACN o su PSN**, con residenza dei dati sul territorio nazionale (Determinazioni ACN 306 e 307/2022, DD ACN 21007/24).
6. **Autenticazione mediante identità digitale** ex art. 64 CAD: **SPID, CIE, TS‑CNS** (richiesto espressamente dal DM 19 novembre 2025 per l'accesso alla PNT).
7. **Conformità GDPR documentata** (DPIA, registro dei trattamenti, misure ex art. 32, ruoli).
8. **Conformità alle misure di sicurezza** applicabili (§ 9).
9. **Qualificazione MDR adeguata** al perimetro funzionale effettivamente offerto (§ 4.6) — **condizione dirimente**: senza marcatura CE non si può erogare telemonitoraggio né *viewer* diagnostico.
10. **Capacità di alimentare il FSE** nei termini e nei formati previsti (§ 6).
11. **SLA contrattualizzabili** almeno pari a quelli della Tabella 3 del DM 21 settembre 2022 e disponibilità **H24 7/7**.
12. **Iscrizione al Registro Pubblico del Software** ove applicabile per l'operatore economico che eroga il servizio.

---

## 9. Sicurezza

### 9.1 Misure minime di sicurezza ICT per le PA

- **Circolare AgID 18 aprile 2017, n. 2/2017** — «Misure minime di sicurezza ICT per le pubbliche amministrazioni», pubblicata in GU il 5 maggio 2017, sostitutiva della circolare n. 1/2017 del 17 marzo 2017. **[VINCOLANTE per le PA]**
- Struttura: **ABSC — AgID Basic Security Controls**, derivati dai *CIS Critical Security Controls* (confronto tra le versioni 5.1 e 6.0), articolati su tre livelli di applicazione: **minimo** (obbligatorio per ogni PA), **standard** (raccomandato per la generalità delle PA), **avanzato**.
- Termine di adeguamento originario: 31 dicembre 2017.
- **Rilevanza per Telemedic**: gli ABSC (inventario di dispositivi e software, gestione delle configurazioni, gestione delle vulnerabilità, uso controllato dei privilegi amministrativi, difese contro i malware, copie di sicurezza, protezione dei dati) si traducono in requisiti verificabili sul prodotto: inventario delle dipendenze (**SBOM**), *hardening* documentato, gestione delle patch, backup cifrati, controllo dei privilegi.

### 9.2 Sicurezza nel procurement ICT

Il DM 21 settembre 2022 rende **obbligatorie** per le infrastrutture regionali di telemedicina, in quanto «fornitura critica per la PA», le **«Linee guida sulla sicurezza nel *procurement* ICT» di AgID**, e in particolare le azioni **AP2, AP3, AP4** e il **capitolo 5 «Protezione dei dati personali»**. L'Allegato A fornisce anche una tabella (Tabella 4) per il **calcolo della criticità del sistema di telemedicina**, basata su quattro domande pesate (impatto su beni/servizi critici, superamento della soglia minima di criticità per importo, durata del contratto, criticità della sede di erogazione).

### 9.3 NIS2

- **D.lgs. 4 settembre 2024, n. 138**, recepimento della Direttiva (UE) 2022/2555 — pubblicato in GU il 1° ottobre 2024, **in vigore dal 16 ottobre 2024**.
- **Settori in ambito**: energia, trasporti, **sanità**, acqua, infrastrutture digitali, servizi ICT gestiti, pubblica amministrazione, spazio.
- **Soggetti sanitari**: prestatori di assistenza sanitaria e altri soggetti dell'Allegato I; classificati come **essenziali** o **importanti** in funzione di criticità e dimensione. **Le aziende sanitarie pubbliche rientrano anche come pubbliche amministrazioni.**
- **Fornitori ICT**: i «servizi ICT gestiti» sono settore in ambito; inoltre la **sicurezza della catena di fornitura** è misura obbligatoria per i soggetti in ambito, con effetto di riverbero contrattuale su tutti i fornitori.
- **Notifica degli incidenti significativi** al **CSIRT Italia** presso ACN: **pre‑notifica entro 24 ore**, **notifica completa entro 72 ore**, **relazione finale entro un mese**.
- **Determinazioni ACN rilevanti** ([NIS2 in Italia](https://nis2-directive.it/), [ICT Security Magazine](https://www.ictsecuritymagazine.com/articoli/nis2-e-d-lgs-138-2024/)):
  - **Determinazione ACN n. 379907/2025**, efficace dal **15 gennaio 2026** — sostituisce la versione dell'aprile 2025; stabilisce le **specifiche di base delle misure di sicurezza** e la gestione degli incidenti;
  - **Determinazione ACN n. 379887/2025**, efficace dal **31 dicembre 2025** — aggiorna le regole del Portale NIS.
  - **Finestra annuale di registrazione**: **1° gennaio – 28 febbraio**.
  - **Misure di base da implementare in modo dimostrabile entro il 31 ottobre 2026**; da 37 a 43 misure a seconda della classificazione (soggetto importante / essenziale), su gestione del rischio, risposta agli incidenti, continuità operativa, sicurezza della catena di fornitura, **crittografia**, controllo degli accessi, formazione.
  - **Sanzioni**: fino a 10 M€ o 2% del fatturato mondiale annuo per i soggetti essenziali; fino a 7 M€ o 1,4% per gli importanti.
- **[NON VERIFICATO nel dettaglio]** Il numero esatto delle misure e i contenuti puntuali della Determinazione 379907/2025 provengono da fonte secondaria: vanno letti sul testo ACN.

### 9.4 Legge 90/2024 e perimetro di sicurezza nazionale cibernetica

- **Legge 28 giugno 2024, n. 90** — «Disposizioni in materia di rafforzamento della cybersicurezza nazionale e di reati informatici», pubblicata in GU il 2 luglio 2024 ([Normattiva](https://www.normattiva.it/atto/caricaDettaglioAtto?atto.dataPubblicazioneGazzetta=2024-07-02&atto.codiceRedazionale=24G00108)). **[VINCOLANTE]**
- **Obblighi per le PA incluse le ASL**: **segnalazione all'ACN entro 24 ore** dall'accertamento di incidenti compresi nella tassonomia; **notifica completa entro 72 ore**; **nomina del referente per la cybersicurezza**, punto di contatto unico con ACN; adozione di interventi risolutivi delle vulnerabilità segnalate.
- **[NON VERIFICATO]** Fonti secondarie indicano il **13 gennaio 2025** come data di piena operatività dell'obbligo di notifica per le aziende sanitarie locali.
- **Perimetro di sicurezza nazionale cibernetica** — D.L. 21 settembre 2019, n. 105, conv. L. 18 novembre 2019, n. 133, con i D.P.C.M. 131/2020, 81/2021 e il D.P.R. 54/2021. **Il perimetro è definito per soggetti puntualmente individuati** con atto riservato: **non tutte le piattaforme sanitarie vi rientrano automaticamente**. Un soggetto sanitario vi rientra solo se incluso nell'elenco dei soggetti PSNC e limitatamente ai beni ICT notificati. **Affermazione onesta: non ho potuto accertare se e quali soggetti sanitari siano inclusi nel PSNC, poiché l'elenco non è pubblico.** Per una piattaforma di telemedicina l'assunzione di lavoro corretta è: **NIS2 e L. 90/2024 si applicano; il PSNC è possibile ma da verificare caso per caso con il cliente.**

### 9.5 Sicurezza imposta dal DM 19 novembre 2025 (Allegato 4)

Dal parere del Garante n. 2 del 16 gennaio 2025, che ne descrive il contenuto:

- **cifratura robusta dei dati** *at rest* e *in transit*;
- **sistemi di prevenzione delle intrusioni (IPS)** e monitoraggio **SIEM/SOAR**;
- **tracciabilità mediante file di log protetti**, conservazione **24 mesi**;
- **autenticazione forte mediante identità digitale** ex **art. 64 CAD** (SPID, CIE, TS‑CNS);
- **verifiche periodiche dell'efficacia** delle misure di sicurezza;
- conservazione dei dati di accesso/autenticazione per **12 mesi**.

### 9.6 Sicurezza imposta dall'Accordo 2020

Gli erogatori devono, tra l'altro: adottare politiche di tutela per sicurezza, riservatezza, conservazione e integrità dei dati; identificare le figure di responsabilità previste in tema di privacy e sicurezza; **garantire la tracciabilità delle attività di manutenzione, collaudi e controlli di sicurezza** per le tecnologie hardware e software in uso, con relativi rapporti tecnici di dettaglio; adottare un piano di qualità; **adottare sistemi per la gestione della Cybersecurity**; adottare **un piano di valutazione dei rischi** commisurato alla tipologia di servizi, che preveda la ponderazione dei rischi connessi all'utilizzo delle tecnologie in relazione alla destinazione d'uso, al quadro clinico del paziente e ai fattori ambientali, procedure di mitigazione, rivalutazione periodica, formazione dell'utente/*caregiver*, e **l'esplicitazione delle modalità di segnalazione e notifica di eventuali incidenti o mancati incidenti**.

E, in modo netto: «**Tutti i trasferimenti di voce, video, immagini, *files* devono essere crittografati** e rispettare le vigenti normative in materia di privacy e sicurezza.»

---

## 10. Rimborsabilità e tariffe

### 10.1 Il principio: equivalenza tariffaria

**Accordo Stato‑Regioni 17 dicembre 2020, punto 3 del dispositivo** (testo verificato):

> «di adeguare i flussi informativi di erogazione/rendicontazione delle attività di specialistica ambulatoriale al fine di tenere traccia delle prestazioni in telemedicina **la cui tariffazione sarà equivalente alle analoghe prestazioni erogate in presenza**.»

E nell'Allegato A: «per tutte le prestazioni sanitarie erogate a distanza si applica il quadro normativo nazionale/regionale che regolamenta l'accesso ai diversi Livelli essenziali di Assistenza, **il sistema di remunerazione/tariffazione vigente per l'erogazione delle medesime prestazioni in modalità "tradizionale"**, ivi incluse le norme per l'eventuale compartecipazione alla spesa.»

### 10.2 Regime per singola prestazione

| Prestazione | Prescrizione | Compartecipazione | Tariffa | Flusso |
|---|---|---|---|---|
| **Televisita** in specialistica ambulatoriale (*ex* art. 50) | **Sì**, su ricettario SSN | **Sì**, se dovuta | Codice di **visita di controllo** del nomenclatore | Flusso art. 50 + DEMA + flusso regionale, con codice di visita di controllo |
| **Televisita** in setting territoriale (consultorio, salute mentale, NPI) | Regole del setting | Regole del setting | Regole del setting | Flussi corrispondenti |
| **Teleconsulto** | **No** | **No** | **Nessuna voce a nomenclatore** | Registrabile negli applicativi aziendali, «non viene ad oggi rilevata nei flussi istituzionali» |
| **Teleconsulenza** | **No** | **No** | **Nessuna voce a nomenclatore** | Come sopra |
| **Telerefertazione** | — | — | Non prestazione a sé stante: è completamento della prestazione specialistica | — |
| **Telecontrollo medico** | Sì | Sì | Prestazione specialistica del nomenclatore | Flussi specialistica |
| **Telemonitoraggio** | — | — | Non afferisce a specialistica ambulatoriale, **salvo** che sia affiancato da telecontrollo, televisita o visita in presenza | Risultati riportati nel referto della visita di controllo periodica |
| **Teleriabilitazione** | Regole del PRI | Regole del PRI | **Equivalente alla prestazione in presenza** (Accordo 231/CSR del 18 nov. 2021) | Flussi riabilitazione |

**Prenotazione** (Accordo 2020): «di norma queste prestazioni vengono richieste e prenotate dallo specialista che ha in carico il paziente, il sistema di prenotazione **CUP dovrà assicurare la gestione delle agende garantendo la possibilità di prenotare sia le prestazioni erogate in modalità tradizionale che quelle a distanza, come una qualunque altra sede di erogazione. La decisione rispetto alla modalità con cui dovrà essere erogata è dello specialista** che deve prenotare la prestazione, e non deve essere demandata ad un operatore di sportello.»

### 10.3 Il nomenclatore

- **Decreto tariffe**: **DM 23 giugno 2023** («Definizione delle tariffe dell'assistenza specialistica ambulatoriale e protesica»), che aggiorna nomenclatori fermi rispettivamente al 1996 e al 1999 e definisce le tariffe delle prestazioni introdotte con i **LEA del D.P.C.M. 12 gennaio 2017**.
- **Slittamenti**: entrata in vigore inizialmente 1° gennaio 2024, poi 1° aprile 2024, poi differita. Un decreto pubblicato in GU il **25 novembre 2024** ha fissato le nuove tariffe con applicazione dal **30 dicembre 2024**, disponendo che da quella data le ricette specialistiche siano emesse esclusivamente con riferimento ai codici del nuovo Nomenclatore e del Catalogo Unico Regionale (fonte: **Rapporti ISTISAN 25/16**, «Normativa regionale per l'erogazione di prestazioni in telemedicina e di teleconsulto», M. Bocchino, E. Agazio, Istituto Superiore di Sanità — [testo](https://publ.iss.it/ITA/Items/GetPDF?uuid=ff5eb7a0-9ef7-47ad-9faf-b86e08888dcb)).
- **Constatazione decisiva del rapporto ISS**: «all'interno del Decreto **non sono ancora presenti tariffe relative alle prestazioni di telemedicina**». E ancora: «Il teleconsulto […] viene considerato come parte integrante dell'attività lavorativa dei medici e, come quella effettuata in presenza, non prevede remunerazione a prestazione, non ha una tariffa a livello di nomenclatore della specialistica e non prevede compartecipazione alla spesa da parte del cittadino e nemmeno una prescrizione dell'SSN.»
- **Situazione 2026 — fonti in contraddizione, da verificare su fonte primaria:**
  - una fonte secondaria riferisce che il **decreto Milleproroghe convertito in legge nel 2026** avrebbe differito al **31 dicembre 2026** l'entrata in vigore delle nuove tariffe per specialistica ambulatoriale e diagnostica di laboratorio, lasciando in vigore le tariffe precedenti;
  - un'altra fonte riferisce che dal **21 settembre 2026** entrerebbero in vigore nuove tariffe massime, a seguito di una **nuova intesa in Conferenza Stato‑Regioni** su un decreto che sostituisce quello del 2024 e riguarda 448 prestazioni specialistiche e 222 codici di protesica, **senza riferimenti a prestazioni di telemedicina**.
  - **Non ho potuto risolvere la contraddizione su Normattiva o in GU. Va accertato prima di qualsiasi affermazione in documentazione pubblica.**

### 10.4 Conseguenze per l'adozione

1. **Non esiste, a livello nazionale, una tariffa dedicata alla telemedicina.** La televisita è remunerata **come visita di controllo**. Ciò comprime il margine e disincentiva investimenti nelle strutture accreditate.
2. **Teleconsulto e teleconsulenza non sono remunerati.** Sono attività a costo puro per l'erogatore. Un modello di *business* fondato sul volume di teleconsulti nel SSN **non ha fonte di ricavo diretta**.
3. **Frammentazione regionale.** Il rapporto ISS documenta approcci difformi tra Regioni (es.: la P.A. di Trento aveva istituito un codice e una tariffa di 53,65 € per il teleconsulto nel Nomenclatore Tariffario Provinciale, poi non più operativi dal 30 dicembre 2024 perché il nuovo tariffario nazionale non li contempla). Conclusione del rapporto: «marcate difformità tra regioni» con disparità di accesso e di condizioni economiche.
4. **Per Telemedic**: il mercato pubblico italiano è finanziato dal **PNRR/bilancio, non dalla tariffa**. Il mercato a tariffa reale è **privato, assicurativo e mutualistico**, che è appunto tra i casi d'uso target del progetto. La documentazione commerciale deve essere onesta su questo punto.

---

## 11. Requisiti vincolanti per Telemedic

Elenco dei requisiti che il software **deve** soddisfare per operare legittimamente in Italia. Ciascuno riporta la fonte e la qualifica di cogenza. I requisiti sono ordinati per criticità decrescente.

### A. Dominio clinico e documentale

1. **Modello di dominio conforme alle definizioni nazionali.** Il sistema deve distinguere come tipi separati, con regole distinte: `Televisita`, `Teleconsulto`, `Teleconsulenza`, `Teleassistenza`, `Telerefertazione`, `Telecontrollo`, `Telemonitoraggio`, `Teleriabilitazione`. Deve inoltre mantenere la mappatura verso i **quattro servizi minimi** del DM 21 settembre 2022 (televisita, teleconsulto/teleconsulenza, telemonitoraggio, teleassistenza). *Fonte: Accordo 215/CSR 2020, All. A; DM 21 settembre 2022, All. A. [VINCOLANTE]*

2. **Gate di appropriatezza sulla televisita.** Prima dell'erogazione, il sistema deve richiedere la registrazione esplicita di: (a) assenza di necessità di esame obiettivo completo; (b) **almeno una** delle cinque condizioni di erogabilità (PAI/PDTA, follow‑up da patologia nota, controllo/aggiustamento terapia, valutazione anamnestica per prescrizione, verifica esiti esami). La scelta deve essere attribuita al medico, tracciata e immodificabile. *Fonte: Accordo 215/CSR 2020, All. A. [VINCOLANTE]*

3. **Referto obbligatorio per la televisita**, contenente obbligatoriamente: (a) indicazione dei collaboratori partecipanti (presenza di *caregiver*, presenza di altro medico); (b) **qualità del collegamento e conferma di idoneità** all'esecuzione della prestazione. Il sistema deve popolare (b) automaticamente dalle metriche di sessione e sottoporlo a conferma del medico. *Fonte: Accordo 215/CSR 2020, All. A, § 4. [VINCOLANTE]* — **Nota: questo requisito è già naturalmente soddisfatto dalla feature «Metriche qualità su TimescaleDB» del progetto; va reso esplicito il collegamento normativo.**

4. **Il teleconsulto non produce referto autonomo.** Il sistema deve impedire la generazione di un referto specialistico a partire da un teleconsulto, consentendo invece il contributo al referto della visita erogata al paziente. *Fonte: Accordo 215/CSR 2020. [VINCOLANTE]*

5. **Firma digitale del referto.** Sottoscrizione digitale da parte del medico, con formato idoneo alla conservazione a norma e all'invio al FSE. *Fonte: Accordo 215/CSR 2020; DM 7 settembre 2023, art. 13, c. 3. [VINCOLANTE]*

6. **Fallback obbligatorio in presenza.** Il sistema deve tracciare l'esito «prestazione non completabile a distanza» e generare l'obbligo documentato di riprogrammazione in presenza **senza ulteriori oneri per SSN e utente**. *Fonte: Accordo 215/CSR 2020. [VINCOLANTE]*

7. **Adesione informata preventiva del paziente**, distinta dal consenso al trattamento dei dati, con informativa che copra i sette punti elencati nell'Accordo (in cosa consiste la prestazione, obiettivi, vantaggi, rischi; gestione dell'informazione e accessi; strutture e professionisti coinvolti; compiti e responsabilità; estremi del titolare e di almeno un responsabile; modalità per rivolgersi a titolare/responsabile; diritti dell'assistito). *Fonte: Accordo 215/CSR 2020, § 2. [VINCOLANTE]*

### B. FSE e interoperabilità

8. **Alimentazione del FSE entro 5 giorni** dall'erogazione della prestazione, con responsabilità in caso di alimentazione mancante, intempestiva o inesatta. Il sistema deve avere una coda di alimentazione con SLA, *retry* e allarme sul superamento del termine. *Fonte: DM 7 settembre 2023, art. 12, c. 3. [VINCOLANTE]*

9. **Flag di oscuramento e dati a maggiore tutela dell'anonimato.** All'atto dell'alimentazione, il sistema deve consentire di indicare se il documento rientra nell'art. 6 o se è stato esercitato l'oscuramento ex art. 9. L'oscuramento deve essere realizzato in modo che i terzi abilitati **non possano dedurre** che l'assistito ha effettuato la scelta. *Fonte: DM 7 settembre 2023, artt. 6, 9, 12 c. 4. [VINCOLANTE]*

10. **Produzione di documento clinico nel formato nazionale.** CDA2 secondo le specifiche di interoperabilità FSE vigenti, e/o **Bundle FHIR conforme alla IG «Televisita» di HL7 Italia** (`CompositionRefertoTelevisita`, `EncounterTelemedicina`, `PatientTelevisita`, ecc.), FHIR **R4 4.0.1**. *Fonte: DM 7 settembre 2023, art. 13; DM 21 settembre 2022, All. A, § Interoperabilità; HL7 Italia FHIR IG Televisita v0.2.0. [VINCOLANTE il primo, TECNICO‑VINCOLANTE/EMERGENTE il secondo]*

11. **Integrazione via Gateway FHIR verso FSE/EDS**, non persistenza clinica nella INT, alimentazione FSE ed EDS con eventi normalizzati sul modello dati comune. *Fonte: DM 21 settembre 2022, All. A, Scenario A; DM 19 novembre 2025. [TECNICO‑VINCOLANTE]*

12. **API dei servizi minimi uniformi e direttamente accessibili** ad altre infrastrutture regionali, per consentire l'erogazione a assistiti di altre Regioni. *Fonte: DM 21 settembre 2022, All. A, § «Telemedicina tra le regioni». [TECNICO‑VINCOLANTE]*

13. **Tracciamento della modalità di erogazione a distanza** nei flussi di rendicontazione (flusso regionale, flusso ex art. 50 L. 326/2003, flusso DEMA) e nel referto. *Fonte: Accordo 215/CSR 2020, § 1. [VINCOLANTE]*

14. **Integrazione con CUP** per la prenotabilità della prestazione a distanza come qualunque altra sede di erogazione, con decisione sulla modalità riservata allo specialista. *Fonte: Accordo 215/CSR 2020. [VINCOLANTE nel contesto SSN]*

### C. Identità, accesso, audit

15. **Autenticazione forte mediante identità digitale ex art. 64 CAD: SPID, CIE, TS‑CNS.** *Fonte: DM 19 novembre 2025, All. 4; DM 7 settembre 2023, art. 11, c. 1. [VINCOLANTE]* — Conferma la decisione D9 del *context pack*, con l'aggiunta **non opzionale** di TS‑CNS.

16. **Profili di accesso differenziati per ruolo e per finalità**, conformi all'Allegato A del DM 7 settembre 2023: MMG/PLS, medico con dichiarazione di processo di cura in atto ex art. 47 D.P.R. 445/2000, infermiere/ostetrica, farmacista, personale amministrativo. Con **esclusione tassativa** di periti, assicurazioni, datori di lavoro, medicina legale. *Fonte: DM 7 settembre 2023, art. 15. [VINCOLANTE]*

17. **Registrazione delle operazioni** con: dato/documento oggetto, tipologia di operazione, categoria di soggetto, data e ora, e — per le sole consultazioni — la finalità. *Fonte: DM 7 settembre 2023, art. 21. [VINCOLANTE]* — Il modello Envers del progetto deve includere questi campi, non solo durata/esito/motivo di cancellazione.

18. **Conservazione dei log per 24 mesi** e dei dati di accesso/autenticazione per **12 mesi**. *Fonte: DM 19 novembre 2025, All. 4 (via parere Garante n. 2/2025). [VINCOLANTE]*

### D. Sicurezza e infrastruttura

19. **Cifratura di tutti i trasferimenti di voce, video, immagini e file**, e cifratura *at rest* e *in transit*. *Fonte: Accordo 215/CSR 2020, § Standard di Servizio; DM 19 novembre 2025, All. 4. [VINCOLANTE]*

20. **IPS e monitoraggio SIEM/SOAR**; verifiche periodiche di efficacia delle misure. *Fonte: DM 19 novembre 2025, All. 4. [VINCOLANTE per la PNT/IRT]*

21. **Conformità alle misure minime AgID (ABSC)** e alle **linee guida AgID sulla sicurezza nel procurement ICT**, azioni AP2, AP3, AP4 e cap. 5. *Fonte: Circolare AgID 2/2017; DM 21 settembre 2022, All. A, § Sicurezza. [VINCOLANTE]*

22. **Capacità di supportare gli obblighi di notifica degli incidenti**: pre‑notifica 24 h, notifica 72 h, relazione finale 1 mese (NIS2); segnalazione 24 h e notifica 72 h (L. 90/2024). Il prodotto deve fornire *detection*, timeline degli eventi e *export* forense in tempi compatibili. *Fonte: D.lgs. 138/2024, artt. sulla notifica; L. 90/2024. [VINCOLANTE per l'operatore, con riverbero contrattuale sul fornitore]*

23. **SLA H24 7/7** con tempi di presa in carico e ripristino almeno pari a: Critica 30/60 min; Alta 30/90 min; Media 60 min/8 h; Bassa 60 min/24 h. *Fonte: DM 21 settembre 2022, All. A, Tab. 3. [TECNICO‑VINCOLANTE]*

24. **Deployment su territorio nazionale** nei modelli ammessi (cloud pubblico criptato, privato/ibrido su licenza, privato), su servizi/infrastrutture **qualificati ACN** al livello corrispondente alla classificazione dei dati (verosimilmente «critici»). Nessuna dipendenza runtime che impedisca il *deployment* su PSN. *Fonte: DM 21 settembre 2022, All. A; Determinazioni ACN 306 e 307/2022; DD ACN 21007/24. [VINCOLANTE]*

25. **Architettura a micro‑servizi, event‑driven con event broker, containerizzata, multi‑tenant, cloud native SaaS/PaaS**, con prevenzione del *lock‑in*. *Fonte: DM 21 settembre 2022, All. A, § Driver tecnologici. [TECNICO‑VINCOLANTE]* — Conferma e irrigidisce la decisione D8.

### E. Accessibilità, design, apertura

26. **Conformità EN 301 549 / WCAG 2.1 AA**, con capacità di produrre e mantenere aggiornata la **dichiarazione di accessibilità** su modello AgID e gli **obiettivi annuali di accessibilità**; meccanismo di feedback per gli utenti. *Fonte: L. 4/2004; Determinazioni AgID 437/2019, 396/2020, 354/2022; DM 21 settembre 2022, All. A. [VINCOLANTE]*

27. **Conformità alle linee guida di design per i servizi digitali della PA** (Designers Italia) per il front end rivolto al cittadino in contesto PA; approccio *mobile first*; attenzione esplicita a pazienti anziani, con disabilità e fragili; **multilingua**. *Fonte: DM 21 settembre 2022, All. A, § Usabilità e accessibilità. [TECNICO‑VINCOLANTE]*

28. **`publiccode.yml` valido nella root del repository**, licenza con identificatore **SPDX `Apache-2.0`**, README bilingue, documentazione pubblica, indicizzazione nel catalogo **Developers Italia**, con sezione `it` compilata (`it.piattaforme`, `it.conforme.lineeGuidaDesign`, `it.conforme.modelloInteroperabilita`, `it.conforme.misureMinimeSicurezza`, `it.conforme.gdpr`). *Fonte: artt. 68‑69 CAD; Determinazione AgID 115/2019. [VINCOLANTE per la PA acquirente; abilitante per il progetto]*

29. **Conformità ModI** per le API esposte verso altre PA; pubblicazione su **PDND** degli e‑service nei casi di integrazione PA‑PA. *Fonte: Determinazioni AgID 547/2021 e 627/2021. [VINCOLANTE nel contesto PA]*

### F. Dispositivo medico

30. **Delimitazione esplicita e documentata della destinazione d'uso** che escluda dal perimetro certificato: il *viewer* di dati clinici usato per refertazione diagnostica in teleconsulto radiologico o istopatologico; il telemonitoraggio; l'elaborazione autonoma di informazione clinica. In assenza di tale delimitazione, il DM 21 settembre 2022 **impone espressamente** la certificazione come dispositivo medico con classe di rischio adeguata (potenzialmente > IIa per il telemonitoraggio avanzato). *Fonte: DM 21 settembre 2022, All. A, Sezione 2; Accordo 215/CSR 2020, § elementi minimi. [VINCOLANTE]*

31. **Tracciabilità delle attività di manutenzione, collaudi e controlli di sicurezza** per hardware e software in uso, con rapporti tecnici di dettaglio; **prove di idoneità all'uso clinico** e prove di funzionamento a intervalli regolari e dopo ogni intervento rilevante di manutenzione o aggiornamento. *Fonte: Accordo 215/CSR 2020, §§ Telerefertazione e Standard di Servizio. [VINCOLANTE]*

32. **Piano di valutazione dei rischi** commisurato alla tipologia dei servizi, con ponderazione in relazione a destinazione d'uso, quadro clinico del paziente e fattori ambientali; procedure di mitigazione; rivalutazione periodica; formazione dell'utente/*caregiver*; **modalità esplicite di segnalazione e notifica di incidenti e mancati incidenti**. *Fonte: Accordo 215/CSR 2020, § Standard di Servizio. [VINCOLANTE]*

---

## 12. Questioni aperte per gli altri agenti

### Per l'agente MDR / compliance

**Q1 — Il confine di classe I è più stretto di quanto il *context pack* assuma.** Il DM 21 settembre 2022 impone espressamente la certificazione come dispositivo medico per: (a) il micro‑servizio `viewer dati clinici` unitamente a quello di refertazione, nei teleconsulti radiologico e istopatologico; (b) il software e l'hardware della **televisita**, «ove nel servizio vengano usati dispositivi medici»; (c) l'infrastruttura per il **telemonitoraggio**, con classe potenzialmente superiore alla IIa per il livello 2. La domanda: **la v1.0 di Telemedic include un `viewer` di dati clinici o un percorso di telemonitoraggio?** Se sì, la strategia Classe I non regge nel mercato italiano. Serve un ADR che delimiti la destinazione d'uso e un'analisi della regola 11 MDR alla luce di questo testo.

**Q2 — La produzione di `DiagnosticReport` va riconsiderata.** La IG nazionale HL7 Italia «Televisita» usa `Composition` + `Bundle` (`CompositionRefertoTelevisita`, `RefertoDiTelevisita`), non `DiagnosticReport`. Va verificato se `DiagnosticReport` sia comunque utilizzato nelle IG nazionali e, in caso contrario, se la scelta dichiarata sul sito pubblico vada rivista o affiancata.

### Per l'agente architetturale

**Q3 — Conformità alle IG di HL7 Italia.** Il progetto dichiara «FHIR R4». La conformità richiesta in Italia è alle **Implementation Guide nazionali** (`Televisita` v0.2.0, `Teleconsulto` v0.2.0, `Teleassistenza` v0.2.0, `Telemonitoraggio` v0.2.0, `IT-Core` v0.2.0). Serve una decisione: (a) conformità piena alle IG italiane come profilo di default per il mercato IT; (b) FHIR R4 base con *profile pack* italiano opzionale. Impatta il modello dati, la validazione, i test di conformità e il *packaging*.

**Q4 — Gateway FHIR e ruolo di Telemedic nell'architettura nazionale.** Nell'architettura del DM 21 settembre 2022 la piattaforma di telemedicina è **una IRT o una componente di IRT**, e comunica con l'esterno **attraverso il Gateway FHIR del FSE 2.0**, non direttamente. Va deciso se Telemedic implementa un client verso il Gateway, se espone un adattatore, o se lascia l'integrazione all'integratore. Ha impatti su D4 (integrazioni) e sul confine di responsabilità.

**Q5 — Micro‑servizi trasversali: integrare, non reimplementare.** Il DM è esplicito nel vietare la reimplementazione *ad hoc* di refertazione/firma digitale e nel prescrivere l'integrazione con il modulo regionale. Va rivisto il perimetro funzionale: `refertazione e firma digitale`, `viewer dati clinici`, `booking`, `billing` sono **punti di integrazione**, non funzionalità da costruire.

**Q6 — Multi‑tenancy e territorialità.** Il DM prescrive «*multi‑tenant application in Cloud*» con segregazione e isolamento a livello applicativo, e i tre modelli di deployment tutti «su territorio nazionale». La decisione D8 va documentata come **conforme per costruzione**, con evidenze: RLS/schema‑per‑tenant, mappatura dei *grant*, assenza di dipendenze extra‑nazionali.

**Q7 — Event broker.** Il DM prescrive un'architettura *event‑driven* con *event broker* e condivisione *near real‑time*. Lo stack dichiarato (Spring Boot + TimescaleDB) non include un broker. Va deciso quale (Kafka? RabbitMQ? NATS?) e come si concilia con il vincolo «Docker Compose» per l'on‑premise.

### Per l'agente sicurezza

**Q8 — Log retention.** 24 mesi per i log, 12 mesi per i dati di accesso/autenticazione (DM 19 novembre 2025), 30 anni dal decesso per i documenti FSE (DM 7 settembre 2023, art. 10). Serve una policy di retention differenziata per classe di dato, configurabile per tenant, con evidenza di cancellazione.

**Q9 — Verifica del testo integrale del DM 19 novembre 2025.** L'Allegato 4 (misure di sicurezza) e l'Allegato 2 (integrazione con l'EDS) non sono stati letti su fonte primaria. Vanno reperiti in GU e tradotti in requisiti verificabili.

**Q10 — Determinazione ACN 379907/2025.** Le specifiche di base delle misure di sicurezza NIS2, efficaci dal 15 gennaio 2026 con obbligo di attuazione dimostrabile entro il 31 ottobre 2026, vanno lette sul testo ACN e mappate sul threat model STRIDE previsto da D10.

### Per l'agente prodotto/documentazione

**Q11 — Il vincolo sulla prima visita va spiegato con precisione, non semplificato.** Il testo nazionale contiene due affermazioni di diversa intensità (§ 3.1) e le aperture in prima visita sono **regionali**. Una documentazione che affermi «la televisita non può mai sostituire la prima visita» è imprecisa; una che affermi «la televisita è ammessa in prima visita dopo teleconsulto» è imprecisa in senso opposto. Va usata la formulazione stratificata proposta nel § 3.1.

**Q12 — Onestà sul modello economico.** Non esiste tariffa nazionale per la telemedicina; il teleconsulto non è remunerato; il nuovo nomenclatore non contiene voci di telemedicina. La documentazione commerciale non deve suggerire il contrario.

**Q13 — Terminologia: «servizi minimi» ≠ «prestazioni».** Le due tassonomie (Accordo 2020 e DM 21 settembre 2022) non coincidono. Il glossario di `docs/00_overview/` deve rappresentarle entrambe con la mappatura esplicita.

### Verifiche documentali ancora da compiere

| # | Da verificare | Fonte da consultare |
|---|---|---|
| V1 | Testo integrale del **DM 19 novembre 2025** (19 articoli, 5 allegati) | GU n. 301 del 30 dicembre 2025, atto 25A06938 |
| V2 | Estremi e testo della norma della **legge di bilancio 2026** sulla telemedicina (art. 85?) e importi | Normattiva |
| V3 | Contraddizione sulle **tariffe 2026** (Milleproroghe vs. nuovo decreto dal 21 settembre 2026) | GU / Normattiva / Conferenza Stato‑Regioni |
| V4 | Esistenza di una **tipologia documentale FSE dedicata al referto di televisita** e relative specifiche CDA2 | Specifiche di interoperabilità FSE v2.6.4, fascicolosanitario.gov.it |
| V5 | Recepimento effettivo dell'estensione del campo «luogo di erogazione» con valore `T = telemedicina` nel **flusso ex art. 50** e nel **flusso DEMA** | Disciplinari tecnici Sistema TS |
| V6 | **Riprogrammazione PNRR** del sub‑investimento M6C1‑1.2.3 dopo la revisione ECOFIN di dicembre 2023 | Italia Domani, documenti ufficiali |
| V7 | **Stato reale di attivazione delle IRT** e numero di Regioni agganciate alla INT ad agosto 2026 | AGENAS, relazione annuale ASD |
| V8 | Inclusione o meno di soggetti sanitari nel **perimetro di sicurezza nazionale cibernetica** | Non pubblico; verifica caso per caso col cliente |
| V9 | **Allegato B al DM 30 settembre 2022** («Linee di indirizzo per i servizi di telemedicina»): quali **aree cliniche** individua | GU n. 298 del 22 dicembre 2022 |
| V10 | Contenuto integrale delle **«Indicazioni metodologiche per la perimetrazione delle proposte di PPP per la Piattaforma nazionale di telemedicina»** (AGENAS, 18 marzo 2022, agg. 4 maggio 2022), richiamate *per relationem* dal DM 21 settembre 2022 | AGENAS |

---

## Fonti principali

- [Accordo Stato‑Regioni 17 dicembre 2020, rep. atti n. 215/CSR — testo integrale](https://www.statoregioni.it/media/3221/p-3-csr-rep-n-215-17dic2020.pdf)
- [Repertorio atto n. 215/CSR — Conferenza Stato‑Regioni](https://www.statoregioni.it/it/conferenza-stato-regioni/sedute-2020/seduta-del-17122020/atti/repertorio-atto-n-215csr/)
- [Accordo Stato‑Regioni 18 novembre 2021, rep. atti n. 231/CSR — teleriabilitazione](https://www.statoregioni.it/media/4271/p-1-csr-atto-rep-n-231-18nov2021.pdf)
- [DM 21 settembre 2022 — GU n. 256 del 2 novembre 2022](https://www.gazzettaufficiale.it/eli/id/2022/11/02/22A06184/sg)
- [DM 30 settembre 2022 — GU n. 298 del 22 dicembre 2022](https://www.gazzettaufficiale.it/eli/id/2022/12/22/22A07125/sg)
- [DM 28 settembre 2023 — GU n. 271 del 20 novembre 2023 (riparto M6C1‑1.2.3.2)](https://www.gazzettaufficiale.it/eli/id/2023/11/20/23A06323/sg)
- [DM 19 novembre 2025 — GU n. 301 del 30 dicembre 2025 (PNT, trattamento dati)](https://www.gazzettaufficiale.it/eli/id/2025/12/30/25A06938/SG)
- [Garante privacy, parere n. 2 del 16 gennaio 2025 sullo schema di decreto PNT](https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/10105743)
- [Garante privacy, provvedimento 23 giugno 2025 (proroga fasi FSE 2.0)](https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/10161000)
- [Garante privacy, provvedimento 26 settembre 2024 (art. 27‑bis FSE 2.0)](https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/10061545)
- [DM 7 settembre 2023 FSE 2.0 — GU n. 249 del 24 ottobre 2023](https://www.gazzettaufficiale.it/eli/id/2023/10/24/23A05829/sg)
- [DM 20 maggio 2022 — Linee guida attuazione FSE, GU n. 160 dell'11 luglio 2022](https://www.gazzettaufficiale.it/eli/id/2022/07/11/22A03961/SG)
- [DM 31 dicembre 2024 — Istituzione EDS, GU n. 53 del 5 marzo 2025](https://www.gazzettaufficiale.it/eli/id/2025/03/05/25A01321/SG)
- [Portale Fascicolo Sanitario Elettronico](https://www.fascicolosanitario.gov.it/)
- [Specifiche tecniche per l'interoperabilità tra i sistemi regionali di FSE (Affinity Domain Italia)](https://www.fascicolosanitario.gov.it/sites/default/files/public/media/Specifiche%20interoperabilit%C3%A0/AffinityDomainItalia_v2-5_v20231212.pdf)
- [HL7 Italia — catalogo delle Implementation Guide FHIR](https://www.hl7.it/fhir/)
- [HL7 Italia — IG Televisita v0.2.0](https://www.hl7.it/fhir/televisita/)
- [AGENAS — Telemedicina, investimento PNRR M6C1 I1.2.3](https://www.agenas.gov.it/pnrr/missione-6-salute/telemedicina-per-un-migliore-supporto-ai-pazienti-cronici)
- [Portale Nazionale di Diffusione della Telemedicina](https://www.telemedicina.gov.it/)
- [Rapporti ISTISAN 25/16 — Normativa regionale per l'erogazione di prestazioni in telemedicina e di teleconsulto](https://publ.iss.it/ITA/Items/GetPDF?uuid=ff5eb7a0-9ef7-47ad-9faf-b86e08888dcb)
- [AgID — Linee guida su acquisizione e riuso di software per le PA (Det. 115/2019)](https://www.agid.gov.it/it/design-servizi/riuso-open-source/linee-guida-acquisizione-riuso-software-pa)
- [AgID — Determinazione n. 547 del 1° ottobre 2021 (ModI e sicurezza API)](https://trasparenza.agid.gov.it/page/9/details/2372/)
- [AgID — Linee guida sull'interoperabilità tecnica delle PA (testo)](https://www.agid.gov.it/sites/agid/files/2024-05/linee_guida_interoperabilit_tecnica_pa.pdf)
- [AgID — Linee guida sull'infrastruttura tecnologica della PDND, v2 maggio 2025](https://www.agid.gov.it/sites/agid/files/2025-06/Linee_guida_Infrastruttura_Interoperabilit%C3%A0_PDND_v2_maggio_2025.pdf)
- [AgID — Piano triennale per l'informatica nella PA 2024‑2026, aggiornamento 2026](https://www.agid.gov.it/sites/agid/files/2025-10/Piano_Triennale_2024-2026_Aggiornamento_2026.pdf)
- [AgID — Determinazione n. 354/2022 (accessibilità, adeguamento norma armonizzata)](https://trasparenza.agid.gov.it/page/9/details/2731/)
- [Linee guida accessibilità — Designers Italia](https://designers.italia.it/normativa/linee-guida-accessibilita/)
- [ACN — Qualificazione del cloud della PA](https://www.acn.gov.it/portale/en/w/qualificazione-del-cloud-della-pa-al-via-la-gestione-acn)
- [Cloud Italia — Percorso di qualificazione dei servizi cloud della PA](https://cloud.italia.it/qualificazione-servizi-cloud/)
- [Cloud Italia — Polo Strategico Nazionale](https://cloud.italia.it/strategia-cloud-pa/polo-strategico-nazionale/)
- [Legge 28 giugno 2024, n. 90 — Normattiva](https://www.normattiva.it/atto/caricaDettaglioAtto?atto.dataPubblicazioneGazzetta=2024-07-02&atto.codiceRedazionale=24G00108)
- [NIS2 in Italia — d.lgs. 138/2024 e determinazioni ACN](https://nis2-directive.it/)
- [Circolare AgID 18 aprile 2017, n. 2/2017 — misure minime di sicurezza ICT](https://www.csigbologna.it/referenze/legislazione/circolare-agid-2-2017-misure-minime-sicurezza-pa/)
- [Nuove soglie comunitarie in vigore dal 1° gennaio 2026](https://www.sentenzeappalti.it/2025/10/24/nuove-soglie-comunitarie-in-vigore-dal-1-gennaio-2026/)
- [Codice di deontologia medica FNOMCeO — art. 78 «Tecnologie informatiche»](https://portale.fnomceo.it/wp-content/uploads/2023/08/CODICE-DEONTOLOGIA-MEDICA-2014-e-aggiornamenti_acc.pdf)
- [SIT — criticità sul decreto PNT, 14 aprile 2026](https://www.sitelemed.it/2026/04/14/telemedicina-la-sit-esprime-criticita-e-propone-una-fase-transitoria-sul-decreto-pnt-per-dati-e-accesso-ai-servizi/)
- [Regione Emilia‑Romagna — Indicazioni regionali per l'erogazione di prestazioni in telemedicina (BUR n. 255 del 17 agosto 2021, All. 2)](https://bur.regione.emilia-romagna.it/area-bollettini/bollettini-in-lavorazione/n-255-del-17-08-2021-parte-seconda.2021-08-17.7514407911/indicazioni-in-merito-allerogazione-di-servizi-di-telemedicina-nelle-strutture-del-servizio-sanitario-regionale-in-applicazione-allaccordo-stato-regioni-del-17-dicembre-2020-indicazioni-nazionali-per-lerogazione-di-prestazioni-in-telemedicina/allegato-2-telemedicina)

---

**Nota finale sulla riservatezza (R0).** Nessun nome di azienda, marchio, prodotto commerciale o dominio di potenziale partner compare in questo documento. Il concessionario della Piattaforma nazionale di telemedicina è indicato genericamente come «società di progetto costituita da operatori economici privati».