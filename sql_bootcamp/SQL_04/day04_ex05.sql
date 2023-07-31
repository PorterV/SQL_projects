CREATE VIEW v_price_with_discount AS
SELECT person.name,
	   menu.pizza_name,
	   menu.price,
	   FLOOR(price - price*0.1) AS discount_price
FROM menu 
	INNER JOIN person_order ON menu.id = person_order.menu_id
	INNER JOIN person ON person.id =  person_order.person_id
ORDER BY 1, 2;