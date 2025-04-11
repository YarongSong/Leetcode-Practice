# Write your MySQL query statement below

-- city_id | day | degree
-- city_id asc

SELECT city_id, day, degree
FROM(
    SELECT city_id, day, degree, RANK() OVER(PARTITION BY city_id ORDER BY degree DESC, day) AS rnk
    FROM Weather
    )A
WHERE rnk = 1
ORDER BY 1
;



