# Write your MySQL query statement below

-- user_id | steps_date | rolling_average
-- Round two decimal places
-- ordered by user_id, steps_date ASC

-- 1) get the 3-day rolling avergae
-- 2) filter to all users, count and date that has 3 consecutive days, ending that date

SELECT user_id
    , steps_date
    , rolling_average
FROM(
    SELECT user_id
        , steps_count
        , steps_date
        , ROUND(AVG(steps_count) OVER(PARTITION BY user_id ORDER BY steps_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ), 2) AS rolling_average
        , LAG(steps_date, 1) OVER(PARTITION BY user_id ORDER BY steps_date) AS pre_1_date
        , LAG(steps_date, 2) OVER(PARTITION BY user_id ORDER BY steps_date) AS pre_2_date
    FROM Steps
) a
WHERE DATEDIFF(steps_date, pre_1_date) = 1
AND DATEDIFF(steps_date, pre_2_date) = 2
ORDER BY 1,2
;




