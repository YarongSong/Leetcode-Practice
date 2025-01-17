# Write your MySQL query statement below
DELETE FROM Person
WHERE id NOT in (
    SELECT id
    FROM(
        SELECT email, MIN(id) AS id
        FROM Person
        GROUP BY email
    )a
)