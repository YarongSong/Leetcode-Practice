# Write your MySQL query statement below
-- platform | experiment_name | num_experiments
-- No order
WITH cte AS(
SELECT DISTINCT 'Android' AS platform, 'Reading' AS experiment_name
FROM Experiments
UNION 
SELECT DISTINCT 'Android' AS platform, 'Sports' AS experiment_name
FROM Experiments
UNION
SELECT DISTINCT 'Android' AS platform, 'Programming' AS experiment_name
FROM Experiments
UNION
SELECT DISTINCT 'IOS' AS platform, 'Reading' AS experiment_name
FROM Experiments
UNION 
SELECT DISTINCT 'IOS' AS platform, 'Sports' AS experiment_name
FROM Experiments
UNION
SELECT DISTINCT 'IOS' AS platform, 'Programming' AS experiment_name
FROM Experiments
UNION
SELECT DISTINCT 'Web' AS platform, 'Reading' AS experiment_name
FROM Experiments
UNION 
SELECT DISTINCT 'Web' AS platform, 'Sports' AS experiment_name
FROM Experiments
UNION
SELECT DISTINCT 'Web' AS platform, 'Programming' AS experiment_name
FROM Experiments
)
SELECT a.platform, a.experiment_name, COUNT(DISTINCT b.experiment_id) AS num_experiments
FROM cte a
LEFT JOIN Experiments b
ON a.platform = b.platform
AND a.experiment_name = b.experiment_name
GROUP BY 1,2
;