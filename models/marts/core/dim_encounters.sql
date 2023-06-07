with encounters as (
    select * from  {{ref('stg_encounters')}}
),

final as (
    select
        -- primary key
        encounters_id,

        -- foreign key
        patient_id,
        organization_id,

        -- dates & timestamps
        started_at,
        ended_at,
        timestamp_diff(timestamp(ended_at),timestamp(started_at), minute)
as encounters_duration_minutes,
        count(*) over (partition by patient_id, organization_id)
as total_encounters_by_patient_and_organization

    from encounters
)

select * from final
