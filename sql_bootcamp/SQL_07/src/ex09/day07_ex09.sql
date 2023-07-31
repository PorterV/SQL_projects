SELECT DISTINCT person.address,
                ROUND(MAX(person.age) - (MIN(person.age) / MAX(person.age)), 2) AS formula,
                ROUND(AVG(person.age), 2) AS average,
                (MAX(person.age) - (MIN(person.age) / MAX(person.age))) > AVG(person.age) AS comparison
FROM person
GROUP BY 1
ORDER BY 1;