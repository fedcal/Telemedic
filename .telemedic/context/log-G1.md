# Log agente G1 - `docs/10_fondamenti/09-fondamenti-clinici.md`

**Mandato**: D35, blocco C della guida dei fondamenti. Un solo file.
**Data**: 25 agosto 2026.
**Stato**: completato.

---

## 1. Deliverable

| Voce | Valore |
|---|---|
| File prodotto | `docs/10_fondamenti/09-fondamenti-clinici.md` |
| Frontmatter | `title: Il corpo, i parametri, il ragionamento clinico` · `sidebar_position: 10` · `description` presente |
| Righe | 2.212 |
| Parole | **stima ~17.000–18.000** (minimo richiesto: 9.000 - ampiamente superato) |
| Diagrammi Mermaid | 3 - anello di retroazione omeostatica (§ 2.1), catena della misura (§ 3.0), percorso del ragionamento clinico (§ 5.2) |
| Tabelle | 17 |
| Sezione «Cosa devi ricordare» | presente, 15 punti |
| Tabella «Termini introdotti in questo modulo» | presente, 43 voci |

> **Nota di onestà sul conteggio.** In questa sessione non era disponibile alcuno strumento di
> esecuzione di comandi: il conteggio delle parole è una **stima** ricavata dal numero di righe
> (2.212, verificato) e dalla densità media misurata su campioni. Va confermato con `wc -w` alla
> prima occasione. Il conteggio delle righe è invece verificato.

## 2. Struttura del modulo

| § | Contenuto | Copre il punto del mandato |
|---|---|---|
| Avviso in apertura | Modulo di formazione tecnica, non materiale clinico né guida alla pratica medica; valori indicativi; il progetto non cabla soglie | requisito esplicito |
| 1 | Perché uno sviluppatore deve saperlo - sei difetti reali (saturazione come numero puro, unità convertita male, media su serie che non ammette medie, allarme su valore isolato, intervallo su popolazione sbagliata, valore senza contesto di misura) | 1 |
| 2 | Anatomia e fisiologia essenziali - omeostasi e compenso, cardiocircolatorio, respiratorio, nervoso, endocrino, renale, esempio integrato sullo scompenso | 2 |
| 3 | I parametri vitali uno per uno - pressione (sistolica, diastolica, media, differenziale), frequenza cardiaca, saturazione, frequenza respiratoria, temperatura, glicemia (+ emoglobina glicata), peso; tabella riepilogativa con UCUM, LOINC e trappole; attributi obbligatori di una misura | 3 |
| 4 | Il tempo nel dato clinico - andamento contro valore puntuale, definizione operativa di «tendenza», variabilità circadiana, quando la media è priva di senso, i quattro istanti, fuso orario e ora legale, l'assenza come dato | 4 |
| 5 | Il ragionamento clinico - segno/sintomo, percorso completo, sospetto contro diagnosi, sensibilità/specificità/VPP/VPN/prevalenza, **esempio numerico svolto** con due scenari e rapporti di verosimiglianza, ricaduta sugli allarmi | 5 |
| 6 | Cosa si perde a distanza - i quattro tempi dell'esame obiettivo, tabella di ciò che sopravvive, caregiver, ragione clinica del limite sulla prima visita, distorsioni di compressione/colore/illuminazione/frame rate/audio | 6 |
| 7 | Farmaci - principio attivo contro medicinale, codifica e licenze, posologia strutturata, aderenza, interazioni con vincolo di perimetro, tre nozioni di «prescrizione» | 7 |
| 8 | Esami e referti - tre famiglie, come si legge un referto, intervallo di riferimento specifico del laboratorio, valore critico | 8 |
| 9 | Terminologia medica - costruzione delle parole, tabelle di prefissi, radici e suffissi, sigle frequenti | 9 |

## 3. Punti marcati `[NV]` (non verificati)

Tredici marcature, tutte accompagnate dalla ragione dell'incertezza.

