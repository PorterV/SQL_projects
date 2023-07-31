WITH pizza_n AS (SELECT *
               FROM menu
               WHERE menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza'))
SELECT pizza_name,
       pizzeria.name AS pizzeria_name,
       price
FROM pizza_n
         INNER JOIN pizzeria
              ON pizza_n.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;