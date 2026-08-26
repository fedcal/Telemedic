# `D63` - sequenza di recepimento del ruolo di fabbricante

Redatto il 26 agosto 2026, il giorno stesso della decisione. Consegna la lettera (b) di `Q-200`.

## 1. Il fatto che riorienta il mandato, e va detto per primo

**La premessa di `Q-200` non regge più.** Verificato sul testo il 26 agosto 2026:

| Oggetto | Stato reale | Riga |
|---|---|---|
| `V-06` | Porta già l'intestazione **«EMENDATO DA `D58`»** con le quattro lettere non attenuabili | `.telemedic/context/05_BACHECA_INTERAGENTI.md:53` |
| `V-180` | Già **riformulato da `V-280`** | `docs/09_roadmap/00-indice.md:88` e `:752` |
| `V-280` | Enunciato per esteso, con il limite invalicabile | `05_BACHECA_INTERAGENTI.md:144` |
| `NOT-A-MEDICAL-DEVICE.md`, `DISTRIBUTION-POLICY.md`, `README.md` | **Già riscritti su `D58`**: verbo «intende», soggetto assente nella stessa frase, stato di fatto in prima posizione, nessuna data | `NOT-A-MEDICAL-DEVICE.md:11-21`; `DISTRIBUTION-POLICY.md:29,35,73`; `README.md:21-26` |
| `publiccode.yml` | Già allineato in entrambe le lingue; voci `conforme:` non dichiarate | `publiccode.yml:63-69,107-113,170` |

Due conseguenze.

**(a)** La lettera (a) di `Q-200` è sostanzialmente soddisfatta. Il lavoro residuo non è riformulare
i due vincoli: è **recepirli nelle aree**.

**(b) Il rapporto fra i due fronti si è invertito, ed è l'informazione che vale di più.** `Q-200`
descriveva le avvertenze pubbliche e i vincoli come il fronte arretrato e le aree come quello
avanzato. Oggi è il contrario: avvertenze pubbliche, panoramica, conformità e roadmap portano
l'attribuzione nuova; `03_functional`, `07_integration`, `04_protocols`, `06_security`,
`01_technical` e la guida dei fondamenti portano ancora quella superata. **Le due attribuzioni
coesistono già, nella direzione peggiore**: il documento più visibile è aggiornato, quello che un
valutatore apre per verificarlo non lo è. Non è una previsione, è lo stato accertato del
repository.

## 2. Che cosa `D63` aggiunge, e che cosa non aggiunge

`D63` non cambia il destinatario, l'aveva già fatto `D58`: cambia **lo stato dell'obiettivo**. La
marcatura passa da percorso che il progetto intende intraprendere a **requisito di prodotto**. Le
attività irrecuperabili di `D45` passano da «nostre» a «nostre e sul percorso critico di un
requisito». **Lo stato di fatto del prodotto è identico**, e la dichiarabilità di una data è
**vietata negli stessi termini**.

Il punto su cui si sbaglierà: un obiettivo di prodotto assomiglia a una promessa e non lo è.
L'art. 7 dell'MDR vieta le dichiarazioni fuorvianti **anche in assenza di marcatura**. Una
decisione interna non è un fatto pubblico; una data pubblicata lo è. E i due calendari - `RU-1` al
30 novembre 2026, ingegneristico e non utilizzabile su pazienti, e il percorso di conformità in
`08_compliance/09` - **non vanno mai accostati**: la lettura fuorviante si produrrebbe senza che
nessuna delle due righe sia falsa.

## 3. La sequenza

**Il criterio che determina i gruppi, prima dei gruppi.** Un gruppo è la **chiusura di citazione
sull'attribuzione**: un documento entra nello stesso gruppo di ogni documento che cita per
l'attribuzione e di ogni documento che lo cita. Tre regole: un documento resta indietro solo se non
nomina l'attribuzione; ogni gruppo si chiude **su entrambe le lingue nello stesso atto**; dentro un
passo l'ordine è libero, fra i passi no.

**Passo 0 - il registro.** Strato `D63` in `V-06` e `V-280`, testo esatto al §5. Per primo perché
ogni area cita `V-06` come vincolo recepito: se un'area si riscrive prima, il testo dell'area
diventa la fonte più aggiornata del vincolo che dichiara di recepire. Titolari: committente e
`ROAD`.

