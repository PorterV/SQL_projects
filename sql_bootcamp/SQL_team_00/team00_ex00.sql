CREATE TABLE nodes (
    point1 varchar(1),
    point2 varchar(1),
    cost int
);

INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'b', 10);
INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'c', 15);
INSERT INTO nodes (point1, point2, cost) VALUES ('a', 'd', 20);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'a', 10);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'c', 35);
INSERT INTO nodes (point1, point2, cost) VALUES ('b', 'd', 25);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'a', 15);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'b', 35);
INSERT INTO nodes (point1, point2, cost) VALUES ('c', 'd', 30);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'a', 20);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'b', 25);
INSERT INTO nodes (point1, point2, cost) VALUES ('d', 'c', 30);

WITH paths AS (
	SELECT
		path1.cost + path2.cost + path3.cost + path4.cost AS total_cost,
		('{' || path1.point1 || ',' 
		|| path2.point1 || ',' 
		|| path3.point1 || ',' 
		|| path4.point1 || ',' 
		|| path4.point2 || '}') AS tour
	FROM nodes AS path1
	JOIN nodes AS path2
	ON path1.point2 = path2.point1
	AND path1.point1 != path2.point2
	AND path1.point1 = 'a'
	JOIN nodes AS path3
	ON path2.point2 = path3.point1
	AND path2.point1 != path3.point2
	AND path1.point1 != path3.point2
	JOIN nodes AS path4
	ON path3.point2 = path4.point1
	AND path3.point1 != path4.point2
	AND path2.point1 != path4.point2
	AND path1.point1 = path4.point2
)
SELECT *
FROM paths
WHERE total_cost = (SELECT MIN(total_cost) FROM paths)
ORDER BY total_cost, tour;