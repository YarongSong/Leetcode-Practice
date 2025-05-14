# Write your MySQL query statement below

-- week_of_month | membership  | total_amount
-- Order: week_of_month, membership ASC

-- convert the purchase_date to weekday (4)
-- All premium and VIP users, each Friday: total spend
-- no purchases at all

WITH RECURSIVE dates AS(
    -- Anchor query
    SELECT DATE('2023-11-01') AS Date_Nov

    UNION

    -- Recursive query
    SELECT DATE_ADD(Date_Nov, INTERVAL 1 DAY) AS Date_Nov
    FROM dates
    WHERE Date_Nov <= DATE('2023-11-29')
), friday AS(
    SELECT Date_Nov 
    FROM dates
    WHERE WEEKDAY(Date_Nov) = 4
), member AS(

    SELECT 'Premium' AS membership
    UNION 
    SELECT 'VIP' AS membership
)

SELECT FLOOR(DATEDIFF(a.Date_Nov , DATE('2023-11-01'))/7) + 1 AS week_of_month
    , d.membership
    , SUM(IFNULL(b.amount_spend,0)) AS total_amount
FROM friday a
CROSS JOIN member d
LEFT JOIN (
    SELECT A.*, B.membership 
    FROM Purchases A
    JOIN Users B
    ON A.user_id = B.user_id
    WHERE membership IN ('Premium', 'VIP')
    ) b
ON b.purchase_date = a.Date_Nov
AND d.membership = b.membership
-- LEFT JOIN (SELECT * FROM Users WHERE membership IN ('Premium', 'VIP')) c
-- ON b.user_id  = c.user_id
-- AND c.membership = d.membership
GROUP BY 1, 2
ORDER BY 1,2
;