with src_encounters as (
    select * from {{ source('demo_healthcare', 'encounters_view')}}
),

final as (
    select
        -- primary key
        id as encounter_id,

        -- foreign key
        subject.patientId as patient_id,
        serviceProvider.organizationId as organization_id,

        -- dates & timestamps
        timestamp(period.start) as encounter_started_at,
        timestamp(period.end) as encounter_ended_at

    from src_encounters
)

select * from final
