{% snapshot new_supply_chain_orders_scd2%}


select * from {{ source('raw_cust', 'SUPPLY_CHAIN_ORDERS') }}

{% endsnapshot %}