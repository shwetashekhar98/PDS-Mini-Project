DROP TABLE IF EXISTS olist_order_items_dataset_backup ;
CREATE TABLE olist_order_items_dataset_backup AS
SELECT * FROM olist_order_items_dataset;

SELECT count(*) FROM olist_order_items_dataset_backup;
SELECT count(*) FROM olist_order_items_dataset;

DROP INDEX idx_order_id ON olist_order_items_dataset;
DROP INDEX idx_product_id ON olist_order_items_dataset;


CREATE INDEX idx_order_id ON olist_order_items_dataset (order_id(50));
CREATE INDEX idx_product_id ON olist_order_items_dataset (product_id(255));

TRUNCATE TABLE olist_order_items_dataset;
SET profiling = 1;
INSERT INTO olist_order_items_dataset
SELECT * FROM olist_order_items_dataset_backup;

SHOW PROFILES; -- execution time
SHOW TABLE STATUS LIKE 'olist_order_items_dataset';-- TABLE size
SHOW INDEX FROM olist_order_items_dataset; -- INDEX

CREATE TEMPORARY TABLE query_profiles AS
SELECT QUERY_ID, DURATION
FROM INFORMATION_SCHEMA.PROFILING
WHERE QUERY_ID IS NOT NULL;
INSERT INTO query_profiles (QUERY_ID, DURATION)
SELECT QUERY_ID, SUM(DURATION) AS DURATION
FROM INFORMATION_SCHEMA.PROFILING
GROUP BY QUERY_ID;
SELECT 
    MAX(Duration) AS Max_Duration,
    MIN(Duration) AS Min_Duration,
    AVG(Duration) AS Avg_Duration
FROM query_profiles;
SELECT 
    COUNT(DISTINCT QUERY_ID) AS Specific_Query_Count
FROM INFORMATION_SCHEMA.PROFILING;
-- WHERE STATE LIKE '%INSERT INTO olist_order_items_dataset%';
SELECT * FROM olist_order_items_dataset;

--------------------------------------- WITHOUT INDEX

DROP INDEX idx_order_id ON olist_order_items_dataset;
DROP INDEX idx_product_id ON olist_order_items_dataset;

TRUNCATE TABLE olist_order_items_dataset;

SET profiling = 1;
INSERT INTO olist_order_items_dataset
SELECT * FROM olist_order_items_dataset_backup;

SHOW PROFILES; -- q3 execution time drop
SHOW TABLE STATUS LIKE 'olist_order_items_dataset';-- q3 size drop
SHOW INDEX FROM olist_order_items_dataset; -- q3 combined drop(not needed0

CREATE TEMPORARY TABLE query_profiles1 AS
SELECT QUERY_ID, DURATION
FROM INFORMATION_SCHEMA.PROFILING
WHERE QUERY_ID IS NOT NULL;

INSERT INTO query_profiles1 (QUERY_ID, DURATION)
SELECT QUERY_ID, SUM(DURATION) AS DURATION
FROM INFORMATION_SCHEMA.PROFILING
GROUP BY QUERY_ID;

SELECT 
    MAX(Duration) AS Max_Duration,
    MIN(Duration) AS Min_Duration,
    AVG(Duration) AS Avg_Duration
FROM query_profiles1;

SELECT 
    COUNT(DISTINCT QUERY_ID) AS Specific_Query_Count
FROM INFORMATION_SCHEMA.PROFILING;

SELECT * FROM olist_order_items_dataset;





