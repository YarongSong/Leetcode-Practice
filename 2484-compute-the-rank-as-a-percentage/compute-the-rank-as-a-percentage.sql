# Write your MySQL query statement below

-- student_id | department_id | percentage

-- 1) student_rank_in_the_department (rank())
-- 2) the_number_of_students_in_the_department [only 1 student]
-- 3) *100, round 2
-- 4) no order


SELECT student_id
    , department_id
    , ROUND((RNK - 1)*100/IF(CNT-1=0,1,CNT-1),2) AS percentage
FROM(
    SELECT student_id
        , department_id
        , COUNT(student_id) OVER(PARTITION BY department_id) AS CNT
        , RANK() OVER(PARTITION BY department_id ORDER BY mark DESC) AS RNK
    FROM Students 
) A
;
