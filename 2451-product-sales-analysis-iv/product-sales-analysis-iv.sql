# Write your MySQL query statement below
-- user_id | product_id

-- 1) for each user, each product, total spend
-- 2) the most spend (rank)
-- 3) no order

WITH total AS(
    SELECT s.user_id, s.product_id, SUM(IFNULL(s.quantity * p. price,0)) AS tot
    FROM Sales s
    INNER JOIN Product p
    ON s.product_id = p.product_id
    GROUP BY 1,2
)

SELECT user_id, product_id
FROM(
    SELECT user_id, product_id, RANK() OVER(PARTITION BY user_id ORDER BY tot DESC) AS RNK
    FROM total
) A
WHERE RNK = 1
;