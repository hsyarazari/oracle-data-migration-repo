select 
         order_id
        ,customer_id
        ,order_total
        ,order_timestamp
        ,user_name
        ,tags
  from {{ source('raw_ord', 'RAW_ORDERS') }}
  -- we can refer the sources from source.yml file instead of hardcoding the db,schema & table.
  -- 'raw_ord' is name of the source and 'orders' is object or table name
where order_id =2