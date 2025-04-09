# Write your MySQL query statement below

-- bus_id | passengers_cnt
-- Order by bus_id asc
-- 1) For each bus, all the passengers that arrive at or prior to it's arrival time
-- 2) For each passenger, pick the earliest bus
-- 3) map back to bus and count passengers

WITH bus_pass AS(
    SELECT a.bus_id, a.arrival_time, b.passenger_id
    FROM Buses a
    LEFT JOIN Passengers b
    ON a.arrival_time >= b.arrival_time
), pass AS(
    SELECT DISTINCT passenger_id, bus_id
    FROM(
        SELECT DISTINCT passenger_id, bus_id, RANK() OVER(PARTITION BY passenger_id ORDER BY arrival_time) AS RNK
        FROM bus_pass
        WHERE passenger_id IS NOT NULL
    ) A
    WHERE RNK = 1
)

SELECT a.bus_id, COUNT(DISTINCT b.passenger_id) AS passengers_cnt
FROM Buses a 
LEFT JOIN pass b
ON a.bus_id = b.bus_id
GROUP BY a.bus_id
ORDER BY 1
;
