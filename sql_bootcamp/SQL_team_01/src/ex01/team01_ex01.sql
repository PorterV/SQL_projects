-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH currency_n AS (SELECT balance.user_id      AS balance_u_id,
                           balance.money,
                           balance.updated,
                           currency.name        AS currency_name,
                           currency.rate_to_usd AS currency_rate,
                           currency.updated     AS currency_updated
                    FROM balance
				  		INNER JOIN currency ON balance.currency_id = currency.id)
SELECT COALESCE(user_n.name, 'not defined'),
       COALESCE(user_n.lastname, 'not defined'),
       curr_j.currency_name,
       curr_j.money * currency.rate_to_usd AS currency_in_usd
FROM (SELECT q2.id, 
	  	     q2.currency_name, 
	  		 q2.money, 
	  		 q2.updated, 
	  		 COALESCE(q1.diff, q2.diff) new_diff
      FROM (SELECT currency_n.balance_u_id AS id, 
				   currency_name, 
				   money, 
				   updated, 
				   MIN(updated - currency_updated) AS diff
      	    FROM currency_n
            WHERE updated - currency_updated > INTERVAL '0 days'
            GROUP BY 1, 2, 3, 4) q1
        FULL JOIN (SELECT currency_n.balance_u_id AS id,
                          currency_name,
                          money,
                          updated,
                          MAX(updated - currency_updated) AS diff
                   FROM currency_n
                   WHERE updated - currency_updated < INTERVAL '0 days'
                   GROUP BY 1, 2, 3, 4) q2
         ON q1.id = q2.id AND q1.currency_name = q2.currency_name AND q1.money = q2.money AND q1.updated = q2.updated) curr_j
	LEFT JOIN "user" user_n ON curr_j.id = user_n.id
	LEFT JOIN currency ON curr_j.new_diff = (curr_j.updated - currency.updated) AND curr_j.currency_name = currency.name
ORDER BY 1 DESC, 2 ASC, 3 ASC;