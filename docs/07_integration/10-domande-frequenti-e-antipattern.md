---
title: Domande frequenti e antipattern
sidebar_position: 11
description: Le domande che arrivano davvero, con risposte dirette. E il catalogo degli errori che ci si aspetta, ordinati per gravità, con sintomo, causa e rimedio.
---

# Domande frequenti e antipattern

Il capitolo è diviso in due. Le **domande frequenti** rispondono a ciò che viene chiesto prima e
durante un'integrazione. Gli **antipattern** descrivono gli errori che ci si aspetta: hanno un
nome, un sintomo riconoscibile e un rimedio.

Vale la pena leggerlo **prima** di aprire una segnalazione. Non per scoraggiare le segnalazioni,
ma perché la maggior parte dei blocchi ha una causa già nota, e riconoscerla fa risparmiare
giorni.

---

## Parte prima — domande frequenti

### 1. Prima di iniziare

**Posso usarlo per erogare prestazioni a pazienti reali?**
No, finché non esiste una marcatura per la distribuzione che state usando. Il progetto non ne
appone e lo dichiara in ogni artefatto. Chi mette in servizio assume gli obblighi di fabbricante.
Vedi [09 §1](09-obblighi-di-chi-integra.md).

**Il codice è certificato?**
Il codice sorgente non è un dispositivo medico, quindi non è certificabile in quanto tale. Ciò
che può essere certificato è una **distribuzione identificata**, prodotta da una costruzione
riproducibile, con un fabbricante preciso. I due artefatti hanno nomi, versioni e cicli di vita
distinti, ed è una distinzione sostanziale, non formale.

**Quanto tempo serve per una prima integrazione?**
La sequenza del capitolo [02](02-primo-avvio.md) — token, prestazione, notifica verificata,
componente incorporato, recupero del documento — è realizzabile in pochi giorni da uno
sviluppatore back-end e uno front-end, **a condizione che i prerequisiti del §1 di quel capitolo
siano soddisfatti prima di iniziare**. Il tempo che si perde si perde quasi sempre lì: non
nell'integrazione, nell'attesa di un dominio, di un certificato o di una decisione organizzativa.

**Serve conoscere lo standard clinico per integrarsi?**
Per la modalità applicativa, no: il piano applicativo è progettato per essere usato da chi non
conosce il modello clinico. Serve conoscerlo se dovete **consumare** la documentazione clinica
prodotta, e in quel caso il modulo [10 §06](../10_fondamenti/06-fhir-da-zero.md) parte da zero.

**Possiamo provare senza installare nulla?**
Sì, ma la prova va fatta con **dati sintetici**. Provare con dati di persone reali su un ambiente
di prova è un trattamento senza le garanzie dell'ambiente di produzione, ed è comunque escluso
dal punto precedente sulla marcatura.

### 2. Identità e accesso

**Dobbiamo davvero far fare un secondo accesso ai nostri utenti?**
No, se avete un emittente di identità che pubblica il proprio materiale di chiave. L'identità si
consegna **fra back-end**, con delega. Vedi [06 §3](06-identita-e-delega.md).

**Possiamo passare il token del nostro utente dal browser?**
No. Sarebbe manipolabile e finirebbe nei registri: non è un'asserzione di identità, è
un'affermazione del browser. La propagazione avviene fra back-end, senza eccezioni.

**Perché non ci date un token che duri tutto il giorno?**
Perché un token a vita lunga vanifica la revoca e allarga la finestra in cui una fuga è
sfruttabile. Ottenerne uno nuovo è una chiamata fra back-end, non una sessione utente: se il
costo di quella chiamata è un problema, il problema è altrove.

**La revoca è immediata?**
No, e va detto: un token validato localmente resta valido fino alla propria scadenza anche dopo
essere stato revocato. È il motivo per cui i token clinici durano cinque minuti. Dove serve
immediatezza esiste un meccanismo aggiuntivo, che va attivato consapevolmente
([03 §2.4](03-integrazione-per-api.md)).

**Il livello di garanzia dell'autenticazione che facciamo noi vale come se lo aveste fatto voi?**
No, e la distinzione è esplicita nel token. Un livello **riferito** da un integratore è marcato
come tale e **non soddisfa** i requisiti di autenticazione forte che la normativa impone su
determinate operazioni. Vedi [06 §5.2](06-identita-e-delega.md).

