# Write your MySQL query statement below

-- immediate_percentage
-- 2 decimal (after * 100%)

-- 1) first orders of all customers
-- 2) immediate orders

WITH first AS(
    SELECT DISTINCT customer_id
        , order_date
        , customer_pref_delivery_date
    FROM(
            SELECT DISTINCT customer_id
                , order_date
                , customer_pref_delivery_date
                , RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS RNK
            FROM Delivery
    ) A
    WHERE RNK = 1
)

SELECT ROUND((SELECT COUNT(*) FROM first WHERE order_date = customer_pref_delivery_date)/IFNULL((SELECT COUNT(*) FROM first),1) * 100, 2) AS immediate_percentage
;