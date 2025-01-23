# Write your MySQL query statement below
# product_name | product_id | order_id | order_date 
SELECT product_name, product_id, order_id, order_date
FROM(
SELECT p.product_id
    , p.product_name
    , o.order_id
    , o.order_date
    , RANK() OVER(PARTITION BY p.product_id ORDER BY o.order_date DESC) AS RNK
FROM Products p
INNER JOIN Orders o
ON p.product_id = o.product_id
) a
WHERE RNK = 1
ORDER BY 1, 2, 3