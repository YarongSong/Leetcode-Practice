# Write your MySQL query statement below

SELECT DISTINCT num AS ConsecutiveNums
FROM(
SELECT id
    , num
    , LEAD(num,1) OVER(ORDER BY id) AS sec
    , LEAD(num,2) OVER(ORDER BY id) AS thrd
FROM Logs
) a
WHERE num = sec
and sec = thrd


