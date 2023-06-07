with src_claims as (
    select * from {{ source('demo_healthcare', 'claims_view') }}
),

final as (
    select
        -- primary key
        id as claim_id,

        -- foreign keys
        organization.organizationId as organization_id,
        item[SAFE_OFFSET(0)].encounter[SAFE_OFFSET(0)].encounterId as encounter_id,
        diagnosis[SAFE_OFFSET(0)].diagnosis.reference.conditionId as condition_id,
        prescription.medicationRequestId as medication_request_id,
        patient.patientId as patient_id,
        procedure[SAFE_OFFSET(0)].procedure.reference.procedureId as procedure_id,

        -- dimensions
        status as claim_status,

        -- measures
        total.value as claim_total_value

    from src_claims
)

select * from final
