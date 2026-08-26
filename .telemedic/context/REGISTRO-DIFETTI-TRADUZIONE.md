# Registro dei difetti emersi dalla traduzione - ondata del 26 agosto 2026

> **Regola che governa questo registro**: ogni voce si chiude **sull'italiano e sull'inglese nello
> stesso commit**. Correggerne una lingua sola produce la divergenza silenziosa che il progetto
> considera peggiore del difetto di partenza - ed è già successo con `7750d38`, vedi §1.
>
> **Criterio per i conflitti di citazione normativa** (§2): si verifica alla **fonte primaria**
> (Normattiva, Gazzetta Ufficiale), citando la fonte consultata e la data. Dove la fonte non è
> raggiungibile o resta ambigua si marca `[NV]` e lo si dichiara. Non si allinea un documento
> all'altro: propagherebbe un'asserzione interna senza verificarla.
>
> Stato: `APERTO` · `IN CORSO` · `CHIUSO` (con il riferimento del commit).

---

## 1. Asimmetrie fra italiano e inglese - **rettificato dopo verifica** · CHIUSO

**Prima lettura, sbagliata.** Dalla sola lista dei file toccati da `7750d38` avevo dedotto che tre
correzioni esistessero solo in inglese e due solo in italiano, e che «per tre voci l'inglese fosse
più corretto dell'italiano». **La deduzione era errata.**

**Verifica con `git log -S`.** Le tre correzioni sospettate mancanti erano **già presenti
nell'italiano**, introdotte dal commit precedente `51723c9`:

| Correzione | Introdotta in IT da | Portata in EN da |
|---|---|---|
| Nota «`AE` è un errore applicativo, non un rifiuto», con la conseguenza sul ritentativo | `51723c9` | `7750d38` |
| Rinvii `[02 §8]` → `[02 §10]` in `06_security/00-indice.md` e `01-modello-di-minaccia.md` | `51723c9` | `7750d38` |
| Riga `M-09` nella tabella di copertura delle minacce | `51723c9` | `7750d38` |

`7750d38` non ha quindi introdotto asimmetrie in quella direzione: ha **portato l'inglese al pari
dell'italiano**, che era avanti. La lezione operativa resta valida - un difetto si chiude su
entrambe le lingue nello stesso commit - ma l'accusa era infondata.

**Ciò che era davvero aperto, e che è stato corretto in questa sessione:**

| # | File | Correzione | Stato |
|---|---|---|---|
| A-1 | `04_protocols/09-tempo-reale.md` EN | «The last line of the fourth entry» → «The fourth entry», per allineare l'inglese alla correzione italiana di `7750d38` | **CHIUSO** |
| A-2 | `06_security/02-identita-e-accessi.md` | Correzione italiana `sul obiettivo` → `sull'obiettivo`, ortografica e invisibile in inglese. Il file resta segnalato divergente perché il controllo confronta le date di commit | **DA CHIUDERE** toccando il file inglese nello stesso commit, come prescrive lo script stesso: «si tocca comunque il file tradotto nello stesso commit, così la relazione fra i due resta vera e il controllo non impara a mentire» |

## 2. Conflitti di citazione normativa - richiedono verifica alla fonte primaria

Sono i più gravi del registro: riguardano il modulo che esiste **per essere l'elenco autorevole
delle fonti**, e in un caso il conflitto è con un documento che porta una nota esplicita su come
non sbagliare quella stessa citazione.

### N-1 · L. 30 dicembre 2025, n. 199 - **VERIFICATO ALLA FONTE: non è un difetto** · CHIUSO

**Verifica del 26 agosto 2026**, fonti: Gazzetta Ufficiale (atto 25G00212, pubblicato il 30
dicembre 2025) e dossier del Servizio Studi della Camera sulla legge di bilancio 2026.

Le due citazioni sono **entrambe corrette** e si riferiscono a **disposizioni diverse dello stesso
atto**:

| Commi | Oggetto | Citato correttamente in |
|---|---|---|
| art. 1, commi **405-406** | Servizi di scambio transfrontaliero per ricette elettroniche, profilo sanitario sintetico, documenti clinici originali, referti di laboratorio, lettere di dimissione, referti di diagnostica per immagini | `10_fondamenti/07-fse-e-infrastrutture-nazionali.md` §10, che ne cita il testo fra caporali |
| art. 1, commi **410-412** | Potenziamento dei servizi di telemedicina: 20 milioni di euro per il 2026 ad AGENAS | `10_fondamenti/01-sistema-sanitario-italiano.md` §9.4 |

**Non c'era alcun conflitto da risolvere.** Allineare un documento all'altro - l'alternativa
scartata quando si è scelto il criterio della verifica alla fonte - avrebbe **introdotto** un
errore in una citazione corretta. È la dimostrazione del perché il criterio è quello giusto.

**Residuo, questo sì un difetto** · APERTO: la riga di `20-fonti-primarie.md` §3 elenca come «Dove è
usata» sia `[01]` sia `[07 §10]`, ma **il modulo 01 non cita i commi 405-406** (verificato: nessuna
occorrenza). La colonna va corretta in `[07 §10]`, oppure la riga va sdoppiata per dare conto delle
due disposizioni distinte dello stesso atto - che è la soluzione migliore, perché il modulo 01 cita
davvero quella legge, ma per i commi 410-412.

### N-2 · Atto 31 dicembre 2025, n. 200 - **VERIFICATO ALLA FONTE: `20-fonti-primarie` sbaglia** · DA CORREGGERE

**Verifica del 26 agosto 2026**, fonte: Gazzetta Ufficiale, pagina di dettaglio del provvedimento.
Estremi esatti: **decreto-legge 31 dicembre 2025, n. 200**, convertito con modificazioni dalla
**legge 27 febbraio 2026, n. 26**, pubblicata in G.U. n. 49 del 28 febbraio 2026, in vigore dal 1°
marzo 2026. È il «Milleproroghe» 2026.

| Dove | Qualificazione | Esito |
|---|---|---|
| `10_fondamenti/20-fonti-primarie.md` §3 | «**Legge** 31 dicembre 2025, n. 200» | **errato**: è un decreto-legge |
| `10_fondamenti/01-sistema-sanitario-italiano.md` riga 508 | «**D.L.** 31 dicembre 2025, n. 200 (Milleproroghe), convertito con L. 27 febbraio 2026, n. 26» | **corretto** |

**Correzione da applicare** a `20-fonti-primarie.md` §3 e alla sua traduzione inglese, nello stesso
commit: qualificare l'atto come decreto-legge e riportare la legge di conversione. Va rivisto anche
il contenuto attribuito nella colonna «Che cosa stabilisce» («per il quadro di finanza pubblica
sanitaria»), che non corrisponde all'uso che ne fa il modulo 01 - dove compare nella cronologia del
decreto tariffe, per il differimento del regime tariffario precedente.

**Nota di cautela**: alcune fonti secondarie in rete titolano «decreto-legge 1 dicembre 2025, n.
200». La pagina della Gazzetta Ufficiale dà **31 dicembre 2025**, e quella è la fonte che fa fede.

### N-3 · Determinazione n. 127437 del 2026 - estremo incompleto · APERTO

