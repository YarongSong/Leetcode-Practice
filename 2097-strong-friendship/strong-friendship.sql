# Write your MySQL query statement below

-- user1_id | user2_id | common_friend
-- user1_id < user2_id
-- no order
-- can't be a freidn to himself/herself

-- 0) find all friends for each user
-- 1) find distinct friend pair 
-- 2) find all common friends for each friend pair
-- 3) count number of common friends for each pair

WITH friend AS(
    SELECT user1_id AS friend
        , user2_id AS friend_with
    FROM Friendship
    UNION
    SELECT user2_id AS friend
        , user1_id AS friend_with
    FROM Friendship
), pair AS(
    SELECT DISTINCT CASE WHEN user1_id < user2_id THEN user1_id ELSE user2_id END AS user1_id
        , CASE WHEN user1_id < user2_id THEN user2_id ELSE user1_id END AS user2_id
    FROM Friendship
)

SELECT a.user1_id, a.user2_id, COUNT(DISTINCT c.friend_with) AS common_friend
FROM pair a
LEFT JOIN friend b
ON a.user1_id = b.friend
AND a.user2_id <> b.friend_with
LEFT JOIN friend c
ON a.user2_id = c.friend
AND a.user1_id <> c.friend_with
AND b.friend_with = c.friend_with
GROUP BY 1,2
HAVING COUNT(DISTINCT c.friend_with) >= 3
;
