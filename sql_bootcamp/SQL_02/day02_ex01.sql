SELECT date::date AS missing_date
FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS date
         LEFT JOIN (SELECT person_visits.visit_date
                    FROM person_visits
                    WHERE person_visits.person_id = 1
                       OR person_visits.person_id = 2) date_n
                   ON date = date_n.visit_date
WHERE visit_date IS NULL
ORDER BY missing_date;