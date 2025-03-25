# Write your MySQL query statement below

# user_id | biggest_window
WITH cte AS(
    SELECT user_id, visit_date
    FROM UserVisits

    UNION

    SELECT user_id, DATE('2021-1-1') AS visit_date
    FROM UserVisits

)
SELECT user_id 
    , MAX(DATEDIFF(IFNULL(nxt_date, DATE('2021-1-1')), visit_date)) AS biggest_window
FROM(
    SELECT user_id
        , visit_date
        , LEAD(visit_date, 1) OVER(PARTITION BY user_id ORDER BY visit_date) AS nxt_date 
    FROM cte
) A
GROUP BY 1
ORDER BY 1
;

