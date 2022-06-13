/*
Lejeune Hugo
TPA
TP5
10/05/2022
*/

/* 1) */
SELECT schemaname, tablename from pg_tables;

/* Résultat */
     schemaname     |        tablename
--------------------+-------------------------
 public             | modules
 public             | matieres
 public             | enseignants
 public             | epreuves
 public             | etudiants
 public             | avoir_note
 public             | faire_cours
 pg_catalog         | pg_statistic
 pg_catalog         | pg_type
 pg_catalog         | pg_foreign_table
 pg_catalog         | pg_authid
 pg_catalog         | pg_statistic_ext_data
 pg_catalog         | pg_largeobject
 pg_catalog         | pg_user_mapping
 pg_catalog         | pg_subscription
 pg_catalog         | pg_attribute
 pg_catalog         | pg_proc
 pg_catalog         | pg_class
 pg_catalog         | pg_attrdef
 pg_catalog         | pg_constraint
 pg_catalog         | pg_inherits
 pg_catalog         | pg_index
 pg_catalog         | pg_operator
 pg_catalog         | pg_opfamily
 pg_catalog         | pg_opclass
 pg_catalog         | pg_am
 pg_catalog         | pg_amop

 /* Explication */
 "La requête affiche schemaname et tablename provenant de pg_tables de la table ou l'on est ainsi que les tables système,
 pg_tables sert à afficher des informations utile sur chaque tables dans la base de données"

 /* 2) */
SELECT schemaname, tablename from pg_tables where tableowner=USER;

/* Résultat */
 schemaname |  tablename
------------+-------------
 public     | modules
 public     | matieres
 public     | enseignants
 public     | epreuves
 public     | etudiants
 public     | avoir_note
 public     | faire_cours
(7 lignes)

/* Explication */
"La requête affiche schemaname et tablename provenant de pg_tables de la table ou l'on est et qui appartienne à l'utilisateur connecter grâce à tableowner=USER"

/* 3) */
SELECT * from pg_views;

/* Résultat */
     schemaname     |               viewname                | viewowner |                                                                                                                                                                                                                                                                                                                 definition                                                                                      
--------------------+---------------------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 public             | etudiant_1                            | lejeune   |  SELECT etudiants.numetu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 +
                    |                                       |           |     etudiants.nometu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     +
                    |                                       |           |     etudiants.prenometu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  +
                    |                                       |           |     etudiants.adretu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     +
                    |                                       |           |     etudiants.viletu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     +
                    |                                       |           |     etudiants.cpetu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      +
                    |                                       |           |     etudiants.teletu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     +
                    |                                       |           |     etudiants.datentetu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  +
                    |                                       |           |     etudiants.annetu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     +
                    |                                       |           |     etudiants.remetu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     +
                    |                                       |           |     etudiants.sexetu,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     +
                    |                                       |           |     etudiants.datenaietu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  +
                    |                                       |           |    FROM etudiants                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         +
                    |                                       |           |   WHERE (etudiants.annetu = 1);
 public             | tuteur_pos                            | lejeune   |  SELECT enseignants.nomens,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               +
                    |                                       |           |     etudiants.nometu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      +
                    |                                       |           |    FROM etudiants,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        +
                    |                                       |           |     enseignants                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           +
                    |                                       |           |   WHERE ((enseignants.vilens)::text = (etudiants.viletu)::text);
 public             | note_anglais                          | lejeune   |  SELECT ep.numepr,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        +
                    |                                       |           |     ep.libepr,

/* Explication */
"Cette requête sert à afficher toute les vue crée dans postgresql"

/* 4) */
SELECT * FROM pg_indexes WHERE tablename IN (SELECT tablename FROM pg_tables WHERE tableowner=USER);

/* Résultat */
 schemaname |  tablename  |    indexname     | tablespace |                                            indexdef
------------+-------------+------------------+------------+------------------------------------------------------------------------------------------------
 public     | etudiants   | etudiants_pkey   |            | CREATE UNIQUE INDEX etudiants_pkey ON public.etudiants USING btree (numetu)
 public     | modules     | modules_pkey     |            | CREATE UNIQUE INDEX modules_pkey ON public.modules USING btree (nummod)
 public     | faire_cours | faire_cours_pkey |            | CREATE UNIQUE INDEX faire_cours_pkey ON public.faire_cours USING btree (numens, nummat, annee)
 public     | avoir_note  | avoir_note_pkey  |            | CREATE UNIQUE INDEX avoir_note_pkey ON public.avoir_note USING btree (numetu, numepr)
 public     | matieres    | matieres_pkey    |            | CREATE UNIQUE INDEX matieres_pkey ON public.matieres USING btree (nummat)
 public     | epreuves    | epreuves_pkey    |            | CREATE UNIQUE INDEX epreuves_pkey ON public.epreuves USING btree (numepr)
 public     | enseignants | enseignants_pkey |            | CREATE UNIQUE INDEX enseignants_pkey ON public.enseignants USING btree (numens)

 /* Explication */
 "La requête affiche les index qui on était mis dans des tables que l'utilisateur connecter est le proriétaire"

 /* 5) */
 SELECT * FROM pg_user ;

 /* Résultat */
  usename  | usesysid | usecreatedb | usesuper | userepl | usebypassrls |  passwd  | valuntil | useconfig
