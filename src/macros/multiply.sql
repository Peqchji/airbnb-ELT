{% macro multiply(a, b, c) %}
    round( {{ a }} * {{ b }}, {{ c }} )
{% endmacro %}