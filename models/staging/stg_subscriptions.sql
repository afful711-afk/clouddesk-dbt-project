select
    trim(subscription_id) as subscription_id,
    trim(account_id) as account_id,
    lower(trim(plan)) as plan,
    cast(nullif(trim(seats), '') as int64) as seats,
    cast(nullif(trim(mrr), '') as numeric) as mrr,
    lower(trim(status)) as subscription_status,
    cast(nullif(trim(started_at), '') as date) as started_at,
    cast(nullif(trim(updated_at), '') as timestamp) as updated_at
from {{ source('clouddesk', 'subscriptions') }}