----------+----------+-------------+----------+---------+--------------+----------+----------+-----------
 postgres |       10 | t           | t        | t       | t            | ******** |          |
 lejeune  |    16394 | t           | t        | f       | f            | ******** |          |

 /* Explication */
 "Cette requête permet d'afficher tous les utilisateur crée dans postgresql leur id  leur droit accorder leur MDP encrypté ect"

 /* 6) */
 SELECT relname, conname FROM pg_class INNER JOIN pg_constraint ON relfilenode=conrelid;

 /* Résultat */
                  relname                 |           conname
-----------------------------------------+------------------------------
 etudiant_1                              | yes_or_no_check
 etudiant_1                              | cardinal_number_domain_check
 tuteur_pos                              | yes_or_no_check
 tuteur_pos                              | cardinal_number_domain_check
 modules                                 | modules_pkey
 matieres                                | fk_matieres_nummod
 matieres                                | matieres_pkey
 enseignants                             | enseignants_pkey
 epreuves                                | fk_epreuves_nummat
 epreuves                                | fk_epreuves_numens
 epreuves                                | epreuves_pkey
 etudiants                               | etudiants_pkey
 avoir_note                              | fk_avoir_note_numepr
 avoir_note                              | fk_avoir_note_numetu
 avoir_note                              | avoir_note_pkey
 faire_cours                             | fk_faire_cours_nummat
 faire_cours                             | fk_faire_cours_numens
 faire_cours                             | faire_cours_pkey
 note_anglais                            | yes_or_no_check
 note_anglais                            | cardinal_number_domain_check
 pg_type                                 | yes_or_no_check
 pg_type                                 | cardinal_number_domain_check
 pg_toast_1255                           | yes_or_no_check
 pg_toast_1255                           | cardinal_number_domain_check
 pg_toast_1255_index                     | yes_or_no_check
 pg_toast_1255_index                     | cardinal_number_domain_check
 pg_toast_1247                           | yes_or_no_check
 pg_toast_1247                           | cardinal_number_domain_check
 pg_toast_1247_index                     | yes_or_no_check
 pg_toast_1247_index                     | cardinal_number_domain_check
 pg_toast_1260                           | yes_or_no_check
 pg_toast_1260                           | cardinal_number_domain_check
 pg_toast_1260_index                     | yes_or_no_check
 pg_toast_1260_index                     | cardinal_number_domain_check
 pg_toast_1262                           | yes_or_no_check
 pg_toast_1262                           | cardinal_number_domain_check
 pg_toast_1262_index                     | yes_or_no_check
 pg_toast_1262_index                     | cardinal_number_domain_check
 pg_toast_2964                           | yes_or_no_check
 pg_toast_2964                           | cardinal_number_domain_check
 pg_toast_2964_index                     | yes_or_no_check
 pg_toast_2964_index                     | cardinal_number_domain_check
 pg_toast_6000                           | yes_or_no_check
 pg_toast_6000                           | cardinal_number_domain_check
 pg_toast_6000_index                     | yes_or_no_check
 pg_toast_6000_index                     | cardinal_number_domain_check
 pg_toast_2396                           | yes_or_no_check
 pg_toast_2396                           | cardinal_number_domain_check
 pg_toast_2396_index                     | yes_or_no_check
 pg_toast_2396_index                     | cardinal_number_domain_check
 pg_toast_3592                           | yes_or_no_check
 pg_toast_3592                           | cardinal_number_domain_check
 pg_toast_3592_index                     | yes_or_no_check
 pg_toast_3592_index                     | cardinal_number_domain_check
 pg_toast_6100                           | yes_or_no_check
 pg_toast_6100                           | cardinal_number_domain_check
 pg_toast_6100_index                     | yes_or_no_check
 pg_toast_6100_index                     | cardinal_number_domain_check
 pg_toast_1213                           | yes_or_no_check
 pg_toast_1213                           | cardinal_number_domain_check
 pg_toast_1213_index                     | yes_or_no_check
 pg_toast_1213_index                     | cardinal_number_domain_check
 pg_attribute_relid_attnam_index         | yes_or_no_check

 /* Explication */
 "cette reqête affiche des information sur les table crée dans postgresql il affiche les noms des contrainte selon les tables"

 /* 7) */
SELECT datname, usename from pg_database inner join pg_user on datdba=usesysid where usename=user;

/* Résultat */
    datname     | usename
