# 20240301 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

## Sample "ClientServer-Samples\005-SetupAMobileAppWithQRCode"

### Lecteur de QR codes

* ajout du manifeste Android avec les permissins nécessaires pour utiliser la caméra (utilisé en filtrage de périphériques sur Google Play)
* Prise en charge du cycle de vie de l'application (désactivation de la caméra en cas de perte de focus de l'app)
* Passage des listes d'unités utilisées sur une seule ligne (pour limiter les mises à jour au niveau du dépôt lors de l'ajout/modification d'une dépendance)
* mise à jour des TODO en entête du programme de capture
* forçage de la caméra arrière en cas d'appareil iOS ou Android (avec failback sur "Default" si ça ne passe pas)
* ajout du contrôle du code de vérification (signature du message associé à des clés privées pour s'assurer de la provenance et l'intégrité du QR code)
* activation de la qualité "Photo" (quand elle est gérée) sur la caméra
* mise à jour de la liste des permissions Android dans les options du projet (dans Delphi)

## Exemple "ClientServer-Samples\003-EnvoiPhotosParAppTethering"

### Prise de photos (FMX)

* ajout du manifeste Android avec les permissins nécessaires pour utiliser la caméra (utilisé en filtrage de périphériques sur Google Play)
* Prise en charge du cycle de vie de l'application (désactivation de la caméra en cas de perte de focus de l'app)
* mise à jour des TODO en entête du programme de capture
* activation de la qualité "Photo" (quand elle est gérée) sur la caméra
* mise à jour de la liste des permissions Android dans les options du projet (dans Delphi)
