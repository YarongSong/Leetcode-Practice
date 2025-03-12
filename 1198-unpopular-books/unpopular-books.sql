# Write your MySQL query statement below

SELECT b.book_id
    , b.name
FROM Books b
LEFT JOIN (SELECT * FROM Orders WHERE dispatch_date >= DATE_SUB("2019-06-23", INTERVAL 365 DAY))  o
ON b.book_id = o.book_id
# ON o.dispatch_date BETWEEN DATE_SUB("2019-06-23", INTERVAL 365 DAY) AND DATE("2019-06-23")
WHERE b.available_from < DATE_SUB("2019-06-23", INTERVAL 30 DAY)
GROUP BY 1,2
HAVING SUM(IFNULL(o.quantity, 0)) < 10
