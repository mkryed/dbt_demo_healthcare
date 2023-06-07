with src_patients as (

    select * from {{ source('demo_healthcare', 'patients_view') }}

),

final as (

    select 
        -- primary key
        id as patient_id,
        gender as patient_gender,
        birthDate as patient_birth_date,
        CONCAT('MASKED_', name[SAFE_OFFSET(0)].family) as patient_last_name,
        name[SAFE_OFFSET(0)].given as patient_first_name,
        name[SAFE_OFFSET(0)].use as name_in_use,
        deceased.dateTime as deceased_at,
        address[SAFE_OFFSET(0)].country as patient_country,
        address[SAFE_OFFSET(0)].state as patient_state,
        address[SAFE_OFFSET(0)].postalCode as patient_postal_code,
        address[SAFE_OFFSET(0)].city as patient_city,
        address[SAFE_OFFSET(0)].line as patient_address
    
    from src_patients
    where name[SAFE_OFFSET(0)].use = 'official'

)

select * from final
