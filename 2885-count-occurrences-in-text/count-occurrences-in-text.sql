# Write your MySQL query statement below

-- word | count

SELECT 'bull' AS word
    , COUNT(file_name) AS count
FROM Files
WHERE content LIKE '% bull %'
GROUP BY 1

UNION

SELECT 'bear' AS word
    , COUNT(file_name) AS count
FROM Files
WHERE content LIKE '% bear %'
GROUP BY 1
;
