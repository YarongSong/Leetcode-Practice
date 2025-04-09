# Write your MySQL query statement below

-- user_id
-- order by user_id
-- 1) get all users who made at least 2 purchases more than 7 days apart (lead)
-- 2) also user only purchased once

WITH user1 AS(
    SELECT DISTINCT user_id
    FROM(
        SELECT user_id, purchase_date, LEAD(purchase_date,1) OVER(PARTITION BY user_id ORDER BY purchase_date) AS nxt_purchase_date
        FROM Purchases
        ) A
    WHERE DATEDIFF(nxt_purchase_date, purchase_date) <= 7
)
-- ), user2 AS(
--     SELECT DISTINCT user_id
--     FROM Purchases
--     GROUP BY user_id
--     HAVING COUNT(DISTINCT purchase_id) < 2
-- )
SELECT DISTINCT user_id
FROM Purchases
WHERE user_id IN (SELECT user_id FROM user1)
-- AND user_id NOT IN (SELECT user_id FROM user2)
ORDER BY 1 
;



