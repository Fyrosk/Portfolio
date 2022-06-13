/*
Lejeune Hugo
TPA
TP3
07/04/2022
*/

/* 1) */
SELECT Ep.numepr, libepr, nometu, note FROM etudiants AS E INNER JOIN avoir_note AS AN ON E.numetu = AN.numetu INNER JOIN epreuves AS Ep ON AN.numepr = Ep.numepr INNER JOIN matieres AS M ON Ep.matepr = M.nummat WHERE nommat LIKE 'anglais';
CREATE VIEW NOTE_ANGLAIS AS SELECT Ep.numepr, libepr, nometu, note FROM etudiants AS E INNER JOIN avoir_note AS AN ON E.numetu = AN.numetu INNER JOIN epreuves AS Ep ON AN.numepr = Ep.numepr INNER JOIN matieres AS M ON Ep.matepr = M.nummat WHERE nommat LIKE 'anglais';

/* 2) */

/*
lejeune_db_iut=# SELECT * FROM pg_views WHERE viewname LIKE 'note_anglais';
 schemaname |   viewname   | viewowner |                      definition
------------+--------------+-----------+------------------------------------------------------
 public     | note_anglais | lejeune   |  SELECT ep.numepr,                                  +
            |              |           |     ep.libepr,                                      +
            |              |           |     e.nometu,                                       +
            |              |           |     an.note                                         +
            |              |           |    FROM (((etudiants e                              +
            |              |           |      JOIN avoir_note an ON ((e.numetu = an.numetu)))+
            |              |           |      JOIN epreuves ep ON ((an.numepr = ep.numepr))) +
            |              |           |      JOIN matieres m ON ((ep.matepr = m.nummat)))   +
            |              |           |   WHERE ((m.nommat)::text ~~ 'anglais'::text);
(1 ligne)
*/


/* 3) */
/* Non on ne peux pas insérer un tuple dans une vue */

/* 4) */
SELECT * FROM etudiants WHERE annetu = 1;
CREATE VIEW ETUDIANT_1 AS SELECT * FROM etudiants WHERE annetu = 1;

/* 5) */
SELECT nomens, nometu FROM etudiants, enseignants WHERE vilens = viletu;
CREATE VIEW TUTEUR_POS AS SELECT nomens, nometu FROM etudiants, enseignants WHERE vilens = viletu;

/* 6) */
SELECT Et.nometu, Mt.nommat, SUM(An.note * Ep.coefepr) / SUM(Ep.coefepr) FROM etudiants AS Et INNER JOIN avoir_note AS An ON Et.numetu = An.numetu INNER JOIN epreuves AS Ep ON An.numepr = Ep.numepr INNER JOIN matieres AS Mt ON Ep.numepr = Mt.nummat GROUP BY nometu, nommat;