# Write your MySQL query statement below

-- account_id | day | balance
-- balance of each account, rolling sum 
-- order by account_id asc, day asc


SELECT account_id, day, SUM(amount) OVER(PARTITION BY account_id ORDER BY day) AS balance
FROM(
    SELECT account_id, day, CASE WHEN type = 'Deposit' THEN amount ELSE (0-amount) END AS amount
    FROM Transactions
) A
ORDER BY 1, 2
;
