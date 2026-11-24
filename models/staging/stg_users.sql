select
    trim(user_id) as user_id,
    trim(account_id) as account_id,
    trim(email) as email,
    lower(trim(role)) as user_role,
    cast(nullif(trim(created_at), '') as date) as created_at,
    cast(nullif(trim(last_login), '') as timestamp) as last_login,
    cast(nullif(trim(updated_at), '') as timestamp) as updated_at
from {{ source('clouddesk', 'users') }}