# Write your MySQL query statement below
WITH cte AS(
    SELECT user_id, MIN(activity_date) AS fst_login_date
    FROM Traffic 
    WHERE activity = 'login'
    GROUP BY 1
)
SELECT t.activity_date AS login_date
    , COUNT(DISTINCT c.user_id) AS user_count
FROM(
    SELECT DISTINCT activity_date 
    FROM Traffic 
    WHERE activity_date >= DATE_SUB("2019-06-30", INTERVAL 90 DAY)
    )t
INNER JOIN cte c
ON t.activity_date = fst_login_date
GROUP BY 1
;
# SELECT DATE_SUB("2019-06-30", INTERVAL 90 DAY)

