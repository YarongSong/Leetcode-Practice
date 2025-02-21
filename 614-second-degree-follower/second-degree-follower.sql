# Write your MySQL query statement below
SELECT DISTINCT f1.follower, COUNT(DISTINCT f2.follower) AS num
FROM Follow f1
INNER JOIN Follow f2
ON f1.follower = f2.followee
GROUP BY f1.follower
HAVING COUNT(DISTINCT f2.follower) >= 1
AND COUNT(DISTINCT f1.followee) >= 1
ORDER BY f1.follower
;
