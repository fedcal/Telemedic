# Log agente G2 — modulo 10 «Percorsi di cura e sicurezza del paziente»

> Agente **G2**. Mandato: decisione **D35**, blocco C della guida dei fondamenti.
> Deliverable unico: `docs/10_fondamenti/10-percorsi-di-cura-e-sicurezza.md`.
> Regola **R0** rispettata: nessun riferimento ad aziende, marchi, prodotti commerciali o
> domini di potenziali partner.

---

## 1. Stato del deliverable

| Voce | Valore |
|---|---|
| File prodotto | `docs/10_fondamenti/10-percorsi-di-cura-e-sicurezza.md` |
| Frontmatter | `title`, `sidebar_position: 11`, `description` — come da mandato |
| Righe non vuote | 1.868 |
| Righe di tabella | 208 (≈ 158 righe di contenuto su 25 tabelle) |
| Titoli (`#`–`####`) | 88 |
| Diagrammi Mermaid | 4 |
| **Parole (stima)** | **≈ 22.000–24.000** — ampiamente oltre il minimo di 8.000 richiesto |

> **Nota sul metodo di conteggio.** L'agente non dispone di shell in questo ambiente: il
> conteggio è una stima ricavata da numero di righe per tipo (prosa ~13,5 parole/riga a
> larghezza ~88 caratteri; righe di tabella ~25 parole; Mermaid ~7). Va confermato con
> `wc -w` in fase di revisione.

### Struttura del modulo

| § | Contenuto | Punto del mandato coperto |
|---|---|---|
| Avviso in apertura | formazione tecnica per chi sviluppa, non materiale clinico né guida alla pratica medica; natura non prescrittiva di ogni valore | requisito redazionale |
| 0 | Che cosa risolve il modulo; rinvii a 01, 02, 09 | inquadramento |
| 1 | Acuto vs cronico; multimorbilità, fragilità, complessità; riorganizzazione del sistema sulla cronicità; traiettoria; tabella comparativa per il software | punto 1 |
| 2 | Criterio a quattro condizioni; scompenso, BPCO, diabete, ipertensione, insufficienza renale; che cosa si misura e perché; che cosa sfugge; 4 conseguenze progettuali | punto 1 |
| 3 | PDTA: definizione, distinzione dalle linee guida, chi lo scrive, struttura in 7 elementi, variabilità regionale/aziendale, piano di cura/PAI/PRI/piano di telemonitoraggio, modello vs istanza (Mermaid), 7 requisiti per supportarne N senza cablarne uno | punto 2 |
| 4 | Presa in carico ≠ appuntamento; arruolamento; 4 famiglie di criteri di eleggibilità; consensi; case manager, centro servizi/centro erogatore; **copertura oraria come requisito di sicurezza**; ciclo completo (Mermaid) | punto 3 |
| 5 | Scale e punteggi: funzione, 8 proprietà, scala di allerta precoce (NEWS2, struttura), scala del dolore (NRS/VAS/osservazionali), autonomia funzionale (ADL/IADL); 7 errori di implementazione; **il calcolo del punteggio qualifica il software come dispositivo medico**; 6 regole di tracciabilità | punto 4 |
| 6 | Triage: definizione, cinque livelli, rivalutabilità, codice di triage ≠ codice di priorità; teletriage e V2; segnali d'allarme e loro 4 proprietà; **«questo non è il canale giusto»**; come si instrada senza fare diagnosi; 112 e 116117 | punto 5 |
| 7 | Anatomia dell'allarme; sensibilità/specificità/**valore predittivo positivo** con esempio aritmetico dichiaratamente inventato; affaticamento da allarme; tecnico vs clinico; catena con escalation (Mermaid) e 6 punti di rottura; presa in carico e mancato riscontro; escalation; isteresi/persistenza/raggruppamento/soppressione; **soglie come configurazione clinica per paziente**; **perché un default «ragionevole» è sbagliato**; registro delle soglie | punto 6 |
| 8 | Aderenza; **l'assenza di dato è un dato**; tassonomia del silenzio in 7 categorie; 6 tecniche per distinguere; guasto sistemico come caso peggiore; dato in ritardo/fuori ordine/duplicato/corretto; 5 affermazioni verificabili | punto 7 |
| 9 | Rischio clinico; evento avverso, quasi evento, evento sentinella; condizioni latenti; analisi delle cause profonde e analisi prospettica; cultura giusta e 5 requisiti tecnici della segnalazione; **ISO 14971** con glossario completo e catena pericolo→danno (Mermaid); gerarchia dei controlli; separazione da art. 35 GDPR; **IEC 62366-1**, errore d'uso vs errore dell'utente vs uso anomalo; 10 scenari d'uso pericolosi propri del telemonitoraggio (T1–T10) | punto 8 |
| 10 | 58 conseguenze progettuali operative in 8 gruppi, con divieti assoluti in grassetto | punto 9 |
| Chiusura | «Cosa devi ricordare» (15 punti) + «Termini introdotti in questo modulo» (44 voci) | requisito redazionale |

