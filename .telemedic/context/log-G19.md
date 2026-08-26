# Log G-19 - Glossario della guida dei fondamenti

**Deliverable**: `docs/10_fondamenti/19-glossario.md` - `sidebar_position: 20`.
**Data**: 25 agosto 2026.
**Metodo**: raccolta sistematica, non redazione ex novo. Nessuna voce è stata inventata: ogni
voce proviene da una sezione «Termini introdotti» di un modulo della guida, dal glossario del
dominio, o dal lessico esplicitamente introdotto da un'area di documentazione.

---

## 1. Consistenza del deliverable

| Elemento | Quantità |
|---|---|
| Voci nell'elenco alfabetico (A-Z) | **~715** |
| Sigle sciolte in italiano e in inglese (§ 5) | **~150**, in dieci raggruppamenti tematici |
| Coppie di falsi sinonimi (§ 3) | **32** - le 14 dell'area dominio più 18 nuove |
| Termini da non usare (§ 4) | **22** - gli 11 dell'area dominio più 11 nuovi |
| Termini dipendenti dal contesto (§ 6) | **20** - i 12 dell'area dominio più 8 nuovi |
| Voci dell'indice inverso inglese → italiano (§ 7) | **~350** |
| Lunghezza stimata | ampiamente oltre le 10.000 parole richieste (stima ≈ 30.000) |

Sezioni obbligatorie tutte presenti: come si usa e che cosa non contiene (§ 1), elenco alfabetico
(§ 2), falsi sinonimi (§ 3), termini da non usare (§ 4), sigle (§ 5), termini dipendenti dal
contesto (§ 6). Aggiunte: indice inverso (§ 7), manutenzione del glossario (§ 8), dove continuare
(§ 9).

---

## 2. Fonti da cui le voci sono state raccolte

### 2.1 Sezioni «Termini introdotti» dei moduli della guida

Estratte integralmente da diciassette moduli su venti:

| Modulo | Riga della sezione | Voci raccolte |
|---|---|---|
| `01-sistema-sanitario-italiano.md` | 1058 | 45 |
| `02-prestazioni-di-telemedicina.md` | 1383 | 31 |
| `03-il-dato-clinico.md` | 879 | 32 |
| `04-identita-e-anagrafiche.md` | 2358 | 35 |
| `05-standard-di-interoperabilita.md` | 1603 | 60 |
| `06-fhir-da-zero.md` | 2160 | 68 |
| `07-fse-e-infrastrutture-nazionali.md` | 1389 | 35 |
| `08-webrtc-da-zero.md` | 2815 | 72 |
| `09-fondamenti-clinici.md` | 2165 | 44 |
| `10-percorsi-di-cura-e-sicurezza.md` | 2233 | 44 |
| `11-fondamenti-informatici.md` | 2996 | 61 (già bilingue nella fonte) |
| `12-crittografia-e-sicurezza.md` | 2804 | 55 |
| `13-protocolli.md` | 3361 | 68 |
| `14-flussi-funzionali.md` | 1141 | 13 |
| `15-regolatorio-da-zero.md` | 2079 | 41 |
| `16-architettura-del-progetto.md` | 2530 | 34 |
| `17-ambiente-di-sviluppo.md` | 1991 | 39 |

**Moduli privi di sezione «Termini introdotti»**: `00-come-usare-questa-guida.md`,
`18-contribuire-per-area.md`, `20-fonti-primarie.md`. Dai primi due sono stati comunque tratti
alcuni termini introdotti nel corpo (dato sintetico, prerequisito di contribuzione); il modulo 20
non introduce lessico proprio ed è citato come destinazione, non come fonte di voci.

### 2.2 Area dominio

`docs/05_domain/09-glossario-del-dominio.md` - ~150 voci italiano/inglese con natura (N/G/S/P) e
rinvii, 18 sigle, 11 termini da non usare, 12 collisioni presidiate.
`docs/05_domain/01-linguaggio-ubiquo.md` § 5 - le 14 coppie di falsi sinonimi, riprese in forma
sintetica con il rinvio; § 6 - la tabella delle collisioni.

**Assorbita, non duplicata.** Il glossario della guida riprende le voci che i moduli introducono e
rinvia sistematicamente all'area dominio per il dettaglio di modellazione. La colonna «Natura» è
mutuata dalla stessa regola di precedenza, con un ampliamento dichiarato: il codice **S** copre qui
anche il vocabolario tecnico consolidato non normato da uno standard formale (aggregato,
idempotenza, ABAC), altrimenti privo di collocazione.

