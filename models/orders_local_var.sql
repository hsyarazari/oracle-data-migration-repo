{{ config(materialized='table'
        ,transient=false
        ,alias='orders_dtl_var'
        ,query_tag='dbt_model' 
        )
}}
-- local variable declaration & value assignment
{% set lv_order_id=2 %}

select 
         order_id
        ,customer_id
        ,order_total
        ,order_timestamp
        ,user_name
        ,tags
   from {{ source('raw_ord', 'RAW_ORDERS') }}
where order_id = {{lv_order_id}}