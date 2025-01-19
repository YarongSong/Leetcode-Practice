# Write your MySQL query statement below
SELECT DISTINCT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e 
LEFT JOIN Department d
ON e.departmentId = d.id
WHERE e.id IN (
    SELECT id
    FROM(
        SELECT id, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS RNK
        FROM Employee
    )s
    WHERE RNK <= 3
)

