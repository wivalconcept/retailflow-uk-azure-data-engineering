
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_clean
-- Purpose: Produce clean, validated retail orders
-- Source: silver.vw_orders_validated
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_clean
AS
SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    sales_channel,
    order_status,
    final_unit_price AS unit_price_gbp,

    CAST(
        quantity * final_unit_price
        AS DECIMAL(18,2)
    ) AS total_amount_gbp,

    price_source

FROM silver.vw_orders_validated

WHERE DataQualityStatus = 'Valid';
