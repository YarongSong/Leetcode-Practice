# Write your MySQL query statement below

-- unique_id | name

SELECT b.unique_id, a.name
FROM Employees a
LEFT JOIN EmployeeUNI b
ON a.id = b.id
;

