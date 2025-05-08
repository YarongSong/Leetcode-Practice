# Write your MySQL query statement below

-- manager_name | dep_id
-- Order: dep_id ASC

-- 1) count # employees for each dept
-- 2) rank # employees and find the largest dept

WITH cte AS(
    SELECT dep_id
    FROM(
        SELECT dep_id, RANK() OVER(ORDER BY emp_cnt DESC) AS RNK
        FROM(
            SELECT dep_id, COUNT(emp_id) AS emp_cnt
            FROM Employees
            GROUP BY 1
            ) A
        ) B
    WHERE RNK = 1
)

SELECT emp_name AS manager_name, dep_id
FROM Employees
WHERE dep_id IN (SELECT dep_id FROM cte)
AND position = 'Manager'
ORDER BY 2
;

