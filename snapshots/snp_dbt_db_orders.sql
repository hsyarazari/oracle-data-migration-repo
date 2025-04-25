{% snapshot dbt_db_orders %}
    {{
        config(
            target_schema='DBT_SC',
            target_database='DBT_DB',
            unique_key='order_id',
            strategy='check',
            check_cols=['status'],
            alias='dbt_db_stg_orders'
        )
    }}

    select * from {{ source('raw_ord', 'RAW_ORDERS') }}
 {% endsnapshot %}