**Che cos'è un «dominio di attribuzione» e perché ce lo chiedete a ogni chiamata?**
Perché un identificatore senza dominio è una stringa. `PZ-889231` non identifica nessuno;
`PZ-889231` nel vostro spazio dei nomi sì. Senza, due integratori diversi con lo stesso schema di
numerazione produrrebbero collisioni fra persone diverse.

### 3. Interfacce

**Perché ci sono due interfacce e non una?**
Perché rispondono a domande diverse. Il piano clinico serve a essere letto da sistemi sanitari
che non conoscono Telemedic; il piano applicativo serve a usare le capacità del prodotto. Fondere
i due produce o un'interfaccia illeggibile per i terzi o un modello clinico inquinato da concetti
tecnici. Vedi [03 §1](03-integrazione-per-api.md).

**La chiave di idempotenza è uno standard?**
No, ed è dichiarato: la bozza di riferimento è **scaduta e archiviata**, e non è mai diventata
una RFC. Il nome del campo è mantenuto perché è la convenzione più diffusa, ma va presentato come
**convenzione di progetto**.

**Perché rifiutate una modifica senza validatore condizionale?**
Perché consentire un aggiornamento cieco su un documento clinico è una perdita di dato non
tracciata. È un rischio da registrare in un'analisi dei rischi, non una comodità da concedere.

**Le intestazioni di limitazione del traffico sono standard?**
No. La forma a tre intestazioni che molti citano non è mai stata standard **ed è anche superata**:
la revisione corrente della bozza definisce due soli campi. Il progetto emette entrambe le forme
durante la transizione e dichiara che nessuna delle due è normativa.

**Come sappiamo se un cambiamento romperà la nostra integrazione?**
Le modifiche non compatibili passano da un processo di dodici mesi con annuncio, intestazioni di
deprecazione e finestre di interruzione programmata. Le modifiche **compatibili** — aggiunta di
campi, di endpoint, di valori enumerati, di tipi di evento — avvengono senza preavviso, e il
vostro client deve tollerarle. Vedi [03 §9.3](03-integrazione-per-api.md).

### 4. Eventi

**Perché la notifica non contiene il referto?**
Minimizzazione, riduzione del danno in caso di destinazione mal configurata, e tracciabilità: se
recuperate voi il contenuto, l'accesso finisce nel registro con il vostro nome. Vedi
[04 §3.2](04-integrazione-per-eventi.md).

**Perché la firma è asimmetrica invece che con un segreto condiviso?**
Perché con un segreto condiviso **voi potreste fabbricare** notifiche indistinguibili dalle vere.
Davanti a una contestazione, non potreste provare a un terzo che una notifica veniva da noi. E
perché la rotazione di un segreto condiviso richiede coordinamento con ogni integratore.

**Riceviamo lo stesso evento due volte. È un difetto?**
No, è la garanzia dichiarata: consegna **almeno una volta**. «Esattamente una volta» esiste solo
come effetto congiunto con la vostra deduplicazione.

**Gli eventi arrivano in ordine?**
No, non fra soggetti diversi. Usate il numero di sequenza per aggregato e scartate quelli
inferiori a ciò che avete già applicato ([04 §7.2](04-integrazione-per-eventi.md)). Esiste una
modalità ordinata, ma ha un costo reale ed è sconsigliata come predefinita.

**Non riceviamo più eventi da due giorni. Come facciamo a saperlo?**
Sorvegliando il **segnale periodico**. Un canale rotto e un periodo senza attività producono lo
stesso silenzio: senza il segnale periodico non sono distinguibili.

**Non possiamo esporre un indirizzo verso Internet.**
Non è un problema: si usa il sondaggio sull'elenco degli eventi, con le stesse garanzie di
completezza ([04 §11](04-integrazione-per-eventi.md)).

### 5. Componente incorporabile

**La fotocamera non si accende dentro la cornice.**
Nel 90 % dei casi manca l'intestazione di politica dei permessi **sulla vostra pagina**.
L'attributo della cornice restringe, non concede. Vedi
[05 §2](05-componente-incorporabile.md).

**Video e audio funzionano, la condivisione dello schermo no.**
La cattura dello schermo è una funzione a sé e va elencata separatamente.

**Possiamo servire il componente dalla nostra origine con un proxy inverso?**
Tecnicamente sì, e il progetto **non lo supporta**: l'isolamento fra il vostro codice e la
sessione clinica cesserebbe di esistere. Se lo fate, è una configurazione da dichiarare, con le
conseguenze che ne derivano.

