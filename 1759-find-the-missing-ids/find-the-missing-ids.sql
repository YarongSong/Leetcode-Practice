# Write your MySQL query statement below

-- WITH RECURSIVE cte_name (column1, column2, ...) AS (
--     -- Anchor query
--     SELECT ...

--     UNION ALL

--     -- Recursive query (must reference cte_name)
--     SELECT ...
--     FROM cte_name
--     WHERE ...
-- )
-- SELECT * FROM cte_name;




# ids
WITH RECURSIVE id_seq AS (
    -- Anchor Query: base case
    SELECT 1 as continued_id
    UNION 
    -- Recursive query
    SELECT continued_id + 1
    FROM id_seq
    WHERE continued_id < (SELECT MAX(customer_id) FROM Customers) 
)

SELECT continued_id AS ids
FROM id_seq
WHERE continued_id NOT IN (SELECT customer_id FROM Customers) 
;



























-- WITH cte AS(
--     SELECT DISTINCT customer_id, ROW_NUMBER() OVER(ORDER BY customer_id) AS RNK
--     FROM Customers
-- ), cte2 AS(
--     SELECT MAX(customer_id) + 1 AS ids
--     FROM cte
--     GROUP BY (customer_id - RNK)
--     HAVING (MAX(customer_id) + 1) < (SELECT MAX(customer_id) FROM Customers)

--     UNION 

--     SELECT MIN(customer_id) - 1 AS ids
--     FROM cte
--     GROUP BY (customer_id - RNK)
--     HAVING MIN(customer_id) - 1 >= 1
-- )

-- SELECT DISTINCT ids
-- FROM cte2
-- ORDER BY 1
-- ;


