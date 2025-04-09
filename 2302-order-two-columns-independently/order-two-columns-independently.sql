# Write your MySQL query statement below

WITH rk AS(
    SELECT first_col
        , second_col
        , ROW_NUMBER() OVER(ORDER BY first_col) AS RNK1
        , ROW_NUMBER() OVER(ORDER BY second_col DESC) AS RNK2
    FROM Data 
)

SELECT a.first_col, b.second_col
FROM rk a
INNER JOIN rk b
ON a.RNK1 = b.RNK2
ORDER BY a.RNK1
;

