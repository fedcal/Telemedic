---
title: Fonti primarie
sidebar_position: 21
description: "Elenco ragionato di tutte le fonti primarie su cui poggia la documentazione: normativa italiana ed europea, standard di interoperabilità sanitaria, standard tecnici, norme di processo e terminologie, con estremi esatti, luogo di reperimento, documenti del repository che le usano, ordine di lettura consigliato, metodo di verifica della vigenza e fonti deliberatamente escluse."
---

# Fonti primarie

Questo modulo è l'inventario di ciò su cui l'intera documentazione poggia. Non contiene analisi:
l'analisi sta nei moduli e nelle aree, e qui si rinvia. Contiene **estremi**, **luogo di
reperimento**, **uso effettivo nel repository** e, dove serve, **l'ordine in cui leggere**.

Tre premesse che ne determinano la forma.

**La prima.** L'elenco riflette ciò che il repository **usa davvero**. Non è una bibliografia di
completezza: è la mappa delle fonti effettivamente citate nei documenti, ricostruita
sistematicamente sul contenuto. Una fonte plausibile ma non usata sarebbe un invito a citarla
senza averla letta, che è il difetto che questo modulo esiste per prevenire.

**La seconda.** In questo dominio **le fonti si rinviano a vicenda**, e leggerle nell'ordine
sbagliato fa perdere tempo. Un decreto ministeriale italiano rinvia a un accordo fra Stato e
Regioni per le definizioni, a una guida di implementazione per il formato, a un regolamento
europeo per la qualificazione del prodotto e a una determinazione di un'autorità per le misure di
sicurezza. Le note «come si legge» presenti in molte voci servono a questo e a nient'altro.

**La terza.** Una fonte non è vera per sempre. Una norma abrogata citata come vigente, una guida
superata da una revisione, uno standard sostituito da un successore: sono errori che si propagano
in tutta la documentazione perché sembrano precisi e nessuno li ricontrolla. Il metodo di verifica
è al [§11](#11-come-si-verifica-che-una-fonte-sia-ancora-vigente), ed è parte del contributo, non
un'accortezza opzionale.

> **Regola vincolante che governa questo modulo.** Ciò che non è verificabile con certezza si
> marca `[NV]`, con l'indicazione del destinatario in una delle tre forme ammesse (sigla d'area
> fra backtick, identificativo di questione, oppure soggetto esterno nominato secondo le regole
> di `CONTRIBUTING.md`) e l'indicazione di che cosa manca. **Non si inventano numeri, date o
> titoli di norme.** In un documento che serve da riferimento per tutti gli altri, un estremo
> inventato è il difetto più dannoso possibile: viene copiato, e nessuno risale alla fonte
> perché sembra già verificato.

---

## 1. Come si legge una voce

Ogni voce ha cinque elementi. Quando uno manca, manca per una ragione dichiarata.

| Elemento | Che cosa contiene |
|---|---|
| **Denominazione ed estremi** | La forma con cui la fonte va citata nei documenti del progetto. Per gli atti italiani: tipo, data, numero, pubblicazione ufficiale dove verificata. Per gli atti europei: forma «Regolamento/Direttiva (UE) anno/numero». Per gli standard: sigla, numero, **versione o revisione**, data |
| **Che cosa stabilisce** | Una frase. Non un riassunto: l'oggetto della fonte, per riconoscerla |
| **Dove si reperisce** | Il canale di pubblicazione ufficiale, non un collegamento diretto: gli indirizzi cambiano, i canali no |
| **Dove è usata** | I documenti del repository che vi si appoggiano. È la colonna che rende l'elenco utile: dice che cosa si rompe se la fonte cambia |
| **Come si legge** | Presente solo dove l'ordine di lettura conta, cioè dove la fonte rinvia ad altre o presuppone altre |

