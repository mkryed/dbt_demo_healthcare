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
        timestamp_diff(timestamp(encounter_ended_at),timestamp(encounter_started_at), minute) as
encounter_duration_minutes,
        count(*) over (partition by patient_id, organization_id) as
encounter_total_by_patient_and_organization


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
        count(*) over (partition by procedure_code) as procedure_total,
        timestamp_diff(timestamp(procedure_ended_at), timestamp(procedure_started_at), minute) as
procedure_duration_minutes


    from procedures

),

fct_details as (

    select
        row_number() over (order by encounters_details.encounter_started_at) as hospital_sk,
        procedures_details.procedure_id as procedure_id,
        procedures_details.condition_id as condition_id,
        encounters_details.encounter_id as encounter_id,
        encounters_details.patient_id as patient_id,
        encounters_details.organization_id as organization_id,
        procedures_details.procedure_code as procedure_name,
        procedures_details.procedure_started_at as procedure_started_at,
        procedures_details.procedure_ended_at as procedure_ended_at,
        encounters_details.encounter_started_at as encounter_started_at,
        encounters_details.encounter_ended_at as encounter_ended_at,
        encounters_details.encounter_duration_minutes as encounter_duration_minutes,
        encounters_details.encounter_total_by_patient_and_organization as
encounter_total_by_patient_and_organization,
        procedures_details.procedure_duration_minutes as procedure_duration_minutes,
        procedures_details.procedure_total as procedure_total_by_procedure_name


    from encounters_details
    left join procedures_details
    on procedures_details.encounter_id = encounters_details.encounter_id

),

final as (

    select
        -- primary key
        hospital_sk,

        -- foreign key
        procedure_id,
        condition_id,
        encounter_id,
        patient_id,
        organization_id,
        procedure_name,

        -- dates & timestamps
        procedure_started_at,
        procedure_ended_at,
        encounter_started_at,
        encounter_ended_at,

        -- metrics
        encounter_duration_minutes,
        encounter_total_by_patient_and_organization,
        procedure_duration_minutes,
        procedure_total_by_procedure_name

    from fct_details

)

select * from final
