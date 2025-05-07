# Write your MySQL query statement below

-- x  | y 
-- Order: x, y, ASC

WITH two_sce AS(
    SELECT a.X AS x
        , a.Y AS y
    FROM (SELECT X, Y FROM Coordinates WHERE X <> Y) a
    JOIN (SELECT X, Y FROM Coordinates WHERE X <> Y) b
    ON a.X = b.Y
    AND a.Y = b.X
    AND a.X < a.Y

    UNION

    SELECT X AS x
        , Y AS y
    FROM Coordinates
    WHERE X = Y
    GROUP BY 1,2
    HAVING COUNT(*) >= 2
)


SELECT x, y
FROM two_sce
WHERE x <= y
ORDER BY x, y
;

