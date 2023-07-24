WITH visit_person AS (SELECT person_visits.visit_date
                FROM person_visits
                WHERE person_visits.person_id = 1
                   OR person_visits.person_id = 2),
     date_visit AS (SELECT date::date AS missing_date
               FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS date)
SELECT missing_date
FROM date_visit
         LEFT JOIN visit_person ON date_visit.missing_date = visit_person.visit_date
WHERE visit_person IS NULL
ORDER BY missing_date;