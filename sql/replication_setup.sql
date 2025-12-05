-- Configure PostgreSQL for logical replication so that Datastream
-- can capture changes (CDC).

-- 1. Create a publication that exposes changes for all tables.
-- Datastream will subscribe to this publication.
CREATE PUBLICATION test_publication FOR ALL TABLES;

-- 2. Grant replication privileges to the postgres user
-- so it can be used by Datastream to read WAL/logs.
ALTER USER postgres WITH REPLICATION;

-- 3. Create a logical replication slot that will feed changes
-- to Datastream using the pgoutput plugin.
SELECT PG_CREATE_LOGICAL_REPLICATION_SLOT('test_replication', 'pgoutput');
