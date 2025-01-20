# Write your MySQL query statement below
SELECT #* EXCEPT(RNK)
    DISTINCT student_id
    , course_id
    , grade
FROM(
SELECT student_id
    , course_id
    , grade
    , RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id) AS RNK
FROM Enrollments
)a
WHERE RNK = 1
ORDER BY 1