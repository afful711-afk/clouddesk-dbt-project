{{ config(materialized='table') }}

select
    ticket_id,
    account_id,
    ticket_status,
    opened_at,
    closed_at,
    resolution_minutes
from {{ ref('int_tickets') }}