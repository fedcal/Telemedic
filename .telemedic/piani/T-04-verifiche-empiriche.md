# T-04 - Verifiche empiriche sul percorso critico del perimetro ridotto

**Traguardo** `T-04` · **Classe di attività** `C` · **Classe di enunciato** `[IMPEGNO]`
**Data** 3 ottobre 2026 · **Titolare** contributore unico
**Innesco** esistenza della pipeline di `T-03`, attraverso la quale le verifiche girano

> **Che cosa è questo documento.** È il piano di esecuzione dei cinque criteri di `T-04` come sono
> scritti in [`docs/09_roadmap/02-traguardi.md`](../../docs/09_roadmap/02-traguardi.md). Non li
> riformula e non ne aggiunge.
>
> **Che cosa questo documento non è.** Non contiene codice, né applicativo né usa-e-getta.
> Descrive che cosa va verificato, con quale procedura, e che cosa si registra come esito.
>
> **Le date sono allocazioni, non stime.** Nessuna percentuale di avanzamento.

---

## 1. La premessa da verificare, e l'esito della verifica

La premessa che questo piano ha ricevuto è che **`T-04` sia eseguibile subito**, perché sono
verifiche empiriche e non codice applicativo. Verificata sui criteri, riga per riga, **la premessa
è vera per una sola verifica su cinque.** L'esito è il seguente e determina tutto il resto del
piano.

| Criterio | Che cosa richiede materialmente | Eseguibile **prima** del cancello di `T-03`? |
|---|---|---|
| **1** - scambio di token nel gateway con delega esplicita | Un gateway che validi integralmente il token dell'integratore ed emetta un token interno con il claim dell'attore. **È codice** | **No.** Solo come codice usa-e-getta, che `T-03` ammette in eccezione a `V-182` ma che presuppone `T-03` |
| **2** - token d'ingresso a uso singolo, scadenza brevissima, canale posteriore | Un emettitore e un consumatore del token. **È codice** | **No**, stessa ragione |
| **3** - tre difetti del prodotto di federazione chiusi e sorvegliati | Configurazione di un'istanza effimera **più** una prova che fallisce se la configurazione regredisce | **In parte.** La configurazione sì, la sorveglianza no: «sorvegliata da una prova» significa in pipeline |
| **4** - isolamento di rete in uscita del nodo di relay | Un tentativo di allocazione con credenziale valida verso sei destinazioni, e il testo del criterio dice **«fallisce la costruzione»** | **No.** «Fa fallire la costruzione» è la pipeline di `T-03`, per definizione |
| **5** - rinvio delle tre verifiche non nel perimetro, con la regola che resta in vigore | Prosa versionata | **Sì.** È l'unica interamente eseguibile subito |

**Conclusione operativa.** `T-04` non è un traguardo che si può anticipare: è un traguardo che si
può **preparare** integralmente, e la preparazione è ciò che rende praticabile una finestra di
sette giorni fra il 26 settembre e il 3 ottobre 2026. Il §3 elenca che cosa va prodotto prima del
cancello; il §4 elenca che cosa si esegue dopo; il §5 dice come si dimostra ciascun criterio.

> **La tensione che questa verifica ha fatto emergere, e che il piano non risolve.** `T-04` ha per
> innesco la pipeline di `T-03`; `T-03` dichiara fra ciò che non comprende «il codice usa-e-getta
> delle verifiche di `T-04`», cioè lo colloca **prima** di sé; `D18` prescrive lo spike nella
> prima settimana di sviluppo, **prima di ogni altra attività**. Le tre affermazioni sono
> conciliabili solo se «la prima settimana di sviluppo» è la settimana che segue la chiusura di
> `T-03`, cioè 26 settembre - 3 ottobre 2026. La lettura è coerente con il calendario e con il
> diagramma della roadmap, **ma non è scritta in alcun documento**. Questo piano la assume, la
> dichiara come assunzione, e la porta al §9.

---

## 2. Che cosa `T-04` esiste per fare, e il criterio che ne governa il perimetro

