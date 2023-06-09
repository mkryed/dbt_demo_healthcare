with claims as (

    select * from {{ ref('stg_claims') }}

),

final as (

    select
        -- primary key
        claim_id,

        -- foreign keys
        organization_id,
        encounter_id,
        condition_id,
        medication_request_id,
        patient_id,
        procedure_id,

        -- dimensions
        claim_status,

        -- measures
        claim_total_value,
        timestamp_diff(billable_period_ended_at,billable_period_started_at, minute) as billable_period_duration_minutes,

        -- timestamps
        billable_period_started_at,
        billable_period_ended_at

    from claims

)

select * from final
