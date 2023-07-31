SELECT person.address,
       pizzeria.name,
       COUNT(pizzeria.name) AS count_of_orders
FROM person_order
	INNER JOIN person ON person_order.person_id = person.id
	INNER JOIN menu ON person_order.menu_id = menu.id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY 2, 1
ORDER BY 1, 2;