**Passo 1 - conformità.** `08_compliance/01` §2, `08_compliance/05` per intero, `08_compliance/09`
§§4, 5, 6, 7.2, con i gemelli inglesi, **in un atto solo**. `01` istituisce `V-171` al §11 e **lo
contraddice al §2**, dentro lo stesso file. `05` va con lui perché `00-indice.md` §1.1 dichiara che
«chi certifica» non è più usata, e finché `05` ha quella colonna **l'indice dell'area dice il falso
su sé stesso**. `09` perché i suoi residui sono già in `Q-271`. La tabella di ripartizione di `05`
**non si cancella**: cambia intestazione di colonna, da «Chi certifica» a «Il fabbricante»
(`V-270`).

**Passo 2 - requisiti e integrazione.** `03_functional/00-indice` avvertenza,
`03_functional/07-fuori-perimetro` voce `OUT-20`, `07_integration/00-indice` §6.1,
`07_integration/09` §§1.2 e 2.4, in un atto solo. Portano **la stessa frase in quattro punti**:
riscriverne tre e lasciarne una fa dedurre che la differenza sia voluta. Sostanza: `OUT-20` afferma
quattro cose e **tre sono ora false** - costituire un soggetto, ingaggiare organismi, condurre la
valutazione clinica sono `T-14` e `Q-176`. Va **ristretta, non abrogata**, e la sua categoria
`RESP` è «riapribile solo con decisione del committente»: **`D63` è quella decisione**, e il
capitolo prevede da sé la propria riapertura. Va riscritta anche la colonna «Verifica».

**Passo 3 - sicurezza, protocolli, tecnica.** `06_security/00-indice:170`, `06_security/10:125`,
`04_protocols/10:38` e `:175-176`, `01_technical/09:368`. Tre su cinque sono meccaniche. **La
quarta no**: `06_security/10` §2.4 dice che il soggetto obbligato alla vigilanza «non è il
progetto». Diventa: non il progetto **oggi**; il **soggetto fabbricante, da costituire**, per la
nostra distribuzione; chi immette sul mercato per ogni derivata. Si salda con `Q-276` - **la
riscrittura rende nostro un obbligo la cui capacità abilitante non è progettata**, e dirlo è parte
della riscrittura. In `04_protocols/10:38` **il divieto non si tocca**: cambia solo la motivazione
accanto.

**Passo 4 - guida dei fondamenti.** `15-regolatorio-da-zero` con otto occorrenze,
`12-crittografia-e-sicurezza` con cinque, `18-contribuire-per-area` con due.
**`19-glossario.md` non si tocca**: porta già la sostituzione canonica alla riga 1287 ed è il
riferimento con cui si eseguono i passi precedenti. Per ultimo per `D59` e `V-194`. **È il passo più
oneroso e il costo è facile da sottostimare**: `15` non ha otto frasi da sostituire, ha **due
sezioni intere** costruite sulla premessa «Questa sezione descrive il percorso di chi certifica. Il
progetto non lo percorre», alle righe 746 e 1785. Sotto `D63` il progetto lo percorre: quelle
sezioni **cambiano funzione**, non si emendano.

**Passo 5 - panoramica.** `00_overview/00-indice` §3.5, `01-visione-e-obiettivi` §5.1,
`04-stato-e-limiti:116` e `:461`. Le due «note di allineamento» **dichiarano una divergenza**: per
le avvertenze pubbliche è **già falsa oggi**, per la conformità sarà falsa a fine passo 1. **Si
rimuovono, non si aggiornano**, e solo a passi 1-4 chiusi.

## 4. Le avvertenze pubbliche: in questa sequenza, mai

`NOT-A-MEDICAL-DEVICE.md` e `DISTRIBUTION-POLICY.md` sono già riscritte su `D58` e superano le
quattro regole di forma. `D63` **cambia l'obiettivo, e un'avvertenza pubblica dichiara lo stato di
fatto**, che è invariato. Toccarle ora le renderebbe **più affermative della fonte che
sintetizzano** (`V-203`), con guadagno nullo per chi decide se installare.

Tre inneschi al ricorrere dei quali si toccano, e **nessuno ricorre oggi**:

1. **costituzione del soggetto avvenuta** - la frase «il soggetto non è ancora costituito» diventa
   falsa; è il criterio 1 di `T-14`, e la modifica va nello stesso atto;
