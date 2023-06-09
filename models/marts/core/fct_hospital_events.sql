with procedures as (

    select * from {{ ref('stg_procedures') }}

),

encounters as (

    select * from {{ ref('stg_encounters') }}

),

encounters_details as (

    select
        encounter_id,
        patient_id,
        organization_id,
        encounter_started_at,
        encounter_ended_at,
        timestamp_diff(timestamp(encounter_ended_at), timestamp(encounter_started_at), minute) as
        encounter_duration_minutes


    from encounters
),

procedures_details as (
    select
        procedure_id,
        encounter_id,
        condition_id,
        patient_id,
        procedure_code,
        procedure_started_at,
        procedure_ended_at,
        timestamp_diff(timestamp(procedure_ended_at), timestamp(procedure_started_at), minute) as
        procedure_duration_minutes


    from procedures

),

final as (

    select
        -- primary key
        {{ dbt_utils.generate_surrogate_key(
            ['encounters_details.encounter_id', 'procedures_details.procedure_id']
        ) }} as hospital_sk,

        -- foreign key
        procedures_details.procedure_id,
        procedures_details.condition_id,
        encounters_details.encounter_id,
        encounters_details.patient_id,
        encounters_details.organization_id,

        -- dates & timestamp
        procedures_details.procedure_started_at,
        procedures_details.procedure_ended_at,
        encounters_details.encounter_started_at,
        encounters_details.encounter_ended_at,

        -- details
        procedures_details.procedure_code,

        -- metrics
        encounters_details.encounter_duration_minutes,
        procedures_details.procedure_duration_minutes


    from encounters_details
    left join procedures_details
    on procedures_details.encounter_id = encounters_details.encounter_id

)

select * from final
