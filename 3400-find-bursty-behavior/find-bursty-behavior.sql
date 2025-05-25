# Write your MySQL query statement below


-- user_id | max_7day_posts | avg_weekly_posts
-- Order: user_id ASC

-- 1) each user: AVG weekly, in 2024-02
-- 2) each post, total cnt of posts in the past 6 days
-- 3) filter to max_7day_posts >= avg_weekly_posts * 2
-- 4) order


WITH average AS(
    SELECT user_id, COUNT(post_id)/4 AS avg_weekly_posts
    FROM Posts
    WHERE post_date >= DATE('2024-02-01')
    AND post_date <= DATE('2024-02-28')
    GROUP BY user_id
), max_posts AS(
    SELECT user_id, MAX(any_7day_posts) AS max_7day_posts
    FROM(
        SELECT user_id
            , COUNT(post_id) OVER(PARTITION BY user_id ORDER BY post_date RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS any_7day_posts
        FROM Posts
    ) A
    GROUP BY user_id
)
SELECT a.user_id
    , b.max_7day_posts
    , a.avg_weekly_posts
FROM average a
JOIN max_posts b
ON a.user_id = b.user_id
AND b.max_7day_posts >= 2*a.avg_weekly_posts
ORDER BY 1
;
