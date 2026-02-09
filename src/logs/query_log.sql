-- created_at: 2026-02-09T19:19:38.254568300+00:00
-- finished_at: 2026-02-09T19:19:38.474448500+00:00
-- elapsed: 219ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c24da7-0000-14ba-0000-000018315e11
-- desc: Get table schema
describe table "AIRBNB_ELT"."SOURCE"."BOOKINGS";
-- created_at: 2026-02-09T19:19:40.250038400+00:00
-- finished_at: 2026-02-09T19:19:41.737165400+00:00
-- elapsed: 1.5s
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: not available
-- desc: dbt run query
select * from (SELECT * FROM AIRBNB_ELT.source.bookings
) limit 1000;