### 2.3 Aree di documentazione

Le aree `docs/01_technical/` … `docs/09_roadmap/` sono state usate per i **rinvii**, non come fonte
di voci nuove: ogni voce ha almeno un modulo della guida come origine. I collegamenti d'area sono
stati verificati sull'elenco reale dei file.

### 2.4 Contesto di progetto

`.telemedic/context/00_PROJECT_BRIEF.md` § 5-ter - decisioni **D53-D58**. Recepite in modo
puntuale:

- **D57**: nessuna voce presenta la pianificazione come «percorso di un terzo». Le formule
  «chi certifica», «il calendario di un soggetto terzo» e «traguardi di terzi» sono state inserite
  fra i **termini da non usare**.
- **D58**: la voce **Fabbricante** dichiara che il ruolo sarà assunto dal progetto, con il soggetto
  giuridico **ancora da costituire**, e non che è «un terzo che certifica». La stessa voce, la voce
  **Marcatura CE**, la voce **Dichiarazione di conformità UE**, il § 1.4 e il § 9 ripetono lo stato
  di fatto: **oggi il prodotto non reca marcatura CE**, e chi installa o mette in servizio assume
  gli obblighi che ne derivano.
- Il divieto di dichiarare una data di marcatura è codificato come voce dell'elenco dei termini da
  non usare («Sarà marcato CE entro *data*»).
- **D55**: la voce **Telemonitoraggio** riporta la destinazione d'uso congelata sulla raccolta
  differita e il divieto permanente di funzioni che spostino il sistema verso il tempo reale
  clinico.

---

## 3. Regole redazionali - verifica di conformità

| Regola | Esito |
|---|---|
| Nessuna definizione normativa inventata; estremo puntuale dove esiste | Rispettata. Tutti gli estremi citati (MDR artt. 2, 8, 11, 15, 19, 20, 61, 83–86, 87–92 e Allegati I-XIV; GDPR artt. 9, 26, 28, 33, 35; CAD artt. 50-*ter*, 62, 62-*ter*, 64, 71; L. 833/1978; L. 219/2017; D.P.C.M. 12 gennaio 2017; DM 21 e 30 settembre 2022; DM 7 settembre 2023; DM 31 dicembre 2024; DM 19 novembre 2025; Accordi 215/CSR 2020 e 231/CSR 2021; Reg. (UE) 2024/2847, 2025/327, 910/2014, 2024/1183; RFC citate) provengono dai moduli o dal brief. **Nessun estremo è stato aggiunto, dedotto o completato.** |
| Definizioni di progetto dichiarate come tali | Rispettata, tramite la colonna **Nat.** con il codice **P** |
| `[NV]` sull'incerto | Applicato a due voci: **Triage** (cinque livelli) e **Processo di Validazione** (contenuto operativo non pubblicamente documentato) |
| Il glossario rinvia, non ripete | Rispettata: ogni voce ha la colonna «Dove» con collegamento relativo |
| Nessuna soglia clinica | Rispettata. Le voci cliniche (ipoglicemia, saturazione, glicemia, pressione) descrivono la grandezza e la trappola **senza alcun valore numerico** |
| Nessun contenuto SNOMED CT | Rispettata. La voce descrive il **regime** della terminologia; nessun codice, nessuna descrizione, in nessuna forma. Il divieto è inoltre codificato fra i termini da non usare |
| Nessun dato reale | Rispettata: gli identificatori sono descritti nella struttura, mai istanziati |
| Regola R0 | Rispettata: nessun nome di azienda, prodotto, marchio o dominio. Le controparti sono sempre «l'integratore», «un gestionale sanitario cloud», «un sistema EHR di terze parti». Per la stessa ragione le voci su prodotti di gestione identità, broker di eventi e basi dati sono formulate per categoria funzionale |
| Frontmatter YAML, valore con due punti fra virgolette | Rispettata: la `description` contiene «: » ed è racchiusa fra virgolette doppie |
| URL assoluti per i file alla radice | Rispettata: `CONTRIBUTING.md`, `NOT-A-MEDICAL-DEVICE.md`, `DISTRIBUTION-POLICY.md` sono in forma `https://github.com/fedcal/Telemedic/blob/main/<file>` |
| Nessun carattere che rompe MDX | Verificato: nessun `<`, `>`, `{`, `}` fuori dalla sintassi markdown (l'unico `>` è la citazione a blocco dell'avvertenza sulle prestazioni) |

---

