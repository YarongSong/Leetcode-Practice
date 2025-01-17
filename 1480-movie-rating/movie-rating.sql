# Write your MySQL query statement below

(SELECT u.name AS results
FROM MovieRating m
INNER JOIN Users u
ON m.user_id = u. user_id
GROUP BY 1
ORDER BY COUNT(DISTINCT m.movie_id) DESC, name
LIMIT 1
)

UNION ALL

(SELECT title AS results
FROM MovieRating m1
INNER JOIN Movies m2
ON m1.movie_id = m2.movie_id
WHERE YEAR(created_at) = 2020
AND MONTH(created_at) = 2
GROUP BY 1
ORDER BY AVG(rating) DESC, title
LIMIT 1
)

