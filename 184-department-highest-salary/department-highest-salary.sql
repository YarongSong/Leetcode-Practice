# Write your MySQL query statement below

SELECT Department
    , Employee
    , Salary
FROM(
SELECT d.id
    , d.name AS Department
    , e.name AS Employee
    , e.salary AS Salary
    , RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS RNK
FROM Department d
INNER JOIN Employee e
ON d.id = e.departmentId
) a
WHERE RNK = 1
;
