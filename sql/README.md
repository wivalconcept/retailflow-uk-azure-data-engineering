
# RetailFlow UK — SQL Documentation

## Overview

This directory contains 20 SQL view definitions developed
using Azure Synapse Analytics Serverless SQL.

The project follows the Medallion Architecture:
Bronze, Silver and Gold.

## Bronze Layer — Raw Data (3 Views)

- vw_customers_raw.sql
- vw_products_raw.sql
- vw_orders_raw.sql

Provides access to source CSV datasets stored in
Azure Data Lake Storage Gen2.

## Silver Layer — Data Transformation (8 Views)

- vw_orders_standardized.sql
- vw_orders_deduplicated.sql
- vw_orders_price_enriched.sql
- vw_orders_validated.sql
- vw_orders_clean.sql
- vw_orders_rejected.sql
- vw_orders_integrity.sql
- vw_orders_business_quality.sql

Implements:
- Data type conversion and standardization
- Duplicate order removal
- Missing price enrichment
- Data quality validation
- Rejected order identification
- Customer and product integrity checks
- Business reporting eligibility rules

## Gold Layer — Business Analytics (9 Views)

- dim_products.sql
- vw_sales_reporting_fact.sql
- vw_sales_summary.sql
- vw_sales_by_channel.sql
- vw_channel_contribution.sql
- vw_product_performance.sql
- vw_product_performance_enriched.sql
- vw_sales_by_category.sql
- vw_monthly_sales.sql

Provides business-ready datasets for sales KPIs,
channel analysis, product performance, category
performance and monthly sales reporting.

## Data Quality Results

- Raw orders: 302
- Unique orders after deduplication: 300
- Core-valid orders: 205
- Rejected orders: 95
- Reporting Ready: 29
- Requires Review: 176

## Reporting Results

- Total Sales Revenue: GBP 7,865.75
- Completed Orders: 29
- Units Sold: 68
- Average Order Value: GBP 271.23

## Technologies

- Azure Data Lake Storage Gen2
- Azure Synapse Analytics
- Serverless SQL
- T-SQL
- Power BI

## Data Flow

ADLS Gen2
    |
    v
Bronze (Raw Data)
    |
    v
Silver (Cleaning and Validation)
    |
    v
Gold (Business Analytics)
    |
    v
Power BI Dashboards



## Physical Parquet Materialisation Using CETAS

RetailFlow UK extends its SQL-based Medallion Architecture with physical Parquet datasets stored in Azure Data Lake Storage Gen2.

### Implementation

- **Bronze:** Raw CSV files retained for traceability and reprocessing.
- **Silver:** Azure Data Factory converts raw order CSV data into Snappy-compressed Parquet. Azure Synapse Serverless SQL uses CETAS (CREATE EXTERNAL TABLE AS SELECT) to materialise core-valid and rejected order datasets.
- **Gold:** CETAS materialises the reporting-ready sales fact dataset from the existing Gold SQL view.

### Validated Outputs

| Dataset | Record Count |
|---|---:|
| Original Bronze orders | 302 |
| Unique orders | 300 |
| Core-valid Silver orders | 205 |
| Rejected Silver orders | 95 |
| Gold reporting-ready orders | 29 |

### Gold Layer Validation

- Total reporting revenue: **£7,865.75**
- Reporting-ready orders: **29**
- Total units sold: **68**

The Gold Parquet dataset was validated against the existing SQL reporting view, with matching results.

### Storage Locations

- `silver/order/orders.parquet` — Raw orders converted to Parquet
- `silver/orders_clean/` — Core-valid orders
- `silver/orders_rejected/` — Rejected orders
- `gold/sales_reporting_fact/` — Reporting-ready sales facts

### Technical Components

- Azure Data Factory Copy Data activity
- Azure Data Lake Storage Gen2
- Azure Synapse Analytics Serverless SQL
- External Data Sources
- External File Formats
- CETAS
- Parquet with Snappy compression for the ADF conversion

**Architecture note:** CETAS currently reads from the existing SQL views. The physical Parquet datasets provide materialised outputs, but the full transformation chain has not yet been changed to consume Parquet at every stage.
