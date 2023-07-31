WITH people AS (SELECT person.gender, pizzeria.name
                FROM person_order
                         INNER JOIN person ON person_order.person_id = person.id
                         INNER JOIN menu ON person_order.menu_id = menu.id
                         INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id),
     women AS (SELECT p_w.name AS pizzeria_name
               FROM people p_w
               WHERE p_w.gender = 'female'),
     men AS (SELECT p_m.name AS pizzeria_name
             FROM people p_m
             WHERE p_m.gender = 'male'),
     only_women AS (SELECT *
                    FROM women
                    EXCEPT
                    SELECT *
                    FROM men),
     only_men AS (SELECT *
                  FROM men
                  EXCEPT
                  SELECT *
                  FROM women)
SELECT *
FROM only_women
UNION
SELECT *
FROM only_men
ORDER BY 1;