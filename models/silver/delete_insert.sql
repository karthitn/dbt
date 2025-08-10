{{
    config(
        unique_key='order_id',
        query_tag='dbt',
    )
}}
select * from {{ source('raw_cust', 'cust_order') }}
{% if is_incremental %}
where order_date >= dateadd(day,-20,order_date)
{% endif %}