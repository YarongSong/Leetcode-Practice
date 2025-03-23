# Write your MySQL query statement below
# user_id | user_name | credit | credit_limit_breached

WITH cte AS(
SELECT paid_by AS user_id
    , 0 - IFNULL(amount, 0)  AS amount
FROM Transactions 

UNION ALL

SELECT paid_to AS user_id
    , IFNULL(amount, 0)  AS amount
FROM Transactions
)

SELECT DISTINCT u.user_id
    , u.user_name
    , u.credit + SUM(IFNULL(c.amount,0)) AS credit
    , CASE WHEN (u.credit + SUM(IFNULL(c.amount,0))) >= 0 THEN "No" ELSE "Yes" END AS credit_limit_breached
FROM Users u
LEFT JOIN cte c
ON u.user_id = c.user_id
GROUP BY 1,2,u.credit
;

