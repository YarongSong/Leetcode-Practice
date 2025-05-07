# Write your MySQL query statement below

-- city | peak_calling_hour | number_of_calls
-- Order: peak_calling_hour, city DESC


-- 1) for each city, get the number of calls for each hour in the table
-- 2) rank by # calls to find the peak hour

WITH city_hour AS(
    SELECT city, HOUR(call_time) AS call_hour, COUNT(*) AS number_of_calls
    FROM Calls
    GROUP BY 1,2
)

SELECT city, call_hour AS peak_calling_hour, number_of_calls
FROM(
    SELECT city
        , call_hour
        , number_of_calls
        , RANK() OVER(PARTITION BY city ORDER BY number_of_calls DESC) AS RNK
    FROM city_hour
) A
WHERE RNK = 1
ORDER BY 2 DESC, 1 DESC
;

