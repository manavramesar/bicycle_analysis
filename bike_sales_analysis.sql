SELECT * FROM citibike_2023;

SELECT max(ended_at) 
FROM citibike_2023;

SELECT member_casual, AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS avg_duration
FROM citibike_2023
GROUP BY member_casual;

-- Popular Start Station --

SELECT start_station_name, count(*)
FROM citibike_2023
group by 1
ORDER BY 2 DESC
LIMIT 5;

-- Popular End Station --

SELECT end_station_name, count(*)
FROM citibike_2023
group by 1
ORDER BY 2 DESC
LIMIT 5;

-- Longest Trip --
SELECT ride_id, MAX(TIMESTAMPDIFF(MINUTE, started_at, ended_at)) AS max_duration
FROM citibike_2023
GROUP BY ride_id
ORDER BY 2 DESC
LIMIT 1;


SELECT HOUR(started_at) AS hour_of_day, COUNT(*) AS ride_count
FROM citibike_2023
GROUP BY HOUR(started_at)
ORDER BY ride_count DESC;


