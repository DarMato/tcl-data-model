{{
    config(
     materialized='view',
     bind=False
    )
}}


select 
    vendorid::smallint as data_vendor_key
    ,tpep_pickup_datetime::timestamp pick_up_datetime
    ,tpep_dropoff_datetime::timestamp drop_of_datetime
    ,passenger_count::smallint as passenger_count
    ,trip_distance::decimal(8,2) trip_distance_mi
    ,ratecodeid::smallint as rate_code_key
    ,case store_and_fwd_flag
        when 'Y'
        then True
        when 'N'
        then False
    end::boolean is_stored_and_fwd
    ,pulocationid::smallint as pick_up_location_key
    ,dolocationid::smallint as drop_off_location_key
    ,payment_type::smallint as payment_type_key
    ,fare_amount::decimal(8,2) as fare_amount
    ,extra::decimal(8,2) as extra_amount
    ,mta_tax::decimal(8,2) as mta_tax_amount
    ,tip_amount::decimal(8,2) as tip_amount
    ,tolls_amount::decimal(8,2) tolls_amount
    ,improvement_surcharge::decimal(8,2) as improvement_surcharge_amount
    ,total_amount::decimal(8,2) as total_amount
    ,congestion_surcharge::decimal(8,2) as congestion_surcharge_amount
    ,airport_fee::decimal(8,2) as airport_fee_amount
from  {{ source('dl_tlc_data', 'yellow_tripdata') }} as yt
