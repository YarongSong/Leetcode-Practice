# Write your MySQL query statement below

-- order_id | customer_id | order_type

-- 1) if a customer has type 0, only report 0 order
-- 2) no type 0, report all
-- 3) No order

WITH cus_0 AS(
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE order_type = 0
)

SELECT *
FROM Orders
WHERE customer_id IN (SELECT customer_id FROM cus_0)
AND order_type = 0

UNION

SELECT *
FROM Orders
WHERE customer_id NOT IN (SELECT customer_id FROM cus_0)
;
