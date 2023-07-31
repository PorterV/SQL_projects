INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () AS id,
       q.person_id,
       q.pizzeria_id,
       q.discount
FROM (SELECT person_order.person_id,
	  		 menu.pizzeria_id,
             COUNT(menu.pizzeria_id) AS count,
             CASE
	  			WHEN (COUNT(menu.pizzeria_id) = 1) THEN 10.5
	  			WHEN (COUNT(menu.pizzeria_id) = 2) THEN 22
	  			ELSE 30
	  		 END AS discount
	  FROM person_order
	  	INNER JOIN menu ON person_order.menu_id = menu.id
	  GROUP BY person_id, pizzeria_id
	  ORDER BY 1) q;