2. **pubblicazione del perimetro di `RU-1`**, in un atto solo con `Q-281`, `Q-185`, `Q-174`;
3. **dal 12 settembre 2026** il controllo sulle avvertenze diventa bloccante
   (`AVVERTENZE_BLOCCANTI_DAL` in `scripts/verifica-divergenza-traduzioni.sh`): sono bilingui in un
   file solo, e una riscrittura dell'italiano che dimentichi il blocco inglese non produce un file
   mancante ma **due testi divergenti**.

Al passo 5 va **dichiarato che non sono cambiate perché non dovevano cambiare**, altrimenti
l'immobilità si legge come dimenticanza.

## 5. Le riformulazioni, testo esatto

### `V-06`

Si sostituiscono **solo intestazione e primo periodo**; le lettere (a)-(d) restano parola per
parola, ed è deliberato: sono la parte che una riscrittura tende ad attenuare.

> `V-06` | ORCH | tutte | **EMENDATO DA `D58`, ATTUATO DA `D63`.** Il ruolo di fabbricante **sarà
> assunto dal progetto**; il soggetto giuridico è **ancora da costituire**. Con `D63` il committente
> ha deciso che il sistema **deve essere adatto all'erogazione di prestazioni su pazienti reali**:
> la marcatura CE al termine di una valutazione della conformità conclusa non è più soltanto un
> percorso che il progetto intende intraprendere, è un **requisito di prodotto**. `D63` **non
> modifica di una riga** né lo stato di fatto né il divieto di dichiarare date: cambia lo stato
> dell'obiettivo, non ciò che è vero oggi e non ciò che è dicibile. La formula ammessa è una sola e
> si scrive per intero, perché ogni abbreviazione cade sul lato dell'intenzione e perde lo stato di
> fatto: *«il progetto intende assumere il ruolo di fabbricante; il soggetto è da costituire; oggi
> il prodotto non reca marcatura; nessuna data è dichiarata»*. Il materiale regolatorio è prodotto
> **per il nostro percorso**, non più «per chi certifica»: quella formula è vietata in ogni
> documento. **Restano invariati e non attenuabili**: (a) oggi il prodotto **non reca marcatura
> CE**, non è coperto da alcuna dichiarazione di conformità e **non è utilizzabile per l'erogazione
> di prestazioni sanitarie su pazienti reali** - stato di fatto, non posizione; (b) chi installa,
> integra o mette in servizio **assume comunque** gli obblighi che ne derivano, e l'intenzione di
> certificare **non gli trasferisce nulla**; chi immette sul mercato sotto il proprio nome **è
> fabbricante per legge** a prescindere dalla licenza; (c) gli atti che la norma riserva al ruolo di
> fabbricante restano riservati **anche quando il ruolo sarà nostro**, e la distinzione non va
> cancellata: è ciò che rende leggibile perché non si possono anticipare; (d) il divieto di `V-171`
> è intero - **nessuna data, nessuna finestra, nessun «entro»** - e `D63` **non lo attenua**: la
> decisione autorizza a perseguire la marcatura, non a dichiarare quando sarà apposta. | VINCOLO

L'aggiunta in (a) - «e non è utilizzabile su pazienti reali» - non è sostanza nuova: è `D16`, già in
`NOT-A-MEDICAL-DEVICE.md` e in `09_roadmap/00-indice` §3.1. È aggiunta **lì** perché `D63` rende
quella frase l'oggetto stesso della decisione, e il registro dei vincoli è il luogo dove è più
probabile che una riscrittura la lasci fuori.

### `V-180`

Già riformulato da `V-280`; si aggiunge il solo strato di `D63` alla riga di rinvio in
`docs/09_roadmap/00-indice.md:752`:

> `V-180` | tutte | **Riformulato da `V-280`; strato di `D63` sotto.** Nella forma originaria vietava
> di dichiarare date per traguardi non del progetto; con `D57` e `D58` la pianificazione è interna e
> il divieto si restringe alle date che la norma pone in capo a un soggetto diverso. `D63` rende la
> marcatura un **requisito di prodotto** e **non riapre nulla di ciò che il vincolo vieta**: le due
> date che restano di un altro soggetto restano tali, e il limite invalicabile di `V-280` - una data
> di pianificazione interna non è una promessa di esito - vale **con più forza**, non con meno, ora
> che l'obiettivo è deciso.

### `V-280`

Periodo da aggiungere in coda, in `05_BACHECA_INTERAGENTI.md:144`:

