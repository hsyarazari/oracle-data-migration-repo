{{config(materialized='view')}}

select * from {{ ref('sd_country_codes') }}