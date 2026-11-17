
# RetailFlow UK — Solution Architecture

## 1. Project Overview

RetailFlow UK is an end-to-end Azure Data Engineering
and Business Intelligence project.

It demonstrates how raw retail datasets can be
transformed into validated, business-ready information
using a Medallion Architecture.

## 2. Technology Stack

- Azure Data Lake Storage Gen2
- Azure Synapse Analytics Serverless SQL
- T-SQL
- Microsoft Power BI Desktop
- GitHub

## 3. Architecture

Retail CSV Datasets
        |
        v
Azure Data Lake Storage Gen2
        |
        v
Bronze Layer
(Raw SQL Views)
        |
        v
Silver Layer
(Standardization, Deduplication,
Price Enrichment, Validation,
Referential Integrity)
        |
        v
Gold Layer
(Sales KPIs, Product Performance,
Sales Channels, Category Analytics)
        |
        v
Power BI
(Sales Overview and Product Performance)

## 4. Storage Layer

Azure Storage Account: detraining2026

ADLS Gen2 Container: retailflow

The storage layer holds source retail datasets,
including customers, products and orders.

## 5. Data Processing

Azure Synapse Analytics provides the serverless
SQL processing layer.

Workspace: synapseval29
Database: RetailFlowDB

SQL views implement transformations without
requiring a dedicated SQL pool.

## 6. Medallion Architecture

### Bronze

Provides raw data access through SQL views.

### Silver

Performs data cleaning and validation:

- Data standardization
- Duplicate removal
- Price enrichment
- Invalid transaction identification
- Customer and product integrity checks
- Reporting eligibility classification

### Gold

Provides reporting-ready analytical datasets:

- Sales reporting fact
- Product dimension
- Sales summary
- Channel performance
- Channel revenue contribution
- Product performance
- Category performance
- Monthly sales trends

## 7. Business Intelligence

Power BI Desktop connects to Azure Synapse
Serverless SQL using Import mode.

The reporting model includes a sales fact
and a product dimension, connected using
product_id.

Two dashboard pages were developed:

1. Sales Overview
2. Product Performance

## 8. Data Quality Results

Raw Orders: 302
Unique Orders: 300
Core-valid Orders: 205
Rejected Orders: 95
Reporting Ready: 29
Requires Review: 176

## 9. Business Results

Total Revenue: GBP 7,865.75
Completed Orders: 29
Units Sold: 68
Average Order Value: GBP 271.23

## 10. Architecture Benefits

- Separation of raw and transformed data
- Reusable SQL transformation logic
- Data quality and integrity validation
- Business-ready reporting datasets
- Serverless analytical processing
- Integration with Power BI
