{{ config(materialized='view') }}

select
    -- identifiers
    {{ dbt_utils.surrogate_key(['rideid', 'started_at']) }} as trip_id,
    cast(rideid as integer) as ride_id,
    cast(start_station_id as integer) as start_station_id,
    cast(end_station_id as integer) as end_station_id,

    -- timestamps
    cast(started_at as timestamp) as started_at,
    cast(ended_at as timestamp) as ended_at,

    -- trip info
    cast(start_station_name as string) as start_station_name,
    cast(start_lat as numeric) as start_lat,
    cast(start_lng as numeric) as start_lng,
    cast(end_station_name as string) as end_station_name,
    cast(end_lat as numeric) as end_lat,
    cast(end_lng as numeric) as end_lng,

    -- customer info
    cast(member_casual as string) as member_casual,
    cast(rideable_type as string) as rideable_type,
    

from {{ source('staging','divvybike_tripdata') }}
where rideid is not null

-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}