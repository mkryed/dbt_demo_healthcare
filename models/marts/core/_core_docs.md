# Model-level descriptions
{% docs fct_hospital_events %}
The fct hospital events is a combination of the encounters and
the procedures associated with it. Not every encounter has a procedure.
{% enddocs %}

# Column-Level Descriptions

## fct_hospital_events_

{% docs hospital_sk %}
A primary key of the fct_hospital_events table.
{% enddocs %}

{% docs encounter_duration_minutes %}
The difference between the encounter_started_at and the encounter_ended_at
{% enddocs %}

{% docs encounter_total_by_patient_and_organization %}
The total number of encounters by patient and organization
{% enddocs %}

{% docs procedure_duration_minutes %}
The difference between the procedure_started_at and the procedure_ended_at
{% enddocs %}

{% docs procedure_total_by_procedure_name %}
The total number of procedures by each procedure name
{% enddocs %}
