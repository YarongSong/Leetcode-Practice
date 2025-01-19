# Write your MySQL query statement below

SELECT DISTINCT e.employee_id
FROM Employees e
LEFT JOIN Employees e2
ON e.manager_id = e2.employee_id
WHERE e2.employee_id IS NULL
AND e.manager_id IS NOT NULL
AND e.salary < 30000
ORDER BY 1
