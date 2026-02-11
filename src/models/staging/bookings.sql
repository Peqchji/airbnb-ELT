{% set inc_col = "CREATED_AT" %}

SELECT * FROM {{ source('source', 'bookings') }}
{% if is_incremental() %}
WHERE {{ inc_col }} > ( SELECT COALESCE(MAX({{ inc_col }}), '1900-01-01') FROM {{ this }} )
{% endif %}
