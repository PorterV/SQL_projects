SET ENABLE_SEQSCAN TO OFF;
SELECT m.pizza_name,
       pizzeria.name AS pizzeria_name
FROM menu m
	INNER JOIN pizzeria ON m.pizzeria_id = pizzeria.id;	
EXPLAIN ANALYZE
SELECT m.pizza_name,
       pizzeria.name AS pizzeria_name
FROM menu m
	INNER JOIN pizzeria ON m.pizzeria_id = pizzeria.id;