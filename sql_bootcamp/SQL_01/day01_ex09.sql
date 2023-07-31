SELECT name
FROM pizzeria 
WHERE name NOT IN 
	(SELECT name
	FROM pizzeria
		INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id);

SELECT name
FROM pizzeria
WHERE NOT EXISTS (SELECT id
				 FROM person_visits
				 WHERE pizzeria.id = person_visits.pizzeria_id);