# Write your MySQL query statement below

SELECT DISTINCT(a.account_id) AS account_id
FROM LogInfo a
LEFT JOIN LogInfo b
ON a.account_id = b.account_id
AND (a.login <= b.login AND a.logout >= b.login)
WHERE a.ip_address <> b.ip_address
;