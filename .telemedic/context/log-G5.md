# log-G5 — Modulo 04 «Identità e anagrafiche»

> **Agente**: G5 · **Data**: 25 agosto 2026 · **Decisione di riferimento**: D35, blocco A della
> guida dei fondamenti; decisioni D36, D37, D38.
> **Deliverable unico**: `docs/10_fondamenti/04-identita-e-anagrafiche.md`
> (frontmatter `title: Identità e anagrafiche`, `sidebar_position: 5`, `description`).

---

## 1. Conteggio

| Metrica | Valore |
|---|---|
| Righe totali | **2.398** |
| Righe non vuote | **1.948** |
| Parole (stima) | **≈ 21.000** — ampiamente oltre il minimo di 8.000 richiesto dal mandato |
| Sezioni numerate | 12, più «Cosa devi ricordare» e «Termini introdotti» |
| Diagrammi Mermaid | **6** — i due errori di identità (`flowchart`); modello persona/ruolo/organizzazione (`erDiagram`); catena di riconciliazione con soglie e coda umana (`flowchart`); flusso di autenticazione federata (`sequenceDiagram`); macchina a stati dell'identificazione a distanza (`stateDiagram-v2`); catena di delega con verifica per singolo atto (`flowchart`) |
| Tabelle | **34** |
| Marcature `[NV]` | **11**, tutte raccolte nel § 12 con il destinatario della richiesta |
| Marcature `[V]` | 7, sui valori di `system` FHIR e sui codici di tipo identificatore verificati in B6 |

> Il conteggio parole è una stima derivata dalle righe non vuote: nessuno strumento di
> conteggio era disponibile all'agente in questa sessione (nessun accesso a shell). Il margine
> rispetto alla soglia rende la stima non critica.

---

## 2. Struttura del modulo

