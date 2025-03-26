# Write your MySQL query statement below

# user_id | mail | name

# 1) three or more consecutive contests
WITH cons_cont AS(
    SELECT DISTINCT user_id
    FROM(
        SELECT DISTINCT u.user_id, c.contest_id, LEAD(c.contest_id,2) OVER(PARTITION BY u.user_id ORDER BY c.contest_id) AS nxt_2_contest_id
        FROM Users u 
        INNER JOIN Contests c
        ON u.user_id = c.gold_medal
        OR u.user_id = c.silver_medal
        OR u.user_id = c.bronze_medal
    ) A
    WHERE nxt_2_contest_id - contest_id = 2
), 
# 2) three or more gold medals
    three_gold AS(
    SELECT DISTINCT gold_medal
    FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(DISTINCT contest_id) >= 3

)

SELECT name, mail
FROM Users
WHERE user_id IN (SELECT user_id FROM cons_cont)
OR user_id IN (SELECT gold_medal FROM three_gold)
;