**Possiamo nascondere l'indicatore di registrazione perché disturba il layout?**
No. È un limite invalicabile, e il tentativo viene rifiutato e tracciato. La motivazione è in
[05 §7.2](05-componente-incorporabile.md).

**Il nostro colore aziendale viene rifiutato.**
Perché produce un contrasto insufficiente. Il rifiuto è deliberato e avviene lato server:
l'accessibilità è un requisito funzionale, e un integratore non deve poterla degradare. L'errore
indica il rapporto misurato e quello richiesto.

**Possiamo passare un nostro foglio di stile?**
No. Consentirlo permetterebbe di nascondere avvisi di consenso, alterare etichette cliniche e
sovrapporre elementi. Le proprietà di tema sono un insieme chiuso.

**Il gettone di ingresso scade troppo in fretta.**
Vive quaranta-sessanta secondi ed è monouso, per costruzione. Se la vostra pagina impiega di più
a montarsi, il problema è il momento in cui lo chiedete: va chiesto **al momento del montaggio**,
non al caricamento della schermata precedente.

### 6. Dati

**Diventate voi il nostro archivio anagrafico?**
No. Il progetto conserva una proiezione minima legata ai vostri identificativi. Il dato di
riferimento resta vostro. Vedi [07 §1](07-dati-e-sincronizzazione.md).

**Abbiamo due assistiti per la stessa persona.**
Avete inviato l'identificativo senza dominio, oppure con due domini diversi. La procedura di
ricongiungimento esiste, è tracciata e **non è automatica**, perché una fusione errata è un
evento avverso.

**Perché non fondete automaticamente due record con lo stesso codice fiscale?**
Lo facciamo, se la corrispondenza è esatta su un identificatore forte **e** i dati anagrafici
sono coerenti. In ogni altro caso si genera un candidato per il riesame umano. L'asimmetria fra i
due errori possibili impone la prudenza: una mancata fusione si corregge, una fusione errata
lascia tracce nella documentazione clinica firmata, che è immutabile.

**Abbiamo aggiornato un documento e voi ne avete creato uno nuovo.**
Il documento clinico firmato è **immutabile**: non si modifica, si sostituisce mantenendo la
catena. Il vostro sistema deve saper rappresentare una sostituzione.

**Possiamo mettere il codice fiscale nel campo dei dati opachi?**
No. Quel campo non è cifrato campo per campo, compare nelle notifiche e può comparire in
diagnostica. Il divieto è verificato con euristiche.

### 7. Moduli e personalizzazione

**Possiamo sostituire la refertazione con la nostra?**
Sì, è un modulo disattivabile. Ma il documento resta **persistenza di contenuto redatto dal
professionista**: se il vostro modulo genera contenuto clinico, avete cambiato la natura del
prodotto e la valutazione di conformità è da rifare sul vostro perimetro.

**Possiamo caricare un nostro modulo dentro il processo?**
Solo nell'installazione dedicata a un unico cliente. In un'installazione condivisa fra più
tenant è una condizione di ammissibilità che non è soddisfatta.

**Possiamo avere un punto di estensione per il nostro caso?**
Se siete i primi a chiederlo, quasi certamente la forma sarebbe sbagliata. Aprite una questione
descrivendo il problema, non l'interfaccia che vorreste: due implementazioni concrete e poi
l'astrazione, non un'astrazione speculativa da mantenere per anni.

### 8. Conformità e responsabilità

**Se usiamo il vostro codice, di che cosa rispondiamo?**
La risposta è la tabella di [09 §9](09-obblighi-di-chi-integra.md), riga per riga. La sintesi:
chi mette in servizio assume gli obblighi di fabbricante, e le clausole di esclusione di
responsabilità della licenza valgono fra le parti, **non verso il paziente**.

**Il nostro cliente è una compagnia assicurativa che vuole vedere i referti dei propri
assicurati.**
Non è possibile, e non è una scelta di prodotto: le compagnie di assicurazione sono **sempre**
escluse dall'accesso al Fascicolo sanitario elettronico. Il pagatore può ottenere l'esito
amministrativo, non il contenuto clinico. Vedi [09 §5](09-obblighi-di-chi-integra.md).

**Un medico convenzionato con la compagnia può accedere per conto suo?**
No. L'abilitazione del professionista all'accesso è funzionale alla cura; usarla per alimentare
una valutazione assicurativa è una finalità diversa, e la diversità di finalità non si sana con
l'identità di chi accede.

