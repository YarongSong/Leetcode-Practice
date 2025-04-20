# Write your MySQL query statement below
-- user_id 

SELECT DISTINCT user_id
FROM(
    SELECT user_id
        , created_at
        , LEAD(created_at,1) OVER(PARTITION BY user_id ORDER BY created_at) AS nxt_created_at
    FROM Users
) B
WHERE DATEDIFF(nxt_created_at, created_at) <= 7
;


