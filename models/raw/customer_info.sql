{{
    config(
        materialized='table',
        database = 'DBT_OUTPUT',
        schema = 'DBT_SCHEMA'
    )
}}
select * from {{ source('raw_cust', 'cust') }}