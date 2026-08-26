# Sito di documentazione

Costruito con Docusaurus, in italiano e in inglese, pubblicato su GitHub Pages
a ogni modifica del ramo principale.

```bash
npm ci
npm start          # anteprima in italiano
npm run start:en   # anteprima in inglese
npm run build      # costruzione completa di entrambe le lingue
```

## Vincoli da non violare

**Non aggiungere `"type": "module"` a `package.json`.** I file generati da Docusaurus
verrebbero trattati come moduli ECMAScript, e l'API di webpack usata per il caricamento
differito non esiste in quel contesto. L'errore che ne risulta
(`require.resolveWeak is not a function`) non indica in alcun modo la causa reale, e costa
diverse ore. La configurazione è in `.mjs` proprio per non aver bisogno di quel campo.

**Nel frontmatter YAML dei documenti, i valori che contengono due punti seguiti da spazio
vanno racchiusi fra virgolette doppie.** Altrimenti la costruzione fallisce con un errore di
indentazione che non ha nulla a che vedere con l'indentazione.

**I rinvii ai file alla radice del repository devono essere URL assoluti verso GitHub.** Un
percorso relativo che esce da `docs/` funziona su GitHub ma non sul sito.

**Gli URL non contengono i prefissi numerici.** Docusaurus li rimuove: `docs/06_security/00-indice.md`
diventa `/docs/security/indice`. I collegamenti scritti nella configurazione del sito - barra di
navigazione, piè di pagina, pagina iniziale - devono usare la forma senza prefissi. I collegamenti
*dentro* i documenti restano relativi al file, e Docusaurus li risolve da sé.

## Anomalia nota nelle dipendenze

`image-size` è segnalato per due difetti che consentono un ciclo infinito su immagini
malformate, e al momento **non esiste una versione corretta a monte**. È una dipendenza usata
soltanto durante la costruzione, per leggere le dimensioni delle immagini incluse nei
documenti; non finisce nel sito pubblicato e non è raggiungibile da chi lo consulta.

L'esposizione reale è quindi limitata a chi costruisce il sito a partire da un'immagine
appositamente confezionata. Resta annotata qui, e non chiusa con una giustificazione, finché
non sarà disponibile una versione corretta: una dipendenza vulnerabile di cui si è deciso di
non fare nulla va comunque scritta da qualche parte, altrimenti la decisione si perde e
nessuno la rivede.
