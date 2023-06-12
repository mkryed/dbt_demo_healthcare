# Model-level descriptions
{% docs fct_hospital_events %}
The fct hospital events is a combination of the encounters and
the procedures associated with it. Not every encounter has a procedure.
{% enddocs %}

# Column-Level Descriptions

## fct_hospital_events_

{% docs encounter_duration_minutes %}
The duration of the encounter, calculated as the difference between encounter_started_at and encounter_ended_at.
{% enddocs %}

{% docs procedure_duration_minutes %}
The duration of the encounter, calculated as the difference between procedure_started_at and procedure_ended_at.
{% enddocs %}

## dim_patients

{% docs total_encounters %}
The total number of encounters recorded for a patient.
{% enddocs %}

{% docs first_encounter_date %}
The first encounter date of a patient.
{% enddocs %}

{% docs last_encounter_date %}
The last encounter date of a patient.
{% enddocs %}

{% docs first_condition_date %}
The date when conditions were first assigned to a patient.
{% enddocs %}

{% docs first_visit_condition_text %}
The description of the condition. If a patient has multiple conditions on their first visit,
the conditions are combined into one line (string) but separated (delimited) by a comma.
{% enddocs %}

{% docs total_count_of_unique_conditions %}
The total count of unique conditions for each patient.
{% enddocs %}

{% docs total_conditions_on_first_visit %}
The total number of conditions recorded for a patient during the first visit.
{% enddocs %}

{% docs age %}
The current age of the patients who are currently alive. Null represents patients who is no longer alive.
{% enddocs %}

{% docs age_when_deceased %}
The age at which the patients passed away. Null represents patients who are still alive.
{% enddocs %}
