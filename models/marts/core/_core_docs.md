# Model-level descriptions

{% docs fct_hospital_events %}
A combination of the encounters and the procedures associated with it.
Not every encounter has a procedure.
{% enddocs %}


# Column-Level Descriptions

## Claims

{% docs claim_billable_period_duration_minutes %}
The billable period in minutes, the difference between timestamps of
`claim_billable_period_started_at` and `claim_billable_period_ended_at`.
{% enddocs %}

## Hospital Events

{% docs hospital_event_sk %}
Surrogate key – the unique identifier composed of `encounter_id` and `procedure_id`.
{% enddocs %}

{% docs encounter_duration_minutes %}
The duration of the encounter, calculated as the difference between encounter_started_at and encounter_ended_at.
{% enddocs %}

{% docs procedure_duration_minutes %}
The duration of the encounter, calculated as the difference between procedure_started_at and procedure_ended_at.
{% enddocs %}
