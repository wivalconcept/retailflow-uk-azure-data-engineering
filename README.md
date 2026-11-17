# RetailFlow UK | End-to-End Azure Data Engineering & Analytics

## Project Overview

RetailFlow UK is an end-to-end Azure Data Engineering and Business Intelligence project designed to transform raw retail transaction data into reliable, business-ready insights.

The project implements a **Medallion Architecture (Bronze, Silver and Gold)** using Azure Data Lake Storage Gen2 and Azure Synapse Analytics, with Power BI providing interactive sales and product performance dashboards.

The solution demonstrates practical data engineering techniques, including SQL-based data transformation, data quality validation, deduplication, dimensional modelling, and analytical reporting.

### Business Objectives

- Transform raw customer, product and sales data into structured analytical datasets.
- Identify and handle duplicate, invalid and incomplete transaction records.
- Implement data quality checks to distinguish reporting-ready transactions from records requiring further review.
- Develop reusable SQL views for business reporting.
- Build an interactive Power BI dashboard for revenue, order volume, product performance and sales channel analysis.

### Technology Stack

| Technology | Purpose |
|---|---|
| Azure Data Lake Storage Gen2 | Cloud data storage |
| Azure Synapse Analytics | Serverless SQL processing and transformations |
| SQL | Data cleaning, validation and analytical views |
| Power BI Desktop | Interactive dashboards and reporting |
| DAX | Dynamic business metrics and calculations |
| GitHub | Version control and project documentation |

### Key Project Results

- **302** raw sales records processed.
- **2** duplicate records identified and removed.
- **205** records passed core validation.
- **95** records rejected during core validation.
- **29** transactions classified as reporting-ready.
- **176** core-valid transactions flagged for further business review.
- **£7,865.75** in validated reporting-ready sales revenue.
- **68** units sold across **29** reporting-ready orders.
- **30** products in the product catalogue.

### Power BI Dashboards

**Sales Overview**
- Total Sales Revenue
- Completed Orders
- Total Units Sold
- Average Order Value
- Revenue by Sales Channel
- Revenue by Product Category
- Monthly Sales Trend

**Product Performance**
- Top Products by Revenue
- Top Products by Units Sold
- Product Performance Details
- Interactive ONLINE and STORE sales channel filtering

The project demonstrates the ability to build a cloud-based analytical solution that converts raw operational data into validated, decision-ready business information.


## Solution Architecture

RetailFlow UK implements a Medallion Architecture using Azure Data Lake Storage Gen2, Azure Synapse Analytics serverless SQL and Power BI.

### Data Processing Layers

**1. Data Sources and Storage**

The solution uses three retail datasets:

- Customers
- Products
- Orders

Source data is stored in Azure Data Lake Storage Gen2.

**2. Bronze Layer — Raw Data**

Azure Synapse serverless SQL provides access to the source datasets through reusable SQL views:

- `bronze.vw_customers_raw`
- `bronze.vw_products_raw`
- `bronze.vw_orders_raw`

The Bronze layer preserves the source data for subsequent processing and validation.

**3. Silver Layer — Data Cleaning and Quality**

The Silver layer applies SQL-based transformations and data quality rules.

Key processing activities include:

- Duplicate order detection and removal.
- Validation of essential transaction fields.
- Identification of rejected records.
- Customer and product integrity checks.
- Sales channel and order status validation.
- Classification of reporting-ready transactions.

Key SQL views include:

- `silver.vw_orders_clean`
- `silver.vw_orders_business_quality`

**4. Gold Layer — Business-Ready Analytics**

The Gold layer exposes analytical views for sales reporting and product performance.

Important reporting objects include:

- `gold.vw_sales_reporting_fact`
- `gold.dim_products`
- `gold.vw_sales_summary`
- `gold.vw_sales_by_channel`
- `gold.vw_sales_by_category`
- `gold.vw_monthly_sales`
- `gold.vw_product_performance`

The reporting fact view contains transactions classified as **Reporting Ready**, while the product dimension supplies descriptive product information.

**5. Power BI — Reporting and Visualisation**

Power BI Desktop connects to Azure Synapse serverless SQL using Import mode.

The semantic model uses a one-to-many relationship between the Product Dimension and Sales Reporting Fact table through `product_id`.

DAX measures calculate revenue, completed orders, units sold and average order value.

Two interactive dashboard pages provide insights into sales trends, sales channels, product categories and product performance.

### Architecture Flow

```text
Retail Source Data
        |
        v
Azure Data Lake Storage Gen2
        |
        v
BRONZE — Raw SQL Views
        |
        v
SILVER — Cleaning and Validation
        |
        v
GOLD — Reporting Fact and Dimensions
        |
        v
Power BI Semantic Model
        |
        v
Interactive Business Dashboards
```


## Data Cleaning, Transformation and Quality Validation

### Data Quality Strategy

RetailFlow UK implements a multi-stage data quality process using Azure Synapse serverless SQL.

The objective is to ensure that incomplete, duplicate or business-ineligible transactions do not distort sales reporting.

### Stage 1 — Duplicate Detection

The raw orders dataset contained **302 records**.

SQL-based deduplication identified and removed **2 duplicate records**, leaving **300 unique orders** for subsequent validation.

### Stage 2 — Core Data Validation

The deduplicated dataset was evaluated against essential transaction quality requirements.

The validation process produced:

| Metric | Records |
|---|---:|
| Raw Orders | 302 |
| Duplicate Records Removed | 2 |
| Orders After Deduplication | 300 |
| Core-Valid Orders | 205 |
| Rejected Orders | 95 |

The rejected records were excluded from downstream business reporting.

### Stage 3 — Business Quality Assessment

The 205 core-valid orders underwent additional business quality checks, including customer and product integrity, sales channel validity and order status.

Transactions were assigned a reporting classification:

| Reporting Status | Orders |
|---|---:|
| Reporting Ready | 29 |
| Requires Review | 176 |
| Total Core-Valid Orders | 205 |

A transaction qualifies as Reporting Ready when it meets the required business reporting conditions, including completed order status, valid sales channel and matched customer and product records.

### Stage 4 — Reporting-Ready Fact View

The Gold reporting fact view includes only transactions classified as Reporting Ready.

```sql
CREATE OR ALTER VIEW gold.vw_sales_reporting_fact
AS
SELECT *
FROM silver.vw_orders_business_quality
WHERE reporting_status = 'Reporting Ready';
```

This ensures that the Power BI dashboards use transactions that satisfy the project's reporting criteria.

### Validated Reporting Metrics

| Business Metric | Value |
|---|---:|
| Reporting-Ready Orders | 29 |
| Total Sales Revenue | £7,865.75 |
| Total Units Sold | 68 |
| Average Order Value | £271.23 |

### Business Value

This approach improves reporting reliability by separating raw transaction records from validated business data.

It also provides visibility into rejected transactions and orders requiring further investigation, supporting data quality monitoring and more dependable business decisions.