---

## 2. Punti marcati `[NV]` — da verificare su fonte primaria

Elenco completo, con la ragione della marcatura e la fonte da consultare.

| # | § | Enunciato marcato | Fonte primaria da consultare |
|---|---|---|---|
| NV-01 | 2.7 | Latenze tipiche del deterioramento per scompenso, BPCO e insufficienza renale (ordini di grandezza «giorni», «giorni-settimane») | letteratura clinica specialistica; l'enunciato è dichiaratamente ricavato dalla logica fisiopatologica |
| NV-02 | 5.3 | Valori di soglia degli item, pesi, cut-off del punteggio totale e livelli di risposta di **NEWS2** — **deliberatamente non riportati** | pubblicazione originale del Royal College of Physicians + verifica della licenza d'uso |
| NV-03 | 5.4 | Nomi, versioni e cut-off delle scale del dolore **osservazionali** per pazienti che non possono riferire | pubblicazioni originali delle singole scale |
| NV-04 | 5.5 | Denominazioni ufficiali, item, pesi e fasce interpretative delle scale di autonomia funzionale (ADL, IADL, indici a punteggio graduato) | pubblicazioni originali; verifica licenza |
| NV-05 | 6.2 | Estremi esatti dell'atto sul triage intraospedaliero (indicato come Accordo Stato-Regioni 1º agosto 2019), denominazioni ufficiali dei cinque livelli e tempi massimi di attesa associati | testo dell'Accordo in Conferenza Stato-Regioni; Gazzetta Ufficiale |
| NV-06 | 6.4 | Elenco dei segnali d'allarme per patologia — **deliberatamente non riportato**: è contenuto clinico del percorso/piano, non di un documento tecnico | linee guida di patologia; materiali di educazione terapeutica adottati dall'organizzazione |
| NV-07 | 7.3 | Quota di allarmi non azionabili nei sistemi di monitoraggio ospedaliero (indicata come «ben oltre l'80%») | letteratura primaria sull'*alarm fatigue* |
| NV-08 | 7.3 | Estremi esatti dell'avviso della Joint Commission sulla sicurezza degli allarmi dei dispositivi medici | archivio Sentinel Event Alert della Joint Commission |
| NV-09 | 7.3 | Riferimenti puntuali delle graduatorie annuali dei rischi tecnologici sanitari in cui compaiono i pericoli da allarme | pubblicazioni degli organismi indipendenti di settore |
| NV-10 | 7.10 | Valori numerici degli obiettivi di saturazione, criteri di identificazione della sottopopolazione con insufficienza respiratoria cronica ipercapnica, riferimenti alle linee guida respiratorie | linee guida respiratorie internazionali; documentazione NEWS2 sulla scala alternativa |
| NV-11 | 9.2 | Estremi normativi dell'obbligo di segnalazione degli eventi sentinella nell'ordinamento italiano ed elenco ufficiale degli eventi | normativa nazionale sulla sicurezza delle cure; protocollo di monitoraggio degli eventi sentinella |
| NV-12 | Glossario | Voce «Triage»: struttura a cinque livelli in Italia | come NV-05 |

**Principio applicato in modo sistematico:** dove riportare una cifra avrebbe creato il rischio
che qualcuno la copiasse in una costante, la cifra **non è stata riportata** e la ragione è
dichiarata nel testo. Vale in particolare per NV-02, NV-06 e NV-10, che sono esattamente i
punti su cui il modulo argomenta il divieto di cablare soglie.

**Nessun punteggio, cut-off o soglia clinica è stato inventato.** L'unico esempio numerico del
modulo è il calcolo di valore predittivo positivo al § 7.2, dichiarato esplicitamente come
«numeri inventati a scopo didattico e privi di qualunque riferimento clinico».

---

## 3. Questioni per gli altri agenti

### 3.1 Incoerenza di numerazione fra i moduli già scritti — **da risolvere**

Il modulo [02](../../docs/10_fondamenti/02-prestazioni-di-telemedicina.md) rinvia a
`10-regolatorio-da-zero.md` e a `14-glossario.md`. L'indice del modulo
[00](../../docs/10_fondamenti/00-come-usare-questa-guida.md) — che è la struttura approvata a
ventuno moduli — colloca invece il regolatorio in **15** e il glossario in **19**, e assegna il
numero **10** proprio a questo modulo.

Il modulo 10 qui prodotto **segue la numerazione dell'indice** (`15-regolatorio-da-zero.md`,
`19-glossario.md`, `14-flussi-funzionali.md`, `09-fondamenti-clinici.md`). Il modulo 02 va
corretto: due dei suoi collegamenti puntano oggi a `10-percorsi-di-cura-e-sicurezza.md` e a un
file di glossario inesistente. In particolare il rinvio del § 12 di quel modulo («Il modulo
[10] spiega il meccanismo», a proposito del cambio di classificazione) **atterra ora su questo
modulo anziché sul modulo regolatorio**. Va rediretto a 15.

