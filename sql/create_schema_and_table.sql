-- Create a schema to group tables used for Datastream replication
CREATE SCHEMA IF NOT EXISTS test;

-- Create the source table that will be replicated to BigQuery
CREATE TABLE IF NOT EXISTS test.example_table (
    id       SERIAL PRIMARY KEY,      -- auto-incrementing ID
    text_col VARCHAR(50),             -- sample text field
    int_col  INT,                     -- sample integer field
    date_col TIMESTAMP                -- sample timestamp field
);

-- Configure the table so that enough information is available
-- in the WAL for UPDATE/DELETE operations (needed for CDC)
ALTER TABLE test.example_table
    REPLICA IDENTITY DEFAULT;
