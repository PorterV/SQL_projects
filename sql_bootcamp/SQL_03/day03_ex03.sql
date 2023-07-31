WITH people AS (SELECT person.gender, pizzeria.name
                FROM person_visits
                         INNER JOIN
                     person ON person_visits.person_id = person.id
                         INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id),
     women AS (SELECT p_w.name AS pizzeria_name
               FROM people p_w
               WHERE p_w.gender = 'female'),
     men AS (SELECT p_m.name AS pizzeria_name
             FROM people p_m
             WHERE p_m.gender = 'male'),
     only_women AS (SELECT *
                    FROM women
                    EXCEPT ALL
                    SELECT *
                    FROM men),
     only_men AS (SELECT *
                  FROM men
                  EXCEPT ALL
                  SELECT *
                  FROM women)
SELECT *
FROM only_women
UNION ALL
SELECT *
FROM only_men
ORDER BY 1;