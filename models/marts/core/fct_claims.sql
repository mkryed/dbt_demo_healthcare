with claims as (

    select * from {{ ref('stg_claims') }}

),

conditions as (

    select * from {{ ref('stg_conditions') }}

),

procedures as (

    select * from {{ ref('stg_procedures') }}

),

final as (

    select
        -- primary key
        claims.claim_id,

        -- foreign keys
        claims.organization_id,
        claims.encounter_id,
        claims.condition_id,
        claims.medication_request_id,
        claims.patient_id,
        claims.procedure_id,

        -- dimensions
        conditions.condition_type,
        procedures.procedure_code,
        claims.claim_status,

        -- measures
       claims.claim_total_value,
        timestamp_diff(claims.billable_period_ended_at, claims.billable_period_started_at, minute) as billable_period_duration_minutes,

        -- timestamps
        claims.billable_period_started_at,
        claims.billable_period_ended_at

    from claims
    left join conditions
        on claims.condition_id = conditions.condition_id
    left join procedures
        on claims.procedure_id = procedures.procedure_id

)

select * from final
