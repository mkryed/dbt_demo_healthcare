with src  as (

    select * from {{ source('demo_healthcare', 'conditions_view') }}

),

renamed as (

    select
        -- primary key
        id as condition_id,

        --foreign key
        subject.patientId as patient_id,

        -- details
        code.coding[SAFE_OFFSET(0)].code as condition_code,
        code.coding[SAFE_OFFSET(0)].display as condition_display,
        code.text as condition_type,

        -- timestamps
        timestamp(onset.dateTime) as condition_onset_at,
        timestamp(abatement.dateTime) as condition_abatement_at

    from src
)

select * from renamed
