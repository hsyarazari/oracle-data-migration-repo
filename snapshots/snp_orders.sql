{% snapshot snapshot_name %}
    {{
        config(
            target_schema='DBT_SC',
            target_database='DBT_DB',
            unique_key='order_id',
            strategy='check',
            check_cols=['status'],
            alias='snp_raw_data_tbl'
        )
    }}  
    select * from {{ source('raw_ord', 'RAW_ORDERS') }}
 {% endsnapshot %}