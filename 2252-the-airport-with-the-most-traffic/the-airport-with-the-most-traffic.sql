# Write your MySQL query statement below

--  airport_id

WITH flights AS (
SELECT departure_airport AS airport, flights_count
FROM Flights

UNION ALL

SELECT arrival_airport AS airport, flights_count
FROM Flights
)

SELECT airport AS airport_id
FROM flights 
GROUP BY 1
HAVING SUM(IFNULL(flights_count,0)) >= (
    SELECT MAX(flights_count) 
    FROM(
        SELECT airport, SUM(IFNULL(flights_count,0)) AS flights_count 
        FROM flights 
        GROUP BY 1
        )A
        )
