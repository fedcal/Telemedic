# Configurazione di riferimento del nodo di relay - artefatto P7 di T-04

> **Che cos'è questo documento.** È l'artefatto P7 previsto da
> [`.telemedic/piani/T-04-verifiche-empiriche.md`](../.telemedic/piani/T-04-verifiche-empiriche.md)
> §3: la configurazione di riferimento del nodo di relay contro cui il criterio 4 di `T-04` -
> «il tentativo di creare un permesso di inoltro verso destinazioni interne non riesce, e una
> qualunque riuscita fa fallire la costruzione» - viene esercitato con i sei tentativi elencati
> in [`P6-tentativi-di-allocazione.tsv`](./P6-tentativi-di-allocazione.tsv). Il file di
> configurazione vero e proprio è accanto,
> [`P7-configurazione-di-riferimento-relay.conf`](./P7-configurazione-di-riferimento-relay.conf);
> questo documento lo motiva e dichiara i quattro corollari che applica.
>
> **Che cosa questo documento non è.** Non è codice, nemmeno usa-e-getta: non contiene il
> client che esegue i sei tentativi né la pipeline che li fa fallire la costruzione. Non è una
> descrizione dell'installazione di un cliente: è la configurazione **di riferimento del
> progetto**, la distinzione del §3 qui sotto ne spiega la portata.
>
> **Fonte primaria.** Ogni corollario applicato qui è ricavato da
> [`docs/06_security/05-sicurezza-del-tempo-reale.md`](../docs/06_security/05-sicurezza-del-tempo-reale.md)
> §4, in particolare §4.3 - già pubblicato e vincolante come
> [V-10](../docs/11_registri/01-vincoli-in-vigore.md#v-10) - insieme a
> [`docs/01_technical/01-stack-e-motivazioni.md`](../docs/01_technical/01-stack-e-motivazioni.md)
> §9 per la versione minima e a
> [`docs/06_security/01-modello-di-minaccia.md`](../docs/06_security/01-modello-di-minaccia.md)
> per il rischio `M-13` che questa configurazione contiene. Nessuna voce di questo documento è
> marcata `[NV]`: i quattro corollari sono interamente ricavati dalla fonte appena citata, che
> li dichiara «esattamente i punti che una configurazione ragionevole sbaglia» - non una
> ricostruzione di chi scrive questo artefatto.

## 1. Il vincolo che questa configurazione applica

**[V-10](../docs/11_registri/01-vincoli-in-vigore.md#v-10): versione minima del nodo di relay quella dichiarata dal vincolo, e isolamento di
rete in uscita come difesa primaria.** La versione minima non è ripetuta qui in cifra per non
doverla mantenere in due posti: la cifra vive in un solo punto, il registro dei vincoli, e
questo documento vi rimanda invece di duplicarla. La seconda parte del vincolo - l'isolamento
di rete in uscita come difesa primaria - è il §3 di questo documento, e non riguarda la
configurazione del nodo: riguarda l'infrastruttura che lo ospita.

Questa configurazione esiste perché la sola difesa primaria non è sufficiente da sola a
dimostrare qualcosa in un banco di prova: l'isolamento di rete in uscita è un presupposto di
installazione, non un artefatto che una pipeline possa osservare da dentro il codice. Ciò che
la pipeline **può** osservare ed esercitare è la configurazione applicativa del nodo - la difesa
in profondità - ed è quella che questo documento fissa.

## 2. I quattro corollari applicati

`docs/06_security/05-sicurezza-del-tempo-reale.md` §4.3 li introduce con una frase che vale la
pena ripetere qui perché è la ragione per cui questo documento esiste distinto dal resto della
configurazione tecnica: sono «esattamente i punti che una configurazione ragionevole sbaglia».

### 2.1 Corollario primo - il comportamento predefinito è permissivo, il diniego globale non esiste

La regola documentata a monte è che, in assenza di una regola per un indirizzo, l'indirizzo **è
consentito**. Non esiste un interruttore di diniego globale: va costruito **enumerando gli
intervalli**. Ne discende che la sezione del file di configurazione dedicata ai divieti non è
un elenco di casi sospetti aggiunti nel tempo: è un'**enumerazione chiusa** di tutto ciò che
non è un indirizzo pubblico instradabile, perché una riga dimenticata in questo schema non
lascia uno spazio scoperto piccolo - lascia **tutto il resto di Internet** raggiungibile.

Nel file di configurazione, questo corollario copre: l'interfaccia di ritorno (tentativo 1 di
P6), i tre blocchi di rete privata definiti da RFC 1918 (tentativo 4), il blocco condiviso per
la traduzione di indirizzi fra fornitore e abbonato (RFC 6598), il blocco link-local locale
riservato da RFC 3927 in cui cade convenzionalmente il servizio di metadati dell'infrastruttura
(tentativo 3, e vedi anche il corollario quarto), i blocchi di documentazione IPv4 (RFC 5737) e
i blocchi multicast e riservati.

### 2.2 Corollario secondo - la lista di indirizzi consentiti non si usa

La regola documentata a monte è che, se un indirizzo compare **sia** nella lista dei vietati
**sia** in quella dei consentiti, è considerato consentito **comunque**. Una singola riga
permissiva annulla qualunque diniego, per quanto articolato: la lista di consentiti non è una
seconda regola che si somma alla prima, è una regola che **prevale**.

**Nel profilo sanitario la lista di indirizzi consentiti non si usa.** Il file di configurazione
non contiene, deliberatamente, alcuna direttiva che dichiari un indirizzo consentito: non
perché non ce ne sia bisogno oggi, ma perché introdurne una - per qualunque motivo, anche
transitorio, anche per una prova - trasformerebbe l'intero corollario primo in una preferenza
disattivabile con una riga sola, senza che nessuno se ne accorga fino al giorno in cui quella
riga viene usata per il bersaglio sbagliato. È un **divieto**, e questo documento lo dichiara
tale: la sezione corrispondente del file di configurazione esiste apposta per essere trovata
**vuota** da chi la legge, non per essere compilata in futuro.

### 2.3 Corollario terzo - gli intervalli IPv6 sono allineati a un prefisso

È la mitigazione dichiarata dalla fonte a monte per il difetto di confronto degli indirizzi
IPv6: un confine di diniego espresso come intervallo minimo-massimo arbitrario può essere
aggirato da un'implementazione che confronta gli indirizzi **componente per componente**
anziché numericamente, perché quel confronto non riconosce come «dentro l'intervallo» un
indirizzo che, numericamente, lo è. Un confine allineato a un prefisso **non ha** questo
problema, perché il confronto per componenti e quello numerico coincidono su un confine di
prefisso.

Nel file di configurazione ogni riga IPv6 - senza eccezioni - è scritta come prefisso allineato:
loopback, non specificato, traduzione verso IPv4 (RFC 6052), scarto (RFC 6666), documentazione
(RFC 3849, tentativo 6 di P6), locale unico (RFC 4193), link-local (RFC 4291) e multicast
(RFC 4291). **La contromisura al tentativo 6 non è una riga singola dedicata**: è l'assenza
strutturale, in tutta la configurazione, della forma che il difetto storico aggira. È la
ragione per cui, nella colonna `regola_p7` di P6, il tentativo 6 rimanda al corollario nel suo
insieme e non a una riga.

### 2.4 Corollario quarto - nessun servizio co-locato, servizio di metadati irraggiungibile, indirizzo pubblico del nodo negato

Ha due parti distinte, ed entrambe compaiono nel file di configurazione.

**La prima** è l'irraggiungibilità di qualunque servizio co-locato sul nodo: nessuna base dati,
nessun agente di gestione in ascolto su un'interfaccia raggiungibile dal relay, nessun punto di
accesso al servizio di metadati dell'infrastruttura. È il completamento dell'isolamento: se non
c'è nulla da raggiungere, un difetto di canonicalizzazione non ha bersaglio. Nel file di
configurazione questo si traduce nell'assenza di qualunque direttiva che apra un servizio
applicativo aggiuntivo sul nodo, oltre al relay stesso, e nell'inclusione del blocco link-local
locale fra gli intervalli negati del corollario primo.

**La seconda** è la riga dedicata all'**indirizzo pubblico del nodo stesso** (tentativo 5 di
P6). Senza di essa, il nodo può raggiungere i propri servizi passando dal proprio indirizzo
pubblico invece che dall'interfaccia di ritorno, il che aggira per intero la logica di
protezione del loopback dei tentativi 1 e 2: non è un indirizzo generico che un'enumerazione
comune coprirebbe per caso, è un indirizzo **specifico di questo nodo** che va dichiarato e
mantenuto aggiornato a ogni cambio di indirizzo pubblico. È la riga più facile da dimenticare
delle quattro, perché non compare in nessuna checklist generica di indirizzi da negare: compare
solo se si è già ragionato sul fatto che il nodo, per sé stesso, è un peer indistinguibile da
qualunque altro.

