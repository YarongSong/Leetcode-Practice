# Write your MySQL query statement below

WITH CTE AS(
SELECT c.caller_id, c.duration, ct.country_code, ct.name
FROM Calls c
LEFT JOIN Person p
ON c.caller_id = p.id
LEFT JOIN Country ct
ON LEFT(p.phone_number,3) = ct.country_code

UNION ALL

SELECT c.callee_id, c.duration, ct.country_code, ct.name
FROM Calls c
LEFT JOIN Person p
ON c.callee_id = p.id
LEFT JOIN Country ct
ON LEFT(p.phone_number,3) = ct.country_code
)
SELECT DISTINCT name AS country
FROM CTE 
GROUP BY country_code, name
HAVING AVG(duration) > (SELECT AVG(duration) FROM CTE)
