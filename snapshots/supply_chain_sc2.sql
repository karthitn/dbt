{% snapshot supply_chain_orders_scd2 %}
{{
    config(
        database = 'DBT_OUTPUT',
        target_schema = 'SILVER_SCH',
        unique_key = 'order_id',
        strategy = 'timestamp',
        updated_at = 'UPDATED_AT',
        query_tag = 'dbt'
    )
}}

select * from {{ source('raw_cust', 'SUPPLY_CHAIN_ORDERS') }}

{% endsnapshot %}