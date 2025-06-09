# Projets de démo sous Delphi

[This page in English.](README.md)

Ensemble de projets de démonstration des fonctionnalités de l'environnement de développement Delphi, ses librairies et son langage de programmation.

Certains projets ont été présentés lors de conférences, sur des formations ou des sessions de codage en ligne.

Les programmes sont à jour par rapport à la version [Community Edition](https://www.embarcadero.com/products/delphi/starter) et la version commerciale de [Delphi](https://www.embarcadero.com/products/delphi) ou [RAD Studio](https://www.embarcadero.com/products/rad-studio).

Vous ne savez pas ce qu'est Dephi ni où le télécharger ? Vous en saurez plus [sur ce site web](https://delphi-resources.developpeur-pascal.fr/).

De nombreux dépôts de code proposent d'autres exemples de projets Delphi. Certains sont listés sur [cette page](OtherDelphiSampleRepositories.md). N'hésitez pas à la compléter en [la modifiant directement](CONTRIBUTING.md) ou en [soumettant un ticket](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

## Présentations et conférences

### Twitch

Suivez mes streams de développement de logiciels, jeux vidéo, applications mobiles et sites web sur [ma chaîne Twitch](https://www.twitch.tv/patrickpremartin) ou en rediffusion sur [Serial Streameur](https://serialstreameur.fr) la plupart du temps en français.

## Installation des codes sources

Pour télécharger ce dépôt de code il est recommandé de passer par "git" mais vous pouvez aussi télécharger un ZIP directement depuis [son dépôt GitHub](https://github.com/DeveloppeurPascal/Delphi-samples).

Ce projet utilise des dépendances sous forme de sous modules. Ils seront absents du fichier ZIP. Vous devrez les télécharger à la main.

* [DeveloppeurPascal/librairies](https://github.com/DeveloppeurPascal/librairies) doit être installé dans le sous dossier ./Libraries/librairies
* [DeveloppeurPascal/Socket-Messaging-Library](https://github.com/DeveloppeurPascal/Socket-Messaging-Library) doit être installé dans le sous dossier ./Libraries/Socket-Messaging-Library
* [Spelt/ZXing.Delphi](https://github.com/Spelt/ZXing.Delphi) doit être installé dans le sous dossier ./Libraries/ZXing.Delphi
* [foxitsoftware/DelphiZXingQRCode](https://github.com/foxitsoftware/DelphiZXingQRCode) doit être installé dans le sous dossier ./Libraries/DelphiZXingQRCode

Certains projets ont besoin des bases de données de démo installées avec les exemples optionnels de Delphi. Si vous ne les avez pas, vous les trouverez dans le menu "Outils / Gérer les plateformes" puis l'onglet "Autres options" et enfin la rubrique "Samples" à installer.

L'exemple ClientServer-Samples\004-EnvoiPhotosParSocket utilise [la librairie Socket Messaging](https://github.com/DeveloppeurPascal/Socket-Messaging-Library) pour la communication via socket sur un réseau TCP/IP.

L'exemple ClientServer-Samples\005-SetupAMobileAppWithQRCode utilise [la librairie ZXing.Delphi](https://github.com/Spelt/ZXing.Delphi) pour le décodage d'un QR code et [la librairie DelphiZXingQRCode](https://github.com/foxitsoftware/DelphiZXingQRCode) pour la création d'un QR code.

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

## Documentation et assistance

Je passe par des commentaires au format [XMLDOC](https://docwiki.embarcadero.com/RADStudio/fr/Commentaires_de_documentation_XML) dans Delphi pour documenter mes projets. Ils sont reconnus par Help Insight qui propose de l'aide à la saisie en temps réel dans l'éditeur de code.

J'utilise régulièrement l'outil [DocInsight](https://devjetsoftware.com/products/documentation-insight/) pour les saisir et contrôler leur formatage.

L'export de la documentation est fait en HTML par [DocInsight](https://devjetsoftware.com/products/documentation-insight/) ou [PasDoc](https://pasdoc.github.io) vers le dossier /docs du dépôt. Vous y avez aussi [accès en ligne](https://developpeurpascal.github.io/Delphi-samples) grâce à l'hébergement offert par GitHub Pages.

D'autres informations (tutoriels, articles, vidéos, FAQ, présentations et liens) sont disponibles sur [le site web du projet](https://samples.developpeur-pascal.fr) ou [le devlog du projet](https://developpeur-pascal.fr/exemples-et-demos.html).

Si vous avez besoin d'explications ou d'aide pour comprendre ou utiliser certaines parties de ce projet dans le vôtre, n'hésitez pas à [me contacter](https://developpeur-pascal.fr/nous-contacter.php). Je pourrai soit vous orienter vers une ressource en ligne, soit vous proposer une assistance sous forme de prestation payante ou gratuite selon les cas. Vous pouvez aussi me faire signe à l'occasion d'une conférence ou pendant une présentation en ligne.

## Compatibilité

En tant que [MVP Embarcadero](https://www.embarcadero.com/resources/partners/mvp-directory) je bénéficie dès qu'elles sortent des dernières versions de [Delphi](https://www.embarcadero.com/products/delphi) et [C++ Builder](https://www.embarcadero.com/products/cbuilder) dans [RAD Studio](https://www.embarcadero.com/products/rad-studio). C'est donc dans ces versions que je travaille.

Normalement mes librairies et composants doivent aussi fonctionner au moins sur la version en cours de [Delphi Community Edition](https://www.embarcadero.com/products/delphi/starter).

Aucune garantie de compatibilité avec des versions antérieures n'est fournie même si je m'efforce de faire du code propre et ne pas trop utiliser les nouvelles façons d'écrire dedans (type inference, inline var et multilines strings).

Si vous détectez des anomalies sur des versions antérieures n'hésitez pas à [les rapporter](https://github.com/DeveloppeurPascal/Delphi-samples/issues) pour que je teste et tente de corriger ou fournir un contournement.

## Licence d'utilisation de ce dépôt de code et de son contenu

Ces codes sources sont distribués sous licence [AGPL 3.0 ou ultérieure](https://choosealicense.com/licenses/agpl-3.0/).

Vous êtes libre d'utiliser le contenu de ce dépôt de code n'importe où à condition :
* d'en faire mention dans vos projets
* de diffuser les modifications apportées aux fichiers fournis dans ce projet sous licence AGPL (en y laissant les mentions de copyright d'origine (auteur, lien vers ce dépôt, licence) obligatoirement complétées par les vôtres)
* de diffuser les codes sources de vos créations sous licence AGPL

Si cette licence ne convient pas à vos besoins (notamment pour un projet commercial) je propose aussi [des licences classiques pour les développeurs et les entreprises](https://samples.developpeur-pascal.fr).

Certains éléments inclus dans ce dépôt peuvent dépendre de droits d'utilisation de tiers (images, sons, ...). Ils ne sont pas réutilisables dans vos projets sauf mention contraire.

Les codes sources de ce dépôt de code comme leur éventuelle version compilée sont fournis en l'état sans garantie d'aucune sorte.

## Comment demander une nouvelle fonctionnalité, signaler un bogue ou une faille de sécurité ?

Si vous voulez une réponse du propriétaire de ce dépôt la meilleure façon de procéder pour demander une nouvelle fonctionnalité ou signaler une anomalie est d'aller sur [le dépôt de code sur GitHub](https://github.com/DeveloppeurPascal/Delphi-samples) et [d'ouvrir un ticket](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

Si vous avez trouvé une faille de sécurité n'en parlez pas en public avant qu'un correctif n'ait été déployé ou soit disponible. [Contactez l'auteur du dépôt en privé](https://developpeur-pascal.fr/nous-contacter.php) pour expliquer votre trouvaille.

Vous pouvez aussi cloner ce dépôt de code et participer à ses évolutions en soumettant vos modifications si vous le désirez. Lisez les explications dans le fichier [CONTRIBUTING.md](CONTRIBUTING.md).

## Soutenez ce projet et son auteur

Si vous trouvez ce dépôt de code utile et voulez le montrer, merci de faire une donation [à son auteur](https://github.com/DeveloppeurPascal). Ca aidera à maintenir ce projet et tous les autres.

Vous pouvez utiliser l'un de ces services :

* [GitHub Sponsors](https://github.com/sponsors/DeveloppeurPascal)
* Ko-fi [en français](https://ko-fi.com/patrick_premartin_fr) ou [en anglais](https://ko-fi.com/patrick_premartin_en)
* [Patreon](https://www.patreon.com/patrickpremartin)
* [Liberapay](https://liberapay.com/PatrickPremartin)

Vous pouvez acheter une licence d'utilisateur pour [mes logiciels](https://lic.olfsoftware.fr/products.php?lng=fr) et [mes jeux vidéo](https://lic.gamolf.fr/products.php?lng=fr) ou [une licence de développeur pour mes bibliothèques](https://lic.developpeur-pascal.fr/products.php?lng=fr) si vous les utilisez dans vos projets.

Je suis également disponible en tant que prestataire pour vous aider à utiliser ce projet ou d'autres, comme pour vos développements de logiciels, applications mobiles et sites Internet. [Contactez-moi](https://vasur.fr/about) pour en discuter.
