# Write your MySQL query statement below

WITH cte AS(
    SELECT event_type, AVG(IFNULL(occurrences,0)) AS event_avg
    FROM Events
    GROUP BY 1
)

SELECT DISTINCT business_id
FROM Events e
LEFT JOIN cte c
ON e.event_type = c.event_type
WHERE e.occurrences > c.event_avg
GROUP BY 1
HAVING COUNT(DISTINCT e.event_type) > 1
;
