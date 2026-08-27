---
title: Allineamento delle traduzioni
sidebar_position: 11
description: "La procedura di allineamento fra l'italiano e l'inglese del corpus: che cosa rende completa una proposta di modifica, che cosa si fa quando la traduzione ritarda, come si distingue un'area prerequisito da un'area a segnalazione. Criterio 6 di T-06."
---

# Allineamento delle traduzioni

Il criterio 6 di `T-06` chiede che sia «dichiarata e versionata la procedura di allineamento: che
cosa rende una proposta di modifica completa, che cosa si fa quando la traduzione ritarda, e come
si distingue un'area prerequisito da un'area a segnalazione». Questo capitolo è quella procedura.

---

## 1. Perimetro e collocazione

Il lavoro di traduzione ha vissuto per mesi in un solo file interno,
[`.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/RUNBOOK-TRADUZIONE-EN.md).
Quel file resta e continua a svolgere il proprio ruolo, ma non è una procedura versionata nel senso
in cui [`08_compliance/10-controllo-dei-documenti.md`](../08_compliance/10-controllo-dei-documenti.md)
§1 usa la parola: la stessa sezione elenca esplicitamente la documentazione interna sotto
`/.telemedic/context/` fra i documenti **non sottoposti a controllo formale**, priva quindi di
identificazione univoca, di revisore nominato per categoria e di regola di ritiro. Un criterio di
traguardo che chiede una procedura «dichiarata e versionata» non può essere soddisfatto da un
documento che il progetto ha già escluso, per propria dichiarazione, dal proprio controllo dei
documenti.

Questo capitolo divide il lavoro in due parti distinte, e la distinzione è deliberata, non
un'economia di scrittura. Questo documento contiene **la procedura**: le regole in vigore, che
chiunque proponga una modifica al corpus bilingue deve seguire, sotto controllo dei documenti come
ogni altro capitolo di quest'area. Il runbook resta il **registro degli errori già commessi**
nella traduzione - le trappole incontrate, il protocollo di continuazione su documenti lunghi, il
glossario delle rese sistematiche - che è materia diversa e resta interna: cambia a ogni sessione,
non richiede approvazione di un revisore nominato, e duplicarla qui produrrebbe due copie dello
stesso contenuto destinate a divergere, esattamente il problema che il progetto ha già argomentato
chiudendo `Q-26`. Dove questa procedura ha bisogno del dettaglio operativo - il formato esatto del
marcatore di continuazione, l'elenco delle rese terminologiche fissate, le trappole già pagate sulle
ancore - rimanda al runbook invece di ricopiarlo.

**Categoria e revisore.** Per la tabella di
[`08_compliance/10-controllo-dei-documenti.md`](../08_compliance/10-controllo-dei-documenti.md) §4,
questo documento appartiene alla categoria «Architettura e ciclo di vita» (`docs/01_technical/`,
insieme a `docs/02_architecture/` e `docs/04_protocols/`), il cui revisore nominato è l'Architetto
del dominio, con la competenza richiesta di conoscenza dell'architettura del progetto e della
ripartizione fra contesti delimitati. Una modifica a questo capitolo segue quindi lo stesso ciclo
di approvazione descritto in quel documento §7, non un percorso proprio.

---

## 2. Che cosa rende una proposta di modifica completa

La completezza di una proposta di modifica dipende dallo stato che
[`pipeline/differenziazione-traduzioni.tsv`](https://github.com/fedcal/Telemedic/blob/main/pipeline/differenziazione-traduzioni.tsv)
dichiara per l'area o per il documento toccato - lo stato stesso, e come si legge, sono l'oggetto
del § 4. Qui si dice che cosa quello stato comporta per chi apre la proposta.

**Se la proposta tocca un documento originale in un'area allo stato `esigita`, o una delle otto
dichiarazioni pubbliche allo stato `bloccante`**, la proposta è completa solo quando porta anche lo
specchio inglese aggiornato in modo coerente, nella stessa proposta. Non basta che l'inglese esista:
deve dire la stessa cosa dell'italiano appena modificato. Gli elementi che il controllo G8 della
pipeline verifica meccanicamente, descritto in
[`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §3, sono lo
stesso numero di sezioni di secondo livello (`##`) in entrambe le lingue e una data dell'ultima
modifica dell'originale non successiva a quella della traduzione, salvo la dichiarazione di
equivalenza descritta al § 3. Gli elementi che il controllo non vede e restano a carico di chi
traduce - integralità riga per riga, frontmatter con `title` e `description` tradotti e
`sidebar_position` intatto, glosse alla prima occorrenza per gli estremi normativi italiani,
identificativi mai tradotti - sono le regole vincolanti del runbook §3, che questa proposta deve
rispettare quanto le regole meccaniche. Una proposta che tocchi il frontmatter di un file inglese
senza rispettare la quotatura dei valori con due punti seguiti da spazio non supera la
costruzione del sito, per la ragione già nota da questo repository e ricordata in testa a
`CLAUDE.md`.

**Se la proposta tocca un documento originale in un'area allo stato `pianificata`**, non è tenuta a
portare la traduzione nella stessa proposta. Resta comunque incompleta nel senso proprio del
termine - un originale più recente della sua traduzione è un debito, non un errore - ma quel debito
è tollerato e misurato, non bloccante: il § 3 descrive come si tratta.

**Se la proposta introduce un documento nuovo** in un'area `esigita`, la mancanza dello specchio
inglese non è un ritardo tollerabile ma un'assenza che il controllo conta come «assente ed esigita»
- la stessa categoria con cui il controllo segnala un file mai tradotto. Una proposta che introduce
un capitolo nuovo in un'area `esigita` è completa solo se introduce entrambe le lingue insieme, o
se dichiara esplicitamente, nel proprio testo, l'apertura di un debito con la stessa forma del § 3.

**Verifica prima di dichiarare completa una proposta.** Chi la apre esegue in locale
`bash scripts/verifica-divergenza-traduzioni.sh` e legge l'esito. Un'uscita diversa da zero sul
documento toccato non si aggira riducendo lo stato della riga corrispondente in
`pipeline/differenziazione-traduzioni.tsv` per far passare la propria modifica: quel file dichiara
una decisione presa collettivamente, come ricorda il commento in coda allo stesso script, non un
interruttore per la singola proposta.

---

## 3. Che cosa si fa quando la traduzione ritarda

Il ritardo si presenta in due forme diverse, e la risposta corretta dipende da quale delle due sia
in gioco - confonderle produce o una traduzione mancata che il progetto crede fatta, o un lavoro di
ritraduzione speso dove non serviva.

**La modifica all'originale ha cambiato il contenuto.** In questo caso la traduzione va rifatta
sulla parte cambiata. Non esiste una scorciatoia: `scripts/verifica-divergenza-traduzioni.sh`
confronta la data dell'ultimo commit che ha toccato l'originale con quella dell'ultimo commit che ha
toccato la traduzione, e se l'originale è più recente segnala la divergenza. Su un'area `esigita` o
un documento `bloccante` questo fa fallire la costruzione; su un'area `pianificata` produce una riga
di segnalazione che compare a ogni esecuzione, finché qualcuno non ritraduce.

**La modifica all'originale è stata puramente redazionale** - un refuso corretto, un'elisione
sistemata, una frase resa più scorrevole senza toccare il significato - **e la traduzione esistente
resta corretta**. Forzare comunque una modifica al file tradotto insegnerebbe a farne di vuote, che
sono indistinguibili da una traduzione vera per chiunque legga la cronologia in seguito: è il modo
in cui il controllo imparerebbe a mentire dalla parte opposta a quella che presidia. La via corretta
è dichiarare l'equivalenza già verificata, scrivendo nel file tradotto il marcatore

```
<!--TRAD-VERIFICATA: <impronta-del-commit-dell-originale>-->
```

dove l'impronta è quella del commit dell'originale che si è letto per confrontarlo con la
traduzione esistente. Non è una scorciatoia burocratica: è la dichiarazione, tracciabile e
attribuibile a chi la scrive, di aver letto entrambi i testi e di averli trovati ancora equivalenti.
La dichiarazione **scade da sola** alla modifica successiva dell'originale - il controllo verifica
che l'impronta dichiarata sia antenata, o coincidente, della revisione più recente dell'originale, e
se l'originale è cambiato dopo la dichiarazione la segnala come «dichiarazione scaduta», con la
stessa forza di una divergenza mai dichiarata.

**Sul continuare un documento lungo interrotto a metà**, la regola operativa - marcatore
`<!--TRADn-CONT-->` in coda, confine obbligato a un titolo di secondo livello, dichiarazione
dell'ultima sezione tradotta e della prima non tradotta nel rapporto - è descritta per intero nel
[runbook](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/RUNBOOK-TRADUZIONE-EN.md)
§2 e non si ripete qui: è dettaglio operativo, non procedura.

**Quando un difetto si trova traducendo.** Tradurre un capitolo è la revisione più severa che
riceve, perché costringe a leggere ogni riga. Un difetto trovato in questo modo - un rinvio a un
paragrafo sbagliato, un'enumerazione che annuncia un numero e ne elenca un altro - non si corregge
silenziosamente solo sull'inglese: si segnala e si chiude su entrambe le lingue insieme, come già
argomentato per l'intero corpus e ricordato in cima a questo repository nella memoria del progetto.
Una correzione fatta su una sola lingua è una nuova divergenza appena introdotta, non una divergenza
chiusa.

---

## 4. Come si distingue un'area prerequisito da un'area a segnalazione

La distinzione non è nella testa di chi scrive, e da questo dipende che sia verificabile: vive in
[`pipeline/differenziazione-traduzioni.tsv`](https://github.com/fedcal/Telemedic/blob/main/pipeline/differenziazione-traduzioni.tsv),
un file di configurazione separato dal controllo che lo legge,
[`scripts/verifica-divergenza-traduzioni.sh`](https://github.com/fedcal/Telemedic/blob/main/scripts/verifica-divergenza-traduzioni.sh).
Il formato è dichiarato in
[`pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md`](https://github.com/fedcal/Telemedic/blob/main/pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md).
Questa separazione è essa stessa un requisito, non una scelta di implementazione: il criterio 3 di
`T-03` chiede testualmente che la differenziazione del controllo «sia versionata in un file di
configurazione, non cablata», precisamente perché fino al 26 agosto 2026 viveva in quattro variabili
dentro lo script, e modificarla significava modificare il controllo che doveva sorvegliarla.

**Due assi, non uno.** Per le tredici aree numerate di `docs/` (`adr` compreso), lo stato di una
riga di tipo `area` è `esigita` - un originale privo di traduzione fa fallire la costruzione - o
`pianificata` - l'assenza produce solo una riga di segnalazione. Per gli otto documenti bilingui
alla radice del repository, distinti a loro volta in tre avvertenze pubbliche nominate per nome dal
criterio 8 di `T-01` e cinque altre dichiarazioni obbligatorie di `D51`, lo stato di una riga di
tipo `avvertenza_pubblica` o `dichiarazione_pubblica_radice` è `bloccante` - un rilievo sul blocco
inglese di quel documento fa fallire la costruzione - o `segnalazione` - il rilievo si stampa e non
blocca, mai senza una data `bloccante_dal` dichiarata: una riduzione temporanea priva di scadenza
non è temporanea, è una rinuncia non dichiarata, con la stessa regola già in vigore per
`pipeline/collocazione-dei-controlli.tsv`.

**Un'area prerequisito**, nel linguaggio del criterio 6 di `T-06`, è dunque un'area o un documento
che porta lo stato nella sua forma forte - `esigita` o `bloccante` - qualunque sia la ragione
storica che l'ha portato lì: il criterio 1 di `T-06` ne nominava quattro per nome (le avvertenze
pubbliche, la guida dei fondamenti, l'`COMP`, l'area di sicurezza), ma la forma forte
non è riservata a quel sottoinsieme. **Un'area a segnalazione** è quella che porta lo stato
`pianificata` o `segnalazione`: il ritardo è misurato e pubblicato a ogni costruzione, secondo il
criterio 3 di `T-06`, ma non impedisce l'unione della proposta.

**Lo stato di oggi.** Dal 27 agosto 2026, tutte le tredici aree portano stato `esigita` e tutti gli
otto documenti bilingui alla radice portano stato `bloccante`. Non è un'estensione dichiarata a
voce: il file di configurazione registra la misura che l'ha determinata - dodici aree numerate su
dodici con lo stesso numero di file dell'italiano, trentadue schede di decisione architetturale su
trentadue, il conteggio delle parole in entrambe le lingue con nessun file inglese sotto la soglia
di completezza - e la transizione era già il criterio di completamento dichiarato per `T-09` («il
traguardo è chiuso quando nessuna area è più in sola segnalazione»). Il perimetro descritto oggi da
questa sezione è quindi più ampio del perimetro letterale del criterio 1 di `T-06`, ed è una misura
verificata, non un'anticipazione promessa: chi vuole verificarla di persona esegue
`scripts/verifica-divergenza-traduzioni.sh` sul repository corrente e legge il proprio esito, oppure
apre direttamente il file di configurazione e ne legge i commenti datati.

**Questo stato non è definitivo per costruzione.** Una nuova area aggiunta in futuro sotto `docs/`
nasce `pianificata`, non `esigita`, secondo la regola di
`pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md`: lo stato forte si assegna solo dopo che la
traduzione esiste davvero, non per intenzione dichiarata in anticipo. La promozione da uno stato
debole a uno forte richiede di eseguire il controllo sul repository reale **prima** di cambiare la
riga, per verificare che il passaggio non introduca un rilievo che oggi non c'è: promuovere una riga
che fallisce già trasforma silenziosamente un debito tollerato in un blocco della costruzione per
chiunque lavori dopo. Chi propone una promozione la motiva nella colonna `motivo` della riga con la
fonte della decisione, con lo stesso standard di tracciabilità richiesto altrove in questo
repository per ogni affermazione normativa.

---

## 5. Strumenti e documentazione correlata

Questa procedura si appoggia su documenti e strumenti distinti, ciascuno con un ruolo proprio, che
non si sostituiscono a vicenda:

| Strumento | Ruolo | Dove |
|---|---|---|
| Questo capitolo | La procedura: le regole in vigore, sotto controllo dei documenti | Il documento che si sta leggendo |
| Il runbook di traduzione | Il registro operativo interno: glossario, protocollo di continuazione, trappole già incontrate | [`.telemedic/context/RUNBOOK-TRADUZIONE-EN.md`](https://github.com/fedcal/Telemedic/blob/main/.telemedic/context/RUNBOOK-TRADUZIONE-EN.md) |
| Il file di differenziazione | La decisione versionata su quale area e quale documento è prerequisito e quale a segnalazione | [`pipeline/differenziazione-traduzioni.tsv`](https://github.com/fedcal/Telemedic/blob/main/pipeline/differenziazione-traduzioni.tsv) |
| Il formato del file di differenziazione | Il significato di ciascuna colonna e delle due categorie di stato | [`pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md`](https://github.com/fedcal/Telemedic/blob/main/pipeline/README-DIFFERENZIAZIONE-TRADUZIONI.md) |
| Il controllo di pipeline | L'esecuzione meccanica: divergenza per data, divergenza strutturale, pagine orfane, blocco inglese incompleto sui documenti alla radice | [`scripts/verifica-divergenza-traduzioni.sh`](https://github.com/fedcal/Telemedic/blob/main/scripts/verifica-divergenza-traduzioni.sh) |
| Il controllo G8 in pipeline | La collocazione di questo controllo fra i controlli obbligatori e il suo comportamento differenziato | [`09-integrazione-continua-e-rilascio.md`](./09-integrazione-continua-e-rilascio.md) §3 |
| Il controllo dei documenti | Categoria, revisore nominato e forma dell'approvazione per questo stesso capitolo | [`08_compliance/10-controllo-dei-documenti.md`](../08_compliance/10-controllo-dei-documenti.md) §4 |

Nessuno di questi documenti duplica un altro: il runbook non dichiara stati né soglie, il file di
differenziazione non spiega come si traduce riga per riga, e questo capitolo non ripete l'uno né
l'altro. Chi cerca «che cosa devo fare per tradurre bene» va al runbook; chi cerca «questa area
blocca la costruzione o no» va al file di differenziazione; chi cerca «qual è la regola e chi la
approva» resta qui.

---

**Torna a**: [`00-indice.md`](./00-indice.md).
