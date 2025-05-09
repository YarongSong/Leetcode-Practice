# Write your MySQL query statement below

-- N | Type
-- Order by node ASC

-- Root
WITH cte AS(
    SELECT N, 'Root' AS Type
    FROM Tree
    WHERE P IS NULL

    UNION 

    SELECT N, 'Leaf' AS Type
    FROM Tree 
    WHERE N NOT IN (SELECT P FROM Tree WHERE P IS NOT NULL)
    AND P IS NOT NULL

), cte2 AS(
    SELECT N, 'Inner' AS Type
    FROM Tree
    WHERE N NOT IN (SELECT N FROM cte)
)

SELECT *
FROM (
    SELECT *
    FROM cte

    UNION 

    SELECT *
    FROM cte2
) A
ORDER BY 1
;

