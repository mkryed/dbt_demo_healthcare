{% macro age_general(date_of_birth) %}

    DATE_DIFF(CURRENT_DATE(), date({{ date_of_birth }}), YEAR) -
    IF(EXTRACT(DAYOFYEAR FROM date({{ date_of_birth }})) > EXTRACT(DAYOFYEAR FROM CURRENT_DATE()), 1, 0)

{% endmacro %}
