# Log agente R4 - WebRTC e trasporto media

**Output**: `.telemedic/research/R4-webrtc-media.md` (~18.650 parole, 14 sezioni + 2 appendici)

## Fatti chiave accertati (VINCOLANTI per gli agenti a valle)

1. **RFC 8826/8827 invertiti** nel brief originale: la numerazione corretta è verificata nel documento. Non propagare l'errore.
2. **Il claim "FIPS 140-2 compliant" va rimosso.** Il CMVP dichiara *historical* tutti i certificati FIPS 140-2 residui il **21 settembre 2026**, due mesi prima della v1.0. Inoltre il claim è errato di categoria (FIPS valida moduli crittografici, non cipher) e non verificabile, perché la cifratura avviene nel browser dell'utente. Sostituire con ETSI TS 119 312 / SOG-IS / linee guida AgID-ACN.
3. **Il claim "end-to-end" richiede una condizione esplicita.** RFC 8827 §9.1: il server di signaling può montare un MITM se non esiste un meccanismo indipendente di verifica delle chiavi. La mitigazione è una **SAS (Short Authentication String)** derivata dalle fingerprint DTLS.
4. **Il claim "peer-to-peer" è topologicamente falso per una quota delle sessioni**: con NAT endpoint-dependent su entrambi i lati (CGNAT mobile, reti ospedaliere) il relay TURN è obbligatorio. La cifratura resta end-to-end, la topologia no. Riformulare in "cifrato end-to-end, instradato direttamente quando la rete lo consente".
5. **Il claim "<200 ms" non è verificabile così com'è**: metrica non specificata, e il jitter buffer - contributo dominante - cresce deliberatamente quando la rete peggiora. Misurare e notificare invece di promettere.
6. **"Key rotation per sessione" è ambiguo**: non è verificata l'esistenza di rotazione intra-sessione; l'ICE restart non rifà l'handshake DTLS. Riformulare in "materiale crittografico generato ex novo per ogni sessione, senza riuso".
7. **Rischio CRITICO T1 - relay TURN verso loopback e rete interna.** Ogni paziente autenticato riceve una credenziale TURN che, senza restrizioni, è un proxy UDP verso qualunque destinazione (precedente: CVE-2020-26262). RFC 8656 §21.2.2 delega la difesa all'operatore. Mitigazione a più strati: configurazione + isolamento di rete + test in CI. `denied-peer-ip` da solo NON basta.
8. **Il TURN tratta metadati che sono dati relativi alla salute** (GDPR art. 9): chi ha parlato con chi, quando, da quale IP. Va nella DPIA e nel registro dei trattamenti.
9. **`MediaRecorder` con `video/mp4` non è garantito**: `video/webm` è il formato ampiamente supportato. La feature 6 dichiara MP4 - da verificare o correggere.
10. **WCAG 1.2.4 (Captions Live, AA) non è realisticamente soddisfabile in v1.0** rispettando il vincolo di sovranità: le opzioni ASR mature sono cloud US-based, e la Web Speech API dei browser Chromium inoltra l'audio a un servizio remoto. Conformità piena su tutto il resto, non-conformità dichiarata su 1.2.4, interprete come misura alternativa.
11. **coturn non ha clustering nativo**: la caduta di un nodo termina le allocazioni. Ridondanza affidata a ICE con N nodi indipendenti.
12. **Il congestion control non è codice di Telemedic**: GCC è nel browser, transport-cc è un Internet-Draft scaduto nel 2016 mai adottato dalla IETF. Il progetto configura e osserva, non implementa.

## Questioni aperte

30 questioni numerate, indirizzate agli agenti Architettura, Protocolli, Sicurezza, Compliance, Frontend, Accessibilità e Testing. Vedi §15 del documento.

## Appendice B - 18 affermazioni NON verificate

Elenco puntuale di dati da riverificare prima di qualunque pubblicazione (versioni coturn, CVE, direttive di configurazione, flag Chrome, supporto browser). **Nessuno di questi dati va pubblicato senza verifica su fonte primaria.**
