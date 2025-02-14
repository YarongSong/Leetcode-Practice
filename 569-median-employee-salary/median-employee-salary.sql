# Write your MySQL query statement below

SELECT DISTINCT id, company, salary
FROM(
    SELECT *
        , RANK() OVER(PARTITION BY company ORDER BY salary, id) AS RNK
        , COUNT(id) OVER(PARTITION BY company) AS CNT
        #, MAX(id) OVER(PARTITION BY company) AS MAX_ID
        #, MIN(id) OVER(PARTITION BY company) AS MIN_ID
    FROM Employee
) a
WHERE RNK = FLOOR((CNT + 1)/2) 
OR RNK = CEIL((CNT + 1)/2)


