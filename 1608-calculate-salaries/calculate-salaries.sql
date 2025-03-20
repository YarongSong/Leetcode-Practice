# Write your MySQL query statement below

# company_id | employee_id | employee_name | salary
WITH rate AS(
    SELECT DISTINCT company_id, 
            CASE WHEN MAX(salary) < 1000 THEN 0
                 WHEN MAX(salary) >= 1000 AND MAX(salary) <= 10000 THEN 0.24
                 WHEN MAX(salary) > 10000 THEN 0.49 END AS rate
    FROM Salaries
    GROUP BY 1
)

SELECT s.company_id
        , s.employee_id
        , s.employee_name
        , ROUND(s.salary * (1-rate),0) AS salary
FROM salaries s
LEFT JOIN rate r
ON s.company_id = r.company_id


