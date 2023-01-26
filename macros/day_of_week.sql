


{% macro start_date_to_day(started_at) -%}

    FORMAT_DATE('%A', DATE(started_at))

{%- endmacro %}

{% macro end_date_to_day(endeded_at) -%}

    FORMAT_DATE('%A', DATE(endeded_at))

{%- endmacro %}