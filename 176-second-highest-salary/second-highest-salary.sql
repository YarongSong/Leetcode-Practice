# Write your MySQL query statement below
-- SELECT MAX(salary) AS SecondHighestSalary
-- FROM Employee e
-- WHERE salary <> (SELECT MAX(salary) FROM Employee)
-- ;

SELECT IFNULL(
    (
    SELECT DISTINCT salary
    FROM(
        SELECT DISTINCT salary 
            , DENSE_RANK() OVER(ORDER BY salary DESC) AS RNK
        FROM Employee
        ) A
    WHERE RNK = 2
    ), NULL) AS SecondHighestSalary
;

-- SELECT IFNULL(
-- (SELECT DISTINCT Salary AS SecondHighestSalary
-- FROM Employee
-- ORDER BY Salary DESC
-- LIMIT 1
-- OFFSET 1), NULL) AS SecondHighestSalary
-- ;