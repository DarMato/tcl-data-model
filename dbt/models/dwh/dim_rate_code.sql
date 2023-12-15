{{
    config(
     materialized='table'
    )
}}


select 
    rate_code_key::smallint as dim_rate_code_id
    ,rate_code_name::varchar(128)
    ,getdate()::timestamp as etl_created_at 
from  {{ ref('md_rate_code') }} as rc
