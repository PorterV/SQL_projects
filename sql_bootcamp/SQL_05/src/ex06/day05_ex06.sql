CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);
SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT menu.pizza_name AS pizza_name,
       MAX(rating)
       OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu
	INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2;