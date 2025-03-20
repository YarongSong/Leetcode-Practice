# Write your MySQL query statement below
SELECT DISTINCT A.id, B.name
FROM(
SELECT DISTINCT id
            , login_date
            , LEAD(login_date, 1) OVER(PARTITION BY id ORDER BY login_date) AS login_date_2
            , LEAD(login_date, 2) OVER(PARTITION BY id ORDER BY login_date) AS login_date_3
            , LEAD(login_date, 3) OVER(PARTITION BY id ORDER BY login_date) AS login_date_4
            , LEAD(login_date, 4) OVER(PARTITION BY id ORDER BY login_date) AS login_date_5
FROM (SELECT DISTINCT id, login_date FROM Logins) a
) A
LEFT JOIN Accounts B
ON A.id = B.id
WHERE DATEDIFF(login_date_5, login_date) = 4
ORDER BY 1
;
