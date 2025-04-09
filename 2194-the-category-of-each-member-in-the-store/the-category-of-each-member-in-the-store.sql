# Write your MySQL query statement below
-- member_id | name | category

-- 1) total number of purchases
-- 2) total number of visits 
-- 3) * 100
-- 4) No order



SELECT a.member_id, a.name,  
        CASE WHEN COUNT(DISTINCT c.visit_id)/IFNULL(COUNT(DISTINCT b.visit_id), 1) * 100  >= 80 THEN 'Diamond'
             WHEN COUNT(DISTINCT c.visit_id)/IFNULL(COUNT(DISTINCT b.visit_id), 1) * 100  >= 50 THEN 'Gold'
             WHEN COUNT(DISTINCT c.visit_id)/IFNULL(COUNT(DISTINCT b.visit_id), 1) * 100 < 50 AND COUNT(DISTINCT b.visit_id) > 0 THEN 'Silver'
             ELSE 'Bronze' END AS category
FROM Members a
LEFT JOIN Visits b
ON a.member_id = b.member_id
LEFT JOIN Purchases c
ON b.visit_id = c.visit_id
GROUP BY 1,2
;
