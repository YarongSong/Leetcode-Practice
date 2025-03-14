# Write your MySQL query statement below

# month| country| approved_count| approved_amount| chargeback_count|chargeback_amount

SELECT month
    , country
    , SUM(IFNULL(approved_count,0)) AS approved_count
    , SUM(IFNULL(approved_amount,0)) AS approved_amount
    , SUM(IFNULL(chargeback_count,0)) AS chargeback_count
    , SUM(IFNULL(chargeback_amount,0)) AS chargeback_amount
FROM(
    SELECT SUBSTRING(trans_date, 1,7) AS month
            , country
            , COUNT(DISTINCT CASE WHEN state = 'approved' THEN id END) AS approved_count
            , SUM(CASE WHEN state = 'approved' THEN IFNULL(amount,0) END) AS approved_amount
            , 0 AS chargeback_count
            , 0 AS chargeback_amount
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY 1,2

    UNION 

    SELECT DISTINCT SUBSTRING(a.trans_date, 1,7) AS month
            , b.country
            , 0 AS approved_count
            , 0 AS approved_amount
            , COUNT(DISTINCT a.trans_id) AS chargeback_count
            , SUM(IFNULL(b.amount,0)) AS chargeback_amount
    FROM Chargebacks a
    INNER JOIN Transactions b
    ON b.id = a.trans_id
    # WHERE b.state = 'approved'
    GROUP BY 1,2  
) U
GROUP BY 1,2