## 4. Termini usati in modo incoerente fra aree diverse - SEGNALATI, NON CORRETTI

Come da istruzione, le incoerenze trovate nelle aree altrui **non sono state modificate**. Sono
elencate qui perché siano risolte da chi possiede quelle aree.

1. **Collegamento rotto verso il modulo 18.** Il modulo `17-ambiente-di-sviluppo.md`, in coda,
   rinvia a `18-come-contribuire-per-area.md`; il file reale è `18-contribuire-per-area.md`. È un
   collegamento che romperà la costruzione del sito o produrrà un collegamento morto. Il glossario
   usa il nome corretto. **Bloccante prima del primo deploy.**
2. **«Compliance digitale del paziente» contro «compliance digitale dell'assistito».** Il modulo
   `02` usa la prima forma, il glossario del dominio la seconda. Poiché la verifica riguarda la
   capacità della persona di interagire con i sistemi indipendentemente dall'atto sanitario in
   corso, la forma dell'area dominio («assistito») è la più coerente con la distinzione
   assistito/paziente che la stessa area impone. Il glossario ha adottato la forma dell'area
   dominio con rinvio a entrambe.
3. **«Telecontrollo» contro «Telecontrollo medico».** Modulo `02` usa la forma breve, glossario del
   dominio la forma estesa. Il glossario adotta la forma estesa perché è quella che chiarisce che
   la prestazione è di pertinenza medica.
4. **«Coerenza finale» contro «consistenza finale».** I moduli `11` e `16` usano rispettivamente
   «consistenza finale» e «coerenza finale» per lo stesso concetto (*eventual consistency*), e il
   modulo `11` usa «consistenza forte» per *strong consistency*. Il glossario riporta entrambe le
   forme con rinvio incrociato, ma **una delle due va scelta** e propagata: la coesistenza di due
   traducenti per lo stesso termine inglese è precisamente ciò che la regola sul linguaggio ubiquo
   vieta.
5. **«Catena di hash» contro «catena di impronte».** Modulo `12` contro modulo `16`. Stesso
   concetto, due nomi. Il glossario li unifica in una voce; le due aree vanno allineate.
6. **«Livello anticorruzione» presente identico in `11` e `16`, «Aggregato» definito due volte con
   formulazioni diverse** (`11`: unità di consistenza con radice; `16`: insieme di oggetti che
   cambiano insieme per mantenere vera una regola). Le due definizioni sono compatibili ma non
   identiche: va scelta la formulazione canonica.
7. **«Finestra di attesa» definita identicamente in `10` e `14`.** Non è un'incoerenza ma una
   duplicazione: la definizione dovrebbe stare in un modulo solo, con rinvio dall'altro.
8. **«Errore d'uso»: due definizioni con accento diverso.** Modulo `10`: «non implica colpa
   dell'utente»; modulo `15`: «è un difetto di progettazione dell'interfaccia». La seconda è più
   forte della prima. Il glossario le ha fuse riportando entrambe le affermazioni.
9. **«Sicurezza a livello di riga»: tre caratterizzazioni diverse.** Modulo `11` la descrive come
   filtro del motore; modulo `16` come **seconda barriera** e non meccanismo unico; modulo `17`
   aggiunge che in assenza di contesto **nega tutto**. Le tre affermazioni sono cumulative e non
   contraddittorie, ma solo la lettura di tutti e tre i moduli dà il quadro. Il glossario le
   riunisce; le aree dovrebbero rinviare fra loro.
10. **«Tracciabilità»: due accezioni.** Modulo `11` e `17` la usano come catena requisito → prova;
    modulo `12` la usa come possibilità di ricostruire chi ha fatto cosa, che è invece la funzione
    del registro degli accessi. Sono due concetti diversi con lo stesso nome, in due moduli della
    stessa guida. **Candidata all'elenco dei termini dipendenti dal contesto delle aree
    interessate**; il glossario ha mantenuto l'accezione di tracciabilità dei requisiti e ha
    ricondotto la seconda alla voce «Registro degli accessi».
11. **«Outbox transazionale» definito quattro volte** (`11`, `13`, `16`, `17`) con formulazioni
    equivalenti. Nessuna contraddizione, ma è il segnale che manca un modulo proprietario del
    concetto.
12. **«Contesto sicuro» in `08` e `17`, «Contenitori effimeri» come rinvio interno a `17`.**
    Innocui, ma il secondo è un rinvio interno lasciato in una tabella di glossario, che in una
    raccolta trasversale diventa una voce vuota.

