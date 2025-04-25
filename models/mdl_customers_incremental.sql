{{config(materialized='incremental',
         alias='stg_customers',
         unique_key='customer_id',
         transient=false
         )}}
select * from {{ source('raw_ord', 'RAW_CUSTOMERS') }}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where CREATED_AT > (select max(CREATED_AT) from {{ this }}) 
{% endif %}