> **Strato di `D63`.** Il committente ha deciso il 26 agosto 2026 che il sistema deve essere adatto
> all'erogazione di prestazioni su pazienti reali. La decisione **rafforza questo vincolo invece di
> allentarlo**: quanto più l'obiettivo è deciso, tanto più una data di pianificazione interna
> assomiglia a una promessa di esito agli occhi di chi legge, e tanto più il divieto di scrivere che
> il prodotto sarà marcato entro una data è la sola cosa che tiene separate le due letture. Restano
> invariati e vanno dichiarati con la stessa evidenza: **oggi il prodotto non reca marcatura CE**,
> non è coperto da alcuna dichiarazione di conformità, **non è utilizzabile su pazienti reali**, e
> chi installa, integra o mette in servizio assume comunque gli obblighi che ne derivano. `RU-1` del
> 30 novembre 2026 è un traguardo ingegneristico e **resta non utilizzabile su pazienti**: è su un
> calendario diverso da quello del percorso di conformità, e accostare i due produrrebbe la
> dichiarazione fuorviante che l'art. 7 del Regolamento (UE) 2017/745 vieta.

## 6. Censimento

Rilevato con `grep -rn -i` su `docs/`: **32 occorrenze in 16 file**.

**Legittime, da non toccare** - l'espressione è dentro l'enunciato del divieto o nella tabella
«prima/ora»: `08_compliance/00-indice` con cinque, `09_roadmap/00-indice`, `01-principi-e-metodo`
con due, `02-traguardi`, `05-rischi-e-dipendenze` con due, `10_fondamenti/19-glossario:1287`.

**Residui**, elencati per passo al §3 con la riga esatta: `08_compliance/01:113-119`,
`08_compliance/05:32-33` e `:38`, `08_compliance/09:342` e §§4, 5, 7.2,
`03_functional/00-indice:104-107`, `03_functional/07-fuori-perimetro:95`,
`07_integration/00-indice:186-190`, `07_integration/09:44-46,133,142`, `06_security/00-indice:170`,
`06_security/10:125`, `04_protocols/10:38,175-176`, `01_technical/09:368`,
`10_fondamenti/15:273,421,539,674,730,746,1785,1933-1934`,
`10_fondamenti/12:2141,2147,2294,2382,2418`, `10_fondamenti/18:1013,1080-1081`,
`00_overview/00-indice:135-139`, `00_overview/01-visione:257-261`, `00_overview/04-stato:116,461`.

**Falsi positivi verificati e scartati**: `05_domain/03:54` (anagrafica), `02_architecture/03:381`
(terminologie).

## 7. Difetti propri incontrati, non corretti

1. **`docs/10_fondamenti/18-contribuire-per-area.md:184` cita `V-06` per l'accessibilità**: «il
   vincolo trasversale `V-06` rende ogni schermata non accessibile una schermata non completa».
   `V-06` riguarda la marcatura CE. **Il numero corretto non è stato dedotto e non viene
   indovinato**: dedurlo violerebbe la regola che vieta di inventare un riferimento.
2. **`docs/09_roadmap/00-indice.md:76`** enuncia lo stato di fatto **senza qualificazione
   temporale**: «Nessun artefatto distribuito è utilizzabile per l'erogazione di prestazioni
   sanitarie su pazienti reali». Letta come permanente, sotto `D63` **contraddice l'obiettivo
   deciso**. La correzione è un qualificatore di tempo - «oggi», «finché non esiste una marcatura» -
   che **non attenua l'avvertenza e non introduce alcuna data**.
3. **`Q-270` ha omesso il capitolo `05`.** La ricerca testuale che aveva concluso «non compare più
   in alcun capitolo dell'area» era **sensibile alle maiuscole**, e l'intestazione di colonna è
   capitalizzata. `05-gestione-del-rischio.md` non ha nemmeno l'avvertenza di apertura che `03`,
   `04`, `06`, `07`, `08` hanno ricevuto.
4. **Conflitto su una fonte normativa.** `docs/` cita la Direttiva (UE) 2024/2853 art. 15 con numero
   e articolo in almeno tre luoghi - `08_compliance/00-indice` §1.1 punto 5, `08_compliance/01` §6,
   `07_integration/09` §1.3 - mentre `Q-291` la marca **`[NV]`** su numero, data e termine di
   recepimento. **Una delle due è sbagliata**, e si chiude sulla fonte primaria, non fra documenti
   interni. Finché non è chiuso, la sequenza non deve propagarla in nuovi luoghi.

## 8. Che cosa resta, e a chi

