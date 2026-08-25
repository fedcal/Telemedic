# Log agente F3 — modulo 08 «WebRTC da zero»

**Data**: 25 agosto 2026
**Deliverable prodotto**: `docs/10_fondamenti/08-webrtc-da-zero.md` (unico file)
**Decisione di riferimento**: D35 (guida dei fondamenti, «non dare nulla per scontato»)
**Fonti lette**: `00_PROJECT_BRIEF.md`, `R4-webrtc-media.md`, `B3-verifica-coturn-webrtc.md`
(prevalente su R4 dove divergono), `00-come-usare-questa-guida.md`,
`05-standard-di-interoperabilita.md`, `06-fhir-da-zero.md` (allineamento di tono e struttura).

---

## 1. Conteggio e struttura

| Dato | Valore |
|---|---|
| Righe non vuote | **2 326** |
| Parole (stima su densità media del file, prosa + tabelle + codice) | **~15 000–17 000** — ampiamente sopra il minimo di 9 000 richiesto |
| Sezioni numerate | 14, più «Cosa devi ricordare» (32 punti) e «Termini introdotti» (78 voci) |
| Diagrammi Mermaid | 5 — sequenza offerta/risposta, raccolta dei candidati, handshake DTLS, attacco dell'intermediario, topologie |
| Blocchi di codice | 12 (SDP commentato in 6 blocchi, JavaScript, YAML, bash, sdp candidati) |
| Frontmatter | `title: WebRTC da zero`, `sidebar_position: 9`, `description` completa |

Copertura del mandato: tutti e 14 i punti richiesti sono presenti nell'ordine indicato.
Regola R0 rispettata integralmente: nessun nome di azienda, marchio, prodotto commerciale o
dominio di potenziale partner. Anche i motori dei browser e i progetti open source sono
citati solo quando indispensabili (coturn, che è il componente dichiarato nello stack) o in
forma generica («uno dei motori principali», «la libreria crittografica di uno dei due
maggiori motori»).

---

## 2. Correzioni di B3 recepite nel testo (prevalenza su R4)

Elenco delle divergenze in cui il modulo segue **B3** e non R4:

1. **Versione minima coturn 4.17.2** (non «da verificare al deploy»), con la motivazione per
   vulnerabilità corrette e i tre cambi di default della 4.17.0 (listener DTLS opt-in, nonce
   senza stato per processo, formato dei log).
2. **Sei vulnerabilità della famiglia SSRF-di-trasporto, quattro aggiramenti in otto mesi.**
   Il testo afferma esplicitamente che `denied-peer-ip` è difesa in profondità e che la
   difesa primaria è **l'isolamento di rete in uscita**. È la regola non negoziabile del §11.4.
3. **`stateless-nonce-secret` identico su tutti i nodi** come requisito dell'architettura a N
   nodi indipendenti.
4. **Unità di misura dei limiti di banda del server: byte al secondo, per direzione.**
   Segnalata come trappola esplicita.
5. **L'esportatore di metriche non espone i permessi negati**: l'allarme di scansione interna
   va costruito sui log, non sulle metriche. Corregge R4 §4.7.
6. **Interfaccia di verifica dell'identità (RFC 8827 §7): monobrowser, specifica ferma alla
   CR del 27 settembre 2018, nessun commit sostanziale dal 2021.** Da qui la promozione della
   SAS da raccomandazione a requisito, con l'argomento aggiuntivo di sovranità (l'IdP terzo
   sposterebbe il trust anchor senza eliminarlo).
7. **Non esiste rotazione intra-sessione delle chiavi SRTP**, ancorata a
   `draft-ietf-tls-extended-key-update-13` (4 luglio 2026), citato come Internet-Draft.
8. **Contenitore della registrazione: il quadro è rovesciato rispetto a R4.** MP4 su
   Chrome 126+/Edge/Safari, non su Firefox; WebM su Chrome/Edge/Firefox e su Safari solo dal
   18.4. Nessuno universale → negoziazione a runtime e registrazione nei metadati.
9. **`degradationPreference` non è nella Recommendation WebRTC** ma in *MediaStreamTrack
   Content Hints* (W3C Working Draft, 19 settembre 2025); il valore
   `maintain-framerate-and-resolution` è **normativo** (il sospetto di R4 è ritirato) ed è
   semanticamente il più interessante per la telemedicina.
10. **`jitterBufferTarget` confermato** nell'interfaccia principale, con Chrome 124 /
    Firefox 115 / Safari 27. Presentato come **l'unica leva applicativa** sul contributo
    dominante alla latenza, con il compromesso clinico dichiarato.
