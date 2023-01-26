CREATE TABLE divvy_trips (
    ride_id INT PRIMARY KEY,
    rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id INT,
    end_station_name VARCHAR(255),
    end_station_id INT,
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual VARCHAR(255)
);