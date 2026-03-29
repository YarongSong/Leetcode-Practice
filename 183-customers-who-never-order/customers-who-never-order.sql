# Write your MySQL query statement below
-- Customers

SELECT a.name AS Customers
FROM Customers a
WHERE a.id NOT IN (
    SELECT DISTINCT customerId 
    FROM Orders
    )
    