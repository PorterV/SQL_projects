SELECT name,
	   age
FROM person
WHERE gender LIKE 'female' AND address LIKE 'Kazan'
ORDER BY name; 