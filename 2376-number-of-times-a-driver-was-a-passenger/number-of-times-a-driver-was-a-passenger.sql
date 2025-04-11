# Write your MySQL query statement below

-- driver_id | cnt
-- No order

SELECT r1.driver_id, COUNT(DISTINCT r2.ride_id) AS cnt
FROM Rides r1
LEFT JOIN Rides r2
ON r1.driver_id = r2.passenger_id
GROUP BY r1.driver_id
;
