# Write your MySQL query statement below

-- id 

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY 1
;
