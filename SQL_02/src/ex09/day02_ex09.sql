WITH women AS (SELECT *
               FROM person
               WHERE person.gender = 'female'),
     order_n AS (SELECT women.name,
                        person_order.*,
                        menu.pizza_name
                FROM person_order
                         INNER JOIN women ON person_order.person_id = women.id
                         INNER JOIN menu ON person_order.menu_id = menu.id)
SELECT name
FROM order_n
WHERE pizza_name = 'cheese pizza' AND EXISTS(SELECT order_n.name
                                             FROM order_n
                                             WHERE order_n.pizza_name = 'pepperoni pizza' AND order_n.name = order_n.name)
ORDER BY name;