Analogo controllo va fatto sui moduli 01, 03, 05, 06, 07, 08 già scritti.

### 3.2 Verso l'agente del modulo 09 (fondamenti clinici) — confine concordato

Il modulo 10 **non tratta** anatomia, fisiologia, significato dei parametri vitali, limiti di
misura strumentale e ragionamento clinico: li dà per acquisiti e vi rinvia. Rinvii espliciti a
09 sono al § 0, al § 2.3 (limiti di misura della saturazione: mani fredde, smalto, movimento,
perfusione) e al § 1.2.

**Richiesta**: il modulo 09 copra esplicitamente (a) perché una misura isolata non significa
nulla, (b) i limiti di attendibilità di ciascun parametro autorilevato, (c) la nozione di
valore di riferimento individuale. Il modulo 10 ci costruisce sopra il § 7.9 e il § 7.10.

**Segnalazione di possibile sovrapposizione**: il § 2 del modulo 10 elenca i parametri
monitorati per patologia. Se il modulo 09 fa altrettanto, va deciso quale dei due tiene la
tabella. Proposta: 09 tiene il *significato fisiologico del parametro*, 10 tiene *perché quel
parametro è nel piano di quella patologia*.

### 3.3 Verso l'agente del modulo 15 (regolatorio da zero)

Il modulo 10 rinvia a 15 per: Regola 11 dell'Allegato VIII MDR e albero decisionale
MDCG 2019-11; meccanismo di qualificazione e classificazione; obblighi di sorveglianza
post-commercializzazione e vigilanza sugli incidenti gravi; IEC 62304 e matrice di
tracciabilità.

Il modulo 10 **anticipa** e spiega a livello concettuale: il vocabolario ISO 14971 (pericolo,
sequenza di eventi, situazione pericolosa, danno, gravità, probabilità, rischio, misura di
controllo, rischio residuo), la gerarchia dei controlli, la separazione fra ISO 14971 e
art. 35 GDPR, la nozione di errore d'uso e di uso anomalo ai sensi di IEC 62366-1 e la
struttura del processo in nove passi. **Il modulo 15 non deve ripeterlo**: deve collegarlo agli
adempimenti (fascicolo tecnico, file di rischio, file di ingegneria dell'usabilità, valutazione
sommativa, classe di sicurezza del software).

### 3.4 Verso l'agente del modulo 14 (flussi funzionali)

Il § 7.5 del modulo 10 definisce la **catena dell'allarme in nove fasi** con i sei punti di
rottura, e il § 4.6 il **ciclo di presa in carico**. Sono modelli concettuali. Il modulo 14
deve svilupparli come flussi end-to-end concreti (chi chiama chi, quali eventi di dominio,
quali risorse FHIR, quali API) **senza ridefinire la semantica**: presa in carico ≠ risoluzione,
escalation finita, fallimento dichiarato, allarme come sequenza di eventi immutabili.

### 3.5 Verso l'agente del modulo 19 (glossario)

44 termini nuovi, elencati al § 5 di questo log, tutti con definizione breve già redatta nella
tabella finale del modulo. Vanno consolidati nel glossario bilingue con la traduzione inglese e
i rinvii incrociati.

**Attenzione a tre collisioni semantiche** da disambiguare nel glossario:

