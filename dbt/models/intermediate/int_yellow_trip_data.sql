{{
    config(
     materialized='table'
    )
}}


select 
    {{ dbt_utils.surrogate_key([
        'data_vendor_key'
        , 'pick_up_datetime'
        , 'drop_of_datetime'
        , 'passenger_count'
        , 'trip_distance_mi'
        , 'rate_code_key'
        , 'pick_up_location_key'
        , 'drop_off_location_key'
        , 'payment_type_key'
        , 'fare_amount'
        , 'extra_amount'
        , 'mta_tax_amount'
        , 'tip_amount'
        , 'tolls_amount'
        , 'improvement_surcharge_amount'
        , 'total_amount'
        , 'congestion_surcharge_amount'
        , 'airport_fee_amount'
    ]) }} as int_yellow_trip_data_id
    , data_vendor_key as dim_data_vendor_id
    , pick_up_datetime
    , drop_of_datetime
    , passenger_count
    , trip_distance_mi
    , rate_code_key as dim_rate_code_id
    , is_stored_and_fwd
    , pick_up_location_key as pick_up_dim_taxi_zones_id
    , drop_off_location_key as drop_off_dim_taxi_zones_id
    , payment_type_key as dim_payment_type_id
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
from  {{ ref("dl_tlc_data__yellow_tripdata") }} as yt