| # | § | Oggetto | Perché non verificato |
|---|---|---|---|
| 1 | 3.1.4 | Valore 120/80 `mm[Hg]` come riferimento adulto | Cifra didattica; le soglie diagnostiche differiscono per linea guida e sono state riviste più volte |
| 2 | 3.1.5 | Effetto «camice bianco» nella misura durante videochiamata | Non risulta quantificazione affidabile |
| 3 | 3.2.4 | Intervallo 60–100 `/min` per l'adulto a riposo | Cifra didattica, fortemente dipendente da età, allenamento, terapia |
| 4 | 3.3.1 | Errore tipico dichiarato dell'ossimetria a impulsi | Dipende dal dispositivo e dal contesto |
| 5 | 3.3.4 | Entità del bias di accuratezza dell'ossimetria per pigmentazione cutanea | Il fatto è documentato in letteratura; l'entità dipende da dispositivo e popolazione. **La conseguenza progettuale è dichiarata come indipendente dalla quantificazione** |
| 6 | 3.4.4 | Intervallo 12–20 atti/min | Cifra didattica; forte dipendenza dall'età |
| 7 | 3.5.2 | Entità degli scarti sistematici fra sedi di misura della temperatura | Variano per fonte e per metodo |
| 8 | 3.5.4 | Valore 36,5–37,5 °C in sede orale | Cifra didattica |
| 9 | 3.6.3 | Fattore esatto di conversione `mg/dL` ↔ `mmol/L` per il glucosio | Indicato come «circa 18,0»; il valore esatto va fissato in un unico punto del codice |
| 10 | 3.6.6 | Coefficienti esatti della conversione HbA1c `%` ↔ `mmol/mol` | Relazione affine, coefficienti non verificati |
| 11 | 3.7.4 | Criterio «aumento di peso di X kg in N giorni» nello scompenso | **Nessuna fonte normativa italiana** che ne fissi i valori; resta configurazione clinica del piano |
| 12 | 3.8 | **Tutti** i codici LOINC della tabella riepilogativa | Nessuno verificato contro un rilascio LOINC pinnato. Marcatura in blocco più `caution` dedicata. La pressione differenziale è priva di codice noto |
| 13 | 6.5 | Limiti di banda esatti dei codificatori audio per la voce | Dipendono da codificatore e configurazione; il punto qualitativo non dipende dalle cifre |

## 4. Questioni aperte per gli altri agenti

### Q1 - Incoerenza di numerazione fra i moduli della guida (bloccante per i link)

`docs/10_fondamenti/02-prestazioni-di-telemedicina.md` rinvia a
**`10-regolatorio-da-zero.md`** (§ 2.1, § 12) e a **`14-glossario.md`** (§ 2.3), mentre l'indice
di `00-come-usare-questa-guida.md` assegna: **10 = percorsi di cura e sicurezza**,
**15 = il quadro regolatorio da zero**, **19 = glossario**.

**Decisione presa da G1**: ho seguito l'indice del modulo 00, che il mandato indica come fonte
dell'articolazione in blocchi. Il modulo 09 rinvia quindi a `10-percorsi-di-cura-e-sicurezza.md`
e a `19-glossario.md`.

**Da riconciliare**: o si correggono i link del modulo 02, o si riordina l'indice. Finché la
discrepanza esiste, alcuni link della guida sono rotti. Serve una decisione di un solo agente,
non di due.

### Q2 - Per l'agente del modulo 10 (percorsi di cura e sicurezza)

Il modulo 09 rinvia esplicitamente a 10 in quattro punti e vi delega quattro argomenti, che non
vanno duplicati ma **devono esistere**:

- i **punteggi di allerta precoce** e le scale cliniche (§ 2.4.2, § 3.4.5);
- la **desensibilizzazione all'allarme** come rischio ai sensi di ISO 14971, con misure di
  controllo documentate (§ 1.4, § 5.6);
- il **triage** e i segnali d'allarme;
- l'**errore d'uso** e l'ingegneria dell'usabilità applicata alla presentazione dei nomi dei
  farmaci (§ 7.1, punto 2).

Il § 5.5 fornisce già l'apparato probabilistico completo (sensibilità, specificità, valori
predittivi, prevalenza, rapporti di verosimiglianza) con esempio numerico svolto: il modulo 10
può richiamarlo invece di riscriverlo.

