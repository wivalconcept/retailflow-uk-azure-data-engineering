
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.dim_products
-- Purpose: Provide product dimension data for analytics
-- Source: bronze.vw_products_raw
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.dim_products
AS
SELECT
    product_id,
    product_name,
    category,
    list_price_gbp
FROM bronze.vw_products_raw;
