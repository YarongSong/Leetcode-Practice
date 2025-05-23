# Write your MySQL query statement below


-- student_id | student_name | subject_name | attended_exams

SELECT a.student_id, a.student_name, b.subject_name, COUNT(c.subject_name) AS attended_exams
FROM Students a
CROSS JOIN Subjects b
LEFT JOIN Examinations c
ON a.student_id = c.student_id
AND b.subject_name = c.subject_name
GROUP BY 1,2,3
ORDER BY 1,3
;
