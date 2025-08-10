{% snapshot customer_scd2_check_hard_delete %}
{{
    config(
        target_database = 'DBT_OUTPUT',
        target_schema = 'SILVER_SCH',
        unique_key = 'customer_id',
        strategy = 'check',
        check_cols = ['spend','email'],
        hard_deletes = 'new_record'
    )
}}
select * from {{ source('raw_cust', 'CUSTOMERS_SCD_SRC') }}
{% endsnapshot %}