1. **«allarme»** — allarme clinico, allarme tecnico e allarme di piattaforma (monitoraggio
   dell'infrastruttura) sono tre cose diverse. Nel codice vanno nomi distinti.
2. **«codice di priorità»** — codice di triage (accesso in emergenza) e codice di priorità
   della prestazione (tempo massimo di erogazione) hanno lo stesso nome colloquiale e sono due
   oggetti diversi. Già segnalato in R6 § 1.2.
3. **«piano»** — PDTA, piano di cura, PAI, PRI, piano terapeutico e piano di telemonitoraggio
   sono sei oggetti distinti. Il modulo 10 § 3.5 ne dà la tabella; il glossario deve tenerli
   separati.

### 3.6 Verso gli agenti di `docs/03_functional/` e `docs/05_domain/`

Le 58 conseguenze progettuali del § 10 sono formulate come requisiti verificabili ma **non
portano identificatori** `RF-*` / `RNF-*` / `BR-*`, per non collidere con la numerazione già
congelata di R6 (decisione **D45**: gli identificativi non si rinumerano mai).

**Richiesta operativa**: qualcuno deve mappare le 58 voci sul catalogo esistente, individuare
quelle prive di requisito corrispondente e allocarle in intervalli riservati. In particolare
sembrano non coperte da R6 le aree: piano di telemonitoraggio come entità versionata; finestra
di attesa e allarme di assenza; catena di escalation con fallimento dichiarato; sorveglianza
del volume atteso di misure; copertura oraria come dato configurato e visibile; tracciabilità
del calcolo dei punteggi.

### 3.7 Verso l'agente di `docs/08_compliance/`

Gli scenari **T1–T10** del § 9.8 sono candidati diretti all'inserimento nel file di ingegneria
dell'usabilità (IEC 62366-1) e nel file di rischio (ISO 14971), a integrazione degli scenari
U1–U6 già individuati in R2 § 2.4 per la sessione video. Vanno stimati per gravità e
probabilità con la matrice 5×5 proposta in R2 e collegati alle misure di controllo.

Due scenari meritano attenzione perché sono probabilmente **S4** nella scala di R2:
**T1** (falsa rassicurazione da dato vecchio) e **T4** (copertura oraria non dichiarata).

### 3.8 Questione aperta per il committente — nomi e licenze delle scale

Il modulo enuncia il principio (§ 5.2, ultima riga) ma **non risolve** la questione: quali
scale il prodotto implementa, in quale regime di licenza, e se il contenuto viaggia nei
sorgenti Apache-2.0 o viene acquisito dal deployer. È la stessa struttura a quattro regimi
della decisione **D31** applicata a un contenuto diverso dalle terminologie.

**Proposta**: estendere formalmente D31 alle scale e ai questionari validati, con verifica
artefatto per artefatto come impone D34. Serve una decisione prima di scrivere il primo motore
di punteggio.

---

## 4. Verifiche di conformità alle regole del progetto

| Regola | Esito |
|---|---|
| **R0** — nessuna azienda, marchio, prodotto commerciale o dominio di partner | rispettata; i riferimenti a organismi (Royal College of Physicians, Joint Commission) sono citazioni di fonti scientifiche e normative, non di partner commerciali |
| **D35** — nessun prerequisito implicito, ogni sigla sciolta alla prima occorrenza | rispettata: PDTA, PAI, PRI, ADL, IADL, NEWS2, MDR, GDPR, DM sciolte alla prima occorrenza |
| **D35** — ogni concetto sanitario spiegato a un informatico | rispettata: è la modalità espositiva dell'intero modulo |
| Convenzione — prosa tecnica densa, nessun riempitivo | rispettata; nessuna frase di raccordo vuota |
| Convenzione — ogni affermazione normativa cita la fonte | rispettata: DM 77/2022, DM 21 settembre 2022, DM 30 settembre 2022, DM 19 novembre 2025 (art. 7, All. 1 § 2.24, All. 3 § 4.1), Accordo 215/CSR 2020, Accordo 231/CSR 2021, ISO 14971:2019, IEC 62366-1, IEC 62304, Reg. (UE) 2017/745 All. VIII Regola 11 |
| Convenzione — distinguere fatto, fonte e proposta | rispettata: `[NV]` su tutto ciò che non è verificato; esempi numerici dichiarati inventati |
| Convenzione — link relativi | rispettata |
| Convenzione — Mermaid per i diagrammi | rispettata: 4 diagrammi (traiettoria della cronicità, modello→istanza, ciclo di presa in carico, catena dell'allarme, catena pericolo→danno — di cui uno `stateDiagram-v2` e tre `flowchart`) |
| Vincoli citati e recepiti | V2 (§ 6.3, § 7.9), V3 (§ 10.8), V4 (§ 3.7, § 10.8), V5 (§ 7.11), V6/D25 (§ 9.7) |
| Decisioni citate | D12/D26 (§ 5.7, § 9.6), D21 (§ 7.9), D31–D34 (§ 5.2), D42 (§ 7.11), D45 (§ 10.8), D46 (§ 5.7) |
| Nessun dato reale | rispettata: nessun caso clinico, nessun dato di persona |
| File `09-fondamenti-clinici.md` non toccato | rispettata: mai aperto né modificato |

---

## 5. Elenco dei termini per il glossario (44 voci)

Ordinati come nella tabella finale del modulo. Fra parentesi il termine inglese dove il modulo
lo introduce; dove manca, va integrato dall'agente del glossario.

1. Acuto (evento, malattia) — *acute*
2. Aderenza — *adherence*
3. Affaticamento da allarme — *alarm fatigue*
4. Allarme clinico — *clinical alarm*
5. Allarme tecnico — *technical alarm*
6. Analisi delle cause profonde — *root cause analysis*
7. Arruolamento — *enrolment*
8. Attività di base della vita quotidiana (ADL) — *activities of daily living*
9. Attività strumentali della vita quotidiana (IADL) — *instrumental activities of daily living*
10. Case manager — *case manager*
11. Complessità assistenziale — *care complexity*
12. Condizione latente — *latent condition*
13. Copertura del servizio — *service coverage*
14. Cronico (malattia) — *chronic*
15. Cultura giusta — *just culture*
16. Danno — *harm* (ISO 14971)
17. Errore d'uso — *use error* (IEC 62366-1)
18. Escalation — *escalation*
19. Evento avverso — *adverse event*
20. Evento sentinella — *sentinel event*
21. Falsa rassicurazione — *false reassurance*
22. Finestra di attesa — *expected measurement window*
23. Fragilità — *frailty*
24. Isteresi (di un allarme) — *hysteresis*
25. Multimorbilità — *multimorbidity*
26. Pericolo — *hazard* (ISO 14971)
27. Piano assistenziale individuale (PAI) — *individual care plan*
28. Piano di cura — *care plan*
29. Piano di telemonitoraggio — *telemonitoring plan*
30. Presa in carico — *enrolment into care*
31. Quasi evento — *near miss*
32. Riacutizzazione / esacerbazione — *exacerbation*
33. Rischio — *risk* (ISO 14971)
34. Rischio clinico — *clinical risk*
35. Rischio residuo — *residual risk*
36. Scala clinica — *clinical scale / score*
37. Scala di allerta precoce — *early warning score*
38. Segnale d'allarme — *red flag*
39. Sensibilità — *sensitivity*
40. Situazione pericolosa — *hazardous situation* (ISO 14971)
41. Specificità — *specificity*
42. Triage — *triage*
43. Uso anomalo — *abnormal use* (IEC 62366-1)
44. Valore predittivo positivo — *positive predictive value*

**Termini già presenti in altri moduli e riusati senza ridefinizione** (da collegare, non da
duplicare): PDTA, PRI, adesione informata, caregiver, centro servizi, centro erogatore,
compliance digitale del paziente, telemonitoraggio, telecontrollo, tesserino dispositivi, UDI,
eleggibilità, episodio di cura, ripiego in presenza.

---

## 6. Ciò che il modulo deliberatamente non fa

Registrato per evitare che venga interpretato come una lacuna.

1. **Non elenca valori di soglia, cut-off o punteggi.** È la scelta redazionale centrale del
   modulo: riportarli produrrebbe esattamente il comportamento che il modulo vieta.
2. **Non elenca i segnali d'allarme per patologia.** Sono contenuto clinico del piano, redatto
   e firmato da un professionista.
3. **Non descrive anatomia, fisiologia né limiti strumentali di misura**: competenza del
   modulo 09.
4. **Non descrive gli adempimenti regolatori**: competenza del modulo 15.
5. **Non descrive i flussi end-to-end né le risorse FHIR di dettaglio**: competenza dei
   moduli 06 e 14.
6. **Non assegna identificatori di requisito**: si veda § 3.6.
