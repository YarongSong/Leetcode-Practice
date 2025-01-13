# Write your MySQL query statement below
SELECT machine_id, ROUND(AVG(processing_time),3) AS processing_time
FROM(
SELECT machine_id, process_id, MAX(timestamp) - MIN(timestamp) AS processing_time
FROM Activity
GROUP BY 1,2
) a
GROUP BY 1
