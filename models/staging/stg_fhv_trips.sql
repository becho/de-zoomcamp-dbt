{{
    config(
        materialized='view'
    )
}}

with tripdata as 
(
  select *
  from {{ source('staging','fhv_trips2') }}
)
select * from tripdata where substring(pickup_datetime,1, 4) = '2019'