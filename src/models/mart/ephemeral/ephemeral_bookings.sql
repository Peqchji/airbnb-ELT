{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH empheral_bookings AS 
(
    SELECT 
        BOOKING_ID,
        BOOKING_DATE,
        BOOKING_STATUS,
        CREATED_AT
    FROM 
        {{ ref('obt') }}
)

SELECT * FROM empheral_bookings