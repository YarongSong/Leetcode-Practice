# Write your MySQL query statement below

-- week_of_month | membership  | total_amount

-- 1) Each friday; Premium, VIP
-- 2) friday, week of month
-- 3) Premium, VIP
-- 4) join Purchases & Users
-- 5) aggregation
-- 6) order: week of the month ASC, membership ASC

WITH RECURSIVE days AS(
    SELECT DATE('2023-11-01') AS EACH_DAY

    UNION

    SELECT DATE_ADD(EACH_DAY, INTERVAL 1 DAY) AS EACH_DAY
    FROM days
    WHERE EACH_DAY <= DATE('2023-11-29')
), friday AS(
    SELECT EACH_DAY, week_of_month
    FROM(
        SELECT EACH_DAY
            , FLOOR((EACH_DAY - DATE('2023-11-01'))/7) + 1 AS week_of_month
        FROM days
    ) A
    WHERE DAYOFWEEK(EACH_DAY) = 6
), mem AS(
    SELECT 'Premium' AS membership
    UNION
    SELECT 'VIP' AS membership
), purchase AS(
    SELECT a.user_id, a.purchase_date, a.amount_spend, b.membership
    FROM Purchases a
    JOIN Users b
    ON a.user_id = b.user_id
    WHERE DAYOFWEEK(a.purchase_date) = 6
    AND b.membership IN ('Premium', 'VIP')
)

SELECT a.week_of_month
    , b.membership
    , SUM(IFNULL(c.amount_spend,0)) AS total_amount
FROM friday a
CROSS JOIN mem b
LEFT JOIN purchase c
ON a.EACH_DAY = c.purchase_date
AND b.membership = c.membership
GROUP BY 1,2
ORDER BY 1,2
;