11. **Flag di test**: `--auto-accept-camera-and-microphone-capture` al posto di
    `--use-fake-ui-for-media-stream` (il secondo auto-accetta anche la cattura dello schermo
    → falsi positivi sul flusso di consenso alla condivisione). Formati Y4M e WAV, sintassi
    `%noloop`, obbligo di disattivare l'elaborazione audio.
12. **Firefox non ha equivalente della riproduzione da file** → la misura automatica della
    latenza con fixture a timecode è realizzabile **solo su Chromium**. Vincolo di
    progettazione della suite di test, esplicitato nel §13.1.
13. **AV1**: Chrome dal 2021, Firefox attivo per default dalla 136; Safari `[NV]`; nessuna
    cifra di adozione citata.
14. **Assenza di clustering coturn** riformulata in negazione ancorabile (tre soli schemi
    documentati upstream, tutti di distribuzione).

Correzioni ereditate da R4 §0 e mantenute: RFC 8826/8827 non invertiti; RFC 8445/8489/8656
al posto di 5245/5389/5766; RFC 8839 per il profilo SDP di ICE.

---

## 3. Punti `[NV]` aperti nel modulo

| # | Affermazione marcata `[NV]` | Dove | Chi dovrebbe chiuderla |
|---|---|---|---|
| NV-1 | Percentuale esatta di sovraccarico delle intestazioni sul relay (~10 %) e le tre cifre di traffico aggregato per sessione derivate | §5.9 | Agente Testing / capacity plan |
| NV-2 | Quota reale di sessioni instradate dal relay (5–20 % è cifra di settore non verificata) | §5.9 | Da misurare sul traffico proprio, non da citare |
| NV-3 | Milestone esatto del passaggio a DTLS 1.3 per default su uno dei motori; stato Safari/WebKit | §6.2 | Agente Sicurezza |
| NV-4 | Sovraccarico di bitrate della correzione d'errore Opus (10–30 %) | §7.2 | Agente Testing |
| NV-5 | Efficienza relativa di VP9 rispetto a VP8 | §7.3 | Non citare cifre finché non misurate |
| NV-6 | Stato di AV1 in WebRTC su Safari e iOS | §7.3 | Agente Frontend |
| NV-7 | Intero bilancio del ritardo dalla telecamera al display (tabella per stadio) | §8.2 | Agente Testing — è il numero che rende verificabile D19 |
| NV-8 | Costo relativo del fotogramma completo (5–10× un differenziale) | §8.4 | Agente Testing |
| NV-9 | Presenza di coefficienti di degrado per Opus in ITU-T G.113 App. I e copertura di Opus in G.107.2 | §9.5 | Agente Compliance / QoE |
| NV-10 | **Esistenza di requisiti tecnici minimi (risoluzione, fps, latenza) nelle indicazioni nazionali italiane per la telemedicina** | §9.6 e punto 25 di «Cosa devi ricordare» | **Agente Compliance — prioritario: se esistessero, prevarrebbero sulle soglie proposte** |
| NV-11 | Algoritmo di hash sottostante all'HMAC delle credenziali temporanee del relay | §11.2 | Agente Testing — da chiudere con un test di integrazione, non con una citazione |
| NV-12 | Supporto di `video/webm` in registrazione su Chrome iOS | §12.2 | Agente Frontend |

Voci dell'Appendice B di R4 che restano fuori dal perimetro di questo modulo e non sono
state riaperte: supporto di RTCP XR nei browser; soglie dell'algoritmo di congestione per
incremento e riduzione del bitrate; supporto della notazione CIDR in `denied-peer-ip`; nome
esatto del field trial per forzare DTLS 1.3.

---

## 4. Questioni per gli altri agenti

### Agente Architettura (`docs/02_architecture/`, `docs/adr/`)

1. **Distribuzione dello stato di sessione fra più nodi del server di segnalazione.** Il
   modulo espone il vincolo di RFC 8838 §9 (consegna dei candidati **esattamente una volta e
   in ordine**) come requisito che esclude i meccanismi di diffusione «pubblica e dimentica».
   Serve un ADR con la scelta e la strategia di uscita.
2. **Orchestrazione della mesh a tre.** Dove vive la logica delle N−1 connessioni, come si
   assegnano deterministicamente i ruoli cortese/scortese per ogni coppia, come si suddivide
   il budget di banda in salita, e come si aggrega la qualità (il modulo stabilisce: minimo,
   non media).
