# `P9` - I rinvii, e la regola che resta in vigore per ciascuno

Artefatto preparatorio del criterio 5 di `T-04`. È l'unica parte del traguardo **interamente
eseguibile prima del cancello**, e il piano prescrive per questo di chiuderla per prima: una
verifica rinviata che non venga registrata scivola per sempre, perché nessuno ha un innesco per
riprenderla.

## Che cosa registra questo documento, e che cosa no

Registra, per ciascuna verifica rinviata, **due cose insieme**: il rinvio - che cosa si è deciso di
non verificare adesso e a che cosa quella verifica segue - e **il divieto che sopravvive al rinvio**.
La seconda è la parte che conta. Rinviare una verifica senza fissare che cosa non si può dire nel
frattempo non è un rinvio: è una dimenticanza con una data sopra. Il progetto continuerebbe a
descrivere in pubblico un meccanismo che nessuno ha provato, e la rettifica successiva costerebbe più
del silenzio.

**Non registra** l'esito di quelle verifiche, che per definizione non c'è. Non le riprogramma, e non
ne stima il costo: la loro data è quella dell'attività che le precede, e cambiare quella data non è
lavoro di `T-04`.

## Una discrepanza dichiarata, non risolta

Il piano di esecuzione si contraddice sul numero. Il §3 elenca l'artefatto `P9` come *«testo dei
**cinque** rinvii del criterio 5»*, mentre il §5, dove il criterio 5 è esposto per esteso, è
intitolato *«I **tre** rinvii»* e la sua tabella ne porta **tre**. La fonte del traguardo -
`docs/09_roadmap/02-traguardi.md` - è l'arbitro, e finché la discrepanza non è chiusa **questo
documento adotta la lettura più stretta**: ne registra tre, che sono quelli scritti per esteso e
verificabili, e dichiara qui che due potrebbero mancare invece di inventarli. `[NV]` - il numero
esatto dei rinvii del criterio 5 va confermato da `ROAD` sulla fonte del traguardo; se sono cinque,
i due mancanti vanno scritti qui prima che il criterio possa dirsi soddisfatto.

Inventarne due per far tornare il conto sarebbe l'errore peggiore possibile in questo documento:
produrrebbe **due divieti che nessuno ha deliberato** e che il controllo di assenza farebbe poi
rispettare al corpus.

---

## Rinvio 1 - Inoltro del contesto di autenticazione attraverso l'intermediazione

**Che cosa si rinvia.** La verifica che il contesto di autenticazione dell'utente finale attraversi
l'intermediazione conservando ciò che deve conservare. Le questioni che la portano sono `Q-160` e la
voce `B-8`.

**A che cosa segue.** Alla conformità sull'identità digitale nazionale, che sta **fuori dal perimetro
ridotto**. Verificare l'inoltro prima di sapere quale contesto va inoltrato produrrebbe una prova su
un'ipotesi.

**La regola che resta in vigore.** **Nessuna documentazione pubblica descrive il meccanismo finché
l'esito non è registrato.** Non «lo descrive con cautela», non «lo descrive marcandolo `[NV]`»: non
lo descrive. È la risposta al rischio `R-15`, il cui impatto è **reputazionale** e il cui costo è una
**rettifica pubblica su un meccanismo di sicurezza** - la specie di rettifica che chi valuta un
progetto sanitario ricorda più a lungo del meccanismo stesso.

**Come si dimostra il rispetto del divieto.** Con un controllo di **assenza** sul corpus pubblicato.
È l'unico modo in cui un divieto si dimostra: non esiste una prova positiva del fatto che qualcosa
non sia stato scritto.

---

## Rinvio 2 - Contenitore del materiale registrato negoziato a runtime

**Che cosa si rinvia.** La verifica del contenitore in cui il materiale registrato viene riposto
quando il formato è negoziato durante la sessione invece che fissato prima. La questione che la porta
è `C-3`.

**A che cosa segue.** Alla registrazione della sessione, che è **tagliata dal primo rilascio
utilizzabile**. Non c'è materiale registrato di cui verificare il contenitore finché non c'è
registrazione.

**La regola che resta in vigore.** **Nessun materiale dichiara un formato unico di contenitore.** Il
divieto è più stretto di quanto sembri e la sua ragione è precisa: dichiarare un formato unico
significherebbe promettere a chi integra che potrà scriverne il lettore una volta sola, e quella
promessa non è verificata. Vale per la documentazione pubblica, per le interfacce dichiarate e per il
materiale regolatorio.

---

## Rinvio 3 - Comportamento del broker in assetto a nodo singolo

**Che cosa si rinvia.** La verifica di come il broker si comporti quando l'assetto è a nodo singolo,
cioè quando le garanzie che esso offre in assetto distribuito non hanno ridondanza dietro di sé.

**A che cosa segue.** Al broker, che è **tagliato** dal perimetro. Verificare il comportamento di un
componente che il perimetro non contiene sarebbe lavoro speso su un'ipotesi di architettura.

**La regola che resta in vigore.** **Nessun requisito funzionale dipende da garanzie del broker non
verificate.** È il divieto più insidioso dei tre, perché si viola per omissione: basta che un
requisito dia per scontata una consegna esattamente-una-volta, o un ordinamento, o una persistenza
del messaggio, e la dipendenza esiste senza che nessuno l'abbia scritta. Chi scrive un requisito
funzionale deve poter rispondere alla domanda «questo regge se il messaggio si perde?», e se la
risposta è no il requisito dipende da una garanzia non verificata.

---

## Come il criterio 5 si dimostra, in forma binaria

Due condizioni, entrambe necessarie.

**La prima**: i testi sono **versionati**. Questo documento le soddisfa nel momento in cui entra nel
repository.

**La seconda**: una verifica testuale sul corpus pubblicato **non trova** alcuna descrizione del
meccanismo di inoltro del contesto di autenticazione, alcuna dichiarazione di formato unico di
contenitore, alcun requisito funzionale che dipenda da garanzie del broker.

La seconda è presidiata da [`scripts/verifica-rinvii-di-t04.sh`](../scripts/verifica-rinvii-di-t04.sh),
e va detto subito che cosa quel controllo **non** può fare, perché la differenza è grande. Un
controllo testuale riconosce una **forma**, non un senso: intercetta la frase che descrive il
meccanismo, non il capoverso che lo lascia intendere; intercetta la dichiarazione di un formato unico
scritta come tale, non la tabella che ne elenca uno solo. **Il terzo divieto è il meno presidiabile
dei tre**, perché una dipendenza da garanzie del broker si esprime nel significato di un requisito e
non nelle sue parole.

Quel controllo è quindi un **presidio parziale, e lo dichiara a ogni esecuzione** invece di lasciar
credere che il criterio sia interamente sorvegliato. La parte che nessuno script può coprire resta a
chi rivede: è una lacuna dichiarata, non una copertura.
