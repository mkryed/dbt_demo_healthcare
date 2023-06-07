# Model-Level Descriptions
{% docs stg_conditions %}
A clinical condition, problem, diagnosis, or other event, situation, issue,
or clinical concept that has risen to a level of concern

source: https://www.hl7.org/fhir/condition.html
{% enddocs %}

{% docs stg_encounters %}
The hospitalized patient records
{% enddocs %}

# Column-Level Descriptions

{% docs condition_id %}
Primary key for stg_condtions.
Business identifiers assigned to this condition by the performer or other systems
which remain constant as the resource is updated and propagates from server to server
{% enddocs %}

{% docs encounters_id %}
Primary Key for encounters records
{% enddocs %}

{% docs patient_id %}
TODO
{% enddocs %}

{% docs organization_id %}
TODO
{% enddocs %}

{% docs encounters_started_at %}
The end datatime for each encounter record
{% enddocs %}

{% docs encounters_ended_at %}
The end datatime for each encounter record
{% enddocs %}

{% docs encounters_duration_minutes %}
The duration in minutes for each encounter record [Min Duration] = 15mins
{% enddocs %}

{% docs total_encounters_by_patient_and_organization %}
The number of encounter records by each patient and organization.
1 - means patients have not been re-admitted
more than 1 - means patients have been re-admitted
{% enddocs%}

{% docs condition_code %}
Identification of the condition, problem or diagnosis
{% enddocs %}

{% docs condition_display %}
Description of the condition displayed
{% enddocs %}

{% docs condition_text %}
Alternative text for condition_display
{% enddocs %}

{% docs condition_onset_at %}
Estimated or actual date or date-time the condition began, in the opinion of the clinician
{% enddocs %}

{% docs condition_abatement_at %}
The date or estimated datetime that the condition resolved or went into remission.
This is called "abatement" because of the many overloaded connotations associated with "remission" or "resolution" - 
Some conditions, such as chronic conditions, are never really resolved, but they can abate.
{% enddocs %}
