# Write your MySQL query statement below

SELECT DISTINCT 'Low Salary' AS category, SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts
GROUP BY 1

UNION DISTINCT

SELECT DISTINCT 'Average Salary' AS category, SUM(CASE WHEN income >= 20000 AND income <= 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts
GROUP BY 1

UNION DISTINCT 

SELECT DISTINCT 'High Salary' AS category, SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts
GROUP BY 1