Rimuovere, con verifiche brevi e usa-e-getta, le incertezze da cui dipendono **decisioni costose o
affermazioni pubbliche**, nel perimetro effettivamente rilasciato. Il tratto comune delle attività
di classe `C` è che il costo della verifica è di ordini di grandezza inferiore al costo di aver
documentato un comportamento inesistente.

Tre delle sette verifiche precedenti riguardano funzioni tagliate da `RU-1` e **si rinviano con
esse**, per la regola di [01 §5.3](../../docs/09_roadmap/01-principi-e-metodo.md): una verifica su
una funzione tagliata è essa stessa una funzione tagliata. **La regola che ciascuna presidiava
resta però in vigore**, ed è il criterio 5. Il rischio non è dimenticare la verifica: è dimenticare
il divieto insieme a essa.

Il rango della verifica 2 è **salito** rispetto alla versione precedente del traguardo: con il
componente incorporabile tagliato (`TG-03`), il token d'ingresso a uso singolo non è un ripiego, è
**la** modalità con cui l'integratore avvia la sessione. Se quella verifica fallisce, `RU-1` non ha
alcuna via di integrazione.

---

## 3. Che cosa va prodotto prima del 26 settembre 2026

Nessuna di queste voci è codice. Tutte sono massa sottratta alla finestra di sette giorni, e la
loro assenza è la ragione più probabile per cui `T-04` non chiuderebbe in tempo.

| # | Artefatto | Perché senza di esso il criterio non è binario |
|---|---|---|
| P1 | **Enumerazione versionata delle configurazioni supportate** del confine di autorizzazione | Il criterio 1 chiede che «**nessuna configurazione supportata** produca un token privo del claim dell'attore». Senza l'insieme dichiarato e versionato, la prova negativa è tautologica: si prova sui casi che si conoscono e si conclude su tutti |
| P2 | **Protocollo scritto della verifica 1**: quali controlli sul token in ingresso, in quale ordine, e quale esito produce ciascun fallimento | I controlli sono cinque - firma su chiave risolta dal materiale pubblico dichiarato per quel tenant, emittente atteso, destinatario atteso, finestra temporale con tolleranza dichiarata, identificativo di chiave nell'insieme consentito per quel tenant - e un token che non superi anche uno solo **non produce un token interno e non produce una registrazione di accesso**: è un tentativo respinto |
| P3 | **Elenco dei casi di abuso della verifica 1**: token manomesso, scaduto, con emittente errato, con destinatario errato, con chiave non consentita, con delega falsificata, riusato fra tenant | Sono i casi già dichiarati dall'area tecnica; scriverli prima impedisce di scrivere solo quelli che passano |
| P4 | **Protocollo della verifica 2**, con la dichiarazione che la scadenza brevissima è **configurazione** con un valore predefinito dichiarato, mai una costante | È la regola generale del progetto sui valori: la configurazione non può cambiare il comportamento di sicurezza, ma il valore non si cabla |
| P5 | **Configurazione di riferimento del prodotto di federazione**, con i tre difetti chiusi e **soli segnaposto** `${VARIABILE_AMBIENTE}` | La verifica 3 chiude una configurazione: se la configurazione non esiste prima, la finestra si consuma a scriverla |
| P6 | **Elenco dei sei tentativi di allocazione** della verifica 4 | Sono già dichiarati dall'area di sicurezza: interfaccia di ritorno in forma diretta; la stessa in forma mappata in IPv6; indirizzo del servizio di metadati dell'infrastruttura; indirizzo di rete privata; **indirizzo pubblico del nodo stesso**; **indirizzo dentro un intervallo IPv6 non allineato a un prefisso**. Gli ultimi due sono quelli che una suite scritta prima della verifica non contiene, e sono esattamente i due che corrispondono ai difetti più recenti |
| P7 | **Configurazione di riferimento del nodo di relay**, con i quattro corollari applicati | Il comportamento predefinito è **permissivo** e il diniego globale **non esiste come opzione**: va costruito enumerando gli intervalli. La lista di indirizzi consentiti **non si usa**, perché prevale sempre su quella dei vietati |
| P8 | **Forma del registro degli esiti**: per ciascuna verifica, esito fra *riuscita*, *fallita*, *riuscita con condizioni*, più la **conseguenza sulla progettazione** scritta | È il criterio di completamento del traguardo nella sua lettera. Un esito senza conseguenza scritta non chiude |
| P9 | **Testo dei cinque rinvii** del criterio 5, ciascuno con la regola che resta in vigore | È l'unica parte interamente eseguibile prima del cancello: va chiusa prima, non dopo |

