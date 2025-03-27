# Write your MySQL query statement below
# team_name | matches_played | points | goal_for | goal_against | goal_diff
WITH cte AS(
# home_team
SELECT home_team_id AS team_id
    , 1 AS matches_played
    , CASE WHEN home_team_goals > away_team_goals THEN 3
           WHEN home_team_goals = away_team_goals THEN 1
           ELSE 0 END AS points 
    , home_team_goals AS goal_for
    , away_team_goals AS goal_against
FROM Matches 

UNION ALL

# away_team
SELECT away_team_id AS team_id
    , 1 AS matches_played
    , CASE WHEN home_team_goals < away_team_goals THEN 3
           WHEN home_team_goals = away_team_goals THEN 1
           ELSE 0 END AS points 
    , away_team_goals AS goal_for
    , home_team_goals AS goal_against
FROM Matches 
)
SELECT DISTINCT t.team_name
    , SUM(IFNULL(matches_played,0)) AS matches_played
    , SUM(IFNULL(points,0)) AS points
    , SUM(IFNULL(goal_for,0)) AS goal_for
    , SUM(IFNULL(goal_against,0)) AS goal_against
    , SUM(IFNULL(goal_for,0)) - SUM(IFNULL(goal_against,0)) AS goal_diff
FROM cte c
INNER JOIN Teams t
ON c.team_id = t.team_id
GROUP BY t.team_id, t.team_name
ORDER BY 3 DESC, 6 DESC, 1
;

