# Write your MySQL query statement below

# Find the days that have 'report' & 'spam'
# calculate the daily %
# get the daily avergae %
SELECT ROUND(AVG(IFNULL(DLY_PCT,0)) * 100, 2) AS average_daily_percent
FROM(
    SELECT a.action_date
        , SUM(CASE WHEN b.post_id THEN 1 ELSE 0 END)/COUNT(DISTINCT a.post_id) AS DLY_PCT
    FROM(
        SELECT DISTINCT action_date, post_id
        FROM Actions
        WHERE action = 'report'
        AND extra = 'spam'
        ) a
    LEFT JOIN Removals b
    ON a.post_id = b.post_id
    # AND a.action_date <= b.remove_date
    GROUP BY 1
)A
