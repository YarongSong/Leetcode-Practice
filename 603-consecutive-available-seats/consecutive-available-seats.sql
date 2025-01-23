# Write your MySQL query statement below
SELECT seat_id
FROM(
SELECT DISTINCT seat_id, free, LEAD(free,1) OVER(ORDER BY seat_id) AS next, LAG(free,1) OVER(ORDER BY seat_id) AS pre
FROM Cinema
) a
WHERE (next = 1 OR pre = 1)
AND a.free = 1
ORDER BY 1
;

