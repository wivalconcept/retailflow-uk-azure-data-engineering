
-- =========================================================
-- Project: RetailFlow UK
-- Layer: Gold
-- View: gold.vw_product_performance
-- Purpose: Calculate product-level sales performance KPIs
-- Source: silver.vw_orders_business_quality
-- Engine: Azure Synapse Analytics Serverless SQL
-- =========================================================

CREATE VIEW gold.vw_product_performance
AS
SELECT
    o.product_id,

    COUNT(*) AS TotalOrders,

    SUM(o.quantity) AS TotalUnitsSold,

    CAST(
        SUM(o.total_amount_gbp)
        AS DECIMAL(18,2)
    ) AS TotalSalesGBP,

    CAST(
        AVG(o.total_amount_gbp)
        AS DECIMAL(18,2)
    ) AS AverageOrderValueGBP

FROM silver.vw_orders_business_quality AS o

WHERE o.reporting_status = 'Reporting Ready'
  AND o.order_status = 'COMPLETED'

GROUP BY o.product_id;
