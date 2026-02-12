{% set congigs = [
    {
        "table" : "AIRBNB_ELT.MART.OBT",
        "columns" : "MART_obt.BOOKING_ID, MART_obt.LISTING_ID, MART_obt.HOST_ID,MART_obt.TOTAL_BOOKING_AMOUNT as TOTAL_AMOUNT, MART_obt.SERVICE_FEE, MART_obt.CLEANING_FEE, MART_obt.ACCOMMODATES, MART_obt.BEDROOMS, MART_obt.BATHROOMS, MART_obt.PRICE_PER_NIGHT, MART_obt.RESPONSE_RATE",
        "alias" : "MART_obt"
    },
    { 
        "table" : "AIRBNB_ELT.MART.DIM_LISTINGS",
        "columns" : "",
        "alias" : "DIM_listings",
        "join_condition" : "MART_obt.listing_id = DIM_listings.listing_id"
    },
    {
        "table" : "AIRBNB_ELT.MART.DIM_HOSTS",
        "columns" : "",
        "alias" : "DIM_hosts",
        "join_condition" : "MART_obt.host_id = DIM_hosts.host_id"
    }
] %}



SELECT 
    {{ congigs[0].columns }}
FROM
    {% for config in congigs %}
        {% if loop.first %}
            {{ config.table }} AS {{ config.alias }}
        {% else %}
            LEFT JOIN {{ config.table }} AS {{ config.alias }}
            ON {{ config.join_condition }}
        {% endif %}
    {% endfor %}