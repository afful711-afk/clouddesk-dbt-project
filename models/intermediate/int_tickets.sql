
select
    ticket_id,
    account_id,
    ticket_status,
    opened_at,
    closed_at,
    timestamp_diff(closed_at, opened_at, minute) as resolution_minutes
from {{ ref('stg_tickets') }}
