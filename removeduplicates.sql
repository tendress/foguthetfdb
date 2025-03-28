--SQLite

-- Identify and remove duplicates from the securities table
-- Assuming duplicates are identified by the 'ticker' column

-- Step 1: Create a temporary table to hold unique records
CREATE TABLE temp_securities AS
SELECT * FROM securities
WHERE rowid IN (
    SELECT MIN(rowid)
    FROM securities
    GROUP BY ticker
);

-- Step 2: Delete all records from the original table
DELETE FROM securities;

-- Step 3: Insert unique records back into the original table
INSERT INTO securities
SELECT * FROM temp_securities;

-- Step 4: Drop the temporary table
DROP TABLE temp_securities;