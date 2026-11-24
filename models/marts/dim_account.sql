{{ config(materialized='table') }}

select
    accounts.account_id,
    accounts.company_name,
    accounts.industry,
    accounts.region,
    coalesce(user_counts.user_count, 0) as user_count
from {{ ref('stg_accounts') }} as accounts
left join {{ ref('int_account_user_counts') }} as user_counts
    on accounts.account_id = user_counts.account_id