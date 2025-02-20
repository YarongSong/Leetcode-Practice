# Write your MySQL query statement below

SELECT DISTINCT ROUND(SQRT((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y)),2) AS shortest
FROM Point2D a
LEFT JOIN Point2D b
ON (a.x <> b.x OR a.y <> b.y)
ORDER BY 1
LIMIT 1

;
