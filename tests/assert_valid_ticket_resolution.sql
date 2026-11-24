
-- Business rule:
-- A ticket cannot have a negative resolution time.
-- Failure consequence: Invalid records would distort
-- average ticket resolution times and support KPIs.

select
    ticket_id,
    account_id,
    resolution_minutes
from {{ ref('fct_tickets') }}
where resolution_minutes < 0