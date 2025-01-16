# Write your MySQL query statement below
# Rolling SUM

WITH max_turn AS(
SELECT MAX(turn)
FROM(
SELECT person_id, person_name, turn, SUM(weight) OVER(ORDER BY turn) AS tot_weight
FROM Queue
) a
WHERE tot_weight <= 1000
)

SELECT DISTINCT person_name
FROM Queue
WHERE turn = (SELECT * FROM max_turn) 
