# Write your MySQL query statement below

-- interval_no | total_orders
-- Order: interval_no ASC

SELECT CEIL(minute/6) AS interval_no
    , SUM(order_count) AS total_orders
FROM Orders
GROUP BY 1
ORDER BY 1
;


