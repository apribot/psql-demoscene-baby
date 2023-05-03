create view schemafinder (type, schema, name, definition) as
SELECT 'view'::text AS type, pg views.schemaname AS schema,
pg_views.viewname AS name,
concat('CREATE OR REPLACE VIEW, pg_views.schemaname,
'.', pg.views.viewname, AS
pg_views.definition) AS definition
FROM pg_views
UNION ALL
SELECT materialized view'::text AS type,
pg matviews.schemaname AS schema,
pg matviews.matviewname AS name,
concat('CREATE MATERIALIZED VIEW, pg matviews.schemaname, '.', pg_matviews.matviewname," AS
pg matviews.definition) AS definition
FROM pg matviews
UNION ALL
SELECT 'table'::text AS type,
columns.table_schema AS schema,
columns.table_name AS name, columns.column_name AS definition
FROM information_schema.columns
UNION ALL
SELECT 'function'::text AS type,
n.nspname AS schema,
p.proname AS name,
pg_get_functiondef(p.oid) AS definition
FROM pg_proc p
LEFT JOIN pg namespace n ON n,oid = p.pronamespace
WHERE pg_function_is_visible(p,oid) AND n.nspname <> 'pg_catalog'::name;
alter table schemafinder
owner to service_user;
create view codexratio(type, schema, name, definition) as
SELECT 'view'::text AS type,
pg views.schemaname AS schema,
pg views.viewname AS name,
pg views.definition
FROM pg views
WHERE pg_views.schemaname = ANY CARRAY['master' ::name, 'blue'::name, 'dashboard' ::name])
UNION ALL
SELECT matview'::text AS type,
pg matviews.schemaname AS schema,
pg matviews.matviewname AS name,
pg matviews.definition
FROM pg matviews
WHERE pg matviews.schemaname = ANY CARRAY('master' ::name, 'blue'::name, 'dashboard' ::name])
UNION ALL
SELECT proc'::text AS type,
n.nspname AS schema, p.proname AS name,
p.prosrc AS definition
FROM pg.proc p
JOIN pg namespace n ON n.oid = p.pronamespace WHERE n.nspname = ANY CARRAY('master' ::name, 'blue'::name, 'dashboard' ::name]);
alter table codexratio
owner to service user;
