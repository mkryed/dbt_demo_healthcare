with organizations as (

    select * from {{ ref('stg_organizations') }}

),

final as (

    select
        --primary key
        organization_id,
        --strings
        organization_name,
        organization_type,
        organization_address,
        organization_city,
        organization_state,
        organization_country,
        organization_postal_code
    from organizations
)

select * from final
