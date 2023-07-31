SELECT pizzeria.name,
       COUNT(pizzeria.name)         AS count_of_orders,
       ROUND(AVG(menu.price), 2) AS average_price,
       MAX(menu.price)           AS max_price,
       MIN(menu.price)           AS min_price
FROM person_order
	INNER JOIN menu ON person_order.menu_id = menu.id
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY 1
ORDER BY 1;