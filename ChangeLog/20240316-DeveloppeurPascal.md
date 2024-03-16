# 20240316 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

## Exemple ClientServer-Samples\005-SetupAMobileAppWithQRCode\QRCodeGenerator-FMX

* correction : ajout de la demande de permissions manquantes pour accéder à la caméra sous Android (bizarrement mon smartphone principal s'en passait mais bien entenu pas les autres)
* correction : coupure de la caméra dans le process de demande lié au WillBecomeActive déclenché qui restaurait la valeur antérieur (c'est à dire false)
* correction : différence entre l'encodage/décodage des sauts de ligne générant un mauvais code de contrôle côté smartphone. Un transfert de texte sans saut de ligne a résolu le problème.

## Exemple ClientServer-Samples\005-SetupAMobileAppWithQRCode\QRCodeGenerator-VCL

* suite à un problème d'encodage (LineFeed), encodage dans le QR code de la chaine sans saut de ligne (encodée en CSV via CommaText du TMemo).
