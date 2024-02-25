{{
    config(
        materialized='table'
    )
}}

with fhv_tripdata as (
    select *
    from {{ ref('stg_fhv_trips') }}
),
dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
) 
select fhv.*,
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone,

from fhv_tripdata fhv
inner join dim_zones pickup_zone
on {{ dbt.safe_cast("PUlocationID", api.Column.translate_type("integer")) }} = pickup_zone.locationid 
inner join dim_zones dropoff_zone
on {{ dbt.safe_cast("DOlocationID", api.Column.translate_type("integer")) }} = dropoff_zone.locationid 