{{
    config(
     materialized='table'
    )
}}


select 
    payment_type_key::smallint as dim_payment_type_id
    ,payment_type_name::varchar(128)
    ,getdate()::timestamp as etl_created_at 
from  {{ ref('md_payment_type') }} as pt
