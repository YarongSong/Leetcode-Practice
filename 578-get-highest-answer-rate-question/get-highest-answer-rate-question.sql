# Write your MySQL query statement below

SELECT question_id AS survey_log
FROM SurveyLog
GROUP BY question_id
ORDER BY SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END)/SUM(CASE WHEN action = 'show ' THEN 1 ELSE 0 END) DESC, 1 
LIMIT 1