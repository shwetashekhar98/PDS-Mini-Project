

DESCRIBE olist_customers_dataset;
DESCRIBE olist_orders_dataset;


CREATE INDEX idx_customer_unique_id  ON olist_customers_dataset (customer_unique_id(50));
CREATE INDEX idx_customer_id ON olist_orders_dataset (customer_id(255));
CREATE INDEX idx_order_id ON olist_orders_dataset (order_id(50));

CREATE INDEX idx_order_id ON olist_order_items_dataset (order_id(255));
CREATE INDEX idx_product_id ON olist_products_dataset (product_id(255));
CREATE INDEX idx_customer_order_timestamp 
ON olist_orders_dataset (customer_id(255), order_purchase_timestamp DESC);







DESCRIBE olist_orders_dataset;
SELECT order_purchase_timestamp
FROM olist_orders_dataset
LIMIT 10;

-- drop table if exists olist_orders_dataset_backup;
CREATE TABLE olist_orders_dataset_backup AS
SELECT * FROM olist_orders_dataset;


ALTER TABLE olist_orders_dataset
MODIFY COLUMN order_purchase_timestamp DATETIME;

DESCRIBE olist_customers_dataset;
SELECT *
FROM olist_orders_dataset
LIMIT 10;




