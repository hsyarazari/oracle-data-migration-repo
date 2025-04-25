{{
    config(
        materialized='table',
        database='DBT_DB',
        schema='DBT_SC',
        transient=false,
        alias='dbt_stg_orders'

    )
}}
select *
  from {{ source('raw_ord', 'RAW_ORDERS') }}

	