| § | Contenuto |
|---|---|
| — | Intro: le quattro domande del modulo, rapporto con i moduli 07 (§ 8 — sintesi operativa), 02 (§ 10.2), 01 (§ 5), 13; convenzione `[NV]`; distinzione «la norma stabilisce» / «è prassi» / «il progetto propone» |
| 1 | **Il problema dell'identità in sanità**: perché la stessa persona esiste sette volte; i due errori simmetrici (duplicato → danno per omissione; sovrapposizione → danno per commissione + violazione di dati); **perché la fusione errata è un evento avverso** (ISO 14971, gravità del danno possibile; funzioni legate alla sicurezza ai sensi di IEC 62366-1); vocabolario a sei voci; le cinque proprietà di un identificatore |
| 2 | **Gli identificatori dell'assistito**: codice fiscale (D.P.R. 605/1973, D.M. 23 dicembre 1976; struttura carattere per carattere); omocodia con la tabella di sostituzione e i quattro difetti che genera; sei casi patologici (neonato, rettifica, cambio di cognome, rettificazione di sesso ex L. 164/1982, straniero non iscritto, decesso); STP ed ENI; tessera sanitaria e TEAM; codice ANA e identificativi regionali; identificativo interno dell'erogatore; **due tabelle riassuntive** e le cinque regole di modellazione |
| 3 | **Il codice fiscale nei sistemi informativi**: il dominio di attribuzione; **la divergenza verificata degli URI di sistema** fra *IT Base*/*Televisita* e *IT-Core*, con la raccomandazione operativa in quattro punti; il codice di tipo identificatore (`NNxxx`, non `NN`); i tre divieti («non è un segreto, non è una password, non è uno pseudonimo») |
| 4 | **Le anagrafiche**: ANPR (art. 62 CAD, D.P.C.M. 194/2014), ANA (art. 62-*ter* CAD), anagrafiche aziendali; **allineamento a precedenza per campo** con tre regole; **riconciliazione** deterministica e probabilistica con diagramma e cinque scelte di progetto; domicilio ≠ residenza; **quattro sopravvenienze** (decesso, trasferimento, cambio del medico, maggiore età) con la regola «nessun diritto memorizzato come permesso»; **identità pseudonimizzata** e i suoi quattro limiti |
| 5 | **L'identità del professionista**: ordini e albi (d.lgs.C.p.S. 233/1946, D.P.R. 221/1950, L. 3/2018); iscrizione **territoriale** e non nazionale; stato dell'iscrizione; albi e sezioni; atti riservati e art. 348 c.p.; **modello persona/ruolo/organizzazione** con `erDiagram`; **l'errore della specialità come attributo**, con tabella delle cinque domande a cui l'attributo non risponde; ciclo di vita del ruolo e **autorizzazione a tre livelli** (titolo / veste / relazione di cura); attori non clinici e principali applicativi |
| 6 | **L'identità digitale**: art. 64 CAD comma per comma; **chi è obbligato a cosa** per scenario di installazione; SPID (federazione, ordine casuale, assenza di sessione condivisa in L2/L3, codici di anomalia); CIE (gestore unico, tre livelli, **solo quattro attributi**, vantaggi operativi); TS-CNS (nessuna federazione, elenco di fiducia, due avvertenze di prodotto, la trappola dell'iniezione di intestazioni); tabella «chi rilascia / chi verifica / cosa costa»; **§ 6.6 — il progetto non può essere accreditato**, con la ragione giuridica in cinque passaggi, la formula pubblica e la ripartizione delle attività |
| 7 | **I livelli di garanzia**: che cosa misurano davvero; `SpidL1|L2|L3` ↔ ISO/IEC 29115 LoA2/3/4 **con l'avvertenza sullo scarto di numerazione**; correlazione eIDAS e art. 64 c. 2-*duodecies*; **quale livello serve e perché la risposta è scomoda** (appendice esemplificativa vs prassi FSE, con cinque argomenti); **§ 7.4 — la trappola verificata sull'asserzione CIE**; **§ 7.5 — due valori (richiesto e dichiarato)**, il livello asseribile per TS-CNS come stima di progetto, e la regola «il canale più debole determina la sicurezza dell'account» |
| 8 | **I protocolli spiegati da zero**: il problema comune (il messaggio viaggia attraverso un intermediario ostile); SAML 2.0 con vocabolario, `sequenceDiagram` e sei deviazioni esemplificative del profilo italiano; OpenID Connect e perché è disponibile solo per CIE; autenticazione con certificato e le quattro verifiche, con il compromesso liste di revoca / interrogazione in linea e il **fallimento chiuso**; tabella comparativa; rinvio esplicito al modulo 13 |
| 9 | **Identificazione a distanza**: tabella autenticazione vs identificazione su sei dimensioni; i tre livelli di prescrizione normativa; **cinque cose che non bastano**; **cosa si registra come prova** (sei elementi, metodo come valore e non booleano, divieto di conservare l'immagine del documento); `stateDiagram-v2`; rapporto con i quattro atti di consenso |
| 10 | **Delega e rappresentanza**: assistere ≠ rappresentare; **cinque figure** con la trappola di ciascuna (amministratore di sostegno ≠ tutore); **sei proprietà di una delega sicura** più due comportamenti automatici; `flowchart` della catena di delega con il rombo **V2** (ambito dei poteri) che quasi tutti omettono; **§ 10.4 — autenticazione eseguita contro autenticazione riferita**, i due percorsi di identità, le tre regole di autorizzazione, delega mai impersonificazione (RFC 8693 § 4.1) |
| 11 | **Costi e conseguenze per chi installa**: tabella dei corrispettivi con le **tre letture non ovvie** (0,4 € → 3,5 € per attributo extra-anagrafica; 7 € per il livello 3; franchigia per coppia fornitore/gestore); **obblighi ricorrenti** in otto righe con la conseguenza tecnica di ciascuno; **§ 11.3 — i tre difetti del prodotto di federazione come rischi ISO 14971**, con cinque contromisure obbligatorie e tre test automatici; otto decisioni che chi installa deve prendere prima di iniziare |
| 12 | Riepilogo degli 11 punti `[NV]` con il destinatario |
| — | «Cosa devi ricordare» (14 punti) e «Termini introdotti in questo modulo» (37 voci) |

---

## 3. Vincoli del mandato — verifica di adempimento

| Vincolo | Esito |
|---|---|
| Un solo file, frontmatter YAML con `title`, `sidebar_position: 5`, `description` | Rispettato |
| ≥ 8.000 parole | Rispettato con ampio margine (≈ 21.000) |
| Punto 1 — problema dell'identità, doppio errore, fusione come evento avverso | § 1, con il collegamento esplicito a ISO 14971 e IEC 62366-1 e la frase-chiave «l'anagrafica non è un modulo di supporto, è un componente critico per la sicurezza» |
| Punto 2 — identificatori dell'assistito, con «cosa identifica davvero / quando cambia / quando manca / perché non è chiave primaria» | § 2, con le due tabelle finali (§ 2.8 e § 2.9) costruite proprio su quelle domande |
| Punto 3 — divergenza dell'URI di sistema, verificata, con raccomandazione | § 3.2, con la tabella a tre righe e i quattro punti operativi; § 3.1 fonda il principio generale del dominio di attribuzione |
| Punto 4 — anagrafi, allineamento, riconciliazione, sopravvenienze, identità pseudonimizzata e limiti | § 4 per intero |
| Punto 5 — identità del professionista, persona ≠ veste, ruolo come relazione | § 5, con `erDiagram` e la tabella delle cinque domande |
| Punto 6 — SPID/CIE/TS-CNS, chi rilascia, chi verifica, costi; **il progetto non può essere accreditato**, con ragione giuridica | § 6, con § 6.6 dedicata e la citazione testuale del D.P.C.M. 24 ottobre 2014, art. 1, c. 1, lett. i) e dello schema di convenzione, art. 2, c. 1, lett. a) e c) |
| Punto 7 — livelli di garanzia, corrispondenza internazionale, quando serve ciascuno, trappola CIE | § 7, con l'avvertenza sullo scarto di numerazione L1↔LoA2 |
| Punto 8 — protocolli spiegati a chi non li ha mai visti, con rinvii al modulo 13 | § 8, con riquadro di perimetro in apertura e rinvio finale |
| Punto 9 — identificazione a distanza, cosa non basta, cosa si registra, rapporto con il consenso | § 9 |
| Punto 10 — delega e rappresentanza, come modellarla, autenticazione eseguita vs riferita | § 10 |
| Punto 11 — costi per accesso, effetto degli attributi, difetti dei prodotti di federazione come rischi | § 11 |
| «Sviluppa, non ripetere» rispetto al modulo 07 § 8 | Il modulo 07 è stato letto integralmente nelle sezioni 8 e 9. Qui non sono ripetuti: la tabella dei tre canali in sintesi, la ripartizione «progetto / chi installa» del § 9 di 07, il quadro FSE. Sono invece sviluppati: profili, attributi, livelli, protocolli, costi, difetti, delega. La formula pubblica di D36 è ripresa **verbatim** perché il mandato di 07 la dichiara da usare «tale e quale» |
| Rinvii a 01, 02, 03, 05, 06, 07, 10, 12, 13 | Presenti e puntuali (sezione citata, non solo il modulo) |
| Distinzione «la norma stabilisce» / «è prassi» / «proposta del progetto» | Applicata sistematicamente; le proposte sono sempre marcate come tali |
| `[NV]` su ciò che non è verificato | 11 marcature, § 12 |
| Diagrammi Mermaid (flusso di autenticazione, modello persona/ruolo/organizzazione, catena di delega) | Tutti e tre presenti, più 3 aggiuntivi |
| Chiusura con «Cosa devi ricordare» e «Termini introdotti» | Rispettato |
| Regola **R0** | Rispettata. Nessuna azienda, marchio, prodotto commerciale o dominio di potenziali partner. Sono nominate **solo autorità pubbliche e infrastrutture istituzionali** (AgID, Agenzia delle entrate, Ministero dell'Interno, Poligrafico e Zecca dello Stato, MEF) ed enti di normazione (HL7 Italia, OASIS, ISO/IEC, IETF). **Il prodotto di gestione delle identità adottato dal progetto e i due connettori SPID/CIE non sono mai nominati**: si dice «il prodotto di federazione», «i connettori disponibili in licenza compatibile». Coerente con lo stile del resto della guida, dove il nome non compare mai |
| Nessun altro file della guida toccato | Rispettato |

---

## 4. Fonti recepite

| Fonte | Che cosa è stato preso |
|---|---|
| `00_PROJECT_BRIEF.md` | D1, D8, D13, D18, D25, D28, D35, **D36**, **D37**, **D38**, D42, D48, D50, D51, D52; vincoli V1, V4, V5, V6; profilo dell'integratore § 6.1–6.2 (lettura della tessera sanitaria da lettore, nessuna duplicazione di anagrafica, nessuna imposizione di IAM); **regola R0** |
| `B7-identita-digitale-italiana.md` | Fonte principale. Art. 64 CAD; chi è obbligato a cosa; § 1.4 sul Service Provider; profilo SPID e le deviazioni da SAML2; codici di anomalia e la loro natura non-di-errore; art. 28 del regolamento attuativo (niente sessione condivisa in L2/L3); livelli e mappatura ISO/IEC 29115; appendice A e la tensione con la prassi FSE L2; CIE (decreto 8 settembre 2022, manuale operativo, minimum eIDAS dataset, tre livelli, portale, referente tecnico esterno, semplificazione per chi è già SP SPID); **§ 4.3 — asserzione sempre `SpidL3`**; TS-CNS (elenco di fiducia con tipo di servizio «verifica dell'identità», host virtuale dedicato, iniezione di intestazioni, CRL contro OCSP e fallimento chiuso, TS-CNS per il professionista e non per il paziente); § 7.1 — i tre difetti del prodotto di federazione; § 7.7.3 — `acr` autoritativo contro riferito; § 3.9.5 — tabella dei corrispettivi e le tre letture; § 3.8 — obblighi ricorrenti, UTC(IEN) ± 1 minuto, 24 mesi; aggregatori |
| `B6-verifica-fhir.md` § 4 | **Divergenza degli URI di sistema del codice fiscale** (tabella a tre righe, verificata due volte sulla fonte); `NNxxx` e l'inesistenza di `NN`; nessun profilo italiano fissa il codice di tipo; sistemi degli slice `anpr`, `codiceANA`, `tesseraTEAM` |
| `R6-dominio-funzionale.md` | Attori e trappole: caregiver ≠ rappresentante (BR-062); amministratore di sostegno con poteri delimitati (BR-063); delega con scadenza obbligatoria; maggiore età (RF-118); identificazione non riuscita e metodi alternativi (RF-080); registrazione degli estremi di iscrizione all'albo; «nessuna operazione clinica senza contesto utente delegante» (BR-017); invarianti sull'unicità `system` + `value` per tenant |
| `R3-normativa-italiana.md` § 9.5 | Misure dell'Allegato 4 al DM 19 novembre 2025: identità digitale ex art. 64 CAD, log 24 mesi, dati di accesso e autenticazione 12 mesi |
| `docs/10_fondamenti/07-fse-e-infrastrutture-nazionali.md` | §§ 2.5, 2.6, 3.1, 3.2, 8, 9 — **letti per non ripetere**. Ripresi solo come rinvio: art. 15 e la dichiarazione ex art. 47 D.P.R. 445/2000; art. 10 (trent'anni dal decesso); art. 24 (trasferimento dell'indice alla nuova RdA); pseudonimizzazione eseguita dall'EDS |
| `docs/10_fondamenti/01-sistema-sanitario-italiano.md` §§ 5.1–5.3 | Atti riservati; catalogo dei professionisti; MMG/PLS e la transizione; personale amministrativo; «il professionista non è l'utente» — **sviluppato, non ripetuto** |
| `docs/10_fondamenti/02-prestazioni-di-telemedicina.md` § 10 | Identificazione ≠ autenticazione (tre righe, **qui trasformate in un modello**); i tre consensi; caregiver e rappresentanza; DM 30 settembre 2022, Allegato B, indicazioni per fascia |
| `docs/10_fondamenti/06-fhir-da-zero.md` | Trattamento della divergenza degli URI dal punto di vista del profilo: **rinviato, non duplicato** |
| `docs/10_fondamenti/00-come-usare-questa-guida.md` | Convenzioni redazionali, elenco dei moduli, collegamenti relativi, regola dei dati sintetici |

---

## 5. Punti marcati `[NV]`

| # | Punto | Sezione | A chi va chiesto |
|---|---|---|---|
| NV-1 | Composizione esatta dei codici STP ed ENI: numero di caratteri per campo e regole di attribuzione | § 2.4 | Ministero della salute; in subordine Regione o azienda sanitaria. **Impatto reale**: il validatore in ingresso e il tracciato di conferimento |
| NV-2 | Valori puntuali degli insiemi di valori che vincolano i sistemi di STP, ENI e identificativo regionale nei profili FHIR italiani | § 3.2 | Guide di implementazione HL7 Italia. **Da coordinare con l'agente del modulo 06** |
| NV-3 | Esistenza di un canale nazionale di interrogazione degli albi professionali utilizzabile da un sistema informativo | § 5.2 | Federazioni nazionali degli ordini. In assenza, la verifica del titolo resta **attestazione tracciata dell'organizzazione**, come scritto nel modulo |
| NV-4 | Mappatura testuale fra i livelli italiani e i livelli eIDAS | § 7.2 | AgID; atto di notifica del regime italiano. Serve solo se occorre una dichiarazione formale |
| NV-5 | Documento AgID che associa un livello di garanzia alla categoria «servizi sanitari» | § 7.3 | AgID (`spid.tech@agid.gov.it`, Help Desk SPID). **Bloccante per motivare la scelta del livello in sede di convenzione** |
| NV-6 | Conferma che l'elemento di contesto di autenticazione restituito da CIE sia **sempre** il livello massimo, nella versione corrente | § 7.4 | Ministero dell'Interno / Poligrafico, **più verifica empirica in pre-produzione**. Costa poco e falsifica o conferma il design della propagazione del livello |
| NV-7 | Equivalenza dichiarata fra CNS e livelli SPID | § 7.5 | AgID. In assenza resta una **stima di progetto**, configurabile |
| NV-8 | Stato reale del supporto a OpenID Connect da parte dei gestori SPID in produzione | § 8.2 | AgID; canale pubblico presidiato dal team SPID. Fonte attuale: pubblica ma **non normativa**, consultata il 25 agosto 2026 |
| NV-9 | Vigenza della tabella dei corrispettivi del 2019 dopo il rinnovo delle convenzioni dell'8 ottobre 2025 | § 11.1 | AgID. **Bloccante per qualunque stima economica pubblica** |
| NV-10 | Esistenza di corrispettivi per la federazione CIE | § 11.1 | Ministero dell'Interno — Direzione centrale servizi demografici |
| NV-11 | Disciplina puntuale della manifestazione di volontà in caso di affidamento condiviso del minore | § 10.2 | Approfondimento giuridico dedicato. Ereditato dalla questione Q9 di R6 |

---

## 6. Questioni per gli altri agenti

### Per l'agente del modulo 06 (FHIR)

- La divergenza degli URI di sistema è trattata **qui dal punto di vista del principio**
  (identificatore ↔ dominio di attribuzione) e **lì dal punto di vista del profilo**. I due
  testi devono restare coerenti sul valore raccomandato: `http://hl7.it/sid/codiceFiscale` in
  scrittura, entrambi accettati in lettura, emissione anche dell'URI IT-Core. Se il modulo 06
  cambia raccomandazione, **questo modulo va riallineato** (§ 3.2 e punto 2 di «Cosa devi
  ricordare»).
- NV-2 riguarda entrambi i moduli: i valori degli insiemi che vincolano i sistemi di STP, ENI
  e identificativo regionale.

### Per l'agente del modulo 12 (Crittografia e sicurezza)

- Questo modulo **dà per acquisita** la teoria di certificati, PKI, firma e catena di fiducia,
  e rinvia a 12 (§ 8.4). Se 12 tratta la revoca (liste contro interrogazione in linea) in modo
  sostanziale, il rinvio da § 8.4 va reso puntuale — qui resta la **scelta di progetto**
  (liste come predefinito, fallimento chiuso, valutazione d'impatto sull'interrogazione in
  linea), che non va duplicata.
- **Da coordinare**: l'elenco di fiducia nazionale e il filtro sul tipo di servizio «verifica
  dell'identità» sono spiegati qui in forma operativa (§ 6.4). La teoria degli elenchi di
  fiducia sta in 12.

### Per l'agente del modulo 13 (Protocolli)

- Il § 8 di questo modulo è **volutamente un modello mentale** e rinvia a 13 per SAML 2.0,
  OpenID Connect, TLS bilaterale e RFC 8693. Verificato sull'indice attuale di 13 che le
  sezioni 4 (identità e autorizzazione) e 2.5 (TLS/mTLS) coprano la materia. **Se cambiano i
  titoli delle sezioni, i rinvii vanno riallineati.**
- **Nessuna duplicazione rilevata**: qui non compaiono struttura dei messaggi, algoritmi
  ammessi, XML Signature Wrapping, parametri di richiesta. Le sei deviazioni del profilo SPID
  citate al § 8.2 sono **esemplificative e discorsive**; l'elenco puntuale con le fonti sta in
  B7 § 7.2 e va, se serve, in 13.
- Da coordinare: il log-G4 dichiara per il modulo 13 le voci di glossario `acr`, livello di
  garanzia, asserzione, metadata, Service Provider, Identity Provider. **Queste sei voci
  collidono con la tabella dei termini di questo modulo** (§ 7).

### Per l'agente del modulo 14 (Flussi funzionali)

- Il § 9 definisce l'**identificazione a distanza come atto registrato** con metodo ed esito,
  e la regola «la prestazione non si chiude senza esito di identificazione». È un vincolo di
  flusso: 14 dovrebbe rappresentarlo nella macchina a stati del contatto clinico e rinviare
  qui, non riesporlo.
- Il § 4.4 impone la **conferma dell'indirizzo del luogo della sessione a ogni sessione**: è
  un passo di flusso, e va coordinato con lo scenario di emergenza clinica.
- Il § 10.3 impone che la **revoca di una delega abbia effetto sulle sessioni in corso**: è un
  requisito di flusso, non di anagrafica.

### Per l'agente del modulo 15 (Quadro regolatorio)

- Il § 1.3 qualifica la **fusione errata di anagrafiche come evento avverso** ai sensi di
  ISO 14971 e le funzioni di ricerca/collegamento/fusione come **funzioni legate alla
  sicurezza** ai sensi di IEC 62366-1. È un'affermazione che 15 dovrebbe riprendere come
  esempio, perché è il caso in cui la differenza fra «difetto di dati» e «pericolo» è più
  didattica.
- Il § 11.3 tratta i tre difetti del prodotto di federazione come **rischi tracciati**, non
  come note di configurazione (D37): è materia di analisi dei rischi.

### Per l'agente di architettura / ADR

Il modulo enuncia come *proposte di progetto* alcune scelte che meritano un ADR formale,
perché diventano contratto verso gli integratori e verso chi installa:

1. **Chiave primaria del paziente opaca**, identificatori esterni come attributi molteplici
   con sistema, valore, validità, stato e origine; unicità su `system` + `value` per tenant.
2. **Nessuna fusione automatica di anagrafiche**; collegamento reversibile con storia;
   conservazione dell'appartenenza originaria di ogni dato clinico.
3. **Soglie di riconciliazione dichiarate nel fascicolo di gestione del rischio**, con tempo
   massimo di giacenza della coda di revisione.
4. **Precedenza per campo** fra le fonti anagrafiche, con provenienza su ogni valore e
   discordanza che blocca invece di correggere.
5. **Ogni riferimento di dominio punta al ruolo del professionista, mai alla persona.**
6. **Nessun diritto di accesso memorizzato come permesso**: sempre calcolato da un titolo con
   durata.
7. **Doppia registrazione del livello di garanzia** (richiesto e dichiarato) e marcatore
   «eseguita / riferita» sulla fonte dell'autenticazione — **è la traduzione operativa di
   D38**, che va coordinata con l'ADR sull'identity chaining di D18.
8. **Livello di garanzia asserito per TS-CNS** e sua configurabilità.
9. **Configurabilità per tenant** di canali ammessi, livello minimo per operazione e
   accettazione delle autenticazioni riferite.
10. **Delega sempre rappresentata come delega, mai come impersonificazione**, con entrambe le
    identità nel registro degli accessi.

### Per l'agente di sicurezza

- Tre test automatici sono enunciati come **requisiti** al § 11.3 e vanno tradotti in casi
  concreti: (a) le interfacce di modifica dell'utente rifiutano un utente federato; (b) il
  tentativo di accesso locale fallisce; (c) **le intestazioni relative al certificato client
  iniettate dall'esterno non vengono onorate**. Il terzo è la vulnerabilità classica dello
  schema mTLS dietro terminazione al bordo ed è il difetto che, se non testato, resta
  silenzioso.
- **Valutazione d'impatto** richiesta in due punti: interrogazione in linea dello stato di
  revoca (comunicazione verso l'autorità di certificazione, § 8.4) e modalità di aggregazione
  in cui le asserzioni transitano da un terzo (§ 6.6).
- Il § 7.5 enuncia la regola «**l'autorizzazione valuta il livello della sessione corrente,
  mai il livello massimo mai raggiunto dall'utente**»: è un caso di abuso da testare.
- § 2.3: la cronologia degli identificatori dopo rettificazione di attribuzione di sesso è un
  dato **estremamente sensibile** e non va mai esposta nelle interfacce cliniche ordinarie né
  nei log applicativi. È un requisito, non una raccomandazione.

### Per l'agente di conformità (MDR / qualità)

- Il connettore SPID è **strettamente accoppiato alla versione del prodotto di federazione**:
  l'aggiornamento del prodotto non è un aggiornamento di sicurezza indipendente, è un evento
  che coinvolge la conformità del canale di identità. Entrambi sono **software di provenienza
  esterna** ai sensi di IEC 62304 § 8.1.2, e la sorveglianza deve coprire **anche gli avvisi
  tecnici dell'Agenzia**, che modificano i requisiti in corsa.
- La politica di conservazione va progettata come **massimo fra le prescrizioni applicabili
  per classe di dato** (24 mesi tracciature di autenticazione e registro accessi; 12 mesi dati
  di accesso e autenticazione ex DM 19 novembre 2025), con evidenza di cancellazione.

### Per l'agente di accessibilità

- La richiesta del certificato client su **tutte** le connessioni produce una finestra di
  selezione del certificato per ogni utente: è un **ostacolo di accessibilità**, non solo di
  esperienza d'uso. La separazione per nome di host dedicato (§ 6.4) è quindi anche una misura
  di accessibilità.
- I messaggi degli errori di autenticazione sono **prescritti nel testo** e non riscrivibili:
  vanno resi accessibili (annuncio alle tecnologie assistive, mai veicolati dal solo colore)
  **senza alterarne il contenuto**.
- La pagina di scelta dei gestori con ordine casuale (§ 6.2) va costruita apposta: è
  contemporaneamente un obbligo normativo, un requisito di accessibilità e un requisito di
  incorporabilità con identità visiva dell'integratore.

### Per l'agente che scrive la documentazione per chi installa

- Il § 11.4 è già una **lista di decisioni preliminari** in otto punti: va ripresa nella guida
  di installazione.
- I tre percorsi per SPID (accreditamento diretto, adesione come aggregato, identità riferita
  dall'integratore già accreditato) vanno documentati **senza assumerne nessuno** come
  prerequisito del prodotto.
- La formula pubblica di D36 va riportata **verbatim** e non parafrasata.

---

## 7. Termini per il glossario (modulo 19)

37 voci, tutte definite nella tabella «Termini introdotti in questo modulo».

**Identificatori e anagrafiche** — entità · identità · identificatore · dominio di attribuzione ·
attributo · codice fiscale · omocodia · codice Belfiore (codice catastale) · STP · ENI ·
tessera sanitaria · TEAM · codice ANA · ANPR · ANA · RdA / RdE · indice principale del paziente ·
corrispondenza deterministica / corrispondenza probabilistica · pseudonimo (identità).

**Professionista** — `Practitioner` / `PractitionerRole` / `Organization`.

**Identità digitale** — autenticazione · identificazione (clinica) · SPID · CIE · TS-CNS ·
livello di garanzia (LoA) · ISO/IEC 29115 · livello richiesto / livello dichiarato · asserzione ·
metadata (federazione) · SAML 2.0 · OpenID Connect · autenticazione bilaterale TLS ·
elenco di fiducia · verifica della revoca · soggetto aggregatore / soggetto aggregato.

### Voci in collisione con altri moduli — da consolidare nel glossario

| Voce | Collide con | Nota per il glossario |
|---|---|---|
| **SPID**, **CIE**, **TS-CNS** | modulo 07 (tabella dei termini) | Le definizioni sono compatibili; 07 è la sintesi, 04 è la definizione estesa. Il glossario prenda quella di 04 |
| **livello di garanzia (LoA)**, **`acr`**, **asserzione**, **metadata**, **Service Provider**, **Identity Provider** | modulo 13 (dichiarate in log-G4) | Da consolidare in **una sola voce**: qui il significato istituzionale e sanitario, in 13 la resa protocollare |
| **ANA**, **CAD**, **RdA / RdE** | modulo 07 | Definizioni identiche per costruzione: non duplicare |
| **Pseudonimizzazione** (modulo 03) contro **pseudonimo (identità)** (qui) | modulo 03 | Sono due voci **distinte** e vanno tenute separate: la prima è il trattamento ex art. 4 n. 5 GDPR, la seconda è l'identificatore opaco rilasciato da un gestore di identità |

### Nota per il glossario bilingue

Termini che richiedono entrambe le forme: livello di garanzia / *level of assurance*; indice
principale del paziente / *master patient index*; corrispondenza probabilistica / *probabilistic
record linkage*; elenco di fiducia / *trusted list*; autenticazione bilaterale TLS / *mutual
TLS*; dominio di attribuzione / *assigning authority*; profilo sanitario sintetico / *patient
summary* (già introdotto da 07).

---

## 8. File toccati

| File | Azione |
|---|---|
| `docs/10_fondamenti/04-identita-e-anagrafiche.md` | **Creato** |
| `.telemedic/context/log-G5.md` | **Creato** (questo file) |

Nessun altro file è stato modificato. In particolare **non** sono stati toccati gli altri
moduli della guida, letti in sola lettura per evitare duplicazioni: `00`, `01`, `02`, `03`,
`06`, `07`, `13`.
