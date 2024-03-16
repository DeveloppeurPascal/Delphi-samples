# 20240315 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* mise à jour des dépendances

## Exemple ClientServer-Samples\005-SetupAMobileAppWithQRCode\QRCodeGenerator-VCL

* remplacement des unités des librairies par les nouvelles dans le projet VCL

## Exemple ClientServer-Samples\005-SetupAMobileAppWithQRCode\QRCodeGenerator-FMX

* correction : lancement du thread de scan qui n'était pas lancé (n'oubliez pas le ".Start" sur CreateAnonymousThread() ! #LOL)
* ajout de l'autofocus continue (pour Android)
* remplacement des unités des librairies par les nouvelles dans le projet FireMonkey
