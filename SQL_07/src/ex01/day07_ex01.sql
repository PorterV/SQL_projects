SELECT person.name,
       COUNT(person_visits.pizzeria_id) AS count_of_visits
FROM person_visits
	INNER JOIN person ON person_visits.person_id = person.id
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
LIMIT 4;