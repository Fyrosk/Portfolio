SELECT nometu FROM etudiants WHERE datnaietu < (SELECT datnaietu FROM etudiants WHERE nometu LIKE 'leclercq' AND prenometu LIKE 'jules');

SELECT numetu FROM etudiants WHERE numetu  IN (SELECT numetu FROM avoir_note WHERE numepr=4 AND note>10);

SELECT nometu FROM etudiants WHERE numetu IN (SELECT numetu FROM avoir_note WHERE note=12);

SELECT Et.nometu FROM etudiants AS Et INNER JOIN avoir_note AS A ON Et.numetu=A.numetu INNER JOIN epreuves AS Ep ON A.numepr=Ep.numepr WHERE A.numepr=4 AND A.note > (SELECT A.note FROM avoir_note AS A where A.numepr=4 AND A.numetu IN (SELECT Et.numetu FROM etudiants AS Et WHERE Et.nometu='dupont');

SELECT Et.nometu FROM etudiants as Et INNER JOIN avoir_note AS An ON Et.numetu=An.numetu WHERE An.note IN (SELECT An.note FROM etudiants AS Et INNER JOIN avoir_note AS An ON Et.numetu=An.numetu WHERE Et.nometu='dupont' AND Et.prenometu='luc') ORDER BY Et.numetu;

SELECT nometu FROM etudiants WHERE numetu IN (SELECT numetu FROM avoir_note WHERE note IN (SELECT note FROM avoir_note WHERE numetu IN (SELECT numetu FROM etudiants WHERE nometu LIKE 'dupont' AND prenometu LIKE 'luc')));


/*SELECT note FROM avoir_note WHERE numetu=(SELECT numetu FROM etudiants WHERE nometu='dupont' AND prenometu='luc'); <- test pour la dernière question */