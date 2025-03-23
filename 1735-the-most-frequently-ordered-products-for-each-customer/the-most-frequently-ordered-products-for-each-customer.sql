# Write your MySQL query statement below
# customer_id | product_id | product_name

SELECT DISTINCT customer_id, product_id, product_name
FROM(
SELECT DISTINCT c.customer_id
        , o.product_id
        , p.product_name
        #, COUNT(DISTINCT o.order_id) AS times
        , RANK() OVER(PARTITION BY c.customer_id ORDER BY COUNT(DISTINCT o.order_id) DESC) AS RNK
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p
ON o.product_id = p.product_id
GROUP BY 1,2,3
) A
WHERE RNK = 1
;
