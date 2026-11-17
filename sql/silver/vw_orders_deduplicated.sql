
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_deduplicated
-- Purpose: Remove duplicate orders by order_id
-- Source: silver.vw_orders_standardized
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_deduplicated
AS

WITH RankedOrders AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY order_id
            ORDER BY order_date DESC
        ) AS RowNum
    FROM silver.vw_orders_standardized
)

SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    sales_channel,
    order_status,
    unit_price_gbp
FROM RankedOrders
WHERE RowNum = 1;
