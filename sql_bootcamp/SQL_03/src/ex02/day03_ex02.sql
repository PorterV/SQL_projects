SELECT menu.pizza_name AS pizza_name,
	   menu.price AS price,
	   pizzeria.name AS pizzeria_name 
FROM menu
	INNER JOIN (
		SELECT menu.id AS menu_id,
			   menu.pizzeria_id AS pizzeria_id
		FROM menu 
			LEFT JOIN person_order ON person_order.menu_id = menu.id
		WHERE person_order.menu_id IS NULL
		ORDER BY 1) q ON menu.id = q.menu_id
	INNER JOIN pizzeria ON pizzeria.id = q.pizzeria_id
ORDER BY 1, 2;
