ALTER TABLE customers ADD ReferredBy INT;

-- Get the column name and data type
SELECT
    column_name, 
    data_type
-- From the system database information schema
FROM information_schema.COLUMNS 
-- For the customer table
WHERE table_name = 'customers';

