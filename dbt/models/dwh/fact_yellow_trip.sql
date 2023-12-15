{{
    config(
     materialized='table'
    )
}}


select 
    int_yellow_trip_data_id as fact_yellow_trip_id
    , dim_data_vendor_id
    , pick_up_datetime
    , drop_of_datetime
    , passenger_count
    , trip_distance_mi
    , dim_rate_code_id
    , is_stored_and_fwd
    , pick_up_dim_taxi_zones_id
    , drop_off_dim_taxi_zones_id
    , dim_payment_type_id
    , fare_amount
    , extra_amount
    , mta_tax_amount
    , tip_amount
    , tolls_amount
    , improvement_surcharge_amount
    , total_amount
    , congestion_surcharge_amount
    , airport_fee_amount
    , getdate() as etl_created_at
from  {{ ref("int_yellow_trip_data") }} as yt
