# Write your MySQL query statement below

-- user_id | gender

-- 1) rank each gender group bu user_id
-- 2) order by rnk, then 'female', 'other', 'male'

SELECT user_id, gender
FROM (
    SELECT user_id
        , gender
        , RANK() OVER(PARTITION BY gender ORDER BY user_id) AS rnk
    FROM Genders
    ) A
ORDER BY rnk, CASE WHEN gender = 'female' THEN 1 
                   WHEN gender = 'other' THEN 2
                   ELSE 3 END 
;