`10_fondamenti/20-fonti-primarie.md` §5.3 cita «Determinazione n. 127437 del 2026», **senza il
giorno**. Altri due file del repository - `10_fondamenti/12-crittografia-e-sicurezza.md` e
`06_security/07-catena-di-fornitura.md` - danno «**13 aprile 2026**».

L'agente che ha tradotto il modulo 20 **ha deliberatamente lasciato l'estremo incompleto** pur
conoscendo la data dagli altri file, ed è stata la scelta giusta: completare un estremo con
conoscenza propria dentro un documento di fonti verificate è il modo in cui una fonte non
verificata entra di nascosto. La chiusura richiede la verifica alla fonte.

---

## 3. Rinvii incrociati sbagliati

### 3.1 Blocco con scarto sistematico - `10_fondamenti/10-percorsi-di-cura-e-sicurezza.md` · APERTO

Sei rinvii, quattro dei quali con scarto **+1** costante: hanno l'aria di essere stati scritti
quando il §7 aveva una sezione in meno. **Vanno verificati in blocco, non uno per uno.**

| # | Punto | Rinvia a | Bersaglio corretto |
|---|---|---|---|
| R-1 | §2.3, riga «Saturazione periferica di ossigeno» | § 7.11 | **§ 7.10** |
| R-2 | §5.3, penultimo capoverso | § 7.11 | **§ 7.10** |
| R-3 | §2.7, nota `[NV]` | § 7.10 | **§ 7.9** |
| R-4 | §3.7 punto 6 | § 7.10 | **§ 7.9** |
| R-5 | §4.5, citazione «Formula da usare, e da non annacquare» | § 9.7 | **§ 9.6** |
| R-6 | §2.6, ultimo capoverso | § 9.9 | **§ 9.8** - **§ 9.9 non esiste**, il §9 finisce a 9.8 |

### 3.2 Altri rinvii · APERTO

| # | File | Punto | Rinvia a | Bersaglio corretto |
|---|---|---|---|---|
| R-7 | `08_compliance/08-sorveglianza-post-commercializzazione.md` | blocco di apertura | § 8 | **§ 9** (la prospettiva del fabbricante) |
| R-8 | idem | § 2, ultima riga | § 6 | **§ 8.2** (in subordine § 4.1) |
| R-9 | `10_fondamenti/11-fondamenti-informatici.md` | § 4.6, ultimo capoverso | § 7.8 | **§ 7.7** (livello anticorruzione); confermato dal § 14.3 dello stesso file |
| R-10 | `10_fondamenti/05-standard-di-interoperabilita.md` | § 8.2, voce AIC | § 8.4 | **§ 8.3** (e § 8.6) |
| R-11 | `08_compliance/09-percorso-e-calendario.md` | § 5, `V-174` | [03 §4] | **[03 §4.1]**, per coerenza con i rinvii dell'area |
| R-12 | `10_fondamenti/06-fhir-da-zero.md` | § 7.7 | cita `400` per assenza di `If-Match` | rinviare a **P-02** e al codice **428**, scelta di progetto in `04_protocols/02 §8.3` |

---

## 4. Enumerazioni che non tornano

| # | File | Punto | Annuncia | Elenca | Stato |
|---|---|---|---|---|---|
| E-1 | `10_fondamenti/10-percorsi-di-cura-e-sicurezza.md` | §9.2 | «**Tre** nozioni» | **quattro** righe (aggiunge «Evento avverso prevenibile») | APERTO |
| E-2 | `10_fondamenti/18-contribuire-per-area.md` | §15, chiusura | «**Tre** righe» | **quattro** commentate | APERTO |
| E-3 | `10_fondamenti/20-fonti-primarie.md` | §7.3, nota | «**Tre** profili su **otto**… uno in commento pubblico» | **sette** profili, **quattro** in Trial Implementation | APERTO |
| E-4 | `10_fondamenti/17-ambiente-di-sviluppo.md` | §1.2, «Se manca» | «**cinque** servizi» | **quattro** nella colonna precedente, nella prosa e in §2.6 | APERTO |
| E-5 | `10_fondamenti/17-ambiente-di-sviluppo.md` | §7.2 | «**quattro** regole non negoziabili» | tre divieti **più un permesso** | APERTO |
| E-6 | `10_fondamenti/11-fondamenti-informatici.md` | §1.1 | «**Sette** confini di rete» | **otto** voci nell'elenco immediatamente sopra | APERTO - o si corregge il numero, o si esplicita perché i confini siano uno in meno |
| E-7 | `10_fondamenti/05-standard-di-interoperabilita.md` | «Cosa devi ricordare» punto 1 | «**tre** problemi distinti» | **quattro** domande in §1.4 | APERTO |
| E-8 | `08_compliance/09-percorso-e-calendario.md` | §8.1, chiusura | «**sei** attività non comprimibili» a monte della sottomissione | **cinque** righe a monte | APERTO |
| E-9 | `08_compliance/07-valutazione-clinica.md` | §2.1 punto 1 vs §4 | «**tre** documenti» | **sette** prodotti in tabella | APERTO |
| E-10 | `10_fondamenti/17-ambiente-di-sviluppo.md` | §2.7, commento SQL | «una **terna** di schemi per tenant» | **sei** in §4.2 | APERTO |
| E-11 | `10_fondamenti/18-contribuire-per-area.md` | §14.6 | «queste **cinque** cose sono scarse» | motiva solo 14.1, 14.2, 14.4 | APERTO (non bloccante) |

---

## 5. Divergenze fra documenti - richiedono una **decisione**, non un allineamento meccanico

