# Write your MySQL query statement below

-- N | Type 
-- Root: no parent
-- Leaf: no child

-- Edge: one node

WITH root AS(
    SELECT N, 'Root' AS Type
    FROM Tree
    WHERE P IS NULL
), leaf AS(
    SELECT N, 'Leaf' AS Type
    FROM(
        SELECT a.N, a.P, b.N AS child 
        FROM Tree a
        LEFT JOIN Tree b
        ON a.N = b.P
    ) A
    WHERE child IS NULL 
    AND P IS NOT NULL
), inner_n AS(
    SELECT N, 'Inner' AS Type
    FROM Tree
    WHERE N NOT IN (SELECT N FROM root)
    AND N NOT IN (SELECT N FROM leaf)
)

SELECT *
FROM(
    SELECT *
    FROM root

    UNION

    SELECT *
    FROM leaf

    UNION

    SELECT *
    FROM inner_n
) A
ORDER BY N
;