### Q3 - Per l'agente del modulo 06 (FHIR da zero)

Il § 3.9 è, di fatto, la specifica degli **attributi obbligatori di una misura** nel dominio.
Va confrontata campo per campo con il profilo dei segni vitali di FHIR R4 e con le
Implementation Guide di HL7 Italia (D13). Punti di attenzione:

- § 3.1.3 richiede che la pressione sia rappresentata con **componenti distinti**, mai come
  stringa;
- § 3.3.3 richiede **codici distinti** per saturazione da ossimetria e da sangue arterioso;
- § 3.6.4 richiede **codici distinti** per le varianti temporali della glicemia (a digiuno,
  post-prandiale, casuale);
- § 3.4.3 segnala che frequenza cardiaca e respiratoria condividono l'unità `/min`: il codice è
  l'unico discriminante;
- § 3.7.5 e § 3.1.1 introducono la distinzione fra valori **misurati** e valori **derivati**
  (indice di massa corporea, pressione media, pressione differenziale): serve una convenzione di
  progetto per marcarli;
- § 4.4 richiede quattro istanti distinti e la conservazione del riferimento locale accanto
  all'istante assoluto.

### Q4 - Per l'agente terminologia / licenze

- I codici LOINC del § 3.8 vanno **verificati contro un rilascio pinnato** e corredati
  dell'attribuzione richiesta dalla licenza (regime A di D31). La marcatura `[NV]` in blocco va
  rimossa solo dopo la verifica.
- Il § 3.8 riporta già l'avvertenza di D34 sulla separazione architetturale fra stringhe i18n del
  progetto e `Coding.display`, perché **le traduzioni LOINC sono derivati assegnati all'ente che
  lo mantiene**. Va verificato che l'avvertenza sia coerente con la formulazione adottata
  altrove.
- Il § 7.2 riflette D34 (esclusione ATC dal contenuto distribuito, AIC come codifica operativa
  italiana, URI canonico come identificatore) e la regola generale «una dichiarazione di licenza
  su un pacchetto non dispone dei diritti di terzi». Verificare la coerenza con
  `docs/08_compliance/`.
- Il § 3.1.3 e il § 1.2 pongono UCUM come forma obbligatoria dell'unità: coerente con il regime B
  di D31 (`third-party/` con licenza propria).

### Q5 - Per l'agente MDR / regolatorio (D26, D46)

Il modulo fissa **tre confini di perimetro** in forma esplicita e verificabile. Vanno confrontati
con la bozza di destinazione d'uso `MDR-IU-001`, perché una difformità di formulazione fra i due
documenti è precisamente il tipo di incoerenza che costa cara:

1. **§ 5.6** - il sistema non scrive mai «valore anomalo», «probabile peggioramento», «paziente a
   rischio»: registra il superamento di una soglia configurata, indicando quale soglia, chi l'ha
   configurata e quando;
2. **§ 7.5** - il progetto **non verifica le interazioni fra farmaci** e non genera avvisi clinici
   sulla terapia. È un vincolo assoluto, non una scelta di priorità;
3. **§ 5.2** e **§ 6.5** - il sistema non calcola prognosi e non applica **miglioramento
   dell'immagine**. Entrambe sono nominate come funzionalità che sposterebbero la
   classificazione, coerentemente con D26 («tre funzionalità a una user story dalla IIa»).

Va inoltre verificata la formulazione del § 6.5 in chiusura - «la qualità del collegamento si
dichiara come misura tecnica verificabile e non come adeguatezza diagnostica» - rispetto ai claim
pubblici riformulati da D19 e D29.

### Q6 - Per l'agente dei requisiti (catalogo R6)

Il § 3.9 e il § 4.4 generano requisiti che vanno cercati nel catalogo e, se assenti, aggiunti
senza rinumerare l'esistente (conseguenza 6 di D12):

- persistenza obbligatoria di unità codificata, codice della grandezza, sede, metodo, dispositivo,
  operatore, condizioni dichiarate e indicatori di qualità del dispositivo;
