ALTER TABLE etudiants ADD COLUMN hobby varchar(20) DEFAULT ('sport') NOT NULL CHECK (hobby IN ('sport', 'lecture', 'cinema', 'peinture', 'sculpture');
ALTER TABLE etudiants ADD COLUMN NewCol integer; | ALTER TABLE etudiants DROP COLUMN NewCol;
ALTER TABLE etudiants ALTER COLUMN prenometu SET NOT NULL;
INSERT INTO epreuves VALUES (7, 'interro écrite',9,1,'21-oct-96',1);
INSERT INTO avoir_note VALUES (1,7,10), (2,7,08), (3,7,05), (4,7,09);
UPDATE avoir_note SET (numetu, numepr, note) = (3, 7, 7) WHERE numetu=3 AND numepr=7;
UPDATE avoir_note SET note=note+1 WHERE numetu=1 AND numepr=7;
DELETE FROM avoir_note WHERE numepr=7; | DELETE FROM epreuves WHERE numepr=7
ADD CONSTRAINT nom_clé_étrangére FOREIGN KEY (nom_de_la_colonne) REFERENCES nom_col (nom_col) ON DELETE CASCADE;
UPDATE avoir_note SET note=note-3 WHERE numetu IN (SELECT numetu FROM etudiants WHERE nometu LIKE 'marke') AND numepr IN (SELECT numepr FROM epreuves Ep INNER JOIN matieres Ma ON Ma.nummat = Ep.matepr WHERE nommat LIKE 'BD');
INSERT INTO avoir_note VALUES ((SELECT numetu FROM etudiants WHERE nometu LIKE 'dewa'),4,(SELECT avg(note) FROM avoir_note WHERE numepr=4)*0.9);
INSERT INTO etudiants (numetu,nometu,prenometu,hobby,annetu) VALUES (25, 'dartez', 'remi', 'sculpture', 2);