# Write your MySQL query statement below

-- hashtag | hashtag_count
-- 1) find the hashtag for each tweet
-- 2) group by tweet, count
-- 3) rank top3
-- 4) order: count of hashtag DESC, hashtag DESC

SELECT hashtag
    , hashtag_count
FROM(
    SELECT hashtag
        , hashtag_count
        , RANK() OVER(ORDER BY hashtag_count DESC, hashtag DESC) AS RNK
    FROM(
        SELECT REGEXP_SUBSTR(tweet, '\#[a-zA-Z0-9]+') AS hashtag
            , COUNT(tweet_id) AS hashtag_count
        FROM Tweets
        GROUP BY 1
        ) A
    ) B
WHERE RNK <= 3
ORDER BY hashtag_count DESC, hashtag DESC
;