3. **Il limite di tre partecipanti va applicato dal codice**, con errore chiaro al quarto. Il
   modulo lo dichiara come principio; serve il requisito tracciabile.
4. **Numero e collocazione dei nodi di relay** nell'UE, con capacity plan derivato da §5.9 e
   §11.6.

### Agente Sicurezza (`docs/06_security/`)

5. **Progettazione della SAS** (derivazione dalle due impronte, rappresentazione, flusso di
   verifica, comportamento in caso di mancata corrispondenza). Il modulo stabilisce che è
   **l'unica** contromisura disponibile e che D22 la rende obbligatoria; non ne definisce il
   formato.
6. **Analisi delle minacce del piano media e della segnalazione**, con l'attacco
   dell'intermediario **modellato come minaccia proveniente dall'operatore stesso**, non solo
   verso di esso.
7. **Riverifica periodica** della configurazione del relay e dell'elenco delle vulnerabilità
   a ogni aggiornamento di versione minore, con esito registrato nel fascicolo di
   sorveglianza post-commercializzazione (il modulo la enuncia come regola permanente).

### Agente Compliance / MDR (`docs/08_compliance/`)

8. **NV-10 è la questione prioritaria.** Il modulo afferma esplicitamente che nessuna soglia
   tecnica è imposta dalla normativa italiana e che i valori del progetto sono specifica di
   prodotto. Se esistessero requisiti minimi nazionali, il §9.6 va corretto.
9. **Le soglie e la notifica al professionista come controllo di rischio ISO 14971** (§9.6):
   è l'elemento del modulo con maggiore rilevanza per il fascicolo tecnico.
10. **`degradationPreference` per specialità**: esporla come preferenza dell'utente resta
    fuori dalla regola 11 MDR, o l'associazione esplicita a una specialità costituisce già
    «informazione usata per decisioni diagnostiche»? Il modulo espone il problema e propone
    la formulazione difendibile, senza chiuderlo.
11. **Disattivazione di eco/rumore/guadagno per specialità** (§7.2): se il suono è usato per
    una valutazione semeiologica, si entra nel perimetro diagnostico?
12. **Maturità normativa ridotta di `degradationPreference`** (Working Draft, non
    Recommendation): va dichiarata nella documentazione di conformità.
13. **DPIA del trattamento di metadati sul relay** (§6.7 caso B): il solo fatto del consulto
    con uno specialista è dato relativo alla salute.

### Agente Frontend (`docs/01_technical/`)

14. **Negoziazione del contenitore a runtime** e registrazione nei metadati (§12.2); il
    frammento di codice del modulo è la specifica minima.
15. **Differenziazione corretta dei contatori cumulativi** in `getStats()` (§9.3): il modulo
    lo elenca fra gli errori tipici perché è ricorrente.
16. **Esposizione controllata della connessione alle build di test**, senza esporla in
    produzione.
17. **Misura del carico CPU della registrazione** su hardware di riferimento basso e soglia
    di disattivazione automatica.

### Agente Accessibilità

18. **SAS accessibile** — vincoli D22 già enunciati nel modulo (screen reader, mai solo
    colore, comprensibile a paziente anziano, procedura in caso di discordanza): servono il
    design e i test con tecnologie assistive reali.
19. **Indicatore di registrazione persistente e non occultabile** su entrambi i lati, con
    annuncio del cambio di stato (§10.4).
20. **Comunicazione del degrado** quando il video viene sacrificato all'audio (§8.5): il
    degrado silenzioso è esso stesso una barriera.

### Agente Testing (CI)

21. **Fixture Y4M con contatore di tempo impresso** e infrastruttura di lettura per la misura
    automatica della latenza; con il vincolo che è realizzabile **solo su Chromium**
    (§13.1) — serve una strategia alternativa dichiarata per Firefox.
22. **Profili `netem` come costanti condivise** (§13.2), applicati in composizione di
    contenitori.
23. **Tre test del relay**: credenziale reale, percorso forzato + percorso realistico,
    **e il test di confinamento** con i sei casi del §13.4 punto 3 (compresi l'indirizzo
    pubblico del nodo e un intervallo IPv6 non allineato a un prefisso). L'ultimo è collegato
    al file di gestione dei rischi.
24. **Divieto documentato** di usare la limitazione di banda degli strumenti di sviluppo per
    simulare reti degradate: agisce su HTTP, non su UDP.

### Agente Protocolli (`docs/04_protocols/`)

