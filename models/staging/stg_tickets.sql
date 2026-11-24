
select
    trim(ticket_id) as ticket_id,
    trim(account_id) as account_id,
    lower(trim(status)) as ticket_status,
    cast(nullif(trim(opened_at), '') as timestamp) as opened_at,
    cast(nullif(trim(closed_at), '') as timestamp) as closed_at
from {{ source('clouddesk', 'tickets') }}

