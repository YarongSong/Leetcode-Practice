# Write your MySQL query statement below
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee e
WHERE salary <> (SELECT MAX(salary) FROM Employee)
-- ORDER BY salary DESC
-- LIMIT 1
