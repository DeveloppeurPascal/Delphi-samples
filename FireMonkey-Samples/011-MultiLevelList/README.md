# ListeArborescente

2 programmes et des unités pour gérer des téléchargements de fichiers, leur mise en cache et une sélection d'info depuis une arborescence.

* assets : les images utilisées dans la base de démo et leur license
* src : les sources des deux projets
* web : des fichiers à mettre sur un serveur web (URL utilisée pour le choix dans la liste)
* categories.sql : source de la base de données SQLite utilisée pour la démo (une table gérant une arborescence simple)

## Les programmes

### ListeArborescence : gestion de la table (CRUD)

Programme de saisie d'une liste arborescente depuis une table unique.
=> premier niveau : libellé + fichier image
=> N niveaux : libellé
=> derniers niveaux de l'arobrescence : libellé + prix

En DEBUG la base de données SQLite modifiée se trouve dans "C:\Users\XXX_VotreUtilisateur_XXX\Documents\ListeArborescence\-debug\DB". Vous pouvez y copier le fichier de démo "web\Categories.db" pour tester le programme ou le fichier "src\categories-de-dev.db" (renommé "Categories.db") pour partir d'une base vide.

En RELEASE, le programme de mise à jour télécharge la base de données depuis le serveur web s'il ne la trouve pas en local dans son cache.

### ParcourtDeLaListe : programme de test / affichage du module de sélection

Programme de test de ce module de sélection.

## Unités des projets

### fChoisirUnTarif.pas : affichage de la liste et sélection d'un élément

Module de sélection d'une ligne (ici avec un prix) depuis une liste arborescente dont le premier niveau est composé d'images.

Ce fichier et ses dépendances peuvent être utilisés dans d'autres projets ou vous pouvez vous en inspirer pour gérer plusieurs niveaux dans une arborescence de sélection utilisable facilement au doigt ou à la souris (donc idéalement sur smartphone).

### Unités utilitaires diverses

Série d'unités permettant de gérer la mise en cache de fichiers téléchargés depuis un site web lors de leur première utilisation.

## Installer les programmes pour tester

* copiez les fichiers du dossier "web" sur un serveur web local ou sur Internet
* mettez l'URL (avec "/" final) d'accès à ces fichiers dans la constante _URL_DOWNLOAD de l'unité "src/uConst.pas"
* copiez le fichier "web/Categories.db" dans "MesDocuments/ListeArborescence\-debug\DB" pour utiliser le programme de mise à jour en DEBUG, inutile si vous l'utilisez en RELEASE
* compilez le programme ListeArborescence.dpr pour modifier le contenu de la liste (puis retransférez sa base SQLite Categories.db vers le serveur web)
* compilez le programme ParcourtDeLaListe.dpr sur Windows, Mac, Linux, Android ou iOS pour naviguer dans votre liste arborescente
