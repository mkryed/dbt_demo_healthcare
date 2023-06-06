with organizations as (

    select * from {{ source('demo_healthcare', 'organizations_view') }}

),

final as (

select
    --primary key
    id as organization_id,
    --strings
    name as organization_name,
    type.text as organization_type,
    address.line as organization_address,
    address.city,
    address.state,
    address.country,
    address.postalcode
from organizations
cross join unnest(organizations.type) as type
cross join unnest(organizations.address) as address
)

select * from final