| # | Questione | Posizioni in conflitto | Stato |
|---|---|---|---|
| **C-1** | **Quanti sono i contesti delimitati?** | `10_fondamenti/17-ambiente-di-sviluppo.md` §3.4 elenca **dodici** moduli sotto `contexts/`; `16-architettura-del-progetto.md` §4.2-4.3 dichiara **tredici** contesti. Il tredicesimo (`CTX-10` Terminologie) compare in §3.4 sotto `platform/terminology-gateway/`, cioè **fuori** da `contexts/` | APERTO - **decisione architetturale**: o il gateway terminologico è un contesto e sta in `contexts/`, o i contesti sono dodici e il modulo 16 va corretto |
| **C-2** | **Come si chiama il modulo 18?** | Tre denominazioni nel repository: «Cosa sapere per contribuire» (`CONTRIBUTING.md` righe 16 e 168, `10_fondamenti/00` riga 60, `17-ambiente-di-sviluppo.md` riga 2036), «Contribuire, area per area» (`title` reale, `19-glossario.md`), «What to know in order to contribute» (`00` EN riga 61). Inoltre `Q-198` **dichiara compiuto** l'allineamento, che non è compiuto | APERTO - o si allineano i quattro rinvii, o `Q-198` va riscritta |
| **C-3** | **Come si chiama il modulo 10?** | «Percorsi di cura e sicurezza» (`18` §1) contro «Percorsi di cura e sicurezza **del paziente**» (`18` §6.2 e §11.2, e titolo reale) | APERTO - uniformare alla forma lunga |
| **C-4** | **`allarme`: *alarm* o *alert*?** | `14-flussi-funzionali.md` EN usa *alert*; `10-percorsi-di-cura-e-sicurezza.md` EN usa *alarm* | **DECISO**: `allarme` → *alarm*, `alert` → *alert*. Motivi: l'italiano glossa esso stesso «affaticamento da allarme» come *alarm fatigue*; `soglia di allarme` è già *alarm threshold* in due file; `M-08` in `06_security/01` è già *Loss of an alarm*; e l'italiano tiene distinti `allarme` e il prestito `alert` (gli «alert sanitari»/«alert tecnici» del DM 21 settembre 2022). **Da allineare: `14-flussi-funzionali.md` EN** |
| **C-5** | **`Example Publisher`: si nomina o no?** | `10_fondamenti/06-fhir-da-zero.md` §8.4 **nomina** il valore segnaposto; `04_protocols/02-fhir.md` §9.2 mantiene deliberatamente la reticenza | APERTO - verificare quale politica è voluta e allineare |
| **C-6** | **`contentType` del contenitore video** | `10_fondamenti/06-fhir-da-zero.md` §6.11 dice «valorizzato al tipo del contenitore video»; `04_protocols/02-fhir.md` §10.3 impone `V-11`: tipo «negoziato a runtime e **mai presunto**» | APERTO - **il più costoso dei sei**: chi impara dal modulo scrive codice non conforme a `V-11` |
| **C-7** | **`rapporto periodico sulla sicurezza`** | `08_compliance/07` usa la forma breve; `08-sorveglianza-post-commercializzazione.md` §4 e `04-fascicolo-tecnico.md` usano «rapporto periodico **di aggiornamento** sulla sicurezza» (PSUR) | APERTO - allineare alla forma lunga |
| **C-8** | **`Q-274` è essa stessa un residuo** | `08_compliance/07` §9 afferma che `Q-144` «risulta ancora elencata fra le questioni aperte in `02 §12` e in `09 §10`». **Falso**: in entrambi i file la voce dice «CHIUSA da `D55`… RISOLTA» | APERTO - `Q-274` va chiusa, non girata a ORCH |
| **C-9** | **`Q-179` contraddice `D57`** | `08_compliance/09` §10 dice «date di certificazione **riferite a un percorso di terzi**», mentre l'avvertenza di apertura dello stesso capitolo e `D57` dicono che sono **pianificazione interna del progetto** | APERTO - residuo di formulazione anteriore a `D57`/`D58` |
| **C-10** | **`Q-144` - quale punto di decisione** | `08_compliance/09` §10 dice «il **primo** punto di decisione irreversibile del §3.5 è superato»; il congelamento della destinazione d'uso è la **seconda** riga (31 ottobre 2026) | APERTO |

---

## 6. Incoerenze terminologiche interne all'italiano

| # | File | Difetto | Stato |
|---|---|---|---|
| T-1 | `10_fondamenti/11-fondamenti-informatici.md` §7.5 | Il titolo dice «**incontro** clinico», ma §7.1 fissa il linguaggio ubiquo su «**contatto**» → `Encounter` e avverte contro i sinonimi; la tabella sotto usa «contatto clinico» | APERTO |
| T-2 | `10_fondamenti/17-ambiente-di-sviluppo.md` §9.2 (G12), §11.2, §2.9 | Tre termini - «profilo di **produzione**», «profilo di **esercizio**», «costruzione di produzione» - per due concetti mai distinti esplicitamente | APERTO |
| T-3 | `10_fondamenti/17-ambiente-di-sviluppo.md` §11.2 | Usa l'anglismo «deployer» dove il progetto scrive «chi installa» (`06_security/09`) | APERTO |
| T-4 | `10_fondamenti/10-percorsi-di-cura-e-sicurezza.md` §2.6 | «**dashboard**» dove §9.6 e §9.8 usano «**cruscotto**» | APERTO (invisibile in traduzione) |
| T-5 | `10_fondamenti/05-standard-di-interoperabilita.md` §8 | Il cappello dice che gli obblighi operativi cominciano «dalla **§8.4**», ma §8.3 apre con «Qui finisce la teoria. Quanto segue è regola operativa vincolante» | APERTO |
| T-6 | `10_fondamenti/05-standard-di-interoperabilita.md` §8.3 | «Pacchetti delle guide italiane» classificati **regime C** (acquisizione **a runtime**) con motivazione «dipendenza risolta **in fase di build**» | APERTO - o il regime è sbagliato, o la motivazione |
| T-7 | `10_fondamenti/11-fondamenti-informatici.md`, glossario di modulo | La colonna inglese dell'autore scrive «Anticorruption layer» e «Idempotence»; `16-architettura-del-progetto.md` EN usa «anti-corruption layer» e «idempotency» | APERTO |
| T-8 | `10_fondamenti/09-fondamenti-clinici.md` §9.2-9.5 | Sei difetti di tabella morfologica: `brad-i-` segmentato contro convenzione; `ipossia` non contiene il morfema come segmentato; glossa di `anemia` clinica invece che letterale; quattro voci a doppia radice con un solo esempio; `lipidi` non è un composto; `BMI` unica sigla in forma inglese | APERTO |
| T-9 | `10_fondamenti/06-fhir-da-zero.md` §4.5 | Un capoverso **apre con `[V]` e prosegue dichiarando `[NV]`**: le due marcature si contraddicono nella stessa frase | APERTO - resta solo `[NV]` |
| T-10 | `10_fondamenti/06-fhir-da-zero.md` §7.5 e §7.7 | Segnaposto in italiano (`[tipo]`, `[nome]`) dove §7.1 usa quelli in inglese (`[type]`, `[id]`) | APERTO - **l'inglese è più coerente dell'italiano**: sanare sull'italiano |
| T-11 | `10_fondamenti/06-fhir-da-zero.md` §1.2 | La riga `R5` della tabella delle release lascia la **data vuota**, in una tabella in cui ogni altra riga è datata e marcata `[V]` | APERTO |
| T-12 | `08_compliance/09-percorso-e-calendario.md` §7.2, riquadro `V-179` | «entrano nel sistema di gestione della qualità **di un sistema di gestione della qualità**» - locuzione duplicata, residuo di editing | APERTO |
| T-13 | `08_compliance/07-valutazione-clinica.md` §9 | La tabella elenca `Q-176`, `Q-275`, `Q-274`: fuori ordine rispetto alle altre tabelle dell'area | APERTO |
| T-14 | `10_fondamenti/20-fonti-primarie.md` §5.1 | «il forum ufficiale… **consultata** il 25 agosto 2026» - concordanza al femminile con soggetto maschile | APERTO |
| T-15 | `10_fondamenti/20-fonti-primarie.md` §§5.3-5.5 vs §§2, 5.1, 5.6 | Reticenza sugli enti non tenuta: nomina `ACN` e `AgID` in alcuni punti, usa perifrasi per gli stessi soggetti in altri | APERTO |
| T-16 | `10_fondamenti/20-fonti-primarie.md` §14 | Il riepilogo `[NV]` omette un elemento presente nel `[NV]` originale del §6.1 (ripartizione fra i paragrafi degli artt. 86 e 87 in funzione della classe) | APERTO |
| T-17 | `10_fondamenti/10-percorsi-di-cura-e-sicurezza.md`, glossario di modulo | «Finestra di attesa» è in coda invece che fra «Falsa rassicurazione» e «Fragilità» | APERTO - posizione **conservata identica** in inglese, per non creare divergenza |
| T-18 | `10_fondamenti/18-contribuire-per-area.md` §3 | «rende inservibile l'intera matrice di tracciabilità, **che** è una delle attività retroattivamente irrecuperabili» - una matrice non è un'attività | APERTO |
| T-19 | `10_fondamenti/11-fondamenti-informatici.md` §14.7 | `RF-139` e `BR-071` citati per la stessa regola in punti diversi senza spiegare che sono anelli diversi della catena | APERTO |
| T-20 | `08_compliance/07-valutazione-clinica.md` §6.1 vs §6.2 | Il punto 1 chiama l'equivalenza «l'unica **attività dell'intero percorso**», ma §6.2 stabilisce che **non è un'attività pianificata** ed è esclusa da `CE-PLAN-001` | APERTO |
| T-21 | `08_compliance/07-valutazione-clinica.md` §7.1 | La grandezza «frequenza di allarmi non riscontrati» cita `V-148` (attesa di rilevazione), che presidia l'assenza di misura, non il mancato riscontro | APERTO |
| T-22 | `04_protocols/05-ihe.md` §9.2 | «Ha **due** opzioni rilevanti» e ne elenca **tre** - segnalato nella prima ondata, **verificare se `7750d38` l'ha chiuso** | DA VERIFICARE |