---

## 5. Voci raccolte e deliberatamente NON incluse

L'esclusione è sempre motivata; nessuna voce è stata omessa per economia.

1. **Attributi ed elementi FHIR di puro dettaglio sintattico.** Sono stati inclusi i tipi di dato,
   le risorse e i meccanismi (slicing, discriminatore, binding, estensione, interazione), ed
   esclusi i singoli campi che il modulo `06` cita solo come esempio di sintassi. Motivo: il
   glossario della guida deve dare il vocabolario, non sostituire la specifica; chi lavora sulle
   risorse ha la specifica aperta accanto.
2. **Nomi di prodotti, librerie e componenti dello stack.** Broker di eventi, prodotto di gestione
   delle identità, base dati per serie temporali, libreria di versionamento delle entità: citati
   nei moduli, esclusi dal glossario per **regola R0** e perché sono scelte di implementazione
   sostituibili, non termini del linguaggio. Dove il concetto conta, la voce esiste in forma
   funzionale (outbox transazionale, partizione, offset, versionamento).
3. **Sigle di enti e organismi già sciolte nel corpo dei moduli e mai riutilizzate.** Incluse solo
   quelle che ricorrono in più moduli o che compaiono in obblighi.
4. **Termini clinici citati una sola volta come esempio anatomico o fisiologico** senza ruolo nel
   modello dati. Inclusi tutti quelli che il modulo `09` presenta come vocabolario operativo
   (segno, sintomo, sindrome, compenso, scompenso, omeostasi, prevalenza, sensibilità,
   specificità, valori predittivi, tendenza, valore critico, intervallo di riferimento); esclusi i
   nomi di singole patologie citate a titolo di esempio, che non sono termini del linguaggio del
   progetto e la cui presenza in un glossario suggerirebbe un perimetro clinico che il prodotto
   non ha.
5. **Valori, soglie e intervalli.** Esclusi per regola. La voce descrive la grandezza e la
   trappola, mai il numero.
6. **Codici e descrizioni di terminologie sotto licenza.** Esclusi per regola, con divieto
   esplicito codificato in § 4.
7. **Identificativi di requisito, di regola di business e di decisione** (`RF-*`, `RNF-*`, `BR-*`,
   `D*`, `V*`, `Q-*`). Sono riferimenti interni al governo del progetto, non termini del
   linguaggio; il glossario ne riporta il **contenuto** dove serve (per esempio la destinazione
   d'uso congelata) senza citare l'identificativo, che appartiene ai documenti di conformità e di
   roadmap. Unica conseguenza da segnalare: chi cerca nel glossario la sigla di una decisione non
   la trova, ed è voluto.
8. **Voci del glossario del dominio non introdotte da alcun modulo della guida.** Un piccolo
   numero di voci di natura P dell'area dominio riguarda esclusivamente dettagli di modellazione
   (per esempio articolazioni interne dell'aggregato della presa in carico) che nessun modulo della
   guida presenta. Sono state lasciate al glossario del dominio, con rinvio generale in § 1.1.
   Motivo: il criterio di ammissione dichiarato è che almeno un modulo o un'area **usi** il
   termine.

---

## 6. Note per chi verrà dopo

1. **La traduzione inglese di questo modulo non è una traduzione ordinaria.** Le voci contrassegnate
   con l'avvertenza «equivalente inglese non esatto» - le otto prestazioni di telemedicina e una
   trentina di istituti amministrativi italiani - richiedono che il termine italiano **resti nella
   forma originale** anche nel testo inglese, con la spiegazione a seguire. Un traduttore che
   sostituisca «televisita» con «video visit» distrugge precisamente l'informazione che la voce
   esiste per veicolare.
2. **Il § 6 (termini dipendenti dal contesto) è la lista chiusa su cui costruire il controllo
   automatico** di stile già previsto dall'area dominio: venti parole che non devono comparire non
   qualificate in nomi di classe, colonna, endpoint, evento o etichetta. L'elenco del dominio ne
   contava dodici; questo ne aggiunge otto, che vanno propagate al controllo.
3. **Le incoerenze del § 4 di questo log vanno risolte prima del congelamento del linguaggio**, non
   dopo: la regola del progetto è che un termine non si rinomina, si deprezza, e ogni giorno in cui
   due traducenti coesistono è un giorno in cui entrambi entrano nel codice.
4. **Il collegamento rotto verso il modulo 18** (§ 4.1) è bloccante prima del primo deploy e va
   corretto nel modulo 17, non qui.
