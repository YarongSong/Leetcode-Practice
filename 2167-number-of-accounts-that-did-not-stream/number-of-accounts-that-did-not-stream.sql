# Write your MySQL query statement below
-- accounts_count

-- 1) all accounts that subscribed in 2021
-- 2) accounts no stream in 2021

WITH non_sub AS(
    SELECT account_id
    FROM Subscriptions
    WHERE YEAR(end_date) < 2021 OR YEAR(start_date) > 2021

), stream AS(
    SELECT DISTINCT account_id
    FROM Streams
    WHERE YEAR(stream_date) = 2021
)

SELECT COUNT(account_id) AS accounts_count 
FROM Subscriptions
WHERE account_id NOT IN (SELECT account_id FROM non_sub)
AND account_id NOT IN (SELECT account_id FROM stream)
;