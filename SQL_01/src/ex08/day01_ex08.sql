SELECT order_date,
	CONCAT(person_n.name, ' (age:', person_n.age, ')')  AS person_information
FROM person_order
	NATURAL JOIN (SELECT id as person_id, name, age
				  FROM person
				  ) as person_n
ORDER BY order_date, person_information;