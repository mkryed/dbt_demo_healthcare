with conditions as (

    select * from {{ ref('stg_conditions') }}

),

patients as (

    select * from {{ ref('stg_patients') }}

),

final as (

    select 
        -- keys
        {{ dbt_utils.generate_surrogate_key(['conditions.condition_id','conditions.patient_id']) }} as patient_conditions_key,
        conditions.condition_id,
        conditions.patient_id,
        conditions.condition_code,
        -- details
        conditions.condition_type,
        patients.patient_last_name,
        patients.patient_first_name,
        patients.patient_name_in_use,
        patients.patient_country,
        patients.patient_state,
        patients.patient_postal_code,
        patients.patient_city,
        patients.patient_address,
        -- timestamps
        patients.patient_birth_date,
        patients.patient_deceased_at,
        conditions.condition_onset_at,
        conditions.condition_abatement_at,
        {{ calculate_age('patient_birth_date', 'patient_deceased_at' ) }} as patient_age_at_death

    from conditions
    left join patients
        on conditions.patient_id = patients.patient_id

)

select * from final