---

## 4. La finestra, e la sequenza dei sette giorni

Dal 26 settembre al 3 ottobre 2026 corrono **sette giorni**, cioè **dieci-venti ore** alla capacità
di `D62`. È la prima delle sette settimane fra `T-03` e `T-08`, ed è interamente consumata da
`T-04`: `T-08` non comincia prima del suo esito, perché `T-04` è suo innesco.

L'ordine è determinato dalle dipendenze, non dall'importanza.

| Ordine | Verifica | Perché in questa posizione | Dipende da |
|---|---|---|---|
| **1ª** | Criterio 5 - i rinvii registrati | Non richiede nulla. Se scivola, scivola per sempre, perché nessuno ha un innesco per riprenderlo | P9, già pronto |
| **2ª** | Criterio 3 - difetti del prodotto di federazione | La configurazione è già pronta (P5): resta la messa in esercizio dell'istanza effimera e la prova di regressione. È la verifica con il minor numero di incognite | P5, pipeline di `T-03` |
| **3ª** | Criterio 4 - isolamento di rete in uscita del relay | Configurazione pronta (P7) e casi pronti (P6). Non dipende dal gateway | P6, P7, pipeline |
| **4ª** | Criterio 1 - scambio di token con delega esplicita | È la più costosa e la più consequenziale: `D18` la colloca prima di ogni altra attività **di sviluppo**, e qui lo è, perché le tre precedenti sono configurazione e non sviluppo | P1, P2, P3, pipeline |
| **5ª** | Criterio 2 - token d'ingresso a uso singolo | Riusa l'impianto della quarta e ne è la controparte: senza gateway non c'è emissione | P4, criterio 1 |

**Che cosa è parallelizzabile.** Con un contributore unico, nulla in senso stretto. Ciò che non si
contende risorse è la scrittura del registro degli esiti (P8), che si compila mentre le verifiche
girano e non dopo: un esito registrato il giorno dopo è un esito ricostruito.

---

## 5. I criteri, uno per uno: che cosa serve, e come si dimostra

Ogni verifica produce **un esito registrato** - riuscita, fallita, o riuscita con condizioni - e la
**conseguenza sulla progettazione è scritta**. È il criterio di completamento del traguardo, e vale
per tutte e cinque.

### Criterio 1 - Scambio di token nel gateway con delega esplicita

**Che cosa si verifica.** Che il gateway **validi integralmente** il token dell'integratore ed
emetta un token interno con il claim dell'attore, e che **nessuna configurazione supportata**
produca un token privo di quel claim.

**Che cosa serve.** L'insieme P1 delle configurazioni supportate; il protocollo P2 con i cinque
controlli e il loro ordine; i sette casi di abuso P3; e codice usa-e-getta, dichiarato tale,
residente in un'area separata, **non incluso in alcun artefatto distribuito**.

**Come si dimostra, in forma binaria.**

1. Per ogni configurazione dell'insieme P1, il token emesso porta il claim dell'attore. La
   dimostrazione è un'enumerazione, non un campione: l'insieme è chiuso e versionato.
2. **La prova negativa**: per ogni configurazione dell'insieme P1, non esiste percorso che produca
   un token privo del claim. La prova è vista fallire su una configurazione deliberatamente
   alterata.
3. Per ciascuno dei sette casi di abuso, il gateway **non produce un token interno e non produce
   una registrazione di accesso**: produce un tentativo respinto, che finisce nel tracciamento. La
   differenza fra le due cose è essa stessa oggetto di asserzione.
4. Il livello di garanzia dell'autenticazione è **qualificato dalla provenienza**: eseguito dal
   sistema oppure riferito dall'integratore. Un livello riferito non soddisfa un requisito di
   autenticazione forte, e copiarlo senza qualificarlo farebbe apparire come verificata dal
   progetto un'autenticazione che il progetto non ha eseguito.
