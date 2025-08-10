{% snapshot supply_chain_orders_snapshot_key_based_hard_delete %}
select * from {{ source('raw_cust', 'SUPPLY_CHAIN_ORDERS') }}
{% endsnapshot %}