# Write your MySQL query statement below

SELECT e.left_operand
    , e.operator
    , e.right_operand
    , CASE WHEN(CASE WHEN e.operator = '<' THEN v1.value < v2.value
           WHEN e.operator = '>' THEN v1.value > v2.value
           WHEN e.operator = '=' THEN v1.value = v2.value END) = 0 THEN 'false' ELSE 'true' END AS value
FROM Expressions e
LEFT JOIN Variables v1
ON e.left_operand = v1.name
LEFT JOIN Variables v2
ON e.right_operand = v2.name