{% set congigs = [
    {
        "table" : "AIRBNB_ELT.CORE.AGGREGATED_BOOKINGS",
        "columns" : "agg_bookings.*",
        "alias" : "agg_bookings"
    },
    { 
        "table" : "AIRBNB_ELT.CORE.AGGREGATED_LISTING",
        "columns" : "agg_listings.* EXCLUDE (LISTING_ID, CREATED_AT), agg_listings.CREATED_AT AS LISTING_CREATED_AT",
        "alias" : "agg_listings",
        "join_condition" : "agg_bookings.listing_id = agg_listings.listing_id"
    },
    {
        "table" : "AIRBNB_ELT.CORE.AGGREGATED_HOSTS",
        "columns" : "agg_hosts.* EXCLUDE (HOST_ID, CREATED_AT), agg_hosts.CREATED_AT AS HOST_CREATED_AT",
        "alias" : "agg_hosts",
        "join_condition" : "agg_listings.host_id = agg_hosts.host_id"
    }
] %}



SELECT 
    {% for config in congigs %}
        {{ config['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
        {% endif %}
        {% endfor %}