# Write your MySQL query statement below

SELECT p.product_name, a.unit
FROM(
    SELECT o.product_id, SUM(o.unit) AS unit
    FROM Orders o
    WHERE YEAR(o.order_date) = 2020
    AND MONTH(o.order_date) = 2
    GROUP BY o.product_id
    HAVING SUM(o.unit) >= 100
) a 
INNER JOIN Products p 
ON a.product_id = p.product_id
