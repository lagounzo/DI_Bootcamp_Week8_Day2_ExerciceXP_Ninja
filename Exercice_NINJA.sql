-- dvdrental DAY2 EXERCICE_NINJA 

--1. Récupérez les 2 derniers clients par ordre alphabétique (AZ) - excluez 'id' des résultats.
SELECT first_name, last_name 
FROM customer
ORDER BY first_name ASC LIMIT 2; 

--2. Utilisez SQL pour supprimer tous les achats effectués par Scott.
DELETE FROM payment WHERE customer_id = (
SELECT customer_id FROM customer WHERE first_name = 'Scott');

--3. Scott existe-t-il toujours dans la table des clients, même s'il a été supprimé ? Essayez de le trouver.
SELECT first_name,last_name FROM customer
WHERE first_name = 'Scott'

-- ou
-- SELECT * FROM customer
-- WHERE first_name = 'Scott';

--4. Utilisez SQL pour trouver tous les achats. Joignez les achats à la table des clients , de sorte que la commande
-- de Scott apparaisse, bien qu'au lieu du prénom et du nom du client, vous ne devriez voir que vide/vide. 
-- (Quel type de jointure devez-vous utiliser ?).
-- SELECT payment.customer_id,payment.payment_date
SELECT payment.*,
	CASE WHEN customer.first_name IS NULL AND customer.first_name IS NULL
		THEN '' ELSE customer.first_name END first_name,
	CASE WHEN customer.last_name IS NULL AND customer.last_name IS NULL
		THEN '' ELSE customer.last_name END last_name
FROM payment
LEFT JOIN customer ON payment.customer_id = customer.customer_id


--5. Utilisez SQL pour trouver tous les achats. Joignez les achats à la table des clients , 
-- afin que la commande de Scott n'apparaisse PAS. (Quel type de jointure devez-vous utiliser ?)

SELECT *
FROM payment 
LEFT JOIN customer ON payment.customer_id = customer.customer_id
WHERE customer.first_name != 'Scott'