----------------+---------
 lejeune        | lejeune
 tp1            | lejeune
 bdd2           | lejeune
 lejeune_db_iut | lejeune
 police         | lejeune
 privilege      | lejeune

 /* Explication */
 "Cette requête affiche les base de donnée crée et l'utilisateur qui les a crée"

 /* 8) */
 /* requête pour avoir que les tables et schémas de l'utilisateur connecter */
SELECT tablename, tableowner, schemaname  FROM pg_tables WHERE tableowner=USER;
/* requête pour avoir toutes les tables et schémas dans postgresql */
SELECT tablename, tableowner, schemaname  FROM pg_tables;

/* Résultat */
  tablename  | tableowner | schemaname
-------------+------------+------------
 modules     | lejeune    | public
 matieres    | lejeune    | public
 enseignants | lejeune    | public
 epreuves    | lejeune    | public
 etudiants   | lejeune    | public
 avoir_note  | lejeune    | public
 faire_cours | lejeune    | public

/* 9) */
SELECT datname, encoding, user FROM pg_database INNER JOIN pg_user ON datdba=usesysid WHERE user=user;

/* Résultat */
    datname     | encoding |  user
----------------+----------+---------
 postgres       |        6 | lejeune
 template1      |        6 | lejeune
 template0      |        6 | lejeune
 lejeune        |        6 | lejeune
 tp1            |        6 | lejeune
 bdd2           |        6 | lejeune
 lejeune_db_iut |        6 | lejeune
 police         |        6 | lejeune
 privilege      |        6 | lejeune

 /* 10) */
SELECT * FROM information_schema.table_constraints;
 /* Résultat */
  constraint_catalog | constraint_schema |    constraint_name    | table_catalog  | table_schema |       table_name        | constraint_type | is_deferrable | initially_deferred | enforced
--------------------+-------------------+-----------------------+----------------+--------------+-------------------------+-----------------+---------------+--------------------+----------
 lejeune_db_iut     | public            | etudiants_pkey        | lejeune_db_iut | public       | etudiants               | PRIMARY KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | enseignants_pkey      | lejeune_db_iut | public       | enseignants             | PRIMARY KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | matieres_pkey         | lejeune_db_iut | public       | matieres                | PRIMARY KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | modules_pkey          | lejeune_db_iut | public       | modules                 | PRIMARY KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | epreuves_pkey         | lejeune_db_iut | public       | epreuves                | PRIMARY KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | avoir_note_pkey       | lejeune_db_iut | public       | avoir_note              | PRIMARY KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | faire_cours_pkey      | lejeune_db_iut | public       | faire_cours             | PRIMARY KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | fk_matieres_nummod    | lejeune_db_iut | public       | matieres                | FOREIGN KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | fk_epreuves_numens    | lejeune_db_iut | public       | epreuves                | FOREIGN KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | fk_epreuves_nummat    | lejeune_db_iut | public       | epreuves                | FOREIGN KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | fk_avoir_note_numetu  | lejeune_db_iut | public       | avoir_note              | FOREIGN KEY     | NO            | NO                 | YES
 lejeune_db_iut     | public            | fk_avoir_note_numepr  | lejeune_db_iut | public       | avoir_note              | FOREIGN KEY     | NO            | NO                 | YES

 /* 11) */
SELECT nometu, prenometu, EXTRACT(YEAR FROM AGE(current_date,datenaietu)) AS age FROM etudiants;
/* Résultat */
   nometu    | prenometu | age
-------------+-----------+-----
 roblin      | lea       |  47
 athur       | leon      |  48
 minol       | luc       |  45
 bagnole     | sophie    |  46
 bury        | marc      |  49
 vendraux    | marc      |  46
 vendermaele | helene    |  46
 besson      | loic      |  43
 jean-paul   | godard    |  48
 beaux       | marie     |  47
 turini      | elsa      |  45
 torelle     | elise     |  47
 pharis      | pierre    |  44
 ephyre      | luc       |  46
 leclercq    | jules     |  44
 dupont      | luc       |  45
 marke       | loic      |  46
 dewa        | leon      |  47

 /* 12) */
 SELECT CONCAT (nometu, ' ' ,prenometu) AS identite, EXTRACT(MONTH FROM AGE(datenaietu)) AS mois FROM etudiants;
 /* Résultat */
       identite      | mois
--------------------+------
 roblin lea         |    4
 athur leon         |    1
 minol luc          |    2
 bagnole sophie     |    1
 bury marc          |    3
 vendraux marc      |    3
 vendermaele helene |    1
 besson loic        |   11
 jean-paul godard   |   11
 beaux marie        |    1
 turini elsa        |   10
 torelle elise      |    1
 pharis pierre      |    1
 ephyre luc         |    3
 leclercq jules     |   11
 dupont luc         |    6
 marke loic         |    6
 dewa leon          |    1

/* 13) */
SELECT CONCAT (replace(nometu,'ma','tu'),' ' ,replace(prenometu,'ma','tu')) AS identite, EXTRACT(MONTH FROM AGE(datenaietu)) AS mois FROM etudiants;