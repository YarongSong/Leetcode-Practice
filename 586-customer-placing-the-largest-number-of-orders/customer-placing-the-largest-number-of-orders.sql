# Write your MySQL query statement below

SELECT DISTINCT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(DISTINCT order_number) DESC
LIMIT 1
;


