
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_validated
-- Purpose: Validate retail orders and classify data quality
-- Source: silver.vw_orders_price_enriched
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_validated
AS
SELECT
    o.*,
    CASE
        WHEN NULLIF(TRIM(o.order_id), '') IS NULL
            THEN 'Missing Order ID'

        WHEN NULLIF(TRIM(o.customer_id), '') IS NULL
            THEN 'Missing Customer ID'

        WHEN NULLIF(TRIM(o.product_id), '') IS NULL
            THEN 'Missing Product ID'

        WHEN o.order_date IS NULL
            THEN 'Invalid Order Date'

        WHEN o.quantity IS NULL OR o.quantity <= 0
            THEN 'Invalid Quantity'

        WHEN o.final_unit_price IS NULL
            THEN 'Missing Price'

        WHEN o.final_unit_price <= 0
            THEN 'Invalid Price'

        ELSE 'Valid'
    END AS DataQualityStatus

FROM silver.vw_orders_price_enriched AS o;
