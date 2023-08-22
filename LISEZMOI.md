# Projets de démo sous Delphi

[This page in english.](README.md)

Ensemble de projets de démonstration des fonctionnalités de l'environnement de développement Delphi, ses librairies et son langage de programmation.

Certains projets ont été présentés lors de conférences, sur des formations ou des sessions de codage en ligne.

Les programmes sont à jour par rapport à la version [Community Edition](https://www.embarcadero.com/products/delphi/starter) et la version commerciale de [Delphi](https://www.embarcadero.com/products/delphi) ou [RAD Studio](https://www.embarcadero.com/products/rad-studio).

Vous ne savez pas ce qu'est Dephi ni où le télécharger ? Vous en saurez plus [sur ce site web](https://delphi-resources.developpeur-pascal.fr/).

De nombreux dépôts de code proposent d'autres exemples de projets Delphi. Certains sont listés sur [cette page](OtherDelphiSampleRepositories.md). N'hésitez pas à la compléter en [la modifiant directement](CONTRIBUTING.md) ou en [soumettant un ticket](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

## Installation des codes sources

Pour télécharger ce dépôt de code il est recommandé de passer par "git" mais vous pouvez aussi télécharger un ZIP directement depuis [son dépôt GitHub](https://github.com/DeveloppeurPascal/Delphi-samples).

Ce projet utilise des dépendances sous forme de sous modules. Ils seront absents du fichier ZIP. Vous devrez les télécharger à la main.

* [DeveloppeurPascal/librairies](https://github.com/DeveloppeurPascal/librairies) doit être installé dans le sous dossier ./Libraries/librairies

Certains projets ont besoin des bases de données de démo installées avec les exemples optionnels de Delphi. Si vous ne les avez pas, vous les trouverez dans le menu "Outils / Gérer les plateformes" puis l'onglet "Autres options" et enfin la rubrique "Samples" à installer.

L'exemple FireDAC-Samples\003-CDataRSS utilise le [driver FireDAC RSS](https://cdata.com/drivers/rss/firedac/) de [CData](https://cdata.com/).
(si vous utilisez la version d'évaluation, compilez en 64 bits car la version 32 bits de la DLL de CData est absente)

L'exemple FireDAC-Samples\004-MultiDBSample utilise le [driver FireDAC RSS](https://cdata.com/drivers/rss/firedac/) de [CData](https://cdata.com/).
(si vous utilisez la version d'évaluation, compilez en 64 bits car la version 32 bits de la DLL de CData est absente)

L'exemple IoT-Samples\002-BeaconFence utilise les composants "[Beacon Fence](https://getitnow.embarcadero.com/beaconfence/)" disponibles sur GetIt.

L'exemple IoT-Samples\004-Arduino-Mastermind utilise les composants "[AsyncPro for VCL](https://getitnow.embarcadero.com/AsyncPro-Sydney/)" disponibles sur GetIt et l'[IDE Visuino](https://www.visuino.com/) pour le programme Arduino.

L'exemple IoT-Samples\005-Joystick utilise les composants "[Radiant Shape](https://getitnow.embarcadero.com/bonus-radiant-shapes/)" disponibles sur GetIt, la librairie "[CommunicationLab](https://mitov.com/products/communicationlab)" de [Boian Mitov](https://mitov.com/) et l'[IDE Visuino](https://www.visuino.com/) pour le programme Arduino.

L'exemple Web-Samples\011-UniGUI utilise [UniGUI](http://www.unigui.com/).

L'exemple Web-Samples\012-UniGUI-Database utilise [UniGUI](http://www.unigui.com/).

L'exemple Web-Samples\013-TMSWebCore-HelloWorld utilise [TMS Web Core](https://www.tmssoftware.com/site/tmswebcoreintro.asp).

L'exemple Web-Samples\014-TMSWebCore-DisplayJSON utilise [TMS Web Core](https://www.tmssoftware.com/site/tmswebcoreintro.asp).

## Licence d'utilisation de ce dépôt de code et de son contenu

Ces codes sources sont distribués sous licence [AGPL 3.0 ou ultérieure] (https://choosealicense.com/licenses/agpl-3.0/).

Vous êtes globalement libre d'utiliser le contenu de ce dépôt de code n'importe où à condition :
* d'en faire mention dans vos projets
* de diffuser les modifications apportées aux fichiers fournis dans ce projet sous licence AGPL (en y laissant les mentions de copyright d'origine (auteur, lien vers ce dépôt, licence) obligatoirement complétées par les vôtres)
* de diffuser les codes sources de vos créations sous licence AGPL

Si cette licence ne convient pas à vos besoins vous pouvez acheter un droit d'utilisation de ce projet sous la licence [Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/) ou une licence commerciale dédiée ([contactez l'auteur](https://developpeur-pascal.fr/nous-contacter.php) pour discuter de vos besoins).

Ces codes sources sont fournis en l'état sans garantie d'aucune sorte.

Certains éléments inclus dans ce dépôt peuvent dépendre de droits d'utilisation de tiers (images, sons, ...). Ils ne sont pas réutilisables dans vos projets sauf mention contraire.

## Comment demander une nouvelle fonctionnalité, signaler un bogue ou une faille de sécurité ?

Si vous voulez une réponse du propriétaire de ce dépôt la meilleure façon de procéder pour demander une nouvelle fonctionnalité ou signaler une anomalie est d'aller sur [le dépôt de code sur GitHub](https://github.com/DeveloppeurPascal/Delphi-samples) et [d'ouvrir un ticket](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

Si vous avez trouvé une faille de sécurité n'en parlez pas en public avant qu'un correctif n'ait été déployé ou soit disponible. [Contactez l'auteur du dépôt en privé](https://developpeur-pascal.fr/nous-contacter.php) pour expliquer votre trouvaille.

Vous pouvez aussi cloner ce dépôt de code et participer à ses évolutions en soumettant vos modifications si vous le désirez. Lisez les explications dans le fichier [CONTRIBUTING.md](CONTRIBUTING.md).

## Supportez ce projet et son auteur

Si vous trouvez ce dépôt de code utile et voulez le montrer, merci de faire une donation [à son auteur](https://github.com/DeveloppeurPascal). Ca aidera à maintenir le projet (codes sources et binaires).

Vous pouvez utiliser l'un de ces services :

* [GitHub Sponsors](https://github.com/sponsors/DeveloppeurPascal)
* [Liberapay](https://liberapay.com/PatrickPremartin)
* [Patreon](https://www.patreon.com/patrickpremartin)
* [Paypal](https://www.paypal.com/paypalme/patrickpremartin)

ou si vous parlez français vous pouvez [vous abonner à Zone Abo](https://zone-abo.fr/nos-abonnements.php) sur une base mensuelle ou annuelle et avoir en plus accès à de nombreuses ressources en ligne (vidéos et articles).
