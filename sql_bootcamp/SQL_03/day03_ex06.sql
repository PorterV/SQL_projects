SELECT q.pizza_name,
	   q.name,
	   q_main.name,
	   q.price
FROM (SELECT menu.pizza_name,
		     pizzeria.name,
		     menu.price,
		     pizzeria.id
	  FROM menu
		INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id) q 
	  INNER JOIN (SELECT menu.pizza_name,
		                 pizzeria.name,
				         menu.price,
				         pizzeria.id
	  			  FROM menu
				  	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id) q_main
	  ON q.price = q_main.price AND q.pizza_name = q_main.pizza_name AND q.id > q_main.id
ORDER BY 1;