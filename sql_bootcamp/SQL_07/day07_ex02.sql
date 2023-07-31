SELECT q.*
FROM (SELECT pizzeria.name,
	         COUNT(pizzeria_id),
	         'visit' AS action_type
	  FROM person_visits
	 	INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 3) q
UNION ALL
SELECT q1.*
FROM (SELECT pizzeria.name,
             COUNT(pizzeria.name),
             'order' AS action_type
      FROM person_order
	  	INNER JOIN menu ON person_order.menu_id = menu.id
	  	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 3) q1
ORDER BY 3 ASC, 2 DESC;