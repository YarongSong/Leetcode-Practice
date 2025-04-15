# Write your MySQL query statement below

-- id | drink
WITH cte AS(
    SELECT id
        , drink
        , ROW_NUMBER() OVER() AS rnk
    FROM CoffeeShop
), cte2 AS(
    SELECT a.id
        , a.drink
        , a.rnk
        , MAX(b.rnk) as pre_rnk
    FROM cte a
    LEFT JOIN cte b
    ON a.drink IS NULL
    AND b.drink IS NOT NULL
    AND b.rnk < a.rnk
    GROUP BY 1,2,3
)

SELECT a.id, COALESCE(a.drink, b.drink) AS drink
FROM cte2 a
LEFT JOIN cte b
ON a.pre_rnk = b.rnk
ORDER BY a.rnk
;
