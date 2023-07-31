SELECT person.name AS name,
	   menu.pizza_name AS pizza_name,
	   menu.price AS price,
	   (100 - person_discounts.discount) / 100 * menu.price AS discount_price,
	   pizzeria.name AS pizzeria_name
FROM person_order
	INNER JOIN person ON person.id = person_order.person_id
	INNER JOIN menu ON menu.id = person_order.menu_id
	INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
	INNER JOIN person_discounts 
		ON person_order.person_id = person_discounts.person_id AND pizzeria.id = person_discounts.pizzeria_id
ORDER BY 1, 2;