# Write your MySQL query statement below

SELECT ROUND(SUM(CASE WHEN event_date = first_event_date AND DATEDIFF(next_event_date,event_date)=1 THEN 1 ELSE 0 END)/COUNT(DISTINCT player_id),2) AS fraction
FROM(
    SELECT DISTINCT player_id
      , event_date
      , LEAD(event_date,1) OVER(PARTITION BY player_id ORDER BY event_date) AS next_event_date
      , MIN(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS first_event_date
    FROM Activity
) a
