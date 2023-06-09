with procedures as (

    select * from {{ ref('stg_procedures') }}

),

encounters as (

    select * from {{ ref('stg_encounters') }}

),

final as (

    select
        -- primary key
        {{ dbt_utils.generate_surrogate_key(
            ['encounters.encounter_id', 'procedures.procedure_id']
        ) }} as hospital_sk,

        -- foreign key
        procedures.procedure_id,
        procedures.condition_id,
        encounters.encounter_id,
        encounters.patient_id,
        encounters.organization_id,

        -- dates & timestamp
        procedures.procedure_started_at,
        procedures.procedure_ended_at,
        encounters.encounter_started_at,
        encounters.encounter_ended_at,

        -- details
        procedures.procedure_code,

        -- metrics
        timestamp_diff(timestamp(encounters.encounter_ended_at), timestamp(encounters.encounter_started_at), minute) as
        encounter_duration_minutes,
        timestamp_diff(timestamp(procedures.procedure_ended_at), timestamp(procedures.procedure_started_at), minute) as
        procedure_duration_minutes


    from encounters
    left join procedures
    on procedures.encounter_id = encounters.encounter_id

)

select * from final