- distinzione dei quattro istanti e gestione dell'arrivo fuori ordine;
- rappresentazione dell'**assenza di rilevazione** come informazione, derivata dal confronto fra
  rilevazioni attese nel piano e ricevute (base del calcolo di aderenza);
- conservazione della segnalazione di **battito irregolare** e dell'**indice di perfusione** come
  dati, non come messaggi transitori;
- divieto di aggregazione predefinita: l'aggregazione è dichiarata insieme al parametro e mostrata
  all'utente (§ 4.3);
- misurabilità della **proporzione di allerte confermate** dal professionista (§ 5.6), senza la
  quale non è valutabile l'efficacia del servizio.

### Q7 - Revisione clinica del modulo

Il modulo 00 prevede che i moduli 09 e 10 siano **letti da un clinico con il compito di trovare
gli errori**. Il modulo 09 è scritto da un agente senza formazione medica e va sottoposto a quella
revisione **prima della pubblicazione**, con attenzione prioritaria ai §§ 2 (fisiologia), 3
(parametri) e 5.2 (percorso del ragionamento). I punti `[NV]` della § 3 sono i candidati naturali
per la prima passata.

### Q8 - Segnalazione minore

Nel modulo 02, § 2.3, il rinvio al glossario è scritto «modulo [14]»; nell'indice del modulo 00 il
glossario è il 19. Stessa causa di Q1, segnalato a parte perché è un'occorrenza isolata e facile
da perdere.

## 5. Termini da riportare nel glossario (modulo 19)

Quarantatré voci, già definite in coda al modulo 09 con definizione breve. Elenco per
l'integrazione:

Aderenza terapeutica · Anamnesi · Auscultazione · Compenso · Curva di dissociazione
dell'emoglobina · Deficit di polso · Desensibilizzazione all'allarme · Diagnosi · Diagnosi
differenziale · Esame obiettivo · Follow-up · Glicemia a digiuno / post-prandiale · Indice di
perfusione · Intervallo di riferimento · Ipoglicemia · Ispezione · Omeostasi · Palpazione ·
Percussione · Peso secco · Portata cardiaca · Posologia · Prefisso, radice, suffisso · Pressione
arteriosa media · Pressione differenziale · Prevalenza · Principio attivo · Prognosi · Rapporto
di verosimiglianza · Riconciliazione terapeutica · Scompenso · Segno · Sensibilità · Sindrome ·
Sintomo · Sospetto diagnostico · Specificità · Tendenza · UCUM · Valore critico · Valore
predittivo negativo · Valore predittivo positivo · Variabilità circadiana

Vanno inoltre censite nel glossario le **sigle** del § 9.5, con l'avvertenza che alcune sono
ambigue fra specialità (`TC` = temperatura corporea oppure tomografia computerizzata; `FC` e `FR`
differiscono di una lettera e condividono l'unità di misura). Il glossario è bilingue (D35): le
voci vanno corredate del corrispettivo inglese, con attenzione a `SpO₂`/`SaO₂`, `sensitivity`,
`specificity`, `positive/negative predictive value`, `pulse pressure`, `mean arterial pressure`.

## 6. Conformità alle regole del mandato

| Regola | Stato |
|---|---|
| **R0** - nessuna azienda, marchio, prodotto commerciale o dominio di partner | Rispettata. Dispositivi e sistemi citati sempre per categoria («un misuratore oscillometrico», «un gateway di terze parti», «l'ente che mantiene la classificazione») |
| Italiano con accenti e diacritici corretti | Rispettata |
| Nessuna soglia clinica cablata; valori dichiarati indicativi | Rispettata, con avviso in apertura, ripetizione in § 3.1.4 e punto 14 di «Cosa devi ricordare» |
| Ogni termine clinico definito alla prima occorrenza | Rispettata |
| Rinvio a 02 invece di ripeterlo | Rispettata: sei rinvii con link relativo, nessuna ripetizione delle definizioni normative delle prestazioni |
| Diagrammi Mermaid dove aiutano | Tre, come da mandato (ragionamento clinico e catena della misura compresi) |
| Prosa densa, nessun riempitivo | Perseguita; da verificare in revisione |
| Scrittura incrementale su disco | Rispettata: cinque passaggi con modifiche accodate |
