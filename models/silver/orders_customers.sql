{{
    config(
        unique_key='order_id',
        incremental_predicate = ["order_date >= dateadd(day,-30,order_date)"]
    )
}}
select o.order_id, c.customer_id, o.order_date, o.order_status, o.amount, 
c.name, c.kyc_status
 from {{ source('raw_cust', 'cust_order') }} as o
inner join {{ source('raw_cust', 'cust_master') }} as c
on o.customer_id = c.customer_id
{% if is_incremental %}
where order_date >= dateadd(day,-30,order_date)
and c.kyc_status = 'Verified'
{% endif %}