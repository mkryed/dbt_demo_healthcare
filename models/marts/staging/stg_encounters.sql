with src_encounters as (
    select * from {{ source('demo_healthcare', 'encounters_view')}}
),

final as (
    select
        -- primary key
        id as encounters_id,

        -- foreign key
        subject.patientId as patient_id,
        serviceProvider.organizationId as organization_id,
        diagnosis[SAFE_OFFSET(0)].condition.conditionId as condition_id,
        diagnosis[SAFE_OFFSET(0)].condition.procedureId as procedure_id,

        -- dates & timestamps
        period.start as started_at,
        period.end as ended_at

    from src_encounters
)

select * from final
