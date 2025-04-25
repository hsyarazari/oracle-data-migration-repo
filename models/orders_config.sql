{{ config(materialized='view',
         alias='orders_dtl_tbl',
         query_tag='dbt_model' )}}
select *
  from {{ source('raw_ord', 'RAW_ORDERS') }}
--where order_id =2