-- created_at: 2026-02-09T19:47:25.770677400+00:00
-- finished_at: 2026-02-09T19:47:25.956171900+00:00
-- elapsed: 185ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c24dc3-0000-14ba-0000-00001831814d
-- desc: Get table schema
describe table "AIRBNB_ELT"."SOURCE"."HOSTS";
-- created_at: 2026-02-09T19:47:27.804290800+00:00
-- finished_at: 2026-02-09T19:47:29.404816100+00:00
-- elapsed: 1.6s
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: not available
-- desc: dbt run query
select * from (SELECT * FROM AIRBNB_ELT.source.hosts
) limit 1000;
