SELECT person_visits.person_id,
       COUNT(person_visits.pizzeria_id) AS count_of_visits
FROM person_visits
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;