---

## 7. Deviazioni dichiarate dalla lettera dell'originale

Un solo caso in tutta l'ondata, dichiarato dall'agente e da chiudere.

| # | File | Deviazione | Stato |
|---|---|---|---|
| D-1 | `10_fondamenti/11-fondamenti-informatici.md` §3.5 e §14.7 | L'originale dà lo stato **`sostituito`** (italiano) fra i valori di `DocumentState` (tipo inglese). La traduzione ha reso **`superseded`** per non produrre un enum ibrido nel testo inglese. **La divergenza resta finché l'italiano non è allineato** | APERTO |

---

## 8. Difetti del contesto di lavoro

| # | File | Difetto | Stato |
|---|---|---|---|
| W-1 | `.telemedic/context/GLOSSARIO-TRADUZIONE-EN.md` | **Due sezioni numerate `## 9`**, per scrittura concorrente di più agenti. Un terzo blocco ha preso il numero `## 10`, un quarto il numero `## 18` (che si identifica dalla fonte, non dalla posizione) | APERTO - passata di consolidamento e rinumerazione, da fare **dopo** che tutti gli agenti hanno finito di scrivere |
| W-2 | `scripts/verifica-divergenza-traduzioni.sh` | `SORGENTE="docs"`: lo script **non copre le avvertenze pubbliche alla radice del repository**, che sono nel criterio 1 di `T-06` e nel criterio 8 di `T-01`. Un criterio impegnato senza prova che possa fallire | APERTO - estendere il perimetro dello script |

---

## 9. Perdite di traduzione dichiarate - **non sono difetti**

Si registrano perché un revisore che le incontri non deve riaprirle.

| Dove | Che cosa si perde |
|---|---|
| `09-fondamenti-clinici.md` §9.3, voce `oss(i)-` | In italiano la radice dell'ossigeno, `oss(i)-`, è graficamente vicina a `osseo` e alla radice `oste(o)-` che la stessa tabella registra per l'osso: chi legge deve disambiguare dal contesto. L'inglese `ox(y)-` non ha quella vicinanza. È un fatto della lingua italiana e sparisce necessariamente. **Nota aggiornata il 26 agosto 2026**: la voce italiana era `osse-, ossi-` e la perdita dichiarata era la collisione di due radici in una; ora le due tabelle hanno la stessa struttura e resta la sola vicinanza grafica |
| `09-fondamenti-clinici.md` §9.2, coppia `sub-, sotto-` | Esiste solo perché l'italiano ha forma dotta e forma volgare |
| `11-fondamenti-informatici.md` §7.5 | «incontro clinico» e «contatto clinico» diventano entrambi *encounter*: **l'incoerenza dell'originale sparisce in traduzione**. Va chiusa sull'italiano (T-1) |
| `11-fondamenti-informatici.md` §12.2 | «Registri (*log*)» - l'italiano introduce il termine italiano con la glossa inglese; in inglese la coppia collassa in *Logs* |
| `17-ambiente-di-sviluppo.md` §11.2 | «deployer» e «chi installa» collassano entrambi in *the deployer* |
| `10-percorsi-di-cura-e-sicurezza.md` §6.4 | `segnale d'allarme` → *alarm signal* collide con il significato di IEC 60601-1-8, collisione che l'italiano non ha |

---

## 10. Scelte di forma da non disfare

| Scelta | Dove | Perché |
|---|---|---|
| **Identificatori dei blocchi di codice lasciati in italiano** | tutto il corpus | Un identificatore tradotto non compila. I nomi di evento sono invece tradotti **in prosa e nei diagrammi**, secondo il precedente di `16-architettura-del-progetto.md` EN. Ne consegue che `11 §5.1` dice `ReportSigned` in prosa e `new RefertoFirmato(id)` due righe sotto. **O si lasciano i blocchi interamente in italiano, come ora, o si traducono interamente - e in quel caso la decisione vale per l'intero repository, non per un file** |
| **Ancore interne riscritte sui titoli inglesi** | `18-contribuire-per-area.md`, `20-fonti-primarie.md` | Lasciarle in italiano produrrebbe collegamenti rotti. Eccezione: l'ancora esplicita `{#11-area-conformita}`, che è un identificativo e resta invariata |
| **Ordine alfabetico italiano dei glossari di modulo conservato** | tutti i moduli | Riordinare in inglese romperebbe il confronto riga a riga fra le due lingue |
| **Separatore decimale convertito** (`15,4%` → `15.4%`) | tutto il corpus | È l'**unica** conversione numerica ammessa: le unità non si convertono mai e i valori non si arrotondano |
| **Messaggi di commit d'esempio non tradotti** | `17-ambiente-di-sviluppo.md` | La convenzione del progetto vuole i messaggi in italiano: un esempio tradotto sarebbe contrario alla convenzione che il paragrafo insegna |

---

## 11. Divergenze sul **contratto pubblicato verso gli integratori** - le più gravi del registro

Fonte: `TRAD-15`, confronto fra `10_fondamenti/13-protocolli.md` e l'area `04_protocols/`, già
tradotta e pubblicata. Non sono incoerenze redazionali: sono **due impegni diversi sullo stesso
contratto**, pubblicati insieme. Un integratore che legga il modulo didattico e un integratore che
legga l'area di specifica implementano cose diverse.

### P-1 · Politica di ritentativo dei webhook - contraddizione numerica · APERTO

| Dove | Impegno |
|---|---|
| `10_fondamenti/13-protocolli.md` §6.4, riga 2728 | «Tentativi: **fino a 24 ore complessive**», attesa da 1 s a 6 h, **nessun numero di tentativi** |
| `04_protocols/07-eventi-e-webhook.md` §5.1 (`P-08`), riga 301, e `04_protocols/01 §5` | «**dodici** tentativi, copertura di circa **settantadue ore**», poi coda di scarto |

