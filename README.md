<p align="center">
  <img src="./img/0-min.gif" alt="JustPet demo" width="720"/>
</p>

<h1 align="center">JustPet</h1>

<p align="center">
  <b>Rendi felice il tuo animale domestico!</b><br/>
  App mobile tutto-in-uno che mette in contatto proprietari di animali, veterinari e pet shop.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-%3E%3D2.18-0175C2?logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore-FFCA28?logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-3DDC84?logo=android&logoColor=white" alt="Platform"/>
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License"/>
</p>

---

## Indice

- [Panoramica](#panoramica)
- [Funzionalità per ruolo](#funzionalità-per-ruolo)
- [Screenshot](#screenshot)
- [Tech stack](#tech-stack)
- [Struttura del progetto](#struttura-del-progetto)
- [Come eseguire](#come-eseguire)
- [Documentazione](#documentazione)
- [Autori](#autori)
- [Licenza](#licenza)

## Panoramica

**JustPet** è un'app Flutter sviluppata per il corso di *Enterprise Mobile Application Development* (Università degli Studi di Salerno). L'idea è riunire in un'unica applicazione servizi che oggi richiedono app diverse:

- prenotare una visita dal veterinario (come SkipRes, ma solo per veterinari);
- acquistare prodotti dai pet shop (come JustEat);
- seguire videocorsi sull'addestramento degli animali (come Udemy);
- chattare con il proprio veterinario (come WhatsApp).

Gli acquisti nella piattaforma sono pensati in **PetCoin (PTC)**, una valuta interna all'app (vedi RAD e Lean Canvas in [`Documentation/`](./Documentation)).

## Funzionalità per ruolo

L'utente si registra o accede tramite Firebase Authentication; il menu laterale mostra funzioni diverse in base al tipo di account (`lib/global/models/mainFunction_class.dart`).

### 🐶 Cliente

| Funzione | Descrizione |
|---|---|
| **Le mie prenotazioni** | Elenco delle visite prenotate |
| **Scheda animali** | Aggiunta e consultazione dei propri animali, con scheda salute e visite |
| **Cerca veterinari** | Lista dei veterinari con scheda di dettaglio e prenotazione di un appuntamento in un orario disponibile |
| **Video corsi** | Consultazione e creazione di videocorsi sull'addestramento degli animali |
| **Acquista prodotti** | Pet shop con ricerca, schede prodotto, recensioni, carrello e pagamento |
| **Comunicazioni** | Chat con il veterinario (messaggi di testo, audio e video) |
| **Trova il tuo cane ideale** | Questionario che suggerisce le razze più adatte, con elenco delle razze preferite |
| **Trova medicine** | Selezione di una parte del corpo (cane o gatto) e suggerimento dei prodotti per quell'area |

### 🩺 Veterinario

| Funzione | Descrizione |
|---|---|
| **Comunicazioni** | Chat con i clienti |
| **Turni lavoro** | Calendario con turni/eventi e prenotazioni ricevute |
| **Dizionario** | Dizionario medico con l'elenco dei farmaci e le relative informazioni |

### 🛒 Venditore (PetShop)

| Funzione | Descrizione |
|---|---|
| **Acquista prodotti** | Accesso alla sezione pet shop |
| **Gestione prodotti** | Messa in vendita dei prodotti: prevista nel RAD e nei [mockup](./Documentation/Mockups/Venditore_%20Gestione%20prodotti.png), senza una schermata dedicata nel codice |

> Il RAD descrive anche funzionalità pianificate come videochiamate, invio documenti e wallet PetCoin: compaiono nei mockup, ma non tutte sono implementate nell'app.

## Screenshot

<table>
  <tr>
    <td><img src="./img/1.PNG" alt="Screenshot 1" width="400"/></td>
    <td><img src="./img/2.PNG" alt="Screenshot 2" width="400"/></td>
  </tr>
  <tr>
    <td><img src="./img/3.PNG" alt="Screenshot 3" width="400"/></td>
    <td><img src="./img/4.PNG" alt="Screenshot 4" width="400"/></td>
  </tr>
  <tr>
    <td><img src="./img/5.PNG" alt="Screenshot 5" width="400"/></td>
    <td><img src="./img/6.PNG" alt="Screenshot 6" width="400"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><img src="./img/7.PNG" alt="Screenshot 7" width="400"/></td>
  </tr>
</table>

### Mockup

<table>
  <tr>
    <td align="center"><img src="./Documentation/Mockups/Generale_%20Login%20and%20Signup.png" width="250"/><br/><sub>Login e registrazione</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Generale_%20Home.png" width="250"/><br/><sub>Home</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Generale_%20Chat.png" width="250"/><br/><sub>Chat</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="./Documentation/Mockups/Cliente_%20Prenotazione.png" width="250"/><br/><sub>Cliente: prenotazione</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Cliente_%20Scheda%20animale.png" width="250"/><br/><sub>Cliente: scheda animale</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Cliente_%20Acquisto%20prodotti.png" width="250"/><br/><sub>Cliente: acquisto prodotti</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="./Documentation/Mockups/Cliente_%20Video%20corsi.png" width="250"/><br/><sub>Cliente: video corsi</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Cliente_%20Bestiario.png" width="250"/><br/><sub>Cliente: enciclopedia delle razze</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Generale_%20Dizionario.png" width="250"/><br/><sub>Dizionario</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="./Documentation/Mockups/Generale_%20Wallet.png" width="250"/><br/><sub>Wallet</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Veterinario_%20Turni%20lavoro.png" width="250"/><br/><sub>Veterinario: turni lavoro</sub></td>
    <td align="center"><img src="./Documentation/Mockups/Venditore_%20Gestione%20prodotti.png" width="250"/><br/><sub>Venditore: gestione prodotti</sub></td>
  </tr>
</table>

## Tech stack

| Area | Tecnologie |
|---|---|
| Framework | Flutter, Dart SDK `>=2.18.2 <3.0.0` |
| Backend | Firebase Authentication (`firebase_auth`), Cloud Firestore (`cloud_firestore`) |
| Navigazione e stato | Named routes di `MaterialApp`, `provider`, `flutter_bloc`, `scoped_model` |
| UI | `carousel_slider`, `flutter_staggered_grid_view`, `glassmorphism`, `lottie`, `flutter_slidable`, `snapping_sheet`, `flutter_rating_bar`, `badges` |
| Calendario e notifiche | `table_calendar`, `flutter_calendar_week`, calendario eventi personalizzato in `lib/veterinarian/components/`, `awesome_notifications` (canale "Prenotazioni") |
| Media | `camera`, `image_picker`, `video_player`, `cached_network_image` |
| Questionari | `survey_kit` |

Collezioni Firestore usate nel codice: `Cliente`, `Veterinario`, `Animali`, `Eventi`, `Razze`.

## Struttura del progetto

```
JustPet/
├── lib/
│   ├── main.dart           # Inizializzazione Firebase, notifiche e route
│   ├── customer/           # Funzionalità del cliente (screens, components, models)
│   ├── veterinarian/       # Funzionalità del veterinario (calendario, dizionario, prenotazioni)
│   ├── global/             # Login/registrazione, chat, menu laterale, modelli comuni
│   ├── theme/              # Colori
│   └── utils/              # Costanti, picker, dati di esempio
├── assets/                 # Immagini, razze canine, farmaci, font, logo
├── Documentation/          # RAD, presentazione, Lean Canvas, mockup
├── img/                    # Immagini usate in questo README
└── pubspec.yaml
```

## Come eseguire

**Prerequisiti:** Flutter SDK con Dart 2.18.x o successivo ma inferiore a 3.0 (vincolo in `pubspec.yaml`), Android SDK (minSdk 21) oppure Xcode per iOS.

1. Clona il repository:
   ```bash
   git clone https://github.com/Antonio-Zizzari/JustPet.git
   cd JustPet
   ```
2. Configura Firebase. Il file `android/app/google-services.json` è escluso dal repository (`.gitignore`), quindi serve un progetto Firebase proprio:
   - crea un progetto su [Firebase Console](https://console.firebase.google.com/) e abilita **Authentication** (email/password) e **Cloud Firestore**;
   - registra l'app Android e copia `google-services.json` in `android/app/`;
   - per iOS aggiungi `GoogleService-Info.plist` in `ios/Runner/`.
3. Installa le dipendenze e avvia l'app:
   ```bash
   flutter pub get
   flutter run
   ```

> Il database Firestore parte vuoto: per vedere dati nell'app vanno create le collezioni elencate nel [Tech stack](#tech-stack).

## Documentazione

| Documento | Contenuto |
|---|---|
| [RAD JustPet](./Documentation/RAD%20JustPet.pdf) | Requirement Analysis Document: requisiti, scenari, casi d'uso, class diagram, mockup |
| [Presentation](./Documentation/Presentation.pdf) | Presentazione del progetto |
| [Lean Canvas](./Documentation/Canvas_JustPet.pdf) | Modello di business |
| [Mockups](./Documentation/Mockups) | Mockup delle schermate per ruolo |

## Autori

Progetto del corso *Enterprise Mobile Application Development* (docenti: Rita Francese, Angelo Matarazzo), Università degli Studi di Salerno.

- **Antonio Zizzari** ([@Antonio-Zizzari](https://github.com/Antonio-Zizzari))
- **Andrea Tranquillo**
- **Simone Giglio**

## Licenza

Distribuito con licenza **MIT**. Vedi [LICENSE](./LICENSE).
