-- SQL used to test Change Data Capture (CDC) with Datastream.
-- These operations should appear in BigQuery shortly after execution.

-- 1. Insert new rows
INSERT INTO test.example_table (text_col, int_col, date_col) VALUES
    ('abc', 0, '2022-10-01 00:00:00'),
    ('def', 1, NULL),
    ('ghi', -987, NOW());

-- 2. Update existing rows
UPDATE test.example_table
SET int_col = int_col * 2;

-- 3. Delete one of the rows
DELETE FROM test.example_table
WHERE text_col = 'abc';
