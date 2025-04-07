# Write your MySQL query statement below

-- user1_id | user2_id

-- 1) find all pairs of users
-- 2) find all common followers for all pairs
-- 3) get the max common 
-- 4) find eligible pairs

WITH pairs AS(
    SELECT DISTINCT CASE WHEN a.user_id < b.user_id THEN a.user_id ELSE b.user_id END user1_id
            , CASE WHEN a.user_id < b.user_id THEN b.user_id ELSE a.user_id END user2_id
    FROM (SELECT DISTINCT user_id FROM Relations) a
    JOIN (SELECT DISTINCT user_id FROM Relations) b
    ON a.user_id <> b.user_id
), com AS(
    SELECT a.user1_id, a.user2_id, COUNT(DISTINCT c.follower_id) AS comm_cnt
    FROM pairs a
    LEFT JOIN Relations b
    ON a.user1_id = b.user_id
    LEFT JOIN Relations c
    ON a.user2_id = c.user_id
    AND c.follower_id = b.follower_id
    GROUP BY 1,2
)

SELECT DISTINCT user1_id, user2_id
FROM com
WHERE comm_cnt = (SELECT MAX(comm_cnt) FROM com)
;