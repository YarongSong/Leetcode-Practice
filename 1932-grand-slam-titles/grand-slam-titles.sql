
SELECT p.player_id
    , p.player_name
    , SUM((CASE WHEN c.Wimbledon = p.player_id THEN 1 ELSE 0 END) + (CASE WHEN c.Fr_open = p.player_id THEN 1 ELSE 0 END) + (CASE WHEN c.US_open = p.player_id THEN 1 ELSE 0 END) + (CASE WHEN c.AU_open = p.player_id THEN 1 ELSE 0 END)) AS grand_slams_count
FROM Championships c
INNER JOIN Players p
ON c.Wimbledon = p.player_id
OR c.Fr_open = p.player_id
OR c.US_open = p.player_id
OR c.Au_open = p.player_id
GROUP BY 1,2
;













-- # Write your MySQL query statement below
-- SELECT player_id, player_name, SUM(CNT) AS grand_slams_count
-- FROM(
-- SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
-- FROM Players p
-- INNER JOIN Championships c
-- ON p.player_id = c.Wimbledon
-- GROUP BY 1,2

-- UNION ALL

-- SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
-- FROM Players p
-- INNER JOIN Championships c
-- ON p.player_id = c.Fr_open
-- GROUP BY 1,2

-- UNION ALL

-- SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
-- FROM Players p
-- INNER JOIN Championships c
-- ON p.player_id = c.US_open
-- GROUP BY 1,2

-- UNION ALL

-- SELECT p.player_id, p.player_name, COUNT(DISTINCT c.year) AS CNT
-- FROM Players p
-- INNER JOIN Championships c
-- ON p.player_id = c.Au_open
-- GROUP BY 1,2
-- ) a
-- GROUP BY 1,2
-- ;