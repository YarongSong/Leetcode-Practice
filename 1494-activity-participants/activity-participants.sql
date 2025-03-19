# Write your MySQL query statement below
WITH cnt_each AS(
    SELECT DISTINCT a.id, a.name, COUNT(DISTINCT f.id) AS CNT
    FROM Activities a
    LEFT JOIN Friends f
    ON a.name = f.activity
    GROUP BY 1,2
), max_min AS(
    SELECT MAX(CNT) AS max_cnt, MIN(CNT) AS min_cnt
    FROM cnt_each
)
SELECT DISTINCT name AS activity
FROM cnt_each
WHERE CNT <> (SELECT max_cnt FROM max_min)
AND CNT <> (SELECT min_cnt FROM max_min)
;

