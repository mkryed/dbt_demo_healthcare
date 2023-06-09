# Model-level descriptions
{% docs fct_hospital_events %}
The fct hospital events is a combination of the encounters and
the procedures associated with it. Not every encounter has a procedure.
{% enddocs %}

# Column-Level Descriptions

## fct_hospital_events_

{% docs encounter_duration_minutes %}
The difference between the encounter_started_at and the encounter_ended_at
{% enddocs %}

{% docs procedure_duration_minutes %}
The duration of the encounter, calculated as the difference between procedure_started_at and procedure_ended_at.
{% enddocs %}
