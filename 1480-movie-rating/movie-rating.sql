# Write your MySQL query statement below
-- results
-- 1) 1 user name: greatest number of movies, order by name 
-- 2) 1 movie name: highest average rating in February 2020

(
SELECT b.name AS results
FROM MovieRating a
JOIN Users b
ON a.user_id = b.user_id
GROUP BY a.user_id, b.name
ORDER BY COUNT(a.movie_id) DESC, b.name
LIMIT 1
)
UNION ALL
(
SELECT b.title AS results
FROM MovieRating a
JOIN Movies b
ON a.movie_id = b.movie_id
WHERE YEAR(a.created_at) = 2020 AND MONTH(a.created_at) = 2
GROUP BY a.movie_id, b.title
ORDER BY AVG(a.rating) DESC, b.title
LIMIT 1
)