La riga 474 di `04_protocols/07` costruisce sopra questo numero un'ulteriore affermazione: «un
consumatore irraggiungibile per **settantadue ore** riceve dalla coda di scarto, non dal flusso».
Cambiare il numero tocca quindi anche quella.

### P-2 · Schema di firma dei webhook - contraddizione di sostanza · APERTO

| Dove | Posizione |
|---|---|
| `10_fondamenti/13-protocolli.md` §6.3, elenco «Errori tipici», primo punto | «Firmare con HMAC e un segreto condiviso» è **un errore**; prescrive «firma sempre, con chiave asimmetrica» |
| `04_protocols/07-eventi-e-webhook.md` §4.1 | Lo schema **simmetrico HMAC è il predefinito**, «perché è ciò che l'integratore tipico sa consumare»; l'asimmetrico è raccomandato e obbligatorio solo in contesto pubblico |

**Il modulo didattico qualifica come errore ciò che l'area di specifica adotta come impostazione
predefinita.** Va riformulato uno dei due: o il modulo circoscrive («errore quando serve il non
ripudio»), o l'area cambia il predefinito. Si noti che `V-162` prescrive già che il segreto
condiviso **non sia offerto come modalità predefinita** nel perimetro di `RU-1`
(`09_roadmap/03 §3.7`): la tensione va sciolta con quel vincolo davanti.

### P-3 · Spazio dei nomi dei tipi di evento - prefissi incompatibili · APERTO

| Dove | Forma |
|---|---|
| `10_fondamenti/13-protocolli.md` §6.2 | `it.telemedic.<dominio>.<fatto>.v<N>` - esempio `it.telemedic.session.completed.v1` |
| `04_protocols/07-eventi-e-webhook.md` §2.1 e catalogo §3 | `telemedic.<domain>.<fact>.v<N>` - `telemedic.session.completed.v1` |

Due prefissi incompatibili per lo stesso catalogo pubblico. Un consumatore che filtri sul prefisso
non riceve nulla.

### P-4 · Forma dell'attributo `source` di CloudEvents · APERTO

`13-protocolli.md` §6.2 usa un percorso relativo (`/tenants/asl-nord-01/sessions`);
`04_protocols/07 §2.1` usa un URI assoluto (`https://telemedic.example/tenants/{tenantId}`).
CloudEvents ammette formalmente entrambi (`URI-reference`), ma i due documenti descrivono lo stesso
campo in due modi.

---

## 12. Domini d'esempio non riservati - `esempio.it` · APERTO, e va chiuso **prima** di tradurre `07_integration`

Il corpus usa **due convenzioni** per gli host d'esempio:

- il TLD riservato **`.example`** (RFC 2606), non registrabile - usato in `04_protocols/` e
  `06_security/`: `telemedic.example`, `gestionale.integratore.example`, `idp.integratore.example`,
  `turn.telemedic.example`, `ehr.example`;
- il dominio **`esempio.it`**, che è **registrabile** - 71 occorrenze su 11 host distinti.

| Area | Occorrenze |
|---|---:|
| `07_integration/` | **55** |
| `10_fondamenti/` | 16 |

Host usati: `telemedic.esempio.it` (23), `embed.telemedic.esempio.it` (15),
`api.telemedic.esempio.it` (15), `docs.telemedic.esempio.it` (8), `esempio.it` (3),
`cdn-branding.telemedic.esempio.it` (2), e uno ciascuno per `signaling.`, `gestionale.`, `cdn.`,
`app.`, `anagrafe.`.

**Perché conta più di quanto sembri.** `esempio.it` non è riservato: chiunque può registrarlo. La
concentrazione è in `07_integration/`, che è **l'area che dice a un terzo come integrarsi** - cioè
esattamente il testo da cui si copiano gli host in una configurazione. Un integratore che
copi-incolli manda richieste, e potenzialmente credenziali di prova, a un host controllato da un
terzo. Non è una violazione di `R0` in senso stretto - nessun dato di persona, nessun dominio di
partner reale - ma è la classe di errore che `R0` esiste per prevenire.

Il corpus è anche **internamente incoerente sullo stesso host**: esistono sia
`docs.telemedic.esempio.it` sia `docs.telemedic.example`.

**Sequenza.** La correzione va fatta **prima** di tradurre `07_integration/`: tradurre 55
occorrenze di un valore destinato a cambiare significa rifare il lavoro e, nel frattempo,
pubblicare in inglese lo stesso host registrabile.

---

## 13. Difetti ulteriori da `TRAD-15`

| # | Punto | Difetto | Bersaglio corretto |
|---|---|---|---|
| S-1 | `13-protocolli.md` §4.8 | «**Due** esempi accertati in fase di ricerca `[B7]`» seguito da **quattro** punti | «Quattro esempi», o elenco ridotto |
| S-2 | `13-protocolli.md` §5.5 | «**Tre** campi risolvono problemi reali» seguito da tabella di **quattro** righe | «Quattro campi» |
| S-3 | `13-protocolli.md` §7.1 | Riquadro ASCII disallineato: bordo di **59** trattini, contenuto di **60** caratteri (il riquadro di §1.3 è correttamente 62/62) | **Corretto in traduzione a 60/60**, unica correzione tipografica dell'ondata: riprodurre un disallineamento avrebbe prodotto un difetto di resa senza portare informazione. Da chiudere sull'italiano |
| S-4 | `13-protocolli.md` §5.3 | L'`[NV]` sulla porta 6660 è scritto `**[NV]**` in grassetto invece che a spaziatura fissa, contro la legenda di §0.2 | Uniformare |
| S-5 | `13-protocolli.md` §3.10 | Il blocco `problem+json` accoppia `Content-Language: it-IT` a stringhe `title`/`detail` che il mandato impone di tradurre: **l'esempio è autocontraddittorio in ogni traduzione** | Rimuovere `Content-Language` dall'esempio, o spostare la lingua in un commento |

---

## 14. Difetto **nella traduzione inglese già pubblicata** · APERTO

Fonte: `TRAD-14`. È l'unico difetto del registro che sta nell'inglese e non nell'italiano.

`website/i18n/en/docusaurus-plugin-content-docs/current/06_security/03-protezione-dei-dati.md`,
**riga 157**, rende `il registro degli accessi nella sua conservazione separata` con
«**the access log** in its separate retention», mentre lo stesso file usa **audit trail** in
quattro altri punti e la resa vincolante di `log-TRAD-1 §3.5` è `registro immutabile` →
*immutable audit trail*.

**Correzione**: «the access log in its separate retention» → «the audit trail in its separate
retention». Non richiede alcuna modifica all'italiano: è una resa incoerente, non un difetto
dell'originale.

---

## 15. Divergenze ulteriori da `TRAD-14`

