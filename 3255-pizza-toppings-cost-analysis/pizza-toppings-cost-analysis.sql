# Write your MySQL query statement below

-- pizza | total_cost
-- Order: total cost  DESC, pizza ASC
-- Round 2

-- 1) combination
-- 2) concat, aggregation

SELECT CONCAT(a.topping_name, ',', b.topping_name, ',', c.topping_name) AS pizza
    , ROUND(a.cost + b.cost + c.cost, 2) AS total_cost
FROM Toppings a
JOIN Toppings b
ON a.topping_name <> b.topping_name
AND a.topping_name <= b.topping_name
JOIN Toppings c
ON a.topping_name <> c.topping_name
AND b.topping_name <> c.topping_name
AND b.topping_name <= c.topping_name
ORDER BY 2 DESC, 1
;

