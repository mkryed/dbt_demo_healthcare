# Model-Level Descriptions

{% docs stg_encounters %}
The hospitalized patient records
{% enddocs %}

# Column-Level Descriptions

## Encounters table Descriptions

{% docs encounters_id %}
Primary Key for encounters records
{% enddocs %}

{% docs encounters_patient_id %}
Foreign key that connects to patients table
{% enddocs %}

{% docs encounters_organization_id %}
Foreign key that connects to organizations table
{% enddocs %}

{% docs encounters_condition_id %}
Foreign key that connects to conditions table
{% enddocs %}

{% docs encounters_procedure_id %}
Foreign key that connects to procedures table
{% enddocs %}

{% docs encounters_start_date %}
The end datatime for each encounter record
{% enddocs %}

{% docs encounters_end_date %}
The end datatime for each encounter record
{% enddocs %}
