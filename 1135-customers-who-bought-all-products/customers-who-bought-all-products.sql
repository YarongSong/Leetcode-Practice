# Write your MySQL query statement below

SELECT DISTINCT customer_id
FROM Customer 
WHERE product_key IN (SELECT product_key FROM Product)
GROUP BY 1
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
;