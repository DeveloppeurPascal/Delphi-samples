CREATE TABLE "categories" (
	"code"	INTEGER,
	"libelle"	TEXT NOT NULL,
	"nom_fichier_image"	TEXT NOT NULL,
	"categorie_mere_code"	INTEGER NOT NULL DEFAULT 0,
	"prix_unitaire"	REAL NOT NULL DEFAULT 0,
	PRIMARY KEY("code" AUTOINCREMENT)
);

CREATE UNIQUE INDEX "categories_par_mere" ON "categories" (
	"categorie_mere_code",
	"code"
);

CREATE UNIQUE INDEX "categories_par_libelle" ON "categories" (
	"libelle",
	"code"
);

CREATE UNIQUE INDEX "categories_par_mere_et_libelle" ON "categories" (
	"categorie_mere_code",
	"libelle",
	"code"
);
