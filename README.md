# Open Inno Project 

# Guide d'installation de Flutter pour Flutter_open_inno

Ce guide vous aidera à installer Flutter sur votre système afin que vous puissiez cloner et exécuter le projet Flutter_open_inno.

## Prérequis

Avant de commencer l'installation de Flutter, assurez-vous que votre système répond aux exigences suivantes :

- Système d'exploitation : Windows (7 ou version ultérieure), macOS (10.12 ou version ultérieure) ou Linux
- Espace disque : 600 Mo d'espace disque disponible
- Outils : Git

## Installation de Flutter

1. **Téléchargez Flutter** : 
   - Rendez-vous sur le site officiel de Flutter : [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
   - Choisissez votre système d'exploitation et téléchargez le SDK Flutter.
   - Extrayez le contenu du fichier zip téléchargé dans un répertoire de votre choix sur votre système.

2. **Ajoutez Flutter au chemin d'accès** :
   - Ouvrez votre terminal et exécutez la commande suivante pour ouvrir votre fichier de profil :
     ```
     nano ~/.bash_profile
     ```
     (Si vous utilisez un autre shell, comme zsh, ouvrez le fichier de profil correspondant.)
   - Ajoutez le chemin du répertoire `flutter/bin` à votre variable d'environnement `PATH`. Par exemple :
     ```
     export PATH="$PATH:/chemin/vers/votre/répertoire/flutter/bin"
     ```
   - Enregistrez et fermez le fichier. Dans nano, vous pouvez enregistrer en appuyant sur `Ctrl + O`, puis en appuyant sur `Entrée`, et sortir en appuyant sur `Ctrl + X`.

3. **Vérifiez l'installation de Flutter** :
   - Dans votre terminal, exécutez la commande suivante :
     ```
     flutter doctor
     ```
   - Cela vérifiera si Flutter est correctement installé sur votre système et s'il y a des dépendances manquantes ou des problèmes à résoudre.

## Clonage et exécution du projet Flutter_open_inno

Maintenant que vous avez installé Flutter avec succès, suivez ces étapes pour cloner et exécuter le projet Flutter_open_inno :

1. **Cloner le projet** :
   - Dans votre terminal, naviguez vers le répertoire où vous souhaitez cloner le projet.
   - Utilisez la commande suivante pour cloner le dépôt Git de Flutter_open_inno :
     ```
     git clone https://github.com/votre_utilisateur/Flutter_open_inno.git
     ```
   - Remplacez `votre_utilisateur` par votre nom d'utilisateur GitHub, si nécessaire.

2. **Accédez au répertoire du projet** :
   - Utilisez la commande `cd` pour naviguer dans le répertoire du projet cloné :
     ```
     cd Flutter_open_inno
     ```

3. **Exécutez l'application** :
   - Une fois dans le répertoire du projet, exécutez la commande suivante pour lancer l'application Flutter :
     ```
     flutter run
     ```
   - Cette commande lancera l'application Flutter_open_inno sur votre émulateur ou périphérique connecté.

Vous êtes maintenant prêt à explorer et à modifier le projet Flutter_open_inno sur votre système !

---

N'hésitez pas à poser des questions si vous rencontrez des problèmes lors de l'installation ou de l'exécution du projet. Bon codage !
