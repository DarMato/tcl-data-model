{{
    config(
     materialized='table'
    )
}}


select 
    data_vendor_key::smallint as dim_data_vendor_id
    ,vendor_name::varchar(128)
    ,getdate()::timestamp as etl_created_at 
from  {{ ref('md_data_vendor') }} as pt