## 3. Che cosa questa configurazione accerta, e che cosa non accerta

La distinzione è quella che il criterio 4 di `T-04` chiede di scrivere nell'esito, non
un'aggiunta di questo documento:

**Accerta** che la configurazione di riferimento del progetto - questo file - regga i sei
tentativi di P6. È una verifica **della configurazione**, eseguita contro un'istanza del nodo
di relay nella versione minima dichiarata da V-10.

**Non accerta** che l'isolamento di rete in uscita sia applicato nell'installazione di chi
installa. L'isolamento di rete in uscita - il nodo di relay privo di qualunque rotta verso la
rete interna, applicato con le regole dell'infrastruttura e non con direttive del file di
configurazione - è la **difesa primaria**: non dipende dalla correttezza del codice del nodo di
relay, ed è un **presupposto di installazione**, non un prodotto di questo progetto. Le righe di
questo file - la lista di indirizzi vietati nel suo complesso - sono **difesa in profondità**,
e lo sono precisamente perché la famiglia di sei difetti distinti in otto anni documentata in
`docs/06_security/05-sicurezza-del-tempo-reale.md` §4.2 dimostra che quella lista, da sola, **è
stata aggirata quattro volte negli ultimi otto mesi** dal solo codice che la applica. Chi legge
l'esito di questa verifica come «l'isolamento di rete del relay è garantito» legge più di quanto
la verifica dimostri: dimostra che la configurazione applicativa regge, non che l'infrastruttura
che la ospita è isolata. La responsabilità di applicare l'isolamento di rete in uscita
nell'installazione appartiene a chi installa, secondo la ripartizione di
[`docs/06_security/09-ripartizione-delle-responsabilita.md`](../docs/06_security/09-ripartizione-delle-responsabilita.md).

