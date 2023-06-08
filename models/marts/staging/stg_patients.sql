with src_patients as (

    select * from {{ source('demo_healthcare', 'patients_view') }}

),

renamed as (

    select 
        -- primary key
        id as patient_id,
        -- details
        gender as patient_gender,
        name[SAFE_OFFSET(0)].family as patient_last_name,
        name[SAFE_OFFSET(0)].given as patient_first_name,
        name[SAFE_OFFSET(0)].use as patient_name_in_use,
        address[SAFE_OFFSET(0)].country as patient_country,
        address[SAFE_OFFSET(0)].state as patient_state,
        address[SAFE_OFFSET(0)].postalCode as patient_postal_code,
        address[SAFE_OFFSET(0)].city as patient_city,
        address[SAFE_OFFSET(0)].line as patient_address,
        -- timestamps
        birthDate as patient_birth_date,
        deceased.dateTime as patient_deceased_at
    
    from src_patients
    where name[SAFE_OFFSET(0)].use = 'official'

),

final as (

    select 
        -- primary key
        patient_id,
        -- details
        patient_gender,
        REGEXP_REPLACE(patient_last_name, r'[0-9]', '') as patient_last_name,
        REGEXP_REPLACE(patient_first_name[0], r'[0-9]', '') as patient_first_name,
        patient_name_in_use,
        patient_country,
        patient_state,
        patient_postal_code,
        patient_city,
        patient_address,
        -- timestamps
        patient_birth_date,
        patient_deceased_at

    from renamed

)

select * from final
