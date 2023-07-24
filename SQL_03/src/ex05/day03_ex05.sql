SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person_visits
	INNER JOIN (SELECT id FROM person WHERE name LIKE 'Andrey') q
		ON person_visits.person_id = q.id
	INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
EXCEPT
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person_order 
	INNER JOIN (SELECT * FROM person WHERE name LIKE 'Andrey') q1
		ON person_order.person_id = q1.id
	INNER JOIN menu ON person_order.menu_id = menu.id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;