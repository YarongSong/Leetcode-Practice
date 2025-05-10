# Write your MySQL query statement below

-- hashtag  | hashtag_count
-- Order: hashtag_count DESC, hashtag DESC

-- 1) 2024, 2
-- 2) Find the hashtag for each tweet
-- 3) aggregate
-- 4) RANK

SELECT hashtag, hashtag_count
FROM(
    SELECT hashtag, hashtag_count, RANK() OVER(ORDER BY hashtag_count DESC, hashtag DESC) AS RNK
    FROM(
        SELECT REGEXP_SUBSTR(tweet, '\#[a-zA-Z0-9]+') AS hashtag, COUNT(tweet_id) AS hashtag_count
        FROM Tweets
        WHERE YEAR(tweet_date) = 2024
        AND MONTH(tweet_date) = 2
        GROUP BY 1
        ) A
    ) B
WHERE RNK <= 3
ORDER BY 2 DESC, 1 DESC
;



