# Write your MySQL query statement below
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION DISTINCT

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(DISTINCT department_id) = 1
