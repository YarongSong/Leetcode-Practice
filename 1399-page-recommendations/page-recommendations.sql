# Write your MySQL query statement below
WITH cte AS(

SELECT user2_id AS user_id
FROM Friendship
WHERE user1_id = 1
UNION 
SELECT user1_id AS user_id
FROM Friendship
WHERE user2_id = 1
) 

SELECT DISTINCT l.page_id AS recommended_page
FROM cte c
INNER JOIN Likes l
ON c.user_id = l.user_id
WHERE l.page_id NOT IN (SELECT DISTINCT page_id FROM Likes WHERE user_id = 1)


