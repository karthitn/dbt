{% snapshot customer_scd2_time_hard_delete %}
{{
    config(
        target_database = 'DBT_OUTPUT',
        target_schema = 'SILVER_SCH',
        unique_key = 'customer_id',
        strategy = 'timestamp',
        updated_at = 'UPDATE_AT',
        hard_deletes = 'invalidate'
    )
}}
select * from {{ source('raw_cust', 'CUSTOMERS_SCD_SRC') }}
{% endsnapshot %}