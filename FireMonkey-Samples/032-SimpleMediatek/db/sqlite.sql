CREATE TABLE media (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  titre VARCHAR(255) NULL,
  gencod VARCHAR(50) NULL,
  support_type_id INTEGER NOT NULL
);

CREATE TABLE emprunts (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  date_loc DATE NULL,
  heure_loc TIME NULL,
  media_id INTEGER NOT NULL,
  personne_id INTEGER NOT NULL,
  rendu BIT NOT NULL
);

CREATE TABLE support_type (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  libelle VARCHAR(50) NULL
);

CREATE TABLE personnes (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  nom VARCHAR(50) NULL,
  email VARCHAR(255) NULL,
  tel VARCHAR(50) NULL
);

CREATE UNIQUE INDEX suptyp_par_libelle ON support_type
  (libelle,id);

CREATE UNIQUE INDEX emprunts_par_media ON emprunts
  (media_id,date_loc,heure_loc,personne_id,id);

CREATE UNIQUE INDEX emprunts_par_personne ON emprunts
  (personne_id,date_loc,heure_loc,media_id,id);

CREATE UNIQUE INDEX personnes_par_email ON personnes
  (email,id);

CREATE UNIQUE INDEX personnes_par_nom ON personnes
  (nom,id);

CREATE UNIQUE INDEX media_par_gencod ON media
  (gencod,id);

CREATE UNIQUE INDEX media_par_titre ON media
  (titre,id);
