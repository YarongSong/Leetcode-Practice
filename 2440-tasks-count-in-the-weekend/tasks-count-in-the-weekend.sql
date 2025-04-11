# Write your MySQL query statement below
--  weekend_cnt | working_cnt

SELECT COUNT(DISTINCT CASE WHEN WEEKDAY(submit_date) IN (5,6) THEN task_id END) AS weekend_cnt
     , COUNT(DISTINCT CASE WHEN WEEKDAY(submit_date) NOT IN (5,6) THEN task_id END) AS working_cnt

FROM Tasks