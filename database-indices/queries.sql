CREATE INDEX on ingredients(name);
CREATE INDEX on ingreidents(unit);


EXPLAIN ANALYSE
SELECT name FROM ingredients
WHERE name LIKE '%Brussels sprouts%';

EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name LIKE '%Brussels sprouts%';

EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name LIKE '%Brussels sprouts%' AND unit = 'gallon(s)';

EXPLAIN ANALYSE
SELECT count(*) FROM ingredients
WHERE name LIKE '%Brussels sprouts%' OR name LIKE '%j%'
AND unit = 'gallon(s)';
