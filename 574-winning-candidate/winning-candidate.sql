# Write your MySQL query statement below

SELECT c.name
FROM Candidate c
LEFT JOIN Vote v
ON c.id = v.candidateId
GROUP BY c.id
ORDER BY COUNT(DISTINCT v.id) DESC
LIMIT 1