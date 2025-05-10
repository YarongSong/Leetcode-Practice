# Write your MySQL query statement below

-- user_id1 | user_id2
-- Order: user_id1, user_id2 ASC

-- 1) user1, friends
-- 2) all pairs that have mutual friends
-- 3) no mutual friends
-- 4) unique pairs
-- 5) order


WITH friends2 AS(

    SELECT user_id1, 
           user_id2 
    FROM Friends

    UNION

    SELECT user_id2, 
           user_id1 
    FROM Friends
), mutual AS(
    SELECT a.user_id1, a.user_id2
    FROM friends2 a
    JOIN friends2 b
    ON a.user_id1 = b.user_id1
    AND a.user_id2 <> b.user_id2
    JOIN friends2 c
    ON a.user_id2 = c.user_id1
    AND a.user_id1 <> c.user_id2
    AND c.user_id2 = b.user_id2
)

SELECT *  
FROM Friends
WHERE CONCAT(user_id1, user_id2) NOT IN (SELECT CONCAT(user_id1, user_id2) FROM mutual)
ORDER BY 1, 2
;



