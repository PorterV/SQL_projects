WITH men AS (SELECT *
             FROM person
             WHERE person.gender = 'male'
               AND person.address IN ('Moscow', 'Samara')),
     order_n AS (SELECT men.name,
                        person_order.*,
                        menu.pizza_name
                FROM person_order
                         INNER JOIN men ON person_order.person_id = men.id
                         INNER JOIN menu ON person_order.menu_id = menu.id)
SELECT DISTINCT name
FROM order_n
WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;