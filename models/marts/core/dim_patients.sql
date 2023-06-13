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
        min(encounter_started_at) as first_encounter_date,
        max(encounter_started_at) as last_encounter_date

    from encounters
    group by patient_id

),

conditions_summary as (

    select
        patient_id,
<<<<<<< HEAD
        condition_type as first_condition_type,
=======
        condition_type as first_condition_text,
>>>>>>> main
        min(date(condition_onset_at)) over (partition by patient_id) as first_condition_date,
        rank() over (partition by patient_id order by condition_onset_at) as rank_condition,
        count(distinct condition_code) over (partition by patient_id) as total_count_of_unique_conditions

    from conditions
    qualify rank_condition = 1

),

conditions_history as (

    select
        patient_id,
        total_count_of_unique_conditions,
        first_condition_date,
        string_agg(first_condition_type, ', ') as first_visit_condition_type,
        sum(case when rank_condition = 1 then 1 else 0 end) as total_conditions_on_first_visit

    from conditions_summary
    group by patient_id, total_count_of_unique_conditions, first_condition_date

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
        conditions_history.first_visit_condition_type,

        -- dates & timestamp
        patients.patient_birth_date,
        patients.patient_deceased_at,
        conditions_history.first_condition_date,
        encounters_summary.first_encounter_date,
        encounters_summary.last_encounter_date,

        -- metrics
        encounters_summary.total_encounters,
        conditions_history.total_count_of_unique_conditions,
        conditions_history.total_conditions_on_first_visit,
        case when patients.patient_deceased_at is null
            then {{ calculate_age('patients.patient_birth_date') }} else null
            end as age,
        {{ calculate_age('patients.patient_birth_date', 'patients.patient_deceased_at') }} as age_when_deceased

    from patients
    left join conditions_history
        on patients.patient_id = conditions_history.patient_id
    left join encounters_summary
        on patients.patient_id = encounters_summary.patient_id

)

select * from final
