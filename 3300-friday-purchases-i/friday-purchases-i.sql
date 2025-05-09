# Write your MySQL query statement below

-- week_of_month | purchase_date | total_amount

-- 1) Each user, each Friday 2023-11, all spend
-- 2) aggregate to date
-- At least one purchase
-- Order week of month ASC

SELECT (WEEK(purchase_date) - WEEK(DATE('2023-11-01')) + 1) AS week_of_month
    , purchase_date
    , SUM(amount_spend) AS total_amount
FROM Purchases
WHERE WEEKDAY(purchase_date) = 4
GROUP BY 1,2
ORDER BY 1
;

