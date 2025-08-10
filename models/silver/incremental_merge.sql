{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='order_id',
        query_tag='dbt',
        incremental_predicate=["order_date>= dateadd(day,-20,order_date)"]
    )
}}
select * from {{ source('raw_cust', 'cust_order') }}
{% if is_incremental %}
where order_date >= dateadd(day,-20,order_date)
{% endif %}