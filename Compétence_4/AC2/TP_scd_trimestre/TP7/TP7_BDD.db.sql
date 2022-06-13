BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categorie" (
	"pk_cat"	INTEGER,
	"libelle"	TEXT
);
CREATE TABLE IF NOT EXISTS "client" (
	"pk_client"	INTEGER,
	"nom"	TEXT,
	"email"	TEXT,
	"dept"	INTEGER,
	"latitude"	INTEGER,
	"longitude"	INTEGER
);
CREATE TABLE IF NOT EXISTS "devis" (
	"pk_devis"	INTEGER,
	"ref"	TEXT,
	"fk_client"	INTEGER,
	"date"	TEXT
);
CREATE TABLE IF NOT EXISTS "ligne_des_devis" (
	"pk_ligne"	INTEGER,
	"fk_devis"	INTEGER,
	"fk_produit"	INTEGER,
	"qty"	INTEGER
);
CREATE TABLE IF NOT EXISTS "produit" (
	"pk_produit"	INTEGER,
	"ref"	TEXT,
	"libelle"	TEXT,
	"fk_cat"	INTEGER,
	"pu_ht"	INTEGER
);
INSERT INTO "categorie" VALUES (1,'CAT_1');
INSERT INTO "categorie" VALUES (2,'CAT_2');
INSERT INTO "categorie" VALUES (3,'CAT_3');
INSERT INTO "categorie" VALUES (4,'CAT_4');
INSERT INTO "client" VALUES (1,'Client 1','email@client1.com',69,45.76695695,4.83288933);
INSERT INTO "client" VALUES (2,'Client 2','NULL',33,45.76526928,4.83411115);
INSERT INTO "devis" VALUES (1,'DEV-001',1,'2021-03-20');
INSERT INTO "devis" VALUES (2,'DEV-002',2,'2021-04-20');
INSERT INTO "devis" VALUES (3,'DEV-003',1,'2021-05-10');
INSERT INTO "ligne_des_devis" VALUES (1,1,3,1);
INSERT INTO "ligne_des_devis" VALUES (2,2,2,3);
INSERT INTO "ligne_des_devis" VALUES (3,2,3,2);
INSERT INTO "ligne_des_devis" VALUES (5,3,2,5);
INSERT INTO "produit" VALUES (1,'PDT_A','PRODUIT_A',1,150);
INSERT INTO "produit" VALUES (2,'PDT_B','PRODUIT_B',2,90);
INSERT INTO "produit" VALUES (3,'PDT_C','PRODUIT_C',2,45);
INSERT INTO "produit" VALUES (4,'PDT_D','PRODUIT_D',0,250);
INSERT INTO "produit" VALUES (5,'PDT_E','PRODUIT_E',1,30);
COMMIT;
