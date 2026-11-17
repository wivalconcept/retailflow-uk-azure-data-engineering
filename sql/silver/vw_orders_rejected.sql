
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_rejected
-- Purpose: Identify rejected orders and their rejection reasons
-- Source: silver.vw_orders_validated
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_rejected
AS
SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    sales_channel,
    order_status,
    original_unit_price,
    catalogue_price,
    final_unit_price,
    price_source,
    DataQualityStatus AS rejection_reason

FROM silver.vw_orders_validated

WHERE DataQualityStatus <> 'Valid';
