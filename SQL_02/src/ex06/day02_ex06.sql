WITH orders AS (SELECT *
                FROM person_order
                         RIGHT JOIN 
							(SELECT * FROM person 
						 	 WHERE person.name IN ('Denis', 'Anna')) AS p_name
                         ON person_order.person_id = p_name.id)
SELECT pizza_name,
       pizzeria.name AS pizzeria_name
FROM menu
	INNER JOIN orders ON menu.id = orders.menu_id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;