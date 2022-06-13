/*
Lejeune Hugo
TPA
TP4
28/04/2022
*/

/* 1) */
SELECT * FROM pg_tables WHERE schemaname LIKE 'pg_catalog';
/* resultat */
 schemaname |        tablename        | tableowner | tablespace | hasindexes | hasrules | hastriggers | rowsecurity
------------+-------------------------+------------+------------+------------+----------+-------------+-------------
 pg_catalog | pg_statistic            | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_type                 | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_foreign_table        | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_authid               | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog | pg_statistic_ext_data   | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_largeobject          | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_user_mapping         | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_subscription         | postgres   | pg_global  | t          | f        | f           | f
 pg_catalog | pg_attribute            | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_proc                 | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_class                | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_attrdef              | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_constraint           | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_inherits             | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_index                | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_operator             | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_opfamily             | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_opclass              | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_am                   | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_amop                 | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_amproc               | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_language             | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_largeobject_metadata | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_aggregate            | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_statistic_ext        | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_rewrite              | postgres   |            | t          | f        | f           | f
 pg_catalog | pg_trigger              | postgres   |            | t          | f        | f           | f

 /* 2) */
SELECT setting FROM pg_settings WHERE name LIKE 'search_path';
/* resultat */
     setting
-----------------
 "$user", public
(1 ligne)

/* 3) */
SELECT nspname FROM pg_catalog.pg_namespace;
/* Ou */
SELECT schema_name FROM information_schema.schemata;

/* resultat */
    schema_name
--------------------
 pg_toast
 pg_catalog
 public
 information_schema
(4 lignes)

/* 4) */
SELECT COUNT(nspname) FROM pg_catalog.pg_namespace;

/* resultat */
 count
-------
     4
(1 ligne)

/* 5) */

/* 6) */
CREATE TABLE tablenom (chevreid integer primary key, chevreprenom varchar(15), chevreprix integer);
SHOW search_path;

/* resultat */
   search_path
-----------------
 "$user", public
(1 ligne)

/* 7) */
SELECT schemaname FROM pg_tables WHERE tablename LIKE 'tablenom';

/* resultat */
 schemaname
------------
 public
(1 ligne)

/* 8) */
DROP TABLE tablenom;

/* 9) */
CREATE SCHEMA lejeune;
CREATE TABLE lejeune.hlejeune(id INTEGER PRIMARY KEY, prenom varchar(20), nom varchar(15));
GRANT ALL ON SCHEMA lejeune TO public;
GRANT ALL ON SCHEMA hlejeune TO public;


/* 12) */
/* Pour ubuntu / Linux */
psql -U lejeune.hugo -h 194.57.179.74 -d privilegebdd -p 80 -W

/* Pour windows */
Server [localhost]: 194.57.179.74
Database [postgres]: privilegebdd
Port [5432]: 80
Username [postgres]: lejeune.hugo

CREATE TABLE avoir_note AS SELECT * FROM "capitaine.dany".avoir_note;
CREATE TABLE enseignants AS SELECT * FROM "capitaine.dany".enseignants;
CREATE TABLE epreuves AS SELECT * FROM "capitaine.dany".epreuves;
CREATE TABLE etudiants AS SELECT * FROM "capitaine.dany".etudiants;
CREATE TABLE faire_cours AS SELECT * FROM "capitaine.dany".faire_cours;
CREATE TABLE matieres AS SELECT * FROM "capitaine.dany".matieres;
CREATE TABLE modules AS SELECT * FROM "capitaine.dany".modules;

/* 13) */
SELECT nometu FROM etudiants WHERE annetu=2;
CREATE VIEW ETU2 AS SELECT nometu FROM etudiants WHERE annetu=2;