**Chi paga le licenze delle terminologie?**
Chi installa e chi mette in servizio. E con tre trappole: il servizio esterno non esonera; chi
distribuisce distribuisce un prodotto soggetto alla licenza anche senza contenere un concetto; le
tariffe si applicano **anche in ambienti non di produzione**. Vedi
[09 §6](09-obblighi-di-chi-integra.md).

**Il sistema funziona se non le acquistiamo?**
Sì, pienamente. Nessun percorso principale le richiede. Il costo è dichiarato: alcune validazioni
di codice non si eseguono.

---

## Parte seconda — catalogo degli antipattern

Ogni voce ha un nome, perché avere un nome per un errore ne rende possibile la discussione. Il
livello indica quanto costa scoprirlo tardi.

### Livello 1 — irreversibili o quasi

| # | Nome | Sintomo | Perché è grave | Rimedio |
|---|---|---|---|---|
| A1 | **Il dominio che cambia** | Dopo mesi, qualcuno «pulisce» l'identificatore di dominio: toglie una barra, cambia sottodominio | Lo storico si scinde in due e la riconciliazione diventa manuale, record per record | Il dominio non cambia **mai**. Registratelo, congelatelo, verificatelo in integrazione continua |
| A2 | **L'impersonificazione comoda** | Il token porta solo l'identità dell'utente, senza l'attore | Il registro perde per sempre l'informazione su quale sistema ha agito. Non si ricostruisce | Delega, sempre |
| A3 | **Il livello riferito spacciato per verificato** | Si copia il livello dell'asserzione esterna nel token emesso senza qualificarlo | Il registro afferma il falso: dichiara verificata dal progetto un'autenticazione altrui | Marcatore esplicito, due valori distinti |
| A4 | **Gli identificativi di requisito rinumerati** | Il vostro processo rimappa gli identificativi su una vostra numerazione | La tracciabilità si rompe e **non si ricostruisce a posteriori** | Identificativi congelati, mappatura additiva se proprio serve |
| A5 | **La destinazione d'uso scritta dal marketing** | Il materiale commerciale promette il monitoraggio in tempo reale | È una dichiarazione di destinazione d'uso anche se non si chiama così, e sposta la classificazione | Congelare la destinazione d'uso, poi allineare il materiale, mai il contrario |
| A6 | **La fusione automatica generosa** | Due record vengono fusi su una corrispondenza approssimata | Fusione errata: la documentazione clinica di una persona entra nella storia di un'altra, ed è immutabile | Candidato e riesame umano sopra la corrispondenza esatta |

### Livello 2 — costosi da correggere in produzione

| # | Nome | Sintomo | Perché è grave | Rimedio |
|---|---|---|---|---|
| B1 | **Il ricevitore ingenuo** | Non deduplica, non verifica la firma, risponde lentamente | Due referti pubblicati, notifiche accettate da chiunque conosca l'indirizzo, ritentativi che moltiplicano il carico | Deduplicare, verificare, rispondere subito e lavorare in modo asincrono |
| B2 | **La chiave di idempotenza casuale** | Generata nuova a ogni tentativo, o omessa nel ritentativo automatico della libreria | Duplicati per costruzione, esattamente quando serve non produrne | Derivarla dal tentativo logico e riusarla nei ritentativi |
| B3 | **Il gettone nell'indirizzo** | Il gettone di ingresso compare nell'indirizzo della cornice | Finisce in cronologia, registri del proxy, intestazione di provenienza, screenshot, monitoraggio degli errori | Consegna fra back-end, poi messaggistica |
| B4 | **La sovrascrittura del documento** | La nuova versione sostituisce quella archiviata | Si perde l'informazione su che cosa era stato refertato e quando: è ciò che serve in una contestazione | Rappresentare la sostituzione, mantenere la catena |
| B5 | **Il ruolo eterno** | Si notifica l'inizio dei ruoli, mai la cessazione | Chi cambia struttura mantiene un accesso legittimo dal punto di vista del sistema | Notificare la fine, non solo l'inizio |
| B6 | **L'unico client per tutti gli ambienti** | Le stesse credenziali in prova e in produzione | Un incidente in prova diventa un incidente in produzione | Un client, una chiave, un tenant, un elenco di origini per ambiente |
| B7 | **Il silenzio interpretato come normalità** | Nessun evento in arrivo, nessun allarme | Un canale rotto è indistinguibile da un periodo senza attività. I referti mancanti si scoprono dopo settimane | Sorvegliare il segnale periodico e il volume atteso |
| B8 | **La sincronizzazione totale «per sicurezza»** | Si riversa l'intera anagrafica | Si trattano dati di persone che non hanno alcuna prestazione: trattamento eccedente senza beneficio | Riferimento all'occorrenza |
| B9 | **Il registro dei corpi** | Lo strato HTTP registra richieste e risposte per default | Dati sanitari nei vostri registri applicativi, con obblighi che non avete pianificato | Registrare metadati, non corpi. E mai i gettoni |
| B10 | **Il versionamento scambiato per immutabilità** | Si dichiara un registro immutabile che è un versionamento di entità | Chi ha accesso in scrittura alla base dati può alterare anche le tabelle di versione: la proprietà dichiarata non esiste | Catena di hash e conservazione separata |

