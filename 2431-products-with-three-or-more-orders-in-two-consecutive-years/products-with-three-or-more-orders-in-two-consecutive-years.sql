# Write your MySQL query statement below

-- product_id
-- No order

-- 1) for each product, each year, order_cnt
-- 2) LEAD() to get the next year order_cnt, 

WITH cnt AS(
    SELECT product_id
        , YEAR(purchase_date) AS this_year
        , COUNT(DISTINCT order_id) AS this_year_cnt
    FROM Orders
    GROUP BY product_id, YEAR(purchase_date)
)

SELECT DISTINCT product_id
FROM(
    SELECT product_id
        , this_year
        , LEAD(this_year, 1) OVER(PARTITION BY product_id ORDER BY this_year) AS next_year
        , this_year_cnt
        , LEAD(this_year_cnt, 1) OVER(PARTITION BY product_id ORDER BY this_year) AS next_year_cnt
    FROM cnt
    ) A
WHERE this_year_cnt>= 3
AND next_year_cnt >= 3
AND next_year - this_year = 1
;
