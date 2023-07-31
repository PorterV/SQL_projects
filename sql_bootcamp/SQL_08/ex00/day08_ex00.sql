-- 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;
COMMIT;

-- 2
SELECT * FROM pizzeria;
