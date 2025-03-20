# Write your MySQL query statement below
#  sale_date  | diff
SELECT sale_date, SUM(apple_num) - SUM(orange_num) AS diff
FROM(
    SELECT sale_date
          , CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END AS apple_num
          , CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END AS orange_num
    FROM Sales
    ) A
GROUP BY 1
ORDER BY 1
;