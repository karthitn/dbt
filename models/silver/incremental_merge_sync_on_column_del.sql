{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='order_id',
        query_tag='dbt',
        incremental_predicate=["order_date>= dateadd(day,-20,order_date)"],
        on_schema_change = 'sync_all_columns'
        
    )
}}
--on_schema_change = 'sync_all_columns' #by default it will be ignore we dont have declare explicitly
--on_schema_change = 'fail' it will fail the dbt model execution if there is change in table structure
select * from {{ source('raw_cust', 'cust_order_sync') }}
{% if is_incremental %}
where order_date >= dateadd(day,-20,order_date)
{% endif %}