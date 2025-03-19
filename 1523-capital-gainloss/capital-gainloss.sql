# Write your MySQL query statement below

# stock_name | capital_gain_loss
SELECT stock_name, SUM(gain) AS capital_gain_loss
FROM(
    SELECT stock_name
        , CASE WHEN operation = 'Buy' THEN (0 - price) ELSE price END gain
    FROM Stocks
) S
GROUP BY 1
;

