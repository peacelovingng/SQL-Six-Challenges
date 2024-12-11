ALTER TABLE customers ADD ReferredBy INT;

-- Get the column name and data type
SELECT
    column_name, 
    data_type
-- From the system database information schema
FROM information_schema.COLUMNS 
-- For the customer table
WHERE table_name = 'customers';

ALTER TABLE customers 
RENAME COLUMN ReferredBy TO reffered_by;

ALTER TABLE customers 
RENAME COLUMN reffered_by TO referred_by;

UPDATE Customers
SET referred_by = NULL
WHERE customer_id IN (1, 4, 7, 10, 13, 16, 19, 22, 25);

UPDATE Customers
SET referred_by = 1
WHERE customer_id IN (2, 3, 5);

UPDATE Customers
SET referred_by = 2
WHERE customer_id IN (6, 8);

UPDATE Customers
SET referred_by = 3
WHERE customer_id = 9;

UPDATE Customers
SET referred_by = 4
WHERE customer_id IN (11, 12);

UPDATE Customers
SET referred_by = 5
WHERE customer_id = 14;

UPDATE Customers
SET referred_by = 6
WHERE customer_id = 15;

UPDATE Customers
SET referred_by = 7
WHERE customer_id IN (17, 18);

UPDATE Customers
SET referred_by = 8
WHERE customer_id = 20;

UPDATE Customers
SET referred_by = 9
WHERE customer_id = 21;

UPDATE Customers
SET referred_by = 10
WHERE customer_id IN (23, 24);