### Livello 3 — attrito e ticket di assistenza

| # | Nome | Sintomo | Rimedio |
|---|---|---|---|
| C1 | **La verifica sul corpo riserializzato** | La firma non torna mai | Leggere i byte grezzi, verificare l'impronta prima della firma |
| C2 | **L'orologio alla deriva** | Rifiuti intermittenti che sembrano difetti di firma | Sincronizzare l'orologio: la finestra è di cinque minuti |
| C3 | **L'ambito assunto** | Rifiuti su endpoint che «dovrebbero funzionare» | Leggere l'ambito **concesso** nella risposta di token, non quello richiesto |
| C4 | **Il client rigido** | Si rompe quando compare un campo nuovo o un valore enumerato sconosciuto | Ignorare l'ignoto: è una modifica compatibile per definizione |
| C5 | **L'errore sul tipo di evento sconosciuto** | Un tipo nuovo fa fallire il ricevitore | Ignorare e rispondere comunque con successo |
| C6 | **La cattura dello schermo dimenticata** | Video e audio sì, condivisione no | È una funzione a sé nella politica dei permessi |
| C7 | **Il rinvio dentro la cornice** | I permessi si perdono dopo il caricamento | La cornice non naviga verso altre origini: è per questo che il gettone arriva fra back-end |
| C8 | **Il confronto di origine approssimato** | Funziona, e accetta anche origini ostili | Confronto **esatto**, mai per suffisso o contenimento |
| C9 | **La destinazione generica nella messaggistica** | Funziona finché la cornice non viene sostituita | Origine esplicita, sempre |
| C10 | **L'istante senza fuso** | Prestazioni programmate con un'ora di scarto, due volte l'anno | Fuso esplicito, sempre |
| C11 | **La raffica sincronizzata** | Metà delle chiamate respinte alle 7:00 in punto | Distribuire, con un ritardo casuale di pochi secondi |
| C12 | **Il ritentativo immediato** | Il rifiuto per quota si moltiplica | Rispettare l'indicazione di quando ritentare |
| C13 | **La verifica del certificato disattivata «per la prova»** | Nessun sintomo. Resta disattivata | Inserire il certificato del proxy nella catena di fiducia, o escludere la destinazione |
| C14 | **Il cursore conservato troppo a lungo** | La ripresa fallisce dopo giorni | Riprendere da un istante dopo un'interruzione lunga |
| C15 | **La cache persistita del servizio di terminologie** | Nessun sintomo tecnico, un problema di licenza | Memoria non persistita su disco per i sistemi la cui licenza non consente derivati |

### Livello 4 — architetturali, si pagano dopo