## 4. Segreti

Nessun segreto in questo documento né nel file di configurazione allegato: i valori sensibili
con cui il servizio applicativo emette le credenziali effimere del relay (§7 di
[`docs/04_protocols/09-tempo-reale.md`](../docs/04_protocols/09-tempo-reale.md)) e con cui i
nodi indipendenti condividono la firma dei valori usa e getta
(`docs/10_fondamenti/08-webrtc-da-zero.md` §11.6) sono i due segnaposto
`${TURN_STATIC_AUTH_SECRET}` e `${TURN_STATELESS_NONCE_SECRET}` nel file di configurazione -
già i nomi stabiliti in `docs/10_fondamenti/08-webrtc-da-zero.md` §11.5, ripresi qui invece di
inventarne di nuovi - e vanno iniettati da un gestore di segreti in ogni ambiente in cui questa
configurazione di riferimento viene effettivamente applicata. Non esiste, in nessun punto di
questo artefatto, un valore che possa essere confuso con una credenziale reale.

## 5. Corrispondenza con i sei tentativi di P6

| Tentativo di P6 | Corollario | Dove nel file di configurazione |
|---|---|---|
| 1 - interfaccia di ritorno, forma diretta | primo | riga dedicata al blocco di loopback IPv4 |
| 2 - interfaccia di ritorno, forma mappata IPv6 | primo, applicato anche alla forma mappata | riga dedicata al blocco `::ffff:0:0/96` |
| 3 - servizio di metadati dell'infrastruttura | quarto, prima parte | riga dedicata al blocco link-local locale |
| 4 - indirizzo di rete privata | primo | righe dedicate ai tre blocchi RFC 1918 |
| 5 - indirizzo pubblico del nodo stesso | quarto, seconda parte | riga dedicata, distinta, all'indirizzo pubblico dichiarato |
| 6 - intervallo IPv6 non allineato a un prefisso | terzo | assenza strutturale: nessuna riga IPv6 non allineata in tutto il file |

## 6. Ciò che questo documento non tratta, e dove sta

- **La suite di abuso in integrazione continua che esegue i sei tentativi** non è qui: è codice
  usa-e-getta, escluso da questo artefatto per lo stesso motivo per cui `T-04` esclude ogni
  codice dai propri artefatti preparatori (§1 del piano di `T-04`).
- **L'algoritmo di sintesi sottostante al calcolo delle credenziali effimere** non è un
  corollario di questa configurazione: è marcato `[NV]` altrove, in
  `docs/04_protocols/09-tempo-reale.md` §7.4, con il collaudo di integrazione che deve
  risolverlo. Non lo si ripete qui perché non riguarda l'isolamento di rete in uscita.
- **Le altre misure di irrobustimento del nodo di relay** - credenziali effimere, rotazione del
  segreto condiviso senza interruzione, interfaccia di amministrazione disattivata, nessun
  reindirizzamento per la gestione dei certificati, nessuna funzione di mobilità della sessione,
  limitazione di frequenza, quote - sono già dichiarate in
  `docs/06_security/05-sicurezza-del-tempo-reale.md` §4.4 e compaiono nel file di configurazione
  allegato per completezza operativa, ma **non sono fra i quattro corollari** di questo
  documento e non vanno confuse con essi: i quattro corollari riguardano specificamente
  l'isolamento verso destinazioni interne, le altre misure riguardano la superficie del nodo nel
  suo complesso.
