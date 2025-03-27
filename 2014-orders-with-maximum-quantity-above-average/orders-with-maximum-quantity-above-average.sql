# Write your MySQL query statement below

# order_id

# 1) For each order, maximum quantity, average quantity
# 2) find the imbalanced orders

WITH cte AS(
    SELECT order_id
        , MAX(quantity) AS MAX_QTY
        , SUM(quantity)/IFNULL(COUNT(product_id),1) AS AVG_QTY
    FROM OrdersDetails
    GROUP BY 1
)

SELECT DISTINCT order_id
FROM cte
WHERE MAX_QTY > (SELECT MAX(AVG_QTY) FROM cte)
;