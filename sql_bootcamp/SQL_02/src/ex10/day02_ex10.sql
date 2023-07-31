WITH contain_name AS (SELECT per_f.name    AS person_name1,
                             per_s.name    AS person_name2,
                             per_f.address AS common_address,
                             per_f.id      AS id_f,
                             per_s.id      AS id_s
                 	  FROM person per_f
					  		INNER JOIN person per_s ON per_f.address = per_s.address)
SELECT person_name1, person_name2, common_address
FROM contain_name
WHERE id_f > id_s
ORDER BY person_name1, person_name2, common_address;