25. **Definizione formale del protocollo di segnalazione**: schema JSON versionato, macchina a
    stati, mappatura fra il segnale di fine raccolta del browser e l'indicazione formale di
    RFC 8838 §13, semantica del riavvio di ICE. Il modulo ne fornisce i vincoli, non il
    contenuto.
26. **Formato del canale sottotitoli** su canale dati, versionato, con marcatore
    interim/final e identificativo del parlante (predisposizione richiesta da D24).

### Agente Glossario (modulo 14)

27. Le **78 voci** della tabella «Termini introdotti in questo modulo» vanno riprese nel
    glossario bilingue con i rinvii incrociati (§5 dell'elenco qui sotto).

---

## 5. Termini da riportare nel glossario (con definizione breve)

Estratti dalla tabella di chiusura del modulo. Sono 78; qui sono raggruppati per area per
facilitare l'inserimento nel glossario bilingue del modulo 14.

**Rete di base** — WebRTC; UDP; TCP; blocco di testa coda (*head-of-line blocking*); porta;
cinquina (*five-tuple*); NAT; NAT simmetrico; CGNAT; isolamento dei client; mDNS; contesto
sicuro; emulatore di rete (*netem*).

**Segnalazione** — segnalazione (*signaling*); SDP; offerta/risposta; JSEP; BUNDLE; sezione
media (`m=`); `a=fingerprint`; `a=setup`; collisione delle offerte (*glare*); negoziazione
perfetta.

**Attraversamento del NAT** — ICE; candidato; candidato host; candidato server-reflexive;
candidato peer-reflexive; candidato relayed; fondazione (*foundation*); controllo di
connettività; nomina; controllo di consenso; STUN; TURN; allocazione; permesso; legame di
canale; Trickle ICE; riavvio di ICE; credenziale temporanea.

**Sicurezza del media** — DTLS; SRTP; DTLS-SRTP; profilo di protezione; attacco
dell'intermediario; SAS (*Short Authentication String*); `KeyUpdate`; SFrame; falsificazione
di richieste a livello di trasporto; isolamento di rete in uscita.

**Codec e qualità** — codec; Opus; correzione d'errore incorporata (`useinbandfec`);
trasmissione discontinua (`usedtx`); G.711; VP8 / VP9 / H.264 / AV1; jitter; jitter buffer;
RTT; controllo della congestione; retroazione sul trasporto (`transport-cc`); preferenza di
degrado; `NACK` / `RTX`; `PLI` / `FIR`; fotogramma completo (*keyframe*); correzione d'errore
in avanti (FEC).

**Topologie e registrazione** — mesh; inoltro selettivo (SFU); composizione (MCU);
contenitore.

Le definizioni brevi complete sono già scritte, verbatim, nella tabella «Termini introdotti
in questo modulo» in fondo a `docs/10_fondamenti/08-webrtc-da-zero.md`: vanno copiate da lì
per garantire coerenza, e affiancate della resa inglese.

---

## 6. Affermazioni pubbliche del progetto che questo modulo corregge

Da propagare a chi cura la pagina pubblica e il materiale di comunicazione (D19, D29):

| Affermazione attuale | Formulazione corretta stabilita nel modulo |
|---|---|
| «WebRTC peer-to-peer» | «Cifrato end-to-end, instradato direttamente quando la rete lo consente» (§5.10) |
| «fallback relay se il P2P fallisce» come feature | Comportamento nativo di ICE; la funzionalità reale è fornire credenziali valide (§5.5) |
| «bitrate adattivo» come feature | Controllo di congestione del browser; il progetto lo configura e lo osserva (§8.3) |
| «key rotation per sessione» | «Materiale crittografico generato ex novo per ogni sessione, senza riuso»; **non esiste rotazione intra-sessione** (§6.8) |
| «cipher FIPS 140-2 compliant» | Rimossa; sostituita da algoritmi effettivamente negoziati, riferimenti ETSI/SOG-IS e capacità di registrare la suite per sessione (§6.9) |
| «latenza < 200 ms» | Metrica misurata, registrata e notificata, con la metrica **qualificata** (§8.2) |
| «MP4 cifrato a riposo» | «Contenitore standard, MP4 o WebM secondo il browser, registrato nei metadati, cifrato a riposo» (§12.2) |
| «cifratura end-to-end» senza qualificazioni | Condizionata all'integrità della segnalazione e verificata dagli utenti tramite SAS; **sospesa in modalità con registrazione** (§6.4, §10.4) |
