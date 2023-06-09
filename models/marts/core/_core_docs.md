# Model-level descriptions

{% docs fct_hospital_events %}
The fct hospital events is a combination of the encounters and
the procedures associated with it. Not every encounter has a procedure.
{% enddocs %}


# Column-Level Descriptions

## Claims

{% docs claim_billable_period_duration_minutes %}
The billable period in minutes, the difference between timestamps of
`claim_billable_period_started_at` and `claim_billable_period_ended_at`.
{% enddocs %}

## Hospital Events

{% docs encounter_duration_minutes %}
The duration of the encounter, calculated as the difference between encounter_started_at and encounter_ended_at.
{% enddocs %}

{% docs procedure_duration_minutes %}
The duration of the encounter, calculated as the difference between procedure_started_at and procedure_ended_at.
{% enddocs %}
