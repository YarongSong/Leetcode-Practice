# Write your MySQL query statement below
SELECT player_id, player_name, SUM(CNT) AS grand_slams_count
FROM(
SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
FROM Players p
INNER JOIN Championships c
ON p.player_id = c.Wimbledon
GROUP BY 1,2

UNION ALL

SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
FROM Players p
INNER JOIN Championships c
ON p.player_id = c.Fr_open
GROUP BY 1,2

UNION ALL

SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
FROM Players p
INNER JOIN Championships c
ON p.player_id = c.US_open
GROUP BY 1,2

UNION ALL

SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
FROM Players p
INNER JOIN Championships c
ON p.player_id = c.Au_open
GROUP BY 1,2
) a
GROUP BY 1,2
;