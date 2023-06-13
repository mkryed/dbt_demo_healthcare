{% macro calculate_age(patient_birth_date, date_2 = none) %}

{% if date_2 == none %}
    date_diff(current_date(), date({{ patient_birth_date }}), year) -
    if(extract(dayofyear from date({{ patient_birth_date }})) > extract(dayofyear from current_date()), 1, 0)
{% else %}
    date_diff(date({{ date_2 }}), date({{ patient_birth_date }}), year) -
    if(extract(dayofyear from date({{ patient_birth_date }})) > extract(dayofyear from date({{ date_2 }})), 1, 0)
{% endif %}

{% endmacro %}
