CREATE VIEW v_symmetric_union AS
WITH r AS (SELECT *
     	   FROM person_visits
    	   WHERE visit_date = '2022-01-02'),
	 s AS (SELECT *
     	   FROM person_visits
           WHERE visit_date = '2022-01-06')
SELECT r.person_id - s.person_id AS person_id
FROM r, s
UNION 
SELECT s.person_id - r.person_id AS person_id
FROM r, s
ORDER BY 1;