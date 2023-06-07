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
