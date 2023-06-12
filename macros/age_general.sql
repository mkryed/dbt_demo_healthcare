{% macro age_general(date_1, date_2 = none) %}

{% if date_2 == none %}
    date_diff(current_date(), date({{ date_1 }}), year) -
    if(extract(dayofyear from date({{ date_1 }})) > extract(dayofyear from current_date()), 1, 0)
{% else %}
    date_diff(date({{ date_2 }}), date({{ date_1 }}), year) -
    if(extract(dayofyear from date({{ date_1 }})) > extract(dayofyear from date({{ date_2 }})), 1, 0)
{% endif %}

{% endmacro %}
