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
