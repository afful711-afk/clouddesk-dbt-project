select
    account_id,
    count(*) as user_count
from {{ ref('stg_users') }}
group by account_id