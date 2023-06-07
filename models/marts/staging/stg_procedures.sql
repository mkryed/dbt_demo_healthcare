with src_procedures as (
    select * from {{ source('demo_healthcare', 'procedures_view') }}
), 

final as (
    select 
        -- primary key
        id as procedure_id,

        -- foreign keys 
        context.encounterId as encounter_id,
        reasonReference[SAFE_OFFSET(0)].conditionId as condition_id,
        subject.patientId as patient_id,

        -- timestamps
        performed.period.start as procedure_started_at,
        performed.period.end as procedure_ended_at,

        -- dimensions
        code.text as procedure_code

    from src_procedures 
) 

select * from final
