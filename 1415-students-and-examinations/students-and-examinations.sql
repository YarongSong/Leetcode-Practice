# Write your MySQL query statement below

SELECT st.student_id, st.student_name, sb.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students st
CROSS JOIN Subjects sb
LEFT JOIN Examinations e
ON st.student_id = e.student_id
AND sb.subject_name = e.subject_name
GROUP BY 1,2,3
ORDER BY 1,3