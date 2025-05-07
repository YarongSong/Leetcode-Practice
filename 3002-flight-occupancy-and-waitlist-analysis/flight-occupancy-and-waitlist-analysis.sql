# Write your MySQL query statement below

-- flight_id | booked_cnt | waitlist_cnt
-- Order: flight_id ASC

-- 1) For each flight, get the total # of passengers 
-- 2) Compare the total # with capacity (case when)

SELECT flight_id
    , CASE WHEN capacity >= IFNULL(tot_cnt,0) THEN IFNULL(tot_cnt,0) ELSE capacity END AS booked_cnt
    , CASE WHEN capacity >= IFNULL(tot_cnt,0) THEN 0 ELSE IFNULL(tot_cnt,0) - capacity END AS waitlist_cnt
FROM(
    SELECT b.flight_id
        , b.capacity
        , COUNT(a.passenger_id) AS tot_cnt
    FROM Passengers a
    RIGHT JOIN Flights b
    ON a.flight_id = b.flight_id
    GROUP BY 1,2
) A
ORDER BY 1
;


