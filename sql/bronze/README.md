# Bronze Layer — Raw Data

This folder contains Azure Synapse serverless SQL scripts used to access raw retail datasets stored in Azure Data Lake Storage Gen2.

The Bronze layer provides the source views for customers, products and orders.

## SQL Views

- `bronze.vw_customers_raw`
- `bronze.vw_products_raw`
- `bronze.vw_orders_raw`

These views form the foundation of the RetailFlow UK Medallion Architecture.
