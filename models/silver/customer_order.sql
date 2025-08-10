
select * from {{ source('raw_cust', 'cust_order') }}
{% if is_incremental %}
where order_id > ( select max(order_id) from {{this}} )
{% endif %}