| # | Nome | Perché è un errore | Alternativa |
|---|---|---|---|
| D1 | **Il componente in processo per la sessione clinica** | Il gettone finisce nel contesto di esecuzione della vostra applicazione: una vulnerabilità di iniezione di script nel vostro sistema diventa accesso a sessioni cliniche | Cornice su origine separata |
| D2 | **Il proxy inverso sulla propria origine** | L'isolamento cessa di esistere, e la restrizione della cornice diventa illusoria | Cornice cross-origine, architettura senza cookie |
| D3 | **La sessione basata su cookie** | Intermittente e non riproducibile: dipende da browser, versione e configurazione dell'utente | Nessun cookie, credenziali in memoria |
| D4 | **Le metriche di rete modellate come osservazioni cliniche** | Finiscono nella cartella clinica dell'assistito, e spostano il confine di ciò che il sistema afferma sul paziente | Piano applicativo |
| D5 | **La capacità di prodotto forzata dentro una risorsa clinica** | Se gran parte del contenuto sta in estensioni proprietarie, non è interoperabilità: è un formato proprietario travestito da standard | Piano applicativo |
| D6 | **Il punto di estensione su misura per un solo integratore** | Avrà quasi certamente la forma sbagliata, e va mantenuto per anni | Due implementazioni concrete, poi l'astrazione |
| D7 | **La trasformazione preventiva dei dati clinici** | Rende irricostruibile la provenienza e cancella il confine fra ciò che ha scritto il professionista e ciò che ha scritto un programma | Decisione preventiva che può solo rifiutare |
| D8 | **La biforcazione del codice come prima risposta** | Esce dal perimetro di ogni valutazione di conformità, interrompe il flusso di correzioni di sicurezza e fa decadere tutte le garanzie di processo | Chiedere il punto di estensione mancante |
| D9 | **Il consenso come casella spuntata** | Non risponde alla domanda «era valido in quel momento?», che è l'unica che conta in una contestazione | Fatto con validità temporale |
| D10 | **Il pagatore trattato come consultatore** | Non è configurabile, e nel materiale commerciale è un'affermazione da correggere | Profilo amministrativo per costruzione |

---

## Parte terza — le frasi che segnalano un problema

Sono frasi che si sentono nelle riunioni di integrazione. Ciascuna è, quasi sempre, il sintomo di
una decisione che va rivista.

1. **«Per ora mettiamo il token in una variabile, poi sistemiamo.»** Non si sistema.
2. **«Tanto la firma la verifichiamo dopo.»** Il ricevitore va in produzione senza verifica, e la
   verifica non arriva mai perché «funziona».
3. **«Basta che ci mandiate il referto nella notifica.»** No, e la ragione non è tecnica.
4. **«Facciamo che l'utente clicca due volte, tanto è veloce.»** Il secondo accesso è il modo più
   affidabile di far fallire un progetto di telemedicina.
5. **«Il nostro sistema è dietro il firewall, non serve autenticare.»** L'autenticazione non
   protegge dalla rete: protegge dall'attribuzione sbagliata.
6. **«L'anagrafica la copiamo tutta, così è più semplice.»** È più semplice finché non diverge, e
   diverge sempre.
7. **«Nascondiamo quell'avviso, l'utente lo trova fastidioso.»** Se un avviso è fastidioso, o è
   scritto male o l'utente ha ragione a essere avvisato. In entrambi i casi non si nasconde.
8. **«Se non arrivano notifiche vuol dire che non c'è nulla.»** Oppure che il canale è rotto.
9. **«Il contratto lo definiamo strada facendo.»** Un contratto definito strada facendo è un
   contratto che si rompe strada facendo, e a rompersi è sempre l'integrazione di qualcun altro.
10. **«La conformità la vediamo alla fine.»** Alcune attività **non sono recuperabili a
    posteriori**: identificativi di requisito, inventario dei componenti di terze parti,
    controllo dei documenti. Ciò che nasce fuori controllo va riemesso.

---

## Parte quarta — come chiedere aiuto in modo efficace

Se dopo tutto questo siete ancora bloccati, queste informazioni riducono di molto il tempo di
risposta.

| Informazione | Perché serve |
|---|---|
| **L'identificativo di traccia** presente in ogni risposta di errore | Consente di ritrovare la richiesta esatta senza chiedervi di riprodurla |
| **Il tipo di problema** — non il messaggio, l'identificatore | È la chiave stabile; il messaggio cambia con la lingua |
| **L'istante con fuso orario** | Un istante senza fuso costa uno scambio di messaggi in più |
| **Che cosa vi aspettavate e che cosa avete ottenuto**, separati | Metà delle segnalazioni descrive solo la seconda |
| **La richiesta**, con i gettoni **rimossi** | Un gettone incollato in una segnalazione è un gettone da revocare |
| **L'ambiente e il tenant** | Prova e produzione sono installazioni distinte |
| **Se funzionava prima**, e da quando non funziona | Restringe il campo a una modifica, vostra o nostra |

E una richiesta: **non incollate mai dati di persone reali in una segnalazione.** Un
identificativo interno è sufficiente per ritrovare il caso nei sistemi autorizzati, e non
trasforma una segnalazione in un trattamento di dati sanitari fuori perimetro.
