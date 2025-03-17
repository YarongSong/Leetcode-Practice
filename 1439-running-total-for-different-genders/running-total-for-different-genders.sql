# Write your MySQL query statement below
# gender|day|total

SELECT gender
    , day
    , SUM(score_points) OVER(PARTITION BY gender ORDER BY day) AS total
FROM Scores 
GROUP BY gender, day
ORDER BY 1,2
;

