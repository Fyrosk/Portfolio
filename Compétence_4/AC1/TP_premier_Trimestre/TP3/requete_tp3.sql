SELECT MAX(cde_total) FROM commande;
SELECT ROUND(AVG(cde_total),2) FROM commande;
SELECT MIN(cde_total) FROM commande;
SELECT SUM(cde_total) FROM commande;
SELECT cli_id, ROUND(AVG(cde_total),2) FROM commande GROUP BY cli_id;