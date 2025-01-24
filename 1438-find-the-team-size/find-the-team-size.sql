# Write your MySQL query statement below

SELECT e.employee_id, CNT AS team_size
FROM Employee e
INNER JOIN(
SELECT team_id, COUNT(DISTINCT employee_id) AS CNT
FROM Employee
GROUP BY team_id
) t
ON e.team_id = t.team_id
;
