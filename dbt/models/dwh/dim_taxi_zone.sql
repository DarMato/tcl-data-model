{{
    config(
     materialized='table'
    )
}}


select 
     taxi_zone_key as dim_taxi_zone_id
    , borough
    , zone
    , service_zone
    , getdate() as etl_created_at 
from  {{ ref('md_taxi_zone') }} as tz