**Marcature.** `[NV]` segnala un'informazione non verificata su fonte primaria, con l'indicazione
di che cosa va controllato. L'assenza di marcatura significa che l'estremo è stato riscontrato nei
documenti del progetto che lo citano; **non** significa che il testo integrale sia stato letto da
chi scrive questo modulo, e la differenza è dichiarata al [§13](#13-che-cosa-questo-elenco-non-garantisce).

**Che cosa non c'è.** Non ci sono collegamenti diretti alle pagine di pubblicazione. È una scelta:
gli indirizzi delle banche dati normative e dei siti degli enti di normazione cambiano con
frequenza superiore a quella di aggiornamento di questa documentazione, e un elenco di
collegamenti morti è peggio di nessun collegamento. Si indica il canale - la gazzetta ufficiale,
il registro dell'ente, il catalogo dell'organismo di normazione - e la denominazione esatta con
cui cercare.

**Gli enti si nominano.** In questo modulo l'autorità che emana un atto è indicata con il proprio
nome e la propria sigla - **AgID**, Agenzia per l'Italia digitale, e **ACN**, Agenzia per la
cybersicurezza nazionale - e non per perifrasi. La reticenza che il progetto tiene altrove esiste
per non risolvere in nomi propri **prodotti, aziende e terminologie sotto licenza**: un ente
pubblico normatore non è nessuna di queste cose, e l'autorità emanante è parte degli estremi
dell'atto quanto il numero e la data. Una perifrasi renderebbe l'atto meno reperibile, cioè
l'opposto della funzione di questo modulo. Resta l'omonimia segnalata dal modulo
[01](01-sistema-sanitario-italiano.md): `ACN` indica anche l'accordo collettivo nazionale della
medicina convenzionata, che con la cybersicurezza non ha nulla a che vedere.

---

## 2. L'ordine di lettura, prima dell'elenco

Chi arriva da zero e comincia dal primo atto in ordine cronologico perde giorni. L'ordine che
funziona è per **dipendenza logica**, e passa da sei domande.

**Prima: che cos'è, giuridicamente, la prestazione che il sistema eroga?** Si parte
dall'**Accordo Stato-Regioni 215/CSR del 2020**, che contiene le definizioni canoniche. Tutto il
resto le presuppone: i decreti successivi non ridefiniscono, specificano.

**Seconda: che cosa deve fare il software che la eroga?** Il **DM 21 settembre 2022** è l'atto
tecnicamente più prescrittivo dell'ordinamento italiano su questa materia. Va letto dopo le
definizioni, perché usa i termini dell'Accordo senza ridefinirli.

**Terza: dove finisce ciò che il software produce?** Il **DM 7 settembre 2023** sul fascicolo
sanitario elettronico e il **DM 19 novembre 2025** sulla piattaforma nazionale di telemedicina. Il
secondo presuppone il primo e ne estende l'impianto: leggerli in ordine inverso significa non
riconoscere i rinvii.

**Quarta: che cos'è il prodotto, dal punto di vista europeo?** Il **Regolamento (UE) 2017/745**,
letto **insieme** alla linea guida **MDCG 2019-11 Rev.1**. Il regolamento da solo non basta:
l'albero di qualificazione del software è nella linea guida, e senza di essa la Regola 11
dell'Allegato VIII è quasi illeggibile.

**Quinta: quali obblighi ricadono su chi lo installa?** Il **Regolamento (UE) 2016/679**, la
**Direttiva (UE) 2022/2555** con il decreto che la recepisce, e le **determinazioni ACN** che ne
fissano le misure. Qui l'ordine è inverso rispetto all'intuizione:
la determinazione, che è l'atto più basso nella gerarchia, è quella operativamente decisiva,
perché contiene il catalogo delle misure.

**Sesta: in che forma si scambia il dato?** **FHIR 4.0.1**, poi le **guide di implementazione
italiane** che lo profilano, poi - solo se serve - i profili di interoperabilità e la messaggistica
ospedaliera. Le guide italiane sono in stato di bozza: leggerle prima dello standard di base
produce la convinzione, sbagliata, che ciò che vi manca non esista.

Una regola trasversale, che vale per l'intero elenco: **la fonte italiana rinvia spesso a un
documento non pubblicato in gazzetta**. Succede almeno due volte in questa materia, ed è
un'anomalia di tracciabilità documentata in [07 §7.3](07-fse-e-infrastrutture-nazionali.md). Non
è un errore di lettura: è il quadro reale, e va dichiarato nella documentazione di conformità
invece che nascosto.

---

## 3. Normativa italiana - ordinamento sanitario

Sono le fonti che definiscono **chi fa che cosa** nel servizio sanitario. Non riguardano il
software, e sono il presupposto senza cui non si capisce a chi il software si rivolge. La
trattazione è in [01 - Il sistema sanitario italiano](01-sistema-sanitario-italiano.md).

| Fonte | Che cosa stabilisce | Dove è usata |
|---|---|---|
| **Decreto legislativo 30 dicembre 1992, n. 502** | Riordino della disciplina in materia sanitaria: aziendalizzazione, livelli di assistenza, rapporti Stato-Regioni | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 19 giugno 1999, n. 229** | Razionalizzazione del servizio sanitario nazionale: completa l'impianto del 502 | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 21 dicembre 1999, n. 517** | Rapporti fra servizio sanitario nazionale e università | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 16 ottobre 2003, n. 288** | Istituti di ricovero e cura a carattere scientifico | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 28 agosto 1997, n. 281** | Disciplina della Conferenza permanente Stato-Regioni e della Conferenza unificata: è la fonte che dà forza agli **accordi** citati al §4 | [01](01-sistema-sanitario-italiano.md) |
| **Legge 26 febbraio 1999, n. 42** | Professioni sanitarie: abolizione del mansionario e definizione del campo proprio di attività | [01](01-sistema-sanitario-italiano.md) |
| **Legge 8 marzo 2017, n. 24** | Sicurezza delle cure e responsabilità professionale | [04](04-identita-e-anagrafiche.md), [10](10-percorsi-di-cura-e-sicurezza.md) |
| **Legge 22 dicembre 2017, n. 219** | Consenso informato e disposizioni anticipate di trattamento | [03](03-il-dato-clinico.md) |
| **Decreto legislativo 15 marzo 2024, n. 29** | Disposizioni in materia di politiche in favore delle persone anziane | [01](01-sistema-sanitario-italiano.md) |
| **Decreto legislativo 31 marzo 2023, n. 36** | Codice dei contratti pubblici: è la via d'accesso al mercato sanitario pubblico | [01](01-sistema-sanitario-italiano.md) |
| **Legge 30 dicembre 2025, n. 199** | Legge di bilancio 2026. Due disposizioni distinte rilevano per il progetto: l'art. 1, **commi 405-406**, finanzia i servizi di scambio transfrontaliero dei documenti sanitari; l'art. 1, **commi 410-412**, assegna 20 milioni di euro per il 2026 ad AGENAS per il potenziamento dei servizi di telemedicina | [07 §10](07-fse-e-infrastrutture-nazionali.md) per i commi 405-406; [01 §9.4](01-sistema-sanitario-italiano.md) per i commi 410-412 |
| **D.L. 31 dicembre 2025, n. 200**, convertito con modificazioni dalla **legge 27 febbraio 2026, n. 26** (Milleproroghe) | Differisce il termine di vigenza del regime tariffario previgente. La verifica di articolo e comma spetta a `GUIDA` `[NV]` | [01](01-sistema-sanitario-italiano.md) |

**Come si legge questo blocco.** Non integralmente. Serve la struttura - chi programma, chi
eroga, chi paga, chi controlla - e quella sta nel modulo 01, che è scritto per non doverli leggere.
Si torna alla fonte quando si deve rispondere a una domanda puntuale su una competenza.

---

## 4. Normativa italiana - telemedicina

È il blocco da cui discendono le **definizioni** e i **requisiti funzionali**. Nessun documento del
progetto può contraddirlo, e la maggior parte delle regole di dominio vi rinvia.

### 4.1 Atti della Conferenza Stato-Regioni

**Accordo Stato-Regioni 17 dicembre 2020, rep. atti n. 215/CSR**, Allegato A.
Contiene le **definizioni canoniche** delle prestazioni di telemedicina e le condizioni di
erogabilità. È la fonte che determina il modello di dominio: televisita, teleconsulto,
teleconsulenza, teleassistenza e telemonitoraggio sono definiti qui, e le differenze fra loro
cambiano gli attori ammessi e gli artefatti obbligatori. Impone inoltre l'**obbligo di referto**
per la televisita con indicazione dei collaboratori partecipanti e della **qualità del collegamento
con conferma di idoneità**, la **cifratura di tutti i trasferimenti** di voce, video, immagini e
file, l'adesione preventiva dell'assistito, l'obbligo di completare la prestazione in modalità
tradizionale quando lo strumento non consente di mantenerne inalterato il contenuto, e la
certificazione dell'hardware e del software come dispositivo medico «idonea alla tipologia di
prestazione».
*Dove si reperisce*: repertorio degli atti della Conferenza permanente per i rapporti fra lo Stato,
le Regioni e le Province autonome.
*Dove è usata*: [02](02-prestazioni-di-telemedicina.md), [10](10-percorsi-di-cura-e-sicurezza.md),
[12](12-crittografia-e-sicurezza.md), [`docs/05_domain/`](../05_domain/00-indice.md) capitoli
01, 02, 04 e 09, [`docs/03_functional/02`](../03_functional/02-catalogo-dei-requisiti.md) e
[`04`](../03_functional/04-regole-di-business.md),
[`docs/06_security/03`](../06_security/03-protezione-dei-dati.md),
[`docs/08_compliance/01 §9`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: **per primo, prima di ogni decreto.** Gli atti successivi usano questi termini
senza ridefinirli.

**Intesa Stato-Regioni 2014, rep. atti n. 16/CSR** - linee di indirizzo nazionali sulla
telemedicina, **superata nei contenuti operativi** dall'Accordo del 2020. Si cita per
ricostruzione storica, mai come fonte vigente di definizioni.
*Dove è usata*: [02 §2](02-prestazioni-di-telemedicina.md).

**Accordo Stato-Regioni 18 novembre 2021, rep. atti n. 231/CSR** - teleriabilitazione.
*Dove è usata*: [02 §2](02-prestazioni-di-telemedicina.md).

*Nota comune sulla forza di questi atti.* Un accordo in Conferenza **si perfeziona con il
recepimento regionale**: la sua efficacia diretta sul singolo erogatore passa da un atto della
Regione. È la ragione per cui un progetto nazionale non può assumere uniformità di attuazione, ed
è uno dei fondamenti del principio per cui i cataloghi e i percorsi sono contenuto di
configurazione e non di codice.

### 4.2 Decreti ministeriali sulla telemedicina

**DM 23 maggio 2022, n. 77** - modelli e standard per lo sviluppo dell'assistenza territoriale.
Colloca la telemedicina dentro il modello organizzativo territoriale. Non detta requisiti software:
**determina il contesto** in cui la prestazione a distanza è appropriata.
*Dove è usata*: [01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md),
[`docs/08_compliance/01 §9`](../08_compliance/01-inquadramento-normativo.md).

**DM 21 settembre 2022** - GU n. 256 del 2 novembre 2022, atto 22A06184, Allegato A.
È **l'atto tecnicamente più prescrittivo** del quadro italiano. Fissa: i quattro servizi minimi di
telemedicina; l'architettura a micro-servizi e a eventi; l'interoperabilità su modello FHIR; i
contenitori; i modelli di distribuzione **su territorio nazionale**; il **paradigma mobile first**;
il multilingua; la conformità alle linee guida di design dei servizi digitali pubblici e a quelle
sull'accessibilità; la presenza organizzativa obbligatoria di **Centro servizi** tecnico e **Centro
erogatore** sanitario; i livelli di servizio di manutenzione vincolanti per i fornitori; e
l'**obbligo di certificazione come dispositivo medico** per il telemonitoraggio e per la
visualizzazione e refertazione nei teleconsulti istopatologici e radiologici.
*Dove si reperisce*: Gazzetta Ufficiale della Repubblica Italiana.
*Dove è usata*: [01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md),
[07](07-fse-e-infrastrutture-nazionali.md), [10](10-percorsi-di-cura-e-sicurezza.md),
[15](15-regolatorio-da-zero.md), [`docs/05_domain/`](../05_domain/00-indice.md) capitoli 01, 02,
03, 08, 09, [`docs/03_functional/01`](../03_functional/01-attori-e-ruoli.md) e
[`04`](../03_functional/04-regole-di-business.md),
[`docs/06_security/03`](../06_security/03-protezione-dei-dati.md) e
[`08`](../06_security/08-quadro-normativo-e-misure.md),
[`docs/08_compliance/01`](../08_compliance/01-inquadramento-normativo.md),
[`02`](../08_compliance/02-qualificazione-e-classificazione.md) e
[`03`](../08_compliance/03-sistema-di-gestione-della-qualita.md).
*Come si legge*: dopo l'Accordo 215/CSR, e con l'avvertenza che rinvia a **documenti metodologici non reperiti**, una lacuna da chiedere a una riunione tecnica presso il Ministero della salute ([07 §7.3](07-fse-e-infrastrutture-nazionali.md)) `[NV]`.

**DM 30 settembre 2022** - GU n. 298 del 22 dicembre 2022, atto 22A07125.
Disciplina la selezione delle soluzioni: piani operativi regionali, commissione tecnica, acquisto
**esclusivamente attraverso le gare delle regioni capofila** nel perimetro del piano nazionale.
L'**Allegato B** contiene una regola con effetto diretto sul modello: la televisita programmata ed
erogata da medico di assistenza primaria o pediatra **non richiede prescrizione** e produce
**annotazione digitale in luogo del referto**.
*Dove è usata*: [01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md),
[`docs/03_functional/01`](../03_functional/01-attori-e-ruoli.md),
[`02`](../03_functional/02-catalogo-dei-requisiti.md) e
[`04`](../03_functional/04-regole-di-business.md),
[`docs/05_domain/02`](../05_domain/02-le-prestazioni-modellate.md),
[`docs/08_compliance/01 §9`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: l'Allegato B è la parte che serve a chi progetta; il corpo del decreto serve a chi
si occupa di accesso al mercato pubblico.

### 4.3 Fascicolo sanitario elettronico e piattaforme nazionali

**Art. 12 del D.L. 18 ottobre 2012, n. 179**, convertito con modificazioni dalla **L. 17 dicembre
2012, n. 221**, come novellato dall'**art. 21 del D.L. 27 gennaio 2022, n. 4**, convertito con
modificazioni dalla **L. 28 marzo 2022, n. 25**.
È la **legge primaria** che istituisce il fascicolo sanitario elettronico e ne dà la definizione;
la novella del 2022 è ciò che comunemente si chiama «FSE 2.0».
*Dove è usata*: [02 §3](02-prestazioni-di-telemedicina.md),
[07 §2](07-fse-e-infrastrutture-nazionali.md).
*Come si legge*: **prima dei decreti attuativi.** La definizione legislativa qualifica il fascicolo
per il suo **contenuto** e non per l'infrastruttura che lo realizza, ed è la ragione per cui le
infrastrutture possono cambiare senza che cambi l'oggetto giuridico.

**DM 7 settembre 2023** - GU n. 249 del 24 ottobre 2023.
Quadro attuativo del fascicolo: contenuti, soggetti, consensi, alimentazione, consultazione,
profili di accesso per ruolo. Due disposizioni con effetto diretto e non negoziabile sul progetto:
l'**art. 11, comma 1**, che impone l'autenticazione con i canali nazionali di identità digitale;
l'**art. 15, comma 4**, che esclude **sempre** compagnie di assicurazione, periti e datori di
lavoro dall'accesso. L'**art. 12, comma 3** fissa il termine di alimentazione; gli **artt. 6 e 9**
disciplinano l'oscuramento e il divieto che sia inferibile.
*Dove è usata*: [01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md),
[07](07-fse-e-infrastrutture-nazionali.md),
[`docs/03_functional/04`](../03_functional/04-regole-di-business.md),
[`docs/05_domain/06`](../05_domain/06-consenso-e-riservatezza.md),
[`docs/07_integration/00`](../07_integration/00-indice.md) e
[`09`](../07_integration/09-obblighi-di-chi-integra.md),
[`docs/08_compliance/01 §9`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: l'art. 15 va letto per intero e non per la sola lettura del comma 4: l'elenco dei
soggetti ammessi e le loro condizioni è la base della matrice di autorizzazione.

**DM 31 dicembre 2024** - GU n. 53 del 5 marzo 2025.
Istituzione dell'ecosistema dei dati sanitari.
*Dove è usata*: [07](07-fse-e-infrastrutture-nazionali.md),
[`docs/08_compliance/01 §9`](../08_compliance/01-inquadramento-normativo.md).

**DM 19 novembre 2025** - GU n. 301 del 30 dicembre 2025, atto 25A06938.
Disciplina il trattamento dei dati nella piattaforma nazionale di telemedicina. È l'atto più
recente e quello con il maggior numero di conseguenze di prodotto. Le disposizioni che il progetto
usa: **art. 7**, che istituisce **dieci nuove tipologie documentali** del fascicolo dedicate alla
telemedicina, con set informativo pubblicato in gazzetta - è la fonte da cui discende il dataset
canonico del referto di televisita; **art. 12**, per cui le infrastrutture regionali **non
conservano** i dati e i documenti generati; **artt. 14-15**, registrazione delle operazioni e
misure di sicurezza; **Allegato 1, § 2.20**, il set informativo del referto di televisita;
**Allegato 3, § 5.1 e § 5.2**, autenticazione e profili di accesso; **Allegato 4**, che fissa i
termini di conservazione (ventiquattro mesi per i log di tracciabilità, dodici per i dati di
accesso e autenticazione), l'obbligo di secondo fattore in aggiunta all'identità digitale, il
divieto di accessi multipli contemporanei, e l'**obbligo di inventario delle componenti software
comprensive delle librerie di terzi e open source**.
*Dove è usata*: ventotto documenti del repository, fra cui
[01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md),
[03](03-il-dato-clinico.md), [04](04-identita-e-anagrafiche.md),
[07](07-fse-e-infrastrutture-nazionali.md), [10](10-percorsi-di-cura-e-sicurezza.md),
[12](12-crittografia-e-sicurezza.md), l'intera area di dominio,
[`docs/04_protocols/03`](../04_protocols/03-documenti-clinici.md),
[`docs/06_security/04`](../06_security/04-tracciamento.md) e
[`08`](../06_security/08-quadro-normativo-e-misure.md).
*Come si legge*: **gli allegati contano più del corpo.** E l'Allegato 4, § 7, **incorpora per
rinvio il capitolo di un capitolato tecnico di gara regionale** ed estende le misure ivi previste a
tutte le infrastrutture regionali. `[NV]` - quel capitolo **non è stato reperito**, un'assenza richiesta al Ministero della salute: finché non lo
si legge, nessuna affermazione di conformità a quelle misure è sostenibile.

### 4.4 Come questi atti si compongono

Le fonti del §4 formano una catena a quattro livelli, ricostruita in
[02 §3](02-prestazioni-di-telemedicina.md): **legge primaria** → **atti della Conferenza
Stato-Regioni** → **decreti ministeriali** → **regole tecniche trasversali della pubblica
amministrazione**. La forza vincolante decresce salendo di numero e l'operatività cresce: la legge
istituisce, l'accordo definisce, il decreto prescrive, la regola tecnica dice come si fa.

Ne discende la regola di citazione adottata in tutto il repository: **si cita il livello più basso
che contiene la prescrizione**, e si risale solo quando serve dimostrare che la prescrizione ha
fondamento. Citare la legge primaria per un requisito di formato è un errore di metodo che rende
la citazione inverificabile.

---

## 5. Normativa italiana - amministrazione digitale, identità, sicurezza

### 5.1 Codice dell'amministrazione digitale e identità

**Decreto legislativo 7 marzo 2005, n. 82** - Codice dell'amministrazione digitale.
Gli articoli usati dal progetto: **art. 64**, che disciplina il sistema pubblico per la gestione
dell'identità digitale e stabilisce, al comma 2-*quater*, che l'accesso ai servizi in rete delle
pubbliche amministrazioni che richiedono identificazione informatica avviene tramite i canali
nazionali; **art. 50-*ter***, base legale della piattaforma nazionale per l'interoperabilità dei
dati; **art. 71**, base delle linee guida AgID; **art. 52, comma 2**, sul riuso
dei dati delle pubbliche amministrazioni, usato per collocare due terminologie nel regime di
ridistribuzione condizionata.
*Dove è usata*: [04](04-identita-e-anagrafiche.md), [07](07-fse-e-infrastrutture-nazionali.md),
[12](12-crittografia-e-sicurezza.md),
[`docs/06_security/02`](../06_security/02-identita-e-accessi.md),
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md).

**DPCM 24 ottobre 2014**, art. 1, comma 1, lettera i).
Definisce il **fornitore di servizi** nella federazione delle identità come chi *eroga servizi in
rete*. È la fonte da cui discende il vincolo per cui **il progetto non può essere accreditato**:
il fornitore di servizi è chi installa.
*Dove è usata*: [04](04-identita-e-anagrafiche.md), decisione `D36`, vincolo [`V-05`](../11_registri/01-vincoli-in-vigore.md#v-05),
[`docs/07_integration/06`](../07_integration/06-identita-e-delega.md).

**Regole tecniche dei canali nazionali di identità digitale** e **Avviso AgID n. 41, versione 2,
del 23 marzo 2023** sull'uso di un protocollo di autenticazione alternativo.
Il fatto rilevante e verificato: **nessun gestore di identità del sistema pubblico supporta quel
protocollo in produzione**, quindi il canale utilizzabile resta l'asserzione firmata. La fonte è il
forum ufficiale presidiato dal gruppo di lavoro SPID, consultato il 25 agosto 2026, **da riverificare**.
*Dove è usata*: [04](04-identita-e-anagrafiche.md),
[07 §8](07-fse-e-infrastrutture-nazionali.md),
[`docs/06_security/02`](../06_security/02-identita-e-accessi.md),
[`docs/07_integration/06`](../07_integration/06-identita-e-delega.md).
*Come si legge*: **le regole tecniche prima del profilo di prodotto.** Il contesto di autenticazione
richiesto è configurato staticamente per istanza di fornitore di identità, e questo fatto ha una
conseguenza architetturale che si scopre tardi se si parte dalla documentazione del prodotto di
federazione.

**Legge 30 settembre 2003, n. 269** e **Legge 24 novembre 2003, n. 326**, per l'istituzione e la
disciplina della tessera sanitaria.
*Dove è usata*: [04](04-identita-e-anagrafiche.md),
[07 §4](07-fse-e-infrastrutture-nazionali.md).

**Decreto legislativo 25 luglio 1998, n. 286** e **decreto legislativo 9 aprile 2003, n. 70**,
citati in [04](04-identita-e-anagrafiche.md) rispettivamente per l'assistenza a soggetti privi di
codice fiscale ordinario e per il commercio elettronico.

### 5.2 Protezione dei dati, versante nazionale

**Decreto legislativo 30 giugno 2003, n. 196**, come modificato dal **decreto legislativo 10 agosto
2018, n. 101**. Codice in materia di protezione dei dati personali, adeguato al regolamento
europeo.
*Dove è usata*: [03](03-il-dato-clinico.md), [04](04-identita-e-anagrafiche.md).
*Come si legge*: **dopo** il regolamento europeo, mai prima. Il codice nazionale contiene ciò che
il regolamento rimette agli Stati membri, non una disciplina autonoma.

### 5.3 Sicurezza informatica nazionale

**Decreto legislativo 4 settembre 2024, n. 138** - recepimento della direttiva europea sulla
sicurezza delle reti e dei sistemi informativi. In vigore dal **16 ottobre 2024**. Individua i
soggetti **essenziali** e **importanti** per settore: la **sanità** è nell'Allegato I, la
**fabbricazione di dispositivi medici** nell'Allegato II. L'**art. 24, comma 2, lett. l)** e il
**comma 3** riguardano direttamente il rapporto con i fornitori.
*Dove è usata*: [03 §9](03-il-dato-clinico.md), [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/04`](../06_security/04-tracciamento.md),
[`07`](../06_security/07-catena-di-fornitura.md),
[`08`](../06_security/08-quadro-normativo-e-misure.md),
[`10`](../06_security/10-risposta-agli-incidenti.md),
[`docs/08_compliance/01 §4`](../08_compliance/01-inquadramento-normativo.md).

**Determinazione ACN n. 379907 del 19 dicembre 2025**.
Fissa le specifiche di base di sicurezza e, all'**art. 3, comma 1**, la regola del termine:
**diciotto mesi dalla ricezione della comunicazione di inserimento** nell'elenco. Applicabile dal
**15 gennaio 2026** (art. 9, comma 3); sostituisce la determinazione n. 164179 del 14 aprile 2025.
Catalogo confermato: **37 misure e 87 requisiti** per i soggetti importanti, **43 misure e 116
requisiti** per gli essenziali.
*Dove è usata*: [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/01`](../06_security/01-modello-di-minaccia.md) e
[`08`](../06_security/08-quadro-normativo-e-misure.md),
[`docs/08_compliance/01 §4`](../08_compliance/01-inquadramento-normativo.md),
[`docs/09_roadmap/00 §9.1`](../09_roadmap/00-indice.md).
*Come si legge*: **il termine non è una data.** «Il 31 ottobre 2026» non compare in alcun atto: è
il limite esterno della prima ondata. Il termine è soggettivo per ciascun destinatario, e questo è
il fatto che nessuna roadmap può cablare.
`[NV]` - gli **allegati di dettaglio non sono stati letti riga per riga**, la verifica spetta a `COMP`: nessun documento del
progetto cita testualmente un requisito puntuale. Si citano i codici delle misure, che sono
pubblici e verificati.

**Determinazione n. 127434 del 13 aprile 2026** - per i soggetti inseriti nel 2026: misure entro il
**31 luglio 2027**, notifiche dal **1° gennaio 2027**.
**Determinazione n. 127437 del 2026**, **art. 18** - obbligo di dichiarare nominativamente ad ACN
i **fornitori rilevanti**, con ragione sociale, codice fiscale, **Paese della sede legale**, codici
della nomenclatura degli appalti e criterio di rilevanza.
*Dove sono usate*: [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/08`](../06_security/08-quadro-normativo-e-misure.md),
[`docs/08_compliance/01 §4`](../08_compliance/01-inquadramento-normativo.md),
[`docs/09_roadmap/00 §9.1`](../09_roadmap/00-indice.md).
*Come si legge*: l'art. 18 della seconda è ciò che trasforma la sovranità del dato da argomento di
posizionamento a **dato che il cliente deve comunicare a un'autorità**. È il fondamento operativo
del vincolo sull'assenza di componenti obbligatori extra-UE.

**Legge 28 giugno 2024, n. 90** - disposizioni in materia di rafforzamento della cybersicurezza
nazionale. Riguarda le pubbliche amministrazioni, incluse le aziende sanitarie. **Art. 1**:
segnalazione entro ventiquattro ore e notifica completa entro settantadue. **Art. 8**: referente
per la cybersicurezza. **Art. 14**: contratti pubblici di beni e servizi informatici in contesti
connessi alla tutela di interessi nazionali strategici.
*Dove è usata*: [03 §9](03-il-dato-clinico.md),
[`docs/06_security/10`](../06_security/10-risposta-agli-incidenti.md),
[`docs/08_compliance/01 §4.1`](../08_compliance/01-inquadramento-normativo.md).

**DPCM 30 aprile 2025** (GU del 5 maggio 2025), come modificato dal **DPCM 2 ottobre 2025** -
elementi essenziali di cybersicurezza nei contratti pubblici, con criteri di premialità anche
geografici. `[NV]` - **i testi non sono stati letti su fonte primaria** in nessuna ricerca del
progetto, e non è verificato se una fornitura di telemedicina ricada nelle categorie tecnologiche
dell'allegato, una lacuna da chiudere con `COMP` in coordinamento con un consulente di appalti prima di qualunque uso in gara.
*Dove è usata*: [`docs/08_compliance/01 §4.1`](../08_compliance/01-inquadramento-normativo.md).

**Circolare AgID 18 aprile 2017, n. 2/2017** - misure minime di sicurezza per le
pubbliche amministrazioni, con la classificazione delle misure. Il progetto ne cita i **codici**
(fra cui `ABSC 2.1.1`, `2.3.3`, `3.5.1`, `4.7.1`, `4.8.1`, `4.8.2`, `5.6.1` e la classe 13), non il
testo dei singoli requisiti.
*Dove è usata*: [12](12-crittografia-e-sicurezza.md),
[`docs/06_security/04`](../06_security/04-tracciamento.md).

**Linee guida AgID sulla sicurezza nel procurement ICT**, appendice sui requisiti
di sicurezza eleggibili. Il progetto ne usa i requisiti **R30** (registrazione degli accessi su
archivio non cancellabile con il reset), **R33** (inventario dei componenti) e **R45**, e le azioni
`AP2`, `AP3`, `AP4` con il capitolo sulla protezione dei dati personali, che il DM 21 settembre
2022 rende obbligatorie per le infrastrutture regionali.
*Dove è usata*: [02 §appendice](02-prestazioni-di-telemedicina.md),
[12](12-crittografia-e-sicurezza.md),
[`docs/06_security/04`](../06_security/04-tracciamento.md) e
[`07`](../06_security/07-catena-di-fornitura.md).

### 5.4 Qualificazione dei servizi cloud

Tre atti distinti, con autorità, oggetto ed effetti diversi. Confonderli produce affermazioni di
conformità false, ed è la ragione per cui [07 §6](07-fse-e-infrastrutture-nazionali.md) li separa
esplicitamente.

| Atto | Che cosa stabilisce |
|---|---|
| **Determinazione ACN n. 306 del 18 gennaio 2022** | Metodologia di classificazione dei dati e dei servizi delle pubbliche amministrazioni in **strategici**, **critici** e **ordinari** |
| **Determinazione ACN n. 307 del 18 gennaio 2022** | Regolamento di qualificazione dei servizi cloud |
| **Decreto direttoriale ACN n. 21007/24 del 27 giugno 2024** | Nuovo regolamento unificato, applicabile dal **1° agosto 2024**; livelli **QC1-QC4** per i servizi e **QI1-QI4** per le infrastrutture |

*Dove sono usati*: [01 §appendice](01-sistema-sanitario-italiano.md),
[07 §6](07-fse-e-infrastrutture-nazionali.md).
*Come si legge*: **l'oggetto non è il software applicativo.** Sono i servizi cloud e le
infrastrutture che li ospitano, e la qualificazione la ottiene un fornitore di servizi, non un
progetto software. Il DM 19 novembre 2025, Allegato 4, richiama espressamente il regolamento
unificato.

### 5.5 Interoperabilità della pubblica amministrazione

**Linee guida sull'interoperabilità tecnica delle pubbliche amministrazioni** e **linee guida
«Tecnologie e standard per la sicurezza dell'interoperabilità tramite API dei sistemi
informatici»**, adottate con **Determinazione AgID n. 547 del 1° ottobre 2021** ai sensi
dell'art. 71 del Codice dell'amministrazione digitale e nel rispetto della procedura di notifica
della **Direttiva (UE) 2015/1535**. Definiscono pattern di interazione, di sicurezza e di
tracciatura. **Vincolanti per le pubbliche amministrazioni**, e richiamate dal DM 21 settembre 2022
fra le norme che le infrastrutture regionali devono rispettare.
*Dove sono usate*: [07 §5.2](07-fse-e-infrastrutture-nazionali.md),
[`docs/04_protocols/01`](../04_protocols/01-principi-di-interoperabilita.md).

**Linee guida sull'infrastruttura tecnologica della piattaforma digitale nazionale dati**, adottate
con **Determinazione AgID n. 627/2021** e **aggiornate a maggio 2025** (versione 2). Base legale:
art. 50-*ter* del Codice dell'amministrazione digitale.
*Dove sono usate*: [07 §5.3](07-fse-e-infrastrutture-nazionali.md).
*Come si legge*: il fraintendimento da evitare è documentato nel modulo - la piattaforma **non è un
proxy** e non trasporta i dati: interviene prima, per stabilire l'autorizzazione, e resta fuori dal
flusso.

### 5.6 Accessibilità, versante nazionale

**Legge 9 gennaio 2004, n. 4** - disposizioni per favorire e semplificare l'accesso degli utenti e,
in particolare, delle persone con disabilità agli strumenti informatici. È l'obbligo **diretto**
quando il cliente è una pubblica amministrazione, cioè nel caso d'uso principale del progetto.
**Decreto legislativo 27 maggio 2022, n. 82** - recepimento della direttiva europea
sull'accessibilità dei prodotti e dei servizi.
**Linee guida AgID sull'accessibilità** e **modello di dichiarazione di
accessibilità**.
*Dove sono usate*: [01 §appendice](01-sistema-sanitario-italiano.md),
[02 §appendice](02-prestazioni-di-telemedicina.md), [15 §8.5](15-regolatorio-da-zero.md),
[`docs/01_technical/04`](../01_technical/04-frontend.md),
[`docs/03_functional/06`](../03_functional/06-accessibilita-e-usabilita.md),
[`docs/08_compliance/01 §8`](../08_compliance/01-inquadramento-normativo.md) e
[`06`](../08_compliance/06-usabilita-e-accessibilita.md).
*Come si legge*: **la via diretta è la legge nazionale sul cliente pubblico**, non la direttiva
sull'accessibilità dei prodotti e servizi, il cui ambito soggettivo per la telemedicina è
controverso e da verificare da `COMP` `[NV]`.

### 5.7 Terminologie e cataloghi nazionali

| Fonte | Che cosa stabilisce | Dove è usata |
|---|---|---|
| **DM 18 dicembre 2008** | Adozione della versione italiana 2007 della classificazione internazionale delle malattie, nona revisione, modificazione clinica | [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md), [`docs/05_domain/07`](../05_domain/07-terminologie-nel-dominio.md) |
| **DM 23 giugno 2023** e **DM 26 novembre 2024** | Nomenclatore e catalogo nazionale delle prestazioni | idem |
| **Art. 5 della L. 22 aprile 1941, n. 633** | Esclusione dalla protezione del diritto d'autore degli atti ufficiali dello Stato: è il fondamento del regime di ridistribuzione condizionata delle due voci precedenti, insieme all'art. 52, comma 2, del Codice dell'amministrazione digitale | decisione `D31`, [`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md) |
| **Glossario nazionale di telemedicina, versione 1.0.0 del 29 gennaio 2026** | Vocabolario nazionale di riferimento | [`docs/05_domain/09`](../05_domain/09-glossario-del-dominio.md). **L'allineamento voce per voce non è stato eseguito** e va compiuto prima del congelamento del glossario di dominio e prima della traduzione ([`Q-146`](../11_registri/02-questioni-aperte.md#q-146)) |

---

## 6. Normativa europea

### 6.1 Dispositivi medici

**Regolamento (UE) 2017/745** del Parlamento europeo e del Consiglio, relativo ai dispositivi
medici. Applicabile dal **26 maggio 2021**, in sostituzione della direttiva 93/42/CEE.
È la fonte da cui dipende la qualificazione dell'intero prodotto. Le disposizioni effettivamente
usate nel repository:

| Riferimento | Che cosa stabilisce | Dove è usato |
|---|---|---|
| **Art. 2, punto 12** | Definizione di destinazione d'uso, ricavabile anche dal materiale promozionale | [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171), [`08_compliance/01 §11`](../08_compliance/01-inquadramento-normativo.md) |
| **Art. 2, punto 29** | Messa in servizio | [15 §3](15-regolatorio-da-zero.md), [`08_compliance/01 §12`](../08_compliance/01-inquadramento-normativo.md) |
| **Art. 2, punto 30** | Definizione di fabbricante, con **due elementi cumulativi** | [15 §3](15-regolatorio-da-zero.md), [`08_compliance/01 §2`](../08_compliance/01-inquadramento-normativo.md) |
| **Art. 5, paragrafo 5** | Esenzione per i dispositivi fabbricati e usati in istituzioni sanitarie - citata **solo per escluderla** | [`08_compliance/01 §2`](../08_compliance/01-inquadramento-normativo.md) |
| **Art. 7** | Divieto di dichiarazioni fuorvianti: vale **già oggi** e **non presuppone la marcatura** | [`V-171`](../11_registri/01-vincoli-in-vigore.md#v-171) |
| **Art. 8** | Presunzione di conformità delle norme armonizzate | [15 §5.1](15-regolatorio-da-zero.md) |
| **Art. 10** | Obblighi del fabbricante | [`08_compliance/01 §2`](../08_compliance/01-inquadramento-normativo.md) |
| **Artt. 11, 13, 14, 16 par. 1 lett. a)** | Mandatario, importatore, distributore, e la fattispecie del **prodotto in marchio bianco** | [`08_compliance/01 §2`](../08_compliance/01-inquadramento-normativo.md) |
| **Art. 61 e Allegato XIV** | Valutazione clinica | [`08_compliance/07`](../08_compliance/07-valutazione-clinica.md) |
| **Artt. 86-87** | Rapporto periodico di sicurezza, segnalazione degli incidenti gravi | [`08_compliance/08`](../08_compliance/08-sorveglianza-post-commercializzazione.md) |
| **Allegato I** | Requisiti generali di sicurezza e prestazione, comprese le §§ 17.2 e 17.4 sulla sicurezza informatica e le prescrizioni di lingua | [`08_compliance/04`](../08_compliance/04-fascicolo-tecnico.md), [`06_security/08`](../06_security/08-quadro-normativo-e-misure.md) |
| **Allegato II** | Contenuto della documentazione tecnica; la voce 1.1 b) riguarda l'identificativo unico | [`08_compliance/04`](../08_compliance/04-fascicolo-tecnico.md) |
| **Allegato VII, sez. 1.2.8** | Obbligo per gli organismi notificati di **pubblicare le proprie tariffe standard** | [15](15-regolatorio-da-zero.md), [`08_compliance/09`](../08_compliance/09-percorso-e-calendario.md) |
| **Allegato VIII, Regola 11** | Regola di classificazione del software | [10 §appendice](10-percorsi-di-cura-e-sicurezza.md), [15 §4](15-regolatorio-da-zero.md), [`08_compliance/02`](../08_compliance/02-qualificazione-e-classificazione.md) |
| **Allegato IX** e **Allegato XI** | Procedure di valutazione della conformità | [15 §6](15-regolatorio-da-zero.md), [`08_compliance/04`](../08_compliance/04-fascicolo-tecnico.md), [`09`](../08_compliance/09-percorso-e-calendario.md) |
| **Allegato XVI** | Prodotti senza finalità medica | [15 §2](15-regolatorio-da-zero.md) |

`[NV]` - la **numerazione puntuale di alcune sezioni** degli Allegati I, IX e XI, i codici di
designazione del regolamento di esecuzione, il numero del punto dell'art. 2 sull'incidente grave e
la ripartizione fra i paragrafi degli artt. 86 e 87 in funzione della classe **non sono stati
verificati sul testo**, da verificare da `COMP`.
*Dove si reperisce*: Gazzetta ufficiale dell'Unione europea, versione italiana.
*Come si legge*: **non da solo.** L'Allegato VIII, Regola 11, senza la linea guida che segue è
quasi illeggibile per un software.

**Regolamento (UE) 2017/746** - dispositivi medico-diagnostici in vitro. Citato per il confine di
ambito e per l'esclusione parallela dal regolamento sulla resilienza informatica.
*Dove è usato*: [15 §2](15-regolatorio-da-zero.md),
[`06_security/08`](../06_security/08-quadro-normativo-e-misure.md).

**Linee guida del gruppo di coordinamento sui dispositivi medici (MDCG).** Non sono atti
vincolanti, ma sono il documento su cui l'organismo notificato costruisce la propria valutazione:
discostarsene richiede una motivazione scritta, e questo le rende operativamente decisive.

| Documento | Che cosa contiene | Dove è usato |
|---|---|---|
| **MDCG 2019-11**, *Qualification and classification of software in Regulation (EU) 2017/745 and Regulation (EU) 2017/746*, **revisione 1 del giugno 2025** | L'albero decisionale di qualificazione in cinque passi; la casistica dell'Allegato I; la scomposizione della Regola 11 in tre sotto-regole al § 4.2.1; la **delimitazione dei moduli** al § 7; la matrice di orientamento dell'Allegato III | [10](10-percorsi-di-cura-e-sicurezza.md), [15](15-regolatorio-da-zero.md), [`08_compliance/01`](../08_compliance/01-inquadramento-normativo.md) e [`02`](../08_compliance/02-qualificazione-e-classificazione.md) |
| **MDCG 2019-16**, revisione 1 | Come soddisfare i requisiti dell'Allegato I in materia di sicurezza informatica | [12](12-crittografia-e-sicurezza.md), [15 §5.7](15-regolatorio-da-zero.md), [`08_compliance/03`](../08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **MDCG 2020-1** | Valutazione clinica del software: le **tre componenti dell'evidenza** - validità dell'associazione scientifica, prestazione tecnica o analitica, prestazione clinica. `[NV]` sulla revisione corrente, da verificare da `COMP` | [15 §7](15-regolatorio-da-zero.md), [`08_compliance/07`](../08_compliance/07-valutazione-clinica.md) |
| **MDCG 2018-5** | Criterio di **revisione maggiore** e identificativi unici del software | [15 §§7, 9](15-regolatorio-da-zero.md) |
| **MDCG 2020-3** | Modifiche significative. `[NV]` su ambito e revisione corrente, da verificare da `COMP`: i diagrammi decisionali sono ampiamente usati anche per i dispositivi certificati sotto il regolamento, e la trasposizione va verificata | [`08_compliance/08`](../08_compliance/08-sorveglianza-post-commercializzazione.md) |

**Documenti dell'*International Medical Device Regulators Forum*.** Usati per la matrice di
orientamento richiamata dall'Allegato III di MDCG 2019-11 Rev.1, che incrocia significato
dell'informazione e condizione sanitaria. La riga rilevante, riportata testualmente nella
documentazione del progetto, è che la tabella **non tiene conto del software di classe I**.
*Dove sono usati*: [15 §§4, 10](15-regolatorio-da-zero.md).

### 6.2 Protezione dei dati

**Regolamento (UE) 2016/679** - protezione delle persone fisiche con riguardo al trattamento dei
dati personali. Applicabile dal **25 maggio 2018**.
Disposizioni usate: **art. 4, punti 7 e 8** (titolare e responsabile), **punto 15** (dato relativo
alla salute), **art. 9** (categorie particolari), **art. 15, paragrafo 4** (limite al diritto di
ottenere copia quando lede diritti altrui), **art. 24, 26, 28** (responsabilità, contitolarità,
responsabile), **art. 25** (protezione fin dalla progettazione, rivolta al titolare),
**art. 32** (sicurezza, con l'obbligo di una **procedura per testare e valutare regolarmente**
l'efficacia delle misure), **art. 35, paragrafo 3, lettera b)** (valutazione d'impatto).
*Dove è usato*: [03](03-il-dato-clinico.md), [04](04-identita-e-anagrafiche.md),
[12](12-crittografia-e-sicurezza.md), l'intera area di sicurezza,
[`08_compliance/01 §3`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: **l'art. 4, punto 15, prima di tutto il resto.** Il presupposto che governa
l'intera area di sicurezza - il solo fatto che una persona abbia una sessione con uno specialista è
dato relativo alla salute - discende da lì, non da una valutazione discrezionale.

### 6.3 Sicurezza delle reti e resilienza dei prodotti

**Direttiva (UE) 2022/2555** - misure per un livello comune elevato di cibersicurezza nell'Unione.
Recepita in Italia dal decreto legislativo 4 settembre 2024, n. 138 (§5.3).
*Dove è usata*: [`06_security/08`](../06_security/08-quadro-normativo-e-misure.md),
[`08_compliance/01 §4`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: **dopo il decreto di recepimento e dopo le determinazioni**, non prima. Il
progetto lavora sull'attuazione nazionale, e la direttiva serve solo a ricostruire l'origine di una
regola.

**Regolamento (UE) 2024/2847** - requisiti orizzontali di cibersicurezza per i prodotti con
elementi digitali. In vigore dal **10 dicembre 2024**. Capo sugli organismi di valutazione della
conformità dall'**11 giugno 2026**; **obblighi di segnalazione dell'art. 14 dall'11 settembre
2026**; applicazione generale, requisiti essenziali e marcatura dall'**11 dicembre 2027**
(art. 71). Disposizioni usate: **art. 2, paragrafo 2** (esclusione dei prodotti coperti dalla
disciplina dei dispositivi medici, che **opera per prodotto e non per soggetto**); **art. 3, punto
14, e art. 24** (custode di software open source, che deve essere una **persona giuridica**).
*Dove è usato*: [12](12-crittografia-e-sicurezza.md), [15 §8](15-regolatorio-da-zero.md),
[`06_security/03`](../06_security/03-protezione-dei-dati.md),
[`07`](../06_security/07-catena-di-fornitura.md),
[`08`](../06_security/08-quadro-normativo-e-misure.md),
[`10`](../06_security/10-risposta-agli-incidenti.md),
[`08_compliance/01 §5`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: **l'art. 2, paragrafo 2, per primo**, perché determina quali artefatti del
progetto ricadono nel regolamento e quali no. La tabella artefatto → regime che ne discende è in
[`08_compliance/01 §5.1`](../08_compliance/01-inquadramento-normativo.md).

### 6.4 Responsabilità da prodotto

**Direttiva (UE) 2024/2853** - responsabilità per danno da prodotti difettosi. Termine di
recepimento **9 dicembre 2026**; si applica ai prodotti immessi sul mercato o messi in servizio
**dopo** tale data. Disposizioni usate: **art. 10** (presunzione di difettosità in caso di non
conformità a requisiti obbligatori di sicurezza del diritto dell'Unione), **art. 11** (esenzione
del fabbricante di un componente, che opera **solo** se le istruzioni del componente erano
corrette e complete), **art. 15** (divieto di esclusione contrattuale della responsabilità verso il
danneggiato).
*Dove è usata*: decisione `D28`,
[`08_compliance/01 §6`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: è l'**unica fonte del quadro che opera verso il danneggiato**, cioè verso una
persona che non ha accettato alcuna licenza. Le clausole di esclusione di garanzia della licenza
del progetto valgono fra le parti, non verso il paziente.
`[NV]` - la formulazione letterale dell'art. 4 e dei considerando sulla nozione di prodotto, e la
numerazione della norma italiana equivalente dopo il recepimento, **non sono verificate** da `COMP`.

### 6.5 Accessibilità

**Direttiva (UE) 2019/882** - requisiti di accessibilità dei prodotti e dei servizi. Recepita con
il decreto legislativo 27 maggio 2022, n. 82. Si applica ai prodotti e servizi immessi sul mercato
dal **28 giugno 2025**.
`[NV]` - **la telemedicina non è nominata** fra le categorie coperte; la qualificazione di un
servizio di videoconsulto come servizio di comunicazione interpersonale indipendente dal numero è
controversa e non accertata da `COMP`.

**Direttiva (UE) 2016/2102** - accessibilità dei siti web e delle applicazioni mobili degli enti
pubblici. In Italia opera attraverso la legge 9 gennaio 2004, n. 4, e le linee guida AgID.
Quando il cliente è una pubblica amministrazione, **l'obbligo è diretto**.
*Dove sono usate*: [15 §8.5](15-regolatorio-da-zero.md),
[`08_compliance/01 §8`](../08_compliance/01-inquadramento-normativo.md) e
[`06`](../08_compliance/06-usabilita-e-accessibilita.md).
*Come si legge*: la catena è **direttiva → norma tecnica europea → criteri di accessibilità dei
contenuti web**, e va percorsa in quest'ordine. La norma tecnica è al §9.

### 6.6 Spazio europeo dei dati sanitari

**Regolamento (UE) 2025/327** - spazio europeo dei dati sanitari. In vigore dal **26 marzo 2025**;
applicazione generale dal **26 marzo 2027**; il **capo III dal 26 marzo 2029**, e dal **26 marzo
2031** per i sistemi di cui all'art. 26, paragrafo 2. Il capo III introduce un regime di conformità
- documentazione tecnica, dichiarazione di conformità, marcatura, di regola **senza organismo
notificato** - per i **sistemi di cartella clinica elettronica**, definiti in funzione della
finalità di archiviare, intermediare, esportare, importare, convertire, modificare o visualizzare
dati sanitari elettronici personali appartenenti alle categorie prioritarie.
*Dove è usato*: [07 §10](07-fse-e-infrastrutture-nazionali.md), [15 §8.6](15-regolatorio-da-zero.md),
[`08_compliance/01 §7`](../08_compliance/01-inquadramento-normativo.md).
*Come si legge*: **è il punto meno intuitivo dell'intero quadro**, perché un prodotto può ricadervi
**pur non essendo un dispositivo medico**.
La **mappatura esatta delle date** per ciascuna disposizione e le definizioni dell'art. 2
vanno confermate sul testo da `COMP`, perché le fonti secondarie consultate divergono `[NV]`. È inoltre aperta la questione
se il progetto debba produrre anche il pacchetto documentale del capo III ([`Q-171`](../11_registri/02-questioni-aperte.md#q-171)).

### 6.7 Altre fonti europee di contesto

| Fonte | Che cosa stabilisce | Dove è usata |
|---|---|---|
| **Regolamento (UE) 2024/1689** | Sistemi di intelligenza artificiale. **Nessuna funzione attuale vi rientra**; una sola aggiunta cambierebbe regime, ed è per questo che l'introduzione di un componente di intelligenza artificiale è trattata come cambio di regime normativo e non come scelta tecnica ([`V-170`](../11_registri/01-vincoli-in-vigore.md#v-170)) | [15 §§2.8, 8.6](15-regolatorio-da-zero.md), [`08_compliance/02`](../08_compliance/02-qualificazione-e-classificazione.md) |
| **Regolamento (UE) 2023/2854** | Dati generati da prodotti connessi; **cambio di fornitore di servizi cloud**; interoperabilità | [15 §8.6](15-regolatorio-da-zero.md) |
| **Regolamento (UE) 2024/1183** | Quadro europeo dell'identità digitale | [03](03-il-dato-clinico.md), [12](12-crittografia-e-sicurezza.md) |
| **Direttiva (UE) 2015/1535** | Procedura di informazione nel settore delle regolamentazioni tecniche: è la procedura seguita per l'adozione delle linee guida nazionali sull'interoperabilità | [07 §5.2](07-fse-e-infrastrutture-nazionali.md) |
| **Direttiva 93/42/CEE** | Disciplina previgente sui dispositivi medici; citata solo per ricostruzione | [15](15-regolatorio-da-zero.md) |

---

## 7. Standard di interoperabilità sanitaria

Il modulo che li spiega è [05 - Gli standard di
interoperabilità](05-standard-di-interoperabilita.md); quello che dice **come il progetto li usa**
è l'[area protocolli](../04_protocols/00-indice.md). Qui ci sono gli estremi.

**Regola che governa tutto questo blocco:** una versione non dichiarata è una versione non
adottata. Ogni riga porta un numero esatto e uno stato di maturità.

### 7.1 FHIR e guide di implementazione

| Specifica | Versione fissata | Stato | Ruolo |
|---|---|---|---|
| **HL7 FHIR** | **4.0.1** | Normativa per le parti dichiarate tali | Standard di base del modello di interoperabilità. Il progetto dichiara `4.0.1`, non «R4»: `4.0.0` e `4.0.1` differiscono negli invarianti e nelle risorse di conformità generate |
| Guida **Televisita**, HL7 Italia | **0.2.0** | *trial-use*, draft al 17 settembre 2025 | Profilo predefinito per la prestazione e per il referto |
| Guida **Teleconsulto**, HL7 Italia | **0.2.0** | *trial-use* | Consulto fra professionisti |
| Guida **Teleassistenza**, HL7 Italia | **0.2.0** | *trial-use* | Prestazione assistenziale a distanza |
| Guida **Telemonitoraggio**, HL7 Italia | **0.2.0** | *trial-use* | Piani di rilevazione e parametri |
| Guida **IT-Core**, HL7 Italia | **0.2.0** | *trial-use*, draft al 30 luglio 2026 | Anagrafiche italiane |
| **Subscriptions R5 Backport** | **1.1.0** (11 gennaio 2023) | STU | Notifiche su risorse cliniche |
| **Extensions for Using Data Elements from FHIR R5 in FHIR R4** | **0.1.0** | STU, *maturity level 0* | Dettagli del servizio virtuale |
| **FHIR Bulk Data Access** | **3.0.0** | *trial-use*, attiva dall'11 dicembre 2025 | Portabilità ed esodo di un tenant |
| **HL7 Version 2 to FHIR** | **1.0.0** | STU 1, mappe **Informative** | Riferimento di mappatura, **mai base di una dichiarazione di conformità** |
| **SMART App Launch** | 2.x | Pubblicata | Contesto clinico e ambiti su autorizzazione delegata |
| **SMART Web Messaging** | **1.0.0** STU1, 6 maggio 2022 | Maturità inferiore: **documentato come sperimentale** | Dialogo fra applicazione incorporata e ospitante |

*Dove si reperiscono*: registro delle specifiche di HL7 International per le guide internazionali e
lo standard di base; registro di HL7 Italia per le guide nazionali.
*Dove sono usate*: [06](06-fhir-da-zero.md),
[`docs/04_protocols/02`](../04_protocols/02-fhir.md), l'area di dominio per il modello,
[`docs/07_integration/`](../07_integration/00-indice.md) per il contratto verso terzi.
*Come si legge*: **lo standard di base prima delle guide italiane.** Le guide sono in bozza e
incomplete: leggerle per prime produce la convinzione, sbagliata, che ciò che vi manca non esista.
Va inoltre tenuto presente che i **pacchetti delle guide non vengono copiati nel repository**: la
dichiarazione di licenza di una guida non dispone dei diritti di terzi sul contenuto ricompreso, e
la verifica va fatta **artefatto per artefatto**.

### 7.2 Messaggistica e documenti clinici

**HL7 versione 2.5.1** - messaggistica ospedaliera. La versione è fissata alla `2.5.1` perché è
quella in cui la struttura della schedulazione include il segmento di temporizzazione strutturata,
assente nelle versioni precedenti alla `2.5`.
**HL7 Transport Specification: MLLP** - incorniciamento dei messaggi su trasporto a flusso. Nudo è
in chiaro: il progetto lo usa **sempre** con mutua autenticazione a livello di trasporto.
*Dove sono usati*: [05 §4](05-standard-di-interoperabilita.md),
[`docs/04_protocols/04`](../04_protocols/04-hl7-v2.md).

**HL7 CDA release 2** - architettura dei documenti clinici. Nel progetto la serializzazione
documentale è **sostituibile** e il contenuto è modellato come dataset canonico ([`V-07`](../11_registri/01-vincoli-in-vigore.md#v-07)): nessun
modello documentale è cablato.
*Dove è usato*: [05 §5](05-standard-di-interoperabilita.md),
[`docs/04_protocols/03`](../04_protocols/03-documenti-clinici.md),
[`docs/05_domain/04`](../05_domain/04-documenti-clinici.md).
I **modelli, i codici di tipologia e i metadati di indicizzazione** delle dieci tipologie
documentali della telemedicina **non sono pubblicamente disponibili**, una lacuna segnalata in [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) che chiede verifica a `COMP` `[NV]`.

### 7.3 Profili di interoperabilità IHE

| Profilo | Revisione fissata | Stato |
|---|---|---|
| **ATNA** | Technical Framework infrastrutturale rev. **20.2** (11 novembre 2025) | Final Text |
| **CT** | Technical Framework infrastrutturale rev. **20.2** | Final Text |
| **MHD** | **4.2.5-comment** (16 giugno 2026) | *ballot*, **non** Final Text |
| **PIXm** | **3.1.0** (4 novembre 2025) | Trial Implementation |
| **PDQm** | **3.2.0** (4 novembre 2025) | Trial Implementation |
| **IUA** | rev. **2.5** (18 giugno 2026) | Trial Implementation |
| **BALP** | **1.1.4** (31 ottobre 2025) | Trial Implementation |

*Dove sono usati*: [05 §6](05-standard-di-interoperabilita.md),
[`docs/04_protocols/05`](../04_protocols/05-ihe.md).
*Come si legge*: **fissare la revisione non è un'ottimizzazione**: è la condizione perché due
installazioni dello stesso software si comportino allo stesso modo. Quattro profili su sette sono
in implementazione di prova, e uno è in commento pubblico.

### 7.4 Immagini

**DICOM PS3.18** - servizi web su immagini. Nel progetto è usato in sola consultazione e mai sul
canale video.
*Dove è usato*: [05 §7](05-standard-di-interoperabilita.md),
[`docs/04_protocols/05`](../04_protocols/05-ihe.md).

---

## 8. Standard tecnici generali

Il **catalogo ragionato**, con il problema risolto, il punto del progetto in cui ciascuno è usato e
lo stato di maturità, è in [13 §9 - I protocolli, tabella
riassuntiva](13-protocolli.md). Non si ripete qui. Questa sezione dice **dove si reperisce il testo
primario** e **come si verifica che una specifica non sia stata superata**, che è la parte che il
catalogo non contiene.

### 8.1 Le richieste di commento della comunità Internet

*Dove si reperiscono*: l'editore ufficiale delle richieste di commento e il tracciatore dei
documenti dell'ente di standardizzazione. Ogni documento porta, nella propria pagina, lo stato
corrente e - quando esiste - l'indicazione del documento che lo **obsoleta** o lo **aggiorna**.
*Come si verifica la vigenza*: si apre la pagina del documento e si guardano due campi, *Obsoleted
by* e *Updated by*. È una verifica di trenta secondi che il progetto richiede prima di ogni
citazione, e che intercetta gli errori più frequenti: la semantica del protocollo web è stata
riorganizzata, la specifica del protocollo di trasporto affidabile è stata sostituita, il formato
dei dettagli di problema ha un successore, le versioni più vecchie del protocollo di sicurezza del
canale sono deprecate.

Le famiglie effettivamente usate dal progetto, con il modulo che le tratta:

| Famiglia | Modulo di riferimento |
|---|---|
| Trasporto e web: instradamento, trasporto affidabile e non, trasporto multiplexato, sicurezza del canale, semantica e sintassi del protocollo web, canale bidirezionale a messaggi | [13 §§2-3](13-protocolli.md) |
| Interfacce applicative: codici di stato, negoziazione del contenuto, cache e validatori, concorrenza ottimistica, indicazione del momento di ritentare, deprecazione e dismissione, dettagli di problema | [13 §4](13-protocolli.md), [`04_protocols/06`](../04_protocols/06-api-di-progetto.md) |
| Identità e autorizzazione: autorizzazione delegata e sue buone pratiche, legatura del codice al client, difesa dallo scambio di emittente, asserzioni e chiavi verificabili, introspezione, revoca, **scambio di token con delega esplicita** | [13 §5](13-protocolli.md), [`04_protocols/08`](../04_protocols/08-identita-e-autorizzazione.md) |
| Firma dei messaggi e impronta del corpo | [13 §6](13-protocolli.md), [`04_protocols/07`](../04_protocols/07-eventi-e-webhook.md) |
| Tempo reale: attraversamento dei NAT, scoperta dell'indirizzo, relay, sicurezza del datagramma, cifratura del media, trasporto del media e sua misura, canale dati, descrizione della sessione | [08](08-webrtc-da-zero.md), [13 §7](13-protocolli.md) |
| Trasversali: allineamento e autenticazione degli orologi, risoluzione dei nomi e sue estensioni di sicurezza, serializzazione, rappresentazione degli istanti, modifiche parziali dei documenti | [13 §8](13-protocolli.md) |

**Due riferimenti di questa famiglia che il progetto tratta come vincoli e non come citazioni.**
Il primo: la specifica sulla raccolta incrementale dei candidati di connessione richiede la
consegna **esattamente una volta e nello stesso ordine**, e questo determina l'architettura della
segnalazione ([`V-131`](../11_registri/01-vincoli-in-vigore.md#v-131)). Il secondo: la specifica sullo scambio di token definisce il claim che
rappresenta la delega, e il progetto **non emette mai** un token che ne sia privo ([`V-132`](../11_registri/01-vincoli-in-vigore.md#v-132)).

### 8.2 Specifiche di altri enti

| Specifica | Ente | Versione | Ruolo nel progetto |
|---|---|---|---|
| **SAML [V2](../11_registri/03-vincoli-fondanti.md#v2).0**, 15 marzo 2005 | OASIS | 2.0 | Federazione con asserzioni firmate: è il protocollo **necessario** per il canale nazionale di identità più diffuso |
| **OpenID Connect Core 1.0** | OpenID Foundation | 1.0 | Autenticazione e identità. **Non è una richiesta di commento** |
| **HTML Living Standard**, sezione sugli eventi inviati dal server | WHATWG | standard vivo, **senza versione** | Spinta a senso unico verso il browser |
| **OpenAPI** | OpenAPI Initiative | 3.1 | Contratto verificabile da una macchina. Schema dei dati `2020-12` |
| **CloudEvents** | CNCF | 1.0; binding sul protocollo web **1.0.2** | Busta comune degli eventi. Contiene un **obbligo negativo esplicito** su un'intestazione, codificato nel progetto come prova negativa ([`V-134`](../11_registri/01-vincoli-in-vigore.md#v-134)) |
| **ECMA-404** | Ecma International | - | Sintassi di scambio dei dati, in parallelo alla richiesta di commento corrispondente |
| **Raccomandazioni sul linguaggio di marcatura estensibile** | W3C | - | Vincolo esterno, non scelta: documenti firmabili in parte |
| **Criteri di accessibilità dei contenuti web**, livello AA | W3C | **2.1** | Incorporati nella norma tecnica europea di accessibilità. Il progetto dichiara una sola non conformità, sul criterio **1.2.4** |
| **Specifiche del protocollo del broker di eventi** | progetto a monte | - | Specifica di **un'implementazione**, non di un ente di normazione: è un componente di terze parti da qualificare |
| **CycloneDX** | Formato della distinta dei materiali software, pubblicata per ogni rilascio e validabile contro lo schema. È il formato adottato dal requisito `SEC-043`. `[NV]` su ente pubblicatore e versione di riferimento, da verificare da `COMP` | `COMP` | Distinta dei materiali software |

*Come si legge questo blocco*: la colonna «ente» conta quanto la specifica. Una specifica di
progetto o di implementazione non ha lo stesso valore di uno standard di un organismo riconosciuto,
e il repository lo dichiara esplicitamente invece di appiattirle.

---

## 9. Norme tecniche di processo e di prodotto

Sono le norme su cui poggia il materiale regolatorio. **I loro testi sono a pagamento e non
riproducibili**: le descrizioni nella documentazione del progetto sono sintesi funzionali basate su
fonti pubbliche, e per lavorare seriamente su una di esse bisogna acquistarne il testo dal
catalogo dell'organismo di normazione nazionale o internazionale.

| Norma | Oggetto | Domanda a cui risponde | Dove è usata |
|---|---|---|---|
| **ISO 13485:2016** | Sistema di gestione della qualità per i dispositivi medici | *Come è organizzato chi produce il software?* | [15 §5.3](15-regolatorio-da-zero.md), [`08_compliance/03`](../08_compliance/03-sistema-di-gestione-della-qualita.md), [`09`](../08_compliance/09-percorso-e-calendario.md) |
| **IEC 62304:2006+A1:2015** | Ciclo di vita del software dei dispositivi medici. La clausola **8.1.2** richiede che ogni elemento di configurazione sia identificato per titolo, produttore e **versione** - è il fondamento del divieto di etichette di versione mobili ([`V-173`](../11_registri/01-vincoli-in-vigore.md#v-173)); la clausola **5.1.1** riguarda la tracciabilità | *Come è stato costruito e verificato?* | [15 §5.4](15-regolatorio-da-zero.md), [`01_technical/01`](../01_technical/01-stack-e-motivazioni.md) e [`09`](../01_technical/09-integrazione-continua-e-rilascio.md), [`08_compliance/03`](../08_compliance/03-sistema-di-gestione-della-qualita.md) |
| **ISO 14971:2019** | Gestione del rischio per i dispositivi medici | *Quali danni può causare e che cosa si è fatto per evitarli?* | [09](09-fondamenti-clinici.md), [10](10-percorsi-di-cura-e-sicurezza.md), [12](12-crittografia-e-sicurezza.md), [15 §5.5](15-regolatorio-da-zero.md), [`08_compliance/05`](../08_compliance/05-gestione-del-rischio.md) |
| **IEC 62366-1:2015+A1:2020** | Ingegneria dell'usabilità | *Come è stato progettato perché non lo si usi male?* | [04](04-identita-e-anagrafiche.md), [10](10-percorsi-di-cura-e-sicurezza.md), [15 §5.6](15-regolatorio-da-zero.md), [`01_technical/08`](../01_technical/08-qualita-e-test.md), [`08_compliance/06`](../08_compliance/06-usabilita-e-accessibilita.md) |
| **IEC 82304-1:2016** | Prodotto software sanitario | *In quale ambiente funziona e con quali limiti?* | [15 §5.7](15-regolatorio-da-zero.md) |
| **ISO/IEC 81001-5-1:2021** | Sicurezza nel ciclo di vita del software sanitario | *Come si difende, e come si gestiscono le vulnerabilità?* | [12](12-crittografia-e-sicurezza.md), [15 §5.7](15-regolatorio-da-zero.md), [`08_compliance/01 §5`](../08_compliance/01-inquadramento-normativo.md) |
| **ISO 20417** | Informazioni fornite dal fabbricante | *Che cosa deve dire l'etichetta - che per un software è una schermata* | [`08_compliance/04`](../08_compliance/04-fascicolo-tecnico.md) |
| **ISO 15223-1** | Simboli da utilizzare nelle informazioni fornite dal fabbricante | idem | [`08_compliance/04`](../08_compliance/04-fascicolo-tecnico.md) |
| **ISO/IEC 29115** | Quadro di garanzia dell'autenticazione dell'entità | *Quanto è forte l'autenticazione?* I livelli dichiarati dai canali nazionali corrispondono a **LoA2, LoA3 e LoA4** | [04](04-identita-e-anagrafiche.md), [07 §8.2](07-fse-e-infrastrutture-nazionali.md), [13](13-protocolli.md), [`06_security/02`](../06_security/02-identita-e-accessi.md) |
| **ISO 27799:2016** | Gestione della sicurezza delle informazioni in sanità; interpretazione sanitaria dei controlli di **ISO/IEC 27002**. Tratta espressamente la gestione degli accessi in emergenza | *Che cosa il settore sanitario aggiunge ai controlli generali?* | [12](12-crittografia-e-sicurezza.md) |
| **ISO 3166** | Codici dei paesi | Campi di indirizzo e identificatori | [04](04-identita-e-anagrafiche.md), [`04_protocols/04`](../04_protocols/04-hl7-v2.md) |
| **ISO/IEC 7498-1** | Modello di riferimento a strati per l'interconnessione dei sistemi aperti | Vocabolario dei livelli | [13 §1](13-protocolli.md) |
| **ISO/IEC 14496-10** | Codifica video avanzata | Codec del piano media | [08](08-webrtc-da-zero.md) |
| **EN 301 549** | Requisiti di accessibilità dei prodotti e servizi ICT; incorpora i criteri di accessibilità dei contenuti web di livello AA nelle clausole 9, 10 e 11. La **clausola 6** impone requisiti propri della comunicazione bidirezionale vocale e della videocomunicazione - qualità audio, comunicazione in tempo reale con testo, identificazione del chiamante, risoluzione e frequenza dei fotogrammi e sincronizzazione labiale sufficienti per la lingua dei segni | *Che cosa serve oltre i criteri web?* | [01](01-sistema-sanitario-italiano.md), [02](02-prestazioni-di-telemedicina.md), [15 §8.5](15-regolatorio-da-zero.md), [`01_technical/04`](../01_technical/04-frontend.md), [`08_compliance/01 §8`](../08_compliance/01-inquadramento-normativo.md) e [`06`](../08_compliance/06-usabilita-e-accessibilita.md) |
| **ETSI TS 119 312** | Suite crittografiche | *Quali meccanismi e quali dimensioni di chiave* | [08](08-webrtc-da-zero.md), [12](12-crittografia-e-sicurezza.md), [13](13-protocolli.md) |
| **Meccanismi crittografici concordati in ambito SOG-IS** | Riferimento europeo sui meccanismi | idem | [08](08-webrtc-da-zero.md), [12](12-crittografia-e-sicurezza.md) |

**Tre avvertenze che valgono più delle singole righe.**

**Prima, sull'armonizzazione.** Una norma **armonizzata** conferisce presunzione di conformità ai
requisiti coperti (art. 8 del regolamento sui dispositivi medici); una norma non armonizzata resta
utilizzabile come stato dell'arte ma non conferisce presunzione. Lo stato di
armonizzazione di **EN IEC 62304, EN IEC 62366-1, EN IEC 82304-1 ed EN ISO/IEC 81001-5-1** non è
univocamente accertato da `COMP`, perché le fonti secondarie divergono `[NV]`. Risultano invece pacificamente armonizzate
**EN ISO 13485:2016** ed **EN ISO 14971:2019**. Finché la verifica non è compiuta sull'elenco
consolidato più recente pubblicato dalla Commissione, la formulazione corretta è «applicata come
stato dell'arte», e la presenza nell'elenco va **verificata alla data d'uso**, non una volta per
sempre. La stessa avvertenza vale per **EN ISO 20417** ed **EN ISO 15223-1**.

**Seconda, sulla versione europea.** La stessa norma esiste in versione internazionale e in
versione europea recepita, e i due riferimenti non sono intercambiabili in un documento
regolatorio. Il repository usa entrambe le forme a seconda del contesto, e la differenza è
sostanziale quando si tratta di invocare la presunzione di conformità.

**Terza, sui parametri crittografici.** Nessun parametro si sceglie per abitudine: la fonte sono i
riferimenti della tabella, e ciò che non è stato letto sul testo si marca `[NV]`. È una scelta di
merito e non di prudenza redazionale: una ricetta crittografica cristallizzata produce sistemi
obsoleti che si credono sicuri.

---

## 10. Terminologie e sistemi di codifica

Il quadro completo, con titolare dei diritti, costo, ridistribuibilità, obblighi di attribuzione e
rischio residuo voce per voce, è in
[`THIRD-PARTY-TERMINOLOGY.md`](https://github.com/fedcal/Telemedic/blob/main/THIRD-PARTY-TERMINOLOGY.md).
Qui c'è la collocazione nei **quattro regimi** e la ragione, perché è ciò che determina se una
fonte può stare nel repository.

| Regime | Significato | Terminologie |
|---|---|---|
| **A** | Coesistenza piena nei sorgenti sotto la licenza del progetto | **LOINC** (con attribuzione obbligatoria), **HL7 Terminology**, **sistemi di codifica del nucleo FHIR** |
| **B** | Directory dedicata con licenza e attribuzione proprie | **Classificazione italiana delle malattie, versione 2007**, **nomenclatore e catalogo nazionale**, **codifica unificata delle unità di misura** |
| **C** | Acquisizione o interrogazione a runtime, a cura di chi installa | **SNOMED CT**, **pacchetti delle guide italiane**, **interfaccia programmatica dell'Organizzazione mondiale della sanità** |
| **D** | Esclusione totale: solo identificatore del sistema e codice | **ATC/DDD**, **ICD-10**, **ICD-11**, **CVX** nella versione 1.0, **terminologia DICOM**, **documenti dello standard di messaggistica ospedaliera**, **Technical Framework dei profili di interoperabilità** |

**Le fonti primarie delle licenze**, che sono ciò che determina il regime:

- **Accordo di licenza per gli affiliati di SNOMED International**, con le clausole usate dal
  progetto: **2.2.5** (uso per riferimento nei messaggi clinici), **2.5.3, 2.5.4 e 8.8** (catena di
  sub-licenza), **2.7** (contenuto non accessibile se non a utenti autorizzati, **incompatibile con
  un repository pubblico**), **8.3.1 e 8.3.2** (avvisi e indicazione di versione e data della
  release), **Appendice A** (definizione di sistema di trattamento dei dati). L'accordo **si
  perfeziona scaricando o accedendo** al contenuto: la posizione del progetto regge finché nessuno
  lo scarica. Regolato dal diritto inglese, con giurisdizione esclusiva delle corti inglesi.
- **Licenza LOINC del Regenstrief Institute**, con l'obbligo di avviso del **§ 3.3** e
  l'avvertenza che le **traduzioni sono opere derivate assegnate al titolare**.
- **Termini d'uso del centro collaborativo per la metodologia statistica sui farmaci** per la
  classificazione anatomica terapeutica chimica, che vietano copia e distribuzione a fini
  commerciali e ogni modifica.
- **Termini d'uso dell'Organizzazione mondiale della sanità** per l'undicesima revisione della
  classificazione delle malattie, con i §§ **1.2.3**, **1.2.4**, **1.3** e **4.5**. Regolati dal
  diritto svizzero, con arbitrato.
- **Licenza della codifica unificata delle unità di misura**, con l'avvertenza che è **revocabile**
  e che i derivati sono vietati.
- **Licenza dei Technical Framework dei profili di interoperabilità**, non sub-licenziabile: la
  citazione ammessa è per indirizzo e revisione.

*Come si legge questo blocco.* **Una dichiarazione di licenza apposta su un contenitore non dispone
dei diritti di terzi sul contenuto ricompreso.** È il principio generale che il progetto ha
adottato dopo aver verificato che una guida di implementazione può dichiarare una licenza
permissiva e includere contenuto di terzi che quella licenza non copre. La verifica va fatta
**artefatto per artefatto**, e non per dichiarazione del pacchetto.

*Avvertenza che nessuna documentazione può attenuare.* **Interrogare un servizio terminologico
esterno gestito da terzi non esonera dall'obbligo di licenza**, perché un sistema che crea o
analizza dati codificati è a sua volta un sistema di trattamento dei dati ai sensi dell'accordo. Il
sistema è comunque **pienamente funzionale** con la terminologia onerosa disattivata ([`V-03`](../11_registri/01-vincoli-in-vigore.md#v-03)), e il
costo di quella scelta è dichiarato, non taciuto.

---

## 11. Come si verifica che una fonte sia ancora vigente

Una norma abrogata citata come vigente è un errore che si propaga in tutta la documentazione: viene
copiato in un altro capitolo, poi in una risposta a un capitolato, poi in un documento che qualcuno
firma. Il metodo è diverso per famiglia di fonte, e in tutti i casi produce **una data di
consultazione da registrare**.

### 11.1 Atti normativi italiani

Si parte dalla **Gazzetta Ufficiale**, che è la fonte di pubblicazione, e si passa alla **versione
consolidata** della banca dati normativa ufficiale, che riporta le modifiche successive. Tre
controlli, in ordine:

1. **L'atto è ancora in vigore?** Una banca dati consolidata segnala l'abrogazione e l'atto che
   l'ha disposta.
2. **L'articolo che citi è ancora quello?** Le novelle rinumerano, inseriscono commi *bis* e
   spostano contenuti. Citare un articolo con il numero che aveva prima di una novella è l'errore
   più frequente e il più difficile da individuare, perché l'atto esiste e il numero esiste.
3. **Esiste un atto attuativo che ha sostituito la disciplina applicabile?** È il caso tipico delle
   determinazioni delle autorità, che si sostituiscono a cadenza ravvicinata: la determinazione
   sulle specifiche di sicurezza in vigore ha **sostituito** quella dell'anno precedente, e citare
   la precedente non produce un errore visibile.

**Regola aggiuntiva per gli atti della Conferenza Stato-Regioni:** verificare anche il
**recepimento regionale**, perché l'efficacia diretta sul singolo erogatore passa da lì.

### 11.2 Atti dell'Unione europea

Si usa la banca dati ufficiale del diritto dell'Unione. Tre controlli:

1. **Versione consolidata contro versione originaria.** La versione consolidata non è la versione
   pubblicata: se citi un articolo modificato, dichiara quale versione stai citando.
2. **Date di applicazione differite.** Un regolamento in vigore non è un regolamento applicabile, e
   molti di quelli citati qui hanno disposizioni con decorrenze diverse. Il progetto lo tratta come
   informazione di prima classe, non come nota.
3. **Atti di esecuzione e delegati.** Sono la parte che cambia più spesso e che contiene i
   dettagli operativi.

### 11.3 Linee guida non vincolanti

Le linee guida del gruppo di coordinamento sui dispositivi medici e i documenti analoghi si
verificano sull'**elenco pubblicato dall'ente che le emana**, e il controllo è sulla **revisione**:
una revisione nuova può cambiare l'esito di una qualificazione senza che il regolamento sia
cambiato. È accaduto: la revisione più recente della linea guida sulla qualificazione del software
ha riscritto la sezione sulla delimitazione dei moduli.

### 11.4 Norme tecniche

Due controlli distinti, che il progetto tiene separati.

**Il primo è sull'edizione:** l'organismo di normazione pubblica revisioni e modifiche, e una norma
citata senza anno è una citazione inverificabile. Il progetto cita sempre l'anno, e dove esiste una
modifica la cita nella forma completa.

**Il secondo è sull'armonizzazione**, e vale solo nel contesto dei dispositivi medici: si verifica
sull'**elenco consolidato pubblicato dalla Commissione**, e va verificato **alla data d'uso**.
L'inclusione in quell'elenco è ciò che conferisce presunzione di conformità: non è una proprietà
permanente della norma, ed è la ragione per cui la documentazione del progetto usa la formula
«applicata come stato dell'arte» finché la verifica non è compiuta.

### 11.5 Specifiche tecniche

Per le richieste di commento della comunità Internet: i campi *Obsoleted by* e *Updated by* sulla
pagina del documento. Per le guide di implementazione e i profili: la **versione del pacchetto**
nel registro dell'ente, con la data e lo stato di maturità. Per gli standard vivi, che non hanno
versione: si registra la **data di consultazione**, che è l'unico riferimento possibile.

### 11.6 La regola che chiude

**Ogni citazione che dipende dal tempo porta con sé, nel documento che la usa, l'indicazione della
data a cui è stata verificata.** È l'unico modo per distinguere una fonte controllata di recente da
una controllata due anni fa, e per sapere che cosa va rifatto quando qualcosa cambia. Il repository
lo applica in modo disuguale: **portarlo a uniformità è un contributo aperto e utile**
([18 §14.2](18-contribuire-per-area.md)).

---

## 12. Le fonti che questo progetto ha deciso di non usare

L'elenco esiste perché **l'assenza di una fonte viene letta come una dimenticanza**, e in alcuni
casi è invece una decisione con una motivazione precisa.

### 12.1 Contenuti terminologici esclusi

**Classificazione anatomica terapeutica chimica e dosi definite giornaliere.** Esclusa in ogni
forma. Motivo: i termini del titolare **vietano copia e distribuzione a fini commerciali e ogni
modifica**, e sono frontalmente incompatibili con la licenza permissiva del progetto. Mitigazione a
costo zero: in Italia la codifica operativa del farmaco è l'autorizzazione all'immissione in
commercio. L'identificatore canonico del sistema resta usabile perché **è un identificatore, non un
indirizzo**.

**Decima e undicesima revisione della classificazione internazionale delle malattie.** Escluse in
ogni forma. Per l'undicesima il divieto discende dalla clausola che vieta i derivati e dalla
manleva imposta; per la decima il regime non è accertato da `COMP`, ed è la ragione per cui la
prudenza prevale `[NV]`. Nota verificata sull'identificatore: l'identificatore corretto della undicesima
revisione **non è** quello che molte fonti secondarie riportano.

**Contenuto SNOMED CT.** Non scaricato, non incluso, non incorporato in esempi, prove o insiemi di
valori. Motivi cumulativi: la clausola che impone che il contenuto non sia accessibile se non a
utenti autorizzati è **incompatibile con un repository pubblico**; la catena di sub-licenza è
incompatibile per costruzione con la licenza permissiva del progetto; e l'accordo si perfeziona
**accedendo** al contenuto, quindi la posizione regge solo finché nessuno vi accede.

**Terminologia DICOM, documenti dello standard di messaggistica ospedaliera, Technical Framework
dei profili di interoperabilità, terminologia procedurale dell'associazione medica statunitense.**
Escluse come contenuto; ammesso l'uso per riferimento tramite identificatore di sistema e codice, e
la citazione per indirizzo e revisione.

**Codici delle vaccinazioni statunitensi**, esclusi nella versione 1.0 perché il regime di licenza
non è accertato e va verificato da `COMP` `[NV]`: il rischio è azzerato escludendoli dal perimetro.

### 12.2 Fonti tecniche e di metodo escluse

**Riferimento a un programma nazionale di validazione dei moduli crittografici.** Rimosso dai claim
pubblici per decisione esplicita e sostituito dai riferimenti europei e nazionali della tabella al
§9. Motivo: era una dichiarazione non sostenibile, riferita a un regime di certificazione che il
progetto non ha e che non è quello pertinente nel contesto europeo.

**Raccomandazioni internazionali sul punteggio di opinione media.** Non usate come base
dell'indice di qualità della sessione. Motivo: i modelli classici sono di **pianificazione** di reti
a banda stretta, i fattori per la codifica audio moderna non sono standardizzati e per il video non
esiste nulla di applicabile al tempo reale. L'indice del progetto è **proprietario e dichiarato
tale** ([`V-114`](../11_registri/01-vincoli-in-vigore.md#v-114)).

**Bozze scadute o non standardizzate presentate come standard.** L'intestazione per la chiave di
idempotenza è una **bozza scaduta e archiviata**; quelle per la limitazione del traffico sono una
**bozza attiva**, e la forma a tre campi non è mai stata standard. Il progetto le usa e le dichiara
per ciò che sono ([`V-133`](../11_registri/01-vincoli-in-vigore.md#v-133)).

**Mappe fra messaggistica ospedaliera e risorse cliniche come base di conformità.** Sono documenti
**informativi**: si usano come riferimento di mappatura, mai per dichiarare conformità.

### 12.3 Categorie di fonte escluse per metodo

**Le fonti secondarie.** Riassunti, articoli divulgativi, note di studi professionali,
presentazioni di convegno e risposte di sistemi automatici **non sono fonti** in questa
documentazione. Possono servire a trovare la fonte primaria; non a citarla. La regola è enunciata
senza attenuazioni nell'`COMP`: *le fonti si citano, non si ricordano*; un riferimento
proviene dal testo o è marcato come non verificato, e non esiste una terza possibilità.

**Gli identificativi di vulnerabilità non letti sulla fonte che li pubblica.** Il progetto descrive
i difetti dei componenti per **meccanismo e versione di correzione**, che è la forma utile a chi
deve decidere la versione minima da distribuire, e rinvia per gli identificativi puntuali alla
verifica documentata. Motivo: gli identificativi cambiano stato e valutazione nel tempo, e un
documento che li cablasse invecchierebbe peggio della descrizione del meccanismo.

**I requisiti puntuali delle misure nazionali di sicurezza, prima della lettura riga per riga degli
allegati.** Si citano i **codici**, che sono pubblici e verificati, e si marca come non verificato
il contenuto dei singoli requisiti ([`Q-151`](../11_registri/02-questioni-aperte.md#q-151)).

**I documenti di gara e i documenti metodologici non pubblicati**, quando non reperiti. Sono citati
come **rinvio esistente e non soddisfatto**, con marcatura `[NV]` che va chiusa da `COMP`, e mai come fonte di
un'affermazione di conformità. Riguarda almeno due casi documentati: il capitolo di capitolato
tecnico incorporato per rinvio da un allegato ministeriale, e i documenti metodologici richiamati
da un decreto del 2022.

**Le stime al posto di una fonte pubblicata.** Dove esiste un obbligo di pubblicazione - come per
le tariffe standard degli organismi notificati - il progetto **non stima** e rinvia alla fonte
primaria. In presenza di una fonte, stimare è un errore di metodo.

---

## 13. Che cosa questo elenco non garantisce

Va detto esplicitamente, perché un elenco di fonti induce fiducia più di quanto meriti.

**Non garantisce che il testo integrale di ciascuna fonte sia stato letto.** Garantisce che
l'estremo sia quello effettivamente usato nei documenti del repository che lo citano, e che le
marcature `[NV]` segnalino ciò che non è stato verificato.

**Non garantisce la vigenza alla data in cui lo stai leggendo.** Le date di questo elenco sono
quelle registrate nei documenti che le usano; il metodo per riverificarle è al §11 e la
riverifica è a carico di chi usa la fonte.

**Non è una bibliografia di completezza.** Non contiene le fonti che sarebbe ragionevole
consultare: contiene quelle su cui il repository poggia. Una fonte pertinente e assente è una
segnalazione utile, non un difetto di questo elenco.

**Non sostituisce la lettura.** Nessun estremo, per quanto preciso, sostituisce il testo. Questo
modulo dice **dove guardare**, non **che cosa il testo dice**: quest'ultima è materia dei moduli e
delle aree, che vi rinviano.

**La condizione perché resti vero nel tempo, posta come vincolo ([`V-195`](../11_registri/01-vincoli-in-vigore.md#v-195)).** Un inventario di
fonti si degrada in un modo solo: una nuova fonte entra in un capitolo e non entra qui, e da quel
momento l'elenco è incompleto senza che nessuno se ne accorga. La regola che lo previene è
semplice e verificabile: **nessuna area introduce nella documentazione una fonte primaria nuova
senza inserirla in questo modulo con i suoi estremi completi e con la data alla quale è stata
verificata.** Non è un adempimento redazionale: è ciò che rende possibile, quando una norma cambia,
sapere in un solo passaggio quali documenti ne dipendono. Il meccanismo di registrazione della data
è la questione [`Q-199`](../11_registri/02-questioni-aperte.md#q-199).

---

## 14. Punti non verificati e questioni aperte

| Riferimento | Che cosa manca | A chi spetta |
|---|---|---|
| `[NV]` | Capitolo di capitolato tecnico incorporato per rinvio dall'Allegato 4 del DM 19 novembre 2025: **non reperito**. Finché non lo si legge, nessuna affermazione di conformità a quelle misure è sostenibile | `COMP` |
| `[NV]` | Documenti metodologici richiamati dal DM 21 settembre 2022 per i requisiti funzionali dei micro-servizi: **non reperiti** | `COMP` |
| `[NV]` | Allegati di dettaglio della determinazione sulle specifiche di sicurezza di base: non letti riga per riga, questione aperta in [`Q-151`](../11_registri/02-questioni-aperte.md#q-151) | `COMP` |
| `[NV]` | Testi dei due decreti del Presidente del Consiglio sugli elementi essenziali di cybersicurezza nei contratti pubblici, e verifica dell'applicabilità alle categorie tecnologiche | `COMP` con consulente di appalti |
| `[NV]` | Numerazione puntuale di alcune sezioni degli Allegati I, IX e XI del regolamento sui dispositivi medici; codici di designazione; numero del punto sull'incidente grave; ripartizione fra i paragrafi degli artt. 86 e 87 in funzione della classe | `COMP` |
| `[NV]` | Definizioni e mappatura delle date del regolamento sullo spazio europeo dei dati sanitari | `COMP` |
| `[NV]` | Stato di armonizzazione di quattro norme tecniche di processo e di due norme sulle informazioni fornite dal fabbricante | `COMP` |
| `[NV]` | Versione della norma tecnica europea di accessibilità citata a supporto della direttiva sui prodotti e servizi | `COMP` |
| `[NV]` | Formulazione letterale della nozione di prodotto nella direttiva sulla responsabilità, e numerazione della norma italiana di recepimento | `COMP` |
| `[NV]` | Modelli documentali, codici di tipologia e metadati di indicizzazione delle dieci tipologie della telemedicina, questione aperta in [`Q-07`](../11_registri/02-questioni-aperte.md#q-07) | `COMP` |
| `[NV]` | Regime di licenza di due voci terminologiche e regime della decima revisione della classificazione delle malattie | `COMP` |
| [`Q-146`](../11_registri/02-questioni-aperte.md#q-146) | Allineamento voce per voce al glossario nazionale, da compiere **prima** del congelamento del glossario di dominio e prima della traduzione | Dominio |
| [`Q-199`](../11_registri/02-questioni-aperte.md#q-199) | **Registro delle verifiche di vigenza**: oggi la data di consultazione è registrata in modo disuguale nei documenti. Serve una forma unica e un innesco periodico, altrimenti il §11 resta un metodo senza applicazione verificabile | → orchestrazione, con conformità |

---

## Cosa devi ricordare

1. **L'ordine di lettura conta più dell'elenco.** Definizioni, poi requisiti funzionali, poi
   destinazione dei documenti, poi qualificazione del prodotto, poi obblighi di chi installa, poi
   formato dello scambio. Percorrerlo al contrario fa perdere giorni.
2. **Si cita il livello più basso che contiene la prescrizione.** Citare la legge primaria per un
   requisito di formato rende la citazione inverificabile.
3. **Una versione non dichiarata è una versione non adottata.** Vale per gli standard, per le guide
   di implementazione e per i profili: senza numero e stato di maturità la citazione non è
   utilizzabile.
4. **Il regolamento sui dispositivi medici non si legge da solo.** L'albero di qualificazione del
   software è nella linea guida, e una revisione di quella può cambiare l'esito senza che il
   regolamento sia cambiato.
5. **La fonte italiana rinvia due volte a documenti non pubblicati in gazzetta.** È il quadro
   reale, ed è un rischio di tracciabilità da dichiarare, non da nascondere.
6. **Una dichiarazione di licenza sul contenitore non dispone dei diritti di terzi sul contenuto.**
   La verifica è artefatto per artefatto.
7. **La vigenza si verifica alla data d'uso, non una volta per sempre.** Vale in particolare per lo
   stato di armonizzazione di una norma tecnica e per le determinazioni delle autorità, che si
   sostituiscono a cadenza ravvicinata.
8. **Le fonti si citano, non si ricordano.** Un riferimento proviene dal testo o è marcato come non
   verificato. Non esiste una terza possibilità, e la memoria di chi scrive non è una fonte.

