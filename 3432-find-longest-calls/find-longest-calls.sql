# Write your MySQL query statement below

-- first_name| type | duration_formatted
-- Order: type DESC, duration DESC, first_name DESC
-- HH:MM:SS


-- 1) join the tables to get first_name
-- 2) rank 
-- 3) convert min 


SELECT first_name
    , type
    , CAST(duration_formatted AS CHAR) AS duration_formatted
FROM(
    SELECT b.first_name
        , a.type
        , duration
        , SEC_TO_TIME(duration) AS duration_formatted
        , RANK() OVER(PARTITION BY type ORDER BY duration DESC, first_name DESC) AS RNK
    FROM Calls a
    JOIN Contacts b
    ON a.contact_id = b.id
) A
WHERE RNK <= 3
ORDER BY 2 DESC, duration DESC, 1 DESC
;