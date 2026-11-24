select
    trim(account_id) as account_id,
    trim(company_name) as company_name,
    nullif(trim(industry), '') as industry,
    trim(region) as region
from {{ source('clouddesk', 'accounts') }}