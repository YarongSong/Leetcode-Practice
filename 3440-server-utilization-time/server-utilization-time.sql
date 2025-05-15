# Write your MySQL query statement below

-- total_uptime_days
-- floor, days

-- 1) each server, duration for each session: start, stop
-- 2) total

SELECT FLOOR(SUM(session_second)/3600/24) AS total_uptime_days
FROM(
    SELECT server_id
        , TIMESTAMPDIFF(SECOND, status_time, status_end_time) AS session_second
    FROM(
        SELECT server_id
            , session_status
            , status_time
            , LEAD(status_time, 1) OVER(PARTITION BY server_id ORDER BY status_time) AS status_end_time
        FROM Servers
    ) A
    WHERE session_status = 'start'
) B
;

