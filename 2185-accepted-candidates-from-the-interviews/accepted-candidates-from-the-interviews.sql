# Write your MySQL query statement below

-- candidate_id
-- years_of_exp >= 2
-- sum(score) > 15
-- no order

-- 1) get total score for each candidate 
-- 2) filter based on the two conditions


SELECT DISTINCT candidate_id
FROM Candidates a
LEFT JOIN Rounds b
ON a.interview_id = b.interview_id
WHERE a.years_of_exp >= 2
GROUP BY a.candidate_id, a.interview_id
HAVING SUM(IFNULL(b.score,0)) > 15
;
