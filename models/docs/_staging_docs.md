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

{% docs organization_id %}
TODO
{% enddocs %}

{% docs encounters_started_at %}
The end datatime for each encounter record
{% enddocs %}

{% docs encounters_ended_at %}
The end datatime for each encounter record
{% enddocs %}

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
{% docs stg_patients %}
Staging table that defines patient details such as addresses and names.
{% enddocs %}

{% docs patient_id %}
An identifier for this patient.
{% enddocs %}

{% docs patient_gender %}
male | female | other | unknown
Binding: AdministrativeGender (Required)
{% enddocs %}

{% docs patient_birth_date %}
The date of birth for the individual
{% enddocs %}

{% docs patient_last_name %}
A last name associated with the patient
{% enddocs %}

{% docs patient_first_name %}
A first name (or given name) associated with the patient
{% enddocs %}

{% docs name_in_use %}
official or maiden
{% enddocs %}

{% docs deceased_at %}
Indicates if the individual is deceased or not and the timestamp of when it happened.
{% enddocs %}

{% docs patient_country %}
The country of residence of this patient.
{% enddocs %}

{% docs patient_state %}
The state of residence of this patient.
{% enddocs %}

{% docs patient_postal_code %}
Postal code associated with this patient.
{% enddocs %}

{% docs patient_city %}
The city of residence of this patient.
{% enddocs %}

{% docs patient_address %}
An address for the individual. Patient may have multiple addresses with different uses or applicable periods.
{% enddocs %}
