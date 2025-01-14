# Write your MySQL query statement below
SELECT product_id
    , year AS first_year 
    , SUM(quantity) AS quantity
    , price
FROM(
SELECT product_id
    , year
    , quantity
    , price
    , RANK() OVER(PARTITION BY product_id ORDER BY year) AS RNK
FROM Sales
) s
WHERE RNK = 1
GROUP BY 1,2,4
