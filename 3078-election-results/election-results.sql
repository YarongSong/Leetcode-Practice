# Write your MySQL query statement below

-- candidate
-- Order: ASC

-- 1) Get the actual votes of each voter to the candidates
-- 2) Aggregate the votes at the candidate level 
-- 3) Max

WITH votes AS(
    SELECT voter, candidate, 1/(COUNT(candidate) OVER(PARTITION BY voter)) AS actual_vote
    FROM Votes
    WHERE candidate IS NOT NULL
), candidates AS(
    SELECT candidate, SUM(actual_vote) AS can_vote
    FROM votes
    GROUP BY 1
)
SELECT candidate
FROM(
    SELECT candidate, RANK() OVER(ORDER BY can_vote DESC) AS rnk
    FROM candidates
) a
WHERE rnk = 1
ORDER BY 1
;