5. **La delega si rappresenta sempre con il claim dell'attore, mai sostituendo il soggetto.** La
   prova asserisce che il soggetto originario è conservato: la delega dice «X ha operato per conto
   di Y», l'impersonificazione dice «era Y» e cancella la responsabilità reale.

**Conseguenza da scrivere accanto all'esito.** Questa verifica **non sostituisce** la revisione
esterna indipendente del codice di sicurezza critico che `D18` prescrive. Quella è `TG-21`,
irreversibile per il periodo, e la differenza va dichiarata e non attenuata: qui si verifica **il
comportamento**, non si rivede il codice.

**Regola che sopravvive alla verifica.** Il codice usa-e-getta **non diventa il gateway di `T-08`**.
Una verifica riuscita autorizza a progettare; non è progettazione.

### Criterio 2 - Token d'ingresso a uso singolo

**Che cosa si verifica.** Che il token d'ingresso alla sessione sia **a uso singolo, con scadenza
brevissima, emesso su canale posteriore**, e che **non transiti mai per l'indirizzo**.

**Come si dimostra, in forma binaria.**

1. Il secondo uso dello stesso token è **rifiutato**. Non «sconsigliato»: rifiutato, con esito
   strutturato.
2. Il token scaduto è rifiutato, e il valore della scadenza è **letto dalla configurazione**: la
   prova lo imposta in entrambi i sensi per dimostrare che il rifiuto dipende dalla scadenza e non
   da altro.
3. Il token non compare in alcun indirizzo in nessun percorso previsto dalla configurazione
   supportata. È una prova negativa e va scritta come tale.
4. L'emissione avviene su canale posteriore: la prova asserisce che il percorso anteriore non lo
   restituisce.

**Perché sale di rango.** Con `TG-03` il componente incorporabile è tagliato: questa **è** la
modalità di avvio della sessione da parte dell'integratore, non un ripiego. Un esito «fallita»
qui non riduce una comodità: toglie a `RU-1` l'unica via di integrazione.

### Criterio 3 - Difetti noti del prodotto di federazione

**Che cosa si verifica.** Che i tre difetti dichiarati da `D37` siano **chiusi in configurazione**
e **sorvegliati da una prova che fallisce se la configurazione regredisce**: l'utente federato che
può alterarsi gli attributi; che può cambiare l'indirizzo di posta senza verifica; che può
impostarsi una credenziale locale aggirando la federazione.

**Come si dimostra, in forma binaria.** Per ciascuno dei tre, un tentativo eseguito con
un'identità federata **fallisce**; e la stessa prova, eseguita contro una configurazione
deliberatamente regredita, **passa il tentativo e fa fallire la suite**. La seconda metà è ciò che
distingue una configurazione chiusa da una configurazione sorvegliata: una configurazione di
sicurezza senza una prova che la sorvegli è una configurazione che tornerà a essere insicura al
primo aggiornamento, ed è l'indicatore anticipatore dichiarato di `R-13`.

**Vincolo di esecuzione.** Le prove girano contro un'**istanza effimera**, mai contro un ambiente
condiviso, e la configurazione contiene soli segnaposto `${VARIABILE_AMBIENTE}`.

### Criterio 4 - Isolamento di rete in uscita del nodo di relay

**Che cosa si verifica.** Che il tentativo di creare un permesso di inoltro verso destinazioni
interne **non riesca**, e che una qualunque riuscita **faccia fallire la costruzione**.

**Come si dimostra, in forma binaria.** Con una credenziale valida si tenta l'allocazione verso le
sei destinazioni dell'elenco P6. La costruzione fallisce se **una qualunque** riceve risposta
positiva. Non è una prova di regressione fra le altre: è una **misura di controllo del rischio
tracciabile**.

**Che cosa la verifica accerta, e che cosa non accerta.** Accerta che la configurazione di
riferimento del progetto regga i sei tentativi. **Non accerta** che l'isolamento sia applicato
nell'installazione di chi installa: l'isolamento di rete in uscita è applicato
dall'infrastruttura, è la **difesa primaria** e non dipende dalla correttezza del codice, ed è un
**presupposto di installazione**. Le liste di indirizzi vietati sono difesa in profondità. La
distinzione va scritta nell'esito, perché è quella che un responsabile della sicurezza deve poter
pesare.

