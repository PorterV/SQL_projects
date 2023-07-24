SELECT *
FROM 
	(SELECT name as object_name FROM person order by person) object_name
UNION ALL
SELECT *
FROM 
	(SELECT pizza_name as object_name from menu order by pizza_name) object_name
