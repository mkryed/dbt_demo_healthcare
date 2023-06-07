with organizations as (

    select * from {{ source('demo_healthcare', 'organizations_view') }}

),

final as (

    select
        --primary key
        id as organization_id,
        --strings
        name as organization_name,
        type[SAFE_OFFSET(0)].text as organization_type,
        address[SAFE_OFFSET(0)].line as organization_address,
        address[SAFE_OFFSET(0)].city as organization_city,
        address[SAFE_OFFSET(0)].state as organization_state,
        address[SAFE_OFFSET(0)].country as organization_country,
        address[SAFE_OFFSET(0)].postalcode as organization_postal_code
    from organizations
)

select * from final
