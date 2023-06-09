{% macro age_when_deceased(deceased_date,date_of_birth) %}

    DATE_DIFF(date({{ deceased_date }}), date({{ date_of_birth }}), YEAR) -
    IF(EXTRACT(DAYOFYEAR FROM date({{ date_of_birth }})) > EXTRACT(DAYOFYEAR FROM date({{ deceased_date }})), 1, 0)

{% endmacro %}
