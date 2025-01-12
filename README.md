# PDS Mini-Project: Comprehensive Database Design and Performance Analysis  

This repository showcases a **Programming and Data Structures (PDS) Mini-Project** completed as part of the CS-6083 course at NYU Tandon School of Engineering. It focuses on enhancing database design and optimizing query and write performance using real-world datasets. The project incorporates **Entity-Relationship (ER) modeling**, **schema normalization**, and **SQL performance tuning**.  

## Tech Stack
1. Database Systems: MySQL and PostgreSQL 
2. Programming Language: SQL
3. Tools:
    Database Management: MySQL Workbench, pgAdmin
  
    Data Import: CSV Import Wizard for MySQL, Import/Export tool for PostgreSQL
  
    Query Analysis: EXPLAIN ANALYZE for performance optimization
  
    Dataset: Brazilian E-commerce Public Dataset (Olist) from Kaggle
4.Visualization: Draw.io for ER diagram creation


## Overview  

The project is divided into three mini-project options:  
1. **Enhancing Database Design**: Focuses on improving the schema and ER diagram for a fictional application, "Welcome Home," incorporating BCNF decomposition and relationship modeling.  
2. **Query Performance Optimization**: Involves identifying and resolving bottlenecks in the execution of complex SQL queries using indexing.  
3. **Write Performance Analysis**: Explores the trade-offs between query and write performance with and without indexes during bulk data insertion.  

The repository contains problem statements, ER diagrams, SQL solutions, and a detailed project report.  



## Repository Structure  

### 1. **Entity-Relationship Diagram**  
- An ER diagram visualizes the database design for the "Welcome Home" application, showing entity relationships, attributes, and constraints.  
- Key updates include:  
  - Addition of a **Branches** entity to handle multi-location operations.  
  - Conversion of **Locations** to a weak entity set with clear discriminators and identifying relationships.  
  - Relationships like **Manages** and **LocatedAt** to track branch managers and inventory placement.  

### 2. **SQL Scripts**  
- **Option 2 (Query Optimization)**:  
  - Baseline query: Analyzes customer order history, highlighting inefficiencies like table scans and hash joins.  
  - Optimized query: Introduces composite and single-column indexes (e.g., `customer_id`, `product_id`, `order_purchase_timestamp`) to reduce execution time and rows processed.  
  - Performance improvement: Reduced execution time from **161ms** to **17.2ms** and processed rows from **3.42e+15** to just **25.5 rows**.  

- **Option 3 (Write Performance)**:  
  - Comparison of bulk insert operations with and without indexes on `olist_order_items_dataset`.  
  - Observations:  
    - **With indexes**: Slower writes due to index maintenance but improved read performance.  
    - **Without indexes**: Faster writes but at the cost of slower queries.  
  - Execution details recorded using `EXPLAIN ANALYZE`.  

### 3. **Project Report**  
- Provides a detailed explanation of the problem statements, solutions, and results.  
- Includes metrics like execution time, rows processed, and query plans before and after optimization.  
- Discusses lessons learned, such as the importance of indexing and schema normalization.  

### 4. **Dataset**  
- Uses the **Brazilian E-commerce Public Dataset** from Kaggle, containing real-world e-commerce transaction data.  
- Tables include `olist_orders_dataset`, `olist_order_items_dataset`, and `olist_customers_dataset`.  

### 5. **Additional Materials**  
- Video demonstration explaining the project workflow and results.  
- Supporting files such as backup tables and altered table schemas.



## Key Insights  

1. **ER Diagram Enhancements**  
   - Improved schema to meet BCNF requirements, reducing redundancy and ensuring integrity.  
   - Explicitly defined relationships and participation constraints for clarity.  

2. **Query Performance Optimization**  
   - Indexing significantly improves execution time and reduces resource consumption.  
   - Composite indexes optimized sorting and filtering operations in SQL queries.  

3. **Write Performance Trade-offs**  
   - Index maintenance introduces overhead for writes but accelerates reads.  
   - Use case-based indexing decisions are crucial for balancing workloads.  

4. **Lessons Learned**  
   - The critical role of **query execution plans** (`EXPLAIN ANALYZE`) in identifying bottlenecks.  
   - **Normalization** as a tool to streamline schema design while maintaining scalability.  



## How to Use  

1. **Set Up the Database**  
   - Follow the instructions in the report to import the dataset and create tables.  
   - Use the provided SQL scripts for schema creation and indexing.  

2. **Run SQL Queries**  
   - Execute baseline and optimized queries to observe performance differences.  

3. **Analyze Results**  
   - Use `EXPLAIN ANALYZE` to view execution plans and compare metrics.  

4. **Explore Design Enhancements**  
   - Review the ER diagram and schema normalization to understand the database improvements.  


