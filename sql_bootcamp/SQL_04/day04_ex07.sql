INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
	    (SELECT id FROM person WHERE name = 'Dmitriy'),
	    (SELECT pizzeria.id
		 FROM 
			pizzeria
				INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
			WHERE menu.price < 800
		 EXCEPT
		 SELECT pizzeria.id
 		 FROM
			pizzeria
				INNER JOIN mv_dmitriy_visits_and_eats ON pizzeria.name = mv_dmitriy_visits_and_eats.name
		 ORDER BY 1
		 LIMIT 1),
		 '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;