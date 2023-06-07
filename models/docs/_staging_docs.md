# Model-Level Descriptions

{% docs stg_encounters %}
The hospitalized patient records
{% enddocs %}

# Column-Level Descriptions

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
{% enddocs %}
