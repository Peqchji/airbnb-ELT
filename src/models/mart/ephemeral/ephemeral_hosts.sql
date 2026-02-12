{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH ephemeral_hosts AS 
(
    SELECT 
        HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT
    FROM 
        {{ ref('obt') }}
)

SELECT * FROM ephemeral_hosts