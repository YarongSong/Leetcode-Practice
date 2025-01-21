# Write your MySQL query statement below
SELECT name, travelled_distance
FROM(
SELECT u.id, u.name, SUM(IFNULL(R.distance,0)) AS travelled_distance
FROM Users u
LEFT JOIN Rides R
ON u.id = R.user_id
GROUP BY 1,2
ORDER BY 3 DESC, 2
) a
