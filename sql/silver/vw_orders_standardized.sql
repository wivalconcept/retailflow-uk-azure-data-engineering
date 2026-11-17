
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_standardized
-- Purpose: Standardize retail order fields and data types
-- Source: bronze.vw_orders_raw
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_standardized
AS
SELECT
    CAST(TRIM(order_id) AS VARCHAR(50))
        AS order_id,

    CAST(TRIM(customer_id) AS VARCHAR(50))
        AS customer_id,

    CAST(TRIM(product_id) AS VARCHAR(50))
        AS product_id,

    TRY_CAST(order_date AS DATE)
        AS order_date,

    TRY_CAST(quantity AS INT)
        AS quantity,

    CAST(
        NULLIF(UPPER(TRIM(sales_channel)), '')
        AS VARCHAR(30)
    ) AS sales_channel,

    CAST(
        NULLIF(UPPER(TRIM(order_status)), '')
        AS VARCHAR(30)
    ) AS order_status,

    TRY_CAST(unit_price_gbp AS DECIMAL(12,2))
        AS unit_price_gbp

FROM bronze.vw_orders_raw;