| # | Questione | Posizioni | Stato |
|---|---|---|---|
| V-1 | Nome dell'artefatto VEX (requisito `SEC-044`) | `documento di sfruttabilità` in `10_fondamenti/12 §11.3` contro `dichiarazione di esposizione` in `06_security/07`, già reso *exploitability statement* | APERTO - unificare sull'italiano, poi allineare le due traduzioni |
| V-2 | Nome della funzione di custodia delle chiavi | `custode delle chiavi` in `10_fondamenti/12 §3.6` contro `deposito delle chiavi` in `06_security/03`, già reso *key vault* | APERTO - stesso referente, due parole |
| V-3 | Registro di reticenza sugli enti | `06_security/03 §1` è perifrastico per scelta («l'istituto europeo di normazione delle telecomunicazioni», «l'agenzia nazionale per l'Italia digitale»); `10_fondamenti/12 §1, §4.5, §12.1` **nomina** `ETSI TS 119 312`, `SOG-IS`, `AgID-ACN` | APERTO - non contraddittorio (nominare la fonte non è pubblicare un parametro), ma va deciso se è voluto |

## 16. Difetti ulteriori da `TRAD-14`

| # | Punto | Difetto | Bersaglio corretto |
|---|---|---|---|
| K-1 | `10_fondamenti/12` §3.2, righe 646-647 | «una proprietà pericolosa che vedremo al **§ 3.4**» - §3.4 è *La cifratura autenticata è il minimo*; il riuso del flusso di chiave è al **§ 3.5**, la malleabilità al §3.3 | **§ 3.5** |
| K-2 | `10_fondamenti/12` §9.4, riga 1991 | «L'architettura che soddisfa **i quattro requisiti**» - **nessun antecedente**: il §9.3 elenca *tre* ragioni cumulative e *quattro* fonti, non quattro requisiti | Rinviare alle quattro fonti, o riformulare in «i requisiti del §9.3» |
| K-3 | `10_fondamenti/12` §6.1 punto 2, riga 1221 | «Si applica **alla impronta**» - errore di elisione | `all'impronta` |
| K-4 | `10_fondamenti/12` §1.6, righe 227-234 | I rinvii usano il prefisso `./` mentre tutti gli altri rinvii intra-area del modulo ne sono privi | Uniformare |
| K-5 | `10_fondamenti/12` §1.7, riga «Tracciabilità» | «Registro **append-only**» usa il termine inglese dove §9.4 e tutta l'area usano «a sola aggiunta» | «a sola aggiunta» |
| K-6 | `10_fondamenti/12` §5.3, ultimo capoverso | «delegata al **servizio di identità**» e «del **componente di gestione delle identità** adottato» nella stessa frase | Scegliere una forma |

---

## 17. Ancore rotte nella costruzione inglese · APERTO

Esito di `npm run build` del 26 agosto 2026: **costruzione riuscita** (codice di uscita 0), con
**otto ancore rotte, tutte e sole nella costruzione inglese**. La costruzione italiana è pulita.

| Pagina sorgente (locale EN) | Ancora rotta |
|---|---|
| `adr/limite-dichiarato-di-partecipanti` | `architecture/decisioni-rinviate#c-2--topologia-della-sessione-oltre-due-partecipanti` |
| `architecture/eventi-e-integrazione-interna` | `fondamenti/fondamenti-informatici#5-la-doppia-scrittura-e-loutbox-transazionale` |
| `architecture/modello-di-dominio` | `fondamenti/fondamenti-informatici#8-modellazione-del-tempo-e-dei-dati` |
| `architecture/tracciamento-e-registro-immutabile` | `fondamenti/crittografia-e-sicurezza#5-funzioni-di-hash` |
| `fondamenti/architettura-del-progetto` | `fondamenti/fondamenti-informatici#5-la-doppia-scrittura-e-loutbox-transazionale` |
| idem | `fondamenti/fondamenti-informatici#6-consegna-e-idempotenza` |
| idem | `fondamenti/crittografia-e-sicurezza#5-funzioni-di-hash` |
| idem | `fondamenti/protocolli#7-tempo-reale--scheda-sintetica` |

**Causa.** Tradurre un file ne traduce i titoli e quindi gli *slug*. I collegamenti che altri file
puntano a quelle ancore restano sullo slug italiano. Quattro delle cinque pagine sorgente
appartengono ad aree **non ancora tradotte** (`02_architecture`, `adr`): Docusaurus le serve nella
locale inglese con il contenuto italiano, e da lì puntano a un'ancora che nel frattempo è diventata
inglese.

**Conseguenze operative.** Sette delle otto si chiuderanno da sole quando `02_architecture` e `adr`
saranno tradotte - **a condizione** che chi le traduce usi lo slug **inglese** del bersaglio già
tradotto. La regola è stata aggiunta al runbook (§8). L'ottava, in
`fondamenti/architettura-del-progetto`, è fra due file **entrambi già tradotti** e va corretta ora.

---

## 18. Passata di correzione del 26 agosto 2026 - che cosa è stato chiuso

Quattro decisioni del committente hanno governato la passata:

1. **Fra guida didattica e area di specifica vince `04_protocols`.** L'area di specifica è
   normativa, la guida è didattica - ed è l'unica lettura compatibile con `V-11`, che è un vincolo
   e non può essere contraddetto da un modulo che insegna.
2. **La firma dei webhook è asimmetrica per impostazione predefinita**, con `V-162` a governare.
3. **`esempio.it` sostituito ovunque con il TLD riservato `.example`.**
4. **I contesti delimitati sono tredici**: il gateway terminologico è un contesto.

| Voce | Correzione applicata | File toccati |
|---|---|---|
| §1 A-1 | «The last line of the fourth entry» → «The fourth entry» | `04_protocols/09-tempo-reale.md` EN |
| §14 | «the access log» → «the audit trail» | `06_security/03-protezione-dei-dati.md` EN |
| §2 N-1 | Riga della L. 199/2025 riscritta per dare conto di **entrambe** le disposizioni, con l'attribuzione corretta di ciascuna | `20-fonti-primarie.md` IT + EN |
| §2 N-2 | «Legge 31 dicembre 2025, n. 200» → «D.L. 31 dicembre 2025, n. 200, convertito con modificazioni dalla legge 27 febbraio 2026, n. 26 (Milleproroghe)», con il contenuto allineato all'uso che ne fa il modulo 01 | `20-fonti-primarie.md` IT + EN |
| §17 | Cinque ancore portate agli slug inglesi | `16-architettura-del-progetto.md` EN |
| §17 | Ancora rotta **anche in italiano**: `#c-2--topologia-della-sessione-oltre-due-partecipanti` → `#c-2--introdurre-un-componente-che-termina-la-cifratura-per-aumentare-i-partecipanti` | `adr/0028-limite-dichiarato-di-partecipanti.md` |
| §11 P-1 | «Fino a 24 ore complessive» → «Dodici, per una copertura di circa settantadue ore (`P-08`)» | `13-protocolli.md` IT + EN |
| §11 P-2 | Firma asimmetrica predefinita; lo schema simmetrico resta **opzione dichiarata per destinazione**, con il costo - la rinuncia al non ripudio - scritto e da registrare insieme alla configurazione | `04_protocols/07-eventi-e-webhook.md` IT + EN |
| §11 P-3 | `it.telemedic.<dominio>.<fatto>.v<N>` → `telemedic.<dominio>.<fatto>.v<N>` | `13-protocolli.md` IT + EN |
| §11 P-4 | `"source"` da percorso relativo a URI assoluto | `13-protocolli.md` IT + EN |
| §5 C-5 | `Example Publisher` → «un valore segnaposto»: reticenza allineata a `04_protocols/02 §9.2` | `06-fhir-da-zero.md` IT + EN |
| §5 C-6 | `contentType` ora dichiara «negoziato a runtime e mai presunto», con rinvio a `V-11` | `06-fhir-da-zero.md` IT + EN |
| §3 R-12 | Il codice per `If-Match` mancante rinvia a `P-02` e a `428 Precondition Required` | `06-fhir-da-zero.md` IT + EN |
| §5 C-1 | Gateway terminologico spostato da `platform/` a `contexts/terminology/`; **tredici contesti** in entrambi gli alberi | `17-ambiente-di-sviluppo.md` IT + EN, `18-contribuire-per-area.md` IT + EN, `01_technical/02-backend.md` |
| §12 | 71 occorrenze di `esempio.it` su 11 host → TLD riservato `.example`. `docs.telemedic.esempio.it` e `docs.telemedic.example` unificati | 10 file, IT + EN |
| §8 W-1 | Collisione di numerazione risolta: i blocchi di contributo si intitolano `Modulo NN - …` e si identificano dalla fonte, non dalla posizione. Convenzione dichiarata in testa al file | `GLOSSARIO-TRADUZIONE-EN.md` |
| §8 W-2 | Il controllo di divergenza copre ora le avvertenze pubbliche alla radice, **in sola segnalazione**, con la data dichiarata in cui diventa bloccante (12 settembre 2026, scadenza di `T-01`), secondo il criterio 4 di `T-03` | `scripts/verifica-divergenza-traduzioni.sh` |

**Esito dei gate.** `npm run build`: **riuscita**, ancore rotte da 5 a 3. Le tre residue sono in
`02_architecture`, area non tradotta, e si chiuderanno traducendola con lo slug inglese del
bersaglio. `verifica-divergenza-traduzioni.sh`: **Assenti ed esigiti: 0**.

**Residuo dichiarato.** `06_security/02-identita-e-accessi.md` resta segnalato divergente: la
correzione italiana era ortografica (`sul obiettivo` → `sull'obiettivo`) e **in inglese non c'è
nulla da cambiare**. Il controllo confronta le date di commit, non il contenuto, e lo segnalerà
finché il file inglese non viene toccato. Non è un difetto di contenuto.

**Restano aperte** le voci che richiedono lavoro redazionale e non una decisione: i rinvii
incrociati di §3.1 e §3.2, le enumerazioni di §4, le incoerenze terminologiche di §6, i difetti
`S-1`…`S-5` di §13 e `K-1`…`K-6` di §16, e le divergenze `V-1`…`V-3` di §15.

---

## 19. Seconda passata del 26 agosto 2026 - quattro agenti in parallelo, partizionati per file

La partizione è stata **per file, non per famiglia di difetto**, perché due agenti che toccano lo
stesso documento si sovrascrivono a vicenda (`W-1`). Ogni mandato portava alla lettera la regola
che governa la passata: *ogni correzione si applica all'italiano e all'inglese nello stesso
passaggio*.

### 19.1 Voci chiuse

| Voce | Decisione | Ragione, in una riga |
|---|---|---|
| `R-1`…`R-6` | Sei rinvii riassegnati in `10-percorsi-di-cura-e-sicurezza.md` | Lo scarto sistematico +1 era reale; **`§ 9.9` non esisteva**: il §9 finisce a 9.8 |
| `R-7`, `R-8` | `§8`→`§9` e `§6`→`§8.2` in `08_compliance/08` | Verificati sul contenuto delle sezioni bersaglio |
| `R-9` | `§7.8`→`§7.7` in `11-fondamenti-informatici.md` | §7.7 è la mappa dei contesti e contiene il livello anticorruzione; confermato da §14.3 |
| `R-10` | `§8.4`→`§8.3 e §8.6` | Il problema di licenza dell'AIC è ATC, che sta in regime D nella tabella di §8.3 |
| `R-11` | `[03 §4]`→`[03 §4.1]` per `V-174` | Esteso ai due file che il registro non elencava: `08_compliance/02` e `06` |
| `E-1` | Riga «evento avverso prevenibile» **rimossa**, non aggiunta al conto | Il termine non ricorre altrove nel corpus e il titolo di sezione ne nomina tre |
| `E-2`…`E-11` | Enumerazioni allineate al testo | Dove il numero era giusto e la reticenza voluta (`E-6`, `E-11`) è stata **esplicitata la ragione**, non cambiato il numero |
| `C-2` | Denominazione unica per il modulo 18: «Contribuire, area per area» | Le denominazioni in circolazione erano **quattro**, non tre; i rinvii da allineare **sei**, non quattro |
| `C-3` | Forma lunga del modulo 10 ovunque | Esteso a `19-glossario`, `14-flussi-funzionali`, `08_compliance/05`: il registro lo confinava al modulo 18 |
| `C-7` | `rapporto periodico di aggiornamento sulla sicurezza` | La forma breve era anche in `09 §8.4` e nel `description` del frontmatter di `08` |
| `C-8` | **`Q-274` chiusa come falsa**, non girata a `ORCH` | `02 §12` e `09 §10` la dichiarano già risolta da `D55` |
| `C-9` | `Q-179` riformulata: le date sono pianificazione interna (`D57`) | La cautela **si rafforza**: una data che il progetto pianifica per sé si legge come impegno più facilmente di una attribuita ad altri |
| `C-10` | «primo»→«**secondo** punto di decisione irreversibile» | Il primo resta impregiudicato, ed è detto |
| `D-1` | `sostituito`→`superseded` come valore di `DocumentState` | L'inglese era già corretto; chiusa la divergenza sull'italiano |
| `K-1`…`K-6` | Rinvii, antecedenti, elisione, prefissi di percorso, anglismo, prodotto di federazione | Vedi `19.3` per `K-6` |
| `S-1`…`S-5` | Enumerazioni, riquadro ASCII a 60/60, `[NV]` a spaziatura fissa, `Content-Language` | `S-4` era anche in inglese: il registro lo dava per solo italiano |
| `T-1`…`T-22` | Incoerenze terminologiche interne all'italiano | `T-22` era **già chiuso** da un commit precedente in entrambe le lingue |
| `V-1`, `V-2` | `dichiarazione di esposizione`; `deposito delle chiavi` | Vedi `19.3` |
| `N-A`…`N-D` | Difetti trovati durante la correzione, chiusi contestualmente | `N-A` eccedeva il mandato ed è stato **tenuto**: correggere quattro istanze su sei della stessa convenzione lascia il file incoerente con sé stesso |

### 19.2 Errori trovati **nel registro** - il registro è a sua volta un documento fallibile

1. **`T-8` sottostimava il difetto**: «quattro voci a doppia radice con un solo esempio», sono **sei**. Mancavano `derm(o)-` e `glic(o)-`.
2. **`C-2` attribuiva a `CONTRIBUTING.md` riga 168 una denominazione italiana.** Quella riga sta nel **blocco inglese** del file. Le denominazioni erano quattro, e la quarta divergeva dalla terza pur essendo nella stessa lingua.
3. **`C-2` ometteva la coppia inglese** di `17-ambiente-di-sviluppo.md`, e dava un numero di riga superato dalle correzioni della mattina.
4. **`T-13` poggiava su una premessa falsa.** Dichiarava la tabella di `08_compliance/07` «fuori ordine rispetto alle altre dell'area». Verificate tutte le tabelle omologhe: **nessuna** è ordinata per identificativo. Riordinarla l'avrebbe resa l'unica anomala. È stato dichiarato il criterio invece di riordinare.
5. **`S-4` dato per difetto solo italiano**: l'inglese aveva la stessa forma `**[NV]**`.
6. **`C-7`, `K-5`, `T-7`, `C-3`, `R-11`, `T-14` avevano perimetro incompleto**: ciascuna ricorreva in punti che il registro non elencava.
7. **`D-1` e `T-19` davano riferimenti di sezione sbagliati** (`§14.7` e `§6.1/§13.2`): in quei paragrafi il termine non compare.
8. **`E-3` non segnalava che l'originale sbaglia entrambi i numeri** del rapporto: «tre su otto» contro sette profili di cui quattro in Trial Implementation.
9. **`§9, voce `osse-, ossi-`** era resa obsoleta dalla correzione di `T-8` ed è stata **riscritta, non rimossa**: `oss(i)-` si realizza anche come `oss-` in `ipossia`, che resta graficamente vicino a `osseo` e a `oste(o)-`. La perdita è più stretta di prima, non nulla.

### 19.3 Le due decisioni di merito della passata

**`V-2` - `custode delle chiavi` e `deposito delle chiavi` sono lo stesso componente.**
`GLOSSARIO-TRADUZIONE-EN.md` prescriveva di conservare la distinzione; il registro chiedeva di
unificare. Il conflitto è stato sciolto **alla fonte**: `06_security/03` registra fra le questioni
aperte «collocazione del **deposito delle chiavi** e sua interfaccia: componente proprio
dell'installazione o servizio dell'infrastruttura», che è il medesimo referente che il modulo 12
chiamava custode. Il glossario aveva ragione che **una** distinzione esiste, ma la tracciava nel
punto sbagliato: non è fra due parole, è fra **il componente e la persona**. Dove il referente è
umano - separazione dei compiti, amministratore della base dati - l'italiano dice ora **«chi
custodisce le chiavi»**, mai «deposito». Il glossario è stato riscritto di conseguenza.

**`T-15` - gli enti normatori si nominano.** Il modulo 20 designava per perifrasi («l'autorità
nazionale», «l'agenzia nazionale») enti che `10_fondamenti/12` **nomina `ACN` e `AgID` sugli
identici atti**. La reticenza non era quindi una politica del progetto ma una divergenza fra due
moduli della stessa guida. Il vincolo di reticenza protegge prodotti, aziende e terminologie sotto
licenza: un ente pubblico normatore non è nessuna delle tre, e il modulo 20 esiste perché un
lettore raggiunga l'atto alla fonte primaria - l'autorità emanante è parte degli estremi quanto il
numero e la data. Convenzione dichiarata in `20 §1`. **Ciò che la decisione non tocca**: le due
determinazioni del 2026 restano prive di sigla, perché l'originale non ne designava alcuna, e
aggiungerla sarebbe completare un estremo, non uniformare una designazione già presente.

### 19.4 Conseguenze aperte fuori dai perimetri, chiuse nella passata di coda

`19-glossario.md` conservava le ultime occorrenze delle grafie scartate da `T-7` - e in inglese
`idempotence` ricorreva in **cinque punti di prosa** oltre alle due righe di glossario. Chiuse.
Chiuse anche: `V-174` nei due file di `08_compliance` fuori mandato; l'ultima occorrenza del
prodotto di federazione chiamato «servizio di identità» in `05 §…`; la concordanza «consultata»
in `07-fse-e-infrastrutture-nazionali.md`, da cui il modulo 20 aveva **ereditato** il vizio
copiando la frase; e la divergenza fra i due moduli sul nome del presidio del forum, ora «gruppo
di lavoro SPID» in entrambi.

**`T-3` era la punta di una divergenza di corpus, non un refuso.** L'anglismo `deployer`
sopravviveva in **22 punti italiani su otto aree** contro 192 «chi installa». Chiusi tutti. In
**inglese** `deployer` è invece la resa **corretta e consolidata** - 116 occorrenze - e non è
stata toccata: è il caso, previsto dal runbook §9.5, in cui un anglismo è difetto in una lingua e
forma giusta nell'altra. Chiuso anche l'effetto collaterale: il controllo `G12` si chiamava
«Profilo di produzione» in `01_technical/09` e «Profilo di esercizio» nel modulo 17 - verificati
tutti i controlli `G1`-`G13`, era l'unica divergenza di nome. E la procedura di verifica ha ora
**un nome solo e non ambiguo** in tutti e cinque i documenti che la citano: **«verifica a cura di
chi installa»**, forma già attestata in `05_domain/07`, `07_integration/09` e `20-fonti-primarie`.
Il precedente «verifica lato deployer» era anglismo; l'intermedio «verifica **di** chi installa»
aveva un genitivo ambiguo - si leggeva tanto come verifica *svolta da* quanto come verifica *su*
chi installa - su un nome che compare come criterio di traguardo.

### 19.5 Che cosa resta aperto

| Voce | Perché resta |
|---|---|
| `N-3` | Estremo incompleto: la `Determinazione n. 127437 del 2026` non ha il giorno. Va verificato alla fonte primaria, non dedotto |
| `N-B` | La voce `pne-, -pnea` è stata spostata fra i suffissi come `-pnea`; resta da decidere se `pne-` come radice autonoma serva, dato che `pneum(o)-` è già voce a sé |
| `N-C` | Il latinismo grafico `broncho-` è stato corretto in italiano; **in inglese la forma resta legittima** e non è stata toccata |
| `17 §4.2` contro `D61` | L'albero degli schemi mostra **sei** contesti per tenant, `D61` ne fissa **tredici**. La lista è esemplificativa ma non lo dichiara: chi conta gli schemi conclude che i contesti sono sei. La correzione di `E-10` è fedele al testo di oggi e **diventerà sbagliata** quando §4.2 sarà completato |
| Omonimia `ACN` | Ora che il modulo 20 nomina `ACN` in nove punti, l'avvertenza del modulo 01 (`ACN` è anche l'accordo collettivo nazionale) merita una voce di glossario |
| `§17` ancore | Le tre ancore rotte residue sono in `02_architecture`, area non tradotta. Si chiudono traducendola con lo slug inglese del bersaglio |
| `06_security/10`, `08_compliance/03` | **Divergenze apparenti dichiarate.** L'unica modifica italiana è `deployer` → `chi installa`, e in inglese `deployer` è la resa corretta: **non c'è nulla da cambiare**. Il controllo li segnalerà perché confronta le date di commit. Non sono difetti di contenuto |
| `06_security/02` | Resta segnalato divergente per data di commit. **Non è un difetto di contenuto**: la correzione italiana era ortografica e in inglese non c'è nulla da cambiare |