| # | Resta | Titolare | Innesco |
|---|---|---|---|
| 1 | Strato `D63` in `V-06` e `V-280` | **Committente** | Prima di tutto |
| 2 | Riga di rinvio `V-180` | `ROAD` | Con il punto 1 |
| 3 | Passo 1 (`01` §2, `05`, `09`) | `COMP` | **`05` non è mai stato assegnato** |
| 4 | Passo 2 | `FUNZ` e `INTEG`, **atto unico** | Richiede coordinamento fra due aree |
| 5 | Passo 3 | `SEC`, `PROTO`, `TECH` | La parte `SEC` si salda con `Q-276` |
| 6 | Passo 4 | `GUIDA` | Il più oneroso: due sezioni da riscrivere |
| 7 | Passo 5 | `PROD` | Solo a 1-4 chiusi |
| 8 | `V-06` citato a sproposito in `18:184` | `GUIDA` | Numero da **determinare**, non dedurre |
| 9 | Qualificatore temporale in `09_roadmap/00-indice:76` | `ROAD` | Indipendente e urgente |
| 10 | Conflitto sulla Direttiva 2024/2853 | **Committente**, su fonte primaria | Prima che entri altrove |
| 11 | Avvertenze pubbliche | `AVV` | **Nulla ora**; tre inneschi al §4 |
| 12 | Costituzione del soggetto e nomina | **Committente** (`Q-280`, `Q-272`, `T-14`) | 19 settembre 2026. Nessuna riscrittura la sostituisce |

Verifica comune ai passi 1-5: `bash scripts/verifica-divergenza-traduzioni.sh` a zero. Verificato
per elenco che **tutti** i file toccati hanno già il gemello inglese: una modifica al solo italiano
produce comunque divergenza segnalata, e per `08_compliance`, `06_security` e `10_fondamenti`
fallisce lo stesso giorno.

## 9. Le tensioni, dichiarate e non risolte

**Prima.** La sequenza attraversa sette aree, ciascun passo è **indivisibile** - il criterio di
`Q-200` è che una riscrittura parziale è peggio di un'attribuzione superata - e la capacità è di
dieci-venti ore settimanali (`D62`). La tensione fra indivisibilità e capacità **non si scioglie
riformulando meglio**: si scioglie decidendo se questa sequenza precede o segue i traguardi già a
calendario. Non è una decisione di quest'area.

**Seconda.** `D63` rende un requisito ciò che `V-171` vieta di datare, e i due convivono solo se
nessuno abbrevia. `Q-289` ha accertato che le formule vietate sono **una regola scritta senza alcun
controllo**: nessuno script fallisce se un documento scrive che il prodotto sarà marcato entro una
data. **`D63` aumenta la superficie esposta e il presidio resta soltanto umano.** Questa sequenza si
esegue senza rete finché il criterio 5 di `T-14` non produce quel controllo.

**Terza.** `OUT-20` è **oggi falsa in tre clausole su quattro, ed è pubblicata**.
`07-fuori-perimetro.md` è il capitolo che un valutatore apre per sapere di che cosa il progetto non
risponde. Il periodo di esposizione non si annulla (`Q-185`).

**Quarta.** `RU-1` diventa **più difficile da spiegare, non più facile**: prima di `D63` era il
traguardo di un progetto che pubblicava materiale regolatorio; ora è il primo rilascio di un
prodotto che **deve** diventare adatto ai pazienti reali, e resta non utilizzabile su pazienti.
`D63` allarga la distanza che `Q-281` chiede di dichiarare, e `Q-281` ha punto di decisione al 31
ottobre 2026 e non è decisa.

**Quinta.** `Q-291` e i documenti pubblicati si contraddicono su una fonte normativa, punto 7.4.

**Sesta, e la più pesante.** Una decisione di prodotto non produce da sé la capacità di sostenerla.
`Q-273` - formative non producibili da una persona sola, «non è un problema di ore»; `V-281` e
`Q-189` - audit interno, riesame del rilascio, verifica di configurazione indipendente non
producibili internamente; `Q-276` - due capacità di vigilanza retroattivamente irrecuperabili e non
progettate. **`D63` non scioglie nessuno dei tre nodi: li rende vincolanti.** Ciò che era una lacuna
dichiarata su un'intenzione è ora una lacuna dichiarata su un **requisito di prodotto**, e il
registro delle lacune datate (`Q-282`) diventa il documento che sostiene il peso maggiore del
fascicolo. La forma di quella dichiarazione non è ancora decisa.
