# Write your MySQL query statement below
-- platform | experiment_name | num_experiments
-- No order
WITH plt AS(
    SELECT 'Android' AS platform
    UNION
    SELECT 'IOS' AS platform
    UNION
    SELECT 'Web' AS platform
), ep AS(
    SELECT 'Reading' AS experiment_name
    UNION
    SELECT 'Sports' AS experiment_name
    UNION
    SELECT 'Programming' AS experiment_name    
), plt_ep AS(
    SELECT platform, experiment_name
    FROM plt
    CROSS JOIN ep
)

SELECT a.platform, a.experiment_name, COUNT(DISTINCT b.experiment_id) AS num_experiments
FROM plt_ep a
LEFT JOIN Experiments b
ON a.platform = b.platform
AND a.experiment_name = b.experiment_name
GROUP BY 1,2
;