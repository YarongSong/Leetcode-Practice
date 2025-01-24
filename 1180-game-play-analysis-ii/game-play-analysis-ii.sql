# Write your MySQL query statement below
# player_id | device_id

SELECT player_id, device_id
FROM(
    SELECT player_id
        , device_id
        , RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS RNK
    FROM Activity
) a
WHERE RNK = 1
;