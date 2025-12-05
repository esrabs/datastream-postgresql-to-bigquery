-- Insert initial sample data into the example_table.
-- These rows will be replicated by Datastream into BigQuery.

INSERT INTO test.example_table (text_col, int_col, date_col) VALUES
    ('hello',   0,   '2020-01-01 00:00:00'),
    ('goodbye', 1,   NULL),
    ('name',   -987, NOW()),
    ('other',  2786, '2021-01-01 00:00:00');
