CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH visit AS (SELECT *
                FROM person_visits
			   		RIGHT JOIN (SELECT *
								FROM person
								WHERE person.name = 'Dmitriy') AS man
                    ON person_visits.person_id = man.id
                WHERE person_visits.visit_date = '2022-01-08'),
     pizzeria_n AS (SELECT pizzeria.id AS pizzeria_id, 
						   pizzeria.name
                   FROM pizzeria
						INNER JOIN visit ON pizzeria.id = visit.pizzeria_id),
     price_n AS (SELECT name,
                        menu.price
                FROM pizzeria_n
                         JOIN menu ON pizzeria_n.pizzeria_id = menu.pizzeria_id)
SELECT DISTINCT name
FROM price_n
WHERE price < 800;
