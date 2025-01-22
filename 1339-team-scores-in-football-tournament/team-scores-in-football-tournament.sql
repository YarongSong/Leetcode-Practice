# Write your MySQL query statement below
SELECT team_id, team_name, SUM(num_points) AS num_points
FROM(
SELECT t.team_id
    , t.team_name
    , CASE WHEN IFNULL(m.host_goals,0) > IFNULL(m.guest_goals,0) THEN 3
           WHEN m.host_team IS NOT NULL AND m.host_goals = m.guest_goals THEN 1
           ELSE 0 END AS num_points
FROM Teams t 
LEFT JOIN Matches m
ON t.team_id = m.host_team

UNION ALL

SELECT t.team_id
    , t.team_name
    , CASE WHEN IFNULL(m.host_goals,0) < IFNULL(m.guest_goals,0) THEN 3
           WHEN m.host_team IS NOT NULL AND m.host_goals = m.guest_goals THEN 1
           ELSE 0 END AS num_points
FROM Teams t 
LEFT JOIN Matches m
ON t.team_id = m.guest_team
) a
GROUP BY 1,2
ORDER BY 3 DESC, 1

