SELECT * FROM citibike_2023;

-- Cleaning --
SELECT trim(start_station_name), trim(end_station_name)
FROM citibike_2023;


-- all rides --
SELECT count(*) as "Number Of Rides"
FROM citibike_2023;

-- lastest ride --
SELECT max(ended_at) 
FROM citibike_2023;

-- Ride Time Of Memebers--
SELECT member_casual, ROUND(AVG(TIMESTAMPDIFF(MINUTE, started_at, ended_at)),2) as "Average Duration Of Rides"
FROM citibike_2023
GROUP BY member_casual;

-- Popular Start Station --

SELECT start_station_name as "Start Station", count(*) as "Number Of Rides"
FROM citibike_2023
group by 1
ORDER BY 2 DESC
LIMIT 1;

-- Popular End Station --

SELECT end_station_name as "End Station", count(*) as "Number Of Rides"
FROM citibike_2023
group by 1
ORDER BY 2 DESC
LIMIT 1;

-- Longest Trip --
SELECT ride_id, MAX(TIMESTAMPDIFF(HOUR, started_at, ended_at)) AS max_duration
FROM citibike_2023
GROUP BY ride_id
ORDER BY 2 DESC
LIMIT 1;

-- Ride Time --
SELECT HOUR(started_at) AS hour_of_day, COUNT(*) AS ride_count
FROM citibike_2023
GROUP BY HOUR(started_at)
ORDER BY ride_count DESC;

-- Memeberships--

SELECT member_casual, COUNT(member_casual) as no_of_members
FROM citibike_2023
GROUP BY 1;

-- rideable type--

SELECT rideable_type, COUNT(rideable_type) as no
FROM citibike_2023
GROUP BY 1;

-- Common Routes--
SELECT start_station_name, end_station_name, COUNT(*) AS ride_count
FROM citibike_2023
WHERE start_station_name IS NOT NULL AND end_station_name IS NOT NULL
GROUP BY 1,2
ORDER BY ride_count DESC
LIMIT 5;



