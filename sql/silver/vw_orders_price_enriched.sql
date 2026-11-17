
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Silver
-- View: silver.vw_orders_price_enriched
-- Purpose: Enrich order prices using product catalogue data
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW silver.vw_orders_price_enriched
AS
SELECT
    o.order_id,
    o.customer_id,
    o.product_id,
    o.order_date,
    o.quantity,
    o.sales_channel,
    o.order_status,

    o.unit_price_gbp AS original_unit_price,

    TRY_CAST(p.list_price_gbp AS DECIMAL(12,2))
        AS catalogue_price,

    COALESCE(
        o.unit_price_gbp,
        TRY_CAST(p.list_price_gbp AS DECIMAL(12,2))
    ) AS final_unit_price,

    CASE
        WHEN o.unit_price_gbp IS NOT NULL
            THEN 'Original Price'

        WHEN o.unit_price_gbp IS NULL
             AND TRY_CAST(p.list_price_gbp AS DECIMAL(12,2))
                 IS NOT NULL
            THEN 'Catalogue Price'

        ELSE 'Missing Price'
    END AS price_source

FROM silver.vw_orders_deduplicated AS o

LEFT JOIN bronze.vw_products_raw AS p
    ON o.product_id = p.product_id;
