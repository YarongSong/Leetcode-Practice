# Write your MySQL query statement below

# school_id | score  
-- 1) Get all possible scores for each school, capacity >= student_count
-- 2) get the min score for eligible scores
-- 3) no score, return -1
-- 4) no order

SELECT DISTINCT a.school_id, IFNULL(MIN(b.score), -1) AS score
FROM Schools a
LEFT JOIN Exam b
ON a.capacity >= student_count
GROUP BY 1
;