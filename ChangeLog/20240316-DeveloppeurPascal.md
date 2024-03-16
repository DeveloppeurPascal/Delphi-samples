# 20240316 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* ajout de plusieurs dépôts à la liste des "autres dépôts de démos et exemples de code"

## Exemple ClientServer-Samples\005-SetupAMobileAppWithQRCode\QRCodeGenerator-FMX

* correction : ajout de la demande de permissions manquantes pour accéder à la caméra sous Android (bizarrement mon smartphone principal s'en passait mais bien entenu pas les autres)
* correction : coupure de la caméra dans le process de demande lié au WillBecomeActive déclenché qui restaurait la valeur antérieur (c'est à dire false)
* correction : différence entre l'encodage/décodage des sauts de ligne générant un mauvais code de contrôle côté smartphone. Un transfert de texte sans saut de ligne a résolu le problème.

## Exemple ClientServer-Samples\005-SetupAMobileAppWithQRCode\QRCodeGenerator-VCL

* suite à un problème d'encodage (LineFeed), encodage dans le QR code de la chaine sans saut de ligne (encodée en CSV via CommaText du TMemo).

## Exemple ClientServer-Samples\003-EnvoiPhotosParAppTethering\PriseDePhotos-FMX

* ajout des permissions pour Android
* ajout de l'activation de l'autofocus
* ajout du changement de qualité des photos pour "Photo"
* activation de la caméra arrière par défaut
