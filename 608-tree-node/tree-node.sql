# Write your MySQL query statement below
# id | type

SELECT DISTINCT t.id
    , CASE WHEN t.p_id IS NULL THEN 'Root'
           WHEN p.id IS NULL THEN 'Leaf'
           ELSE 'Inner' END AS type
FROM Tree t
LEFT JOIN Tree p
ON t.id = p.p_id