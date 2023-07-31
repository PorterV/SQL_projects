CREATE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy',
                                                   IN pprice numeric DEFAULT 500,
                                                   IN pdate date DEFAULT '2022-01-08')
    RETURNS TABLE
	(
		name varchar
	)
AS
$$
BEGIN
    RETURN QUERY ((SELECT pizzeria.name
                   FROM (SELECT *
                         FROM person_visits
                         WHERE person_visits.visit_date = pdate) q1
				   			INNER JOIN (SELECT * FROM person WHERE person.name = pperson) q2
                                 ON q1.person_id = q2.id
                            INNER JOIN pizzeria ON q1.pizzeria_id = pizzeria.id
                            INNER JOIN (SELECT * FROM menu WHERE menu.price < pprice) q3 ON pizzeria.id = q3.pizzeria_id)

                  INTERSECT
                  (SELECT pizzeria.name
                   FROM (SELECT *
                         FROM person_order
                         WHERE person_order.order_date = pdate) q1
                            JOIN (SELECT * FROM person WHERE person.name = pperson) q2
                                 ON q1.person_id = q2.id
                            JOIN (SELECT * FROM menu WHERE menu.price < pprice) q3
                                 ON q1.menu_id = q3.id
                            JOIN pizzeria ON q3.pizzeria_id = pizzeria.id));
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

