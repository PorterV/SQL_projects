SELECT user_vol.name                        AS name,
       lastname,
       type,
       volume,
       currency_name,
       COALESCE(rate_to_usd, 1)               AS last_rate_to_usd,
       COALESCE(volume * rate_to_usd, volume) AS total_volume_in_usd
FROM (SELECT user_v.name,
	         user_v.lastname,
	         user_v.type,
	         user_v.volume,
	         COALESCE(currency.name, 'not defined') AS currency_name,
	         user_v.currency_id
      FROM (SELECT COALESCE(user_n.name, 'not defined')        AS name,
	               COALESCE(user_n.lastname, 'not defined')    AS lastname,
	  	           balance.type                              AS type,
	               SUM(balance.money)                        AS volume,
	               balance.currency_id
            FROM "user" user_n
	  	    	FULL JOIN balance ON user_n.id = balance.user_id
            GROUP BY balance.type, COALESCE(user_n.lastname, 'not defined'), COALESCE(user_n.name, 'not defined'), currency_id) user_v
	  	LEFT JOIN currency ON currency.id = user_v.currency_id
     GROUP BY 1, 2, 3, 4, 5, 6) user_vol
	 LEFT JOIN
	 (SELECT currency.id,
	         name,
	         rate_to_usd,
	         lastdate
      FROM (SELECT id,
			       MAX(updated) AS lastdate
            FROM currency
            GROUP BY 1) q1
          LEFT JOIN currency ON q1.lastdate = currency.updated AND q1.id = currency.id) currency_vol
		ON currency_vol.id = user_vol.currency_id
ORDER BY 1 DESC, 2 ASC, 3 ASC;


