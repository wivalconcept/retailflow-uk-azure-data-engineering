
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_integrity
-- Purpose: Validate customer and product references
-- Source: silver.vw_orders_clean
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_integrity
AS
SELECT
    o.*,

    CASE
        WHEN NOT EXISTS (
            SELECT 1
            FROM bronze.vw_customers_raw AS c
            WHERE c.customer_id = o.customer_id
        )
        THEN 'Unmatched Customer'

        WHEN NOT EXISTS (
            SELECT 1
            FROM bronze.vw_products_raw AS p
            WHERE p.product_id = o.product_id
        )
        THEN 'Unmatched Product'

        ELSE 'Matched'
    END AS integrity_status

FROM silver.vw_orders_clean AS o;
