# Write your MySQL query statement below

-- login_date | user_count
-- 1) time range
-- 2) user: min(login) 
-- 3) date: at least one user loggin for the first time
-- 4) aggregate


WITH first AS(
    SELECT user_id
        , MIN(activity_date) AS first_login
    FROM Traffic
    WHERE activity = 'login'
    GROUP BY 1
    HAVING MIN(activity_date) >= DATE_SUB('2019-06-30', INTERVAL 90 DAY) 
    AND MIN(activity_date) <= DATE('2019-06-30')
)

SELECT first_login AS login_date
    , COUNT(user_id) AS user_count
FROM first
GROUP BY first_login
;

