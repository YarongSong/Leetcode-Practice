# Write your MySQL query statement below

# account_id
# 1) Monthly income for each account
# 2) Check consecutive months
WITH cte AS(
    SELECT *
        , LEAD(monthly_income,1) OVER(PARTITION BY account_id ORDER BY yr,mo) AS nxt_monthly_income
        , LEAD(yr, 1) OVER(PARTITION BY account_id ORDER BY yr,mo) AS nxt_yr
        , LEAD(mo, 1) OVER(PARTITION BY account_id ORDER BY yr,mo) AS nxt_mo
    FROM(
        SELECT DISTINCT a.account_id
            , YEAR(day) AS yr
            , MONTH(day) AS mo
            , SUM(CASE WHEN type = 'Creditor' THEN amount ELSE 0 END) AS monthly_income
            , a.max_income
        FROM Transactions t
        INNER JOIN Accounts a
        ON t.account_id =  a.account_id
        GROUP BY 1,2,3
        ) A
)

SELECT DISTINCT account_id
FROM cte
WHERE monthly_income > max_income
AND nxt_monthly_income > max_income
AND (yr = nxt_yr AND nxt_mo - mo = 1)
OR (nxt_yr - yr = 1 AND mo = 12 AND nxt_mo = 1)
;