**I due corollari che una configurazione ragionevole sbaglia**, e che l'esito deve dichiarare
applicati: il diniego predefinito **non esiste** e va costruito enumerando gli intervalli; la lista
di indirizzi consentiti **prevale sempre** su quella dei vietati e quindi **non si usa** nel
profilo sanitario - è un divieto, non una preferenza.

### Criterio 5 - I tre rinvii, con la regola che resta in vigore

**Che cosa si registra.** Per ciascuna delle tre verifiche rinviate, il rinvio **e** il divieto che
sopravvive:

| Verifica rinviata | Segue | Regola che resta in vigore |
|---|---|---|
| Inoltro del contesto di autenticazione attraverso l'intermediazione (`Q-160`, `B-8`) | La conformità sull'identità digitale nazionale, fuori dal perimetro ridotto | **Nessuna documentazione pubblica descrive il meccanismo finché l'esito non è registrato.** È la risposta a `R-15`, il cui impatto è reputazionale e il cui costo è una rettifica pubblica su un meccanismo di sicurezza |
| Contenitore del materiale registrato negoziato a runtime (`C-3`) | La registrazione della sessione, tagliata da `RU-1` | **Nessun materiale dichiara un formato unico di contenitore** |
| Comportamento del broker in assetto a nodo singolo | Il broker, tagliato da `TG-04` | **Nessun requisito funzionale dipende da garanzie del broker non verificate** |

**Come si dimostra, in forma binaria.** I tre testi sono versionati; e una verifica testuale sul
corpus pubblicato non trova alcuna descrizione del meccanismo di inoltro del contesto di
autenticazione, alcuna dichiarazione di formato unico di contenitore, alcun requisito funzionale
che dipenda da garanzie del broker. È un controllo di assenza, ed è l'unico modo in cui un divieto
si dimostra.

---

## 6. Che cosa `T-04` non comprende

- **Non comprende la realizzazione definitiva dei componenti verificati.** Una verifica riuscita
  autorizza a progettare; non è progettazione. Il gateway definitivo è il criterio 1 di `T-08`, e
  nasce dallo scheletro dei moduli, non dallo spike.
- **Non comprende la revisione esterna indipendente** del codice di sicurezza critico che `D18`
  prescrive: non è producibile sotto `D54`, è `TG-21`, ed è fra i tagli irreversibili per il
  periodo. Il confine di autorizzazione di `RU-1` **non è stato rivisto da un terzo**, e va scritto
  nelle note di rilascio.
- **Non comprende le tre verifiche rinviate**, di cui registra il rinvio e conserva il divieto.
- **Non comprende l'isolamento di rete nell'installazione di chi installa**, che è presupposto e
  non prodotto.
- **Non comprende alcuna prova su dati reali.** Le identità, i tenant e gli integratori usati sono
  sintetici e riconoscibili come tali.

---

## 7. Rischi propri, e la contromisura

| Rischio | Come si manifesta qui | Contromisura |
|---|---|---|
| **`R-13`** - i difetti del prodotto di federazione tornano al primo aggiornamento | Una configurazione chiusa e non sorvegliata si riapre a un aggiornamento e nessuno se ne accorge | La prova di regressione **è** il criterio 3, non un complemento: senza di essa il criterio non è soddisfatto |
| **`R-15`** - un meccanismo di sicurezza viene documentato prima di essere verificato | La comparsa, in una bozza pubblica, di una descrizione del meccanismo priva di rinvio a un esito registrato | Il criterio 5, che è una regola binaria in vigore e non una raccomandazione. Il rischio **è aumentato** con la riduzione di ambito, perché la verifica corrispondente è rinviata mentre la documentazione esiste già |
| **`R-02`** - concentrazione della conoscenza su un unico contributore | L'esito di una verifica resta nella testa di chi l'ha eseguita | Il registro degli esiti (P8) con la conseguenza sulla progettazione scritta: è la forma in cui la verifica sopravvive a chi l'ha fatta |
| **Proprio del traguardo - il codice usa-e-getta diventa codice di prodotto** | Sotto pressione di calendario, il gateway dello spike diventa il gateway | Area separata dichiarata; esclusione da ogni artefatto distribuito; la regola scritta nel traguardo e ripetuta nell'esito |
| **Proprio del traguardo - l'insieme delle configurazioni supportate viene enumerato dopo la prova** | La prova negativa diventa tautologica: si prova su ciò che si è pensato e si conclude su tutto | P1 prodotto **prima** del cancello e versionato: è la sola cosa che rende il criterio 1 binario |
| **Proprio del traguardo - la scadenza del token diventa una costante** | Un valore comodo scritto nel codice dello spike sopravvive nel prodotto | P4 dichiara la scadenza come configurazione con valore predefinito dichiarato |

