{{ config(materialized='table'
        ,transient=false
        ,alias='orders_dtl_glob_var'
        ,query_tag='dbt_model_gvar' 
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
  from from {{ source('raw_ord', 'RAW_ORDERS') }}
      -- local variables used in the filter clause  
where (order_id = {{lv_order_id}} 
       OR 
       -- global variables used in the filter clause 
       order_id = {{ var('g_orders_id') }}
      )