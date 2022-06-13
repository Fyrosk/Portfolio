INSERT INTO article (art_id, art_des, art_prix) VALUES (4, 'ciseaux', 6);
INSERT INTO article (art_id, art_des, art_prix) VALUES (5, 'règle 30 cm', 4);
INSERT INTO article (art_id, art_des, art_prix) VALUES (6, 'règle 20 cm', 3);
INSERT INTO article (art_id, art_des, art_prix) VALUES (7, 'stylo plume', 12);
INSERT INTO article (art_id, art_des, art_prix) VALUES (8, 'feutre tableau blanc', 4);


INSERT INTO client (cli_id, cli_nom, cli_prenom, cli_datent) VALUES (4, 'talon', 'marc', '1999-10-22');
INSERT INTO client (cli_id, cli_nom, cli_prenom, cli_datent) VALUES (5, 'talon', 'sophie', '2004-11-16');
INSERT INTO client (cli_id, cli_nom, cli_prenom, cli_datent) VALUES (6, 'talleux', 'vincent', '2005-06-21');



INSERT INTO commande (cli_id, art_id, cde_date, cde_qte) VALUES (4, 6, '2014-07-07', 9);
INSERT INTO commande (cli_id, art_id, cde_date, cde_qte) VALUES (5, 5, '2014-07-08', 1);
INSERT INTO commande (cli_id, art_id, cde_date, cde_qte) VALUES (6, 4, '2014-07-09', 12);
INSERT INTO commande (cli_id, art_id, cde_date, cde_qte) VALUES (4, 5, '2014-07-08', 2);
INSERT INTO commande (cli_id, art_id, cde_date, cde_qte) VALUES (5, 4, '2014-07-07', 5);
INSERT INTO commande (cli_id, art_id, cde_date, cde_qte) VALUES (5, 7, '2014-07-07', 1);