---

## 8. Il rapporto con `T-08`, e perché la finestra non si comprime

`T-04` è innesco di `T-08` e la sua data è il 3 ottobre 2026, cioè il termine della prima delle
sette settimane della finestra di `T-08`. Ne discendono due conseguenze che vanno dette qui e non
scoperte a novembre.

**Prima.** Un giorno perso su `T-04` è un giorno perso su `T-08`, non un giorno recuperabile
altrove: la roadmap dichiara che le dipendenze di `T-08` - `T-01`, `T-03`, `T-04` - **non sono
comprimibili**.

**Seconda.** Gli esiti registrati di `T-04` sono ciò che autorizza a progettare il confine di
autorizzazione e la modalità di avvio della sessione. Un esito «riuscita con condizioni» non è un
esito neutro: le condizioni sono vincoli di progettazione per `T-08`, e vanno scritte in forma tale
da poter essere lette come vincoli e non come note.

---

## 9. Assunzioni dichiarate, e contraddizioni trovate

1. **Assunzione che il piano fa e che nessun documento scrive.** «La prima settimana di sviluppo»
   di `D18` è la settimana successiva alla chiusura di `T-03`, cioè 26 settembre - 3 ottobre 2026.
   È l'unica lettura che concilia l'innesco di `T-04`, l'eccezione dichiarata da `T-03` a `V-182` e
   la prescrizione di `D18`. Va confermata dall'area competente; se fosse smentita, il codice
   usa-e-getta dei criteri 1 e 2 precederebbe la pipeline, e con esso la prima riga di codice
   precederebbe la distinta dei materiali.
2. **`T-03` colloca il codice usa-e-getta di `T-04` fra ciò che non comprende, cioè prima di sé;
   `T-04` ha per innesco `T-03`.** Le due formulazioni si ordinano in modo opposto. Il piano
   adotta l'ordine del calendario - prima `T-03`, poi `T-04` - perché è quello del diagramma e
   delle date, e registra la divergenza testuale.
3. **`05 §2.1` dichiara «sono sette» le righe residue dell'ordine di sacrificio.** Dopo la
   revisione del 26 agosto 2026 sono **sei**: `S-7` è già eseguito e `S-8` è già applicato. Non
   incide su `T-04`, che non ha righe dell'ordine che lo alleggeriscano, ma incide sull'indicatore
   anticipatore di `R-28` con cui `T-04` viene osservato.
4. **`00 §8.4` fissa la soglia della settimana del 19 ottobre 2026 su «nove traguardi di classe
   `A`, `B` e `C`».** I traguardi di quelle classi sono cinque. La data è chiara, l'insieme no.

---

## 10. Vincoli che valgono comunque

- **Nessun dato reale**, in nessuna verifica, in nessun ambiente. Identità, tenant e integratori
  sintetici e riconoscibili come tali.
- **Nessun segreto**: soltanto segnaposto `${VARIABILE_AMBIENTE}`, in ogni configurazione di
  riferimento prodotta da questo traguardo.
- **Nessuna soglia clinica**: `T-04` non ne tocca alcuna. La scadenza del token e le quote del
  relay sono parametri tecnici, sono configurazione, e non sono costanti.
- **Nessuna terminologia sotto licenza** entra in queste verifiche.
- **Nessun esito «non verificato» viene scritto come «verificato»**: le tre verifiche rinviate
  restano rinviate, e i divieti che presidiano restano in vigore.
- Il progetto **non appone marcatura CE** e `T-04` non modifica questa condizione.
