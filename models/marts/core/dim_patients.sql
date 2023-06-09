with patients as (

    select * from {{ ref('stg_patients') }}

),

conditions as (

    select * from {{ ref('stg_conditions') }}

),

encounters as (

    select * from {{ ref('stg_encounters') }}

),

encounters_summary as (

    select
        patient_id,
        count(*) as total_encounters,
        min(encounter_started_at) as first_encounter_date

    from encounters
    group by patient_id

),

conditions_summary as (

    select
        patient_id,
        condition_text as first_condition_text,
        min(date(condition_onset_at)) over (partition by patient_id) as first_condition_date,
        row_number() over (partition by patient_id order by condition_onset_at) as rank_condition,
        count(*) over (partition by patient_id) as total_conditions

    from conditions
    qualify rank_condition = 1

),

final as (

    select
        -- primary key
        patients.patient_id,

        -- details
        patients.patient_gender,
        patients.patient_first_name,
        patients.patient_last_name,
        patients.patient_country,
        patients.patient_state,
        patients.patient_postal_code,
        patients.patient_city,
        patients.patient_address,
        conditions_summary.first_condition_text,

        -- dates & timestamp
        patients.patient_birth_date,
        patients.patient_deceased_at,
        conditions_summary.first_condition_date,
        encounters_summary.first_encounter_date,

        -- metrics
        encounters_summary.total_encounters,
        conditions_summary.total_conditions

    from patients
    left join conditions_summary
        on patients.patient_id = conditions_summary.patient_id
    left join encounters_summary
        on patients.patient_id = encounters_summary.patient_id

)

select * from final
