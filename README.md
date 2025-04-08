# SQL Server Data Warehouse Project – Bronze, Silver, Gold Architecture

#### This project showcases the complete design and implementation of a modern data warehouse using SQL Server. It follows a structured, layered architecture—Bronze, Silver, and Gold—to support data ingestion, transformation, and modeling for business intelligence and reporting.

#### The solution is built around best practices in data engineering, including stored procedures for ETL, consistent naming conventions, quality checks, and a final star schema for the Gold layer.

### Project Overview
Objectives:
Design a scalable and maintainable data warehouse architecture

Load and clean raw data from source systems (CRM and ERP)

Implement layer-wise ETL pipelines (Bronze → Silver → Gold)

Build business-ready views using a star schema for reporting

### Architecture Summary
#### 1.Bronze Layer:
Purpose: Stores raw data exactly as received from source systems

Implementation:

DDL scripts to create base tables

BULK INSERT statements for loading CSV files

bronze.load_bronze stored procedure automates full data loads with logging and error handling

#### 2.Silver Layer:
Purpose: Hosts cleaned, standardized, and transformed data

Implementation:

DDL scripts with metadata columns (e.g., dwh_create_date)

Data cleansing (e.g., trimming, null handling, normalization)

silver.load_silver stored procedure handles full load transformation logic

#### 3.Gold Layer:
Purpose: Provides business-consumable views modeled as a star schema

Implementation:

Views for dimension and fact tables (dim_customers, dim_products, fact_sales)

Surrogate keys, derived fields, and enriched attributes for reporting

Joins across multiple sources to deliver complete, business-friendly outputs

### Key Features
Layered design based on the Medallion Architecture (Bronze, Silver, Gold)

Reusable ETL stored procedures with performance measurement and error logging

Structured naming conventions using snake_case and table prefixes (e.g., dim_, fact_)

Data quality checks including nulls, duplicates, invalid values, and referential integrity

Well-documented DDL scripts and procedural logic using T-SQL

Modular codebase organized for clarity and reusability

### Technologies Used
Microsoft SQL Server

T-SQL (DDL, DML, Views, Stored Procedures)

SQL Server Management Studio (SSMS)

Git and GitHub for version control

